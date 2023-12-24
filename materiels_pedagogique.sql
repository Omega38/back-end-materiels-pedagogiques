-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Client :  127.0.0.1
-- Généré le :  Jeu 26 Octobre 2023 à 06:06
-- Version du serveur :  5.6.17
-- Version de PHP :  5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données :  `materiels_pedagogique`
--

-- --------------------------------------------------------

--
-- Structure de la table `emprunt`
--

CREATE TABLE IF NOT EXISTS `emprunt` (
  `idEmprunteur` int(11) DEFAULT NULL,
  `idSalle` int(11) DEFAULT NULL,
  `idMateriel` int(11) DEFAULT NULL,
  `debutEmprunt` date DEFAULT NULL,
  `finEmprunt` date DEFAULT NULL,
  `retourReelEmprunt` date DEFAULT NULL,
  `statutEmprunt` tinyint(1) DEFAULT NULL,
  KEY `idEmprunteur` (`idEmprunteur`),
  KEY `idSalle` (`idSalle`),
  KEY `idMateriel` (`idMateriel`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- --------------------------------------------------------

--
-- Structure de la table `emprunteur`
--

CREATE TABLE IF NOT EXISTS `emprunteur` (
  `idEmprunteur` int(11) NOT NULL AUTO_INCREMENT,
  `nomEmprunteur` varchar(50) NOT NULL,
  `phoneEmprunteur` varchar(20) NOT NULL,
  `emailEmprunteur` varchar(40) NOT NULL,
  `statutEmprunteur` text NOT NULL,
  PRIMARY KEY (`idEmprunteur`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Contenu de la table `emprunteur`
--

INSERT INTO `emprunteur` (`idEmprunteur`, `nomEmprunteur`, `phoneEmprunteur`, `emailEmprunteur`, `statutEmprunteur`) VALUES
(1, 'RANDRIATSARAFARA', '+261344832076', 'francisomega38@gmail.com', 'Enseignant Titulaire'),
(2, 'FRANCIS', '+261324363792', 'tsarafara@gmail.com', 'Enseignant titulaire');

-- --------------------------------------------------------

--
-- Structure de la table `maintenance`
--

CREATE TABLE IF NOT EXISTS `maintenance` (
  `idMaintenance` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idMateriel` int(11) DEFAULT NULL,
  `debutMaintenance` date DEFAULT NULL,
  `finMaintenance` date DEFAULT NULL,
  `coutMaintenance` double DEFAULT NULL,
  `statutMaintenance` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`idMaintenance`),
  KEY `idMateriel` (`idMateriel`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;


-- --------------------------------------------------------

--
-- Structure de la table `materiel`
--

CREATE TABLE IF NOT EXISTS `materiel` (
  `idMateriel` int(11) NOT NULL AUTO_INCREMENT,
  `nomMateriel` varchar(50) NOT NULL,
  `photoMateriel` longblob NOT NULL,
  `description` text NOT NULL,
  `disponibilite` tinyint(1) NOT NULL,
  PRIMARY KEY (`idMateriel`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;


-- --------------------------------------------------------

--
-- Structure de la table `reparation`
--

CREATE TABLE IF NOT EXISTS `reparation` (
  `idReparation` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idMateriel` int(11) DEFAULT NULL,
  `debutReparation` date DEFAULT NULL,
  `finReparation` date DEFAULT NULL,
  `coutReparation` double DEFAULT NULL,
  `statutReparation` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`idReparation`),
  KEY `idMateriel` (`idMateriel`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;


-- --------------------------------------------------------

--
-- Structure de la table `salle`
--

CREATE TABLE IF NOT EXISTS `salle` (
  `idSalle` int(11) NOT NULL AUTO_INCREMENT,
  `libelleSalle` varchar(25) NOT NULL,
  PRIMARY KEY (`idSalle`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=12 ;

--
-- Contenu de la table `salle`
--

INSERT INTO `salle` (`idSalle`, `libelleSalle`) VALUES
(1, 'Salle001'),
(2, 'Salle002'),
(3, 'Salle003'),
(4, 'Salle004'),
(5, 'Salle301'),
(6, 'test1'),
(7, 'Salle005'),
(8, 'Salle201'),
(9, 'Salle008'),
(10, 'Salle08'),
(11, 'Salle018');

--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `emprunt`
--
ALTER TABLE `emprunt`
  ADD CONSTRAINT `emprunt_ibfk_1` FOREIGN KEY (`idEmprunteur`) REFERENCES `emprunteur` (`idEmprunteur`),
  ADD CONSTRAINT `emprunt_ibfk_2` FOREIGN KEY (`idSalle`) REFERENCES `salle` (`idSalle`),
  ADD CONSTRAINT `emprunt_ibfk_3` FOREIGN KEY (`idMateriel`) REFERENCES `materiel` (`idMateriel`);

--
-- Contraintes pour la table `maintenance`
--
ALTER TABLE `maintenance`
  ADD CONSTRAINT `maintenance_ibfk_1` FOREIGN KEY (`idMateriel`) REFERENCES `materiel` (`idMateriel`);

--
-- Contraintes pour la table `reparation`
--
ALTER TABLE `reparation`
  ADD CONSTRAINT `reparation_ibfk_1` FOREIGN KEY (`idMateriel`) REFERENCES `materiel` (`idMateriel`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
