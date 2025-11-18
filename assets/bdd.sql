-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Tempo de geração: 18/11/2025 às 08:20
-- Versão do servidor: 9.1.0
-- Versão do PHP: 8.3.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `omeka`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `api_key`
--

DROP TABLE IF EXISTS `api_key`;
CREATE TABLE IF NOT EXISTS `api_key` (
  `id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner_id` int NOT NULL,
  `label` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `credential_hash` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_ip` varbinary(16) DEFAULT NULL COMMENT '(DC2Type:ip_address)',
  `last_accessed` datetime DEFAULT NULL,
  `created` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_C912ED9D7E3C61F9` (`owner_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `api_key`
--

INSERT INTO `api_key` (`id`, `owner_id`, `label`, `credential_hash`, `last_ip`, `last_accessed`, `created`) VALUES
('Im7HPMxp168o5Qh99iOkgmG5k9jt7Mm0', 1, 'API', '$2y$10$yPJH.NUJl2In1JStbay9suKu2OF1JCdlmhQExkPHlPwaPNuRGYvaG', 0x00000000000000000000000000000001, '2025-11-15 21:38:05', '2025-11-15 16:15:05');

-- --------------------------------------------------------

--
-- Estrutura para tabela `asset`
--

DROP TABLE IF EXISTS `asset`;
CREATE TABLE IF NOT EXISTS `asset` (
  `id` int NOT NULL AUTO_INCREMENT,
  `owner_id` int DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `media_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `storage_id` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `extension` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alt_text` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_2AF5A5C5CC5DB90` (`storage_id`),
  KEY `IDX_2AF5A5C7E3C61F9` (`owner_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `csvimport_entity`
--

DROP TABLE IF EXISTS `csvimport_entity`;
CREATE TABLE IF NOT EXISTS `csvimport_entity` (
  `id` int NOT NULL AUTO_INCREMENT,
  `job_id` int NOT NULL,
  `entity_id` int NOT NULL,
  `resource_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_84D382F4BE04EA9` (`job_id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `csvimport_entity`
--

INSERT INTO `csvimport_entity` (`id`, `job_id`, `entity_id`, `resource_type`) VALUES
(1, 4, 1, 'items'),
(2, 5, 2, 'items'),
(3, 5, 3, 'items'),
(4, 5, 4, 'items'),
(5, 5, 5, 'items'),
(6, 5, 6, 'items'),
(7, 5, 7, 'items'),
(8, 5, 8, 'items'),
(9, 5, 9, 'items'),
(10, 6, 10, 'items'),
(11, 6, 11, 'items'),
(12, 6, 12, 'items'),
(13, 6, 13, 'items'),
(14, 6, 14, 'items'),
(15, 6, 15, 'items'),
(16, 6, 16, 'items'),
(17, 6, 17, 'items'),
(18, 6, 18, 'items'),
(19, 6, 19, 'items'),
(20, 6, 20, 'items'),
(21, 6, 21, 'items'),
(22, 6, 22, 'items'),
(23, 6, 23, 'items'),
(24, 6, 24, 'items'),
(25, 6, 25, 'items'),
(26, 7, 26, 'items'),
(27, 7, 27, 'items'),
(28, 7, 28, 'items'),
(29, 8, 29, 'items'),
(30, 9, 30, 'items');

-- --------------------------------------------------------

--
-- Estrutura para tabela `csvimport_import`
--

DROP TABLE IF EXISTS `csvimport_import`;
CREATE TABLE IF NOT EXISTS `csvimport_import` (
  `id` int NOT NULL AUTO_INCREMENT,
  `job_id` int NOT NULL,
  `undo_job_id` int DEFAULT NULL,
  `comment` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `resource_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `has_err` tinyint(1) NOT NULL,
  `stats` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:json_array)',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_17B50881BE04EA9` (`job_id`),
  UNIQUE KEY `UNIQ_17B508814C276F75` (`undo_job_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `csvimport_import`
--

INSERT INTO `csvimport_import` (`id`, `job_id`, `undo_job_id`, `comment`, `resource_type`, `has_err`, `stats`) VALUES
(1, 4, NULL, '', 'items', 0, '{\"added\":{\"items\":1}}'),
(2, 5, NULL, '', 'items', 0, '{\"added\":{\"items\":8}}'),
(3, 6, NULL, '', 'items', 0, '{\"added\":{\"items\":16}}'),
(4, 7, NULL, '', 'items', 0, '{\"added\":{\"items\":3}}'),
(5, 8, NULL, '', 'items', 0, '{\"added\":{\"items\":1}}'),
(6, 9, NULL, '', 'items', 0, '{\"added\":{\"items\":1}}');

-- --------------------------------------------------------

--
-- Estrutura para tabela `fulltext_search`
--

DROP TABLE IF EXISTS `fulltext_search`;
CREATE TABLE IF NOT EXISTS `fulltext_search` (
  `id` int NOT NULL,
  `resource` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner_id` int DEFAULT NULL,
  `is_public` tinyint(1) NOT NULL,
  `title` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `text` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`,`resource`),
  KEY `IDX_AA31FE4A7E3C61F9` (`owner_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `fulltext_search`
--

INSERT INTO `fulltext_search` (`id`, `resource`, `owner_id`, `is_public`, `title`, `text`) VALUES
(2, 'items', 1, 1, NULL, '75\nParis'),
(3, 'items', 1, 1, NULL, '77\nSeine-et-Marne'),
(4, 'items', 1, 1, NULL, '78\nYvelines'),
(5, 'items', 1, 1, NULL, '91\nEssonne'),
(6, 'items', 1, 1, NULL, '92\nHauts-de-Seine'),
(7, 'items', 1, 1, NULL, '93\nSeine-Saint-Denis'),
(8, 'items', 1, 1, NULL, '94\nVal-de-Marne'),
(9, 'items', 1, 1, NULL, '95\nVal-d\'Oise'),
(10, 'items', 1, 1, 'Université Panthéon-Sorbonne - Paris 1', 'Université Panthéon-Sorbonne - Paris 1\n75'),
(11, 'items', 1, 1, 'Université Panthéon Assas - Paris 2', 'Université Panthéon Assas - Paris 2\n75'),
(12, 'items', 1, 1, 'Université Sorbonne Nouvelle - Paris 3', 'Université Sorbonne Nouvelle - Paris 3\n75'),
(13, 'items', 1, 1, 'Sorbonne Université', 'Sorbonne Université\n75'),
(14, 'items', 1, 1, 'Université Paris Cité', 'Université Paris Cité\n75'),
(15, 'items', 1, 1, 'Université PSL (Paris Sciences et Lettres)', 'Université PSL (Paris Sciences et Lettres)\n75'),
(16, 'items', 1, 1, 'Université Paris 8', 'Université Paris 8\n93'),
(17, 'items', 1, 1, 'Université Paris Dauphine', 'Université Paris Dauphine\n75'),
(18, 'items', 1, 1, 'Université Paris Nanterre', 'Université Paris Nanterre\n92'),
(19, 'items', 1, 1, 'Université Paris-Saclay', 'Université Paris-Saclay\n91'),
(20, 'items', 1, 1, 'Université Paris-Est Créteil Val de Marne', 'Université Paris-Est Créteil Val de Marne\n94'),
(21, 'items', 1, 1, 'Université Sorbonne Paris Nord', 'Université Sorbonne Paris Nord\n93'),
(22, 'items', 1, 1, 'Université Gustave Eiffel', 'Université Gustave Eiffel\n77'),
(23, 'items', 1, 1, 'Université de Versailles Saint-Quentin-en-Yvelines', 'Université de Versailles Saint-Quentin-en-Yvelines\n78'),
(24, 'items', 1, 1, 'Université d’Evry-Val-d’Essonne', 'Université d’Evry-Val-d’Essonne\n91'),
(25, 'items', 1, 1, 'CY Cergy Paris Université', 'CY Cergy Paris Université\n95'),
(26, 'items', 1, 1, NULL, 'Informatique\nM1\nSciences, Technologies, Santé'),
(27, 'items', 1, 1, NULL, 'Mathématiques et applications\nM1\nSciences, Technologies, Santé'),
(28, 'items', 1, 1, NULL, 'Mathématiques et Informatique Appliquées aux Sciences Humaines et Sociales\nM1\nSciences, Technologies, Santé'),
(30, 'items', 1, 1, NULL, 'Université Paris 8\nInformatique\nMathématiques et applications\nMathématiques et Informatique Appliquées aux Sciences Humaines et Sociales'),
(40, 'items', 1, 1, 'Évaluation Master - 2025-11-15', 'Étudiant 1\nInformatique\n2025\n20\nc\'est bon\n2025-11-15T20:49:44.461Z\nÉvaluation Master - 2025-11-15'),
(41, 'items', 1, 1, 'Évaluation Master - 15/11/2025', 'Étudiant 1\nInformatique\n2025\n20\na\n2025-11-15T21:06:47.738Z\nÉvaluation Master - 15/11/2025'),
(42, 'items', 1, 1, 'Évaluation Master - 15/11/2025', 'Étudiant 1\nInformatique\n2024\n20\nCommentaire audio joint\n2025-11-15T21:13:08.701Z\nÉvaluation Master - 15/11/2025'),
(45, 'items', 1, 1, 'Évaluation Master - 15/11/2025', 'Étudiant 1\nInformatique\n2025\n20\n🎤 Commentaire audio - voir le fichier joint\n2025-11-15T21:19:47.561Z\nÉvaluation Master - 15/11/2025'),
(47, 'items', 1, 1, 'Évaluation Master - 15/11/2025', 'Étudiant 1\nInformatique\n2025\n20\n🎤 Commentaire audio - voir le fichier joint\n2025-11-15T21:25:17.346Z\nÉvaluation Master - 15/11/2025'),
(49, 'items', 1, 1, 'Commentaire audio - 15/11/2025 22:38:04', 'Commentaire audio - 15/11/2025 22:38:04'),
(50, 'media', 1, 1, NULL, ''),
(51, 'items', 1, 1, 'Évaluation Master - 15/11/2025', 'Étudiant 1\nInformatique\n2025\n20\n\n2025-11-15T21:38:05.495Z\nÉvaluation Master - 15/11/2025');

-- --------------------------------------------------------

--
-- Estrutura para tabela `item`
--

DROP TABLE IF EXISTS `item`;
CREATE TABLE IF NOT EXISTS `item` (
  `id` int NOT NULL,
  `primary_media_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_1F1B251ECBE0B084` (`primary_media_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `item`
--

INSERT INTO `item` (`id`, `primary_media_id`) VALUES
(2, NULL),
(3, NULL),
(4, NULL),
(5, NULL),
(6, NULL),
(7, NULL),
(8, NULL),
(9, NULL),
(10, NULL),
(11, NULL),
(12, NULL),
(13, NULL),
(14, NULL),
(15, NULL),
(16, NULL),
(17, NULL),
(18, NULL),
(19, NULL),
(20, NULL),
(21, NULL),
(22, NULL),
(23, NULL),
(24, NULL),
(25, NULL),
(26, NULL),
(27, NULL),
(28, NULL),
(30, NULL),
(40, NULL),
(41, NULL),
(42, NULL),
(45, NULL),
(47, NULL),
(49, NULL),
(51, NULL);

-- --------------------------------------------------------

--
-- Estrutura para tabela `item_item_set`
--

DROP TABLE IF EXISTS `item_item_set`;
CREATE TABLE IF NOT EXISTS `item_item_set` (
  `item_id` int NOT NULL,
  `item_set_id` int NOT NULL,
  PRIMARY KEY (`item_id`,`item_set_id`),
  KEY `IDX_6D0C9625126F525E` (`item_id`),
  KEY `IDX_6D0C9625960278D7` (`item_set_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `item_set`
--

DROP TABLE IF EXISTS `item_set`;
CREATE TABLE IF NOT EXISTS `item_set` (
  `id` int NOT NULL,
  `is_open` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `item_site`
--

DROP TABLE IF EXISTS `item_site`;
CREATE TABLE IF NOT EXISTS `item_site` (
  `item_id` int NOT NULL,
  `site_id` int NOT NULL,
  PRIMARY KEY (`item_id`,`site_id`),
  KEY `IDX_A1734D1F126F525E` (`item_id`),
  KEY `IDX_A1734D1FF6BD1646` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `job`
--

DROP TABLE IF EXISTS `job`;
CREATE TABLE IF NOT EXISTS `job` (
  `id` int NOT NULL AUTO_INCREMENT,
  `owner_id` int DEFAULT NULL,
  `pid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `class` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `args` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT '(DC2Type:json_array)',
  `log` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `started` datetime NOT NULL,
  `ended` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_FBD8E0F87E3C61F9` (`owner_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `job`
--

INSERT INTO `job` (`id`, `owner_id`, `pid`, `status`, `class`, `args`, `log`, `started`, `ended`) VALUES
(1, 1, NULL, 'starting', 'CSVImport\\Job\\Import', '{\"filename\":\"students.csv\",\"filesize\":\"46\",\"filepath\":\"C:\\\\Windows\\\\Temp\\\\omeABDF.tmp\",\"media_type\":\"text\\/csv\",\"resource_type\":\"items\",\"comment\":\"\",\"automap_check_names_alone\":true,\"column-property\":[{\"foaf:name\":138},{\"ex:email\":186}],\"column-language\":[\"fr\",\"fr\"],\"generic-data\":\"default\",\"media-source\":\"default\",\"resource-identifier-property\":\"\",\"o:resource_template\":{\"o:id\":2},\"o:resource_class\":{\"o:id\":106},\"o:owner\":{\"o:id\":1},\"o:is_public\":1,\"multivalue_separator\":\",\",\"global_language\":\"fr\",\"action\":\"create\",\"identifier_column\":0,\"identifier_property\":\"\",\"action_unidentified\":\"skip\",\"rows_by_batch\":20,\"column-multivalue\":[],\"delimiter\":\",\",\"enclosure\":\"\\\"\",\"escape\":\"\\\\\"}', NULL, '2025-10-21 07:39:01', NULL),
(2, 1, NULL, 'starting', 'CSVImport\\Job\\Import', '{\"filename\":\"students.csv\",\"filesize\":\"46\",\"filepath\":\"C:\\\\Windows\\\\Temp\\\\omeFD08.tmp\",\"media_type\":\"text\\/csv\",\"resource_type\":\"items\",\"comment\":\"\",\"automap_check_names_alone\":true,\"column-property\":[{\"foaf:name\":138},{\"ex:email\":186}],\"column-language\":[\"fr\",\"fr\"],\"generic-data\":\"default\",\"media-source\":\"default\",\"resource-identifier-property\":\"\",\"o:resource_template\":{\"o:id\":2},\"o:resource_class\":{\"o:id\":106},\"o:owner\":{\"o:id\":1},\"o:is_public\":1,\"multivalue_separator\":\",\",\"global_language\":\"fr\",\"action\":\"create\",\"identifier_column\":0,\"identifier_property\":\"\",\"action_unidentified\":\"skip\",\"rows_by_batch\":20,\"column-multivalue\":[],\"delimiter\":\",\",\"enclosure\":\"\\\"\",\"escape\":\"\\\\\"}', NULL, '2025-10-21 08:32:57', NULL),
(3, 1, NULL, 'starting', 'CSVImport\\Job\\Import', '{\"filename\":\"students.csv\",\"filesize\":\"46\",\"filepath\":\"C:\\\\Windows\\\\Temp\\\\omeDBB5.tmp\",\"media_type\":\"text\\/csv\",\"resource_type\":\"items\",\"comment\":\"\",\"automap_check_names_alone\":true,\"column-property\":[{\"foaf:name\":138},{\"ex:email\":186}],\"column-language\":[\"fr\",\"fr\"],\"generic-data\":\"default\",\"media-source\":\"default\",\"resource-identifier-property\":\"\",\"o:resource_template\":{\"o:id\":2},\"o:resource_class\":{\"o:id\":106},\"o:owner\":{\"o:id\":1},\"o:is_public\":1,\"multivalue_separator\":\",\",\"global_language\":\"fr\",\"action\":\"create\",\"identifier_column\":0,\"identifier_property\":\"\",\"action_unidentified\":\"skip\",\"rows_by_batch\":20,\"column-multivalue\":[],\"delimiter\":\",\",\"enclosure\":\"\\\"\",\"escape\":\"\\\\\"}', NULL, '2025-10-21 08:41:09', NULL),
(4, 1, NULL, 'completed', 'CSVImport\\Job\\Import', '{\"filename\":\"students.csv\",\"filesize\":\"46\",\"filepath\":\"C:\\\\Windows\\\\Temp\\\\ome80DF.tmp\",\"media_type\":\"text\\/csv\",\"resource_type\":\"items\",\"comment\":\"\",\"automap_check_names_alone\":true,\"column-property\":[{\"foaf:name\":138},{\"ex:email\":186}],\"generic-data\":\"default\",\"media-source\":\"default\",\"resource-identifier-property\":\"\",\"o:resource_template\":{\"o:id\":2},\"o:resource_class\":{\"o:id\":106},\"o:owner\":{\"o:id\":1},\"o:is_public\":1,\"multivalue_separator\":\",\",\"global_language\":\"fr\",\"action\":\"create\",\"identifier_column\":0,\"identifier_property\":\"\",\"action_unidentified\":\"skip\",\"rows_by_batch\":20,\"column-multivalue\":[],\"delimiter\":\",\",\"enclosure\":\"\\\"\",\"escape\":\"\\\\\"}', NULL, '2025-10-21 09:41:54', '2025-10-21 09:41:54'),
(5, 1, NULL, 'completed', 'CSVImport\\Job\\Import', '{\"filename\":\"departments.csv\",\"filesize\":\"140\",\"filepath\":\"C:\\\\Windows\\\\Temp\\\\omeF4EC.tmp\",\"media_type\":\"text\\/csv\",\"resource_type\":\"items\",\"comment\":\"\",\"automap_check_names_alone\":true,\"column-property\":[{\"ex:code\":187},{\"ex:deptName\":188}],\"generic-data\":\"default\",\"media-source\":\"default\",\"resource-identifier-property\":\"\",\"o:resource_template\":{\"o:id\":3},\"o:resource_class\":{\"o:id\":107},\"o:owner\":{\"o:id\":1},\"o:is_public\":1,\"multivalue_separator\":\",\",\"global_language\":\"fr\",\"action\":\"create\",\"identifier_column\":0,\"identifier_property\":\"\",\"action_unidentified\":\"skip\",\"rows_by_batch\":20,\"column-multivalue\":[],\"delimiter\":\",\",\"enclosure\":\"\\\"\",\"escape\":\"\\\\\"}', NULL, '2025-11-03 19:28:03', '2025-11-03 19:28:03'),
(6, 1, NULL, 'completed', 'CSVImport\\Job\\Import', '{\"filename\":\"universities.csv\",\"filesize\":\"612\",\"filepath\":\"C:\\\\Windows\\\\Temp\\\\omeDC6D.tmp\",\"media_type\":\"text\\/csv\",\"resource_type\":\"items\",\"comment\":\"\",\"automap_check_names_alone\":true,\"column-property\":[{\"ex:univName\":189},{\"ex:belongsToDept\":190}],\"generic-data\":\"default\",\"media-source\":\"default\",\"resource-identifier-property\":\"\",\"o:resource_template\":{\"o:id\":5},\"o:resource_class\":{\"o:id\":108},\"o:owner\":{\"o:id\":1},\"o:is_public\":1,\"multivalue_separator\":\",\",\"global_language\":\"fr\",\"action\":\"create\",\"identifier_column\":0,\"identifier_property\":\"\",\"action_unidentified\":\"skip\",\"rows_by_batch\":20,\"column-multivalue\":[],\"delimiter\":\",\",\"enclosure\":\"\\\"\",\"escape\":\"\\\\\"}', NULL, '2025-11-04 09:54:55', '2025-11-04 09:54:55'),
(7, 1, NULL, 'completed', 'CSVImport\\Job\\Import', '{\"filename\":\"courses.csv\",\"filesize\":\"252\",\"filepath\":\"C:\\\\Windows\\\\Temp\\\\ome6303.tmp\",\"media_type\":\"text\\/csv\",\"resource_type\":\"items\",\"comment\":\"\",\"automap_check_names_alone\":true,\"column-property\":[{\"ex:mention\":191},{\"ex:level\":192},{\"ex:domain\":193}],\"generic-data\":\"default\",\"media-source\":\"default\",\"resource-identifier-property\":\"\",\"o:resource_template\":{\"o:id\":4},\"o:resource_class\":{\"o:id\":109},\"o:owner\":{\"o:id\":1},\"o:is_public\":1,\"multivalue_separator\":\",\",\"global_language\":\"fr\",\"action\":\"create\",\"identifier_column\":0,\"identifier_property\":\"\",\"action_unidentified\":\"skip\",\"rows_by_batch\":20,\"column-multivalue\":[],\"delimiter\":\",\",\"enclosure\":\"\\\"\",\"escape\":\"\\\\\"}', NULL, '2025-11-14 20:34:02', '2025-11-14 20:34:02'),
(8, 1, NULL, 'completed', 'CSVImport\\Job\\Import', '{\"filename\":\"universityCourses.csv\",\"filesize\":\"37\",\"filepath\":\"C:\\\\Windows\\\\Temp\\\\ome8CD8.tmp\",\"media_type\":\"text\\/csv\",\"resource_type\":\"items\",\"comment\":\"\",\"automap_check_names_alone\":true,\"column-property\":[{\"ex:offeredBy\":195},{\"ex:includesCourse\":194}],\"generic-data\":\"default\",\"media-source\":\"default\",\"resource-identifier-property\":\"\",\"o:resource_template\":{\"o:id\":6},\"o:resource_class\":{\"o:id\":110},\"o:owner\":{\"o:id\":1},\"o:is_public\":1,\"multivalue_separator\":\",\",\"global_language\":\"fr\",\"action\":\"create\",\"identifier_column\":0,\"identifier_property\":\"\",\"action_unidentified\":\"skip\",\"rows_by_batch\":20,\"column-multivalue\":[],\"delimiter\":\",\",\"enclosure\":\"\\\"\",\"escape\":\"\\\\\"}', NULL, '2025-11-14 20:43:53', '2025-11-14 20:43:53'),
(9, 1, NULL, 'completed', 'CSVImport\\Job\\Import', '{\"filename\":\"universityCourses.csv\",\"filesize\":\"37\",\"filepath\":\"C:\\\\Windows\\\\Temp\\\\ome814.tmp\",\"media_type\":\"text\\/csv\",\"resource_type\":\"items\",\"comment\":\"\",\"automap_check_names_alone\":true,\"column-property\":[{\"ex:offeredBy\":195},{\"ex:includesCourse\":194}],\"column-data-type\":[\"resource\",\"resource\"],\"column-multivalue\":{\"1\":\"1\"},\"generic-data\":\"default\",\"media-source\":\"default\",\"multivalue\":\"on\",\"resource-identifier-property\":\"\",\"o:resource_template\":{\"o:id\":6},\"o:resource_class\":{\"o:id\":110},\"o:owner\":{\"o:id\":2},\"o:is_public\":1,\"multivalue_separator\":\",\",\"global_language\":\"fr\",\"action\":\"create\",\"identifier_column\":0,\"identifier_property\":\"\",\"action_unidentified\":\"skip\",\"rows_by_batch\":20,\"delimiter\":\",\",\"enclosure\":\"\\\"\",\"escape\":\"\\\\\"}', NULL, '2025-11-14 21:32:16', '2025-11-14 21:32:17');

-- --------------------------------------------------------

--
-- Estrutura para tabela `media`
--

DROP TABLE IF EXISTS `media`;
CREATE TABLE IF NOT EXISTS `media` (
  `id` int NOT NULL,
  `item_id` int NOT NULL,
  `ingester` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `renderer` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT '(DC2Type:json_array)',
  `source` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `media_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `storage_id` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `extension` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sha256` char(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `size` bigint DEFAULT NULL,
  `has_original` tinyint(1) NOT NULL,
  `has_thumbnails` tinyint(1) NOT NULL,
  `position` int DEFAULT NULL,
  `lang` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alt_text` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_6A2CA10C5CC5DB90` (`storage_id`),
  KEY `IDX_6A2CA10C126F525E` (`item_id`),
  KEY `item_position` (`item_id`,`position`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `media`
--

INSERT INTO `media` (`id`, `item_id`, `ingester`, `renderer`, `data`, `source`, `media_type`, `storage_id`, `extension`, `sha256`, `size`, `has_original`, `has_thumbnails`, `position`, `lang`, `alt_text`) VALUES
(50, 49, 'upload', 'file', NULL, 'audio-1763242685259.wav', 'video/webm', '8151498e43054e193f276fdbcbd7b2e76ef13a4a', 'wav', 'd64975ebc71c3cf776544ab3fbb96fdfc3c70128977d094366031543684cdde5', 19616, 1, 0, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estrutura para tabela `migration`
--

DROP TABLE IF EXISTS `migration`;
CREATE TABLE IF NOT EXISTS `migration` (
  `version` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `migration`
--

INSERT INTO `migration` (`version`) VALUES
('20171128053327'),
('20180412035023'),
('20180919072656'),
('20180924033501'),
('20181002015551'),
('20181004043735'),
('20181106060421'),
('20190307043537'),
('20190319020708'),
('20190412090532'),
('20190423040354'),
('20190423071228'),
('20190514061351'),
('20190515055359'),
('20190729023728'),
('20190809092609'),
('20190815062003'),
('20200224022356'),
('20200226064602'),
('20200325091157'),
('20200326091310'),
('20200803000000'),
('20200831000000'),
('20210205101827'),
('20210225095734'),
('20210810083804'),
('20220718090449'),
('20220824103916'),
('20230124033031'),
('20230410074846'),
('20230523085358'),
('20230601060113'),
('20230713101012'),
('20231016000000'),
('20240103030617');

-- --------------------------------------------------------

--
-- Estrutura para tabela `module`
--

DROP TABLE IF EXISTS `module`;
CREATE TABLE IF NOT EXISTS `module` (
  `id` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `version` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `module`
--

INSERT INTO `module` (`id`, `is_active`, `version`) VALUES
('CSVImport', 1, '2.6.2');

-- --------------------------------------------------------

--
-- Estrutura para tabela `password_creation`
--

DROP TABLE IF EXISTS `password_creation`;
CREATE TABLE IF NOT EXISTS `password_creation` (
  `id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `user_id` int NOT NULL,
  `created` datetime NOT NULL,
  `activate` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_C77917B4A76ED395` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `password_creation`
--

INSERT INTO `password_creation` (`id`, `user_id`, `created`, `activate`) VALUES
('NyarcsGXQIFGR3bABlQbyaKB8V0S8JDL', 1, '2025-10-20 19:57:53', 0),
('gkKdmTRsj8ISFDh3C4QkfVJdmRzcWvdB', 2, '2025-10-21 07:16:46', 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `property`
--

DROP TABLE IF EXISTS `property`;
CREATE TABLE IF NOT EXISTS `property` (
  `id` int NOT NULL AUTO_INCREMENT,
  `owner_id` int DEFAULT NULL,
  `vocabulary_id` int NOT NULL,
  `local_name` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `label` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_8BF21CDEAD0E05F6623C14D5` (`vocabulary_id`,`local_name`),
  KEY `IDX_8BF21CDE7E3C61F9` (`owner_id`),
  KEY `IDX_8BF21CDEAD0E05F6` (`vocabulary_id`)
) ENGINE=InnoDB AUTO_INCREMENT=202 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `property`
--

INSERT INTO `property` (`id`, `owner_id`, `vocabulary_id`, `local_name`, `label`, `comment`) VALUES
(1, NULL, 1, 'title', 'Title', 'A name given to the resource.'),
(2, NULL, 1, 'creator', 'Creator', 'An entity primarily responsible for making the resource.'),
(3, NULL, 1, 'subject', 'Subject', 'The topic of the resource.'),
(4, NULL, 1, 'description', 'Description', 'An account of the resource.'),
(5, NULL, 1, 'publisher', 'Publisher', 'An entity responsible for making the resource available.'),
(6, NULL, 1, 'contributor', 'Contributor', 'An entity responsible for making contributions to the resource.'),
(7, NULL, 1, 'date', 'Date', 'A point or period of time associated with an event in the lifecycle of the resource.'),
(8, NULL, 1, 'type', 'Type', 'The nature or genre of the resource.'),
(9, NULL, 1, 'format', 'Format', 'The file format, physical medium, or dimensions of the resource.'),
(10, NULL, 1, 'identifier', 'Identifier', 'An unambiguous reference to the resource within a given context.'),
(11, NULL, 1, 'source', 'Source', 'A related resource from which the described resource is derived.'),
(12, NULL, 1, 'language', 'Language', 'A language of the resource.'),
(13, NULL, 1, 'relation', 'Relation', 'A related resource.'),
(14, NULL, 1, 'coverage', 'Coverage', 'The spatial or temporal topic of the resource, the spatial applicability of the resource, or the jurisdiction under which the resource is relevant.'),
(15, NULL, 1, 'rights', 'Rights', 'Information about rights held in and over the resource.'),
(16, NULL, 1, 'audience', 'Audience', 'A class of entity for whom the resource is intended or useful.'),
(17, NULL, 1, 'alternative', 'Alternative Title', 'An alternative name for the resource.'),
(18, NULL, 1, 'tableOfContents', 'Table Of Contents', 'A list of subunits of the resource.'),
(19, NULL, 1, 'abstract', 'Abstract', 'A summary of the resource.'),
(20, NULL, 1, 'created', 'Date Created', 'Date of creation of the resource.'),
(21, NULL, 1, 'valid', 'Date Valid', 'Date (often a range) of validity of a resource.'),
(22, NULL, 1, 'available', 'Date Available', 'Date (often a range) that the resource became or will become available.'),
(23, NULL, 1, 'issued', 'Date Issued', 'Date of formal issuance (e.g., publication) of the resource.'),
(24, NULL, 1, 'modified', 'Date Modified', 'Date on which the resource was changed.'),
(25, NULL, 1, 'extent', 'Extent', 'The size or duration of the resource.'),
(26, NULL, 1, 'medium', 'Medium', 'The material or physical carrier of the resource.'),
(27, NULL, 1, 'isVersionOf', 'Is Version Of', 'A related resource of which the described resource is a version, edition, or adaptation.'),
(28, NULL, 1, 'hasVersion', 'Has Version', 'A related resource that is a version, edition, or adaptation of the described resource.'),
(29, NULL, 1, 'isReplacedBy', 'Is Replaced By', 'A related resource that supplants, displaces, or supersedes the described resource.'),
(30, NULL, 1, 'replaces', 'Replaces', 'A related resource that is supplanted, displaced, or superseded by the described resource.'),
(31, NULL, 1, 'isRequiredBy', 'Is Required By', 'A related resource that requires the described resource to support its function, delivery, or coherence.'),
(32, NULL, 1, 'requires', 'Requires', 'A related resource that is required by the described resource to support its function, delivery, or coherence.'),
(33, NULL, 1, 'isPartOf', 'Is Part Of', 'A related resource in which the described resource is physically or logically included.'),
(34, NULL, 1, 'hasPart', 'Has Part', 'A related resource that is included either physically or logically in the described resource.'),
(35, NULL, 1, 'isReferencedBy', 'Is Referenced By', 'A related resource that references, cites, or otherwise points to the described resource.'),
(36, NULL, 1, 'references', 'References', 'A related resource that is referenced, cited, or otherwise pointed to by the described resource.'),
(37, NULL, 1, 'isFormatOf', 'Is Format Of', 'A related resource that is substantially the same as the described resource, but in another format.'),
(38, NULL, 1, 'hasFormat', 'Has Format', 'A related resource that is substantially the same as the pre-existing described resource, but in another format.'),
(39, NULL, 1, 'conformsTo', 'Conforms To', 'An established standard to which the described resource conforms.'),
(40, NULL, 1, 'spatial', 'Spatial Coverage', 'Spatial characteristics of the resource.'),
(41, NULL, 1, 'temporal', 'Temporal Coverage', 'Temporal characteristics of the resource.'),
(42, NULL, 1, 'mediator', 'Mediator', 'An entity that mediates access to the resource and for whom the resource is intended or useful.'),
(43, NULL, 1, 'dateAccepted', 'Date Accepted', 'Date of acceptance of the resource.'),
(44, NULL, 1, 'dateCopyrighted', 'Date Copyrighted', 'Date of copyright.'),
(45, NULL, 1, 'dateSubmitted', 'Date Submitted', 'Date of submission of the resource.'),
(46, NULL, 1, 'educationLevel', 'Audience Education Level', 'A class of entity, defined in terms of progression through an educational or training context, for which the described resource is intended.'),
(47, NULL, 1, 'accessRights', 'Access Rights', 'Information about who can access the resource or an indication of its security status.'),
(48, NULL, 1, 'bibliographicCitation', 'Bibliographic Citation', 'A bibliographic reference for the resource.'),
(49, NULL, 1, 'license', 'License', 'A legal document giving official permission to do something with the resource.'),
(50, NULL, 1, 'rightsHolder', 'Rights Holder', 'A person or organization owning or managing rights over the resource.'),
(51, NULL, 1, 'provenance', 'Provenance', 'A statement of any changes in ownership and custody of the resource since its creation that are significant for its authenticity, integrity, and interpretation.'),
(52, NULL, 1, 'instructionalMethod', 'Instructional Method', 'A process, used to engender knowledge, attitudes and skills, that the described resource is designed to support.'),
(53, NULL, 1, 'accrualMethod', 'Accrual Method', 'The method by which items are added to a collection.'),
(54, NULL, 1, 'accrualPeriodicity', 'Accrual Periodicity', 'The frequency with which items are added to a collection.'),
(55, NULL, 1, 'accrualPolicy', 'Accrual Policy', 'The policy governing the addition of items to a collection.'),
(56, NULL, 3, 'affirmedBy', 'affirmedBy', 'A legal decision that affirms a ruling.'),
(57, NULL, 3, 'annotates', 'annotates', 'Critical or explanatory note for a Document.'),
(58, NULL, 3, 'authorList', 'list of authors', 'An ordered list of authors. Normally, this list is seen as a priority list that order authors by importance.'),
(59, NULL, 3, 'citedBy', 'cited by', 'Relates a document to another document that cites the\nfirst document.'),
(60, NULL, 3, 'cites', 'cites', 'Relates a document to another document that is cited\nby the first document as reference, comment, review, quotation or for\nanother purpose.'),
(61, NULL, 3, 'contributorList', 'list of contributors', 'An ordered list of contributors. Normally, this list is seen as a priority list that order contributors by importance.'),
(62, NULL, 3, 'court', 'court', 'A court associated with a legal document; for example, that which issues a decision.'),
(63, NULL, 3, 'degree', 'degree', 'The thesis degree.'),
(64, NULL, 3, 'director', 'director', 'A Film director.'),
(65, NULL, 3, 'distributor', 'distributor', 'Distributor of a document or a collection of documents.'),
(66, NULL, 3, 'editor', 'editor', 'A person having managerial and sometimes policy-making responsibility for the editorial part of a publishing firm or of a newspaper, magazine, or other publication.'),
(67, NULL, 3, 'editorList', 'list of editors', 'An ordered list of editors. Normally, this list is seen as a priority list that order editors by importance.'),
(68, NULL, 3, 'interviewee', 'interviewee', 'An agent that is interviewed by another agent.'),
(69, NULL, 3, 'interviewer', 'interviewer', 'An agent that interview another agent.'),
(70, NULL, 3, 'issuer', 'issuer', 'An entity responsible for issuing often informally published documents such as press releases, reports, etc.'),
(71, NULL, 3, 'organizer', 'organizer', 'The organizer of an event; includes conference organizers, but also government agencies or other bodies that are responsible for conducting hearings.'),
(72, NULL, 3, 'owner', 'owner', 'Owner of a document or a collection of documents.'),
(73, NULL, 3, 'performer', 'performer', NULL),
(74, NULL, 3, 'presentedAt', 'presented at', 'Relates a document to an event; for example, a paper to a conference.'),
(75, NULL, 3, 'presents', 'presents', 'Relates an event to associated documents; for example, conference to a paper.'),
(76, NULL, 3, 'producer', 'producer', 'Producer of a document or a collection of documents.'),
(77, NULL, 3, 'recipient', 'recipient', 'An agent that receives a communication document.'),
(78, NULL, 3, 'reproducedIn', 'reproducedIn', 'The resource in which another resource is reproduced.'),
(79, NULL, 3, 'reversedBy', 'reversedBy', 'A legal decision that reverses a ruling.'),
(80, NULL, 3, 'reviewOf', 'review of', 'Relates a review document to a reviewed thing (resource, item, etc.).'),
(81, NULL, 3, 'status', 'status', 'The publication status of (typically academic) content.'),
(82, NULL, 3, 'subsequentLegalDecision', 'subsequentLegalDecision', 'A legal decision on appeal that takes action on a case (affirming it, reversing it, etc.).'),
(83, NULL, 3, 'transcriptOf', 'transcript of', 'Relates a document to some transcribed original.'),
(84, NULL, 3, 'translationOf', 'translation of', 'Relates a translated document to the original document.'),
(85, NULL, 3, 'translator', 'translator', 'A person who translates written document from one language to another.'),
(86, NULL, 3, 'abstract', 'abstract', 'A summary of the resource.'),
(87, NULL, 3, 'argued', 'date argued', 'The date on which a legal case is argued before a court. Date is of format xsd:date'),
(88, NULL, 3, 'asin', 'asin', NULL),
(89, NULL, 3, 'chapter', 'chapter', 'An chapter number'),
(90, NULL, 3, 'coden', 'coden', NULL),
(91, NULL, 3, 'content', 'content', 'This property is for a plain-text rendering of the content of a Document. While the plain-text content of an entire document could be described by this property.'),
(92, NULL, 3, 'doi', 'doi', NULL),
(93, NULL, 3, 'eanucc13', 'eanucc13', NULL),
(94, NULL, 3, 'edition', 'edition', 'The name defining a special edition of a document. Normally its a literal value composed of a version number and words.'),
(95, NULL, 3, 'eissn', 'eissn', NULL),
(96, NULL, 3, 'gtin14', 'gtin14', NULL),
(97, NULL, 3, 'handle', 'handle', NULL),
(98, NULL, 3, 'identifier', 'identifier', NULL),
(99, NULL, 3, 'isbn', 'isbn', NULL),
(100, NULL, 3, 'isbn10', 'isbn10', NULL),
(101, NULL, 3, 'isbn13', 'isbn13', NULL),
(102, NULL, 3, 'issn', 'issn', NULL),
(103, NULL, 3, 'issue', 'issue', 'An issue number'),
(104, NULL, 3, 'lccn', 'lccn', NULL),
(105, NULL, 3, 'locator', 'locator', 'A description (often numeric) that locates an item within a containing document or collection.'),
(106, NULL, 3, 'numPages', 'number of pages', 'The number of pages contained in a document'),
(107, NULL, 3, 'numVolumes', 'number of volumes', 'The number of volumes contained in a collection of documents (usually a series, periodical, etc.).'),
(108, NULL, 3, 'number', 'number', 'A generic item or document number. Not to be confused with issue number.'),
(109, NULL, 3, 'oclcnum', 'oclcnum', NULL),
(110, NULL, 3, 'pageEnd', 'page end', 'Ending page number within a continuous page range.'),
(111, NULL, 3, 'pageStart', 'page start', 'Starting page number within a continuous page range.'),
(112, NULL, 3, 'pages', 'pages', 'A string of non-contiguous page spans that locate a Document within a Collection. Example: 23-25, 34, 54-56. For continuous page ranges, use the pageStart and pageEnd properties.'),
(113, NULL, 3, 'pmid', 'pmid', NULL),
(114, NULL, 3, 'prefixName', 'prefix name', 'The prefix of a name'),
(115, NULL, 3, 'section', 'section', 'A section number'),
(116, NULL, 3, 'shortDescription', 'shortDescription', NULL),
(117, NULL, 3, 'shortTitle', 'short title', 'The abbreviation of a title.'),
(118, NULL, 3, 'sici', 'sici', NULL),
(119, NULL, 3, 'suffixName', 'suffix name', 'The suffix of a name'),
(120, NULL, 3, 'upc', 'upc', NULL),
(121, NULL, 3, 'uri', 'uri', 'Universal Resource Identifier of a document'),
(122, NULL, 3, 'volume', 'volume', 'A volume number'),
(123, NULL, 4, 'mbox', 'personal mailbox', 'A  personal mailbox, ie. an Internet mailbox associated with exactly one owner, the first owner of this mailbox. This is a \'static inverse functional property\', in that  there is (across time and change) at most one individual that ever has any particular value for foaf:mbox.'),
(124, NULL, 4, 'mbox_sha1sum', 'sha1sum of a personal mailbox URI name', 'The sha1sum of the URI of an Internet mailbox associated with exactly one owner, the  first owner of the mailbox.'),
(125, NULL, 4, 'gender', 'gender', 'The gender of this Agent (typically but not necessarily \'male\' or \'female\').'),
(126, NULL, 4, 'geekcode', 'geekcode', 'A textual geekcode for this person, see http://www.geekcode.com/geek.html'),
(127, NULL, 4, 'dnaChecksum', 'DNA checksum', 'A checksum for the DNA of some thing. Joke.'),
(128, NULL, 4, 'sha1', 'sha1sum (hex)', 'A sha1sum hash, in hex.'),
(129, NULL, 4, 'based_near', 'based near', 'A location that something is based near, for some broadly human notion of near.'),
(130, NULL, 4, 'title', 'title', 'Title (Mr, Mrs, Ms, Dr. etc)'),
(131, NULL, 4, 'nick', 'nickname', 'A short informal nickname characterising an agent (includes login identifiers, IRC and other chat nicknames).'),
(132, NULL, 4, 'jabberID', 'jabber ID', 'A jabber ID for something.'),
(133, NULL, 4, 'aimChatID', 'AIM chat ID', 'An AIM chat ID'),
(134, NULL, 4, 'skypeID', 'Skype ID', 'A Skype ID'),
(135, NULL, 4, 'icqChatID', 'ICQ chat ID', 'An ICQ chat ID'),
(136, NULL, 4, 'yahooChatID', 'Yahoo chat ID', 'A Yahoo chat ID'),
(137, NULL, 4, 'msnChatID', 'MSN chat ID', 'An MSN chat ID'),
(138, NULL, 4, 'name', 'name', 'A name for some thing.'),
(139, NULL, 4, 'firstName', 'firstName', 'The first name of a person.'),
(140, NULL, 4, 'lastName', 'lastName', 'The last name of a person.'),
(141, NULL, 4, 'givenName', 'Given name', 'The given name of some person.'),
(142, NULL, 4, 'givenname', 'Given name', 'The given name of some person.'),
(143, NULL, 4, 'surname', 'Surname', 'The surname of some person.'),
(144, NULL, 4, 'family_name', 'family_name', 'The family name of some person.'),
(145, NULL, 4, 'familyName', 'familyName', 'The family name of some person.'),
(146, NULL, 4, 'phone', 'phone', 'A phone,  specified using fully qualified tel: URI scheme (refs: http://www.w3.org/Addressing/schemes.html#tel).'),
(147, NULL, 4, 'homepage', 'homepage', 'A homepage for some thing.'),
(148, NULL, 4, 'weblog', 'weblog', 'A weblog of some thing (whether person, group, company etc.).'),
(149, NULL, 4, 'openid', 'openid', 'An OpenID for an Agent.'),
(150, NULL, 4, 'tipjar', 'tipjar', 'A tipjar document for this agent, describing means for payment and reward.'),
(151, NULL, 4, 'plan', 'plan', 'A .plan comment, in the tradition of finger and \'.plan\' files.'),
(152, NULL, 4, 'made', 'made', 'Something that was made by this agent.'),
(153, NULL, 4, 'maker', 'maker', 'An agent that  made this thing.'),
(154, NULL, 4, 'img', 'image', 'An image that can be used to represent some thing (ie. those depictions which are particularly representative of something, eg. one\'s photo on a homepage).'),
(155, NULL, 4, 'depiction', 'depiction', 'A depiction of some thing.'),
(156, NULL, 4, 'depicts', 'depicts', 'A thing depicted in this representation.'),
(157, NULL, 4, 'thumbnail', 'thumbnail', 'A derived thumbnail image.'),
(158, NULL, 4, 'myersBriggs', 'myersBriggs', 'A Myers Briggs (MBTI) personality classification.'),
(159, NULL, 4, 'workplaceHomepage', 'workplace homepage', 'A workplace homepage of some person; the homepage of an organization they work for.'),
(160, NULL, 4, 'workInfoHomepage', 'work info homepage', 'A work info homepage of some person; a page about their work for some organization.'),
(161, NULL, 4, 'schoolHomepage', 'schoolHomepage', 'A homepage of a school attended by the person.'),
(162, NULL, 4, 'knows', 'knows', 'A person known by this person (indicating some level of reciprocated interaction between the parties).'),
(163, NULL, 4, 'interest', 'interest', 'A page about a topic of interest to this person.'),
(164, NULL, 4, 'topic_interest', 'topic_interest', 'A thing of interest to this person.'),
(165, NULL, 4, 'publications', 'publications', 'A link to the publications of this person.'),
(166, NULL, 4, 'currentProject', 'current project', 'A current project this person works on.'),
(167, NULL, 4, 'pastProject', 'past project', 'A project this person has previously worked on.'),
(168, NULL, 4, 'fundedBy', 'funded by', 'An organization funding a project or person.'),
(169, NULL, 4, 'logo', 'logo', 'A logo representing some thing.'),
(170, NULL, 4, 'topic', 'topic', 'A topic of some page or document.'),
(171, NULL, 4, 'primaryTopic', 'primary topic', 'The primary topic of some page or document.'),
(172, NULL, 4, 'focus', 'focus', 'The underlying or \'focal\' entity associated with some SKOS-described concept.'),
(173, NULL, 4, 'isPrimaryTopicOf', 'is primary topic of', 'A document that this thing is the primary topic of.'),
(174, NULL, 4, 'page', 'page', 'A page or document about this thing.'),
(175, NULL, 4, 'theme', 'theme', 'A theme.'),
(176, NULL, 4, 'account', 'account', 'Indicates an account held by this agent.'),
(177, NULL, 4, 'holdsAccount', 'account', 'Indicates an account held by this agent.'),
(178, NULL, 4, 'accountServiceHomepage', 'account service homepage', 'Indicates a homepage of the service provide for this online account.'),
(179, NULL, 4, 'accountName', 'account name', 'Indicates the name (identifier) associated with this online account.'),
(180, NULL, 4, 'member', 'member', 'Indicates a member of a Group'),
(181, NULL, 4, 'membershipClass', 'membershipClass', 'Indicates the class of individuals that are a member of a Group'),
(182, NULL, 4, 'birthday', 'birthday', 'The birthday of this Agent, represented in mm-dd string form, eg. \'12-31\'.'),
(183, NULL, 4, 'age', 'age', 'The age in years of some agent.'),
(184, NULL, 4, 'status', 'status', 'A string expressing what the user is happy for the general public (normally) to know about their current activity.'),
(185, 1, 5, 'name', 'Nom', NULL),
(186, 1, 5, 'email', 'Email', NULL),
(187, 1, 5, 'code', 'Code du département', NULL),
(188, 1, 5, 'deptName', 'Nom du département', NULL),
(189, 1, 5, 'univName', 'Université', NULL),
(190, 1, 5, 'belongsToDept', 'Appartient au département', NULL),
(191, 1, 5, 'mention', 'Mention', NULL),
(192, 1, 5, 'level', 'Niveau (M1/M2)', NULL),
(193, 1, 5, 'domain', 'Domaine', NULL),
(194, 1, 5, 'includesCourse', 'Inclut le cours', NULL),
(195, 1, 5, 'offeredBy', 'Proposé par l\'université', NULL),
(196, 1, 5, 'student', 'Étudiant', NULL),
(197, 1, 5, 'universityCourse', 'Cours universitaire', NULL),
(198, 1, 5, 'year', 'Année', NULL),
(199, 1, 5, 'rating', 'Note', NULL),
(200, 1, 5, 'comment', 'Commentaire', NULL),
(201, 1, 5, 'evaluationDate', 'Date de l\'évaluation', NULL);

-- --------------------------------------------------------

--
-- Estrutura para tabela `resource`
--

DROP TABLE IF EXISTS `resource`;
CREATE TABLE IF NOT EXISTS `resource` (
  `id` int NOT NULL AUTO_INCREMENT,
  `owner_id` int DEFAULT NULL,
  `resource_class_id` int DEFAULT NULL,
  `resource_template_id` int DEFAULT NULL,
  `thumbnail_id` int DEFAULT NULL,
  `title` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `is_public` tinyint(1) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL,
  `resource_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_BC91F4167E3C61F9` (`owner_id`),
  KEY `IDX_BC91F416448CC1BD` (`resource_class_id`),
  KEY `IDX_BC91F41616131EA` (`resource_template_id`),
  KEY `IDX_BC91F416FDFF2E92` (`thumbnail_id`),
  KEY `title` (`title`(190)),
  KEY `is_public` (`is_public`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `resource`
--

INSERT INTO `resource` (`id`, `owner_id`, `resource_class_id`, `resource_template_id`, `thumbnail_id`, `title`, `is_public`, `created`, `modified`, `resource_type`) VALUES
(2, 1, 107, 3, NULL, 'Paris', 1, '2025-11-03 19:28:03', '2025-11-03 19:28:03', 'Omeka\\Entity\\Item'),
(3, 1, 107, 3, NULL, 'Seine-et-Marne', 1, '2025-11-03 19:28:03', '2025-11-03 19:28:03', 'Omeka\\Entity\\Item'),
(4, 1, 107, 3, NULL, 'Yvelines', 1, '2025-11-03 19:28:03', '2025-11-03 19:28:03', 'Omeka\\Entity\\Item'),
(5, 1, 107, 3, NULL, 'Essonne', 1, '2025-11-03 19:28:03', '2025-11-03 19:28:03', 'Omeka\\Entity\\Item'),
(6, 1, 107, 3, NULL, 'Hauts-de-Seine', 1, '2025-11-03 19:28:03', '2025-11-03 19:28:03', 'Omeka\\Entity\\Item'),
(7, 1, 107, 3, NULL, 'Seine-Saint-Denis', 1, '2025-11-03 19:28:03', '2025-11-03 19:28:03', 'Omeka\\Entity\\Item'),
(8, 1, 107, 3, NULL, 'Val-de-Marne', 1, '2025-11-03 19:28:03', '2025-11-03 19:28:03', 'Omeka\\Entity\\Item'),
(9, 1, 107, 3, NULL, 'Val-d\'Oise', 1, '2025-11-03 19:28:03', '2025-11-03 19:28:03', 'Omeka\\Entity\\Item'),
(10, 1, 108, 5, NULL, 'Université Panthéon-Sorbonne - Paris 1', 1, '2025-11-04 09:54:55', '2025-11-04 09:54:55', 'Omeka\\Entity\\Item'),
(11, 1, 108, 5, NULL, 'Université Panthéon Assas - Paris 2', 1, '2025-11-04 09:54:55', '2025-11-04 09:54:55', 'Omeka\\Entity\\Item'),
(12, 1, 108, 5, NULL, 'Université Sorbonne Nouvelle - Paris 3', 1, '2025-11-04 09:54:55', '2025-11-04 09:54:55', 'Omeka\\Entity\\Item'),
(13, 1, 108, 5, NULL, 'Sorbonne Université', 1, '2025-11-04 09:54:55', '2025-11-04 09:54:55', 'Omeka\\Entity\\Item'),
(14, 1, 108, 5, NULL, 'Université Paris Cité', 1, '2025-11-04 09:54:55', '2025-11-04 09:54:55', 'Omeka\\Entity\\Item'),
(15, 1, 108, 5, NULL, 'Université PSL (Paris Sciences et Lettres)', 1, '2025-11-04 09:54:55', '2025-11-04 09:54:55', 'Omeka\\Entity\\Item'),
(16, 1, 108, 5, NULL, 'Université Paris 8', 1, '2025-11-04 09:54:55', '2025-11-04 09:54:55', 'Omeka\\Entity\\Item'),
(17, 1, 108, 5, NULL, 'Université Paris Dauphine', 1, '2025-11-04 09:54:55', '2025-11-04 09:54:55', 'Omeka\\Entity\\Item'),
(18, 1, 108, 5, NULL, 'Université Paris Nanterre', 1, '2025-11-04 09:54:55', '2025-11-04 09:54:55', 'Omeka\\Entity\\Item'),
(19, 1, 108, 5, NULL, 'Université Paris-Saclay', 1, '2025-11-04 09:54:55', '2025-11-04 09:54:55', 'Omeka\\Entity\\Item'),
(20, 1, 108, 5, NULL, 'Université Paris-Est Créteil Val de Marne', 1, '2025-11-04 09:54:55', '2025-11-04 09:54:55', 'Omeka\\Entity\\Item'),
(21, 1, 108, 5, NULL, 'Université Sorbonne Paris Nord', 1, '2025-11-04 09:54:55', '2025-11-04 09:54:55', 'Omeka\\Entity\\Item'),
(22, 1, 108, 5, NULL, 'Université Gustave Eiffel', 1, '2025-11-04 09:54:55', '2025-11-04 09:54:55', 'Omeka\\Entity\\Item'),
(23, 1, 108, 5, NULL, 'Université de Versailles Saint-Quentin-en-Yvelines', 1, '2025-11-04 09:54:55', '2025-11-04 09:54:55', 'Omeka\\Entity\\Item'),
(24, 1, 108, 5, NULL, 'Université d’Evry-Val-d’Essonne', 1, '2025-11-04 09:54:55', '2025-11-04 09:54:55', 'Omeka\\Entity\\Item'),
(25, 1, 108, 5, NULL, 'CY Cergy Paris Université', 1, '2025-11-04 09:54:55', '2025-11-04 09:54:55', 'Omeka\\Entity\\Item'),
(26, 1, 109, 4, NULL, 'Informatique', 1, '2025-11-14 20:34:02', '2025-11-14 20:34:02', 'Omeka\\Entity\\Item'),
(27, 1, 109, 4, NULL, 'Mathématiques et applications', 1, '2025-11-14 20:34:02', '2025-11-14 20:34:02', 'Omeka\\Entity\\Item'),
(28, 1, 109, 4, NULL, 'Mathématiques et Informatique Appliquées aux Sciences Humaines et Sociales', 1, '2025-11-14 20:34:02', '2025-11-14 20:34:02', 'Omeka\\Entity\\Item'),
(30, 1, 110, 6, NULL, NULL, 1, '2025-11-14 21:32:16', '2025-11-15 17:28:29', 'Omeka\\Entity\\Item'),
(40, 1, 111, 7, NULL, 'Évaluation Master - 2025-11-15', 1, '2025-11-15 20:49:44', '2025-11-15 20:49:44', 'Omeka\\Entity\\Item'),
(41, 1, 111, 7, NULL, 'Évaluation Master - 15/11/2025', 1, '2025-11-15 21:06:47', '2025-11-15 21:06:47', 'Omeka\\Entity\\Item'),
(42, 1, 111, 7, NULL, 'Évaluation Master - 15/11/2025', 1, '2025-11-15 21:13:08', '2025-11-15 21:13:08', 'Omeka\\Entity\\Item'),
(45, 1, 111, 7, NULL, 'Évaluation Master - 15/11/2025', 1, '2025-11-15 21:19:47', '2025-11-15 21:19:47', 'Omeka\\Entity\\Item'),
(47, 1, 111, 7, NULL, 'Évaluation Master - 15/11/2025', 1, '2025-11-15 21:25:17', '2025-11-15 21:25:17', 'Omeka\\Entity\\Item'),
(49, 1, NULL, NULL, NULL, 'Commentaire audio - 15/11/2025 22:38:04', 1, '2025-11-15 21:38:05', '2025-11-15 21:38:05', 'Omeka\\Entity\\Item'),
(50, 1, NULL, NULL, NULL, NULL, 1, '2025-11-15 21:38:05', '2025-11-15 21:38:05', 'Omeka\\Entity\\Media'),
(51, 1, 111, 7, NULL, 'Évaluation Master - 15/11/2025', 1, '2025-11-15 21:38:05', '2025-11-15 21:38:05', 'Omeka\\Entity\\Item');

-- --------------------------------------------------------

--
-- Estrutura para tabela `resource_class`
--

DROP TABLE IF EXISTS `resource_class`;
CREATE TABLE IF NOT EXISTS `resource_class` (
  `id` int NOT NULL AUTO_INCREMENT,
  `owner_id` int DEFAULT NULL,
  `vocabulary_id` int NOT NULL,
  `local_name` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `label` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_C6F063ADAD0E05F6623C14D5` (`vocabulary_id`,`local_name`),
  KEY `IDX_C6F063AD7E3C61F9` (`owner_id`),
  KEY `IDX_C6F063ADAD0E05F6` (`vocabulary_id`)
) ENGINE=InnoDB AUTO_INCREMENT=112 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `resource_class`
--

INSERT INTO `resource_class` (`id`, `owner_id`, `vocabulary_id`, `local_name`, `label`, `comment`) VALUES
(1, NULL, 1, 'Agent', 'Agent', 'A resource that acts or has the power to act.'),
(2, NULL, 1, 'AgentClass', 'Agent Class', 'A group of agents.'),
(3, NULL, 1, 'BibliographicResource', 'Bibliographic Resource', 'A book, article, or other documentary resource.'),
(4, NULL, 1, 'FileFormat', 'File Format', 'A digital resource format.'),
(5, NULL, 1, 'Frequency', 'Frequency', 'A rate at which something recurs.'),
(6, NULL, 1, 'Jurisdiction', 'Jurisdiction', 'The extent or range of judicial, law enforcement, or other authority.'),
(7, NULL, 1, 'LicenseDocument', 'License Document', 'A legal document giving official permission to do something with a Resource.'),
(8, NULL, 1, 'LinguisticSystem', 'Linguistic System', 'A system of signs, symbols, sounds, gestures, or rules used in communication.'),
(9, NULL, 1, 'Location', 'Location', 'A spatial region or named place.'),
(10, NULL, 1, 'LocationPeriodOrJurisdiction', 'Location, Period, or Jurisdiction', 'A location, period of time, or jurisdiction.'),
(11, NULL, 1, 'MediaType', 'Media Type', 'A file format or physical medium.'),
(12, NULL, 1, 'MediaTypeOrExtent', 'Media Type or Extent', 'A media type or extent.'),
(13, NULL, 1, 'MethodOfInstruction', 'Method of Instruction', 'A process that is used to engender knowledge, attitudes, and skills.'),
(14, NULL, 1, 'MethodOfAccrual', 'Method of Accrual', 'A method by which resources are added to a collection.'),
(15, NULL, 1, 'PeriodOfTime', 'Period of Time', 'An interval of time that is named or defined by its start and end dates.'),
(16, NULL, 1, 'PhysicalMedium', 'Physical Medium', 'A physical material or carrier.'),
(17, NULL, 1, 'PhysicalResource', 'Physical Resource', 'A material thing.'),
(18, NULL, 1, 'Policy', 'Policy', 'A plan or course of action by an authority, intended to influence and determine decisions, actions, and other matters.'),
(19, NULL, 1, 'ProvenanceStatement', 'Provenance Statement', 'A statement of any changes in ownership and custody of a resource since its creation that are significant for its authenticity, integrity, and interpretation.'),
(20, NULL, 1, 'RightsStatement', 'Rights Statement', 'A statement about the intellectual property rights (IPR) held in or over a Resource, a legal document giving official permission to do something with a resource, or a statement about access rights.'),
(21, NULL, 1, 'SizeOrDuration', 'Size or Duration', 'A dimension or extent, or a time taken to play or execute.'),
(22, NULL, 1, 'Standard', 'Standard', 'A basis for comparison; a reference point against which other things can be evaluated.'),
(23, NULL, 2, 'Collection', 'Collection', 'An aggregation of resources.'),
(24, NULL, 2, 'Dataset', 'Dataset', 'Data encoded in a defined structure.'),
(25, NULL, 2, 'Event', 'Event', 'A non-persistent, time-based occurrence.'),
(26, NULL, 2, 'Image', 'Image', 'A visual representation other than text.'),
(27, NULL, 2, 'InteractiveResource', 'Interactive Resource', 'A resource requiring interaction from the user to be understood, executed, or experienced.'),
(28, NULL, 2, 'Service', 'Service', 'A system that provides one or more functions.'),
(29, NULL, 2, 'Software', 'Software', 'A computer program in source or compiled form.'),
(30, NULL, 2, 'Sound', 'Sound', 'A resource primarily intended to be heard.'),
(31, NULL, 2, 'Text', 'Text', 'A resource consisting primarily of words for reading.'),
(32, NULL, 2, 'PhysicalObject', 'Physical Object', 'An inanimate, three-dimensional object or substance.'),
(33, NULL, 2, 'StillImage', 'Still Image', 'A static visual representation.'),
(34, NULL, 2, 'MovingImage', 'Moving Image', 'A series of visual representations imparting an impression of motion when shown in succession.'),
(35, NULL, 3, 'AcademicArticle', 'Academic Article', 'A scholarly academic article, typically published in a journal.'),
(36, NULL, 3, 'Article', 'Article', 'A written composition in prose, usually nonfiction, on a specific topic, forming an independent part of a book or other publication, as a newspaper or magazine.'),
(37, NULL, 3, 'AudioDocument', 'audio document', 'An audio document; aka record.'),
(38, NULL, 3, 'AudioVisualDocument', 'audio-visual document', 'An audio-visual document; film, video, and so forth.'),
(39, NULL, 3, 'Bill', 'Bill', 'Draft legislation presented for discussion to a legal body.'),
(40, NULL, 3, 'Book', 'Book', 'A written or printed work of fiction or nonfiction, usually on sheets of paper fastened or bound together within covers.'),
(41, NULL, 3, 'BookSection', 'Book Section', 'A section of a book.'),
(42, NULL, 3, 'Brief', 'Brief', 'A written argument submitted to a court.'),
(43, NULL, 3, 'Chapter', 'Chapter', 'A chapter of a book.'),
(44, NULL, 3, 'Code', 'Code', 'A collection of statutes.'),
(45, NULL, 3, 'CollectedDocument', 'Collected Document', 'A document that simultaneously contains other documents.'),
(46, NULL, 3, 'Collection', 'Collection', 'A collection of Documents or Collections'),
(47, NULL, 3, 'Conference', 'Conference', 'A meeting for consultation or discussion.'),
(48, NULL, 3, 'CourtReporter', 'Court Reporter', 'A collection of legal cases.'),
(49, NULL, 3, 'Document', 'Document', 'A document (noun) is a bounded physical representation of body of information designed with the capacity (and usually intent) to communicate. A document may manifest symbolic, diagrammatic or sensory-representational information.'),
(50, NULL, 3, 'DocumentPart', 'document part', 'a distinct part of a larger document or collected document.'),
(51, NULL, 3, 'DocumentStatus', 'Document Status', 'The status of the publication of a document.'),
(52, NULL, 3, 'EditedBook', 'Edited Book', 'An edited book.'),
(53, NULL, 3, 'Email', 'EMail', 'A written communication addressed to a person or organization and transmitted electronically.'),
(54, NULL, 3, 'Event', 'Event', NULL),
(55, NULL, 3, 'Excerpt', 'Excerpt', 'A passage selected from a larger work.'),
(56, NULL, 3, 'Film', 'Film', 'aka movie.'),
(57, NULL, 3, 'Hearing', 'Hearing', 'An instance or a session in which testimony and arguments are presented, esp. before an official, as a judge in a lawsuit.'),
(58, NULL, 3, 'Image', 'Image', 'A document that presents visual or diagrammatic information.'),
(59, NULL, 3, 'Interview', 'Interview', 'A formalized discussion between two or more people.'),
(60, NULL, 3, 'Issue', 'Issue', 'something that is printed or published and distributed, esp. a given number of a periodical'),
(61, NULL, 3, 'Journal', 'Journal', 'A periodical of scholarly journal Articles.'),
(62, NULL, 3, 'LegalCaseDocument', 'Legal Case Document', 'A document accompanying a legal case.'),
(63, NULL, 3, 'LegalDecision', 'Decision', 'A document containing an authoritative determination (as a decree or judgment) made after consideration of facts or law.'),
(64, NULL, 3, 'LegalDocument', 'Legal Document', 'A legal document; for example, a court decision, a brief, and so forth.'),
(65, NULL, 3, 'Legislation', 'Legislation', 'A legal document proposing or enacting a law or a group of laws.'),
(66, NULL, 3, 'Letter', 'Letter', 'A written or printed communication addressed to a person or organization and usually transmitted by mail.'),
(67, NULL, 3, 'Magazine', 'Magazine', 'A periodical of magazine Articles. A magazine is a publication that is issued periodically, usually bound in a paper cover, and typically contains essays, stories, poems, etc., by many writers, and often photographs and drawings, frequently specializing in a particular subject or area, as hobbies, news, or sports.'),
(68, NULL, 3, 'Manual', 'Manual', 'A small reference book, especially one giving instructions.'),
(69, NULL, 3, 'Manuscript', 'Manuscript', 'An unpublished Document, which may also be submitted to a publisher for publication.'),
(70, NULL, 3, 'Map', 'Map', 'A graphical depiction of geographic features.'),
(71, NULL, 3, 'MultiVolumeBook', 'Multivolume Book', 'A loose, thematic, collection of Documents, often Books.'),
(72, NULL, 3, 'Newspaper', 'Newspaper', 'A periodical of documents, usually issued daily or weekly, containing current news, editorials, feature articles, and usually advertising.'),
(73, NULL, 3, 'Note', 'Note', 'Notes or annotations about a resource.'),
(74, NULL, 3, 'Patent', 'Patent', 'A document describing the exclusive right granted by a government to an inventor to manufacture, use, or sell an invention for a certain number of years.'),
(75, NULL, 3, 'Performance', 'Performance', 'A public performance.'),
(76, NULL, 3, 'Periodical', 'Periodical', 'A group of related documents issued at regular intervals.'),
(77, NULL, 3, 'PersonalCommunication', 'Personal Communication', 'A communication between an agent and one or more specific recipients.'),
(78, NULL, 3, 'PersonalCommunicationDocument', 'Personal Communication Document', 'A personal communication manifested in some document.'),
(79, NULL, 3, 'Proceedings', 'Proceedings', 'A compilation of documents published from an event, such as a conference.'),
(80, NULL, 3, 'Quote', 'Quote', 'An excerpted collection of words.'),
(81, NULL, 3, 'ReferenceSource', 'Reference Source', 'A document that presents authoritative reference information, such as a dictionary or encylopedia .'),
(82, NULL, 3, 'Report', 'Report', 'A document describing an account or statement describing in detail an event, situation, or the like, usually as the result of observation, inquiry, etc..'),
(83, NULL, 3, 'Series', 'Series', 'A loose, thematic, collection of Documents, often Books.'),
(84, NULL, 3, 'Slide', 'Slide', 'A slide in a slideshow'),
(85, NULL, 3, 'Slideshow', 'Slideshow', 'A presentation of a series of slides, usually presented in front of an audience with written text and images.'),
(86, NULL, 3, 'Standard', 'Standard', 'A document describing a standard'),
(87, NULL, 3, 'Statute', 'Statute', 'A bill enacted into law.'),
(88, NULL, 3, 'Thesis', 'Thesis', 'A document created to summarize research findings associated with the completion of an academic degree.'),
(89, NULL, 3, 'ThesisDegree', 'Thesis degree', 'The academic degree of a Thesis'),
(90, NULL, 3, 'Webpage', 'Webpage', 'A web page is an online document available (at least initially) on the world wide web. A web page is written first and foremost to appear on the web, as distinct from other online resources such as books, manuscripts or audio documents which use the web primarily as a distribution mechanism alongside other more traditional methods such as print.'),
(91, NULL, 3, 'Website', 'Website', 'A group of Webpages accessible on the Web.'),
(92, NULL, 3, 'Workshop', 'Workshop', 'A seminar, discussion group, or the like, that emphasizes zxchange of ideas and the demonstration and application of techniques, skills, etc.'),
(93, NULL, 4, 'LabelProperty', 'Label Property', 'A foaf:LabelProperty is any RDF property with texual values that serve as labels.'),
(94, NULL, 4, 'Person', 'Person', 'A person.'),
(95, NULL, 4, 'Document', 'Document', 'A document.'),
(96, NULL, 4, 'Organization', 'Organization', 'An organization.'),
(97, NULL, 4, 'Group', 'Group', 'A class of Agents.'),
(98, NULL, 4, 'Agent', 'Agent', 'An agent (eg. person, group, software or physical artifact).'),
(99, NULL, 4, 'Project', 'Project', 'A project (a collective endeavour of some kind).'),
(100, NULL, 4, 'Image', 'Image', 'An image.'),
(101, NULL, 4, 'PersonalProfileDocument', 'PersonalProfileDocument', 'A personal profile RDF document.'),
(102, NULL, 4, 'OnlineAccount', 'Online Account', 'An online account.'),
(103, NULL, 4, 'OnlineGamingAccount', 'Online Gaming Account', 'An online gaming account.'),
(104, NULL, 4, 'OnlineEcommerceAccount', 'Online E-commerce Account', 'An online e-commerce account.'),
(105, NULL, 4, 'OnlineChatAccount', 'Online Chat Account', 'An online chat account.'),
(106, 1, 5, 'Student', 'Étudiant', NULL),
(107, 1, 5, 'Department', 'Département', NULL),
(108, 1, 5, 'University', 'Université', NULL),
(109, 1, 5, 'Course', 'Cours', NULL),
(110, 1, 5, 'UniversityCourse', 'Cours Universitaire', NULL),
(111, 1, 5, 'Evaluation', 'Évaluation', NULL);

-- --------------------------------------------------------

--
-- Estrutura para tabela `resource_template`
--

DROP TABLE IF EXISTS `resource_template`;
CREATE TABLE IF NOT EXISTS `resource_template` (
  `id` int NOT NULL AUTO_INCREMENT,
  `owner_id` int DEFAULT NULL,
  `resource_class_id` int DEFAULT NULL,
  `title_property_id` int DEFAULT NULL,
  `description_property_id` int DEFAULT NULL,
  `label` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_39ECD52EEA750E8` (`label`),
  KEY `IDX_39ECD52E7E3C61F9` (`owner_id`),
  KEY `IDX_39ECD52E448CC1BD` (`resource_class_id`),
  KEY `IDX_39ECD52E724734A3` (`title_property_id`),
  KEY `IDX_39ECD52EB84E0D1D` (`description_property_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `resource_template`
--

INSERT INTO `resource_template` (`id`, `owner_id`, `resource_class_id`, `title_property_id`, `description_property_id`, `label`) VALUES
(1, NULL, NULL, NULL, NULL, 'Base Resource'),
(2, 1, 106, 185, NULL, 'Étudiant'),
(3, 1, 107, 188, NULL, 'Département'),
(4, 1, 109, 191, NULL, 'Cours'),
(5, 1, 108, 189, NULL, 'Université'),
(6, 1, 110, 195, NULL, 'Cours Universitaire'),
(7, 1, 111, NULL, NULL, 'Évaluation');

-- --------------------------------------------------------

--
-- Estrutura para tabela `resource_template_property`
--

DROP TABLE IF EXISTS `resource_template_property`;
CREATE TABLE IF NOT EXISTS `resource_template_property` (
  `id` int NOT NULL AUTO_INCREMENT,
  `resource_template_id` int NOT NULL,
  `property_id` int NOT NULL,
  `alternate_label` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alternate_comment` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `position` int DEFAULT NULL,
  `data_type` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT '(DC2Type:json_array)',
  `is_required` tinyint(1) NOT NULL,
  `is_private` tinyint(1) NOT NULL,
  `default_lang` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_4689E2F116131EA549213EC` (`resource_template_id`,`property_id`),
  KEY `IDX_4689E2F116131EA` (`resource_template_id`),
  KEY `IDX_4689E2F1549213EC` (`property_id`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `resource_template_property`
--

INSERT INTO `resource_template_property` (`id`, `resource_template_id`, `property_id`, `alternate_label`, `alternate_comment`, `position`, `data_type`, `is_required`, `is_private`, `default_lang`) VALUES
(1, 1, 1, NULL, NULL, 1, NULL, 0, 0, NULL),
(2, 1, 15, NULL, NULL, 2, NULL, 0, 0, NULL),
(3, 1, 8, NULL, NULL, 3, NULL, 0, 0, NULL),
(4, 1, 2, NULL, NULL, 4, NULL, 0, 0, NULL),
(5, 1, 7, NULL, NULL, 5, NULL, 0, 0, NULL),
(6, 1, 4, NULL, NULL, 6, NULL, 0, 0, NULL),
(7, 1, 9, NULL, NULL, 7, NULL, 0, 0, NULL),
(8, 1, 12, NULL, NULL, 8, NULL, 0, 0, NULL),
(9, 1, 40, 'Place', NULL, 9, NULL, 0, 0, NULL),
(10, 1, 5, NULL, NULL, 10, NULL, 0, 0, NULL),
(11, 1, 17, NULL, NULL, 11, NULL, 0, 0, NULL),
(12, 1, 6, NULL, NULL, 12, NULL, 0, 0, NULL),
(13, 1, 25, NULL, NULL, 13, NULL, 0, 0, NULL),
(14, 1, 10, NULL, NULL, 14, NULL, 0, 0, NULL),
(15, 1, 13, NULL, NULL, 15, NULL, 0, 0, NULL),
(16, 1, 29, NULL, NULL, 16, NULL, 0, 0, NULL),
(17, 1, 30, NULL, NULL, 17, NULL, 0, 0, NULL),
(18, 1, 50, NULL, NULL, 18, NULL, 0, 0, NULL),
(19, 1, 3, NULL, NULL, 19, NULL, 0, 0, NULL),
(20, 1, 41, NULL, NULL, 20, NULL, 0, 0, NULL),
(21, 2, 1, NULL, NULL, 1, NULL, 0, 0, NULL),
(22, 2, 4, NULL, NULL, 2, NULL, 0, 0, NULL),
(23, 2, 185, NULL, NULL, 3, NULL, 0, 0, NULL),
(24, 2, 186, NULL, NULL, 4, NULL, 0, 0, NULL),
(25, 3, 1, NULL, NULL, 1, NULL, 0, 0, NULL),
(26, 3, 4, NULL, NULL, 2, NULL, 0, 0, NULL),
(27, 3, 187, NULL, NULL, 3, NULL, 0, 0, NULL),
(28, 3, 188, NULL, NULL, 4, NULL, 0, 0, NULL),
(29, 4, 1, NULL, NULL, 1, NULL, 0, 0, NULL),
(30, 4, 4, NULL, NULL, 2, NULL, 0, 0, NULL),
(31, 4, 191, NULL, NULL, 3, NULL, 0, 0, NULL),
(32, 4, 192, NULL, NULL, 4, NULL, 0, 0, NULL),
(33, 4, 193, NULL, NULL, 5, NULL, 0, 0, NULL),
(34, 5, 1, NULL, NULL, 1, NULL, 0, 0, NULL),
(35, 5, 4, NULL, NULL, 2, NULL, 0, 0, NULL),
(36, 5, 190, NULL, NULL, 3, NULL, 0, 0, NULL),
(37, 5, 189, NULL, NULL, 4, NULL, 0, 0, NULL),
(38, 6, 1, NULL, NULL, 1, NULL, 0, 0, NULL),
(39, 6, 4, NULL, NULL, 2, NULL, 0, 0, NULL),
(40, 6, 195, NULL, NULL, 3, '[\"resource:item\"]', 0, 0, NULL),
(41, 6, 194, NULL, NULL, 4, '[\"resource:item\"]', 0, 0, NULL),
(42, 7, 1, NULL, NULL, 1, NULL, 0, 0, NULL),
(43, 7, 4, NULL, NULL, 2, NULL, 0, 0, NULL),
(44, 7, 196, NULL, NULL, 3, NULL, 0, 0, NULL),
(45, 7, 197, NULL, NULL, 4, '[\"resource:item\"]', 0, 0, NULL),
(46, 7, 198, NULL, NULL, 5, NULL, 0, 0, NULL),
(47, 7, 200, NULL, NULL, 6, '[\"literal\",\"resource:media\"]', 0, 0, NULL),
(48, 7, 201, NULL, NULL, 7, NULL, 0, 0, NULL),
(49, 7, 199, NULL, NULL, 8, NULL, 0, 0, NULL);

-- --------------------------------------------------------

--
-- Estrutura para tabela `session`
--

DROP TABLE IF EXISTS `session`;
CREATE TABLE IF NOT EXISTS `session` (
  `id` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `data` longblob NOT NULL,
  `modified` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `session`
--

INSERT INTO `session` (`id`, `data`, `modified`) VALUES
('3vn8pdobbckgmh87ci33pn2hss', 0x5f5f4c616d696e61737c613a363a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736323139383733322e3133373233313b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22626e6872386765733874346b6e6a3234666a696b76756d34736e223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313736323233343937383b7d733a34343a224c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313736323234313933323b7d733a33323a224c616d696e61735f56616c696461746f725f437372665f73616c745f63737266223b613a313a7b733a363a22455850495245223b693a313736323234313137303b7d733a35333a224c616d696e61735f56616c696461746f725f437372665f73616c745f7265736f7572636574656d706c617465666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313736323234313931303b7d7d72656469726563745f75726c7c733a33303a22687474703a2f2f6c6f63616c686f73742f6f6d656b612d732f61646d696e223b4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a323a7b733a33323a226563653832656230323338303164353732613861373465663036363638393762223b733a33323a223762303065633461356266323265613461623936623866353863363536306530223b733a33323a226562633132353837343963636237633163386531313233656332363937373932223b733a33323a223138653863623864636231353832373033646665393566616635376630383266223b7d733a343a2268617368223b733a36353a2231386538636238646362313538323730336466653935666166353766303832662d6562633132353837343963636237633163386531313233656332363937373932223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4f6d656b614d657373656e6765727c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a303a7b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f417574687c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a313a7b733a373a2273746f72616765223b693a313b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a32353a7b733a33323a223433613938353763643263383737393262363463376566323336636133363937223b733a33323a223631653665666134613034636166643538336663313235656132313438663830223b733a33323a226564653233353961376436663866336337303965623537646437333031613139223b733a33323a223837326162663831303636613132303935653937333865386230653636303133223b733a33323a223466303839383166626461323737306562366630383565666433303939333562223b733a33323a223030376334386435363763363939323035396230333563333533346433313166223b733a33323a223432343766316237303238306337656236353964643935646165316434663039223b733a33323a223966323739303965666238666131316237306530613536653235393836373164223b733a33323a223737646237636265383636666235353036303661653834313632363861343963223b733a33323a226534336635353361393666386335306135376264613733353432666431323865223b733a33323a223665346235663230656439363464393339656433353161333237383034663533223b733a33323a226333323738373663383566323235623730303033336664373934363132616263223b733a33323a226535363166396665663962393238386331376164376561633562316439623666223b733a33323a223466626532393638363933363165343836376534653065313462343730623962223b733a33323a223034643539333237363731616534616634396662343062373338346436316332223b733a33323a223238613530623037623163636364353730363464303537646462393430316636223b733a33323a223431333661663465306134343561613533383161343135643666653036326436223b733a33323a223665643363303164306533303264646236643639326338316638623666326533223b733a33323a223462313231646563303134363735393635333333303136663464373739616331223b733a33323a226438353936373830656464373732393939396336663239646566643231303330223b733a33323a223833376331663961356161396565316435306462383433373861626536623165223b733a33323a223433366339333734333062346535653735643231353234356432663331633338223b733a33323a223834623433616535643932376261663863323466313565373433366662343061223b733a33323a223735363631643930353131346338643735653631366162323933666238663365223b733a33323a223962653261383633353730303238323736343337666538353538383961373634223b733a33323a223135333931373230306164613463363132303134346361303331373066383765223b733a33323a226339316666343263376639343534373364353936383239396566313265633839223b733a33323a223937643762393439313263303037356631313938636231663866373930323962223b733a33323a223434346632643833353932386461643366393138656538666261373261323564223b733a33323a223463653235626535633433393965303830343739353064326365326531656130223b733a33323a223935316639653935633036363163313736663132326532316338393236316632223b733a33323a223738626364656234633332303030643966363438306234363662643964333932223b733a33323a223362616162376363346364306430653731363661336538383838343339643565223b733a33323a223739363865643435356561303663346331623732623966666436303464626236223b733a33323a226339323763303134613765363835386230613337323631356662383064313965223b733a33323a226531383336393638356364366433343237386136333063313065386332313132223b733a33323a223161633530396566353762643262663865306231303837383537366463623266223b733a33323a223761326164646631643436643234616632616261353136386230666261623639223b733a33323a226338666436353434653763303463663965383263613430393433353462313137223b733a33323a223861313135613931376163306536383965376131316139333564623838396532223b733a33323a226236386334646433363238656332386563383636653134643135373834653137223b733a33323a223866353533353035616330643561643033323563643030636363626633613033223b733a33323a226333333836653763376334366532343765626131373861366630336562366463223b733a33323a226533323430343936336336313664646164316261366435643564366162383037223b733a33323a226462383539663930636231353462323834323238633336333863363163323439223b733a33323a226566326237616637383864393439306633313036623566363461636539633864223b733a33323a223539303062383665623261303864646332616235626666636335663737393831223b733a33323a223866643638323236316539316562653932303938393931633565366263626166223b733a33323a226363613866343664353930353633316533386239353865363763643330393338223b733a33323a223734346361373539343561313930626161633237386435393762326166643434223b7d733a343a2268617368223b733a36353a2237343463613735393435613139306261616332373864353937623261666434342d6363613866343664353930353633316533386239353865363763643330393338223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a353a7b733a33323a226132646532346533636363653330616237396638376536326239396231316535223b733a33323a226536386630323739376363653933616130346164666265383138353661393337223b733a33323a223432643466306335323838663530393832633564616237636564653330656162223b733a33323a223332373436343939613163313336643963643639373632326238363762363036223b733a33323a223365643466323266373737376566383234653032616136336661346434356536223b733a33323a223061346664393163663434666466393334323065393761373766323362393936223b733a33323a223437303539396630323732653262633366333561613732663161333034663163223b733a33323a223134613433326334306564316337336639316166323238643364633463353332223b733a33323a223664323162623138323665353333383963643731396432643736386333333066223b733a33323a223932313039313538313436306363643333616262353736653035613962633735223b7d733a343a2268617368223b733a36353a2239323130393135383134363063636433336162623537366530356139626337352d3664323162623138323665353333383963643731396432643736386333333066223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f7265736f7572636574656d706c617465666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a333a7b733a33323a223366666435386661313463356533616263663565313264383463383366383939223b733a33323a226131616662303161366566373230613334656561353233306131613230306339223b733a33323a223234356233376132383464613563343231613331333064623963613233353636223b733a33323a223438346533346337616335616664653636313833666536393964623863303932223b733a33323a223062653361326636623030643064393836613365613966343264663134343239223b733a33323a226263653939643637396462303533323465363534303633653137653162313965223b7d733a343a2268617368223b733a36353a2262636539396436373964623035333234653635343036336531376531623139652d3062653361326636623030643064393836613365613966343264663134343239223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d, 1762198732),
('4k2ndj2jsu6f9suam9lk9mnfe7', 0x5f5f4c616d696e61737c613a373a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736303939333032352e3831373439373b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22677463676a35756d34616735626870336b6171763136746a6665223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313736313033343134383b7d733a35313a224c616d696e61735f56616c696461746f725f437372665f73616c745f666f72676f7470617373776f7264666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313736313033333436353b7d733a35333a224c616d696e61735f56616c696461746f725f437372665f73616c745f7265736f7572636574656d706c617465666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313736313033353636343b7d733a33323a224c616d696e61735f56616c696461746f725f437372665f73616c745f63737266223b613a313a7b733a363a22455850495245223b693a313736313033343630313b7d733a34343a224c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313736313033353239323b7d7d72656469726563745f75726c7c733a33303a22687474703a2f2f6c6f63616c686f73742f6f6d656b612d732f61646d696e223b4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a373a7b733a33323a223164353730363864373130613966306535383166643561306664336261656431223b733a33323a226238616538393364353239343335386438393633623566663064326639356433223b733a33323a223533653161326262333062653933313561373135343535303566653239316631223b733a33323a223831633863396131663366386338353433656634383636663038336465646133223b733a33323a223430663033663966656461643261623265336465666133666638363763393039223b733a33323a226132366234376430643331356334613937323434363362386661633161393765223b733a33323a226134383833643962306138643439373665623630613231333264336138646635223b733a33323a226365376464666236353366373664663232323837613763636636343461663565223b733a33323a223339646334663265333664366437386235343736393734616166616136383666223b733a33323a226431336235613761343836356338383730316465336637336137303765386636223b733a33323a223564663130393930616162323936303532616363346631333263323938336363223b733a33323a226636306537393864303132373533356261393637643438346335313063343463223b733a33323a226635393839613365323061396564653565626662366134386235363563373665223b733a33323a223431633533393966663034633632626234636634303730613535353433376130223b7d733a343a2268617368223b733a36353a2234316335333939666630346336326262346366343037306135353534333761302d6635393839613365323061396564653565626662366134386235363563373665223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f666f72676f7470617373776f7264666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a323a7b733a33323a226330366231333162326139653165386265386361373462313730396463396137223b733a33323a226439356533623836616436653938623164303836323936336630633930373630223b733a33323a226564333630353833313733343436356533383830623939633636333363626139223b733a33323a226265313431643132343932353230613035613738313965303164336334383762223b7d733a343a2268617368223b733a36353a2262653134316431323439323532306130356137383139653031643363343837622d6564333630353833313733343436356533383830623939633636333363626139223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4f6d656b614d657373656e6765727c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a303a7b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f417574687c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a313a7b733a373a2273746f72616765223b693a313b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f7265736f7572636574656d706c617465666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a31303a7b733a33323a223932616265393535303232613530666263316535383632663165333931613262223b733a33323a223662306332663163316537343739636132316430356131353736643763633564223b733a33323a223730326563383632306165373532393337636463623839646538326666623562223b733a33323a226434646365393739343634353437636534643831666334333236623036663365223b733a33323a223933666264333336323564343637386536383462663833643832653633356366223b733a33323a226238653835383333323364333666633936623236613239353561656330623032223b733a33323a223964616539656562353537633834346536643663653531303239346139376639223b733a33323a226435363563343138343633363036343530626663623662633061643732316637223b733a33323a223734383731326535343136313535343465623639366339656331313132653232223b733a33323a226432666565626130356263343465303462323463333632623062313937383461223b733a33323a226138313336353934363232613765373261346163373461373364386238333139223b733a33323a223736353463663032306234613963376133663864386535653639383566646433223b733a33323a226466306464353464383065303130663035636161396434613733626539326535223b733a33323a223165666232323736643261643461663339623535353965323631333437373631223b733a33323a226665376431383661333365633836393536643133383238663961306531653436223b733a33323a223934613334383738306236313436306530613836373939303731343436313639223b733a33323a226638333837343265326264396636356663663164386137353364616139636531223b733a33323a223439313364646164393136666231393932656539336565343366323232653233223b733a33323a223932396235353639366566653566353534396432653163383735313433323931223b733a33323a223732363964626462393036376237663534373766303638356637363435626234223b7d733a343a2268617368223b733a36353a2237323639646264623930363762376635343737663036383566373634356262342d3932396235353639366566653566353534396432653163383735313433323931223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a353a7b733a33323a223763313037616638613665613631356466306464333565666437363364366561223b733a33323a226462616663333064376263623764646633646438633763386231353135386365223b733a33323a223435613230373239306239343632303663376639643235333764663930336466223b733a33323a223433656561373066303163383861633332313730376238626533333936303034223b733a33323a223434633631613237353135616432333162373930323033386635616233346636223b733a33323a223030663764663936363235363432333330363332303539393462636434633437223b733a33323a223832336636386262396661306634316135343731653438383930366636633564223b733a33323a223662626536383663363136396465373665356165633834613063376234363638223b733a33323a223666386438396464343837666635646335643136316265393463636161383039223b733a33323a226238356430616564613631366261346130303062643837323035656364333331223b7d733a343a2268617368223b733a36353a2262383564306165646136313662613461303030626438373230356563643333312d3666386438396464343837666635646335643136316265393463636161383039223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a323a7b733a33323a226461316639613037343763363532653564663561376532323037633064313739223b733a33323a226264386361376433623533316139633737373766643961613664396139363666223b733a33323a223330336261346532653637666461626234303136633639386135333464336436223b733a33323a226166383265626334623465626233636434333165303861313030366639326331223b7d733a343a2268617368223b733a36353a2261663832656263346234656262336364343331653038613130303666393263312d3330336261346532653637666461626234303136633639386135333464336436223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d, 1760993025),
('4o0ha4u706idefa2laign8gcim', 0x5f5f4c616d696e61737c613a363a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736323234373130302e3437323836323b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a226276386e717467676f71686e346f74397571766476366a676537223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313736323238373036323b7d733a33323a224c616d696e61735f56616c696461746f725f437372665f73616c745f63737266223b613a313a7b733a363a22455850495245223b693a313736323239303238333b7d733a34343a224c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313736323239303235383b7d733a35333a224c616d696e61735f56616c696461746f725f437372665f73616c745f7265736f7572636574656d706c617465666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313736323238393435353b7d7d72656469726563745f75726c7c733a33303a22687474703a2f2f6c6f63616c686f73742f6f6d656b612d732f61646d696e223b4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a323a7b733a33323a223465646335316438383037656265363635653235646531323965303831326536223b733a33323a223863363534663061353535653738393736616663323331633230323338333238223b733a33323a223864383165303737393938336432663635616632626130646364386136623661223b733a33323a226638653839363166303466633163623832356235616238393262653339343637223b7d733a343a2268617368223b733a36353a2266386538393631663034666331636238323562356162383932626533393436372d3864383165303737393938336432663635616632626130646364386136623661223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4f6d656b614d657373656e6765727c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a313a7b733a383a226d65737361676573223b613a313a7b693a313b613a313a7b693a303b733a32333a225375636365737366756c6c79206c6f67676564206f7574223b7d7d7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f417574687c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a303a7b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a343a7b733a33323a223461633366376466353362363762326433386437613336396462356361646536223b733a33323a226532353436313532363665366365626431613465326363343631626261343537223b733a33323a223961323965326238653966383963663737316435313933353839313263383330223b733a33323a223238636532393438383732626230376264633961626139633937353831633334223b733a33323a223864623336396463306166323837646463366364316165653937636666623664223b733a33323a223638616536316130613430623139333933653163636161663661623764363730223b733a33323a223539616533383036386462353964323533636533623461636430613739646332223b733a33323a226538633531363763633065646339646338323537663066643162623432356166223b7d733a343a2268617368223b733a36353a2265386335313637636330656463396463383235376630666431626234323561662d3539616533383036386462353964323533636533623461636430613739646332223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a363a7b733a33323a226263633762656232616465613063666162386131656563326539646163656337223b733a33323a223338656663616135303161636161636561363566313031353831363730333461223b733a33323a226332663039616334313131306439356231336534373566386337663561613266223b733a33323a226637616132383839623462373561623739306239353839643663376463656266223b733a33323a226135646638386532333833633036306563393834323331383265376463376337223b733a33323a223065353961613530636662393463363637623833623230623638656561646331223b733a33323a223230656665633037306637626536623566346462396662623132346164316661223b733a33323a226538363931396531326238383631613764613530363736386366313432653435223b733a33323a223364316632646465366638396564643131373633303466343366363365343865223b733a33323a226663383166333432306136313239353834373362396564656335626363336666223b733a33323a223030303466623239613632356363383463343135613666643363336636323562223b733a33323a226230326163353564333066303264653133626563346538373930356537613035223b7d733a343a2268617368223b733a36353a2262303261633535643330663032646531336265633465383739303565376130352d3030303466623239613632356363383463343135613666643363336636323562223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f7265736f7572636574656d706c617465666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a223236383565626330336561666434623064313331383733313166396562363237223b733a33323a226530316338336639393635643436356663326161633964633764393235343831223b7d733a343a2268617368223b733a36353a2265303163383366393936356434363566633261616339646337643932353438312d3236383565626330336561666434623064313331383733313166396562363237223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d, 1762247100),
('5g8nbr81qivfpslsbmcgo76qm3', 0x5f5f4c616d696e61737c613a353a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736323838393133372e30313836393b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2232696e6c6e6739696f626265617273726f6e616166646b72656d223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313736323933313637303b7d733a34343a224c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313736323933313836393b7d733a33323a224c616d696e61735f56616c696461746f725f437372665f73616c745f63737266223b613a313a7b733a363a22455850495245223b693a313736323933313835353b7d7d72656469726563745f75726c7c733a34333a22687474703a2f2f6c6f63616c686f73742f6f6d6b5f544879705f32352d32365f636c6f6e652f61646d696e223b4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a223661613263646563333235663532376431306135383137393864316332666661223b733a33323a226535346666623362616530333266383230326661313062613434363164373065223b7d733a343a2268617368223b733a36353a2265353466666233626165303332663832303266613130626134343631643730652d3661613263646563333235663532376431306135383137393864316332666661223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f417574687c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a313a7b733a373a2273746f72616765223b693a313b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4f6d656b614d657373656e6765727c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a303a7b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a393a7b733a33323a223162306230383462616137376333363261333361336639653737396464376462223b733a33323a226630643364353735663737373630346361376631343935643935633561363865223b733a33323a226335373335303836323861353231376530376232323562343337343639616263223b733a33323a226636383863626137613033653239666131636338393163396438363162666238223b733a33323a223664656438636564643338386461313331373637396435393836616663313563223b733a33323a223962643238666564636234613738313363316636323166376365666136396630223b733a33323a223765626465646337393864303066353034373439363035396465326333303336223b733a33323a223266373265656266313666623064323565353066376333313535646539303166223b733a33323a223734623465623339343866633031663363643963313963636362353338343239223b733a33323a223937336133343763386333353330333834653930656136366566666431643261223b733a33323a223538616631356432666638643735386261326663363139626632633661303564223b733a33323a223962353339393930646339613130323538353535313561333866323664663037223b733a33323a223766396233666130303830336330366166373662346133343866643232343663223b733a33323a223739346465393438636233633732363565666639366532613230306234663235223b733a33323a226561653864303737626665383237366237663737633561663331623664653039223b733a33323a223030306131393131396666366663333631656561666461393536623732623532223b733a33323a223938643761623336303438356265656235373239646334333236643832643531223b733a33323a226661336564653566383432366263326566376135643938313737343338373338223b7d733a343a2268617368223b733a36353a2266613365646535663834323662633265663761356439383137373433383733382d3938643761623336303438356265656235373239646334333236643832643531223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a226662326233616136336664383135633463363039646162626563323163363361223b733a33323a223137663661356338306361373035666365353934616138346537346536303934223b7d733a343a2268617368223b733a36353a2231376636613563383063613730356663653539346161383465373465363039342d6662326233616136336664383135633463363039646162626563323163363361223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d, 1762889137),
('5mv92sce7vhjt1199o7nvkqi9j', 0x5f5f4c616d696e61737c613a343a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736323838343731312e31363635323b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22696c72393671626570663734666a6f636362336b626c38363463223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313736323932323330303b7d733a34343a224c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313736323932373931313b7d7d72656469726563745f75726c7c733a34333a22687474703a2f2f6c6f63616c686f73742f6f6d6b5f544879705f32352d32365f636c6f6e652f61646d696e223b4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a226339383535353766393832346461653337383037633766303766303334633532223b733a33323a226632663736356431383032623131366239306135373662306630643165343335223b7d733a343a2268617368223b733a36353a2266326637363564313830326231313662393061353736623066306431653433352d6339383535353766393832346461653337383037633766303766303334633532223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f417574687c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a313a7b733a373a2273746f72616765223b693a313b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4f6d656b614d657373656e6765727c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a303a7b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a343a7b733a33323a226430383661366430313534383233643636346337383863396562383061623134223b733a33323a226134653035336436396162633363316232656165363835643536353966386463223b733a33323a226262343331353330663732353931363738336263386165373164313337623030223b733a33323a226636306233326262306437663738616266353936616438353430323936333437223b733a33323a223735646233653864616361616662643831343138653534616334373961376265223b733a33323a226366636263653938666132383732336438323436393861666561613064316531223b733a33323a223362643663643062613538316466313631396434393765633738383639373663223b733a33323a223734643234653566336133643163363333303533643633633338323863333165223b7d733a343a2268617368223b733a36353a2237346432346535663361336431633633333035336436336333383238633331652d3362643663643062613538316466313631396434393765633738383639373663223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d, 1762884711),
('cdpljpeclt4i9h95ophqvlc8mh', 0x5f5f4c616d696e61737c613a353a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736313033393931332e3532383032373b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a223970376c6231626467326a6a6e6b7463676d6d68346970663539223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313736313038323133343b7d733a33323a224c616d696e61735f56616c696461746f725f437372665f73616c745f63737266223b613a313a7b733a363a22455850495245223b693a313736313038323839333b7d733a34343a224c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313736313038333131333b7d7d72656469726563745f75726c7c733a33303a22687474703a2f2f6c6f63616c686f73742f6f6d656b612d732f61646d696e223b4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a226263356266653437666135383861616662363565623535303163333439313762223b733a33323a223165343830636334393863613032636433653937646362373366343939383732223b7d733a343a2268617368223b733a36353a2231653438306363343938636130326364336539376463623733663439393837322d6263356266653437666135383861616662363565623535303163333439313762223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f417574687c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a313a7b733a373a2273746f72616765223b693a313b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4f6d656b614d657373656e6765727c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a303a7b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a333a7b733a33323a226362393238366230383063333239353261373839326232343038363364383861223b733a33323a226261373163663966346562616539613135626532366532393132653232653665223b733a33323a226135306163616665653132333165373738656334343832616431323132313030223b733a33323a226131383861356439623939613132643836633666653831373161646337613335223b733a33323a223630623837626532663761306632646137363938363930616262363365303434223b733a33323a223261623265383466323363313436636261363239663664616630363239623236223b7d733a343a2268617368223b733a36353a2232616232653834663233633134366362613632396636646166303632396232362d3630623837626532663761306632646137363938363930616262363365303434223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a343a7b733a33323a226262353934373564626532613937656235326437313530626366373966643865223b733a33323a223564333337636436373661663566653264386139333235623366303766626434223b733a33323a223836343232623861343935366635623733653230666337336539323565356139223b733a33323a226364616366373439383833393737656561333036633438383333626632646239223b733a33323a223032643133323463636661353530333233626464376238663738313237383532223b733a33323a223165333937376564343937333666623362623465306230353365313431303632223b733a33323a223433626431663438613764383238343433363633303933356333303136616163223b733a33323a223136396530386435303937333862636332623664393131646566653561363935223b7d733a343a2268617368223b733a36353a2231363965303864353039373338626363326236643931316465666535613639352d3433626431663438613764383238343433363633303933356333303136616163223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d, 1761039913),
('ckr6u79dec9c0bddfeskf7olra', 0x5f5f4c616d696e61737c613a353a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736323836383539352e3338363133393b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a223569683031326b356e6c726536397031326b6d66387361756d67223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313736323931313534373b7d733a34343a224c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313736323931313536363b7d733a33323a224c616d696e61735f56616c696461746f725f437372665f73616c745f63737266223b613a313a7b733a363a22455850495245223b693a313736323931313739353b7d7d72656469726563745f75726c7c733a33303a22687474703a2f2f6c6f63616c686f73742f6f6d656b612d732f61646d696e223b4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a226633613734356130646431353261613838633637616462353966326131663466223b733a33323a223866623561313532653666343934623765373437343932313532353461633438223b7d733a343a2268617368223b733a36353a2238666235613135326536663439346237653734373439323135323534616334382d6633613734356130646431353261613838633637616462353966326131663466223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f417574687c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a313a7b733a373a2273746f72616765223b693a313b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4f6d656b614d657373656e6765727c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a303a7b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a353a7b733a33323a226531383733623637613236626135393061303936663835643835366436343863223b733a33323a223964323365353061343337356136393830323531303665653532666636346231223b733a33323a223436306361626566356634626334336237383737393662343965633766626434223b733a33323a223331613737323239626666633263303736656164396132396261396338396635223b733a33323a226539663361323433356131633765643930326166313639326530383564333932223b733a33323a223037326464656261373664393666636435343661613034363336316138303664223b733a33323a223539633934353434663037343566316632316166373265616537636363396537223b733a33323a223333393937313839303234373737376437373532666537306636353133353031223b733a33323a226263333265653032323230623834316431376138363733323963333230363261223b733a33323a226563633837633464623233613236303265653237353861616237333862633864223b7d733a343a2268617368223b733a36353a2265636338376334646232336132363032656532373538616162373338626338642d6263333265653032323230623834316431376138363733323963333230363261223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a223465643730356661346535303935346430313335393630326432353535646436223b733a33323a226334356634353062386532303032656664363833633239386232383539383730223b7d733a343a2268617368223b733a36353a2263343566343530623865323030326566643638336332393862323835393837302d3465643730356661346535303935346430313335393630326432353535646436223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d, 1762868595);
INSERT INTO `session` (`id`, `data`, `modified`) VALUES
('ed0jn3devmdtnv3hvutekrik31', 0x5f5f4c616d696e61737c613a333a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736323234373130392e3338383733333b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22726936343876766a6c656668666a666d696e6c75646f68756f6a223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313736323239303330303b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a226636363438666462666232383565623632646465323133303533636665386566223b733a33323a226465393534396135623337356230616333393831636531656364383964323132223b7d733a343a2268617368223b733a36353a2264653935343961356233373562306163333938316365316563643839643231322d6636363438666462666232383565623632646465323133303533636665386566223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f417574687c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a303a7b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4f6d656b614d657373656e6765727c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a313a7b733a383a226d65737361676573223b613a313a7b693a313b613a313a7b693a303b733a32333a225375636365737366756c6c79206c6f67676564206f7574223b7d7d7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d72656469726563745f75726c7c4e3b, 1762247109),
('hht1i0d8s6it34utslla8vs7sr', 0x5f5f4c616d696e61737c613a363a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736323235303938312e3239303433353b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22746d6c703038307574346763746a6d3464656b7464646b696a66223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313736323239303330393b7d733a33323a224c616d696e61735f56616c696461746f725f437372665f73616c745f63737266223b613a313a7b733a363a22455850495245223b693a313736323239333334343b7d733a34343a224c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313736323239333239393b7d733a35333a224c616d696e61735f56616c696461746f725f437372665f73616c745f7265736f7572636574656d706c617465666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313736323239333232303b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a223433623336646233303932313330666638613965306261643134653132666533223b733a33323a223764356636393063663038663961636265383337363762633133316365353334223b7d733a343a2268617368223b733a36353a2237643566363930636630386639616362653833373637626331333163653533342d3433623336646233303932313330666638613965306261643134653132666533223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f417574687c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a313a7b733a373a2273746f72616765223b693a313b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4f6d656b614d657373656e6765727c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a303a7b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d72656469726563745f75726c7c4e3b4c616d696e61735f56616c696461746f725f437372665f73616c745f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a363a7b733a33323a223832663662633836333932353332356539383338306139373065633534393561223b733a33323a223463346366633037386337643735323937356634316361646161653533666264223b733a33323a226532363935313532313838653936316266643962303431366339393262323461223b733a33323a223861313630303632313530636334626531616231633936653435613330323965223b733a33323a223934646562633334623633313564623363363966396633656462656639653963223b733a33323a223131386538386664386530363364633661643965333961316164353461303565223b733a33323a223935383930636630376661396234613334336232343338306463656232326562223b733a33323a223235633034633637343366626233316163336461363630343734396532343661223b733a33323a223033313837383933353238363639613337613433313738363938363862383331223b733a33323a226230626438643631393166636462613535363036663137656461326230333764223b733a33323a223332363266303766653338323863386266333832666132303065386235633636223b733a33323a223537656362343832396562306435306435366362303038393461376631393135223b7d733a343a2268617368223b733a36353a2235376563623438323965623064353064353663623030383934613766313931352d3332363266303766653338323863386266333832666132303065386235633636223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a343a7b733a33323a223535383934313530636162343563633361633839316365343962646233333235223b733a33323a223537666664303533363264393662333739336438646339396366373134396539223b733a33323a226565303338616231373933313061623436386332623861653531656665623661223b733a33323a223862663730396332383635666530356339363437656330306563613464363065223b733a33323a226235643037653739356535336639616561326639366136366238613531366530223b733a33323a223539626235623665663535613566653736653461373439346666643338383765223b733a33323a226437393036636461386237656662396337343934313433333163316132306634223b733a33323a226266383261646432623264356563356331613535326131636163393132383532223b7d733a343a2268617368223b733a36353a2262663832616464326232643565633563316135353261316361633931323835322d6437393036636461386237656662396337343934313433333163316132306634223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f7265736f7572636574656d706c617465666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a226434376435343832336335336266623264636336343530613436306665333434223b733a33323a226536666331306463643736366238303834346262386335646633326430363139223b7d733a343a2268617368223b733a36353a2265366663313064636437363662383038343462623863356466333264303631392d6434376435343832336335336266623264636336343530613436306665333434223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d, 1762250981),
('p7gp3e29mlo9mnvqtid20u6teo', 0x5f5f4c616d696e61737c613a353a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736313033373234392e31393234363b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22307368366b68666c726270333272767530396567713472327661223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313736313037333432373b7d733a33323a224c616d696e61735f56616c696461746f725f437372665f73616c745f63737266223b613a313a7b733a363a22455850495245223b693a313736313038303434393b7d733a34343a224c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313736313037343237373b7d7d72656469726563745f75726c7c733a33303a22687474703a2f2f6c6f63616c686f73742f6f6d656b612d732f61646d696e223b4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a223230323762626135346535646365336536336635396339613436373261656361223b733a33323a223938656233333961303066343031386639623564396566373739336639623138223b7d733a343a2268617368223b733a36353a2239386562333339613030663430313866396235643965663737393366396231382d3230323762626135346535646365336536336635396339613436373261656361223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f417574687c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a313a7b733a373a2273746f72616765223b693a313b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4f6d656b614d657373656e6765727c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a303a7b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a32303a7b733a33323a223765356263666531616537626235656439373630373834316635373966326239223b733a33323a223237343732323336336537393362363033623430303264313661353838666138223b733a33323a226463643439323130373435663236353564663162316664663437623632343436223b733a33323a223234613736323337376330643637613362646666323634393764643431643135223b733a33323a226533363636613339336535366662356533626365396137343731633463636463223b733a33323a223939663130656633316437376636643563663037663232316631613132616661223b733a33323a226437666237326666356637653461656536643832613262396333366637313933223b733a33323a226263353730373335353637353937346632353333396438323261346165653134223b733a33323a223863383138393831663665623364356135346333653437336162616666393865223b733a33323a223162666233323663393239653837396134376636313530643062353964353234223b733a33323a223233356631626135363232353636373736366639393937666639353135626538223b733a33323a226433303762613033666161393439336463343161646130656166653638353163223b733a33323a223132373863656465393263623566333361633838356438643030666462303031223b733a33323a223933343363323837626363353433346537646162653232643634656661316162223b733a33323a223336386631626365356338666464323937613062353437666531643966373538223b733a33323a223761376638336430643235303332303565353835343133383733626562353432223b733a33323a226632333462363639336231363734376535393364653634366439373439333438223b733a33323a223966316136356534303933636565623363356230663263326266313439373561223b733a33323a226666643934393037303937636130316231643138633162623036643532653762223b733a33323a223638336536616634383434336639363936623963316339616234623364343532223b733a33323a223637336632646337313937373164393562393165373063383364613634333463223b733a33323a223537346636333638663437643936613835306635643034353566386531656232223b733a33323a223562363833633064336337303437633336623962633762376265626230623839223b733a33323a226532386432626263376361383734313161393935326362333830343963373632223b733a33323a226635336464313563336132333566373330626435303035663861613934323362223b733a33323a226365393836663936343030636639313364356237346536386561643837386664223b733a33323a223562353366333261326334363233353938336531356436303536666636306264223b733a33323a223532366261366438363835653062313130363737383535643737623531643861223b733a33323a226131386165376130323038353836633066666538343333383361373939316630223b733a33323a223931383565666562326530353136366330633431306336666633666334653636223b733a33323a226639383064346161373035666565366561316335313931623035396238393761223b733a33323a226132383032366137623165616339393336613662303837366134653935313666223b733a33323a223661363434343232363161393931376238633661373637336466633565363136223b733a33323a223833303561303732313331636133633739653231636365323761623061316131223b733a33323a223737636536323563386231633763306332643066633265646138333066393732223b733a33323a223631376330646633303162363831353632643563313332363765663864333161223b733a33323a223532643631356337623832396461376266623831346163643332363161323165223b733a33323a226661633062613366623338393735316361323530336561633666633339303336223b733a33323a223839636433353030626230626361326661353162666231626438663863333562223b733a33323a223966393032643330653661313535303630316563336166376436666130346435223b7d733a343a2268617368223b733a36353a2239663930326433306536613135353036303165633361663764366661303464352d3839636433353030626230626361326661353162666231626438663863333562223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a343a7b733a33323a226531643564353061663835613231373263623137343834373932333930393335223b733a33323a226666643337396430323133356263653830303762393463356238303036326234223b733a33323a223439313233306637643133393434376532373831336263646539323761373430223b733a33323a226238333861636531646561653135323366396134663131333831353962646638223b733a33323a223835666666613066363163636132356336373437333139376238633931396563223b733a33323a223234323564313261623337633833363932393566393238313065363639663762223b733a33323a223638303035316361363037663861333137653833383934663138343838626662223b733a33323a223639356666303335363836363766666132353036386630656361316230626465223b7d733a343a2268617368223b733a36353a2236393566663033353638363637666661323530363866306563613162306264652d3638303035316361363037663861333137653833383934663138343838626662223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d, 1761037249);
INSERT INTO `session` (`id`, `data`, `modified`) VALUES
('qki0m6639k1bf6ki1h01j3l5vs', 0x5f5f4c616d696e61737c613a363a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333234323731392e3933313035383b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a223174353967677637756774306f366d6a76663431636a34366f69223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313736333235383830333b7d733a34343a224c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313736333238353932303b7d733a33323a224c616d696e61735f56616c696461746f725f437372665f73616c745f63737266223b613a313a7b733a363a22455850495245223b693a313736333238343531343b7d733a35333a224c616d696e61735f56616c696461746f725f437372665f73616c745f7265736f7572636574656d706c617465666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313736333238353134353b7d7d72656469726563745f75726c7c733a34333a22687474703a2f2f6c6f63616c686f73742f6f6d6b5f544879705f32352d32365f636c6f6e652f61646d696e223b4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a223862623036353861326366623636323131356235353264633630626530316332223b733a33323a223661663561643430633535613163616366643630616232636666303731343734223b7d733a343a2268617368223b733a36353a2236616635616434306335356131636163666436306162326366663037313437342d3862623036353861326366623636323131356235353264633630626530316332223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f417574687c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a313a7b733a373a2273746f72616765223b693a313b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4f6d656b614d657373656e6765727c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a303a7b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a3136363a7b733a33323a223933363164636563306137303433393665646435643366663934303965383539223b733a33323a226365323862373237663034613763383161366466386139346638303234656164223b733a33323a223633666265366566313734633039363038326236353232646565333064656238223b733a33323a223734343039386139356264333835653337353765656535386365343339646534223b733a33323a223435646663353439343238343431643135653432363538323538643262653762223b733a33323a226663666261633734303061373136376138323963613635343461366166626433223b733a33323a223964643635656662303562383630393565636563333461616233306266373336223b733a33323a226366636334616265616532616331623639356237363339643334666165393239223b733a33323a226162323863353738323439323566353531643336363563303563643832623364223b733a33323a226433366338626664363766663331656538393963353662666339336138356463223b733a33323a226539343635303631666439396266386365376638373861376133326463366135223b733a33323a223565633830636633643434366363646133643062613332336361323833346439223b733a33323a223963366439343865356233326135316335313039663139333134356136663864223b733a33323a223032613937393733303339663330626263633561616432616135663133633763223b733a33323a226139656262643163306264323733636466363130313966313861383934306665223b733a33323a223539356135343762333135643936343539376466383763653037356163303062223b733a33323a223136316437383337353530343239383731373539376538626164303139353435223b733a33323a226133383839323434376431663138386133323162323261363335326262383934223b733a33323a223633386664383762366531383764663036653432393066366533666134386538223b733a33323a226236663962336633616638373234376433653163663364343638306435633532223b733a33323a226666643138373737303031363036346138356631663833353632366535663439223b733a33323a226131393632643061323965373432323337303331633961343134383135616166223b733a33323a223632336538333331333364633066383162313631316530623535363233383539223b733a33323a223038346364663264666164393432663163383763373636656465376231623738223b733a33323a223933373933663661636334346133623732353035613365326137343039303032223b733a33323a226330396564613339326331363933653333636531666332623132646636363531223b733a33323a223564356439376233373531613233633639396535306238333361366438363036223b733a33323a223430303338343561366462666362663331336462333031623235313161633063223b733a33323a223137323463363430356235306566643632623537343464633663353931383034223b733a33323a223739663636386331356535653339303037656262386131333237336330643037223b733a33323a226135643431653664623865663236666463613534636536313562633165636231223b733a33323a226332373566366531356139333566643261396139353631626636326332353637223b733a33323a226166633638313435333634666533346665326135616163633935663962623731223b733a33323a226334653939623261633334633862306135643163366464343036313736393561223b733a33323a226363386362396164346233616462356332626237666632333063373533393763223b733a33323a223231396436313262333934313865666434363234666535663062336437303461223b733a33323a223662613964313939396363653032393738653030633036636661633534363334223b733a33323a223963393539613930346138663938396361346133366133663536323164656234223b733a33323a223337663066376534613930326262303538343136643865643333346436316635223b733a33323a223434626233313234333932343765366161393935383137396237626431333265223b733a33323a226138373933316535646633353339633665353432643933303833363164386165223b733a33323a223366613566393232613836326331656533633162336133353366613862356433223b733a33323a223832643131326430363437343964626635353964323039363561303837326631223b733a33323a223936373638616666633565366230656539316364336466306264353534643066223b733a33323a223463636530363936633930623766386266326135333139613466643664323766223b733a33323a223265626565383537396663663061646133666430353765326230303531396466223b733a33323a223532653137386561326566656533366238363761383539386635356336636434223b733a33323a226538656233336334323530626632366434633666363836323237383231373662223b733a33323a223963666530626663323564306130653832383738313138396165303661363832223b733a33323a226462336135613235343661616163383836656464383239376163313362366333223b733a33323a223536306465386436643566663161363765626331613730616663663062303430223b733a33323a226339666338373762313537353731653966376465396663323035663262653739223b733a33323a226431323561343764326239613736353931353036326464333964613637393931223b733a33323a226165633238373238353465343236623865393463613735396236646664393437223b733a33323a226266336332396338386161643032386137663862313263303931646138636237223b733a33323a223161323135613762396661353638393062343966373038633736333230393834223b733a33323a226434633839396665633464643931353932656637326136356561623265393232223b733a33323a226561633832666338343665373632663835383130356466386361333839306439223b733a33323a226230613332366238373435613536366336616261663039616333656339353862223b733a33323a226465303962623537636131373539346139356131653539353636303536353734223b733a33323a223366366537363631343437633236303139396539343739653637313162333266223b733a33323a223137626137613236383465356439326636376536353862646632336637396539223b733a33323a223731663566613439663130373334386632666431366435323335336165383863223b733a33323a223330636334396563386465646463343366363863623139633364393861366232223b733a33323a223661383962653561616663363631313564616238303763323862396638366233223b733a33323a223638353839636236316431616566636133656435383064666464363966316430223b733a33323a226530323431373662636632376632646463306663353665636465386434366139223b733a33323a226634636235386631383764303636623231373433303230353764346561303832223b733a33323a223234356136386461323835663935303738363432303434333933326431306463223b733a33323a223034636435626138653539613037376332306431656261623365366665336534223b733a33323a223531353736356565356565323035373266303438643966643066613331363662223b733a33323a223233303933623264313533326130356439636663633532653262313333653261223b733a33323a223032373132333661396635613963396664363465666335636231386534313532223b733a33323a223365643562396465343163646237646130613364306632313266373265376563223b733a33323a223836623831333639653563633666613138336331613535633033376365333334223b733a33323a226638306437373332396239393532613464656635613265386331663332663266223b733a33323a226561303561616462643131383938306538623132653530303732656666303462223b733a33323a223130616661323465376235663032303937316163383461323466636562333762223b733a33323a226332393131393037636438353033316433356136616464336237376538333537223b733a33323a223066626264623632396331366561303564663734343062666663373661313265223b733a33323a223239303839353164313839346134663363353638363966356462353130623539223b733a33323a223335363032396134383035623366336531623066386462646362666133623330223b733a33323a223465366365623961303732643331326661356436633033343738393937646361223b733a33323a223564313864373864376539646564633561636431306139656638386362323836223b733a33323a223935323433306538646462373436393435623631336166326361333864383731223b733a33323a223661353765353363323930356536663765356534366435386436663135613036223b733a33323a223966333530306231356563386437353637623230393465643861303261326366223b733a33323a223737363830616637313439366138376161626333323831336263373833663331223b733a33323a223637663566343631613165343232373937656139316565363963663661356633223b733a33323a226666303661396362623236363766313562623531303738383561646332656564223b733a33323a223736393862303066623938346438396263656634336564336339623931376234223b733a33323a223562343065386638343065346331306332333239323662643433616634656134223b733a33323a223930653234663166323137376134313161626362303461333738336465613662223b733a33323a223263636236383938323165643932343737316263636231353063333439623235223b733a33323a226165326261306233333262313131303935396561323837323866653234343362223b733a33323a226462303737396436643230613266636133396262613735396339646365363030223b733a33323a223731306339343338353738616436616563356331653939396465646563396635223b733a33323a223231663463343336336438366430646664363062333235626630623762663562223b733a33323a223266356334333663666234396333383534353338313564326364313637373461223b733a33323a223032373730393163653136323836626162383264303030323964306366363436223b733a33323a223065356364666436393662333139616463383037623531346537396130633462223b733a33323a226166643531333039333933363762663034383930323833343966316137336565223b733a33323a223665343065326632363261313966386137313033376238633364653736623963223b733a33323a223961353464623238626536343664376433343563613133633533613039353064223b733a33323a226663306263383665623738366530356239333731306637323361343964666330223b733a33323a223664333731663164326239386134393431613165353864353835346161616333223b733a33323a223366633132373536306562376663656431356161353530633038373130383830223b733a33323a223434316534343035393736346263643835636462343062633032376337386166223b733a33323a223134653666633661613865356361393537663834636139656262623934613462223b733a33323a226666613238333030306132356665343431383731313837643930623165386366223b733a33323a226662353036343666643039393264393933393866353033383933646130346233223b733a33323a226132656638313238633636303831323963333338363437366236313336343065223b733a33323a226362393835363662353034326433343034636661396261333663653738303465223b733a33323a226230303430623331666666646564636266303931306161323766366164303965223b733a33323a223864396334616366323139633162623835353232346664623539313436366638223b733a33323a226235653338633966666562343334303665373066653639633861313065333062223b733a33323a223764373131306133346334633338323366326334663762643434646531373266223b733a33323a223838356664663531373232613532333537343962396363386465383132616331223b733a33323a223033366339653730633335653638373938383232386362636139373134346264223b733a33323a226631336337373539376464626336363233396536383161653833356439393364223b733a33323a223638366536656637353435653761633032383664663564336439616165613537223b733a33323a223964393962303738356639646132386163343764316332363233636363363364223b733a33323a223436393738373066313537366132363137653630303866313564323664316534223b733a33323a223133336139313630303339313664613563333335383831626162613832396566223b733a33323a223339363734323834373335366661363831633937393532643136336338336132223b733a33323a223435646535373461313266653365353435663366656430383537653966313334223b733a33323a223238636163626439333537636161373233636166353934326661343061383234223b733a33323a226533356361363437356339633335663734653933333065613262636135613263223b733a33323a223838353966353061343838356262396532626231326135623332353430313639223b733a33323a223039626364343764626366653936616161366139303931373037373063623033223b733a33323a223633353035366465396665363066396639353934666134333035313038666161223b733a33323a223539313433303063343635633131396264623034373033323061623663373733223b733a33323a226162633638386136613863656366623365326336626166643637613438383730223b733a33323a223835353366336338393766653663356131663033313433656431613930353264223b733a33323a226338303831346165343434393766316438663064326261356432646238666461223b733a33323a223831663131303636633065323661333536303134376161346562393736343338223b733a33323a223932323563383335646365616237356338376338326437393332623161333261223b733a33323a223234323538613961613036643564333865376332646262653066353130363836223b733a33323a226665353633636630646339643230343532363738356638623866663035626563223b733a33323a226563396330363033373231633266333764613931333939316436643263623633223b733a33323a223736396266346562386162333762356562616536613565343863626234336530223b733a33323a223635663262633834383165383837333263616365613935613735323434313530223b733a33323a223565386637666331323766363430346462623836343130376636386633633261223b733a33323a226362643335616365376537623462636462653664663836333238393862323063223b733a33323a223833626337666463393231363632646133306362346365333066376264373161223b733a33323a226136393337343337623634643632356130626634383531323136356137343131223b733a33323a223765333037346666346331656262663865663333653133636263373965666239223b733a33323a223038666665333463326330393065363130363465653439663265633734303031223b733a33323a223437383537343630386335303136353932316238373361643335616565623831223b733a33323a223566376637626535633638613334323939333132393035623730313234643365223b733a33323a226133396463303734303764643862663338336465393765383763346561643037223b733a33323a223232336139303461633836343833353336636263366266663963343934356532223b733a33323a223461653039393061623033366437643938363661346564373834376231613237223b733a33323a223235623234376435623732646563623833623738613839663531333330336263223b733a33323a223138663830356539353638323530323237366532663264363239626432663338223b733a33323a223961616365333030646265336133343662316330366430656334363132613861223b733a33323a226230643664623365336330616331366231623637333833373337636132333461223b733a33323a223133623431633136303461313137373161346162643362663165616532643262223b733a33323a223562343531333036646465623835663262323330373463376130653135383866223b733a33323a226166663263383564333966353664613537353838323865333262363766656263223b733a33323a226634633634323132333139316435323666643032396336316137373237333831223b733a33323a223434626331373433616362363362356364623034613934316161396463363062223b733a33323a226263306635333937343563393366363132343039636563613334643638666236223b733a33323a223837376637626332396131383834323366393937633762653731383565633263223b733a33323a223665316133383963303036643164366265333833363663373532386663323533223b733a33323a226663363330656635643936346263353337373661366632316635626336663039223b733a33323a226133336434623762383232393236633930343261636364663831643463623433223b733a33323a223163656366356537623262376161613665326664303030663830376433383237223b733a33323a226463386439336539326634623036303964653234323632366438613037356634223b733a33323a223032616239643734333434333630663834336432356535386633383262386161223b733a33323a223236636235623932323033373963373137306433343330343237353636356133223b733a33323a223039333564663834663764666435336633373566353939323262626430316435223b733a33323a226563343562613938636332376338306234636430333938663937656562623233223b733a33323a223366393633623237616265623763373732663333333661333637396466393666223b733a33323a223438336362386563333965633839656633326535646537363965306638393766223b733a33323a226632326131343935303439616230353135366535343165613263623433656532223b733a33323a223931636433383133663066386661323730393566383532373935346237363631223b733a33323a223264646237373135383030356665353461303234653036383532383639613263223b733a33323a223366656533393335653330333531383035306639356262323734623739663762223b733a33323a223734383164656437626261363035666165326338353462363862303535346631223b733a33323a226634613265666432313063316236333731343765393235356531383133623731223b733a33323a223430663064363864353537323335626435323361633966363761653533393130223b733a33323a226231326532643739663565363639346538613438633036353533313435643234223b733a33323a223239316465346662663036613833623331323938366363376637623831623762223b733a33323a223964396234373838316233663065616630633830656632646463313431303630223b733a33323a223039613466366566393435666639636263636536316463316262383833623164223b733a33323a223539333631306562366466613739656162363864666562366638353765663364223b733a33323a223264306164643137643961346338633866383135396665633466616364666136223b733a33323a223939643464316466326335636239643036613732646364653030336462666164223b733a33323a223833653866313831666165306466626335326634623032393732643730366636223b733a33323a223132323361623763323835346631656630343062343336313565363230383131223b733a33323a226464323537663732323533343236316435613863353862393937663932373033223b733a33323a223539636635386632656530313736646439373262353366373933346162663135223b733a33323a226534353965306662643332623965396633616333656639633661336563636434223b733a33323a223031636230393036393464613334653333383466343865356436323566626134223b733a33323a226234616638333938336434303631386233663334663735366233353632653632223b733a33323a226131623735623538303935303666326235363739623961646131633264626432223b733a33323a223033383266313735633832396334316230653966643935623564323636623937223b733a33323a223134393735636439343533386362663537333537373631396466623538653431223b733a33323a226631616531313066666435353634386565373333386662356634316635343331223b733a33323a223139363863383032303930633535633733393263366138316436363565323165223b733a33323a223566643533656266343138306238636264363739373534336435633233396538223b733a33323a223463363935386434643661343936366533343631616263646234396230376664223b733a33323a223037313364396266356630356361623638303265653035313238306135336335223b733a33323a223831643638306137306562326136666134333165633966366332656466666535223b733a33323a226665633336643931623864643461663562366435373239633831613065363630223b733a33323a223030313334316264326231316533346439646430653834313630366533333363223b733a33323a223337396337393162313330393162376137316465336631623535363230393766223b733a33323a223438373066333936373264383230366535393863323334613836323130353962223b733a33323a223164616464623062633665616366303162393266633361383738363537353439223b733a33323a226562393539316237653436336563323265623430343166383763623561316264223b733a33323a223833343861376432303838663835353934396133346233626165383361373931223b733a33323a223830663334653033323962313138653930643763376361316238353366386539223b733a33323a226637613937356531376362626666373862653036336562333234383533336666223b733a33323a226432323232643466343737643230303464363433323036646262306233343763223b733a33323a226637313435363537386134636362336130346666383237373337653562613536223b733a33323a223761356434346362396132363033656535373862616339626532633534396362223b733a33323a226333626362363364643861373239663433383133646138396433303964383435223b733a33323a223563343231336163393466363338613961643230343361343638346133343238223b733a33323a223839626636343339383232333634663062633961666562633633613261333566223b733a33323a226464653161326332383834616435663237306564643462653233356266306265223b733a33323a223032373662643865666531656163373234353833626635386339643433346533223b733a33323a223265313438613664396634363561336538306139623532643461373365373065223b733a33323a223063323561366433313961646239316238653533336338363731616339353338223b733a33323a226437376238353764346133356631303166336134613564336663373237343837223b733a33323a226536636337623661303239353430383132333333653761636163303862376266223b733a33323a223761303634623636386634353831393738343336306366633535343464363134223b733a33323a223364653865333030303862326132356235316630343331366336626263646134223b733a33323a226238363436396530383765633339346632663231626534323536356463393235223b733a33323a223235383637643134366166633361303435633637653635336339356633363761223b733a33323a223031643230383231393132626261643235383435313737346663316162313037223b733a33323a226366346431333861666463333762313035653961623932616330393763626536223b733a33323a226238653338643966663132653732323433643531656636383338616437636439223b733a33323a226566363664656430653836393466653064353064343533613533316365393938223b733a33323a226239306435343136656634306537376538313362313966323437333236306438223b733a33323a226161643331323536326437396165653266306634636461383932363936326631223b733a33323a223761323836643434653161613161313737313235653038383932633466373265223b733a33323a223836326635396466326635633631346230376637623862356136326630303063223b733a33323a223061323730366135646534666535343265393861353562653563396262363836223b733a33323a223963346232623438643664653065316135323264323239383935656565343038223b733a33323a226234623637353766353165623634373837383038313965653935353565343066223b733a33323a223535393065353539323436373462353637366263633730613230383964343536223b733a33323a226431363537346634323161376239386632613337313962333530313965343433223b733a33323a223863376530333763626161383436653536383664336232376339363063646264223b733a33323a223134663464633336633237346662366131613062316138343263316466633464223b733a33323a223635376634306163333663346563363561333538356230373930363333376237223b733a33323a223338613133376131323935373338343835386162656663353637303161313162223b733a33323a223034346135306266383039356361346237396662663833373835336134333462223b733a33323a226239633966333666316633613264363361363163376339646336616533343737223b733a33323a223630303233393130386437363334313036376136656464643065623630323862223b733a33323a226235643863353234323764343435363535393837306261386237633734373236223b733a33323a223735623738653130313236306437373737303431613231396563343033643133223b733a33323a226363316439343865643637316663393430666133313036663865303333613165223b733a33323a226461396561326231663939336531313234633337353666623430383330636336223b733a33323a223463376233363262313737613031626239303965656138663931333136363331223b733a33323a223163323631346635643438643666656436616166396532613030356265633764223b733a33323a223331633133663838336636396164376531346666336365633839303731656439223b733a33323a223962633833626261643233376634643735306664336361656362326535393630223b733a33323a226434306534336361616134633132633539376432653365343632616137633239223b733a33323a226131623361363039353930333632613662373138316161313934373037383062223b733a33323a226462633530356561363931353537393966613536333062353363616330656239223b733a33323a223232353838313535373736373666386563646265323137623061343062363266223b733a33323a226330383434336661303766353730363335633937633032326363643930333565223b733a33323a226362363536353062646662373632303831376234386665616632353838616330223b733a33323a226662333965643532356636613430356234643566336261663335366564326632223b733a33323a223264656461306265366535663962376630366462646563653164613966663563223b733a33323a226334323734353533356633393066366335353161363437646264346633643666223b733a33323a223133303262623335306364343462303263356332306233373362303763343663223b733a33323a226430353466656237303130633763333338633339663930646164383262373631223b733a33323a226239646465623736353732353730333533313734343566333731363336356430223b733a33323a223930666432326362396233653735313435343964373964663234333138303264223b733a33323a223537383934616537366562313732386165373731323439663761633531623236223b733a33323a226363326636376165323837623639313933313034633837636139666138313331223b733a33323a223237366530626530313837373839396330356361363935383438343938323837223b733a33323a223065323936323165646531346362323135613930383232633535653231303962223b733a33323a226231386430613539316630366531626665653665663630326538653565363235223b733a33323a226439386330386164383537653539653363303339653132306165376536356561223b733a33323a226161333839616533376564636637643164666636653663656536313333376636223b733a33323a223066663534323562663261326366376666373831333165373262396238333036223b733a33323a223365343230646266316261373730326632383636353032316637343937393862223b733a33323a226239333762643363653935353530636131396236316639663336613161653265223b733a33323a226462313734613363306534313864306232623364356332303638316466343366223b733a33323a226634396432393461376533323665616465303438343164633933306638666639223b733a33323a223539383032613764343166343966343463353462616434383566666338643437223b733a33323a223361613066383263343132636231613937626137666333326634653931643262223b733a33323a223766356332616136353135383339333637363638656133646335343637616362223b733a33323a226530346262363263346239386666393339666130633739326432363430393563223b733a33323a223566333936646262636136653065633338323239316465373234366363323463223b733a33323a223865396137613230323066383538376166343765336561633230386262323666223b733a33323a223965666665636466356263343834653438386235313839323361393064626364223b733a33323a226561646662313861376432613862643239343766623836623837363834616438223b733a33323a226334393832613364326664306461386363646531363163643031366538386631223b733a33323a223533633138306534653534353033383437653930633636383936623065393263223b733a33323a226135343863383236353762643666666534653965333931633137376635366439223b733a33323a223433356266616464633864346561666638326361613631633237313238663531223b733a33323a226262633461343637623635613337343336653364343934623437363232323363223b733a33323a223766613064643531356361643431396162653664633263373163303632356130223b733a33323a226362353635316231316232366439393734623966353638346662333562363333223b733a33323a226132633664323661626436333938313262333139376563613337313262393530223b733a33323a223437313164626435333731643639393666663231326235623731383262356464223b733a33323a223761303761393232393762326535313735383031636236663935623162326133223b733a33323a226165633837353136646264396537663763383435663366363863333631656132223b733a33323a223037323532653338336661666436653864633434643739646639343837643230223b733a33323a223636363862303763653365356635626361633731643263623363393164643633223b733a33323a223566633563366566313734323365343839303532343366646530346137333031223b733a33323a223135653031313435376161666563666266353265333439663863356530333465223b733a33323a226638313463303435666361386433636333626130363532633931376331373465223b733a33323a223564636236306536306534313361363731376434653639383865656664633161223b733a33323a226563333232633863303637316265633661636231343434373832616237363366223b733a33323a223233393165343965663363393534326232393438616566373766353437396339223b733a33323a223061663632313137366331646135313231656136653861333032643166383764223b733a33323a226134303665336432396237636362633366636562396136616533613535376238223b733a33323a223834323235643465313536366566383330373932363839663635393239343536223b733a33323a226538323238613435613661326561393030656239336435363830303137346338223b733a33323a223962323164303464666361616233653363633938643664303961623865306137223b733a33323a223337383764616362666561656532366264653463346135643430366336626538223b733a33323a223537373734323530376438383137646462326365313762336532613864643033223b733a33323a226463363061313031643435383864613262373461613734313632303862643634223b733a33323a226234303665613162383032626530636662393435316264646461303461353162223b733a33323a223239386232376465616431373763616534333431303336323837393039326430223b733a33323a223439393266306539363539336333356237623965313932643035653139313230223b733a33323a226138346234653066643332373262306637653063306539356537633365386235223b733a33323a226136336665363766643532353736373830393838333465363063633630346134223b733a33323a223533633139333231633463316535343730646365383366326463623138303264223b733a33323a226631366334613239336539633836396565643463643631356465643338636362223b733a33323a223730353234653731643138636137366464373165373438373739623562323838223b733a33323a223266373132376262346430393762623838623766383362616264326635343463223b733a33323a223934373863653463313134316434623261313030346130346166333935643964223b733a33323a223038386662396632363163396535613230616632316636396235653863653162223b733a33323a226166386136636132653136646531383032613666623666626332323665646464223b733a33323a223162323238613161616434383461656136343330383334343263343461333961223b733a33323a223664623036623030373330376464623161653862633864626361366439633230223b7d733a343a2268617368223b733a36353a2236646230366230303733303764646231616538626338646263613664396332302d3162323238613161616434383461656136343330383334343263343461333961223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a31393a7b733a33323a226630326161643330383539643537656236313831363939393133646234326639223b733a33323a223361333734643532613434646231656261303836353933363166356337653563223b733a33323a223037353964643936376330373035623964383531396636373364343730316462223b733a33323a226462356662326533643235393635653663316335626233653635643932623764223b733a33323a223437633761613061626164313035356532623236333865626235376233626563223b733a33323a223431653261316538373462396163353730393236643862303432386336386565223b733a33323a223937353635663038313564653034633431373432363232373334326565653631223b733a33323a223232666466313362393566343063316465653538396239393064623362386362223b733a33323a223561393361343864366437333632636235373432383565613330313834343463223b733a33323a223832613134326462623966323263613661306361613462643331303864323161223b733a33323a226539613165633932356332333933303231633935393962333835393162363032223b733a33323a226433633731346461343865623931366263363238376665333439373265613134223b733a33323a223130646133386339373136366161623062633037383930323038646663373132223b733a33323a223463316639353133323137393761643538373338313937643138646639383231223b733a33323a223639643433613164663963353139613262636230386134333139396364343434223b733a33323a226165663939663638316630383531373138663239623737383563303662336531223b733a33323a223431393437626638343539303866386538333039346237303864663132626637223b733a33323a226433353831653061363837623633353636353866353334613330636237643136223b733a33323a226430303538633265313536376639633338646237323564643862623530363661223b733a33323a226236663363363039313233313263393732646664346431303066646331663939223b733a33323a226636353735613965306132383933636637363837613166386530323465376363223b733a33323a223265363837633234386363346235306365386465356539393934653231613462223b733a33323a226663653637336238386539393162656536363632383039363061366164363363223b733a33323a223364643364353731663464383265623635336634616639323563376232386538223b733a33323a226131323731366338653737393137313338616237343233376439386534346633223b733a33323a226563396261373733613565353861633936376538326630356532666264316235223b733a33323a223939326530313466333137383230356435333730393437386236666231656339223b733a33323a223533633330633637363364353937636562316261653564306666306333313637223b733a33323a226239306237663937643839316364333066343934326331653135313761633237223b733a33323a226166643537313565323863666332326334313232656431303834316163646339223b733a33323a223532613431383464303266633234636338626334356161626436396634613435223b733a33323a223931633831366239343430303338303465303965656233383539323239646331223b733a33323a223537383034373364323339643136643262626363373334336434346464333864223b733a33323a223530343561633738613735616661326166326338323635623562653534663635223b733a33323a226464316662333532313261636465343661336230666533373234326465633432223b733a33323a223266303265386464306136366238333462373265653339336430656632323564223b733a33323a223839613130353835653835306263613739666361666166396238363532336535223b733a33323a223265356165313535653163316630616335363265653662323562653465383235223b7d733a343a2268617368223b733a36353a2232653561653135356531633166306163353632656536623235626534653832352d3839613130353835653835306263613739666361666166396238363532336535223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f7265736f7572636574656d706c617465666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a31333a7b733a33323a226162636437356663393133366266303232386261623638313630643961333734223b733a33323a226666383330666563393565316632303537656438323636613335316636393864223b733a33323a226633396564353963333965353633336162366463383733323566663430653664223b733a33323a226236616533663831323165613665373666303538613137343164653739646461223b733a33323a223237343866353764633834373232346332333163623462346233356632396633223b733a33323a226636393638366237373266646435353232323233306132663463666239376531223b733a33323a223265363366383239623535373037623234353634356138316137616437643134223b733a33323a223634346639306638633863323666343239346138373464653736353637643361223b733a33323a223738373561616462366565623736363331653937356566326666643235336563223b733a33323a226633373363623361643035623234316562343561653033643065323933366262223b733a33323a223933386165393535336265373534303339333962323136393438616663373033223b733a33323a223063366436626434323666666434313063656337326131656434376239613465223b733a33323a223038323930666234396431396332663836636539373134333166663063383763223b733a33323a223831656164303263656632393731663334383564353666656430306464393762223b733a33323a226634336430306238343038383463343665653766336434386362373262656232223b733a33323a223566656365623033373937626631653739623761653938613163336664323630223b733a33323a223963666165653836653537303434373136383632356166623132323630396538223b733a33323a226535303638333930653664336665306532623062356636313239343637303332223b733a33323a223437313038613530623835333866396664366339643439656539616466323164223b733a33323a226439396530333563366138666130643836663138333035656465636338333836223b733a33323a223535326138623839326136613638616538653036663537336539613639643330223b733a33323a226433356437383539343866646235356337366165316463353437393534663332223b733a33323a223535316365633961613639393961643931653837656135316263653938383937223b733a33323a223034663163353333303633366165613134616230376130306537666134346135223b733a33323a223737396436386235353936333232326139653132643539646565336637643965223b733a33323a223137623334333965653238613563666162666337396366623138393161653732223b7d733a343a2268617368223b733a36353a2231376233343339656532386135636661626663373963666231383931616537322d3737396436386235353936333232326139653132643539646565336637643965223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d, 1763242720);
INSERT INTO `session` (`id`, `data`, `modified`) VALUES
('ui1aa8qshoag72ibvuhanhk3r8', 0x5f5f4c616d696e61737c613a363a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736333135353933372e3133333632373b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a2234716261736c6870763631736b39673167316967326c32733568223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313736333139343435313b7d733a34343a224c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313736333139393036313b7d733a33323a224c616d696e61735f56616c696461746f725f437372665f73616c745f63737266223b613a313a7b733a363a22455850495245223b693a313736333139393036373b7d733a35333a224c616d696e61735f56616c696461746f725f437372665f73616c745f7265736f7572636574656d706c617465666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313736333139383735363b7d7d72656469726563745f75726c7c733a34333a22687474703a2f2f6c6f63616c686f73742f6f6d6b5f544879705f32352d32365f636c6f6e652f61646d696e223b4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a313a7b733a33323a223838633738643661366661643561666232313431386234386265663562626336223b733a33323a223363306164336532616636373332356135393539613964613964373931346366223b7d733a343a2268617368223b733a36353a2233633061643365326166363733323561353935396139646139643739313463662d3838633738643661366661643561666232313431386234386265663562626336223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f417574687c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a313a7b733a373a2273746f72616765223b693a313b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4f6d656b614d657373656e6765727c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a303a7b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f636f6e6669726d666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a33333a7b733a33323a223433313162306534396664323630663461313637396139363166396135383531223b733a33323a223839663266353837343862613132666636323537323966383730386664316234223b733a33323a223966396537353936636634363837336534313838393231313137666263383236223b733a33323a223038633434646234366461383331663861653735366334386166333338623738223b733a33323a226334353661636634393231353439336530363335653866646163666664346437223b733a33323a223162343566353263313039343063333833626535633332393861373334323038223b733a33323a226164616266336136363061653765613166373533623531373961326434353032223b733a33323a223363303535343235333534666331306136666239366631316531326337626663223b733a33323a223836656236646136373631626332643766663066373364386463613637396663223b733a33323a223739613436616265313831663033626135336633333030346331643836363361223b733a33323a226535636261366533356631636264353637303865656664306365336638633638223b733a33323a223030326361336234313934383236393165313264653065623430306631313230223b733a33323a223536313062373630333530336262653766303233336365623766666466376330223b733a33323a223965663364636634653132363333373837346661396233356535663663336632223b733a33323a223733383439646535323636306239323039396131663432303737323936353634223b733a33323a223231373337333539356139656266303638356361373130386439333039626235223b733a33323a226362663931363134386338663539313137613939633939326166343466333134223b733a33323a223139353266646135333463346161303464666331653861313462303065313136223b733a33323a226533306632653130343236316630333366623334663862663738646233633733223b733a33323a223039643839613530363035333661303563386137346634353734343237326165223b733a33323a226663383162653335346432633364343035343861366165393439656236303231223b733a33323a223735316239626166333465346364616465643339393963306461303236343232223b733a33323a223739613432383266313835316236353835666264393033633130623933626336223b733a33323a226166356437343037393432373461643733646266383262323335333730346165223b733a33323a223464373466303435653234643332376138616634376463366665366532663035223b733a33323a223863346364326435633666383661323230663763656436356538613537373234223b733a33323a226566333138303166363339626332656236303438313334356231376466356632223b733a33323a223061613436653133323932653139373836613631336531613736633238343034223b733a33323a226438653333376534636434356461363166626137343537353937343537643964223b733a33323a223535303765343263326661396439663461316637353739313538383138616333223b733a33323a226465346336323539306566393066373632343562313731333663653935376566223b733a33323a223862333439666163383962356336313232303930386363326631306238646631223b733a33323a223464643561336365613833626430626466383535643064303964363237303730223b733a33323a223538383939303334623965633463666561613264616461616332666330303262223b733a33323a223563386439383237393234616137323263363330633961386133646533643966223b733a33323a226666346635353364333766316337313133353235633736313630666633323434223b733a33323a223834386237646138346238633430363664393034393435343038643136653538223b733a33323a223034333438383334623738646531386461623839346637663735353634643636223b733a33323a223661373839366536366639353566613838396237323465663236303064313064223b733a33323a226364303537303762323533653038326331326136373563643837386336316236223b733a33323a223833613863636638646662366262353539666538613233363561386466336430223b733a33323a223164376162636261643161626232626564356630363961383333313961663666223b733a33323a223435386366663763373163393336336461626263383933386339313762343266223b733a33323a223564666662656339333338653133653861633865643234366235316461343262223b733a33323a223136386330393863346565363461613935656430643436353235663961623862223b733a33323a226365626435626538616266333732373964646330313638373533663164636336223b733a33323a223137363831646138323536303834666638353338646234373162303531383066223b733a33323a223965323264616331643932373633653564396439636530373263646564363839223b733a33323a223737656630363465393634373934333231383164633337356138616661616439223b733a33323a223238366338303561353965356661393035666265326463383335616465313634223b733a33323a223031666631323237316562643565346337666232383339363761323763356333223b733a33323a226139333163383331356433316139323965656332626261343136613639316431223b733a33323a223531633836346631373935616532386630306634633037656665633035313832223b733a33323a223433643865656265646564383734386466303837363439333332313638316335223b733a33323a226435353432383732616238326336373561393561626532326439633562313435223b733a33323a226231323464343761643363303832396139383539633337356135616234613435223b733a33323a223037396366383264633736366666346165333463653964336239623939393132223b733a33323a226432633563646331363239643633313166303365343038323830313035373466223b733a33323a223936326561663838343335363038323066636361346631353931386165626636223b733a33323a223738626531663033653932316234613564363637373032636137666138396432223b733a33323a226462346634356536636232396530343732343532343036306434623836346263223b733a33323a223831326565666230653738623135303063393662613638363461613766663535223b733a33323a223466653030666163313562646639343432306539376630313432343735303462223b733a33323a223139306464666239643836653230333966333430613533373136316632313633223b733a33323a223564646564323662306331393436346465333834393862633532666435333963223b733a33323a226133373134623061353139373638663532626634313961356433323531663335223b7d733a343a2268617368223b733a36353a2261333731346230613531393736386635326266343139613564333235316633352d3564646564323662306331393436346465333834393862633532666435333963223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a31343a7b733a33323a223734353435653261303831386130373265386464656566633238626131636261223b733a33323a226161316566303932323233376337373739336238373733303164636262366536223b733a33323a223931666330303933626365613934396233643361373032376466333834336561223b733a33323a223638633934313734326664666139616266373435333665313238643131636335223b733a33323a223162343935373461386264636566323931386637663962393933633638653832223b733a33323a226238333761626635313436613864646132366632663766353039343833663433223b733a33323a223138343965323435353764323063383534323966326337313663333932613864223b733a33323a226333316336303837386337396336353361663862306335303938626438366237223b733a33323a226238353764313262316136353132663536373337636137343662643135316435223b733a33323a223437616533313535373966396633323037313939386433633537623366363332223b733a33323a223438393735333136303533363632623665623434343065303665333066343536223b733a33323a223666613465353961333866323239656534363661343632666436636133303133223b733a33323a223563313231646135343938313135346366306231343265656464313735343037223b733a33323a223431393033336131643731366331613830623465383630333039663864346363223b733a33323a223732383134616565613439336161646232383131623563663563356531643630223b733a33323a223234383365656361353861643866643562393064656662643236653234376665223b733a33323a223432616437333137653538663564623235613962353565353633383838303937223b733a33323a226266373966383230383737313830613837313531373665326230396532623965223b733a33323a223561613966326330386439316130653435356165333562313331313837633831223b733a33323a223138386230353533653438333738623261356238636332666433653733643636223b733a33323a226466353232633062353632333738383830353033303966663033656661623764223b733a33323a223231363833623361633937376636666163663237343435623130623538633735223b733a33323a223737303238643234616333333139613431376533363361326634323366633766223b733a33323a223532373333366562316335316336313365633138646136623735326633616636223b733a33323a226635636538613633313639356330396663393337303939633532643838656365223b733a33323a226639633366636566373232346366356563653434306364646530376235386435223b733a33323a226333306330656132333166323431653765386263616632326434353238346666223b733a33323a223338333961613064666133353264653735383864336338306263346631626663223b7d733a343a2268617368223b733a36353a2233383339616130646661333532646537353838643363383062633466316266632d6333306330656132333166323431653765386263616632326434353238346666223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f56616c696461746f725f437372665f73616c745f7265736f7572636574656d706c617465666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a333a7b733a33323a226566623765353962396239646233353439626434316135633434313030333930223b733a33323a226262333364336164303734643162626135373539353961343035653039323137223b733a33323a223830393331646563646461333563373131326637333337326666643565666432223b733a33323a226236303931643536643033306465373936303562396235383930373139343931223b733a33323a223735356361366361373564316334333138326633316330306366336237356639223b733a33323a226237613266376533616139333534393839336163343336323931386563393963223b7d733a343a2268617368223b733a36353a2262376132663765336161393335343938393361633433363239313865633939632d3735356361366361373564316334333138326633316330306366336237356639223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d, 1763155937),
('vcbkk5t86bik5bljt21kdvvifd', 0x5f5f4c616d696e61737c613a333a7b733a32303a225f524551554553545f4143434553535f54494d45223b643a313736323139393235362e3737333233343b733a363a225f56414c4944223b613a313a7b733a32383a224c616d696e61735c53657373696f6e5c56616c696461746f725c4964223b733a32363a22716f306d686833646d376a717135313366673063316162373064223b7d733a34323a224c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f63737266223b613a313a7b733a363a22455850495245223b693a313736323234323434393b7d7d72656469726563745f75726c7c733a33303a22687474703a2f2f6c6f63616c686f73742f6f6d656b612d732f61646d696e223b4c616d696e61735f56616c696461746f725f437372665f73616c745f6c6f67696e666f726d5f637372667c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a323a7b733a393a22746f6b656e4c697374223b613a323a7b733a33323a223662353338346462656439316565646139303731663761373134663463363535223b733a33323a223038336439626137663661366262343035666564383438393062343133646461223b733a33323a226265366166353839656162396339633666396166663335306235646334663536223b733a33323a223038323839306231343039396535393262336561303338343965316131656638223b7d733a343a2268617368223b733a36353a2230383238393062313430393965353932623365613033383439653161316566382d6265366166353839656162396339633666396166663335306235646334663536223b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4f6d656b614d657373656e6765727c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a303a7b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d4c616d696e61735f417574687c4f3a32363a224c616d696e61735c5374646c69625c41727261794f626a656374223a343a7b733a373a2273746f72616765223b613a313a7b733a373a2273746f72616765223b693a313b7d733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b733a31333a2241727261794974657261746f72223b733a31393a2270726f74656374656450726f70657274696573223b613a343a7b693a303b733a373a2273746f72616765223b693a313b733a343a22666c6167223b693a323b733a31333a226974657261746f72436c617373223b693a333b733a31393a2270726f74656374656450726f70657274696573223b7d7d, 1762199256);

-- --------------------------------------------------------

--
-- Estrutura para tabela `setting`
--

DROP TABLE IF EXISTS `setting`;
CREATE TABLE IF NOT EXISTS `setting` (
  `id` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:json_array)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `setting`
--

INSERT INTO `setting` (`id`, `value`) VALUES
('administrator_email', '\"carolineglins@gmail.com\"'),
('extension_whitelist', '[\"aac\",\"aif\",\"aiff\",\"asf\",\"asx\",\"avi\",\"bmp\",\"c\",\"cc\",\"class\",\"css\",\"divx\",\"doc\",\"docx\",\"exe\",\"gif\",\"gz\",\"gzip\",\"h\",\"ico\",\"j2k\",\"jp2\",\"jpe\",\"jpeg\",\"jpg\",\"m4a\",\"m4v\",\"mdb\",\"mid\",\"midi\",\"mov\",\"mp2\",\"mp3\",\"mp4\",\"mpa\",\"mpe\",\"mpeg\",\"mpg\",\"mpp\",\"odb\",\"odc\",\"odf\",\"odg\",\"odp\",\"ods\",\"odt\",\"ogg\",\"opus\",\"pdf\",\"png\",\"pot\",\"pps\",\"ppt\",\"pptx\",\"qt\",\"ra\",\"ram\",\"rtf\",\"rtx\",\"swf\",\"tar\",\"tif\",\"tiff\",\"txt\",\"wav\",\"wax\",\"webm\",\"webp\",\"wma\",\"wmv\",\"wmx\",\"wri\",\"xla\",\"xls\",\"xlsx\",\"xlt\",\"xlw\",\"zip\"]'),
('installation_title', '\"omeka\"'),
('locale', '\"\"'),
('media_type_whitelist', '[\"application\\/msword\",\"application\\/ogg\",\"application\\/pdf\",\"application\\/rtf\",\"application\\/vnd.ms-access\",\"application\\/vnd.ms-excel\",\"application\\/vnd.ms-powerpoint\",\"application\\/vnd.ms-project\",\"application\\/vnd.ms-write\",\"application\\/vnd.oasis.opendocument.chart\",\"application\\/vnd.oasis.opendocument.database\",\"application\\/vnd.oasis.opendocument.formula\",\"application\\/vnd.oasis.opendocument.graphics\",\"application\\/vnd.oasis.opendocument.presentation\",\"application\\/vnd.oasis.opendocument.spreadsheet\",\"application\\/vnd.oasis.opendocument.text\",\"application\\/vnd.openxmlformats-officedocument.wordprocessingml.document\",\"application\\/vnd.openxmlformats-officedocument.presentationml.presentation\",\"application\\/vnd.openxmlformats-officedocument.spreadsheetml.sheet\",\"application\\/x-gzip\",\"application\\/x-ms-wmp\",\"application\\/x-msdownload\",\"application\\/x-shockwave-flash\",\"application\\/x-tar\",\"application\\/zip\",\"audio\\/midi\",\"audio\\/mp4\",\"audio\\/mpeg\",\"audio\\/ogg\",\"audio\\/x-aac\",\"audio\\/x-aiff\",\"audio\\/x-ms-wma\",\"audio\\/x-ms-wax\",\"audio\\/x-realaudio\",\"audio\\/x-wav\",\"image\\/bmp\",\"image\\/gif\",\"image\\/jp2\",\"image\\/jpeg\",\"image\\/pjpeg\",\"image\\/png\",\"image\\/tiff\",\"image\\/webp\",\"image\\/x-icon\",\"text\\/css\",\"text\\/plain\",\"text\\/richtext\",\"video\\/divx\",\"video\\/mp4\",\"video\\/mpeg\",\"video\\/ogg\",\"video\\/quicktime\",\"video\\/webm\",\"video\\/x-ms-asf,\",\"video\\/x-msvideo\",\"video\\/x-ms-wmv\"]'),
('pagination_per_page', '25'),
('time_zone', '\"Europe\\/Paris\"'),
('use_htmlpurifier', '\"1\"'),
('version', '\"4.1.1\"'),
('version_notifications', '\"1\"');

-- --------------------------------------------------------

--
-- Estrutura para tabela `site`
--

DROP TABLE IF EXISTS `site`;
CREATE TABLE IF NOT EXISTS `site` (
  `id` int NOT NULL AUTO_INCREMENT,
  `thumbnail_id` int DEFAULT NULL,
  `homepage_id` int DEFAULT NULL,
  `owner_id` int DEFAULT NULL,
  `slug` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `theme` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `summary` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `navigation` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:json_array)',
  `item_pool` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:json_array)',
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL,
  `is_public` tinyint(1) NOT NULL,
  `assign_new_items` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_694309E4989D9B62` (`slug`),
  UNIQUE KEY `UNIQ_694309E4571EDDA` (`homepage_id`),
  KEY `IDX_694309E4FDFF2E92` (`thumbnail_id`),
  KEY `IDX_694309E47E3C61F9` (`owner_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `site_block_attachment`
--

DROP TABLE IF EXISTS `site_block_attachment`;
CREATE TABLE IF NOT EXISTS `site_block_attachment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `block_id` int NOT NULL,
  `item_id` int DEFAULT NULL,
  `media_id` int DEFAULT NULL,
  `caption` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `position` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_236473FEE9ED820C` (`block_id`),
  KEY `IDX_236473FE126F525E` (`item_id`),
  KEY `IDX_236473FEEA9FDD75` (`media_id`),
  KEY `block_position` (`block_id`,`position`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `site_item_set`
--

DROP TABLE IF EXISTS `site_item_set`;
CREATE TABLE IF NOT EXISTS `site_item_set` (
  `id` int NOT NULL AUTO_INCREMENT,
  `site_id` int NOT NULL,
  `item_set_id` int NOT NULL,
  `position` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_D4CE134F6BD1646960278D7` (`site_id`,`item_set_id`),
  KEY `IDX_D4CE134F6BD1646` (`site_id`),
  KEY `IDX_D4CE134960278D7` (`item_set_id`),
  KEY `position` (`position`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `site_page`
--

DROP TABLE IF EXISTS `site_page`;
CREATE TABLE IF NOT EXISTS `site_page` (
  `id` int NOT NULL AUTO_INCREMENT,
  `site_id` int NOT NULL,
  `slug` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_public` tinyint(1) NOT NULL,
  `layout` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `layout_data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT '(DC2Type:json)',
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_2F900BD9F6BD1646989D9B62` (`site_id`,`slug`),
  KEY `is_public` (`is_public`),
  KEY `IDX_2F900BD9F6BD1646` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `site_page_block`
--

DROP TABLE IF EXISTS `site_page_block`;
CREATE TABLE IF NOT EXISTS `site_page_block` (
  `id` int NOT NULL AUTO_INCREMENT,
  `page_id` int NOT NULL,
  `layout` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:json_array)',
  `layout_data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci COMMENT '(DC2Type:json)',
  `position` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_C593E731C4663E4` (`page_id`),
  KEY `page_position` (`page_id`,`position`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `site_permission`
--

DROP TABLE IF EXISTS `site_permission`;
CREATE TABLE IF NOT EXISTS `site_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `site_id` int NOT NULL,
  `user_id` int NOT NULL,
  `role` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_C0401D6FF6BD1646A76ED395` (`site_id`,`user_id`),
  KEY `IDX_C0401D6FF6BD1646` (`site_id`),
  KEY `IDX_C0401D6FA76ED395` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `site_setting`
--

DROP TABLE IF EXISTS `site_setting`;
CREATE TABLE IF NOT EXISTS `site_setting` (
  `id` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `site_id` int NOT NULL,
  `value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:json_array)',
  PRIMARY KEY (`id`,`site_id`),
  KEY `IDX_64D05A53F6BD1646` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime DEFAULT NULL,
  `password_hash` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_8D93D649E7927C74` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `user`
--

INSERT INTO `user` (`id`, `email`, `name`, `created`, `modified`, `password_hash`, `role`, `is_active`) VALUES
(1, 'carolineglins@gmail.com', 'admin', '2025-10-06 16:05:20', '2025-10-20 20:09:39', '$2y$10$8tFD5DITSknNOShQhL4CmO.EY7aydZAyn7ZXn3uNk/icc.xLuqvZG', 'global_admin', 1),
(2, 'samuel.szoniecky@univ-paris8.fr', 'Samuel Szoniecky', '2025-10-21 07:16:46', '2025-11-04 09:04:43', '$2y$10$oNg/lRD3DEiRGtOwgo5LK.hm0PQgKnyF4ZzLkWMRhWLdtHpTJttvi', 'global_admin', 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `user_setting`
--

DROP TABLE IF EXISTS `user_setting`;
CREATE TABLE IF NOT EXISTS `user_setting` (
  `id` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int NOT NULL,
  `value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:json_array)',
  PRIMARY KEY (`id`,`user_id`),
  KEY `IDX_C779A692A76ED395` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `user_setting`
--

INSERT INTO `user_setting` (`id`, `user_id`, `value`) VALUES
('browse_defaults_admin_item_sets', 1, '{\"sort_by\":\"created\",\"sort_order\":\"desc\"}'),
('browse_defaults_admin_item_sets', 2, '{\"sort_by\":\"created\",\"sort_order\":\"desc\"}'),
('browse_defaults_admin_items', 1, '{\"sort_by\":\"created\",\"sort_order\":\"desc\"}'),
('browse_defaults_admin_items', 2, '{\"sort_by\":\"created\",\"sort_order\":\"desc\"}'),
('browse_defaults_admin_media', 1, '{\"sort_by\":\"created\",\"sort_order\":\"desc\"}'),
('browse_defaults_admin_media', 2, '{\"sort_by\":\"created\",\"sort_order\":\"desc\"}'),
('browse_defaults_admin_sites', 1, '{\"sort_by\":\"title\",\"sort_order\":\"asc\"}'),
('browse_defaults_admin_sites', 2, '{\"sort_by\":\"title\",\"sort_order\":\"asc\"}'),
('columns_admin_item_sets', 1, '[{\"type\":\"resource_class\",\"default\":null,\"header\":null},{\"type\":\"owner\",\"default\":null,\"header\":null},{\"type\":\"created\",\"default\":null,\"header\":null}]'),
('columns_admin_item_sets', 2, '[{\"type\":\"resource_class\",\"default\":null,\"header\":null},{\"type\":\"owner\",\"default\":null,\"header\":null},{\"type\":\"created\",\"default\":null,\"header\":null}]'),
('columns_admin_items', 1, '[{\"type\":\"resource_class\",\"default\":null,\"header\":null},{\"type\":\"owner\",\"default\":null,\"header\":null},{\"type\":\"created\",\"default\":null,\"header\":null}]'),
('columns_admin_items', 2, '[{\"type\":\"resource_class\",\"default\":null,\"header\":null},{\"type\":\"owner\",\"default\":null,\"header\":null},{\"type\":\"created\",\"default\":null,\"header\":null}]'),
('columns_admin_media', 1, '[{\"type\":\"resource_class\",\"default\":null,\"header\":null},{\"type\":\"owner\",\"default\":null,\"header\":null},{\"type\":\"created\",\"default\":null,\"header\":null}]'),
('columns_admin_media', 2, '[{\"type\":\"resource_class\",\"default\":null,\"header\":null},{\"type\":\"owner\",\"default\":null,\"header\":null},{\"type\":\"created\",\"default\":null,\"header\":null}]'),
('columns_admin_sites', 1, '[{\"type\":\"slug\",\"default\":null,\"header\":null},{\"type\":\"owner\",\"default\":null,\"header\":null},{\"type\":\"created\",\"default\":null,\"header\":null}]'),
('columns_admin_sites', 2, '[{\"type\":\"slug\",\"default\":null,\"header\":null},{\"type\":\"owner\",\"default\":null,\"header\":null},{\"type\":\"created\",\"default\":null,\"header\":null}]'),
('csv_import_automap_check_names_alone', 1, 'true'),
('csv_import_delimiter', 1, '\",\"'),
('csv_import_enclosure', 1, '\"\\\"\"'),
('csv_import_global_language', 1, '\"fr\"'),
('csv_import_identifier_property', 1, '\"\"'),
('csv_import_multivalue_separator', 1, '\",\"'),
('csv_import_rows_by_batch', 1, '20'),
('default_resource_template', 1, '\"\"'),
('default_resource_template', 2, '\"\"'),
('locale', 1, '\"\"'),
('locale', 2, '\"\"');

-- --------------------------------------------------------

--
-- Estrutura para tabela `value`
--

DROP TABLE IF EXISTS `value`;
CREATE TABLE IF NOT EXISTS `value` (
  `id` int NOT NULL AUTO_INCREMENT,
  `resource_id` int NOT NULL,
  `property_id` int NOT NULL,
  `value_resource_id` int DEFAULT NULL,
  `value_annotation_id` int DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `lang` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `uri` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `is_public` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_1D7758349B66727E` (`value_annotation_id`),
  KEY `IDX_1D77583489329D25` (`resource_id`),
  KEY `IDX_1D775834549213EC` (`property_id`),
  KEY `IDX_1D7758344BC72506` (`value_resource_id`),
  KEY `value` (`value`(190)),
  KEY `uri` (`uri`(190)),
  KEY `is_public` (`is_public`)
) ENGINE=InnoDB AUTO_INCREMENT=113 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `value`
--

INSERT INTO `value` (`id`, `resource_id`, `property_id`, `value_resource_id`, `value_annotation_id`, `type`, `lang`, `value`, `uri`, `is_public`) VALUES
(3, 2, 187, NULL, NULL, 'literal', 'fr', '75', NULL, 1),
(4, 2, 188, NULL, NULL, 'literal', 'fr', 'Paris', NULL, 1),
(5, 3, 187, NULL, NULL, 'literal', 'fr', '77', NULL, 1),
(6, 3, 188, NULL, NULL, 'literal', 'fr', 'Seine-et-Marne', NULL, 1),
(7, 4, 187, NULL, NULL, 'literal', 'fr', '78', NULL, 1),
(8, 4, 188, NULL, NULL, 'literal', 'fr', 'Yvelines', NULL, 1),
(9, 5, 187, NULL, NULL, 'literal', 'fr', '91', NULL, 1),
(10, 5, 188, NULL, NULL, 'literal', 'fr', 'Essonne', NULL, 1),
(11, 6, 187, NULL, NULL, 'literal', 'fr', '92', NULL, 1),
(12, 6, 188, NULL, NULL, 'literal', 'fr', 'Hauts-de-Seine', NULL, 1),
(13, 7, 187, NULL, NULL, 'literal', 'fr', '93', NULL, 1),
(14, 7, 188, NULL, NULL, 'literal', 'fr', 'Seine-Saint-Denis', NULL, 1),
(15, 8, 187, NULL, NULL, 'literal', 'fr', '94', NULL, 1),
(16, 8, 188, NULL, NULL, 'literal', 'fr', 'Val-de-Marne', NULL, 1),
(17, 9, 187, NULL, NULL, 'literal', 'fr', '95', NULL, 1),
(18, 9, 188, NULL, NULL, 'literal', 'fr', 'Val-d\'Oise', NULL, 1),
(19, 10, 189, NULL, NULL, 'literal', 'fr', 'Université Panthéon-Sorbonne - Paris 1', NULL, 1),
(20, 10, 190, NULL, NULL, 'literal', 'fr', '75', NULL, 1),
(21, 11, 189, NULL, NULL, 'literal', 'fr', 'Université Panthéon Assas - Paris 2', NULL, 1),
(22, 11, 190, NULL, NULL, 'literal', 'fr', '75', NULL, 1),
(23, 12, 189, NULL, NULL, 'literal', 'fr', 'Université Sorbonne Nouvelle - Paris 3', NULL, 1),
(24, 12, 190, NULL, NULL, 'literal', 'fr', '75', NULL, 1),
(25, 13, 189, NULL, NULL, 'literal', 'fr', 'Sorbonne Université', NULL, 1),
(26, 13, 190, NULL, NULL, 'literal', 'fr', '75', NULL, 1),
(27, 14, 189, NULL, NULL, 'literal', 'fr', 'Université Paris Cité', NULL, 1),
(28, 14, 190, NULL, NULL, 'literal', 'fr', '75', NULL, 1),
(29, 15, 189, NULL, NULL, 'literal', 'fr', 'Université PSL (Paris Sciences et Lettres)', NULL, 1),
(30, 15, 190, NULL, NULL, 'literal', 'fr', '75', NULL, 1),
(31, 16, 189, NULL, NULL, 'literal', 'fr', 'Université Paris 8', NULL, 1),
(32, 16, 190, NULL, NULL, 'literal', 'fr', '93', NULL, 1),
(33, 17, 189, NULL, NULL, 'literal', 'fr', 'Université Paris Dauphine', NULL, 1),
(34, 17, 190, NULL, NULL, 'literal', 'fr', '75', NULL, 1),
(35, 18, 189, NULL, NULL, 'literal', 'fr', 'Université Paris Nanterre', NULL, 1),
(36, 18, 190, NULL, NULL, 'literal', 'fr', '92', NULL, 1),
(37, 19, 189, NULL, NULL, 'literal', 'fr', 'Université Paris-Saclay', NULL, 1),
(38, 19, 190, NULL, NULL, 'literal', 'fr', '91', NULL, 1),
(39, 20, 189, NULL, NULL, 'literal', 'fr', 'Université Paris-Est Créteil Val de Marne', NULL, 1),
(40, 20, 190, NULL, NULL, 'literal', 'fr', '94', NULL, 1),
(41, 21, 189, NULL, NULL, 'literal', 'fr', 'Université Sorbonne Paris Nord', NULL, 1),
(42, 21, 190, NULL, NULL, 'literal', 'fr', '93', NULL, 1),
(43, 22, 189, NULL, NULL, 'literal', 'fr', 'Université Gustave Eiffel', NULL, 1),
(44, 22, 190, NULL, NULL, 'literal', 'fr', '77', NULL, 1),
(45, 23, 189, NULL, NULL, 'literal', 'fr', 'Université de Versailles Saint-Quentin-en-Yvelines', NULL, 1),
(46, 23, 190, NULL, NULL, 'literal', 'fr', '78', NULL, 1),
(47, 24, 189, NULL, NULL, 'literal', 'fr', 'Université d’Evry-Val-d’Essonne', NULL, 1),
(48, 24, 190, NULL, NULL, 'literal', 'fr', '91', NULL, 1),
(49, 25, 189, NULL, NULL, 'literal', 'fr', 'CY Cergy Paris Université', NULL, 1),
(50, 25, 190, NULL, NULL, 'literal', 'fr', '95', NULL, 1),
(51, 26, 191, NULL, NULL, 'literal', 'fr', 'Informatique', NULL, 1),
(52, 26, 192, NULL, NULL, 'literal', 'fr', 'M1', NULL, 1),
(53, 26, 193, NULL, NULL, 'literal', 'fr', 'Sciences, Technologies, Santé', NULL, 1),
(54, 27, 191, NULL, NULL, 'literal', 'fr', 'Mathématiques et applications', NULL, 1),
(55, 27, 192, NULL, NULL, 'literal', 'fr', 'M1', NULL, 1),
(56, 27, 193, NULL, NULL, 'literal', 'fr', 'Sciences, Technologies, Santé', NULL, 1),
(57, 28, 191, NULL, NULL, 'literal', 'fr', 'Mathématiques et Informatique Appliquées aux Sciences Humaines et Sociales', NULL, 1),
(58, 28, 192, NULL, NULL, 'literal', 'fr', 'M1', NULL, 1),
(59, 28, 193, NULL, NULL, 'literal', 'fr', 'Sciences, Technologies, Santé', NULL, 1),
(62, 30, 195, 16, NULL, 'resource', NULL, NULL, NULL, 1),
(63, 30, 194, 26, NULL, 'resource:item', NULL, NULL, NULL, 1),
(64, 30, 194, 27, NULL, 'resource:item', NULL, NULL, NULL, 1),
(65, 30, 194, 28, NULL, 'resource:item', NULL, NULL, NULL, 1),
(66, 40, 196, NULL, NULL, 'literal', NULL, 'Étudiant 1', NULL, 1),
(67, 40, 197, 26, NULL, 'resource', NULL, NULL, NULL, 1),
(68, 40, 198, NULL, NULL, 'literal', NULL, '2025', NULL, 1),
(69, 40, 199, NULL, NULL, 'literal', NULL, '20', NULL, 1),
(70, 40, 200, NULL, NULL, 'literal', NULL, 'c\'est bon', NULL, 1),
(71, 40, 201, NULL, NULL, 'literal', NULL, '2025-11-15T20:49:44.461Z', NULL, 1),
(72, 40, 1, NULL, NULL, 'literal', NULL, 'Évaluation Master - 2025-11-15', NULL, 1),
(73, 41, 196, NULL, NULL, 'literal', NULL, 'Étudiant 1', NULL, 1),
(74, 41, 197, 26, NULL, 'resource', NULL, NULL, NULL, 1),
(75, 41, 198, NULL, NULL, 'literal', NULL, '2025', NULL, 1),
(76, 41, 199, NULL, NULL, 'literal', NULL, '20', NULL, 1),
(77, 41, 200, NULL, NULL, 'literal', NULL, 'a', NULL, 1),
(78, 41, 201, NULL, NULL, 'literal', NULL, '2025-11-15T21:06:47.738Z', NULL, 1),
(79, 41, 1, NULL, NULL, 'literal', NULL, 'Évaluation Master - 15/11/2025', NULL, 1),
(80, 42, 196, NULL, NULL, 'literal', NULL, 'Étudiant 1', NULL, 1),
(81, 42, 197, 26, NULL, 'resource', NULL, NULL, NULL, 1),
(82, 42, 198, NULL, NULL, 'literal', NULL, '2024', NULL, 1),
(83, 42, 199, NULL, NULL, 'literal', NULL, '20', NULL, 1),
(84, 42, 200, NULL, NULL, 'literal', NULL, 'Commentaire audio joint', NULL, 1),
(85, 42, 201, NULL, NULL, 'literal', NULL, '2025-11-15T21:13:08.701Z', NULL, 1),
(86, 42, 1, NULL, NULL, 'literal', NULL, 'Évaluation Master - 15/11/2025', NULL, 1),
(89, 45, 196, NULL, NULL, 'literal', NULL, 'Étudiant 1', NULL, 1),
(90, 45, 197, 26, NULL, 'resource', NULL, NULL, NULL, 1),
(91, 45, 198, NULL, NULL, 'literal', NULL, '2025', NULL, 1),
(92, 45, 199, NULL, NULL, 'literal', NULL, '20', NULL, 1),
(93, 45, 200, NULL, NULL, 'literal', NULL, '🎤 Commentaire audio - voir le fichier joint', NULL, 1),
(94, 45, 201, NULL, NULL, 'literal', NULL, '2025-11-15T21:19:47.561Z', NULL, 1),
(95, 45, 1, NULL, NULL, 'literal', NULL, 'Évaluation Master - 15/11/2025', NULL, 1),
(97, 47, 196, NULL, NULL, 'literal', NULL, 'Étudiant 1', NULL, 1),
(98, 47, 197, 26, NULL, 'resource', NULL, NULL, NULL, 1),
(99, 47, 198, NULL, NULL, 'literal', NULL, '2025', NULL, 1),
(100, 47, 199, NULL, NULL, 'literal', NULL, '20', NULL, 1),
(101, 47, 200, NULL, NULL, 'literal', NULL, '🎤 Commentaire audio - voir le fichier joint', NULL, 1),
(102, 47, 201, NULL, NULL, 'literal', NULL, '2025-11-15T21:25:17.346Z', NULL, 1),
(103, 47, 1, NULL, NULL, 'literal', NULL, 'Évaluation Master - 15/11/2025', NULL, 1),
(105, 49, 1, NULL, NULL, 'literal', NULL, 'Commentaire audio - 15/11/2025 22:38:04', NULL, 1),
(106, 51, 196, NULL, NULL, 'literal', NULL, 'Étudiant 1', NULL, 1),
(107, 51, 197, 26, NULL, 'resource', NULL, NULL, NULL, 1),
(108, 51, 198, NULL, NULL, 'literal', NULL, '2025', NULL, 1),
(109, 51, 199, NULL, NULL, 'literal', NULL, '20', NULL, 1),
(110, 51, 200, 50, NULL, 'resource', NULL, NULL, NULL, 1),
(111, 51, 201, NULL, NULL, 'literal', NULL, '2025-11-15T21:38:05.495Z', NULL, 1),
(112, 51, 1, NULL, NULL, 'literal', NULL, 'Évaluation Master - 15/11/2025', NULL, 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `value_annotation`
--

DROP TABLE IF EXISTS `value_annotation`;
CREATE TABLE IF NOT EXISTS `value_annotation` (
  `id` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `vocabulary`
--

DROP TABLE IF EXISTS `vocabulary`;
CREATE TABLE IF NOT EXISTS `vocabulary` (
  `id` int NOT NULL AUTO_INCREMENT,
  `owner_id` int DEFAULT NULL,
  `namespace_uri` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `prefix` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_9099C97B9B267FDF` (`namespace_uri`),
  UNIQUE KEY `UNIQ_9099C97B93B1868E` (`prefix`),
  KEY `IDX_9099C97B7E3C61F9` (`owner_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `vocabulary`
--

INSERT INTO `vocabulary` (`id`, `owner_id`, `namespace_uri`, `prefix`, `label`, `comment`) VALUES
(1, NULL, 'http://purl.org/dc/terms/', 'dcterms', 'Dublin Core', 'Basic resource metadata (DCMI Metadata Terms)'),
(2, NULL, 'http://purl.org/dc/dcmitype/', 'dctype', 'Dublin Core Type', 'Basic resource types (DCMI Type Vocabulary)'),
(3, NULL, 'http://purl.org/ontology/bibo/', 'bibo', 'Bibliographic Ontology', 'Bibliographic metadata (BIBO)'),
(4, NULL, 'http://xmlns.com/foaf/0.1/', 'foaf', 'Friend of a Friend', 'Relationships between people and organizations (FOAF)'),
(5, 1, 'http://example.org/masterrank#', 'ex', 'MasterRank Vocabulary', '');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `fulltext_search`
--
ALTER TABLE `fulltext_search` ADD FULLTEXT KEY `IDX_AA31FE4A2B36786B3B8BA7C7` (`title`,`text`);

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `api_key`
--
ALTER TABLE `api_key`
  ADD CONSTRAINT `FK_C912ED9D7E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`);

--
-- Restrições para tabelas `asset`
--
ALTER TABLE `asset`
  ADD CONSTRAINT `FK_2AF5A5C7E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`) ON DELETE SET NULL;

--
-- Restrições para tabelas `csvimport_entity`
--
ALTER TABLE `csvimport_entity`
  ADD CONSTRAINT `FK_84D382F4BE04EA9` FOREIGN KEY (`job_id`) REFERENCES `job` (`id`);

--
-- Restrições para tabelas `csvimport_import`
--
ALTER TABLE `csvimport_import`
  ADD CONSTRAINT `FK_17B508814C276F75` FOREIGN KEY (`undo_job_id`) REFERENCES `job` (`id`),
  ADD CONSTRAINT `FK_17B50881BE04EA9` FOREIGN KEY (`job_id`) REFERENCES `job` (`id`);

--
-- Restrições para tabelas `fulltext_search`
--
ALTER TABLE `fulltext_search`
  ADD CONSTRAINT `FK_AA31FE4A7E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`) ON DELETE SET NULL;

--
-- Restrições para tabelas `item`
--
ALTER TABLE `item`
  ADD CONSTRAINT `FK_1F1B251EBF396750` FOREIGN KEY (`id`) REFERENCES `resource` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_1F1B251ECBE0B084` FOREIGN KEY (`primary_media_id`) REFERENCES `media` (`id`) ON DELETE SET NULL;

--
-- Restrições para tabelas `item_item_set`
--
ALTER TABLE `item_item_set`
  ADD CONSTRAINT `FK_6D0C9625126F525E` FOREIGN KEY (`item_id`) REFERENCES `item` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_6D0C9625960278D7` FOREIGN KEY (`item_set_id`) REFERENCES `item_set` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `item_set`
--
ALTER TABLE `item_set`
  ADD CONSTRAINT `FK_1015EEEBF396750` FOREIGN KEY (`id`) REFERENCES `resource` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `item_site`
--
ALTER TABLE `item_site`
  ADD CONSTRAINT `FK_A1734D1F126F525E` FOREIGN KEY (`item_id`) REFERENCES `item` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_A1734D1FF6BD1646` FOREIGN KEY (`site_id`) REFERENCES `site` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `job`
--
ALTER TABLE `job`
  ADD CONSTRAINT `FK_FBD8E0F87E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`) ON DELETE SET NULL;

--
-- Restrições para tabelas `media`
--
ALTER TABLE `media`
  ADD CONSTRAINT `FK_6A2CA10C126F525E` FOREIGN KEY (`item_id`) REFERENCES `item` (`id`),
  ADD CONSTRAINT `FK_6A2CA10CBF396750` FOREIGN KEY (`id`) REFERENCES `resource` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `password_creation`
--
ALTER TABLE `password_creation`
  ADD CONSTRAINT `FK_C77917B4A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `property`
--
ALTER TABLE `property`
  ADD CONSTRAINT `FK_8BF21CDE7E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_8BF21CDEAD0E05F6` FOREIGN KEY (`vocabulary_id`) REFERENCES `vocabulary` (`id`);

--
-- Restrições para tabelas `resource`
--
ALTER TABLE `resource`
  ADD CONSTRAINT `FK_BC91F41616131EA` FOREIGN KEY (`resource_template_id`) REFERENCES `resource_template` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_BC91F416448CC1BD` FOREIGN KEY (`resource_class_id`) REFERENCES `resource_class` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_BC91F4167E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_BC91F416FDFF2E92` FOREIGN KEY (`thumbnail_id`) REFERENCES `asset` (`id`) ON DELETE SET NULL;

--
-- Restrições para tabelas `resource_class`
--
ALTER TABLE `resource_class`
  ADD CONSTRAINT `FK_C6F063AD7E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_C6F063ADAD0E05F6` FOREIGN KEY (`vocabulary_id`) REFERENCES `vocabulary` (`id`);

--
-- Restrições para tabelas `resource_template`
--
ALTER TABLE `resource_template`
  ADD CONSTRAINT `FK_39ECD52E448CC1BD` FOREIGN KEY (`resource_class_id`) REFERENCES `resource_class` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_39ECD52E724734A3` FOREIGN KEY (`title_property_id`) REFERENCES `property` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_39ECD52E7E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_39ECD52EB84E0D1D` FOREIGN KEY (`description_property_id`) REFERENCES `property` (`id`) ON DELETE SET NULL;

--
-- Restrições para tabelas `resource_template_property`
--
ALTER TABLE `resource_template_property`
  ADD CONSTRAINT `FK_4689E2F116131EA` FOREIGN KEY (`resource_template_id`) REFERENCES `resource_template` (`id`),
  ADD CONSTRAINT `FK_4689E2F1549213EC` FOREIGN KEY (`property_id`) REFERENCES `property` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `site`
--
ALTER TABLE `site`
  ADD CONSTRAINT `FK_694309E4571EDDA` FOREIGN KEY (`homepage_id`) REFERENCES `site_page` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_694309E47E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_694309E4FDFF2E92` FOREIGN KEY (`thumbnail_id`) REFERENCES `asset` (`id`) ON DELETE SET NULL;

--
-- Restrições para tabelas `site_block_attachment`
--
ALTER TABLE `site_block_attachment`
  ADD CONSTRAINT `FK_236473FE126F525E` FOREIGN KEY (`item_id`) REFERENCES `item` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `FK_236473FEE9ED820C` FOREIGN KEY (`block_id`) REFERENCES `site_page_block` (`id`),
  ADD CONSTRAINT `FK_236473FEEA9FDD75` FOREIGN KEY (`media_id`) REFERENCES `media` (`id`) ON DELETE SET NULL;

--
-- Restrições para tabelas `site_item_set`
--
ALTER TABLE `site_item_set`
  ADD CONSTRAINT `FK_D4CE134960278D7` FOREIGN KEY (`item_set_id`) REFERENCES `item_set` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_D4CE134F6BD1646` FOREIGN KEY (`site_id`) REFERENCES `site` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `site_page`
--
ALTER TABLE `site_page`
  ADD CONSTRAINT `FK_2F900BD9F6BD1646` FOREIGN KEY (`site_id`) REFERENCES `site` (`id`);

--
-- Restrições para tabelas `site_page_block`
--
ALTER TABLE `site_page_block`
  ADD CONSTRAINT `FK_C593E731C4663E4` FOREIGN KEY (`page_id`) REFERENCES `site_page` (`id`);

--
-- Restrições para tabelas `site_permission`
--
ALTER TABLE `site_permission`
  ADD CONSTRAINT `FK_C0401D6FA76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_C0401D6FF6BD1646` FOREIGN KEY (`site_id`) REFERENCES `site` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `site_setting`
--
ALTER TABLE `site_setting`
  ADD CONSTRAINT `FK_64D05A53F6BD1646` FOREIGN KEY (`site_id`) REFERENCES `site` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `user_setting`
--
ALTER TABLE `user_setting`
  ADD CONSTRAINT `FK_C779A692A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `value`
--
ALTER TABLE `value`
  ADD CONSTRAINT `FK_1D7758344BC72506` FOREIGN KEY (`value_resource_id`) REFERENCES `resource` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_1D775834549213EC` FOREIGN KEY (`property_id`) REFERENCES `property` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_1D77583489329D25` FOREIGN KEY (`resource_id`) REFERENCES `resource` (`id`),
  ADD CONSTRAINT `FK_1D7758349B66727E` FOREIGN KEY (`value_annotation_id`) REFERENCES `value_annotation` (`id`) ON DELETE SET NULL;

--
-- Restrições para tabelas `value_annotation`
--
ALTER TABLE `value_annotation`
  ADD CONSTRAINT `FK_C03BA4EBF396750` FOREIGN KEY (`id`) REFERENCES `resource` (`id`) ON DELETE CASCADE;

--
-- Restrições para tabelas `vocabulary`
--
ALTER TABLE `vocabulary`
  ADD CONSTRAINT `FK_9099C97B7E3C61F9` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
