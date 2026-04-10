-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 30, 2026 at 04:22 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `flixly_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `episodes`
--

CREATE TABLE `episodes` (
  `id` int(11) NOT NULL,
  `series_id` int(11) DEFAULT NULL,
  `season_number` int(11) DEFAULT NULL,
  `episode_number` int(11) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `runtime` varchar(20) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `trailer` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `episodes`
--

INSERT INTO `episodes` (`id`, `series_id`, `season_number`, `episode_number`, `title`, `runtime`, `description`, `trailer`) VALUES
(1, 1, 1, 1, 'The Vanishing of Will Byers', '47 min', 'A young boy mysteriously disappears, and his friends encounter a strange girl with supernatural powers.', 'st_s1_trailer.mp4'),
(2, 1, 1, 2, 'The Weirdo on Maple Street', '55 min', 'Lucas, Mike and Dustin try to talk to the mysterious girl they found in the woods.', 'st_s1_trailer.mp4'),
(3, 1, 1, 3, 'Holly, Jolly', '51 min', 'An increasingly concerned Nancy looks for Barb and finds out what Jonathan has been up to.', 'st_s1_trailer.mp4'),
(4, 1, 1, 4, 'The Body', '49 min', 'Refusing to believe Will is dead, Joyce tries to communicate with her son.', 'st_s1_trailer.mp4'),
(5, 1, 1, 5, 'The Flea and the Acrobat', '53 min', 'Hopper breaks into the lab while Nancy and Jonathan confront the monster.', 'st_s1_trailer.mp4'),
(6, 1, 1, 6, 'The Monster', '46 min', 'A frantic Jonathan looks for Nancy in the darkness while Hopper searches for Will.', 'st_s1_trailer.mp4'),
(7, 1, 1, 7, 'The Bathtub', '42 min', 'The group tries to travel to the Upside Down to rescue Will.', 'st_s1_trailer.mp4'),
(8, 1, 1, 8, 'The Upside Down', '55 min', 'Joyce and Hopper are taken into the Upside Down while the kids face the monster.', 'st_s1_trailer.mp4'),
(9, 1, 2, 1, 'MADMAX', '48 min', 'As the town preps for Halloween, a high-scoring arcade game captures Dustins attention.', 'st_s2_trailer.mp4'),
(10, 1, 2, 2, 'Trick or Treat, Freak', '56 min', 'After Will sees something terrible on trick-or-treat night, Mike wonders whether Eleven is still out there.', 'st_s2_trailer.mp4'),
(11, 1, 2, 3, 'The Pollywog', '51 min', 'Dustin adopts a strange new pet, and Eleven grows increasingly impatient.', 'st_s2_trailer.mp4'),
(12, 1, 2, 4, 'Will the Wise', '46 min', 'Will’s connection to the Upside Down deepens, and Bob encourages Joyce to confront her fears.', 'st_s2_trailer.mp4'),
(13, 1, 2, 5, 'Dig Dug', '58 min', 'Nancy and Jonathan investigate a suspicious lab, while Eleven searches for her past.', 'st_s2_trailer.mp4'),
(14, 1, 2, 6, 'The Spy', '51 min', 'Will’s visions intensify, and the group suspects a traitor among them.', 'st_s2_trailer.mp4'),
(15, 1, 2, 7, 'The Lost Sister', '45 min', 'Eleven meets others like her and discovers a darker path.', 'st_s2_trailer.mp4'),
(16, 1, 2, 8, 'The Mind Flayer', '48 min', 'The group splits up to face the growing threat from the Upside Down.', 'st_s2_trailer.mp4'),
(17, 1, 2, 9, 'The Gate', '62 min', 'Eleven closes the gate to the Upside Down as the town fights for survival.', 'st_s2_trailer.mp4'),
(18, 1, 3, 1, 'Suzie, Do You Copy?', '51 min', 'Summer brings new jobs and budding romance. But a radio signal hints at danger.', 'st_s3_trailer.mp4'),
(19, 1, 3, 2, 'The Mall Rats', '50 min', 'Nancy and Jonathan follow a lead, while Steve and Robin uncover secrets at the mall.', 'st_s3_trailer.mp4'),
(20, 1, 3, 3, 'The Case of the Missing Lifeguard', '49 min', 'The gang investigates a troubling disappearance tied to the Upside Down.', 'st_s3_trailer.mp4'),
(21, 1, 3, 4, 'The Sauna Test', '53 min', 'A risky experiment forces the group to confront a horrifying truth.', 'st_s3_trailer.mp4'),
(22, 1, 3, 5, 'The Flayed', '50 min', 'The Mind Flayer builds strength as the town falls into chaos.', 'st_s3_trailer.mp4'),
(23, 1, 3, 6, 'E Pluribus Unum', '59 min', 'Dr. Alexei reveals the truth behind a secret Russian operation.', 'st_s3_trailer.mp4'),
(24, 1, 3, 7, 'The Bite', '54 min', 'With time running out, the group faces the Mind Flayer head-on.', 'st_s3_trailer.mp4'),
(25, 1, 3, 8, 'The Battle of Starcourt', '77 min', 'The battle for Hawkins reaches its explosive conclusion.', 'st_s3_trailer.mp4'),
(26, 1, 4, 1, 'The Hellfire Club', '78 min', 'Darkness returns to Hawkins just in time for spring break.', 'st_s4_trailer.mp4'),
(27, 1, 4, 2, 'Vecna’s Curse', '77 min', 'A shocking murder brings new horror and a mysterious supernatural threat.', 'st_s4_trailer.mp4'),
(28, 1, 4, 3, 'The Monster and the Superhero', '63 min', 'Murray and Joyce fly to Alaska, and Dustin searches for Eddie.', 'st_s4_trailer.mp4'),
(29, 1, 4, 4, 'Dear Billy', '78 min', 'Max is forced to confront the darkest secrets of her past.', 'st_s4_trailer.mp4'),
(30, 1, 4, 5, 'The Nina Project', '75 min', 'Owens takes Eleven to a secret location to recover her powers.', 'st_s4_trailer.mp4'),
(31, 1, 4, 6, 'The Dive', '75 min', 'Behind the Iron Curtain, a risky rescue mission gets underway.', 'st_s4_trailer.mp4'),
(32, 1, 4, 7, 'The Massacre at Hawkins Lab', '98 min', 'Secrets from Eleven’s past come to light.', 'st_s4_trailer.mp4'),
(33, 1, 4, 8, 'Papa', '85 min', 'Hawkins is rocked by Vecna’s curse as time runs out.', 'st_s4_trailer.mp4'),
(34, 1, 4, 9, 'The Piggyback', '142 min', 'With the world on the brink, the group launches a final attack.', 'st_s4_trailer.mp4'),
(35, 1, 5, 1, 'The Crawl', '71 min', 'Hawkins reels from the aftermath as old wounds resurface and an unseen danger begins to move again.', 'st_s5_trailer.mp4'),
(36, 1, 5, 2, 'The Vanishing of Holly Wheeler', '57 min', 'When someone disappears without a trace, the group uncovers signs that the Upside Down is evolving.', 'st_s5_trailer.mp4'),
(37, 1, 5, 3, 'The Turnbow Trap', '69 min', 'A desperate plan is set as the team risks everything to draw out a powerful enemy.', 'st_s5_trailer.mp4'),
(38, 1, 5, 4, 'Sorcerer', '86 min', 'As darkness spreads, new revelations challenge what the group thought they knew.', 'st_s5_trailer.mp4'),
(39, 1, 5, 5, 'Shock Jock', '68 min', 'Panic erupts across Hawkins when fear takes hold in unexpected ways.', 'st_s5_trailer.mp4'),
(40, 1, 5, 6, 'Escape From Camazotz', '75 min', 'Trapped far from home, the group races against time to survive hostile territory.', 'st_s5_trailer.mp4'),
(41, 1, 5, 7, 'The Bridge', '66 min', 'With both worlds on the brink, a final connection emerges that could change everything.', 'st_s5_trailer.mp4'),
(42, 1, 5, 8, 'The Rightside Up', '128 min', 'The journey reaches its end as Hawkins fate is decided once and for all.', 'st_s5_trailer.mp4'),
(43, 2, 1, 1, 'Episode 1', '48 min', 'A criminal mastermind known as the Professor recruits eight robbers for an ambitious plan.', 'mh_s1_trailer.mp4'),
(44, 2, 1, 2, 'Episode 2', '42 min', 'Hostages are taken inside the Mint as tensions rise and the police begin their investigation.', 'mh_s1_trailer.mp4'),
(45, 2, 1, 3, 'Episode 3', '52 min', 'The robbers face internal conflicts while the Professor stays one step ahead of the authorities.', 'mh_s1_trailer.mp4'),
(46, 2, 1, 4, 'Episode 4', '50 min', 'A sudden mistake threatens the entire operation, forcing quick decisions.', 'mh_s1_trailer.mp4'),
(47, 2, 1, 5, 'Episode 5', '44 min', 'Pressure mounts as negotiations intensify and trust begins to crack.', 'mh_s1_trailer.mp4'),
(48, 2, 1, 6, 'Episode 6', '48 min', 'The Professor risks exposure as the plan encounters unexpected resistance.', 'mh_s1_trailer.mp4'),
(49, 2, 1, 7, 'Episode 7', '49 min', 'Emotions run high inside the Mint, putting the mission in danger.', 'mh_s1_trailer.mp4'),
(50, 2, 1, 8, 'Episode 8', '55 min', 'A bold move changes the course of the heist as the first phase nears its end.', 'mh_s1_trailer.mp4'),
(51, 2, 1, 9, 'Episode 9', '52 min', 'The robbers execute a risky strategy while the police close in.', 'mh_s1_trailer.mp4'),
(52, 2, 1, 10, 'Episode 10', '57 min', 'The heist reaches a turning point with consequences for everyone involved.', 'mh_s1_trailer.mp4'),
(53, 2, 1, 11, 'Episode 11', '51 min', 'Secrets unravel as loyalties are tested under extreme pressure.', 'mh_s1_trailer.mp4'),
(54, 2, 1, 12, 'Episode 12', '54 min', 'The Professor’s plan faces its biggest challenge yet.', 'mh_s1_trailer.mp4'),
(55, 2, 1, 13, 'Episode 13', '49 min', 'The final moments of the operation bring irreversible decisions.', 'mh_s1_trailer.mp4'),
(56, 2, 2, 1, 'Episode 1', '45 min', 'The heist enters a critical stage as police pressure increases.', 'mh_s2_trailer.mp4'),
(57, 2, 2, 2, 'Episode 2', '44 min', 'Tensions rise inside the Mint as trust begins to crack.', 'mh_s2_trailer.mp4'),
(58, 2, 2, 3, 'Episode 3', '46 min', 'A sudden mistake threatens to expose the plan.', 'mh_s2_trailer.mp4'),
(59, 2, 2, 4, 'Episode 4', '48 min', 'Negotiations spiral out of control under mounting pressure.', 'mh_s2_trailer.mp4'),
(60, 2, 2, 5, 'Episode 5', '47 min', 'The Professor is forced to improvise to stay ahead.', 'mh_s2_trailer.mp4'),
(61, 2, 2, 6, 'Episode 6', '50 min', 'A risky decision changes the balance of the heist.', 'mh_s2_trailer.mp4'),
(62, 2, 2, 7, 'Episode 7', '49 min', 'Emotions inside the Mint threaten the operation.', 'mh_s2_trailer.mp4'),
(63, 2, 2, 8, 'Episode 8', '52 min', 'Police tighten the net as the plan reaches its limit.', 'mh_s2_trailer.mp4'),
(64, 2, 2, 9, 'Episode 9', '55 min', 'The first heist comes to a dramatic conclusion.', 'mh_s2_trailer.mp4'),
(65, 2, 3, 1, 'Episode 1', '49 min', 'The Professor reunites the team for a new mission.', 'mh_s3_trailer.mp4'),
(66, 2, 3, 2, 'Episode 2', '50 min', 'A new target brings new risks and rules.', 'mh_s3_trailer.mp4'),
(67, 2, 3, 3, 'Episode 3', '51 min', 'Unexpected resistance threatens the plan.', 'mh_s3_trailer.mp4'),
(68, 2, 3, 4, 'Episode 4', '48 min', 'Chaos grows as the operation unfolds.', 'mh_s3_trailer.mp4'),
(69, 2, 3, 5, 'Episode 5', '53 min', 'A dangerous mistake forces quick action.', 'mh_s3_trailer.mp4'),
(70, 2, 3, 6, 'Episode 6', '50 min', 'Loyalties are tested under pressure.', 'mh_s3_trailer.mp4'),
(71, 2, 3, 7, 'Episode 7', '52 min', 'The conflict escalates globally.', 'mh_s3_trailer.mp4'),
(72, 2, 3, 8, 'Episode 8', '60 min', 'The heist reaches a turning point.', 'mh_s3_trailer.mp4'),
(73, 2, 4, 1, 'Episode 1', '53 min', 'The gang struggles to survive as control slips away.', 'mh_s4_trailer.mp4'),
(74, 2, 4, 2, 'Episode 2', '50 min', 'The Professor faces intense pressure.', 'mh_s4_trailer.mp4'),
(75, 2, 4, 3, 'Episode 3', '51 min', 'A shocking event changes everything.', 'mh_s4_trailer.mp4'),
(76, 2, 4, 4, 'Episode 4', '48 min', 'Risky choices lead to lasting consequences.', 'mh_s4_trailer.mp4'),
(77, 2, 4, 5, 'Episode 5', '52 min', 'Allies and enemies blur together.', 'mh_s4_trailer.mp4'),
(78, 2, 4, 6, 'Episode 6', '54 min', 'A final attempt to regain control begins.', 'mh_s4_trailer.mp4'),
(79, 2, 4, 7, 'Episode 7', '50 min', 'Time runs out for everyone involved.', 'mh_s4_trailer.mp4'),
(80, 2, 4, 8, 'Episode 8', '61 min', 'The season ends with a powerful clash.', 'mh_s4_trailer.mp4'),
(81, 2, 5, 1, 'Episode 1', '55 min', 'With no escape left, survival becomes the priority.', 'mh_s5_trailer.mp4'),
(82, 2, 5, 2, 'Episode 2', '53 min', 'The Professor faces his greatest challenge yet.', 'mh_s5_trailer.mp4'),
(83, 2, 5, 3, 'Episode 3', '52 min', 'Old wounds reopen under pressure.', 'mh_s5_trailer.mp4'),
(84, 2, 5, 4, 'Episode 4', '56 min', 'A bold strategy offers a slim chance of hope.', 'mh_s5_trailer.mp4'),
(85, 2, 5, 5, 'Episode 5', '54 min', 'Sacrifice becomes unavoidable.', 'mh_s5_trailer.mp4'),
(86, 2, 5, 6, 'Episode 6', '57 min', 'The plan enters its final stage.', 'mh_s5_trailer.mp4'),
(87, 2, 5, 7, 'Episode 7', '60 min', 'Emotions peak as the end approaches.', 'mh_s5_trailer.mp4'),
(88, 2, 5, 8, 'Episode 8', '62 min', 'The truth behind the heist is revealed.', 'mh_s5_trailer.mp4'),
(89, 2, 5, 9, 'Episode 9', '65 min', 'Freedom comes at a heavy cost.', 'mh_s5_trailer.mp4'),
(90, 2, 5, 10, 'Episode 10', '70 min', 'The story reaches its definitive conclusion.', 'mh_s5_trailer.mp4'),
(91, 3, 1, 1, 'Red Light, Green Light', '60 min', 'Seong Gi-hun and hundreds of others accept an invitation to compete in deadly games.', 'squid_s1.mp4'),
(92, 3, 1, 2, 'Hell', '63 min', 'Split on whether to continue or quit, the group faces life-changing consequences.', 'squid_s1.mp4'),
(93, 3, 1, 3, 'The Man with the Umbrella', '55 min', 'A new game challenges the players’ teamwork and trust.', 'squid_s1.mp4'),
(94, 3, 1, 4, 'Stick to the Team', '56 min', 'Players form alliances as the competition becomes more brutal.', 'squid_s1.mp4'),
(95, 3, 1, 5, 'A Fair World', '53 min', 'Behind the scenes, the masked men face moral dilemmas.', 'squid_s1.mp4'),
(96, 3, 1, 6, 'Gganbu', '97', 'Old friendships are tested during a deeply emotional game.', 'squid_s1_e6.mp4'),
(97, 3, 1, 7, 'VIPS', '98', 'Powerful guests arrive to observe the games firsthand.', 'squid_s1.mp4'),
(99, 3, 1, 8, 'Front Man', '52 min', 'Secrets behind the organization are finally revealed.', 'squid_s1.mp4'),
(100, 3, 1, 9, 'One Lucky Day', '56 min', 'The final game determines the ultimate winner.', 'squid_s1.mp4'),
(101, 3, 2, 1, 'Bread and Lottery', '58 min', 'Gi-hun attempts to track down the people behind the games, while new players are quietly recruited.', 'squid_s2.mp4'),
(102, 3, 2, 2, 'Halloween Party', '61 min', 'A lavish but disturbing celebration reveals how deeply the elite are involved in the deadly competition.', 'squid_s2.mp4'),
(103, 3, 2, 3, '001', '55 min', 'A familiar number returns, raising questions about who can truly be trusted inside the games.', 'squid_s2.mp4'),
(104, 3, 2, 4, 'Six Legs', '59 min', 'A physically demanding challenge forces players to rely on teamwork and balance to survive.', 'squid_s2.mp4'),
(105, 3, 2, 5, 'One More Game', '60 min', 'With tensions at their peak, the players must decide whether to risk everything for another round.', 'squid_s2.mp4'),
(106, 3, 2, 6, 'O X', '57 min', 'A cruel choice splits the remaining players, testing their morality and desperation.', 'squid_s2.mp4'),
(107, 3, 2, 7, 'Friend or Foe', '65 min', 'Alliances crumble as the games move closer to their brutal conclusion.', 'squid_s2.mp4'),
(108, 3, 3, 1, 'Keys and Knives', '59 min', 'The games return in a new form as players face challenges that demand both strategy and violence.', 'squid_s3.mp4'),
(109, 3, 3, 2, 'The Starry Night', '60 min', 'Under a calm exterior, a psychologically intense game pushes contestants to their breaking point.', 'squid_s3.mp4'),
(110, 3, 3, 3, 'It’s Not Your Fault', '58 min', 'Past trauma resurfaces as players are forced to confront the consequences of their choices.', 'squid_s3.mp4'),
(111, 3, 3, 4, '222', '61 min', 'A symbolic number plays a key role in a game where chance and fate collide.', 'squid_s3.mp4'),
(112, 3, 3, 5, '⭘△☐', '56 min', 'The meaning behind the iconic symbols is revealed through a deadly final challenge.', 'squid_s3.mp4'),
(113, 3, 3, 6, 'Humans Are…', '67 min', 'The season reaches its conclusion as the true nature of humanity is put to the ultimate test.', 'squid_s3.mp4'),
(114, 4, 1, 1, 'Romance Dawn', '49 min', 'A rubber-powered young man sets out to sea, determined to become the King of the Pirates.', 'onepiece_s1.mp4'),
(115, 4, 1, 2, 'The Man in the Straw Hat', '56 min', 'Luffy crosses paths with dangerous pirates while proving he has what it takes to lead a crew.', 'onepiece_s1.mp4'),
(116, 4, 1, 3, 'Tell No Tales', '54 min', 'The crew infiltrates a corrupt marine base, uncovering secrets that could change their journey.', 'onepiece_s1.mp4'),
(117, 4, 1, 4, 'The Pirates Are Coming', '60 min', 'A notorious pirate threatens a village, forcing Luffy and his allies into their first real battle.', 'onepiece_s1.mp4'),
(118, 4, 1, 5, 'Eat at Baratie!', '58 min', 'The crew visits a floating restaurant where new friendships — and rivalries — are formed.', 'onepiece_s1.mp4'),
(119, 4, 1, 6, 'The Chef and the Chore Boy', '55 min', 'A skilled chef with a troubled past faces a life-changing decision.', 'onepiece_s1.mp4'),
(120, 4, 1, 7, 'The Girl with the Sawfish Tattoo', '59 min', 'Nami’s hidden past comes to light, revealing her true motivations.', 'onepiece_s1.mp4'),
(121, 4, 1, 8, 'Worst in the East', '61 min', 'As powerful enemies close in, Luffy declares his ambition to the world.', 'onepiece_s1.mp4'),
(122, 5, 1, 1, 'Glorious Purpose', '52 min', 'Loki, the God of Mischief, finds himself out of time and in an unusual place and forced - against his godly disposition - to cooperate with others.', 'loki_s1.mp4'),
(123, 5, 1, 2, 'The Variant', '54 min', 'Mobius puts Loki to work, but not everyone at TVA is thrilled about the God of Mischiefs presence.', 'loki_s1.mp4'),
(124, 5, 1, 3, 'Lamentis', '51 min', 'Loki finds out The Variants plan, but he has his own that will forever alter both their destinies.', 'loki_s1.mp4'),
(125, 5, 1, 4, 'The Nexus Event', '53 min', 'Frayed nerves and paranoia infiltrate the TVA as Mobius and Hunter B-15 search for Loki and Sylvie.', 'loki_s1.mp4'),
(126, 5, 1, 5, 'Journey Into Mystery', '52 min', 'Loki tries to escape The Void, a desolate purgatory where he meets variant versions of himself.', 'loki_s1.mp4'),
(127, 5, 1, 6, 'For All Time. Always.', '54 min', 'The clock is ticking in the season finale which finds Loki and Sylvie on a date with destiny.', 'loki_s1.mp4'),
(128, 5, 2, 1, 'Ouroboros', '51 min', 'Loki finds himself lost to time and torn, quite literally, between past, present and future.', 'loki.mp4'),
(129, 5, 2, 2, 'Breaking Brad', '49 min', 'With the TVA on the verge of a temporal meltdown, Loki and Mobius will stop at nothing to find Sylvie.', 'loki.mp4'),
(130, 5, 2, 3, '1893', '52 min', 'Loki and Mobius go on the hunt for everyones favorite cartoon clock as they try to save the TVA.', 'loki.mp4'),
(131, 5, 2, 4, 'Heart of the TVA', '50 min', 'The TVAs Loom nears catastrophic failure, but Loki, Mobius and Sylvie have a He Who Remains variant.', 'loki.mp4'),
(132, 5, 2, 5, 'Science/Fiction', '56 min', 'Loki traverses dying timelines in an attempt to find his friends, but Reality is not what it seems.', 'loki.mp4'),
(133, 5, 2, 6, 'Glorious Purpose', '59 min', 'Loki learns the true nature of glorious purpose as he rectifies the past.', 'loki.mp4'),
(134, 6, 1, 1, 'Rebirth', '23m', 'Brilliant but bored high school student Light Yagami discovers a Shinigami\'s notebook and plans to use it to create a better world.', 'death_note_s1.mp4'),
(135, 6, 1, 2, 'Confrontation', '23m', 'The series of mysterious deaths catches the attention of world-renowned detective L, who confronts the killer on live television.', 'death_note_s1.mp4'),
(136, 6, 1, 3, 'Dealings', '23m', 'As the Task Force and L\'s investigation deepens, Ryuk tells Light that someone is shadowing them. Light needs the man\'s name, and Ryuk makes an offer.', 'death_note_s1.mp4'),
(137, 6, 1, 4, 'Pursuit', '23m', 'While formulating a plan to get the name of the man following him, Light tests the limits of the Death Note.', 'death_note_s1.mp4'),
(138, 6, 1, 5, 'Tactics', '23m', 'Soichiro confronts L about the FBI agents investigating the police, and Light makes a move against the FBI.', 'death_note_s1.mp4'),
(139, 6, 1, 6, 'Unraveling', '23m', 'Light runs into a woman at the police department who has information for L that could lead to Light\'s capture.', 'death_note_s1.mp4'),
(140, 6, 1, 7, 'Overcast', '23m', 'Light uses the Death Note to try to get rid of the woman who could get him captured and is shocked when it doesn\'t work.', 'death_note_s1.mp4'),
(141, 6, 1, 8, 'Glare', '23m', 'Light, entirely aware of L\'s surveillance equipment in his home, begins a very careful game to throw off suspicion.', 'death_note_s1.mp4'),
(142, 6, 1, 9, 'Encounter', '23m', 'L makes a direct move against his top suspect when Light enters To-Oh University.', 'death_note_s1.mp4'),
(143, 6, 1, 10, 'Doubt', '23m', 'L challenges Light to a tennis match and tests his deductive abilities; an urgent call has them rushing to the hospital.', 'death_note_s1.mp4'),
(144, 6, 1, 11, 'Assault', '23m', 'Video tapes reportedly from Kira air on Sakura TV, although L suspects that this is the work of another Kira.', 'death_note_s1.mp4'),
(145, 6, 1, 12, 'Love', '23m', 'Light is invited into the Task Force to help respond to the second Kira, and Rem tells Misa how she came by her Death Note.', 'death_note_s1.mp4'),
(146, 6, 1, 13, 'Confession', '23m', 'Light goes to Aoyama to discover the identity of the second Kira before L becomes more suspicious, but Misa Amane, the new Kira, uses her unusual gift to find Light before he finds her.', 'death_note_s1.mp4'),
(147, 6, 1, 14, 'Friend', '23m', 'Light and Misa show each other their Death Notes, and Light asks Misa to have her shinigami Rem get rid of L, which Misa will do in order to have Light fall in love with her.', 'death_note_s1.mp4'),
(148, 6, 1, 15, 'Wager', '23m', 'Convinced the two Kiras have met and worried at the prospect of his own murder, L declares that the event of his death will prove Light is Kira.', 'death_note_s1.mp4'),
(149, 6, 1, 16, 'Decision', '23m', 'Light decides to tell L that he thinks he may be Kira.', 'death_note_s1.mp4'),
(150, 6, 1, 17, 'Execution', '23m', 'Getting nowhere fast, L thinks of a new plan to get Light, Misa and Mr. Yagami out of confinement.', 'death_note_s1.mp4'),
(151, 6, 1, 18, 'Ally', '23m', 'L\'s depression causes a scuffle to break out in the new headquarters, and a recent string of CEO deaths has L and Light thinking that Kira may be killing for monetary profit.', 'death_note_s1.mp4'),
(152, 6, 1, 19, 'Matsuda', '23m', 'Matsuda, the task force member eager to distinguish himself, decides, while assigned to watch Misa, to do a little snooping on his own at the Yotsuba Group\'s Tokyo headquarters.', 'death_note_s1.mp4'),
(153, 6, 1, 20, 'Makeshift', '23m', 'After Light establishes a mole within the Yotsuba Group, L separates himself from the rest of the task force and recruits Misa.', 'death_note_s1.mp4'),
(154, 6, 1, 21, 'Performance', '23m', 'The third Kira sets his eyes on Misa after meeting her. While Misa takes a break from meeting the Yotsuba Group, Rem contacts her. Misa is able to see the shinigami, but her memories of being the second Kira do not return.', 'death_note_s1.mp4'),
(155, 6, 1, 22, 'Guidance', '23m', 'After learning that Higuchi is Kira, L decides that they mustn\'t apprehend him till they understand his killing method.', 'death_note_s1.mp4'),
(156, 6, 1, 23, 'Frenzy', '23m', 'L and Light, watching from the investigation team building, wonder whom Higuchi (seemingly alone) is talking to. L wonders if it\'s a shinigami. With Rem beside him, Higuchi - frantic to kill Matsuda - takes \"the deal\" to become unstoppable.', 'death_note_s1.mp4'),
(157, 6, 1, 24, 'Revival', '23m', 'The team arrests Higuchi for being Kira and causing multiple murders. Inspecting Higuchi\'s Death Note, team members who touch it abruptly discover that shinigami do exist, and when Light takes the Death Note from L, his memory returns.', 'death_note_s1.mp4'),
(158, 6, 1, 25, 'Silence', '23m', 'Light, his memory recovered, orders Misa to begin killing after Higuchi dies. The Shinigami Rem realizes that everything is going according to Light\'s plan, and that L will arrest Misa as Kira unless Rem acts quickly.', 'death_note_s1.mp4'),
(159, 6, 1, 26, 'Renewal', '23m', 'After L\'s death, the world needs a new great detective, and it\'s generally agreed that Light take his place.', 'death_note_s1.mp4'),
(160, 6, 1, 27, 'Abduction', '23m', 'The first moves of two new investigators cause Light to make a spontaneous decision with long-term consequences.', 'death_note_s1.mp4'),
(161, 6, 1, 28, 'Impatience', '23m', 'In trying to retrieve his kidnapped sister, Light learns of two opposing factions trying to take him down, the SPK lead by N and a crime syndicate lead by Mello.', 'death_note_s1.mp4'),
(162, 6, 1, 29, 'Father', '23m', 'Mello learns some valuable information concerning false entries in his Death Note from its true owner. Soichiro agrees to take on the shinigami eyes to thwart him.', 'death_note_s1.mp4'),
(163, 6, 1, 30, 'Justice', '23m', 'Mello busts into SPK headquarters to retrieve a photograph of himself to make sure he won\'t be killed by Kira. In exchange for Near giving him the picture, Mello drops an important hint about the Death Notes: some of the rules are fake.', 'death_note_s1.mp4'),
(164, 6, 1, 31, 'Transfer', '23m', 'Near escapes the mob attack, and Light once again proves his ability to stay a step ahead by creating a fourth Kira.', 'death_note_s1.mp4'),
(165, 6, 1, 32, 'Selection', '23m', 'Star newscaster Kiyomi Takada becomes Kira\'s spokesperson to the world (after Mikami \"deletes\" Demegawa). She just so happens to have been Light\'s girlfriend in college. Aizawa\'s suspicions about Light grow.', 'death_note_s1.mp4'),
(166, 6, 1, 33, 'Scorn', '23m', 'Near goes to Japan, allegedly as bait for Kira. Following Light\'s instructions, Takada asks Mikami to send her five pages of the Death Note. She tells him that he will continue his work in a fake book made to look like the real one.', 'death_note_s1.mp4'),
(167, 6, 1, 34, 'Vigilance', '23m', 'Aizawa figures out what\'s going on and tells Near, who already knows about the notes. Near instructs Aizawa to continue watching Light, and then puts in motion a plan to separate Misa from Light.', 'death_note_s1.mp4'),
(168, 6, 1, 35, 'Malice', '23m', 'Mello kidnaps Takada in a daring operation, getting in the way of both Near and Light\'s plans to set up a meeting between the SPK and the investigation team.', 'death_note_s1.mp4'),
(169, 6, 1, 36, '1.28', '23m', 'Near, along with the SPK, meets Light and the task force at a warehouse for the final showdown. To everyone\'s shock, Near reveals that Kira\'s follower, Mikami, is at the warehouse and is writing everyone\'s name in the Death Note.', 'death_note_s1.mp4'),
(170, 6, 1, 37, 'New World', '23m', 'Though Mikami has written all the investigators\' names in the Death Note, a minute passes and everyone is still alive. Near seizes Mikami\'s Death Note, and all is at last revealed.', 'death_note_s1.mp4'),
(171, 7, 1, 1, 'Episode 1', '66m', 'Inside Lee Byeong-Chan\'s science lab, a student incurs a seemingly harmless bite. Shortly after, a fast-spreading outbreak soaks the school in blood.', 'all_of_us_are_dead_s1.mp4'),
(172, 7, 1, 2, 'Episode 2', '70m', 'The infected multiply in droves. Scrambling for their lives, Nanm On-Jo and Lee Cheong-San find safety with others inside a classroom-but not for long.', 'all_of_us_are_dead_s1.mp4'),
(173, 7, 1, 3, 'Episode 3', '62m', 'When one of the group is scratched while fighting a zombie, Lee Na-yeon demands they kick him out. Outside, the virus swallows up the city.', 'all_of_us_are_dead_s1.mp4'),
(174, 7, 1, 4, 'Episode 4', '71m', 'In need of a cellphone, two students take a risky journey to the teachers\' office. Byeong-chan passes on critical information to Detective Song Jae-ik.', 'all_of_us_are_dead_s1.mp4'),
(175, 7, 1, 5, 'Episode 5', '56m', 'Martial law is imposed on the city. When Cheong-san is separated from the rest of the group, On-jo leads a mission to use a drone to locate him.', 'all_of_us_are_dead_s1.mp4'),
(176, 7, 1, 6, 'Episode 6', '66m', 'The group clears a path to Cheong-an using sound to draw away the zombies, but a new type of threat surfaces. Nam So-ju breaks out of the quarantine camp.', 'all_of_us_are_dead_s1.mp4'),
(177, 7, 1, 7, 'Episode 7', '59m', 'To make it out of the music room and onto the roof, the students put into action their most perilous plan yet. Elsewhere, Jae-ik comes across a setback.', 'all_of_us_are_dead_s1.mp4'),
(178, 7, 1, 8, 'Episode 8', '57m', 'Jae-ik and his crew run into a student from the school. Na-yeon works up the courage to face her peers. The group shares confessions around a fire.', 'all_of_us_are_dead_s1.mp4'),
(179, 7, 1, 9, 'Episode 9', '60m', 'A disturbance at the quarantine camp shifts the military\'s understanding of the virus. A thunderstorm provides cover as the group agrees to keep on moving.', 'all_of_us_are_dead_s1.mp4'),
(180, 7, 1, 10, 'Episode 10', '53m', 'The auditorium quickly becomes a trap for the two newly united teams of survivors. Byeong-chan\'s video logs reveal a drastic solution to the crisis.', 'all_of_us_are_dead_s1.mp4'),
(181, 7, 1, 11, 'Episode 11', '55m', 'Though a surprise protector provides the group safe passage to their next stop, Yoon Gwi-nam is not far behind. The military makes a grave decision.', 'all_of_us_are_dead_s1.mp4'),
(182, 7, 1, 12, 'Episode 12', '53m', 'The students make it to the quarantine camp, each of them weighed down by tragic loss. Months later, they hang on to hope for a survivor.', 'all_of_us_are_dead_s1.mp4'),
(183, 8, 1, 1, 'I’m Used to It', '24m', 'Known as the weakest hunter, Sung Jin-Woo joins a dungeon raid that quickly turns into a nightmare when the team encounters something far more dangerous than expected.', 'solo_leveling_s1.mp4'),
(184, 8, 1, 2, 'If I Had One More Chance', '24m', 'After surviving the impossible, Jin-Woo wakes up to a mysterious system that gives him a second chance at life—and power.', 'solo_leveling_s1.mp4'),
(185, 8, 1, 3, 'It’s Like a Game', '24m', 'The strange system begins issuing quests and penalties, forcing Jin-Woo to adapt or face deadly consequences.', 'solo_leveling_s1.mp4'),
(186, 8, 1, 4, 'I’ve Gotta Get Stronger', '24m', 'Realizing the system allows him to grow endlessly, Jin-Woo starts training alone to escape his fate as the weakest hunter.', 'solo_leveling_s1.mp4'),
(187, 8, 1, 5, 'A Pretty Good Deal', '24m', 'Jin-Woo accepts a risky dungeon raid that could finally change how other hunters see him.', 'solo_leveling_s1.mp4'),
(188, 8, 1, 6, 'The Real Hunt Begins', '24m', 'Separated from the group inside a dungeon, Jin-Woo faces monsters on his own and discovers how far he has already come.', 'solo_leveling_s1.mp4'),
(189, 8, 1, 7, 'Let’s See How Far I Can Go', '24m', 'With growing confidence and power, Jin-Woo pushes himself further, testing the limits of the system.', 'solo_leveling_s1.mp4'),
(190, 8, 1, 8, 'This Is Frustrating', '24m', 'Despite his progress, Jin-Woo encounters enemies that remind him survival still comes at a heavy cost.', 'solo_leveling_s1.mp4'),
(191, 8, 1, 9, 'You’ve Been Hiding Your Skills', '24m', 'Other hunters begin to notice Jin-Woo’s sudden transformation, raising suspicion and curiosity.', 'solo_leveling_s1.mp4'),
(192, 8, 1, 10, 'What Is This, a Picnic?', '24m', 'A seemingly easy raid turns deadly, forcing Jin-Woo to reveal just how powerful he has become.', 'solo_leveling_s1.mp4'),
(193, 8, 1, 11, 'A Knight Who Defends an Empty Throne', '24m', 'Deep inside a high-level dungeon, Jin-Woo confronts a terrifying enemy guarding a mysterious throne.', 'solo_leveling_s1.mp4'),
(194, 8, 1, 12, 'Arise', '24m', 'Jin-Woo makes a defining choice that unlocks a power no hunter has ever possessed before.', 'solo_leveling_s1.mp4'),
(195, 8, 2, 1, 'You Aren’t E-Rank, Are You?', '24', 'Sung Jin-Woo returns to the field, shocking hunters with strength far beyond his recorded rank as new threats begin to surface.', 'solo_leveling_s2.mp4'),
(196, 8, 2, 2, 'I Suppose You Aren’t Aware', '24', 'Jin-Woo’s actions attract attention from powerful figures while the Hunter Association begins to question his true power.', 'solo_leveling_s2.mp4'),
(197, 8, 2, 3, 'Still a Long Way to Go', '24', 'Despite his growth, Jin-Woo realizes the gap between him and the world’s strongest hunters is still dangerously wide.', 'solo_leveling_s2.mp4'),
(198, 8, 2, 4, 'I Need to Stop Faking', '24', 'Jin-Woo decides hiding his abilities is no longer an option as larger gates and deadlier enemies appear.', 'solo_leveling_s2.mp4'),
(199, 8, 2, 5, 'This Is What We’re Trained to Do', '24', 'Elite hunters face a brutal mission that tests teamwork, resolve, and survival against overwhelming odds.', 'solo_leveling_s2.mp4'),
(200, 8, 2, 6, 'Don’t Look Down on My Guys', '24', 'Jin-Woo steps in to protect his allies, proving his loyalty to those who fight beside him.', 'solo_leveling_s2.mp4'),
(201, 8, 2, 7, 'The 10th S-Rank Hunter', '24', 'The world learns of a new S-Rank hunter, shaking the balance of power within the global hunter community.', 'solo_leveling_s2.mp4'),
(202, 8, 2, 8, 'Looking Up Was Tiring Me Out', '24', 'Jin-Woo confronts enemies far above ordinary hunters, pushing his shadow army to new limits.', 'solo_leveling_s2.mp4'),
(203, 8, 2, 9, 'It Was All Worth It', '24', 'Sacrifices and hard battles begin to pay off as Jin-Woo grows closer to his true purpose.', 'solo_leveling_s2.mp4'),
(204, 8, 2, 10, 'We Need a Hero', '24', 'With humanity facing an unprecedented threat, all eyes turn to Jin-Woo as their last hope.', 'solo_leveling_s2.mp4'),
(205, 8, 2, 11, 'It’s Going to Get Even More Intense', '24', 'The conflict escalates as powerful beings reveal themselves and war becomes inevitable.', 'solo_leveling_s2.mp4'),
(206, 8, 2, 12, 'Are You the King of Humans', '24', 'Jin-Woo faces a terrifying enemy who questions humanity’s right to survive.', 'solo_leveling_s2.mp4'),
(207, 8, 2, 13, 'On to the Next Target', '24', 'As one battle ends, Jin-Woo prepares for an even greater war awaiting beyond the shadows.', 'solo_leveling_s2.mp4'),
(208, 10, 1, 1, 'The Heirs of the Dragon', '66 min', 'King Viserys Targaryen names his daughter Rhaenyra as heir, setting the stage for future conflict within House Targaryen.', 'hotd_s1.mp4'),
(209, 10, 1, 2, 'The Rogue Prince', '54 min', 'Rhaenyra oversteps at the Small Council. Viserys is urged to secure the succession through marriage. Daemon announces his intentions.', 'hotd_s1.mp4'),
(210, 10, 1, 3, 'Second of His Name', '64 min', 'Daemon and the Sea Snake battle the Crabfeeder. The realm celebrates Aegon\'s second nameday. Rhaenyra faces the prospect of marriage.', 'hotd_s1.mp4'),
(211, 10, 1, 4, 'King of the Narrow Sea', '63 min', 'Rhaenyra continues her search for a suitable match, Daemon returns to Kings Landing and stirs more trouble for the King. Rhaenyra learns a valuable lesson.', 'hotd_s1.mp4'),
(212, 10, 1, 5, 'We Light the Way', '59 min', 'Daemon visits his wife in the Vale. Viserys and Rhaenyra broker agreements with the Velaryons. Alicent seeks the truth about the princess.', 'hotd_s1.mp4'),
(213, 10, 1, 6, 'The Princess and the Queen', '68 min', 'Ten years later. Rhaenyra navigates Alicent\'s continued speculation about her children, while Daemon and Laena weigh an offer in Pentos.', 'hotd_s1.mp4'),
(214, 10, 1, 7, 'Driftmark', '58 min', 'As the families gather on Driftmark for a funeral, Viserys calls for an end to infighting and Alicent demands justice.', 'hotd_s1.mp4'),
(215, 10, 1, 8, 'The Lord of the Tides', '66 min', 'Six years later. With the Driftmark succession suddenly critical, Rhaenyra attempts to strike a bargain with Rhaenys.', 'hotd_s1.mp4'),
(216, 10, 1, 9, 'The Green Council', '58 min', 'While Alicent enlists Cole and Aemond to track down Aegon, Otto gathers the great houses of Westeros to affirm their allegiance.', 'hotd_s1.mp4'),
(217, 10, 1, 10, 'The Black Queen', '63 min', 'While mourning a tragic loss, Rhaenyra tries to hold the realm together, and Daemon prepares for war.', 'hotd_s1.mp4'),
(218, 10, 2, 1, 'A Son for a Son', '59 min', 'As Alicent grows concerned by Aegon\'s Small Council, Rhaenyra arrives at a fateful decision.', 'hotd_s2.mp4'),
(219, 10, 2, 2, 'Rhaenyra the Cruel', '57 min', 'As Otto schemes to turn the public against her, Rhaenyra questions Daemon\'s loyalty. Meanwhile, Ser Criston Cole concocts a misguided plan for revenge.', 'hotd_s2.mp4'),
(220, 10, 2, 3, 'The Burning Mill', '60 min', 'As ancient grudges resurface, Rhaenys suggests that Alicent may see reason while the men around her seek bloodshed. Ser Criston proposes a bold scheme. Daemon arrives at Harrenhal to raise an army for the Blacks.', 'hotd_s2.mp4'),
(221, 10, 2, 4, 'The Red Dragon and the Gold', '61 min', 'In Rhaenyra\'s absence and with no word from Daemon, Rhaenys tries to keep the peace on the Black Council as Cole mounts a campaign into the Crownlands. In King\'s Landing, Aemond continues to undermine Aegon\'s fragile hold on authority.', 'hotd_s2.mp4'),
(222, 10, 2, 5, 'Regent', '58 min', 'Amid whispers of bad omens, the Greens consider how to fill a void on Aegon\'s Council. Jacaerys sets out on a rogue mission to strike a deal. Daemon enlists Lord Willem Blackwood to help persuade the Brackens to bend the knee.\\', 'hotd_s2.mp4'),
(223, 10, 2, 6, 'Smallfolk', '55 min', 'With few options left, Rhaenyra embarks on a risky venture while Aemond takes steps to reshape the Green Council.', 'hotd_s2.mp4'),
(224, 10, 2, 7, 'The Red Sowing', '62 min', 'The war for the Iron Throne escalates, and Queen Rhaenyra Targaryen, in a crucial gamble, is prepared to risk everything in her urgent quest for dragon riders.', 'hotd_s2.mp4'),
(225, 10, 2, 8, 'The Queen Who Ever Was', '64 min', 'As Aemond becomes more volatile, Larys plots an escape, while Rhaenyra looks to press her advantage.', 'hotd_s2.mp4');

-- --------------------------------------------------------

--
-- Table structure for table `movies`
--

CREATE TABLE `movies` (
  `id` int(11) NOT NULL,
  `title` varchar(150) NOT NULL,
  `release_year` int(11) DEFAULT NULL,
  `age_rating` varchar(10) DEFAULT NULL,
  `runtime` varchar(12) DEFAULT NULL,
  `genre` varchar(100) NOT NULL,
  `rating` float NOT NULL,
  `description` text NOT NULL,
  `poster` varchar(255) NOT NULL,
  `trailer` varchar(255) NOT NULL,
  `poster_v` varchar(255) DEFAULT NULL,
  `type` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `movies`
--

INSERT INTO `movies` (`id`, `title`, `release_year`, `age_rating`, `runtime`, `genre`, `rating`, `description`, `poster`, `trailer`, `poster_v`, `type`) VALUES
(1, 'Avengers: Endgame', 2019, 'UA 13+', '3h 2m', 'Action | Adventure | Sci-Fi', 8.4, 'After the devastating events of Infinity War, the Avengers assemble once more to reverse Thanos actions and restore balance to the universe. The movie follows time travel, sacrifice, and the final battle to save all life.', 'avengers_endgame.png', 'avengers_endgame.mp4', 'avengers_endgame_1.png', 'marvel'),
(2, 'Avengers: Infinity War', 2018, 'UA 13+', '2h 29m', 'Action | Adventure | Sci-Fi', 8.4, 'As the Avengers and their allies continue to protect the world, a new danger emerges from the cosmic shadows: Thanos. His goal is to collect all six Infinity Stones and use them to impose his twisted will on reality, putting the fate of the universe at stake.', 'avengers_infinity_war.png', 'avengers_infinity_war.mp4', 'avengers_infinity_war_1.png', 'marvel'),
(3, 'Spider-Man: Homecoming', 2017, 'UA 13+', '2h 13m', 'Action | Adventure | Sci-Fi', 7.4, 'After the events of Captain America: Civil War, Peter Parker tries to balance his life as a high school student and a superhero under the guidance of Tony Stark. When the Vulture emerges as a new threat, Peter must prove that he is more than just a friendly neighborhood Spider-Man.', 'spiderman_homecoming.jpg', 'spiderman_homecoming.mp4', 'spiderman_homecoming_1.jpg', 'marvel'),
(4, 'Interstellar', 2014, 'PG-13', '2h 49m', 'Sci-Fi | Adventure', 8.6, 'A team of explorers travel through a wormhole in space in an attempt to ensure humanity’s survival.', 'interstellar.jpg', 'interstellar_trailer.mp4', 'interstellar_1.jpg', NULL),
(5, 'KGF: Chapter 2', 2022, 'UA 16+', '2h 48m', 'Action | Crime | Drama', 8.2, 'Rocky has risen to power as the undisputed king of the Kolar Gold Fields. As his name strikes fear into his enemies, governments and rivals conspire to bring him down. Facing betrayal, political pressure, and powerful adversaries, Rocky must fight to protect his empire and fulfill his promise.', 'kgf_chapter_2.jpg', 'kgf_chapter_2.mp4', 'kgf_chapter_2_1.jpg', NULL),
(6, 'Avatar: Fire and Ash', 2025, 'PG-13', '3h 17m', 'Sci-Fi | Adventure | Fantasy | Action', 7.4, 'Set in the evolving world of Pandora, Avatar: Fire and Ash explores the rise of new clans and the growing conflict between the Na’vi and returning human forces. As fire and ash reshape Pandora, alliances are tested and a new chapter of destiny begins.', 'avatar_fire_and_ash.jpg', 'avatar_fire_and_ash.mp4', 'avatar_fire_and_ash_1.jpg', NULL),
(7, 'Avatar: The Way of Water', 2022, 'UA 13+', '3h 12m', 'Sci-Fi | Adventure | Fantasy | Action', 7.5, 'Set more than a decade after the events of the first film, Avatar: The Way of Water follows Jake Sully and Neytiri as they build a family on Pandora. When a familiar threat resurfaces, Jake must work with the Na’vi clans of the ocean to protect their home and way of life.', 'avatar_the_way_of_water.jpeg', 'avatar_the_way_of_water.mp4', 'avatar_the_way_of_water_1.jpg', NULL),
(8, 'Spider-Man: No Way Home', 2021, 'UA 13+', '2h 28m', 'Action | Adventure | Sci-Fi | Superhero', 8.2, 'For the first time in Spider-Man cinematic history, Peter Parker’s identity is revealed, bringing his superhero responsibilities into conflict with his normal life. When he turns to Doctor Strange for help, the spell goes wrong, opening the multiverse and forcing Peter to confront powerful villains from other worlds.', 'spiderman_no_way_home.jpg', 'spiderman_no_way_home.mp4', 'spiderman_no_way_home_1.jpg', 'marvel'),
(9, 'Spider-Man: Far From Home', 2019, 'UA 13+', '2h 9m', 'Action | Adventure | Sci-Fi', 7.4, 'Following the events of Avengers: Endgame, Peter Parker tries to take a break from his superhero life while on a school trip to Europe. However, his plans are disrupted when Nick Fury recruits him to face new threats created by the mysterious Mysterio.', 'spiderman_far_from_home.jpg', 'spiderman_far_from_home.mp4', 'spiderman_far_from_home_1.jpg', 'marvel'),
(10, 'Shang-Chi and the Legend of the Ten Rings', 2021, 'UA 13+', '2h 12m', 'Action | Adventure | Fantasy', 7.3, 'Shang-Chi must confront the past he thought he left behind when he is drawn into the web of the mysterious Ten Rings organization. As ancient magic collides with modern life, he discovers the truth about his family and his destiny.', 'shang_chi.jpg', 'shang_chi.mp4', 'shang_chi_1.jpg', 'marvel'),
(11, 'Captain America: Civil War', 2016, 'UA 13+', '2h 27m', 'Action | Suprhero | Sci-Fi', 7.8, 'Political pressure mounts on the Avengers to submit to government oversight. The disagreement divides the team, placing Captain America and Iron Man on opposing sides as former allies clash in an explosive battle that tests loyalty, friendship, and ideals.', 'captain_america_civil_war.jpg', 'captain_america_civil_war.mp4', 'captain_america_civil_war_1.jpeg', 'marvel'),
(12, 'The Avengers', 2012, 'PG-13', '2h 23m', 'Action | Superhero | Sci-Fi | Alien', 8, 'Earth’s mightiest heroes must come together and learn to fight as a team to stop the mischievous Loki and his alien army from enslaving humanity.', 'avengers.jpg', 'avengers.mp4', 'avengers_1.jpg', 'marvel'),
(13, 'Avengers: Age of Ultron', 2015, 'PG-13', '2h 21m', 'Action | Superhero | Sci-Fi | Conspiracy', 7.3, 'When Tony Stark and Bruce Banner try to jump-start a dormant peacekeeping program called Ultron, things go horribly wrong and Earth’s mightiest heroes must stop the villainous AI from destroying humanity.', 'avengers_age_of_ultron.jpg', 'avengers_age_of_ultron.mp4', 'avengers_age_of_ultron_1.jpg', 'marvel'),
(14, 'Black Panther', 2018, 'PG-13', '2h 14m', 'Action | Political | Sci-Fi ', 7.3, 'After the death of his father, T’Challa returns home to the African nation of Wakanda to take his rightful place as king. But when a powerful enemy emerges, he must unleash the full power of Black Panther to save his people and the world.', 'black_panther.jpg', 'black_panther.mp4', 'black_panther_1.jpg', 'marvel'),
(15, 'Black Panther: Wakanda Forever', 2022, 'PG-13', '2h 41m', 'Action | Adventure | Sci-Fi | Drama', 6.7, 'As the people of Wakanda fight to protect their nation after the death of King T’Challa, Queen Ramonda, Shuri, M’Baku, Okoye, and the Dora Milaje struggle to embrace their next chapter while facing a powerful new threat from the underwater kingdom of Talokan.', 'wakanda_forever.jpg', 'wakanda_forever.mp4', 'wakanda_forever_1.jpg', 'marvel'),
(16, 'Guardians of the Galaxy Vol. 3', 2023, 'PG-13', '2h 30m', 'Action | Adventure | Sci-Fi | Comedy', 7.9, 'Still reeling from the loss of Gamora, Peter Quill rallies his team to defend the universe and protect one of their own. A mission that could mean the end of the Guardians if not successful.', 'guardians_3.jpeg', 'guardians_3.mp4', 'guardians_3_1.jpg', 'marvel'),
(17, 'Iron Man', 2008, 'PG-13', '2h 6m', 'Action | Adventure | Sci-Fi', 7.9, 'After being held captive in an Afghan cave, billionaire engineer Tony Stark creates a unique weaponized suit of armor to fight evil and becomes the armored superhero Iron Man.', 'iron_man.jpg', 'iron_man.mp4', 'iron_man_1.jpg', 'marvel'),
(18, 'Iron Man 2', 2010, 'PG-13', '2h 4m', 'Action | Adventure | Sci-Fi', 7, 'With the world now aware of his identity as Iron Man, Tony Stark faces pressure from the government, the media, and a powerful new enemy while forging uneasy alliances that will shape the future of the Avengers.', 'iron_man_2.jpg', 'iron_man_2.mp4', 'iron_man_2_1.jpg', 'marvel'),
(19, 'Moonfall', 2022, '12A', '2h 10m', 'Sci-Fi | Disaster | Thriller', 5.5, 'A mysterious force knocks the Moon from its orbit around Earth and sends it on a collision course. A former NASA astronaut teams up with unlikely allies to save humanity before time runs out.', 'moonfall.jpg', 'moonfall.mp4', 'moonfall_1.jpg', NULL),
(20, 'How to Train Your Dragon', 2025, 'PG', '2h 05m', 'Fantasy | Adventure | Family', 7.8, 'A live-action adaptation of the beloved animated film. A young Viking named Hiccup forms an unlikely friendship with a dragon, Toothless, challenging centuries of tradition and changing the fate of both humans and dragons.', 'httyd_live.jpg', 'httyd_live.mp4', 'httyd_live_1.jpg', NULL),
(21, 'Fast & Furious Presents: Hobbs & Shaw', 2019, 'PG-13', '2h 17m', 'Action | Adventure | Thriller', 6.5, 'Lawman Luke Hobbs and outcast Deckard Shaw form an unlikely alliance when a cyber-genetically enhanced villain threatens the future of humanity. Explosive action and globe-trotting chaos follow.', 'hobbs_shaw.jpg', 'hobbs_shaw.mp4', 'hobbs_shaw_1.jpg', NULL),
(22, 'The Conjuring: Last Rites', 2025, 'R', '2h 15m', 'Horror | Mystery | Thriller', 6.2, 'Ed and Lorraine Warren take on their final and most dangerous case, confronting a powerful evil that threatens to test their faith and legacy.', 'conjuring_last_rites.jpg', 'conjuring_last_rites.mp4', 'conjuring_last_rites_1.jpg', 'horror'),
(23, 'Annabelle Comes Home', 2019, 'A', '2h 46m', 'Horror| Mystery | Thriller', 6, 'When the possessed Annabelle doll awakens other evil spirits, Ed and Lorraine Warren’s home becomes the center of a terrifying night of supernatural chaos.', 'annabelle_comes_home.jpg', 'annabelle_comes_home.mp4', 'annabelle_comes_home_1.jpg', 'horror'),
(24, 'K-Pop Demon Hunters', 2024, 'PG', '1h 35m', 'Anime| Action | Fantasy | Music', 7.5, 'By day, they are global K-pop superstars. By night, they secretly hunt supernatural demons threatening the world. Balancing fame, friendship, and hidden battles, the group fights dark forces using music, martial skills, and ancient powers.', 'kpop_demon_hunters.jpg', 'kpop_demon_hunters.mp4', 'kpop_demon_hunters_1.jpg', 'anime'),
(25, 'Your Name', 2016, 'PG', '1h 46m', 'Anime | Romance | Fantasy | Drama', 8.4, 'Two teenagers, living in completely different worlds, mysteriously begin to swap bodies. As they search for answers, a powerful connection forms that transcends time, distance, and fate.', 'your_name.jpg', 'your_name.mp4', 'your_name_1.jpg', 'anime'),
(26, 'Jujutsu Kaisen 0', 2021, 'PG-13', '1h 52m', 'Anime | Action | Fantasy | Supernatural', 7.9, 'Yuta Okkotsu is haunted by a powerful cursed spirit bound to him after the tragic death of his childhood friend. As he enrolls at Tokyo Jujutsu High, he learns to control his powers and confront a dangerous curse user threatening the balance of the jujutsu world.', 'jjk_0.jpg', 'jjk_0.mp4', 'jjk_0_1.jpg', 'anime'),
(27, 'Mufasa: The Lion King', 2024, 'PG', '1h 58m', 'Adventure | Drama | Family', 6.7, 'An origin story that explores the early life of Mufasa, revealing his journey from an orphaned cub to the legendary king of the Pride Lands. Told through memories and stories, the film uncovers themes of destiny, brotherhood, and leadership.', 'mufasa.jpg', 'mufasa.mp4', 'mufasa_1.jpg', NULL),
(28, 'Evil Dead Rise', 2023, 'R', '1h 36m', 'Horror | Supernatural', 6.5, 'Two estranged sisters reunite in a high-rise apartment, only to face a terrifying outbreak of demonic possession. As ancient evil is unleashed, family bonds are twisted into a brutal fight for survival against the Deadites.', 'evil_dead_rise.jpg', 'evil_dead_rise.mp4', 'evil_dead_rise_1.jpg', 'horror'),
(29, 'The Lion King', 2019, 'PG', '1h 58m', 'Adventure | Drama | Family', 6.8, 'After the murder of his father, a young lion prince flees his kingdom only to learn the true meaning of responsibility and bravery. As darkness spreads across the Pride Lands, Simba must return to reclaim his throne and restore balance to the Circle of Life.', 'the_lion_king.jpg', 'the_lion_king.mp4', 'the_lion_king_1.jpg', NULL),
(30, 'Godzilla vs. Kong', 2021, 'PG-13', '1h 53m', 'Action | Sci-Fi | Monster ', 6.3, 'As two legendary Titans clash in an epic battle, humanity struggles to survive while uncovering the ancient secrets behind their origins. Godzilla and Kong are forced into a world-shaking confrontation that will determine the fate of both monsters and mankind.', 'godzilla_vs_kong.jpg', 'godzilla_vs_kong.mp4', 'godzilla_vs_kong_1.jpg', NULL),
(31, 'Godzilla x Kong: The New Empire', 2024, 'PG-13', '1h 55m', 'Action | Sci-Fi | Monster', 6, 'Godzilla and Kong return to face a colossal hidden threat buried deep within the Hollow Earth. As ancient powers awaken, the two Titans must unite to protect humanity and uncover the origins of their shared legacy, leading to a battle that could reshape the world.', 'godzilla_x_kong_new_empire.jpg', 'godzilla_x_kong_new_empire.mp4', 'godzilla_x_kong_new_empire_1.jpg', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `series`
--

CREATE TABLE `series` (
  `id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `release_year` varchar(20) DEFAULT NULL,
  `age_rating` varchar(10) DEFAULT NULL,
  `genre` varchar(255) DEFAULT NULL,
  `rating` float DEFAULT NULL,
  `description` text DEFAULT NULL,
  `poster` varchar(255) DEFAULT NULL,
  `poster_v` varchar(255) DEFAULT NULL,
  `seasons` int(11) DEFAULT NULL,
  `trailer` varchar(255) DEFAULT NULL,
  `type` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `series`
