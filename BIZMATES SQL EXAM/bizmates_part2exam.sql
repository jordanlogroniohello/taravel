-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.4.17-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             11.2.0.6213
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for bizmates_part2exam
DROP DATABASE IF EXISTS `bizmates_part2exam`;
CREATE DATABASE IF NOT EXISTS `bizmates_part2exam` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `bizmates_part2exam`;

-- Dumping structure for table bizmates_part2exam.trn_evaluation
DROP TABLE IF EXISTS `trn_evaluation`;
CREATE TABLE IF NOT EXISTS `trn_evaluation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `teacher_id` int(11) NOT NULL,
  `result` int(11) NOT NULL COMMENT '(note: result 1=taught, 2=noshow)',
  `lesson_datetime` datetime NOT NULL,
  `create_at` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table bizmates_part2exam.trn_evaluation: ~15 rows (approximately)
/*!40000 ALTER TABLE `trn_evaluation` DISABLE KEYS */;
INSERT INTO `trn_evaluation` (`id`, `teacher_id`, `result`, `lesson_datetime`, `create_at`) VALUES
	(1, 110250, 1, '0000-00-00 00:00:00', '2020-01-17 09:00:34'),
	(2, 110250, 1, '0000-00-00 00:00:00', '2020-01-17 09:00:34'),
	(3, 110250, 1, '0000-00-00 00:00:00', '2020-01-17 09:00:34'),
	(4, 110011, 1, '0000-00-00 00:00:00', '2020-01-17 09:00:34'),
	(5, 110011, 2, '0000-00-00 00:00:00', '2020-01-17 09:00:34'),
	(6, 110011, 1, '0000-00-00 00:00:00', '2020-01-17 09:00:34'),
	(7, 110030, 1, '0000-00-00 00:00:00', '2020-01-17 09:00:34'),
	(8, 110030, 1, '0000-00-00 00:00:00', '2020-01-17 09:00:34'),
	(9, 110030, 1, '0000-00-00 00:00:00', '2020-01-17 09:00:34'),
	(10, 110023, 1, '0000-00-00 00:00:00', '2020-01-17 09:00:34'),
	(11, 110023, 1, '0000-00-00 00:00:00', '2020-01-17 09:00:34'),
	(12, 110023, 2, '0000-00-00 00:00:00', '2020-01-17 09:00:34'),
	(13, 110033, 1, '0000-00-00 00:00:00', '2020-01-17 09:00:34'),
	(14, 110033, 2, '0000-00-00 00:00:00', '2020-01-17 09:00:34'),
	(15, 110033, 1, '0000-00-00 00:00:00', '2020-01-17 09:00:34');
/*!40000 ALTER TABLE `trn_evaluation` ENABLE KEYS */;

-- Dumping structure for table bizmates_part2exam.trn_teacher
DROP TABLE IF EXISTS `trn_teacher`;
CREATE TABLE IF NOT EXISTS `trn_teacher` (
  `id` int(11) NOT NULL,
  `nickname` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL COMMENT '(note: status 0=discontinued, 1=active, 2=deactivated)',
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table bizmates_part2exam.trn_teacher: ~5 rows (approximately)
/*!40000 ALTER TABLE `trn_teacher` DISABLE KEYS */;
INSERT INTO `trn_teacher` (`id`, `nickname`, `status`, `created_at`) VALUES
	(110011, 'Luca', 1, '2020-01-16 19:04:10'),
	(110023, 'Mike', 0, '2020-01-16 19:03:25'),
	(110030, 'Steph C', 1, '2020-01-17 08:12:24'),
	(110033, 'Scottie', 2, '2020-01-17 08:10:23'),
	(110250, 'John D', 1, '2020-01-16 19:02:18');
/*!40000 ALTER TABLE `trn_teacher` ENABLE KEYS */;

-- Dumping structure for table bizmates_part2exam.trn_teacher_role
DROP TABLE IF EXISTS `trn_teacher_role`;
CREATE TABLE IF NOT EXISTS `trn_teacher_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `teacher_id` int(11) DEFAULT NULL,
  `role` int(11) DEFAULT NULL COMMENT '(note: role 1=trainer, 2=assessor, 3=staff)',
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table bizmates_part2exam.trn_teacher_role: ~8 rows (approximately)
/*!40000 ALTER TABLE `trn_teacher_role` DISABLE KEYS */;
INSERT INTO `trn_teacher_role` (`id`, `teacher_id`, `role`, `created_at`) VALUES
	(1, 110250, 1, '2020-01-17 08:29:55'),
	(2, 110250, 2, '2020-01-17 09:02:01'),
	(3, 110250, 3, '2020-01-17 09:02:09'),
	(4, 110011, 1, '2020-01-17 09:02:27'),
	(5, 110030, 1, '2020-01-17 09:02:37'),
	(6, 110030, 2, '2020-01-17 09:02:45'),
	(7, 110023, 1, '2020-01-17 09:02:57'),
	(8, 110033, 3, '2020-01-17 19:03:11');
/*!40000 ALTER TABLE `trn_teacher_role` ENABLE KEYS */;

-- Dumping structure for table bizmates_part2exam.trn_time_table
DROP TABLE IF EXISTS `trn_time_table`;
CREATE TABLE IF NOT EXISTS `trn_time_table` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `teacher_id` int(11) NOT NULL,
  `lesson_datetime` datetime NOT NULL,
  `status` int(11) NOT NULL COMMENT '(note: status 1=open, 2=backup, 3=reserved)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table bizmates_part2exam.trn_time_table: ~15 rows (approximately)
/*!40000 ALTER TABLE `trn_time_table` DISABLE KEYS */;
INSERT INTO `trn_time_table` (`id`, `teacher_id`, `lesson_datetime`, `status`) VALUES
	(1, 110250, '2020-01-11 17:00:00', 1),
	(2, 110250, '2020-01-11 16:30:00', 1),
	(3, 110250, '2020-01-10 16:00:00', 1),
	(4, 110011, '2020-01-10 17:00:00', 1),
	(5, 110011, '2020-01-10 21:00:00', 2),
	(6, 110011, '2020-01-10 23:00:00', 3),
	(7, 110030, '2020-01-10 21:30:00', 1),
	(8, 110030, '2020-01-10 20:00:00', 1),
	(9, 110030, '2020-01-10 19:30:00', 1),
	(10, 110023, '2020-01-07 17:00:00', 1),
	(11, 110023, '2020-01-06 17:00:00', 1),
	(12, 110023, '2020-01-08 16:30:00', 2),
	(13, 110033, '2020-01-07 15:30:00', 1),
	(14, 110033, '2020-01-06 16:30:00', 2),
	(15, 110033, '2020-01-17 10:30:00', 1);
/*!40000 ALTER TABLE `trn_time_table` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
