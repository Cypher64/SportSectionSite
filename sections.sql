-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: sportuvni_sections
-- ------------------------------------------------------
-- Server version	8.0.36

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
-- Table structure for table `grupa`
--

DROP TABLE IF EXISTS `grupa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `grupa` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `ID_Section` int NOT NULL,
  `Nazva` varchar(20) NOT NULL,
  `Za_vikom` enum('Молодша','Старша') NOT NULL,
  `Za_statyu` enum('Чоловіча','Жіноча','Змішана') NOT NULL,
  `Miscya` int NOT NULL,
  `Vilni_miscya` int NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `ID_Section` (`ID_Section`),
  CONSTRAINT `grupa_ibfk_1` FOREIGN KEY (`ID_Section`) REFERENCES `section` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grupa`
--

LOCK TABLES `grupa` WRITE;
/*!40000 ALTER TABLE `grupa` DISABLE KEYS */;
INSERT INTO `grupa` VALUES (1,1,'БМ-01','Молодша','Чоловіча',16,2),(2,1,'БМ-02','Старша','Чоловіча',16,4),(3,1,'БС-03','Молодша','Жіноча',16,8),(4,1,'БС-04','Старша','Жіноча',16,12),(5,2,'БКМ-01','Молодша','Чоловіча',10,1),(6,2,'БКМ-02','Старша','Чоловіча',10,2),(7,2,'БКС-01','Молодша','Жіноча',10,3),(8,2,'БКС-02','Старша','Жіноча',10,5),(9,3,'ФКМ-01','Молодша','Чоловіча',22,3),(10,3,'ФКМ-02','Старша','Чоловіча',22,0),(11,3,'ФКС-01','Молодша','Жіноча',22,11),(12,3,'ФКС-02','Старша','Жіноча',22,14),(13,4,'ТМ-01','Молодша','Змішана',22,6),(14,4,'ТС-04','Старша','Змішана',22,12),(15,5,'КМ-01','Молодша','Змішана',20,6),(16,5,'КС-04','Старша','Змішана',20,10),(17,6,'ВКМ-01','Молодша','Змішана',12,0),(18,6,'ВКМ-02','Молодша','Змішана',12,7),(19,6,'ВКС-01','Старша','Змішана',12,6),(20,6,'ВКС-02','Старша','Змішана',12,10),(21,7,'ДМ-01','Молодша','Змішана',18,4),(22,7,'ДС-04','Старша','Змішана',18,10),(23,8,'ЛМ-01','Молодша','Змішана',20,5),(24,8,'ЛС-04','Старша','Змішана',20,12),(25,9,'НМ-01','Молодша','Змішана',16,10),(26,9,'НС-04','Старша','Змішана',16,4),(27,10,'ВТМ-01','Молодша','Змішана',10,6),(28,10,'ВТС-04','Старша','Змішана',10,2),(29,11,'ФМ-01','Молодша','Змішана',14,4),(30,11,'ФС-04','Старша','Змішана',14,7),(31,12,'КСМ-01','Молодша','Чоловіча',10,3),(32,12,'КСМ-02','Старша','Чоловіча',10,4),(33,12,'КСС-03','Молодша','Жіноча',10,10),(34,12,'КСС-04','Старша','Жіноча',10,5);
/*!40000 ALTER TABLE `grupa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `section`
--

DROP TABLE IF EXISTS `section`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `section` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Nazva` varchar(30) NOT NULL,
  `Misceznahodjennya` varchar(100) NOT NULL,
  `Miscya` int NOT NULL,
  `Vilni_miscya` int NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `section`
--

LOCK TABLES `section` WRITE;
/*!40000 ALTER TABLE `section` DISABLE KEYS */;
INSERT INTO `section` VALUES (1,'Бокс','в. Зелена 10а',64,30),(2,'Баскетбол','в. Академіка Сахарова 133/13',40,11),(3,'Футбол','в. Кульпарківська 3/1',88,27),(4,'Тхеквандо','в. Коновальца 210б',44,18),(5,'Карате','в. Коновальца 210б',40,16),(6,'Волейбол','в. Стрийська 137/7',48,30),(7,'Дзюдо','в. Зелена 10',36,14),(8,'Легка Атлетика','в. Стрийська 137/7',40,17),(9,'Настільний теніс','в. Героїв УПА 148/8',32,14),(10,'Великий теніс','в. Героїв УПА 148/8',20,8),(11,'Фехтування','в. С. Бандери 44б',28,9),(12,'Кіберспорт','в. Метрополита Андрея Шептицького 34',40,22);
/*!40000 ALTER TABLE `section` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trener`
--

DROP TABLE IF EXISTS `trener`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trener` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `ID_Section` int NOT NULL,
  `ID_Grup` int NOT NULL,
  `Prizvushche` varchar(30) NOT NULL,
  `Imya` varchar(30) NOT NULL,
  `Vik` int NOT NULL,
  `Nomer_telefony` varchar(12) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `ID_Section` (`ID_Section`),
  KEY `ID_Grup` (`ID_Grup`),
  CONSTRAINT `trener_ibfk_1` FOREIGN KEY (`ID_Section`) REFERENCES `section` (`ID`),
  CONSTRAINT `trener_ibfk_2` FOREIGN KEY (`ID_Grup`) REFERENCES `grupa` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trener`
--

LOCK TABLES `trener` WRITE;
/*!40000 ALTER TABLE `trener` DISABLE KEYS */;
INSERT INTO `trener` VALUES (1,1,1,'Петренко','Олексій',35,'0931234567'),(2,1,2,'Коваль','Микола',30,'0953456789'),(3,1,3,'Шевченко','Іван',28,'0964567890'),(4,1,4,'Іванченко','Сергій',45,'0685678901'),(5,2,5,'Гнатюк','Богдан',38,'0696789012'),(6,2,6,'Зубенко','Дмитро',32,'0927890123'),(7,2,7,'Бондаренко','Олег',29,'0978901234'),(8,2,8,'Кравченко','Юрій',42,'0939012345'),(9,3,9,'Мельник','Петро',33,'0670123456'),(10,3,10,'Дорошенко','Андрій',27,'0951234567'),(11,3,11,'Лисенко','Максим',31,'0962345678'),(12,3,12,'Олійник','Тарас',39,'0683456789'),(13,4,13,'Левченко','Ігор',34,'0694567890'),(14,4,14,'Білик','Олександр',37,'0925678901'),(15,5,15,'Мороз','Володимир',36,'0937890123'),(16,5,16,'Гриценко','Євген',31,'0678901234'),(17,6,17,'Пономаренко','Артем',29,'0959012345'),(18,6,18,'Черненко','Микита',41,'0681234567'),(19,6,19,'Кузьменко','Станіслав',30,'0692345678'),(20,6,20,'Ткаченко','Леонід',35,'0923456789'),(21,7,21,'Василенко','Олександр',33,'0935678901'),(22,7,22,'Данилюк','Артем',40,'0676789012'),(23,8,23,'Петрук','Віктор',29,'0957890123'),(24,8,24,'Журавель','Денис',27,'0968901234'),(25,9,25,'Онопко','Юлія',36,'0689012345'),(26,9,26,'Мартинюк','Лариса',43,'0690123456'),(27,10,27,'Козак','Ірина',29,'0972345678'),(28,10,28,'Таран','Ольга',38,'0933456789'),(29,11,29,'Савченко','Марина',31,'0674567890'),(30,11,30,'Романенко','Катерина',34,'0955678901'),(31,12,31,'Костилєв','Олександр',28,'099345544'),(32,12,32,'Триноженко','Арсеній',42,'0950342375'),(33,12,33,'Тисленко','Даниїл',37,'0671110911'),(34,12,34,'Сухарєв','Іван',45,'0967483043');
/*!40000 ALTER TABLE `trener` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trenyvannya`
--

DROP TABLE IF EXISTS `trenyvannya`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trenyvannya` (
  `ID_Trenera` int NOT NULL,
  `Data` date NOT NULL,
  `Goduna` time NOT NULL,
  KEY `ID_Trenera` (`ID_Trenera`),
  CONSTRAINT `trenyvannya_ibfk_1` FOREIGN KEY (`ID_Trenera`) REFERENCES `trener` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trenyvannya`
--

LOCK TABLES `trenyvannya` WRITE;
/*!40000 ALTER TABLE `trenyvannya` DISABLE KEYS */;
INSERT INTO `trenyvannya` VALUES (1,'2024-11-13','18:00:00'),(1,'2024-11-03','16:30:00'),(1,'2024-11-30','16:30:00'),(1,'2024-11-05','18:00:00'),(1,'2024-11-04','15:00:00'),(1,'2024-11-29','16:30:00'),(1,'2024-11-08','15:00:00'),(1,'2024-11-10','18:00:00'),(2,'2024-11-21','19:30:00'),(2,'2024-11-01','18:00:00'),(2,'2024-11-01','16:30:00'),(2,'2024-11-15','16:30:00'),(2,'2024-11-13','19:30:00'),(2,'2024-11-13','16:30:00'),(2,'2024-11-13','19:30:00'),(2,'2024-11-20','15:00:00'),(3,'2024-11-06','15:00:00'),(3,'2024-11-23','19:30:00'),(3,'2024-11-11','15:00:00'),(3,'2024-11-01','15:00:00'),(3,'2024-11-05','18:00:00'),(3,'2024-11-23','19:30:00'),(3,'2024-11-18','18:00:00'),(3,'2024-11-11','19:30:00'),(4,'2024-11-07','18:00:00'),(4,'2024-11-04','19:30:00'),(4,'2024-11-11','19:30:00'),(4,'2024-11-04','15:00:00'),(4,'2024-11-11','16:30:00'),(4,'2024-11-11','19:30:00'),(4,'2024-11-04','15:00:00'),(4,'2024-11-07','18:00:00'),(5,'2024-11-01','19:30:00'),(5,'2024-11-20','16:30:00'),(5,'2024-11-19','15:00:00'),(5,'2024-11-19','19:30:00'),(5,'2024-11-04','15:00:00'),(5,'2024-11-17','15:00:00'),(5,'2024-11-05','15:00:00'),(5,'2024-11-25','15:00:00'),(6,'2024-11-23','15:00:00'),(6,'2024-11-26','15:00:00'),(6,'2024-11-29','16:30:00'),(6,'2024-11-28','16:30:00'),(6,'2024-11-22','15:00:00'),(6,'2024-11-07','19:30:00'),(6,'2024-11-16','19:30:00'),(6,'2024-11-17','18:00:00'),(7,'2024-11-17','19:30:00'),(7,'2024-11-20','18:00:00'),(7,'2024-11-29','19:30:00'),(7,'2024-11-29','18:00:00'),(7,'2024-11-30','18:00:00'),(7,'2024-11-23','15:00:00'),(7,'2024-11-15','19:30:00'),(7,'2024-11-07','16:30:00'),(8,'2024-11-01','15:00:00'),(8,'2024-11-14','19:30:00'),(8,'2024-11-28','19:30:00'),(8,'2024-12-01','15:00:00'),(8,'2024-11-29','15:00:00'),(8,'2024-11-17','16:30:00'),(8,'2024-11-19','18:00:00'),(8,'2024-11-21','15:00:00'),(9,'2024-11-05','15:00:00'),(9,'2024-11-23','18:00:00'),(9,'2024-11-15','18:00:00'),(9,'2024-11-08','15:00:00'),(9,'2024-11-18','18:00:00'),(9,'2024-11-09','18:00:00'),(9,'2024-11-01','16:30:00'),(9,'2024-11-30','18:00:00'),(10,'2024-11-03','18:00:00'),(10,'2024-11-20','16:30:00'),(10,'2024-11-03','16:30:00'),(10,'2024-11-09','16:30:00'),(10,'2024-11-03','15:00:00'),(10,'2024-11-29','19:30:00'),(10,'2024-11-01','16:30:00'),(10,'2024-11-07','16:30:00'),(11,'2024-11-25','15:00:00'),(11,'2024-11-11','16:30:00'),(11,'2024-11-13','15:00:00'),(11,'2024-11-11','16:30:00'),(11,'2024-11-04','16:30:00'),(11,'2024-11-08','15:00:00'),(11,'2024-11-13','16:30:00'),(11,'2024-11-16','16:30:00'),(12,'2024-11-22','15:00:00'),(12,'2024-11-15','15:00:00'),(12,'2024-11-01','18:00:00'),(12,'2024-11-23','16:30:00'),(12,'2024-11-16','18:00:00'),(12,'2024-11-01','18:00:00'),(12,'2024-12-01','15:00:00'),(12,'2024-11-12','18:00:00'),(13,'2024-11-07','19:30:00'),(13,'2024-11-13','19:30:00'),(13,'2024-11-25','15:00:00'),(13,'2024-11-21','16:30:00'),(13,'2024-11-18','19:30:00'),(13,'2024-11-18','16:30:00'),(13,'2024-11-23','19:30:00'),(13,'2024-11-20','19:30:00'),(14,'2024-11-17','19:30:00'),(14,'2024-11-12','19:30:00'),(14,'2024-11-04','15:00:00'),(14,'2024-11-27','15:00:00'),(14,'2024-12-01','18:00:00'),(14,'2024-11-29','19:30:00'),(14,'2024-11-21','18:00:00'),(14,'2024-11-01','16:30:00'),(15,'2024-11-17','18:00:00'),(15,'2024-11-25','19:30:00'),(15,'2024-11-03','19:30:00'),(15,'2024-11-17','16:30:00'),(15,'2024-11-10','16:30:00'),(15,'2024-11-25','19:30:00'),(15,'2024-11-07','16:30:00'),(15,'2024-11-27','16:30:00'),(16,'2024-11-09','15:00:00'),(16,'2024-11-12','15:00:00'),(16,'2024-11-22','19:30:00'),(16,'2024-11-25','15:00:00'),(16,'2024-11-26','19:30:00'),(16,'2024-11-14','15:00:00'),(16,'2024-11-24','15:00:00'),(16,'2024-11-19','16:30:00'),(17,'2024-11-11','16:30:00'),(17,'2024-11-28','16:30:00'),(17,'2024-11-03','16:30:00'),(17,'2024-11-24','18:00:00'),(17,'2024-11-19','16:30:00'),(17,'2024-11-21','16:30:00'),(17,'2024-11-12','16:30:00'),(17,'2024-11-07','18:00:00'),(18,'2024-11-08','18:00:00'),(18,'2024-11-28','19:30:00'),(18,'2024-11-13','18:00:00'),(18,'2024-11-25','15:00:00'),(18,'2024-11-14','18:00:00'),(18,'2024-11-06','19:30:00'),(18,'2024-11-10','16:30:00'),(18,'2024-11-14','16:30:00'),(19,'2024-11-09','16:30:00'),(19,'2024-11-18','16:30:00'),(19,'2024-11-04','18:00:00'),(19,'2024-11-12','15:00:00'),(19,'2024-11-01','16:30:00'),(19,'2024-11-27','15:00:00'),(19,'2024-11-04','15:00:00'),(19,'2024-11-07','18:00:00'),(20,'2024-11-25','19:30:00'),(20,'2024-11-15','16:30:00'),(20,'2024-11-22','15:00:00'),(20,'2024-11-28','19:30:00'),(20,'2024-11-20','18:00:00'),(20,'2024-11-05','19:30:00'),(20,'2024-11-03','18:00:00'),(20,'2024-12-01','15:00:00'),(21,'2024-11-06','19:30:00'),(21,'2024-11-24','15:00:00'),(21,'2024-11-15','19:30:00'),(21,'2024-11-09','18:00:00'),(21,'2024-11-05','19:30:00'),(21,'2024-11-03','18:00:00'),(21,'2024-11-11','18:00:00'),(21,'2024-11-18','16:30:00'),(22,'2024-11-23','18:00:00'),(22,'2024-11-15','15:00:00'),(22,'2024-11-18','16:30:00'),(22,'2024-11-19','15:00:00'),(22,'2024-11-03','19:30:00'),(22,'2024-11-05','15:00:00'),(22,'2024-11-01','19:30:00'),(22,'2024-12-01','18:00:00'),(23,'2024-11-20','18:00:00'),(23,'2024-11-11','19:30:00'),(23,'2024-11-24','18:00:00'),(23,'2024-11-13','16:30:00'),(23,'2024-11-22','16:30:00'),(23,'2024-11-17','18:00:00'),(23,'2024-11-26','15:00:00'),(23,'2024-11-28','15:00:00'),(24,'2024-11-14','18:00:00'),(24,'2024-11-08','18:00:00'),(24,'2024-11-27','15:00:00'),(24,'2024-11-22','16:30:00'),(24,'2024-11-20','15:00:00'),(24,'2024-11-20','19:30:00'),(24,'2024-11-13','16:30:00'),(24,'2024-11-01','18:00:00'),(25,'2024-11-15','16:30:00'),(25,'2024-11-27','18:00:00'),(25,'2024-12-01','16:30:00'),(25,'2024-11-29','16:30:00'),(25,'2024-11-15','15:00:00'),(25,'2024-11-27','15:00:00'),(25,'2024-11-04','15:00:00'),(25,'2024-11-07','18:00:00'),(26,'2024-11-27','15:00:00'),(26,'2024-11-09','19:30:00'),(26,'2024-11-28','18:00:00'),(26,'2024-11-15','16:30:00'),(26,'2024-11-17','16:30:00'),(26,'2024-11-24','16:30:00'),(26,'2024-11-19','19:30:00'),(26,'2024-11-13','16:30:00'),(27,'2024-11-09','19:30:00'),(27,'2024-11-17','15:00:00'),(27,'2024-11-22','16:30:00'),(27,'2024-11-07','16:30:00'),(27,'2024-11-26','15:00:00'),(27,'2024-11-24','15:00:00'),(27,'2024-11-03','15:00:00'),(27,'2024-11-18','16:30:00'),(28,'2024-11-06','18:00:00'),(28,'2024-11-02','15:00:00'),(28,'2024-11-20','18:00:00'),(28,'2024-11-05','19:30:00'),(28,'2024-11-11','19:30:00'),(28,'2024-11-29','15:00:00'),(28,'2024-11-07','18:00:00'),(28,'2024-11-03','19:30:00'),(29,'2024-11-26','18:00:00'),(29,'2024-11-25','19:30:00'),(29,'2024-11-18','19:30:00'),(29,'2024-11-11','16:30:00'),(29,'2024-11-22','16:30:00'),(29,'2024-11-27','15:00:00'),(29,'2024-11-11','15:00:00'),(29,'2024-11-24','16:30:00'),(30,'2024-11-05','19:30:00'),(30,'2024-11-02','16:30:00'),(30,'2024-11-11','15:00:00'),(30,'2024-12-01','16:30:00'),(30,'2024-11-21','16:30:00'),(30,'2024-11-19','15:00:00'),(30,'2024-11-15','15:00:00'),(30,'2024-11-08','19:30:00'),(31,'2024-11-15','19:30:00'),(31,'2024-11-24','16:30:00'),(31,'2024-11-15','16:30:00'),(31,'2024-11-05','19:30:00'),(31,'2024-11-17','16:30:00'),(31,'2024-11-24','19:30:00'),(31,'2024-11-13','15:00:00'),(31,'2024-11-27','18:00:00'),(32,'2024-11-20','15:00:00'),(32,'2024-11-01','18:00:00'),(32,'2024-11-02','16:30:00'),(32,'2024-11-14','15:00:00'),(32,'2024-11-21','19:30:00'),(32,'2024-11-25','18:00:00'),(32,'2024-11-28','16:30:00'),(32,'2024-11-22','15:00:00'),(33,'2024-11-11','16:30:00'),(33,'2024-12-01','18:00:00'),(33,'2024-11-15','16:30:00'),(33,'2024-11-02','16:30:00'),(33,'2024-12-01','18:00:00'),(33,'2024-11-29','19:30:00'),(33,'2024-11-01','15:00:00'),(33,'2024-11-25','18:00:00'),(34,'2024-11-05','15:00:00'),(34,'2024-11-12','16:30:00'),(34,'2024-11-30','18:00:00'),(34,'2024-11-23','15:00:00'),(34,'2024-11-13','18:00:00'),(34,'2024-11-09','15:00:00'),(34,'2024-11-08','18:00:00'),(34,'2024-11-15','16:30:00');
/*!40000 ALTER TABLE `trenyvannya` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `ID_Ychasnuka` int NOT NULL,
  `password` varchar(100) NOT NULL,
  KEY `ID_Ychasnuka` (`ID_Ychasnuka`),
  CONSTRAINT `user_ibfk_1` FOREIGN KEY (`ID_Ychasnuka`) REFERENCES `ychasnuk` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'$2y$10$B1OdKrOJyZLWiK6na0DP5uuz4a.M2SUGFfy0x8tLdhWGVFrFjqfEm'),(2,'$2y$10$uEB.WZcg8a78nqgvMeVtluoLs8rRC6KJNOGydXahR9m15RfsIULDu'),(3,'$2y$10$ExKwqXCM0KEuah7iV5LYaukYnTzSikyAPCoB5k2mULmvZ19gYoRQm'),(4,'$2y$10$QVFc2Hn7sHZ2oc9LN/qGteR38nKB3DC.QoOf0JSROObsCAPUV4kBS'),(5,'$2y$10$PNPjBCmLXoMO3udiETRC8O6DqPFCE00YSI9GlU0KkxmIFevSFWKsu'),(6,'$2y$10$DGiCC80borTHH59c1PLOp.Y7jqZhfAcEWyVEMT6.fXXpYbVnGze6a'),(7,'$2y$10$TYyfSak9OhEOzmLQYGkaTeWKFFWRtcxS7RjVA6swMYTmxYYvL8mIO'),(8,'$2y$10$Z0hKtHl6Lc3ivirf9NFiKObwNm5IK68n9ftuErXRTW7sgmIBBlaGm'),(9,'$2y$10$IT2dHbjHRMSW/8ydJWKvEOE4v32mrp.H3GpvIjgs5hJnK4NgXsI56'),(10,'$2y$10$GaiqaAuZkpHlIujhHXpfBunG6PEH3ZDY8OkSl4xNOrzG7GoUXqXDS'),(11,'$2y$10$CVd3lESk53JK8ZgXA8LEcerfVv/oE25w81mKhPJEDsDhJ100uN7Vu'),(12,'$2y$10$bWBRBtPIl6RwhXr5JnLZlOvv9KXTjmvQApDDPYllkZm.4nVsJUe8i'),(13,'$2y$10$mJdmadSP7Wvb198wAYPIYOgHLHSLVr2Gdu25/yZXBYTSJkkYWWpXW'),(14,'$2y$10$tXNxMbNoQFyiWHRlc2DIsuk61FreIm1oXKtjD0WXHwQnIDvqalj4C'),(15,'$2y$10$RCTNnZpKVW744ifaA0TP5O4nDKFNnwIZoZs5E/GO88/xH3fjNCm6y'),(16,'$2y$10$M5jPUGUwC.mMWDkFpPECLeB3g0luWNvxD8r2Z2SdwHefGtZQAUKIe'),(18,'$2y$10$BDbTHQP6AhzN4KgMVY/Nuukiq4iR4azlIxpOW0Aacp5JzUNHgVwRK'),(19,'$2y$10$OAUvs777WepZ/NbXhlW.p.3FrVuW9O0xP6XVQhcM6j5COuumokkqu'),(20,'$2y$10$mGqioHuOMVmtKVZbbJ/JbuVr2Y6//dkcYWyMYo.n/7JF/atOXfof2'),(22,'$2y$10$Y03m73TXk/Yb0PqKRYWgju6U2x/xp8GE/ANByhF.pFzyM9ip3hLxm'),(24,'$2y$10$l./KS1DxBDfUxYcbcoi.Ke.GqxyBWiYd1qLzQ1geCjz9nu9ZWajNy'),(25,'$2y$10$QZNB3ocHCs3vfS5as63/wuMnOUen7HHyz9N/bABF3V3ZKC.gscc82'),(26,'$2y$10$HADKKLUgUyIaorCctQw5tuL88shoHJajgsMgiFHv5tyerkJu357N.'),(27,'$2y$10$E23KqHcubag4GKgKAaojaeKDrB/3YfN73iZg9QBLVpdwqegqQUWfK'),(28,'$2y$10$Y3C9hnSU879rogMvLDzNgeEepuI8IIqHYs68/I3zU6JEwiJd4Ne2K'),(30,'$2y$10$3HIENP1FVjIyWH1T87UajevijVFyU9nQpqsNEJFp2TdikpJWVHCXy'),(31,'$2y$10$c5nhSeZWbrGZjQcVpd1Wz.gk6lioq7IIG0Ijd4z/qSSOAgusXe.1u'),(32,'$2y$10$AAolzBE8yC8x1H8/MAq2j.mfybKIFP0lL5gaeQaD8huUqeoFNHoeG'),(33,'$2y$10$5bB52qErryGh9v7UK2GPUefcKpDg4OMaGT4cqa3kIwpvHJhGhDXOu'),(34,'$2y$10$SKbo4KG5zc8CSF082fztbOmkS2cQlyDqDhJV11XRASYeBC.h3FU26'),(35,'$2y$10$neDPDlhd23No0H68yhGeYueFzKvTZQlryrOrsbz0rmlQ/G282GKJu'),(36,'$2y$10$mTlU8zmkJ4I0jYStvkyPp.yjhK4PyKdiOP6Zvt4j.EudX3YtVGoEK'),(37,'$2y$10$JWyh5GmwwPVefjz8i.IWJeeuN4cX/E4ca/7IGsJ9ZiQWoKyVLd2/q'),(38,'$2y$10$Cp0WCQiuAr4w1Pl7uN90VeDKzL.iwt6qG4NgJz3m9jA73T2juejD6'),(39,'$2y$10$JJA0qN2vXHxpFFF8AORXVe8l6oq6mQJtSOXUjj/3TBSvXVMGZNiX2'),(40,'$2y$10$JaTPtLohe.yDL94icfdeM.kEiSU7UZBQaQjQemRvo5sEIeN/ZtXIO'),(41,'$2y$10$06pswmY2jLfhPyFP9dvgKe8MBO7PLbfEtZExmQBMhDDzw.eDlpRVK'),(42,'$2y$10$kqFk2uMPOh/wypjx5EwIWOPggdZoWgmdPckzmXw2kuB0QYLR2B8MS'),(43,'$2y$10$Ew8/ZyLTqeponbPtLXjSMeNzVwa/GwcjNBkYTZ5Dx5dOY7GM8s7vu'),(44,'$2y$10$VbFK6/YAHczJpkBbS4r1K.ZaEkjCCxhW66O97yTZWplopoHROyzIC'),(45,'$2y$10$sAfOhOYuVp6l5hQASkKlRObKCAB8WpXBXkJfacUzMkM8Pr4tJDOjm'),(46,'$2y$10$JFqD5bl/dLYmFQreenEyyOqezm1QTW/zGCzxfnqypJNynaE0Qss.K'),(47,'$2y$10$Wu8.tQUaJkoiHktFmrmRx.DNopbXQXM4t619NkLwfEDWdx.Q7t7ii'),(48,'$2y$10$ANecYvcCuc87b2lJPS6FHOm8ODvsiUDO/8q0s0ScZgYAoIF7OdFbG'),(49,'$2y$10$c3.XVYfYYdiDCji93cIYsO5W7s4E9HLsSgL7G7l/0uwzGGmN8rvga'),(50,'$2y$10$Vht1ltC.aNb0kyqrEHW39eo9kLh1rJ5bwt9sCHNaMq6NOaUVJKEH2'),(51,'$2y$10$cPozXhzKrn62.g5Kd0PJs.RBM4tFLR4co6.B1/yta5efMLSC2SaYS'),(52,'$2y$10$4iUT7Cmq8THRLNQCtOibP.aoq3iRX7vD5F5pBUz9l3AnubLHHhUKm'),(53,'$2y$10$o73pzfhMq98a3LfP.v3MN.evWG/BllICJcuDuKFH.SZ3EeEjyekMW'),(54,'$2y$10$yBKaiZ9wdZJlwmX/lD15nunDokH/rSTkTQNpLQg49feHO7fGFzqa.'),(55,'$2y$10$AOYEP0kiaLDyyCGvMXiynOXzWBtwwqbvSGS8GWPZVmsYDpTplx2UK'),(56,'$2y$10$F555dCD.7HBUGGbDuBdDz./UX7EEPnyPQGeSG3NobbB5/EQjgcuuO'),(57,'$2y$10$IUKpjI9fgEPV52AtbT9YGuAyvlnTDTYAZD7nlkYbzieBBB5SpvAUy'),(58,'$2y$10$EwTXsrp47.rullYJP7aP1.B3wvF61RFn.zYs7AD.J7wwGwVgaoQQS'),(59,'$2y$10$lfpxQAMPHNcI1mnOn3dnUezghwCbdRHhJFvoIWkIOr1yW6DU9h6vm'),(60,'$2y$10$zP0Vf.01SLVl9kTFecZn8OUwtEio9XD64rLR1FFzUZvLGtTkl72.2'),(61,'$2y$10$jVTNvqFVW.XzCDhlv/PYe.gGqo4hM9msUsgdX6Y9PFP9ts/l6SPJS'),(62,'$2y$10$Xt5ltwqPHCkPkuAsHf5rMudVKDAT9E5PRkGOm6t1nOMIqYo5P4Pt2'),(63,'$2y$10$UfpCFET44W/doydKR/YMJ.cXYn6P/7DnKJuD194f2bw5Y.mdPASGS'),(64,'$2y$10$lzlKXwy3XFcrg8l7fYgLYecRn1PctytZm4JN4bi1FWkZgoXioPOQu'),(65,'$2y$10$s5.clTnTeh/ETruLMQlJdul4ydFeev7fINQcuFMto9pNB6zfjkfwi'),(66,'$2y$10$A..kmf/5nkOFU9C9aLOGLO4TA23QCuZgqe1llKhmWzJCFVQef.4qS'),(67,'$2y$10$rBZlgMa9lQ7u8csgMiCApuZEFCewhN2Mbf68aGm2dA2LDU3Sx5pCS'),(68,'$2y$10$LtrTEEzk.1nR9cVZs7sqnOL.K/wCObjvgACmBw6ptVR17ay84Vy8e'),(69,'$2y$10$GCegxEU9xR2h..LtFilWLel0MDLtnJr9PRZrlUwgJBB6IAfVEb6KK'),(70,'$2y$10$AiedajmLnud5.Gx/4PMnNeeS8HDNKJ8ZDsIplB6NkqigHN0XNQd4W'),(71,'$2y$10$XAzvvQM6NoOf7oC.FqAMA.KHRzmmmk4fdEh4Fe8tX7kiCah6SUcZe'),(72,'$2y$10$8/M.rx7DT4H0ZMbcsfdil.WOjJ0vEwTMiJ5cd/cgvJBHaUW5bhBQa'),(73,'$2y$10$JF6p0QBwBMe44YdzS69lJe12LqgGKRYfzdHM8wgIa1zz0o4.qCUQG'),(74,'$2y$10$54B/0SGQ3P9FdRmljD1/4uEIOo7u4wJcMbSBia6jKdnkTOq/gV76u'),(75,'$2y$10$QqZj3c69EEsVJu21GlpaWeRHvLo3RNKksmVm/99giv6dmm4gl7kdG'),(76,'$2y$10$tNl6kyQowVWmabMzx67aa.Kpm9SsVyywDoMg8lTjuiHjpfxD5sgP2'),(77,'$2y$10$gOcoxvOQKtYhBMtgt5Q9gukuAajr7aQNXtegkkrBSrANHdz8vlPnC'),(78,'$2y$10$z3Ypn57YQOduggnOdXfBQu8iFOPKWcZHsE3K4mCjmWspAeIjBdeKO'),(79,'$2y$10$iXr1.WRCnHqnDVT.Sl8P8uR1B7MScDtzPsb3z3pyiTE7Qf.WPCjJy'),(80,'$2y$10$N89nc/osBg6qRg63g/OpFeeWl6oqv8V0isCSnEGSgMy9Qdod30DaW'),(82,'$2y$10$O3aywShZkjQN67zBX89q8eEOEK1r9wimPuYTWSRv05kuDgoQ4YEhe'),(83,'$2y$10$RujImFNFeR8Do9RM3OWGbOoPVbthcbmpliu6A9VCsx.L7YQwV3rXC'),(84,'$2y$10$nHUNXo7/zo8qkUwwIaRiauDS0bpnwU55C4zGpTAkUtCdBNzIwbaP6'),(85,'$2y$10$1gN3Yvm1uiwDcLEbMjgk.uB1ethS1EX/CZHbeIqVeq5Bu8KNnWNae'),(86,'$2y$10$/JVgdEgcRHJakvFQpxLQwuqYjEUw6dOxOH9I/FwCTb0yPruaS1DLm'),(87,'$2y$10$J/fs04/HGiu0o34xXIZdYOWK6ViK8Lx1Sn30P26jBiamkCjuNyx3.'),(88,'$2y$10$7qewUUZac8vP0R3H7nN.me6erdwEoSfh6ILnUoBlyOhv6.8yWZNN.'),(89,'$2y$10$LBbkm0p1osq0OUfBGRuD9OQzxFz7.mOP2QJmt./FAsdA1oxNSRjbS'),(90,'$2y$10$Oi5hoNpdwkgzyuqm86uziOHl6Y5EppkGLw9OgE6pJg1vz//4x6UQ2'),(91,'$2y$10$fIEXU2hTNz49S3qhB/eem.ROAo0l4YXriteYHLwf0u.fOjCvTiVRK'),(92,'$2y$10$3rlv0xuJ6rBJKaEkhUwh4Og4WEfkjpWH7iD94qZvge7D/tCnjtgeW'),(93,'$2y$10$VDP8CRcwk4BfbTc00MyqBOxJ7d7fSQF/ArRcndx80MYvDGDL2UWmi'),(94,'$2y$10$A/1JnmEEn3K/dEH6UlGaMu5/G4SXwQMT51R1lZhmmPxJ3JMWbfp7y'),(95,'$2y$10$8kDiFwg1X08rv8LGihcupOob0UCAUpHoKCFVOA9y5DoXqcMuznHci'),(96,'$2y$10$LojQYzWHjApP5.XMHC0VLOTaV8IInJtiIWESyvPIUOjaKNtElcndi'),(97,'$2y$10$rp5apVKGF.CaBHq0tDUAGe2vAC4k4KuUt.DED5a1U42Y11SupRQdK'),(98,'$2y$10$Timdfj0KSHEtje29P4zs1uZM2JhEpY2IjA44g3DvL7fnolTbnIvyq'),(99,'$2y$10$PFdGd3NwNhPKRSc6ZzDLVu6ldhAuqlXkxypPtKRtKqTgsUXtkmUiK'),(102,'$2y$10$2qbgBHhX9uqQ4HxyfhbmLOOo77NX30/PKlmEkf.Gzn2ACHFJVi4kC'),(103,'$2y$10$lqW9o4RV7gcPm6ydQKLAWOLjD3WTufrY0bOvGquzMvbrsTjpeft0u'),(104,'$2y$10$H5PYk0lPwkchKLO7vA/VJePLciZ4/wFFrSK8q6A0Ww2lGN/iSmWz.'),(105,'$2y$10$4soz9OO2CCX7/dxVFk/0z.Ap4YrE65ihNhAag0lDcMHBvJlQlEjVy'),(106,'$2y$10$AX9Dyi6/B4TIpouOdFfS2e8BXzFWl0vbWvrSp/EePuXYBc3TTuAAK'),(107,'$2y$10$7FF4gvuW5dMnZNAfw6nR8urXF8w9j33gi0Clyg5nMP.Qqs2xjEJJ6'),(108,'$2y$10$T66xiGJUkjm8P2aJOJZomeJmghgeaor/2VhJahm69HN6z9daF6lky'),(109,'$2y$10$VBvsUum3MbtIAQGrgBI2BebBymszSq3Q4/tJJ6PEQrr07qx8bHMBu'),(110,'$2y$10$62OvQ.xqLkOGXbbWzELxierW5wVZWfcZjQZ4fitR3/Qp924IZWI26'),(111,'$2y$10$948AQymTXy6.fHzJZz3fMOTBIUjZ4q5SwAxlyqKguHIHwAR9jqBva'),(112,'$2y$10$FOZKciDGWhHA4f2ktW5mZ.ZwqaCsGbbbV7fax6Uy36dkZOdOM8sPO'),(113,'$2y$10$ipe/cs8y2NA9ctnuR2fsw.DEsGRxSnkJy55Wc2f3v8eyjIxoOSz9W'),(114,'$2y$10$MAilKYp3n71roAlByxP6AOcd.Es.sCT988EJX5t/thdMi80bsF.Li'),(115,'$2y$10$xtGB4nLg/yBlKB1a09V7TOdC8eIPO7mXbLh6qIb4lFfjA49tqV9pq'),(116,'$2y$10$8OzYnUg1YQl8Fp1lvCr9puwM/3KikitUfTxVcRTv9avTAstAVTDM.'),(117,'$2y$10$OxOEOBtlALqMbWkPxeL8ne1maOoHvRgoP.yJqt5llWY557iCoZ8dm'),(118,'$2y$10$oD7IF49GQrQjDGOuzK7KIuxkPbJYWISGP0d2HJyFEVIgaUH6Xwp9K'),(119,'$2y$10$8tqy3hqSbIEaHLUydKOXw.gwOVgzfO34KFfdJ0//CWgnKfW87txwW'),(120,'$2y$10$x.lphCNB3Y6F8/UGeA9n3OSkTfrq5VGwFoIckqvDRHtRtKOJYxXOW'),(121,'$2y$10$PkYSw9fs19knRnbgss8t8.M.hB0OLsI6XN5NhuRUKSSRn6vy7R41e'),(122,'$2y$10$8Z4acRYsxDut0drws10O.umtRSIC2.gh9IEPJqvwNiBtFz.ubceNi'),(123,'$2y$10$MarOGuSoWvA1HZAJpHMlmOfbsxGzjl7m0IPULN3QIILemuNRP81ae'),(124,'$2y$10$znnIYRq5cf.msr4jBNgxj.zoueBbH.Iq2iv2hhgWiys0iKIEacBEW'),(125,'$2y$10$/8OhgBIEsq4um4ddVi4JzuT5FpgPokMe8W/mePnT4J1XYDISOg/oO'),(126,'$2y$10$ux16RSKT.nHGtaT9PtKqQeDHXr8zS8oKdkwHuqAKk/1UhV6pexUaq'),(127,'$2y$10$/Fd8lVsKt4/9XcLgpoHBr.w.PfcI3654FIlv.BsskxcChTottoboG'),(128,'$2y$10$s5ffEbOnEcy2gS28j4YLeerz.8n8NX2nGcWxxQm3jXdMPgU4KY6kC'),(129,'$2y$10$v7/sN/uIEJaQoBVG3t3IgOWBvu2TicpwCQFPg892qCB0m5dK4jTRa'),(130,'$2y$10$/coFONo6jemU7pJxdjtDK.pXgL/TAJkJYmZOz/vpTUc.EvOkj51/m'),(131,'$2y$10$qDAkcmusAffoQQ0Gj1Zo5uQpGEpb.3jNE8xD6bl31A3gfpSjQBxyW'),(132,'$2y$10$H1MBM135q3YhwAgTzNaxMeTkaoJ.1wibBFWGnqgitFHTVZKGiAyou'),(133,'$2y$10$BtFBTFMTShYUuoMqSDVuWulOaJmqrrQfuTJi.mbbKKXmEMM2D6Eg.'),(134,'$2y$10$ZC8IQVeBDIkgUJt9DKUeduKLCCHHZ1CdnmSmgNNWOgUfq16/RBG5y'),(135,'$2y$10$GgGjdZMV2hO87tbRdCPpHeX3UGi6/g/SUPSLOMcvMbcu1Di2xlUz2'),(136,'$2y$10$FGaqTyv6nN1CXxHvOP5uJeLnhETbFDJBNSOOCU8n/SK4KTtfAaxC.'),(137,'$2y$10$SNCVdbl8i2/ML1Qd9.tUt.sWI36y22SvBkdcUMeWToicjgnt1wOiu'),(138,'$2y$10$tRzH9KVB8yxylj/YKNNjOefLlxkokMoqtaC6eklVFCjkCslTseBKK'),(139,'$2y$10$VI9Iwg/OO1iC6Mpv9F.Jeuxbmp3NuFpX3NnsAbUmO16n7oLGdu9Ie'),(140,'$2y$10$x8psGevXjhNsMExV1wtiXOy.jGwd5XGsflwbUcAIWMCBHu8BP4vW6'),(141,'$2y$10$wis8OgMvt06oaXbpS/WXV.cCOnfnzjHdUb51b18.PdJexSgp6W62C'),(142,'$2y$10$ev4bDdZ1g9.Xt/lSW4v9B.2ulDm0FH.5V5JY.izBHtViniyBNMLke'),(143,'$2y$10$T7BC6X/d65w/ToSQ0bKGCuYnm17PnYzFjYq7h8.dR774PodHp5F.O'),(144,'$2y$10$.C5oQbn7XOEqGBTuMaf9/.bIDKuOHjq7mK2oiTMddSNXUHoXtVAXq'),(145,'$2y$10$mkqDrbL90G5gwtD.sozrfO/SWJubz4aZYq1iC2It5UWaTd.WXTKlC'),(146,'$2y$10$zqzYAIlI4Q2X3izBW6D6Duqz648mG/sUB08VA.4v9VHgFsZpD9KP.'),(147,'$2y$10$yCbHnShzOc2dwyIFjv58POcd.XSxK46S670fM1k51xz48tbUSzFBe'),(148,'$2y$10$xe4zRSStrZAZXBQ7g4Hno.s6zNeyWpeCUmxhcg5qtykXhzQ7jIsaK'),(149,'$2y$10$Da4JAZhf0JWv0vTgnDU4H.Y8VDtwybC56ccIih.hESSuLxuNr4JsO'),(150,'$2y$10$9.4YxYasNRQ48qQse2ZU.uavFdA660iUIjkcZhanfB3UYb1/92mni'),(151,'$2y$10$6QR3SJfmtlJktys07vTWZu/vkKbjSsgIEfn69q5ObSObqhCeYm23a'),(152,'$2y$10$IKTSE8KhU8bKKnSqWd4/H.o.37RkilNzDcuJVJzcGyKGogJf7YVm6'),(153,'$2y$10$/5aciMY1GePEs/9/O9nzAuN2V9kyxBJCbnGvMYCf6ikhwGsY.LUni'),(154,'$2y$10$MxJINNWjmqm40LDKbGaPPurkdw8ARof7QHXQTG5t5jGQvg91Gg//G'),(155,'$2y$10$6Ey/fenfV.gP9BTlJshlseU2gA7hHodWzqAbQVwK8cCrf8ikE6eMi'),(156,'$2y$10$i1M5VjKfhUIM6Ka0wGzFcexBXPylJSKA0rMwslA8/w6Ap8aZATxnq'),(157,'$2y$10$35V0EzejO.Xa2g5mN/CpkuQZfn0rMud.cbmBEq/5ClrOeSVwvj/2a'),(158,'$2y$10$ZeBWVVPnX76Qj9u9HDprPuoeueLQn.fwBflBHsoqrQGvPhz7loALq'),(159,'$2y$10$tDHVySFauuGBl.GmlMNBLeI2QTUY7rf/V5R.NPSHGnhA5noLibXV6'),(160,'$2y$10$OqsQUyEtUtlQfAsCcXcBVOCbNChyI5W4rwNWEuh6ATG4VCQ.2055e'),(161,'$2y$10$d4YKdQBDCQES.FKpU13FrOCxxjqDtDpDiTHJADnNLg0LziQbCj5GO'),(162,'$2y$10$nCsurrBh92sPAlqEqJOPXeaNIVWB2DclBfO2/8YGMQS8J/HaIoAom'),(163,'$2y$10$Db1sooKycDt6UsExxWAvUOLhy55qpkfMJZNA366qhQw1aPr3MSzRG'),(164,'$2y$10$2W0OWeArL4iYUQibeSh7OuU3edXfxp9HS7O7M8IwjSFWQBBKXmuvi'),(165,'$2y$10$g3n8w/91CK4lyLx.egCK2OTl0du4YpiXGM7tCdklEG2cztbUN9zZq'),(166,'$2y$10$NaeeK7U6Qsc3NqP3yyvK5ORUcvg5YQ0sy79aOKIIAYSIbbmFqTY2y'),(167,'$2y$10$2NwelxOLZp5uMAfFkqMXV.spEPz37RNkmk3M6hE7vO3QA2NuQG9PW'),(168,'$2y$10$e2IBf9TJlUZs1FiQiL0A/OiX94jIlaXCJNSp/6RaRWF48maiSo96.'),(169,'$2y$10$TqufQ1pYFRKQuHIjy/QqCOFGAOahASDyXWvdYL1du8gadOrFMEEKy'),(170,'$2y$10$XnLRgnMPppu2.T8kkiujYO7B/SYY3dASzYjrmHJ8M8VpCAr2FrAde'),(171,'$2y$10$yy3UKZKqnPnyOTT6FKmrc.fWcVntJ1f68U/LtkSYBDh6iOUhCwvEW'),(172,'$2y$10$PZGrhIPtDhCe8EitWvMkku793ZvvuP9VMV1I7Ql5Jl70ogC5.LWym'),(173,'$2y$10$MB7W6tY2yzqxQv2A6m.3M.PbSfPEbrzjKjy0bEENoh2GoQoDxnrf.'),(174,'$2y$10$12ssQ.nuEzW2n0Ri0DBGxuXa7lvhdjSXr.TnZKOV6dqM522aCYS/O'),(175,'$2y$10$kHLiF5WU8HhAfPTMw2gIpOP.VOCA9ZaenUHDO/3eGCFmbqSKH/s3m'),(176,'$2y$10$vrN3xh7Z/G.AGktF8SYsx.U924nZVrOREkYTIzqTfC1NoZD.P0nXG'),(177,'$2y$10$kNrF8zSyL.Y4ZtQcsQZC/ewue8XayJqQkLkNssFeXulRwe.JgTlp.'),(178,'$2y$10$SvB4gN4oGenG.VX3tdbPSutL515.QGhm/2C8hcccT/dBb.LBlyWOS'),(179,'$2y$10$30h65Cpwjm4kO75N184QmuU5eS2jjscGMKWsJLYIMrufqG.QLi9Y.'),(180,'$2y$10$cCgAbEHzIg9/qwTU7e9Fwu10Gh526QPQIdNysQsxxS58DKgRSx1ai'),(181,'$2y$10$QY1FCFI.mG9waurdwTTm1Oo/xbMAHd.vdfDKk7Ft2.NuKHGDZwymS'),(182,'$2y$10$zVI4WsSwEnP4tKUZ6TKs6ezAlT8vidtVTwWpuoe6G6DJ5f8HK7zQy'),(183,'$2y$10$Z0AiNhq6WbO9kkR.gvWse.4RDmW.1uoNu8Q8saCV9/6VXk52mRPJW'),(184,'$2y$10$TY05LZidoUw3F0ddtDv5NOEdvSWXXBcFefjJ3PV46rLwnAdGNWLq6'),(185,'$2y$10$crtfDLfmML2Nazhwfiyz5eLGhkziVXEYnKyHPj/0Rp6grB35QU1gO'),(186,'$2y$10$.beZZukbfOuUHZ2.XqnuIuSUEzSr2HL8//DwPb7C27ba23L8Yh6ZC'),(187,'$2y$10$v5KhszNTLKiqGnhoiHxVg.AYAbnMg50L/1Ox8Biij4hx.TuBkkc8.'),(188,'$2y$10$DUPkYu4.OjprbzXV7zsBtuS9H4IfmnMTArgGmKF/4sCKmvT6fzLdS'),(189,'$2y$10$KvbrwS5YXMWPUxbebA6d0.fdqjikstI2WahtvqxA4PkiA0OdPA.Ie'),(190,'$2y$10$FFh5mHdAmNjonqQTyUnDWerEyQTKfnW.tssM29Up0V4VR180e17Ua'),(191,'$2y$10$H5s1Xnpo8eP.9sO6698F7eTHM5iMFTjpbKYIPYA2ZkPAoYKF9VrbC'),(192,'$2y$10$hM56Hspmv9ujzv/BiJtTR.W7/RAGVM0WroGkf4iVFoCWvt9BrUfuK'),(193,'$2y$10$a.zNZVSqSPTWiPyARS7P5OAI1NikQteRBG35BNcTfPjRrvHwvqAIW'),(194,'$2y$10$j6t/3YkMByAMmXucFpaRBuhiBnb6njAgWraT5ACPOoZR9CzPl3F.O'),(195,'$2y$10$nTNj96qBCeKCYx6wtrIl8e93udJEe0fexxIlpBhzZoWmF62zQ7Yce'),(196,'$2y$10$JeyEW6OX9GOEof..MGw6oeAEg//JuOnKz5rqnX.Ynw6rkDI.YjnZ2'),(197,'$2y$10$3Aa8wbvlcs.vbgk0Y7nN2eucQnXYVgU91Zn/gL0NB1g7363LhYKDi'),(198,'$2y$10$xP360pkEu./HF0uh4Bn7M.RQHNYzfZFV12fp33C.lQFZVnppcI6Ma'),(199,'$2y$10$Uw6GuEajukpeic3kUCpIzeHhn/u4Lol6c7QfgxMHXc2.kxCU4Y2Aa'),(200,'$2y$10$sXEmNOdCbWWOs5hlGLbQ9.EmGjt.qpAT5mN/UlyyOvcO2cxkPnAF.'),(201,'$2y$10$wjNIAniOqebmD08AwfeXd.K.Zq2DMzzVhVjk04VKH56YncKd5Exo6'),(202,'$2y$10$qy5GDrscrLBLlNXtt64DyOZkFMjPtLoEbVoC1HKkTQW4JveUQfj9i'),(203,'$2y$10$FobT98wUjnbbTW.zgNGmN.wRnjLHXcnIZxIrriaL9r59BJpdCku3a'),(204,'$2y$10$piEJwtqceEGW.OOog/dyS.cuQnp98CH6zq6Wo6Bjj75NLfJ5X0Hlm'),(205,'$2y$10$piI1sHtvqo8h.ymuEKj6suqNOZKXo4UGw94jDtLWirsTlZmEQszcm'),(206,'$2y$10$egM8X5SgzyP5k4LN4KtlbeoKRGk/Ahg6uFsVCROz.EX22XpaIJyaC'),(207,'$2y$10$jmeWaFVknEWp3IjGEODfcOINwRrTuFwp0iNAV6W/6s.g4lUNkG7Nq'),(208,'$2y$10$fA65agTHMltS9Oglv4ojEe3KRpCfWT5rxRQv1mlSz8YXQkdX6Gx7.'),(209,'$2y$10$lA8D5JFXCoHRLCf5XEa3meYHz5YN1w28APA5Q/v3MHGAoKH8xGEa.'),(210,'$2y$10$PcrMq6JinKmbxhzNqTBF3OZa4IEgTHVCcc4wVNUp2lYNv/2N03Tvu'),(211,'$2y$10$f4ZEehIDSGP4rJSY6gZINOZT4jpfTAeWdiY.EwomReDgryxa.md0O'),(212,'$2y$10$KNh6ZkNADXX6sCsJaDsvAOJd15AW2mGrCRmWcpReJ26aG80GINSbq'),(213,'$2y$10$OKT7eQUZYkC79fA6TN69bO3DoEOncbMi8Ibh3AtBpt/hpLuBjhoaO'),(214,'$2y$10$iSUvUfyRWOhCBYnZbz1EP.KP.pz28gDITnJLrOHkYgioE.LPLyan.'),(215,'$2y$10$iaj3J6/H5JYlKnsncZiqPeGFrnir0AyWgk.ROhWd12Uuuk8WJSlcy'),(216,'$2y$10$QoZUR.tC4IRGKx84/.L0NO4.70UBGqz2j/sWQir.iB5aUWAKL4Xg2'),(217,'$2y$10$UlevVQ68MRV4Tec5NKiW4.LyN0z81zIhuVtW7Tv8nrRFu5FE0knum'),(218,'$2y$10$Vmj68UNqgqmv5EvvuJtjxuGX0IYiFiL/vvSplkxZK7xcZ45Go8s3m'),(219,'$2y$10$vwDwErS7pLfkKYfvE1V1ROFqq94Z3PskPxJVY0vEW0o2lR1wCsRw.'),(220,'$2y$10$YLV9Ra1EKGsOeRC9nrwHfuf113yCw1H5U/hMpgMYjtb/NVrTl3ixq'),(221,'$2y$10$WcU/xfeBFd1Tw5NxZJGiauQNUcW4AiNvUTr4vmZ9aQs0aAbFtumVe'),(222,'$2y$10$HasL41pQ0TD592alYWEObu9RjecLevRpPkcQzXvf5uFn0CDAlrbdi'),(223,'$2y$10$.h00mGCr5QsU.EzisFyWIukC6cdFLNzaDh2e1ezSud/NZ/n.IwsUG'),(224,'$2y$10$pr5fSYXxgs0/i4VeXbgeXe6i6PFZYTRYqwOyOlxdke98afQ2GkQaS'),(225,'$2y$10$349wm14geOfdYH3YvggtPuMpaQEN8n58v8mJKKaP0g1b4MCF.IZ..'),(226,'$2y$10$tDC19gCdWsDMypPfl2OLROyjnUFa6g3W8R0IhIevRvCUyp3G1/or.'),(227,'$2y$10$HHqfpiC96sYzeqKvHhlkQulJUA/N6Nh2PBbKKeHPBpkk3vEnZUuga'),(228,'$2y$10$iQ4OCVvGpsCUOturLWyv9ulH/SLQ07E55OSbWPOatlW7nMARiVv0u'),(229,'$2y$10$a/7PxUlw.yDWUG.RCjy7Pee1rmlaqLUb.0BJEo3l6cD7Gm6t79iG2'),(230,'$2y$10$SX5tvg8cKM6sMDXwsGphIu1hsfi74uugxhHUzG7gcEVpp4e.RrrVi'),(231,'$2y$10$/YrQz.I4vx4j6ZVAznWnd.sn5vrWtP.95t.BV6mNyaOsQuHAFKjDO'),(232,'$2y$10$9KboT69fDmGr8Y3YvQRxm.obAGd0A5zmlblSl5Jk4cgPsJ2osVyNW'),(233,'$2y$10$1AJxLsYz/aklcnhgVxBtbeyXjiOwbkpczLI9RuJWMR17cQJ7mvqD6'),(234,'$2y$10$zLRInDFYH.o00bqoD7DGe.lklqUk9bDz33U9YQ44owL/BV7Zv9BEK'),(235,'$2y$10$4tLWwTrgbu4p.xcLa7HyHOTgqgQqdEcI1Wa8DLneTbp3xkmpGpaQS'),(236,'$2y$10$IyK0ajCzvVnJ5Q/q9f6NNe4Uh08yML7EMFi3BLqbFZ8tiUgvszyYi'),(237,'$2y$10$u0RppM/Y.YMxZbgfV5kJieV/7p3Objfr4a0LdyCCdcdJ5U//j71tK'),(238,'$2y$10$F2VVts2Pm0A1MKOIZkh/t.MSdgKCUKIxwjE8sbcfdP9aQvNHSiU76'),(239,'$2y$10$5wy6Tz0y0QkP5DNy24qZgelnKepmGAwYE9jRN5EsRdgMMdKVB.DZm'),(240,'$2y$10$le.mq7BXpGr51zYUR08hyu15def2Bhr.tLU2sDOmdVdmvZDf5H252'),(241,'$2y$10$TN5Vj43.2HqO3hLtYvLKj.WcI/tJXEXfz7vyT91ucIFdEyCJsm3f2'),(242,'$2y$10$hPvSPnLF7hn7YMEnOn3O/OnnYiQvOotHHfKyNNsUiuzvuI33AH4ju'),(243,'$2y$10$vmkKw/Y2rl1wM1AC3bw04OZ0Zvm4OCvFqQ6tPhgz13AME4GnjHstm'),(244,'$2y$10$.oQ9yypW62n3fKpbw4dNNeGXyRzsE3pBhMTXRuUMEkL4uT1cd8liS'),(245,'$2y$10$vie9jgY6yHeAenXsfZKlc.MTlRcuNgijSXiupp6fSlwdRRqFeRbT2'),(246,'$2y$10$NIZK4nY78bbC88Zpo7jKn.1KmIOkULm00ZnXwtpQwdIcS2WbZ.RC2'),(247,'$2y$10$q27LZyjHY/1x2DFcUiiC6uOQYnl.GsUUPn5H7iEVwmKz6FwXSzMO.'),(248,'$2y$10$DvpS9qI7XiQS.Ga/zGmGgeuS0ZRuK86ErSdKkPMJ5N3nH7Wb6rlLq'),(249,'$2y$10$jCeAKHq3wq1vPKr.b4JT/O3h5qNjDTkBu.9GbXEFjBKC35msawj7e'),(250,'$2y$10$Lykm4hNT4skSAuhaYvThMuswAUdGMROr7sgQs.iKBhBjOMyERLTxy'),(251,'$2y$10$ug5krNrMen/Q.PxpnhL0w.RuigkpeC02R33S/mKu4rIwlvOHAqc7i'),(252,'$2y$10$xTcrOiHYwLhsJcNUPJjl2OLnJMi2yr.qvCj3uJ93GAkZHvfqHc/UO'),(253,'$2y$10$ozgVII21nvT4CeHgvj5My.hTGqn9s/qJocOLLgLc3MPoKfR3ZfoC.'),(254,'$2y$10$4yuNmua/knZUale4JxDtGOt/tRizyS2MT3jrefJJG8ht5jwzrZhqO'),(255,'$2y$10$ZWYS.guVFQ63DUh8HlOtbuqDSGuwR5EOWuG2ftEnEVQqKHlwNX2dq'),(256,'$2y$10$sKUYoP1HuzGR6MKXcekYnevWPCUk65cLtYq85ALpBnptHwRUWOto6'),(257,'$2y$10$YvwQfcjJrkFcbqDCD02bsOsp15Z9KoGMdiCeyuOVQrguLKAyS3KUK'),(258,'$2y$10$L1ydGk93A7KCNXxB5OwdheY7q/5MS6INb4lpv25Cjiiv24XWCSBYm'),(259,'$2y$10$8FpEVzzHzKTVEJtpo/DFZ.VPfouK1GzXMNbrXkCQFAl7yJrzWwp6.'),(260,'$2y$10$pj.D8eX6u/ONg3fdIIZ64ur3ApNeCFK6AcEntADw5Z3ADRlkpFXcq');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ychasnuk`
--

DROP TABLE IF EXISTS `ychasnuk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ychasnuk` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Prizvushche` varchar(50) NOT NULL,
  `Imya` varchar(30) NOT NULL,
  `Vik` int NOT NULL,
  `Stat` enum('Чоловік','Жінка') NOT NULL,
  `Nomer_telefony` varchar(12) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=261 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ychasnuk`
--

LOCK TABLES `ychasnuk` WRITE;
/*!40000 ALTER TABLE `ychasnuk` DISABLE KEYS */;
INSERT INTO `ychasnuk` VALUES (1,'Петрик','Владислав',13,'Чоловік','0976454443'),(2,'Кравченко','Діана',22,'Жінка','0977890124'),(3,'Мельник','Христина',15,'Жінка','0678901235'),(4,'Дорошенко','Анна',19,'Жінка','0929012346'),(5,'Лисенко','Ілля',11,'Чоловік','0670123457'),(6,'Олійник','Максим',16,'Чоловік','0971234568'),(7,'Левченко','Дмитро',14,'Чоловік','0922345679'),(8,'Білик','Сергій',23,'Чоловік','0673456780'),(9,'Мороз','Тарас',12,'Чоловік','0975678902'),(10,'Гриценко','Анатолій',8,'Чоловік','0676789013'),(11,'Пономаренко','Леонід',20,'Чоловік','0927890124'),(12,'Кириленко','Василь',25,'Чоловік','0978901235'),(13,'Черненко','Олександр',17,'Чоловік','0679012346'),(14,'Кузьменко','Микита',14,'Чоловік','0920123457'),(15,'Ткаченко','Віктор',18,'Чоловік','0971134568'),(16,'Калініченко','Софія',20,'Жінка','0672345679'),(18,'Василенко','Дарина',18,'Жінка','0923456780'),(19,'Данилюк','Наталія',21,'Жінка','0974567891'),(20,'Петрук','Ярослав',12,'Чоловік','0675678902'),(22,'Журавель','Аліна',23,'Жінка','0926789013'),(24,'Онопко','Лариса',19,'Жінка','0978890124'),(25,'Мартинюк','Валерія',20,'Чоловік','0678901135'),(26,'Бондаренко','Тимур',23,'Чоловік','0979890124'),(27,'Лисенко','Кирило',19,'Чоловік','0929011346'),(28,'Олійник','Роман',22,'Чоловік','0670122784'),(30,'Левченко','Ярослав',17,'Чоловік','0979453413'),(31,'Білик','Назар',15,'Чоловік','0923532500'),(32,'Шаповал','Ганна',20,'Жінка','0929115546'),(33,'Козак','Олексій',19,'Чоловік','0970121455'),(34,'Таран','Андрій',18,'Чоловік','0675754568'),(35,'Каравенко','Павло',19,'Чоловік','0673366780'),(36,'Гриценко','Віталій',22,'Чоловік','0975668901'),(37,'Савченко','Марія',21,'Жінка','0922335671'),(38,'Романенко','Тетяна',19,'Жінка','0974458780'),(39,'Пономаренко','Станіслав',11,'Чоловік','0677789011'),(40,'Кириленко','Михайло',9,'Чоловік','0927810121'),(41,'Черненко','Анатолій',16,'Чоловік','0978903371'),(42,'Ткаченко','Олександр',13,'Чоловік','0920113321'),(43,'Василенко','Ігор',16,'Чоловік','0679755179'),(44,'Петрук','Тарас',15,'Чоловік','0968011132'),(45,'Журавель','Олексій',12,'Чоловік','0676712321'),(46,'Мартинюк','Костянтин',15,'Чоловік','0977870122'),(47,'Таран','Данило',13,'Чоловік','0970123311'),(48,'Савченко','Лев',17,'Чоловік','0672224531'),(49,'Сидоренко','Микита',14,'Чоловік','0674447891'),(50,'Кириченко','Олена',13,'Жінка','0673537291'),(51,'Сидоренко','Людмила',18,'Жінка','0925668902'),(52,'Петренко','Світлана',19,'Жінка','0676779033'),(53,'Дорошенко','Єва',22,'Жінка','0678904235'),(54,'Мороз','Ірина',21,'Жінка','0924367891'),(55,'Бондаренко','Богдан',20,'Чоловік','0671789010'),(56,'Лисенко','Артем',25,'Чоловік','0679113366'),(57,'Олійник','Віталій',18,'Чоловік','0929913344'),(58,'Кузьменко','Тетяна',20,'Жінка','0679013366'),(59,'Калініченко','Надія',18,'Жінка','0973428743'),(60,'Данилюк','Світлана',22,'Жінка','0924536788'),(61,'Онопко','Анастасія',18,'Жінка','0926551313'),(62,'Білик','Сергій',18,'Чоловік','0674320954'),(63,'Гриценко','Ігор',20,'Чоловік','0671918431'),(64,'Черненко','Василь',21,'Чоловік','0979610122'),(65,'Кузьменко','Анатолій',24,'Чоловік','0678920931'),(66,'Василенко','Артем',18,'Чоловік','0675319453'),(67,'Петрук','Микита',21,'Чоловік','0976457431'),(68,'Онопенко','Анастасія',20,'Жінка','0929317827'),(69,'Онопченко','Дмитро',12,'Чоловік','0916728034'),(70,'Мартиненко','Леонід',13,'Чоловік','0677239080'),(71,'Козаченко','Ігор',9,'Чоловік','0670393415'),(72,'Карпенко','Тимофій',11,'Чоловік','0974610453'),(73,'Петренко','Петро',15,'Чоловік','0673244565'),(74,'Шаповал','Ярина',12,'Жінка','0673454532'),(75,'Кириченко','Аліна',13,'Жінка','0976534656'),(76,'Козачок','Влада',15,'Жінка','0923433411'),(77,'Романенко','Катерина',12,'Жінка','0922343543'),(78,'Мартинюк','Валерія',16,'Жінка','0923414532'),(79,'Петрук','Тетяна',15,'Жінка','0922313465'),(80,'Білик','Надія',17,'Жінка','0978644353'),(82,'Олійник','Катерина',14,'Жінка','0673244356'),(83,'Сидоренко','Валентина',11,'Жінка','0973544531'),(84,'Петрик','Олександр',15,'Чоловік','0670954561'),(85,'Кириченко','Станіслав',13,'Чоловік','0920534523'),(86,'Бондаренко','Богдан',10,'Чоловік','0929214455'),(87,'Лисенко','Олексій',17,'Чоловік','0970413451'),(88,'Левченко','Максим',12,'Чоловік','0923514351'),(89,'Коравай','Андрій',16,'Чоловік','0677853453'),(90,'Петренко','Наталія',20,'Жінка','0920413451'),(91,'Дорошенко','Марія',18,'Жінка','0970443451'),(92,'Левченко','Ірина',23,'Жінка','0979853411'),(93,'Окоренко','Іван',21,'Чоловік','0973414561'),(94,'Журавель','Василь',22,'Чоловік','0921110965'),(95,'Мартинюк','Андрій',18,'Чоловік','0914547889'),(96,'Шаповал','Костянтин',19,'Чоловік','0921208989'),(97,'Мороз','Наталія',15,'Жінка','0670134567'),(98,'Пономаренко','Тетяна',12,'Жінка','0914356767'),(99,'Кириленко','Софія',14,'Жінка','0676702451'),(102,'Данилюк','Марина',15,'Жінка','0914568791'),(103,'Кузьменко','Анатолій',12,'Чоловік','0673451313'),(104,'Кузьма','Денис',14,'Чоловік','0979994515'),(105,'Ткаченко','Михайло',16,'Чоловік','0914349090'),(106,'Василенко','Олександр',13,'Чоловік','0971118989'),(107,'Романенко','Кирило',10,'Чоловік','0974357766'),(108,'Лисенко','Ярослав',12,'Чоловік','0984241321'),(109,'Білик','Дмитро',14,'Чоловік','0985442112'),(110,'Мороз','Роман',12,'Чоловік','0674351551'),(111,'Петренко','Максим',12,'Чоловік','0945143344'),(112,'Кириленко','Станіслав',15,'Чоловік','0676702121'),(113,'Черненко','Аліна',12,'Жінка','0925469785'),(114,'Данилюк','Анна',15,'Чоловік','0983552255'),(115,'Бондаренко','Анастасія',16,'Чоловік','0974513561'),(116,'Олійник','Олександра',14,'Чоловік','0673441901'),(117,'Василенко','Лев',19,'Чоловік','0965724144'),(118,'Петрук','Олександр',18,'Чоловік','0673414935'),(119,'Мартинюк','Григорій',20,'Чоловік','0971110234'),(120,'Романенко','Костянтин',21,'Чоловік','0923330141'),(121,'Кириченко','Аліна',23,'Жінка','0975619354'),(122,'Козачок','Наталія',18,'Жінка','0925623241'),(123,'Таран','Данило',25,'Чоловік','0970452146'),(124,'Савченко','Оксана',20,'Жінка','0964321010'),(125,'Сидоренко','Ганна',13,'Жінка','0910341342'),(126,'Журавель','Владислав',11,'Чоловік','0662132021'),(127,'Кузьменко','Андрій',16,'Чоловік','0922344131'),(128,'Сидоренко','Володимир',15,'Чоловік','0979113416'),(129,'Тараненко','Григорій',13,'Чоловік','0923517676'),(130,'Лисенко','Олександир',11,'Чоловік','0673418090'),(131,'Черненко','Софія',16,'Чоловік','09601224050'),(132,'Дорошенко','Аліна',10,'Жінка','0671483244'),(133,'Петренко','Соломія',14,'Жінка','0934488076'),(134,'Кириченко','Максим',11,'Чоловік','0674555030'),(135,'Романенко','Романна',12,'Жінка','0984514005'),(136,'Калініченко','Оксана',15,'Жінка','0956407890'),(137,'Маланюк','Владислава',15,'Жінка','0913254578'),(138,'Сидоренко','Максим',19,'Чоловік','0934190961'),(139,'Мартинюк','Максим',20,'Чоловік','0671225699'),(140,'Данилюк','Даниїл',18,'Чоловік','0561265771'),(141,'Олійник','Олена',22,'Жінка','0945154433'),(142,'Пономаренко','Олександра',20,'Жінка','0934145050'),(143,'Дмитрук','Дмитро',11,'Чоловік','0945146533'),(144,'Бондаренко','Дмитро',16,'Чоловік','0674591541'),(145,'Дорошенко','Петро',14,'Чоловік','0943512020'),(146,'Шаповал','Максим',11,'Чоловік','0934563040'),(147,'Шнайдер','Максим',17,'Чоловік','0923451010'),(148,'Онопко','Ярослав',14,'Чоловік','0932543651'),(149,'Черненко','Сергій',11,'Чоловік','0934116567'),(150,'Шаповал','Аліна',12,'Жінка','0945196511'),(151,'Гриценко','Юлія',14,'Жінка','0643571211'),(152,'Білик','Катерина',16,'Жінка','0934115346'),(153,'Білак','Ірина',12,'Жінка','0943517616'),(154,'Лисенко','Валерія',15,'Жінка','0984545611'),(155,'Мартинюк','Олена',18,'Жінка','0673495789'),(156,'Пономаренко','Олександра',20,'Жінка','0679456512'),(157,'Паляниця','Оксана',21,'Жінка','0674915146'),(158,'Караваєв','Мар\'яна',19,'Жінка','0945156547'),(159,'Кириленко','Олеся',22,'Жінка','0947615871'),(160,'Черненко','Софія',19,'Жінка','0846518761'),(161,'Білик','Марія',20,'Жінка','0677983241'),(162,'Грінченко','Анастасія',22,'Жінка','0679835123'),(163,'Дорошенко','Анастасія',22,'Жінка','0834615871'),(164,'Савченко','Людмила',21,'Жінка','0969831123'),(165,'Онопко','Мар\'яна',25,'Жінка','0695341324'),(166,'Журавель','Яна',18,'Жінка','0968538241'),(167,'Калініченко','Руслана',12,'Жінка','078613491'),(168,'Бондаренко','Софія',15,'Жінка','0679345111'),(169,'Кириченко','Ольга',16,'Жінка','0981456123'),(170,'Петрук','Ірина',15,'Жінка','0964513454'),(171,'Василенко','Юлія',14,'Жінка','0967834512'),(172,'Левченко','Аліна',17,'Жінка','0975934125'),(173,'Лисенко','Марина',11,'Жінка','0931485687'),(174,'Кириченко','Галина',13,'Жінка','0967459974'),(175,'Левченко','Ольга',20,'Жінка','0967498511'),(176,'Романенко','Соломія',18,'Жінка','0945112434'),(177,'Савченко','Марія',21,'Жінка','0974678712'),(178,'Шаповал','Анастасія',18,'Жінка','0960786877'),(179,'Данилюк','Валерія',24,'Жінка','0993481283'),(180,'Гриценко','Софія',12,'Жінка','0934811255'),(181,'Сидоренко','Валентина',15,'Жінка','0687234834'),(182,'Петрук','Олеся',13,'Жінка','0969845861'),(183,'Білик','Ганна',11,'Жінка','0968314121'),(184,'Мартинюк','Софія',12,'Жінка','0687324111'),(185,'Олійник','Людмила',16,'Жінка','0987246581'),(186,'Романенко','Каріна',17,'Жінка','0678324122'),(187,'Лисенко','Сергій',20,'Чоловік','0967231345'),(188,'Бондаренко','Богдан',22,'Чоловік','0963894791'),(189,'Петренко','Петро',25,'Чоловік','0964857123'),(190,'Сидоренко','Володимир',18,'Чоловік','0969231944'),(191,'Тарен','Андрій',20,'Чоловік','0987456123'),(192,'Олійник','Степан',23,'Чоловік','0984551334'),(193,'Грінченко','Владислав',23,'Чоловік','0674376123'),(194,'Савченко','Володимир',12,'Чоловік','0963489123'),(195,'Черненко','Микола',17,'Чоловік','0938481234'),(196,'Каравай','Дмитро',13,'Чоловік','0963457612'),(197,'Кириченко','Владислав',14,'Чоловік','0967983479'),(198,'Козак','Максим',11,'Чоловік','0996437651'),(199,'Кириченко','Кирило',15,'Чоловік','0678234123'),(200,'Ткач','Віктор',13,'Чоловік','0963847123'),(201,'Кириленко','Максим',22,'Чоловік','0964123343'),(202,'Василенко','Василь',18,'Чоловік','0678334123'),(203,'Онопко','Олександир',25,'Чоловік','0983411234'),(204,'Кузьменко','Василь',10,'Чоловік','03746812'),(205,'Шаповал','Тарас',13,'Чоловік','0973481231'),(206,'Білик','Назар',15,'Чоловік','0673413354'),(207,'Дорошенко','Михайло',16,'Чоловік','0932764813'),(208,'Петрук','Олег',12,'Чоловік','0638437124'),(209,'Винниченко','Володимир',11,'Чоловік','0673445123'),(210,'Кириленко','Богдан',15,'Чоловік','0937648124'),(211,'Савченко','Оксана',13,'Жінка','0678341245'),(212,'Ткаченко','Анастасія',15,'Жінка','0668123433'),(213,'Мороз','Людмила',16,'Жінка','0967831234'),(214,'Левенко','Анастасія',13,'Жінка','09967451234'),(215,'Таран','Олена',17,'Жінка','0971364123'),(216,'Мартинюк','Наталія',14,'Жінка','0634123344'),(217,'Василець','Юлія',13,'Жінка','0974567123'),(218,'Калініченко','Софія',11,'Жінка','0678931254'),(219,'Ткач','Вікторія',15,'Жінка','0675841234'),(220,'Гриценко','Олександра',16,'Жінка','0938412123'),(221,'Онопко','Валентина',12,'Жінка','0976348712'),(222,'Бондар','Михайло',12,'Чоловік','0910172276'),(223,'Поліщук','Михайло ',10,'Чоловік','0863575897'),(224,'Бойко','Михайло ',15,'Чоловік','0973039428'),(225,'Бойко','Дмитро ',16,'Чоловік','0672128160'),(226,'Олійник','Михайло ',18,'Чоловік','0994069292'),(227,'Поліщук','Дмитро ',18,'Чоловік','0449741351'),(228,'Бондар','Юрій ',15,'Чоловік','0915577334'),(229,'Поліщук','Артем ',16,'Чоловік','0670839100'),(230,'Кравченко','Іван ',10,'Чоловік','0679651066'),(231,'Олійник','Максим ',13,'Чоловік','0607321680'),(232,'Мельник','Олег ',14,'Чоловік','0965496569'),(233,'Гриценко','Юрій ',18,'Чоловік','0464601866'),(234,'Коваленко','Артем ',18,'Чоловік','0463867199'),(235,'Поліщук','Іван ',10,'Чоловік','0940223947'),(236,'Шевченко','Артем ',17,'Чоловік','0542994955'),(237,'Ткаченко','Іван ',18,'Чоловік','0393039908'),(238,'Поліщук','Володимир',12,'Чоловік','0801062192'),(239,'Олійник','Ігор ',13,'Чоловік','0722178178'),(240,'Кравець','Максим',13,'Чоловік','0800200505'),(241,'Кравченко','Іван ',15,'Чоловік','0345349440'),(242,'Мельник','Юрій ',12,'Чоловік','0318301393'),(243,'Винниченко','Артем ',18,'Чоловік','0922898860'),(244,'Савченко','Максим',25,'Чоловік','0931234567'),(245,'Гончаренко','Андрій',20,'Чоловік','0991234567'),(246,'Шевченко','Іван',19,'Чоловік','0631234567'),(247,'Бондаренко','Михайло',21,'Чоловік','0503456789'),(248,'Кравченко','Юрій',24,'Чоловік','0673456789'),(249,'Лисенко','Віталій',18,'Чоловік','0933456789'),(250,'Мельник','Артем',19,'Чоловік','0503654321'),(251,'Руденко','Олег',21,'Чоловік','0673654321'),(252,'Остапенко','Ігор',22,'Чоловік','0936543210'),(253,'Павленко','Денис',20,'Чоловік','0996543210'),(254,'Дяченко','Владислав',25,'Чоловік','0633456123'),(255,'Зайцев','Сергій',24,'Чоловік','0501234789'),(256,'Соколов','Богдан',23,'Чоловік','0673456123'),(257,'Волошин','Валентин',19,'Чоловік','0933456123'),(258,'Нестеренко','Євген',18,'Чоловік','0503456987'),(259,'Яремчук','Тарас',21,'Чоловік','0671234987'),(260,'Петренко','Василь',18,'Чоловік','0903413');
/*!40000 ALTER TABLE `ychasnuk` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ychasnuk_section`
--

DROP TABLE IF EXISTS `ychasnuk_section`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ychasnuk_section` (
  `ID_Ychasnuka` int NOT NULL,
  `ID_Section` int NOT NULL,
  `ID_Grup` int DEFAULT NULL,
  KEY `ID_Ychasnuka` (`ID_Ychasnuka`),
  KEY `ID_Section` (`ID_Section`),
  KEY `ID_Grup` (`ID_Grup`),
  CONSTRAINT `ychasnuk_section_ibfk_1` FOREIGN KEY (`ID_Ychasnuka`) REFERENCES `ychasnuk` (`ID`),
  CONSTRAINT `ychasnuk_section_ibfk_2` FOREIGN KEY (`ID_Section`) REFERENCES `section` (`ID`),
  CONSTRAINT `ychasnuk_section_ibfk_3` FOREIGN KEY (`ID_Grup`) REFERENCES `grupa` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ychasnuk_section`
--

LOCK TABLES `ychasnuk_section` WRITE;
/*!40000 ALTER TABLE `ychasnuk_section` DISABLE KEYS */;
INSERT INTO `ychasnuk_section` VALUES (1,1,1),(2,8,24),(2,6,19),(3,10,27),(4,11,30),(5,1,1),(5,9,25),(6,12,31),(7,5,15),(8,1,2),(9,12,31),(9,3,9),(10,7,21),(11,12,32),(11,9,26),(12,2,6),(13,12,31),(14,12,31),(14,10,27),(15,12,32),(16,12,34),(16,8,24),(18,12,34),(19,12,34),(20,12,31),(22,12,34),(24,12,34),(24,10,28),(25,12,32),(25,6,19),(26,12,32),(26,1,2),(27,12,32),(28,12,32),(28,9,26),(30,2,5),(30,12,31),(31,12,31),(32,11,30),(32,8,24),(33,11,30),(34,11,30),(34,6,19),(35,11,30),(35,5,16),(36,11,30),(36,5,16),(37,11,30),(37,8,24),(38,11,30),(39,11,29),(40,11,29),(41,11,29),(41,4,13),(42,11,29),(42,2,5),(43,11,29),(43,1,1),(44,11,29),(45,11,29),(46,11,29),(46,10,27),(47,11,29),(48,11,29),(48,7,21),(49,11,29),(50,10,27),(51,10,28),(51,6,19),(52,10,28),(53,10,28),(53,8,24),(54,10,28),(55,10,28),(55,4,14),(56,10,28),(56,3,10),(57,10,28),(58,9,26),(58,6,19),(59,9,26),(60,9,26),(60,8,24),(61,9,26),(62,9,26),(62,7,22),(63,9,26),(63,1,2),(64,9,26),(64,4,14),(65,9,26),(66,9,26),(67,9,26),(68,6,19),(68,8,24),(69,9,25),(70,9,25),(70,1,1),(71,9,25),(72,9,25),(73,9,25),(73,3,9),(74,8,23),(74,6,17),(75,8,23),(76,8,23),(77,8,23),(78,8,23),(79,8,23),(79,6,17),(80,8,23),(80,5,15),(82,8,23),(83,8,23),(84,8,23),(84,7,21),(85,8,23),(86,8,23),(87,8,23),(87,1,1),(88,8,23),(89,8,23),(89,3,9),(90,7,22),(91,7,22),(92,7,22),(93,7,22),(93,4,14),(94,7,22),(94,1,2),(95,7,22),(96,7,22),(97,7,21),(97,6,17),(98,7,21),(99,7,21),(99,6,17),(102,6,17),(103,7,21),(103,1,1),(104,7,21),(105,7,21),(106,7,21),(107,7,21),(108,7,21),(109,7,21),(109,5,15),(110,7,21),(111,6,17),(112,6,17),(113,5,15),(114,5,15),(115,5,15),(116,5,15),(117,5,16),(117,4,14),(118,5,16),(118,1,2),(119,5,16),(120,5,16),(121,5,16),(122,5,16),(122,4,14),(123,5,16),(124,5,16),(125,5,15),(126,5,15),(127,5,15),(128,5,15),(129,5,15),(129,4,13),(130,5,15),(131,5,15),(132,6,17),(133,6,17),(133,4,13),(134,6,17),(135,6,17),(135,4,13),(136,6,17),(138,4,14),(138,1,2),(139,4,14),(139,1,2),(140,4,14),(141,4,14),(142,4,14),(143,4,13),(144,4,13),(144,1,1),(145,4,13),(146,4,13),(147,4,13),(147,1,1),(148,4,13),(149,4,13),(150,4,13),(151,4,13),(152,4,13),(153,4,13),(154,4,13),(155,3,12),(156,3,12),(157,3,12),(158,3,12),(159,3,12),(160,3,12),(161,3,12),(162,3,12),(163,1,4),(164,1,4),(165,1,4),(166,1,4),(167,1,3),(168,1,3),(169,1,3),(170,1,3),(171,1,3),(172,1,3),(173,1,3),(174,1,3),(175,2,8),(176,2,8),(177,2,8),(178,2,8),(179,2,8),(180,2,7),(181,2,7),(182,2,7),(183,2,7),(184,2,7),(185,2,7),(186,2,7),(187,2,6),(188,2,6),(189,2,6),(190,2,6),(191,2,6),(192,2,6),(193,2,6),(194,2,5),(195,2,5),(196,2,5),(197,2,5),(198,2,5),(199,2,5),(200,2,5),(201,1,2),(202,1,2),(203,1,2),(204,1,1),(205,1,1),(206,1,1),(207,1,1),(208,1,1),(209,1,1),(210,1,1),(211,3,11),(212,3,11),(213,3,11),(214,3,11),(215,3,11),(216,3,11),(217,3,11),(218,3,11),(219,3,11),(220,3,11),(221,3,11),(222,3,9),(223,3,9),(224,3,9),(225,3,9),(226,3,10),(227,3,10),(228,3,9),(229,3,9),(230,3,9),(231,3,9),(232,3,9),(233,3,10),(234,3,10),(235,3,9),(236,3,9),(237,3,10),(238,3,9),(239,3,9),(240,3,9),(241,3,9),(242,3,9),(243,3,10),(244,3,10),(245,3,10),(246,3,10),(247,3,10),(248,3,10),(249,3,10),(250,3,10),(251,3,10),(252,3,10),(253,3,10),(254,3,10),(255,3,10),(256,3,10),(257,3,10),(258,3,10),(259,3,10),(11,1,2),(260,1,2),(260,8,24);
/*!40000 ALTER TABLE `ychasnuk_section` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`Walde`@`%`*/ /*!50003 TRIGGER `assign_group` BEFORE INSERT ON `ychasnuk_section` FOR EACH ROW BEGIN
    DECLARE group_id INT;
    DECLARE participant_age INT;
    DECLARE participant_gender VARCHAR(10);
    DECLARE section_exists INT;

    SELECT Vik INTO participant_age FROM Ychasnuk WHERE ID = NEW.ID_Ychasnuka;

    SELECT Stat INTO participant_gender FROM Ychasnuk WHERE ID = NEW.ID_Ychasnuka;

    SELECT ID INTO group_id
    FROM Grupa
    WHERE ID_Section = NEW.ID_Section
        AND Za_vikom = CASE
            WHEN participant_age < 18 THEN 'Молодша'
            ELSE 'Старша'
        END
        AND (Za_statyu = CASE
            WHEN participant_gender = 'Чоловік' THEN 'Чоловіча'
            WHEN participant_gender = 'Жінка' THEN 'Жіноча'
            ELSE 'Змішана'
        END
        OR Za_statyu = 'Змішана')
    LIMIT 1;

    SET NEW.ID_Grup = group_id;

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`Walde`@`%`*/ /*!50003 TRIGGER `decrease_vilni_miscya_grupa` AFTER INSERT ON `ychasnuk_section` FOR EACH ROW BEGIN
    UPDATE Grupa
    SET Vilni_miscya = Vilni_miscya - 1
    WHERE ID = NEW.ID_Grup;

    UPDATE Section
    SET Vilni_miscya = Vilni_miscya - 1
    WHERE ID = NEW.ID_Section;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`Walde`@`%`*/ /*!50003 TRIGGER `increase_vilni_miscya_grupa` AFTER DELETE ON `ychasnuk_section` FOR EACH ROW BEGIN
    UPDATE Grupa
    SET Vilni_miscya = Vilni_miscya + 1
    WHERE ID = OLD.ID_Grup;

    UPDATE Section
    SET Vilni_miscya = Vilni_miscya + 1
    WHERE ID = OLD.ID_Section;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-06-29 18:54:27
