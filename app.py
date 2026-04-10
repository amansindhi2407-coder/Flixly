from flask import Flask, render_template, request, jsonify, redirect, url_for, session
from werkzeug.security import generate_password_hash, check_password_hash

import os, mysql.connector, random

app = Flask(__name__)
app.config["SECRET_KEY"] = os.environ.get("FLIXLY_SECRET_KEY", "dev")


def get_db():
    return mysql.connector.connect(host="localhost", user="root", password="", database="flixly_db")

def query_db(query, args=(), one=False):
    conn = get_db()
    cursor = conn.cursor(dictionary=True)
    cursor.execute(query, args)
    rv = cursor.fetchall()
    cursor.close()
    conn.close()
    return (rv[0] if rv else None) if one else rv

def execute_db(query, args=()):
    conn = get_db()
    cursor = conn.cursor()
    cursor.execute(query, args)
    conn.commit()
    lid = cursor.lastrowid
    cursor.close()
    conn.close()
    return lid

def init_db():
    execute_db("""CREATE TABLE IF NOT EXISTS users (
        id INT AUTO_INCREMENT PRIMARY KEY, name VARCHAR(100) NOT NULL,
        email VARCHAR(255) NOT NULL UNIQUE, password_hash VARCHAR(255) NOT NULL,
        created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP)""")
    execute_db("""CREATE TABLE IF NOT EXISTS watchlist (
        id INT AUTO_INCREMENT PRIMARY KEY, user_id INT NOT NULL, item_id INT NOT NULL,
        item_type ENUM('movie','series') NOT NULL, created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
        UNIQUE KEY uniq_user_item (user_id, item_id, item_type))""")
    execute_db("""CREATE TABLE IF NOT EXISTS watch_progress (
        user_id INT, item_id INT, item_type ENUM('movie', 'series'),
        progress INT DEFAULT 0, duration INT DEFAULT 0,
        last_watched TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
        PRIMARY KEY (user_id, item_id, item_type))""")

init_db()

def fmt_title(series_title, ep):
    base = f"{series_title} – S{ep['season_number']}E{ep['episode_number']}"
    t = (ep.get("title") or "").strip()
    return base if t.lower().startswith(f"episode {ep['episode_number']}") or t.lower() == str(ep['episode_number']) else f"{base} – {t}"

def get_recommendations_by_offset(uid, offset):
    rec, title = [], ""
    item = query_db("""
        SELECT p.item_type, 
               CASE WHEN p.item_type='series' THEN s.id ELSE m.id END as real_id,
               COALESCE(s.title, m.title) as title, 
               COALESCE(s.genre, m.genre) as genre
        FROM watch_progress p
        LEFT JOIN movies m ON p.item_type='movie' AND m.id=p.item_id
        LEFT JOIN episodes e ON p.item_type='series' AND e.id=p.item_id
        LEFT JOIN series s ON p.item_type='series' AND s.id=e.series_id
        WHERE p.user_id = %s
        ORDER BY p.last_watched DESC LIMIT 1 OFFSET %s
    """, (uid, offset), one=True)
    
    if item and item.get('genre'):
        title = item['title']
        g_str = item['genre'].replace('|', ',')
        all_genres = [g.strip() for g in g_str.split(',') if g.strip()]
        
        if all_genres:
             import itertools
             source_genres = all_genres[:3]
             pairs = list(itertools.combinations(source_genres, 2))
             
             if not pairs:
                 g1 = source_genres[0]
                 q_filter = "genre LIKE %s"
                 params_m = [f"%{g1}%", item['real_id'] if item['item_type'] == 'movie' else 0]
                 params_s = [f"%{g1}%", item['real_id'] if item['item_type'] == 'series' else 0]
             else:
                 conditions = []
                 p_args = []
                 for g1, g2 in pairs:
                     conditions.append("(genre LIKE %s AND genre LIKE %s)")
                     p_args.extend([f"%{g1}%", f"%{g2}%"])
                 q_filter = f"({' OR '.join(conditions)})"
                 params_m = p_args + [item['real_id'] if item['item_type'] == 'movie' else 0]
                 params_s = p_args + [item['real_id'] if item['item_type'] == 'series' else 0]

             rec_m = query_db(f"SELECT *, 'movie' AS content_type FROM movies WHERE {q_filter} AND id != %s", tuple(params_m))
             rec_s = query_db(f"SELECT s.*, 'series' AS content_type, (SELECT COUNT(DISTINCT season_number) FROM episodes e WHERE e.series_id = s.id) as season_count FROM series s WHERE {q_filter} AND id != %s", tuple(params_s))
             
             rec = (rec_m or []) + (rec_s or [])
             random.shuffle(rec)
             rec = rec[:15]
    return rec, title

