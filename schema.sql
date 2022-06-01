-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               8.0.26 - MySQL Community Server - GPL
-- Server OS:                    Win64
-- HeidiSQL Version:             11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for fast-ecommerce
CREATE DATABASE IF NOT EXISTS `fast-ecommerce` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `fast-ecommerce`;

-- Dumping structure for table fast-ecommerce.activities
CREATE TABLE IF NOT EXISTS `activities` (
  `activity_id` int NOT NULL AUTO_INCREMENT,
  `admin_id` int NOT NULL,
  `activity` text NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`activity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table fast-ecommerce.activities: ~0 rows (approximately)
/*!40000 ALTER TABLE `activities` DISABLE KEYS */;
/*!40000 ALTER TABLE `activities` ENABLE KEYS */;

-- Dumping structure for table fast-ecommerce.addresses
CREATE TABLE IF NOT EXISTS `addresses` (
  `address_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `label` varchar(50) NOT NULL,
  `city` varchar(300) NOT NULL,
  `address` varchar(500) NOT NULL,
  `default` enum('0','1') NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`address_id`),
  KEY `FK_addresses_users` (`user_id`),
  CONSTRAINT `FK_addresses_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table fast-ecommerce.addresses: ~0 rows (approximately)
/*!40000 ALTER TABLE `addresses` DISABLE KEYS */;
/*!40000 ALTER TABLE `addresses` ENABLE KEYS */;

-- Dumping structure for table fast-ecommerce.admins
CREATE TABLE IF NOT EXISTS `admins` (
  `admin_id` int NOT NULL AUTO_INCREMENT,
  `contact` char(11) NOT NULL,
  `firstname` varchar(50) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `email` varchar(350) NOT NULL,
  `password` char(60) NOT NULL,
  `privileges` enum('standard','super') NOT NULL DEFAULT 'standard',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`admin_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table fast-ecommerce.admins: ~0 rows (approximately)
/*!40000 ALTER TABLE `admins` DISABLE KEYS */;
/*!40000 ALTER TABLE `admins` ENABLE KEYS */;

