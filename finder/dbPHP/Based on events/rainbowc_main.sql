-- phpMyAdmin SQL Dump
-- version 4.0.10.14
-- http://www.phpmyadmin.net
--
-- Host: localhost:3306
-- Generation Time: Jan 25, 2017 at 02:01 PM
-- Server version: 5.6.34
-- PHP Version: 5.6.20

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


--
-- Database: `rainbowc_main`
--

-- --------------------------------------------------------

--
-- Table structure for table `clients`
--

CREATE TABLE IF NOT EXISTS `clients` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` tinytext NOT NULL,
  `password` varchar(100) NOT NULL,
  `country` varchar(45) NOT NULL,
  `tel` varchar(45) NOT NULL,
  `active` varchar(22) NOT NULL,
  `name` varchar(100) NOT NULL,
  `family` varchar(100) NOT NULL,
  `lang` varchar(4) NOT NULL,
  `city` varchar(80) NOT NULL,
  `date` date DEFAULT NULL,
  `job` varchar(60) NOT NULL,
  `forget` varchar(22) DEFAULT NULL,
  `postcode` varchar(45) DEFAULT NULL,
  `address` text,
  `admin` int(11) DEFAULT NULL,
  `company` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`,`active`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `clients`
--

INSERT INTO `clients` (`id`, `username`, `password`, `country`, `tel`, `active`, `name`, `family`, `lang`, `city`, `date`, `job`, `forget`, `postcode`, `address`, `admin`, `company`) VALUES
(1, 'ramonaravan@hotmail.com ', '$1$pS..8t/.$r3zzTy8SSADsSIIbBMzn2.', 'GB', '', '1', '', '', '', '', '2016-07-24', '', NULL, NULL, NULL, 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

CREATE TABLE IF NOT EXISTS `events` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `venue_id` varchar(25) DEFAULT NULL,
  `client_id` int(11) DEFAULT NULL,
  `name` varchar(200) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `enddate` date DEFAULT NULL,
  `time` time DEFAULT NULL,
  `age` text,
  `genre1` int(11) DEFAULT NULL,
  `bio` text,
  `youtube` varchar(500) DEFAULT NULL,
  `url` varchar(500) DEFAULT NULL,
  `cdate` date DEFAULT NULL,
  `verified` int(11) DEFAULT NULL,
  `allday` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=45 ;

--
-- Dumping data for table `events`
--

INSERT INTO `events` (`id`, `venue_id`, `client_id`, `name`, `date`, `enddate`, `time`, `age`, `genre1`, `bio`, `youtube`, `url`, `cdate`, `verified`, `allday`) VALUES
(27, '4', 0, 'Ashtanga Toby Field', '2017-01-04', '2017-01-04', '19:15:00', '', 12, 'Since his first encounter with Yoga, Toby has been continually fascinated with the Ashtanga Vinyasa method. It''s ability to keep us soft, centred and provide a ''fresh'' perspective is what draws him to the mat each day., 'https://www.youtube.com/watch?v=VQqCfgTlx84', 'http://www.tobyfieldyoga.com/', '2016-11-27', NULL, 0),
;

-- --------------------------------------------------------

--
-- Table structure for table `event_gallery`
--

CREATE TABLE IF NOT EXISTS `event_gallery` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `event_id` int(11) DEFAULT NULL,
  `file` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=83 ;

--
-- Dumping data for table `event_gallery`
--

INSERT INTO `event_gallery` (`id`, `event_id`, `file`) VALUES
(1, 1, '4681220.jpg'),
(2, 1, '3971594.jpg'),
(3, 2, '3558674.jpg'),


-- --------------------------------------------------------

--
-- Table structure for table `genre`
--

CREATE TABLE IF NOT EXISTS `genre` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `display` varchar(50) DEFAULT NULL,
  `color` varchar(15) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=13 ;

--
-- Dumping data for table `genre`
--

INSERT INTO `genre` (`id`, `name`, `display`, `color`) VALUES
(1, 'Alternative', 'blah blah', '008e10'),

-- --------------------------------------------------------

--
-- Table structure for table `type`
--

CREATE TABLE IF NOT EXISTS `type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `display` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

---------------------------------------

--
-- Table structure for table `venue`
--

CREATE TABLE IF NOT EXISTS `venue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `address` text,
  `postcode` varchar(10) NOT NULL,
  `area` varchar(30) DEFAULT NULL,
  `phone` varchar(16) DEFAULT NULL,
  `latitude` varchar(120) NOT NULL,
  `longitude` varchar(120) NOT NULL,
  `website` text,
  `facebook` text,
  `twitter` text,
  `logo` varchar(100) NOT NULL,
  `image` varchar(100) NOT NULL,
  `city` varchar(50) DEFAULT NULL,
  `bio` text,
  `promotion` text,
  `client_id` int(11) DEFAULT NULL,
  `verified` int(11) DEFAULT NULL,
  `genre` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `venue`
--

INSERT INTO `venue` (`id`, `name`, `address`, `postcode`, `area`, `phone`, `latitude`, `longitude`, `website`, `facebook`, `twitter`, `logo`, `image`, `city`, `bio`, `promotion`, `client_id`, `verified`, `genre`) VALUES
(4, 'Triyoga Camden', ' 57 Jamestown Road', 'NW1 7DB', 'Camden', '020 7483 3344', '51.5395439', '-0.1476954', 'https://www.triyoga.co.uk/camden', 'https://www.facebook.com/pages/triyoga/137613006261921', 'https://twitter.com/triyogauk', '9341599.jpg', '7999604.jpg', 'London', 'After 14 years of practising, nurturing, growing and being in Primrose Hill, on 11th December 2014 we made the move to our new location in Camden Town. We have enjoyed creating this beautiful new space for everyone to enjoy and we look forward to showing you around! The new space at Camden is a beautiful renovated Victorian warehouse  - originally a piano factory - with high ceilings, natural light and lots of space. ', NULL, 0, NULL, 8);

