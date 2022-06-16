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
  `contact` varchar(20) NOT NULL,
  `default` enum('0','1') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '0',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`address_id`),
  KEY `FK_addresses_users` (`user_id`),
  CONSTRAINT `FK_addresses_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table fast-ecommerce.addresses: ~2 rows (approximately)
/*!40000 ALTER TABLE `addresses` DISABLE KEYS */;
INSERT INTO `addresses` (`address_id`, `user_id`, `label`, `city`, `address`, `contact`, `default`, `created`) VALUES
	(10, 9, 'office', 'Lahore', 'Anarkali Disco Chali', '03212503902', '1', '2022-06-01 20:22:05'),
	(19, 9, 'office', 'Rawalpindi', 'Satellite Town', '03333419363', '0', '2022-06-03 20:46:12');
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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table fast-ecommerce.brands: ~5 rows (approximately)
/*!40000 ALTER TABLE `brands` DISABLE KEYS */;
INSERT INTO `brands` (`brand_id`, `name`, `url_name`, `created`) VALUES
	(1, 'Nurpur', 'nurpur', '2022-05-27 10:45:03'),
	(2, 'Olpers', 'olpers', '2022-05-27 10:45:33'),
	(3, 'Milkpak', 'milkpak', '2022-05-27 10:45:46'),
	(4, 'Good Milk', 'good-milk', '2022-05-27 10:45:58'),
	(5, 'Blue Band', 'blue-band', '2022-05-27 10:46:14'),
	(6, 'AmulG', 'amul-g', '2022-05-27 10:48:12'),
	(7, 'Adam\'s', 'adams', '2022-05-27 10:50:18'),
	(8, 'Nestle', 'nestle', '2022-05-27 10:50:46'),
	(9, 'Dayfresh', 'dayfresh', '2022-05-27 10:50:58'),
	(11, 'Nido', 'nido', '2022-05-27 14:54:13'),
	(12, 'Desi', 'desi', '2022-05-27 14:56:03'),
	(13, 'Samama', 'samama', '2022-06-12 10:00:04');
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
) ENGINE=InnoDB AUTO_INCREMENT=7504 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table fast-ecommerce.cart_items: ~0 rows (approximately)
/*!40000 ALTER TABLE `cart_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart_items` ENABLE KEYS */;

-- Dumping structure for table fast-ecommerce.categories
CREATE TABLE IF NOT EXISTS `categories` (
  `category_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `url_name` varchar(50) NOT NULL,
  `parent_id` int DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`category_id`),
  UNIQUE KEY `url_name` (`url_name`),
  UNIQUE KEY `name` (`name`),
  KEY `FK_categories_categories` (`parent_id`),
  CONSTRAINT `FK_categories_categories` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table fast-ecommerce.categories: ~28 rows (approximately)
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` (`category_id`, `name`, `url_name`, `parent_id`, `created`) VALUES
	(3, 'Oil & Ghee', 'oil-ghee', NULL, '2022-05-27 09:05:27'),
	(4, 'Beverages', 'beverages', NULL, '2022-05-27 09:07:17'),
	(5, 'Dairy', 'dairy', NULL, '2022-05-27 09:06:02'),
	(6, 'Butter', 'butter', 5, '2022-05-26 23:58:46'),
	(7, 'Milk', 'milk', 5, '2022-05-26 23:59:08'),
	(8, 'Cream', 'cream', 5, '2022-05-26 23:59:18'),
	(9, 'Cheese', 'cheese', 5, '2022-05-26 23:59:30'),
	(10, 'Egg', 'egg', 5, '2022-05-26 23:59:42'),
	(11, 'Yogurt', 'yogurt', 5, '2022-05-27 00:00:59'),
	(12, 'Milk Powders', 'milk-powders', 5, '2022-05-27 00:01:15'),
	(14, 'Juices', 'juices', 4, '2022-05-27 00:02:37'),
	(15, 'Mineral Water', 'mineral_water', 4, '2022-05-27 00:03:02'),
	(17, 'Cooking Oil', 'cooking-oil', 3, '2022-05-27 00:04:03'),
	(18, 'Ghee', 'ghee', 3, '2022-05-27 00:04:15'),
	(19, 'Organic Oil', 'organic-oil', 3, '2022-05-27 00:04:47'),
	(25, 'Margarine', 'margarine', 5, '2022-06-10 16:32:59'),
	(26, 'Books', 'books', NULL, '2022-06-10 19:45:43'),
	(29, 'Liquids', 'liquids', 4, '2022-06-11 23:52:50'),
	(32, 'Electronics', 'electronics', NULL, '2022-06-12 09:04:19'),
	(33, 'Cellphones', 'cellphones', 32, '2022-06-12 09:05:05'),
	(34, 'Air Conditioners', 'air-conditioners', 32, '2022-06-12 09:05:27'),
	(35, 'Calculators', 'calculators', 32, '2022-06-12 09:05:40'),
	(36, 'Mayonnaise', 'mayonnaise', 5, '2022-06-12 09:07:35'),
	(37, '1212', '1212', 5, '2022-06-12 09:08:17'),
	(38, '22222', '22222', 37, '2022-06-12 09:09:10'),
	(39, '654654', '654654', 38, '2022-06-12 10:04:27'),
	(40, 'fdhdfgh', 'fdhdfgh', 39, '2022-06-12 10:04:33'),
	(41, 'sss', 'sss', 39, '2022-06-12 10:04:47');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;

-- Dumping structure for table fast-ecommerce.constants
CREATE TABLE IF NOT EXISTS `constants` (
  `constant_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `value` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`constant_id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table fast-ecommerce.constants: ~4 rows (approximately)
/*!40000 ALTER TABLE `constants` DISABLE KEYS */;
INSERT INTO `constants` (`constant_id`, `name`, `value`, `created`) VALUES
	(7, 'margin', '20', '2022-06-13 12:21:31'),
	(8, 'sales_tax', '17', '2022-06-13 12:21:39'),
	(9, 'flat_off', '0', '2022-06-13 12:21:49'),
	(10, 'delivery_charges', '200', '2022-06-13 12:21:57');
/*!40000 ALTER TABLE `constants` ENABLE KEYS */;

-- Dumping structure for table fast-ecommerce.guests
CREATE TABLE IF NOT EXISTS `guests` (
  `guest_id` int NOT NULL AUTO_INCREMENT,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`guest_id`)
) ENGINE=InnoDB AUTO_INCREMENT=746 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table fast-ecommerce.guests: ~238 rows (approximately)
/*!40000 ALTER TABLE `guests` DISABLE KEYS */;
INSERT INTO `guests` (`guest_id`, `created`) VALUES
	(508, '2022-06-15 13:19:21'),
	(509, '2022-06-15 13:19:21'),
	(510, '2022-06-15 13:19:21'),
	(511, '2022-06-15 13:19:21'),
	(512, '2022-06-15 13:19:21'),
	(513, '2022-06-15 13:19:21'),
	(514, '2022-06-15 13:19:21'),
	(515, '2022-06-15 13:19:21'),
	(516, '2022-06-15 13:19:21'),
	(517, '2022-06-15 13:19:21'),
	(518, '2022-06-15 13:19:22'),
	(519, '2022-06-15 13:19:22'),
	(520, '2022-06-15 13:19:22'),
	(521, '2022-06-15 13:19:22'),
	(522, '2022-06-15 13:19:22'),
	(523, '2022-06-15 13:19:22'),
	(524, '2022-06-15 13:19:22'),
	(525, '2022-06-15 13:19:22'),
	(526, '2022-06-15 13:19:22'),
	(527, '2022-06-15 13:19:22'),
	(528, '2022-06-15 13:19:22'),
	(529, '2022-06-15 13:19:22'),
	(530, '2022-06-15 13:19:22'),
	(531, '2022-06-15 13:19:22'),
	(532, '2022-06-15 13:19:22'),
	(533, '2022-06-15 13:19:22'),
	(534, '2022-06-15 13:19:22'),
	(535, '2022-06-15 13:19:22'),
	(536, '2022-06-15 13:19:22'),
	(537, '2022-06-15 13:19:22'),
	(538, '2022-06-15 13:19:23'),
	(539, '2022-06-15 13:19:23'),
	(540, '2022-06-15 13:19:23'),
	(541, '2022-06-15 13:19:23'),
	(542, '2022-06-15 13:19:23'),
	(543, '2022-06-15 13:19:23'),
	(544, '2022-06-15 13:19:23'),
	(545, '2022-06-15 13:19:23'),
	(546, '2022-06-15 13:19:23'),
	(547, '2022-06-15 13:19:23'),
	(548, '2022-06-15 13:19:23'),
	(549, '2022-06-15 13:19:23'),
	(550, '2022-06-15 13:19:23'),
	(551, '2022-06-15 13:19:23'),
	(552, '2022-06-15 13:19:23'),
	(553, '2022-06-15 13:19:23'),
	(554, '2022-06-15 13:19:23'),
	(555, '2022-06-15 13:19:23'),
	(556, '2022-06-15 13:19:23'),
	(557, '2022-06-15 13:19:24'),
	(558, '2022-06-15 13:19:24'),
	(559, '2022-06-15 13:19:24'),
	(560, '2022-06-15 13:19:24'),
	(561, '2022-06-15 13:19:24'),
	(562, '2022-06-15 13:19:24'),
	(563, '2022-06-15 13:19:24'),
	(564, '2022-06-15 13:19:24'),
	(565, '2022-06-15 13:19:24'),
	(566, '2022-06-15 13:19:24'),
	(567, '2022-06-15 13:19:24'),
	(568, '2022-06-15 13:19:24'),
	(569, '2022-06-15 13:19:24'),
	(570, '2022-06-15 13:19:24'),
	(571, '2022-06-15 13:19:24'),
	(572, '2022-06-15 13:19:24'),
	(573, '2022-06-15 13:19:24'),
	(574, '2022-06-15 13:19:24'),
	(575, '2022-06-15 13:19:24'),
	(576, '2022-06-15 13:19:24'),
	(577, '2022-06-15 13:19:24'),
	(578, '2022-06-15 13:19:24'),
	(579, '2022-06-15 13:19:25'),
	(580, '2022-06-15 13:19:25'),
	(581, '2022-06-15 13:19:25'),
	(582, '2022-06-15 13:19:25'),
	(583, '2022-06-15 13:19:25'),
	(584, '2022-06-15 13:19:25'),
	(585, '2022-06-15 13:19:25'),
	(586, '2022-06-15 13:19:25'),
	(587, '2022-06-15 13:19:25'),
	(588, '2022-06-15 13:19:25'),
	(589, '2022-06-15 13:19:25'),
	(590, '2022-06-15 13:19:25'),
	(591, '2022-06-15 13:19:25'),
	(592, '2022-06-15 13:19:25'),
	(593, '2022-06-15 13:19:25'),
	(594, '2022-06-15 13:19:25'),
	(595, '2022-06-15 13:19:25'),
	(596, '2022-06-15 13:19:25'),
	(597, '2022-06-15 13:19:25'),
	(598, '2022-06-15 13:19:25'),
	(599, '2022-06-15 13:19:26'),
	(600, '2022-06-15 13:19:26'),
	(601, '2022-06-15 13:19:26'),
	(602, '2022-06-15 13:19:26'),
	(603, '2022-06-15 13:19:26'),
	(604, '2022-06-15 13:19:26'),
	(605, '2022-06-15 13:19:26'),
	(606, '2022-06-15 13:19:26'),
	(607, '2022-06-15 13:19:26'),
	(608, '2022-06-15 13:19:26'),
	(609, '2022-06-15 13:19:26'),
	(610, '2022-06-15 13:19:26'),
	(611, '2022-06-15 13:19:26'),
	(612, '2022-06-15 13:19:26'),
	(613, '2022-06-15 13:19:26'),
	(614, '2022-06-15 13:19:26'),
	(615, '2022-06-15 13:19:26'),
	(616, '2022-06-15 13:19:26'),
	(617, '2022-06-15 13:19:26'),
	(618, '2022-06-15 13:19:26'),
	(619, '2022-06-15 13:19:26'),
	(620, '2022-06-15 13:19:27'),
	(621, '2022-06-15 13:19:27'),
	(622, '2022-06-15 13:19:27'),
	(623, '2022-06-15 13:19:27'),
	(624, '2022-06-15 13:19:27'),
	(625, '2022-06-15 13:19:27'),
	(626, '2022-06-15 13:19:27'),
	(627, '2022-06-15 13:19:27'),
	(628, '2022-06-15 13:19:27'),
	(629, '2022-06-15 13:19:27'),
	(630, '2022-06-15 13:19:27'),
	(631, '2022-06-15 13:19:27'),
	(632, '2022-06-15 13:19:27'),
	(633, '2022-06-15 13:19:27'),
	(634, '2022-06-15 13:19:27'),
	(635, '2022-06-15 13:19:27'),
	(636, '2022-06-15 13:19:27'),
	(637, '2022-06-15 13:19:27'),
	(638, '2022-06-15 13:19:27'),
	(639, '2022-06-15 13:19:27'),
	(640, '2022-06-15 13:19:27'),
	(641, '2022-06-15 13:19:27'),
	(642, '2022-06-15 13:19:27'),
	(643, '2022-06-15 13:19:28'),
	(644, '2022-06-15 13:19:28'),
	(645, '2022-06-15 13:19:28'),
	(646, '2022-06-15 13:19:28'),
	(647, '2022-06-15 13:19:28'),
	(648, '2022-06-15 13:19:28'),
	(649, '2022-06-15 13:19:28'),
	(650, '2022-06-15 13:19:28'),
	(651, '2022-06-15 13:19:28'),
	(652, '2022-06-15 13:19:28'),
	(653, '2022-06-15 13:19:28'),
	(654, '2022-06-15 13:19:28'),
	(655, '2022-06-15 13:19:28'),
	(656, '2022-06-15 13:19:28'),
	(657, '2022-06-15 13:19:28'),
	(658, '2022-06-15 13:19:28'),
	(659, '2022-06-15 13:19:28'),
	(660, '2022-06-15 13:19:28'),
	(661, '2022-06-15 13:19:28'),
	(662, '2022-06-15 13:19:28'),
	(663, '2022-06-15 13:19:28'),
	(664, '2022-06-15 13:19:28'),
	(665, '2022-06-15 13:19:29'),
	(666, '2022-06-15 13:19:29'),
	(667, '2022-06-15 13:19:29'),
	(668, '2022-06-15 13:19:29'),
	(669, '2022-06-15 13:19:29'),
	(670, '2022-06-15 13:19:29'),
	(671, '2022-06-15 13:19:29'),
	(672, '2022-06-15 13:19:29'),
	(673, '2022-06-15 13:19:29'),
	(674, '2022-06-15 13:19:29'),
	(675, '2022-06-15 13:19:29'),
	(676, '2022-06-15 13:19:29'),
	(677, '2022-06-15 13:19:29'),
	(678, '2022-06-15 13:19:29'),
	(679, '2022-06-15 13:19:29'),
	(680, '2022-06-15 13:19:29'),
	(681, '2022-06-15 13:19:29'),
	(682, '2022-06-15 13:19:29'),
	(683, '2022-06-15 13:19:29'),
	(684, '2022-06-15 13:19:29'),
	(685, '2022-06-15 13:19:29'),
	(686, '2022-06-15 13:19:29'),
	(687, '2022-06-15 13:19:30'),
	(688, '2022-06-15 13:19:30'),
	(689, '2022-06-15 13:19:30'),
	(690, '2022-06-15 13:19:30'),
	(691, '2022-06-15 13:19:30'),
	(692, '2022-06-15 13:19:30'),
	(693, '2022-06-15 13:19:30'),
	(694, '2022-06-15 13:19:30'),
	(695, '2022-06-15 13:19:30'),
	(696, '2022-06-15 13:19:30'),
	(697, '2022-06-15 13:19:30'),
	(698, '2022-06-15 13:19:30'),
	(699, '2022-06-15 13:19:30'),
	(700, '2022-06-15 13:19:30'),
	(701, '2022-06-15 13:19:30'),
	(702, '2022-06-15 13:19:30'),
	(703, '2022-06-15 13:19:30'),
	(704, '2022-06-15 13:19:30'),
	(705, '2022-06-15 13:19:30'),
	(706, '2022-06-15 13:19:30'),
	(707, '2022-06-15 13:19:30'),
	(708, '2022-06-15 13:19:30'),
	(709, '2022-06-15 13:19:30'),
	(710, '2022-06-15 13:19:31'),
	(711, '2022-06-15 13:19:31'),
	(712, '2022-06-15 13:19:31'),
	(713, '2022-06-15 13:19:31'),
	(714, '2022-06-15 13:19:31'),
	(715, '2022-06-15 13:19:31'),
	(716, '2022-06-15 13:19:31'),
	(717, '2022-06-15 13:19:31'),
	(718, '2022-06-15 13:19:31'),
	(719, '2022-06-15 13:19:31'),
	(720, '2022-06-15 13:19:31'),
	(721, '2022-06-15 13:19:31'),
	(722, '2022-06-15 13:19:31'),
	(723, '2022-06-15 13:19:31'),
	(724, '2022-06-15 13:19:31'),
	(725, '2022-06-15 13:19:31'),
	(726, '2022-06-15 13:19:31'),
	(727, '2022-06-15 13:19:31'),
	(728, '2022-06-15 13:19:31'),
	(729, '2022-06-15 13:19:31'),
	(730, '2022-06-15 13:19:32'),
	(731, '2022-06-15 13:19:32'),
	(732, '2022-06-15 13:19:32'),
	(733, '2022-06-15 13:19:32'),
	(734, '2022-06-15 13:19:32'),
	(735, '2022-06-15 13:19:32'),
	(736, '2022-06-15 13:19:32'),
	(737, '2022-06-15 13:19:32'),
	(738, '2022-06-15 13:19:32'),
	(739, '2022-06-15 13:19:32'),
	(740, '2022-06-15 13:19:32'),
	(741, '2022-06-15 13:19:32'),
	(742, '2022-06-15 13:19:32'),
	(743, '2022-06-15 13:20:22'),
	(744, '2022-06-15 13:20:43'),
	(745, '2022-06-15 13:21:28');
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
) ENGINE=InnoDB AUTO_INCREMENT=351 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

-- Dumping data for table fast-ecommerce.guest_cart_items: ~3 rows (approximately)
/*!40000 ALTER TABLE `guest_cart_items` DISABLE KEYS */;
INSERT INTO `guest_cart_items` (`cart_item_id`, `user_id`, `product_id`, `quantity`, `created`) VALUES
	(348, 744, 3, 3, '2022-06-15 14:29:27'),
	(349, 744, 4, 3, '2022-06-15 14:29:27'),
	(350, 744, 2, 3, '2022-06-15 14:29:27');
/*!40000 ALTER TABLE `guest_cart_items` ENABLE KEYS */;

-- Dumping structure for table fast-ecommerce.guest_trials
CREATE TABLE IF NOT EXISTS `guest_trials` (
  `guest_trial_id` int NOT NULL AUTO_INCREMENT,
  `guest_id` int NOT NULL,
  `for` varchar(50) NOT NULL,
  `ip` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `detail` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`guest_trial_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table fast-ecommerce.guest_trials: ~2 rows (approximately)
