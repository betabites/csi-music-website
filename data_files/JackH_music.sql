-- phpMyAdmin SQL Dump
-- version 4.9.5deb2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jun 29, 2021 at 11:03 PM
-- Server version: 8.0.25-0ubuntu0.20.04.1
-- PHP Version: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `JackH_music`
--

-- --------------------------------------------------------

--
-- Table structure for table `artists`
--

CREATE TABLE `artists` (
  `artist_id` smallint NOT NULL,
  `artist_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `artists`
--

INSERT INTO `artists` (`artist_id`, `artist_name`) VALUES
(1, 'A Flock of Seagulls'),
(2, 'Acoustic Alchemy'),
(3, 'Alison Krauss'),
(4, 'Angus Stone'),
(5, 'Julia Stone'),
(6, 'Arctic Monkeys'),
(7, 'Arlo Guthrie'),
(8, 'Average White Band'),
(9, 'Belinda Carlisle'),
(10, 'Big Country'),
(11, 'Black Lodge Singers'),
(12, 'Bob Dylan'),
(13, 'Chris de Burgh'),
(14, 'Chris Rea'),
(15, 'Country Joe'),
(16, 'The Fish'),
(17, 'Daughter'),
(18, 'Dave Dobbyn'),
(19, 'Herbs'),
(20, 'David Byrne'),
(21, 'St. Vincent'),
(22, 'Don McLean'),
(23, 'Earl Klugh'),
(24, 'Enigma'),
(25, 'Enya'),
(26, 'Evanescence'),
(27, 'Faith Hill'),
(28, 'Feist'),
(29, 'Fleetwood Mac'),
(30, 'Flogging Molly'),
(31, 'Gael Force'),
(32, 'Gin Wigmore'),
(33, 'Icehouse'),
(34, 'Imagine Dragons'),
(35, 'Jackson Browne'),
(36, 'James Taylor'),
(37, 'The Dixie Chicks'),
(38, 'Jethro Tull'),
(39, 'Joe Cocker'),
(40, 'Lee Ann Womack'),
(41, 'Lee Ann Womack'),
(42, 'Lynyrd Skynyrd'),
(43, 'Maria Muldaur'),
(44, 'Matthew Sweet'),
(45, 'Susanna Hoffs'),
(46, 'Mother Earth'),
(47, 'Mum'),
(48, 'Mumford & Sons'),
(49, 'Nancy Wilson'),
(50, 'Nina Simone'),
(51, 'Oceania'),
(52, 'Owl City'),
(53, 'Pet Shop Boys'),
(54, 'Pink Floyd'),
(55, 'Rickie Lee Jones'),
(56, 'Ronan Keating'),
(57, 'Sarah Slean'),
(58, 'Shone Laing'),
(59, 'Soul Divas'),
(60, 'St. Germain'),
(61, 'St. Vincent'),
(62, 'Stevie Wonder'),
(63, 'The Bangles'),
(64, 'The Civil Wars'),
(65, 'The Cranberries'),
(66, 'The Front Lawn'),
(67, 'The Nolans'),
(68, 'The Wailin\' Jennys'),
(69, 'Three Decades Of Males'),
(70, 'Varios'),
(71, 'Wai.Tai'),
(72, 'Wendy Matthews'),
(73, 'Wilson Philips'),
(74, 'Wolfstone'),
(75, 'Xavier Rudd');

-- --------------------------------------------------------

--
-- Table structure for table `playlists`
--

CREATE TABLE `playlists` (
  `playlist_id` smallint NOT NULL,
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `tag` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `type` tinyint(1) NOT NULL DEFAULT '3',
  `owner_id` tinyint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `playlists`
--

INSERT INTO `playlists` (`playlist_id`, `title`, `tag`, `type`, `owner_id`) VALUES
(1, '10 Years Of Hits', '', 1, NULL),
(2, 'A Hundred Miles or More', 'A Collection', 1, NULL),
(3, 'A Momentary Lapse Of Reason', '', 1, NULL),
(4, 'A Place On Earth', 'The Greatest Hits - CD 1/2', 1, NULL),
(5, 'All Things Bright And Beautiful', 'Deluxe', 1, NULL),
(6, 'American Heart', 'Single', 1, NULL),
(7, 'American Pie', '', 1, NULL),
(8, 'Aqualung', '', 1, NULL),
(9, 'At Budokan', '', 1, NULL),
(10, 'Babel', '', 1, NULL),
(11, 'Barton Hollow', '', 1, NULL),
(12, 'Big Jet Plane', '[EP]', 1, NULL),
(13, 'Bright Morning Stars', '', 1, NULL),
(14, 'Bring Me Home', '', 1, NULL),
(15, 'California', '', 1, NULL),
(16, 'Celtica 1', '', 1, NULL),
(17, 'Ceremonial and war dances', '', 1, NULL),
(18, 'CMT Crossroads', '', 1, NULL),
(19, 'Continued Silence', '[EP]', 1, NULL),
(20, 'Dixie Chicks', '', 1, NULL),
(21, 'Drunken Lullabies', '', 1, NULL),
(22, 'Earl Klugh', '', 1, NULL),
(23, 'Early Alchemy', '', 1, NULL),
(24, 'Electric Music For The Mind And Body', '', 1, NULL),
(25, 'Extended Play', '', 1, NULL),
(26, 'Fallen', '', 1, NULL),
(27, 'Fields of Fire', '', 1, NULL),
(28, 'Finally We Are No One', '', 1, NULL),
(29, 'Five Minutes With Arctic Monkeys', '', 1, NULL),
(30, 'Flying Cowboys', '', 1, NULL),
(31, 'Food In The Belly', '', 1, NULL),
(32, 'Footrot Flats', 'A Dog\'s Tale', 1, NULL),
(33, 'From Detroit to St. Germain', '', 1, NULL),
(34, 'Fundamental', '', 1, NULL),
(35, 'Gale Force', '', 1, NULL),
(36, 'Greatest Hits', '', 1, NULL),
(37, 'His Young Heart', '', 1, NULL),
(38, 'Hoea', '', 1, NULL),
(39, 'I Hope You Dance', '', 1, NULL),
(40, 'I\'m in the Mood for Dancing', '', 1, NULL),
(41, 'Lights of the Pacific', 'The Very Best Of', 1, NULL),
(42, 'Lily', '', 1, NULL),
(43, 'Listen', 'The Very Best of Herbs', 1, NULL),
(44, 'Live In Texas', '7-Jun-06', 1, NULL),
(45, 'Live!', 'Not Enough Shouting!', 1, NULL),
(46, 'Love This Giant', '', 1, NULL),
(47, 'Metals', '', 1, NULL),
(48, 'Music for Lovers', '', 1, NULL),
(49, 'Oceania', '', 1, NULL),
(50, 'One More from the Road', '[MG]', 1, NULL),
(51, 'Primitive Man', 'Bonus Tracks', 1, NULL),
(52, 'Running on Empty', '', 1, NULL),
(53, 'Sarah Slean', '', 1, NULL),
(54, 'Say You Will', '', 1, NULL),
(55, 'Shamrock Diaries', '', 1, NULL),
(56, 'Shona Laing', '', 1, NULL),
(57, 'Slow Train Coming', '', 1, NULL),
(58, 'Smilewound', '', 1, NULL),
(59, 'Songs from the Front Lawn', '', 1, NULL),
(60, 'Soul Divas', '', 1, NULL),
(61, 'Spanish Train & Other Stories', '', 1, NULL),
(62, 'Strange Mercy', '', 1, NULL),
(63, 'The Best of Ario Guthrie', '', 1, NULL),
(64, 'The Best of Joe Cocker', 'Mushroom', 1, NULL),
(65, 'The Best of Nancy Wilson', '', 1, NULL),
(66, 'The Collection', '', 1, NULL),
(67, 'The Cross of Changes', '', 1, NULL),
(68, 'The Deginitive Collection', '', 1, NULL),
(69, 'The Division Bell', '', 1, NULL),
(70, 'Three Decades Of Males', '', 1, NULL),
(71, 'Til We Outnumber \'Em', 'Woody Guthrie', 1, NULL),
(72, 'To Love Somebody', '1969', 1, NULL),
(73, 'Here Comes the Sun', '1971', 1, NULL),
(74, 'Under The Covers', '', 1, NULL),
(75, 'Walk Like An Egyption', 'The Best Of', 1, NULL),
(76, 'Watermark', '', 1, NULL),
(77, 'Zombie', 'UK Single', 1, NULL),
(78, 'Acoustic', '', 2, NULL),
(79, 'Alternative', '', 2, NULL),
(80, 'Rock', '', 2, NULL),
(81, 'Post-Grunge', '', 2, NULL),
(82, 'Metal', '', 2, NULL),
(83, 'Nu-Metal', '', 2, NULL),
(84, 'Gothic', '', 2, NULL),
(85, 'Avante-Garde', '', 2, NULL),
(86, 'Bluegrass', '', 2, NULL),
(87, 'Blues', '', 2, NULL),
(88, 'Celtic', '', 2, NULL),
(89, 'Country', '', 2, NULL),
(90, 'Dance', '', 2, NULL),
(91, 'Easy Listening - Female', '', 2, NULL),
(92, 'Easy Listening - Male', '', 2, NULL),
(93, 'Easy Listening - Group', '', 2, NULL),
(94, 'Folk', '', 2, NULL),
(95, 'Cont', '', 2, NULL),
(96, 'Goa', '', 2, NULL),
(97, 'Indie', '', 2, NULL),
(98, 'Brit', '', 2, NULL),
(99, 'Pop', '', 2, NULL),
(100, 'Jazz', '', 2, NULL),
(101, 'Maori', '', 2, NULL),
(102, 'Ethnic', '', 2, NULL),
(103, 'New Age', '', 2, NULL),
(104, 'Mellow', '', 2, NULL),
(105, 'Native American', '', 2, NULL),
(106, 'New Wave', '', 2, NULL),
(107, 'Post-Rock', '', 2, NULL),
(108, 'Progressive Rock', '', 2, NULL),
(109, 'Psychdelic', '', 2, NULL),
(110, 'R&B', '', 2, NULL),
(111, 'Reggae', '', 2, NULL),
(112, 'Soul', '', 2, NULL),
(113, 'US Folk', '', 2, NULL),
(114, 'Vocal', '', 2, NULL),
(115, 'Woman', '', 2, NULL),
(116, 'World', '', 2, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tracks`
--

CREATE TABLE `tracks` (
  `track_id` smallint NOT NULL,
  `filename` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `title` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `duration` smallint NOT NULL,
  `size` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `tracks`
--

INSERT INTO `tracks` (`track_id`, `filename`, `title`, `duration`, `size`) VALUES
(1, '2-30.mp3', 'Listen', 60, 1446),
(2, 'The Traveller.mp3', 'The Traveller', 206, 5677),
(3, 'Sarah Victoria.mp3', 'Sarah Victoria', 114, 3692),
(4, 'Waiting For You.mp3', 'Waiting For You', 204, 6488),
(5, 'Simple Love [#].mp3', 'Simple Love', 284, 4444),
(6, 'You\'re Just a Country Boy [#].mp3', 'You\'re Just a Country Boy', 208, 3258),
(7, 'Big Jet Plane (Radio Edit).mp3', 'Big Jet Plane - Radio Edit', 223, 8776),
(8, 'Fake Tales Of San Francisco.mp3', 'Fake Tales Of San Fansisco', 181, 7271),
(9, 'You Probably Couldn\'t See For The Lights, But You Were Staring Straight At Me.mp3', 'You Probably Couldn\'t See For The Lights, But You Were Staring Straight At Me', 142, 5771),
(10, 'Alice\'s Restaurant Massacree.mp3', 'Alice\'s Restaurant Massacree', 1111, 34731),
(11, 'Hard Travelin\' Hootenanny.mp3', 'Hard Travelin\' Hootenanny', 210, 6588),
(12, 'Til We Outnumber \'Em (This Land Is You Land).mp3', 'Til We Outnumber \'Em - This Land Is You Land', 157, 4929),
(14, 'Got The Love - 2009.mp3', 'Got The Love', 227, 8874),
(15, 'How Sweet Can You Get - 2009.mp3', 'How Sweet Can You Get', 238, 9330),
(16, 'Leave a Light On.mp3', 'Leave a Light On', 256, 4006),
(17, 'Little Black Book.mp3', 'Little Black Book', 252, 3951),
(18, 'Mary.mp3', 'Mary', 233, 9109),
(19, 'Eagle Plume Dancer.mp3', 'Eagle Plume Dancer', 145, 2269),
(20, 'Don\'t Think Twice, It\'s All Right.mp3', 'Don\'t Think Twice, It\'s All Right', 301, 11766),
(21, 'Slow Train.mp3', 'The Times They Are A-Changin\'', 328, 12854),
(22, 'The Times They Are A-Changin\'.mp3', 'Slow Train', 359, 14107),
(23, 'Spanish Train.mp3', 'Spanish Train', 302, 11841),
(24, 'One Golden Rule.mp3', 'One Golden Rule', 270, 10569),
(25, 'Marijuana.mp3', 'Marijuana', 152, 3575),
(26, 'The Woods.mp3', 'The Woods', 220, 8959),
(27, 'Slice of Heaven.mp3', 'Slice of Heaven', 277, 4347),
(28, 'The Forest Awakes.mp3', 'The Forest Awakes', 292, 11442),
(29, 'You Were Mine.mp3', 'American Pie', 512, 20045),
(30, 'Shower the People.mp3', 'Brazilian Stomp', 339, 10605),
(31, 'Sweet Baby James.mp3', 'Silent Warrior', 369, 11546),
(32, 'American Pie.mp3', 'River', 192, 7553),
(33, 'Brazilian Stomp.mp3', 'Everybody\'s Fool', 197, 7893),
(34, 'Silent Warrior.mp3', 'American Heart', 230, 9069),
(35, 'River.mp3', 'A Commotion', 233, 6904),
(36, 'Everybody\'s Fool.mp3', 'Steal Your Heart Away', 213, 5011),
(37, 'American Heart.mp3', 'If I Ever Leave This World Alive', 201, 4722),
(38, 'A Commotion.mp3', 'Maggie', 221, 6914),
(39, 'Steal Your Heart Away.mp3', 'Hallelujah', 211, 8263),
(40, 'If I Ever Leave This World Alive.mp3', 'French Letter', 276, 8646),
(41, 'Maggie.mp3', 'Parihaka', 256, 8028),
(42, 'Hallelujah.mp3', 'Slice of Heaven', 277, 8667),
(43, 'French Letter.mp3', 'Great Southern Land', 319, 12468),
(44, 'Parihaka.mp3', 'Radioactive', 188, 7414),
(45, 'Slice of Heaven.mp3', 'Stay', 204, 7990),
(46, 'Great Southern Land.mp3', 'Shower the People', 241, 9426),
(47, 'Radioactive.mp3', 'Sweet Baby James', 174, 6818),
(48, 'Stay.mp3', 'Shower the People', 123, 2906),
(49, 'Shower the People.mp3', 'Sweet Baby James', 205, 4015),
(50, 'Sweet Baby James.mp3', 'Aqualung', 397, 11596),
(51, 'Aqualung.mp3', 'Unchain My Heart - 90\'s Version', 306, 11972),
(52, 'Unchain My Heart [90\'s Version].mp3', 'Ashes By Now', 252, 9880),
(53, 'Ashes By Now.mp3', 'Ashes By Now', 251, 9851),
(54, 'Ashes By Now.mp3', 'Free Bird Live - Fox Theater', 816, 25506),
(55, 'Free Bird Live [Fox Theater].mp3', 'We can let it happen tonight', 250, 9784),
(56, 'We can let it happen tonight.mp3', 'All The Young Dudes - David Bowie', 232, 9081),
(57, 'All The Young Dudes.mp3', 'Bring Me Home', 365, 11428),
(58, 'Bring Me Home.mp3', 'I\'ll Be Long Gone', 356, 11141),
(59, 'I\'ll Be Long Gone.mp3', 'Now There\'s That Fear Again', 236, 5550),
(60, 'Now There\'s That Fear Again.mp3', 'When Girls Collide', 300, 11870),
(61, 'When Girls Collide.mp3', 'Hopeless Wanderer', 307, 10236),
(62, 'Hopeless Wanderer.mp3', 'Like Someone In Love', 142, 3368),
(63, 'Like someone in love.mp3', 'Turn! Turn! Turn!', 221, 3463),
(64, 'Turn! Turn! Turn!.mp3', 'Hineraukatauri - Goddess of Music', 294, 9222),
(65, 'Hineraukatauri (Goddess of Music).mp3', 'Alligator Sky', 195, 6176),
(66, 'Alligator Sky.mp3', 'The Sodom And Gomorrah Show', 319, 7496),
(67, 'The Sodom And Gomorrah Show.mp3', 'One Slip', 308, 10086),
(68, 'Marooned.mp3', 'Marooned', 329, 10384),
(69, 'One Slip.mp3', 'The Horses', 292, 9158),
(70, 'The Horses.mp3', 'Lost For Words', 228, 5366),
(71, 'Lost for Words.mp3', 'Mary', 244, 3818),
(72, 'Mary.mp3', 'Stay', 162, 2551),
(73, 'Stay.mp3', 'Hey', 262, 4101),
(74, 'fear.mp3', 'Fire', 206, 6465),
(75, 'Fire.mp3', 'Alabama Blues', 439, 6865),
(76, 'Alabama Blues.mp3', 'How do you plead', 400, 6251),
(77, 'How do you plead.mp3', 'Northern Lights', 213, 8359),
(78, 'Northern Lights.mp3', 'Boogie On Reggae Woman', 314, 10894),
(79, 'Boogie On Reggae Woman.mp3', 'Tell me', 135, 2884),
(80, 'Tell me.mp3', 'C\'est La Mort', 149, 4094),
(81, 'C\'est La Mort.mp3', 'Zombie', 252, 9874),
(82, 'Zombie.mp3', 'You Were Mine', 217, 3409),
(83, 'When You Come Back Home.mp3', 'When You Come Back Home', 217, 3408),
(84, 'I\'m in the Mood for Dancing.mp3', 'I\'m in the Mood for Dancing', 179, 5601),
(85, 'Bird Song.mp3', 'Bird Song', 213, 3338),
(86, 'Slice Of Heaven.mp3', 'Slice of Heaven', 248, 9693),
(87, 'Fields of Gold.mp3', 'Fields of Gold', 214, 8382),
(88, 'Earth And Sky.mp3', 'Earth & Sky', 208, 5984),
(89, 'He Aha Ra Te Manu.mp3', 'He Aha Ra Te Manu', 143, 4444),
(90, 'Fridays Child.mp3', 'Friday\'s Child', 243, 7608),
(91, 'Turn! Turn! Turn! (To Everything There Is A Season).mp3', 'Turn! Turn! Turn! - To Everything There Is A Season', 160, 5025),
(92, 'Maggie.mp3', 'Maggie', 287, 7862),
(93, 'Fortune Teller.mp3', 'Fortune Teller', 207, 4866),
(94, 'Messages.mp3', 'Messages', 242, 5686),
(95, 'The Mother.mp3', 'The Mother', 195, 4594);

-- --------------------------------------------------------

--
-- Table structure for table `track_to_artist`
--

CREATE TABLE `track_to_artist` (
  `track_id` smallint NOT NULL,
  `artist_id` smallint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `track_to_artist`
--

INSERT INTO `track_to_artist` (`track_id`, `artist_id`) VALUES
(3, 1),
(4, 1),
(18, 2),
(28, 2),
(71, 3),
(72, 3),
(32, 4),
(7, 5),
(81, 6),
(33, 6),
(83, 7),
(5, 7),
(6, 7),
(69, 8),
(36, 8),
(24, 9),
(38, 9),
(73, 10),
(34, 11),
(48, 12),
(49, 12),
(82, 12),
(52, 13),
(53, 14),
(70, 15),
(25, 16),
(66, 17),
(16, 18),
(27, 19),
(17, 20),
(28, 21),
(84, 22),
(29, 23),
(23, 24),
(86, 25),
(85, 26),
(35, 27),
(10, 28),
(11, 29),
(12, 30),
(20, 31),
(21, 32),
(61, 19),
(22, 19),
(75, 19),
(76, 33),
(26, 34),
(60, 35),
(44, 36),
(77, 36),
(8, 36),
(48, 37),
(9, 36),
(49, 37),
(30, 38),
(55, 39),
(63, 40),
(88, 40),
(93, 41),
(94, 42),
(95, 44),
(56, 45),
(89, 46),
(19, 46),
(58, 47),
(31, 47),
(1, 48),
(2, 49),
(65, 50),
(91, 51),
(27, 52),
(79, 53),
(59, 54),
(67, 54),
(68, 55),
(25, 56),
(78, 57),
(40, 57),
(41, 58),
(42, 59),
(50, 60),
(57, 60),
(46, 61),
(47, 62),
(54, 63),
(43, 64),
(45, 65),
(51, 37),
(56, 66),
(87, 67),
(37, 68),
(92, 69),
(74, 70),
(14, 71),
(15, 71),
(80, 72),
(7, 73),
(62, 74),
(90, 75),
(39, 75),
(64, 75);

-- --------------------------------------------------------

--
-- Table structure for table `track_to_playlist`
--

CREATE TABLE `track_to_playlist` (
  `track_id` smallint NOT NULL,
  `playlist_id` smallint NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `track_to_playlist`
--

INSERT INTO `track_to_playlist` (`track_id`, `playlist_id`) VALUES
(70, 1),
(5, 2),
(6, 2),
(67, 3),
(16, 4),
(17, 4),
(65, 5),
(34, 6),
(29, 7),
(50, 8),
(20, 9),
(21, 9),
(61, 10),
(80, 11),
(7, 12),
(85, 13),
(57, 14),
(58, 14),
(91, 15),
(87, 16),
(19, 17),
(48, 18),
(49, 18),
(44, 19),
(82, 20),
(37, 21),
(30, 22),
(3, 23),
(4, 23),
(25, 24),
(39, 25),
(33, 26),
(18, 27),
(59, 28),
(8, 29),
(69, 30),
(93, 31),
(94, 31),
(95, 31),
(27, 32),
(75, 33),
(76, 33),
(66, 34),
(38, 35),
(46, 36),
(47, 36),
(52, 36),
(26, 37),
(88, 38),
(89, 38),
(53, 39),
(84, 40),
(40, 41),
(41, 41),
(90, 42),
(1, 43),
(2, 43),
(42, 43),
(9, 44),
(92, 45),
(28, 46),
(35, 47),
(55, 48),
(64, 49),
(54, 50),
(43, 51),
(45, 52),
(71, 53),
(72, 53),
(36, 54),
(24, 55),
(73, 56),
(22, 57),
(60, 58),
(83, 59),
(74, 60),
(23, 60),
(77, 62),
(10, 63),
(51, 64),
(62, 65),
(14, 66),
(15, 66),
(31, 67),
(78, 68),
(68, 69),
(86, 70),
(11, 71),
(12, 71),
(63, 72),
(63, 73),
(56, 74),
(79, 75),
(32, 76),
(81, 77),
(3, 78),
(4, 78),
(18, 79),
(28, 79),
(71, 79),
(72, 79),
(32, 79),
(81, 79),
(81, 80),
(81, 81),
(33, 79),
(33, 82),
(33, 83),
(33, 84),
(33, 80),
(83, 85),
(5, 86),
(6, 86),
(69, 86),
(36, 86),
(24, 86),
(38, 88),
(73, 88),
(34, 89),
(48, 89),
(49, 89),
(82, 89),
(52, 89),
(53, 89),
(70, 90),
(66, 90),
(16, 91),
(17, 91),
(84, 93),
(29, 92),
(23, 92),
(86, 92),
(85, 94),
(35, 94),
(10, 94),
(11, 94),
(12, 94),
(20, 94),
(20, 95),
(21, 94),
(21, 95),
(61, 94),
(61, 80),
(22, 94),
(22, 80),
(75, 96),
(76, 96),
(26, 97),
(60, 97),
(44, 80),
(44, 97),
(77, 80),
(77, 97),
(8, 97),
(8, 80),
(8, 98),
(8, 99),
(9, 97),
(9, 80),
(9, 98),
(9, 99),
(30, 100),
(55, 100),
(63, 100),
(88, 101),
(88, 102),
(88, 103),
(93, 104),
(94, 104),
(95, 104),
(89, 101),
(89, 102),
(89, 103),
(19, 105),
(19, 102),
(58, 103),
(31, 103),
(1, 106),
(2, 106),
(65, 99),
(91, 99),
(27, 99),
(79, 99),
(59, 107),
(67, 108),
(68, 108),
(25, 109),
(78, 110),
(40, 111),
(41, 111),
(42, 111),
(50, 80),
(57, 80),
(46, 80),
(47, 80),
(54, 80),
(43, 80),
(45, 80),
(51, 80),
(56, 80),
(87, 80),
(87, 88),
(37, 80),
(37, 88),
(92, 80),
(92, 88),
(74, 112),
(14, 112),
(15, 112),
(80, 113),
(7, 113),
(62, 114),
(90, 115),
(39, 116),
(64, 116);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` tinyint NOT NULL,
  `username` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `artists`
--
ALTER TABLE `artists`
  ADD PRIMARY KEY (`artist_id`);

--
-- Indexes for table `playlists`
--
ALTER TABLE `playlists`
  ADD PRIMARY KEY (`playlist_id`),
  ADD KEY `owner_id` (`owner_id`);

--
-- Indexes for table `tracks`
--
ALTER TABLE `tracks`
  ADD PRIMARY KEY (`track_id`);

--
-- Indexes for table `track_to_artist`
--
ALTER TABLE `track_to_artist`
  ADD KEY `track_id` (`track_id`),
  ADD KEY `artist_id` (`artist_id`);

--
-- Indexes for table `track_to_playlist`
--
ALTER TABLE `track_to_playlist`
  ADD KEY `ack_id` (`track_id`),
  ADD KEY `playlist_id` (`playlist_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `artists`
--
ALTER TABLE `artists`
  MODIFY `artist_id` smallint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=76;

--
-- AUTO_INCREMENT for table `playlists`
--
ALTER TABLE `playlists`
  MODIFY `playlist_id` smallint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=117;

--
-- AUTO_INCREMENT for table `tracks`
--
ALTER TABLE `tracks`
  MODIFY `track_id` smallint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=96;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` tinyint NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `playlists`
--
ALTER TABLE `playlists`
  ADD CONSTRAINT `playlists_ibfk_1` FOREIGN KEY (`owner_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `track_to_artist`
--
ALTER TABLE `track_to_artist`
  ADD CONSTRAINT `track_to_artist_ibfk_1` FOREIGN KEY (`track_id`) REFERENCES `tracks` (`track_id`),
  ADD CONSTRAINT `track_to_artist_ibfk_2` FOREIGN KEY (`artist_id`) REFERENCES `artists` (`artist_id`);

--
-- Constraints for table `track_to_playlist`
--
ALTER TABLE `track_to_playlist`
  ADD CONSTRAINT `track_to_playlist_ibfk_1` FOREIGN KEY (`track_id`) REFERENCES `tracks` (`track_id`),
  ADD CONSTRAINT `track_to_playlist_ibfk_2` FOREIGN KEY (`playlist_id`) REFERENCES `playlists` (`playlist_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
