-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : lun. 25 avr. 2022 à 17:40
-- Version du serveur : 10.4.22-MariaDB
-- Version de PHP : 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `coffeemanagement`
--

-- --------------------------------------------------------

--
-- Structure de la table `bought`
--

CREATE TABLE `bought` (
  `ID` int(11) NOT NULL,
  `date` date NOT NULL,
  `Quantity` int(11) NOT NULL DEFAULT 1,
  `amount` float NOT NULL,
  `ID_pro` int(11) NOT NULL,
  `barcode` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `bought`
--

INSERT INTO `bought` (`ID`, `date`, `Quantity`, `amount`, `ID_pro`, `barcode`) VALUES
(11, '2022-04-08', 1, 15, 5, 'EE902170'),
(12, '2022-04-08', 3, 60, 9, 'EE902170'),
(13, '2022-04-20', 2, 30, 5, 'ee902170'),
(14, '2022-04-20', 2, 60, 10, 'ee902170'),
(15, '2022-04-20', 3, 60, 9, 'ee902170'),
(16, '2022-04-20', 2, 20, 4, 'ee902170'),
(17, '2022-04-20', 1, 30, 15, 'ee902170'),
(18, '2022-04-20', 1, 20, 9, 'ee902170'),
(19, '2022-04-20', 2, 10, 20, 'ee902170'),
(20, '2022-04-20', 15, 450, 15, 'ee345432'),
(21, '2022-04-20', 15, 450, 15, 'ee345432'),
(22, '2022-04-20', 21, 630, 10, 'ee345432'),
(24, '2022-04-25', 1, 30, 10, 'EE902170'),
(25, '2022-04-25', 2, 60, 15, 'EE902170'),
(26, '2022-04-25', 3, 90, 10, 'EE902170'),
(27, '2022-04-25', 1, 30, 10, 'EE902170'),
(28, '2022-04-25', 2, 60, 15, 'EE902170'),
(29, '2022-04-25', 3, 90, 10, 'EE902170'),
(30, '2022-04-25', 4, 120, 15, 'EE902170'),
(31, '2022-04-25', 1, 30, 10, 'EE902170'),
(32, '2022-04-25', 2, 60, 15, 'EE902170'),
(33, '2022-04-25', 3, 90, 10, 'EE902170'),
(34, '2022-04-25', 4, 120, 15, 'EE902170'),
(35, '2022-04-25', 5, 150, 15, 'EE902170');

-- --------------------------------------------------------

--
-- Structure de la table `boughtrec`
--

CREATE TABLE `boughtrec` (
  `id` int(11) NOT NULL,
  `date` date NOT NULL,
  `quantity` int(11) NOT NULL DEFAULT 1,
  `amount` float NOT NULL,
  `id_pro` int(11) NOT NULL,
  `barcode` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `boughtrec`
--

INSERT INTO `boughtrec` (`id`, `date`, `quantity`, `amount`, `id_pro`, `barcode`) VALUES
(37, '2022-04-25', 1, 30, 10, 'EE902170'),
(38, '2022-04-25', 2, 60, 15, 'EE902170'),
(39, '2022-04-25', 3, 90, 10, 'EE902170'),
(40, '2022-04-25', 1, 30, 10, 'EE902170'),
(41, '2022-04-25', 2, 60, 15, 'EE902170'),
(42, '2022-04-25', 3, 90, 10, 'EE902170'),
(43, '2022-04-25', 4, 120, 15, 'EE902170'),
(44, '2022-04-25', 1, 30, 10, 'EE902170'),
(45, '2022-04-25', 2, 60, 15, 'EE902170'),
(46, '2022-04-25', 3, 90, 10, 'EE902170'),
(47, '2022-04-25', 4, 120, 15, 'EE902170'),
(48, '2022-04-25', 5, 150, 15, 'EE902170');

-- --------------------------------------------------------

--
-- Structure de la table `consume`
--

CREATE TABLE `consume` (
  `ID_con` int(11) NOT NULL,
  `Price_con` float NOT NULL,
  `Date_con` date NOT NULL,
  `Quantity_con` int(11) NOT NULL DEFAULT 1,
  `barcode` varchar(100) NOT NULL,
  `ID_pro` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `consume`
--

INSERT INTO `consume` (`ID_con`, `Price_con`, `Date_con`, `Quantity_con`, `barcode`, `ID_pro`) VALUES
(1, 1476, '2022-04-05', 12, 'EE902170 ', 1),
(2, 2829, '2022-04-20', 23, 'ee345432 ', 2);

-- --------------------------------------------------------

--
-- Structure de la table `credit`
--

CREATE TABLE `credit` (
  `ID` int(11) NOT NULL,
  `date` date NOT NULL,
  `amount` float NOT NULL,
  `Barcode` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `credit`
--

INSERT INTO `credit` (`ID`, `date`, `amount`, `Barcode`) VALUES
(4, '2022-04-20', 500, 'ee345432');

-- --------------------------------------------------------

--
-- Structure de la table `employee`
--

CREATE TABLE `employee` (
  `Barcode` varchar(50) NOT NULL,
  `Name` varchar(40) NOT NULL,
  `Salary` float NOT NULL,
  `State` varchar(100) NOT NULL,
  `Image` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `employee`
--

INSERT INTO `employee` (`Barcode`, `Name`, `Salary`, `State`, `Image`) VALUES
('EE132123', 'Hmid choj3', 1000, 'geron', '0a6095b63defe74bd3449174bd252af7.jpg'),
('ee345432', 'Ayoub', 1234, 'server', '1.png'),
('EE345678', 'MOHAMED AMINE', 3000, 'geron', '2fdcb7185433f776519b9680dc3a636d.jpg'),
('EE902170', 'rouissy', 1000, 'server', '2.png'),
('EE949016', 'Aittaleb Abderrahman', 122333, 'Admin', '1.png');

-- --------------------------------------------------------

--
-- Structure de la table `facture`
--

CREATE TABLE `facture` (
  `ID` int(11) NOT NULL,
  `Amount` float NOT NULL,
  `date` date NOT NULL,
  `f_type` varchar(100) NOT NULL,
  `barcodenormal` varchar(100) DEFAULT NULL,
  `barcode` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `facture`
--

INSERT INTO `facture` (`ID`, `Amount`, `date`, `f_type`, `barcodenormal`, `barcode`) VALUES
(2, 199, '2022-04-05', 'WIFI', '', 'EE902170 '),
(3, 500, '2022-04-05', 'RADEEMA', '', 'EE902170 '),
(4, 1000, '2022-04-05', 'Taxes', '', 'EE902170 '),
(5, 1000, '2022-04-05', 'Employee', 'rouissy', 'EE902170 '),
(6, 1122, '2022-04-20', 'EMPLOYEE', 'rouissy', 'ee345432 ');

-- --------------------------------------------------------

--
-- Structure de la table `filling`
--

CREATE TABLE `filling` (
  `ID` int(11) NOT NULL,
  `Price_u` float NOT NULL,
  `date` date NOT NULL,
  `Quantity` int(11) NOT NULL DEFAULT 1,
  `Barcode` varchar(100) NOT NULL,
  `ID_pro` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `filling`
--

INSERT INTO `filling` (`ID`, `Price_u`, `date`, `Quantity`, `Barcode`, `ID_pro`) VALUES
(2, 123, '2022-04-05', 111, 'EE902170', 2),
(3, 11, '2022-04-20', 12, 'ee345432', 3),
(4, 1230, '2022-04-20', 123, 'ee902170', 4),
(5, 13, '2022-04-20', 123, 'ee902170 ', 4);

-- --------------------------------------------------------

--
-- Structure de la table `pointage`
--

CREATE TABLE `pointage` (
  `id_p` int(11) NOT NULL,
  `date_p` date NOT NULL,
  `date_entre` time NOT NULL,
  `date_sortie` time DEFAULT NULL,
  `attempt` int(11) NOT NULL DEFAULT 1,
  `CIN` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `pointage`
--

INSERT INTO `pointage` (`id_p`, `date_p`, `date_entre`, `date_sortie`, `attempt`, `CIN`) VALUES
(7, '2022-04-04', '14:49:20', '14:49:22', 2, 'EE949016'),
(8, '2022-04-04', '14:50:23', '14:50:25', 2, 'EE902170'),
(11, '2022-04-05', '16:07:56', '00:00:00', 1, 'EE949016');

-- --------------------------------------------------------

--
-- Structure de la table `product`
--

CREATE TABLE `product` (
  `ID` int(11) NOT NULL,
  `Name` varchar(100) NOT NULL,
  `Description` varchar(100) NOT NULL,
  `image` text NOT NULL,
  `cat` varchar(100) NOT NULL,
  `price` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `product`
--

INSERT INTO `product` (`ID`, `Name`, `Description`, `image`, `cat`, `price`) VALUES
(4, 'SIDI ALI 50CL', '', 'sidi-ali-pack-50cl.jpg', 'DRINKS', 10),
(5, 'SIDI ALI 1L', '', 'sidi-ali-pack-6x15l.jpg', 'DRINKS', 15),
(7, 'SHWEPPES TONIC 50 CL', '', '0a6095b63defe74bd3449174bd252af7.jpg', 'DRINKS', 10),
(8, 'RED BULL 25 CL', '', '0a6095b63defe74bd3449174bd252af7.jpg', 'DRINKS', 25),
(9, 'JUS D’ORANGE', '', '0a6095b63defe74bd3449174bd252af7.jpg', 'JUS', 20),
(10, 'BASIC BOOSTER', 'jus d\"orange, pomme, carotte et gingembre', '0a6095b63defe74bd3449174bd252af7.jpg', 'JUS', 30),
(11, 'ORANGE FRAÎCHEUR', 'jus d\"orange, menthe, gingembre et sorbet citron', '0a6095b63defe74bd3449174bd252af7.jpg', 'JUS', 30),
(12, 'STRAWBERY FRAICHEUR', 'fraise, menthe, sorbet citron, orange', '0a6095b63defe74bd3449174bd252af7.jpg', 'JUS', 30),
(15, 'PANACHÉ AUX FRUITS', 'vgghgh', '0a6095b63defe74bd3449174bd252af7.jpg', 'JUICES', 30),
(16, 'CHARLOTTE AUX FRUITS ROUGES', 'Biscuit moelleux, coulis fruit rouge, mousse chocolat blanc (valrhona), mousse fruit rouge, glaçage ', '0a6095b63defe74bd3449174bd252af7.jpg', 'SWEETS', 19),
(17, 'CHEESECAKE AUX FRUITS ROUGES', 'Sablé breton, coulis fruit rouge, mousse fromage', '2fdcb7185433f776519b9680dc3a636d.jpg', 'SWEETS', 19),
(19, 'PAIN CHOCOLAT', '', '0a6095b63defe74bd3449174bd252af7.jpg', 'PÂTISSERIES', 3),
(20, 'COOKIE', 'normal', '0a6095b63defe74bd3449174bd252af7.jpg', 'SWEETS', 5),
(21, 'COCO COLA ET ZÉRO 50 CL', '', '0a6095b63defe74bd3449174bd252af7.jpg', 'DRINKS', 10),
(22, 'SHWEPPES TONIC 50 CL', '', '0a6095b63defe74bd3449174bd252af7.jpg', 'DRINKS', 10),
(23, 'RED BULL 25 CL', '', '0a6095b63defe74bd3449174bd252af7.jpg', 'DRINKS', 25),
(24, 'JUS D’ORANGE', '', '0a6095b63defe74bd3449174bd252af7.jpg', 'JUS', 20),
(25, 'BASIC BOOSTER', 'jus d\"orange, pomme, carotte et gingembre', '0a6095b63defe74bd3449174bd252af7.jpg', 'JUS', 30),
(26, 'ORANGE FRAÎCHEUR', 'jus d\"orange, menthe, gingembre et sorbet citron', '0a6095b63defe74bd3449174bd252af7.jpg', 'JUS', 30),
(27, 'STRAWBERY FRAICHEUR', 'fraise, menthe, sorbet citron, orange', '8c1e9314106f42f8bd502e1ea8bd8a80.jpg', 'JUS', 30),
(38, 'v', 'b', '7a43572ca91fb201a94926147db4b96d.jpg', 'DRINKS ', 12);

-- --------------------------------------------------------

--
-- Structure de la table `receta`
--

CREATE TABLE `receta` (
  `ID` int(11) NOT NULL,
  `amount` float NOT NULL,
  `barcode` varchar(100) NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `receta`
--

INSERT INTO `receta` (`ID`, `amount`, `barcode`, `date`) VALUES
(1, 500, 'EE902170', '2022-04-06'),
(2, 500, 'EE902170', '2022-04-07'),
(3, 550, 'EE949016', '2022-04-07'),
(4, 400, 'ee345432', '2022-04-20');

-- --------------------------------------------------------

--
-- Structure de la table `settlement`
--

CREATE TABLE `settlement` (
  `ID` int(11) NOT NULL,
  `date` date NOT NULL,
  `amount` float NOT NULL,
  `Barcode` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `settlement`
--

INSERT INTO `settlement` (`ID`, `date`, `amount`, `Barcode`) VALUES
(1, '2022-04-07', 400, 'EE902170'),
(2, '2022-04-20', 10, 'ee902170'),
(3, '2022-04-20', 10, 'ee902170'),
(4, '2022-04-20', 400, 'EE902170');

-- --------------------------------------------------------

--
-- Structure de la table `stock`
--

CREATE TABLE `stock` (
  `ID` int(11) NOT NULL,
  `Name` varchar(100) NOT NULL,
  `Price_u` float NOT NULL,
  `Quantity` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `stock`
--

INSERT INTO `stock` (`ID`, `Name`, `Price_u`, `Quantity`) VALUES
(1, 'chihaja', 123, 3443),
(2, 'chi', 123, 88),
(3, 'A', 11, 12),
(4, 'sugar', 13, 246);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `bought`
--
ALTER TABLE `bought`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `fk_barcodeb` (`barcode`),
  ADD KEY `fk_idprocb` (`ID_pro`);

--
-- Index pour la table `boughtrec`
--
ALTER TABLE `boughtrec`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_barcodeb1` (`barcode`),
  ADD KEY `fk_idprocb1` (`id_pro`);

--
-- Index pour la table `consume`
--
ALTER TABLE `consume`
  ADD PRIMARY KEY (`ID_con`),
  ADD KEY `fk_barcodec` (`barcode`),
  ADD KEY `fk_idproc` (`ID_pro`);

--
-- Index pour la table `credit`
--
ALTER TABLE `credit`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `fk_barcodecredit` (`Barcode`);

--
-- Index pour la table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`Barcode`);

--
-- Index pour la table `facture`
--
ALTER TABLE `facture`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `fk_barcodeamount` (`barcode`);

--
-- Index pour la table `filling`
--
ALTER TABLE `filling`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `fk_barcodef` (`Barcode`),
  ADD KEY `fk_idpro` (`ID_pro`);

--
-- Index pour la table `pointage`
--
ALTER TABLE `pointage`
  ADD PRIMARY KEY (`id_p`),
  ADD KEY `fk_cinp` (`CIN`);

--
-- Index pour la table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`ID`);

--
-- Index pour la table `receta`
--
ALTER TABLE `receta`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `fk_codebarrec` (`barcode`);

--
-- Index pour la table `settlement`
--
ALTER TABLE `settlement`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `fk_barcodesettle` (`Barcode`);

--
-- Index pour la table `stock`
--
ALTER TABLE `stock`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `bought`
--
ALTER TABLE `bought`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT pour la table `boughtrec`
--
ALTER TABLE `boughtrec`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT pour la table `consume`
--
ALTER TABLE `consume`
  MODIFY `ID_con` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `credit`
--
ALTER TABLE `credit`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `facture`
--
ALTER TABLE `facture`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `filling`
--
ALTER TABLE `filling`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `pointage`
--
ALTER TABLE `pointage`
  MODIFY `id_p` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT pour la table `product`
--
ALTER TABLE `product`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT pour la table `receta`
--
ALTER TABLE `receta`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `settlement`
--
ALTER TABLE `settlement`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `stock`
--
ALTER TABLE `stock`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `bought`
--
ALTER TABLE `bought`
  ADD CONSTRAINT `fk_barcodeb` FOREIGN KEY (`barcode`) REFERENCES `employee` (`Barcode`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_idprocb` FOREIGN KEY (`ID_pro`) REFERENCES `product` (`ID`) ON DELETE CASCADE;

--
-- Contraintes pour la table `boughtrec`
--
ALTER TABLE `boughtrec`
  ADD CONSTRAINT `fk_barcodeb1` FOREIGN KEY (`barcode`) REFERENCES `employee` (`Barcode`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_idprocb1` FOREIGN KEY (`id_pro`) REFERENCES `product` (`ID`) ON DELETE CASCADE;

--
-- Contraintes pour la table `consume`
--
ALTER TABLE `consume`
  ADD CONSTRAINT `fk_barcodec` FOREIGN KEY (`barcode`) REFERENCES `employee` (`Barcode`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_idproc` FOREIGN KEY (`ID_pro`) REFERENCES `stock` (`ID`) ON DELETE CASCADE;

--
-- Contraintes pour la table `credit`
--
ALTER TABLE `credit`
  ADD CONSTRAINT `fk_barcodecredit` FOREIGN KEY (`Barcode`) REFERENCES `employee` (`Barcode`) ON DELETE CASCADE;

--
-- Contraintes pour la table `facture`
--
ALTER TABLE `facture`
  ADD CONSTRAINT `fk_barcodeamount` FOREIGN KEY (`barcode`) REFERENCES `employee` (`Barcode`) ON DELETE CASCADE;

--
-- Contraintes pour la table `filling`
--
ALTER TABLE `filling`
  ADD CONSTRAINT `fk_barcodef` FOREIGN KEY (`Barcode`) REFERENCES `employee` (`Barcode`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_idpro` FOREIGN KEY (`ID_pro`) REFERENCES `stock` (`ID`) ON DELETE CASCADE;

--
-- Contraintes pour la table `pointage`
--
ALTER TABLE `pointage`
  ADD CONSTRAINT `fk_cinp` FOREIGN KEY (`CIN`) REFERENCES `employee` (`Barcode`);

--
-- Contraintes pour la table `receta`
--
ALTER TABLE `receta`
  ADD CONSTRAINT `fk_codebarrec` FOREIGN KEY (`barcode`) REFERENCES `employee` (`Barcode`);

--
-- Contraintes pour la table `settlement`
--
ALTER TABLE `settlement`
  ADD CONSTRAINT `fk_barcodesettle` FOREIGN KEY (`Barcode`) REFERENCES `employee` (`Barcode`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
