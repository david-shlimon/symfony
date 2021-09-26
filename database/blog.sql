-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Sep 26, 2021 at 11:40 AM
-- Server version: 5.7.33
-- PHP Version: 7.4.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `blog`
--

-- --------------------------------------------------------

--
-- Table structure for table `article`
--

CREATE TABLE `article` (
  `id` int(11) NOT NULL,
  `title` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `artdate` date NOT NULL,
  `arttext` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `artpic` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `article`
--

INSERT INTO `article` (`id`, `title`, `artdate`, `arttext`, `artpic`) VALUES
(1, 'Sit non.', '2021-06-09', 'Voluptate adipisci rerum atque sed officia nisi maxime dolorum illo sequi aut maiores quos est velit alias modi itaque officia est.', 'https://lorempixel.com/640/480/?28927'),
(2, 'Eum.', '2021-08-27', 'Laudantium voluptatem vel id autem iste eaque consequatur ab minus officiis unde laudantium impedit quae natus ullam sit laudantium deserunt.', 'https://lorempixel.com/640/480/?97627'),
(3, 'Tempora occaecati.', '2021-06-04', 'Dolores in et voluptas voluptatem rerum sit dolores accusamus libero velit iusto amet fugiat nulla est dolorem laborum.', 'https://lorempixel.com/640/480/?27584'),
(4, 'Alias totam.', '2021-07-05', 'Minima repudiandae qui velit numquam omnis alias et consequatur culpa quis sit nisi natus fugit.', 'https://lorempixel.com/640/480/?31147'),
(5, 'Cumque.', '2021-09-14', 'Earum aut eius et sit error maxime nobis aut sed iste at ea impedit libero vel rerum aspernatur necessitatibus aut repellendus.', 'https://lorempixel.com/640/480/?10271'),
(6, 'Voluptate.', '2021-09-06', 'Et quas placeat sunt eos expedita voluptatem libero ipsa aliquam ipsum laudantium quam ea iste autem ut ad eius delectus nihil dicta exercitationem totam.', 'https://lorempixel.com/640/480/?80731');

-- --------------------------------------------------------

--
-- Table structure for table `comment`
--

CREATE TABLE `comment` (
  `id` int(11) NOT NULL,
  `post_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `doctrine_migration_versions`
--

CREATE TABLE `doctrine_migration_versions` (
  `version` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20210920123157', '2021-09-25 22:31:17', 206),
('DoctrineMigrations\\Version20210922131207', '2021-09-25 22:31:17', 21),
('DoctrineMigrations\\Version20210923120852', '2021-09-25 22:31:17', 38),
('DoctrineMigrations\\Version20210923125200', '2021-09-25 22:31:17', 50);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` json NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `name`, `email`, `roles`, `password`) VALUES
(2, 'test', 'test@hotmail.fr', '[\"ROLE_ADMIN\"]', '$2y$13$3Rv9yIAQ06vRXFPR1CcpeOEqjjNl.I828PWiALgzbOtgAhqkPhU66'),
(3, 'test123', 'test123@hotmail.fr', '[]', '$2y$13$fZC1FXACUKNn9lw.COOmIufPIrpRcvunEbnhtwi4isNUNR1n.KsSy'),
(4, 'coucou', 'nouveau@hotmail.fr', '[]', '$2y$13$ZHpZRpKBhO1OB88WZls.l.ab5kgvwOsTBGLGNUcbaVQo7G8V3pFrO'),
(5, 'nouveau', 'nouveau2@hotmail.fr', '[]', '$2y$13$dRDUcKlD09J5NPuT8D.ftu0L9Z5P1Wq7NnUHsaPE49M.0ZXaxx3wC'),
(6, 'nouveau', 'nouveau3@hotmail.fr', '[]', '$2y$13$uSRfGiFVZxSUHB7pKwtrE.rlqEZZgN/fYbgEq4hVPaRb5.pFPOS4a'),
(7, 'nouveau', 'nouveau4@hotmail.fr', '[]', '$2y$13$4/mwHaT.p1sebm0o6gnDHe.q5c94gym018DXbPzMH4sGCV2F2N1/i'),
(8, 'nouveau', 'nouveau5@hotmail.fr', '[]', '$2y$13$y3ep/zk3U9HcSKN7fSriGePaEFQ20PWPEwm2Wcek5k50oe8KpHIY.'),
(9, 'admin', 'admin@hotmail.fr', '[\"ROLE_ADMIN\"]', '$2y$13$a/Wb3x5PTuIQqhR/DSIRuOGjhgn3.3Pp7OaJYZDTkpEQC1YF5GSua');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `article`
--
ALTER TABLE `article`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_9474526C4B89032C` (`post_id`);

--
-- Indexes for table `doctrine_migration_versions`
--
ALTER TABLE `doctrine_migration_versions`
  ADD PRIMARY KEY (`version`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_8D93D649E7927C74` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `article`
--
ALTER TABLE `article`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `comment`
--
ALTER TABLE `comment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `comment`
--
ALTER TABLE `comment`
  ADD CONSTRAINT `FK_9474526C4B89032C` FOREIGN KEY (`post_id`) REFERENCES `article` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
