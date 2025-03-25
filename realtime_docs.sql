-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 25, 2025 at 07:19 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `realtime_docs`
--

-- --------------------------------------------------------

--
-- Table structure for table `documents`
--

CREATE TABLE `documents` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` longtext DEFAULT NULL,
  `owner_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `documents`
--

INSERT INTO `documents` (`id`, `title`, `content`, `owner_id`, `created_at`, `updated_at`) VALUES
(1, 'Updated Strategy Document', 'he', 1, '2025-03-24 12:37:41', '2025-03-25 04:10:18'),
(2, 'Team Strategy Document', 'Initial content here...', 1, '2025-03-24 12:39:25', '2025-03-24 12:39:25'),
(3, 'Team Strategy Document', 'Initial content here...', 1, '2025-03-24 12:42:45', '2025-03-24 12:42:45'),
(4, 'Team Strategy Document', 'Initial content here...', 1, '2025-03-24 13:46:19', '2025-03-24 13:46:19');

-- --------------------------------------------------------

--
-- Table structure for table `document_user`
--

CREATE TABLE `document_user` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `document_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 0,
  `joined_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `document_user`
--

INSERT INTO `document_user` (`id`, `document_id`, `user_id`, `is_active`, `joined_at`, `created_at`, `updated_at`) VALUES
(1, 1, 2, 1, NULL, '2025-03-24 12:37:42', '2025-03-25 04:10:06'),
(2, 1, 3, 1, NULL, '2025-03-24 12:37:42', '2025-03-25 03:54:04'),
(3, 2, 2, 0, NULL, '2025-03-24 12:39:25', '2025-03-24 12:39:25'),
(4, 2, 3, 0, NULL, '2025-03-24 12:39:25', '2025-03-24 12:39:25'),
(5, 3, 2, 0, NULL, '2025-03-24 12:42:45', '2025-03-24 12:42:45'),
(6, 3, 3, 0, NULL, '2025-03-24 12:42:45', '2025-03-24 12:42:45'),
(7, 4, 2, 0, NULL, '2025-03-24 13:46:19', '2025-03-24 13:46:19'),
(8, 4, 3, 0, NULL, '2025-03-24 13:46:19', '2025-03-24 13:46:19');

-- --------------------------------------------------------

--
-- Table structure for table `document_versions`
--

CREATE TABLE `document_versions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `document_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `content` longtext NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `document_versions`
--

