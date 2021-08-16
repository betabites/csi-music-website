-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Aug 15, 2021 at 07:22 AM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
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
                           `artist_id` smallint(6) NOT NULL,
                           `artist_name` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
(75, 'Xavier Rudd'),
(76, 'As Good As It Gets');

-- --------------------------------------------------------

--
-- Table structure for table `playlists`
--

CREATE TABLE `playlists` (
  `playlist_id` smallint(6) NOT NULL,
  `title` varchar(50) NOT NULL,
  `tag` varchar(50) DEFAULT NULL,
  `type` tinyint(1) NOT NULL DEFAULT 3,
  `owner_id` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `playlists`
--

INSERT INTO `playlists` (`playlist_id`, `title`, `tag`, `type`, `owner_id`) VALUES
(1, '10 Years Of Hits', '', 1, 2),
(2, 'A Hundred Miles or More', 'A Collection', 1, 2),
(3, 'A Momentary Lapse Of Reason', '', 1, 2),
(4, 'A Place On Earth', 'The Greatest Hits - CD 1/2', 1, 2),
(5, 'All Things Bright And Beautiful', 'Deluxe', 1, 2),
(6, 'American Heart', 'Single', 1, 2),
(7, 'American Pie', '', 1, 2),
(8, 'Aqualung', '', 1, 2),
(9, 'At Budokan', '', 1, 2),
(10, 'Babel', '', 1, 2),
(11, 'Barton Hollow', '', 1, 2),
(12, 'Big Jet Plane', '[EP]', 1, 2),
(13, 'Bright Morning Stars', '', 1, 2),
(14, 'Bring Me Home', '', 1, 2),
(15, 'California', '', 1, 2),
(16, 'Celtica 1', '', 1, 2),
(17, 'Ceremonial and war dances', '', 1, 2),
(18, 'CMT Crossroads', '', 1, 2),
(19, 'Continued Silence', '[EP]', 1, 2),
(20, 'Dixie Chicks', '', 1, 2),
(21, 'Drunken Lullabies', '', 1, 2),
(22, 'Earl Klugh', '', 1, 2),
(23, 'Early Alchemy', '', 1, 2),
(24, 'Electric Music For The Mind And Body', '', 1, 2),
(25, 'Extended Play', '', 1, 2),
(26, 'Fallen', '', 1, 2),
(27, 'Fields of Fire', '', 1, 2),
(28, 'Finally We Are No One', '', 1, 2),
(29, 'Five Minutes With Arctic Monkeys', '', 1, 2),
(30, 'Flying Cowboys', '', 1, 2),
(31, 'Food In The Belly', '', 1, 2),
(32, 'Footrot Flats', 'A Dog\'s Tale', 1, 2),
                                                       (33, 'From Detroit to St. Germain', '', 1, 2),
                                                       (34, 'Fundamental', '', 1, 2),
                                                       (35, 'Gale Force', '', 1, 2),
                                                       (36, 'Greatest Hits', '', 1, 2),
                                                       (37, 'His Young Heart', '', 1, 2),
                                                       (38, 'Hoea', '', 1, 2),
                                                       (39, 'I Hope You Dance', '', 1, 2),
                                                       (40, 'I\'m in the Mood for Dancing', '', 1, 2),
(41, 'Lights of the Pacific', 'The Very Best Of', 1, 2),
(42, 'Lily', '', 1, 2),
(43, 'Listen', 'The Very Best of Herbs', 1, 2),
(44, 'Live In Texas', '7-Jun-06', 1, 2),
(45, 'Live!', 'Not Enough Shouting!', 1, 2),
(46, 'Love This Giant', '', 1, 2),
(47, 'Metals', '', 1, 2),
(48, 'Music for Lovers', '', 1, 2),
(49, 'Oceania', '', 1, 2),
(50, 'One More from the Road', '[MG]', 1, 2),
(51, 'Primitive Man', 'Bonus Tracks', 1, 2),
(52, 'Running on Empty', '', 1, 2),
(53, 'Sarah Slean', '', 1, 2),
(54, 'Say You Will', '', 1, 2),
(55, 'Shamrock Diaries', '', 1, 2),
(56, 'Shona Laing', '', 1, 2),
(57, 'Slow Train Coming', '', 1, 2),
(58, 'Smilewound', '', 1, 2),
(59, 'Songs from the Front Lawn', '', 1, 2),
(60, 'Soul Divas', '', 1, 2),
(61, 'Spanish Train & Other Stories', '', 1, 2),
(62, 'Strange Mercy', '', 1, 2),
(63, 'The Best of Ario Guthrie', '', 1, 2),
(64, 'The Best of Joe Cocker', 'Mushroom', 1, 2),
(65, 'The Best of Nancy Wilson', '', 1, 2),
(66, 'The Collection', '', 1, 2),
(67, 'The Cross of Changes', '', 1, 2),
(68, 'The Definitive Collection', '', 1, 2),
(69, 'The Division Bell', '', 1, 2),
(70, 'Three Decades Of Males', '', 1, 2),
(71, 'Til We Outnumber \'Em', 'Woody Guthrie', 1, 2),
                                                       (72, 'To Love Somebody', '1969', 1, 2),
                                                       (73, 'Here Comes the Sun', '1971', 1, 2),
                                                       (74, 'Under The Covers', '', 1, 2),
                                                       (75, 'Walk Like An Egyption', 'The Best Of', 1, 2),
                                                       (76, 'Watermark', '', 1, 2),
                                                       (77, 'Zombie', 'UK Single', 1, 2),
                                                       (78, 'Acoustic', '', 2, 2),
                                                       (79, 'Alternative', '', 2, 2),
                                                       (80, 'Rock', '', 2, 2),
                                                       (81, 'Post-Grunge', '', 2, 2),
                                                       (82, 'Metal', '', 2, 2),
                                                       (83, 'Nu-Metal', '', 2, 2),
                                                       (84, 'Gothic', '', 2, 2),
                                                       (85, 'Avante-Garde', '', 2, 2),
                                                       (86, 'Bluegrass', '', 2, 2),
                                                       (87, 'Blues', '', 2, 2),
                                                       (88, 'Celtic', '', 2, 2),
                                                       (89, 'Country', '', 2, 2),
                                                       (90, 'Dance', '', 2, 2),
                                                       (91, 'Easy Listening - Female', '', 2, 2),
                                                       (92, 'Easy Listening - Male', '', 2, 2),
                                                       (93, 'Easy Listening - Group', '', 2, 2),
                                                       (94, 'Folk', '', 2, 2),
                                                       (95, 'Cont', '', 2, 2),
                                                       (96, 'Goa', '', 2, 2),
                                                       (97, 'Indie', '', 2, 2),
                                                       (98, 'Brit', '', 2, 2),
                                                       (99, 'Pop', '', 2, 2),
                                                       (100, 'Jazz', '', 2, 2),
                                                       (101, 'Maori', '', 2, 2),
                                                       (102, 'Ethnic', '', 2, 2),
                                                       (103, 'New Age', '', 2, 2),
                                                       (104, 'Mellow', '', 2, 2),
                                                       (105, 'Native American', '', 2, 2),
                                                       (106, 'New Wave', '', 2, 2),
                                                       (107, 'Post-Rock', '', 2, 2),
                                                       (108, 'Progressive Rock', '', 2, 2),
                                                       (109, 'Psychdelic', '', 2, 2),
                                                       (110, 'R&B', '', 2, 2),
                                                       (111, 'Reggae', '', 2, 2),
                                                       (112, 'Soul', '', 2, 2),
                                                       (113, 'US Folk', '', 2, 2),
                                                       (114, 'Vocal', '', 2, 2),
                                                       (115, 'Woman', '', 2, 2),
                                                       (116, 'World', '', 2, 2),
                                                       (117, 'As Good As It Gets', '', 1, 2),
                                                       (118, 'UK', '', 2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `tracks`
--

CREATE TABLE `tracks` (
                          `track_id` smallint(6) NOT NULL,
                          `filename` varchar(100) NOT NULL,
                          `title` varchar(100) NOT NULL,
                          `duration` smallint(6) NOT NULL,
                          `size` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tracks`
--

INSERT INTO `tracks` (`track_id`, `filename`, `title`, `duration`, `size`) VALUES
                                                                               (1, 'A Commotion.mp3', 'A Commotion', 233, 6904),
                                                                               (2, 'Alabama Blues.mp3', 'Alabama Blues', 439, 6865),
                                                                               (3, 'Alice\'s Restaurant Massacree.mp3', 'Alice\'s Restaurant Massacre', 1111, 34731),
                                                                               (4, 'All The Young Dudes.mp3', 'All The Young Dudes (David Bowie)', 232, 9081),
                                                                               (5, 'Alligator Sky.mp3', 'Alligator Sky', 195, 6176),
                                                                               (6, 'American Heart.mp3', 'American Heart', 230, 9069),
                                                                               (7, 'American Pie.mp3', 'American Pie', 512, 20045),
                                                                               (8, 'Aqualung.mp3', 'Aqualung', 397, 11596),
                                                                               (9, 'Ashes By Now.mp3', 'Ashes By Now', 251, 9851),
                                                                               (10, 'Ashes By Now.mp3', 'Ashes By Now', 252, 9880),
                                                                               (11, 'Big Jet Plane (Radio Edit).mp3', 'Big Jet Plane (Radio Edit)', 223, 8776),
                                                                               (12, 'Bird Song.mp3', 'Bird Song', 213, 3338),
                                                                               (13, 'Boogie On Reggae Woman.mp3', 'Boogie On Reggae Woman', 314, 10894),
                                                                               (14, 'Brazilian Stomp.mp3', 'Brazilian Stomp', 339, 10605),
                                                                               (15, 'Bring Me Home.mp3', 'Bring Me Home', 365, 11428),
                                                                               (16, 'C\'est La Mort.mp3', 'C\'est La Mort', 149, 4094),
                                                                               (17, 'Chicken on a Raft.mp3', 'Chicken on a Raft', 210, 6583),
                                                                               (18, 'Don\'t Think Twice, It\'s All Right.mp3', 'Don\'t Think Twice, It\'s All Right', 301, 11766),
                                                                               (19, 'Eagle Plume Dancer.mp3', 'Eagle Plume Dancer', 145, 2269),
                                                                               (20, 'Earth And Sky.mp3', 'Earth & Sky', 208, 5984),
                                                                               (21, 'Everybody\'s Fool.mp3', 'Everybody\'s Fool', 197, 7893),
                                                                               (22, 'Fake Tales Of San Francisco.mp3', 'Fake Tales Of San Francisco', 181, 7271),
                                                                               (23, 'Fields of Gold.mp3', 'Fields of Gold', 214, 8382),
                                                                               (24, 'Fire.mp3', 'Fire', 206, 6465),
                                                                               (25, 'Fortune Teller.mp3', 'Fortune Teller', 207, 4866),
                                                                               (26, 'Free Bird Live [Fox Theater].mp3', 'Free Bird Live [Fox Theatre]', 816, 25506),
                                                                               (27, 'French Letter.mp3', 'French Letter', 276, 8646),
                                                                               (28, 'Got The Love - 2009.mp3', 'Got The Love', 227, 8874),
                                                                               (29, 'Great Southern Land.mp3', 'Great Southern Land', 319, 12468),
                                                                               (30, 'Hallelujah.mp3', 'Hallelujah', 211, 8263),
                                                                               (31, 'Hard Travelin\' Hootenanny.mp3', 'Hard Travelin\' Hootenanny', 210, 6588),
                                                                               (32, 'He Aha Ra Te Manu.mp3', 'He Aha Ra Te Manu', 143, 4444),
                                                                               (33, 'fear.mp3', 'Hey', 262, 4101),
                                                                               (34, 'Hineraukatauri (Goddess of Music).mp3', 'Hineraukatauri (Goddess of Music)', 294, 9222),
                                                                               (35, 'Hopeless Wanderer.mp3', 'Hopeless Wanderer', 307, 10236),
                                                                               (36, 'How do you plead.mp3', 'How do you plead', 400, 6251),
                                                                               (37, 'How Sweet Can You Get - 2009.mp3', 'How Sweet Can You Get', 238, 9330),
                                                                               (38, 'If I Ever Leave This World Alive.mp3', 'If I Ever Leave This World Alive', 201, 4722),
                                                                               (39, 'I\'ll Be Long Gone.mp3', 'I\'ll Be Long Gone', 356, 11141),
                                                                               (40, 'I\'m in the Mood for Dancing.mp3', 'I\'m in the Mood for Dancing', 179, 5601),
                                                                               (41, 'Leave a Light On.mp3', 'Leave a Light On', 256, 4006),
                                                                               (42, 'Like someone in love.mp3', 'Like Someone In Love', 142, 3368),
                                                                               (43, '2-30.mp3', 'Listen', 60, 1446),
                                                                               (44, 'Little Black Book.mp3', 'Little Black Book', 252, 3951),
                                                                               (45, 'Lost for Words.mp3', 'Lost For Words', 228, 5366),
                                                                               (46, 'Maggie.mp3', 'Maggie', 221, 6914),
                                                                               (47, 'Maggie.mp3', 'Maggie', 287, 7862),
                                                                               (48, 'Marijuana.mp3', 'Marijuana', 152, 3575),
                                                                               (49, 'Marooned.mp3', 'Marooned', 329, 10384),
                                                                               (50, 'Mary.mp3', 'Mary', 233, 9109),
                                                                               (51, 'Mary.mp3', 'Mary', 244, 3818),
                                                                               (52, 'Messages.mp3', 'Messages', 242, 5686),
                                                                               (53, 'Northern Lights.mp3', 'Northern Lights', 213, 8359),
                                                                               (54, 'Now There\'s That Fear Again.mp3', 'Now There\'s That Fear Again', 236, 5550),
                                                                               (55, 'One Golden Rule.mp3', 'One Golden Rule', 270, 10569),
                                                                               (56, 'One Slip.mp3', 'One Slip', 308, 10086),
                                                                               (57, 'Parihaka.mp3', 'Parihaka', 256, 8028),
                                                                               (58, 'Radioactive.mp3', 'Radioactive', 188, 7414),
                                                                               (59, 'River.mp3', 'River', 192, 7553),
                                                                               (60, 'Stay.mp3', 'Sarah Slean', 162, 2551),
                                                                               (61, 'Sarah Victoria.mp3', 'Sarah Victoria', 114, 3692),
                                                                               (62, 'Shower the People.mp3', 'Shower the People', 123, 2906),
                                                                               (63, 'Shower the People.mp3', 'Shower the People', 241, 9426),
                                                                               (64, 'Silent Warrior.mp3', 'Silent Warrior', 369, 11546),
                                                                               (65, 'Simple Love [#].mp3', 'Simple Love [#]', 284, 4444),
                                                                               (66, 'Slice Of Heaven.mp3', 'slice of heaven', 248, 9693),
                                                                               (67, 'Slice of Heaven.mp3', 'Slice of Heaven', 277, 4347),
                                                                               (68, 'Slice of Heaven.mp3', 'Slice of Heaven', 277, 8667),
                                                                               (69, 'Slow Train.mp3', 'Slow Train', 359, 14107),
                                                                               (70, 'Spanish Train.mp3', 'Spanish Train', 302, 11841),
                                                                               (71, 'Stay.mp3', 'Stay', 204, 7990),
                                                                               (72, 'Steal Your Heart Away.mp3', 'Steal Your Heart Away', 213, 5011),
                                                                               (73, 'Sweet Baby James.mp3', 'Sweet Baby James', 205, 4015),
                                                                               (74, 'Sweet Baby James.mp3', 'Sweet Baby James', 174, 6818),
                                                                               (75, 'Tell me.mp3', 'Tell me', 135, 2884),
                                                                               (76, 'Tell me.mp3', 'Tell me', 243, 7608),
                                                                               (77, 'The Forest Awakes.mp3', 'The Forest Awakes', 292, 11442),
                                                                               (78, 'The Horses.mp3', 'The Horses', 292, 9158),
                                                                               (79, 'The Mother.mp3', 'The Mother', 195, 4594),
                                                                               (80, 'The Sodom And Gomorrah Show.mp3', 'The Sodom And Gomorrah Show', 319, 7496),
                                                                               (81, 'The Times They Are A-Changin\'.mp3', 'The Times They Are A-Changin\'', 328, 12854),
                                                                               (82, 'The Traveller.mp3', 'The Traveller', 206, 5677),
                                                                               (83, 'The Woods.mp3', 'The Woods', 220, 8959),
                                                                               (84, 'Til We Outnumber \'Em (This Land Is You Land).mp3', 'Til We Outnumber \'Em (This Land Is You Land)', 157, 4929),
                                                                               (85, 'Turn! Turn! Turn!.mp3', 'Turn! Turn! Turn!', 221, 3463),
                                                                               (86, 'Turn! Turn! Turn! (To Everything There Is A Season).mp3', 'Turn! Turn! Turn! (To Everything There Is A Season)', 160, 5025),
                                                                               (87, 'Unchain My Heart [90\'s Version].mp3', 'Unchain My Heart [90\'s Version]', 306, 11972),
                                                                               (88, 'Waiting For You.mp3', 'Waiting For You', 204, 6488),
                                                                               (89, 'We can let it happen tonight.mp3', 'We can let it happen tonight', 250, 9784),
                                                                               (90, 'When Girls Collide.mp3', 'When Girls Collide', 300, 11870),
                                                                               (91, 'When You Come Back Home.mp3', 'When You Come Back Home', 217, 3408),
                                                                               (92, 'You Probably Couldn\'t See For The Lights, But You Were Staring Straight At Me.mp3', 'You Probably Couldn\'t See For The Lights, But You Were Staring Straight At Me', 142, 5771),
                                                                               (93, 'You Were Mine.mp3', 'You Were Mine', 217, 3409),
                                                                               (94, 'You\'re Just a Country Boy [#].mp3', 'You\'re Just a Country Boy [#]', 208, 3258),
                                                                               (95, 'Zombie.mp3', 'Zombie', 252, 9874);

-- --------------------------------------------------------

--
-- Table structure for table `track_to_artist`
--

CREATE TABLE `track_to_artist` (
                                   `track_id` smallint(6) NOT NULL,
                                   `artist_id` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `track_to_artist`
--

INSERT INTO `track_to_artist` (`track_id`, `artist_id`) VALUES
                                                            (43, 1),
                                                            (82, 1),
                                                            (61, 2),
                                                            (88, 2),
                                                            (65, 3),
                                                            (94, 3),
                                                            (11, 5),
                                                            (11, 4),
                                                            (22, 6),
                                                            (92, 6),
                                                            (3, 7),
                                                            (31, 7),
                                                            (84, 7),
                                                            (17, 76),
                                                            (28, 8),
                                                            (37, 8),
                                                            (41, 9),
                                                            (44, 9),
                                                            (50, 10),
                                                            (19, 11),
                                                            (18, 12),
                                                            (81, 12),
                                                            (69, 12),
                                                            (70, 13),
                                                            (55, 14),
                                                            (48, 16),
                                                            (48, 15),
                                                            (83, 17),
                                                            (67, 19),
                                                            (67, 18),
                                                            (77, 21),
                                                            (77, 20),
                                                            (93, 37),
                                                            (62, 36),
                                                            (62, 37),
                                                            (73, 36),
                                                            (73, 37),
                                                            (7, 22),
                                                            (14, 23),
                                                            (64, 24),
                                                            (59, 25),
                                                            (21, 26),
                                                            (6, 27),
                                                            (1, 28),
                                                            (72, 29),
                                                            (38, 30),
                                                            (46, 31),
                                                            (30, 32),
                                                            (27, 19),
                                                            (57, 19),
                                                            (68, 19),
                                                            (29, 33),
                                                            (58, 34),
                                                            (71, 35),
                                                            (63, 36),
                                                            (74, 36),
                                                            (8, 38),
                                                            (87, 39),
                                                            (9, 40),
                                                            (10, 40),
                                                            (26, 42),
                                                            (89, 43),
                                                            (4, 45),
                                                            (4, 44),
                                                            (39, 46),
                                                            (15, 46),
                                                            (90, 47),
                                                            (54, 47),
                                                            (35, 48),
                                                            (42, 49),
                                                            (85, 50),
                                                            (34, 51),
                                                            (5, 52),
                                                            (80, 53),
                                                            (49, 54),
                                                            (56, 54),
                                                            (78, 55),
                                                            (45, 56),
                                                            (51, 57),
                                                            (60, 57),
                                                            (33, 58),
                                                            (24, 59),
                                                            (2, 60),
                                                            (36, 60),
                                                            (53, 21),
                                                            (13, 62),
                                                            (75, 63),
                                                            (16, 64),
                                                            (95, 65),
                                                            (91, 66),
                                                            (40, 67),
                                                            (12, 68),
                                                            (66, 69),
                                                            (23, 70),
                                                            (20, 71),
                                                            (32, 71),
                                                            (76, 72),
                                                            (86, 73),
                                                            (47, 74),
                                                            (25, 75),
                                                            (52, 75),
                                                            (79, 75);

-- --------------------------------------------------------

--
-- Table structure for table `track_to_playlist`
--

CREATE TABLE `track_to_playlist` (
                                     `track_id` smallint(6) NOT NULL,
                                     `playlist_id` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `track_to_playlist`
--

INSERT INTO `track_to_playlist` (`track_id`, `playlist_id`) VALUES
                                                                (45, 1),
                                                                (65, 2),
                                                                (94, 2),
                                                                (56, 3),
                                                                (41, 4),
                                                                (44, 4),
                                                                (5, 5),
                                                                (6, 6),
                                                                (7, 7),
                                                                (8, 8),
                                                                (17, 117),
                                                                (18, 9),
                                                                (81, 9),
                                                                (35, 10),
                                                                (16, 11),
                                                                (11, 12),
                                                                (12, 13),
                                                                (15, 14),
                                                                (39, 14),
                                                                (86, 15),
                                                                (23, 16),
                                                                (19, 17),
                                                                (62, 18),
                                                                (73, 18),
                                                                (58, 19),
                                                                (93, 20),
                                                                (38, 21),
                                                                (14, 22),
                                                                (61, 23),
                                                                (88, 23),
                                                                (48, 24),
                                                                (30, 25),
                                                                (21, 26),
                                                                (50, 27),
                                                                (54, 28),
                                                                (22, 29),
                                                                (78, 30),
                                                                (25, 31),
                                                                (52, 31),
                                                                (79, 31),
                                                                (67, 32),
                                                                (2, 33),
                                                                (36, 33),
                                                                (80, 34),
                                                                (46, 35),
                                                                (10, 36),
                                                                (63, 36),
                                                                (74, 36),
                                                                (83, 37),
                                                                (20, 38),
                                                                (32, 38),
                                                                (9, 39),
                                                                (40, 40),
                                                                (27, 41),
                                                                (57, 41),
                                                                (76, 42),
                                                                (43, 43),
                                                                (82, 43),
                                                                (68, 43),
                                                                (92, 44),
                                                                (47, 45),
                                                                (77, 46),
                                                                (1, 47),
                                                                (89, 48),
                                                                (34, 49),
                                                                (26, 50),
                                                                (29, 51),
                                                                (71, 52),
                                                                (51, 53),
                                                                (60, 53),
                                                                (72, 54),
                                                                (55, 55),
                                                                (33, 56),
                                                                (69, 57),
                                                                (90, 58),
                                                                (91, 59),
                                                                (24, 60),
                                                                (70, 61),
                                                                (53, 62),
                                                                (3, 63),
                                                                (87, 64),
                                                                (42, 65),
                                                                (28, 66),
                                                                (37, 66),
                                                                (64, 67),
                                                                (13, 68),
                                                                (49, 69),
                                                                (66, 70),
                                                                (31, 71),
                                                                (84, 71),
                                                                (85, 72),
                                                                (4, 74),
                                                                (75, 75),
                                                                (59, 76),
                                                                (95, 77),
                                                                (85, 73),
                                                                (61, 78),
                                                                (88, 78),
                                                                (50, 79),
                                                                (51, 79),
                                                                (59, 79),
                                                                (60, 79),
                                                                (77, 79),
                                                                (95, 79),
                                                                (95, 80),
                                                                (95, 81),
                                                                (21, 79),
                                                                (21, 82),
                                                                (21, 83),
                                                                (21, 84),
                                                                (21, 80),
                                                                (91, 85),
                                                                (65, 86),
                                                                (78, 86),
                                                                (94, 86),
                                                                (55, 87),
                                                                (72, 87),
                                                                (33, 88),
                                                                (46, 88),
                                                                (6, 89),
                                                                (9, 89),
                                                                (10, 89),
                                                                (62, 89),
                                                                (73, 89),
                                                                (93, 89),
                                                                (45, 90),
                                                                (80, 90),
                                                                (41, 91),
                                                                (44, 91),
                                                                (40, 93),
                                                                (7, 92),
                                                                (66, 92),
                                                                (70, 92),
                                                                (1, 94),
                                                                (3, 94),
                                                                (12, 94),
                                                                (31, 94),
                                                                (84, 94),
                                                                (18, 94),
                                                                (18, 95),
                                                                (81, 94),
                                                                (81, 95),
                                                                (35, 94),
                                                                (35, 80),
                                                                (69, 94),
                                                                (69, 80),
                                                                (17, 94),
                                                                (17, 118),
                                                                (2, 96),
                                                                (36, 96),
                                                                (83, 97),
                                                                (90, 97),
                                                                (53, 97),
                                                                (53, 80),
                                                                (58, 97),
                                                                (58, 80),
                                                                (22, 97),
                                                                (22, 80),
                                                                (22, 98),
                                                                (22, 99),
                                                                (92, 97),
                                                                (92, 80),
                                                                (92, 98),
                                                                (92, 99),
                                                                (14, 100),
                                                                (85, 100),
                                                                (89, 100),
                                                                (20, 101),
                                                                (20, 102),
                                                                (20, 103),
                                                                (25, 104),
                                                                (52, 104),
                                                                (79, 104),
                                                                (32, 101),
                                                                (32, 102),
                                                                (32, 103),
                                                                (19, 105),
                                                                (19, 102),
                                                                (39, 103),
                                                                (64, 103),
                                                                (43, 106),
                                                                (82, 106),
                                                                (5, 99),
                                                                (67, 99),
                                                                (75, 99),
                                                                (86, 99),
                                                                (54, 107),
                                                                (49, 108),
                                                                (56, 108),
                                                                (48, 109),
                                                                (13, 110),
                                                                (27, 111),
                                                                (57, 111),
                                                                (68, 111),
                                                                (4, 80),
                                                                (8, 80),
                                                                (15, 80),
                                                                (26, 80),
                                                                (29, 80),
                                                                (63, 80),
                                                                (71, 80),
                                                                (74, 80),
                                                                (87, 80),
                                                                (23, 80),
                                                                (23, 88),
                                                                (38, 80),
                                                                (38, 88),
                                                                (47, 80),
                                                                (47, 88),
                                                                (24, 112),
                                                                (28, 112),
                                                                (37, 112),
                                                                (11, 113),
                                                                (16, 113),
                                                                (42, 114),
                                                                (76, 115),
                                                                (30, 116),
                                                                (34, 116);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
                         `user_id` tinyint(4) NOT NULL,
                         `username` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
                         `email` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
                         `password` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
                         `admin` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `username`, `email`, `password`, `admin`) VALUES
                                                                              (2, 'BetaBites', 'tech@jd-data.com', '$2y$10$GsYdeVGZUfzNSRaYsDFLoO9zYQvfE5JTJ/Lad/MkT8EKshc78qAaa', 0),
                                                                              (19, 'Graham', 'graham@gmail.com', '$2y$10$3ixidM2j7fm/eWKUH0R4DOedE82DA3xixvLOg4AmqL2EYFyRExejS', 0);

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
    MODIFY `artist_id` smallint(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=77;

--
-- AUTO_INCREMENT for table `playlists`
--
ALTER TABLE `playlists`
    MODIFY `playlist_id` smallint(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=119;

--
-- AUTO_INCREMENT for table `tracks`
--
ALTER TABLE `tracks`
    MODIFY `track_id` smallint(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=96;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
    MODIFY `user_id` tinyint(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

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
