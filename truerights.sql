-- phpMyAdmin SQL Dump
-- version 4.1.12
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Mar 29, 2018 at 10:10 AM
-- Server version: 5.6.16
-- PHP Version: 5.5.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `truerights`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE IF NOT EXISTS `admin` (
  `username` varchar(200) NOT NULL,
  `password` varchar(200) NOT NULL,
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1112 ;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`username`, `password`, `user_id`) VALUES
('admin', 'admin', 1111);

-- --------------------------------------------------------

--
-- Table structure for table `beneficiars`
--

CREATE TABLE IF NOT EXISTS `beneficiars` (
  `w_id` int(11) NOT NULL,
  `type` varchar(200) NOT NULL,
  `category` varchar(200) DEFAULT NULL,
  `aadhar` varchar(200) DEFAULT NULL,
  `b_name` varchar(200) DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  KEY `w_id` (`w_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `beneficiars`
--

INSERT INTO `beneficiars` (`w_id`, `type`, `category`, `aadhar`, `b_name`, `timestamp`) VALUES
(102, 'schlorship', 'first', '123456789', 'vinit', '2018-02-23 17:14:22'),
(101, 'schlorship', 'first', '987654321', 'shivani', '2018-02-23 16:19:20'),
(102, 'schlorship', 'first', '4567', 'shiv', '2018-02-23 17:08:21'),
(101, 'schlorship', 'first', '12345679', 'fakru', '2018-02-23 17:49:30'),
(102, 'schlorship', 'first', '42', 'kirti', '2018-02-24 04:41:56');

-- --------------------------------------------------------

--
-- Table structure for table `scheme_amt`
--

CREATE TABLE IF NOT EXISTS `scheme_amt` (
  `w_id` int(11) DEFAULT NULL,
  `category` varchar(200) DEFAULT NULL,
  `amount` bigint(20) DEFAULT NULL,
  KEY `w_id` (`w_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user_info`
--

CREATE TABLE IF NOT EXISTS `user_info` (
  `aadhar` int(12) NOT NULL,
  `name` varchar(50) NOT NULL,
  `father_name` varchar(50) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `dob` date NOT NULL,
  `address` text NOT NULL,
  `state` varchar(30) NOT NULL,
  `city` varchar(30) NOT NULL,
  `mobile` varchar(12) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL DEFAULT '123'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_info`
--

INSERT INTO `user_info` (`aadhar`, `name`, `father_name`, `gender`, `dob`, `address`, `state`, `city`, `mobile`, `email`, `password`) VALUES
(1, 'Prem Chopra', 'Suresh Chopra', 'male', '1996-03-01', 'geetanjali isntitute', 'Rajasthan', 'udaipur', '123456789', 'hk@gmail.com', 'qwerty'),
(2, 'vinit gupta', 'Suresh gupta', 'male', '1996-07-01', 'geetanjali isntitute', 'Rajasthan', 'udaipur', '124356789', 'kj@gmail.com', 'op');

-- --------------------------------------------------------

--
-- Table structure for table `welfare`
--

CREATE TABLE IF NOT EXISTS `welfare` (
  `w_id` int(11) NOT NULL,
  `w_name` varchar(200) NOT NULL,
  `type` varchar(200) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`w_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `welfare`
--

INSERT INTO `welfare` (`w_id`, `w_name`, `type`, `timestamp`) VALUES
(101, 'Paawan yojna', 'schlorship', '2018-02-23 16:13:43'),
(102, 'Prateek Yojana', 'schlorship', '2018-02-23 16:15:27');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `beneficiars`
--
ALTER TABLE `beneficiars`
  ADD CONSTRAINT `beneficiars_ibfk_1` FOREIGN KEY (`w_id`) REFERENCES `welfare` (`w_id`);

--
-- Constraints for table `scheme_amt`
--
ALTER TABLE `scheme_amt`
  ADD CONSTRAINT `scheme_amt_ibfk_1` FOREIGN KEY (`w_id`) REFERENCES `welfare` (`w_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
