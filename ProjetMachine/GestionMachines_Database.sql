-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Client :  127.0.0.1
-- Généré le :  Sam 22 Janvier 2022 à 12:40
-- Version du serveur :  5.6.17
-- Version de PHP :  5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données :  `machine`
--

-- --------------------------------------------------------

--
-- Structure de la table `login`
--

CREATE TABLE IF NOT EXISTS `login` (
  `username` varchar(45) NOT NULL,
  `password` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `login`
--

INSERT INTO `login` (`username`, `password`) VALUES
('Cherrat', 'Aymane'),
('Ramesh', 'Ramesh');

-- --------------------------------------------------------

--
-- Structure de la table `machinee`
--

CREATE TABLE IF NOT EXISTS `machinee` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `reference` int(11) NOT NULL,
  `dateAchat` date NOT NULL,
  `prix` double NOT NULL,
  `code` varchar(30) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Contenu de la table `machinee`
--

INSERT INTO `machinee` (`Id`, `reference`, `dateAchat`, `prix`, `code`) VALUES
(1, 15006, '2020-06-12', 12, 'JJ43'),
(2, 28787, '2022-01-24', 120, 'JJ43'),
(6, 12000, '2022-01-24', 300, 'JJ43'),
(7, 5443, '2022-01-06', 400, 'VV1');

-- --------------------------------------------------------

--
-- Structure de la table `salle`
--

CREATE TABLE IF NOT EXISTS `salle` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(30) NOT NULL,
  `type` varchar(30) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=15 ;

--
-- Contenu de la table `salle`
--

INSERT INTO `salle` (`Id`, `code`, `type`) VALUES
(10, 'JJ43', 'plll'),
(13, 'VV1', 'iaiai');

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(30) NOT NULL,
  `prenom` varchar(30) NOT NULL,
  `CIN` varchar(30) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
