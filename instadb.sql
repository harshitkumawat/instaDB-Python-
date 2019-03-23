-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 23, 2019 at 02:04 PM
-- Server version: 10.1.31-MariaDB
-- PHP Version: 7.2.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `instadb`
--

-- --------------------------------------------------------

--
-- Table structure for table `likes`
--

CREATE TABLE `likes` (
  `picture_id` int(10) NOT NULL,
  `user_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `likes`
--

INSERT INTO `likes` (`picture_id`, `user_id`) VALUES
(101, 1),
(101, 2),
(101, 3),
(102, 1),
(103, 1),
(104, 1),
(105, 1),
(106, 1),
(106, 2),
(105, 2),
(105, 4),
(106, 4),
(107, 4),
(108, 4),
(108, 5),
(107, 5),
(101, 5),
(103, 5);

-- --------------------------------------------------------

--
-- Table structure for table `pictures`
--

CREATE TABLE `pictures` (
  `picture_id` int(10) NOT NULL,
  `picture_path` varchar(500) NOT NULL,
  `date_of_posting` date NOT NULL,
  `picture_caption` varchar(500) NOT NULL,
  `no_of_likes` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pictures`
--

INSERT INTO `pictures` (`picture_id`, `picture_path`, `date_of_posting`, `picture_caption`, `no_of_likes`) VALUES
(101, 'D:', '2012-02-12', 'My Holidays', 99),
(102, 'D:', '2015-06-22', 'Nature at its best', 59),
(103, 'E:', '2017-01-29', 'No Caption', 60),
(104, 'D:', '2019-09-19', 'No Caption', 65),
(105, 'E:', '2009-11-11', 'Fun Time', 150),
(106, 'E:', '2006-12-21', 'Beautiful', 50),
(107, 'D:', '2016-12-25', 'Super Dooper', 250),
(108, 'D:', '2017-12-20', 'No Caption', 178);

-- --------------------------------------------------------

--
-- Table structure for table `pictures_posted`
--

CREATE TABLE `pictures_posted` (
  `user_id` int(10) NOT NULL,
  `picture_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pictures_posted`
--

INSERT INTO `pictures_posted` (`user_id`, `picture_id`) VALUES
(1, 101),
(1, 102),
(2, 103),
(3, 104),
(4, 105),
(5, 106),
(5, 107),
(1, 108);

-- --------------------------------------------------------

--
-- Table structure for table `picture_tags`
--

CREATE TABLE `picture_tags` (
  `picture_id` int(10) NOT NULL,
  `tag_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `picture_tags`
--

INSERT INTO `picture_tags` (`picture_id`, `tag_id`) VALUES
(101, 1001),
(102, 1002),
(103, 1003),
(104, 1004),
(105, 1005),
(106, 1005),
(107, 1002),
(108, 1001);

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

CREATE TABLE `tags` (
  `tag_id` int(10) NOT NULL,
  `tag_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tags`
--

INSERT INTO `tags` (`tag_id`, `tag_name`) VALUES
(1001, 'Art'),
(1002, 'Music'),
(1003, 'Nature'),
(1004, 'Music'),
(1005, 'Engineering');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(10) NOT NULL,
  `username` varchar(30) NOT NULL,
  `user_email` varchar(30) NOT NULL,
  `no_of_liked_pictures` int(10) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `username`, `user_email`, `no_of_liked_pictures`, `first_name`, `last_name`) VALUES
(1, 'Harry', 'harshit@gmail.com', 5, 'Harshit', 'Kumawat'),
(2, 'Raj', 'raj@gmail.com', 4, 'Raj', 'Patel'),
(3, 'Neel', 'neel@gmail.com', 6, 'Neel', 'Patel'),
(4, 'Vicky', 'vikas@gmail.com', 3, 'Vikas', 'Bagadi'),
(5, 'Happy', 'happy@gmail.com', 7, 'Happy', 'Kumawat');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `likes`
--
ALTER TABLE `likes`
  ADD KEY `Userlike` (`picture_id`),
  ADD KEY `picturelike` (`user_id`);

--
-- Indexes for table `pictures`
--
ALTER TABLE `pictures`
  ADD PRIMARY KEY (`picture_id`);

--
-- Indexes for table `pictures_posted`
--
ALTER TABLE `pictures_posted`
  ADD KEY `user_id` (`user_id`),
  ADD KEY `picture_id` (`picture_id`);

--
-- Indexes for table `picture_tags`
--
ALTER TABLE `picture_tags`
  ADD KEY `tag_id` (`tag_id`),
  ADD KEY `picture_id` (`picture_id`);

--
-- Indexes for table `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`tag_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `likes`
--
ALTER TABLE `likes`
  ADD CONSTRAINT `Userlike` FOREIGN KEY (`picture_id`) REFERENCES `pictures` (`picture_id`),
  ADD CONSTRAINT `picturelike` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `pictures_posted`
--
ALTER TABLE `pictures_posted`
  ADD CONSTRAINT `pictures_posted_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `pictures_posted_ibfk_2` FOREIGN KEY (`picture_id`) REFERENCES `pictures` (`picture_id`);

--
-- Constraints for table `picture_tags`
--
ALTER TABLE `picture_tags`
  ADD CONSTRAINT `picture_tags_ibfk_1` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`tag_id`),
  ADD CONSTRAINT `picture_tags_ibfk_2` FOREIGN KEY (`picture_id`) REFERENCES `pictures` (`picture_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
