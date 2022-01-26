-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 26, 2022 at 10:53 AM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.0.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `leave_application`
--

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE `department` (
  `id` int(11) NOT NULL,
  `name` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`id`, `name`) VALUES
(1, 'Products'),
(2, 'DevOps'),
(3, 'Bussiness Development'),
(4, 'Management'),
(5, 'Alpha'),
(6, 'Sales');

-- --------------------------------------------------------

--
-- Table structure for table `designation`
--

CREATE TABLE `designation` (
  `id` int(2) NOT NULL,
  `designation` varchar(30) DEFAULT NULL,
  `deptId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `designation`
--

INSERT INTO `designation` (`id`, `designation`, `deptId`) VALUES
(1, 'Software Engineer-I', 1),
(2, 'Software Engineer-II', 1),
(3, 'Lead Development', 1),
(4, 'Head of Dept', 1),
(5, 'Manager services and Software', 2),
(6, 'Team Lead', 2),
(7, 'System Engineer-I', 5),
(8, 'System Engineer-II', 5),
(9, 'Software Engineer-I', 2),
(10, 'Software Engineer-II', 2),
(11, 'DevOps Engineer', 2),
(12, 'Lead DevOps', 2),
(13, 'Key Account Manager', 3),
(14, 'Pre-sales Manager', 3),
(15, 'Bussiness Development Manager', 3),
(16, 'VP Sales', 6),
(17, 'Director', 4),
(18, 'Manager Group Finance', 4),
(19, 'Manager HR', 4),
(20, 'Admin Assistant', 4),
(22, 'Team lead', 5),
(23, 'Robotic Engineer', 2),
(24, 'CEO', 4),
(25, 'Senior Software Engineer', 1),
(26, 'Senior System Engineer', 5);

-- --------------------------------------------------------

--
-- Table structure for table `leaves`
--

CREATE TABLE `leaves` (
  `empId` int(11) NOT NULL,
  `annualAvailed` int(2) DEFAULT NULL,
  `annualLeft` int(2) DEFAULT NULL,
  `otherAvailed` int(2) DEFAULT NULL,
  `sickAvailed` int(2) DEFAULT NULL,
  `total` int(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `leaves`
--

INSERT INTO `leaves` (`empId`, `annualAvailed`, `annualLeft`, `otherAvailed`, `sickAvailed`, `total`) VALUES
(1, 9, 6, 1, 0, 15),
(23, 0, 15, 1, 0, 15),
(24, 10, 5, 5, 0, 15);

-- --------------------------------------------------------

--
-- Table structure for table `leave_requests`
--

CREATE TABLE `leave_requests` (
  `id` int(11) NOT NULL,
  `adminComment` varchar(200) DEFAULT NULL,
  `attachment` varchar(100) DEFAULT NULL,
  `comment` varchar(500) DEFAULT NULL,
  `countryCode` int(4) DEFAULT NULL,
  `created` date DEFAULT NULL,
  `leaveDate` date DEFAULT NULL,
  `leaves` int(2) DEFAULT NULL,
  `lineManagerId` int(2) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `reason` varchar(500) DEFAULT NULL,
  `return_date` date DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `time_period` varchar(10) DEFAULT NULL,
  `type` varchar(100) DEFAULT NULL,
  `updated_id` date DEFAULT NULL,
  `empId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `leave_requests`
--

INSERT INTO `leave_requests` (`id`, `adminComment`, `attachment`, `comment`, `countryCode`, `created`, `leaveDate`, `leaves`, `lineManagerId`, `name`, `reason`, `return_date`, `status`, `time_period`, `type`, `updated_id`, `empId`) VALUES
(68, 'approved', '', NULL, 92, '2021-02-23', '2021-02-18', 5, 36, 'Muhammad Adnan', 'brother-in-law marriage ceremony', '2021-02-23', 2, NULL, 'Anuual leave', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(11) NOT NULL,
  `batch` int(11) NOT NULL,
  `migration` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `my_entity_seq`
--

CREATE TABLE `my_entity_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `my_entity_seq`
--

INSERT INTO `my_entity_seq` (`next_val`) VALUES
(1);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `id` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `token` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `team_lead`
--

CREATE TABLE `team_lead` (
  `id` int(11) NOT NULL,
  `name` varchar(30) DEFAULT NULL,
  `deptId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `team_lead`
--

INSERT INTO `team_lead` (`id`, `name`, `deptId`) VALUES
(23, 'Muhammad Shoaib Khalid', 1),
(24, 'Zeeshan Ali', 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `access_type` int(11) DEFAULT NULL,
  `countryCode` int(2) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `email` varchar(40) DEFAULT NULL,
  `is_change_pass` tinyint(1) DEFAULT NULL,
  `is_lock` tinyint(1) DEFAULT NULL,
  `lock_expired` datetime DEFAULT NULL,
  `name` varchar(765) DEFAULT NULL,
  `password` varchar(765) DEFAULT NULL,
  `remember_token` varchar(300) DEFAULT NULL,
  `status` int(11) NOT NULL,
  `tlId` int(11) NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `username` varchar(765) DEFAULT NULL,
  `wrong_pass_count` tinyint(1) DEFAULT NULL,
  `departmentId` int(11) NOT NULL,
  `designationId` int(2) NOT NULL,
  `prefix_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `access_type`, `countryCode`, `created_at`, `email`, `is_change_pass`, `is_lock`, `lock_expired`, `name`, `password`, `remember_token`, `status`, `tlId`, `updated_at`, `username`, `wrong_pass_count`, `departmentId`, `designationId`, `prefix_id`) VALUES
(1, 1, 92, '2020-04-15 12:36:42', 'muhammad.adnan@kalsym.com', 1, 0, NULL, 'Muhammad Adnan', '$2y$10$THhK/B8wH2/u4xbazgEeBeicV40r2/8OIlrVp.zKUg6dN/RtgQb0q', '0hxkYplvp9o8yi2XbCoGCaa3QvBwN9fuRM55c8OevQS4kh4IzgMOyzi4SYF7', 1, 0, '2021-10-12 16:05:20', 'muhammad.adnan@kalsym.com', 0, 4, 1, 12),
(23, 0, 92, '2021-02-16 12:19:12', 'shoaib@kalsym.com', 1, 0, NULL, 'Muhammad Shoaib Khalid', '$2y$10$q9fIEqT1ePrJ6tsv.8t0.uBwWqaRuK7LD.TyRiXpc4Rdp6/G68etm', 'l8Y2SzZTz4bBt0U8BrXx2FfGhmCk339doQsg450oWtUX8ncTIVUEwo0jWCqJ', 1, 38, '2021-10-11 09:50:10', 'shoaib@kalsym.com', 0, 1, 4, 12),
(24, -1, 92, '2021-02-16 12:21:59', 'zeeshan.ali@kalsym.com', 1, 0, '2021-07-02 19:07:36', 'Zeeshan Ali', '$2y$10$1at7j.rX8yQJEgwWrzwLo.1wVo8.nkrmdBR8ctXu5nhG0saigQDay', 'mARDW54F0uxFKgKCORD8fA1GwteDWTDQPU82IEVTFiA8Q0Cw1erHDBvEsu9S', 1, 23, '2021-07-23 10:05:29', 'zeeshan.ali@kalsym.com', 0, 1, 6, 13);

-- --------------------------------------------------------

--
-- Table structure for table `user_pass`
--

CREATE TABLE `user_pass` (
  `prefix_id` int(11) NOT NULL,
  `password` varchar(100) DEFAULT NULL,
  `prefix` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user_pass`
--

INSERT INTO `user_pass` (`prefix_id`, `password`, `prefix`) VALUES
(12, 'Kalsym@123', 'ADMIN'),
(13, 'Kalsym@123', 'EMP');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `designation`
--
ALTER TABLE `designation`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKj412j7gcarvtn2uralku4ue7g` (`deptId`);

--
-- Indexes for table `leaves`
--
ALTER TABLE `leaves`
  ADD PRIMARY KEY (`empId`);

--
-- Indexes for table `leave_requests`
--
ALTER TABLE `leave_requests`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK3sk79m5jp5jvemmhhgiwtm0kp` (`empId`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `team_lead`
--
ALTER TABLE `team_lead`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK5vgu3o3xyroxnf9kxp5oena7` (`deptId`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK6qjmf3o12oocu9kdlmilr75q1` (`departmentId`),
  ADD KEY `FKoi4lhmcf9lprjxp2or149g07a` (`designationId`),
  ADD KEY `FKqg7nsmn0ll0teks0eskceoktp` (`prefix_id`);

--
-- Indexes for table `user_pass`
--
ALTER TABLE `user_pass`
  ADD PRIMARY KEY (`prefix_id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `designation`
--
ALTER TABLE `designation`
  ADD CONSTRAINT `FKj412j7gcarvtn2uralku4ue7g` FOREIGN KEY (`deptId`) REFERENCES `department` (`id`);

--
-- Constraints for table `leaves`
--
ALTER TABLE `leaves`
  ADD CONSTRAINT `FKlo4xnw6cnr1al8jf8heu38d3c` FOREIGN KEY (`empId`) REFERENCES `users` (`id`);

--
-- Constraints for table `leave_requests`
--
ALTER TABLE `leave_requests`
  ADD CONSTRAINT `FK3sk79m5jp5jvemmhhgiwtm0kp` FOREIGN KEY (`empId`) REFERENCES `users` (`id`);

--
-- Constraints for table `team_lead`
--
ALTER TABLE `team_lead`
  ADD CONSTRAINT `FK5vgu3o3xyroxnf9kxp5oena7` FOREIGN KEY (`deptId`) REFERENCES `department` (`id`),
  ADD CONSTRAINT `FK6ti29ng3dt7parjpqbcmr2y1u` FOREIGN KEY (`id`) REFERENCES `users` (`id`);

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `FK6qjmf3o12oocu9kdlmilr75q1` FOREIGN KEY (`departmentId`) REFERENCES `department` (`id`),
  ADD CONSTRAINT `FKoi4lhmcf9lprjxp2or149g07a` FOREIGN KEY (`designationId`) REFERENCES `designation` (`id`),
  ADD CONSTRAINT `FKqg7nsmn0ll0teks0eskceoktp` FOREIGN KEY (`prefix_id`) REFERENCES `user_pass` (`prefix_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
