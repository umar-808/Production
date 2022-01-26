-- MySQL dump 10.13  Distrib 5.7.27, for Linux (x86_64)
--
-- Host: localhost    Database: demo_leave_application
-- ------------------------------------------------------
-- Server version	5.7.27

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `department` (
  `id` int(2) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT INTO `department` VALUES (1,'Products'),(2,'DevOps'),(3,'Bussiness Development'),(4,'Management'),(5,'Alpha'),(6,'Sales');
/*!40000 ALTER TABLE `department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `designation`
--

DROP TABLE IF EXISTS `designation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `designation` (
  `id` int(2) unsigned NOT NULL AUTO_INCREMENT,
  `deptId` int(2) unsigned NOT NULL,
  `designation` varchar(30) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_deptId_departement_id` (`deptId`),
  CONSTRAINT `FK_deptId_departement_id` FOREIGN KEY (`deptId`) REFERENCES `department` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `designation`
--

LOCK TABLES `designation` WRITE;
/*!40000 ALTER TABLE `designation` DISABLE KEYS */;
INSERT INTO `designation` VALUES (1,1,'Software Engineer-I'),(2,1,'Software Engineer-II'),(3,1,'Lead Development'),(4,1,'Head of Dept'),(5,2,'Manager services and Software'),(6,2,'Team Lead'),(7,5,'System Engineer-I'),(8,5,'System Engineer-II'),(9,2,'Software Engineer-I'),(10,2,'Software Engineer-II'),(11,2,'DevOps Engineer'),(12,2,'Lead DevOps'),(13,3,'Key Account Manager'),(14,3,'Pre-sales Manager'),(15,3,'Bussiness Development Manager'),(16,6,'VP Sales'),(17,4,'Director'),(18,4,'Manager Group Finance'),(19,4,'Manager HR'),(20,4,'Admin Assistant'),(22,5,'Team lead'),(23,2,'Robotic Engineer'),(24,4,'CEO'),(25,1,'Senior Software Engineer'),(26,5,'Senior System Engineer'),(27,4,'Accounts Executive');
/*!40000 ALTER TABLE `designation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `leave_requests`
--

DROP TABLE IF EXISTS `leave_requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `leave_requests` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `empId` int(10) unsigned NOT NULL COMMENT 'foreign key with references users',
  `created` date NOT NULL,
  `name` varchar(50) NOT NULL,
  `leaveDate` date NOT NULL,
  `return_date` date DEFAULT NULL,
  `leaves` int(2) NOT NULL,
  `reason` varchar(500) NOT NULL COMMENT 'reason of leave',
  `status` tinyint(1) DEFAULT '0' COMMENT '1-Approved by HOD, 2-Approve by Admin, 3- Disapproved by HOD, 4- Disapprove by admin, 0-Pending',
  `comment` varchar(500) DEFAULT NULL COMMENT 'approval/disapproval comment',
  `type` varchar(100) NOT NULL,
  `adminComment` varchar(200) DEFAULT NULL,
  `updated_at` date DEFAULT NULL,
  `lineManagerId` int(2) NOT NULL DEFAULT '1',
  `attachment` varchar(100) DEFAULT NULL,
  `countryCode` int(4) NOT NULL DEFAULT '92',
  `time_period` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_emp_users_id` (`empId`),
  CONSTRAINT `FK_emp_users_id` FOREIGN KEY (`empId`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=180 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leave_requests`
--

LOCK TABLES `leave_requests` WRITE;
/*!40000 ALTER TABLE `leave_requests` DISABLE KEYS */;
INSERT INTO `leave_requests` VALUES (47,27,'2021-02-16','Sarosh Tariq','2021-01-26','2021-01-27',1,'Have to go Arif Wala for Personal task',2,'Approved','Anuual leave','Approved',NULL,25,NULL,92,NULL),(48,28,'2021-02-16','Faisal Hayat','2021-01-26','2021-01-27',1,'Have to visit Mardan for personal task',2,'Approved','Anuual leave','Approved',NULL,25,NULL,92,NULL),(49,28,'2021-02-16','Faisal Hayat','2021-02-08','2021-02-09',1,'Suffering from fever',2,'Approved','Sick leave (Illness or Injury)','Approved',NULL,25,NULL,92,NULL),(50,28,'2021-02-16','Faisal Hayat','2021-02-10','2021-02-11',1,'Suffering from fever',2,'Approved','Sick leave (Illness or Injury)','Approved',NULL,25,NULL,92,NULL),(51,31,'2021-02-16','Adeel Raza','2021-01-21','2021-01-22',1,'Have to take mother to hospital',2,'Approved','Anuual leave','Approved',NULL,25,NULL,92,NULL),(52,32,'2021-02-16','Asim Malik','2021-01-01','2021-01-04',1,'Personal Commitment',2,'Approved','Anuual leave','Approved',NULL,25,NULL,92,NULL),(53,32,'2021-02-16','Asim Malik','2021-02-04','2021-02-05',1,'House construction',2,'Approved','Anuual leave','Approved',NULL,25,NULL,92,NULL),(54,26,'2021-02-16','Wasim Ur Rehman','2021-01-27','2021-01-28',1,'Not feeling well',2,'Approved','Sick leave (Illness or Injury)','Approved',NULL,25,NULL,92,NULL),(55,26,'2021-02-16','Wasim Ur Rehman','2021-02-15','2021-02-16',1,'Visit to Lahore for personal commitment',2,'Approved','Anuual leave','Approved',NULL,25,NULL,92,NULL),(56,34,'2021-02-16','Nauman Shakil','2021-01-11','2021-01-11',1,'Death in family',2,'Approved','Leave on Compassionate Grounds (Nuclear family)','Approved',NULL,26,NULL,92,NULL),(57,35,'2021-02-16','Abdul Rehman','2021-01-06','2021-01-07',1,'Some personal committment',2,'Approved','Anuual leave','Approved',NULL,26,NULL,92,NULL),(58,35,'2021-02-16','Abdul Rehman','2021-01-21','2021-01-25',2,'Death in family',2,'Approved','Anuual leave','Approved',NULL,26,NULL,92,NULL),(59,35,'2021-02-16','Abdul Rehman','2021-01-28','2021-02-01',2,'Death in family',2,'Approved','Anuual leave','Approve',NULL,26,NULL,92,NULL),(66,28,'2021-02-23','Faisal Hayat','2021-03-02','2021-03-08',4,'Sister Wedding',2,'Good luck!','Anuual leave','congrats in advance',NULL,25,'',92,NULL),(67,36,'2021-02-23','Aakash Rajput','2021-03-01','2021-03-05',4,'Road Trip with Friends',2,NULL,'Anuual leave','approved and enjoy',NULL,38,'',92,NULL),(68,1,'2021-02-23','Muhammad Adnan','2021-02-18','2021-02-23',5,'brother-in-law marriage ceremony',2,NULL,'Anuual leave','approved',NULL,36,'',92,NULL),(78,37,'2021-02-24','Mazhar Iqbal','2021-01-28','2021-02-01',2,'Brother Marriage',2,NULL,'Anuual leave','approved',NULL,36,'',92,NULL),(79,37,'2021-02-24','Mazhar Iqbal','2021-02-23','2021-02-24',1,'Urgent Family Matter To Attend',2,NULL,'Leave on Compassionate Grounds (Nuclear family)','approved',NULL,36,'',92,NULL),(83,26,'2021-03-04','Wasim Ur Rehman','2021-03-11','2021-03-17',4,'',2,'Chaawal le kar aana','Anuual leave','Pls follow the TL comment',NULL,25,'',92,NULL),(84,25,'2021-03-11','Muhammad Waqas','2021-03-08','2021-03-09',1,'Some work at home',4,'Sorry','Other','Coordinate with TL',NULL,23,'',92,NULL),(85,1,'2021-03-17','Muhammad Adnan','2021-03-22','2021-03-23',1,'Family Trip to Hometown',2,NULL,'Anuual leave','Approved',NULL,36,'',92,NULL),(86,25,'2021-03-18','Muhammad Waqas','2021-03-22','2021-03-23',1,'Have to attend marriage of my close relative',2,'Approved','Anuual leave','Ok',NULL,23,'',92,NULL),(87,28,'2021-03-26','Faisal Hayat','2021-03-26','2021-03-29',1,'in hospital with my mother',2,'Approved','Jury duty or legal leave','Ok',NULL,25,'',92,NULL),(88,24,'2021-04-05','Zeeshan Ali','2021-04-01','2021-04-05',2,'',2,'Approved','Other','Ok',NULL,23,'',92,NULL),(89,25,'2021-04-21','Muhammad Waqas','2021-04-22','2021-04-23',1,'Visit Doctor for daughter\'s checkup',2,'This was old leave already taken to had to approve it anyway.','Leave on Compassionate Grounds (Nuclear family)','Ok',NULL,23,'',92,NULL),(90,49,'2021-04-22','Saba Sadaf','2021-04-22','2021-04-23',1,'Half Day Leave',2,NULL,'Anuual leave','',NULL,48,'',92,NULL),(91,26,'2021-04-23','Wasim Ur Rehman','2021-04-23','2021-04-26',1,'',2,'Approved','Anuual leave','',NULL,25,'',92,NULL),(92,27,'2021-04-23','Sarosh Tariq','2021-04-23','2021-04-26',1,'I slept through attendance.',2,NULL,'Anuual leave','',NULL,24,'',92,NULL),(93,31,'2021-04-23','Adeel Raza','2021-04-23','2021-04-26',1,'',2,'Approved','Leave on Compassionate Grounds (Nuclear family)','Approved',NULL,25,'',92,NULL),(94,36,'2021-04-23','Aakash Rajput','2021-04-23','2021-04-26',1,'',2,NULL,'Anuual leave','',NULL,38,'',92,NULL),(95,49,'2021-05-20','Saba Sadaf','2021-05-20','2021-05-24',2,'travelling to Karachi for 2 days will be back on Saturday 22 May-2021',2,NULL,'Anuual leave','',NULL,48,'',92,NULL),(96,36,'2021-05-31','Aakash Rajput','2021-06-07','2021-06-09',2,'out station visit',2,NULL,'Anuual leave','',NULL,38,'',92,NULL),(97,47,'2021-06-03','Muhammad Rashid Zafar','2021-06-03','2021-06-04',1,'',2,NULL,'Other','',NULL,38,'',92,NULL),(98,34,'2021-06-03','Nauman Shakil','2021-06-07','2021-06-08',1,'Need to visit schools for the admission of my daughter.',2,'Approved','Other','',NULL,26,'',92,NULL),(99,47,'2021-06-11','Muhammad Rashid Zafar','2021-06-11','2021-06-14',1,'Sevior back pain after my muscle twist \r\nbed rest for 3 days',2,NULL,'Sick leave (Illness or Injury)','',NULL,38,'leaves/47WhatsApp Image 2021-06-11 at 12.27.43_1623396604.jpeg',92,NULL),(100,1,'2021-06-15','Muhammad Adnan','2021-06-23','2021-06-28',3,'out station visit - Northern Area',2,NULL,'Anuual leave','approved please close month a prepare payroll before going',NULL,36,'',92,NULL),(101,46,'2021-06-15','Mirza Zaheer Ahmed','2021-06-16','2021-06-17',1,'Family Engagement',5,NULL,'Jury duty or legal leave',NULL,'2021-06-15',36,'',92,NULL),(102,33,'2021-06-18','Fawad Tariq','2021-06-18','2021-06-21',1,'I am facing a medical issue.',2,'Approved','Sick leave (Illness or Injury)','',NULL,26,'leaves/33IMG_20210618_103713-min_1623994952.jpg',92,NULL),(103,35,'2021-06-18','Abdul Rehman','2021-06-23','2021-06-24',1,'Going out of the station.',2,'','Other','',NULL,26,'',92,NULL),(104,25,'2021-06-21','Muhammad Waqas','2021-06-24','2021-06-28',2,'Have to go for daughter\'s medical checkup',2,'Approved','Leave on Compassionate Grounds (Nuclear family)','',NULL,23,'',92,NULL),(105,47,'2021-06-28','Muhammad Rashid Zafar','2021-08-02','2021-08-09',5,'',2,NULL,'Anuual leave','',NULL,38,'',92,NULL),(106,49,'2021-07-01','Saba Sadaf','2021-07-01','2021-07-05',2,'Going for 2 days trip with family friends but available on phone ..',2,NULL,'Anuual leave','',NULL,48,'',92,NULL),(107,35,'2021-07-02','Abdul Rehman','2021-06-28','2021-07-01',3,'Death of Uncle',2,'approved','Other','',NULL,26,'',92,NULL),(108,27,'2021-07-02','Sarosh Tariq','2021-06-28','2021-07-01',3,'Grandfather passed away.',2,'Approved','Leave on Compassionate Grounds (Nuclear family)','',NULL,24,'',92,NULL),(109,37,'2021-07-02','Mazhar Iqbal','2021-06-10','2021-06-11',1,'Death in Inlaws',2,NULL,'Leave on Compassionate Grounds (Nuclear family)','aprroved',NULL,36,'',92,NULL),(110,37,'2021-07-02','Mazhar Iqbal','2021-06-30','2021-07-01',1,'Urgent Matter to Attend at Home',2,NULL,'Other','Approved',NULL,36,'',92,NULL),(111,37,'2021-07-02','Mazhar Iqbal','2021-05-20','2021-05-21',1,'',2,NULL,'Sick leave (Illness or Injury)','Approved',NULL,36,'leaves/37New Microsoft Word Document_1625224126.docx',92,NULL),(112,46,'2021-07-05','Mirza Zaheer Ahmed','2021-07-09','2021-07-12',1,'Family Engagement',2,NULL,'Anuual leave','Approved',NULL,36,'',92,NULL),(113,31,'2021-07-08','Adeel Raza','2021-07-05','2021-07-07',2,'Paternity Leave',2,'Approved','Leave on Compassionate Grounds (Nuclear family)','',NULL,25,'',92,NULL),(114,31,'2021-07-08','Adeel Raza','2021-07-09','2021-07-12',1,'',2,'Approved','Anuual leave','',NULL,25,'',92,NULL),(115,29,'2021-07-09','Mohsin Ali','2021-07-12','2021-07-14',2,'Need to help parents with some stuff at home.',2,'','Anuual leave','',NULL,24,'',92,NULL),(116,1,'2021-07-09','Muhammad Adnan','2021-07-12','2021-07-13',1,'Wedding Ceremony in Family.',2,NULL,'Other','Approved',NULL,36,'',92,NULL),(117,49,'2021-07-14','Saba Sadaf','2021-07-14','2021-07-15',1,'Due to some family event going out of Islamabad.',2,NULL,'Anuual leave','',NULL,48,'',92,NULL),(118,46,'2021-07-15','Mirza Zaheer Ahmed','2021-07-16','2021-07-19',1,'Family Engagement ( Visit Doctor)',2,NULL,'Other','',NULL,36,'',92,NULL),(119,36,'2021-07-15','Aakash Rajput','2021-07-12','2021-07-15',3,'',2,NULL,'Leave on Compassionate Grounds (Nuclear family)','',NULL,38,'',92,NULL),(120,28,'2021-07-19','Faisal Hayat','2021-07-23','2021-07-26',1,'outstation visit',4,'Not needed','Anuual leave','Cancelled',NULL,25,'',92,NULL),(121,51,'2021-07-19','Muhammad Nadeem Arif','2021-07-23','2021-07-26',1,'Recovering from Typhoid so need a little rest to recover. Also want to spend eid days with family.',2,'Approved','Anuual leave','',NULL,24,'',92,NULL),(122,47,'2021-07-26','Muhammad Rashid Zafar','2021-07-26','2021-07-27',1,'i have to take my family for second dose of corona vaccine today at 11:00 am onwards.',2,NULL,'Jury duty or legal leave','',NULL,38,'',92,NULL),(123,37,'2021-07-29','Mazhar Iqbal','2021-07-27','2021-07-28',1,'Bolts Excessive pain and bleeding',2,NULL,'Sick leave (Illness or Injury)','Approved',NULL,36,'leaves/37Bills_1627553220.jpg',92,NULL),(124,26,'2021-08-02','Wasim Ur Rehman','2021-08-05','2021-08-06',1,'going to lahore',2,'Approved','Other','',NULL,25,'',92,NULL),(125,51,'2021-08-03','Muhammad Nadeem Arif','2021-08-03','2021-08-04',1,'high fever with urinal infection',2,'Approved','Sick leave (Illness or Injury)','',NULL,24,'leaves/511017d012-2aa2-4afd-a427-a07397f69bee_1627971976.jfif',92,NULL),(126,47,'2021-08-04','Muhammad Rashid Zafar','2021-08-16','2021-08-23',5,'',2,NULL,'Anuual leave','',NULL,38,'',92,NULL),(127,27,'2021-08-04','Sarosh Tariq','2021-07-29','2021-07-30',1,'Went to university but got late and was there the whole day.',2,NULL,'Anuual leave','',NULL,24,'',92,NULL),(128,37,'2021-08-09','Mazhar Iqbal','2021-08-02','2021-08-09',5,'Surgical Procedure Fistulotomy',2,NULL,'Sick leave (Illness or Injury)','Approved',NULL,36,'leaves/37Medical Details_0001_1628494709.jpg',92,NULL),(129,25,'2021-08-13','Muhammad Waqas','2021-08-13','2021-08-16',1,'Not feeling well',2,'','Sick leave (Illness or Injury)','',NULL,23,'leaves/25IMG_20210813_120657-min_1628839232.jpg',92,NULL),(130,47,'2021-09-01','Muhammad Rashid Zafar','2021-09-01','2021-09-03',2,'Soar Throat \r\nDry Cough\r\nTaking measures staying home',2,NULL,'Sick leave (Illness or Injury)','',NULL,38,'leaves/47ml_1630472479.jfif',92,NULL),(131,25,'2021-09-02','Muhammad Waqas','2021-09-13','2021-09-16',3,'Have some personal commitment',5,NULL,'Anuual leave','','2021-10-11',23,'',92,NULL),(132,34,'2021-09-09','Nauman Shakil','2021-09-13','2021-09-14',1,'Family concerns.',2,NULL,'Other','',NULL,48,'',92,NULL),(133,46,'2021-09-15','Mirza Zaheer Ahmed','2021-09-16','2021-09-20',2,'Family Engagement',2,NULL,'Anuual leave','aprroved',NULL,36,'',92,NULL),(134,26,'2021-09-15','Wasim Ur Rehman','2021-09-16','2021-09-17',1,'',2,'Approved','Other','',NULL,25,'',92,NULL),(135,25,'2021-09-20','Muhammad Waqas','2021-09-23','2021-09-24',1,'Have to visit doctor for daughter\'s checkup',2,NULL,'Anuual leave','Ok',NULL,23,'',92,NULL),(136,37,'2021-09-29','Mazhar Iqbal','2021-09-23','2021-09-28',3,'Annual Leave acquired',2,NULL,'Annual leave','Approved',NULL,36,'',92,NULL),(140,27,'2021-10-01','Sarosh Tariq','2021-10-01','2021-10-10',1,'Have to go Arif Wala for Personal task',2,'Approved','Anuual leave','Approved',NULL,25,NULL,92,NULL),(141,34,'2021-10-04','Nauman Shakil','2021-10-07','2021-10-11',2,'Sister\\\'s Marriage.',2,'Approved','Annual leave','',NULL,48,'',92,NULL),(144,30,'2021-10-04','Israr Ahmad','2021-10-08','2021-10-11',1,'family weeding ceremony',2,'Weeding nh Wedding hota hai :)','Other','','2021-10-04',25,'',92,'Full Day'),(145,51,'2021-10-04','Muhammad Nadeem Arif','2021-10-01','2021-10-04',1,'Relative died',2,'approved','Leave on Compassionate Grounds (Nuclear family)','',NULL,24,'',92,'Full Day'),(147,24,'2021-10-05','Zeeshan Ali','2021-10-25','2021-11-01',5,'First wedding - Part-2 IA',2,'Happy wedding','Annual leave','Ok',NULL,23,'',92,'Full Day'),(148,24,'2021-10-05','Zeeshan Ali','2021-10-18','2021-10-25',5,'First wedding - Part-1 IA\r\n\r\napplying again with correct re-joining date',2,NULL,'Annual leave','',NULL,23,'',92,'Full Day'),(149,46,'2021-10-07','Mirza Zaheer Ahmed','2021-10-08','2021-10-11',1,'Family Wedding',2,NULL,'Other','Approved',NULL,36,'',92,'Full Day'),(150,32,'2021-10-11','Asim Malik','2021-10-08','2021-10-11',1,'Had to go Lahore in urgency for personal commitment',2,'Approved','Other','',NULL,25,'',92,'Full Day'),(151,23,'2021-10-11','Muhammad Shoaib Khalid','2021-11-19','2021-11-22',1,'',2,NULL,'Jury duty or legal leave','',NULL,38,'',92,'Full Day'),(152,25,'2021-10-11','Muhammad Waqas','2021-09-06','2021-09-09',3,'Some personal committment',2,'approved','Annual leave','OK',NULL,23,'',92,'Full Day'),(153,37,'2021-10-12','Mazhar Iqbal','2021-10-07','2021-10-08',1,'Family Emergency',2,NULL,'Other','Approved',NULL,36,'',92,'Full Day'),(154,35,'2021-10-13','Abdul Rehman','2021-10-14','2021-10-15',1,'Going to Lahore for one day.',2,'Approved','Other','',NULL,26,'',92,'Full Day'),(155,36,'2021-10-14','Aakash Rajput','2021-10-18','2021-10-19',1,'',2,NULL,'Other','',NULL,38,'',92,'Full Day'),(156,51,'2021-11-02','Muhammad Nadeem Arif','2021-11-01','2021-11-02',1,'Went for the admission of younger brother.',2,'approved','Leave on Compassionate Grounds (Nuclear family)','',NULL,24,'',92,'PM'),(157,33,'2021-11-04','Fawad Tariq','2021-11-04','2021-11-05',1,'I am feeling fever and cough.',2,'Approved. Get well soon','Sick leave (Illness or Injury)','Take Care',NULL,26,'leaves/33Prescription _1636012304.pdf',92,'Full Day'),(158,24,'2021-11-04','Zeeshan Ali','2021-11-05','2021-11-08',1,'Have to go susral',2,NULL,'Leave on Compassionate Grounds (Nuclear family)','',NULL,23,'',92,'Full Day'),(159,33,'2021-11-05','Fawad Tariq','2021-11-05','2021-11-08',1,'I have fever and cough',2,'Approved','Sick leave (Illness or Injury)','Take Care',NULL,26,'leaves/33Prescription _1636082093.pdf',92,'Full Day'),(160,26,'2021-11-05','Wasim Ur Rehman','2021-11-08','2021-11-09',1,'',2,'Moj karo','Other','',NULL,25,'',92,'Full Day'),(161,34,'2021-11-08','Nauman Shakil','2021-11-15','2021-11-16',1,'Have to attend the marriage of my cousin.',2,NULL,'Other','Approved',NULL,48,'',92,'Full Day'),(162,35,'2021-11-09','Abdul Rehman','2021-11-11','2021-11-12',1,'Wedding in Family',2,'Approved','Other','Ok Approved',NULL,26,'',92,'Full Day'),(163,46,'2021-11-09','Mirza Zaheer Ahmed','2021-11-10','2021-11-11',1,'urgent Piece of Work',2,NULL,'Other','Approved',NULL,36,'',92,'Full Day'),(164,25,'2021-11-11','Muhammad Waqas','2021-11-19','2021-11-22',1,'Personal Commitment',2,NULL,'Annual leave','Ok',NULL,23,'',92,'Full Day'),(165,24,'2021-11-11','Zeeshan Ali','2021-11-12','2021-11-16',2,'Have to go Gujranwala',2,NULL,'Leave on Compassionate Grounds (Nuclear family)','Ok',NULL,23,'',92,'Full Day'),(166,32,'2021-11-12','Asim Malik','2021-11-17','2021-11-18',1,'marriage ceremony of my cuzn',2,'He didn\\\'t go for leave','Leave on Compassionate Grounds (Nuclear family)','',NULL,25,'',92,'Full Day'),(167,26,'2021-11-18','Wasim Ur Rehman','2021-11-18','2021-11-19',1,'going to attend Kids school meeting.',2,'Approved','Other','',NULL,25,'',92,'PM'),(168,1,'2021-11-18','Muhammad Adnan','2021-11-22','2021-11-23',1,'leave to attend cousin\\\'s marriage and will go to out of city.',5,NULL,'Annual leave',NULL,'2021-11-22',36,'',92,'Full Day'),(169,46,'2021-11-22','Mirza Zaheer Ahmed','2021-11-23','2021-11-25',2,'',2,NULL,'Leave on Compassionate Grounds (Nuclear family)','Approved',NULL,36,'',92,'Full Day'),(170,37,'2021-11-22','Mazhar Iqbal','2021-11-19','2021-11-22',1,'Family Matter to Attend',2,NULL,'Leave on Compassionate Grounds (Nuclear family)','approved',NULL,36,'',92,'Full Day'),(171,25,'2021-11-29','Muhammad Waqas','2021-12-02','2021-12-03',1,'Personal Commitment',2,'Please work from home','Annual leave','',NULL,23,'',92,'Full Day'),(172,35,'2021-12-14','Abdul Rehman','2021-12-16','2021-12-17',1,'',2,'Approved','Annual leave','Ok Approved',NULL,26,'',92,'Full Day'),(173,36,'2021-12-14','Aakash Rajput','2021-12-20','2021-12-27',5,'',2,NULL,'Annual leave','',NULL,38,'',92,'Full Day'),(174,49,'2021-12-15','Saba Sadaf','2021-12-27','2021-12-31',4,'Travelling to Karachi family gathering.',0,NULL,'Annual leave',NULL,NULL,48,'leaves/49WhatsApp Image 2021-12-14 at 1.11.00 AM_1639549298.jpeg',92,'Full Day'),(175,46,'2021-12-17','Mirza Zaheer Ahmed','2021-12-27','2022-01-03',5,'Family Engagement',0,NULL,'Annual leave',NULL,NULL,36,'',92,'Full Day'),(176,25,'2021-12-23','Muhammad Waqas','2021-12-30','2022-01-03',2,'Visit doctor for daughter\\\'s checkup',0,NULL,'Annual leave',NULL,NULL,23,'',92,'Full Day'),(177,33,'2021-12-28','Fawad Tariq','2021-12-31','2022-01-03',1,'',1,'Enjoy Baraf.','Annual leave',NULL,NULL,26,'',92,'Full Day'),(178,37,'2021-12-29','Mazhar Iqbal','2021-12-28','2021-12-29',1,'Urgent Matter to Attend at Home',0,NULL,'Leave on Compassionate Grounds (Nuclear family)',NULL,NULL,36,'',92,'Full Day'),(179,34,'2022-01-07','Nauman Shakil','2022-01-12','2022-01-13',1,'Family Function.',0,NULL,'Other',NULL,NULL,48,'',92,'Full Day');
/*!40000 ALTER TABLE `leave_requests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `leaves`
--

DROP TABLE IF EXISTS `leaves`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `leaves` (
  `empId` int(10) unsigned NOT NULL,
  `total` int(2) DEFAULT NULL,
  `sickAvailed` int(2) DEFAULT '0',
  `otherAvailed` int(2) DEFAULT '0',
  `annualAvailed` int(2) DEFAULT '0',
  `annualLeft` int(2) DEFAULT '0',
  PRIMARY KEY (`empId`),
  CONSTRAINT `FK_empId_users_id` FOREIGN KEY (`empId`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leaves`
--

LOCK TABLES `leaves` WRITE;
/*!40000 ALTER TABLE `leaves` DISABLE KEYS */;
INSERT INTO `leaves` VALUES (1,15,0,1,9,6),(23,15,0,1,0,15),(24,15,0,5,10,5),(25,15,1,7,6,9),(26,15,1,5,5,10),(27,15,0,5,1,14),(28,15,2,1,5,10),(29,15,0,2,0,15),(30,15,0,1,0,15),(31,15,0,4,1,14),(32,15,0,2,2,13),(33,15,3,0,0,15),(34,15,0,4,2,13),(35,15,0,6,6,9),(36,15,0,5,11,4),(37,15,7,5,5,10),(46,15,0,5,3,12),(47,15,3,2,10,5),(49,15,0,6,0,15),(51,15,1,3,0,15);
/*!40000 ALTER TABLE `leaves` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `team_lead`
--

DROP TABLE IF EXISTS `team_lead`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `team_lead` (
  `id` int(10) unsigned NOT NULL,
  `name` varchar(30) NOT NULL,
  `deptId` int(2) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_deptId_department_id` (`deptId`),
  CONSTRAINT `FK_deptId_department_id` FOREIGN KEY (`deptId`) REFERENCES `department` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_id_users_id` FOREIGN KEY (`id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `team_lead`
--

LOCK TABLES `team_lead` WRITE;
/*!40000 ALTER TABLE `team_lead` DISABLE KEYS */;
INSERT INTO `team_lead` VALUES (23,'Muhammad Shoaib Khalid',1),(24,'Zeeshan Ali',1),(25,'Muhammad Waqas',2),(26,'Wasim Ur Rehman',5),(36,'Aakash Rajput',4),(38,'Albert Ho',4),(44,'Kevin Lew',4),(47,'Muhammad Rashid Zafar',6),(48,'Umair Ali Khan',3);
/*!40000 ALTER TABLE `team_lead` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_pass`
--

DROP TABLE IF EXISTS `user_pass`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_pass` (
  `prefix_id` int(11) NOT NULL AUTO_INCREMENT,
  `prefix` varchar(20) NOT NULL,
  `password` varchar(100) DEFAULT NULL COMMENT 'ADMIN:Admin@123, CSR ADMIN: Admin@123, CSR: Csr@1234',
  PRIMARY KEY (`prefix_id`),
  UNIQUE KEY `UNIQUE` (`prefix`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_pass`
--

LOCK TABLES `user_pass` WRITE;
/*!40000 ALTER TABLE `user_pass` DISABLE KEYS */;
INSERT INTO `user_pass` VALUES (12,'ADMIN','Kalsym@123'),(13,'EMP','Kalsym@123');
/*!40000 ALTER TABLE `user_pass` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(765) NOT NULL,
  `username` varchar(765) NOT NULL,
  `password` varchar(765) NOT NULL,
  `access_type` int(11) NOT NULL COMMENT '1-Admin, 0-CSR',
  `status` int(11) NOT NULL DEFAULT '1' COMMENT '1-active , 0-inactive',
  `remember_token` varchar(300) DEFAULT NULL COMMENT 'yeh mein ne majboran kai ha',
  `is_change_pass` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0-not changed,1 changed',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `wrong_pass_count` tinyint(1) DEFAULT '0',
  `is_lock` tinyint(1) DEFAULT '0',
  `lock_expired` datetime DEFAULT NULL,
  `designationId` int(2) unsigned NOT NULL,
  `prefix_id` int(11) NOT NULL,
  `email` varchar(40) NOT NULL,
  `tlId` int(10) DEFAULT NULL,
  `countryCode` int(2) NOT NULL DEFAULT '92' COMMENT '92-Pakistan, 60-Malysia',
  `departmentId` int(2) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_user_pass_prefix_id` (`prefix_id`),
  KEY `fk_department_id` (`departmentId`),
  CONSTRAINT `fk_department_id` FOREIGN KEY (`departmentId`) REFERENCES `department` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_user_pass_prefix_id` FOREIGN KEY (`prefix_id`) REFERENCES `user_pass` (`prefix_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Muhammad Adnan','muhammad.adnan@kalsym.com','$2y$10$THhK/B8wH2/u4xbazgEeBeicV40r2/8OIlrVp.zKUg6dN/RtgQb0q',1,1,'0hxkYplvp9o8yi2XbCoGCaa3QvBwN9fuRM55c8OevQS4kh4IzgMOyzi4SYF7',1,'2020-04-15 07:36:42','2021-10-12 11:05:20',0,0,NULL,1,12,'muhammad.adnan@kalsym.com',36,92,4),(23,'Muhammad Shoaib Khalid','shoaib@kalsym.com','$2y$10$q9fIEqT1ePrJ6tsv.8t0.uBwWqaRuK7LD.TyRiXpc4Rdp6/G68etm',0,1,'l8Y2SzZTz4bBt0U8BrXx2FfGhmCk339doQsg450oWtUX8ncTIVUEwo0jWCqJ',1,'2021-02-16 07:19:12','2021-10-11 04:50:10',0,0,NULL,4,12,'shoaib@kalsym.com',38,92,1),(24,'Zeeshan Ali','zeeshan.ali@kalsym.com','$2y$10$1at7j.rX8yQJEgwWrzwLo.1wVo8.nkrmdBR8ctXu5nhG0saigQDay',-1,1,'mARDW54F0uxFKgKCORD8fA1GwteDWTDQPU82IEVTFiA8Q0Cw1erHDBvEsu9S',1,'2021-02-16 07:21:59','2021-07-23 05:05:29',0,0,'2021-07-02 19:07:36',6,13,'zeeshan.ali@kalsym.com',23,92,1),(25,'Muhammad Waqas','muhammad.waqas@kalsym.com','$2y$10$8nwP3Oq79d8TuN0V78wN2.W8w6o.eayjA3.BnxnhaU56o82UxL/K.',0,1,'PGLiWziCbgQsvgPCfuiF5oP7TDVnb8AzZUwBUUh7YgqKe8LxrXtmWuNA9TSG',1,'2021-02-16 07:24:14','2021-12-23 04:50:55',0,0,'2021-10-04 18:21:23',5,13,'muhammad.waqas@kalsym.com',23,92,2),(26,'Wasim Ur Rehman','wasim@kalsym.com','$2y$10$fGPyO48HdqUXbiHuUdDrTekCIeLb7W5VGdVckTtF0bbTDtNQS6BUi',-1,1,'lJPLvCQdhFDh1buJINrDWcgGwDivzKbXU5H4cmoeo4onzfyVaqzAEBvGehNm',1,'2021-02-16 07:25:58','2021-04-23 04:05:57',0,0,NULL,6,13,'wasim@kalsym.com',25,92,5),(27,'Sarosh Tariq','sarosh.tariq@kalsym.com','$2y$10$gLxW1Nfp1ymVmE31lQf0Du2kYNZHAjaDrY2IAAoQVoKqjC9UF0tJK',-2,1,'cbAviOy33G5OHLJFKtxI6oCgBmxHEdc20Yeu4T9USn3OCitViVZDhnXblD3I',1,'2021-02-16 07:27:52','2021-07-02 04:17:34',0,0,NULL,2,13,'sarosh.tariq@kalsym.com',24,92,1),(28,'Faisal Hayat','faisal.hayat@kalsym.com','$2y$10$hAiVfoRhfWPUWWTrwutvAueT9gCno8FovonzginEnwo33bYAo2bxq',-2,1,'3ccSlqUEAQu8d52goqtu0uhh68KuVd0Zx3lf0x3zQBzwXO1cmJdvL1lGRmBG',1,'2021-02-16 07:31:51','2021-07-19 11:57:06',1,0,NULL,9,13,'faisal.hayat@kalsym.com',25,92,2),(29,'Mohsin Ali','mohsin.ali@kalsym.com','$2y$10$mOx4vno2vlyZj8oNjltkReQW2gBP36giHQJuMlS5qTup5LROKROhC',-2,1,'lDXYppqmJgKvi6HfKNj697kYugcr8RzoLUroyKBDJOsqSqIgwfMuHbpPykoW',1,'2021-02-16 07:34:21','2021-09-09 09:47:56',0,0,'2021-09-06 15:26:17',1,13,'mohsin.ali@kalsym.com',24,92,1),(30,'Israr Ahmad','israr.ahmad@kalsym.com','$2y$10$q1DePD6lE0xnqKd592SSR.WqRjmTQc3RObvZ18nazAWFyX3uxiJs.',-2,1,'qad2VlkS891Ow1r0DUTqJSqka1FtPitGgKLT9GckRXEFe1Hoa4A9EVbcgQG2',1,'2021-02-16 07:35:35','2021-10-04 10:40:22',0,0,NULL,12,13,'israr.ahmad@kalsym.com',25,92,2),(31,'Adeel Raza','adeel.raza@kalsym.com','$2y$10$UXMuGdTWVYq4WCbmHVvTrupbiVoJ5XKIgcvAAhj.ELh/2Loktv7LK',-2,1,'XJooSt5xth0IOAfDXeOCAGYHeA9pjoDyNifJc2zau5V2PQPjdWa18t3XPtUe',1,'2021-02-16 07:36:54','2021-07-08 05:57:44',3,0,NULL,11,13,'adeel.raza@kalsym.com',25,92,2),(32,'Asim Malik','asim.malik@kalsym.com','$2y$10$8onnvdC/xlOBaFkixgSEcOrRgaVVPrlIjqQai6Rt5xvbdqJvrpcTG',-2,1,'cyLTOMOutyhRRwRUznJiTNKhzY95ImQO4F6s0qNR3J6CkrHDKe3GclwqsthC',1,'2021-02-16 07:38:16','2021-10-11 04:21:58',0,0,NULL,11,13,'asim.malik@kalsym.com',25,92,2),(33,'Fawad Tariq','fawad.tariq@kalsym.com','$2y$10$Fc/6YidTdutbbAK.Pozno.O9KQYuGjy9u6PfcTArXmMv2ASjnJGwe',-2,1,'Lw6FTxOxuUNEGskvNIDmiU69wuyGudVmy22TKj3XAASQNeyBYilCIkf4TUv4',1,'2021-02-16 07:40:04','2021-11-04 05:29:18',0,0,'2021-06-18 13:30:00',7,13,'fawad.tariq@kalsym.com',26,92,5),(34,'Nauman Shakil','nauman.shakil@kalsym.com','$2y$10$o9JKjN2kzU277e8P6W8z.eb0WKNtAQ59bLCr6iOysXKRJlv2QRZYS',-2,1,'Ih6g6HLCrtgrgV10aVpas68UAQsScGy6YkowBfdOi10SjQTEeODKddniMNcy',1,'2021-02-16 07:41:11','2021-10-04 04:45:46',0,0,NULL,2,13,'nauman.shakil@kalsym.com',48,92,3),(35,'Abdul Rehman','abdul.rehman@kalsym.com','$2y$10$CnRL0idQjvbYlymGt0AMcOpGD8h.SDbmEkrz1M7dACcd3PiW4G9yy',-2,1,'MjltNim5qrQwT9NW94AgpKfM1VNn74ngGPO1ksA7sQ7b5Bw0cJLjJdNekW8p',1,'2021-02-16 07:45:33','2021-12-28 09:46:03',0,0,NULL,8,13,'abdul.rehman@kalsym.com',26,92,5),(36,'Aakash Rajput','aakash_rajput@kalsym.com','$2y$10$6Ntuw9b4PE2elHBFa8VvRuUm/K5CjoJcVuRXkJMEWn2IJX5xUEBAG',1,1,'2mR3LaaSGPSHdSDoRbgTNsPK0Mn6JGrx6lJvxtEP9vsFOuiJndzesEu6L6pq',1,'2021-02-16 11:50:51','2021-11-22 05:46:17',0,0,NULL,17,12,'aakash_rajput@kalsym.com',38,92,4),(37,'Mazhar Iqbal','mazhar@kalsym.com','$2y$10$aiofGfZt5RUp9L5wgod1o.T6CbddfXDB9F4f5t774Gsxw.j82lqQi',-2,1,'FabxLslS50CxYgwpi5YpejwUsBDW5Zf61W4Rsu8huQOU5ZMyaiM3UNkZYUmN',1,'2021-02-16 11:51:57','2021-02-24 05:26:38',0,0,NULL,18,13,'mazhar@kalsym.com',36,92,4),(38,'Albert Ho','albert.ho@kalsym.com','$2y$10$Wplrbi0C561mIYBMU/6c7eiIToFab8pr3OyYq5mOUlbVpLwOZ8KEq',1,1,'OFMmo0mIj4yOttlDbTR6O4HQgTF0coVo6nC4ctFjtbmw7rDJRset2cJecike',1,'2021-02-17 07:02:56','2021-12-14 06:59:59',0,0,NULL,24,12,'albert.ho@kalsym.com',0,92,4),(39,'Mohd Taufik','taufik@kalsym.com','$2y$10$zQA9.KnsEL3UvSK1iFZZ8ONWXKuzenHzbscYhpcOOoJlfmBAsuKxy',-2,1,NULL,0,'2021-03-01 06:30:13','2021-03-01 06:32:51',0,0,NULL,25,13,'taufik@kalsym.com',38,60,1),(40,'Ng Sze Kiong','sk.ng@kalsym.com','$2y$10$XZY3AiUHlnMtYPYAgeW9CuWfYPe4HFx/uDb61QfJWsW8Z0.EY.8I.',-2,1,NULL,0,'2021-03-01 08:20:32','2021-03-01 08:20:32',0,0,NULL,26,13,'sk.ng@kalsym.com',38,60,5),(41,'Irasa Kumar','kumar@kalsym.com','$2y$10$XZY3AiUHlnMtYPYAgeW9CuWfYPe4HFx/uDb61QfJWsW8Z0.EY.8I.',-2,1,NULL,0,'2021-03-01 08:21:44','2021-03-01 08:21:44',0,0,NULL,7,13,'kumar@kalsym.com',38,60,1),(42,'Mohd Ishraf','ishraf@kalsym.com','$2y$10$X1TLTUh.dvi4Ojso4Attm.JFelINFq6iNjxPFPjKLeezTtCZqa0pS',-2,1,NULL,0,'2021-03-01 08:23:03','2021-03-01 08:23:03',0,0,NULL,25,13,'ishraf@kalsym.com',38,60,1),(43,'Mohd Nazrul','nazrul@kalsym.com','$2y$10$MoJr3Hse/PLUecvaCJdF0e2fSQ8QPIcyywfVHKDufbo1oxfBqCl2e',-2,1,'flotdfEmkrEpAWwl4d6Y6V3P4pj5ogVrS0Un9Hqt3SXAKZmRFUR4zsbLLVTi',1,'2021-03-01 08:25:28','2021-03-01 12:14:32',0,0,NULL,9,13,'nazrul@kalsym.com',38,60,1),(44,'Kevin Lew','kevin.lew@kalsym.com','$2y$10$10PP6R5YqTR0cWMVlnzP2O2mwTCmyOUoqe2VIRc1hV9U6lTbyDTxK',1,1,NULL,0,'2021-03-01 08:29:11','2021-03-01 08:29:11',0,0,NULL,19,12,'kevin.lew@kalsym.com',0,60,4),(45,'Adeline John','adeline.john@kalsym.com','$2y$10$Jlv/5bZpWlw2hA5OS9ocT.lT2OOazgP4mOQpVaKF5Czt5/7emnkzG',-2,1,'HozlLJ6tkuJqXCy9DNE1bOsUQwzQM5wn5gSZ0WQrCqMKBzG6bhOJLGdkWm54',0,'2021-03-01 08:31:41','2021-03-01 09:15:55',0,0,NULL,27,13,'adeline.john@kalsym.com',44,60,4),(46,'Mirza Zaheer Ahmed','mirza@kalsym.com','$2y$10$DaKc9XjTXb7mgskhDteW4ugyCIx4.jT5x8pMZGp0tOHn7JtjaABd6',-2,1,'sDZ7YMil91XKdoSuQBOCvPsy77oGyLruwefRZzSOCTT0aiaO8Lz7Zj7DCtig',1,'2021-03-10 06:05:27','2021-09-30 11:27:21',0,0,NULL,14,13,'mirza@kalsym.com',36,92,3),(47,'Muhammad Rashid Zafar','rashid@kalsym.com','$2y$10$j38RibyHuyyVrNRLIUC5cO47JghnIxN2dGwOOoBlM/gYGAbplySWC',-1,1,'BK3Ile4VN48jCLs23RvMUTwZ9fdCQXCNXCFTPsv81ocYozvxggTLJokERhEY',1,'2021-03-10 06:08:21','2021-09-01 04:59:22',0,0,'2021-09-01 12:58:34',16,13,'rashid@kalsym.com',38,92,6),(48,'Umair Ali Khan','uali@kalsym.com','$2y$10$pA.RiTkvQYIu8RaNDXa97uXmylx59yBw4CHKJyx4DeVkUELVEHIUC',-1,1,NULL,1,'2021-03-10 06:09:26','2021-10-07 09:51:59',0,0,NULL,15,13,'uali@kalsym.com',47,92,3),(49,'Saba Sadaf','saba.sadaf@kalsym.com','$2y$10$zbSOK7vwL/EZVyNElzfVCOD9hTHXoImHGucIUPSrw83Y8LE0BIsw6',-2,1,'bqLsPtwFedKOzxtwVM5D07wxDaEh2GI7YzqNxcDX11abxLNmwQ2IHjFWbsaF',1,'2021-03-10 06:10:31','2021-07-14 03:55:41',0,0,NULL,13,13,'saba.sadaf@kalsym.com',48,92,3),(50,'Muhammad Hasnain','hasnain@kalsym.com','$2y$10$6Jj43FppjBCEu0/00rpylOPWkRntvXC9Tg0pA3YamUVVG26/8b1oW',-2,1,NULL,0,'2021-03-10 06:12:02','2021-03-10 06:12:02',0,0,NULL,20,13,'hasnain@kalsym.com',0,92,4),(51,'Muhammad Nadeem Arif','nadeem.arif@kalsym.com','$2y$10$jFWB.Q2c2.3h8YLY0BiG0uKz1i6ciZERT102PuZBfySPj2yIh9hnK',-2,1,'Mck7bwgK6em9lwkySkAtGUPL2XzZ58ykKSmr5Q55FLBVrIecnMl1E3eSK97b',1,'2021-06-17 05:42:35','2021-11-02 12:56:18',2,0,'2021-10-01 00:35:23',9,13,'nadeem.arif@kalsym.com',24,92,1);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-01-21 17:58:36
