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
  `default` enum('0','1') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '0',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`address_id`),
  KEY `FK_addresses_users` (`user_id`),
  CONSTRAINT `FK_addresses_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table fast-ecommerce.addresses: ~10 rows (approximately)
/*!40000 ALTER TABLE `addresses` DISABLE KEYS */;
INSERT INTO `addresses` (`address_id`, `user_id`, `label`, `city`, `address`, `default`, `created`) VALUES
	(10, 9, 'office', 'Lahore', 'Anarkali Disco Chali', '1', '2022-06-01 20:22:05'),
	(11, 18, 'home', 'Lahore', 'C9, Saleeema Arcade', '0', '2022-06-01 21:24:12'),
	(12, 18, 'office', 'Karachi', 'Daryalal Street, Jodia', '1', '2022-06-01 21:25:11'),
	(13, 22, 'Home', 'Lahore', 'Anarkali Bazar', '1', '2022-06-02 22:33:48'),
	(14, 23, 'Home', 'Lahore', 'C26, Jauhar', '1', '2022-06-02 22:35:45'),
	(15, 24, 'Home', 'Karachi', 'C26, block 14, jauhar', '1', '2022-06-03 09:46:54'),
	(16, 25, 'Home', 'Karachi', 'C26, block 14, Jauhar', '1', '2022-06-03 10:03:44'),
	(17, 26, 'Home', 'Kathi', 'Haroon Royal City', '1', '2022-06-03 11:13:02'),
	(19, 9, 'office', 'Rawalpindi', 'Satellite Town', '0', '2022-06-03 20:46:12'),
	(20, 27, 'Home', 'Karachi', 'C26, Jauhar', '1', '2022-06-03 22:27:35'),
	(21, 28, 'Home', 'Karachi', 'Chakiwara', '1', '2022-06-04 09:28:39'),
	(22, 29, 'Home', 'Karachi', 'Gulshan-e-Iqbal', '1', '2022-06-04 09:40:02');
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
  UNIQUE KEY `user_id_product_id` (`user_id`,`product_id`),
  KEY `FK_cart_items_users` (`user_id`),
  KEY `FK_cart_items_products` (`product_id`),
  CONSTRAINT `FK_cart_items_products` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`),
  CONSTRAINT `FK_cart_items_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=143 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table fast-ecommerce.cart_items: ~16 rows (approximately)
/*!40000 ALTER TABLE `cart_items` DISABLE KEYS */;
INSERT INTO `cart_items` (`cart_item_id`, `user_id`, `product_id`, `quantity`, `created`) VALUES
	(69, 13, 1, 10, '2022-06-01 11:03:15'),
	(70, 13, 2, 6, '2022-06-01 11:03:19'),
	(71, 15, 1, 10, '2022-06-01 11:03:15'),
	(72, 15, 2, 6, '2022-06-01 11:03:19'),
	(73, 16, 1, 3, '2022-06-01 18:50:34'),
	(74, 16, 2, 3, '2022-06-01 18:51:05'),
	(75, 16, 3, 10, '2022-06-01 18:51:09'),
	(76, 17, 1, 3, '2022-06-01 19:34:58'),
	(77, 17, 2, 3, '2022-06-01 19:34:59'),
	(78, 18, 1, 9, '2022-06-01 21:17:37'),
	(79, 18, 2, 6, '2022-06-01 21:17:37'),
	(80, 18, 3, 8, '2022-06-01 21:17:40'),
	(87, 22, 1, 3, '2022-06-02 22:33:59'),
	(88, 22, 2, 3, '2022-06-02 22:34:00'),
	(125, 9, 1, 4, '2022-06-03 21:41:44'),
	(130, 9, 2, 4, '2022-06-03 23:54:49');
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

-- Dumping structure for table fast-ecommerce.constants
CREATE TABLE IF NOT EXISTS `constants` (
  `constant_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `value` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`constant_id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table fast-ecommerce.constants: ~4 rows (approximately)
/*!40000 ALTER TABLE `constants` DISABLE KEYS */;
INSERT INTO `constants` (`constant_id`, `name`, `value`, `created`) VALUES
	(1, 'whatsapp', '0333-3215469', '2022-06-02 16:43:13'),
	(2, 'email', 'support@fast.com', '2022-06-02 16:43:31'),
	(3, 'phone', '021-34554658', '2022-06-02 16:43:40'),
	(4, 'timings', '9AM to 6PM everyday, except Sundays and Prayer timings', '2022-06-02 16:44:27');
/*!40000 ALTER TABLE `constants` ENABLE KEYS */;

-- Dumping structure for table fast-ecommerce.guests
CREATE TABLE IF NOT EXISTS `guests` (
  `guest_id` int NOT NULL AUTO_INCREMENT,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`guest_id`)
) ENGINE=InnoDB AUTO_INCREMENT=485 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table fast-ecommerce.guests: ~42 rows (approximately)
/*!40000 ALTER TABLE `guests` DISABLE KEYS */;
INSERT INTO `guests` (`guest_id`, `created`) VALUES
	(430, '2022-06-01 19:34:43'),
	(431, '2022-06-01 19:34:43'),
	(433, '2022-06-01 19:46:37'),
	(434, '2022-06-01 19:46:37'),
	(435, '2022-06-01 19:46:38'),
	(436, '2022-06-01 21:17:27'),
	(438, '2022-06-01 21:28:00'),
	(439, '2022-06-01 21:28:46'),
	(440, '2022-06-01 21:28:49'),
	(441, '2022-06-01 21:28:49'),
	(442, '2022-06-01 21:49:15'),
	(443, '2022-06-01 22:47:27'),
	(444, '2022-06-01 22:47:29'),
	(445, '2022-06-01 22:47:29'),
	(446, '2022-06-02 14:50:17'),
	(447, '2022-06-02 14:50:17'),
	(448, '2022-06-02 14:50:17'),
	(449, '2022-06-02 15:51:14'),
	(450, '2022-06-02 15:51:32'),
	(451, '2022-06-02 17:03:43'),
	(452, '2022-06-02 17:03:43'),
	(454, '2022-06-02 22:26:37'),
	(455, '2022-06-02 22:26:37'),
	(457, '2022-06-02 22:35:16'),
	(458, '2022-06-02 22:35:16'),
	(460, '2022-06-02 22:38:27'),
	(461, '2022-06-02 22:38:27'),
	(462, '2022-06-02 22:38:27'),
	(463, '2022-06-03 09:46:00'),
	(464, '2022-06-03 09:46:00'),
	(465, '2022-06-03 09:46:00'),
	(467, '2022-06-03 09:55:31'),
	(468, '2022-06-03 09:55:31'),
	(470, '2022-06-03 11:12:11'),
	(471, '2022-06-03 11:12:12'),
	(473, '2022-06-03 21:44:20'),
	(474, '2022-06-03 21:44:20'),
	(475, '2022-06-03 21:44:20'),
	(476, '2022-06-03 22:23:26'),
	(477, '2022-06-03 22:23:26'),
	(478, '2022-06-03 22:23:26'),
	(479, '2022-06-03 22:24:02'),
	(482, '2022-06-04 09:39:26'),
	(483, '2022-06-04 09:39:26');
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
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table fast-ecommerce.guest_cart_items: ~1 rows (approximately)
/*!40000 ALTER TABLE `guest_cart_items` DISABLE KEYS */;
INSERT INTO `guest_cart_items` (`cart_item_id`, `user_id`, `product_id`, `quantity`, `created`) VALUES
	(90, 438, 1, 1, '2022-06-03 09:57:26');
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
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table fast-ecommerce.messages: ~25 rows (approximately)
/*!40000 ALTER TABLE `messages` DISABLE KEYS */;
INSERT INTO `messages` (`message_id`, `user_id`, `type`, `message`, `created`) VALUES
	(1, 18, 'info', 'Cograts! on creating a new account on fast.pk. Here goes too many possibilities for better lorem ipsum dolor sit comet', '2022-06-01 21:35:38'),
	(2, 18, 'info', 'Cograts! on creating a new account on fast.pk. Here goes too many possibilities for better lorem ipsum dolor sit comet', '2022-06-01 21:35:38'),
	(3, 18, 'info', 'Cograts! on creating a new account on fast.pk. Here goes too many possibilities for better lorem ipsum dolor sit comet', '2022-06-01 21:35:38'),
	(4, 18, 'ehe', 'We love you Sami! lorem ipsum dolor sit comet..', '2022-06-01 21:58:42'),
	(5, 18, 'ehe', 'We love you Sami! lorem ipsum dolor sit comet..', '2022-06-01 21:58:42'),
	(6, 18, 'ehe', 'We love you Sami! lorem ipsum dolor sit comet..', '2022-06-01 21:58:42'),
	(7, 18, 'as', 'Aha', '2022-06-01 22:09:47'),
	(8, 18, 'sdf', 'asdfasdf', '2022-06-01 22:11:16'),
	(9, 18, 'asd', 'asdfasdfasdfasdf', '2022-06-01 22:14:57'),
	(10, 18, 'asdf', 'asdfasdf', '2022-06-01 22:15:20'),
	(11, 18, 'asd', 'sadfasd', '2022-06-01 22:21:23'),
	(12, 9, 'asdf', 'asdfasdfasf', '2022-06-02 00:43:01'),
	(13, 9, 'asdf', 'asdf123234`', '2022-06-02 00:43:08'),
	(14, 9, 'sd', 'asdf', '2022-06-02 00:44:47'),
	(15, 9, 'info', 'The quick brown fox', '2022-06-02 08:23:04'),
	(16, 9, 'asd', 'sdfg', '2022-06-02 08:50:40'),
	(17, 9, 'asf', 'asdfsdf', '2022-06-02 09:02:50'),
	(18, 9, 'asd', 'aasdf', '2022-06-02 09:05:30'),
	(19, 9, 'asdf', 'New message', '2022-06-02 09:07:07'),
	(20, 9, 'adf', 'asdfasdf', '2022-06-02 09:08:10'),
	(21, 9, '965', 'asdfasdf', '2022-06-02 09:12:28'),
	(22, 9, '45', '9', '2022-06-02 09:14:49'),
	(23, 9, '4', '9', '2022-06-02 09:17:09'),
	(24, 9, 'asd', '65465465465asdfasf', '2022-06-02 09:17:50'),
	(25, 9, 'asdf', 'asdf', '2022-06-02 09:19:06');