-- Dumping structure for table fast-ecommerce.brands
CREATE TABLE IF NOT EXISTS `brands` (
  `brand_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `url_name` varchar(50) NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`brand_id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `url_name` (`url_name`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table fast-ecommerce.brands: ~11 rows (approximately)
/*!40000 ALTER TABLE `brands` DISABLE KEYS */;
INSERT INTO `brands` (`brand_id`, `name`, `url_name`, `created`) VALUES
	(1, 'Nurpur', 'nurpur', '2022-05-27 10:45:03'),
	(2, 'Olpers', 'olpers', '2022-05-27 10:45:33'),
	(3, 'Milkpak', 'milkpak', '2022-05-27 10:45:46'),
	(4, 'Good Milk', 'good-milk', '2022-05-27 10:45:58'),
	(5, 'Blue Band', 'blue-band', '2022-05-27 10:46:14'),
	(6, 'Amul', 'amul', '2022-05-27 10:48:12'),
	(7, 'Adam\'s', 'adams', '2022-05-27 10:50:18'),
	(8, 'Nestle', 'nestle', '2022-05-27 10:50:46'),
	(9, 'Dayfresh', 'dayfresh', '2022-05-27 10:50:58'),
	(11, 'Nido', 'nido', '2022-05-27 14:54:13'),
	(12, 'Desi', 'desi', '2022-05-27 14:56:03');
/*!40000 ALTER TABLE `brands` ENABLE KEYS */;

-- Dumping structure for table fast-ecommerce.cart_items
CREATE TABLE IF NOT EXISTS `cart_items` (
  `cart_item_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `product_id` int NOT NULL,
  `quantity` int NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`cart_item_id`) USING BTREE,
  KEY `FK_cart_items_users` (`user_id`),
  KEY `FK_cart_items_products` (`product_id`),
  CONSTRAINT `FK_cart_items_products` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`),
  CONSTRAINT `FK_cart_items_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table fast-ecommerce.cart_items: ~0 rows (approximately)
/*!40000 ALTER TABLE `cart_items` DISABLE KEYS */;
INSERT INTO `cart_items` (`cart_item_id`, `user_id`, `product_id`, `quantity`, `created`) VALUES
	(69, 13, 1, 10, '2022-06-01 11:03:15'),
	(70, 13, 2, 6, '2022-06-01 11:03:19'),
	(71, 15, 1, 10, '2022-06-01 11:03:15'),
	(72, 15, 2, 6, '2022-06-01 11:03:19');
/*!40000 ALTER TABLE `cart_items` ENABLE KEYS */;

-- Dumping structure for table fast-ecommerce.categories
CREATE TABLE IF NOT EXISTS `categories` (
  `category_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `url_name` varchar(50) NOT NULL,
  `parent_id` int DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`category_id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `url_name` (`url_name`),
  KEY `FK_categories_categories` (`parent_id`),
  CONSTRAINT `FK_categories_categories` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table fast-ecommerce.categories: ~17 rows (approximately)
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` (`category_id`, `name`, `url_name`, `parent_id`, `created`) VALUES
	(3, 'Oil & Ghee', 'oil_and_ghee', NULL, '2022-05-27 09:05:27'),
	(4, 'Beverages', 'beverages', NULL, '2022-05-27 09:07:17'),
	(5, 'Dairy', 'dairy', NULL, '2022-05-27 09:06:02'),
	(6, 'Butter', 'butter', 5, '2022-05-26 23:58:46'),
	(7, 'Milk', 'milk', 5, '2022-05-26 23:59:08'),
	(8, 'Cream', 'cream', 5, '2022-05-26 23:59:18'),
	(9, 'Cheese', 'cheese', 5, '2022-05-26 23:59:30'),
	(10, 'Egg', 'egg', 5, '2022-05-26 23:59:42'),
	(11, 'Yogurt', 'yogurt', 5, '2022-05-27 00:00:59'),
	(12, 'Milk Powders', 'milk-powders', 5, '2022-05-27 00:01:15'),
	(13, 'Soft Drinks', 'soft-drinks', 4, '2022-05-27 00:02:19'),
	(14, 'Juices', 'juices', 4, '2022-05-27 00:02:37'),
	(15, 'Mineral Water', 'mineral_water', 4, '2022-05-27 00:03:02'),
	(16, 'Energy Drinks', 'energy-drinks', 4, '2022-05-27 00:03:18'),
	(17, 'Cooking Oil', 'cooking-oil', 3, '2022-05-27 00:04:03'),
	(18, 'Ghee', 'ghee', 3, '2022-05-27 00:04:15'),
	(19, 'Organic Oil', 'organic-oil', 3, '2022-05-27 00:04:47');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;

-- Dumping structure for table fast-ecommerce.guests
CREATE TABLE IF NOT EXISTS `guests` (
  `guest_id` int NOT NULL AUTO_INCREMENT,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`guest_id`)
) ENGINE=InnoDB AUTO_INCREMENT=428 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table fast-ecommerce.guests: ~56 rows (approximately)
/*!40000 ALTER TABLE `guests` DISABLE KEYS */;
INSERT INTO `guests` (`guest_id`, `created`) VALUES
	(359, '2022-06-01 09:53:30'),
	(360, '2022-06-01 09:53:32'),
	(361, '2022-06-01 09:53:32'),
	(362, '2022-06-01 09:53:32'),
	(363, '2022-06-01 09:53:32'),
	(364, '2022-06-01 09:53:32'),
	(365, '2022-06-01 09:53:32'),
	(366, '2022-06-01 09:53:32'),
	(367, '2022-06-01 09:53:32'),
	(368, '2022-06-01 09:53:32'),
	(369, '2022-06-01 09:53:32'),
	(370, '2022-06-01 09:53:33'),
	(371, '2022-06-01 09:53:33'),
	(372, '2022-06-01 09:53:33'),
	(373, '2022-06-01 09:53:33'),
	(374, '2022-06-01 09:53:33'),
	(375, '2022-06-01 09:53:33'),
	(376, '2022-06-01 09:53:33'),
	(377, '2022-06-01 09:53:33'),
	(378, '2022-06-01 09:53:33'),
	(379, '2022-06-01 09:53:33'),
	(380, '2022-06-01 09:53:34'),
	(381, '2022-06-01 09:53:34'),
	(382, '2022-06-01 09:53:34'),
	(383, '2022-06-01 09:53:34'),
	(384, '2022-06-01 09:53:34'),
	(385, '2022-06-01 09:53:34'),
	(386, '2022-06-01 09:53:34'),
	(387, '2022-06-01 09:53:34'),
	(388, '2022-06-01 09:53:34'),
	(389, '2022-06-01 09:53:34'),
	(390, '2022-06-01 09:53:34'),
	(391, '2022-06-01 09:53:34'),
	(392, '2022-06-01 09:53:34'),
	(393, '2022-06-01 09:53:34'),
	(394, '2022-06-01 09:53:35'),
	(395, '2022-06-01 09:53:35'),
	(396, '2022-06-01 09:53:35'),
	(397, '2022-06-01 09:53:35'),
	(398, '2022-06-01 09:53:35'),
	(399, '2022-06-01 09:53:35'),
	(400, '2022-06-01 09:53:35'),
	(401, '2022-06-01 09:53:35'),
	(402, '2022-06-01 09:56:03'),
	(403, '2022-06-01 09:56:04'),
	(404, '2022-06-01 09:56:04'),
	(405, '2022-06-01 09:56:04'),
	(406, '2022-06-01 09:56:04'),
	(407, '2022-06-01 09:56:04'),
	(408, '2022-06-01 10:04:32'),
	(409, '2022-06-01 10:04:56'),
	(410, '2022-06-01 10:04:59'),
	(411, '2022-06-01 10:05:02'),
	(412, '2022-06-01 10:05:09'),
	(413, '2022-06-01 10:05:20'),
	(414, '2022-06-01 10:05:41'),
	(415, '2022-06-01 10:05:41'),
	(416, '2022-06-01 10:05:53'),
	(417, '2022-06-01 10:06:05'),
	(418, '2022-06-01 10:06:35'),
	(419, '2022-06-01 10:50:36'),
	(420, '2022-06-01 10:57:15'),
	(421, '2022-06-01 10:57:15'),
	(422, '2022-06-01 10:57:15'),
	(423, '2022-06-01 10:57:15'),
	(425, '2022-06-01 11:13:34'),
	(426, '2022-06-01 11:13:34'),
	(427, '2022-06-01 11:13:34');
/*!40000 ALTER TABLE `guests` ENABLE KEYS */;

-- Dumping structure for table fast-ecommerce.guest_cart_items
CREATE TABLE IF NOT EXISTS `guest_cart_items` (
  `cart_item_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `product_id` int NOT NULL,
  `quantity` int NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`cart_item_id`) USING BTREE,
  KEY `FK_cart_items_products` (`product_id`) USING BTREE,
  KEY `FK_guest_cart_items_guests` (`user_id`) USING BTREE,
  CONSTRAINT `FK_guest_cart_items_guests` FOREIGN KEY (`user_id`) REFERENCES `guests` (`guest_id`),
  CONSTRAINT `guest_cart_items_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table fast-ecommerce.guest_cart_items: ~0 rows (approximately)
/*!40000 ALTER TABLE `guest_cart_items` DISABLE KEYS */;
INSERT INTO `guest_cart_items` (`cart_item_id`, `user_id`, `product_id`, `quantity`, `created`) VALUES
	(68, 423, 1, 10, '2022-06-01 10:58:35');
/*!40000 ALTER TABLE `guest_cart_items` ENABLE KEYS */;

-- Dumping structure for table fast-ecommerce.messages
CREATE TABLE IF NOT EXISTS `messages` (
  `message_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `type` varchar(50) NOT NULL,
  `message` varchar(500) NOT NULL,
  `created` timestamp NOT NULL,
  PRIMARY KEY (`message_id`),
  KEY `FK_messages_users` (`user_id`),
  CONSTRAINT `FK_messages_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table fast-ecommerce.messages: ~0 rows (approximately)
/*!40000 ALTER TABLE `messages` DISABLE KEYS */;
/*!40000 ALTER TABLE `messages` ENABLE KEYS */;

-- Dumping structure for table fast-ecommerce.orders
CREATE TABLE IF NOT EXISTS `orders` (
  `order_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `promo_id` int NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`order_id`),
  KEY `FK_orders_users` (`user_id`),
  KEY `FK_orders_promos` (`promo_id`),
  CONSTRAINT `FK_orders_promos` FOREIGN KEY (`promo_id`) REFERENCES `promos` (`promo_id`),
  CONSTRAINT `FK_orders_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table fast-ecommerce.orders: ~0 rows (approximately)
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;

-- Dumping structure for table fast-ecommerce.order_details
CREATE TABLE IF NOT EXISTS `order_details` (
  `order_detail_id` int NOT NULL AUTO_INCREMENT,
  `order_id` int NOT NULL,
  `stock_id` int NOT NULL,
  `quantity` int NOT NULL,
  `price` decimal(20,2) NOT NULL,
  PRIMARY KEY (`order_detail_id`),
  KEY `FK_order_details_orders` (`order_id`),
  KEY `FK_order_details_stocks` (`stock_id`),
  CONSTRAINT `FK_order_details_orders` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`),
  CONSTRAINT `FK_order_details_stocks` FOREIGN KEY (`stock_id`) REFERENCES `stocks` (`stock_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table fast-ecommerce.order_details: ~0 rows (approximately)
/*!40000 ALTER TABLE `order_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_details` ENABLE KEYS */;

-- Dumping structure for table fast-ecommerce.order_statuses
CREATE TABLE IF NOT EXISTS `order_statuses` (
  `order_status_id` int NOT NULL AUTO_INCREMENT,
  `order_id` int NOT NULL,
  `status` varchar(50) NOT NULL,
  `description` int DEFAULT NULL,
  `created` timestamp NOT NULL,
  PRIMARY KEY (`order_status_id`),
  KEY `FK__orders` (`order_id`),
  CONSTRAINT `FK__orders` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table fast-ecommerce.order_statuses: ~0 rows (approximately)
/*!40000 ALTER TABLE `order_statuses` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_statuses` ENABLE KEYS */;

-- Dumping structure for table fast-ecommerce.products
CREATE TABLE IF NOT EXISTS `products` (
  `product_id` int NOT NULL AUTO_INCREMENT,
  `category_id` int NOT NULL,
  `brand_id` int NOT NULL,
  `name` varchar(50) NOT NULL,
  `url_name` varchar(50) NOT NULL,
  `stock` int NOT NULL DEFAULT '10',
  `unit_cost` int NOT NULL DEFAULT '10',
  `price` decimal(20,2) NOT NULL DEFAULT '0.00',
  `fair_quantity` int NOT NULL DEFAULT '10',
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`product_id`),
  UNIQUE KEY `url_name` (`url_name`),
  UNIQUE KEY `name` (`name`),
  KEY `FK_products_categories` (`category_id`),
  KEY `FK_products_brands` (`brand_id`),
  CONSTRAINT `FK_products_brands` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`brand_id`),
  CONSTRAINT `FK_products_categories` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table fast-ecommerce.products: ~18 rows (approximately)
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` (`product_id`, `category_id`, `brand_id`, `name`, `url_name`, `stock`, `unit_cost`, `price`, `fair_quantity`, `description`, `created`) VALUES
	(1, 6, 1, 'Nurpur Butter 50 Grams', 'nurpur-butter-50-grams', 505, 80, 100.00, 10, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Temporibus quasi praesentium sapiente nisi nobis debitis optio fugit rerum voluptates sed.', '2022-05-27 14:38:38'),
	(2, 6, 1, 'Nurpur Butter 200 Grams', 'nurpur-butter-200-grams', 10, 240, 250.00, 10, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Temporibus quasi praesentium sapiente nisi nobis debitis optio fugit rerum voluptates sed.', '2022-05-27 14:39:14'),
	(3, 6, 5, 'Blueband Margarine 250 Grams', 'blueband-margaring-250-grams', 50, 205, 250.00, 10, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Temporibus quasi praesentium sapiente nisi nobis debitis optio fugit rerum voluptates sed.', '2022-05-27 14:39:46'),
	(4, 6, 5, 'Blueband Margarine 500 Grams', 'blueband-margarine-500-grams', 60, 150, 500.00, 10, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Temporibus quasi praesentium sapiente nisi nobis debitis optio fugit rerum voluptates sed.', '2022-05-27 14:40:08'),
	(5, 7, 2, 'Olpers 250 ML', 'olpers-250-ml', 50, 100, 110.00, 10, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Temporibus quasi praesentium sapiente nisi nobis debitis optio fugit rerum voluptates sed.', '2022-05-27 14:43:28'),
	(6, 7, 2, 'Olpers 1 Litre', 'olpers-1-litre', 200, 280, 300.00, 10, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Temporibus quasi praesentium sapiente nisi nobis debitis optio fugit rerum voluptates sed.', '2022-05-27 14:44:15'),
	(7, 7, 8, 'Milkpak Milk 250 ML', 'milkpak-milk-250-ml', 50, 60, 120.00, 10, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Temporibus quasi praesentium sapiente nisi nobis debitis optio fugit rerum voluptates sed.', '2022-05-27 14:45:44'),
	(8, 7, 8, 'Milkpak Milk 1 Litre', 'milkpak-milk-1-litre', 10, 310, 320.00, 10, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Temporibus quasi praesentium sapiente nisi nobis debitis optio fugit rerum voluptates sed.', '2022-05-27 14:46:11'),
	(9, 8, 3, 'Milkpack Cream 200 ML', 'milkpak-cream-200-ml', 0, 170, 180.00, 10, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Temporibus quasi praesentium sapiente nisi nobis debitis optio fugit rerum voluptates sed.', '2022-05-27 14:48:02'),
	(10, 8, 2, 'Olpers Cream 200 ML', 'olpers-cream-200-ml', 65, 170, 180.00, 10, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Temporibus quasi praesentium sapiente nisi nobis debitis optio fugit rerum voluptates sed.', '2022-05-27 14:48:33'),
	(11, 9, 7, 'Adams Cheese Slices 10 Pieces', 'adams-cheese-slices-10-pieces', 20, 350, 400.00, 10, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Temporibus quasi praesentium sapiente nisi nobis debitis optio fugit rerum voluptates sed.', '2022-05-27 14:49:03'),
	(12, 9, 7, 'Adams Cheddar Cheese 250 Grams', 'adams-cheddar-cheese-250-grams', 10, 250, 300.00, 10, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Temporibus quasi praesentium sapiente nisi nobis debitis optio fugit rerum voluptates sed.', '2022-05-27 14:49:34'),
	(13, 9, 7, 'Adams Mozzarella Cheese 500 Grams', 'adams-mozzarella-cheese-500-grams', 30, 405, 455.00, 10, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Temporibus quasi praesentium sapiente nisi nobis debitis optio fugit rerum voluptates sed.', '2022-05-27 14:50:08'),
	(14, 9, 6, 'Amul Cheese Slices 15 Pieces', 'amul-cheese-slices-15-pieces', 40, 350, 506.00, 10, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Temporibus quasi praesentium sapiente nisi nobis debitis optio fugit rerum voluptates sed.', '2022-05-27 14:51:31'),
	(16, 11, 8, 'Nestle Yogurt 500 Grams', 'nestle-yogurt-500-grams', 50, 240, 245.00, 10, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Temporibus quasi praesentium sapiente nisi nobis debitis optio fugit rerum voluptates sed.', '2022-05-27 14:52:37'),
	(17, 11, 8, 'Nestle Yogurt 125 Grams', 'nestle-yogurt-125-grams', 0, 50, 100.00, 10, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Temporibus quasi praesentium sapiente nisi nobis debitis optio fugit rerum voluptates sed.', '2022-05-27 14:52:56'),
	(18, 12, 11, 'Nido Powder 500 Grams', 'nido-powder-500-grams', 5000, 1235, 1500.00, 10, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Temporibus quasi praesentium sapiente nisi nobis debitis optio fugit rerum voluptates sed.', '2022-05-27 14:55:04'),
	(20, 10, 12, 'Eggs 1 Dozen', 'eggs-1-dozen', 1000, 160, 180.00, 10, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Temporibus quasi praesentium sapiente nisi nobis debitis optio fugit rerum voluptates sed.', '2022-05-27 14:56:48');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;

-- Dumping structure for table fast-ecommerce.promos
CREATE TABLE IF NOT EXISTS `promos` (
  `promo_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `validity` datetime NOT NULL,
  `percentage` int NOT NULL,
  `max_discount` decimal(20,2) NOT NULL DEFAULT '0.00',
  `consumed` tinyint NOT NULL DEFAULT '0',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`promo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table fast-ecommerce.promos: ~0 rows (approximately)
/*!40000 ALTER TABLE `promos` DISABLE KEYS */;
/*!40000 ALTER TABLE `promos` ENABLE KEYS */;

-- Dumping structure for table fast-ecommerce.stocks
CREATE TABLE IF NOT EXISTS `stocks` (
  `stock_id` int NOT NULL AUTO_INCREMENT,
  `product_id` int NOT NULL,
  `quantity_came` int NOT NULL,
  `quantity_remaining` int NOT NULL,
  `unit_cost` decimal(20,2) NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`stock_id`),
  KEY `FK_stocks_products` (`product_id`),
  CONSTRAINT `FK_stocks_products` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table fast-ecommerce.stocks: ~24 rows (approximately)
/*!40000 ALTER TABLE `stocks` DISABLE KEYS */;
INSERT INTO `stocks` (`stock_id`, `product_id`, `quantity_came`, `quantity_remaining`, `unit_cost`, `created`) VALUES
	(1, 12, 100, 100, 502.00, '2022-05-27 17:24:35'),
	(2, 11, 50, 50, 100.00, '2022-05-27 17:24:59'),
	(3, 13, 10, 10, 201.00, '2022-05-27 17:25:15'),
	(4, 14, 1, 1, 101.00, '2022-05-27 17:25:24'),
	(5, 3, 200, 200, 450.00, '2022-05-27 17:25:43'),
	(6, 4, 50, 50, 900.00, '2022-05-27 17:25:52'),
	(7, 20, 50, 50, 180.00, '2022-05-27 17:26:03'),
	(8, 9, 5000, 5000, 100.00, '2022-05-27 17:26:14'),
	(9, 8, 100, 100, 280.00, '2022-05-27 17:26:29'),
	(10, 17, 5, 0, 120.00, '2022-05-27 17:26:42'),
	(11, 16, 10, 10, 220.00, '2022-05-27 17:26:59'),
	(12, 18, 1005, 1005, 1500.00, '2022-05-27 17:27:16'),
	(13, 2, 300, 300, 300.00, '2022-05-27 17:27:30'),
	(14, 1, 100, 100, 100.00, '2022-05-27 17:27:52'),
	(15, 6, 10, 10, 320.00, '2022-05-27 17:28:11'),
	(16, 5, 5, 5, 500.00, '2022-05-27 17:28:25'),
	(17, 10, 50, 50, 250.00, '2022-05-27 17:28:38'),
	(18, 11, 50, 50, 100.00, '2022-05-27 17:24:59'),
	(19, 11, 50, 50, 100.00, '2022-05-27 17:24:59'),
	(20, 14, 1, 1, 101.00, '2022-05-27 17:25:24'),
	(21, 14, 1, 1, 101.00, '2022-05-27 17:25:24'),
	(22, 20, 50, 50, 190.00, '2022-05-27 17:26:03'),
	(23, 20, 50, 50, 200.00, '2022-05-27 17:26:03'),
	(24, 7, 20, 20, 250.00, '2022-05-27 18:04:19');
/*!40000 ALTER TABLE `stocks` ENABLE KEYS */;

-- Dumping structure for table fast-ecommerce.users
CREATE TABLE IF NOT EXISTS `users` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `email` varchar(350) NOT NULL,
  `password` char(60) NOT NULL,
  `applied_promo_id` int DEFAULT NULL,
  `last_messages_read` datetime DEFAULT NULL,
  `last_orders_read` datetime DEFAULT NULL,
  `last_promos_read` datetime DEFAULT NULL,
  `last_wallet_read` datetime DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table fast-ecommerce.users: ~3 rows (approximately)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`user_id`, `name`, `email`, `password`, `applied_promo_id`, `last_messages_read`, `last_orders_read`, `last_promos_read`, `last_wallet_read`, `created`) VALUES
	(7, 'Yousuf', 'yosof@fast.com', '$2a$11$IFPP9EvJmPU73z9T8xhgeuFfqpxIbVxaSRRcZ6M40PQFhuBqyiJZi', NULL, NULL, NULL, NULL, NULL, '2022-05-31 10:17:06'),
	(8, 'Fahad Alam', 'fahadalam@gmail.com', '$2a$11$ob4PfS8vnC3VSkiSpTNFKeC66wRJOGrLputlONT8zKP.OIUcJlM0C', NULL, NULL, NULL, NULL, NULL, '2022-05-31 10:24:30'),
	(9, 'Sajid', 'sajid@fast.com', '$2a$11$Jxvj93ZgzOlbATBcM02fFOM7jjBV3/D4EFHXj3bpHADdThAxp1oIC', NULL, NULL, NULL, NULL, NULL, '2022-05-31 10:31:42'),
	(10, 'nasir', 'nasir@fast.com', '$2a$11$dwA/ydACTGCXquf6oeQdAOUpre7.ePJi4J.RuGgCRn/p9ULldxXwK', NULL, NULL, NULL, NULL, NULL, '2022-06-01 11:08:14'),
	(11, 'nasir', 'nasir2@fast.com', '$2a$11$EAPeNfoMjDE4NhhPv9j1uO9ho5gZ8lP9En4RzlLX0zKh.rFRUOM2a', NULL, NULL, NULL, NULL, NULL, '2022-06-01 11:08:49'),
	(12, 'nasir', 'nasir3@fast.com', '$2a$11$mVIrHKce1HCcHZlspjpXxuth4v3NkubfYsGK4ljYZXqIMOqEzk2kG', NULL, NULL, NULL, NULL, NULL, '2022-06-01 11:09:22'),
	(13, 'saleem', 'saleem@fast.com', '$2a$11$xd9ivmjUWLw4cW6ErNKDpecBlvUOB4CLO5uC1TKsZ1Hb2BVO4gozC', NULL, NULL, NULL, NULL, NULL, '2022-06-01 11:11:06'),
	(14, 'naeem', 'naeem@fast.com', '$2a$11$Wx8Od0lz6G3cLU3vPkf.de/KdeF5xklNRUvSXoOxHi7fzBKJ2F5c.', NULL, NULL, NULL, NULL, NULL, '2022-06-01 11:11:34'),
	(15, 'shahid', 'shahid@fast.com', '$2a$11$ebsBbhvmUpatVcbP22Lo0e0VfD4H2L.2JmKfXj/8OfKkkwueV.uz.', NULL, NULL, NULL, NULL, NULL, '2022-06-01 11:13:24');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

-- Dumping structure for table fast-ecommerce.validations
CREATE TABLE IF NOT EXISTS `validations` (
  `validation_id` int NOT NULL AUTO_INCREMENT,
  `admin_id` int NOT NULL,
  `uuid` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `purpose` enum('password-change','email-validation') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `validity` datetime NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`validation_id`) USING BTREE,
  KEY `FK_tokens_admins` (`admin_id`) USING BTREE,
  CONSTRAINT `FK_tokens_admins` FOREIGN KEY (`admin_id`) REFERENCES `ammistore`.`admins` (`admin_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Admin Validations\r\n\r\nEach validation belongs to one admin 1:1\r\n\r\n';

-- Dumping data for table fast-ecommerce.validations: ~0 rows (approximately)
/*!40000 ALTER TABLE `validations` DISABLE KEYS */;
/*!40000 ALTER TABLE `validations` ENABLE KEYS */;

-- Dumping structure for table fast-ecommerce.wallets
CREATE TABLE IF NOT EXISTS `wallets` (
  `wallet_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `in` decimal(20,2) NOT NULL DEFAULT '0.00',
  `out` decimal(20,2) NOT NULL DEFAULT '0.00',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`wallet_id`),
  KEY `FK_wallets_users` (`user_id`),
  CONSTRAINT `FK_wallets_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table fast-ecommerce.wallets: ~0 rows (approximately)
/*!40000 ALTER TABLE `wallets` DISABLE KEYS */;
/*!40000 ALTER TABLE `wallets` ENABLE KEYS */;

-- Dumping structure for table fast-ecommerce.wishlists
CREATE TABLE IF NOT EXISTS `wishlists` (
  `wishlist_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `product_id` int NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`wishlist_id`),
  KEY `FK_wishlists_users` (`user_id`),
  KEY `FK_wishlists_products` (`product_id`),
  CONSTRAINT `FK_wishlists_products` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`),
  CONSTRAINT `FK_wishlists_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table fast-ecommerce.wishlists: ~0 rows (approximately)
/*!40000 ALTER TABLE `wishlists` DISABLE KEYS */;
/*!40000 ALTER TABLE `wishlists` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
