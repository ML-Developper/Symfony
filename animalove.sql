-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost
-- Généré le : dim. 18 jan. 2026 à 19:42
-- Version du serveur : 10.4.32-MariaDB
-- Version de PHP : 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `animalove`
--

-- --------------------------------------------------------

--
-- Structure de la table `article`
--

CREATE TABLE `article` (
  `id` int(11) NOT NULL,
  `libelle` varchar(255) NOT NULL,
  `is_disponible` tinyint(1) NOT NULL,
  `price` double NOT NULL,
  `marque` varchar(255) NOT NULL,
  `categorie_id` int(11) NOT NULL,
  `image_name` varchar(255) DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL COMMENT '(DC2Type:datetime_immutable)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `article`
--

INSERT INTO `article` (`id`, `libelle`, `is_disponible`, `price`, `marque`, `categorie_id`, `image_name`, `updated_at`) VALUES
(9, 'Cage grand taille', 1, 70, 'Neuve', 1, '8bc7bcfdfc1a9a08a8db2e326bb2866c2515f2bc-696bf12dd9af3310773891.jpg', '2026-01-17 21:29:33'),
(10, 'Niche', 1, 25, 'JOVELF', 1, '51d2ehnv13l-ac-ul495-sr435-495-696bf18fa4502137573698.jpg', '2026-01-17 21:31:11'),
(11, 'Accier ois', 1, 15, 'Neuve', 1, '414lrjo7otl-sl500-696bf1d74724e186801553.jpg', '2026-01-17 21:32:23'),
(12, 'Sac Cadeau chat', 1, 100, 'Neuve', 1, 'download-696bf219202ed347107960.jpg', '2026-01-17 21:33:29'),
(13, 'Niche animale', 1, 65, 'Neuve', 1, 'niche-pour-animal-meyou-design-animaux-madame-decore-696bf263d058a109627835.jpg', '2026-01-17 21:34:43'),
(14, 'Lot', 1, 20, 'Neuve', 1, 'lot-de-3-gamelles-pour-696bf2836fb61244539495.webp', '2026-01-17 21:35:15'),
(15, 'Chiwawa', 1, 200, 'Chiwawa', 2, 'download-696bf2e3e8970422990919.jpg', '2026-01-17 21:36:51'),
(16, 'Petit race', 1, 250, 'Petit race', 2, 'download-1-696bf310d0416640973436.jpg', '2026-01-17 21:37:36'),
(17, 'Chien loup', 1, 400, 'Chien loup', 2, 'images-696bf387181a4644588190.jpg', '2026-01-17 21:39:35'),
(18, 'Slougi', 1, 250, 'Slougi', 2, 'images-1-696bf3aaefc2f693926800.jpg', '2026-01-17 21:40:10'),
(19, 'Chat Jeune', 1, 120, 'Chat Jeune', 1, '92-696bf3de6f3f7837100426.jpg', '2026-01-17 21:41:02'),
(20, 'Chat caniche', 1, 130, 'Chat caniche', 3, 'images-696bf41e8a3df005956238.jpg', '2026-01-17 21:42:06'),
(21, 'Belle chat', 0, 80, 'Belle chat', 3, 'images-1-696bf446a3b63474260677.jpg', '2026-01-17 21:42:46'),
(22, 'Turque chat', 1, 150, 'Turque chat', 3, 'sens-chat-085420-696bf46b1793d429615859.jpg', '2026-01-17 21:43:23'),
(23, 'Gloster Blanche', 1, 80, 'Gloster Blanche', 4, '0da7585a5a0b7fc3292e8d420c87cf93-696bf4995adb0599356768.jpg', '2026-01-17 21:44:09'),
(24, 'Couple satiné', 1, 300, 'Couple satiné', 4, 'canaris-jaunes-113014-650-400-696bf4c686359973554744.jpg', '2026-01-17 21:44:54'),
(25, 'Boumzaien', 1, 300, 'Boumzaien', 4, 'images-696bf4f2033f0485131159.jpg', '2026-01-17 21:45:38'),
(26, 'Peruche', 1, 80, 'Peruche', 4, 'images-1-696bf517beb02907485187.jpg', '2026-01-17 21:46:15'),
(27, 'Peruche tropicale', 1, 3500, 'Peruche tropicale', 4, 'oiseau-perruche-omnicolore-1-696bf55ecde71097936220.jpg', '2026-01-17 21:47:26'),
(28, 'Couple peruche tropicale', 1, 6000, 'Couple peruche tropicale', 4, 'perroquet-oiseau-couleur-696bf58ceef68848406595.jpg', '2026-01-17 21:48:12'),
(29, 'Couple peruche tanglaise', 1, 150, 'Couple peruche tanglaise', 4, 'perruche-anglaise-1-696bf5be00131963301125.jpg', '2026-01-17 21:49:02'),
(30, 'ZuPreem', 1, 120, 'ZuPreem', 7, '81wqkc4dj-l-ac-ul400-696bf5f3bcacb136180650.jpg', '2026-01-17 21:49:55'),
(31, 'Avmix', 1, 200, 'Avmix', 7, '703-696bf63572f2e186560286.png', '2026-01-17 21:51:01'),
(32, 'FruitBlend Flavor', 0, 100, 'FruitBlend Flavor', 7, 'alimento-para-canarios-fruitblend-1-g-696bf6694bcb0899237911.jpg', '2026-01-17 21:51:53'),
(33, 'Care', 1, 160, 'Care', 7, 'design-sans-titre3-696bf69b0de15455758110.jpg', '2026-01-17 21:52:43'),
(34, 'Royal canin', 1, 120, 'Royal canin', 7, 'images-1-696bf6ca50c88071952177.jpg', '2026-01-17 21:53:30'),
(35, 'pelulle', 1, 10, 'pellule', 8, 'abreuvoir-oiseaux-780-696ca4a00f789527998248.jpg', '2026-01-18 10:15:12');

-- --------------------------------------------------------

--
-- Structure de la table `categorie`
--

CREATE TABLE `categorie` (
  `id` int(11) NOT NULL,
  `nom_categorie` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `categorie`
--

INSERT INTO `categorie` (`id`, `nom_categorie`) VALUES
(1, 'Accesoire'),
(2, 'Chien'),
(3, 'Chat'),
(4, 'Oiseau'),
(7, 'Nutrition'),
(8, 'medicament');

-- --------------------------------------------------------

--
-- Structure de la table `doctrine_migration_versions`
--

CREATE TABLE `doctrine_migration_versions` (
  `version` varchar(191) NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20260101160121', '2026-01-01 17:01:46', 9);

-- --------------------------------------------------------

--
-- Structure de la table `messenger_messages`
--

CREATE TABLE `messenger_messages` (
  `id` bigint(20) NOT NULL,
  `body` longtext NOT NULL,
  `headers` longtext NOT NULL,
  `queue_name` varchar(190) NOT NULL,
  `created_at` datetime NOT NULL,
  `available_at` datetime NOT NULL,
  `delivered_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `email` varchar(180) NOT NULL,
  `roles` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '(DC2Type:json)' CHECK (json_valid(`roles`)),
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `email`, `roles`, `password`) VALUES
(1, 'marwen@gmail.com', '[\"ROLE_ADMIN\"]', '$2y$13$0thR2ZX17z40LT35chJWzuMxlO4YTVKOzQtbJQLTvWzVt2ZyLV2O6'),
(2, 'exemple@gmail.com', '[\"ROLE_USER\"]', '$2y$13$J.rA2i0vbi.HBBMGNKMfyOnlyV.ZlPI88YKcmCDCVs6ZD.HiiYbgu'),
(3, 'exemple1@gmail.com', '[\"ROLE_USER\"]', '$2y$13$bGJPb3hsMfg0OwsdhiR7vuvzt8YXVFCOwaZb.Khiaw5CeoGJtpvpu');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `article`
--
ALTER TABLE `article`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_23A0E66BCF5E72D` (`categorie_id`);

--
-- Index pour la table `categorie`
--
ALTER TABLE `categorie`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `doctrine_migration_versions`
--
ALTER TABLE `doctrine_migration_versions`
  ADD PRIMARY KEY (`version`);

--
-- Index pour la table `messenger_messages`
--
ALTER TABLE `messenger_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_75EA56E0FB7336F0` (`queue_name`),
  ADD KEY `IDX_75EA56E0E3BD61CE` (`available_at`),
  ADD KEY `IDX_75EA56E016BA31DB` (`delivered_at`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_8D93D649E7927C74` (`email`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `article`
--
ALTER TABLE `article`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT pour la table `categorie`
--
ALTER TABLE `categorie`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT pour la table `messenger_messages`
--
ALTER TABLE `messenger_messages`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `article`
--
ALTER TABLE `article`
  ADD CONSTRAINT `FK_23A0E66BCF5E72D` FOREIGN KEY (`categorie_id`) REFERENCES `categorie` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