/*!40000 ALTER TABLE `messages` ENABLE KEYS */;

-- Dumping structure for table fast-ecommerce.orders
CREATE TABLE IF NOT EXISTS `orders` (
  `order_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `promo_id` int DEFAULT NULL,
  `address` varchar(500) NOT NULL,
  `payment_method` enum('card','cod') NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`order_id`),
  KEY `FK_orders_users` (`user_id`),
  KEY `FK_orders_promos` (`promo_id`),
  CONSTRAINT `FK_orders_promos` FOREIGN KEY (`promo_id`) REFERENCES `promos` (`promo_id`),
  CONSTRAINT `FK_orders_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table fast-ecommerce.orders: ~10 rows (approximately)
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` (`order_id`, `user_id`, `promo_id`, `address`, `payment_method`, `created`) VALUES
	(24, 9, 1, 'Fatimah Bae, Patel Para - Lahore', 'cod', '2022-06-03 09:12:29'),
	(25, 24, NULL, 'C26, block 14, jauhar - Karachi', 'cod', '2022-06-03 09:51:23'),
	(27, 25, NULL, 'C26, block 14, Jauhar - Karachi', 'cod', '2022-06-03 10:03:51'),
	(28, 24, 4, 'C26, block 14, jauhar - Karachi', 'cod', '2022-06-03 10:13:31'),
	(29, 25, NULL, 'C26, block 14, Jauhar - Karachi', 'cod', '2022-06-03 10:32:30'),
	(30, 25, NULL, 'C26, block 14, Jauhar - Karachi', 'cod', '2022-06-03 10:32:50'),
	(31, 26, NULL, 'Haroon Royal City - Kathi', 'cod', '2022-06-03 11:13:09'),
	(32, 9, NULL, 'Anarkali Disco Chali - Lahore', 'cod', '2022-06-03 21:20:53'),
	(33, 9, 1, 'Anarkali Disco Chali - Lahore', 'cod', '2022-06-03 21:25:58'),
	(34, 27, NULL, 'C26, Jauhar - Karachi', 'cod', '2022-06-03 22:27:44'),
	(36, 28, NULL, 'Chakiwara - Karachi', 'cod', '2022-06-04 09:35:33'),
	(37, 28, NULL, 'Chakiwara - Karachi', 'cod', '2022-06-04 09:39:16'),
	(38, 29, NULL, 'Gulshan-e-Iqbal - Karachi', 'cod', '2022-06-04 09:40:21');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;

-- Dumping structure for table fast-ecommerce.order_details
CREATE TABLE IF NOT EXISTS `order_details` (
  `order_detail_id` int NOT NULL AUTO_INCREMENT,
  `order_id` int NOT NULL,
  `product_id` int NOT NULL,
  `quantity` int NOT NULL,
  `price` decimal(20,2) NOT NULL,
  `unit_cost` decimal(20,2) NOT NULL,
  PRIMARY KEY (`order_detail_id`),
  KEY `FK_order_details_orders` (`order_id`),
  KEY `FK_order_details_stocks` (`product_id`) USING BTREE,
  CONSTRAINT `FK_order_details_orders` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`),
  CONSTRAINT `FK_order_details_stocks` FOREIGN KEY (`product_id`) REFERENCES `stocks` (`stock_id`)
) ENGINE=InnoDB AUTO_INCREMENT=93 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table fast-ecommerce.order_details: ~33 rows (approximately)
/*!40000 ALTER TABLE `order_details` DISABLE KEYS */;
INSERT INTO `order_details` (`order_detail_id`, `order_id`, `product_id`, `quantity`, `price`, `unit_cost`) VALUES
	(48, 24, 1, 4, 100.00, 80.00),
	(49, 24, 2, 4, 250.00, 240.00),
	(50, 25, 1, 3, 100.00, 80.00),
	(51, 25, 3, 4, 250.00, 205.00),
	(52, 25, 11, 2, 400.00, 350.00),
	(53, 25, 12, 1, 300.00, 250.00),
	(54, 27, 1, 3, 100.00, 80.00),
	(55, 27, 2, 3, 250.00, 240.00),
	(56, 27, 3, 4, 250.00, 205.00),
	(57, 27, 4, 3, 500.00, 150.00),
	(58, 27, 5, 2, 110.00, 100.00),
	(61, 29, 1, 3, 100.00, 80.00),
	(62, 29, 2, 10, 250.00, 240.00),
	(63, 29, 3, 4, 250.00, 205.00),
	(64, 29, 4, 5, 500.00, 150.00),
	(65, 30, 1, 2, 100.00, 80.00),
	(66, 30, 2, 2, 250.00, 240.00),
	(67, 31, 3, 2, 250.00, 205.00),
	(68, 31, 4, 2, 500.00, 150.00),
	(69, 31, 6, 2, 300.00, 280.00),
	(70, 32, 1, 2, 100.00, 80.00),
	(71, 33, 1, 2, 100.00, 80.00),
	(72, 33, 2, 2, 250.00, 240.00),
	(73, 33, 3, 2, 250.00, 205.00),
	(74, 33, 4, 2, 500.00, 150.00),
	(75, 33, 5, 1, 110.00, 100.00),
	(76, 33, 6, 1, 300.00, 280.00),
	(77, 34, 1, 9, 100.00, 80.00),
	(78, 34, 2, 5, 250.00, 240.00),
	(79, 34, 3, 8, 250.00, 205.00),
	(80, 34, 4, 4, 500.00, 150.00),
	(86, 37, 1, 2, 100.00, 80.00),
	(87, 37, 2, 2, 250.00, 240.00),
	(88, 37, 3, 2, 250.00, 205.00),
	(89, 37, 4, 2, 500.00, 150.00),
	(90, 38, 1, 2, 100.00, 80.00),
	(91, 38, 2, 2, 250.00, 240.00),
	(92, 38, 3, 2, 250.00, 205.00);