@app.route("/")
def home():
    uid = session.get("user_id")
    cw = []
    rec1, title1 = [], ""
    rec2, title2 = [], ""

    if uid:
        cw = query_db("""
            SELECT p.item_type AS type, p.progress, p.duration,
                   CASE WHEN p.item_type='series' THEN s.id ELSE m.id END as id,
                   CASE WHEN p.item_type='series' THEN e.id ELSE 0 END as ep_id,
                   CASE WHEN p.item_type='series' THEN e.season_number ELSE 0 END as season,
                   COALESCE(s.title, m.title) AS title,
                   COALESCE(s.poster_v, m.poster_v, '') AS poster_v,
                   COALESCE(s.poster, m.poster, '') AS poster,
                   COALESCE(s.age_rating, m.age_rating) AS age_rating,
                   COALESCE(s.genre, m.genre) AS genre,
                   m.runtime,
                   (SELECT COUNT(DISTINCT season_number) FROM episodes e2 WHERE e2.series_id = s.id) as season_count
            FROM watch_progress p
            LEFT JOIN movies m ON p.item_type='movie' AND m.id=p.item_id
            LEFT JOIN episodes e ON p.item_type='series' AND e.id=p.item_id
            LEFT JOIN series s ON p.item_type='series' AND s.id=e.series_id
            WHERE p.user_id = %s AND p.progress < (p.duration * 0.95)
            ORDER BY p.last_watched DESC LIMIT 10
        """, (uid,))
        
        # Get recommendations
        rec1, title1 = get_recommendations_by_offset(uid, 0)
        rec2, title2 = get_recommendations_by_offset(uid, 1)
    
    # Fetch all content ordered by ID DESC (Latest uploaded first)
    m = query_db("SELECT *, 'movie' AS content_type FROM movies ORDER BY id DESC")
    s = query_db("SELECT s.*, 'series' AS content_type, (SELECT COUNT(DISTINCT season_number) FROM episodes e WHERE e.series_id = s.id) as season_count FROM series s ORDER BY s.id DESC")
    
    marvel_m = query_db("SELECT *, 'movie' AS content_type FROM movies WHERE type = 'marvel'")
    marvel_s = query_db("SELECT s.*, 'series' AS content_type, (SELECT COUNT(DISTINCT season_number) FROM episodes e WHERE e.series_id = s.id) as season_count FROM series s WHERE type = 'marvel'")
    marvel = (marvel_m or []) + (marvel_s or [])
    if marvel: random.shuffle(marvel)

    horror_m = query_db("SELECT *, 'movie' AS content_type FROM movies WHERE type = 'horror'")
    horror_s = query_db("SELECT s.*, 'series' AS content_type, (SELECT COUNT(DISTINCT season_number) FROM episodes e WHERE e.series_id = s.id) as season_count FROM series s WHERE type = 'horror'")
    horror = (horror_m or []) + (horror_s or [])
    if horror: random.shuffle(horror)

    anime_m = query_db("SELECT *, 'movie' AS content_type FROM movies WHERE type = 'anime'")
    anime_s = query_db("SELECT s.*, 'series' AS content_type, (SELECT COUNT(DISTINCT season_number) FROM episodes e WHERE e.series_id = s.id) as season_count FROM series s WHERE type = 'anime'")
    anime = (anime_m or []) + (anime_s or [])
    if anime: random.shuffle(anime)
    
    # New Categories
    action = query_db("SELECT *, 'movie' AS content_type FROM movies WHERE genre LIKE '%Action%'")
    if action:
        random.shuffle(action)
        action = action[:20]

    scifi = query_db("SELECT *, 'movie' AS content_type FROM movies WHERE genre LIKE '%Sci-Fi%' OR genre LIKE '%Science Fiction%'")
    if scifi:
        random.shuffle(scifi)
        scifi = scifi[:20]
    
    # New Releases (Recently Added - Interleaved Movies & Series)
    new_releases = []
    nm, ns = m[:10], s[:10]
    for i in range(max(len(nm), len(ns))):
        if i < len(nm): new_releases.append(nm[i])
        if i < len(ns): new_releases.append(ns[i])

    # Today's Top Picks
    top_picks = (m + s)[:]
    random.shuffle(top_picks)
    top_picks = top_picks[:20]

    # High Rated (Rating >= 8.0)
    high_rated = query_db("SELECT *, 'movie' AS content_type FROM movies WHERE rating >= 8.0 ORDER BY rating DESC LIMIT 10")
    high_rated_series = query_db("SELECT s.*, 'series' AS content_type, (SELECT COUNT(DISTINCT season_number) FROM episodes e WHERE e.series_id = s.id) as season_count FROM series s WHERE rating >= 8.0 ORDER BY rating DESC LIMIT 10")

    return render_template("index.html", 
                           hero=random.choice(m + s) if m+s else None, 
                           movies=m, 
                           series=s, 
                           new_releases=new_releases,
                           top_picks=top_picks,
                           high_rated_movies=high_rated,
                           high_rated_series=high_rated_series,
                           marvel_movies=marvel,
                           horror_movies=horror,
                           anime_movies=anime,
                           action_movies=action,
                           scifi_movies=scifi,
                           continue_watching=cw,
                           recommendations=rec1,
                           watched_title=title1,
                           recommendations2=rec2,
                           watched_title2=title2)

