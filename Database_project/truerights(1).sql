-- phpMyAdmin SQL Dump
-- version 3.5.2.2
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: May 02, 2018 at 04:41 PM
-- Server version: 5.5.27
-- PHP Version: 5.4.7

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
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
  `type` varchar(30) NOT NULL,
  KEY `w_id` (`w_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `scheme_amt`
--

INSERT INTO `scheme_amt` (`w_id`, `category`, `amount`, `type`) VALUES
(104, 'first ', 10000, 'Education'),
(105, 'first', 10000, 'Education'),
(106, 'first', 10000, 'Education');

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
  `password` varchar(50) NOT NULL DEFAULT '123',
  `income` int(12) NOT NULL,
  `caste` varchar(30) NOT NULL,
  `business` varchar(30) NOT NULL,
  `sportsmen` varchar(30) NOT NULL,
  `X` int(11) NOT NULL,
  `XII` int(11) NOT NULL,
  `graduation` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_info`
--

INSERT INTO `user_info` (`aadhar`, `name`, `father_name`, `gender`, `dob`, `address`, `state`, `city`, `mobile`, `email`, `password`, `income`, `caste`, `business`, `sportsmen`, `X`, `XII`, `graduation`) VALUES
(1, 'Prem Chopra', 'Suresh Chopra', 'male', '1996-03-01', 'geetanjali isntitute', 'Rajasthan', 'udaipur', '123456789', 'hk@gmail.com', 'qwerty', 0, '', '', '', 0, 0, 0),
(2, 'vinit gupta', 'Suresh gupta', 'male', '1996-07-01', 'geetanjali isntitute', 'Rajasthan', 'udaipur', '124356789', 'kj@gmail.com', 'op', 0, '', '', '', 0, 0, 0),
(4, 'Paawan Chowhan', 'Vijay Singh Chowhan', 'Male', '1995-12-20', '71 Arihant Nagar,Kalka Mata Road', 'Rajasthan', 'Udaipur', '2147483647', 'chowhanpaawan3@gmail.com', '123', 100000, 'general', 'yes', 'no', 86, 88, 71);

-- --------------------------------------------------------

--
-- Table structure for table `welfare`
--

CREATE TABLE IF NOT EXISTS `welfare` (
  `w_id` int(11) NOT NULL,
  `w_name` varchar(200) NOT NULL,
  `type` varchar(200) NOT NULL,
  `max_reg` int(11) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`w_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `welfare`
--

INSERT INTO `welfare` (`w_id`, `w_name`, `type`, `max_reg`, `timestamp`) VALUES
(101, 'Paawan yojna', 'Education', 10, '2018-02-23 16:13:43'),
(102, 'Prateek Yojana', 'Education', 10, '2018-02-23 16:15:27'),
(104, 'check1', 'Education', 10, '2018-05-02 14:17:12'),
(105, 'check2', 'Education', 14, '2018-05-02 14:18:16'),
(106, 'check3', 'Education', 17, '2018-05-02 14:38:45');

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
