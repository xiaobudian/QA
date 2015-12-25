-- MySQL dump 10.13  Distrib 5.5.44, for debian-linux-gnu (x86_64)
--
-- Host: 0.0.0.0    Database: qa
-- ------------------------------------------------------
-- Server version	5.5.44-0ubuntu0.14.04.1

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
-- Table structure for table `answer`
--

DROP TABLE IF EXISTS `answer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `answer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `answer` longtext NOT NULL,
  `votes` int(11) NOT NULL,
  `ct` datetime NOT NULL,
  `question_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `answer_question_id_4dc3833279aaa5e2_fk_question_id` (`question_id`),
  KEY `answer_user_id_c150fbde885bbb1_fk_auth_user_id` (`user_id`),
  CONSTRAINT `answer_question_id_4dc3833279aaa5e2_fk_question_id` FOREIGN KEY (`question_id`) REFERENCES `question` (`id`),
  CONSTRAINT `answer_user_id_c150fbde885bbb1_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `answer`
--

LOCK TABLES `answer` WRITE;
/*!40000 ALTER TABLE `answer` DISABLE KEYS */;
INSERT INTO `answer` VALUES (1,'方法1： 用SET PASSWORD命令\r\n\r\n　　mysql -u root\r\n\r\n　　mysql> SET PASSWORD FOR \'root\'@\'localhost\' = PASSWORD(\'newpass\');\r\n\r\n方法2：用mysqladmin\r\n\r\n　　mysqladmin -u root password \"newpass\"\r\n\r\n　　如果root已经设置过密码，采用如下方法\r\n\r\n　　mysqladmin -u root password oldpass \"newpass\"\r\n\r\n方法3： 用UPDATE直接编辑user表\r\n\r\n　　mysql -u root\r\n\r\n　　mysql> use mysql;\r\n\r\n　　mysql> UPDATE user SET Password = PASSWORD(\'newpass\') WHERE user = \'root\';\r\n\r\n　　mysql> FLUSH PRIVILEGES;\r\n\r\n在丢失root密码的时候，可以这样\r\n\r\n　　mysqld_safe --skip-grant-tables&\r\n\r\n　　mysql -u root mysql\r\n\r\n　　mysql> UPDATE user SET password=PASSWORD(\"new password\") WHERE user=\'root\';\r\n\r\n　　mysql> FLUSH PRIVILEGES;',0,'2015-12-02 18:41:05',3,2),(2,'你这什么问题',0,'2015-12-02 18:47:29',4,2),(3,'了几年几十年就事论事',0,'2015-12-03 15:56:29',4,4),(4,'<p>你都解决了 还提问什么，你是来逗逼的吗？</p>',-1,'2015-12-15 15:12:21',8,2),(5,'<p>方法一 ggdG</p><p>方法二 :%d</p><p>希望对你有帮助</p>',1,'2015-12-25 17:33:37',9,2);
/*!40000 ALTER TABLE `answer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `group_id` (`group_id`,`permission_id`),
  KEY `auth_group__permission_id_1f49ccbbdc69d2fc_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_group_permission_group_id_689710a9a73b7457_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_group__permission_id_1f49ccbbdc69d2fc_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `content_type_id` (`content_type_id`,`codename`),
  CONSTRAINT `auth__content_type_id_508cf46651277a81_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add permission',2,'add_permission'),(5,'Can change permission',2,'change_permission'),(6,'Can delete permission',2,'delete_permission'),(7,'Can add group',3,'add_group'),(8,'Can change group',3,'change_group'),(9,'Can delete group',3,'delete_group'),(10,'Can add user',4,'add_user'),(11,'Can change user',4,'change_user'),(12,'Can delete user',4,'delete_user'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session'),(19,'Can add tag',7,'add_tag'),(20,'Can change tag',7,'change_tag'),(21,'Can delete tag',7,'delete_tag'),(22,'Can add question',8,'add_question'),(23,'Can change question',8,'change_question'),(24,'Can delete question',8,'delete_question'),(28,'Can add answer',10,'add_answer'),(29,'Can change answer',10,'change_answer'),(30,'Can delete answer',10,'delete_answer'),(31,'Can add profile',11,'add_profile'),(32,'Can change profile',11,'change_profile'),(33,'Can delete profile',11,'delete_profile'),(34,'Can add question_ vote',12,'add_question_vote'),(35,'Can change question_ vote',12,'change_question_vote'),(36,'Can delete question_ vote',12,'delete_question_vote'),(37,'Can add answer_ vote',13,'add_answer_vote'),(38,'Can change answer_ vote',13,'change_answer_vote'),(39,'Can delete answer_ vote',13,'delete_answer_vote'),(40,'Can add favorite_ question',14,'add_favorite_question'),(41,'Can change favorite_ question',14,'change_favorite_question'),(42,'Can delete favorite_ question',14,'delete_favorite_question');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (2,'f89c1acd3bbd20dfba932a7f35076895',NULL,0,'849351660@qq.com','','','849351660@qq.com',1,0,'2015-12-02 17:17:16'),(3,'9be2b1276b1e7f451e9a52ec77c697be',NULL,0,'384618227@qq.com','','','384618227@qq.com',1,0,'2015-12-03 15:24:09'),(4,'b1a0ac1f5952f020463058d0e4818cb6',NULL,0,'501384870@qq.com','','','501384870@qq.com',1,0,'2015-12-03 15:44:50');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_33ac548dcf5f8e37_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_33ac548dcf5f8e37_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_4b5ed4ffdb8fd9b0_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`permission_id`),
  KEY `auth_user_u_permission_id_384b62483d7071f0_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_user_user_permissi_user_id_7f0938558328534a_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `auth_user_u_permission_id_384b62483d7071f0_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `avote`
--

DROP TABLE IF EXISTS `avote`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `avote` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ct` datetime NOT NULL,
  `vote_type` int(11) NOT NULL,
  `answer_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `avote_user_id_7a50e6df09bbdcfd_uniq` (`user_id`,`answer_id`),
  KEY `avote_answer_id_696c69f9d0c88752_fk_answer_id` (`answer_id`),
  CONSTRAINT `avote_answer_id_696c69f9d0c88752_fk_answer_id` FOREIGN KEY (`answer_id`) REFERENCES `answer` (`id`),
  CONSTRAINT `avote_user_id_59d97086cae0aa73_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `avote`
--

LOCK TABLES `avote` WRITE;
/*!40000 ALTER TABLE `avote` DISABLE KEYS */;
INSERT INTO `avote` VALUES (2,'2015-12-15 15:12:33',2,4,2),(3,'2015-12-25 17:33:55',1,5,2);
/*!40000 ALTER TABLE `avote` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `djang_content_type_id_697914295151027a_fk_django_content_type_id` (`content_type_id`),
  KEY `django_admin_log_user_id_52fdd58701c5f563_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_user_id_52fdd58701c5f563_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `djang_content_type_id_697914295151027a_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_45f3b1d93ec8c61c_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(10,'qadmin','answer'),(13,'qadmin','answer_vote'),(14,'qadmin','favorite_question'),(11,'qadmin','profile'),(8,'qadmin','question'),(12,'qadmin','question_vote'),(7,'qadmin','tag'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2015-12-01 12:12:18'),(2,'auth','0001_initial','2015-12-01 12:12:18'),(3,'admin','0001_initial','2015-12-01 12:12:18'),(4,'contenttypes','0002_remove_content_type_name','2015-12-01 12:12:18'),(5,'auth','0002_alter_permission_name_max_length','2015-12-01 12:12:18'),(6,'auth','0003_alter_user_email_max_length','2015-12-01 12:12:18'),(7,'auth','0004_alter_user_username_opts','2015-12-01 12:12:18'),(8,'auth','0005_alter_user_last_login_null','2015-12-01 12:12:18'),(9,'auth','0006_require_contenttypes_0002','2015-12-01 12:12:18'),(10,'qadmin','0001_initial','2015-12-01 12:12:19'),(11,'qadmin','0002_question_answers','2015-12-01 12:12:19'),(12,'qadmin','0003_auto_20151201_1722','2015-12-01 12:12:19'),(13,'sessions','0001_initial','2015-12-01 12:12:19'),(14,'qadmin','0004_auto_20151202_1756','2015-12-02 10:40:34'),(15,'qadmin','0005_auto_20151204_1038','2015-12-04 10:29:38'),(16,'qadmin','0006_tag_ct','2015-12-09 09:00:47'),(17,'qadmin','0007_profile','2015-12-09 09:00:47'),(18,'qadmin','0008_auto_20151209_1416','2015-12-09 09:10:30'),(19,'qadmin','0009_auto_20151209_1417','2015-12-09 09:10:31'),(20,'qadmin','0010_auto_20151209_1427','2015-12-09 09:10:31'),(21,'qadmin','0011_auto_20151215_0652','2015-12-15 06:52:31');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_de54fa62` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fquestion`
--

DROP TABLE IF EXISTS `fquestion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fquestion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ct` datetime NOT NULL,
  `question_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `fquestion_user_id_208730645acae384_uniq` (`user_id`,`question_id`),
  KEY `fquestion_7aa0f6ee` (`question_id`),
  KEY `fquestion_e8701ad4` (`user_id`),
  CONSTRAINT `fquestion_question_id_10b97e6455abef05_fk_question_id` FOREIGN KEY (`question_id`) REFERENCES `question` (`id`),
  CONSTRAINT `fquestion_user_id_5458b7e754ab22c0_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fquestion`
--

LOCK TABLES `fquestion` WRITE;
/*!40000 ALTER TABLE `fquestion` DISABLE KEYS */;
INSERT INTO `fquestion` VALUES (3,'2015-12-15 15:16:24',8,2),(4,'2015-12-25 17:34:02',9,2);
/*!40000 ALTER TABLE `fquestion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profile`
--

DROP TABLE IF EXISTS `profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `profile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pic` varchar(100) NOT NULL,
  `reputation` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `aboutme` varchar(500) DEFAULT NULL,
  `birthday` datetime,
  `location` varchar(100),
  `realname` varchar(50),
  PRIMARY KEY (`id`),
  KEY `profile_user_id_5dcb08ca1c244c57_fk_auth_user_id` (`user_id`),
  CONSTRAINT `profile_user_id_5dcb08ca1c244c57_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profile`
--

LOCK TABLES `profile` WRITE;
/*!40000 ALTER TABLE `profile` DISABLE KEYS */;
INSERT INTO `profile` VALUES (1,'/Public/img/profile/20151209175453.png',0,2,'I am a developer.','1989-03-03 00:00:00','北京市海淀区西二旗领袖新硅谷D区','刘帅');
/*!40000 ALTER TABLE `profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `question`
--

DROP TABLE IF EXISTS `question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `question` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(150) NOT NULL,
  `content` longtext NOT NULL,
  `ct` datetime NOT NULL,
  `votes` int(11) NOT NULL,
  `answers` int(11) NOT NULL,
  `views` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `favorite` int(11) NOT NULL,
  `summary` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `question_71422c2d` (`user_id`),
  CONSTRAINT `question_user_id_4407e5352faf3d8d_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question`
--

LOCK TABLES `question` WRITE;
/*!40000 ALTER TABLE `question` DISABLE KEYS */;
INSERT INTO `question` VALUES (2,'sss','sss','2015-12-02 17:32:03',0,0,0,2,0,''),(3,'如何修改mysql数据库的root密码？','root 用户的密码修改\r\nroot 设置密码\r\nroot 重置密码','2015-12-02 17:33:56',0,1,0,2,0,''),(4,'手机发表问题测试','可口可乐了紧急集合给~把它能否极泰来把把','2015-12-02 18:46:57',0,2,0,2,0,''),(5,'sss','sefef','2015-12-03 15:52:46',0,0,0,4,0,''),(6,'','','2015-12-04 18:47:57',0,0,0,2,0,''),(7,'linux 如何删除 文件夹','<p><span style=\"color: rgb(51, 51, 51); font-family: &#39;Microsoft Yahei&#39;, 微软雅黑, arial, 宋体, sans-serif; line-height: 28px; text-align: justify; background-color: rgb(255, 255, 255);\">rm -rf /var/log/httpd/access</span><br style=\"color: rgb(51, 51, 51); font-family: &#39;Microsoft Yahei&#39;, 微软雅黑, arial, 宋体, sans-serif; line-height: 28px; text-align: justify; white-space: normal; background-color: rgb(255, 255, 255);\"/><span style=\"color: rgb(51, 51, 51); font-family: &#39;Microsoft Yahei&#39;, 微软雅黑, arial, 宋体, sans-serif; line-height: 28px; text-align: justify; background-color: rgb(255, 255, 255);\">将会删除/var/log/httpd/access目录以及其下所有文件、文件夹</span></p>','2015-12-09 18:03:06',0,0,0,2,0,''),(8,'centos ifconfig command not found','<ol class=\" list-paddingleft-2\" style=\"list-style-type: decimal;\"><li><p>确定可以上网 ping www.baidu.com</p></li><li><p>安装net-tools</p><p>yum install net-tools</p></li></ol><p><br/></p><p>3. 安装完毕后即可使用ifconfig</p>','2015-12-11 16:41:32',1,1,0,2,1,''),(9,'vim 如何删除所有的文本？','<p>对vim的命令不熟悉，请大神指教！</p>','2015-12-25 17:31:04',0,1,0,2,1,'对vim的命令不熟悉，请大神指教！');
/*!40000 ALTER TABLE `question` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `question_tags`
--

DROP TABLE IF EXISTS `question_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `question_tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `question_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `question_id` (`question_id`,`tag_id`),
  KEY `question_tags_tag_id_5b5936ee2a5adaec_fk_tag_id` (`tag_id`),
  CONSTRAINT `question_tags_question_id_7d06d7df83352f81_fk_question_id` FOREIGN KEY (`question_id`) REFERENCES `question` (`id`),
  CONSTRAINT `question_tags_tag_id_5b5936ee2a5adaec_fk_tag_id` FOREIGN KEY (`tag_id`) REFERENCES `tag` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question_tags`
--

LOCK TABLES `question_tags` WRITE;
/*!40000 ALTER TABLE `question_tags` DISABLE KEYS */;
INSERT INTO `question_tags` VALUES (1,6,2),(2,7,3),(3,8,10),(5,9,11),(4,9,12);
/*!40000 ALTER TABLE `question_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qvote`
--

DROP TABLE IF EXISTS `qvote`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `qvote` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ct` datetime NOT NULL,
  `vote_type` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `qvote_user_id_2425b80aa246973f_uniq` (`user_id`,`question_id`),
  KEY `qvote_7aa0f6ee` (`question_id`),
  KEY `qvote_e8701ad4` (`user_id`),
  CONSTRAINT `qvote_question_id_339d4a3d9c1f9a42_fk_question_id` FOREIGN KEY (`question_id`) REFERENCES `question` (`id`),
  CONSTRAINT `qvote_user_id_3990daa4752bdf43_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qvote`
--

LOCK TABLES `qvote` WRITE;
/*!40000 ALTER TABLE `qvote` DISABLE KEYS */;
INSERT INTO `qvote` VALUES (16,'2015-12-15 15:11:33',1,8,2);
/*!40000 ALTER TABLE `qvote` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tag`
--

DROP TABLE IF EXISTS `tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `desc` longtext,
  `user_id` int(11) NOT NULL,
  `reputation` int(11) NOT NULL,
  `ct` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `tag_user_id_39770cadddf172c_fk_auth_user_id` (`user_id`),
  CONSTRAINT `tag_user_id_39770cadddf172c_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tag`
--

LOCK TABLES `tag` WRITE;
/*!40000 ALTER TABLE `tag` DISABLE KEYS */;
INSERT INTO `tag` VALUES (2,'php','language',2,0,'2015-12-07 03:04:36'),(3,'linux','linux',2,1,'2015-12-09 18:02:39'),(4,'c#','c#',2,0,'2015-12-09 18:23:25'),(5,'java','java',2,0,'2015-12-09 18:23:34'),(6,'javascript','javascript',2,0,'2015-12-09 18:23:48'),(7,'ruby','ruby',2,0,'2015-12-09 18:24:05'),(8,'html5','html5',2,0,'2015-12-09 18:24:18'),(9,'python','python',2,0,'2015-12-09 18:24:42'),(10,'centos','centos',2,1,'2015-12-11 16:41:20'),(11,'vi','vi',2,1,'2015-12-25 17:30:34'),(12,'vim','vim',2,1,'2015-12-25 17:30:45');
/*!40000 ALTER TABLE `tag` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-12-25 10:27:15