/*!40000 ALTER TABLE `guest_trials` DISABLE KEYS */;
INSERT INTO `guest_trials` (`guest_trial_id`, `guest_id`, `for`, `ip`, `detail`, `created`) VALUES
	(11, 745, 'login', '::ffff:192.168.10.4', '{"email":"sajid@fast.com","password":"12345678"}', '2022-06-15 13:21:44'),
	(12, 744, 'login', '::ffff:192.168.10.5', '{"email":"sajid@fast.com","password":"12345678"}', '2022-06-15 14:29:35');
/*!40000 ALTER TABLE `guest_trials` ENABLE KEYS */;

-- Dumping structure for table fast-ecommerce.messages
CREATE TABLE IF NOT EXISTS `messages` (
  `message_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `type` varchar(50) NOT NULL,
  `message` varchar(500) NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`message_id`),
  KEY `FK_messages_users` (`user_id`),
  CONSTRAINT `FK_messages_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table fast-ecommerce.messages: ~5 rows (approximately)
/*!40000 ALTER TABLE `messages` DISABLE KEYS */;
INSERT INTO `messages` (`message_id`, `user_id`, `type`, `message`, `created`) VALUES
	(3, 9, 'order', 'You Order No. 56 has been placed. You will (in-sha-Allah) receive it by Jun 20, 2022', '2022-06-15 14:29:56'),
	(4, 9, 'order', 'You Order No. 57 has been placed. You will (in-sha-Allah) receive it by Jun 20, 2022', '2022-06-15 16:23:02'),
	(5, 9, 'order', 'You Order No. 58 has been placed. You will (in-sha-Allah) receive it by Jun 20, 2022', '2022-06-15 16:26:02'),
	(6, 9, 'order', 'You Order No. 59 has been placed. You will (in-sha-Allah) receive it by Jun 20, 2022', '2022-06-15 16:28:44'),
	(7, 9, 'order', 'You Order No. 60 has been placed. You will (in-sha-Allah) receive it by Jun 20, 2022', '2022-06-15 16:46:14');
/*!40000 ALTER TABLE `messages` ENABLE KEYS */;

-- Dumping structure for table fast-ecommerce.orders
CREATE TABLE IF NOT EXISTS `orders` (
  `order_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `promo_id` int DEFAULT NULL,
  `name` varchar(500) DEFAULT NULL,
  `contact` varchar(500) DEFAULT NULL,
  `city` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `address` varchar(500) NOT NULL,
  `payment_method` enum('card','cod') NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`order_id`),
  KEY `FK_orders_users` (`user_id`),
  KEY `FK_orders_promos` (`promo_id`),
  CONSTRAINT `FK_orders_promos` FOREIGN KEY (`promo_id`) REFERENCES `promos` (`promo_id`),
  CONSTRAINT `FK_orders_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table fast-ecommerce.orders: ~5 rows (approximately)
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` (`order_id`, `user_id`, `promo_id`, `name`, `contact`, `city`, `address`, `payment_method`, `created`) VALUES
	(56, 9, NULL, 'Sajid', '03212503902', 'Lahore', 'Anarkali Disco Chali - Lahore', 'cod', '2022-06-15 14:29:56'),
	(57, 9, NULL, 'Sajid', '03212503902', 'Lahore', 'Anarkali Disco Chali - Lahore', 'cod', '2022-06-15 16:23:02'),
	(58, 9, NULL, 'Sajid', '03212503902', 'Lahore', 'Anarkali Disco Chali - Lahore', 'cod', '2022-06-15 16:26:02'),
	(59, 9, NULL, 'Sajid', '03212503902', 'Lahore', 'Anarkali Disco Chali - Lahore', 'cod', '2022-06-15 16:28:44'),
	(60, 9, NULL, 'Sajid', '03212503902', 'Lahore', 'Anarkali Disco Chali - Lahore', 'cod', '2022-06-15 16:46:14');
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
  CONSTRAINT `FK_order_details_products` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table fast-ecommerce.order_details: ~0 rows (approximately)
/*!40000 ALTER TABLE `order_details` DISABLE KEYS */;
INSERT INTO `order_details` (`order_detail_id`, `order_id`, `product_id`, `quantity`, `price`, `unit_cost`) VALUES
	(23, 56, 1, 3, 100.00, 80.00),
	(24, 56, 2, 3, 250.00, 240.00),
	(25, 56, 3, 4, 250.00, 205.00),
	(26, 56, 4, 2, 500.00, 150.00),
	(27, 56, 5, 1, 110.00, 100.00),
	(28, 57, 1, 2, 100.00, 80.00),
	(29, 57, 2, 3, 250.00, 240.00),
	(30, 57, 3, 2, 250.00, 205.00),
	(31, 57, 4, 3, 500.00, 150.00),
	(32, 58, 2, 4, 250.00, 240.00),
	(33, 59, 1, 5, 100.00, 80.00),
	(34, 60, 8, 2, 320.00, 310.00),
	(35, 60, 7, 2, 120.00, 60.00),
	(36, 60, 6, 4, 300.00, 280.00),
	(37, 60, 5, 4, 110.00, 100.00);
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
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table fast-ecommerce.order_statuses: ~0 rows (approximately)
/*!40000 ALTER TABLE `order_statuses` DISABLE KEYS */;
INSERT INTO `order_statuses` (`order_status_id`, `order_id`, `status`, `description`, `created`) VALUES
	(3, 56, 'ordered', NULL, '2022-06-15 14:29:56'),
	(4, 56, 'confirmed', NULL, '2022-06-15 15:39:51'),
	(5, 56, 'dispatched', NULL, '2022-06-15 16:13:00'),
	(6, 56, 'received', NULL, '2022-06-15 16:14:23'),
	(7, 57, 'ordered', NULL, '2022-06-15 16:23:02'),
	(8, 57, 'confirmed', NULL, '2022-06-15 16:24:40'),
	(9, 57, 'dispatched', NULL, '2022-06-15 16:25:19'),
	(10, 57, 'received', NULL, '2022-06-15 16:25:43'),
	(11, 58, 'ordered', NULL, '2022-06-15 16:26:02'),
	(12, 58, 'confirmed', NULL, '2022-06-15 16:26:17'),
	(13, 58, 'confirmed', NULL, '2022-06-15 16:26:30'),
	(14, 58, 'dispatched', NULL, '2022-06-15 16:27:21'),
	(15, 58, 'received', NULL, '2022-06-15 16:27:50'),
	(16, 59, 'ordered', NULL, '2022-06-15 16:28:44'),
	(17, 59, 'confirmed', NULL, '2022-06-15 16:29:00'),
	(18, 59, 'dispatched', NULL, '2022-06-15 16:29:31'),
	(19, 59, 'received', NULL, '2022-06-15 16:30:07'),
	(20, 60, 'ordered', NULL, '2022-06-15 16:46:14');
/*!40000 ALTER TABLE `order_statuses` ENABLE KEYS */;

-- Dumping structure for table fast-ecommerce.products
CREATE TABLE IF NOT EXISTS `products` (
  `product_id` int NOT NULL AUTO_INCREMENT,
  `category_id` int NOT NULL,
  `brand_id` int NOT NULL,
  `name` varchar(50) NOT NULL,
  `sku` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table fast-ecommerce.products: ~0 rows (approximately)
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` (`product_id`, `category_id`, `brand_id`, `name`, `sku`, `url_name`, `stock`, `unit_cost`, `price`, `fair_quantity`, `description`, `created`) VALUES
	(1, 6, 1, 'Nurpur Butter 50 Grams', NULL, 'nurpur-butter-50-grams', 605, 109, 250.00, 10, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Temporibus quasi praesentium sapiente nisi nobis debitis optio fugit rerum voluptates sed.', '2022-05-27 14:38:38'),
	(2, 6, 1, 'Nurpur Butter 200 Grams', NULL, 'nurpur-butter-200-grams', 10, 240, 250.00, 10, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Temporibus quasi praesentium sapiente nisi nobis debitis optio fugit rerum voluptates sed.', '2022-05-27 14:39:14'),
	(3, 6, 5, 'Blueband Margarine 250 Grams', NULL, 'blueband-margaring-250-grams', 50, 205, 250.00, 10, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Temporibus quasi praesentium sapiente nisi nobis debitis optio fugit rerum voluptates sed.', '2022-05-27 14:39:46'),
	(4, 6, 5, 'Blueband Margarine 500 Grams', NULL, 'blueband-margarine-500-grams', 60, 150, 500.00, 10, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Temporibus quasi praesentium sapiente nisi nobis debitis optio fugit rerum voluptates sed.', '2022-05-27 14:40:08'),
	(5, 7, 2, 'Olpers 250 ML', NULL, 'olpers-250-ml', 50, 100, 110.00, 10, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Temporibus quasi praesentium sapiente nisi nobis debitis optio fugit rerum voluptates sed.', '2022-05-27 14:43:28'),
	(6, 7, 2, 'Olpers 1 Litre', NULL, 'olpers-1-litre', 200, 280, 300.00, 10, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Temporibus quasi praesentium sapiente nisi nobis debitis optio fugit rerum voluptates sed.', '2022-05-27 14:44:15'),
	(7, 7, 8, 'Milkpak Milk 250 ML', NULL, 'milkpak-milk-250-ml', 50, 60, 120.00, 10, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Temporibus quasi praesentium sapiente nisi nobis debitis optio fugit rerum voluptates sed.', '2022-05-27 14:45:44'),
	(8, 7, 8, 'Milkpak Milk 1 Litre', NULL, 'milkpak-milk-1-litre', 10, 310, 320.00, 10, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Temporibus quasi praesentium sapiente nisi nobis debitis optio fugit rerum voluptates sed.', '2022-05-27 14:46:11'),
	(9, 8, 3, 'Milkpack Cream 200 ML', NULL, 'milkpak-cream-200-ml', 0, 170, 180.00, 10, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Temporibus quasi praesentium sapiente nisi nobis debitis optio fugit rerum voluptates sed.', '2022-05-27 14:48:02'),
	(10, 8, 2, 'Olpers Cream 200 ML', NULL, 'olpers-cream-200-ml', 165, 143, 200.00, 10, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Temporibus quasi praesentium sapiente nisi nobis debitis optio fugit rerum voluptates sed.', '2022-05-27 14:48:33'),
	(11, 9, 7, 'Adams Cheese Slices 10 Pieces', NULL, 'adams-cheese-slices-10-pieces', 20, 350, 400.00, 10, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Temporibus quasi praesentium sapiente nisi nobis debitis optio fugit rerum voluptates sed.', '2022-05-27 14:49:03'),
	(12, 9, 7, 'Adams Cheddar Cheese 250 Grams', NULL, 'adams-cheddar-cheese-250-grams', 10, 250, 300.00, 10, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Temporibus quasi praesentium sapiente nisi nobis debitis optio fugit rerum voluptates sed.', '2022-05-27 14:49:34'),
	(13, 9, 7, 'Adams Mozzarella Cheese 500 Grams', NULL, 'adams-mozzarella-cheese-500-grams', 30, 405, 455.00, 10, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Temporibus quasi praesentium sapiente nisi nobis debitis optio fugit rerum voluptates sed.', '2022-05-27 14:50:08'),
	(14, 9, 6, 'Amul Cheese Slices 15 Pieces', NULL, 'amul-cheese-slices-15-pieces', 40, 350, 506.00, 10, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Temporibus quasi praesentium sapiente nisi nobis debitis optio fugit rerum voluptates sed.', '2022-05-27 14:51:31'),
	(16, 11, 8, 'Nestle Yogurt 500 Grams', NULL, 'nestle-yogurt-500-grams', 50, 240, 245.00, 10, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Temporibus quasi praesentium sapiente nisi nobis debitis optio fugit rerum voluptates sed.', '2022-05-27 14:52:37'),
	(17, 11, 8, 'Nestle Yogurt 125 Grams', NULL, 'nestle-yogurt-125-grams', 0, 50, 100.00, 10, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Temporibus quasi praesentium sapiente nisi nobis debitis optio fugit rerum voluptates sed.', '2022-05-27 14:52:56'),
	(18, 12, 11, 'Nido Powder 500 Grams', NULL, 'nido-powder-500-grams', 5000, 1235, 1500.00, 10, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Temporibus quasi praesentium sapiente nisi nobis debitis optio fugit rerum voluptates sed.', '2022-05-27 14:55:04'),
	(20, 10, 12, 'Eggs 1 Dozen', NULL, 'eggs-1-dozen', 1000, 160, 180.00, 10, 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Temporibus quasi praesentium sapiente nisi nobis debitis optio fugit rerum voluptates sed.', '2022-05-27 14:56:48'),
	(21, 14, 9, 'Nestle Lorem', '23234', 'nestle-lorem', 240, 240, 120.00, 100, '', '2022-06-13 16:06:24'),
	(22, 14, 4, 'Good Milk 200 ML', '65464', 'good-milk-200-ml', 200, 120, 165.00, 10, '', '2022-06-13 16:14:29'),
	(23, 4, 5, 'Blueband 200 g', '684654', 'blueband-200-g', 252, 120, 165.00, 10, '', '2022-06-13 16:15:35'),
	(24, 6, 5, 'Blueband Margaring 250g', '65484', 'blueband-margaring-250-g', 100, 130, 180.00, 10, '', '2022-06-13 22:35:38'),
	(25, 14, 8, 'Nestle Pakola Soda Drink 250 ML', '654654', 'nestle-pakola-soda-drink-250-ml', 100, 150, 206.00, 10, 'Lorem ipsul dolor sit comet', '2022-06-14 00:03:43'),
	(26, 15, 8, 'Aquafina 500 ML', '654789', 'aquafina-500-ml', 100, 40, 55.00, 10, '', '2022-06-14 09:17:09'),
	(27, 14, 9, 'Slice 200 ML', '684684', 'slice-200-ml', 300, 46, 65.00, 10, '', '2022-06-14 15:17:21');
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
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table fast-ecommerce.promos: ~0 rows (approximately)
/*!40000 ALTER TABLE `promos` DISABLE KEYS */;
INSERT INTO `promos` (`promo_id`, `user_id`, `code`, `validity`, `percentage`, `max_discount`, `status`, `created`) VALUES
	(18, 9, '05YZH', '2022-07-15 14:29:56', 10, 100.00, 'available', '2022-06-15 14:29:56');
/*!40000 ALTER TABLE `promos` ENABLE KEYS */;

-- Dumping structure for table fast-ecommerce.stocks
CREATE TABLE IF NOT EXISTS `stocks` (
  `stock_id` int NOT NULL AUTO_INCREMENT,
  `product_id` int NOT NULL,
  `quantity` int NOT NULL,
  `unit_cost` decimal(20,2) NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`stock_id`),
  KEY `FK_stocks_products` (`product_id`),
  CONSTRAINT `FK_stocks_products` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table fast-ecommerce.stocks: ~0 rows (approximately)
/*!40000 ALTER TABLE `stocks` DISABLE KEYS */;
INSERT INTO `stocks` (`stock_id`, `product_id`, `quantity`, `unit_cost`, `created`) VALUES
	(1, 1, 100, 250.00, '2022-06-15 23:17:56');
/*!40000 ALTER TABLE `stocks` ENABLE KEYS */;

-- Dumping structure for table fast-ecommerce.trials
CREATE TABLE IF NOT EXISTS `trials` (
  `trial_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `for` varchar(50) NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`trial_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table fast-ecommerce.trials: ~0 rows (approximately)
/*!40000 ALTER TABLE `trials` DISABLE KEYS */;
/*!40000 ALTER TABLE `trials` ENABLE KEYS */;

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
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table fast-ecommerce.users: ~0 rows (approximately)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`user_id`, `name`, `email`, `password`, `applied_promo_id`, `last_messages_read`, `last_orders_read`, `last_promos_read`, `last_wallets_read`, `created`) VALUES
	(9, 'Sajid', 'sajid@fast.com', '$2a$11$Jxvj93ZgzOlbATBcM02fFOM7jjBV3/D4EFHXj3bpHADdThAxp1oIC', NULL, '2022-06-05 19:42:39', '2022-06-15 16:27:35', '2022-06-02 17:02:35', '2022-06-02 22:26:32', '2022-05-31 10:31:42');
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
  UNIQUE KEY `user_id_product_id` (`user_id`,`product_id`),
  KEY `FK_wishlists_users` (`user_id`),
  KEY `FK_wishlists_products` (`product_id`),
  CONSTRAINT `FK_wishlists_products` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`),
  CONSTRAINT `FK_wishlists_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=94 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table fast-ecommerce.wishlists: ~0 rows (approximately)
/*!40000 ALTER TABLE `wishlists` DISABLE KEYS */;
/*!40000 ALTER TABLE `wishlists` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
