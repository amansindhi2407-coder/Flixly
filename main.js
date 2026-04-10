const navbar = document.querySelector(".flixly-nav");

window.addEventListener("scroll", () => {
  let scrollY = window.scrollY;
  let opacity = scrollY / 600;

  if (opacity > 1) opacity = 1;

  navbar.style.backgroundColor = `rgba(2, 48, 71, ${opacity})`;
});

document.addEventListener("DOMContentLoaded", () => {
  const video = document.getElementById("heroVideo");
  const poster = document.getElementById("posterOverlay");
  const muteBtn = document.getElementById("muteBtn");

  if (poster) {
    const posterImg = poster.dataset.poster;
    poster.style.backgroundImage = `url('${posterImg}')`;
    poster.style.display = "block";
    muteBtn.style.display = "none";
  }

  if (video && poster) {
    setTimeout(async () => {
      const iconEl = muteBtn ? muteBtn.querySelector("i") : null;
      try {
        video.muted = false;
        await video.play();
        poster.style.display = "none";
        muteBtn.style.display = "block";
        if (iconEl) iconEl.className = "bi bi-volume-up-fill";
      } catch (e) {
        try {
          video.muted = true;
          await video.play();
          poster.style.display = "none";
          muteBtn.style.display = "block";
          if (iconEl) iconEl.className = "bi bi-volume-mute-fill";
        } catch {
          poster.style.display = "block";
          muteBtn.style.display = "none";
        }
      }
    }, 700);
  }

  if (video && poster) {
    video.addEventListener("ended", () => {
      video.currentTime = 0;
      poster.style.display = "block";
      muteBtn.style.display = "none";
    });
  }

  if (muteBtn && video) {
    const icon = muteBtn.querySelector("i");

    muteBtn.addEventListener("click", () => {
      video.muted = !video.muted;
      icon.className = video.muted
        ? "bi bi-volume-mute-fill"
        : "bi bi-volume-up-fill";
    });
  }
  // Pause video when tab is not active
  document.addEventListener("visibilitychange", () => {
    if (video) {
      if (document.hidden) {
        video.pause();
      } else {
        video.play().catch(() => { });
      }
    }
  });
});

const video = document.getElementById("videoPlayer");

