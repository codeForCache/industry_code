-- phpMyAdmin SQL Dump
-- version 3.5.2.2
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Nov 14, 2014 at 03:09 AM
-- Server version: 5.5.27
-- PHP Version: 5.4.7

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `rentking`
--

-- --------------------------------------------------------

--
-- Table structure for table `leases`
--

CREATE TABLE IF NOT EXISTS `leases` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `unit_id` int(11) NOT NULL,
  `rent_amount` float NOT NULL,
  `bond` float NOT NULL,
  `recurring` varchar(33) NOT NULL,
  `lease_start` date NOT NULL,
  `lease_end` date NOT NULL,
  `tenant_image` varchar(333) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`,`unit_id`),
  KEY `unit_id` (`unit_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `replies`
--

CREATE TABLE IF NOT EXISTS `replies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `workorder_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `message` varchar(333) NOT NULL,
  `time` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `workorder_id` (`workorder_id`,`user_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `units`
--

CREATE TABLE IF NOT EXISTS `units` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `street` varchar(333) NOT NULL,
  `apt_number` varchar(33) NOT NULL,
  `city` varchar(33) NOT NULL,
  `postal_code` varchar(33) NOT NULL,
  `extra_info` varchar(333) NOT NULL,
  `unit_type` varchar(333) NOT NULL,
  `bedrooms` varchar(33) NOT NULL,
  `bathrooms` varchar(33) NOT NULL,
  `square_meterage` varchar(33) NOT NULL,
  `emergency_contact` varchar(33) NOT NULL,
  `unit_owner` varchar(33) NOT NULL,
  `desired_rent` float NOT NULL,
  `bank_account` varchar(333) NOT NULL,
  `unit_image` varchar(333) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(33) NOT NULL,
  `password` varchar(333) NOT NULL,
  `first_name` varchar(33) NOT NULL,
  `last_name` varchar(33) NOT NULL,
  `email` varchar(72) NOT NULL,
  `phone` varchar(33) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `deleted_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `remember_token` varchar(333) NOT NULL,
  `company_name` varchar(333) NOT NULL,
  `manager` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_name` (`user_name`,`email`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `workorders`
--

CREATE TABLE IF NOT EXISTS `workorders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `unit_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `description` varchar(2000) NOT NULL,
  `priority` varchar(33) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `unit_id` (`unit_id`,`user_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `leases`
--
ALTER TABLE `leases`
  ADD CONSTRAINT `leases_ibfk_2` FOREIGN KEY (`unit_id`) REFERENCES `units` (`id`),
  ADD CONSTRAINT `leases_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `replies`
--
ALTER TABLE `replies`
  ADD CONSTRAINT `replies_ibfk_3` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `replies_ibfk_1` FOREIGN KEY (`workorder_id`) REFERENCES `workorders` (`id`);

--
-- Constraints for table `units`
--
ALTER TABLE `units`
  ADD CONSTRAINT `units_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `workorders`
--
ALTER TABLE `workorders`
  ADD CONSTRAINT `workorders_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `workorders_ibfk_1` FOREIGN KEY (`unit_id`) REFERENCES `units` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
