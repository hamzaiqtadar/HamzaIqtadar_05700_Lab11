-- phpMyAdmin SQL Dump
-- version 4.3.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Dec 08, 2015 at 12:47 PM
-- Server version: 5.6.24
-- PHP Version: 5.5.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `lab11`
--

-- --------------------------------------------------------

--
-- Table structure for table `attendance`
--

CREATE TABLE IF NOT EXISTS `attendance` (
  `classid` int(50) NOT NULL,
  `studentid` int(50) NOT NULL,
  `isPresent` tinyint(1) NOT NULL,
  `comments` varchar(200) NOT NULL,
  `id` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `attendance`
--

INSERT INTO `attendance` (`classid`, `studentid`, `isPresent`, `comments`, `id`) VALUES
(1, 1, 1, 'p', '1'),
(2, 5, 1, 'p', '10'),
(3, 1, 1, 'p', '11'),
(3, 2, 0, 'p', '12'),
(3, 3, 1, 'p', '13'),
(3, 4, 1, 'p', '14'),
(3, 5, 1, 'p', '15'),
(1, 2, 1, 'p', '2'),
(1, 3, 1, 'p', '3'),
(1, 4, 0, 'p', '4'),
(1, 5, 0, 'p', '5'),
(2, 1, 1, 'p', '6'),
(2, 2, 1, 'p', '7'),
(2, 3, 1, 'p', '8'),
(2, 4, 1, 'p', '9');

-- --------------------------------------------------------

--
-- Table structure for table `class`
--

CREATE TABLE IF NOT EXISTS `class` (
  `id` int(50) NOT NULL,
  `teacherid` int(50) NOT NULL,
  `starttime` time NOT NULL,
  `endtime` time NOT NULL,
  `credit_hours` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `class`
--

INSERT INTO `class` (`id`, `teacherid`, `starttime`, `endtime`, `credit_hours`) VALUES
(1, 1, '11:00:00', '11:50:00', 1),
(2, 1, '12:00:00', '12:50:00', 1),
(3, 1, '01:00:00', '01:50:00', 1);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `id` int(50) NOT NULL,
  `fullname` varchar(200) NOT NULL,
  `email` varchar(200) NOT NULL,
  `class` varchar(10) NOT NULL,
  `role` enum('teacher','student','admin') NOT NULL,
  `pass` varchar(45) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `fullname`, `email`, `class`, `role`, `pass`) VALUES
(1, 'Hamza Iqtadar', 'hamza', 'SE4', 'student', 'abc'),
(2, 'Abdullah Anwar', 'abdullah', 'SE4', 'student', '123'),
(3, 'Umer Ahmed', 'umer', 'SE4', 'student', '456'),
(4, 'Umer Hussain', 'umar', 'SE4', 'student', '789'),
(5, 'Safie Ur Rehman', 'safie', 'SE4', 'student', 'xyz'),
(6, 'Rahat Shiraz Hashmi', 'rahat', 'SE4', 'teacher', 'asdf'),
(7, 'Fahad Satti', 'fahad', 'SE4', 'teacher', 'qwer');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `attendance`
--
ALTER TABLE `attendance`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `class`
--
ALTER TABLE `class`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
