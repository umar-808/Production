-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 28, 2022 at 05:38 AM
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
(26, 'Senior System Engineer', 5),
(27, 'Accounts Executive', 4);

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
(24, 10, 5, 5, 0, 15),
(25, 6, 9, 7, 1, 15),
(26, 5, 10, 5, 1, 15),
(27, 1, 14, 5, 0, 15),
(28, 5, 10, 1, 2, 15),
(29, 0, 15, 2, 0, 15),
(30, 0, 15, 1, 0, 15),
(31, 1, 14, 4, 0, 15),
(32, 2, 13, 2, 0, 15),
(33, 0, 15, 0, 3, 15),
(34, 2, 13, 4, 0, 15),
(35, 6, 9, 6, 0, 15),
(36, 11, 4, 5, 0, 15),
(37, 5, 10, 5, 7, 15),
(46, 3, 12, 5, 0, 15),
(47, 10, 5, 2, 3, 15),
(49, 0, 15, 6, 0, 15),
(51, 0, 15, 3, 1, 15);

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
(24, 'Zeeshan Ali', 1),
(25, 'Muhammad Waqas', 2),
(26, 'Wasim Ur Rehman', 5),
(36, 'Aakash Rajput', 4),
(38, 'Albert Ho', 4),
(44, 'Kevin Lew', 4),
(47, 'Muhammad Rashid Zafar', 6),
(48, 'Umair Ali Khan', 3);

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
(24, -1, 92, '2021-02-16 12:21:59', 'zeeshan.ali@kalsym.com', 1, 0, '2021-07-02 19:07:36', 'Zeeshan Ali', '$2y$10$1at7j.rX8yQJEgwWrzwLo.1wVo8.nkrmdBR8ctXu5nhG0saigQDay', 'mARDW54F0uxFKgKCORD8fA1GwteDWTDQPU82IEVTFiA8Q0Cw1erHDBvEsu9S', 1, 23, '2021-07-23 10:05:29', 'zeeshan.ali@kalsym.com', 0, 1, 6, 13),
(25, 0, 92, '2021-02-16 12:24:14', 'muhammad.waqas@kalsym.com', 1, 0, '2021-10-04 18:21:23', 'Muhammad Waqas', '$2y$10$8nwP3Oq79d8TuN0V78wN2.W8w6o.eayjA3.BnxnhaU56o82UxL/K.', 'PGLiWziCbgQsvgPCfuiF5oP7TDVnb8AzZUwBUUh7YgqKe8LxrXtmWuNA9TSG', 1, 23, '2021-12-23 09:50:55', 'muhammad.waqas@kalsym.com', 0, 2, 5, 13),
(26, -1, 92, '2021-02-16 12:25:58', 'wasim@kalsym.com', 1, 0, NULL, 'Wasim Ur Rehman', '$2y$10$fGPyO48HdqUXbiHuUdDrTekCIeLb7W5VGdVckTtF0bbTDtNQS6BUi', 'lJPLvCQdhFDh1buJINrDWcgGwDivzKbXU5H4cmoeo4onzfyVaqzAEBvGehNm', 1, 25, '2021-04-23 09:05:57', 'wasim@kalsym.com', 0, 5, 6, 13),
(27, -2, 92, '2021-02-16 12:27:52', 'sarosh.tariq@kalsym.com', 1, 0, NULL, 'Sarosh Tariq', '$2y$10$gLxW1Nfp1ymVmE31lQf0Du2kYNZHAjaDrY2IAAoQVoKqjC9UF0tJK', 'cbAviOy33G5OHLJFKtxI6oCgBmxHEdc20Yeu4T9USn3OCitViVZDhnXblD3I', 1, 24, '2021-07-02 09:17:34', 'sarosh.tariq@kalsym.com', 0, 1, 2, 13),
(28, -2, 92, '2021-02-16 12:31:51', 'faisal.hayat@kalsym.com', 1, 0, NULL, 'Faisal Hayat', '$2y$10$hAiVfoRhfWPUWWTrwutvAueT9gCno8FovonzginEnwo33bYAo2bxq', '3ccSlqUEAQu8d52goqtu0uhh68KuVd0Zx3lf0x3zQBzwXO1cmJdvL1lGRmBG', 1, 25, '2021-07-19 16:57:06', 'faisal.hayat@kalsym.com', 1, 2, 9, 13),
(29, -2, 92, '2021-02-16 12:34:21', 'mohsin.ali@kalsym.com', 1, 0, '2021-09-06 15:26:17', 'Mohsin Ali', '$2y$10$mOx4vno2vlyZj8oNjltkReQW2gBP36giHQJuMlS5qTup5LROKROhC', 'lDXYppqmJgKvi6HfKNj697kYugcr8RzoLUroyKBDJOsqSqIgwfMuHbpPykoW', 1, 24, '2021-09-09 14:47:56', 'mohsin.ali@kalsym.com', 0, 1, 1, 13),
(30, -2, 92, '2021-02-16 12:35:35', 'israr.ahmad@kalsym.com', 1, 0, NULL, 'Israr Ahmad', '$2y$10$q1DePD6lE0xnqKd592SSR.WqRjmTQc3RObvZ18nazAWFyX3uxiJs.', 'qad2VlkS891Ow1r0DUTqJSqka1FtPitGgKLT9GckRXEFe1Hoa4A9EVbcgQG2', 1, 25, '2021-10-04 15:40:22', 'israr.ahmad@kalsym.com', 0, 2, 12, 13),
(31, -2, 92, '2021-02-16 12:36:54', 'adeel.raza@kalsym.com', 1, 0, NULL, 'Adeel Raza', '$2y$10$UXMuGdTWVYq4WCbmHVvTrupbiVoJ5XKIgcvAAhj.ELh/2Loktv7LK', 'XJooSt5xth0IOAfDXeOCAGYHeA9pjoDyNifJc2zau5V2PQPjdWa18t3XPtUe', 1, 25, '2021-07-08 10:57:44', 'adeel.raza@kalsym.com', 3, 2, 11, 13),
(32, -2, 92, '2021-02-16 12:38:16', 'asim.malik@kalsym.com', 1, 0, NULL, 'Asim Malik', '$2y$10$8onnvdC/xlOBaFkixgSEcOrRgaVVPrlIjqQai6Rt5xvbdqJvrpcTG', 'cyLTOMOutyhRRwRUznJiTNKhzY95ImQO4F6s0qNR3J6CkrHDKe3GclwqsthC', 1, 25, '2021-10-11 09:21:58', 'asim.malik@kalsym.com', 0, 2, 11, 13),
(33, -2, 92, '2021-02-16 12:40:04', 'fawad.tariq@kalsym.com', 1, 0, NULL, 'Fawad Tariq', '$2y$10$Fc/6YidTdutbbAK.Pozno.O9KQYuGjy9u6PfcTArXmMv2ASjnJGwe', 'Lw6FTxOxuUNEGskvNIDmiU69wuyGudVmy22TKj3XAASQNeyBYilCIkf4TUv4', 1, 26, '2021-11-04 10:29:18', 'fawad.tariq@kalsym.com', 0, 5, 7, 13),
(34, -2, 92, '2021-02-16 12:41:11', 'nauman.shakil@kalsym.com', 1, 0, NULL, 'Nauman Shakil', '$2y$10$o9JKjN2kzU277e8P6W8z.eb0WKNtAQ59bLCr6iOysXKRJlv2QRZYS', 'Ih6g6HLCrtgrgV10aVpas68UAQsScGy6YkowBfdOi10SjQTEeODKddniMNcy', 1, 48, '2021-10-04 09:45:46', 'nauman.shakil@kalsym.com', 0, 3, 2, 13),
(35, -2, 92, '2021-02-16 12:45:33', 'abdul.rehman@kalsym.com', 1, 0, NULL, 'Abdul Rehman', '$2y$10$CnRL0idQjvbYlymGt0AMcOpGD8h.SDbmEkrz1M7dACcd3PiW4G9yy', 'MjltNim5qrQwT9NW94AgpKfM1VNn74ngGPO1ksA7sQ7b5Bw0cJLjJdNekW8p', 1, 26, '2021-12-28 14:46:03', 'abdul.rehman@kalsym.com', 0, 5, 8, 13),
(36, 1, 92, '2021-02-16 16:50:51', 'aakash_rajput@kalsym.com', 1, 0, NULL, 'Aakash Rajput', '$2y$10$6Ntuw9b4PE2elHBFa8VvRuUm/K5CjoJcVuRXkJMEWn2IJX5xUEBAG', '2mR3LaaSGPSHdSDoRbgTNsPK0Mn6JGrx6lJvxtEP9vsFOuiJndzesEu6L6pq', 1, 38, '2021-11-22 10:46:17', 'aakash_rajput@kalsym.com', 0, 4, 17, 12),
(37, -2, 92, '2021-02-16 16:51:57', 'mazhar@kalsym.com', 1, 0, NULL, 'Mazhar Iqbal', '$2y$10$aiofGfZt5RUp9L5wgod1o.T6CbddfXDB9F4f5t774Gsxw.j82lqQi', 'FabxLslS50CxYgwpi5YpejwUsBDW5Zf61W4Rsu8huQOU5ZMyaiM3UNkZYUmN', 1, 36, '2021-02-24 10:26:38', 'mazhar@kalsym.com', 0, 4, 18, 13),
(38, 1, 92, '2021-02-17 12:02:56', 'albert.ho@kalsym.com', 1, 0, NULL, 'Albert Ho', '$2y$10$Wplrbi0C561mIYBMU/6c7eiIToFab8pr3OyYq5mOUlbVpLwOZ8KEq', 'OFMmo0mIj4yOttlDbTR6O4HQgTF0coVo6nC4ctFjtbmw7rDJRset2cJecike', 1, 0, '2021-12-14 11:59:59', 'albert.ho@kalsym.com', 0, 4, 24, 12),
(39, -2, 60, '2021-03-01 11:30:13', 'taufik@kalsym.com', 0, 0, NULL, 'Mohd Taufik', '$2y$10$zQA9.KnsEL3UvSK1iFZZ8ONWXKuzenHzbscYhpcOOoJlfmBAsuKxy', NULL, 1, 38, '2021-03-01 11:32:51', 'taufik@kalsym.com', 0, 1, 25, 13),
(40, -2, 60, '2021-03-01 13:20:32', 'sk.ng@kalsym.com', 0, 0, NULL, 'Ng Sze Kiong', '$2y$10$XZY3AiUHlnMtYPYAgeW9CuWfYPe4HFx/uDb61QfJWsW8Z0.EY.8I.', NULL, 1, 38, '2021-03-01 13:20:32', 'sk.ng@kalsym.com', 0, 5, 26, 13),
(41, -2, 60, '2021-03-01 13:21:44', 'kumar@kalsym.com', 0, 0, NULL, 'Irasa Kumar', '$2y$10$XZY3AiUHlnMtYPYAgeW9CuWfYPe4HFx/uDb61QfJWsW8Z0.EY.8I.', NULL, 1, 38, '2021-03-01 13:21:44', 'kumar@kalsym.com', 0, 1, 7, 13),
(42, -2, 60, '2021-03-01 13:23:03', 'ishraf@kalsym.com', 0, 0, NULL, 'Mohd Ishraf', '$2y$10$X1TLTUh.dvi4Ojso4Attm.JFelINFq6iNjxPFPjKLeezTtCZqa0pS', NULL, 1, 38, '2021-03-01 13:23:03', 'ishraf@kalsym.com', 0, 1, 25, 13),
(43, -2, 60, '2021-03-01 13:25:28', 'nazrul@kalsym.com', 1, 0, NULL, 'Mohd Nazrul', '$2y$10$MoJr3Hse/PLUecvaCJdF0e2fSQ8QPIcyywfVHKDufbo1oxfBqCl2e', 'flotdfEmkrEpAWwl4d6Y6V3P4pj5ogVrS0Un9Hqt3SXAKZmRFUR4zsbLLVTi', 1, 38, '2021-03-01 17:14:32', 'nazrul@kalsym.com', 0, 1, 9, 13),
(44, 1, 60, '2021-03-01 13:29:11', 'kevin.lew@kalsym.com', 0, 0, NULL, 'Kevin Lew', '$2y$10$10PP6R5YqTR0cWMVlnzP2O2mwTCmyOUoqe2VIRc1hV9U6lTbyDTxK', NULL, 1, 0, '2021-03-01 13:29:11', 'kevin.lew@kalsym.com', 0, 4, 19, 12),
(45, -2, 60, '2021-03-01 13:31:41', 'adeline.john@kalsym.com', 0, 0, NULL, 'Adeline John', '$2y$10$Jlv/5bZpWlw2hA5OS9ocT.lT2OOazgP4mOQpVaKF5Czt5/7emnkzG', 'HozlLJ6tkuJqXCy9DNE1bOsUQwzQM5wn5gSZ0WQrCqMKBzG6bhOJLGdkWm54', 1, 44, '2021-03-01 14:15:55', 'adeline.john@kalsym.com', 0, 4, 27, 13),
(46, -2, 92, '2021-03-10 11:05:27', 'mirza@kalsym.com', 1, 0, NULL, 'Mirza Zaheer Ahmed', '$2y$10$DaKc9XjTXb7mgskhDteW4ugyCIx4.jT5x8pMZGp0tOHn7JtjaABd6', 'sDZ7YMil91XKdoSuQBOCvPsy77oGyLruwefRZzSOCTT0aiaO8Lz7Zj7DCtig', 1, 36, '2021-09-30 16:27:21', 'mirza@kalsym.com', 0, 3, 14, 13),
(47, -1, 92, '2021-03-10 11:08:21', 'rashid@kalsym.com', 1, 0, '2021-09-01 12:58:34', 'Muhammad Rashid Zafar', '$2y$10$j38RibyHuyyVrNRLIUC5cO47JghnIxN2dGwOOoBlM/gYGAbplySWC', 'BK3Ile4VN48jCLs23RvMUTwZ9fdCQXCNXCFTPsv81ocYozvxggTLJokERhEY', 1, 38, '2021-09-01 09:59:22', 'rashid@kalsym.com', 0, 6, 16, 13),
(48, -1, 92, '2021-03-10 11:09:26', 'uali@kalsym.com', 1, 0, NULL, 'Umair Ali Khan', '$2y$10$pA.RiTkvQYIu8RaNDXa97uXmylx59yBw4CHKJyx4DeVkUELVEHIUC', NULL, 1, 47, '2021-10-07 14:51:59', 'uali@kalsym.com', 0, 3, 15, 13),
(49, -2, 92, '2021-03-10 11:10:31', 'saba.sadaf@kalsym.com', 1, 0, NULL, 'Saba Sadaf', '$2y$10$zbSOK7vwL/EZVyNElzfVCOD9hTHXoImHGucIUPSrw83Y8LE0BIsw6', 'bqLsPtwFedKOzxtwVM5D07wxDaEh2GI7YzqNxcDX11abxLNmwQ2IHjFWbsaF', 1, 48, '2021-07-14 08:55:41', 'saba.sadaf@kalsym.com', 0, 3, 13, 13),
(50, -2, 92, '2021-03-10 11:12:02', 'hasnain@kalsym.com', 0, 0, NULL, 'Muhammad Hasnain', '$2y$10$6Jj43FppjBCEu0/00rpylOPWkRntvXC9Tg0pA3YamUVVG26/8b1oW', NULL, 1, 0, '2021-03-10 11:12:02', 'hasnain@kalsym.com', 0, 4, 20, 13),
(51, -2, 92, '2021-06-17 10:42:35', 'nadeem.arif@kalsym.com', 1, 0, '2021-10-01 00:35:23', 'Muhammad Nadeem Arif', '$2y$10$jFWB.Q2c2.3h8YLY0BiG0uKz1i6ciZERT102PuZBfySPj2yIh9hnK', 'Mck7bwgK6em9lwkySkAtGUPL2XzZ58ykKSmr5Q55FLBVrIecnMl1E3eSK97b', 1, 24, '2021-11-02 17:56:18', 'nadeem.arif@kalsym.com', 2, 1, 9, 13);

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
