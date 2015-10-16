-- MySQL dump 10.13  Distrib 5.5.43, for debian-linux-gnu (x86_64)
--
-- Host: 0.0.0.0    Database: c9
-- ------------------------------------------------------
-- Server version	5.5.43-0ubuntu0.14.04.1

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
-- Table structure for table `localization`
--

DROP TABLE IF EXISTS `localization`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `localization` (
  `name` char(8) NOT NULL,
  `value` varchar(70) NOT NULL,
  `culture` enum('en','ru') NOT NULL,
  KEY `index_name` (`name`(2))
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `localization`
--

LOCK TABLES `localization` WRITE;
/*!40000 ALTER TABLE `localization` DISABLE KEYS */;
INSERT INTO `localization` VALUES ('CNTCONDB','Не удалось подключиться к MySQL: ','ru'),('CNTCONDB','Cannot connect to MySQL: ','en'),('GOTOLOGN','Перейти на форму входа','ru'),('GOTOLOGN','Go to login form','en'),('YPROFILE','Ваш профиль','ru'),('YPROFILE','Your profile','en'),('REGISTRD','Пользователь успешно зарегистрирован','ru'),('REGISTRD','User successfully registered','en'),('BADFILE0','Некорректный файл!','ru'),('BADFILE0','Bad file!','en'),('FILELDED','Файл корректен и был успешно загружен.','ru'),('FILELDED','File successfully loaded.','en'),('IMGALLWD','Разрешнены только изображения формата gif, jpg или png','ru'),('IMGALLWD','Only  gif, jpg or png are allowed','en'),('WRUSERDT','Неправильные пользовательские данные!','ru'),('WRUSERDT','Wrong user data!','en'),('WRSERVDT','Ошибка служебных данных!','ru'),('WRSERVDT','Wrong service data!','en'),('WRLOGNDT','Данные для входа указаны неверно!','ru'),('WRLOGNDT','Wrong login data!','en'),('NOLOGIN0','Пользователь с таким логином не зарегистрирован в системе','ru'),('NOLOGIN0','There is no user with such login','en');
/*!40000 ALTER TABLE `localization` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `login` varchar(8) NOT NULL,
  `password` varchar(50) NOT NULL,
  `email` varchar(40) NOT NULL,
  `photoname` char(11) NOT NULL,
  KEY `index_login` (`login`(3))
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('Sergey','admin','e-type@bk.ru','1840031.jpg'),('test','bumbum','abc@kvak.ru','1676719.jpg'),('barabulk','agabombom','hohoho@ogo.net','1250093.jpg');
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

-- Dump completed on 2015-10-11 10:12:57