@app.route("/movies")
def movies_page():
    uid = session.get("user_id")
    cw = []
    if uid:
        cw = query_db("""
            SELECT p.item_type AS type, p.progress, p.duration, m.id, 0 as ep_id, 0 as season, m.title, m.poster_v
            FROM watch_progress p
            JOIN movies m ON p.item_type='movie' AND m.id=p.item_id
            WHERE p.user_id = %s AND p.progress < (p.duration * 0.95)
            ORDER BY p.last_watched DESC LIMIT 10
        """, (uid,))
    
    # Base query for all movies ordered by ID (newest first)
    m = query_db("SELECT *, 'movie' AS content_type FROM movies ORDER BY id DESC")
    
    # Specific Categories
    marvel = query_db("SELECT *, 'movie' AS content_type FROM movies WHERE type = 'marvel'")
    horror = query_db("SELECT *, 'movie' AS content_type FROM movies WHERE type = 'horror'")
    anime = query_db("SELECT *, 'movie' AS content_type FROM movies WHERE type = 'anime'")
    
    # Genre-based Categories
    action = query_db("SELECT *, 'movie' AS content_type FROM movies WHERE genre LIKE '%Action%'")
    if action: random.shuffle(action); action = action[:20]
    
    scifi = query_db("SELECT *, 'movie' AS content_type FROM movies WHERE genre LIKE '%Sci-Fi%' OR genre LIKE '%Science Fiction%'")
    if scifi: random.shuffle(scifi); scifi = scifi[:20]

    # High Rated
    high_rated = query_db("SELECT *, 'movie' AS content_type FROM movies WHERE rating >= 8.0 ORDER BY rating DESC LIMIT 10")
    
    # New Releases (Top 10 from m)
    new_releases = m[:10] if m else []

    # Top Picks (Random shuffle of all movies)
    top_picks = m[:] if m else []
    random.shuffle(top_picks)
    top_picks = top_picks[:20]

    return render_template("movies.html", 
                           hero=random.choice(m) if m else None, 
                           movies=m, 
                           marvel_movies=marvel, 
                           horror_movies=horror,
                           anime_movies=anime,
                           action_movies=action,
                           scifi_movies=scifi,
                           high_rated_movies=high_rated, 
                           new_releases=new_releases,
                           top_picks=top_picks,
                           continue_watching=cw)

