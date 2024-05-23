-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Gegenereerd op: 29 jan 2024 om 09:50
-- Serverversie: 8.0.32
-- PHP-versie: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mvcframework`
--
CREATE DATABASE IF NOT EXISTS `mvcframework` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `mvcframework`;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `annuleerles`
--

DROP TABLE IF EXISTS `annuleerles`;
CREATE TABLE IF NOT EXISTS `annuleerles` (
  `Id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `LesId` int UNSIGNED NOT NULL,
  `Reden` varchar(100) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `LesId` (`LesId`)
) ENGINE=InnoDB AUTO_INCREMENT=2359 DEFAULT CHARSET=latin1;

--
-- Gegevens worden geëxporteerd voor tabel `annuleerles`
--

INSERT INTO `annuleerles` (`Id`, `LesId`, `Reden`) VALUES
(2343, 45, 'Groen'),
(2344, 50, 'Konijn'),
(2345, 52, 'Frasi'),
(2346, 49, 'Ik ben ziek'),
(2347, 45, 'Ik ben erg ziek en heb geen energie'),
(2348, 45, 'Ik ben erg ziek en heb geen energie'),
(2349, 45, 'Ik ben erg ziek en heb geen energie'),
(2350, 45, 'Ik ben erg ziek en heb geen energie'),
(2351, 49, 'Heb geen zin'),
(2352, 56, 'Het is geen leuke instructeur'),
(2353, 45, 'Geen zin'),
(2354, 49, 'Ik ben ziek'),
(2355, 55, 'Ik ben moe'),
(2356, 51, ''),
(2357, 53, ''),
(2358, 52, 'Dit is een test');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `country`
--

DROP TABLE IF EXISTS `country`;
CREATE TABLE IF NOT EXISTS `country` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(300) NOT NULL,
  `capitalCity` varchar(300) NOT NULL,
  `continent` enum('Afrika','Antartica','Azie','Australie/Oceanie','Europa','Noord-Amerika','Zuid-Amerika') NOT NULL,
  `population` int UNSIGNED NOT NULL,
  `datetime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=98 DEFAULT CHARSET=latin1;

--
-- Gegevens worden geëxporteerd voor tabel `country`
--

INSERT INTO `country` (`id`, `name`, `capitalCity`, `continent`, `population`, `datetime`) VALUES
(39, 'Chinaasd', 'Bejing', 'Australie/Oceanie', 1234000000, NULL),
(58, 'Tanzania', 'Dodoma', 'Afrika', 59730000, NULL),
(47, 'Japan', 'Tokyo', 'Azie', 1230000000, NULL),
(73, 'Senegal', 'Dakar', 'Afrika', 16740001, NULL),
(81, 'Nederland', 'Amsterdam', 'Europa', 6000000, NULL);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `countrys`
--

DROP TABLE IF EXISTS `countrys`;
CREATE TABLE IF NOT EXISTS `countrys` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(300) NOT NULL,
  `capitalCity` varchar(300) NOT NULL,
  `continent` enum('Afrika','Antarctica','Azië','Australië/Oceanië','Europa','Noord-Amerika','Zuid-Amerika') NOT NULL,
  `population` int UNSIGNED NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

--
-- Gegevens worden geëxporteerd voor tabel `countrys`
--

INSERT INTO `countrys` (`id`, `name`, `capitalCity`, `continent`, `population`) VALUES
(3, 'Chilies', 'Santiagos', 'Noord-Amerika', 19116203),
(4, 'Canada', 'Ottawa', 'Noord-Amerika', 37742154),
(5, 'Australië', 'Canberra', 'Australië/Oceanië', 25499884),
(6, 'China', 'Beijing', 'Azië', 1439323776),
(16, 'Nederland', 'Amsterdam', 'Europa', 170000000);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `datetimetest`
--

DROP TABLE IF EXISTS `datetimetest`;
CREATE TABLE IF NOT EXISTS `datetimetest` (
  `Id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `Datum` date NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Gegevens worden geëxporteerd voor tabel `datetimetest`
