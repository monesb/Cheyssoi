-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : sam. 04 jan. 2025 à 13:01
-- Version du serveur : 8.2.0
-- Version de PHP : 8.2.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `cheyssoi`
--

-- --------------------------------------------------------

--
-- Structure de la table `admin`
--

DROP TABLE IF EXISTS `admin`;
CREATE TABLE IF NOT EXISTS `admin` (
  `id_admin` int NOT NULL,
  `nom_admin` varchar(50) NOT NULL,
  `prenom_admin` varchar(50) NOT NULL,
  `email_admin` varchar(100) NOT NULL,
  `password` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `admin`
--

INSERT INTO `admin` (`id_admin`, `nom_admin`, `prenom_admin`, `email_admin`, `password`) VALUES
(1, 'Boubahri', 'Mones', 'monesboubahri@gmail.com', 'monesboubahri');

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

DROP TABLE IF EXISTS `client`;
CREATE TABLE IF NOT EXISTS `client` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(50) NOT NULL,
  `prenom` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `numero` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `code_postal` varchar(5) NOT NULL,
  `formule` enum('chey','ssoi') NOT NULL,
  `surface` double NOT NULL,
  `description` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déclencheurs `client`
--
DROP TRIGGER IF EXISTS `after_client_delete`;
DELIMITER $$
CREATE TRIGGER `after_client_delete` AFTER DELETE ON `client` FOR EACH ROW BEGIN
    INSERT INTO client_modif (Client_id, Modif_type, Admin_id, Modif_timestamp)
    VALUES (OLD.id, 'DELETE', 1, NOW());
END
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `after_client_update`;
DELIMITER $$
CREATE TRIGGER `after_client_update` AFTER UPDATE ON `client` FOR EACH ROW BEGIN
    INSERT INTO client_modif (Client_id, Modif_type, Admin_id, Modif_timestamp)
    VALUES (OLD.id, 'UPDATE', 1, NOW());
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Structure de la table `client_modif`
--

DROP TABLE IF EXISTS `client_modif`;
CREATE TABLE IF NOT EXISTS `client_modif` (
  `Modif_id` int NOT NULL AUTO_INCREMENT,
  `Client_id` int NOT NULL,
  `Modif_type` varchar(10) NOT NULL,
  `Admin_id` int NOT NULL,
  `Modif_timestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Modif_id`),
  KEY `Client_id` (`Client_id`),
  KEY `Admin_id` (`Admin_id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `professionnel`
--

DROP TABLE IF EXISTS `professionnel`;
CREATE TABLE IF NOT EXISTS `professionnel` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nom_entreprise` varchar(255) NOT NULL,
  `prenom_pro` varchar(255) NOT NULL,
  `nom_pro` varchar(255) NOT NULL,
  `intitule_poste` varchar(255) DEFAULT NULL,
  `secteur_activite` varchar(255) DEFAULT NULL,
  `email_pro` varchar(255) NOT NULL,
  `numero_telephone` varchar(15) DEFAULT NULL,
  `siret` varchar(14) DEFAULT NULL,
  `pays_region` varchar(255) DEFAULT NULL,
  `date_creation` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email_pro` (`email_pro`(191)),
  UNIQUE KEY `siret` (`siret`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