@app.route("/series")
def series_page():
    uid = session.get("user_id")
    cw = []
    if uid:
        cw = query_db("""
            SELECT p.item_type AS type, p.progress, p.duration, s.id, e.id as ep_id, e.season_number as season, s.title, s.poster_v
            FROM watch_progress p
            JOIN episodes e ON p.item_type='series' AND e.id=p.item_id
            JOIN series s ON s.id=e.series_id
            WHERE p.user_id = %s AND p.progress < (p.duration * 0.95)
            ORDER BY p.last_watched DESC LIMIT 10
        """, (uid,))
        
    # Helper for season count query
    base_q = "SELECT s.*, 'series' AS content_type, (SELECT COUNT(DISTINCT season_number) FROM episodes e WHERE e.series_id = s.id) as season_count FROM series s"
    
    # All Series (Newest first)
    s = query_db(f"{base_q} ORDER BY s.id DESC")
    
    # Specific Categories
    marvel = query_db(f"{base_q} WHERE type = 'marvel'")
    horror = query_db(f"{base_q} WHERE type = 'horror'")
    anime = query_db(f"{base_q} WHERE type = 'anime'")
    
    # Genre Categories
    action = query_db(f"{base_q} WHERE genre LIKE '%Action%'")
    if action: random.shuffle(action); action = action[:20]
    
    scifi = query_db(f"{base_q} WHERE genre LIKE '%Sci-Fi%' OR genre LIKE '%Science Fiction%'")
    if scifi: random.shuffle(scifi); scifi = scifi[:20]

    # High Rated
    high_rated_series = query_db(f"{base_q} WHERE rating >= 8.0 ORDER BY rating DESC LIMIT 10")
    
    # New Releases
    new_releases = s[:10] if s else []
    
    # Top Picks
    top_picks = s[:] if s else []
    random.shuffle(top_picks)
    top_picks = top_picks[:20]
    
    return render_template("series.html", 
                           hero=random.choice(s) if s else None, 
                           series=s, 
                           marvel_series=marvel,
                           horror_series=horror,
                           anime_series=anime,
                           action_series=action,
                           scifi_series=scifi,
                           high_rated_series=high_rated_series, 
                           new_releases=new_releases,
                           top_picks=top_picks,
                           continue_watching=cw)

@app.route("/categories")
def categories_page():
    m_genres = query_db("SELECT DISTINCT genre FROM movies")
    s_genres = query_db("SELECT DISTINCT genre FROM series")
    
    all_genres = set()
    for row in (m_genres or []) + (s_genres or []):
        if row['genre']:
            parts = row['genre'].replace('|', ',').split(',')
            for p in parts:
                if p.strip():
                    all_genres.add(p.strip())
    
    return render_template("categories.html", genres=sorted(list(all_genres)))

@app.route("/category/<name>")
def category_view(name):
    term = f"%{name}%"
    movies = query_db("SELECT *, 'movie' AS content_type FROM movies WHERE genre LIKE %s", (term,))
    
    base_s = "SELECT s.*, 'series' AS content_type, (SELECT COUNT(DISTINCT season_number) FROM episodes e WHERE e.series_id = s.id) as season_count FROM series s"
    series = query_db(f"{base_s} WHERE genre LIKE %s", (term,))
    
    return render_template("category_view.html", genre=name, movies=movies, series=series)

