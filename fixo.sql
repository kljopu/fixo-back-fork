-- MySQL dump 10.13  Distrib 8.0.19, for osx10.15 (x86_64)
--
-- Host: localhost    Database: db_fixo
-- ------------------------------------------------------
-- Server version	8.0.19

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `account_emailaddress`
--

DROP TABLE IF EXISTS `account_emailaddress`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account_emailaddress` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(254) COLLATE utf8mb4_general_ci NOT NULL,
  `verified` tinyint(1) NOT NULL,
  `primary` tinyint(1) NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  KEY `account_emailaddress_user_id_2c513194_fk_users_id` (`user_id`),
  CONSTRAINT `account_emailaddress_user_id_2c513194_fk_users_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_emailaddress`
--

LOCK TABLES `account_emailaddress` WRITE;
/*!40000 ALTER TABLE `account_emailaddress` DISABLE KEYS */;
INSERT INTO `account_emailaddress` VALUES (1,'guswjdgh2004@naver.com',1,1,1),(2,'kljopuu@gmail.com',1,1,2),(3,'c4foryou@naver.com',1,1,3),(4,'mooljan@hotmail.com',1,1,4),(5,'byeol4001@gmail.com',1,1,5);
/*!40000 ALTER TABLE `account_emailaddress` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `account_emailconfirmation`
--

DROP TABLE IF EXISTS `account_emailconfirmation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account_emailconfirmation` (
  `id` int NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `sent` datetime(6) DEFAULT NULL,
  `key` varchar(64) COLLATE utf8mb4_general_ci NOT NULL,
  `email_address_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key` (`key`),
  KEY `account_emailconfirm_email_address_id_5b7f8c58_fk_account_e` (`email_address_id`),
  CONSTRAINT `account_emailconfirm_email_address_id_5b7f8c58_fk_account_e` FOREIGN KEY (`email_address_id`) REFERENCES `account_emailaddress` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account_emailconfirmation`
--

