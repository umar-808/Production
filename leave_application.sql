-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 01, 2022 at 07:01 AM
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
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `password`, `username`) VALUES
(1, 'admin', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `applicant`
--

CREATE TABLE `applicant` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `achievements` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `degree` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `school` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `years` int(11) NOT NULL,
  `file_id` bigint(20) UNSIGNED NOT NULL,
  `job_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `branch`
--

CREATE TABLE `branch` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `company_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `branch`
--

INSERT INTO `branch` (`id`, `name`, `company_id`) VALUES
(1, 'Islamabad', 1);

-- --------------------------------------------------------

--
-- Table structure for table `company`
--

CREATE TABLE `company` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `company`
--

INSERT INTO `company` (`id`, `name`) VALUES
(1, 'Kalsym');

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE `department` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(30) DEFAULT NULL,
  `branch_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`id`, `name`, `branch_id`) VALUES
(1, 'Products', 1),
(2, 'DevOps', 1),
(3, 'Business Development', 1),
(4, 'Management', 1),
(5, 'Alpha', 1),
(6, 'Sales', 1);

-- --------------------------------------------------------

--
-- Table structure for table `designation`
--

CREATE TABLE `designation` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `deptId` bigint(20) UNSIGNED NOT NULL,
  `designation` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `designation`
--

INSERT INTO `designation` (`id`, `deptId`, `designation`) VALUES
(1, 1, 'Software Engineer-I'),
(2, 1, 'Software Engineer-II'),
(3, 1, 'Lead Development'),
(4, 1, 'Head of Dept'),
(5, 2, 'Manager services and Software'),
(6, 2, 'Team Lead'),
(7, 5, 'System Engineer-I'),
(8, 5, 'System Engineer-II'),
(9, 2, 'Software Engineer-I'),
(10, 2, 'Software Engineer-II'),
(11, 2, 'DevOps Engineer'),
(12, 2, 'Lead DevOps'),
(13, 3, 'Key Account Manager'),
(14, 3, 'Pre-sales Manager'),
(15, 3, 'Bussiness Development Manager'),
(16, 6, 'VP Sales'),
(17, 4, 'Director'),
(18, 4, 'Manager Group Finance'),
(19, 4, 'Manager HR'),
(20, 4, 'Admin Assistant'),
(22, 5, 'Team lead'),
(23, 2, 'Robotic Engineer'),
(24, 4, 'CEO'),
(25, 1, 'Senior Software Engineer'),
(26, 5, 'Senior System Engineer'),
(27, 4, 'Accounts Executive');

-- --------------------------------------------------------

--
-- Table structure for table `file`
--

CREATE TABLE `file` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `data` longblob DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hibernate_sequence`
--

CREATE TABLE `hibernate_sequence` (
  `next_val` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `hibernate_sequence`
--

INSERT INTO `hibernate_sequence` (`next_val`) VALUES
(2);

-- --------------------------------------------------------

--
-- Table structure for table `job`
--

CREATE TABLE `job` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `description` varchar(512) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `department_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `job`
--

INSERT INTO `job` (`id`, `description`, `title`, `department_id`) VALUES
(1, 'Looking for a software engineer having 0-6 months of experience.', 'Software Engineer I', 1);

-- --------------------------------------------------------

--
-- Table structure for table `leaves`
--

CREATE TABLE `leaves` (
  `empId` bigint(20) UNSIGNED NOT NULL,
  `total` int(2) DEFAULT NULL,
  `sickAvailed` int(2) DEFAULT 0,
  `otherAvailed` int(2) DEFAULT 0,
  `annualAvailed` int(2) DEFAULT 0,
  `annualLeft` int(2) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `leaves`
--

INSERT INTO `leaves` (`empId`, `total`, `sickAvailed`, `otherAvailed`, `annualAvailed`, `annualLeft`) VALUES
(1, 15, 0, 1, 9, 6),
(25, 15, 0, 0, 1, 14),
(26, 15, 1, 0, 5, 10),
(27, 15, 0, 0, 1, 14),
(28, 15, 2, 0, 5, 10),
(31, 15, 0, 0, 1, 14),
(32, 15, 0, 0, 2, 13),
(33, 15, 1, 0, 0, 15),
(34, 15, 0, 1, 0, 15),
(35, 15, 0, 0, 5, 10),
(36, 15, 0, 0, 6, 9),
(37, 15, 7, 3, 5, 10),
(46, 15, 0, 1, 3, 12),
(47, 15, 0, 0, 10, 5);

-- --------------------------------------------------------

--
-- Table structure for table `leave_requests`
--

CREATE TABLE `leave_requests` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `empId` bigint(20) UNSIGNED NOT NULL COMMENT 'foreign key with references users',
  `created` date NOT NULL,
  `name` varchar(50) NOT NULL,
  `leaveDate` date NOT NULL,
  `return_date` date DEFAULT NULL,
  `leaves` int(2) NOT NULL,
  `reason` varchar(500) NOT NULL COMMENT 'reason of leave',
  `status` tinyint(1) DEFAULT 0 COMMENT '1-Approved by HOD, 2-Approve by Admin, 3- Disapproved by HOD, 4- Disapprove by admin, 0-Pending',
  `comment` varchar(500) DEFAULT NULL COMMENT 'approval/disapproval comment',
  `type` varchar(100) NOT NULL,
  `adminComment` varchar(200) DEFAULT NULL,
  `updated_at` date DEFAULT NULL,
  `lineManagerId` bigint(20) UNSIGNED NOT NULL DEFAULT 1,
  `attachment` varchar(100) DEFAULT NULL,
  `countryCode` int(4) NOT NULL DEFAULT 92,
  `time_period` varchar(10) DEFAULT NULL,
  `updated_id` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `leave_requests`
--

INSERT INTO `leave_requests` (`id`, `empId`, `created`, `name`, `leaveDate`, `return_date`, `leaves`, `reason`, `status`, `comment`, `type`, `adminComment`, `updated_at`, `lineManagerId`, `attachment`, `countryCode`, `time_period`, `updated_id`) VALUES
(47, 27, '2021-02-16', 'Sarosh Tariq', '2021-01-26', '2021-01-27', 1, 'Have to go Arif Wala for Personal task', 2, 'Approved', 'Anuual leave', 'Approved', NULL, 25, NULL, 92, NULL, NULL),
(48, 28, '2021-02-16', 'Faisal Hayat', '2021-01-26', '2021-01-27', 1, 'Have to visit Mardan for personal task', 2, 'Approved', 'Anuual leave', 'Approved', NULL, 25, NULL, 92, NULL, NULL),
(49, 28, '2021-02-16', 'Faisal Hayat', '2021-02-08', '2021-02-09', 1, 'Suffering from fever', 2, 'Approved', 'Sick leave (Illness or Injury)', 'Approved', NULL, 25, NULL, 92, NULL, NULL),
(50, 28, '2021-02-16', 'Faisal Hayat', '2021-02-10', '2021-02-11', 1, 'Suffering from fever', 2, 'Approved', 'Sick leave (Illness or Injury)', 'Approved', NULL, 25, NULL, 92, NULL, NULL),
(51, 31, '2021-02-16', 'Adeel Raza', '2021-01-21', '2021-01-22', 1, 'Have to take mother to hospital', 2, 'Approved', 'Anuual leave', 'Approved', NULL, 25, NULL, 92, NULL, NULL),
(52, 32, '2021-02-16', 'Asim Malik', '2021-01-01', '2021-01-04', 1, 'Personal Commitment', 2, 'Approved', 'Anuual leave', 'Approved', NULL, 25, NULL, 92, NULL, NULL),
(53, 32, '2021-02-16', 'Asim Malik', '2021-02-04', '2021-02-05', 1, 'House construction', 2, 'Approved', 'Anuual leave', 'Approved', NULL, 25, NULL, 92, NULL, NULL),
(54, 26, '2021-02-16', 'Wasim Ur Rehman', '2021-01-27', '2021-01-28', 1, 'Not feeling well', 2, 'Approved', 'Sick leave (Illness or Injury)', 'Approved', NULL, 25, NULL, 92, NULL, NULL),
(55, 26, '2021-02-16', 'Wasim Ur Rehman', '2021-02-15', '2021-02-16', 1, 'Visit to Lahore for personal commitment', 2, 'Approved', 'Anuual leave', 'Approved', NULL, 25, NULL, 92, NULL, NULL),
(56, 34, '2021-02-16', 'Nauman Shakil', '2021-01-11', '2021-01-11', 1, 'Death in family', 2, 'Approved', 'Leave on Compassionate Grounds (Nuclear family)', 'Approved', NULL, 26, NULL, 92, NULL, NULL),
(57, 35, '2021-02-16', 'Abdul Rehman', '2021-01-06', '2021-01-07', 1, 'Some personal committment', 2, 'Approved', 'Anuual leave', 'Approved', NULL, 26, NULL, 92, NULL, NULL),
(58, 35, '2021-02-16', 'Abdul Rehman', '2021-01-21', '2021-01-25', 2, 'Death in family', 2, 'Approved', 'Anuual leave', 'Approved', NULL, 26, NULL, 92, NULL, NULL),
(59, 35, '2021-02-16', 'Abdul Rehman', '2021-01-28', '2021-02-01', 2, 'Death in family', 2, 'Approved', 'Anuual leave', 'Approve', NULL, 26, NULL, 92, NULL, NULL),
(66, 28, '2021-02-23', 'Faisal Hayat', '2021-03-02', '2021-03-08', 4, 'Sister Wedding', 2, 'Good luck!', 'Anuual leave', 'congrats in advance', NULL, 25, '', 92, NULL, NULL),
(67, 36, '2021-02-23', 'Aakash Rajput', '2021-03-01', '2021-03-05', 4, 'Road Trip with Friends', 2, NULL, 'Anuual leave', 'approved and enjoy', NULL, 38, '', 92, NULL, NULL),
(68, 1, '2021-02-23', 'Muhammad Adnan', '2021-02-18', '2021-02-23', 5, 'brother-in-law marriage ceremony', 2, NULL, 'Anuual leave', 'approved', NULL, 36, '', 92, NULL, NULL),
(78, 37, '2021-02-24', 'Mazhar Iqbal', '2021-01-28', '2021-02-01', 2, 'Brother Marriage', 2, NULL, 'Anuual leave', 'approved', NULL, 36, '', 92, NULL, NULL),
(79, 37, '2021-02-24', 'Mazhar Iqbal', '2021-02-23', '2021-02-24', 1, 'Urgent Family Matter To Attend', 2, NULL, 'Leave on Compassionate Grounds (Nuclear family)', 'approved', NULL, 36, '', 92, NULL, NULL),
(83, 26, '2021-03-04', 'Wasim Ur Rehman', '2021-03-11', '2021-03-17', 4, '', 2, 'Chaawal le kar aana', 'Anuual leave', 'Pls follow the TL comment', NULL, 25, '', 92, NULL, NULL),
(84, 25, '2021-03-11', 'Muhammad Waqas', '2021-03-08', '2021-03-09', 1, 'Some work at home', 3, 'Sorry', 'Other', NULL, NULL, 23, '', 92, NULL, NULL),
(85, 1, '2021-03-17', 'Muhammad Adnan', '2021-03-22', '2021-03-23', 1, 'Family Trip to Hometown', 2, NULL, 'Anuual leave', 'Approved', NULL, 36, '', 92, NULL, NULL),
(86, 25, '2021-03-18', 'Muhammad Waqas', '2021-03-22', '2021-03-23', 1, 'Have to attend marriage of my close relative', 1, 'Approved', 'Anuual leave', NULL, NULL, 23, '', 92, NULL, NULL),
(87, 28, '2021-03-26', 'Faisal Hayat', '2021-03-26', '2021-03-29', 1, 'in hospital with my mother', 1, 'Approved', 'Jury duty or legal leave', NULL, NULL, 25, '', 92, NULL, NULL),
(88, 24, '2021-04-05', 'Zeeshan Ali', '2021-04-01', '2021-04-05', 2, '', 1, 'Approved', 'Other', NULL, NULL, 23, '', 92, NULL, NULL),
(89, 25, '2021-04-21', 'Muhammad Waqas', '2021-04-22', '2021-04-23', 1, 'Visit Doctor for daughter\'s checkup', 1, 'This was old leave already taken to had to approve it anyway.', 'Leave on Compassionate Grounds (Nuclear family)', NULL, NULL, 23, '', 92, NULL, NULL),
(90, 49, '2021-04-22', 'Saba Sadaf', '2021-04-22', '2021-04-23', 1, 'Half Day Leave', 0, NULL, 'Anuual leave', NULL, NULL, 48, '', 92, NULL, NULL),
(91, 26, '2021-04-23', 'Wasim Ur Rehman', '2021-04-23', '2021-04-26', 1, '', 1, 'Approved', 'Anuual leave', NULL, NULL, 25, '', 92, NULL, NULL),
(92, 27, '2021-04-23', 'Sarosh Tariq', '2021-04-23', '2021-04-26', 1, 'I slept through attendance.', 0, NULL, 'Anuual leave', NULL, NULL, 24, '', 92, NULL, NULL),
(93, 31, '2021-04-23', 'Adeel Raza', '2021-04-23', '2021-04-26', 1, '', 1, 'Approved', 'Leave on Compassionate Grounds (Nuclear family)', NULL, NULL, 25, '', 92, NULL, NULL),
(94, 36, '2021-04-23', 'Aakash Rajput', '2021-04-23', '2021-04-26', 1, '', 0, NULL, 'Anuual leave', NULL, NULL, 38, '', 92, NULL, NULL),
(95, 49, '2021-05-20', 'Saba Sadaf', '2021-05-20', '2021-05-24', 2, 'travelling to Karachi for 2 days will be back on Saturday 22 May-2021', 0, NULL, 'Anuual leave', NULL, NULL, 48, '', 92, NULL, NULL),
(96, 36, '2021-05-31', 'Aakash Rajput', '2021-06-07', '2021-06-09', 2, 'out station visit', 2, NULL, 'Anuual leave', '', NULL, 38, '', 92, NULL, NULL),
(97, 47, '2021-06-03', 'Muhammad Rashid Zafar', '2021-06-03', '2021-06-04', 1, '', 0, NULL, 'Other', NULL, NULL, 38, '', 92, NULL, NULL),
(98, 34, '2021-06-03', 'Nauman Shakil', '2021-06-07', '2021-06-08', 1, 'Need to visit schools for the admission of my daughter.', 1, 'Approved', 'Other', NULL, NULL, 26, '', 92, NULL, NULL),
(99, 47, '2021-06-11', 'Muhammad Rashid Zafar', '2021-06-11', '2021-06-14', 1, 'Sevior back pain after my muscle twist \r\nbed rest for 3 days', 0, NULL, 'Sick leave (Illness or Injury)', NULL, NULL, 38, 'leaves/47WhatsApp Image 2021-06-11 at 12.27.43_1623396604.jpeg', 92, NULL, NULL),
(100, 1, '2021-06-15', 'Muhammad Adnan', '2021-06-23', '2021-06-28', 3, 'out station visit - Northern Area', 2, NULL, 'Anuual leave', 'approved please close month a prepare payroll before going', NULL, 36, '', 92, NULL, NULL),
(101, 46, '2021-06-15', 'Mirza Zaheer Ahmed', '2021-06-16', '2021-06-17', 1, 'Family Engagement', 5, NULL, 'Jury duty or legal leave', NULL, '2021-06-15', 36, '', 92, NULL, NULL),
(102, 33, '2021-06-18', 'Fawad Tariq', '2021-06-18', '2021-06-21', 1, 'I am facing a medical issue.', 2, 'Approved', 'Sick leave (Illness or Injury)', '', NULL, 26, 'leaves/33IMG_20210618_103713-min_1623994952.jpg', 92, NULL, NULL),
(103, 35, '2021-06-18', 'Abdul Rehman', '2021-06-23', '2021-06-24', 1, 'Going out of the station.', 1, '', 'Other', NULL, NULL, 26, '', 92, NULL, NULL),
(104, 25, '2021-06-21', 'Muhammad Waqas', '2021-06-24', '2021-06-28', 2, 'Have to go for daughter\'s medical checkup', 1, 'Approved', 'Leave on Compassionate Grounds (Nuclear family)', NULL, NULL, 23, '', 92, NULL, NULL),
(105, 47, '2021-06-28', 'Muhammad Rashid Zafar', '2021-08-02', '2021-08-09', 5, '', 2, NULL, 'Anuual leave', '', NULL, 38, '', 92, NULL, NULL),
(106, 49, '2021-07-01', 'Saba Sadaf', '2021-07-01', '2021-07-05', 2, 'Going for 2 days trip with family friends but available on phone ..', 0, NULL, 'Anuual leave', NULL, NULL, 48, '', 92, NULL, NULL),
(107, 35, '2021-07-02', 'Abdul Rehman', '2021-06-28', '2021-07-01', 3, 'Death of Uncle', 1, 'approved', 'Other', NULL, NULL, 26, '', 92, NULL, NULL),
(108, 27, '2021-07-02', 'Sarosh Tariq', '2021-06-28', '2021-07-01', 3, 'Grandfather passed away.', 1, 'Approved', 'Leave on Compassionate Grounds (Nuclear family)', NULL, NULL, 24, '', 92, NULL, NULL),
(109, 37, '2021-07-02', 'Mazhar Iqbal', '2021-06-10', '2021-06-11', 1, 'Death in Inlaws', 2, NULL, 'Leave on Compassionate Grounds (Nuclear family)', 'aprroved', NULL, 36, '', 92, NULL, NULL),
(110, 37, '2021-07-02', 'Mazhar Iqbal', '2021-06-30', '2021-07-01', 1, 'Urgent Matter to Attend at Home', 2, NULL, 'Other', 'Approved', NULL, 36, '', 92, NULL, NULL),
(111, 37, '2021-07-02', 'Mazhar Iqbal', '2021-05-20', '2021-05-21', 1, '', 2, NULL, 'Sick leave (Illness or Injury)', 'Approved', NULL, 36, 'leaves/37New Microsoft Word Document_1625224126.docx', 92, NULL, NULL),
(112, 46, '2021-07-05', 'Mirza Zaheer Ahmed', '2021-07-09', '2021-07-12', 1, 'Family Engagement', 2, NULL, 'Anuual leave', 'Approved', NULL, 36, '', 92, NULL, NULL),
(113, 31, '2021-07-08', 'Adeel Raza', '2021-07-05', '2021-07-07', 2, 'Paternity Leave', 1, 'Approved', 'Leave on Compassionate Grounds (Nuclear family)', NULL, NULL, 25, '', 92, NULL, NULL),
(114, 31, '2021-07-08', 'Adeel Raza', '2021-07-09', '2021-07-12', 1, '', 1, 'Approved', 'Anuual leave', NULL, NULL, 25, '', 92, NULL, NULL),
(115, 29, '2021-07-09', 'Mohsin Ali', '2021-07-12', '2021-07-14', 2, 'Need to help parents with some stuff at home.', 1, '', 'Anuual leave', NULL, NULL, 24, '', 92, NULL, NULL),
(116, 1, '2021-07-09', 'Muhammad Adnan', '2021-07-12', '2021-07-13', 1, 'Wedding Ceremony in Family.', 2, NULL, 'Other', 'Approved', NULL, 36, '', 92, NULL, NULL),
(117, 49, '2021-07-14', 'Saba Sadaf', '2021-07-14', '2021-07-15', 1, 'Due to some family event going out of Islamabad.', 0, NULL, 'Anuual leave', NULL, NULL, 48, '', 92, NULL, NULL),
(118, 46, '2021-07-15', 'Mirza Zaheer Ahmed', '2021-07-16', '2021-07-19', 1, 'Family Engagement ( Visit Doctor)', 2, NULL, 'Other', '', NULL, 36, '', 92, NULL, NULL),
(119, 36, '2021-07-15', 'Aakash Rajput', '2021-07-12', '2021-07-15', 3, '', 0, NULL, 'Leave on Compassionate Grounds (Nuclear family)', NULL, NULL, 38, '', 92, NULL, NULL),
(120, 28, '2021-07-19', 'Faisal Hayat', '2021-07-23', '2021-07-26', 1, 'outstation visit', 0, NULL, 'Anuual leave', NULL, NULL, 25, '', 92, NULL, NULL),
(121, 51, '2021-07-19', 'Muhammad Nadeem Arif', '2021-07-23', '2021-07-26', 1, 'Recovering from Typhoid so need a little rest to recover. Also want to spend eid days with family.', 1, 'Approved', 'Anuual leave', NULL, NULL, 24, '', 92, NULL, NULL),
(122, 47, '2021-07-26', 'Muhammad Rashid Zafar', '2021-07-26', '2021-07-27', 1, 'i have to take my family for second dose of corona vaccine today at 11:00 am onwards.', 0, NULL, 'Jury duty or legal leave', NULL, NULL, 38, '', 92, NULL, NULL),
(123, 37, '2021-07-29', 'Mazhar Iqbal', '2021-07-27', '2021-07-28', 1, 'Bolts Excessive pain and bleeding', 2, NULL, 'Sick leave (Illness or Injury)', 'Approved', NULL, 36, 'leaves/37Bills_1627553220.jpg', 92, NULL, NULL),
(124, 26, '2021-08-02', 'Wasim Ur Rehman', '2021-08-05', '2021-08-06', 1, 'going to lahore', 1, 'Approved', 'Other', NULL, NULL, 25, '', 92, NULL, NULL),
(125, 51, '2021-08-03', 'Muhammad Nadeem Arif', '2021-08-03', '2021-08-04', 1, 'high fever with urinal infection', 1, 'Approved', 'Sick leave (Illness or Injury)', NULL, NULL, 24, 'leaves/511017d012-2aa2-4afd-a427-a07397f69bee_1627971976.jfif', 92, NULL, NULL),
(126, 47, '2021-08-04', 'Muhammad Rashid Zafar', '2021-08-16', '2021-08-23', 5, '', 2, NULL, 'Anuual leave', '', NULL, 38, '', 92, NULL, NULL),
(127, 27, '2021-08-04', 'Sarosh Tariq', '2021-07-29', '2021-07-30', 1, 'Went to university but got late and was there the whole day.', 0, NULL, 'Anuual leave', NULL, NULL, 24, '', 92, NULL, NULL),
(128, 37, '2021-08-09', 'Mazhar Iqbal', '2021-08-02', '2021-08-09', 5, 'Surgical Procedure Fistulotomy', 2, NULL, 'Sick leave (Illness or Injury)', 'Approved', NULL, 36, 'leaves/37Medical Details_0001_1628494709.jpg', 92, NULL, NULL),
(129, 25, '2021-08-13', 'Muhammad Waqas', '2021-08-13', '2021-08-16', 1, 'Not feeling well', 1, '', 'Sick leave (Illness or Injury)', NULL, NULL, 23, 'leaves/25IMG_20210813_120657-min_1628839232.jpg', 92, NULL, NULL),
(130, 47, '2021-09-01', 'Muhammad Rashid Zafar', '2021-09-01', '2021-09-03', 2, 'Soar Throat \r\nDry Cough\r\nTaking measures staying home', 0, NULL, 'Sick leave (Illness or Injury)', NULL, NULL, 38, 'leaves/47ml_1630472479.jfif', 92, NULL, NULL),
(131, 25, '2021-09-02', 'Muhammad Waqas', '2021-09-13', '2021-09-16', 3, 'Have some personal commitment', 0, NULL, 'Anuual leave', NULL, NULL, 23, '', 92, NULL, NULL),
(132, 34, '2021-09-09', 'Nauman Shakil', '2021-09-13', '2021-09-14', 1, 'Family concerns.', 0, NULL, 'Other', NULL, NULL, 48, '', 92, NULL, NULL),
(133, 46, '2021-09-15', 'Mirza Zaheer Ahmed', '2021-09-16', '2021-09-20', 2, 'Family Engagement', 2, NULL, 'Anuual leave', 'aprroved', NULL, 36, '', 92, NULL, NULL),
(134, 26, '2021-09-15', 'Wasim Ur Rehman', '2021-09-16', '2021-09-17', 1, '', 1, 'Approved', 'Other', NULL, NULL, 25, '', 92, NULL, NULL),
(135, 25, '2021-09-20', 'Muhammad Waqas', '2021-09-23', '2021-09-24', 1, 'Have to visit doctor for daughter\'s checkup', 2, NULL, 'Anuual leave', 'Ok', NULL, 23, '', 92, NULL, NULL),
(136, 37, '2021-09-29', 'Mazhar Iqbal', '2021-09-23', '2021-09-28', 3, 'Annual Leave acquired', 2, NULL, 'Annual leave', 'Approved', NULL, 36, '', 92, NULL, NULL),
(140, 27, '2021-10-01', 'Sarosh Tariq', '2021-10-01', '2021-10-10', 1, 'Have to go Arif Wala for Personal task', 2, 'Approved', 'Anuual leave', 'Approved', NULL, 25, NULL, 92, NULL, NULL),
(141, 34, '2021-10-04', 'Nauman Shakil', '2021-10-07', '2021-10-11', 2, 'Sister\\\'s Marriage.', 0, NULL, 'Annual leave', NULL, NULL, 48, '', 92, NULL, NULL),
(144, 30, '2021-10-04', 'Israr Ahmad', '2021-10-08', '2021-10-11', 1, 'family weeding ceremony', 1, 'Weeding nh Wedding hota hai :)', 'Other', NULL, '2021-10-04', 25, '', 92, 'Full Day', NULL),
(145, 51, '2021-10-04', 'Muhammad Nadeem Arif', '2021-10-01', '2021-10-04', 1, 'Relative died', 1, 'approved', 'Leave on Compassionate Grounds (Nuclear family)', NULL, NULL, 24, '', 92, 'Full Day', NULL),
(147, 24, '2021-10-05', 'Zeeshan Ali', '2021-10-25', '2021-11-01', 5, 'First wedding - Part-2 IA', 1, 'Happy wedding', 'Annual leave', NULL, NULL, 23, '', 92, 'Full Day', NULL),
(148, 24, '2021-10-05', 'Zeeshan Ali', '2021-10-18', '2021-10-25', 5, 'First wedding - Part-1 IA\r\n\r\napplying again with correct re-joining date', 0, NULL, 'Annual leave', NULL, NULL, 23, '', 92, 'Full Day', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `password_resets`
--

INSERT INTO `password_resets` (`email`, `token`, `created_at`, `id`) VALUES
('nadeem.arif@kalsym.com', '$2y$10$pOvpP0Q4VouvQgDqN4NyO.xL1LXl3ZSKffgUlzFF9bYZ2pb5UL2lq', '2021-10-04 10:10:47', 0);

-- --------------------------------------------------------

--
-- Table structure for table `team_lead`
--

CREATE TABLE `team_lead` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(30) NOT NULL,
  `deptId` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(765) NOT NULL,
  `username` varchar(765) NOT NULL,
  `password` varchar(765) NOT NULL,
  `access_type` int(11) NOT NULL COMMENT '1-Admin, 0-CSR',
  `status` int(11) NOT NULL DEFAULT 1 COMMENT '1-active , 0-inactive',
  `remember_token` varchar(300) DEFAULT NULL COMMENT 'yeh mein ne majboran kai ha',
  `is_change_pass` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0-not changed,1 changed',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `wrong_pass_count` tinyint(1) DEFAULT 0,
  `is_lock` tinyint(1) DEFAULT 0,
  `lock_expired` datetime DEFAULT NULL,
  `designationId` bigint(20) UNSIGNED NOT NULL,
  `prefix_id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(40) NOT NULL,
  `tlId` bigint(20) UNSIGNED DEFAULT NULL,
  `countryCode` int(2) NOT NULL DEFAULT 92 COMMENT '92-Pakistan, 60-Malysia',
  `departmentId` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `username`, `password`, `access_type`, `status`, `remember_token`, `is_change_pass`, `created_at`, `updated_at`, `wrong_pass_count`, `is_lock`, `lock_expired`, `designationId`, `prefix_id`, `email`, `tlId`, `countryCode`, `departmentId`) VALUES
(1, 'Muhammad Adnan', 'muhammad.adnan@kalsym.com', '$2y$10$e46pDdT4ay.aqZkv6ii6FerotEds.0IWa4Av97nbRPJySx2mYsLUy', 1, 1, 'tOMuSu821aQAtkVRyquOg1BzKtZ73dqp5oml5r64LfMdWYDUbZhkDJPoqSHm', 1, '2020-04-15 07:36:42', '2021-04-23 04:13:49', 0, 0, NULL, 1, 12, 'muhammad.adnan@kalsym.com', 36, 92, 4),
(23, 'Muhammad Shoaib Khalid', 'shoaib@kalsym.com', '$2y$10$lbJolCZYAsP7AtqZcT4Qu.ohqDfJr4PiV2pTyn0tenC5eQ/GmAPA6', 0, 1, '7HfKqz1ZNVtH06O811N6hY37pjttST7ZFhd2OUXQUwKArzN0rBYGxZVtfcsh', 1, '2021-02-16 07:19:12', '2021-06-21 07:00:44', 0, 0, NULL, 4, 12, 'shoaib@kalsym.com', 38, 92, 1),
(24, 'Zeeshan Ali', 'zeeshan.ali@kalsym.com', '$2y$10$1at7j.rX8yQJEgwWrzwLo.1wVo8.nkrmdBR8ctXu5nhG0saigQDay', -1, 1, 'mARDW54F0uxFKgKCORD8fA1GwteDWTDQPU82IEVTFiA8Q0Cw1erHDBvEsu9S', 1, '2021-02-16 07:21:59', '2021-07-23 05:05:29', 0, 0, '2021-07-02 19:07:36', 6, 13, 'zeeshan.ali@kalsym.com', 23, 92, 1),
(25, 'Muhammad Waqas', 'muhammad.waqas@kalsym.com', '$2y$10$379dO3/1wGMOvVbF/FVAmuCIsR9LKKmVRnmzVoVBc.pHJL7tJd7P6', 0, 1, 'xk9v94ulwwQzBw1ZXmkQl8GjMBvPXQZaRT95LhBiUFBMHrUJPqQoFrH5Hiym', 1, '2021-02-16 07:24:14', '2021-10-04 11:56:09', 0, 0, '2021-10-04 18:21:23', 5, 13, 'muhammad.waqas@kalsym.com', 23, 92, 2),
(26, 'Wasim Ur Rehman', 'wasim@kalsym.com', '$2y$10$fGPyO48HdqUXbiHuUdDrTekCIeLb7W5VGdVckTtF0bbTDtNQS6BUi', -1, 1, 'GXD2Ww6TxgWIG06v365aGnkVI5kh5iQUAvlBXUrUeQLfkANQ4YY4n6UKC9bI', 1, '2021-02-16 07:25:58', '2021-04-23 04:05:57', 0, 0, NULL, 6, 13, 'wasim@kalsym.com', 25, 92, 5),
(27, 'Sarosh Tariq', 'sarosh.tariq@kalsym.com', '$2y$10$gLxW1Nfp1ymVmE31lQf0Du2kYNZHAjaDrY2IAAoQVoKqjC9UF0tJK', -2, 1, 'cbAviOy33G5OHLJFKtxI6oCgBmxHEdc20Yeu4T9USn3OCitViVZDhnXblD3I', 1, '2021-02-16 07:27:52', '2021-07-02 04:17:34', 0, 0, NULL, 2, 13, 'sarosh.tariq@kalsym.com', 24, 92, 1),
(28, 'Faisal Hayat', 'faisal.hayat@kalsym.com', '$2y$10$hAiVfoRhfWPUWWTrwutvAueT9gCno8FovonzginEnwo33bYAo2bxq', -2, 1, '3ccSlqUEAQu8d52goqtu0uhh68KuVd0Zx3lf0x3zQBzwXO1cmJdvL1lGRmBG', 1, '2021-02-16 07:31:51', '2021-07-19 11:57:06', 1, 0, NULL, 9, 13, 'faisal.hayat@kalsym.com', 25, 92, 2),
(29, 'Mohsin Ali', 'mohsin.ali@kalsym.com', '$2y$10$mOx4vno2vlyZj8oNjltkReQW2gBP36giHQJuMlS5qTup5LROKROhC', -2, 1, 'lDXYppqmJgKvi6HfKNj697kYugcr8RzoLUroyKBDJOsqSqIgwfMuHbpPykoW', 1, '2021-02-16 07:34:21', '2021-09-09 09:47:56', 0, 0, '2021-09-06 15:26:17', 1, 13, 'mohsin.ali@kalsym.com', 24, 92, 1),
(30, 'Israr Ahmad', 'israr.ahmad@kalsym.com', '$2y$10$q1DePD6lE0xnqKd592SSR.WqRjmTQc3RObvZ18nazAWFyX3uxiJs.', -2, 1, 'qad2VlkS891Ow1r0DUTqJSqka1FtPitGgKLT9GckRXEFe1Hoa4A9EVbcgQG2', 1, '2021-02-16 07:35:35', '2021-10-04 10:40:22', 0, 0, NULL, 12, 13, 'israr.ahmad@kalsym.com', 25, 92, 2),
(31, 'Adeel Raza', 'adeel.raza@kalsym.com', '$2y$10$UXMuGdTWVYq4WCbmHVvTrupbiVoJ5XKIgcvAAhj.ELh/2Loktv7LK', -2, 1, 'XJooSt5xth0IOAfDXeOCAGYHeA9pjoDyNifJc2zau5V2PQPjdWa18t3XPtUe', 1, '2021-02-16 07:36:54', '2021-07-08 05:57:44', 3, 0, NULL, 11, 13, 'adeel.raza@kalsym.com', 25, 92, 2),
(32, 'Asim Malik', 'asim.malik@kalsym.com', '$2y$10$N6zh7iArx1gb4939E6z9R.qhm1ZBOxQKjGDR5YWKo9L6/DMKCOvfW', -2, 1, 'QBGQYqYWFHD9RgDBeBMb6is9vjsvABKCPcE4oF3EbcbicuREplycuaK6kVPD', 1, '2021-02-16 07:38:16', '2021-10-04 10:55:47', 0, 0, NULL, 11, 13, 'asim.malik@kalsym.com', 25, 92, 2),
(33, 'Fawad Tariq', 'fawad.tariq@kalsym.com', '$2y$10$vOIFDL9Xn.XVF/TvSaLXDePgbheFnAllr/xWbvgq1MsnrO4H5x07S', -2, 1, NULL, 1, '2021-02-16 07:40:04', '2021-06-18 05:32:54', 0, 0, '2021-06-18 13:30:00', 7, 13, 'fawad.tariq@kalsym.com', 26, 92, 5),
(34, 'Nauman Shakil', 'nauman.shakil@kalsym.com', '$2y$10$o9JKjN2kzU277e8P6W8z.eb0WKNtAQ59bLCr6iOysXKRJlv2QRZYS', -2, 1, 'Ih6g6HLCrtgrgV10aVpas68UAQsScGy6YkowBfdOi10SjQTEeODKddniMNcy', 1, '2021-02-16 07:41:11', '2021-10-04 04:45:46', 0, 0, NULL, 2, 13, 'nauman.shakil@kalsym.com', 48, 92, 3),
(35, 'Abdul Rehman', 'abdul.rehman@kalsym.com', '$2y$10$m.nwocOUjg/Ec0YqH8JW5ehfYXx1N6dlSVJhYJBKVnchnOtqCfApu', -2, 1, '7SSPl5MhVFHEZ5yMppoq0CaqtTDV2A6yLLYXDX4OZs4l96kc7ctDmPnH6Voa', 1, '2021-02-16 07:45:33', '2021-07-02 04:23:42', 2, 0, NULL, 8, 13, 'abdul.rehman@kalsym.com', 26, 92, 5),
(36, 'Aakash Rajput', 'aakash_rajput@kalsym.com', '$2y$10$6Ntuw9b4PE2elHBFa8VvRuUm/K5CjoJcVuRXkJMEWn2IJX5xUEBAG', 1, 1, '2mR3LaaSGPSHdSDoRbgTNsPK0Mn6JGrx6lJvxtEP9vsFOuiJndzesEu6L6pq', 1, '2021-02-16 11:50:51', '2021-09-02 03:10:02', 3, 0, NULL, 17, 12, 'aakash_rajput@kalsym.com', 38, 92, 4),
(37, 'Mazhar Iqbal', 'mazhar@kalsym.com', '$2y$10$aiofGfZt5RUp9L5wgod1o.T6CbddfXDB9F4f5t774Gsxw.j82lqQi', -2, 1, NULL, 1, '2021-02-16 11:51:57', '2021-02-24 05:26:38', 0, 0, NULL, 18, 13, 'mazhar@kalsym.com', 36, 92, 4),
(38, 'Albert Ho', 'albert.ho@kalsym.com', '$2y$10$UP66c2Vd3ycBfkK/7pGFzuEJsaY6hos3T7veYLpZxOR6Yp6GZUHlm', 1, 1, 'woEc8RfiwkDP1BWzq2ez6ecKMK0LkVD0STlz8y1rgnGdfk9uTChmxeU1gO2Z', 1, '2021-02-17 07:02:56', '2021-06-28 11:08:55', 0, 0, NULL, 24, 12, 'albert.ho@kalsym.com', 0, 92, 4),
(39, 'Mohd Taufik', 'taufik@kalsym.com', '$2y$10$zQA9.KnsEL3UvSK1iFZZ8ONWXKuzenHzbscYhpcOOoJlfmBAsuKxy', -2, 1, NULL, 0, '2021-03-01 06:30:13', '2021-03-01 06:32:51', 0, 0, NULL, 25, 13, 'taufik@kalsym.com', 38, 60, 1),
(40, 'Ng Sze Kiong', 'sk.ng@kalsym.com', '$2y$10$XZY3AiUHlnMtYPYAgeW9CuWfYPe4HFx/uDb61QfJWsW8Z0.EY.8I.', -2, 1, NULL, 0, '2021-03-01 08:20:32', '2021-03-01 08:20:32', 0, 0, NULL, 26, 13, 'sk.ng@kalsym.com', 38, 60, 5),
(41, 'Irasa Kumar', 'kumar@kalsym.com', '$2y$10$XZY3AiUHlnMtYPYAgeW9CuWfYPe4HFx/uDb61QfJWsW8Z0.EY.8I.', -2, 1, NULL, 0, '2021-03-01 08:21:44', '2021-03-01 08:21:44', 0, 0, NULL, 7, 13, 'kumar@kalsym.com', 38, 60, 1),
(42, 'Mohd Ishraf', 'ishraf@kalsym.com', '$2y$10$X1TLTUh.dvi4Ojso4Attm.JFelINFq6iNjxPFPjKLeezTtCZqa0pS', -2, 1, NULL, 0, '2021-03-01 08:23:03', '2021-03-01 08:23:03', 0, 0, NULL, 25, 13, 'ishraf@kalsym.com', 38, 60, 1),
(43, 'Mohd Nazrul', 'nazrul@kalsym.com', '$2y$10$MoJr3Hse/PLUecvaCJdF0e2fSQ8QPIcyywfVHKDufbo1oxfBqCl2e', -2, 1, 'flotdfEmkrEpAWwl4d6Y6V3P4pj5ogVrS0Un9Hqt3SXAKZmRFUR4zsbLLVTi', 1, '2021-03-01 08:25:28', '2021-03-01 12:14:32', 0, 0, NULL, 9, 13, 'nazrul@kalsym.com', 38, 60, 1),
(44, 'Kevin Lew', 'kevin.lew@kalsym.com', '$2y$10$10PP6R5YqTR0cWMVlnzP2O2mwTCmyOUoqe2VIRc1hV9U6lTbyDTxK', 1, 1, NULL, 0, '2021-03-01 08:29:11', '2021-03-01 08:29:11', 0, 0, NULL, 19, 12, 'kevin.lew@kalsym.com', 0, 60, 4),
(45, 'Adeline John', 'adeline.john@kalsym.com', '$2y$10$Jlv/5bZpWlw2hA5OS9ocT.lT2OOazgP4mOQpVaKF5Czt5/7emnkzG', -2, 1, 'HozlLJ6tkuJqXCy9DNE1bOsUQwzQM5wn5gSZ0WQrCqMKBzG6bhOJLGdkWm54', 0, '2021-03-01 08:31:41', '2021-03-01 09:15:55', 0, 0, NULL, 27, 13, 'adeline.john@kalsym.com', 44, 60, 4),
(46, 'Mirza Zaheer Ahmed', 'mirza@kalsym.com', '$2y$10$DaKc9XjTXb7mgskhDteW4ugyCIx4.jT5x8pMZGp0tOHn7JtjaABd6', -2, 1, 'sDZ7YMil91XKdoSuQBOCvPsy77oGyLruwefRZzSOCTT0aiaO8Lz7Zj7DCtig', 1, '2021-03-10 06:05:27', '2021-09-30 11:27:21', 0, 0, NULL, 14, 13, 'mirza@kalsym.com', 36, 92, 3),
(47, 'Muhammad Rashid Zafar', 'rashid@kalsym.com', '$2y$10$j38RibyHuyyVrNRLIUC5cO47JghnIxN2dGwOOoBlM/gYGAbplySWC', -1, 1, 'BK3Ile4VN48jCLs23RvMUTwZ9fdCQXCNXCFTPsv81ocYozvxggTLJokERhEY', 1, '2021-03-10 06:08:21', '2021-09-01 04:59:22', 0, 0, '2021-09-01 12:58:34', 16, 13, 'rashid@kalsym.com', 38, 92, 6),
(48, 'Umair Ali Khan', 'uali@kalsym.com', '$2y$10$RnwWQ5UBckdqVZ/PWDcqQuQYbPtHxMF1HwEfJy4W6guyYNwM72MOu', -1, 1, NULL, 0, '2021-03-10 06:09:26', '2021-03-10 06:09:26', 0, 0, NULL, 15, 13, 'uali@kalsym.com', 47, 92, 3),
(49, 'Saba Sadaf', 'saba.sadaf@kalsym.com', '$2y$10$zbSOK7vwL/EZVyNElzfVCOD9hTHXoImHGucIUPSrw83Y8LE0BIsw6', -2, 1, 'AZhv4BvbW3XIQQ87q4IJ7bU4E7WlFmr5ssip0WdeN8ArN5lU5Xlt6QhMFT4x', 1, '2021-03-10 06:10:31', '2021-07-14 03:55:41', 0, 0, NULL, 13, 13, 'saba.sadaf@kalsym.com', 48, 92, 3),
(50, 'Muhammad Hasnain', 'hasnain@kalsym.com', '$2y$10$6Jj43FppjBCEu0/00rpylOPWkRntvXC9Tg0pA3YamUVVG26/8b1oW', -2, 1, NULL, 0, '2021-03-10 06:12:02', '2021-03-10 06:12:02', 0, 0, NULL, 20, 13, 'hasnain@kalsym.com', 0, 92, 4),
(51, 'Muhammad Nadeem Arif', 'nadeem.arif@kalsym.com', '$2y$10$Xuw7pK.XzQi3mRI.xgZGU.HdcmStxgOpiG/cAEVKlNtv0s/9eYw/6', -2, 1, NULL, 1, '2021-06-17 05:42:35', '2021-10-04 10:13:45', 2, 0, '2021-10-01 00:35:23', 9, 13, 'nadeem.arif@kalsym.com', 24, 92, 1);

-- --------------------------------------------------------

--
-- Table structure for table `user_pass`
--

CREATE TABLE `user_pass` (
  `prefix_id` bigint(20) UNSIGNED NOT NULL,
  `prefix` varchar(20) NOT NULL,
  `password` varchar(100) DEFAULT NULL COMMENT 'ADMIN:Admin@123, CSR ADMIN: Admin@123, CSR: Csr@1234'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_pass`
--

INSERT INTO `user_pass` (`prefix_id`, `prefix`, `password`) VALUES
(12, 'ADMIN', 'Kalsym@123'),
(13, 'EMP', 'Kalsym@123');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `applicant`
--
ALTER TABLE `applicant`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK5d7h7p1eyo4v4t0by9axldlad` (`file_id`),
  ADD KEY `FKt74cl2p3amxj0ukd6ngwdryvl` (`job_id`);

--
-- Indexes for table `branch`
--
ALTER TABLE `branch`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UK_2qdmejoguc37exo9i2fjxb0qo` (`name`),
  ADD KEY `FK14f9k065wqeubl6tl0gdumcp5` (`company_id`);

--
-- Indexes for table `company`
--
ALTER TABLE `company`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UK_niu8sfil2gxywcru9ah3r4ec5` (`name`);

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKbjh7jsn9p35t0809q9ei5ox61` (`branch_id`);

--
-- Indexes for table `designation`
--
ALTER TABLE `designation`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_deptId_departement_id` (`deptId`);

--
-- Indexes for table `file`
--
ALTER TABLE `file`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `job`
--
ALTER TABLE `job`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKhn4ysm8p7xteitn89lhj5c3g7` (`department_id`);

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
  ADD KEY `FK_emp_users_id` (`empId`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `team_lead`
--
ALTER TABLE `team_lead`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_deptId_department_id` (`deptId`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_user_pass_prefix_id` (`prefix_id`),
  ADD KEY `fk_department_id` (`departmentId`),
  ADD KEY `FKoi4lhmcf9lprjxp2or149g07a` (`designationId`);

--
-- Indexes for table `user_pass`
--
ALTER TABLE `user_pass`
  ADD PRIMARY KEY (`prefix_id`),
  ADD UNIQUE KEY `UNIQUE` (`prefix`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `department`
--
ALTER TABLE `department`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `designation`
--
ALTER TABLE `designation`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `leave_requests`
--
ALTER TABLE `leave_requests`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=149;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT for table `user_pass`
--
ALTER TABLE `user_pass`
  MODIFY `prefix_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `applicant`
--
ALTER TABLE `applicant`
  ADD CONSTRAINT `FK5d7h7p1eyo4v4t0by9axldlad` FOREIGN KEY (`file_id`) REFERENCES `file` (`id`),
  ADD CONSTRAINT `FKt74cl2p3amxj0ukd6ngwdryvl` FOREIGN KEY (`job_id`) REFERENCES `job` (`id`);

--
-- Constraints for table `branch`
--
ALTER TABLE `branch`
  ADD CONSTRAINT `FK14f9k065wqeubl6tl0gdumcp5` FOREIGN KEY (`company_id`) REFERENCES `company` (`id`);

--
-- Constraints for table `department`
--
ALTER TABLE `department`
  ADD CONSTRAINT `FKbjh7jsn9p35t0809q9ei5ox61` FOREIGN KEY (`branch_id`) REFERENCES `branch` (`id`);

--
-- Constraints for table `designation`
--
ALTER TABLE `designation`
  ADD CONSTRAINT `FK_deptId_departement_id` FOREIGN KEY (`deptId`) REFERENCES `department` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `job`
--
ALTER TABLE `job`
  ADD CONSTRAINT `FKhn4ysm8p7xteitn89lhj5c3g7` FOREIGN KEY (`department_id`) REFERENCES `department` (`id`);

--
-- Constraints for table `leaves`
--
ALTER TABLE `leaves`
  ADD CONSTRAINT `FK_empId_users_id` FOREIGN KEY (`empId`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `leave_requests`
--
ALTER TABLE `leave_requests`
  ADD CONSTRAINT `FK_emp_users_id` FOREIGN KEY (`empId`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `team_lead`
--
ALTER TABLE `team_lead`
  ADD CONSTRAINT `FK_deptId_department_id` FOREIGN KEY (`deptId`) REFERENCES `department` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_id_users_id` FOREIGN KEY (`id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `FKoi4lhmcf9lprjxp2or149g07a` FOREIGN KEY (`designationId`) REFERENCES `designation` (`id`),
  ADD CONSTRAINT `fk_department_id` FOREIGN KEY (`departmentId`) REFERENCES `department` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_user_pass_prefix_id` FOREIGN KEY (`prefix_id`) REFERENCES `user_pass` (`prefix_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