INSERT INTO `document_versions` (`id`, `document_id`, `user_id`, `content`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'Initial content here...', '2025-03-24 12:37:42', '2025-03-24 12:37:42'),
(2, 2, 1, 'Initial content here...', '2025-03-24 12:39:25', '2025-03-24 12:39:25'),
(3, 3, 1, 'Initial content here...', '2025-03-24 12:42:45', '2025-03-24 12:42:45'),
(4, 4, 1, 'Initial content here...', '2025-03-24 13:46:19', '2025-03-24 13:46:19'),
(5, 1, 1, 'Updated content after edits...', '2025-03-24 13:46:22', '2025-03-24 13:46:22'),
(6, 1, 1, 'Updated content after edits...', '2025-03-25 01:57:24', '2025-03-25 01:57:24'),
(7, 1, 1, 'Updated content after edits...', '2025-03-25 03:28:59', '2025-03-25 03:28:59'),
(8, 1, 1, 'Updated content after edits... s', '2025-03-25 03:28:59', '2025-03-25 03:28:59'),
(9, 1, 1, 'Updated content after edits... sad sd', '2025-03-25 03:29:00', '2025-03-25 03:29:00'),
(10, 1, 1, 'Updated content after edits... sad sd', '2025-03-25 03:29:00', '2025-03-25 03:29:00'),
(11, 1, 1, 'Updated content after edits... sa', '2025-03-25 03:29:00', '2025-03-25 03:29:00'),
(12, 1, 1, 'Updated content after edits... sad', '2025-03-25 03:29:00', '2025-03-25 03:29:00'),
(13, 1, 1, 'Updated content after edits... sad', '2025-03-25 03:29:01', '2025-03-25 03:29:01'),
(14, 1, 1, 'Updated content after edits... sad s', '2025-03-25 03:29:01', '2025-03-25 03:29:01'),
(15, 1, 1, 'Updated content after edits... sad sd', '2025-03-25 03:29:02', '2025-03-25 03:29:02'),
(16, 1, 1, 'Updated content after edits... sad sd  a', '2025-03-25 03:29:02', '2025-03-25 03:29:02'),
(17, 1, 1, 'Updated content after edits... sad sd  as', '2025-03-25 03:29:02', '2025-03-25 03:29:02'),
(18, 1, 1, 'Updated content after edits... sad sd  asd', '2025-03-25 03:29:02', '2025-03-25 03:29:02'),
(19, 1, 1, 'Updated content after edits... sad sd  asd', '2025-03-25 03:29:03', '2025-03-25 03:29:03'),
(20, 1, 1, 'Updated content after edits... sad sd  asd a', '2025-03-25 03:29:03', '2025-03-25 03:29:03'),
(21, 1, 1, 'Updated content after edits... sad sd  asd as', '2025-03-25 03:29:03', '2025-03-25 03:29:03'),
(22, 1, 1, 'Updated content after edits... sad sd  asd asd', '2025-03-25 03:29:03', '2025-03-25 03:29:03'),
(23, 1, 1, 'Updated content after edits... sad sd  asd asd', '2025-03-25 03:44:21', '2025-03-25 03:44:21'),
(24, 1, 1, 'Updated content after edits... sad sd  asd asd s', '2025-03-25 03:44:21', '2025-03-25 03:44:21'),
(25, 1, 1, 'Updated content after edits... sad sd  asd asd sa', '2025-03-25 03:44:21', '2025-03-25 03:44:21'),
(26, 1, 1, 'm', '2025-03-25 03:44:26', '2025-03-25 03:44:26'),
(27, 1, 1, 'ma', '2025-03-25 03:44:27', '2025-03-25 03:44:27'),
(28, 1, 1, 'mah', '2025-03-25 03:44:27', '2025-03-25 03:44:27'),
(29, 1, 1, 'mm', '2025-03-25 03:44:27', '2025-03-25 03:44:27'),
(30, 1, 1, 'mao', '2025-03-25 03:44:27', '2025-03-25 03:44:27'),
(31, 1, 1, 'mahu', '2025-03-25 03:44:27', '2025-03-25 03:44:27'),
(32, 1, 1, 'mahud', '2025-03-25 03:44:28', '2025-03-25 03:44:28'),
(33, 1, 1, 'mm', '2025-03-25 03:44:28', '2025-03-25 03:44:28'),
(34, 1, 1, 'm', '2025-03-25 03:44:34', '2025-03-25 03:44:34'),
(35, 1, 1, 'ma', '2025-03-25 03:44:35', '2025-03-25 03:44:35'),
(36, 1, 1, 'mah', '2025-03-25 03:44:36', '2025-03-25 03:44:36'),
(37, 1, 1, 'mahm', '2025-03-25 03:44:37', '2025-03-25 03:44:37'),
(38, 1, 1, 'mahmo', '2025-03-25 03:44:37', '2025-03-25 03:44:37'),
(39, 1, 1, 'mahmou', '2025-03-25 03:44:38', '2025-03-25 03:44:38'),
(40, 1, 1, 'mahmoud', '2025-03-25 03:44:38', '2025-03-25 03:44:38'),
(41, 1, 1, 'mahmoud', '2025-03-25 03:44:38', '2025-03-25 03:44:38'),
(42, 1, 1, 'mahmouda', '2025-03-25 03:44:39', '2025-03-25 03:44:39'),
(43, 1, 1, 'mahmoud', '2025-03-25 03:44:39', '2025-03-25 03:44:39'),
(44, 1, 1, 'mahmoud', '2025-03-25 03:44:40', '2025-03-25 03:44:40'),
(45, 1, 1, 'mahmoud', '2025-03-25 03:44:41', '2025-03-25 03:44:41'),
(46, 1, 1, 'mahmoud', '2025-03-25 03:44:41', '2025-03-25 03:44:41'),
(47, 1, 1, 'mahmoud', '2025-03-25 03:44:44', '2025-03-25 03:44:44'),
(48, 1, 1, 'mahmoud', '2025-03-25 03:44:50', '2025-03-25 03:44:50'),
(49, 1, 1, 'mahmoud', '2025-03-25 03:44:55', '2025-03-25 03:44:55'),
(50, 1, 1, 'mahmouda', '2025-03-25 03:45:00', '2025-03-25 03:45:00'),
(51, 1, 1, 'mahmoudal', '2025-03-25 03:45:01', '2025-03-25 03:45:01'),
(52, 1, 1, 'mahmoudali', '2025-03-25 03:45:01', '2025-03-25 03:45:01'),
(53, 1, 1, 'mahmoudali', '2025-03-25 03:45:02', '2025-03-25 03:45:02'),
(54, 1, 1, 'mahmoudalii', '2025-03-25 03:45:03', '2025-03-25 03:45:03'),
(55, 1, 1, 'mahmoudaliis', '2025-03-25 03:45:03', '2025-03-25 03:45:03'),
(56, 1, 1, 'mahmoudaliis', '2025-03-25 03:45:04', '2025-03-25 03:45:04'),
(57, 1, 1, 'mahmoudaliish', '2025-03-25 03:45:04', '2025-03-25 03:45:04'),
(58, 1, 1, 'mahmoudaliishe', '2025-03-25 03:45:05', '2025-03-25 03:45:05'),
(59, 1, 1, 'mahmoudaliishr', '2025-03-25 03:45:05', '2025-03-25 03:45:05'),
(60, 1, 1, 'mahmoudaliishee', '2025-03-25 03:45:05', '2025-03-25 03:45:05'),
(61, 1, 1, 'mahmoudaliishee', '2025-03-25 03:45:05', '2025-03-25 03:45:05'),
(62, 1, 1, 'mahmoudaliishee', '2025-03-25 03:47:41', '2025-03-25 03:47:41'),
(63, 1, 1, 'mahmoudaliishee s', '2025-03-25 03:47:42', '2025-03-25 03:47:42'),
(64, 1, 1, 'mahmoudaliishee ss', '2025-03-25 03:47:51', '2025-03-25 03:47:51'),
(65, 1, 1, 'mahmoudaliishee sss', '2025-03-25 03:47:52', '2025-03-25 03:47:52'),
(66, 1, 1, 'mahmoudaliishee sss', '2025-03-25 03:49:49', '2025-03-25 03:49:49'),
(67, 1, 1, 'mahmoudaliishee sss s', '2025-03-25 03:49:49', '2025-03-25 03:49:49'),
(68, 1, 1, 'mahmoudaliishee sss s', '2025-03-25 04:01:12', '2025-03-25 04:01:12'),
(69, 1, 1, 'mahmoudaliishee sss s h', '2025-03-25 04:01:13', '2025-03-25 04:01:13'),
(70, 1, 1, 'mahmoudaliishee sss s he', '2025-03-25 04:01:14', '2025-03-25 04:01:14'),
(71, 1, 1, 'mahmoudaliishee sss s her', '2025-03-25 04:01:14', '2025-03-25 04:01:14'),
(72, 1, 1, 'mahmoudaliishee sss s here', '2025-03-25 04:01:14', '2025-03-25 04:01:14'),
(73, 1, 1, 'mahmoudaliishee sss s here', '2025-03-25 04:01:19', '2025-03-25 04:01:19'),
(74, 1, 1, 'mahmoudaliishee sss s here w', '2025-03-25 04:01:19', '2025-03-25 04:01:19'),
(75, 1, 1, 'mahmoudaliishee sss s here we', '2025-03-25 04:01:19', '2025-03-25 04:01:19'),
(76, 1, 1, 'mahmoudaliishee sss s here we', '2025-03-25 04:01:26', '2025-03-25 04:01:26'),
(77, 1, 1, 'mahmoudaliishee sss s here we a', '2025-03-25 04:01:26', '2025-03-25 04:01:26'),
(78, 1, 1, 'mahmoudaliishee sss s here we ae', '2025-03-25 04:01:27', '2025-03-25 04:01:27'),
(79, 1, 1, 'mahmoudaliishee sss s here we aer', '2025-03-25 04:01:27', '2025-03-25 04:01:27'),
(80, 1, 1, 'mahmoudaliishee sss s here we ae', '2025-03-25 04:01:28', '2025-03-25 04:01:28'),
(81, 1, 1, 'mahmoudaliishee sss s here we a', '2025-03-25 04:01:28', '2025-03-25 04:01:28'),
(82, 1, 1, 'mahmoudaliishee sss s here we ar', '2025-03-25 04:01:28', '2025-03-25 04:01:28'),
(83, 1, 1, 'mahmoudaliishee sss s here we are', '2025-03-25 04:01:29', '2025-03-25 04:01:29'),
(84, 1, 2, 'mahmoudaliishee sss s here we are', '2025-03-25 04:03:25', '2025-03-25 04:03:25'),
(85, 1, 2, 'mahmoudaliishee sss s here we are a', '2025-03-25 04:03:26', '2025-03-25 04:03:26'),
(86, 1, 2, 'mahmoudaliishee sss s here we are as', '2025-03-25 04:03:26', '2025-03-25 04:03:26'),
(87, 1, 2, 'mahmoudaliishee sss s here we are asd', '2025-03-25 04:03:28', '2025-03-25 04:03:28'),
(88, 1, 2, 'mahmoudaliishee sss s here we are asda', '2025-03-25 04:03:29', '2025-03-25 04:03:29'),
(89, 1, 1, 'mahmoudaliishee sss s here we are', '2025-03-25 04:03:36', '2025-03-25 04:03:36'),
(90, 1, 1, 'mahmoudaliishee sss s here we are a', '2025-03-25 04:03:36', '2025-03-25 04:03:36'),
(91, 1, 1, 'mahmoudaliishee sss s here we are as', '2025-03-25 04:03:36', '2025-03-25 04:03:36'),
(92, 1, 1, 'mahmoudaliishee sss s here we are asd', '2025-03-25 04:03:36', '2025-03-25 04:03:36'),
(93, 1, 1, 'mahmoudaliishee sss s here we are asda', '2025-03-25 04:03:37', '2025-03-25 04:03:37'),
(94, 1, 1, 'mahmoudaliishee sss s here we are asdad', '2025-03-25 04:03:37', '2025-03-25 04:03:37'),
(95, 1, 1, 'mahmoudaliishee sss s here we are asdads', '2025-03-25 04:03:38', '2025-03-25 04:03:38'),
(96, 1, 1, 'm', '2025-03-25 04:03:39', '2025-03-25 04:03:39'),
(97, 1, 1, 'ma', '2025-03-25 04:03:39', '2025-03-25 04:03:39'),
(98, 1, 1, 'mah', '2025-03-25 04:03:40', '2025-03-25 04:03:40'),
(99, 1, 1, 'mahm', '2025-03-25 04:03:40', '2025-03-25 04:03:40'),
(100, 1, 1, 'mahmo', '2025-03-25 04:03:40', '2025-03-25 04:03:40'),
(101, 1, 1, 'mahmou', '2025-03-25 04:03:40', '2025-03-25 04:03:40'),
(102, 1, 1, 'mahmoud', '2025-03-25 04:03:40', '2025-03-25 04:03:40'),
(103, 1, 1, 'mahmoud', '2025-03-25 04:03:53', '2025-03-25 04:03:53'),
(104, 1, 1, 'mahmoud a', '2025-03-25 04:03:54', '2025-03-25 04:03:54'),
(105, 1, 1, 'mahmoud al', '2025-03-25 04:03:54', '2025-03-25 04:03:54'),
(106, 1, 1, 'mahmoud ali', '2025-03-25 04:03:54', '2025-03-25 04:03:54'),
(107, 1, 1, 'mahmoud ali', '2025-03-25 04:06:14', '2025-03-25 04:06:14'),
(108, 1, 1, 'mahmoud ali s', '2025-03-25 04:06:14', '2025-03-25 04:06:14'),
(109, 1, 1, 'mahmoud ali sa', '2025-03-25 04:06:15', '2025-03-25 04:06:15'),
(110, 1, 2, 'mahmoud ali', '2025-03-25 04:06:18', '2025-03-25 04:06:18'),
(111, 1, 2, 'mahmoud ali s', '2025-03-25 04:06:18', '2025-03-25 04:06:18'),
(112, 1, 2, 'mahmoud ali sd', '2025-03-25 04:06:18', '2025-03-25 04:06:18'),
(113, 1, 2, 'mahmoud ali sda', '2025-03-25 04:06:19', '2025-03-25 04:06:19'),
(114, 1, 2, 'mahmoud ali sdas', '2025-03-25 04:06:19', '2025-03-25 04:06:19'),
(115, 1, 2, 'mahmoud ali sdasd', '2025-03-25 04:06:19', '2025-03-25 04:06:19'),
(116, 1, 1, 'mahmoud ali h', '2025-03-25 04:06:26', '2025-03-25 04:06:26'),
(117, 1, 1, 'mahmoud ali he', '2025-03-25 04:06:26', '2025-03-25 04:06:26'),
(118, 1, 1, 'mahmoud ali her', '2025-03-25 04:06:27', '2025-03-25 04:06:27'),
(119, 1, 1, 'mahmoud ali here', '2025-03-25 04:06:27', '2025-03-25 04:06:27'),
(120, 1, 2, 'mahmoud ali t', '2025-03-25 04:06:47', '2025-03-25 04:06:47'),
(121, 1, 2, 'mahmoud ali te', '2025-03-25 04:06:48', '2025-03-25 04:06:48'),
(122, 1, 2, 'mahmoud ali tes', '2025-03-25 04:06:48', '2025-03-25 04:06:48'),
(123, 1, 2, 'mahmoud ali test', '2025-03-25 04:06:48', '2025-03-25 04:06:48'),
(124, 1, 2, 'mahmoud ali test', '2025-03-25 04:06:48', '2025-03-25 04:06:48'),
(125, 1, 2, 'mahmoud ali test t', '2025-03-25 04:06:48', '2025-03-25 04:06:48'),
(126, 1, 2, 'mahmoud ali test te', '2025-03-25 04:06:49', '2025-03-25 04:06:49'),
(127, 1, 2, 'mahmoud ali test tes', '2025-03-25 04:06:49', '2025-03-25 04:06:49'),
(128, 1, 2, 'mahmoud ali test test', '2025-03-25 04:06:49', '2025-03-25 04:06:49'),
(129, 1, 1, 't', '2025-03-25 04:07:24', '2025-03-25 04:07:24'),
(130, 1, 1, 'th', '2025-03-25 04:07:24', '2025-03-25 04:07:24'),
(131, 1, 1, 'the', '2025-03-25 04:07:24', '2025-03-25 04:07:24'),
(132, 1, 1, 'ther', '2025-03-25 04:07:25', '2025-03-25 04:07:25'),
(133, 1, 1, 'ther', '2025-03-25 04:07:25', '2025-03-25 04:07:25'),
(134, 1, 1, 't', '2025-03-25 04:07:26', '2025-03-25 04:07:26'),
(135, 1, 1, 'th', '2025-03-25 04:07:26', '2025-03-25 04:07:26'),
(136, 1, 1, 'the', '2025-03-25 04:07:26', '2025-03-25 04:07:26'),
(137, 1, 1, 'ther', '2025-03-25 04:07:26', '2025-03-25 04:07:26'),
(138, 1, 1, 'there', '2025-03-25 04:07:26', '2025-03-25 04:07:26'),
(139, 1, 1, 'there', '2025-03-25 04:07:27', '2025-03-25 04:07:27'),
(140, 1, 1, 'there i', '2025-03-25 04:07:27', '2025-03-25 04:07:27'),
(141, 1, 1, 'there is', '2025-03-25 04:07:27', '2025-03-25 04:07:27'),
(142, 1, 1, 'there is', '2025-03-25 04:07:27', '2025-03-25 04:07:27'),
(143, 1, 1, 'there is n', '2025-03-25 04:07:28', '2025-03-25 04:07:28'),
(144, 1, 1, 'there is no', '2025-03-25 04:07:28', '2025-03-25 04:07:28'),
(145, 1, 1, 'there is no', '2025-03-25 04:07:28', '2025-03-25 04:07:28'),
(146, 1, 1, 'there is no u', '2025-03-25 04:07:28', '2025-03-25 04:07:28'),
(147, 1, 1, 'there is no up', '2025-03-25 04:07:28', '2025-03-25 04:07:28'),
(148, 1, 1, 'there is no upd', '2025-03-25 04:07:29', '2025-03-25 04:07:29'),
(149, 1, 1, 'there is no upda', '2025-03-25 04:07:29', '2025-03-25 04:07:29'),
(150, 1, 1, 'there is no updat', '2025-03-25 04:07:29', '2025-03-25 04:07:29'),
(151, 1, 1, 'there is no update', '2025-03-25 04:07:29', '2025-03-25 04:07:29'),
(152, 1, 1, 'there is no update', '2025-03-25 04:07:30', '2025-03-25 04:07:30'),
(153, 1, 1, 'there is no update s', '2025-03-25 04:07:30', '2025-03-25 04:07:30'),
(154, 1, 1, 'there is no update sy', '2025-03-25 04:07:31', '2025-03-25 04:07:31'),
(155, 1, 1, 'there is no update syn', '2025-03-25 04:07:31', '2025-03-25 04:07:31'),
(156, 1, 1, 'there is no update sync', '2025-03-25 04:07:31', '2025-03-25 04:07:31'),
(157, 1, 1, 'there is no update sync', '2025-03-25 04:07:31', '2025-03-25 04:07:31'),
(158, 1, 1, 'there is no update sync', '2025-03-25 04:08:39', '2025-03-25 04:08:39'),
(159, 1, 1, 'there is no update syncs', '2025-03-25 04:08:40', '2025-03-25 04:08:40'),
(160, 1, 1, 'there is no update syncs', '2025-03-25 04:08:41', '2025-03-25 04:08:41'),
(161, 1, 1, 'there is no update syncsd', '2025-03-25 04:08:41', '2025-03-25 04:08:41'),
(162, 1, 1, 'there is no update syncsda', '2025-03-25 04:08:42', '2025-03-25 04:08:42'),
(163, 1, 1, 'there is no update syncsdas', '2025-03-25 04:08:42', '2025-03-25 04:08:42'),
(164, 1, 1, 'there is no update syncsdasd', '2025-03-25 04:08:43', '2025-03-25 04:08:43'),
(165, 1, 1, 'there is no update syncsdasd', '2025-03-25 04:08:43', '2025-03-25 04:08:43'),
(166, 1, 1, 'there is no update syncsdasdd', '2025-03-25 04:08:43', '2025-03-25 04:08:43'),
(167, 1, 1, 'there is no update syncsdasdds', '2025-03-25 04:08:43', '2025-03-25 04:08:43'),
(168, 1, 1, 'there is no update syncsdasddsa', '2025-03-25 04:08:44', '2025-03-25 04:08:44'),
(169, 1, 1, 'h', '2025-03-25 04:10:18', '2025-03-25 04:10:18'),
(170, 1, 1, 'he', '2025-03-25 04:10:18', '2025-03-25 04:10:18');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2025_03_24_125819_create_documents_table', 2),
(6, '2025_03_24_125901_create_document_versions_table', 2),
(7, '2025_03_24_125910_create_document_user_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Mahmoud ali', 'mahmoud.ali.29992@gmail.com', NULL, '$2y$10$FS1q6UUfzTIxj9CsZt.X/.lcE8bQrXxCBsrT5BwM.jeNTGbOkPnbW', NULL, '2025-03-24 10:45:06', '2025-03-24 10:45:06'),
(2, 'Kareem ali', 'Kareem.ali.29992@gmail.com', NULL, '$2y$10$7mUKM83oomvsQeaT8tzC1OvMnN2atq/AuLYCTIqouTTOLrmKRIIty', NULL, '2025-03-24 12:37:33', '2025-03-24 12:37:33'),
(3, 'Ahmed ali', 'ahmed.ali.29992@gmail.com', NULL, '$2y$10$hgISlFgz2S5p9Xh1AfNr0ecQZQlZ7daLfbxoWHwxLiS6io8vLyzdG', NULL, '2025-03-24 12:37:39', '2025-03-24 12:37:39');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `documents`
--
ALTER TABLE `documents`
  ADD PRIMARY KEY (`id`),
  ADD KEY `documents_owner_id_foreign` (`owner_id`);

--
-- Indexes for table `document_user`
--
ALTER TABLE `document_user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `document_user_document_id_foreign` (`document_id`),
  ADD KEY `document_user_user_id_foreign` (`user_id`);

--
-- Indexes for table `document_versions`
--
ALTER TABLE `document_versions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `document_versions_document_id_foreign` (`document_id`),
  ADD KEY `document_versions_user_id_foreign` (`user_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `documents`
--
ALTER TABLE `documents`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `document_user`
--
ALTER TABLE `document_user`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `document_versions`
--
ALTER TABLE `document_versions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=171;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `documents`
--
ALTER TABLE `documents`
  ADD CONSTRAINT `documents_owner_id_foreign` FOREIGN KEY (`owner_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `document_user`
--
ALTER TABLE `document_user`
  ADD CONSTRAINT `document_user_document_id_foreign` FOREIGN KEY (`document_id`) REFERENCES `documents` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `document_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `document_versions`
--
ALTER TABLE `document_versions`
  ADD CONSTRAINT `document_versions_document_id_foreign` FOREIGN KEY (`document_id`) REFERENCES `documents` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `document_versions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
