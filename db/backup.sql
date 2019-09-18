-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.1.32-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win32
-- HeidiSQL Version:             10.1.0.5464
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumping database structure for dacingwithdeath
CREATE DATABASE IF NOT EXISTS `dacingwithdeath` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `dacingwithdeath`;

-- Dumping structure for table dacingwithdeath.available_hours
CREATE TABLE IF NOT EXISTS `available_hours` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `hour` time NOT NULL,
  `is_available` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table dacingwithdeath.available_hours: ~10 rows (approximately)
/*!40000 ALTER TABLE `available_hours` DISABLE KEYS */;
INSERT INTO `available_hours` (`id`, `hour`, `is_available`, `created_at`, `updated_at`) VALUES
	(1, '09:00:00', 1, NULL, NULL),
	(2, '10:00:00', 1, NULL, NULL),
	(3, '11:00:00', 1, NULL, NULL),
	(4, '12:00:00', 1, NULL, NULL),
	(5, '13:00:00', 1, NULL, NULL),
	(6, '14:00:00', 1, NULL, NULL),
	(7, '15:00:00', 1, NULL, NULL),
	(8, '16:00:00', 1, NULL, NULL),
	(9, '17:00:00', 1, NULL, NULL),
	(10, '18:00:00', 1, NULL, NULL);
/*!40000 ALTER TABLE `available_hours` ENABLE KEYS */;

-- Dumping structure for table dacingwithdeath.booking
CREATE TABLE IF NOT EXISTS `booking` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `available_hours_id` bigint(20) unsigned NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `booking_available_hours_id_foreign` (`available_hours_id`),
  KEY `booking_user_id_foreign` (`user_id`),
  CONSTRAINT `booking_available_hours_id_foreign` FOREIGN KEY (`available_hours_id`) REFERENCES `available_hours` (`id`),
  CONSTRAINT `booking_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table dacingwithdeath.booking: ~2 rows (approximately)
/*!40000 ALTER TABLE `booking` DISABLE KEYS */;
INSERT INTO `booking` (`id`, `date`, `available_hours_id`, `user_id`, `created_at`, `updated_at`) VALUES
	(8, '2019-09-19', 6, 1, '2019-09-18 14:13:01', '2019-09-18 14:13:01'),
	(9, '2019-09-19', 5, 1, '2019-09-18 14:13:27', '2019-09-18 14:13:27'),
	(10, '2019-09-19', 4, 1, '2019-09-18 14:14:00', '2019-09-18 14:14:00'),
	(12, '2019-09-23', 6, 1, '2019-09-18 14:33:46', '2019-09-18 14:33:46'),
	(13, '2019-09-23', 5, 1, '2019-09-18 14:34:06', '2019-09-18 14:34:06');
/*!40000 ALTER TABLE `booking` ENABLE KEYS */;

-- Dumping structure for table dacingwithdeath.failed_jobs
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table dacingwithdeath.failed_jobs: ~0 rows (approximately)
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;

-- Dumping structure for table dacingwithdeath.migrations
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table dacingwithdeath.migrations: ~10 rows (approximately)
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(1, '2014_10_12_000000_create_users_table', 1),
	(2, '2014_10_12_100000_create_password_resets_table', 1),
	(3, '2016_06_01_000001_create_oauth_auth_codes_table', 1),
	(4, '2016_06_01_000002_create_oauth_access_tokens_table', 1),
	(5, '2016_06_01_000003_create_oauth_refresh_tokens_table', 1),
	(6, '2016_06_01_000004_create_oauth_clients_table', 1),
	(7, '2016_06_01_000005_create_oauth_personal_access_clients_table', 1),
	(8, '2019_08_19_000000_create_failed_jobs_table', 1),
	(9, '2019_09_17_193943_create_available_hours', 1),
	(10, '2019_09_17_194451_create_booking', 1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;

-- Dumping structure for table dacingwithdeath.oauth_access_tokens
CREATE TABLE IF NOT EXISTS `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `client_id` int(10) unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_access_tokens_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table dacingwithdeath.oauth_access_tokens: ~1 rows (approximately)
/*!40000 ALTER TABLE `oauth_access_tokens` DISABLE KEYS */;
INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
	('6406f728121c8b1b4aeaffad5e408b39112360abc1e3cf86ab419079d69a7b82666f58235aed1b10', 1, 2, NULL, '[]', 0, '2019-09-18 14:31:56', '2019-09-18 14:31:56', '2019-10-03 14:31:55'),
	('b95acbb7585073e6335d5832bbf46ca02a24b39efed6e3a63710a93a02de0ddc67ee925e15724466', 1, 2, NULL, '[]', 0, '2019-09-18 12:26:14', '2019-09-18 12:26:14', '2019-10-03 12:26:14'),
	('dd0589e2f15f5f02bf0fcb91fa3eb5d42615f847533ddea78872a485f9709d2ff83ff427788c75ac', 1, 2, NULL, '[]', 0, '2019-09-18 14:33:14', '2019-09-18 14:33:14', '2019-10-03 14:33:14'),
	('f36c22444a8cb904fa5bed23f05e1defc8edc4bf40614d3a38f69373d4b6520f6e18a49790754bae', 1, 2, NULL, '[]', 0, '2019-09-18 14:30:20', '2019-09-18 14:30:20', '2019-10-03 14:30:20'),
	('f81ac2ef9f0c0247f5b0eefbe2854c57487c25b9c58cbb7a06b2c4a586e3ebb9924ddfb615f3543b', 1, 2, NULL, '[]', 0, '2019-09-17 20:02:07', '2019-09-17 20:02:07', '2019-10-02 20:02:07');