--

INSERT INTO `series` (`id`, `title`, `release_year`, `age_rating`, `genre`, `rating`, `description`, `poster`, `poster_v`, `seasons`, `trailer`, `type`) VALUES
(1, 'Stranger Things', '2016 - 2025', '16+', 'Sci-Fi | Horror | Mystery', 8.7, 'When a young boy disappears, a small town uncovers a mystery involving secret experiments, terrifying supernatural forces, and one strange little girl.', 'stranger_things.jpg', 'stranger_things_1.jpg', 5, 'stranger_things.mp4', ''),
(2, 'Money Heist', '2017 - 2021', '16+', 'Crime | Heist | Drama | Mystery', 8.2, 'A mysterious mastermind recruits a group of criminals to carry out the biggest heist in history.', 'money_heist.jpg', 'money_heist_1.jpg', 5, 'money_heist.mp4', ''),
(3, 'Squid Game', '2021 - 2025', '18+', 'Thriller | Drama | Survival', 7.9, 'Hundreds of desperate contestants accept an invitation to compete in deadly children’s games for a life-changing cash prize.', 'squid_game.jpg', 'squid_game_1.jpg', 3, 'squid_game.mp4', ''),
(4, 'One Piece', '2023', 'U/A 13+', 'Action | Adventure | Fantasy', 8.3, 'A young pirate with dreams of becoming the King of the Pirates sets sail with his crew in search of the legendary treasure known as the One Piece.', 'onepiece.jpg', 'onepiece_1.jpg', 1, 'onepiece.mp4', ''),
(5, 'Loki', '2021 -  2023', 'U/A 13+', 'Action | Adventure | Sci-Fi | Fantasy', 8.2, 'After stealing the Tesseract, Loki finds himself caught by a mysterious organization that monitors the timeline, forcing him to confront alternate versions of himself.', 'loki.jpg', 'loki_1.jpg', 2, 'loki.mp4', 'marvel'),
(6, 'Death Note', '2006 - 2007', 'TV-14', 'Anime | Psychological Thriller | Supernatural', 8.9, 'A brilliant high school student discovers a mysterious notebook that allows him to kill anyone by writing their name. As he attempts to create a perfect world, a legendary detective begins a deadly game of intellect and justice.', 'death_note.jpg', 'death_note_1.jpg', 1, 'death_note.mp4', 'anime'),
(7, 'All of Us Are Dead', '2022', 'TV-MA', 'Horror | Thriller | Zombie | Drama', 7.6, 'A deadly virus outbreak turns a high school into ground zero for a zombie apocalypse. Trapped students must fight to survive while facing fear, loss, and impossible choices.', 'all_of_us_are_dead.jpg', 'all_of_us_are_dead_1.jpg', 1, 'all_of_us_are_dead.MP4', ''),
(8, 'Solo Leveling', '2024 - 2025', 'TV-14', 'Anime | Action | Fantasy | Adventure', 8.6, 'In a world where hunters battle deadly monsters, Sung Jin-Woo is known as the weakest. After surviving a mysterious dungeon, he gains a unique ability to level up endlessly, setting him on a path to become humanity’s strongest hunter.', 'solo_leveling.jpg', 'solo_leveling_1.jpg', 2, 'solo_leveling.mp4', 'anime'),
(10, 'House of the Dragon', '2022', 'TV-MA', 'Fantasy | Drama | Adventure', 8.3, 'Set nearly 200 years before the events of Game of Thrones, House of the Dragon tells the story of House Targaryen. The series follows the internal power struggles, political intrigue, and the brutal civil war known as the Dance of the Dragons.', 'house_of_the_dragon.jpg', 'house_of_the_dragon_1.jpg', 2, 'hotd_s2.mp4', '');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password_hash`, `created_at`) VALUES
(1, 'speedy', 'kukadiyadhruti@gmail.com', 'scrypt:32768:8:1$CITago2dsd0IXecd$41180193b273f70ffdf67e6cc43d697634388a69028db5560e685ce20b825e2faab83003e0846e56e0bddb1afb465c4f377c0bc865f4adcdfd30e5fd7b1f5d8e', '2026-01-13 05:33:59'),
(2, 'speedy', 'vkukadiya13@gmail.com', 'scrypt:32768:8:1$BqpvmJqJWcwGYjJH$5731304f4ded77c8d51aa2f316e3000adca676f855527a2ac4c9c4328071b5bae599c0a001083c51a5194351ca235e0bf485d27147808cf4c36a54bab20d61d7', '2026-01-13 18:27:49');

-- --------------------------------------------------------

--
-- Table structure for table `watchlist`
--

CREATE TABLE `watchlist` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `item_type` enum('movie','series') NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `watchlist`
--

INSERT INTO `watchlist` (`id`, `user_id`, `item_id`, `item_type`, `created_at`) VALUES
(16, 2, 4, 'movie', '2026-01-13 18:27:59'),
(19, 2, 8, 'movie', '2026-01-14 20:26:23'),
(20, 2, 2, 'movie', '2026-01-14 20:26:28'),
(26, 1, 1, 'movie', '2026-01-24 19:58:55'),
(27, 1, 3, 'movie', '2026-01-24 19:59:04'),
(28, 1, 10, 'movie', '2026-01-24 19:59:07'),
(29, 1, 15, 'movie', '2026-01-24 19:59:11'),
(30, 1, 19, 'movie', '2026-01-24 19:59:22'),
(37, 1, 7, 'series', '2026-01-29 06:00:25');

-- --------------------------------------------------------

--
-- Table structure for table `watch_progress`
--

CREATE TABLE `watch_progress` (
  `user_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `item_type` enum('movie','series') NOT NULL,
  `progress` int(11) DEFAULT 0,
  `duration` int(11) DEFAULT 0,
  `last_watched` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `watch_progress`