@app.route("/watch/<int:mid>")
def watch_movie(mid):
    uid, progress = session.get("user_id"), 0
    if not uid: return redirect(url_for("signin"))
    if uid:
        row = query_db("SELECT progress FROM watch_progress WHERE user_id=%s AND item_id=%s AND item_type='movie'", (uid, mid), one=True)
        if row: progress = row['progress']
    return render_template("watch.html", video=query_db("SELECT * FROM movies WHERE id = %s", (mid,), one=True), mode="movie", start_time=progress)

@app.route("/watch/series/<int:sid>")
def watch_series(sid):
    uid, progress = session.get("user_id"), 0
    if not uid: return redirect(url_for("signin"))
    season = int(request.args.get("season", 1))
    eid = request.args.get("episode")
    series = query_db("SELECT * FROM series WHERE id = %s", (sid,), one=True)
    eps = query_db("SELECT id, title, episode_number, season_number, trailer FROM episodes WHERE series_id = %s AND season_number = %s ORDER BY episode_number", (sid, season))
    
    curr = next((e for e in eps if str(e['id']) == eid), eps[0] if eps else None) if eid else (eps[0] if eps else None)
    
    if uid and curr:
        row = query_db("SELECT progress FROM watch_progress WHERE user_id=%s AND item_id=%s AND item_type='series'", (uid, curr['id']), one=True)
        if row: progress = row['progress']

    seasons = [r["season_number"] for r in query_db("SELECT DISTINCT season_number FROM episodes WHERE series_id = %s ORDER BY season_number", (sid,))]
    
    video = {"title": fmt_title(series['title'], curr) if curr else f"{series['title']} – Season {season}", "trailer": curr["trailer"] if curr else ""}
    return render_template("watch.html", video=video, mode="series", series_id=sid, episodes=eps, seasons=seasons, current_season=season, current_episode_id=curr['id'] if curr else None, start_time=progress)

@app.route("/api/series/<int:sid>/episodes")
def api_series_episodes(sid):
    return jsonify(query_db("SELECT id, title, episode_number, trailer, description, runtime FROM episodes WHERE series_id = %s AND season_number = %s ORDER BY episode_number", (sid, int(request.args.get("season", 1)))))

@app.route("/api/series/<int:sid>/seasons")
def api_series_seasons(sid):
    return jsonify([r["season_number"] for r in query_db("SELECT DISTINCT season_number FROM episodes WHERE series_id = %s ORDER BY season_number", (sid,))])

@app.route("/watchlist")
def watchlist_page():
    uid = session.get("user_id")
    if not uid: return redirect(url_for("signin"))
    items = query_db("""
        SELECT w.item_type, w.item_id, 
        COALESCE(m.title, s.title) AS title, 
        COALESCE(m.poster_v, s.poster_v) AS poster_v, 
        COALESCE(m.poster, s.poster) AS poster, 
        COALESCE(m.genre, s.genre) AS genre, 
        COALESCE(m.trailer, s.trailer) AS trailer, 
        COALESCE(m.description, s.description) AS description, 
        COALESCE(m.release_year, s.release_year) AS release_year, 
        COALESCE(m.age_rating, s.age_rating) AS age_rating,
        m.runtime, 
        (SELECT COUNT(DISTINCT season_number) FROM episodes e2 WHERE e2.series_id = s.id) as season_count
        FROM watchlist w 
        LEFT JOIN movies m ON w.item_type='movie' AND m.id = w.item_id
        LEFT JOIN series s ON w.item_type='series' AND s.id = w.item_id
        WHERE w.user_id = %s ORDER BY w.created_at DESC""", (uid,))
    return render_template("watchlist.html", items=items)

@app.route("/api/watchlist/add", methods=["POST"])
def watchlist_add():
    uid, iid, it = session.get("user_id"), request.form.get("item_id"), request.form.get("item_type")
    if not uid: return jsonify({"ok": False, "error": "auth"}), 401
    if it in ("movie", "series") and iid:
        execute_db("INSERT IGNORE INTO watchlist (user_id, item_id, item_type) VALUES (%s, %s, %s)", (uid, iid, it))
        return jsonify({"ok": True})
    return jsonify({"ok": False}), 400