LOCK TABLES `account_emailconfirmation` WRITE;
/*!40000 ALTER TABLE `account_emailconfirmation` DISABLE KEYS */;
/*!40000 ALTER TABLE `account_emailconfirmation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accounts_corrector`
--

DROP TABLE IF EXISTS `accounts_corrector`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accounts_corrector` (
  `id` int NOT NULL AUTO_INCREMENT,
  `department` varchar(45) COLLATE utf8mb4_general_ci NOT NULL,
  `title` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `is_authenticated` tinyint(1) NOT NULL,
  `company_email` varchar(200) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `education_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `accounts_corrector_education_id_b53d90df_fk_accounts_` (`education_id`),
  KEY `accounts_corrector_user_id_f9c927a5_fk_users_id` (`user_id`),
  CONSTRAINT `accounts_corrector_education_id_b53d90df_fk_accounts_` FOREIGN KEY (`education_id`) REFERENCES `accounts_education` (`id`),
  CONSTRAINT `accounts_corrector_user_id_f9c927a5_fk_users_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_corrector`
--

LOCK TABLES `accounts_corrector` WRITE;
/*!40000 ALTER TABLE `accounts_corrector` DISABLE KEYS */;
/*!40000 ALTER TABLE `accounts_corrector` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accounts_degree`
--

DROP TABLE IF EXISTS `accounts_degree`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accounts_degree` (
  `id` int NOT NULL AUTO_INCREMENT,
  `degree_type` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `major` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_degree`
--

LOCK TABLES `accounts_degree` WRITE;
/*!40000 ALTER TABLE `accounts_degree` DISABLE KEYS */;
/*!40000 ALTER TABLE `accounts_degree` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accounts_education`
--

DROP TABLE IF EXISTS `accounts_education`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accounts_education` (
  `id` int NOT NULL AUTO_INCREMENT,
  `institute` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `degree_type_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `accounts_education_degree_type_id_b343777a_fk_accounts_degree_id` (`degree_type_id`),
  CONSTRAINT `accounts_education_degree_type_id_b343777a_fk_accounts_degree_id` FOREIGN KEY (`degree_type_id`) REFERENCES `accounts_degree` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_education`
--

LOCK TABLES `accounts_education` WRITE;
/*!40000 ALTER TABLE `accounts_education` DISABLE KEYS */;
/*!40000 ALTER TABLE `accounts_education` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `applicants`
--

DROP TABLE IF EXISTS `applicants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `applicants` (
  `id` int NOT NULL AUTO_INCREMENT,
  `minor` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `phone_number` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `education_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `applicants_education_id_cd9e3923_fk_accounts_education_id` (`education_id`),
  KEY `applicants_user_id_aeeab3d2_fk_users_id` (`user_id`),
  CONSTRAINT `applicants_education_id_cd9e3923_fk_accounts_education_id` FOREIGN KEY (`education_id`) REFERENCES `accounts_education` (`id`),
  CONSTRAINT `applicants_user_id_aeeab3d2_fk_users_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `applicants`
--

LOCK TABLES `applicants` WRITE;
/*!40000 ALTER TABLE `applicants` DISABLE KEYS */;
INSERT INTO `applicants` VALUES (1,NULL,NULL,NULL,1),(2,NULL,NULL,NULL,2),(3,NULL,NULL,NULL,3),(4,NULL,NULL,NULL,5);
/*!40000 ALTER TABLE `applicants` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=93 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add content type',4,'add_contenttype'),(14,'Can change content type',4,'change_contenttype'),(15,'Can delete content type',4,'delete_contenttype'),(16,'Can view content type',4,'view_contenttype'),(17,'Can add session',5,'add_session'),(18,'Can change session',5,'change_session'),(19,'Can delete session',5,'delete_session'),(20,'Can view session',5,'view_session'),(21,'Can add user',6,'add_user'),(22,'Can change user',6,'change_user'),(23,'Can delete user',6,'delete_user'),(24,'Can view user',6,'view_user'),(25,'Can add degree',7,'add_degree'),(26,'Can change degree',7,'change_degree'),(27,'Can delete degree',7,'delete_degree'),(28,'Can view degree',7,'view_degree'),(29,'Can add education',8,'add_education'),(30,'Can change education',8,'change_education'),(31,'Can delete education',8,'delete_education'),(32,'Can view education',8,'view_education'),(33,'Can add corrector',9,'add_corrector'),(34,'Can change corrector',9,'change_corrector'),(35,'Can delete corrector',9,'delete_corrector'),(36,'Can view corrector',9,'view_corrector'),(37,'Can add applicant',10,'add_applicant'),(38,'Can change applicant',10,'change_applicant'),(39,'Can delete applicant',10,'delete_applicant'),(40,'Can view applicant',10,'view_applicant'),(41,'Can add answer',11,'add_answer'),(42,'Can change answer',11,'change_answer'),(43,'Can delete answer',11,'delete_answer'),(44,'Can view answer',11,'view_answer'),(45,'Can add resume',12,'add_resume'),(46,'Can change resume',12,'change_resume'),(47,'Can delete resume',12,'delete_resume'),(48,'Can view resume',12,'view_resume'),(49,'Can add question',13,'add_question'),(50,'Can change question',13,'change_question'),(51,'Can delete question',13,'delete_question'),(52,'Can view question',13,'view_question'),(53,'Can add correction',14,'add_correction'),(54,'Can change correction',14,'change_correction'),(55,'Can delete correction',14,'delete_correction'),(56,'Can view correction',14,'view_correction'),(57,'Can add Token',15,'add_token'),(58,'Can change Token',15,'change_token'),(59,'Can delete Token',15,'delete_token'),(60,'Can view Token',15,'view_token'),(61,'Can add site',16,'add_site'),(62,'Can change site',16,'change_site'),(63,'Can delete site',16,'delete_site'),(64,'Can view site',16,'view_site'),(65,'Can add email address',17,'add_emailaddress'),(66,'Can change email address',17,'change_emailaddress'),(67,'Can delete email address',17,'delete_emailaddress'),(68,'Can view email address',17,'view_emailaddress'),(69,'Can add email confirmation',18,'add_emailconfirmation'),(70,'Can change email confirmation',18,'change_emailconfirmation'),(71,'Can delete email confirmation',18,'delete_emailconfirmation'),(72,'Can view email confirmation',18,'view_emailconfirmation'),(73,'Can add social account',19,'add_socialaccount'),(74,'Can change social account',19,'change_socialaccount'),(75,'Can delete social account',19,'delete_socialaccount'),(76,'Can view social account',19,'view_socialaccount'),(77,'Can add social application',20,'add_socialapp'),(78,'Can change social application',20,'change_socialapp'),(79,'Can delete social application',20,'delete_socialapp'),(80,'Can view social application',20,'view_socialapp'),(81,'Can add social application token',21,'add_socialtoken'),(82,'Can change social application token',21,'change_socialtoken'),(83,'Can delete social application token',21,'delete_socialtoken'),(84,'Can view social application token',21,'view_socialtoken'),(85,'Can add status',22,'add_status'),(86,'Can change status',22,'change_status'),(87,'Can delete status',22,'delete_status'),(88,'Can view status',22,'view_status'),(89,'Can add resume detail',23,'add_resumedetail'),(90,'Can change resume detail',23,'change_resumedetail'),(91,'Can delete resume detail',23,'delete_resumedetail'),(92,'Can view resume detail',23,'view_resumedetail');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `authtoken_token`
--

DROP TABLE IF EXISTS `authtoken_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `authtoken_token` (
  `key` varchar(40) COLLATE utf8mb4_general_ci NOT NULL,
  `created` datetime(6) NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`key`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `authtoken_token_user_id_35299eff_fk_users_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authtoken_token`
--

LOCK TABLES `authtoken_token` WRITE;
/*!40000 ALTER TABLE `authtoken_token` DISABLE KEYS */;
/*!40000 ALTER TABLE `authtoken_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext COLLATE utf8mb4_general_ci,
  `object_repr` varchar(200) COLLATE utf8mb4_general_ci NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext COLLATE utf8mb4_general_ci NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_users_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_users_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `model` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (17,'account','emailaddress'),(18,'account','emailconfirmation'),(10,'accounts','applicant'),(9,'accounts','corrector'),(7,'accounts','degree'),(8,'accounts','education'),(6,'accounts','user'),(1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(15,'authtoken','token'),(4,'contenttypes','contenttype'),(5,'sessions','session'),(16,'sites','site'),(19,'socialaccount','socialaccount'),(20,'socialaccount','socialapp'),(21,'socialaccount','socialtoken'),(11,'statement','answer'),(14,'statement','correction'),(13,'statement','question'),(12,'statement','resume'),(23,'statement','resumedetail'),(22,'statement','status');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2020-07-31 05:33:28.439165'),(2,'contenttypes','0002_remove_content_type_name','2020-07-31 05:33:28.467619'),(3,'auth','0001_initial','2020-07-31 05:33:28.499450'),(4,'auth','0002_alter_permission_name_max_length','2020-07-31 05:33:28.561631'),(5,'auth','0003_alter_user_email_max_length','2020-07-31 05:33:28.566974'),(6,'auth','0004_alter_user_username_opts','2020-07-31 05:33:28.572653'),(7,'auth','0005_alter_user_last_login_null','2020-07-31 05:33:28.577913'),(8,'auth','0006_require_contenttypes_0002','2020-07-31 05:33:28.579504'),(9,'auth','0007_alter_validators_add_error_messages','2020-07-31 05:33:28.585194'),(10,'auth','0008_alter_user_username_max_length','2020-07-31 05:33:28.591179'),(11,'auth','0009_alter_user_last_name_max_length','2020-07-31 05:33:28.596981'),(12,'auth','0010_alter_group_name_max_length','2020-07-31 05:33:28.608571'),(13,'auth','0011_update_proxy_permissions','2020-07-31 05:33:28.615411'),(14,'accounts','0001_initial','2020-07-31 05:33:28.700462'),(15,'account','0001_initial','2020-07-31 05:33:28.851796'),(16,'account','0002_email_max_length','2020-07-31 05:33:28.897889'),(17,'admin','0001_initial','2020-07-31 05:33:28.918282'),(18,'admin','0002_logentry_remove_auto_add','2020-07-31 05:33:28.959456'),(19,'admin','0003_logentry_add_action_flag_choices','2020-07-31 05:33:28.967990'),(20,'authtoken','0001_initial','2020-07-31 05:33:28.986308'),(21,'authtoken','0002_auto_20160226_1747','2020-07-31 05:33:29.072045'),(22,'sessions','0001_initial','2020-07-31 05:33:29.082228'),(23,'sites','0001_initial','2020-07-31 05:33:29.096544'),(24,'sites','0002_alter_domain_unique','2020-07-31 05:33:29.106197'),(25,'socialaccount','0001_initial','2020-07-31 05:33:29.192811'),(26,'socialaccount','0002_token_max_lengths','2020-07-31 05:33:29.308774'),(27,'socialaccount','0003_extra_data_default_dict','2020-07-31 05:33:29.317249'),(28,'statement','0001_initial','2020-07-31 05:33:29.409796'),(29,'accounts','0002_auto_20200802_1436','2020-08-02 14:36:49.698214'),(30,'statement','0002_auto_20200802_1451','2020-08-02 14:51:32.924978'),(31,'statement','0003_auto_20200802_2023','2020-08-02 20:23:52.437620'),(32,'statement','0004_auto_20200802_2024','2020-08-02 20:24:16.511725'),(33,'statement','0005_auto_20200804_1343','2020-08-04 13:43:15.430117');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) COLLATE utf8mb4_general_ci NOT NULL,
  `session_data` longtext COLLATE utf8mb4_general_ci NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('2a5byix99aj9imvhsoc953md20ve9d1d','MDNkODdiYmFjYjJhMzg3MDgzYTBmZmViNTc5MjI0OWU0ZTgxMDQ4OTp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmNzBiNWNjZTVhNTY0MmFkMGJmZjI1ZTk2NWZlNTU5MTYxOTI3Mzc2In0=','2020-08-19 01:10:46.486723'),('2gwlijjtkvstzs08wosuvqhi6ihg2iyf','NjdmODllMDBmNjg4NmI3MWEyOWIzMzQ3M2E5ZjgwYWI1NjVmNjYwODp7Il9hdXRoX3VzZXJfaWQiOiI1IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmMWQ4MTc4MWQ1ZmVlZWRmMjQ2ZDU3MWM5MGYzZjMzMTUyNjFjM2ZkIn0=','2020-08-17 10:54:54.840392'),('55kcvfzrdchf7id9851gm60349efper2','MDNkODdiYmFjYjJhMzg3MDgzYTBmZmViNTc5MjI0OWU0ZTgxMDQ4OTp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmNzBiNWNjZTVhNTY0MmFkMGJmZjI1ZTk2NWZlNTU5MTYxOTI3Mzc2In0=','2020-08-14 12:45:37.724422'),('65ddfb5yk67li46yoos2egy2nqap80zp','NTM5Mzg4ZjI5ZmQyN2VlOWQ3NDRkY2RhZDdjZTM3YjZhOGQ5NzVhYzp7ImFjY291bnRfdmVyaWZpZWRfZW1haWwiOm51bGwsIl9hdXRoX3VzZXJfaWQiOiIzIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIyOTIzZWM4Mzc3ODhjMzFkNjI3YjRmN2I4ZjFkNDdmYjYyN2EzOTE2In0=','2020-08-14 05:39:51.613052'),('ar2uqnlwacwm6oag5qhja3fkqd7s7kzr','MDNkODdiYmFjYjJhMzg3MDgzYTBmZmViNTc5MjI0OWU0ZTgxMDQ4OTp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmNzBiNWNjZTVhNTY0MmFkMGJmZjI1ZTk2NWZlNTU5MTYxOTI3Mzc2In0=','2020-08-16 20:25:24.645853'),('c4pldln1q94rt7f4dd1tj7u6m6i3ha95','MDNkODdiYmFjYjJhMzg3MDgzYTBmZmViNTc5MjI0OWU0ZTgxMDQ4OTp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmNzBiNWNjZTVhNTY0MmFkMGJmZjI1ZTk2NWZlNTU5MTYxOTI3Mzc2In0=','2020-08-15 04:52:11.444325'),('cxz4210qwo0qx6e6fxubg3re3vaxuxak','ZWViOTUzNjEyMzQwNDBmZmY0NTFkMTc0Yjk1OGJjMzhmOWQ1OTFiZjp7Il9hdXRoX3VzZXJfaWQiOiIzIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIyOTIzZWM4Mzc3ODhjMzFkNjI3YjRmN2I4ZjFkNDdmYjYyN2EzOTE2In0=','2020-08-14 12:51:25.891236'),('dycmu1h6sxvf940rp598en120wtjgqq8','NjdmODllMDBmNjg4NmI3MWEyOWIzMzQ3M2E5ZjgwYWI1NjVmNjYwODp7Il9hdXRoX3VzZXJfaWQiOiI1IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmMWQ4MTc4MWQ1ZmVlZWRmMjQ2ZDU3MWM5MGYzZjMzMTUyNjFjM2ZkIn0=','2020-08-15 22:05:12.636101'),('ew3xwcf11finezcv21nhiukmg9jwhbxf','NGY0OWQ2MDFmMjVmNjg3YTcyYjNjYTQwMDU3NTZiNGVjMTA0YzllNTp7ImFjY291bnRfdmVyaWZpZWRfZW1haWwiOm51bGwsIl9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmNzBiNWNjZTVhNTY0MmFkMGJmZjI1ZTk2NWZlNTU5MTYxOTI3Mzc2In0=','2020-08-14 05:35:05.068815'),('fpqiu6eyz4fii842kbkiuqce85t7z3fm','NjdmODllMDBmNjg4NmI3MWEyOWIzMzQ3M2E5ZjgwYWI1NjVmNjYwODp7Il9hdXRoX3VzZXJfaWQiOiI1IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmMWQ4MTc4MWQ1ZmVlZWRmMjQ2ZDU3MWM5MGYzZjMzMTUyNjFjM2ZkIn0=','2020-08-15 11:21:33.582275'),('gfybvnbk14akju3f23pkxdnkj8vzgfab','MDNkODdiYmFjYjJhMzg3MDgzYTBmZmViNTc5MjI0OWU0ZTgxMDQ4OTp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmNzBiNWNjZTVhNTY0MmFkMGJmZjI1ZTk2NWZlNTU5MTYxOTI3Mzc2In0=','2020-08-14 14:42:53.038019'),('i49jzx5zo1ze1ctkak2lfuwbl9wbf4p7','ZmY1YjY1M2NiZWMyMjYyZTY1YTBlZGZkYzgwNTMyYWVkYTllNjUxNDp7ImFjY291bnRfdmVyaWZpZWRfZW1haWwiOm51bGwsIl9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI3Yjk4MjQ1ZmM2NDQxMzRjYmNhYzJkMDk5MzIzNWQzMTg1MDVhMTY2In0=','2020-08-14 05:34:11.486467'),('ityjjgmhfkuxsr0cdxe317gf40aivfc0','MDNkODdiYmFjYjJhMzg3MDgzYTBmZmViNTc5MjI0OWU0ZTgxMDQ4OTp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmNzBiNWNjZTVhNTY0MmFkMGJmZjI1ZTk2NWZlNTU5MTYxOTI3Mzc2In0=','2020-08-18 13:44:21.439837'),('mk760sdjh53l32dxh8ztlvp7aafe8bi6','MDNkODdiYmFjYjJhMzg3MDgzYTBmZmViNTc5MjI0OWU0ZTgxMDQ4OTp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmNzBiNWNjZTVhNTY0MmFkMGJmZjI1ZTk2NWZlNTU5MTYxOTI3Mzc2In0=','2020-08-14 05:45:22.171028'),('q2p6bgdto34n7oxxznxyi8b1vtpmxgfo','NjdmODllMDBmNjg4NmI3MWEyOWIzMzQ3M2E5ZjgwYWI1NjVmNjYwODp7Il9hdXRoX3VzZXJfaWQiOiI1IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmMWQ4MTc4MWQ1ZmVlZWRmMjQ2ZDU3MWM5MGYzZjMzMTUyNjFjM2ZkIn0=','2020-08-15 11:18:15.498794'),('q5khdp4jrxmo4jcyetdg27cdug74yo49','MDNkODdiYmFjYjJhMzg3MDgzYTBmZmViNTc5MjI0OWU0ZTgxMDQ4OTp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmNzBiNWNjZTVhNTY0MmFkMGJmZjI1ZTk2NWZlNTU5MTYxOTI3Mzc2In0=','2020-08-15 08:19:47.101428'),('qyel5x01vywdgee0jtrj9qg6kq22fipb','NjdmODllMDBmNjg4NmI3MWEyOWIzMzQ3M2E5ZjgwYWI1NjVmNjYwODp7Il9hdXRoX3VzZXJfaWQiOiI1IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmMWQ4MTc4MWQ1ZmVlZWRmMjQ2ZDU3MWM5MGYzZjMzMTUyNjFjM2ZkIn0=','2020-08-15 12:21:42.674379'),('qygoztc2gt1zowf68i341b1n6vx0lfcy','MDNkODdiYmFjYjJhMzg3MDgzYTBmZmViNTc5MjI0OWU0ZTgxMDQ4OTp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmNzBiNWNjZTVhNTY0MmFkMGJmZjI1ZTk2NWZlNTU5MTYxOTI3Mzc2In0=','2020-08-18 19:23:49.580190'),('r4aulp7w9m9j6thrw6gjz0elhheqn27r','NDA2MGNiZTRmZDNiMGYwMDg3ZmMxYmM1MzdkYzUzZjJjYTU4NGNiMzp7ImFjY291bnRfdmVyaWZpZWRfZW1haWwiOm51bGwsIl9hdXRoX3VzZXJfaWQiOiI1IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmMWQ4MTc4MWQ1ZmVlZWRmMjQ2ZDU3MWM5MGYzZjMzMTUyNjFjM2ZkIn0=','2020-08-15 11:11:01.747838'),('rw99cb2clfkvz154p9puy2rtmk1n9ynu','YTAxMTVkYmRjNTE5NWU5OGE0MmJkMmI5YTRmYzc3M2ZhZGEyMThiNzp7ImFjY291bnRfdmVyaWZpZWRfZW1haWwiOm51bGwsIl9hdXRoX3VzZXJfaWQiOiI0IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhZmMwODVlMTk1NTFiNDg0M2QyZmRjZTc5YTY2M2U4MzExM2IzZTI4In0=','2020-08-15 07:33:32.854930'),('vp69obcm395ks6l1go65u0m7mjngu3ku','NjdmODllMDBmNjg4NmI3MWEyOWIzMzQ3M2E5ZjgwYWI1NjVmNjYwODp7Il9hdXRoX3VzZXJfaWQiOiI1IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmMWQ4MTc4MWQ1ZmVlZWRmMjQ2ZDU3MWM5MGYzZjMzMTUyNjFjM2ZkIn0=','2020-08-15 22:09:44.748118'),('xyzonnrv4z8vqyci5v8xaog9ggbhk8od','MDNkODdiYmFjYjJhMzg3MDgzYTBmZmViNTc5MjI0OWU0ZTgxMDQ4OTp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmNzBiNWNjZTVhNTY0MmFkMGJmZjI1ZTk2NWZlNTU5MTYxOTI3Mzc2In0=','2020-08-14 11:35:30.030625');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_site`
--

DROP TABLE IF EXISTS `django_site`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_site` (
  `id` int NOT NULL AUTO_INCREMENT,
  `domain` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_site_domain_a2e37b91_uniq` (`domain`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_site`
--

LOCK TABLES `django_site` WRITE;
/*!40000 ALTER TABLE `django_site` DISABLE KEYS */;
INSERT INTO `django_site` VALUES (1,'example.com','example.com');
/*!40000 ALTER TABLE `django_site` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resumedetail`
--

DROP TABLE IF EXISTS `resumedetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `resumedetail` (
  `id` int NOT NULL AUTO_INCREMENT,
  `question` varchar(5000) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `answer` varchar(5000) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `correction` varchar(5000) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `resume_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `resumedetail_resume_id_c05c4b31_fk_resumes_id` (`resume_id`),
  CONSTRAINT `resumedetail_resume_id_c05c4b31_fk_resumes_id` FOREIGN KEY (`resume_id`) REFERENCES `resumes` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resumedetail`
--

LOCK TABLES `resumedetail` WRITE;
/*!40000 ALTER TABLE `resumedetail` DISABLE KEYS */;
INSERT INTO `resumedetail` VALUES (1,'한국그룹에 지원하게 계기는 무었인가요?','권오성 회장님의 철저한 보수주의 마인드에 큰 감명을 받아 지원하게 되었습니다.',NULL,8),(2,'권오성 회장님이 매일 야근을 강요한다면 어떻게 답하실 건가요?','야근? 뽑아만 주신다면 저는 야근 뿐만아니라 밤을 지새울 자신도 있습니다.',NULL,8);
/*!40000 ALTER TABLE `resumedetail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resumes`
--

DROP TABLE IF EXISTS `resumes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `resumes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `company_applying` varchar(200) COLLATE utf8mb4_general_ci NOT NULL,
  `dept_or_task` varchar(200) COLLATE utf8mb4_general_ci NOT NULL,
  `created` datetime(6) DEFAULT NULL,
  `applicant_id` int NOT NULL,
  `corrector_id` int DEFAULT NULL,
  `is_finished` tinyint(1) NOT NULL,
  `corrector_status_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `resumes_applicant_id_458dbec3_fk_applicants_id` (`applicant_id`),
  KEY `resumes_corrector_id_92681817_fk_accounts_corrector_id` (`corrector_id`),
  KEY `resumes_corrector_status_id_b04e0cab_fk_status_id` (`corrector_status_id`),
  CONSTRAINT `resumes_applicant_id_458dbec3_fk_applicants_id` FOREIGN KEY (`applicant_id`) REFERENCES `applicants` (`id`),
  CONSTRAINT `resumes_corrector_id_92681817_fk_accounts_corrector_id` FOREIGN KEY (`corrector_id`) REFERENCES `accounts_corrector` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resumes`
--

LOCK TABLES `resumes` WRITE;
/*!40000 ALTER TABLE `resumes` DISABLE KEYS */;
INSERT INTO `resumes` VALUES (1,'Samsung','finance','2020-07-31 05:51:38.819030',1,NULL,0,3),(2,'배민','기획','2020-07-31 06:08:48.833341',1,NULL,0,3),(3,'주식회사 오성','경리','2020-07-31 11:43:50.151941',2,NULL,0,3),(4,'주식회사 오성','경리','2020-08-01 08:25:37.472951',2,NULL,0,3),(5,'삼성','마케팅','2020-08-01 12:24:02.865786',4,NULL,1,3),(6,'삼성','마케팅','2020-08-01 21:25:51.835927',4,NULL,1,3),(7,'주식회사 오성','경리','2020-08-02 20:34:30.472101',2,NULL,1,1),(8,'주식회사 한국','재무','2020-08-04 13:45:08.827539',2,NULL,0,1);
/*!40000 ALTER TABLE `resumes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `socialaccount_socialaccount`
--

DROP TABLE IF EXISTS `socialaccount_socialaccount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `socialaccount_socialaccount` (
  `id` int NOT NULL AUTO_INCREMENT,
  `provider` varchar(30) COLLATE utf8mb4_general_ci NOT NULL,
  `uid` varchar(191) COLLATE utf8mb4_general_ci NOT NULL,
  `last_login` datetime(6) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `extra_data` longtext COLLATE utf8mb4_general_ci NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `socialaccount_socialaccount_provider_uid_fc810c6e_uniq` (`provider`,`uid`),
  KEY `socialaccount_socialaccount_user_id_8146e70c_fk_users_id` (`user_id`),
  CONSTRAINT `socialaccount_socialaccount_user_id_8146e70c_fk_users_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `socialaccount_socialaccount`
--

LOCK TABLES `socialaccount_socialaccount` WRITE;
/*!40000 ALTER TABLE `socialaccount_socialaccount` DISABLE KEYS */;
INSERT INTO `socialaccount_socialaccount` VALUES (1,'kakao','1418178912','2020-07-31 05:34:11.463499','2020-07-31 05:34:11.463518','{\"id\": 1418178912, \"connected_at\": \"2020-07-30T04:58:36Z\", \"properties\": {\"nickname\": \"\\ud604\\uc815\\ud638\", \"profile_image\": \"http://k.kakaocdn.net/dn/buW97i/btqFnk0nKv6/K7eNf5gLXQ1EfDODvNVj2k/img_640x640.jpg\", \"thumbnail_image\": \"http://k.kakaocdn.net/dn/buW97i/btqFnk0nKv6/K7eNf5gLXQ1EfDODvNVj2k/img_110x110.jpg\"}, \"kakao_account\": {\"profile_needs_agreement\": false, \"profile\": {\"nickname\": \"\\ud604\\uc815\\ud638\", \"thumbnail_image_url\": \"http://k.kakaocdn.net/dn/tij2u/btqF8Ttjezv/UnNkGQkclquVg3bqtmyAb1/img_110x110.jpg\", \"profile_image_url\": \"http://k.kakaocdn.net/dn/tij2u/btqF8Ttjezv/UnNkGQkclquVg3bqtmyAb1/img_640x640.jpg\"}, \"has_email\": true, \"email_needs_agreement\": false, \"is_email_valid\": true, \"is_email_verified\": true, \"email\": \"guswjdgh2004@naver.com\"}}',1),(2,'kakao','1437202687','2020-08-05 01:10:46.458649','2020-07-31 05:35:05.057575','{\"id\": 1437202687, \"connected_at\": \"2020-07-29T17:20:09Z\", \"properties\": {\"nickname\": \"\\ud55c\\uc900\\uc218(Kyle)\", \"profile_image\": \"http://k.kakaocdn.net/dn/cXgDHg/btqDKo262ZN/fSK2ndaciEtHGMLJFqkKYK/img_640x640.jpg\", \"thumbnail_image\": \"http://k.kakaocdn.net/dn/cXgDHg/btqDKo262ZN/fSK2ndaciEtHGMLJFqkKYK/img_110x110.jpg\"}, \"kakao_account\": {\"profile_needs_agreement\": false, \"profile\": {\"nickname\": \"\\ud55c\\uc900\\uc218(Kyle)\", \"thumbnail_image_url\": \"http://k.kakaocdn.net/dn/cXgDHg/btqDKo262ZN/fSK2ndaciEtHGMLJFqkKYK/img_110x110.jpg\", \"profile_image_url\": \"http://k.kakaocdn.net/dn/cXgDHg/btqDKo262ZN/fSK2ndaciEtHGMLJFqkKYK/img_640x640.jpg\"}, \"has_email\": true, \"email_needs_agreement\": false, \"is_email_valid\": true, \"is_email_verified\": true, \"email\": \"kljopuu@gmail.com\"}}',2),(3,'kakao','1437659852','2020-07-31 12:51:25.879407','2020-07-31 05:39:51.599814','{\"id\": 1437659852, \"connected_at\": \"2020-07-30T10:53:22Z\", \"properties\": {\"nickname\": \"\\ud55c\\uad6d\"}, \"kakao_account\": {\"profile_needs_agreement\": false, \"profile\": {\"nickname\": \"\\ud55c\\uad6d\"}, \"has_email\": true, \"email_needs_agreement\": false, \"is_email_valid\": true, \"is_email_verified\": true, \"email\": \"c4foryou@naver.com\"}}',3),(4,'kakao','1439246061','2020-08-01 07:33:32.829344','2020-08-01 07:33:32.829374','{\"id\": 1439246061, \"connected_at\": \"2020-08-01T07:33:32Z\", \"properties\": {\"nickname\": \"\\uc815\\uc218\\uc601\", \"profile_image\": \"http://k.kakaocdn.net/dn/bS5Fm7/btqFAngRCKt/PuA6AHKKKwN8bsKdM5isZK/img_640x640.jpg\", \"thumbnail_image\": \"http://k.kakaocdn.net/dn/bS5Fm7/btqFAngRCKt/PuA6AHKKKwN8bsKdM5isZK/img_110x110.jpg\"}, \"kakao_account\": {\"profile_needs_agreement\": false, \"profile\": {\"nickname\": \"\\uc815\\uc218\\uc601\", \"thumbnail_image_url\": \"http://k.kakaocdn.net/dn/bS5Fm7/btqFAngRCKt/PuA6AHKKKwN8bsKdM5isZK/img_110x110.jpg\", \"profile_image_url\": \"http://k.kakaocdn.net/dn/bS5Fm7/btqFAngRCKt/PuA6AHKKKwN8bsKdM5isZK/img_640x640.jpg\"}, \"has_email\": true, \"email_needs_agreement\": false, \"is_email_valid\": true, \"is_email_verified\": true, \"email\": \"mooljan@hotmail.com\"}}',4),(5,'kakao','1418186314','2020-08-03 10:54:54.796250','2020-08-01 11:11:01.722553','{\"id\": 1418186314, \"connected_at\": \"2020-07-27T04:16:35Z\", \"properties\": {\"nickname\": \"\\ud55c\\ubcc4\", \"profile_image\": \"http://k.kakaocdn.net/dn/vzdUe/btqE0ezQ4lx/Stk9hjFzq1duvxlJcMBkC0/img_640x640.jpg\", \"thumbnail_image\": \"http://k.kakaocdn.net/dn/vzdUe/btqE0ezQ4lx/Stk9hjFzq1duvxlJcMBkC0/img_110x110.jpg\"}, \"kakao_account\": {\"profile_needs_agreement\": false, \"profile\": {\"nickname\": \"\\ud55c\\ubcc4\", \"thumbnail_image_url\": \"http://k.kakaocdn.net/dn/vzdUe/btqE0ezQ4lx/Stk9hjFzq1duvxlJcMBkC0/img_110x110.jpg\", \"profile_image_url\": \"http://k.kakaocdn.net/dn/vzdUe/btqE0ezQ4lx/Stk9hjFzq1duvxlJcMBkC0/img_640x640.jpg\"}, \"has_email\": true, \"email_needs_agreement\": false, \"is_email_valid\": true, \"is_email_verified\": true, \"email\": \"byeol4001@gmail.com\"}}',5);
/*!40000 ALTER TABLE `socialaccount_socialaccount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `socialaccount_socialapp`
--

DROP TABLE IF EXISTS `socialaccount_socialapp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `socialaccount_socialapp` (
  `id` int NOT NULL AUTO_INCREMENT,
  `provider` varchar(30) COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(40) COLLATE utf8mb4_general_ci NOT NULL,
  `client_id` varchar(191) COLLATE utf8mb4_general_ci NOT NULL,
  `secret` varchar(191) COLLATE utf8mb4_general_ci NOT NULL,
  `key` varchar(191) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `socialaccount_socialapp`
--

LOCK TABLES `socialaccount_socialapp` WRITE;
/*!40000 ALTER TABLE `socialaccount_socialapp` DISABLE KEYS */;
/*!40000 ALTER TABLE `socialaccount_socialapp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `socialaccount_socialapp_sites`
--

DROP TABLE IF EXISTS `socialaccount_socialapp_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `socialaccount_socialapp_sites` (
  `id` int NOT NULL AUTO_INCREMENT,
  `socialapp_id` int NOT NULL,
  `site_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `socialaccount_socialapp_sites_socialapp_id_site_id_71a9a768_uniq` (`socialapp_id`,`site_id`),
  KEY `socialaccount_socialapp_sites_site_id_2579dee5_fk_django_site_id` (`site_id`),
  CONSTRAINT `socialaccount_social_socialapp_id_97fb6e7d_fk_socialacc` FOREIGN KEY (`socialapp_id`) REFERENCES `socialaccount_socialapp` (`id`),
  CONSTRAINT `socialaccount_socialapp_sites_site_id_2579dee5_fk_django_site_id` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `socialaccount_socialapp_sites`
--

LOCK TABLES `socialaccount_socialapp_sites` WRITE;
/*!40000 ALTER TABLE `socialaccount_socialapp_sites` DISABLE KEYS */;
/*!40000 ALTER TABLE `socialaccount_socialapp_sites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `socialaccount_socialtoken`
--

DROP TABLE IF EXISTS `socialaccount_socialtoken`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `socialaccount_socialtoken` (
  `id` int NOT NULL AUTO_INCREMENT,
  `token` longtext COLLATE utf8mb4_general_ci NOT NULL,
  `token_secret` longtext COLLATE utf8mb4_general_ci NOT NULL,
  `expires_at` datetime(6) DEFAULT NULL,
  `account_id` int NOT NULL,
  `app_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `socialaccount_socialtoken_app_id_account_id_fca4e0ac_uniq` (`app_id`,`account_id`),
  KEY `socialaccount_social_account_id_951f210e_fk_socialacc` (`account_id`),
  CONSTRAINT `socialaccount_social_account_id_951f210e_fk_socialacc` FOREIGN KEY (`account_id`) REFERENCES `socialaccount_socialaccount` (`id`),
  CONSTRAINT `socialaccount_social_app_id_636a42d7_fk_socialacc` FOREIGN KEY (`app_id`) REFERENCES `socialaccount_socialapp` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `socialaccount_socialtoken`
--

LOCK TABLES `socialaccount_socialtoken` WRITE;
/*!40000 ALTER TABLE `socialaccount_socialtoken` DISABLE KEYS */;
/*!40000 ALTER TABLE `socialaccount_socialtoken` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `status`
--

DROP TABLE IF EXISTS `status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `status` (
  `id` int NOT NULL AUTO_INCREMENT,
  `state` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `status`
--

LOCK TABLES `status` WRITE;
/*!40000 ALTER TABLE `status` DISABLE KEYS */;
INSERT INTO `status` VALUES (1,'available'),(2,'in_progress'),(3,'finished');
/*!40000 ALTER TABLE `status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) COLLATE utf8mb4_general_ci NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) COLLATE utf8mb4_general_ci NOT NULL,
  `first_name` varchar(30) COLLATE utf8mb4_general_ci NOT NULL,
  `last_name` varchar(150) COLLATE utf8mb4_general_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `kakao_id` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(45) COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `is_corrector` tinyint(1) NOT NULL,
  `email_auth_token` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'!2mFuXfNP5sn27UUEC0JALDWu2yb30KWeC7KIDxhU','2020-07-31 05:34:11.484619',0,'현정호','','',0,1,'2020-07-31 05:34:11.453133','1418178912','현정호','guswjdgh2004@naver.com',0,NULL),(2,'!qkp2B4YLt4KIEn7ja3fBqczLkUEotnVUgJuxHKiT','2020-08-05 01:10:46.484082',0,'kljopuu','','',0,1,'2020-07-31 05:35:05.049601','1437202687','한준수(Kyle)','kljopuu@gmail.com',0,NULL),(3,'!FZUcSFnWFkHGDtE15Jq9dODHsldcZsQUZMyyc7lL','2020-07-31 12:51:25.888828',0,'한국','','',0,1,'2020-07-31 05:39:51.592017','1437659852','한국','c4foryou@naver.com',0,NULL),(4,'!6cPv5eTKxGnL1tHlx0e6qyacww671puKWD3QAmfZ','2020-08-01 07:33:32.850790',0,'정수영','','',0,1,'2020-08-01 07:33:32.819199','1439246061','정수영','mooljan@hotmail.com',1,NULL),(5,'!AfvPbaKFcLdMRW9zdA5NfX8pbRStzxA91o2Cf37M','2020-08-03 10:54:54.834876',0,'한별','','',0,1,'2020-08-01 11:11:01.713187','1418186314','한별','byeol4001@gmail.com',0,'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJlbWFpbCI6ImJ5ZW9sNDAwMUBnbWFpbC5jb20iLCJuYW1lIjoiXHVkNTVjXHViY2M0In0.gue89da-AnfcJ8iTJfiAWq0Nt0Nrs6f6FCVdmsGvpUM');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_groups`
--

DROP TABLE IF EXISTS `users_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_groups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_groups_user_id_group_id_fc7788e8_uniq` (`user_id`,`group_id`),
  KEY `users_groups_group_id_2f3517aa_fk_auth_group_id` (`group_id`),
  CONSTRAINT `users_groups_group_id_2f3517aa_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `users_groups_user_id_f500bee5_fk_users_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_groups`
--

LOCK TABLES `users_groups` WRITE;
/*!40000 ALTER TABLE `users_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_user_permissions`
--

DROP TABLE IF EXISTS `users_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_user_permissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_user_permissions_user_id_permission_id_3b86cbdf_uniq` (`user_id`,`permission_id`),
  KEY `users_user_permissio_permission_id_6d08dcd2_fk_auth_perm` (`permission_id`),
  CONSTRAINT `users_user_permissio_permission_id_6d08dcd2_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `users_user_permissions_user_id_92473840_fk_users_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_user_permissions`
--

LOCK TABLES `users_user_permissions` WRITE;
/*!40000 ALTER TABLE `users_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-08-07  3:38:51
