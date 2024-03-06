-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: e-commerce_site
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
-- Table structure for table `_prisma_migrations`
--

DROP TABLE IF EXISTS `_prisma_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_prisma_migrations` (
  `id` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `checksum` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `finished_at` datetime(3) DEFAULT NULL,
  `migration_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `logs` text COLLATE utf8mb4_unicode_ci,
  `rolled_back_at` datetime(3) DEFAULT NULL,
  `started_at` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `applied_steps_count` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_prisma_migrations`
--

LOCK TABLES `_prisma_migrations` WRITE;
/*!40000 ALTER TABLE `_prisma_migrations` DISABLE KEYS */;
INSERT INTO `_prisma_migrations` VALUES ('4855e0e9-e109-4cd1-b99f-594efe4211f0','70df33390b606b40dac865f85dc0a3acafe7baa3cf58eb40b2e29db6d6ba6a5c','2024-03-05 06:34:18.885','20240217122224_add_destination_total_column',NULL,NULL,'2024-03-05 06:34:18.781',1),('6deccc0a-482b-4fc2-ba59-615d6f4b9de2','47ad750dc27d4b6120b8c06c18bebf77be59612a6626d3dcb14f5be6a7db1f99','2024-03-05 06:34:18.664','20240215090533_',NULL,NULL,'2024-03-05 06:34:15.964',1),('a4fdd7ce-aaee-437a-809e-d96594c500b2','8047646af78e617124a2f10f060786c3690870f89e279e0626dc23d7fe362e2d','2024-03-05 06:34:18.775','20240216040041_',NULL,NULL,'2024-03-05 06:34:18.670',1),('b9aefb79-f9bc-4b36-849b-df77c81a7236','54e6e430310ff06a0372982745815b46a001b9765b699fa9074f1334866d4fa5','2024-03-05 06:34:18.983','20240217123054_update_column_name',NULL,NULL,'2024-03-05 06:34:18.890',1),('c9d48a7a-7ea5-4279-8880-aa9cffc40441','852e19814dbe8db2904196244a96da111817d11783ec63fa610d4c8e7dcecdd8','2024-03-05 06:34:19.325','20240221141200_',NULL,NULL,'2024-03-05 06:34:19.227',1),('e84d2c88-3e7a-45d4-aa9d-b559cd9bd349','852e19814dbe8db2904196244a96da111817d11783ec63fa610d4c8e7dcecdd8','2024-03-05 06:34:19.223','20240221074537_',NULL,NULL,'2024-03-05 06:34:18.987',1);
/*!40000 ALTER TABLE `_prisma_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart` (
  `id` int NOT NULL AUTO_INCREMENT,
  `userId` int DEFAULT NULL,
  `productId` int DEFAULT NULL,
  `quantity` int NOT NULL,
  `total` double NOT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `updatedAt` datetime(3) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Cart_productId_fkey` (`productId`),
  KEY `Cart_userId_fkey` (`userId`),
  CONSTRAINT `Cart_productId_fkey` FOREIGN KEY (`productId`) REFERENCES `products` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `Cart_userId_fkey` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
INSERT INTO `cart` VALUES (5,2,10,19,19000190,'2024-03-06 05:00:21.863','2024-03-06 05:00:21.863');
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `updatedAt` datetime(3) NOT NULL,
  `isDeleted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `categories_name_key` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Vga','2024-03-05 06:35:55.883','2024-03-05 06:35:55.883',0),(2,'Ram','2024-03-05 06:35:55.904','2024-03-05 06:35:55.904',0),(3,'Monitor','2024-03-05 06:35:55.914','2024-03-05 06:35:55.914',0),(4,'Cpu','2024-03-05 06:35:55.927','2024-03-05 06:35:55.927',0),(5,'Mouse','2024-03-05 06:35:55.940','2024-03-05 06:35:55.940',0);
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_order`
--

DROP TABLE IF EXISTS `item_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item_order` (
  `id` int NOT NULL AUTO_INCREMENT,
  `productId` int NOT NULL,
  `orderId` int NOT NULL,
  `quantity` int NOT NULL,
  `price` double NOT NULL,
  `total` double NOT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `updatedAt` datetime(3) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `item_order_productId_fkey` (`productId`),
  KEY `item_order_orderId_fkey` (`orderId`),
  CONSTRAINT `item_order_orderId_fkey` FOREIGN KEY (`orderId`) REFERENCES `orders` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `item_order_productId_fkey` FOREIGN KEY (`productId`) REFERENCES `products` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_order`
--

LOCK TABLES `item_order` WRITE;
/*!40000 ALTER TABLE `item_order` DISABLE KEYS */;
INSERT INTO `item_order` VALUES (1,1,1,100,1000001,100000100,'2024-03-05 07:22:48.777','2024-03-05 07:22:48.777'),(2,1,2,100,1000001,100000100,'2024-03-06 04:33:24.642','2024-03-06 04:33:24.642'),(3,10,3,80,1000010,80000800,'2024-03-06 04:35:16.588','2024-03-06 04:35:16.588'),(4,21,4,100,1000000,100000000,'2024-03-06 05:01:01.182','2024-03-06 05:01:01.182');
/*!40000 ALTER TABLE `item_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `id` int NOT NULL AUTO_INCREMENT,
  `invoice` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` datetime(3) NOT NULL,
  `userId` int DEFAULT NULL,
  `status` enum('waiting for payment','paid','delivered','completed','cancelled') COLLATE utf8mb4_unicode_ci NOT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `updatedAt` datetime(3) NOT NULL,
  `destination` int NOT NULL,
  `grand_total` double NOT NULL,
  `total_ongkir` double NOT NULL,
  `total_order` double NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `orders_invoice_key` (`invoice`),
  KEY `orders_userId_fkey` (`userId`),
  CONSTRAINT `orders_userId_fkey` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,'1','2024-03-05 07:22:48.782',2,'paid','2024-03-05 07:22:48.777','2024-03-05 07:22:53.150',501,100014100,14000,100000100),(2,'2','2024-03-06 04:33:24.648',2,'paid','2024-03-06 04:33:24.642','2024-03-06 04:33:28.755',501,100014100,14000,100000100),(3,'3','2024-03-06 04:35:16.589',2,'paid','2024-03-06 04:35:16.588','2024-03-06 04:35:19.091',135,80020800,20000,80000800),(4,'4','2024-03-06 05:01:01.183',2,'paid','2024-03-06 05:01:01.182','2024-03-06 05:01:05.195',210,100020000,20000,100000000);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permission_roles`
--

DROP TABLE IF EXISTS `permission_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `permission_roles` (
  `roleId` int NOT NULL,
  `permissionId` int NOT NULL,
  PRIMARY KEY (`roleId`,`permissionId`),
  KEY `permission_roles_permissionId_fkey` (`permissionId`),
  CONSTRAINT `permission_roles_permissionId_fkey` FOREIGN KEY (`permissionId`) REFERENCES `permissions` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `permission_roles_roleId_fkey` FOREIGN KEY (`roleId`) REFERENCES `roles` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permission_roles`
--

LOCK TABLES `permission_roles` WRITE;
/*!40000 ALTER TABLE `permission_roles` DISABLE KEYS */;
INSERT INTO `permission_roles` VALUES (1,1),(2,2),(1,3),(2,3),(1,4),(2,4),(1,5),(1,6),(1,7),(1,8),(2,8),(1,9),(2,9),(1,10),(1,11),(1,12),(2,13),(2,14),(2,15),(2,16),(2,17),(2,18),(2,19),(2,20),(1,21),(1,22),(1,23),(1,24),(1,25);
/*!40000 ALTER TABLE `permission_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `permissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `updatedAt` datetime(3) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissions`
--

LOCK TABLES `permissions` WRITE;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
INSERT INTO `permissions` VALUES (1,'browse_users','2024-03-05 06:35:52.221','2024-03-05 06:35:52.221'),(2,'edit_user','2024-03-05 06:35:52.246','2024-03-05 06:35:52.246'),(3,'browse_products','2024-03-05 06:35:52.257','2024-03-05 06:35:52.257'),(4,'read_product','2024-03-05 06:35:52.267','2024-03-05 06:35:52.267'),(5,'edit_product','2024-03-05 06:35:52.291','2024-03-05 06:35:52.291'),(6,'add_product','2024-03-05 06:35:52.301','2024-03-05 06:35:52.301'),(7,'delete_product','2024-03-05 06:35:52.310','2024-03-05 06:35:52.310'),(8,'browse_categories','2024-03-05 06:35:52.333','2024-03-05 06:35:52.333'),(9,'read_category','2024-03-05 06:35:52.343','2024-03-05 06:35:52.343'),(10,'edit_category','2024-03-05 06:35:52.363','2024-03-05 06:35:52.363'),(11,'add_category','2024-03-05 06:35:52.377','2024-03-05 06:35:52.377'),(12,'delete_category','2024-03-05 06:35:52.386','2024-03-05 06:35:52.386'),(13,'browse_carts','2024-03-05 06:35:52.395','2024-03-05 06:35:52.395'),(14,'edit_cart','2024-03-05 06:35:52.404','2024-03-05 06:35:52.404'),(15,'add_cart','2024-03-05 06:35:52.426','2024-03-05 06:35:52.426'),(16,'delete_cart','2024-03-05 06:35:52.435','2024-03-05 06:35:52.435'),(17,'browse_orders','2024-03-05 06:35:52.444','2024-03-05 06:35:52.444'),(18,'read_order','2024-03-05 06:35:52.451','2024-03-05 06:35:52.451'),(19,'add_order','2024-03-05 06:35:52.473','2024-03-05 06:35:52.473'),(20,'edit-status-order','2024-03-05 06:35:52.481','2024-03-05 06:35:52.481'),(21,'admin_browse_orders','2024-03-05 06:35:52.492','2024-03-05 06:35:52.492'),(22,'admin_read_orders','2024-03-05 06:35:52.501','2024-03-05 06:35:52.501'),(23,'admin_edit_status_order','2024-03-05 06:35:52.510','2024-03-05 06:35:52.510'),(24,'add_image','2024-03-05 06:35:52.528','2024-03-05 06:35:52.528'),(25,'delete_image','2024-03-05 06:35:52.536','2024-03-05 06:35:52.536');
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_images`
--

DROP TABLE IF EXISTS `product_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_images` (
  `id` int NOT NULL AUTO_INCREMENT,
  `imageUrl` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `productId` int DEFAULT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `updatedAt` datetime(3) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_images_productId_fkey` (`productId`),
  CONSTRAINT `product_images_productId_fkey` FOREIGN KEY (`productId`) REFERENCES `products` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_images`
--

LOCK TABLES `product_images` WRITE;
/*!40000 ALTER TABLE `product_images` DISABLE KEYS */;
INSERT INTO `product_images` VALUES (1,'image1.jpg',1,'2024-03-05 06:35:56.911','2024-03-05 06:35:56.911'),(2,'image2.jpg',1,'2024-03-05 06:35:56.911','2024-03-05 06:35:56.911'),(3,'image3.jpg',1,'2024-03-05 06:35:56.911','2024-03-05 06:35:56.911'),(4,'image1.jpg',2,'2024-03-05 06:35:56.911','2024-03-05 06:35:56.911'),(5,'image2.jpg',2,'2024-03-05 06:35:56.911','2024-03-05 06:35:56.911'),(6,'image3.jpg',2,'2024-03-05 06:35:56.911','2024-03-05 06:35:56.911'),(7,'image1.jpg',3,'2024-03-05 06:35:56.911','2024-03-05 06:35:56.911'),(8,'image2.jpg',3,'2024-03-05 06:35:56.911','2024-03-05 06:35:56.911'),(9,'image3.jpg',3,'2024-03-05 06:35:56.911','2024-03-05 06:35:56.911'),(10,'image1.jpg',4,'2024-03-05 06:35:56.911','2024-03-05 06:35:56.911'),(11,'image2.jpg',4,'2024-03-05 06:35:56.911','2024-03-05 06:35:56.911'),(12,'image3.jpg',4,'2024-03-05 06:35:56.911','2024-03-05 06:35:56.911'),(13,'image1.jpg',5,'2024-03-05 06:35:56.911','2024-03-05 06:35:56.911'),(14,'image2.jpg',5,'2024-03-05 06:35:56.911','2024-03-05 06:35:56.911'),(15,'image3.jpg',5,'2024-03-05 06:35:56.911','2024-03-05 06:35:56.911'),(16,'image1.jpg',6,'2024-03-05 06:35:56.911','2024-03-05 06:35:56.911'),(17,'image2.jpg',6,'2024-03-05 06:35:56.911','2024-03-05 06:35:56.911'),(18,'image3.jpg',6,'2024-03-05 06:35:56.911','2024-03-05 06:35:56.911'),(19,'image1.jpg',7,'2024-03-05 06:35:56.911','2024-03-05 06:35:56.911'),(20,'image2.jpg',7,'2024-03-05 06:35:56.911','2024-03-05 06:35:56.911'),(21,'image3.jpg',7,'2024-03-05 06:35:56.911','2024-03-05 06:35:56.911'),(22,'image1.jpg',8,'2024-03-05 06:35:56.911','2024-03-05 06:35:56.911'),(23,'image2.jpg',8,'2024-03-05 06:35:56.911','2024-03-05 06:35:56.911'),(24,'image3.jpg',8,'2024-03-05 06:35:56.911','2024-03-05 06:35:56.911'),(25,'image1.jpg',9,'2024-03-05 06:35:56.911','2024-03-05 06:35:56.911'),(26,'image2.jpg',9,'2024-03-05 06:35:56.911','2024-03-05 06:35:56.911'),(27,'image3.jpg',9,'2024-03-05 06:35:56.911','2024-03-05 06:35:56.911'),(28,'image1.jpg',10,'2024-03-05 06:35:56.911','2024-03-05 06:35:56.911'),(29,'image2.jpg',10,'2024-03-05 06:35:56.911','2024-03-05 06:35:56.911'),(30,'image3.jpg',10,'2024-03-05 06:35:56.911','2024-03-05 06:35:56.911'),(31,'image1.jpg',11,'2024-03-05 06:35:56.911','2024-03-05 06:35:56.911'),(32,'image2.jpg',11,'2024-03-05 06:35:56.911','2024-03-05 06:35:56.911'),(33,'image3.jpg',11,'2024-03-05 06:35:56.911','2024-03-05 06:35:56.911'),(34,'image1.jpg',12,'2024-03-05 06:35:56.911','2024-03-05 06:35:56.911'),(35,'image2.jpg',12,'2024-03-05 06:35:56.911','2024-03-05 06:35:56.911'),(36,'image3.jpg',12,'2024-03-05 06:35:56.911','2024-03-05 06:35:56.911'),(37,'image1.jpg',13,'2024-03-05 06:35:56.911','2024-03-05 06:35:56.911'),(38,'image2.jpg',13,'2024-03-05 06:35:56.911','2024-03-05 06:35:56.911'),(39,'image3.jpg',13,'2024-03-05 06:35:56.911','2024-03-05 06:35:56.911'),(40,'image1.jpg',14,'2024-03-05 06:35:56.911','2024-03-05 06:35:56.911'),(41,'image2.jpg',14,'2024-03-05 06:35:56.911','2024-03-05 06:35:56.911'),(42,'image3.jpg',14,'2024-03-05 06:35:56.911','2024-03-05 06:35:56.911'),(43,'image1.jpg',15,'2024-03-05 06:35:56.911','2024-03-05 06:35:56.911'),(44,'image2.jpg',15,'2024-03-05 06:35:56.911','2024-03-05 06:35:56.911'),(45,'image3.jpg',15,'2024-03-05 06:35:56.911','2024-03-05 06:35:56.911'),(46,'image1.jpg',16,'2024-03-05 06:35:56.911','2024-03-05 06:35:56.911'),(47,'image2.jpg',16,'2024-03-05 06:35:56.911','2024-03-05 06:35:56.911'),(48,'image3.jpg',16,'2024-03-05 06:35:56.911','2024-03-05 06:35:56.911'),(49,'image1.jpg',17,'2024-03-05 06:35:56.911','2024-03-05 06:35:56.911'),(50,'image2.jpg',17,'2024-03-05 06:35:56.911','2024-03-05 06:35:56.911'),(51,'image3.jpg',17,'2024-03-05 06:35:56.911','2024-03-05 06:35:56.911'),(52,'image1.jpg',18,'2024-03-05 06:35:56.911','2024-03-05 06:35:56.911'),(53,'image2.jpg',18,'2024-03-05 06:35:56.911','2024-03-05 06:35:56.911'),(54,'image3.jpg',18,'2024-03-05 06:35:56.911','2024-03-05 06:35:56.911'),(55,'image1.jpg',19,'2024-03-05 06:35:56.911','2024-03-05 06:35:56.911'),(56,'image2.jpg',19,'2024-03-05 06:35:56.911','2024-03-05 06:35:56.911'),(57,'image3.jpg',19,'2024-03-05 06:35:56.911','2024-03-05 06:35:56.911'),(58,'image1.jpg',20,'2024-03-05 06:35:56.911','2024-03-05 06:35:56.911'),(59,'image2.jpg',20,'2024-03-05 06:35:56.911','2024-03-05 06:35:56.911'),(60,'image3.jpg',20,'2024-03-05 06:35:56.911','2024-03-05 06:35:56.911'),(61,'product_url-cpu1.jpg1709701085347.jpeg',21,'2024-03-06 04:58:05.464','2024-03-06 04:58:05.464'),(62,'product_url-Monitor1.jpg1709701085354.jpeg',21,'2024-03-06 04:58:05.464','2024-03-06 04:58:05.464'),(63,'product_url-VGA1.jpg1709701085356.jpeg',21,'2024-03-06 04:58:05.464','2024-03-06 04:58:05.464');
/*!40000 ALTER TABLE `product_images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantity` int NOT NULL,
  `price` double NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `isDeleted` tinyint(1) NOT NULL DEFAULT '0',
  `categoryId` int DEFAULT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `updatedAt` datetime(3) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `products_categoryId_fkey` (`categoryId`),
  CONSTRAINT `products_categoryId_fkey` FOREIGN KEY (`categoryId`) REFERENCES `categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'Product 1',0,1000001,'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',0,3,'2024-03-05 06:35:56.717','2024-03-06 04:33:24.642'),(2,'Product 2',100,1000002,'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',0,4,'2024-03-05 06:35:56.732','2024-03-05 06:35:56.732'),(3,'Product 3',100,1000003,'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',0,4,'2024-03-05 06:35:56.745','2024-03-05 06:35:56.745'),(4,'Product 4',100,1000004,'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',0,1,'2024-03-05 06:35:56.756','2024-03-05 06:35:56.756'),(5,'Product 5',100,1000005,'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',0,4,'2024-03-05 06:35:56.765','2024-03-05 06:35:56.765'),(6,'Product 6',100,1000006,'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',0,4,'2024-03-05 06:35:56.776','2024-03-05 06:35:56.776'),(7,'Product 7',100,1000007,'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',0,5,'2024-03-05 06:35:56.785','2024-03-05 06:35:56.785'),(8,'Product 8',100,1000008,'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',0,3,'2024-03-05 06:35:56.798','2024-03-05 06:35:56.798'),(9,'Product 9',100,1000009,'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',0,4,'2024-03-05 06:35:56.809','2024-03-05 06:35:56.809'),(10,'Product 10',20,1000010,'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',0,2,'2024-03-05 06:35:56.818','2024-03-06 04:35:16.588'),(11,'Product 11',100,1000011,'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',0,2,'2024-03-05 06:35:56.831','2024-03-05 06:35:56.831'),(12,'Product 12',100,1000012,'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',0,1,'2024-03-05 06:35:56.841','2024-03-05 06:35:56.841'),(13,'Product 13',100,1000013,'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',0,1,'2024-03-05 06:35:56.849','2024-03-05 06:35:56.849'),(14,'Product 14',100,1000014,'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',0,1,'2024-03-05 06:35:56.860','2024-03-05 06:35:56.860'),(15,'Product 15',100,1000015,'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',0,2,'2024-03-05 06:35:56.867','2024-03-05 06:35:56.867'),(16,'Product 16',100,1000016,'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',0,5,'2024-03-05 06:35:56.875','2024-03-05 06:35:56.875'),(17,'Product 17',100,1000017,'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',0,2,'2024-03-05 06:35:56.882','2024-03-05 06:35:56.882'),(18,'Product 18',100,1000018,'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',0,1,'2024-03-05 06:35:56.889','2024-03-05 06:35:56.889'),(19,'Product 19',100,1000019,'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',0,1,'2024-03-05 06:35:56.895','2024-03-05 06:35:56.895'),(20,'Product 20',100,1000020,'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',0,3,'2024-03-05 06:35:56.901','2024-03-05 06:35:56.901'),(21,'Product test',0,1000000,'bagus banget productnya',0,3,'2024-03-06 04:58:05.411','2024-03-06 05:01:01.182');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `updatedAt` datetime(3) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'admin','2024-03-05 06:35:52.104','2024-03-05 06:35:52.104'),(2,'user','2024-03-05 06:35:52.211','2024-03-05 06:35:52.211');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `roleId` int DEFAULT NULL,
  `createdAt` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `updatedAt` datetime(3) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_key` (`email`),
  KEY `users_roleId_fkey` (`roleId`),
  CONSTRAINT `users_roleId_fkey` FOREIGN KEY (`roleId`) REFERENCES `roles` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Admin','User','admin@example.com','$2b$10$.VQHPyzRbnqJrTWBsXABAO7ndg3NwUa5p7UkGPhe1UWJ9DOK/paES','Admin Address',1,'2024-03-05 06:35:55.065','2024-03-05 06:35:55.065'),(2,'Regular','User 1','user1@example.com','$2b$10$.VQHPyzRbnqJrTWBsXABAO7ndg3NwUa5p7UkGPhe1UWJ9DOK/paES','User Address 1',2,'2024-03-05 06:35:55.065','2024-03-05 06:35:55.065'),(3,'Regular','User 2','user2@example.com','$2b$10$.VQHPyzRbnqJrTWBsXABAO7ndg3NwUa5p7UkGPhe1UWJ9DOK/paES','User Address 2',2,'2024-03-05 06:35:55.065','2024-03-05 06:35:55.065'),(4,'Regular','User 3','user3@example.com','$2b$10$.VQHPyzRbnqJrTWBsXABAO7ndg3NwUa5p7UkGPhe1UWJ9DOK/paES','User Address 3',2,'2024-03-05 06:35:55.065','2024-03-05 06:35:55.065'),(5,'Regular','User 4','user4@example.com','$2b$10$.VQHPyzRbnqJrTWBsXABAO7ndg3NwUa5p7UkGPhe1UWJ9DOK/paES','User Address 4',2,'2024-03-05 06:35:55.065','2024-03-05 06:35:55.065'),(6,'Regular','User 5','user5@example.com','$2b$10$.VQHPyzRbnqJrTWBsXABAO7ndg3NwUa5p7UkGPhe1UWJ9DOK/paES','User Address 5',2,'2024-03-05 06:35:55.065','2024-03-05 06:35:55.065');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'e-commerce_site'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-03-06 14:44:17