@app.route("/api/watchlist/remove", methods=["POST"])
def watchlist_remove():
    uid, iid, it = session.get("user_id"), request.form.get("item_id"), request.form.get("item_type")
    if not uid: return jsonify({"ok": False, "error": "auth"}), 401
    execute_db("DELETE FROM watchlist WHERE user_id = %s AND item_id = %s AND item_type = %s", (uid, iid, it))
    return jsonify({"ok": True})

@app.route("/api/progress/update", methods=["POST"])
def update_progress():
    uid = session.get("user_id")
    if not uid: return jsonify({"ok": False}), 401
    d = request.json
    execute_db("""INSERT INTO watch_progress (user_id, item_id, item_type, progress, duration)
                  VALUES (%s, %s, %s, %s, %s)
                  ON DUPLICATE KEY UPDATE progress=%s, duration=%s, last_watched=NOW()""",
               (uid, d['id'], d['type'], d['time'], d['duration'], d['time'], d['duration']))
    return jsonify({"ok": True})

@app.route("/api/watchlist/status")
def watchlist_status():
    uid, iid, it = session.get("user_id"), request.args.get("item_id"), request.args.get("item_type")
    return jsonify({"exists": bool(query_db("SELECT 1 FROM watchlist WHERE user_id=%s AND item_id=%s AND item_type=%s", (uid, iid, it), one=True))}) if uid and iid and it in ("movie", "series") else jsonify({"exists": False})

@app.route("/api/movies/<int:mid>")
def api_movie_detail(mid):
    return jsonify(query_db("SELECT id, title, genre, description, runtime, release_year, age_rating, trailer, poster, poster_v FROM movies WHERE id = %s", (mid,), one=True) or {})

@app.route("/api/series/<int:sid>")
def api_series_detail(sid):
    return jsonify(query_db("SELECT id, title, genre, description, release_year, age_rating, poster, poster_v FROM series WHERE id = %s", (sid,), one=True) or {})

@app.route("/search")
def search():
    q = request.args.get("q", "").strip()
    if not q: return jsonify([])
    m = query_db("SELECT id, title, poster_v, 'movie' AS type FROM movies WHERE title LIKE %s LIMIT 5", (f"%{q}%",))
    s = query_db("SELECT id, title, poster_v, 'series' AS type FROM series WHERE title LIKE %s LIMIT 5", (f"%{q}%",))
    return jsonify(m + s)

@app.route("/signup", methods=["GET", "POST"])
def signup():
    error = None
    if request.method == "POST":
        name, email, pwd = request.form.get("name"), request.form.get("email", "").lower(), request.form.get("password")
        if not all([name, email, pwd]): error = "All fields are required."
        elif query_db("SELECT id FROM users WHERE email = %s", (email,), one=True): error = "Email already registered."
        else:
            uid = execute_db("INSERT INTO users (name, email, password_hash) VALUES (%s, %s, %s)", (name, email, generate_password_hash(pwd)))
            session["user_id"], session["user_name"] = uid, name
            return redirect(url_for("home"))
    return render_template("signup.html", error=error)

@app.route("/signin", methods=["GET", "POST"])
def signin():
    error = None
    if request.method == "POST":
        email, pwd = request.form.get("email", "").lower(), request.form.get("password")
        u = query_db("SELECT id, name, password_hash FROM users WHERE email = %s", (email,), one=True)
        if not u: error = "Account not found."
        elif not check_password_hash(u["password_hash"], pwd): error = "Incorrect password."
        else:
            session["user_id"], session["user_name"] = u["id"], u["name"]
            return redirect(url_for("home"))
    return render_template("signin.html", error=error)

@app.route("/logout")
def logout():
    session.clear()
    return redirect(url_for("home"))



if __name__ == "__main__":
    app.run(debug=True)
