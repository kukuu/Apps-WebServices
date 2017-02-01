-- phpMyAdmin SQL Dump
-- version 4.0.10.14
-- http://www.phpmyadmin.net
--
-- Host: localhost:3306
-- Generation Time: Jan 25, 2017 at 02:07 PM
-- Server version: 5.6.34
-- PHP Version: 5.6.20

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `rainbowc_primroseHill`
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
  `age` varchar(10) DEFAULT NULL,
  `genre1` int(11) DEFAULT NULL,
  `bio` text,
  `youtube` varchar(500) DEFAULT NULL,
  `url` varchar(500) DEFAULT NULL,
  `cdate` date DEFAULT NULL,
  `verified` int(11) DEFAULT NULL,
  `allday` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2829 ;

--
-- Dumping data for table `events`
--

INSERT INTO `events` (`id`, `venue_id`, `client_id`, `name`, `date`, `enddate`, `time`, `age`, `genre1`, `bio`, `youtube`, `url`, `cdate`, `verified`, `allday`) VALUES
(1, '1', 0, 'Adam Simmonds', '2017-01-08', '2017-01-08', NULL, NULL, 1, 'Adam studied Ophthalmic Optics at The City University, London, a very long time ago, and is a Member of the British College of Optometrists. At the age of 26, Adam set up Eye-Tech, in London’s Soho. It became renowned as the trendy opticians, through a combination of location, friendly service, innovative interior design and being the first in the UK to stock brands such as Oliver Peoples and LA Eyeworks.', NULL, NULL, '2017-01-08', NULL, NULL);


-- --------------------------------------------------------

--
-- Table structure for table `event_gallery`
--

CREATE TABLE IF NOT EXISTS `event_gallery` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `event_id` int(11) DEFAULT NULL,
  `file` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2831 ;

--
-- Dumping data for table `event_gallery`
--

INSERT INTO `event_gallery` (`id`, `event_id`, `file`) VALUES
(1, 1, '2460394.jpg'),
(2, 2, '9587402.jpg'),
(3, 3, '5181206.jpg');

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
(1, 'Alternative', 'Blah Blah', '008e10'),


-- --------------------------------------------------------

--
-- Table structure for table `raw`
--

CREATE TABLE IF NOT EXISTS `raw` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `venue_ame` varchar(35) DEFAULT NULL,
  `venue_type` varchar(16) DEFAULT NULL,
  `venue_type2` varchar(12) DEFAULT NULL,
  `address` varchar(38) DEFAULT NULL,
  `postcode` varchar(8) DEFAULT NULL,
  `area` varchar(13) DEFAULT NULL,
  `city` varchar(6) DEFAULT NULL,
  `phone` varchar(13) DEFAULT NULL,
  `latitude` varchar(8) DEFAULT NULL,
  `longitude` varchar(9) DEFAULT NULL,
  `website` varchar(496) DEFAULT NULL,
  `facebook` varchar(164) DEFAULT NULL,
  `twitter` varchar(90) DEFAULT NULL,
  `bio` varchar(484) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=112 ;

--
-- Dumping data for table `raw`
--

INSERT INTO `raw` (`id`, `venue_ame`, `venue_type`, `venue_type2`, `address`, `postcode`, `area`, `city`, `phone`, `latitude`, `longitude`, `website`, `facebook`, `twitter`, `bio`) VALUES
(1, 'Adam Simmonds', '1', '4', '87 Regent’s Park Road', 'NW1 8UY', 'Primrose Hill', 'London', '020 7813 1234', '', '', 'http://adamsimmonds.co.uk/', '', 'https://twitter.com/adam_simmonds', 'Adam studied Ophthalmic Optics at The City University, London, a very long time ago, and is a Member of the British College of Optometrists. At the age of 26, Adam set up Eye-Tech, in London’s Soho. It became renowned as the trendy opticians, through a combination of location, friendly service, innovative interior design and being the first in the UK to stock brands such as Oliver Peoples and LA Eyeworks.');

-- --------------------------------------------------------

--
-- Table structure for table `type`
--

CREATE TABLE IF NOT EXISTS `type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `display` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `sale` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

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
  `latitude` varchar(120) DEFAULT NULL,
  `longitude` varchar(120) DEFAULT NULL,
  `website` text,
  `facebook` text,
  `twitter` text,
  `logo` varchar(100) DEFAULT NULL,
  `image` varchar(100) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `bio` text,
  `promotion` text,
  `client_id` int(11) DEFAULT NULL,
  `verified` int(11) DEFAULT NULL,
  `genre1` int(11) DEFAULT NULL,
  `genre2` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=117 ;

--
-- Dumping data for table `venue`
--

INSERT INTO `venue` (`id`, `name`, `address`, `postcode`, `area`, `phone`, `latitude`, `longitude`, `website`, `facebook`, `twitter`, `logo`, `image`, `city`, `bio`, `promotion`, `client_id`, `verified`, `genre1`, `genre2`) VALUES
(1, 'Adam Simmonds', '87 Regent’s Park Road', 'NW1 8UY', 'Primrose Hill', '020 7813 1234', '51.541543', '-0.157106', 'http://adamsimmonds.co.uk/', '', 'https://twitter.com/adam_simmonds', '5711262.jpg', '2457953.jpg', 'London', 'Adam studied Ophthalmic Optics at The City University, London, a very long time ago, and is a Member of the British College of Optometrists. At the age of 26, Adam set up Eye-Tech, in London’s Soho. It became renowned as the trendy opticians, through a combination of location, friendly service, innovative interior design and being the first in the UK to stock brands such as Oliver Peoples and LA Eyeworks.', NULL, 0, NULL, 1, 4);

-- --------------------------------------------------------

--
-- Table structure for table `venue_back`
--

CREATE TABLE IF NOT EXISTS `venue_back` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `address` text,
  `postcode` varchar(10) NOT NULL,
  `area` varchar(30) DEFAULT NULL,
  `phone` varchar(16) DEFAULT NULL,
  `latitude` varchar(120) DEFAULT NULL,
  `longitude` varchar(120) DEFAULT NULL,
  `website` text,
  `facebook` text,
  `twitter` text,
  `logo` varchar(100) DEFAULT NULL,
  `image` varchar(100) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `bio` text,
  `promotion` text,
  `client_id` int(11) DEFAULT NULL,
  `verified` int(11) DEFAULT NULL,
  `genre1` int(11) DEFAULT NULL,
  `genre2` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=112 ;

--
-- Dumping data for table `venue_back`
--

INSERT INTO `venue_back` (`id`, `name`, `address`, `postcode`, `area`, `phone`, `latitude`, `longitude`, `website`, `facebook`, `twitter`, `logo`, `image`, `city`, `bio`, `promotion`, `client_id`, `verified`, `genre1`, `genre2`) VALUES
(1, 'Adam Simmonds', '87 Regent’s Park Road', 'NW1 8UY', 'Primrose Hill', '020 7813 1234', NULL, NULL, 'http://adamsimmonds.co.uk/', '', 'https://twitter.com/adam_simmonds', '5711262.jpg', '2457953.jpg', 'London', 'Adam studied Ophthalmic Optics at The City University, London, a very long time ago, and is a Member of the British College of Optometrists. At the age of 26, Adam set up Eye-Tech, in London’s Soho. It became renowned as the trendy opticians, through a combination of location, friendly service, innovative interior design and being the first in the UK to stock brands such as Oliver Peoples and LA Eyeworks.', NULL, NULL, NULL, 1, 4);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