--

INSERT INTO `watch_progress` (`user_id`, `item_id`, `item_type`, `progress`, `duration`, `last_watched`) VALUES
(1, 1, 'movie', 115, 145, '2026-01-24 20:10:12'),
(1, 1, 'series', 17, 131, '2026-01-29 16:32:42'),
(1, 2, 'movie', 33, 138, '2026-01-23 19:03:18'),
(1, 8, 'movie', 10, 170, '2026-01-23 19:31:07'),
(1, 14, 'movie', 0, 138, '2026-01-29 17:06:07'),
(1, 22, 'movie', 5, 152, '2026-01-24 20:46:28'),
(1, 24, 'movie', 0, 149, '2026-01-26 19:55:42'),
(1, 26, 'movie', 0, 130, '2026-01-28 13:49:08'),
(1, 27, 'movie', 37, 155, '2026-01-28 13:49:02'),
(1, 35, 'series', 131, 133, '2026-01-24 19:33:40'),
(1, 81, 'series', 15, 75, '2026-01-26 16:21:05'),
(1, 91, 'series', 226, 228, '2026-01-24 19:40:07'),
(1, 114, 'series', 0, 199, '2026-01-28 13:49:15'),
(1, 171, 'series', 0, 120, '2026-01-28 15:23:09'),
(1, 183, 'series', 0, 241, '2026-01-29 16:44:52'),
(2, 0, 'series', 21, 74, '2026-01-23 19:17:13'),
(2, 2, 'movie', 0, 138, '2026-01-23 18:42:39');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `episodes`
--
ALTER TABLE `episodes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `series_id` (`series_id`);

--
-- Indexes for table `movies`
--
ALTER TABLE `movies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `series`
--
ALTER TABLE `series`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `watchlist`
--
ALTER TABLE `watchlist`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uniq_user_item` (`user_id`,`item_id`,`item_type`);

--
-- Indexes for table `watch_progress`
--
ALTER TABLE `watch_progress`
  ADD PRIMARY KEY (`user_id`,`item_id`,`item_type`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `episodes`
--
ALTER TABLE `episodes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=226;

--
-- AUTO_INCREMENT for table `movies`
--
ALTER TABLE `movies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `series`
--
ALTER TABLE `series`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `watchlist`
--
ALTER TABLE `watchlist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `episodes`
--
ALTER TABLE `episodes`
  ADD CONSTRAINT `episodes_ibfk_1` FOREIGN KEY (`series_id`) REFERENCES `series` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
