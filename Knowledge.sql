-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:8889
-- Généré le : jeu. 28 nov. 2024 à 08:30
-- Version du serveur : 8.0.35
-- Version de PHP : 8.2.20

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `Knowledge`
--

-- --------------------------------------------------------

--
-- Structure de la table `certifications`
--

CREATE TABLE `certifications` (
  `certification_id` int NOT NULL,
  `user_id` int NOT NULL,
  `theme_id` int NOT NULL,
  `date_obtained` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `courses`
--

CREATE TABLE `courses` (
  `id` int NOT NULL,
  `theme_id` int NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `courses`
--

INSERT INTO `courses` (`id`, `theme_id`, `name`, `price`) VALUES
(1, 2, 'Initiation au développement web', 60),
(2, 1, 'Initiation à la guitare', 50),
(3, 1, 'Initiation au piano', 50),
(4, 3, 'Initiation au jardinage', 30),
(6, 4, 'Initiation à l\'art du dressage culinaire', 48),
(8, 4, 'Initiation à la cuisine', 44);

-- --------------------------------------------------------

--
-- Structure de la table `course_completion`
--

CREATE TABLE `course_completion` (
  `completion_id` int NOT NULL,
  `user_id` int NOT NULL,
  `course_id` int NOT NULL,
  `is_completed` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `course_completion`
--

INSERT INTO `course_completion` (`completion_id`, `user_id`, `course_id`, `is_completed`) VALUES
(1, 1, 1, 1),
(2, 1, 2, 1),
(3, 4, 1, 1),
(4, 1, 6, 1),
(5, 10, 1, 1);

-- --------------------------------------------------------

--
-- Structure de la table `doctrine_migration_versions`
--

CREATE TABLE `doctrine_migration_versions` (
  `version` varchar(191) COLLATE utf8mb3_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Déchargement des données de la table `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20241114142311', '2024-11-14 14:23:29', 13),
('DoctrineMigrations\\Version20241115162329', '2024-11-15 16:23:56', 99),
('DoctrineMigrations\\Version20241115164417', '2024-11-15 16:44:39', 27),
('DoctrineMigrations\\Version20241115171039', '2024-11-15 17:11:55', 15),
('DoctrineMigrations\\Version20241115212642', '2024-11-15 21:26:56', 21),
('DoctrineMigrations\\Version20241118094023', '2024-11-18 09:40:41', 13),
('DoctrineMigrations\\Version20241118132727', '2024-11-18 13:27:50', 45),
('DoctrineMigrations\\Version20241118173818', '2024-11-18 17:38:21', 17),
('DoctrineMigrations\\Version20241118180207', '2024-11-18 18:02:12', 30),
('DoctrineMigrations\\Version20241118181448', '2024-11-18 18:14:53', 16),
('DoctrineMigrations\\Version20241118182015', '2024-11-18 18:20:18', 20),
('DoctrineMigrations\\Version20241119092457', '2024-11-19 09:25:09', 12),
('DoctrineMigrations\\Version20241119095049', '2024-11-19 09:50:52', 10),
('DoctrineMigrations\\Version20241119101350', '2024-11-19 10:13:53', 9),
('DoctrineMigrations\\Version20241119142651', '2024-11-19 14:27:03', 23),
('DoctrineMigrations\\Version20241119144009', '2024-11-19 14:40:13', 9),
('DoctrineMigrations\\Version20241119145710', '2024-11-19 14:57:14', 23),
('DoctrineMigrations\\Version20241119145855', '2024-11-19 14:58:58', 10),
('DoctrineMigrations\\Version20241119151435', '2024-11-19 15:14:38', 11),
('DoctrineMigrations\\Version20241119152201', '2024-11-19 15:22:04', 16),
('DoctrineMigrations\\Version20241119152725', '2024-11-19 15:27:29', 11),
('DoctrineMigrations\\Version20241119154402', '2024-11-19 15:44:04', 33),
('DoctrineMigrations\\Version20241119165622', '2024-11-19 16:56:26', 17),
('DoctrineMigrations\\Version20241119172547', '2024-11-19 17:25:50', 17),
('DoctrineMigrations\\Version20241119174738', '2024-11-19 17:47:42', 20),
('DoctrineMigrations\\Version20241119174920', '2024-11-19 17:49:23', 18),
('DoctrineMigrations\\Version20241119174951', '2024-11-19 17:49:54', 15),
('DoctrineMigrations\\Version20241120045315', '2024-11-20 04:53:21', 33),
('DoctrineMigrations\\Version20241120065538', '2024-11-20 06:55:43', 37),
('DoctrineMigrations\\Version20241125133103', '2024-11-25 13:31:12', 47),
('DoctrineMigrations\\Version20241125133250', '2024-11-25 13:32:52', 49);

-- --------------------------------------------------------

--
-- Structure de la table `lessons`
--

CREATE TABLE `lessons` (
  `lesson_id` int NOT NULL,
  `courses_id_id` int NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  `learn` longtext COLLATE utf8mb4_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `lessons`
--

INSERT INTO `lessons` (`lesson_id`, `courses_id_id`, `name`, `price`, `content`, `learn`) VALUES
(1, 1, 'Leçon n°1', 32, 'Les langages HTML et CSS', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc ullamcorper lectus in sem scelerisque pharetra. Suspendisse pharetra augue quis rhoncus luctus. Pellentesque lorem erat, viverra sed nisl sit amet, auctor lacinia mi. Pellentesque sollicitudin cursus magna at posuere. Donec porttitor, arcu ut sagittis rhoncus, augue risus euismod lorem, ac scelerisque dolor tellus nec orci. Vivamus dapibus viverra nunc vitae eleifend. Vivamus mattis elit tellus, et porttitor mauris faucibus eu. Ut aliquam in tortor et scelerisque. Etiam lacinia malesuada turpis, nec tempor ligula luctus a. Nunc hendrerit sem at ante vestibulum, in convallis sapien faucibus. Donec lacinia venenatis diam nec venenatis. Proin ex lorem, luctus vitae neque et, suscipit rhoncus eros.\n\nAenean a ultricies velit. Proin ullamcorper, est eget tempus venenatis, ex leo lobortis arcu, sed interdum nisi odio vel lorem. Curabitur sagittis ipsum nulla, vehicula ullamcorper nisi suscipit sed. Suspendisse velit nibh, tempor vitae ex eget, congue condimentum odio. Sed sit amet magna ex. Nullam mattis posuere eros sit amet varius. Fusce pellentesque nisi sapien, porta tristique mauris faucibus ut. Integer molestie neque ornare ipsum tempor, at mattis ligula congue. Praesent viverra enim nibh, id tempus nibh accumsan ut. Ut in nibh mattis, dictum arcu nec, consectetur dui. Aenean egestas efficitur facilisis. Integer vitae semper nisl. Morbi nec egestas mi, sed auctor sem. Etiam pretium vehicula libero laoreet viverra. Integer semper dapibus neque vitae sodales. Donec pellentesque euismod leo, quis scelerisque nunc fermentum ut.\n\nMorbi blandit dui justo, eget accumsan mauris porttitor a. In vitae orci nec erat fermentum dignissim. Pellentesque rutrum leo ac metus varius porta. Duis posuere auctor nisl, pulvinar luctus mi mollis id. Donec condimentum orci non sapien pulvinar, in aliquam est porttitor. Integer lorem sem, lobortis quis ornare a, interdum sit amet nulla. Praesent et dapibus turpis. Cras vel rhoncus magna, nec blandit massa. In eu vehicula elit. Nam tincidunt mauris et consectetur fringilla. Quisque blandit sapien et tortor commodo, vitae porta diam vehicula. Etiam et ex purus. Sed in ultrices mi, vitae tristique nunc. Mauris arcu libero, blandit id urna eu, faucibus interdum magna.\n\nPraesent vitae sem molestie, blandit purus vel, vestibulum lacus. Proin semper, nulla vitae finibus eleifend, mi elit rutrum lacus, eu molestie ante tortor eu nunc. Suspendisse fermentum finibus mi. Vestibulum congue ante eget lacus consequat pulvinar. Ut luctus ultricies neque, eu convallis justo tincidunt et. Suspendisse imperdiet pharetra diam, sed gravida quam dignissim quis. Duis blandit rutrum eros at viverra.\n\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Donec diam felis, lobortis vitae faucibus a, pretium vel dolor. Sed iaculis id lorem at consequat. Praesent ante nulla, vehicula et dignissim non, interdum at turpis. Aliquam vel ligula et nisl porttitor consequat id eleifend mauris. Curabitur a lorem eu dui dapibus convallis vel eu ligula. Mauris sit amet mauris risus. Nullam ut dui nisi. Mauris blandit varius elementum.'),
(2, 1, 'Leçon n°2', 32, 'Dynamiser votre site en Javascript', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc ullamcorper lectus in sem scelerisque pharetra. Suspendisse pharetra augue quis rhoncus luctus. Pellentesque lorem erat, viverra sed nisl sit amet, auctor lacinia mi. Pellentesque sollicitudin cursus magna at posuere. Donec porttitor, arcu ut sagittis rhoncus, augue risus euismod lorem, ac scelerisque dolor tellus nec orci. Vivamus dapibus viverra nunc vitae eleifend. Vivamus mattis elit tellus, et porttitor mauris faucibus eu. Ut aliquam in tortor et scelerisque. Etiam lacinia malesuada turpis, nec tempor ligula luctus a. Nunc hendrerit sem at ante vestibulum, in convallis sapien faucibus. Donec lacinia venenatis diam nec venenatis. Proin ex lorem, luctus vitae neque et, suscipit rhoncus eros.\n\nAenean a ultricies velit. Proin ullamcorper, est eget tempus venenatis, ex leo lobortis arcu, sed interdum nisi odio vel lorem. Curabitur sagittis ipsum nulla, vehicula ullamcorper nisi suscipit sed. Suspendisse velit nibh, tempor vitae ex eget, congue condimentum odio. Sed sit amet magna ex. Nullam mattis posuere eros sit amet varius. Fusce pellentesque nisi sapien, porta tristique mauris faucibus ut. Integer molestie neque ornare ipsum tempor, at mattis ligula congue. Praesent viverra enim nibh, id tempus nibh accumsan ut. Ut in nibh mattis, dictum arcu nec, consectetur dui. Aenean egestas efficitur facilisis. Integer vitae semper nisl. Morbi nec egestas mi, sed auctor sem. Etiam pretium vehicula libero laoreet viverra. Integer semper dapibus neque vitae sodales. Donec pellentesque euismod leo, quis scelerisque nunc fermentum ut.\n\nMorbi blandit dui justo, eget accumsan mauris porttitor a. In vitae orci nec erat fermentum dignissim. Pellentesque rutrum leo ac metus varius porta. Duis posuere auctor nisl, pulvinar luctus mi mollis id. Donec condimentum orci non sapien pulvinar, in aliquam est porttitor. Integer lorem sem, lobortis quis ornare a, interdum sit amet nulla. Praesent et dapibus turpis. Cras vel rhoncus magna, nec blandit massa. In eu vehicula elit. Nam tincidunt mauris et consectetur fringilla. Quisque blandit sapien et tortor commodo, vitae porta diam vehicula. Etiam et ex purus. Sed in ultrices mi, vitae tristique nunc. Mauris arcu libero, blandit id urna eu, faucibus interdum magna.\n\nPraesent vitae sem molestie, blandit purus vel, vestibulum lacus. Proin semper, nulla vitae finibus eleifend, mi elit rutrum lacus, eu molestie ante tortor eu nunc. Suspendisse fermentum finibus mi. Vestibulum congue ante eget lacus consequat pulvinar. Ut luctus ultricies neque, eu convallis justo tincidunt et. Suspendisse imperdiet pharetra diam, sed gravida quam dignissim quis. Duis blandit rutrum eros at viverra.\n\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Donec diam felis, lobortis vitae faucibus a, pretium vel dolor. Sed iaculis id lorem at consequat. Praesent ante nulla, vehicula et dignissim non, interdum at turpis. Aliquam vel ligula et nisl porttitor consequat id eleifend mauris. Curabitur a lorem eu dui dapibus convallis vel eu ligula. Mauris sit amet mauris risus. Nullam ut dui nisi. Mauris blandit varius elementum.'),
(3, 2, 'Leçon n°1', 26, 'Découverte de l\'instrument', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc ullamcorper lectus in sem scelerisque pharetra. Suspendisse pharetra augue quis rhoncus luctus. Pellentesque lorem erat, viverra sed nisl sit amet, auctor lacinia mi. Pellentesque sollicitudin cursus magna at posuere. Donec porttitor, arcu ut sagittis rhoncus, augue risus euismod lorem, ac scelerisque dolor tellus nec orci. Vivamus dapibus viverra nunc vitae eleifend. Vivamus mattis elit tellus, et porttitor mauris faucibus eu. Ut aliquam in tortor et scelerisque. Etiam lacinia malesuada turpis, nec tempor ligula luctus a. Nunc hendrerit sem at ante vestibulum, in convallis sapien faucibus. Donec lacinia venenatis diam nec venenatis. Proin ex lorem, luctus vitae neque et, suscipit rhoncus eros.\n\nAenean a ultricies velit. Proin ullamcorper, est eget tempus venenatis, ex leo lobortis arcu, sed interdum nisi odio vel lorem. Curabitur sagittis ipsum nulla, vehicula ullamcorper nisi suscipit sed. Suspendisse velit nibh, tempor vitae ex eget, congue condimentum odio. Sed sit amet magna ex. Nullam mattis posuere eros sit amet varius. Fusce pellentesque nisi sapien, porta tristique mauris faucibus ut. Integer molestie neque ornare ipsum tempor, at mattis ligula congue. Praesent viverra enim nibh, id tempus nibh accumsan ut. Ut in nibh mattis, dictum arcu nec, consectetur dui. Aenean egestas efficitur facilisis. Integer vitae semper nisl. Morbi nec egestas mi, sed auctor sem. Etiam pretium vehicula libero laoreet viverra. Integer semper dapibus neque vitae sodales. Donec pellentesque euismod leo, quis scelerisque nunc fermentum ut.\n\nMorbi blandit dui justo, eget accumsan mauris porttitor a. In vitae orci nec erat fermentum dignissim. Pellentesque rutrum leo ac metus varius porta. Duis posuere auctor nisl, pulvinar luctus mi mollis id. Donec condimentum orci non sapien pulvinar, in aliquam est porttitor. Integer lorem sem, lobortis quis ornare a, interdum sit amet nulla. Praesent et dapibus turpis. Cras vel rhoncus magna, nec blandit massa. In eu vehicula elit. Nam tincidunt mauris et consectetur fringilla. Quisque blandit sapien et tortor commodo, vitae porta diam vehicula. Etiam et ex purus. Sed in ultrices mi, vitae tristique nunc. Mauris arcu libero, blandit id urna eu, faucibus interdum magna.\n\nPraesent vitae sem molestie, blandit purus vel, vestibulum lacus. Proin semper, nulla vitae finibus eleifend, mi elit rutrum lacus, eu molestie ante tortor eu nunc. Suspendisse fermentum finibus mi. Vestibulum congue ante eget lacus consequat pulvinar. Ut luctus ultricies neque, eu convallis justo tincidunt et. Suspendisse imperdiet pharetra diam, sed gravida quam dignissim quis. Duis blandit rutrum eros at viverra.\n\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Donec diam felis, lobortis vitae faucibus a, pretium vel dolor. Sed iaculis id lorem at consequat. Praesent ante nulla, vehicula et dignissim non, interdum at turpis. Aliquam vel ligula et nisl porttitor consequat id eleifend mauris. Curabitur a lorem eu dui dapibus convallis vel eu ligula. Mauris sit amet mauris risus. Nullam ut dui nisi. Mauris blandit varius elementum.'),
(4, 2, 'Leçon n°2', 26, 'Les accords et les gammes', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc ullamcorper lectus in sem scelerisque pharetra. Suspendisse pharetra augue quis rhoncus luctus. Pellentesque lorem erat, viverra sed nisl sit amet, auctor lacinia mi. Pellentesque sollicitudin cursus magna at posuere. Donec porttitor, arcu ut sagittis rhoncus, augue risus euismod lorem, ac scelerisque dolor tellus nec orci. Vivamus dapibus viverra nunc vitae eleifend. Vivamus mattis elit tellus, et porttitor mauris faucibus eu. Ut aliquam in tortor et scelerisque. Etiam lacinia malesuada turpis, nec tempor ligula luctus a. Nunc hendrerit sem at ante vestibulum, in convallis sapien faucibus. Donec lacinia venenatis diam nec venenatis. Proin ex lorem, luctus vitae neque et, suscipit rhoncus eros.\n\nAenean a ultricies velit. Proin ullamcorper, est eget tempus venenatis, ex leo lobortis arcu, sed interdum nisi odio vel lorem. Curabitur sagittis ipsum nulla, vehicula ullamcorper nisi suscipit sed. Suspendisse velit nibh, tempor vitae ex eget, congue condimentum odio. Sed sit amet magna ex. Nullam mattis posuere eros sit amet varius. Fusce pellentesque nisi sapien, porta tristique mauris faucibus ut. Integer molestie neque ornare ipsum tempor, at mattis ligula congue. Praesent viverra enim nibh, id tempus nibh accumsan ut. Ut in nibh mattis, dictum arcu nec, consectetur dui. Aenean egestas efficitur facilisis. Integer vitae semper nisl. Morbi nec egestas mi, sed auctor sem. Etiam pretium vehicula libero laoreet viverra. Integer semper dapibus neque vitae sodales. Donec pellentesque euismod leo, quis scelerisque nunc fermentum ut.\n\nMorbi blandit dui justo, eget accumsan mauris porttitor a. In vitae orci nec erat fermentum dignissim. Pellentesque rutrum leo ac metus varius porta. Duis posuere auctor nisl, pulvinar luctus mi mollis id. Donec condimentum orci non sapien pulvinar, in aliquam est porttitor. Integer lorem sem, lobortis quis ornare a, interdum sit amet nulla. Praesent et dapibus turpis. Cras vel rhoncus magna, nec blandit massa. In eu vehicula elit. Nam tincidunt mauris et consectetur fringilla. Quisque blandit sapien et tortor commodo, vitae porta diam vehicula. Etiam et ex purus. Sed in ultrices mi, vitae tristique nunc. Mauris arcu libero, blandit id urna eu, faucibus interdum magna.\n\nPraesent vitae sem molestie, blandit purus vel, vestibulum lacus. Proin semper, nulla vitae finibus eleifend, mi elit rutrum lacus, eu molestie ante tortor eu nunc. Suspendisse fermentum finibus mi. Vestibulum congue ante eget lacus consequat pulvinar. Ut luctus ultricies neque, eu convallis justo tincidunt et. Suspendisse imperdiet pharetra diam, sed gravida quam dignissim quis. Duis blandit rutrum eros at viverra.\n\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Donec diam felis, lobortis vitae faucibus a, pretium vel dolor. Sed iaculis id lorem at consequat. Praesent ante nulla, vehicula et dignissim non, interdum at turpis. Aliquam vel ligula et nisl porttitor consequat id eleifend mauris. Curabitur a lorem eu dui dapibus convallis vel eu ligula. Mauris sit amet mauris risus. Nullam ut dui nisi. Mauris blandit varius elementum.'),
(5, 3, 'Leçon n°1', 26, 'Découverte de l\'instrument', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc ullamcorper lectus in sem scelerisque pharetra. Suspendisse pharetra augue quis rhoncus luctus. Pellentesque lorem erat, viverra sed nisl sit amet, auctor lacinia mi. Pellentesque sollicitudin cursus magna at posuere. Donec porttitor, arcu ut sagittis rhoncus, augue risus euismod lorem, ac scelerisque dolor tellus nec orci. Vivamus dapibus viverra nunc vitae eleifend. Vivamus mattis elit tellus, et porttitor mauris faucibus eu. Ut aliquam in tortor et scelerisque. Etiam lacinia malesuada turpis, nec tempor ligula luctus a. Nunc hendrerit sem at ante vestibulum, in convallis sapien faucibus. Donec lacinia venenatis diam nec venenatis. Proin ex lorem, luctus vitae neque et, suscipit rhoncus eros.\n\nAenean a ultricies velit. Proin ullamcorper, est eget tempus venenatis, ex leo lobortis arcu, sed interdum nisi odio vel lorem. Curabitur sagittis ipsum nulla, vehicula ullamcorper nisi suscipit sed. Suspendisse velit nibh, tempor vitae ex eget, congue condimentum odio. Sed sit amet magna ex. Nullam mattis posuere eros sit amet varius. Fusce pellentesque nisi sapien, porta tristique mauris faucibus ut. Integer molestie neque ornare ipsum tempor, at mattis ligula congue. Praesent viverra enim nibh, id tempus nibh accumsan ut. Ut in nibh mattis, dictum arcu nec, consectetur dui. Aenean egestas efficitur facilisis. Integer vitae semper nisl. Morbi nec egestas mi, sed auctor sem. Etiam pretium vehicula libero laoreet viverra. Integer semper dapibus neque vitae sodales. Donec pellentesque euismod leo, quis scelerisque nunc fermentum ut.\n\nMorbi blandit dui justo, eget accumsan mauris porttitor a. In vitae orci nec erat fermentum dignissim. Pellentesque rutrum leo ac metus varius porta. Duis posuere auctor nisl, pulvinar luctus mi mollis id. Donec condimentum orci non sapien pulvinar, in aliquam est porttitor. Integer lorem sem, lobortis quis ornare a, interdum sit amet nulla. Praesent et dapibus turpis. Cras vel rhoncus magna, nec blandit massa. In eu vehicula elit. Nam tincidunt mauris et consectetur fringilla. Quisque blandit sapien et tortor commodo, vitae porta diam vehicula. Etiam et ex purus. Sed in ultrices mi, vitae tristique nunc. Mauris arcu libero, blandit id urna eu, faucibus interdum magna.\n\nPraesent vitae sem molestie, blandit purus vel, vestibulum lacus. Proin semper, nulla vitae finibus eleifend, mi elit rutrum lacus, eu molestie ante tortor eu nunc. Suspendisse fermentum finibus mi. Vestibulum congue ante eget lacus consequat pulvinar. Ut luctus ultricies neque, eu convallis justo tincidunt et. Suspendisse imperdiet pharetra diam, sed gravida quam dignissim quis. Duis blandit rutrum eros at viverra.\n\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Donec diam felis, lobortis vitae faucibus a, pretium vel dolor. Sed iaculis id lorem at consequat. Praesent ante nulla, vehicula et dignissim non, interdum at turpis. Aliquam vel ligula et nisl porttitor consequat id eleifend mauris. Curabitur a lorem eu dui dapibus convallis vel eu ligula. Mauris sit amet mauris risus. Nullam ut dui nisi. Mauris blandit varius elementum.'),
(6, 3, 'Leçon n°2', 26, 'Les accords et les gammes', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc ullamcorper lectus in sem scelerisque pharetra. Suspendisse pharetra augue quis rhoncus luctus. Pellentesque lorem erat, viverra sed nisl sit amet, auctor lacinia mi. Pellentesque sollicitudin cursus magna at posuere. Donec porttitor, arcu ut sagittis rhoncus, augue risus euismod lorem, ac scelerisque dolor tellus nec orci. Vivamus dapibus viverra nunc vitae eleifend. Vivamus mattis elit tellus, et porttitor mauris faucibus eu. Ut aliquam in tortor et scelerisque. Etiam lacinia malesuada turpis, nec tempor ligula luctus a. Nunc hendrerit sem at ante vestibulum, in convallis sapien faucibus. Donec lacinia venenatis diam nec venenatis. Proin ex lorem, luctus vitae neque et, suscipit rhoncus eros.\n\nAenean a ultricies velit. Proin ullamcorper, est eget tempus venenatis, ex leo lobortis arcu, sed interdum nisi odio vel lorem. Curabitur sagittis ipsum nulla, vehicula ullamcorper nisi suscipit sed. Suspendisse velit nibh, tempor vitae ex eget, congue condimentum odio. Sed sit amet magna ex. Nullam mattis posuere eros sit amet varius. Fusce pellentesque nisi sapien, porta tristique mauris faucibus ut. Integer molestie neque ornare ipsum tempor, at mattis ligula congue. Praesent viverra enim nibh, id tempus nibh accumsan ut. Ut in nibh mattis, dictum arcu nec, consectetur dui. Aenean egestas efficitur facilisis. Integer vitae semper nisl. Morbi nec egestas mi, sed auctor sem. Etiam pretium vehicula libero laoreet viverra. Integer semper dapibus neque vitae sodales. Donec pellentesque euismod leo, quis scelerisque nunc fermentum ut.\n\nMorbi blandit dui justo, eget accumsan mauris porttitor a. In vitae orci nec erat fermentum dignissim. Pellentesque rutrum leo ac metus varius porta. Duis posuere auctor nisl, pulvinar luctus mi mollis id. Donec condimentum orci non sapien pulvinar, in aliquam est porttitor. Integer lorem sem, lobortis quis ornare a, interdum sit amet nulla. Praesent et dapibus turpis. Cras vel rhoncus magna, nec blandit massa. In eu vehicula elit. Nam tincidunt mauris et consectetur fringilla. Quisque blandit sapien et tortor commodo, vitae porta diam vehicula. Etiam et ex purus. Sed in ultrices mi, vitae tristique nunc. Mauris arcu libero, blandit id urna eu, faucibus interdum magna.\n\nPraesent vitae sem molestie, blandit purus vel, vestibulum lacus. Proin semper, nulla vitae finibus eleifend, mi elit rutrum lacus, eu molestie ante tortor eu nunc. Suspendisse fermentum finibus mi. Vestibulum congue ante eget lacus consequat pulvinar. Ut luctus ultricies neque, eu convallis justo tincidunt et. Suspendisse imperdiet pharetra diam, sed gravida quam dignissim quis. Duis blandit rutrum eros at viverra.\n\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Donec diam felis, lobortis vitae faucibus a, pretium vel dolor. Sed iaculis id lorem at consequat. Praesent ante nulla, vehicula et dignissim non, interdum at turpis. Aliquam vel ligula et nisl porttitor consequat id eleifend mauris. Curabitur a lorem eu dui dapibus convallis vel eu ligula. Mauris sit amet mauris risus. Nullam ut dui nisi. Mauris blandit varius elementum.'),
(7, 4, 'Leçon n°1', 16, 'Les outils du jardinier', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc ullamcorper lectus in sem scelerisque pharetra. Suspendisse pharetra augue quis rhoncus luctus. Pellentesque lorem erat, viverra sed nisl sit amet, auctor lacinia mi. Pellentesque sollicitudin cursus magna at posuere. Donec porttitor, arcu ut sagittis rhoncus, augue risus euismod lorem, ac scelerisque dolor tellus nec orci. Vivamus dapibus viverra nunc vitae eleifend. Vivamus mattis elit tellus, et porttitor mauris faucibus eu. Ut aliquam in tortor et scelerisque. Etiam lacinia malesuada turpis, nec tempor ligula luctus a. Nunc hendrerit sem at ante vestibulum, in convallis sapien faucibus. Donec lacinia venenatis diam nec venenatis. Proin ex lorem, luctus vitae neque et, suscipit rhoncus eros.\n\nAenean a ultricies velit. Proin ullamcorper, est eget tempus venenatis, ex leo lobortis arcu, sed interdum nisi odio vel lorem. Curabitur sagittis ipsum nulla, vehicula ullamcorper nisi suscipit sed. Suspendisse velit nibh, tempor vitae ex eget, congue condimentum odio. Sed sit amet magna ex. Nullam mattis posuere eros sit amet varius. Fusce pellentesque nisi sapien, porta tristique mauris faucibus ut. Integer molestie neque ornare ipsum tempor, at mattis ligula congue. Praesent viverra enim nibh, id tempus nibh accumsan ut. Ut in nibh mattis, dictum arcu nec, consectetur dui. Aenean egestas efficitur facilisis. Integer vitae semper nisl. Morbi nec egestas mi, sed auctor sem. Etiam pretium vehicula libero laoreet viverra. Integer semper dapibus neque vitae sodales. Donec pellentesque euismod leo, quis scelerisque nunc fermentum ut.\n\nMorbi blandit dui justo, eget accumsan mauris porttitor a. In vitae orci nec erat fermentum dignissim. Pellentesque rutrum leo ac metus varius porta. Duis posuere auctor nisl, pulvinar luctus mi mollis id. Donec condimentum orci non sapien pulvinar, in aliquam est porttitor. Integer lorem sem, lobortis quis ornare a, interdum sit amet nulla. Praesent et dapibus turpis. Cras vel rhoncus magna, nec blandit massa. In eu vehicula elit. Nam tincidunt mauris et consectetur fringilla. Quisque blandit sapien et tortor commodo, vitae porta diam vehicula. Etiam et ex purus. Sed in ultrices mi, vitae tristique nunc. Mauris arcu libero, blandit id urna eu, faucibus interdum magna.\n\nPraesent vitae sem molestie, blandit purus vel, vestibulum lacus. Proin semper, nulla vitae finibus eleifend, mi elit rutrum lacus, eu molestie ante tortor eu nunc. Suspendisse fermentum finibus mi. Vestibulum congue ante eget lacus consequat pulvinar. Ut luctus ultricies neque, eu convallis justo tincidunt et. Suspendisse imperdiet pharetra diam, sed gravida quam dignissim quis. Duis blandit rutrum eros at viverra.\n\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Donec diam felis, lobortis vitae faucibus a, pretium vel dolor. Sed iaculis id lorem at consequat. Praesent ante nulla, vehicula et dignissim non, interdum at turpis. Aliquam vel ligula et nisl porttitor consequat id eleifend mauris. Curabitur a lorem eu dui dapibus convallis vel eu ligula. Mauris sit amet mauris risus. Nullam ut dui nisi. Mauris blandit varius elementum.'),
(8, 4, 'Leçon n°2', 16, 'Jardiner avec la lune', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc ullamcorper lectus in sem scelerisque pharetra. Suspendisse pharetra augue quis rhoncus luctus. Pellentesque lorem erat, viverra sed nisl sit amet, auctor lacinia mi. Pellentesque sollicitudin cursus magna at posuere. Donec porttitor, arcu ut sagittis rhoncus, augue risus euismod lorem, ac scelerisque dolor tellus nec orci. Vivamus dapibus viverra nunc vitae eleifend. Vivamus mattis elit tellus, et porttitor mauris faucibus eu. Ut aliquam in tortor et scelerisque. Etiam lacinia malesuada turpis, nec tempor ligula luctus a. Nunc hendrerit sem at ante vestibulum, in convallis sapien faucibus. Donec lacinia venenatis diam nec venenatis. Proin ex lorem, luctus vitae neque et, suscipit rhoncus eros.\n\nAenean a ultricies velit. Proin ullamcorper, est eget tempus venenatis, ex leo lobortis arcu, sed interdum nisi odio vel lorem. Curabitur sagittis ipsum nulla, vehicula ullamcorper nisi suscipit sed. Suspendisse velit nibh, tempor vitae ex eget, congue condimentum odio. Sed sit amet magna ex. Nullam mattis posuere eros sit amet varius. Fusce pellentesque nisi sapien, porta tristique mauris faucibus ut. Integer molestie neque ornare ipsum tempor, at mattis ligula congue. Praesent viverra enim nibh, id tempus nibh accumsan ut. Ut in nibh mattis, dictum arcu nec, consectetur dui. Aenean egestas efficitur facilisis. Integer vitae semper nisl. Morbi nec egestas mi, sed auctor sem. Etiam pretium vehicula libero laoreet viverra. Integer semper dapibus neque vitae sodales. Donec pellentesque euismod leo, quis scelerisque nunc fermentum ut.\n\nMorbi blandit dui justo, eget accumsan mauris porttitor a. In vitae orci nec erat fermentum dignissim. Pellentesque rutrum leo ac metus varius porta. Duis posuere auctor nisl, pulvinar luctus mi mollis id. Donec condimentum orci non sapien pulvinar, in aliquam est porttitor. Integer lorem sem, lobortis quis ornare a, interdum sit amet nulla. Praesent et dapibus turpis. Cras vel rhoncus magna, nec blandit massa. In eu vehicula elit. Nam tincidunt mauris et consectetur fringilla. Quisque blandit sapien et tortor commodo, vitae porta diam vehicula. Etiam et ex purus. Sed in ultrices mi, vitae tristique nunc. Mauris arcu libero, blandit id urna eu, faucibus interdum magna.\n\nPraesent vitae sem molestie, blandit purus vel, vestibulum lacus. Proin semper, nulla vitae finibus eleifend, mi elit rutrum lacus, eu molestie ante tortor eu nunc. Suspendisse fermentum finibus mi. Vestibulum congue ante eget lacus consequat pulvinar. Ut luctus ultricies neque, eu convallis justo tincidunt et. Suspendisse imperdiet pharetra diam, sed gravida quam dignissim quis. Duis blandit rutrum eros at viverra.\n\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Donec diam felis, lobortis vitae faucibus a, pretium vel dolor. Sed iaculis id lorem at consequat. Praesent ante nulla, vehicula et dignissim non, interdum at turpis. Aliquam vel ligula et nisl porttitor consequat id eleifend mauris. Curabitur a lorem eu dui dapibus convallis vel eu ligula. Mauris sit amet mauris risus. Nullam ut dui nisi. Mauris blandit varius elementum.'),
(11, 6, 'Leçon n°1', 26, 'Mettre en oeuvre le style dans l\'assiette', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc ullamcorper lectus in sem scelerisque pharetra. Suspendisse pharetra augue quis rhoncus luctus. Pellentesque lorem erat, viverra sed nisl sit amet, auctor lacinia mi. Pellentesque sollicitudin cursus magna at posuere. Donec porttitor, arcu ut sagittis rhoncus, augue risus euismod lorem, ac scelerisque dolor tellus nec orci. Vivamus dapibus viverra nunc vitae eleifend. Vivamus mattis elit tellus, et porttitor mauris faucibus eu. Ut aliquam in tortor et scelerisque. Etiam lacinia malesuada turpis, nec tempor ligula luctus a. Nunc hendrerit sem at ante vestibulum, in convallis sapien faucibus. Donec lacinia venenatis diam nec venenatis. Proin ex lorem, luctus vitae neque et, suscipit rhoncus eros.\n\nAenean a ultricies velit. Proin ullamcorper, est eget tempus venenatis, ex leo lobortis arcu, sed interdum nisi odio vel lorem. Curabitur sagittis ipsum nulla, vehicula ullamcorper nisi suscipit sed. Suspendisse velit nibh, tempor vitae ex eget, congue condimentum odio. Sed sit amet magna ex. Nullam mattis posuere eros sit amet varius. Fusce pellentesque nisi sapien, porta tristique mauris faucibus ut. Integer molestie neque ornare ipsum tempor, at mattis ligula congue. Praesent viverra enim nibh, id tempus nibh accumsan ut. Ut in nibh mattis, dictum arcu nec, consectetur dui. Aenean egestas efficitur facilisis. Integer vitae semper nisl. Morbi nec egestas mi, sed auctor sem. Etiam pretium vehicula libero laoreet viverra. Integer semper dapibus neque vitae sodales. Donec pellentesque euismod leo, quis scelerisque nunc fermentum ut.\n\nMorbi blandit dui justo, eget accumsan mauris porttitor a. In vitae orci nec erat fermentum dignissim. Pellentesque rutrum leo ac metus varius porta. Duis posuere auctor nisl, pulvinar luctus mi mollis id. Donec condimentum orci non sapien pulvinar, in aliquam est porttitor. Integer lorem sem, lobortis quis ornare a, interdum sit amet nulla. Praesent et dapibus turpis. Cras vel rhoncus magna, nec blandit massa. In eu vehicula elit. Nam tincidunt mauris et consectetur fringilla. Quisque blandit sapien et tortor commodo, vitae porta diam vehicula. Etiam et ex purus. Sed in ultrices mi, vitae tristique nunc. Mauris arcu libero, blandit id urna eu, faucibus interdum magna.\n\nPraesent vitae sem molestie, blandit purus vel, vestibulum lacus. Proin semper, nulla vitae finibus eleifend, mi elit rutrum lacus, eu molestie ante tortor eu nunc. Suspendisse fermentum finibus mi. Vestibulum congue ante eget lacus consequat pulvinar. Ut luctus ultricies neque, eu convallis justo tincidunt et. Suspendisse imperdiet pharetra diam, sed gravida quam dignissim quis. Duis blandit rutrum eros at viverra.\n\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Donec diam felis, lobortis vitae faucibus a, pretium vel dolor. Sed iaculis id lorem at consequat. Praesent ante nulla, vehicula et dignissim non, interdum at turpis. Aliquam vel ligula et nisl porttitor consequat id eleifend mauris. Curabitur a lorem eu dui dapibus convallis vel eu ligula. Mauris sit amet mauris risus. Nullam ut dui nisi. Mauris blandit varius elementum.'),
(12, 6, 'Leçon n°2', 26, 'Harmoniser un repas à quatre plats', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc ullamcorper lectus in sem scelerisque pharetra. Suspendisse pharetra augue quis rhoncus luctus. Pellentesque lorem erat, viverra sed nisl sit amet, auctor lacinia mi. Pellentesque sollicitudin cursus magna at posuere. Donec porttitor, arcu ut sagittis rhoncus, augue risus euismod lorem, ac scelerisque dolor tellus nec orci. Vivamus dapibus viverra nunc vitae eleifend. Vivamus mattis elit tellus, et porttitor mauris faucibus eu. Ut aliquam in tortor et scelerisque. Etiam lacinia malesuada turpis, nec tempor ligula luctus a. Nunc hendrerit sem at ante vestibulum, in convallis sapien faucibus. Donec lacinia venenatis diam nec venenatis. Proin ex lorem, luctus vitae neque et, suscipit rhoncus eros.\n\nAenean a ultricies velit. Proin ullamcorper, est eget tempus venenatis, ex leo lobortis arcu, sed interdum nisi odio vel lorem. Curabitur sagittis ipsum nulla, vehicula ullamcorper nisi suscipit sed. Suspendisse velit nibh, tempor vitae ex eget, congue condimentum odio. Sed sit amet magna ex. Nullam mattis posuere eros sit amet varius. Fusce pellentesque nisi sapien, porta tristique mauris faucibus ut. Integer molestie neque ornare ipsum tempor, at mattis ligula congue. Praesent viverra enim nibh, id tempus nibh accumsan ut. Ut in nibh mattis, dictum arcu nec, consectetur dui. Aenean egestas efficitur facilisis. Integer vitae semper nisl. Morbi nec egestas mi, sed auctor sem. Etiam pretium vehicula libero laoreet viverra. Integer semper dapibus neque vitae sodales. Donec pellentesque euismod leo, quis scelerisque nunc fermentum ut.\n\nMorbi blandit dui justo, eget accumsan mauris porttitor a. In vitae orci nec erat fermentum dignissim. Pellentesque rutrum leo ac metus varius porta. Duis posuere auctor nisl, pulvinar luctus mi mollis id. Donec condimentum orci non sapien pulvinar, in aliquam est porttitor. Integer lorem sem, lobortis quis ornare a, interdum sit amet nulla. Praesent et dapibus turpis. Cras vel rhoncus magna, nec blandit massa. In eu vehicula elit. Nam tincidunt mauris et consectetur fringilla. Quisque blandit sapien et tortor commodo, vitae porta diam vehicula. Etiam et ex purus. Sed in ultrices mi, vitae tristique nunc. Mauris arcu libero, blandit id urna eu, faucibus interdum magna.\n\nPraesent vitae sem molestie, blandit purus vel, vestibulum lacus. Proin semper, nulla vitae finibus eleifend, mi elit rutrum lacus, eu molestie ante tortor eu nunc. Suspendisse fermentum finibus mi. Vestibulum congue ante eget lacus consequat pulvinar. Ut luctus ultricies neque, eu convallis justo tincidunt et. Suspendisse imperdiet pharetra diam, sed gravida quam dignissim quis. Duis blandit rutrum eros at viverra.\n\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Donec diam felis, lobortis vitae faucibus a, pretium vel dolor. Sed iaculis id lorem at consequat. Praesent ante nulla, vehicula et dignissim non, interdum at turpis. Aliquam vel ligula et nisl porttitor consequat id eleifend mauris. Curabitur a lorem eu dui dapibus convallis vel eu ligula. Mauris sit amet mauris risus. Nullam ut dui nisi. Mauris blandit varius elementum.'),
(14, 8, 'Leçon n°1', 23, 'Les modes de cuisson', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc ullamcorper lectus in sem scelerisque pharetra. Suspendisse pharetra augue quis rhoncus luctus. Pellentesque lorem erat, viverra sed nisl sit amet, auctor lacinia mi. Pellentesque sollicitudin cursus magna at posuere. Donec porttitor, arcu ut sagittis rhoncus, augue risus euismod lorem, ac scelerisque dolor tellus nec orci. Vivamus dapibus viverra nunc vitae eleifend. Vivamus mattis elit tellus, et porttitor mauris faucibus eu. Ut aliquam in tortor et scelerisque. Etiam lacinia malesuada turpis, nec tempor ligula luctus a. Nunc hendrerit sem at ante vestibulum, in convallis sapien faucibus. Donec lacinia venenatis diam nec venenatis. Proin ex lorem, luctus vitae neque et, suscipit rhoncus eros.\n\nAenean a ultricies velit. Proin ullamcorper, est eget tempus venenatis, ex leo lobortis arcu, sed interdum nisi odio vel lorem. Curabitur sagittis ipsum nulla, vehicula ullamcorper nisi suscipit sed. Suspendisse velit nibh, tempor vitae ex eget, congue condimentum odio. Sed sit amet magna ex. Nullam mattis posuere eros sit amet varius. Fusce pellentesque nisi sapien, porta tristique mauris faucibus ut. Integer molestie neque ornare ipsum tempor, at mattis ligula congue. Praesent viverra enim nibh, id tempus nibh accumsan ut. Ut in nibh mattis, dictum arcu nec, consectetur dui. Aenean egestas efficitur facilisis. Integer vitae semper nisl. Morbi nec egestas mi, sed auctor sem. Etiam pretium vehicula libero laoreet viverra. Integer semper dapibus neque vitae sodales. Donec pellentesque euismod leo, quis scelerisque nunc fermentum ut.\n\nMorbi blandit dui justo, eget accumsan mauris porttitor a. In vitae orci nec erat fermentum dignissim. Pellentesque rutrum leo ac metus varius porta. Duis posuere auctor nisl, pulvinar luctus mi mollis id. Donec condimentum orci non sapien pulvinar, in aliquam est porttitor. Integer lorem sem, lobortis quis ornare a, interdum sit amet nulla. Praesent et dapibus turpis. Cras vel rhoncus magna, nec blandit massa. In eu vehicula elit. Nam tincidunt mauris et consectetur fringilla. Quisque blandit sapien et tortor commodo, vitae porta diam vehicula. Etiam et ex purus. Sed in ultrices mi, vitae tristique nunc. Mauris arcu libero, blandit id urna eu, faucibus interdum magna.\n\nPraesent vitae sem molestie, blandit purus vel, vestibulum lacus. Proin semper, nulla vitae finibus eleifend, mi elit rutrum lacus, eu molestie ante tortor eu nunc. Suspendisse fermentum finibus mi. Vestibulum congue ante eget lacus consequat pulvinar. Ut luctus ultricies neque, eu convallis justo tincidunt et. Suspendisse imperdiet pharetra diam, sed gravida quam dignissim quis. Duis blandit rutrum eros at viverra.\n\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Donec diam felis, lobortis vitae faucibus a, pretium vel dolor. Sed iaculis id lorem at consequat. Praesent ante nulla, vehicula et dignissim non, interdum at turpis. Aliquam vel ligula et nisl porttitor consequat id eleifend mauris. Curabitur a lorem eu dui dapibus convallis vel eu ligula. Mauris sit amet mauris risus. Nullam ut dui nisi. Mauris blandit varius elementum.'),
(15, 8, 'Leçon n°2', 23, 'Les saveurs', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc ullamcorper lectus in sem scelerisque pharetra. Suspendisse pharetra augue quis rhoncus luctus. Pellentesque lorem erat, viverra sed nisl sit amet, auctor lacinia mi. Pellentesque sollicitudin cursus magna at posuere. Donec porttitor, arcu ut sagittis rhoncus, augue risus euismod lorem, ac scelerisque dolor tellus nec orci. Vivamus dapibus viverra nunc vitae eleifend. Vivamus mattis elit tellus, et porttitor mauris faucibus eu. Ut aliquam in tortor et scelerisque. Etiam lacinia malesuada turpis, nec tempor ligula luctus a. Nunc hendrerit sem at ante vestibulum, in convallis sapien faucibus. Donec lacinia venenatis diam nec venenatis. Proin ex lorem, luctus vitae neque et, suscipit rhoncus eros.\n\nAenean a ultricies velit. Proin ullamcorper, est eget tempus venenatis, ex leo lobortis arcu, sed interdum nisi odio vel lorem. Curabitur sagittis ipsum nulla, vehicula ullamcorper nisi suscipit sed. Suspendisse velit nibh, tempor vitae ex eget, congue condimentum odio. Sed sit amet magna ex. Nullam mattis posuere eros sit amet varius. Fusce pellentesque nisi sapien, porta tristique mauris faucibus ut. Integer molestie neque ornare ipsum tempor, at mattis ligula congue. Praesent viverra enim nibh, id tempus nibh accumsan ut. Ut in nibh mattis, dictum arcu nec, consectetur dui. Aenean egestas efficitur facilisis. Integer vitae semper nisl. Morbi nec egestas mi, sed auctor sem. Etiam pretium vehicula libero laoreet viverra. Integer semper dapibus neque vitae sodales. Donec pellentesque euismod leo, quis scelerisque nunc fermentum ut.\n\nMorbi blandit dui justo, eget accumsan mauris porttitor a. In vitae orci nec erat fermentum dignissim. Pellentesque rutrum leo ac metus varius porta. Duis posuere auctor nisl, pulvinar luctus mi mollis id. Donec condimentum orci non sapien pulvinar, in aliquam est porttitor. Integer lorem sem, lobortis quis ornare a, interdum sit amet nulla. Praesent et dapibus turpis. Cras vel rhoncus magna, nec blandit massa. In eu vehicula elit. Nam tincidunt mauris et consectetur fringilla. Quisque blandit sapien et tortor commodo, vitae porta diam vehicula. Etiam et ex purus. Sed in ultrices mi, vitae tristique nunc. Mauris arcu libero, blandit id urna eu, faucibus interdum magna.\n\nPraesent vitae sem molestie, blandit purus vel, vestibulum lacus. Proin semper, nulla vitae finibus eleifend, mi elit rutrum lacus, eu molestie ante tortor eu nunc. Suspendisse fermentum finibus mi. Vestibulum congue ante eget lacus consequat pulvinar. Ut luctus ultricies neque, eu convallis justo tincidunt et. Suspendisse imperdiet pharetra diam, sed gravida quam dignissim quis. Duis blandit rutrum eros at viverra.\n\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Donec diam felis, lobortis vitae faucibus a, pretium vel dolor. Sed iaculis id lorem at consequat. Praesent ante nulla, vehicula et dignissim non, interdum at turpis. Aliquam vel ligula et nisl porttitor consequat id eleifend mauris. Curabitur a lorem eu dui dapibus convallis vel eu ligula. Mauris sit amet mauris risus. Nullam ut dui nisi. Mauris blandit varius elementum.');

-- --------------------------------------------------------

--
-- Structure de la table `lesson_completion`
--

CREATE TABLE `lesson_completion` (
  `completion_id` int NOT NULL,
  `user_id` int NOT NULL,
  `lesson_id` int NOT NULL,
  `is_completed` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `lesson_completion`
--

INSERT INTO `lesson_completion` (`completion_id`, `user_id`, `lesson_id`, `is_completed`) VALUES
(1, 1, 1, 1),
(3, 1, 2, 1),
(4, 1, 3, 1),
(5, 4, 1, 1),
(6, 4, 2, 1),
(7, 1, 11, 1),
(8, 10, 1, 1),
(9, 10, 2, 1);

-- --------------------------------------------------------

--
-- Structure de la table `messenger_messages`
--

CREATE TABLE `messenger_messages` (
  `id` bigint NOT NULL,
  `body` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `headers` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue_name` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `available_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `delivered_at` datetime DEFAULT NULL COMMENT '(DC2Type:datetime_immutable)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `messenger_messages`
--

INSERT INTO `messenger_messages` (`id`, `body`, `headers`, `queue_name`, `created_at`, `available_at`, `delivered_at`) VALUES
(1, 'O:36:\\\"Symfony\\\\Component\\\\Messenger\\\\Envelope\\\":2:{s:44:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Envelope\\0stamps\\\";a:1:{s:46:\\\"Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\\";a:1:{i:0;O:46:\\\"Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\\":1:{s:55:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\0busName\\\";s:21:\\\"messenger.bus.default\\\";}}}s:45:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Envelope\\0message\\\";O:51:\\\"Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\\":2:{s:60:\\\"\\0Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\0message\\\";O:39:\\\"Symfony\\\\Bridge\\\\Twig\\\\Mime\\\\TemplatedEmail\\\":5:{i:0;s:41:\\\"registration/confirmation_email.html.twig\\\";i:1;N;i:2;a:3:{s:9:\\\"signedUrl\\\";s:185:\\\"http://localhost:8000/verify/email?expires=1731699698&id=test%40test.fr&signature=RutftuoQmiz6UE1pGBot2fVf2h4iM5PD3PiojxDe%2Bsw%3D&token=%2BNIsrRBMsiCkwxaf2vNiqR8z0OKcSnwijJklV16jDcs%3D\\\";s:19:\\\"expiresAtMessageKey\\\";s:26:\\\"%count% hour|%count% hours\\\";s:20:\\\"expiresAtMessageData\\\";a:1:{s:7:\\\"%count%\\\";i:1;}}i:3;a:6:{i:0;N;i:1;N;i:2;N;i:3;N;i:4;a:0:{}i:5;a:2:{i:0;O:37:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\\":2:{s:46:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\0headers\\\";a:3:{s:4:\\\"from\\\";a:1:{i:0;O:47:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\\":5:{s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\\";s:4:\\\"From\\\";s:56:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\\";i:76;s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\\";N;s:53:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\\";s:5:\\\"utf-8\\\";s:58:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\0addresses\\\";a:1:{i:0;O:30:\\\"Symfony\\\\Component\\\\Mime\\\\Address\\\":2:{s:39:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0address\\\";s:21:\\\"contact@knowledge.com\\\";s:36:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0name\\\";s:11:\\\"contact bot\\\";}}}}s:2:\\\"to\\\";a:1:{i:0;O:47:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\\":5:{s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\\";s:2:\\\"To\\\";s:56:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\\";i:76;s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\\";N;s:53:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\\";s:5:\\\"utf-8\\\";s:58:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\0addresses\\\";a:1:{i:0;O:30:\\\"Symfony\\\\Component\\\\Mime\\\\Address\\\":2:{s:39:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0address\\\";s:12:\\\"test@test.fr\\\";s:36:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0name\\\";s:0:\\\"\\\";}}}}s:7:\\\"subject\\\";a:1:{i:0;O:48:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\UnstructuredHeader\\\":5:{s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\\";s:7:\\\"Subject\\\";s:56:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\\";i:76;s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\\";N;s:53:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\\";s:5:\\\"utf-8\\\";s:55:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\UnstructuredHeader\\0value\\\";s:25:\\\"Please Confirm your Email\\\";}}}s:49:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\0lineLength\\\";i:76;}i:1;N;}}i:4;N;}s:61:\\\"\\0Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\0envelope\\\";N;}}', '[]', 'default', '2024-11-15 18:41:38', '2024-11-15 18:41:38', NULL),
(2, 'O:36:\\\"Symfony\\\\Component\\\\Messenger\\\\Envelope\\\":2:{s:44:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Envelope\\0stamps\\\";a:1:{s:46:\\\"Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\\";a:1:{i:0;O:46:\\\"Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\\":1:{s:55:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\0busName\\\";s:21:\\\"messenger.bus.default\\\";}}}s:45:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Envelope\\0message\\\";O:51:\\\"Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\\":2:{s:60:\\\"\\0Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\0message\\\";O:39:\\\"Symfony\\\\Bridge\\\\Twig\\\\Mime\\\\TemplatedEmail\\\":5:{i:0;s:41:\\\"registration/confirmation_email.html.twig\\\";i:1;N;i:2;a:3:{s:9:\\\"signedUrl\\\";s:194:\\\"http://localhost:8000/verify/email?expires=1731699744&id=kevinpierre4554%40gmail.com&signature=xVVzNeKSTlHIKo5SDqbLDvrr9t7300xijJS7tdJ0KdA%3D&token=9GeEPNSb1gqzdHz0HxE3y1z0fisxSr4uwG0MZPpjRaM%3D\\\";s:19:\\\"expiresAtMessageKey\\\";s:26:\\\"%count% hour|%count% hours\\\";s:20:\\\"expiresAtMessageData\\\";a:1:{s:7:\\\"%count%\\\";i:1;}}i:3;a:6:{i:0;N;i:1;N;i:2;N;i:3;N;i:4;a:0:{}i:5;a:2:{i:0;O:37:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\\":2:{s:46:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\0headers\\\";a:3:{s:4:\\\"from\\\";a:1:{i:0;O:47:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\\":5:{s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\\";s:4:\\\"From\\\";s:56:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\\";i:76;s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\\";N;s:53:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\\";s:5:\\\"utf-8\\\";s:58:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\0addresses\\\";a:1:{i:0;O:30:\\\"Symfony\\\\Component\\\\Mime\\\\Address\\\":2:{s:39:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0address\\\";s:21:\\\"contact@knowledge.com\\\";s:36:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0name\\\";s:11:\\\"contact bot\\\";}}}}s:2:\\\"to\\\";a:1:{i:0;O:47:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\\":5:{s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\\";s:2:\\\"To\\\";s:56:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\\";i:76;s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\\";N;s:53:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\\";s:5:\\\"utf-8\\\";s:58:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\0addresses\\\";a:1:{i:0;O:30:\\\"Symfony\\\\Component\\\\Mime\\\\Address\\\":2:{s:39:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0address\\\";s:25:\\\"kevinpierre4554@gmail.com\\\";s:36:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0name\\\";s:0:\\\"\\\";}}}}s:7:\\\"subject\\\";a:1:{i:0;O:48:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\UnstructuredHeader\\\":5:{s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\\";s:7:\\\"Subject\\\";s:56:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\\";i:76;s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\\";N;s:53:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\\";s:5:\\\"utf-8\\\";s:55:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\UnstructuredHeader\\0value\\\";s:25:\\\"Please Confirm your Email\\\";}}}s:49:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\0lineLength\\\";i:76;}i:1;N;}}i:4;N;}s:61:\\\"\\0Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\0envelope\\\";N;}}', '[]', 'default', '2024-11-15 18:42:24', '2024-11-15 18:42:24', NULL),
(3, 'O:36:\\\"Symfony\\\\Component\\\\Messenger\\\\Envelope\\\":2:{s:44:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Envelope\\0stamps\\\";a:1:{s:46:\\\"Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\\";a:1:{i:0;O:46:\\\"Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\\":1:{s:55:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\0busName\\\";s:21:\\\"messenger.bus.default\\\";}}}s:45:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Envelope\\0message\\\";O:51:\\\"Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\\":2:{s:60:\\\"\\0Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\0message\\\";O:39:\\\"Symfony\\\\Bridge\\\\Twig\\\\Mime\\\\TemplatedEmail\\\":5:{i:0;s:41:\\\"registration/confirmation_email.html.twig\\\";i:1;N;i:2;a:3:{s:9:\\\"signedUrl\\\";s:191:\\\"http://localhost:8000/verify/email?expires=1732042702&id=test2%40test.com&signature=HFZbeW8zmYRWKATxmjx%2F7JnJZDamGh3uREz%2Bv8ivC7o%3D&token=EaLgqg8hkx1jYnT%2F65%2Bju5WxYPDWRQNYKOSPiwMVBoQ%3D\\\";s:19:\\\"expiresAtMessageKey\\\";s:26:\\\"%count% hour|%count% hours\\\";s:20:\\\"expiresAtMessageData\\\";a:1:{s:7:\\\"%count%\\\";i:1;}}i:3;a:6:{i:0;N;i:1;N;i:2;N;i:3;N;i:4;a:0:{}i:5;a:2:{i:0;O:37:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\\":2:{s:46:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\0headers\\\";a:3:{s:4:\\\"from\\\";a:1:{i:0;O:47:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\\":5:{s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\\";s:4:\\\"From\\\";s:56:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\\";i:76;s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\\";N;s:53:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\\";s:5:\\\"utf-8\\\";s:58:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\0addresses\\\";a:1:{i:0;O:30:\\\"Symfony\\\\Component\\\\Mime\\\\Address\\\":2:{s:39:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0address\\\";s:21:\\\"contact@knowledge.com\\\";s:36:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0name\\\";s:11:\\\"contact bot\\\";}}}}s:2:\\\"to\\\";a:1:{i:0;O:47:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\\":5:{s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\\";s:2:\\\"To\\\";s:56:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\\";i:76;s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\\";N;s:53:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\\";s:5:\\\"utf-8\\\";s:58:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\0addresses\\\";a:1:{i:0;O:30:\\\"Symfony\\\\Component\\\\Mime\\\\Address\\\":2:{s:39:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0address\\\";s:14:\\\"test2@test.com\\\";s:36:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0name\\\";s:0:\\\"\\\";}}}}s:7:\\\"subject\\\";a:1:{i:0;O:48:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\UnstructuredHeader\\\":5:{s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\\";s:7:\\\"Subject\\\";s:56:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\\";i:76;s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\\";N;s:53:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\\";s:5:\\\"utf-8\\\";s:55:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\UnstructuredHeader\\0value\\\";s:25:\\\"Please Confirm your Email\\\";}}}s:49:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\0lineLength\\\";i:76;}i:1;N;}}i:4;N;}s:61:\\\"\\0Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\0envelope\\\";N;}}', '[]', 'default', '2024-11-19 17:58:22', '2024-11-19 17:58:22', NULL),
(4, 'O:36:\\\"Symfony\\\\Component\\\\Messenger\\\\Envelope\\\":2:{s:44:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Envelope\\0stamps\\\";a:1:{s:46:\\\"Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\\";a:1:{i:0;O:46:\\\"Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\\":1:{s:55:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\0busName\\\";s:21:\\\"messenger.bus.default\\\";}}}s:45:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Envelope\\0message\\\";O:51:\\\"Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\\":2:{s:60:\\\"\\0Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\0message\\\";O:39:\\\"Symfony\\\\Bridge\\\\Twig\\\\Mime\\\\TemplatedEmail\\\":5:{i:0;s:41:\\\"registration/confirmation_email.html.twig\\\";i:1;N;i:2;a:3:{s:9:\\\"signedUrl\\\";s:196:\\\"http://localhost:8000/verify/email?expires=1732546741&id=kevinpierre4554%40gmail.com&signature=L75PpQjSVoZ2hd9YHzZnT1MJM4WYlSCRrzNFI57%2FSps%3D&token=9GeEPNSb1gqzdHz0HxE3y1z0fisxSr4uwG0MZPpjRaM%3D\\\";s:19:\\\"expiresAtMessageKey\\\";s:26:\\\"%count% hour|%count% hours\\\";s:20:\\\"expiresAtMessageData\\\";a:1:{s:7:\\\"%count%\\\";i:1;}}i:3;a:6:{i:0;N;i:1;N;i:2;N;i:3;N;i:4;a:0:{}i:5;a:2:{i:0;O:37:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\\":2:{s:46:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\0headers\\\";a:3:{s:4:\\\"from\\\";a:1:{i:0;O:47:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\\":5:{s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\\";s:4:\\\"From\\\";s:56:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\\";i:76;s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\\";N;s:53:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\\";s:5:\\\"utf-8\\\";s:58:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\0addresses\\\";a:1:{i:0;O:30:\\\"Symfony\\\\Component\\\\Mime\\\\Address\\\":2:{s:39:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0address\\\";s:21:\\\"contact@knowledge.com\\\";s:36:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0name\\\";s:11:\\\"contact bot\\\";}}}}s:2:\\\"to\\\";a:1:{i:0;O:47:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\\":5:{s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\\";s:2:\\\"To\\\";s:56:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\\";i:76;s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\\";N;s:53:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\\";s:5:\\\"utf-8\\\";s:58:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\0addresses\\\";a:1:{i:0;O:30:\\\"Symfony\\\\Component\\\\Mime\\\\Address\\\":2:{s:39:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0address\\\";s:25:\\\"kevinpierre4554@gmail.com\\\";s:36:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0name\\\";s:0:\\\"\\\";}}}}s:7:\\\"subject\\\";a:1:{i:0;O:48:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\UnstructuredHeader\\\":5:{s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\\";s:7:\\\"Subject\\\";s:56:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\\";i:76;s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\\";N;s:53:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\\";s:5:\\\"utf-8\\\";s:55:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\UnstructuredHeader\\0value\\\";s:25:\\\"Please Confirm your Email\\\";}}}s:49:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\0lineLength\\\";i:76;}i:1;N;}}i:4;N;}s:61:\\\"\\0Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\0envelope\\\";N;}}', '[]', 'default', '2024-11-25 13:59:01', '2024-11-25 13:59:01', NULL),
(5, 'O:36:\\\"Symfony\\\\Component\\\\Messenger\\\\Envelope\\\":2:{s:44:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Envelope\\0stamps\\\";a:1:{s:46:\\\"Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\\";a:1:{i:0;O:46:\\\"Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\\":1:{s:55:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\0busName\\\";s:21:\\\"messenger.bus.default\\\";}}}s:45:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Envelope\\0message\\\";O:51:\\\"Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\\":2:{s:60:\\\"\\0Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\0message\\\";O:39:\\\"Symfony\\\\Bridge\\\\Twig\\\\Mime\\\\TemplatedEmail\\\":5:{i:0;s:41:\\\"registration/confirmation_email.html.twig\\\";i:1;N;i:2;a:3:{s:9:\\\"signedUrl\\\";s:194:\\\"http://localhost:8000/verify/email?expires=1732547608&id=kevinpierre4554%40gmail.com&signature=Uuuh9doLAJ7lYL290TZza6lgy3aWLseeifsXsAsy5SI%3D&token=9GeEPNSb1gqzdHz0HxE3y1z0fisxSr4uwG0MZPpjRaM%3D\\\";s:19:\\\"expiresAtMessageKey\\\";s:26:\\\"%count% hour|%count% hours\\\";s:20:\\\"expiresAtMessageData\\\";a:1:{s:7:\\\"%count%\\\";i:1;}}i:3;a:6:{i:0;N;i:1;N;i:2;N;i:3;N;i:4;a:0:{}i:5;a:2:{i:0;O:37:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\\":2:{s:46:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\0headers\\\";a:3:{s:4:\\\"from\\\";a:1:{i:0;O:47:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\\":5:{s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\\";s:4:\\\"From\\\";s:56:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\\";i:76;s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\\";N;s:53:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\\";s:5:\\\"utf-8\\\";s:58:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\0addresses\\\";a:1:{i:0;O:30:\\\"Symfony\\\\Component\\\\Mime\\\\Address\\\":2:{s:39:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0address\\\";s:21:\\\"contact@knowledge.com\\\";s:36:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0name\\\";s:11:\\\"contact bot\\\";}}}}s:2:\\\"to\\\";a:1:{i:0;O:47:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\\":5:{s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\\";s:2:\\\"To\\\";s:56:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\\";i:76;s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\\";N;s:53:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\\";s:5:\\\"utf-8\\\";s:58:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\0addresses\\\";a:1:{i:0;O:30:\\\"Symfony\\\\Component\\\\Mime\\\\Address\\\":2:{s:39:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0address\\\";s:25:\\\"kevinpierre4554@gmail.com\\\";s:36:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0name\\\";s:0:\\\"\\\";}}}}s:7:\\\"subject\\\";a:1:{i:0;O:48:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\UnstructuredHeader\\\":5:{s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\\";s:7:\\\"Subject\\\";s:56:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\\";i:76;s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\\";N;s:53:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\\";s:5:\\\"utf-8\\\";s:55:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\UnstructuredHeader\\0value\\\";s:25:\\\"Please Confirm your Email\\\";}}}s:49:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\0lineLength\\\";i:76;}i:1;N;}}i:4;N;}s:61:\\\"\\0Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\0envelope\\\";N;}}', '[]', 'default', '2024-11-25 14:13:28', '2024-11-25 14:13:28', NULL),
(6, 'O:36:\\\"Symfony\\\\Component\\\\Messenger\\\\Envelope\\\":2:{s:44:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Envelope\\0stamps\\\";a:1:{s:46:\\\"Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\\";a:1:{i:0;O:46:\\\"Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\\":1:{s:55:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\0busName\\\";s:21:\\\"messenger.bus.default\\\";}}}s:45:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Envelope\\0message\\\";O:51:\\\"Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\\":2:{s:60:\\\"\\0Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\0message\\\";O:39:\\\"Symfony\\\\Bridge\\\\Twig\\\\Mime\\\\TemplatedEmail\\\":5:{i:0;s:41:\\\"registration/confirmation_email.html.twig\\\";i:1;N;i:2;a:3:{s:9:\\\"signedUrl\\\";s:198:\\\"http://localhost:8000/verify/email?expires=1732547812&id=kevinpierre4554%40gmail.com&signature=uZPTSz7%2FZ5haBefuOfLDto%2B39xTrhJuhtsZUyIRJNtE%3D&token=9GeEPNSb1gqzdHz0HxE3y1z0fisxSr4uwG0MZPpjRaM%3D\\\";s:19:\\\"expiresAtMessageKey\\\";s:26:\\\"%count% hour|%count% hours\\\";s:20:\\\"expiresAtMessageData\\\";a:1:{s:7:\\\"%count%\\\";i:1;}}i:3;a:6:{i:0;N;i:1;N;i:2;N;i:3;N;i:4;a:0:{}i:5;a:2:{i:0;O:37:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\\":2:{s:46:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\0headers\\\";a:3:{s:4:\\\"from\\\";a:1:{i:0;O:47:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\\":5:{s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\\";s:4:\\\"From\\\";s:56:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\\";i:76;s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\\";N;s:53:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\\";s:5:\\\"utf-8\\\";s:58:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\0addresses\\\";a:1:{i:0;O:30:\\\"Symfony\\\\Component\\\\Mime\\\\Address\\\":2:{s:39:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0address\\\";s:21:\\\"contact@knowledge.com\\\";s:36:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0name\\\";s:11:\\\"contact bot\\\";}}}}s:2:\\\"to\\\";a:1:{i:0;O:47:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\\":5:{s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\\";s:2:\\\"To\\\";s:56:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\\";i:76;s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\\";N;s:53:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\\";s:5:\\\"utf-8\\\";s:58:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\0addresses\\\";a:1:{i:0;O:30:\\\"Symfony\\\\Component\\\\Mime\\\\Address\\\":2:{s:39:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0address\\\";s:25:\\\"kevinpierre4554@gmail.com\\\";s:36:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0name\\\";s:0:\\\"\\\";}}}}s:7:\\\"subject\\\";a:1:{i:0;O:48:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\UnstructuredHeader\\\":5:{s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\\";s:7:\\\"Subject\\\";s:56:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\\";i:76;s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\\";N;s:53:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\\";s:5:\\\"utf-8\\\";s:55:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\UnstructuredHeader\\0value\\\";s:25:\\\"Please Confirm your Email\\\";}}}s:49:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\0lineLength\\\";i:76;}i:1;N;}}i:4;N;}s:61:\\\"\\0Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\0envelope\\\";N;}}', '[]', 'default', '2024-11-25 14:16:52', '2024-11-25 14:16:52', NULL),
(7, 'O:36:\\\"Symfony\\\\Component\\\\Messenger\\\\Envelope\\\":2:{s:44:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Envelope\\0stamps\\\";a:1:{s:46:\\\"Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\\";a:1:{i:0;O:46:\\\"Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\\":1:{s:55:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\0busName\\\";s:21:\\\"messenger.bus.default\\\";}}}s:45:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Envelope\\0message\\\";O:51:\\\"Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\\":2:{s:60:\\\"\\0Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\0message\\\";O:39:\\\"Symfony\\\\Bridge\\\\Twig\\\\Mime\\\\TemplatedEmail\\\":5:{i:0;s:41:\\\"registration/confirmation_email.html.twig\\\";i:1;N;i:2;a:3:{s:9:\\\"signedUrl\\\";s:194:\\\"http://localhost:8000/verify/email?expires=1732547938&id=kevinpierre4554%40gmail.com&signature=VFzMje5MNovtjkFGJ135Jq6NQhL8PCNrR7dCBVSmqyk%3D&token=9GeEPNSb1gqzdHz0HxE3y1z0fisxSr4uwG0MZPpjRaM%3D\\\";s:19:\\\"expiresAtMessageKey\\\";s:26:\\\"%count% hour|%count% hours\\\";s:20:\\\"expiresAtMessageData\\\";a:1:{s:7:\\\"%count%\\\";i:1;}}i:3;a:6:{i:0;N;i:1;N;i:2;N;i:3;N;i:4;a:0:{}i:5;a:2:{i:0;O:37:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\\":2:{s:46:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\0headers\\\";a:3:{s:4:\\\"from\\\";a:1:{i:0;O:47:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\\":5:{s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\\";s:4:\\\"From\\\";s:56:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\\";i:76;s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\\";N;s:53:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\\";s:5:\\\"utf-8\\\";s:58:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\0addresses\\\";a:1:{i:0;O:30:\\\"Symfony\\\\Component\\\\Mime\\\\Address\\\":2:{s:39:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0address\\\";s:21:\\\"contact@knowledge.com\\\";s:36:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0name\\\";s:11:\\\"contact bot\\\";}}}}s:2:\\\"to\\\";a:1:{i:0;O:47:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\\":5:{s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\\";s:2:\\\"To\\\";s:56:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\\";i:76;s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\\";N;s:53:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\\";s:5:\\\"utf-8\\\";s:58:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\0addresses\\\";a:1:{i:0;O:30:\\\"Symfony\\\\Component\\\\Mime\\\\Address\\\":2:{s:39:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0address\\\";s:25:\\\"kevinpierre4554@gmail.com\\\";s:36:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0name\\\";s:0:\\\"\\\";}}}}s:7:\\\"subject\\\";a:1:{i:0;O:48:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\UnstructuredHeader\\\":5:{s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\\";s:7:\\\"Subject\\\";s:56:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\\";i:76;s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\\";N;s:53:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\\";s:5:\\\"utf-8\\\";s:55:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\UnstructuredHeader\\0value\\\";s:25:\\\"Please Confirm your Email\\\";}}}s:49:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\0lineLength\\\";i:76;}i:1;N;}}i:4;N;}s:61:\\\"\\0Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\0envelope\\\";N;}}', '[]', 'default', '2024-11-25 14:18:58', '2024-11-25 14:18:58', NULL),
(8, 'O:36:\\\"Symfony\\\\Component\\\\Messenger\\\\Envelope\\\":2:{s:44:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Envelope\\0stamps\\\";a:1:{s:46:\\\"Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\\";a:1:{i:0;O:46:\\\"Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\\":1:{s:55:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\0busName\\\";s:21:\\\"messenger.bus.default\\\";}}}s:45:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Envelope\\0message\\\";O:51:\\\"Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\\":2:{s:60:\\\"\\0Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\0message\\\";O:39:\\\"Symfony\\\\Bridge\\\\Twig\\\\Mime\\\\TemplatedEmail\\\":5:{i:0;s:41:\\\"registration/confirmation_email.html.twig\\\";i:1;N;i:2;a:3:{s:9:\\\"signedUrl\\\";s:198:\\\"http://localhost:8000/verify/email?expires=1732548155&id=kevinpierre4554%40gmail.com&signature=vLCxhZjWU0ViUWLr3kBg3K%2B7D2GIpiz%2FW8PQbsP07Oc%3D&token=9GeEPNSb1gqzdHz0HxE3y1z0fisxSr4uwG0MZPpjRaM%3D\\\";s:19:\\\"expiresAtMessageKey\\\";s:26:\\\"%count% hour|%count% hours\\\";s:20:\\\"expiresAtMessageData\\\";a:1:{s:7:\\\"%count%\\\";i:1;}}i:3;a:6:{i:0;N;i:1;N;i:2;N;i:3;N;i:4;a:0:{}i:5;a:2:{i:0;O:37:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\\":2:{s:46:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\0headers\\\";a:3:{s:4:\\\"from\\\";a:1:{i:0;O:47:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\\":5:{s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\\";s:4:\\\"From\\\";s:56:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\\";i:76;s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\\";N;s:53:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\\";s:5:\\\"utf-8\\\";s:58:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\0addresses\\\";a:1:{i:0;O:30:\\\"Symfony\\\\Component\\\\Mime\\\\Address\\\":2:{s:39:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0address\\\";s:22:\\\"contact@kevinpierre.fr\\\";s:36:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0name\\\";s:7:\\\"contact\\\";}}}}s:2:\\\"to\\\";a:1:{i:0;O:47:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\\":5:{s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\\";s:2:\\\"To\\\";s:56:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\\";i:76;s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\\";N;s:53:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\\";s:5:\\\"utf-8\\\";s:58:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\0addresses\\\";a:1:{i:0;O:30:\\\"Symfony\\\\Component\\\\Mime\\\\Address\\\":2:{s:39:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0address\\\";s:25:\\\"kevinpierre4554@gmail.com\\\";s:36:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0name\\\";s:0:\\\"\\\";}}}}s:7:\\\"subject\\\";a:1:{i:0;O:48:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\UnstructuredHeader\\\":5:{s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\\";s:7:\\\"Subject\\\";s:56:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\\";i:76;s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\\";N;s:53:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\\";s:5:\\\"utf-8\\\";s:55:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\UnstructuredHeader\\0value\\\";s:25:\\\"Please Confirm your Email\\\";}}}s:49:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\0lineLength\\\";i:76;}i:1;N;}}i:4;N;}s:61:\\\"\\0Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\0envelope\\\";N;}}', '[]', 'default', '2024-11-25 14:22:35', '2024-11-25 14:22:35', NULL),
(9, 'O:36:\\\"Symfony\\\\Component\\\\Messenger\\\\Envelope\\\":2:{s:44:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Envelope\\0stamps\\\";a:1:{s:46:\\\"Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\\";a:1:{i:0;O:46:\\\"Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\\":1:{s:55:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\0busName\\\";s:21:\\\"messenger.bus.default\\\";}}}s:45:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Envelope\\0message\\\";O:51:\\\"Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\\":2:{s:60:\\\"\\0Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\0message\\\";O:39:\\\"Symfony\\\\Bridge\\\\Twig\\\\Mime\\\\TemplatedEmail\\\":5:{i:0;s:41:\\\"registration/confirmation_email.html.twig\\\";i:1;N;i:2;a:3:{s:9:\\\"signedUrl\\\";s:194:\\\"http://localhost:8000/verify/email?expires=1732614258&id=kevinpierre4554%40gmail.com&signature=WH6XfLqgQkkbOaoM6pJKNK9bcIPj9BRYMAZtlMgjA5U%3D&token=9GeEPNSb1gqzdHz0HxE3y1z0fisxSr4uwG0MZPpjRaM%3D\\\";s:19:\\\"expiresAtMessageKey\\\";s:26:\\\"%count% hour|%count% hours\\\";s:20:\\\"expiresAtMessageData\\\";a:1:{s:7:\\\"%count%\\\";i:1;}}i:3;a:6:{i:0;N;i:1;N;i:2;N;i:3;N;i:4;a:0:{}i:5;a:2:{i:0;O:37:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\\":2:{s:46:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\0headers\\\";a:3:{s:4:\\\"from\\\";a:1:{i:0;O:47:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\\":5:{s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\\";s:4:\\\"From\\\";s:56:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\\";i:76;s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\\";N;s:53:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\\";s:5:\\\"utf-8\\\";s:58:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\0addresses\\\";a:1:{i:0;O:30:\\\"Symfony\\\\Component\\\\Mime\\\\Address\\\":2:{s:39:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0address\\\";s:22:\\\"contact@kevinpierre.fr\\\";s:36:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0name\\\";s:7:\\\"contact\\\";}}}}s:2:\\\"to\\\";a:1:{i:0;O:47:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\\":5:{s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\\";s:2:\\\"To\\\";s:56:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\\";i:76;s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\\";N;s:53:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\\";s:5:\\\"utf-8\\\";s:58:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\0addresses\\\";a:1:{i:0;O:30:\\\"Symfony\\\\Component\\\\Mime\\\\Address\\\":2:{s:39:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0address\\\";s:25:\\\"kevinpierre4554@gmail.com\\\";s:36:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0name\\\";s:0:\\\"\\\";}}}}s:7:\\\"subject\\\";a:1:{i:0;O:48:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\UnstructuredHeader\\\":5:{s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\\";s:7:\\\"Subject\\\";s:56:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\\";i:76;s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\\";N;s:53:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\\";s:5:\\\"utf-8\\\";s:55:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\UnstructuredHeader\\0value\\\";s:25:\\\"Please Confirm your Email\\\";}}}s:49:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\0lineLength\\\";i:76;}i:1;N;}}i:4;N;}s:61:\\\"\\0Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\0envelope\\\";N;}}', '[]', 'default', '2024-11-26 08:44:18', '2024-11-26 08:44:18', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `order`
--

CREATE TABLE `order` (
  `order_id` int NOT NULL,
  `user_id_id` int NOT NULL,
  `created_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `lesson_id` int DEFAULT NULL,
  `course_id` int DEFAULT NULL,
  `item_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `order`
--

INSERT INTO `order` (`order_id`, `user_id_id`, `created_at`, `lesson_id`, `course_id`, `item_type`) VALUES
(16, 4, '2024-11-20 03:49:55', NULL, 1, 'course'),
(17, 4, '2024-11-20 03:49:55', 3, NULL, 'lesson'),
(18, 1, '2024-11-20 04:28:41', NULL, 1, 'course'),
(19, 1, '2024-11-20 05:09:41', NULL, 2, 'course'),
(20, 1, '2024-11-25 13:05:34', 5, NULL, 'lesson'),
(21, 1, '2024-11-25 13:05:34', NULL, 6, 'course'),
(22, 1, '2024-11-25 13:11:56', 6, NULL, 'lesson'),
(23, 10, '2024-11-26 08:45:07', NULL, 1, 'course');

-- --------------------------------------------------------

--
-- Structure de la table `order_items`
--

CREATE TABLE `order_items` (
  `order_item_id` int NOT NULL,
  `lesson_id` int DEFAULT NULL,
  `course_id` int DEFAULT NULL,
  `item_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantity` int NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `total` decimal(10,2) NOT NULL DEFAULT '0.00',
  `content` longtext COLLATE utf8mb4_unicode_ci,
  `order_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `themes`
--

CREATE TABLE `themes` (
  `id` int NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `themes`
--

INSERT INTO `themes` (`id`, `name`) VALUES
(1, 'Musique'),
(2, 'Informatique'),
(3, 'Jardinage'),
(4, 'Cuisine');

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `id` int NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `created_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `updated_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `created_by` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `updated_by` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `roles` json NOT NULL,
  `is_verified` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `email`, `password`, `is_active`, `created_at`, `updated_at`, `created_by`, `updated_by`, `roles`, `is_verified`) VALUES
(1, 'test@test.fr', '$2y$13$FDLgvou1dzlALqyhdszdF.RkIblIqipQ5HhwTySG0g604xa2H5buq', 0, '2024-11-15 18:41:38', '2024-11-15 18:41:38', 'admin', 'admin', '[\"ROLE_CLIENT\"]', 0),
(3, 'admin@example.com', '$2y$13$mWDFu8Svj.4vu41XI2MbLuEbsnOM9N2FbUsCpd8zw2uxaoFpqlc7S', 1, '2024-11-15 23:48:26', '2024-11-15 23:48:26', 'admin', NULL, '[\"ROLE_ADMIN\"]', 1),
(4, 'test2@test.com', '$2y$13$wYX.tpwCgrkUqibaRllxwOkpucbE/8KPdyaNNE89CaHsgwaZjJek6', 0, '2024-11-19 17:58:22', '2024-11-19 17:58:22', 'admin', 'admin', '[\"ROLE_CLIENT\"]', 0),
(10, 'kevinpierre4554@gmail.com', '$2y$13$H4v2GAMIoNdRaGka5MDCAujZSUpKfwYeCt3GU2KGaK72F5SP7JDeC', 0, '2024-11-26 08:44:18', '2024-11-26 08:44:18', 'admin', 'admin', '[\"ROLE_CLIENT\"]', 0);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `certifications`
--
ALTER TABLE `certifications`
  ADD PRIMARY KEY (`certification_id`),
  ADD KEY `IDX_3B0D76D5A76ED395` (`user_id`),
  ADD KEY `IDX_3B0D76D559027487` (`theme_id`);

--
-- Index pour la table `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_A9A55A4C59027487` (`theme_id`);

--
-- Index pour la table `course_completion`
--
ALTER TABLE `course_completion`
  ADD PRIMARY KEY (`completion_id`),
  ADD KEY `IDX_E73479FDA76ED395` (`user_id`),
  ADD KEY `IDX_E73479FD591CC992` (`course_id`);

--
-- Index pour la table `doctrine_migration_versions`
--
ALTER TABLE `doctrine_migration_versions`
  ADD PRIMARY KEY (`version`);

--
-- Index pour la table `lessons`
--
ALTER TABLE `lessons`
  ADD PRIMARY KEY (`lesson_id`),
  ADD KEY `IDX_3F4218D95359E06E` (`courses_id_id`);

--
-- Index pour la table `lesson_completion`
--
ALTER TABLE `lesson_completion`
  ADD PRIMARY KEY (`completion_id`),
  ADD KEY `IDX_35DF7EAFA76ED395` (`user_id`),
  ADD KEY `IDX_35DF7EAFCDF80196` (`lesson_id`);

--
-- Index pour la table `messenger_messages`
--
ALTER TABLE `messenger_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_75EA56E0FB7336F0` (`queue_name`),
  ADD KEY `IDX_75EA56E0E3BD61CE` (`available_at`),
  ADD KEY `IDX_75EA56E016BA31DB` (`delivered_at`);

--
-- Index pour la table `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `IDX_F52993989D86650F` (`user_id_id`);

--
-- Index pour la table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`order_item_id`),
  ADD KEY `IDX_62809DB0CDF80196` (`lesson_id`),
  ADD KEY `IDX_62809DB0591CC992` (`course_id`),
  ADD KEY `IDX_62809DB08D9F6D38` (`order_id`);

--
-- Index pour la table `themes`
--
ALTER TABLE `themes`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_IDENTIFIER_EMAIL` (`email`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `certifications`
--
ALTER TABLE `certifications`
  MODIFY `certification_id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `courses`
--
ALTER TABLE `courses`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pour la table `course_completion`
--
ALTER TABLE `course_completion`
  MODIFY `completion_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `lessons`
--
ALTER TABLE `lessons`
  MODIFY `lesson_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT pour la table `lesson_completion`
--
ALTER TABLE `lesson_completion`
  MODIFY `completion_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT pour la table `messenger_messages`
--
ALTER TABLE `messenger_messages`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT pour la table `order`
--
ALTER TABLE `order`
  MODIFY `order_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT pour la table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `order_item_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=118;

--
-- AUTO_INCREMENT pour la table `themes`
--
ALTER TABLE `themes`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `certifications`
--
ALTER TABLE `certifications`
  ADD CONSTRAINT `FK_3B0D76D559027487` FOREIGN KEY (`theme_id`) REFERENCES `themes` (`id`),
  ADD CONSTRAINT `FK_3B0D76D5A76ED395` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Contraintes pour la table `courses`
--
ALTER TABLE `courses`
  ADD CONSTRAINT `FK_A9A55A4C59027487` FOREIGN KEY (`theme_id`) REFERENCES `themes` (`id`);

--
-- Contraintes pour la table `course_completion`
--
ALTER TABLE `course_completion`
  ADD CONSTRAINT `FK_E73479FD591CC992` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`),
  ADD CONSTRAINT `FK_E73479FDA76ED395` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Contraintes pour la table `lessons`
--
ALTER TABLE `lessons`
  ADD CONSTRAINT `FK_3F4218D95359E06E` FOREIGN KEY (`courses_id_id`) REFERENCES `courses` (`id`);

--
-- Contraintes pour la table `lesson_completion`
--
ALTER TABLE `lesson_completion`
  ADD CONSTRAINT `FK_35DF7EAFA76ED395` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `FK_35DF7EAFCDF80196` FOREIGN KEY (`lesson_id`) REFERENCES `lessons` (`lesson_id`);

--
-- Contraintes pour la table `order`
--
ALTER TABLE `order`
  ADD CONSTRAINT `FK_F52993989D86650F` FOREIGN KEY (`user_id_id`) REFERENCES `users` (`id`);

--
-- Contraintes pour la table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `FK_62809DB0591CC992` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`),
  ADD CONSTRAINT `FK_62809DB08D9F6D38` FOREIGN KEY (`order_id`) REFERENCES `order` (`order_id`),
  ADD CONSTRAINT `FK_62809DB0CDF80196` FOREIGN KEY (`lesson_id`) REFERENCES `lessons` (`lesson_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