/*!40000 ALTER TABLE `oauth_access_tokens` ENABLE KEYS */;

-- Dumping structure for table dacingwithdeath.oauth_auth_codes
CREATE TABLE IF NOT EXISTS `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `client_id` int(10) unsigned NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table dacingwithdeath.oauth_auth_codes: ~0 rows (approximately)
/*!40000 ALTER TABLE `oauth_auth_codes` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth_auth_codes` ENABLE KEYS */;

-- Dumping structure for table dacingwithdeath.oauth_clients
CREATE TABLE IF NOT EXISTS `oauth_clients` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_clients_user_id_index` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table dacingwithdeath.oauth_clients: ~2 rows (approximately)
/*!40000 ALTER TABLE `oauth_clients` DISABLE KEYS */;
INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
	(1, NULL, 'Laravel Personal Access Client', 'Xf30pM7R5MQWOqOzDA0g7jFfg4EHDzE8pfUEfZx0', 'http://localhost', 1, 0, 0, '2019-09-17 19:59:51', '2019-09-17 19:59:51'),
	(2, NULL, 'Laravel Password Grant Client', 'XiesXBwXY2xu9GAhI3b4gJl6lLhVGEV0UTttSpHf', 'http://localhost', 0, 1, 0, '2019-09-17 19:59:51', '2019-09-17 19:59:51');
/*!40000 ALTER TABLE `oauth_clients` ENABLE KEYS */;

-- Dumping structure for table dacingwithdeath.oauth_personal_access_clients
CREATE TABLE IF NOT EXISTS `oauth_personal_access_clients` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `client_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_personal_access_clients_client_id_index` (`client_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table dacingwithdeath.oauth_personal_access_clients: ~1 rows (approximately)
/*!40000 ALTER TABLE `oauth_personal_access_clients` DISABLE KEYS */;
INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
	(1, 1, '2019-09-17 19:59:51', '2019-09-17 19:59:51');
/*!40000 ALTER TABLE `oauth_personal_access_clients` ENABLE KEYS */;

-- Dumping structure for table dacingwithdeath.oauth_refresh_tokens
CREATE TABLE IF NOT EXISTS `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table dacingwithdeath.oauth_refresh_tokens: ~1 rows (approximately)
/*!40000 ALTER TABLE `oauth_refresh_tokens` DISABLE KEYS */;
INSERT INTO `oauth_refresh_tokens` (`id`, `access_token_id`, `revoked`, `expires_at`) VALUES
	('174c7ad455140333c8ca2a86eeec85a6fd248d8d144d7ef2a8d9623d59ec23db6081706a664fb257', 'f36c22444a8cb904fa5bed23f05e1defc8edc4bf40614d3a38f69373d4b6520f6e18a49790754bae', 0, '2019-10-18 14:30:20'),
	('1bcf9be96d3c4d5415170842dbf0748e369ad5f77662a585995999d5c5fbb8e6e519e6db53151a29', 'f81ac2ef9f0c0247f5b0eefbe2854c57487c25b9c58cbb7a06b2c4a586e3ebb9924ddfb615f3543b', 0, '2019-10-17 20:02:07'),
	('78180dad1d52ca449268c178b24ef0f5fe97486919177e96843b68f411889a381fd92578de54824f', 'dd0589e2f15f5f02bf0fcb91fa3eb5d42615f847533ddea78872a485f9709d2ff83ff427788c75ac', 0, '2019-10-18 14:33:14'),
	('da0cc7983262e0ce38a570bb0ce2161bb2169b33ad9aa9784cf8428762bbe0fc48af9b0e1a53a1bd', '6406f728121c8b1b4aeaffad5e408b39112360abc1e3cf86ab419079d69a7b82666f58235aed1b10', 0, '2019-10-18 14:31:55'),
	('ef1d7df4f27958a237cdc18a03cb6193d62afafd203ffa2c58be911e698ba3c53fd2bcd8a1238b3f', 'b95acbb7585073e6335d5832bbf46ca02a24b39efed6e3a63710a93a02de0ddc67ee925e15724466', 0, '2019-10-18 12:26:14');
/*!40000 ALTER TABLE `oauth_refresh_tokens` ENABLE KEYS */;

-- Dumping structure for table dacingwithdeath.password_resets
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table dacingwithdeath.password_resets: ~0 rows (approximately)
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;

-- Dumping structure for table dacingwithdeath.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Dumping data for table dacingwithdeath.users: ~4 rows (approximately)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `name`, `last_name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
	(1, 'John', 'John', 'johndue@gmail.com', NULL, '$2y$10$uohT8NsfOPjD3QK2SzdcTudoz0SCD.sHDoJosuosGEmkhlltwTWoi', NULL, '2019-09-17 19:59:52', '2019-09-17 19:59:52'),
	(2, 'User 1', 'User 1', 'user1@gmail.com', NULL, '$2y$10$EZrO7fivGFTCYYMUEvCum.13Q/RWmdVPWSecPQIuc7WhZmznitjdG', NULL, '2019-09-17 19:59:52', '2019-09-17 19:59:52'),
	(3, 'User 2', 'User 2', 'user2@gmail.com', NULL, '$2y$10$crbr9x9p2jNVriEr8lYrL.zPEHEVMokFYF.enaLJtirgMQa3IWbk6', NULL, '2019-09-17 19:59:52', '2019-09-17 19:59:52'),
	(4, 'User 3', 'User 3', 'user3@gmail.com', NULL, '$2y$10$cL0CbpOzgWOgySNS0pvZ4.95W1npOrbfEn7Klm3uLTxicoDUyi0v2', NULL, '2019-09-17 19:59:52', '2019-09-17 19:59:52');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
