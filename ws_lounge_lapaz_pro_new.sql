-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 16, 2026 at 05:51 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ws_lounge_lapaz_pro`
--

-- --------------------------------------------------------

--
-- Table structure for table `addons`
--

CREATE TABLE `addons` (
  `id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `unit_price` float NOT NULL,
  `requires_quantity` tinyint(1) DEFAULT NULL,
  `min_quantity` int(11) DEFAULT NULL,
  `max_quantity` int(11) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `attendance_logs`
--

CREATE TABLE `attendance_logs` (
  `id` int(11) NOT NULL,
  `membership_id` int(11) NOT NULL,
  `check_in_time` datetime NOT NULL,
  `check_out_time` datetime DEFAULT NULL,
  `hours_deducted` float DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `is_paused` tinyint(1) DEFAULT 0,
  `paused_at` datetime DEFAULT NULL,
  `accumulated_paused_seconds` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `attendance_logs`
--

INSERT INTO `attendance_logs` (`id`, `membership_id`, `check_in_time`, `check_out_time`, `hours_deducted`, `created_at`, `is_paused`, `paused_at`, `accumulated_paused_seconds`) VALUES
(1, 1, '2026-09-16 17:43:11', '2026-09-16 18:48:37', 1.09, '2026-09-16 17:43:11', 1, '2026-09-16 18:47:17', 326),
(2, 1, '2026-09-16 19:06:12', '2026-09-16 21:32:02', 2.16, '2026-09-16 19:06:12', 0, NULL, 965),
(3, 1, '2026-09-16 21:43:56', '2026-09-16 21:51:02', 0.12, '2026-09-16 21:43:56', 0, NULL, 0),
(4, 1, '2026-09-16 22:12:43', '2026-09-16 22:29:43', 0.28, '2026-09-16 22:12:43', 0, NULL, 26),
(5, 1, '2026-09-16 22:35:40', '2026-09-16 22:36:40', 0.01, '2026-09-16 22:35:40', 0, NULL, 9),
(6, 1, '2026-09-16 23:01:45', '2026-09-16 23:06:04', 0.07, '2026-09-16 23:01:45', 0, NULL, 10),
(7, 1, '2026-09-16 23:15:50', '2026-09-16 23:15:56', 0, '2026-09-16 23:15:50', 0, NULL, 0),
(8, 1, '2026-09-16 23:23:30', '2026-09-16 23:23:57', 0.01, '2026-09-16 23:23:30', 0, NULL, 4);

-- --------------------------------------------------------

--
-- Table structure for table `daily_reports`
--

CREATE TABLE `daily_reports` (
  `id` int(11) NOT NULL,
  `report_date` date DEFAULT NULL,
  `total_check_ins` int(11) DEFAULT NULL,
  `total_logins` int(11) DEFAULT NULL,
  `total_timelogged` float DEFAULT NULL,
  `generated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `equipment`
--

CREATE TABLE `equipment` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `type` varchar(50) DEFAULT NULL,
  `hourly_rate` decimal(10,2) DEFAULT 0.00,
  `quantity_available` int(11) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `equipment`
--

INSERT INTO `equipment` (`id`, `name`, `type`, `hourly_rate`, `quantity_available`) VALUES
(1, 'Projector', 'projector', 100.00, 2),
(2, 'Extra Chair', 'extra chair', 0.00, 2),
(3, 'Extension Cord', 'extension cord', 0.00, 1),
(4, 'Microphone', 'mic', 0.00, 2),
(5, 'Speaker', 'speaker', 0.00, 2);

-- --------------------------------------------------------

--
-- Table structure for table `inventory`
--

CREATE TABLE `inventory` (
  `id` int(11) NOT NULL,
  `item_name` varchar(100) NOT NULL,
  `category` varchar(50) DEFAULT NULL,
  `quantity` int(11) DEFAULT 0,
  `price` decimal(10,2) DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `memberships`
--

CREATE TABLE `memberships` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `status` varchar(20) DEFAULT NULL,
  `start_date` datetime DEFAULT NULL,
  `expiry_date` datetime NOT NULL,
  `total_hours` float DEFAULT NULL,
  `hours_left` float DEFAULT NULL,
  `plan_name` varchar(100) DEFAULT NULL,
  `is_checked_in` tinyint(1) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `is_checked_out` tinyint(1) DEFAULT 0,
  `is_paused` tinyint(1) DEFAULT 0,
  `paused_at` datetime DEFAULT NULL,
  `accumulated_paused_seconds` int(11) DEFAULT 0,
  `member_list_notification_seen` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `memberships`
--

INSERT INTO `memberships` (`id`, `user_id`, `status`, `start_date`, `expiry_date`, `total_hours`, `hours_left`, `plan_name`, `is_checked_in`, `created_at`, `updated_at`, `is_checked_out`, `is_paused`, `paused_at`, `accumulated_paused_seconds`, `member_list_notification_seen`) VALUES
(1, 96, 'active', '2026-09-16 23:23:30', '2026-09-17 00:23:30', 1, 0.99, 'INDIVIDUAL RATE', 0, '2026-09-16 17:20:02', '2026-09-16 23:23:57', 1, 0, NULL, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `payment_info`
--

CREATE TABLE `payment_info` (
  `id` int(11) NOT NULL,
  `method` varchar(32) NOT NULL,
  `account_name` varchar(128) DEFAULT NULL,
  `account_number` varchar(64) DEFAULT NULL,
  `qr_image` varchar(255) DEFAULT NULL,
  `instructions` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payment_info`
--

INSERT INTO `payment_info` (`id`, `method`, `account_name`, `account_number`, `qr_image`, `instructions`, `created_at`, `updated_at`) VALUES
(1, 'GCash', 'WS Students & Professionals Lounge', '0999XXXXXXX', 'gcashqr.png', 'Please make your payment using the details above and upload your payment receipt', '2026-06-07 14:52:33', '2026-07-21 14:02:33'),
(2, 'Maya', 'WS Students & Professionals Lounge', '0999XXXXXXX', 'paymayaqr.png', 'Please make your payment using the details above and upload your payment receipt', '2026-06-07 14:52:33', '2026-07-21 14:02:33');

-- --------------------------------------------------------

--
-- Table structure for table `reservations`
--

CREATE TABLE `reservations` (
  `id` int(11) NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `room_id` int(11) NOT NULL,
  `customer_name` varchar(64) DEFAULT NULL,
  `contact_number` varchar(20) DEFAULT NULL,
  `address` varchar(128) DEFAULT NULL,
  `pax_count` int(11) DEFAULT NULL,
  `start_time` datetime NOT NULL,
  `end_time` datetime DEFAULT NULL,
  `is_open_time` tinyint(1) DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  `total_amount` float DEFAULT NULL,
  `amount_paid` float DEFAULT NULL,
  `payment_method` varchar(50) DEFAULT NULL,
  `payment_type` varchar(20) DEFAULT NULL,
  `receipt_image` varchar(255) DEFAULT NULL,
  `approved_by_id` int(11) DEFAULT NULL,
  `paid` tinyint(1) DEFAULT NULL,
  `added_by` varchar(64) DEFAULT NULL,
  `extra_notes` varchar(255) DEFAULT NULL,
  `extra_fee` float DEFAULT NULL,
  `discount_rate` float DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `addon_name` varchar(64) DEFAULT NULL,
  `addon_quantity` int(11) DEFAULT 0,
  `addon_total` float DEFAULT 0,
  `addon_subtotal` float DEFAULT 0,
  `is_paused` tinyint(1) DEFAULT 0,
  `paused_at` datetime DEFAULT NULL,
  `accumulated_paused_seconds` int(11) DEFAULT 0,
  `confirmation_notification_seen` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reservation_addons`
--

CREATE TABLE `reservation_addons` (
  `id` int(11) NOT NULL,
  `reservation_id` int(11) NOT NULL,
  `addon_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `unit_price` float NOT NULL,
  `subtotal` float DEFAULT NULL,
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `rooms`
--

CREATE TABLE `rooms` (
  `id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `base_rate` float NOT NULL,
  `category` varchar(50) DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `rooms`
--

INSERT INTO `rooms` (`id`, `name`, `base_rate`, `category`, `status`) VALUES
(1, 'Common Area', 35, 'solo', 'available'),
(2, 'Small Meeting Room 1', 50, 'meeting', 'available'),
(3, 'Small Meeting Room 2', 50, 'meeting', 'available'),
(4, 'Lecture Room', 150, 'lecture', 'available'),
(5, 'Conference Room', 250, 'conference', 'available'),
(6, 'Comfy Room', 150, 'comfy', 'available'),
(7, 'Event Room 1', 300, 'event', 'available'),
(8, 'Event Room 2', 300, 'event', 'available');

-- --------------------------------------------------------

--
-- Table structure for table `solo_plans`
--

CREATE TABLE `solo_plans` (
  `id` int(11) NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `approved_by_id` int(11) DEFAULT NULL,
  `plan_name` varchar(64) NOT NULL,
  `status` varchar(20) DEFAULT NULL,
  `payment_method` varchar(50) DEFAULT NULL,
  `receipt_image` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `expiry_date` datetime DEFAULT NULL,
  `is_paused` tinyint(1) DEFAULT 0,
  `paused_at` datetime DEFAULT NULL,
  `accumulated_paused_seconds` int(11) DEFAULT 0,
  `renewed_at` datetime DEFAULT NULL,
  `member_notification_seen` tinyint(1) DEFAULT 0,
  `renewal_notification_seen` tinyint(1) DEFAULT 0,
  `approved_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `solo_plans`
--

INSERT INTO `solo_plans` (`id`, `customer_id`, `user_id`, `approved_by_id`, `plan_name`, `status`, `payment_method`, `receipt_image`, `created_at`, `expiry_date`, `is_paused`, `paused_at`, `accumulated_paused_seconds`, `renewed_at`, `member_notification_seen`, `renewal_notification_seen`, `approved_at`) VALUES
(1, 100, 96, 3, 'INDIVIDUAL RATE', 'checked_out', 'GCash', 'receipt_96_1789550369.jpg', '2026-09-16 17:19:29', '2026-09-16 18:48:37', 1, '2026-09-16 18:47:17', 326, NULL, 1, 1, '2026-09-16 17:20:02'),
(2, 101, 96, 3, 'INDIVIDUAL RATE (4HRS)', 'checked_out', 'GCash', 'receipt_96_1789556678.jpg', '2026-09-16 19:04:38', '2026-09-16 23:22:17', 0, NULL, 965, NULL, 1, 1, '2026-09-16 19:04:56'),
(3, 102, 96, 3, 'INDIVIDUAL RATE (4HRS)', 'checked_out', 'GCash', 'receipt_96_1789565717.jpg', '2026-09-16 21:35:17', '2026-09-17 01:43:56', 0, NULL, 0, NULL, 1, 1, '2026-09-16 21:35:52'),
(4, 103, 96, 3, 'INDIVIDUAL RATE', 'checked_out', 'GCash', 'receipt_96_1789567953.jpg', '2026-09-16 22:12:33', '2026-09-16 23:13:09', 0, NULL, 26, NULL, 1, 1, '2026-09-16 22:12:39'),
(5, 104, 96, 3, 'INDIVIDUAL RATE', 'checked_out', 'GCash', 'receipt_96_1789569281.jpg', '2026-09-16 22:34:41', '2026-09-16 23:35:49', 0, NULL, 9, NULL, 1, 1, '2026-09-16 22:34:46'),
(6, 105, 96, NULL, 'INDIVIDUAL RATE', 'rejected', 'GCash', 'receipt_96_1789570122.jpg', '2026-09-16 22:48:42', NULL, 0, NULL, 0, NULL, 0, 0, NULL),
(7, 106, 96, 3, 'INDIVIDUAL RATE', 'checked_out', 'GCash', 'receipt_96_1789570196.jpg', '2026-09-16 22:49:56', '2026-09-17 00:01:55', 0, NULL, 10, NULL, 1, 1, '2026-09-16 22:53:30'),
(8, 107, 96, 3, 'INDIVIDUAL RATE', 'checked_out', 'GCash', 'receipt_96_1789571198.jpg', '2026-09-16 23:06:38', '2026-09-17 00:15:50', 0, NULL, 0, NULL, 0, 1, '2026-09-16 23:06:45'),
(9, 108, 96, 3, 'INDIVIDUAL RATE', 'checked_out', 'GCash', 'receipt_96_1789571785.jpg', '2026-09-16 23:16:25', '2026-09-17 00:23:34', 0, NULL, 4, NULL, 1, 1, '2026-09-16 23:16:57');

-- --------------------------------------------------------

--
-- Table structure for table `time_logs`
--

CREATE TABLE `time_logs` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `plan` varchar(64) DEFAULT NULL,
  `time_in` datetime DEFAULT NULL,
  `time_out` datetime DEFAULT NULL,
  `total_time` int(11) DEFAULT NULL,
  `is_paused` tinyint(1) DEFAULT 0,
  `paused_at` datetime DEFAULT NULL,
  `accumulated_paused_seconds` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `membership_id` varchar(20) DEFAULT NULL,
  `name` varchar(64) NOT NULL,
  `email` varchar(120) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `role` varchar(20) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT NULL,
  `expiry_date` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `failed_login_attempts` int(11) DEFAULT 0,
  `last_failed_login` datetime DEFAULT NULL,
  `locked_until` datetime DEFAULT NULL,
  `created_via_manage_staff` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `customer_id`, `membership_id`, `name`, `email`, `phone`, `password`, `role`, `is_active`, `expiry_date`, `created_at`, `failed_login_attempts`, `last_failed_login`, `locked_until`, `created_via_manage_staff`) VALUES
(2, NULL, NULL, 'admin', 'admin-f236f8b7@example.com', NULL, 'scrypt:32768:8:1$pI60ZpFeOYoqfnyn$69e19bd539b3cdcd5a12813ea7fd5c8c54136025e496a76971fda4375b6da094661b910f665a5680d8051087bc3d07259243ed1ef40935a8a3e8b57f1eebb19a', 'admin', 1, NULL, '2026-06-07 14:52:33', 0, NULL, NULL, 0),
(3, NULL, NULL, 'wslounge', 'wslounge@lounge.com', '09171111111', 'scrypt:32768:8:1$S8oZSVmuHbX7Vyqp$95cda42d51e6f347165db2a074d4ae78d919bf709609c47438662a3eb5dc0500ad9fc4b8ae134ab044219aae006819ee22afb9af4f780d46ef2a0f47294e213a', 'admin', 1, NULL, '2026-06-07 14:52:34', 0, NULL, NULL, 0),
(96, NULL, NULL, 'Ramil Fernandez', 'limar08042026@gmail.com', '09127632434', 'scrypt:32768:8:1$vZdtzwQ7Dt7rvCAx$616734c4e8254a5823e1d4e8dd14688a7361d52e205a5179607f33f19fe522102fb8452716caf6b709920c3996f0c27a900e99a159c2f43da0379fc0ef57c941', 'member', 1, NULL, '2026-09-16 09:17:03', 0, NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `user_activity_logs`
--

CREATE TABLE `user_activity_logs` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `activity_type` varchar(50) DEFAULT NULL,
  `activity_time` datetime DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_activity_logs`
--

INSERT INTO `user_activity_logs` (`id`, `user_id`, `activity_type`, `activity_time`, `ip_address`) VALUES
(1, 96, 'attendance|Check-In', '2026-09-16 17:43:11', '127.0.0.1'),
(2, 96, 'attendance|Paused', '2026-09-16 17:50:31', '127.0.0.1'),
(3, 96, 'attendance|Resumed', '2026-09-16 17:55:48', '127.0.0.1'),
(4, 96, 'attendance|Paused', '2026-09-16 18:06:34', '127.0.0.1'),
(5, 96, 'attendance|Resumed', '2026-09-16 18:06:43', '127.0.0.1'),
(6, 96, 'attendance|Paused', '2026-09-16 18:47:17', '127.0.0.1'),
(7, 96, 'attendance|Check-In', '2026-09-16 19:06:12', '127.0.0.1'),
(8, 96, 'attendance|Paused', '2026-09-16 19:41:41', '127.0.0.1'),
(9, 96, 'attendance|Resumed', '2026-09-16 19:42:07', '127.0.0.1'),
(10, 96, 'attendance|Paused', '2026-09-16 19:58:44', '127.0.0.1'),
(11, 96, 'attendance|Resumed', '2026-09-16 20:14:23', '127.0.0.1'),
(12, 96, 'attendance|Checked-Out', '2026-09-16 21:32:02', '127.0.0.1'),
(13, 96, 'attendance|Check-In', '2026-09-16 21:43:56', '127.0.0.1'),
(14, 96, 'attendance|Checked-Out', '2026-09-16 21:51:02', '127.0.0.1'),
(15, 96, 'attendance|Check-In', '2026-09-16 22:12:43', '127.0.0.1'),
(16, 96, 'attendance|Paused', '2026-09-16 22:13:04', '127.0.0.1'),
(17, 96, 'attendance|Resumed', '2026-09-16 22:13:30', '127.0.0.1'),
(18, 96, 'attendance|Checked-Out', '2026-09-16 22:29:43', '127.0.0.1'),
(19, 96, 'attendance|Check-In', '2026-09-16 22:35:40', '127.0.0.1'),
(20, 96, 'attendance|Paused', '2026-09-16 22:36:25', '127.0.0.1'),
(21, 96, 'attendance|Resumed', '2026-09-16 22:36:34', '127.0.0.1'),
(22, 96, 'attendance|Checked-Out', '2026-09-16 22:36:40', '127.0.0.1'),
(23, 96, 'attendance|Check-In', '2026-09-16 23:01:45', '127.0.0.1'),
(24, 96, 'attendance|Paused', '2026-09-16 23:05:47', '127.0.0.1'),
(25, 96, 'attendance|Resumed', '2026-09-16 23:05:57', '127.0.0.1'),
(26, 96, 'attendance|Checked-Out', '2026-09-16 23:06:04', '127.0.0.1'),
(27, 96, 'attendance|Check-In', '2026-09-16 23:15:50', '127.0.0.1'),
(28, 96, 'attendance|Checked-Out', '2026-09-16 23:15:56', '127.0.0.1'),
(29, 96, 'attendance|Check-In', '2026-09-16 23:23:30', '127.0.0.1'),
(30, 96, 'attendance|Paused', '2026-09-16 23:23:46', '127.0.0.1'),
(31, 96, 'attendance|Resumed', '2026-09-16 23:23:50', '127.0.0.1'),
(32, 96, 'attendance|Checked-Out', '2026-09-16 23:23:57', '127.0.0.1');

-- --------------------------------------------------------

--
-- Table structure for table `walkin_addons`
--

CREATE TABLE `walkin_addons` (
  `id` int(11) NOT NULL,
  `walkin_reservation_id` int(11) NOT NULL,
  `addon_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `unit_price` float NOT NULL,
  `subtotal` float DEFAULT NULL,
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `walkin_reservations`
--

CREATE TABLE `walkin_reservations` (
  `id` int(11) NOT NULL,
  `reservation_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `room_id` int(11) NOT NULL,
  `customer_name` varchar(64) DEFAULT NULL,
  `contact_number` varchar(20) DEFAULT NULL,
  `pax_count` int(11) DEFAULT NULL,
  `start_time` datetime NOT NULL,
  `end_time` datetime DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  `total_amount` float DEFAULT NULL,
  `paid` tinyint(1) DEFAULT NULL,
  `extra_fee` float DEFAULT NULL,
  `added_by` varchar(64) DEFAULT NULL,
  `extra_notes` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `addon_name` varchar(64) DEFAULT NULL,
  `addon_quantity` int(11) DEFAULT 0,
  `addon_total` float DEFAULT 0,
  `addon_subtotal` float NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `addons`
--
ALTER TABLE `addons`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `attendance_logs`
--
ALTER TABLE `attendance_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `membership_id` (`membership_id`);

--
-- Indexes for table `daily_reports`
--
ALTER TABLE `daily_reports`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `report_date` (`report_date`);

--
-- Indexes for table `equipment`
--
ALTER TABLE `equipment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `inventory`
--
ALTER TABLE `inventory`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `memberships`
--
ALTER TABLE `memberships`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id` (`user_id`);

--
-- Indexes for table `payment_info`
--
ALTER TABLE `payment_info`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `method` (`method`);

--
-- Indexes for table `reservations`
--
ALTER TABLE `reservations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `customer_id` (`customer_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `room_id` (`room_id`),
  ADD KEY `approved_by_id` (`approved_by_id`);

--
-- Indexes for table `reservation_addons`
--
ALTER TABLE `reservation_addons`
  ADD PRIMARY KEY (`id`),
  ADD KEY `reservation_id` (`reservation_id`),
  ADD KEY `addon_id` (`addon_id`);

--
-- Indexes for table `rooms`
--
ALTER TABLE `rooms`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `solo_plans`
--
ALTER TABLE `solo_plans`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `customer_id` (`customer_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `approved_by_id` (`approved_by_id`);

--
-- Indexes for table `time_logs`
--
ALTER TABLE `time_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `customer_id` (`customer_id`),
  ADD UNIQUE KEY `membership_id` (`membership_id`);

--
-- Indexes for table `user_activity_logs`
--
ALTER TABLE `user_activity_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `walkin_addons`
--
ALTER TABLE `walkin_addons`
  ADD PRIMARY KEY (`id`),
  ADD KEY `walkin_reservation_id` (`walkin_reservation_id`),
  ADD KEY `addon_id` (`addon_id`);

--
-- Indexes for table `walkin_reservations`
--
ALTER TABLE `walkin_reservations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `reservation_id` (`reservation_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `room_id` (`room_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `addons`
--
ALTER TABLE `addons`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `attendance_logs`
--
ALTER TABLE `attendance_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `daily_reports`
--
ALTER TABLE `daily_reports`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `equipment`
--
ALTER TABLE `equipment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `inventory`
--
ALTER TABLE `inventory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `memberships`
--
ALTER TABLE `memberships`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `payment_info`
--
ALTER TABLE `payment_info`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `reservations`
--
ALTER TABLE `reservations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reservation_addons`
--
ALTER TABLE `reservation_addons`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `rooms`
--
ALTER TABLE `rooms`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `solo_plans`
--
ALTER TABLE `solo_plans`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `time_logs`
--
ALTER TABLE `time_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=97;

--
-- AUTO_INCREMENT for table `user_activity_logs`
--
ALTER TABLE `user_activity_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `walkin_addons`
--
ALTER TABLE `walkin_addons`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `walkin_reservations`
--
ALTER TABLE `walkin_reservations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `attendance_logs`
--
ALTER TABLE `attendance_logs`
  ADD CONSTRAINT `attendance_logs_ibfk_1` FOREIGN KEY (`membership_id`) REFERENCES `memberships` (`id`);

--
-- Constraints for table `memberships`
--
ALTER TABLE `memberships`
  ADD CONSTRAINT `memberships_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `reservations`
--
ALTER TABLE `reservations`
  ADD CONSTRAINT `reservations_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `reservations_ibfk_2` FOREIGN KEY (`room_id`) REFERENCES `rooms` (`id`),
  ADD CONSTRAINT `reservations_ibfk_3` FOREIGN KEY (`approved_by_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `reservation_addons`
--
ALTER TABLE `reservation_addons`
  ADD CONSTRAINT `reservation_addons_ibfk_1` FOREIGN KEY (`reservation_id`) REFERENCES `reservations` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `reservation_addons_ibfk_2` FOREIGN KEY (`addon_id`) REFERENCES `addons` (`id`);

--
-- Constraints for table `solo_plans`
--
ALTER TABLE `solo_plans`
  ADD CONSTRAINT `solo_plans_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `solo_plans_ibfk_2` FOREIGN KEY (`approved_by_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `time_logs`
--
ALTER TABLE `time_logs`
  ADD CONSTRAINT `time_logs_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `user_activity_logs`
--
ALTER TABLE `user_activity_logs`
  ADD CONSTRAINT `user_activity_logs_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `walkin_addons`
--
ALTER TABLE `walkin_addons`
  ADD CONSTRAINT `walkin_addons_ibfk_1` FOREIGN KEY (`walkin_reservation_id`) REFERENCES `walkin_reservations` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `walkin_addons_ibfk_2` FOREIGN KEY (`addon_id`) REFERENCES `addons` (`id`);

--
-- Constraints for table `walkin_reservations`
--
ALTER TABLE `walkin_reservations`
  ADD CONSTRAINT `walkin_reservations_ibfk_1` FOREIGN KEY (`reservation_id`) REFERENCES `reservations` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `walkin_reservations_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `walkin_reservations_ibfk_3` FOREIGN KEY (`room_id`) REFERENCES `rooms` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