--

INSERT INTO `datetimetest` (`Id`, `Datum`) VALUES
(1, '2022-10-12');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `fruit`
--

DROP TABLE IF EXISTS `fruit`;
CREATE TABLE IF NOT EXISTS `fruit` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `color` varchar(50) NOT NULL,
  `price` float NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Gegevens worden geëxporteerd voor tabel `fruit`
--

INSERT INTO `fruit` (`id`, `name`, `color`, `price`) VALUES
(3, 'Paprikaatje', 'roodbruin', 2.45),
(4, 'Citroen', 'geel', 1.67),
(5, 'Aardbei', 'rood', 2.56),
(6, 'Peer', 'groen', 0.88);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `instructeur`
--

DROP TABLE IF EXISTS `instructeur`;
CREATE TABLE IF NOT EXISTS `instructeur` (
  `Id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `Email` varchar(50) NOT NULL,
  `Naam` varchar(100) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Gegevens worden geëxporteerd voor tabel `instructeur`
--

INSERT INTO `instructeur` (`Id`, `Email`, `Naam`) VALUES
(3, 'groen@mail.nl', 'Groen'),
(4, 'konijn@google.com', 'Konijn'),
(6, 'frasi@google.sp', 'Frasi');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `Instructeur1`
--

DROP TABLE IF EXISTS `Instructeur1`;
CREATE TABLE IF NOT EXISTS `Instructeur1` (
  `Id` smallint UNSIGNED NOT NULL AUTO_INCREMENT,
  `Voornaam` varchar(50) NOT NULL,
  `Tussenvoegsel` varchar(12) NOT NULL,
  `Achternaam` varchar(50) NOT NULL,
  `Mobiel` varchar(12) NOT NULL,
  `DatumInDienst` date NOT NULL,
  `AantalSterren` varchar(5) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Gegevens worden geëxporteerd voor tabel `Instructeur1`
--

INSERT INTO `Instructeur1` (`Id`, `Voornaam`, `Tussenvoegsel`, `Achternaam`, `Mobiel`, `DatumInDienst`, `AantalSterren`) VALUES
(1, 'Li', '', 'Zhan', '06-28493827', '2015-04-17', '***'),
(2, 'Leroy', '', 'Boerhaven', '06-39398734', '2018-06-25', '*'),
(3, 'Yoeri', 'Van', 'Veen', '06-24383291', '2010-05-12', '***'),
(4, 'Bert', 'Van', 'Sali', '06-48293823', '2023-01-10', '****'),
(5, 'Mohammed', 'El', 'Yassidi', '06-34291234', '2010-06-14', '*****');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `leerling`
--

DROP TABLE IF EXISTS `leerling`;
CREATE TABLE IF NOT EXISTS `leerling` (
  `Id` smallint UNSIGNED NOT NULL,
  `Naam` varchar(30) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Gegevens worden geëxporteerd voor tabel `leerling`
--

INSERT INTO `leerling` (`Id`, `Naam`) VALUES
(3, 'Konijn'),
(4, 'Slavink'),
(6, 'Otto');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `leerling1`
--

DROP TABLE IF EXISTS `leerling1`;
CREATE TABLE IF NOT EXISTS `leerling1` (
  `Id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `Naam` varchar(50) NOT NULL,
  `Woonplaats` varchar(100) NOT NULL,
  `Postcode` varchar(6) NOT NULL,
  `Straat` varchar(100) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Gegevens worden geëxporteerd voor tabel `leerling1`
--

INSERT INTO `leerling1` (`Id`, `Naam`, `Woonplaats`, `Postcode`, `Straat`) VALUES
(3, 'Konijn', 'Utrecht', '3590UV', 'Laan 45'),
(4, 'Slavink', 'Nieuwegein', '3678II', 'Overweg 7'),
(6, 'Otto', 'Houten', '3822AS', 'Groenlo 44');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `les`
--

DROP TABLE IF EXISTS `les`;
CREATE TABLE IF NOT EXISTS `les` (
  `Id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `Datum` datetime DEFAULT NULL,
  `LeerlingId` int UNSIGNED NOT NULL,
  `InstructeurId` int UNSIGNED NOT NULL,
  `Is_geannuleerd` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`Id`),
  KEY `LeerlingId` (`LeerlingId`),
  KEY `InstructeurId` (`InstructeurId`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=latin1;

--
-- Gegevens worden geëxporteerd voor tabel `les`
--

INSERT INTO `les` (`Id`, `Datum`, `LeerlingId`, `InstructeurId`, `Is_geannuleerd`) VALUES
(45, '2022-05-20 14:30:00', 3, 3, b'1'),
(46, '2022-05-20 10:30:00', 6, 6, b'0'),
(47, '2022-05-20 09:30:00', 4, 4, b'0'),
(48, '2022-05-21 15:00:00', 6, 6, b'0'),
(49, '2022-05-22 15:00:00', 3, 3, b'1'),
(50, '2022-05-28 15:00:00', 4, 4, b'0'),
(51, '2022-05-20 15:30:00', 3, 4, b'1'),
(52, '2022-05-20 17:30:00', 3, 3, b'1'),
(53, '2022-05-20 05:30:00', 3, 3, b'1'),
(54, '2022-05-20 12:30:00', 4, 4, b'0'),
(55, '2022-05-20 14:30:00', 3, 3, b'1'),
(56, '2022-05-20 09:30:00', 3, 6, b'1');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `lessen`
--

DROP TABLE IF EXISTS `lessen`;
CREATE TABLE IF NOT EXISTS `lessen` (
  `ID` smallint UNSIGNED NOT NULL,
  `Datum` date NOT NULL,
  `Leerling` smallint UNSIGNED NOT NULL,
  `Onderdeel` varchar(500) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_leerling_PK_Leerling_Id` (`Leerling`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Gegevens worden geëxporteerd voor tabel `lessen`
--

INSERT INTO `lessen` (`ID`, `Datum`, `Leerling`, `Onderdeel`) VALUES
(42, '2022-06-11', 3, 'Achteruit rijden'),
(43, '2022-06-14', 3, 'Achteruit rijden'),
(44, '2022-06-16', 6, 'File rijden'),
(45, '2022-06-20', 3, 'Stadsverkeer'),
(46, '2022-06-20', 6, 'Parkeren'),
(47, '2022-06-21', 4, 'Achteruit rijden'),
(48, '2022-06-21', 6, 'Parkeren'),
(49, '2022-06-22', 3, 'Parkeren');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `networks`
--

DROP TABLE IF EXISTS `networks`;
CREATE TABLE IF NOT EXISTS `networks` (
  `id` tinyint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `category` varchar(80) NOT NULL,
  `director_id` tinyint UNSIGNED DEFAULT NULL,
  `director_name` varchar(100) DEFAULT NULL,
  `description` varchar(1000) DEFAULT NULL,
  `last_modified` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `user_id` smallint UNSIGNED DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `networks_fk1` (`category`),
  KEY `networks_index2471` (`name`),
  KEY `networks_index2472` (`director_id`,`director_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `network_classes`
--

DROP TABLE IF EXISTS `network_classes`;
CREATE TABLE IF NOT EXISTS `network_classes` (
  `id` tinyint UNSIGNED NOT NULL AUTO_INCREMENT,
  `category` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `category_UNIQUE` (`category`),
  KEY `key_1` (`id`,`category`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `Opmerkingen`
--

DROP TABLE IF EXISTS `Opmerkingen`;
CREATE TABLE IF NOT EXISTS `Opmerkingen` (
  `ID` mediumint UNSIGNED NOT NULL AUTO_INCREMENT,
  `Les` smallint UNSIGNED NOT NULL,
  `Opmerkingen` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Gegevens worden geëxporteerd voor tabel `Opmerkingen`
--

INSERT INTO `Opmerkingen` (`ID`, `Les`, `Opmerkingen`) VALUES
(1, 42, 'Dit is een test'),
(2, 42, 'Dit is een test'),
(3, 42, 'test'),
(4, 49, 'Dit is een test'),
(5, 42, 'test'),
(6, 42, 'df');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `rollercoaster`
--

DROP TABLE IF EXISTS `rollercoaster`;
CREATE TABLE IF NOT EXISTS `rollercoaster` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `nameRollerCoaster` varchar(200) NOT NULL,
  `nameAmusementPark` varchar(200) NOT NULL,
  `country` varchar(100) NOT NULL,
  `topspeed` tinyint UNSIGNED NOT NULL,
  `height` tinyint UNSIGNED NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Gegevens worden geëxporteerd voor tabel `rollercoaster`
--

INSERT INTO `rollercoaster` (`id`, `nameRollerCoaster`, `nameAmusementPark`, `country`, `topspeed`, `height`) VALUES
(1, 'Red Force', 'Ferrari land', 'Spanje', 192, 112),
(2, 'Ring Racer', 'Race circuit Nürnberg', 'Duitsland', 160, 110),
(3, 'Hyperion', 'EnergyLandia', 'Polen', 141, 77),
(4, 'Furios Baco', 'PortAventura', 'Spanje', 138, 23),
(5, 'Shambala', 'PortAventura', 'Spanje', 134, 102);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `TypeVoertuig`
--

DROP TABLE IF EXISTS `TypeVoertuig`;
CREATE TABLE IF NOT EXISTS `TypeVoertuig` (
  `Id` smallint UNSIGNED NOT NULL AUTO_INCREMENT,
  `TypeVoertuig` varchar(50) NOT NULL,
  `Rijbewijscategorie` varchar(2) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Gegevens worden geëxporteerd voor tabel `TypeVoertuig`
--

INSERT INTO `TypeVoertuig` (`Id`, `TypeVoertuig`, `Rijbewijscategorie`) VALUES
(1, 'Personenauto', 'B'),
(2, 'Vrachtwagen', 'C'),
(3, 'Bus', 'D'),
(4, 'Bromfiets', 'AM');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `user_id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_name` varchar(255) NOT NULL,
  `user_email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Gegevens worden geëxporteerd voor tabel `users`
--

INSERT INTO `users` (`user_id`, `user_name`, `user_email`, `password`) VALUES
(1, 'rra', 'rra@mboutrecht.nl', 'Geheim!'),
(2, 'hsok', 'hsok@mboutrecht.nl', 'Geheim!');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `Voertuig`
--

DROP TABLE IF EXISTS `Voertuig`;
CREATE TABLE IF NOT EXISTS `Voertuig` (
  `Id` smallint UNSIGNED NOT NULL AUTO_INCREMENT,
  `Kenteken` varchar(12) NOT NULL,
  `Type` varchar(50) NOT NULL,
  `Bouwjaar` varchar(10) NOT NULL,
  `Brandstof` varchar(10) NOT NULL,
  `TypeVoertuigId` smallint UNSIGNED NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK_Voertuig_TypeVoertuigId_TypeVoertuig_Id` (`TypeVoertuigId`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

--
-- Gegevens worden geëxporteerd voor tabel `Voertuig`
--

INSERT INTO `Voertuig` (`Id`, `Kenteken`, `Type`, `Bouwjaar`, `Brandstof`, `TypeVoertuigId`) VALUES
(1, 'AU-67-IO', 'Volkswagen', '12-06-2017', 'Diesel', 1),
(2, 'TR-24-OP', 'DAF', '23-05-2019', 'Diesel', 2),
(3, 'TH-78-KL', 'Mercedes', '01-01-2023', 'Benzine', 1),
(4, '90-KL-TR', 'Fiat 500', '12-09-2021', 'Benzine', 1),
(5, '34-TK-LP', 'Scania', '13-03-2015', 'Diesel', 2),
(6, 'YY-OP-78', 'BMW M5', '13-05-2022', 'Diesel', 1),
(7, 'UU-HH-JK', 'M.A.N', '03-12-2017', 'Diesel', 2),
(8, 'ST-FZ-28', 'Citroën', '20-01-2018', 'Elektrisch', 1),
(9, '123-FR-T', 'Piaggio ZIP', '01-02-2021', 'Benzine', 4),
(10, 'DRS-52-P', 'Vespa', '21-03-2022', 'Benzine', 4),
(11, 'STP-12-U', 'Kymco', '02-07-2022', 'Benzine', 4),
(12, '45-SD-23', 'Renault', '01-01-2023', 'Diesel', 3);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `VoertuigInstructeur`
--

DROP TABLE IF EXISTS `VoertuigInstructeur`;
CREATE TABLE IF NOT EXISTS `VoertuigInstructeur` (
  `Id` smallint UNSIGNED NOT NULL AUTO_INCREMENT,
  `VoertuigId` smallint UNSIGNED NOT NULL,
  `Instructeur1Id` smallint UNSIGNED NOT NULL,
  `DatumToekenning` date DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK_VoertuigInstructeur_VoertuigId_Voertuig_Id` (`VoertuigId`),
  KEY `FK_VoertuigInstructeur_Instructeur1Id_Instructeur1_Id` (`Instructeur1Id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Gegevens worden geëxporteerd voor tabel `VoertuigInstructeur`
--

INSERT INTO `VoertuigInstructeur` (`Id`, `VoertuigId`, `Instructeur1Id`, `DatumToekenning`) VALUES
(1, 1, 5, '2017-06-18'),
(2, 3, 1, '2021-09-26'),
(3, 9, 1, '2021-09-27'),
(4, 3, 4, '2022-08-01'),
(5, 5, 1, '2019-08-30'),
(6, 10, 5, '2020-02-02');

--
-- Beperkingen voor geëxporteerde tabellen
--

--
-- Beperkingen voor tabel `annuleerles`
--
ALTER TABLE `annuleerles`
  ADD CONSTRAINT `annuleerles_ibfk_1` FOREIGN KEY (`LesId`) REFERENCES `les` (`Id`);

--
-- Beperkingen voor tabel `les`
--
ALTER TABLE `les`
  ADD CONSTRAINT `les_ibfk_1` FOREIGN KEY (`LeerlingId`) REFERENCES `leerling1` (`Id`),
  ADD CONSTRAINT `les_ibfk_2` FOREIGN KEY (`InstructeurId`) REFERENCES `instructeur` (`Id`);

--
-- Beperkingen voor tabel `lessen`
--
ALTER TABLE `lessen`
  ADD CONSTRAINT `FK_leerling_PK_Leerling_Id` FOREIGN KEY (`Leerling`) REFERENCES `leerling` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Beperkingen voor tabel `networks`
--
ALTER TABLE `networks`
  ADD CONSTRAINT `networks_fk1` FOREIGN KEY (`category`) REFERENCES `network_classes` (`category`);

--
-- Beperkingen voor tabel `Voertuig`
--
ALTER TABLE `Voertuig`
  ADD CONSTRAINT `FK_Voertuig_TypeVoertuigId_TypeVoertuig_Id` FOREIGN KEY (`TypeVoertuigId`) REFERENCES `TypeVoertuig` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Beperkingen voor tabel `VoertuigInstructeur`
--
ALTER TABLE `VoertuigInstructeur`
  ADD CONSTRAINT `FK_VoertuigInstructeur_Instructeur1Id_Instructeur1_Id` FOREIGN KEY (`Instructeur1Id`) REFERENCES `Instructeur1` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_VoertuigInstructeur_VoertuigId_Voertuig_Id` FOREIGN KEY (`VoertuigId`) REFERENCES `Voertuig` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
