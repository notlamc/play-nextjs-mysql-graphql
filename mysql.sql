-- --------------------------------------------------------
-- Host:                         localhost
-- Server version:               8.0.28 - MySQL Community Server - GPL
-- Server OS:                    Linux
-- HeidiSQL Version:             12.0.0.6468
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for graphql_test
CREATE DATABASE IF NOT EXISTS `graphql_test` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `graphql_test`;

-- Dumping structure for table graphql_test.authors
DROP TABLE IF EXISTS `authors`;
CREATE TABLE IF NOT EXISTS `authors` (
  `id` char(36) NOT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table graphql_test.authors: ~1 rows (approximately)
REPLACE INTO `authors` (`id`, `name`) VALUES
	('6594e3e0-d425-11ec-a55c-fa163e46fba1', 'Bob Smith'),
	('6594e3e0-d425-11ec-a55c-fa163e46fbae', 'Craig Malton');

-- Dumping structure for table graphql_test.books
DROP TABLE IF EXISTS `books`;
CREATE TABLE IF NOT EXISTS `books` (
  `id` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `authorId` char(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `name` varchar(50) NOT NULL,
  `year` char(4) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Book to Author` (`authorId`),
  CONSTRAINT `Book to Author` FOREIGN KEY (`authorId`) REFERENCES `authors` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table graphql_test.books: ~2 rows (approximately)
REPLACE INTO `books` (`id`, `authorId`, `name`, `year`) VALUES
	('6594e3e0-d425-11ec-a55c-fa163e46fba2', '6594e3e0-d425-11ec-a55c-fa163e46fba1', 'Take Care of Chickens', '2020'),
	('6baa465c-d425-11ec-a55c-fa163e46fba1', '6594e3e0-d425-11ec-a55c-fa163e46fbae', 'It\'s No Lie', '2021'),
	('6baa465c-d425-11ec-a55c-fa163e46fbae', '6594e3e0-d425-11ec-a55c-fa163e46fbae', 'The Art of Procrastination', '2022');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
