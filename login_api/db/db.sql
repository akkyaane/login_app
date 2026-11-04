-- Base de données de l'API login_api
-- Import : phpMyAdmin > Importer, ou : mysql -u root -p < login_app_plus.sql
--
-- Database: `login_app_plus`

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

CREATE DATABASE IF NOT EXISTS `login_app_plus` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE `login_app_plus`;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `firstName` varchar(255) NOT NULL,
  `lastName` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0-disabled,\r\n1-admin,\r\n2-user,\r\n3-responsible,\r\n4-responsible+1...'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--
-- password = password_hash( sha256(mot_de_passe) )
-- (l'application envoie déjà le SHA-256 du mot de passe)
--

INSERT INTO `users` (`id`, `firstName`, `lastName`, `email`, `password`, `role`) VALUES
(1, 'Jean', 'Dupont', 'jean@example.com', '$2y$12$ue93xWt28kLuvAefPzvvvOc0hEWRvC7vPB1Eq/f26YCs6cqd8VO9G', 2),
(2, 'Julie', 'Martin', 'julie@example.com', '$2y$12$GyBtS3.QQ8zBc.Dyn.nhreWtXp9vBHG5Uv1K1.MPkGn0.L8DxagE2', 1),
(3, 'Paul', 'Durand', 'paul@example.com', '$2y$12$zNolxzifUu000ezjpBGelO7vQcNH0qYiUph1.qasNCdJfXoJ58UJ6', 0);

/*
    jean@example.com  : password - 1234 : 2 - user
    julie@example.com : password - 4321 : 1 - admin
    paul@example.com  : password - 0000 : 0 - disabled (connexion refusée)
*/

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
