-- phpMyAdmin SQL Dump
-- version 4.1.12
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Apr 25, 2018 at 08:19 AM
-- Server version: 5.6.16
-- PHP Version: 5.5.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `aadhardb`
--

-- --------------------------------------------------------

--
-- Table structure for table `aadhar`
--

CREATE TABLE IF NOT EXISTS `aadhar` (
  `aadharno` varchar(12) NOT NULL,
  `name` varchar(50) NOT NULL,
  `father_name` varchar(50) NOT NULL,
  `gender` varchar(11) NOT NULL,
  `dob` date NOT NULL,
  `address` text NOT NULL,
  `state` varchar(30) NOT NULL,
  `city` varchar(30) NOT NULL,
  `mobile` int(11) NOT NULL,
  `email` varchar(100) NOT NULL,
  PRIMARY KEY (`aadharno`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `aadhar`
--

INSERT INTO `aadhar` (`aadharno`, `name`, `father_name`, `gender`, `dob`, `address`, `state`, `city`, `mobile`, `email`) VALUES
('1', 'Prem Chopra', 'Suresh Chopra', 'male', '1996-03-02', 'geetanjali isntitute', 'Rajasthan', 'udaipur', 123456789, 'hk@gmail.com'),
('2', 'vinit gupta', 'Suresh gupta', 'male', '1996-07-02', 'geetanjali isntitute', 'Rajasthan', 'udaipur', 124356789, 'kj@gmail.com'),
('3', 'Shivani Jain', 'hemant Jain', 'female', '1996-02-22', 'gujrat67', 'Gujrat', 'ahemdabad', 43567891, 'shivani@gmail.com');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