if (video) {
  const playPause = document.getElementById("playPause");
  const progress = document.getElementById("progressBar");
  const remainingTimeEl = document.getElementById("remainingTime");
  const centerIcon = document.getElementById("centerIcon");

  const back10 = document.getElementById("back10");
  const forward10 = document.getElementById("forward10");
  const seekLeft = document.getElementById("seekLeft");
  const seekRight = document.getElementById("seekRight");

  const muteBtn = document.getElementById("muteBtn");
  const volumeBar = document.getElementById("volumeBar");
  const fullscreenBtn = document.getElementById("fullscreenBtn");

  const playerWrapper = document.querySelector(".player-wrapper");

  function formatTime(seconds) {
    const h = Math.floor(seconds / 3600);
    const m = Math.floor((seconds % 3600) / 60);
    const s = Math.floor(seconds % 60);

    if (h > 0) {
      return `${h}:${m.toString().padStart(2, "0")}:${s
        .toString()
        .padStart(2, "0")}`;
    }
    return `${m}:${s.toString().padStart(2, "0")}`;
  }

  function showCenter(icon) {
    centerIcon.innerHTML = `<i class="bi ${icon}"></i>`;
    centerIcon.style.opacity = "1";

    setTimeout(() => {
      centerIcon.style.opacity = "0";
    }, 400);
  }

  function togglePlay() {
    if (video.paused) {
      video.play();
      playPause.innerHTML = `<i class="bi bi-pause-fill"></i>`;
      showCenter("bi-pause-fill");
    } else {
      video.pause();
      playPause.innerHTML = `<i class="bi bi-play-fill"></i>`;
      showCenter("bi-play-fill");
    }
  }

  playPause.addEventListener("click", togglePlay);
  video.addEventListener("click", togglePlay);

  video.addEventListener("loadedmetadata", () => {
    const start = parseFloat(video.dataset.startTime || 0);
    if (start > 0) video.currentTime = start;
  });

  let lastSave = 0;
  video.addEventListener("timeupdate", () => {
    if (!isNaN(video.duration)) {
      const percent = (video.currentTime / video.duration) * 100;
      progress.value = percent;
      progress.style.setProperty("--progress", `${percent}%`);

      const remaining = video.duration - video.currentTime;
      remainingTimeEl.textContent = formatTime(remaining);

      // Save progress every 5s
      const now = Date.now();
      if (now - lastSave > 5000) {
        lastSave = now;
        // determine item type/id from URL or data attributes
        // URL format: /watch/ID or /watch/series/ID...
        // Let's use data attributes on video element if available, else parse URL
        // Actually, let's look at URL
        const path = window.location.pathname;
        let id, type;
        if (path.includes("/watch/series/")) {
          // we need episode ID for series progress?
          // current logic in app.py uses generic item_id.
          // But wait, the watch_series routes passes `current_episode_id`.
          // We should embed this in the video tag.
          type = "series";
          id = video.dataset.episodeId || path.split("/").pop(); // failback
        } else {
          type = "movie";
          id = path.split("/").pop();
        }

        // Better: add data-id and data-type to video tag in HTML
        id = video.dataset.id;
        type = video.dataset.type; // 'movie' or 'series' (actually 'episode' for series?)

        if (id && type) {
          fetch("/api/progress/update", {
            method: "POST",
            headers: { "Content-Type": "application/json" },
            body: JSON.stringify({
              id: id,
              type: type, // 'movie' or 'series'
              time: Math.floor(video.currentTime),
              duration: Math.floor(video.duration)
            })
          });
        }
      }
    }
  });

  progress.addEventListener("input", () => {
    video.currentTime = (progress.value / 100) * video.duration;
  });

  function seek(seconds) {
    video.currentTime += seconds;

    const indicator = seconds > 0 ? seekRight : seekLeft;

    indicator.classList.remove("show");
    void indicator.offsetWidth;

    indicator.classList.add("show");
  }

  back10.addEventListener("click", () => seek(-10));
  forward10.addEventListener("click", () => seek(10));

  document.addEventListener("keydown", (e) => {
    if (e.key === "ArrowRight") seek(10);
    if (e.key === "ArrowLeft") seek(-10);

    if (e.key === " ") {
      e.preventDefault();
      togglePlay();
    }

    if (e.key.toLowerCase() === "f") {
      fullscreenBtn.click();
    }
  });

  muteBtn.addEventListener("click", () => {
    video.muted = !video.muted;

    if (video.muted || video.volume === 0) {
      muteBtn.innerHTML = `<i class="bi bi-volume-mute-fill"></i>`;
      volumeBar.value = 0;
    } else {
      muteBtn.innerHTML = `<i class="bi bi-volume-up-fill"></i>`;
      volumeBar.value = video.volume;
    }
  });

  volumeBar.addEventListener("input", () => {
    video.volume = volumeBar.value;
    video.muted = volumeBar.value == 0;

    muteBtn.innerHTML = video.muted
      ? `<i class="bi bi-volume-mute-fill"></i>`
      : `<i class="bi bi-volume-up-fill"></i>`;
  });

  fullscreenBtn.addEventListener("click", () => {
    if (!document.fullscreenElement) {
      playerWrapper.requestFullscreen();
    } else {
      document.exitFullscreen();
    }
  });

  let hideTimeout;

  function showUI() {
    playerWrapper.classList.remove("hide-ui");

    clearTimeout(hideTimeout);
    hideTimeout = setTimeout(() => {
      playerWrapper.classList.add("hide-ui");
    }, 5000);
  }

  ["mousemove", "mousedown", "touchstart", "keydown"].forEach(event => {
    playerWrapper.addEventListener(event, showUI);
  });

  video.addEventListener("play", showUI);

  video.addEventListener("pause", () => {
    playerWrapper.classList.remove("hide-ui");
  });
}

const searchInput = document.getElementById("searchInput");
const searchResults = document.getElementById("searchResults");

if (searchInput) {
  let debounceTimer;

  searchInput.addEventListener("input", () => {
    clearTimeout(debounceTimer);

    const query = searchInput.value.trim();

    if (!query) {
      searchResults.innerHTML = "";
      searchResults.style.display = "none";
      return;
    }

    debounceTimer = setTimeout(() => {
      fetch(`/search?q=${query}`)
        .then(res => res.json())
        .then(data => {
          if (data.length === 0) {
            searchResults.innerHTML = `<div class="search-item">No results</div>`;
          } else {
            searchResults.innerHTML = data.map(item => `
              <a href="${item.type === 'movie'
                ? `/watch/${item.id}`
                : `/watch/series/${item.id}`}"
                 class="search-item">
                <img src="/static/images/${item.poster_v}">
                <span>${item.title}</span>
              </a>
            `).join("");
          }

          searchResults.style.display = "block";
        });
    }, 300);
  });

  document.addEventListener("click", (e) => {
    if (!searchResults.contains(e.target) && e.target !== searchInput) {
      searchResults.style.display = "none";
    }
  });
}

// Make movie cards clickable for playback
document.addEventListener("click", (e) => {
  const card = e.target.closest(".movie-card");
  // Check if we clicked on a card, but NOT on a button or existing link
  if (card && !e.target.closest("button") && !e.target.closest("a")) {
    const playBtn = card.querySelector(".play-btn");
    // Prioritize the href from the play button if it exists
    if (playBtn && playBtn.href) {
      window.location.href = playBtn.href;
      return;
    }

    // Fallback using data attributes
    const type = card.dataset.type;
    const id = card.dataset.id;
    if (type && id) {
      window.location.href = type === 'series' ? `/watch/series/${id}` : `/watch/${id}`;
    }
  }
});