/*!40000 ALTER TABLE `order_details` ENABLE KEYS */;

-- Dumping structure for table fast-ecommerce.order_statuses
CREATE TABLE IF NOT EXISTS `order_statuses` (
  `order_status_id` int NOT NULL AUTO_INCREMENT,
  `order_id` int NOT NULL,
  `status` varchar(50) NOT NULL,
  `description` int DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`order_status_id`),
  KEY `FK__orders` (`order_id`),
  CONSTRAINT `FK__orders` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table fast-ecommerce.order_statuses: ~10 rows (approximately)
/*!40000 ALTER TABLE `order_statuses` DISABLE KEYS */;
INSERT INTO `order_statuses` (`order_status_id`, `order_id`, `status`, `description`, `created`) VALUES
	(1, 24, 'confirmed', NULL, '2022-06-03 09:12:29'),
	(2, 25, 'confirmed', NULL, '2022-06-03 09:51:23'),
	(3, 27, 'confirmed', NULL, '2022-06-03 10:03:51'),
	(4, 28, 'confirmed', NULL, '2022-06-03 10:13:31'),
	(5, 29, 'confirmed', NULL, '2022-06-03 10:32:30'),
	(6, 30, 'confirmed', NULL, '2022-06-03 10:32:50'),
	(7, 31, 'confirmed', NULL, '2022-06-03 11:13:09'),
	(8, 32, 'confirmed', NULL, '2022-06-03 21:20:53'),
	(9, 33, 'confirmed', NULL, '2022-06-03 21:25:58'),
	(10, 34, 'confirmed', NULL, '2022-06-03 22:27:44'),
	(13, 37, 'confirmed', NULL, '2022-06-04 09:39:16'),
	(14, 38, 'confirmed', NULL, '2022-06-04 09:40:21');
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
  `code` char(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `validity` datetime NOT NULL,
  `percentage` int NOT NULL,
  `max_discount` decimal(20,2) NOT NULL DEFAULT '0.00',
  `status` enum('available','consumed','expired') NOT NULL DEFAULT 'available',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`promo_id`),
  UNIQUE KEY `user_id_code` (`user_id`,`code`),
  CONSTRAINT `FK_promos_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table fast-ecommerce.promos: ~3 rows (approximately)
/*!40000 ALTER TABLE `promos` DISABLE KEYS */;
INSERT INTO `promos` (`promo_id`, `user_id`, `code`, `validity`, `percentage`, `max_discount`, `status`, `created`) VALUES
	(1, 9, 'BE202', '2022-06-02 01:42:26', 10, 200.00, 'available', '2022-06-02 01:42:30'),
	(2, 9, 'GKMN', '2022-06-02 01:42:26', 10, 200.00, 'consumed', '2022-06-02 01:42:30'),
	(3, 9, 'VFX52', '2022-05-02 01:42:26', 10, 200.00, 'expired', '2022-06-02 01:42:30'),
	(4, 24, 'SB123', '2022-06-03 09:52:57', 10, 400.00, 'available', '2022-06-03 09:53:05'),
	(6, 28, 'b5vo9', '2022-07-04 09:35:33', 10, 100.00, 'available', '2022-06-04 09:35:33'),
	(7, 29, 'DEJAO', '2022-07-04 09:40:21', 10, 100.00, 'available', '2022-06-04 09:40:21');
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
  `last_messages_read` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_orders_read` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_promos_read` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_wallets_read` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table fast-ecommerce.users: ~18 rows (approximately)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`user_id`, `name`, `email`, `password`, `applied_promo_id`, `last_messages_read`, `last_orders_read`, `last_promos_read`, `last_wallets_read`, `created`) VALUES
	(7, 'Yousuf', 'yosof@fast.com', '$2a$11$IFPP9EvJmPU73z9T8xhgeuFfqpxIbVxaSRRcZ6M40PQFhuBqyiJZi', NULL, '2022-06-01 21:43:30', '2022-06-01 21:43:30', '2022-06-01 21:43:30', '2022-06-01 21:43:30', '2022-05-31 10:17:06'),
	(8, 'Fahad Alam', 'fahadalam@gmail.com', '$2a$11$ob4PfS8vnC3VSkiSpTNFKeC66wRJOGrLputlONT8zKP.OIUcJlM0C', NULL, '2022-06-01 21:43:30', '2022-06-01 21:43:30', '2022-06-01 21:43:30', '2022-06-01 21:43:30', '2022-05-31 10:24:30'),
	(9, 'Sajid', 'sajid@fast.com', '$2a$11$Jxvj93ZgzOlbATBcM02fFOM7jjBV3/D4EFHXj3bpHADdThAxp1oIC', NULL, '2022-06-03 01:33:32', '2022-06-03 21:29:49', '2022-06-02 17:02:35', '2022-06-02 22:26:32', '2022-05-31 10:31:42'),
	(10, 'nasir', 'nasir@fast.com', '$2a$11$dwA/ydACTGCXquf6oeQdAOUpre7.ePJi4J.RuGgCRn/p9ULldxXwK', NULL, '2022-06-01 21:43:30', '2022-06-01 21:43:30', '2022-06-01 21:43:30', '2022-06-01 21:43:30', '2022-06-01 11:08:14'),
	(11, 'nasir', 'nasir2@fast.com', '$2a$11$EAPeNfoMjDE4NhhPv9j1uO9ho5gZ8lP9En4RzlLX0zKh.rFRUOM2a', NULL, '2022-06-01 21:43:30', '2022-06-01 21:43:30', '2022-06-01 21:43:30', '2022-06-01 21:43:30', '2022-06-01 11:08:49'),
	(12, 'nasir', 'nasir3@fast.com', '$2a$11$mVIrHKce1HCcHZlspjpXxuth4v3NkubfYsGK4ljYZXqIMOqEzk2kG', NULL, '2022-06-01 21:43:30', '2022-06-01 21:43:30', '2022-06-01 21:43:30', '2022-06-01 21:43:30', '2022-06-01 11:09:22'),
	(13, 'saleem', 'saleem@fast.com', '$2a$11$xd9ivmjUWLw4cW6ErNKDpecBlvUOB4CLO5uC1TKsZ1Hb2BVO4gozC', NULL, '2022-06-01 21:43:30', '2022-06-01 21:43:30', '2022-06-01 21:43:30', '2022-06-01 21:43:30', '2022-06-01 11:11:06'),
	(14, 'naeem', 'naeem@fast.com', '$2a$11$Wx8Od0lz6G3cLU3vPkf.de/KdeF5xklNRUvSXoOxHi7fzBKJ2F5c.', NULL, '2022-06-01 21:43:30', '2022-06-01 21:43:30', '2022-06-01 21:43:30', '2022-06-01 21:43:30', '2022-06-01 11:11:34'),
	(15, 'shahid', 'shahid@fast.com', '$2a$11$ebsBbhvmUpatVcbP22Lo0e0VfD4H2L.2JmKfXj/8OfKkkwueV.uz.', NULL, '2022-06-01 21:43:30', '2022-06-01 21:43:30', '2022-06-01 21:43:30', '2022-06-01 21:43:30', '2022-06-01 11:13:24'),
	(16, 'habib', 'habib@fast.com', '$2a$11$8nJljXLXPCOUZ/3TJjKMFeyd0h.tLzr5mUh2V6KSZ.jFlFnb5de8K', NULL, '2022-06-01 21:43:30', '2022-06-01 21:43:30', '2022-06-01 21:43:30', '2022-06-01 21:43:30', '2022-06-01 18:51:45'),
	(17, 'Furqan', 'furqan@fast.com', '$2a$11$MjysB0KBx.9sLlFlRrOtSuR36RhcTuR3Tj66OpWgB3wEcQCztBS2e', NULL, '2022-06-01 21:43:30', '2022-06-01 21:43:30', '2022-06-01 21:43:30', '2022-06-01 21:43:30', '2022-06-01 19:35:25'),
	(18, 'Sami', 'sami@gmail.com', '$2a$11$Uf62x.4U3pXTxhijB/qqQe79tB5hvOUYx0b0UZlaM6l/V/LZv7Y5O', NULL, '2022-06-01 22:44:44', '2022-06-01 21:43:30', '2022-06-01 21:43:30', '2022-06-01 21:43:30', '2022-06-01 21:18:38'),
	(19, 'Javed', 'javed@mm.com', '$2a$11$UKeI2ss87SnO2R0KUHW4ausOggINzJs2uqMl0YWkTXWLvaLCwL70S', NULL, '2022-06-02 17:08:37', '2022-06-02 17:08:37', '2022-06-02 17:08:37', '2022-06-02 17:08:37', '2022-06-02 17:08:37'),
	(20, 'Fahad', 'fahad@ss.com', '$2a$11$6mbuZUy7vwXP4hPoeP9yZOXv2psutS0miYtDvbv5amjj1kyE6r2H2', NULL, '2022-06-02 17:10:48', '2022-06-02 17:10:48', '2022-06-02 17:10:48', '2022-06-02 17:10:48', '2022-06-02 17:10:48'),
	(21, 'Naseem', 'naseem@abc.com', '$2a$11$2Psh/L07QDEldtDMlJ8K1eYVh34dc9erMRR7xnXZZ.diZnKpbtCCG', NULL, '2022-06-02 22:33:15', '2022-06-02 22:33:15', '2022-06-02 22:33:15', '2022-06-02 22:33:15', '2022-06-02 22:33:15'),
	(22, 'Naseem', 'naseem@gmail.com', '$2a$11$T7vH6tuARnocECFbK15DBuw4mB65ANuBIRPwR5Uolz0ZDtAFCGUZK', NULL, '2022-06-02 22:33:48', '2022-06-02 22:33:48', '2022-06-02 22:33:48', '2022-06-02 22:33:48', '2022-06-02 22:33:48'),
	(23, 'Jameel Iqbal Khan', 'jameel@gmail.com', '$2a$11$PG8QUsdlCVPKwRTCVSJ96eiJRsCM21usarNpJVvfUzcbotL322nrm', NULL, '2022-06-02 22:35:45', '2022-06-02 22:35:45', '2022-06-02 22:35:45', '2022-06-02 22:35:45', '2022-06-02 22:35:45'),
	(24, 'Shoaib', 'shoaib@zz.com', '$2a$11$e9NG4bFmlrgoUBfgN/wnfeTtDskHdfax.49jUruuOFWksZcaKTJHe', NULL, '2022-06-03 09:46:54', '2022-06-03 09:55:22', '2022-06-03 09:55:08', '2022-06-03 09:46:54', '2022-06-03 09:46:54'),
	(25, 'Ayesha', 'ayesha@ff.com', '$2a$11$ghH2MUfmQpzCfQFPYbRVTevoavZoTyJ5dCoN4f2MKej.4.jtD5qsy', NULL, '2022-06-03 10:04:46', '2022-06-03 10:32:55', '2022-06-03 10:04:59', '2022-06-03 10:04:56', '2022-06-03 10:03:44'),
	(26, 'Shahid', 'shahid@ff.com', '$2a$11$0RqkV20NmRDr2OzcW1or2.z0gfABp0S5nNT3qdBPHY0WNsxAl6lPe', NULL, '2022-06-03 11:13:02', '2022-06-03 22:23:13', '2022-06-03 11:13:02', '2022-06-03 11:13:02', '2022-06-03 11:13:02'),
	(27, 'Fahad', 'fahad@ssq.com', '$2a$11$XvL1NOOcQGHAu9FPf4xLGOOYiIeh18N87YwGLDKkAbWh4hhf/UL1y', NULL, '2022-06-03 22:27:35', '2022-06-03 22:27:56', '2022-06-03 22:27:35', '2022-06-03 22:27:35', '2022-06-03 22:27:35'),
	(28, 'Nasreen', 'nasreen@ff.com', '$2a$11$fGZ8S05bknUu1Yc/lMeeDeyW2TwTDYlqqRE/foQGMgmuunceUx7vS', NULL, '2022-06-04 09:28:39', '2022-06-04 09:28:39', '2022-06-04 09:28:39', '2022-06-04 09:28:39', '2022-06-04 09:28:39'),
	(29, 'Suleman', 'suleman@ff.com', '$2a$11$zVqQtZKAtt4B9/42BAWM4.SQIvuSGnKvMsMCYVEM8I8y7jvqj3qWu', NULL, '2022-06-04 09:40:02', '2022-06-04 09:41:56', '2022-06-04 09:40:47', '2022-06-04 09:40:02', '2022-06-04 09:40:02');
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table fast-ecommerce.wallets: ~4 rows (approximately)
/*!40000 ALTER TABLE `wallets` DISABLE KEYS */;
INSERT INTO `wallets` (`wallet_id`, `user_id`, `in`, `out`, `created`) VALUES
	(1, 9, 500.00, 0.00, '2022-06-02 14:26:43'),
	(2, 9, 0.00, 250.00, '2022-06-02 14:26:50'),
	(3, 9, 1250.00, 0.00, '2022-06-02 14:27:02'),
	(4, 9, 0.00, 850.00, '2022-06-02 14:27:10');
/*!40000 ALTER TABLE `wallets` ENABLE KEYS */;

-- Dumping structure for table fast-ecommerce.wishlists
CREATE TABLE IF NOT EXISTS `wishlists` (
  `wishlist_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `product_id` int NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`wishlist_id`),
  UNIQUE KEY `user_id_product_id` (`user_id`,`product_id`),
  KEY `FK_wishlists_users` (`user_id`),
  KEY `FK_wishlists_products` (`product_id`),
  CONSTRAINT `FK_wishlists_products` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`),
  CONSTRAINT `FK_wishlists_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=92 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table fast-ecommerce.wishlists: ~3 rows (approximately)
/*!40000 ALTER TABLE `wishlists` DISABLE KEYS */;
INSERT INTO `wishlists` (`wishlist_id`, `user_id`, `product_id`, `created`) VALUES
	(58, 9, 2, '2022-06-03 21:35:36'),
	(59, 9, 3, '2022-06-03 21:35:42'),
	(87, 9, 1, '2022-06-03 21:41:50');
/*!40000 ALTER TABLE `wishlists` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
