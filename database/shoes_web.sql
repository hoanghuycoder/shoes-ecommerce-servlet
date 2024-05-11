-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 28, 2024 at 06:12 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `shoes_web`
--

-- --------------------------------------------------------

--
-- Table structure for table `addresses`
--

CREATE TABLE `addresses` (
  `id` bigint(20) NOT NULL,
  `fullName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `phoneNumber` int(11) DEFAULT NULL,
  `province` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `district` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `commune` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `hamlet` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `createAt` timestamp NULL DEFAULT current_timestamp(),
  `updateAt` timestamp NULL DEFAULT current_timestamp(),
  `isDeleted` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `addresses`
--

INSERT INTO `addresses` (`id`, `fullName`, `phoneNumber`, `province`, `district`, `commune`, `hamlet`, `createAt`, `updateAt`, `isDeleted`) VALUES
(3, 'Trần V&otilde; Ho&agrave;ng Huy', 702315160, 'An Giang', 'An Ph&uacute;', 'An Ph&uacute;', 'Khu E Nhà Máy Gạch Tunel 2 An Phú', '2024-01-19 09:16:21', '2024-01-19 09:16:21', 0),
(4, 'Trần V&otilde; Ho&agrave;ng Huy', 727381934, 'An Giang', 'An Ph&uacute;', 'Kh&aacute;nh An', 'Ngã 3 cây thông ấp Khánh Hòa', '2024-01-19 09:20:09', '2024-01-19 09:20:09', 0),
(5, 'NGUYEN VAN A', 702315166, 'Hồ Ch&iacute; Minh', 'Thủ Đức', 'Linh Trung', 'ưerty bệnh viện thú y đại học nông lâm', '2024-04-03 20:27:24', '2024-04-03 20:27:24', 0),
(6, 'NGUYEN VAN A', 702315166, 'Hồ Ch&iacute; Minh', '1', 'Bến Ngh&eacute;', 'aádfasdf Khác', '2024-04-03 20:29:03', '2024-04-03 20:29:03', 0),
(7, 'NGUYEN VAN A', 702315166, 'Hồ Ch&iacute; Minh', '10', '10', 'aádfasdf Khác', '2024-04-03 20:31:48', '2024-04-03 20:31:48', 0),
(8, 'NGUYEN VAN A', 702315166, 'Hồ Ch&iacute; Minh', '1', 'Bến Th&agrave;nh', 'aádfasdf Khác', '2024-04-03 20:33:45', '2024-04-03 20:33:45', 0),
(9, 'NGUYEN VAN A', 702315166, 'An Giang', 'Ch&acirc;u Ph&uacute;', 'B&igrave;nh Mỹ', 'aádfasdf ấp Bình Hưng 2', '2024-04-03 20:55:00', '2024-04-03 20:55:00', 0),
(10, 'NGUYEN VAN A', 702315166, 'An Giang', 'An Ph&uacute;', 'Kh&aacute;nh An', 'aádfasdf ấp Khánh Hòa', '2024-04-04 17:18:28', '2024-04-04 17:18:28', 0);

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

CREATE TABLE `carts` (
  `id` bigint(20) NOT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `orderDetailsId` bigint(20) DEFAULT NULL,
  `createAt` timestamp NULL DEFAULT current_timestamp(),
  `updateAt` timestamp NULL DEFAULT current_timestamp(),
  `isDeleted` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `carts`
--

INSERT INTO `carts` (`id`, `userId`, `orderDetailsId`, `createAt`, `updateAt`, `isDeleted`) VALUES
(19, 16, 37, '2024-04-07 05:15:32', '2024-04-07 05:15:32', 0);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `code` varchar(50) DEFAULT NULL,
  `createAt` timestamp NULL DEFAULT current_timestamp(),
  `updateAt` timestamp NULL DEFAULT current_timestamp(),
  `isDeleted` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `code`, `createAt`, `updateAt`, `isDeleted`) VALUES
(1, 'Gi&agrave;y thường ng&agrave;y', 'thuong-ngay', '2024-01-01 13:24:34', '2024-04-19 02:10:36', 0),
(2, 'Giày bóng rổ', 'bong-ro', '2024-01-01 13:24:34', '2024-01-01 13:24:34', 0),
(3, 'Giày Bóng đá', 'bong-da', '2024-01-01 13:24:34', '2024-01-01 13:24:34', 0),
(4, 'Giày Bóng chày', 'bong-chay', '2024-01-01 13:24:34', '2024-01-01 13:24:34', 0),
(5, 'Giày Bóng chuyền', 'bong-chuyen', '2024-01-01 13:24:34', '2024-01-01 13:24:34', 0),
(6, 'Giày Golf', 'golf', '2024-01-01 13:24:34', '2024-01-01 13:24:34', 0),
(7, 'Giày Chạy bộ', 'chay-bo', '2024-01-01 13:24:34', '2024-04-19 02:19:31', 0);

-- --------------------------------------------------------

--
-- Table structure for table `import_orders`
--

CREATE TABLE `import_orders` (
  `id` varchar(50) NOT NULL,
  `supplier` varchar(50) NOT NULL,
  `createAt` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `isDeleted` tinyint(4) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `import_orders`
--

INSERT INTO `import_orders` (`id`, `supplier`, `createAt`, `isDeleted`) VALUES
('1', 'Supplier XYZ', '2024-04-20 03:40:06', 0),
('2', 'ZX', '2024-04-20 03:40:06', 0);

-- --------------------------------------------------------

--
-- Table structure for table `import_order_details`
--

CREATE TABLE `import_order_details` (
  `id` bigint(20) NOT NULL,
  `importOrderId` varchar(50) DEFAULT NULL,
  `productSizeId` bigint(20) DEFAULT NULL,
  `quantityImport` int(11) DEFAULT NULL,
  `priceImport` double(15,1) DEFAULT NULL,
  `isDeleted` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `import_order_details`
--

INSERT INTO `import_order_details` (`id`, `importOrderId`, `productSizeId`, `quantityImport`, `priceImport`, `isDeleted`) VALUES
(2, '1', 1, 10, 918000.0, 0),
(3, '1', 2, 10, 927000.0, 0),
(4, '1', 3, 10, 936000.0, 0),
(5, '1', 4, 10, 945000.0, 0),
(6, '1', 5, 10, 1044000.0, 0),
(7, '1', 6, 10, 1053000.0, 0),
(8, '1', 7, 10, 1062000.0, 0),
(9, '1', 8, 10, 1071000.0, 0),
(10, '1', 9, 10, 1080000.0, 0),
(11, '1', 10, 10, 1089000.0, 0),
(12, '1', 11, 10, 791000.0, 0),
(13, '1', 12, 10, 800000.0, 0),
(14, '1', 13, 10, 809000.0, 0),
(15, '1', 14, 10, 818000.0, 0),
(16, '1', 15, 10, 827000.0, 0),
(17, '1', 16, 10, 1492000.0, 0),
(18, '1', 17, 10, 1501000.0, 0),
(19, '1', 18, 10, 1510000.0, 0),
(20, '1', 19, 10, 1519000.0, 0),
(21, '1', 20, 10, 1528000.0, 0),
(22, '1', 21, 10, 1854000.0, 0),
(23, '1', 22, 10, 1863000.0, 0),
(24, '1', 23, 10, 1872000.0, 0),
(25, '1', 25, 10, 576000.0, 0),
(26, '1', 26, 10, 581000.0, 0),
(27, '1', 27, 10, 585000.0, 0),
(28, '1', 28, 10, 594000.0, 0),
(29, '1', 29, 10, 819000.0, 0),
(30, '1', 30, 10, 828000.0, 0),
(31, '1', 31, 10, 837000.0, 0),
(32, '1', 32, 10, 846000.0, 0),
(33, '1', 33, 10, 855000.0, 0),
(34, '1', 34, 10, 864000.0, 0),
(35, '1', 35, 10, 666000.0, 0),
(36, '1', 36, 10, 675000.0, 0),
(37, '1', 37, 10, 684000.0, 0),
(38, '1', 38, 10, 693000.0, 0),
(39, '1', 39, 10, 1440000.0, 0),
(40, '1', 40, 10, 1445000.0, 0),
(41, '1', 41, 10, 1449000.0, 0),
(42, '1', 42, 10, 1458000.0, 0),
(43, '1', 43, 10, 1467000.0, 0),
(44, '1', 44, 10, 1476000.0, 0),
(45, '1', 45, 10, 1224000.0, 0),
(46, '1', 46, 10, 1233000.0, 0),
(47, '1', 47, 10, 1242000.0, 0),
(48, '1', 48, 10, 1251000.0, 0),
(49, '1', 49, 10, 1404000.0, 0),
(50, '1', 50, 10, 1413000.0, 0),
(51, '1', 51, 10, 1422000.0, 0),
(52, '1', 52, 10, 1431000.0, 0),
(53, '1', 53, 10, 1944000.0, 0),
(54, '1', 54, 10, 1953000.0, 0),
(55, '1', 55, 10, 1962000.0, 0),
(56, '1', 56, 10, 1971000.0, 0),
(57, '2', 1, 1, 1000000.0, 0),
(58, '2', 2, 2, 1000000.0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `logs`
--

CREATE TABLE `logs` (
  `id` bigint(20) NOT NULL,
  `ip` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `level` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `action` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `resource` char(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `preValue` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `value` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `createAt` timestamp NULL DEFAULT current_timestamp(),
  `updateAt` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `isDeleted` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `logs`
--

INSERT INTO `logs` (`id`, `ip`, `location`, `level`, `action`, `resource`, `preValue`, `value`, `createAt`, `updateAt`, `isDeleted`) VALUES
(466, '14.187.164.148', 'Ho Chi Minh City,<br/>Viet Nam', 'INFO', 'SELECT', 'com.ltweb_servlet_ecommerce.controller.web.shared.HomeController:72', NULL, '{\"status\":\"Access the path http://localhost:8080/home\"}', '2024-04-18 06:08:01', '2024-04-18 08:36:05', 0),
(467, '185.60.112.157', 'Amsterdam,<br/>Netherlands (Kingdom of the)', 'INFO', 'SELECT', 'com.ltweb_servlet_ecommerce.controller.web.shared.HomeController:72', NULL, '{\"status\":\"Access the path http://localhost:8080/home\"}', '2024-04-18 06:08:02', '2024-04-18 08:36:00', 0),
(468, '52.229.124.72', 'Quebec,<br/>Canada', 'INFO', 'SELECT', 'com.ltweb_servlet_ecommerce.controller.web.shared.HomeController:72', NULL, '{\"status\":\"Access the path http://localhost:8080/home\"}', '2024-04-18 06:08:04', '2024-04-18 08:36:25', 0),
(469, '5.6.7.8', 'Dusseldorf,<br/>Germany', 'INFO', 'SELECT', 'com.ltweb_servlet_ecommerce.controller.web.shared.HomeController:72', NULL, '{\"status\":\"Access the path http://localhost:8080/home\"}', '2024-04-18 06:08:20', '2024-04-18 08:35:03', 0),
(470, '5.6.7.8', 'Dusseldorf,<br/>Germany', 'INFO', 'SELECT', 'com.ltweb_servlet_ecommerce.controller.web.shared.HomeController:72', NULL, '{\"status\":\"Access the path http://localhost:8080/home\"}', '2024-04-18 06:08:28', '2024-04-18 08:35:03', 0),
(471, '8.8.4.4', 'Mountain View,<br/>United States of America', 'INFO', 'SELECT', 'com.ltweb_servlet_ecommerce.controller.web.shared.HomeController:74', NULL, '{\"status\":\"Access the path http://localhost:8080/home\"}', '2024-04-18 06:15:42', '2024-04-18 08:35:02', 0),
(472, '133.242.131.176', 'Tokyo,<br/>Japan', 'DANGER', 'SELECT', 'com.ltweb_servlet_ecommerce.log.LoggerHelper:23', NULL, '{\"value\":{\"error_message\":\"You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near \') and updateAt < (\'2024-04-13 20:29:48\',0)\' at line 1\"},\"status\":\"A serious error occurred!\"}', '2024-04-18 06:29:48', '2024-04-18 08:35:14', 0),
(473, '203.122.58.18', 'Gurgaon,<br/>India', 'INFO', 'SELECT', 'com.ltweb_servlet_ecommerce.controller.web.shared.HomeController:46', NULL, '{\"status\":\"Access the path http://localhost:8080/home\"}', '2024-04-18 06:29:49', '2024-04-18 08:34:18', 0),
(474, '202.96.134.133', 'Shenzhen,<br/>China', 'INFO', 'SELECT', 'com.ltweb_servlet_ecommerce.controller.web.shared.HomeController:46', NULL, '{\"status\":\"Access the path http://localhost:8080/home\"}', '2024-04-18 06:29:49', '2024-04-18 08:35:34', 0),
(475, '210.89.164.90', 'Seongnam,<br/>Korea (the Republic of)', 'INFO', 'SELECT', 'com.ltweb_servlet_ecommerce.controller.web.shared.HomeController:46', NULL, '{\"status\":\"Access the path http://localhost:8080/home\"}', '2024-04-18 06:29:49', '2024-04-18 08:35:40', 0),
(541, '185.60.112.157', 'Amsterdam,<br/>Netherlands (Kingdom of the)', 'INFO', 'SELECT', 'com.ltweb_servlet_ecommerce.controller.web.shared.HomeController:53', NULL, '{\"status\":\"Access the path http://localhost:8080/home\"}', '2024-04-18 09:18:45', '2024-04-18 09:19:43', 0),
(542, '185.60.112.157', 'Amsterdam,<br/>Netherlands (Kingdom of the)', 'INFO', 'SELECT', 'com.ltweb_servlet_ecommerce.controller.web.shared.HomeController:53', NULL, '{\"status\":\"Access the path http://localhost:8080/home\"}', '2024-04-18 09:22:00', '2024-04-18 09:22:13', 0),
(543, '203.122.58.18', 'Gurgaon,<br/>India', 'INFO', 'SELECT', 'com.ltweb_servlet_ecommerce.controller.web.shared.HomeController:53', NULL, '{\"status\":\"Access the path http://localhost:8080/home\"}', '2024-04-18 09:25:05', '2024-04-18 09:26:03', 0),
(544, '203.122.58.18', 'Gurgaon,<br/>India', 'INFO', 'SELECT', 'com.ltweb_servlet_ecommerce.controller.web.shared.HomeController:53', NULL, '{\"status\":\"Access the path http://localhost:8080/home\"}', '2024-04-18 09:25:06', '2024-04-18 09:26:03', 0),
(545, '203.122.58.18', 'Gurgaon,<br/>India', 'INFO', 'SELECT', 'com.ltweb_servlet_ecommerce.controller.web.shared.HomeController:53', NULL, '{\"status\":\"Access the path http://localhost:8080/home\"}', '2024-04-18 09:25:06', '2024-04-18 09:26:03', 0),
(546, '203.122.58.18', 'Gurgaon,<br/>India', 'INFO', 'SELECT', 'com.ltweb_servlet_ecommerce.controller.web.shared.CartController:70', NULL, '{\"status\":\"Access the path http://localhost:8080/cart\"}', '2024-04-18 09:26:10', '2024-04-18 09:26:10', 0),
(547, '203.122.58.18', 'Gurgaon,<br/>India', 'WARN', 'UPDATE', 'com.ltweb_servlet_ecommerce.service.impl.UserService:94', '{\"value\":{\"lastLogged\":\"2024-04-18 23:13:38.0\"}}', '{\"value\":{\"lastLogged\":\"2024-04-18 23:26:26.0\"},\"status\":\"UpdatedAt and lastLogged fields successfully updated\"}', '2024-04-18 09:26:26', '2024-04-18 09:26:26', 0),
(548, '203.122.58.18', 'Gurgaon,<br/>India', 'INFO', 'SELECT', 'com.ltweb_servlet_ecommerce.controller.web.shared.LoginController:67', NULL, '{\"value\":{\"id\":14,\"email\":\"vophihoang252003@gmail.com\"},\"status\":\"Authentication successful\"}', '2024-04-18 09:26:26', '2024-04-18 09:26:28', 0),
(578, '8.8.4.4', NULL, NULL, NULL, 'com.ltweb_servlet_ecommerce.service.impl.UserService:94', NULL, NULL, '2024-04-20 01:56:37', '2024-04-20 01:56:37', NULL),
(579, '8.8.4.4', NULL, NULL, NULL, 'com.ltweb_servlet_ecommerce.service.impl.UserService:94', NULL, NULL, '2024-04-20 01:56:37', '2024-04-20 01:56:37', NULL),
(580, '8.8.4.4', NULL, NULL, NULL, 'com.ltweb_servlet_ecommerce.service.impl.UserService:94', NULL, NULL, '2024-04-20 01:56:37', '2024-04-20 01:56:37', NULL),
(581, '5.6.7.8', NULL, NULL, NULL, 'com.ltweb_servlet_ecommerce.controller.web.shared.LoginController:67', NULL, NULL, '2024-04-20 01:56:39', '2024-04-20 01:56:54', NULL),
(582, '5.6.7.8', NULL, NULL, NULL, 'com.ltweb_servlet_ecommerce.controller.web.shared.LoginController:67', NULL, NULL, '2024-04-20 01:56:37', '2024-04-20 01:56:37', NULL),
(583, '5.6.7.8', NULL, NULL, NULL, 'com.ltweb_servlet_ecommerce.controller.web.shared.LoginController:67', NULL, NULL, '2024-04-20 01:56:37', '2024-04-20 01:56:37', NULL),
(599, '127.0.0.1', 'null , <br/>null', 'INFO', 'SELECT', 'com.ltweb_servlet_ecommerce.controller.web.shared.HomeController:43', NULL, '{\"status\":\"Access the path http://localhost:8080/home\"}', '2024-04-19 19:39:00', '2024-04-19 19:39:05', 0),
(600, '127.0.0.1', 'null , <br/>null', 'INFO', 'SELECT', 'com.ltweb_servlet_ecommerce.controller.web.shared.HomeController:43', NULL, '{\"status\":\"Access the path http://localhost:8080/home\"}', '2024-04-19 19:39:01', '2024-04-19 19:39:05', 0),
(601, '0:0:0:0:0:0:0:1', 'null , <br/>null', 'INFO', 'SELECT', 'com.ltweb_servlet_ecommerce.controller.web.shared.HomeController:43', NULL, '{\"status\":\"Access the path http://localhost:8080/home\"}', '2024-04-19 19:39:03', '2024-04-19 19:39:06', 0),
(602, '0:0:0:0:0:0:0:1', 'null , <br/>null', 'INFO', 'SELECT', 'com.ltweb_servlet_ecommerce.controller.web.shared.HomeController:43', NULL, '{\"status\":\"Access the path http://localhost:8080/home\"}', '2024-04-19 19:39:27', '2024-04-19 19:39:27', 0),
(603, '0:0:0:0:0:0:0:1', 'null , <br/>null', 'INFO', 'SELECT', 'com.ltweb_servlet_ecommerce.controller.web.shared.HomeController:43', NULL, '{\"status\":\"Access the path http://localhost:8080/home\"}', '2024-04-19 19:39:28', '2024-04-19 19:39:30', 0),
(604, '0:0:0:0:0:0:0:1', 'null , <br/>null', 'INFO', 'SELECT', 'com.ltweb_servlet_ecommerce.controller.web.shared.HomeController:43', NULL, '{\"status\":\"Access the path http://localhost:8080/home\"}', '2024-04-19 19:39:37', '2024-04-19 19:39:37', 0),
(605, '0:0:0:0:0:0:0:1', 'null , <br/>null', 'INFO', 'SELECT', 'com.ltweb_servlet_ecommerce.controller.web.shared.HomeController:43', NULL, '{\"status\":\"Access the path http://localhost:8080/home\"}', '2024-04-19 19:39:37', '2024-04-19 19:39:40', 0),
(606, '0:0:0:0:0:0:0:1', 'null , <br/>null', 'INFO', 'SELECT', 'com.ltweb_servlet_ecommerce.controller.web.shared.HomeController:43', NULL, '{\"status\":\"Access the path http://localhost:8080/home\"}', '2024-04-19 19:39:37', '2024-04-19 19:39:40', 0),
(607, '0:0:0:0:0:0:0:1', 'null , <br/>null', 'INFO', 'SELECT', 'com.ltweb_servlet_ecommerce.controller.web.shared.HomeController:43', NULL, '{\"status\":\"Access the path http://localhost:8080/home\"}', '2024-04-19 19:39:38', '2024-04-19 19:39:40', 0),
(608, '0:0:0:0:0:0:0:1', 'null , <br/>null', 'INFO', 'SELECT', 'com.ltweb_servlet_ecommerce.controller.web.shared.HomeController:43', NULL, '{\"status\":\"Access the path http://localhost:8080/home\"}', '2024-04-19 19:39:38', '2024-04-19 19:39:40', 0),
(609, '0:0:0:0:0:0:0:1', 'null , <br/>null', 'INFO', 'SELECT', 'com.ltweb_servlet_ecommerce.controller.web.shared.HomeController:43', NULL, '{\"status\":\"Access the path http://localhost:8080/home\"}', '2024-04-19 19:39:38', '2024-04-19 19:39:40', 0),
(610, '0:0:0:0:0:0:0:1', 'null , <br/>null', 'INFO', 'SELECT', 'com.ltweb_servlet_ecommerce.controller.web.shared.HomeController:43', NULL, '{\"status\":\"Access the path http://localhost:8080/home\"}', '2024-04-19 19:39:38', '2024-04-19 19:39:40', 0),
(611, '127.0.0.1', 'null , <br/>null', 'INFO', 'SELECT', 'com.ltweb_servlet_ecommerce.controller.web.shared.HomeController:43', NULL, '{\"status\":\"Access the path http://localhost:8080/home\"}', '2024-04-19 19:42:24', '2024-04-19 19:42:27', 0),
(612, '127.0.0.1', 'null , <br/>null', 'INFO', 'SELECT', 'com.ltweb_servlet_ecommerce.controller.web.shared.HomeController:43', NULL, '{\"status\":\"Access the path http://localhost:8080/home\"}', '2024-04-19 19:42:25', '2024-04-19 19:42:27', 0),
(613, '0:0:0:0:0:0:0:1', 'null , <br/>null', 'INFO', 'SELECT', 'com.ltweb_servlet_ecommerce.controller.web.shared.HomeController:43', NULL, '{\"status\":\"Access the path http://localhost:8080/home\"}', '2024-04-19 19:42:25', '2024-04-19 19:42:27', 0),
(614, '0:0:0:0:0:0:0:1', 'null , <br/>null', 'INFO', 'SELECT', 'com.ltweb_servlet_ecommerce.controller.web.shared.HomeController:43', NULL, '{\"status\":\"Access the path http://localhost:8080/home\"}', '2024-04-19 19:42:27', '2024-04-19 19:42:27', 0),
(615, '0:0:0:0:0:0:0:1', 'null , <br/>null', 'INFO', 'SELECT', 'com.ltweb_servlet_ecommerce.controller.web.shared.HomeController:43', NULL, '{\"status\":\"Access the path http://localhost:8080/home\"}', '2024-04-19 19:42:27', '2024-04-19 19:42:30', 0),
(616, '0:0:0:0:0:0:0:1', 'null , <br/>null', 'INFO', 'SELECT', 'com.ltweb_servlet_ecommerce.controller.web.shared.HomeController:43', NULL, '{\"status\":\"Access the path http://localhost:8080/home\"}', '2024-04-19 19:42:28', '2024-04-19 19:42:30', 0),
(617, '0:0:0:0:0:0:0:1', 'null , <br/>null', 'INFO', 'SELECT', 'com.ltweb_servlet_ecommerce.controller.web.shared.HomeController:43', NULL, '{\"status\":\"Access the path http://localhost:8080/home\"}', '2024-04-19 19:42:28', '2024-04-19 19:42:30', 0),
(618, '0:0:0:0:0:0:0:1', 'null , <br/>null', 'INFO', 'SELECT', 'com.ltweb_servlet_ecommerce.controller.web.shared.HomeController:43', NULL, '{\"status\":\"Access the path http://localhost:8080/home\"}', '2024-04-19 19:42:28', '2024-04-19 19:42:30', 0),
(619, '0:0:0:0:0:0:0:1', 'null , <br/>null', 'INFO', 'SELECT', 'com.ltweb_servlet_ecommerce.controller.web.shared.HomeController:43', NULL, '{\"status\":\"Access the path http://localhost:8080/home\"}', '2024-04-19 19:42:29', '2024-04-19 19:42:30', 0),
(620, '0:0:0:0:0:0:0:1', 'null , <br/>null', 'INFO', 'SELECT', 'com.ltweb_servlet_ecommerce.controller.web.shared.HomeController:43', NULL, '{\"status\":\"Access the path http://localhost:8080/home\"}', '2024-04-19 19:42:29', '2024-04-19 19:42:30', 0),
(621, '127.0.0.1', 'null , <br/>null', 'INFO', 'SELECT', 'com.ltweb_servlet_ecommerce.controller.web.shared.HomeController:43', NULL, '{\"status\":\"Access the path http://localhost:8080/home\"}', '2024-04-19 19:44:02', '2024-04-19 19:44:05', 0),
(622, '127.0.0.1', 'null , <br/>null', 'INFO', 'SELECT', 'com.ltweb_servlet_ecommerce.controller.web.shared.HomeController:43', NULL, '{\"status\":\"Access the path http://localhost:8080/home\"}', '2024-04-19 19:44:03', '2024-04-19 19:44:05', 0),
(623, '0:0:0:0:0:0:0:1', 'null , <br/>null', 'INFO', 'SELECT', 'com.ltweb_servlet_ecommerce.controller.web.shared.HomeController:43', NULL, '{\"status\":\"Access the path http://localhost:8080/home\"}', '2024-04-19 19:44:03', '2024-04-19 19:44:05', 0),
(624, '0:0:0:0:0:0:0:1', 'null , <br/>null', 'INFO', 'SELECT', 'com.ltweb_servlet_ecommerce.controller.web.shared.HomeController:43', NULL, '{\"status\":\"Access the path http://localhost:8080/home\"}', '2024-04-19 19:44:05', '2024-04-19 19:44:07', 0),
(625, '0:0:0:0:0:0:0:1', 'null , <br/>null', 'INFO', 'SELECT', 'com.ltweb_servlet_ecommerce.controller.web.shared.HomeController:43', NULL, '{\"status\":\"Access the path http://localhost:8080/home\"}', '2024-04-19 19:44:05', '2024-04-19 19:44:07', 0),
(626, '0:0:0:0:0:0:0:1', 'null , <br/>null', 'INFO', 'SELECT', 'com.ltweb_servlet_ecommerce.controller.web.shared.HomeController:43', NULL, '{\"status\":\"Access the path http://localhost:8080/home\"}', '2024-04-19 19:44:05', '2024-04-19 19:44:07', 0),
(627, '0:0:0:0:0:0:0:1', 'null , <br/>null', 'INFO', 'SELECT', 'com.ltweb_servlet_ecommerce.controller.web.shared.HomeController:43', NULL, '{\"status\":\"Access the path http://localhost:8080/home\"}', '2024-04-19 19:44:06', '2024-04-19 19:44:07', 0),
(628, '0:0:0:0:0:0:0:1', 'null , <br/>null', 'INFO', 'SELECT', 'com.ltweb_servlet_ecommerce.controller.web.shared.HomeController:43', NULL, '{\"status\":\"Access the path http://localhost:8080/home\"}', '2024-04-19 19:44:06', '2024-04-19 19:44:07', 0),
(629, '127.0.0.1', 'null , <br/>null', 'INFO', 'SELECT', 'com.ltweb_servlet_ecommerce.controller.web.shared.HomeController:43', NULL, '{\"status\":\"Access the path http://localhost:8080/home\"}', '2024-04-19 19:47:26', '2024-04-19 19:47:29', 0),
(630, '127.0.0.1', 'null , <br/>null', 'INFO', 'SELECT', 'com.ltweb_servlet_ecommerce.controller.web.shared.HomeController:43', NULL, '{\"status\":\"Access the path http://localhost:8080/home\"}', '2024-04-19 19:47:27', '2024-04-19 19:47:30', 0),
(631, '0:0:0:0:0:0:0:1', 'null , <br/>null', 'INFO', 'SELECT', 'com.ltweb_servlet_ecommerce.controller.web.shared.HomeController:43', NULL, '{\"status\":\"Access the path http://localhost:8080/home\"}', '2024-04-19 19:47:27', '2024-04-19 19:47:30', 0),
(632, '0:0:0:0:0:0:0:1', 'null , <br/>null', 'INFO', 'SELECT', 'com.ltweb_servlet_ecommerce.controller.web.shared.HomeController:43', NULL, '{\"status\":\"Access the path http://localhost:8080/home\"}', '2024-04-19 19:47:31', '2024-04-19 19:47:31', 0),
(633, '0:0:0:0:0:0:0:1', 'null , <br/>null', 'INFO', 'SELECT', 'com.ltweb_servlet_ecommerce.controller.web.shared.HomeController:43', NULL, '{\"status\":\"Access the path http://localhost:8080/home\"}', '2024-04-19 19:47:31', '2024-04-19 19:47:31', 0),
(634, '0:0:0:0:0:0:0:1', 'null , <br/>null', 'INFO', 'SELECT', 'com.ltweb_servlet_ecommerce.controller.web.shared.HomeController:43', NULL, '{\"status\":\"Access the path http://localhost:8080/home\"}', '2024-04-19 19:47:31', '2024-04-19 19:47:32', 0),
(635, '0:0:0:0:0:0:0:1', 'null , <br/>null', 'INFO', 'SELECT', 'com.ltweb_servlet_ecommerce.controller.web.shared.HomeController:43', NULL, '{\"status\":\"Access the path http://localhost:8080/home\"}', '2024-04-19 19:47:32', '2024-04-19 19:47:34', 0),
(636, '0:0:0:0:0:0:0:1', 'null , <br/>null', 'INFO', 'SELECT', 'com.ltweb_servlet_ecommerce.controller.web.shared.HomeController:43', NULL, '{\"status\":\"Access the path http://localhost:8080/home\"}', '2024-04-19 19:47:32', '2024-04-19 19:47:34', 0),
(637, '0:0:0:0:0:0:0:1', 'null , <br/>null', 'INFO', 'SELECT', 'com.ltweb_servlet_ecommerce.controller.web.shared.HomeController:43', NULL, '{\"status\":\"Access the path http://localhost:8080/home\"}', '2024-04-19 19:47:32', '2024-04-19 19:47:34', 0),
(638, '0:0:0:0:0:0:0:1', 'null , <br/>null', 'INFO', 'SELECT', 'com.ltweb_servlet_ecommerce.controller.web.shared.HomeController:43', NULL, '{\"status\":\"Access the path http://localhost:8080/home\"}', '2024-04-19 19:47:33', '2024-04-19 19:47:34', 0),
(639, '0:0:0:0:0:0:0:1', 'null , <br/>null', 'INFO', 'SELECT', 'com.ltweb_servlet_ecommerce.controller.web.shared.HomeController:43', NULL, '{\"status\":\"Access the path http://localhost:8080/home\"}', '2024-04-19 19:47:33', '2024-04-19 19:47:34', 0),
(640, '0:0:0:0:0:0:0:1', 'null , <br/>null', 'INFO', 'SELECT', 'com.ltweb_servlet_ecommerce.controller.web.shared.HomeController:43', NULL, '{\"status\":\"Access the path http://localhost:8080/home\"}', '2024-04-19 19:47:33', '2024-04-19 19:47:34', 0),
(641, '0:0:0:0:0:0:0:1', 'null , <br/>null', 'INFO', 'SELECT', 'com.ltweb_servlet_ecommerce.controller.web.shared.HomeController:43', NULL, '{\"status\":\"Access the path http://localhost:8080/home\"}', '2024-04-19 19:47:34', '2024-04-19 19:47:34', 0),
(642, '0:0:0:0:0:0:0:1', 'null , <br/>null', 'INFO', 'SELECT', 'com.ltweb_servlet_ecommerce.controller.web.shared.HomeController:43', NULL, '{\"status\":\"Access the path http://localhost:8080/home\"}', '2024-04-19 19:47:34', '2024-04-19 19:47:36', 0),
(643, '0:0:0:0:0:0:0:1', 'null , <br/>null', 'INFO', 'SELECT', 'com.ltweb_servlet_ecommerce.controller.web.shared.HomeController:43', NULL, '{\"status\":\"Access the path http://localhost:8080/home\"}', '2024-04-19 19:47:34', '2024-04-19 19:47:36', 0),
(644, '0:0:0:0:0:0:0:1', 'null , <br/>null', 'INFO', 'SELECT', 'com.ltweb_servlet_ecommerce.controller.web.shared.HomeController:43', NULL, '{\"status\":\"Access the path http://localhost:8080/home\"}', '2024-04-19 19:47:34', '2024-04-19 19:47:36', 0),
(645, '127.0.0.1', 'null , <br/>null', 'INFO', 'SELECT', 'com.ltweb_servlet_ecommerce.controller.web.shared.HomeController:43', NULL, '{\"status\":\"Access the path http://localhost:8080/home\"}', '2024-04-20 02:39:31', '2024-04-20 02:39:33', 0),
(646, '127.0.0.1', 'null , <br/>null', 'INFO', 'SELECT', 'com.ltweb_servlet_ecommerce.controller.web.shared.HomeController:43', NULL, '{\"status\":\"Access the path http://localhost:8080/home\"}', '2024-04-20 02:39:31', '2024-04-20 02:39:33', 0),
(647, '0:0:0:0:0:0:0:1', 'null , <br/>null', 'INFO', 'SELECT', 'com.ltweb_servlet_ecommerce.controller.web.shared.HomeController:43', NULL, '{\"status\":\"Access the path http://localhost:8080/home\"}', '2024-04-20 02:39:32', '2024-04-20 02:39:33', 0),
(648, '0:0:0:0:0:0:0:1', 'null , <br/>null', 'WARN', 'UPDATE', 'com.ltweb_servlet_ecommerce.service.impl.UserService:94', '{\"value\":{\"lastLogged\":\"2024-04-19 15:58:46.0\"}}', '{\"value\":{\"lastLogged\":\"2024-04-20 16:39:42.0\"},\"status\":\"UpdatedAt and lastLogged fields successfully updated\"}', '2024-04-20 02:39:42', '2024-04-20 02:39:42', 0),
(649, '0:0:0:0:0:0:0:1', 'null , <br/>null', 'INFO', 'SELECT', 'com.ltweb_servlet_ecommerce.controller.web.shared.LoginController:67', NULL, '{\"value\":{\"id\":14,\"email\":\"vophihoang252003@gmail.com\"},\"status\":\"Authentication successful\"}', '2024-04-20 02:39:42', '2024-04-20 02:39:44', 0);

-- --------------------------------------------------------

--
-- Table structure for table `opinions`
--

CREATE TABLE `opinions` (
  `id` bigint(20) NOT NULL,
  `title` varchar(500) DEFAULT NULL,
  `content` varchar(1000) DEFAULT NULL,
  `rating` int(11) DEFAULT NULL,
  `productId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `createAt` timestamp NULL DEFAULT current_timestamp(),
  `updateAt` timestamp NULL DEFAULT current_timestamp(),
  `isDeleted` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) NOT NULL,
  `status` varchar(50) DEFAULT NULL,
  `note` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '',
  `totalAmount` decimal(10,1) DEFAULT 0.0,
  `addressId` bigint(20) DEFAULT NULL,
  `isPaid` tinyint(1) DEFAULT 0,
  `slug` varchar(20) DEFAULT NULL,
  `createAt` timestamp NULL DEFAULT current_timestamp(),
  `updateAt` timestamp NULL DEFAULT current_timestamp(),
  `isDeleted` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `status`, `note`, `totalAmount`, `addressId`, `isPaid`, `slug`, `createAt`, `updateAt`, `isDeleted`) VALUES
(9, NULL, 'Gọi trước khi giao', 3150000.0, 6, 0, 'hwIF95Vsv7', '2024-04-03 20:39:43', '2024-04-03 20:39:45', 0),
(10, NULL, 'Gọi trước khi giao', 1150000.0, 9, 0, '9yTYU6LGJ0', '2024-04-03 20:55:00', '2024-04-03 20:55:01', 0),
(11, NULL, 'Gọi trước khi giao', 1050000.0, 10, 0, 'KyPl35OTpN', '2024-04-04 17:18:28', '2024-04-04 17:18:36', 0);

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

CREATE TABLE `order_details` (
  `id` bigint(20) NOT NULL,
  `quantity` int(11) DEFAULT NULL,
  `subTotal` decimal(10,1) DEFAULT NULL,
  `orderId` bigint(20) DEFAULT NULL,
  `productSizeId` bigint(20) DEFAULT NULL,
  `createAt` timestamp NULL DEFAULT current_timestamp(),
  `updateAt` timestamp NULL DEFAULT current_timestamp(),
  `isDeleted` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_details`
--

INSERT INTO `order_details` (`id`, `quantity`, `subTotal`, `orderId`, `productSizeId`, `createAt`, `updateAt`, `isDeleted`) VALUES
(32, 20, 2000000.0, 11, 56, '2024-04-03 20:39:43', '2024-04-03 20:39:43', 0),
(33, 1, 1100000.0, 11, 5, '2024-04-03 20:39:43', '2024-04-03 20:39:43', 0),
(34, 1, 1100000.0, 11, 5, '2024-04-03 20:55:00', '2024-04-03 20:55:00', 0),
(35, 1, 1000000.0, 11, 53, '2024-04-04 17:18:28', '2024-04-04 17:18:28', 0),
(37, 5, 6950000.0, NULL, 48, '2024-04-07 05:15:32', '2024-04-07 05:17:47', 0);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) NOT NULL,
  `name` varchar(350) DEFAULT NULL,
  `content` text DEFAULT NULL,
  `thumbnail` varchar(3000) NOT NULL,
  `shortDescription` varchar(500) DEFAULT NULL,
  `price` decimal(10,1) DEFAULT NULL,
  `modelUrl` varchar(255) DEFAULT NULL,
  `slug` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `categoryId` bigint(20) DEFAULT NULL,
  `createAt` timestamp NULL DEFAULT current_timestamp(),
  `updateAt` timestamp NULL DEFAULT current_timestamp(),
  `isDeleted` tinyint(1) DEFAULT 0,
  `totalViewAndSearch` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `content`, `thumbnail`, `shortDescription`, `price`, `modelUrl`, `slug`, `categoryId`, `createAt`, `updateAt`, `isDeleted`, `totalViewAndSearch`) VALUES
(1, 'Nike Air Max 90', '&lt;p&gt;Bạn muốn thoải mái suốt ngày, mỗi ngày đúng không? Chúng tôi có sản phẩm cho bạn. Phiên bản AJ1 Low mang lại vẻ đẹp của phiên bản gốc dành cho bóng rổ, nhưng nhẹ hơn và có hình dáng mảnh mai hơn. Ngoài ra, chúng phù hợp với mọi trang phục chỉ cần ràng buộc dây giày và đi.&lt;/p&gt;&lt;p&gt;&lt;br&gt;&amp;nbsp;&lt;/p&gt;&lt;p&gt;&lt;strong&gt;Lợi ích&lt;/strong&gt;&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Công nghệ Nike Air hấp thụ va chạm để mang lại sự êm ái mỗi bước đi.&lt;/li&gt;&lt;li&gt;Chất liệu da thật và da tổng hợp kết hợp với vật liệu dệt nhẹ nhàng mang lại độ bền cao và sự vừa vặn tốt.&lt;/li&gt;&lt;li&gt;Đế cao su cung cấp độ bám đầy đủ.&lt;/li&gt;&lt;/ul&gt;&lt;p&gt;&lt;br&gt;&amp;nbsp;&lt;/p&gt;&lt;p&gt;&lt;strong&gt;Thông tin sản phẩm&lt;/strong&gt;&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Logo Jumpman trên lưỡi giày&lt;/li&gt;&lt;li&gt;Logo Swoosh được may chắc&lt;ul&gt;&lt;li&gt;Hiển thị: Đen/Đen/Trắng&lt;/li&gt;&lt;li&gt;Kiểu dáng: DV0990-001&lt;/li&gt;&lt;/ul&gt;&lt;/li&gt;&lt;/ul&gt;', 'http://res.cloudinary.com/da5wewzih/image/upload/v1704212059/zdyy9vcookwn8pe9cgh6.png', 'Lấy cảm hứng từ phiên bản gốc ra mắt năm 1985, Air Jordan 1 Low mang đến vẻ ngoài cổ điển, gọn gàng, quen thuộc nhưng luôn mới mẻ.', 1020000.0, NULL, NULL, 1, '2024-01-02 09:14:19', '2024-01-02 09:14:19', 0, 2),
(2, 'Nike Tech Hera', '&lt;p&gt;Bắt nguồn từ đầu những năm 2000, Tech Hera sẵn sàng đáp ứng mọi mong muốn về giày sneaker chunky của bạn. Đế giữa được nâng lên gợn sóng và bảng màu trung tính lâu đời sẽ nâng tầm diện mạo của bạn trong khi vẫn giúp bạn cảm thấy thoải mái. Thiết kế bền bỉ của nó giữ được vẻ đẹp khi mặc hàng ngày &mdash; điều này thật hoàn hảo, bởi vì bạn chắc chắn sẽ muốn đeo những thứ này hàng ngày.&lt;/p&gt;&lt;p&gt;&lt;br&gt;&amp;nbsp;&lt;/p&gt;&lt;p&gt;&lt;strong&gt;Lợi ích&lt;/strong&gt; &lt;/p&gt;&lt;ul&gt;&lt;li&gt;Phần trên kết hợp lưới thoáng khí với da thật và da tổng hợp để tạo kích thước và độ bền.&lt;/li&gt;&lt;li&gt;Thiết kế Chunky có nền tảng tinh tế giúp bạn tăng thêm một chút chiều cao. &lt;/li&gt;&lt;li&gt;Đế ngoài bằng cao su có chiều dài đầy đủ mang lại lực kéo bền bỉ.&lt;/li&gt;&lt;/ul&gt;&lt;p&gt;&lt;br&gt;&amp;nbsp;&lt;/p&gt;&lt;p&gt;&lt ;strong&gt;Chi tiết sản phẩm&lt;/strong&gt;&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Cổ áo có đệm&lt;/li&gt;&lt;li&gt;Tay kéo ở gót chân&lt;/li&gt;&lt;li&gt;Logo Swoosh thêu&lt;ul&gt; &lt;li&gt;Hiển thị: Cánh buồm/Nâu quặng nhạt/Sữa dừa/Cam lửa trại&lt;/li&gt;&lt;li&gt;Phong cách: FQ8107-133&lt;/li&gt;&lt;/ul&gt;&lt;/li&gt;&lt;/ul&gt;', 'http://res.cloudinary.com/da5wewzih/image/upload/v1704215356/nw9wcfdali4xqcvysmlm.png', 'Bắt nguồn từ đầu những năm 2000, Tech Hera sẵn sàng đáp ứng mọi mong muốn về giày sneaker chunky của bạn.', 1160000.0, NULL, NULL, 1, '2024-01-02 10:09:16', '2024-01-02 10:09:16', 0, 0),
(3, 'Nike Mercurial Superfly 9 Club', '&lt;p&gt;Độ nghiêng sân ngay lập tức với thiết kế táo bạo của Superfly 9 Club MG nhẹ và thấp so với mặt đất. Tốc độ nhanh đang ở trên không.&lt;/p&gt;&lt;p&gt;&lt;strong&gt;Thúc đẩy tốc độ của bạn&lt;/strong&gt;&lt;/p&gt;&lt;p&gt;Lồng tốc độ bên trong cấu trúc được làm từ vật liệu mỏng nhưng chắc chắn cố định bàn chân vào đế ngoài mà không tăng thêm trọng lượng để có khả năng khóa tối ưu.&lt;/p&gt;&lt;p&gt;&lt;strong&gt;Đào vào, cất cánh&lt;/strong&gt;&lt;/p&gt;&lt;p&gt;Mẫu lực kéo độc đáo mang lại hiệu quả vượt trội - Lực kéo tích điện có khả năng nhả nhanh để tạo sự tách biệt.&lt;/p&gt;&lt;p&gt;&lt;strong&gt;Cải thiện độ vừa vặn&lt;/strong&gt;&lt;/p&gt;&lt;p&gt;Flyknit quấn mắt cá chân của bạn bằng vải mềm, co giãn để đảm bảo an toàn cảm thấy. Thiết kế được làm lại giúp cải thiện độ vừa vặn để mô phỏng bàn chân tốt hơn. Chúng tôi đã thực hiện điều này bằng cách tiến hành nhiều cuộc kiểm tra độ mòn trên hàng trăm vận động viên. Kết quả là phần mũi giày có đường viền tốt hơn và khả năng khóa gót chân tốt hơn.&lt;/p&gt;&lt;p&gt;&lt;strong&gt;Cảm nhận bóng&lt;/strong&gt;&lt;/p&gt;&lt;p&gt;Phần trên tổng hợp đúc khuôn có một mẫu có kết cấu để kiểm soát bóng tốt hơn khi rê bóng ở tốc độ cao.&lt;/p&gt;&lt;p&gt;&lt;strong&gt;Chi tiết sản phẩm&lt;/strong&gt;&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Để sử dụng trên sân bóng tự nhiên và bề mặt tổng hợp&lt;/li&gt;&lt;li&gt;Đế đệm&lt;/li&gt;&lt;li&gt;Màu hiển thị: Đen/Hyper Royal/Chrome&lt;/li&gt;&lt;li&gt;Phong cách: DJ5961-040&lt;/li&gt;&lt;li&gt; Quốc gia/Khu vực xuất xứ: Việt Nam&lt;/li&gt;&lt;/ul&gt;', 'http://res.cloudinary.com/da5wewzih/image/upload/v1704233310/eqmlo8nlmbifxinsegpf.png', 'Nghiêng sân ngay lập tức với thiết kế táo bạo của Superfly 9 Club MG nhẹ và thấp so với mặt đất.', 879000.0, NULL, NULL, 7, '2024-01-02 15:08:47', '2024-01-02 15:08:47', 0, 0),
(4, 'Nike Go FlyEase', '&lt;p&gt;Độ nghiêng sân ngay lập tức với thiết kế táo bạo của Superfly 9 Club MG nhẹ và thấp so với mặt đất. Tốc độ nhanh đang ở trên không.&lt;/p&gt;&lt;p&gt;&lt;strong&gt;Thúc đẩy tốc độ của bạn&lt;/strong&gt;&lt;/p&gt;&lt;p&gt;Lồng tốc độ bên trong cấu trúc được làm từ vật liệu mỏng nhưng chắc chắn cố định bàn chân vào đế ngoài mà không tăng thêm trọng lượng để có khả năng khóa tối ưu.&lt;/p&gt;&lt;p&gt;&lt;strong&gt;Đào vào, cất cánh&lt;/strong&gt;&lt;/p&gt;&lt;p&gt;Mẫu lực kéo độc đáo mang lại hiệu quả vượt trội - Lực kéo tích điện có khả năng nhả nhanh để tạo sự tách biệt.&lt;/p&gt;&lt;p&gt;&lt;strong&gt;Cải thiện độ vừa vặn&lt;/strong&gt;&lt;/p&gt;&lt;p&gt;Flyknit quấn mắt cá chân của bạn bằng vải mềm, co giãn để đảm bảo an toàn cảm thấy. Thiết kế được làm lại giúp cải thiện độ vừa vặn để mô phỏng bàn chân tốt hơn. Chúng tôi đã thực hiện điều này bằng cách tiến hành nhiều cuộc kiểm tra độ mòn trên hàng trăm vận động viên. Kết quả là phần mũi giày có đường viền tốt hơn và khả năng khóa gót chân tốt hơn.&lt;/p&gt;&lt;p&gt;&lt;strong&gt;Cảm nhận bóng&lt;/strong&gt;&lt;/p&gt;&lt;p&gt;Phần trên tổng hợp đúc khuôn có một mẫu có kết cấu để kiểm soát bóng tốt hơn khi rê bóng ở tốc độ cao.&lt;/p&gt;&lt;p&gt;&lt;strong&gt;Chi tiết sản phẩm&lt;/strong&gt;&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Để sử dụng trên sân bóng tự nhiên và bề mặt tổng hợp&lt;/li&gt;&lt;li&gt;Đế đệm&lt;/li&gt;&lt;li&gt;Màu hiển thị: Đen/Hyper Royal/Chrome&lt;/li&gt;&lt;li&gt;Phong cách: DJ5961-040&lt;/li&gt;&lt;li&gt; Quốc gia/Khu vực xuất xứ: Việt Nam&lt;/li&gt;&lt;/ul&gt;', 'http://res.cloudinary.com/da5wewzih/image/upload/v1704233684/ahtnmfvovwgx38bgt2d6.png', 'Bỏ dây buộc và ra ngoài. Những đôi giày này sử dụng công nghệ FlyEase mang tính cách mạng của Nike, giúp việc bật và tắt trở nên dễ dàng', 1658000.0, NULL, NULL, 6, '2024-01-02 15:14:43', '2024-01-02 15:14:43', 0, 0),
(5, 'Nike Air Huarache Runner', '&lt;p&gt;Khi nó vừa vặn và trông đẹp thế này thì nó không cần logo Swoosh. Air Huarache mang hình dáng cổ điển với thiết kế lấy cảm hứng từ người chạy bộ, chất liệu hỗn hợp và màu trung tính phong phú mang lại vẻ ngoài vừa hoài cổ vừa hoàn toàn mới. Với chất liệu vải co giãn, ôm chân và phần khung gót chân mang phong cách tương lai, đó vẫn là tất cả những gì bạn yêu thích ở Huarache.&lt;/p&gt;&lt;p&gt;&lt;strong&gt;Lợi ích&lt;/strong&gt;&lt;/p&gt;&lt;ul&gt;&lt ;li&gt;Lấy cảm hứng từ môn trượt nước, phần trên co giãn và ống tay áo bên trong có đệm tạo cảm giác vừa khít cho cảm giác tuyệt vời.&lt;/li&gt;&lt;li&gt;Được thiết kế ban đầu để chạy hiệu suất, đệm Nike Air mang lại sự thoải mái lâu dài.&lt;/li&gt ;&lt;li&gt;Phần gót nhọn tăng thêm khả năng hỗ trợ và kết hợp với phần lưỡi thon dài để giữ nguyên vẻ ngoài đầu thập niên 90 mà bạn yêu thích.&lt;/li&gt;&lt;/ul&gt;&lt;p&gt;&lt;strong&gt;Chi tiết sản phẩm&lt;/strong&gt ;&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Đế cao su&lt;/li&gt;&lt;li&gt;Dây buộc có chiều rộng thay đổi&lt;/li&gt;&lt;li&gt;Không nhằm mục đích sử dụng làm Thiết bị bảo hộ cá nhân (PPE)&lt;/ li&gt;&lt;li&gt;Màu hiển thị: Obsidian đậm/Obsidian/Gum Nâu đậm/Trắng&lt;/li&gt;&lt;li&gt;Phong cách: DZ3306-400&lt;/li&gt;&lt;li&gt;Quốc gia/Khu vực xuất xứ: Trung Quốc&lt;/li&gt ;&lt;/ul&gt;&lt;p&gt;&lt;strong&gt;Huarache Origins&lt;/strong&gt;&lt;/p&gt;&lt;p&gt;Nike Air Huarache ra mắt năm 1991. Nhà thiết kế giày dép Tinker Hatfield muốn kết hợp khả năng vừa vặn của nước cao su tổng hợp- giày trượt tuyết có chức năng như dép Nam Mỹ. Cú hit ngay lập tức đã tìm được đường đến các sân bóng rổ và sau đó là đường phố, nơi nó trở thành một biểu tượng.&lt;/p&gt;', 'http://res.cloudinary.com/da5wewzih/image/upload/v1704234050/gdrknjwyagdjpxig1yd6.png', 'Khi nó vừa vặn và trông đẹp thế này thì nó không cần logo Swoosh.', 2060000.0, NULL, NULL, 1, '2024-01-02 15:20:50', '2024-01-02 15:20:50', 0, 0),
(7, 'Nike Waffle Debut', '&lt;p&gt;Giao hàng miễn phí*&lt;/p&gt;&lt;p&gt;Để có được thông tin giao hàng chính xác &lt;a href=&quot;/user/address&quot;&gt;Chỉnh sửa vị trí&lt;/a&gt;&lt;/p&gt;&lt;p&gt; &lt;br&gt;Retro được hiện đại hóa với những đôi giày sneaker bóng bẩy lấy cảm hứng từ Nike Daybreak. Da lộn và nylon mang tính thời đại được kết hợp với các màu bổ sung và đế giữa hình nêm được cập nhật giúp bạn có thêm lực nâng. Phong cách, sự thoải mái, đế ngoài Waffle mang tính biểu tượng&mdash;đây là sự bổ sung mới hoàn hảo cho công việc xoay vòng hàng ngày của bạn.&lt;/p&gt;&lt;p&gt;&lt;strong&gt;Lợi ích&lt;/strong&gt;&lt;/p&gt;&lt;ul&gt;&lt;li&gt; Swoosh quấn quanh gót chân của bạn để tạo thành một tab kéo, tăng thêm tính thẩm mỹ cho chức năng bật và tắt.&lt;/li&gt;&lt;li&gt;Đế giữa bằng xốp nâng cao mang lại cho bạn vẻ ngoài cao cấp và sự thoải mái cả ngày.&lt;/li&gt; &lt;li&gt;Lớp phủ da lộn mềm phù hợp với chất liệu cổ điển trong khi lớp lót dệt tăng thêm độ bền.&lt;/li&gt;&lt;li&gt;Đế ngoài bằng cao su Waffle tăng thêm lực kéo bền bỉ và phong cách di sản.&lt;/li&gt;&lt;/ul&gt;&lt;p&gt; &lt;strong&gt;Chi tiết sản phẩm&lt;/strong&gt;&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Cổ áo có đệm&lt;/li&gt;&lt;li&gt;Lưỡi xốp lộ ra&lt;/li&gt;&lt;li&gt;Dây buộc truyền thống&lt;/li&gt; &lt;li&gt;Đục lỗ ở gót chân&lt;ul&gt;&lt;li&gt;Hiển thị: Trắng/Nâu Orewood nhạt/Cánh buồm/Rush Fuchsia&lt;/li&gt;&lt;li&gt;Phong cách: DH9523-104&lt;/li&gt;&lt;/ul&gt;&lt; /li&gt;&lt;/ul&gt;&lt;p&gt;&lt;strong&gt;Waffle Origin&lt;/strong&gt;&lt;/p&gt;&lt;p&gt;Năm 1971, người đồng sáng lập Nike, Bill Bowerman đang quan sát vợ mình, Barbra, làm bữa sáng bằng một chiếc bánh quế sắt và cảm hứng ập đến. Anh ấy đã đổi bột lấy cao su và đế ngoài Waffle đã ra đời. Nó không chỉ mang lại lực kéo, độ bền và phong cách Nike truyền thống&mdash;nó còn chứng minh rằng sự tuyệt vời luôn hiện hữu trong cuộc sống hàng ngày. Và chiếc bánh quế cũ kỹ, rỉ sét đó? Chà, bây giờ nó được đặt trên bệ ở Trụ sở chính của Nike World.&lt;/p&gt;', 'http://res.cloudinary.com/da5wewzih/image/upload/v1704268740/bkrq1pgyze889v5be2gp.png', 'Phong cách retro được hiện đại hóa với những đôi giày sneaker bóng bẩy lấy cảm hứng từ Nike Daybreak.', 640000.0, NULL, NULL, 2, '2024-01-03 00:58:59', '2024-01-03 00:58:59', 0, 0),
(8, 'Nike Elevate 3', '&lt;p&gt;&lt;strong&gt;Giao hàng miễn phí*&lt;/strong&gt;&lt;/p&gt;&lt;p&gt;Để có được thông tin giao hàng chính xác &lt;a href=&quot;/user/address&quot;&gt;Chỉnh sửa Địa điểm&lt;/a&gt; &lt;/p&gt;&lt;p&gt;Nâng cấp trò chơi của bạn ở cả hai đầu sàn trong Nike Renew Elevate 3. Được điều chỉnh đặc biệt dành cho những người chơi 2 chiều muốn tạo ra tác động tấn công và phòng thủ, đôi giày này giúp bạn tối ưu hóa khả năng của mình với sự hỗ trợ và ổn định trong mọi trận đấu, mọi mùa giải. Lực kéo và hỗ trợ vòm được cải thiện giúp nâng cao khả năng cắt và xoay, điều này có thể tạo ra sự khác biệt trong đoạn đường kéo dài.&lt;/p&gt;&lt;p&gt;&lt;strong&gt;Trục tại điểm&lt;/strong&gt;&lt;/p&gt;&lt;p&gt;A lực kéo tổng hợp đã được vận động viên thử nghiệm cho phép xoay vòng quanh bàn chân trước tốt hơn, cho phép bạn cảm thấy an toàn hơn và khóa chặt khi quay, dừng và xuất phát.&lt;/p&gt;&lt;p&gt;&lt;strong&gt;Lace Up&lt;/strong&gt;&lt ;/p&gt;&lt;p&gt;Chúng tôi đã bổ sung thêm các lỗ ren ở giữa bàn chân để mang đến cho bạn sự an toàn bổ sung mà bạn cần để hỗ trợ vòm bàn chân cực kỳ quan trọng.&lt;/p&gt;&lt;p&gt;&lt;strong&gt;Thêm lợi ích&lt;/strong&gt ;&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Lưới có cấu trúc ở phía trên tạo cảm giác mềm mại quanh bàn chân của bạn. Nó vừa khít để giúp giảm chuyển động trong giày khi chơi.&lt;/li&gt;&lt;li&gt;Cổ đệm có đường viền để mang lại sự vừa vặn và hỗ trợ chính xác quanh mắt cá chân của bạn.&lt;/li&gt;&lt;/ul&gt;&lt; p&gt;&lt;strong&gt;Chi tiết sản phẩm&lt;/strong&gt;&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Lớp phủ không đường may&lt;/li&gt;&lt;li&gt;Đế giữa bằng xốp&lt;/li&gt;&lt;li&gt;Lưỡi sang trọng&lt; ul&gt;&lt;li&gt;Hiển thị: Đen/Xám sói/Xám lạnh/Trắng&lt;/li&gt;&lt;li&gt;Phong cách: DD9304-002&lt;/li&gt;&lt;/ul&gt;&lt;/li&gt;&lt;/ul&gt;&lt ;p&gt;&amp;nbsp;&lt;/p&gt;', 'http://res.cloudinary.com/da5wewzih/image/upload/v1704269225/qheu2fgefuytcnnzpmgg.png', 'Nâng cấp trò chơi của bạn ở cả hai đầu sàn với Nike Renew Elevate 3', 910000.0, NULL, NULL, 1, '2024-01-03 01:07:05', '2024-01-03 01:07:05', 0, 0),
(9, 'Nike Air Max SC', '&lt;p&gt;&lt;strong&gt;Giao hàng miễn phí*&lt;/strong&gt;&lt;/p&gt;&lt;p&gt;Để có được thông tin giao hàng chính xác &lt;a href=&quot;/user/address&quot;&gt;Chỉnh sửa Địa điểm&lt;/a&gt; &lt;/p&gt;&lt;p&gt;Với những đường nét thiết kế quen thuộc, tính thẩm mỹ của đường đua truyền thống và lớp đệm Max Air có thể nhìn thấy được, Nike Air Max SC là cách hoàn hảo để hoàn thiện bất kỳ trang phục nào. Da mịn và vải dệt kim nhẹ tăng thêm độ sâu và độ bền trong khi bộ phận Air màu ở gót chân làm cho ngày của bạn tươi sáng hơn sau mỗi bước đi.&lt;/p&gt;&lt;p&gt;&lt;strong&gt;Lợi ích&lt;/strong&gt;&lt;/p&gt;&lt; ul&gt;&lt;li&gt;Da kết hợp với vải dệt kim và lưới thoáng mát để tạo nên kết cấu bền bỉ, thoáng khí và đủ thoải mái để mang cả ngày.&lt;/li&gt;&lt;li&gt;Được thiết kế ban đầu để chạy bộ, bộ phận Max Air ở gót chân mang lại khả năng giảm chấn nhẹ với mọi hoạt động bước.&lt;/li&gt;&lt;li&gt;Đế giữa bằng xốp bổ sung khả năng giảm chấn bền lâu.&lt;/li&gt;&lt;li&gt;Đế ngoài cao su mang lại lực kéo và độ bền.&lt;ul&gt;&lt;li&gt;Hiển thị: White/Light Lemon Twist/ Fireberry/Blue Tint&lt;/li&gt;&lt;li&gt;Phong cách: FQ8886-100&lt;/li&gt;&lt;/ul&gt;&lt;/li&gt;&lt;/ul&gt;&lt;p&gt;&lt;strong&gt;Nike Air Max Origins&lt;/ mạnh mẽ&gt;&lt;/p&gt;&lt;p&gt;Công nghệ Revolutionary Air lần đầu tiên được đưa vào giày Nike vào năm 1978. Năm 1987, Air Max 1 ra mắt với công nghệ Air có thể nhìn thấy ở gót chân, mang đến cho người hâm mộ nhiều thứ hơn là chỉ cảm nhận về đệm Air&mdash ;đột nhiên họ có thể nhìn thấy nó. Kể từ đó, giày Air Max thế hệ tiếp theo đã trở thành điểm nhấn với các vận động viên và nhà sưu tập nhờ mang đến sự kết hợp màu sắc nổi bật và lớp đệm nhẹ, đáng tin cậy.&lt;/p&gt;&lt;p&gt;&amp;nbsp;&lt;/p&gt;', 'http://res.cloudinary.com/da5wewzih/image/upload/v1704269655/kut4qnvut5cpwloxgrqy.png', 'Với những đường nét thiết kế quen thuộc, tính thẩm mỹ theo phong cách di sản và đệm Max Air có thể nhìn thấy được, Nike Air Max SC là cách hoàn hảo để hoàn thiện mọi trang phục', 740000.0, NULL, NULL, 5, '2024-01-03 01:14:14', '2024-01-03 01:14:14', 0, 0),
(10, 'Nike Air Max 270', '&lt;p&gt;Giao hàng miễn phí*&lt;/p&gt;&lt;p&gt;Để có được thông tin giao hàng chính xác &lt;a href=&quot;/user/address&quot;&gt;Chỉnh sửa vị trí&lt;/a&gt;&lt;/p&gt;&lt;p&gt; &lt;strong&gt;KHÍ HUYỀN THOẠI ĐƯỢC NÂNG CAO.&lt;/strong&gt;&lt;/p&gt;&lt;p&gt;Phong cách sống đầu tiên của Nike Air Max mang đến cho bạn phong cách, sự thoải mái và không khí lớn trong Nike Air Max 270. Thiết kế lấy cảm hứng từ Air Max các biểu tượng, thể hiện sự đổi mới to lớn của Nike với cửa sổ lớn và các chi tiết mới mẻ.&lt;/p&gt;&lt;p&gt;&lt;strong&gt;Lợi ích&lt;/strong&gt;&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Thiết bị Max Air 270 mang lại sự thoải mái cả ngày.&lt;/li&gt;&lt;li&gt;Vải dệt kim và tổng hợp ở phía trên mang lại cảm giác vừa vặn nhẹ và thoáng khí.&lt;/li&gt;&lt;li&gt;Đế giữa bằng xốp tạo cảm giác mềm mại và thoải mái.&lt;/li&gt ;&lt;li&gt;Tay áo bên trong co giãn tạo cảm giác vừa vặn cá nhân.&lt;/li&gt;&lt;li&gt;Cao su ở đế ngoài tăng thêm lực kéo và độ bền.&lt;/li&gt;&lt;/ul&gt;&lt;p&gt;&lt;strong&gt;Sản phẩm Chi tiết&lt;/strong&gt;&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Các chi tiết lưới mang lại cảm giác thoáng mát&lt;/li&gt;&lt;li&gt;Tổng hợp và dệt&lt;/li&gt;&lt;li&gt;Đế giữa 2 mảnh&lt;ul&gt; &lt;li&gt;Hiển thị: Summit White/Sa mạc Sand/Kem đào/Đen&lt;/li&gt;&lt;li&gt;Phong cách: DH3050-100&lt;/li&gt;&lt;/ul&gt;&lt;/li&gt;&lt;/ul&gt;&lt; p&gt;&lt;strong&gt;Nike Air Max Origins&lt;/strong&gt;&lt;/p&gt;&lt;p&gt;Công nghệ Revolutionary Air lần đầu tiên được đưa vào giày Nike vào năm 1978. Năm 1987, Air Max 1 ra mắt với công nghệ Air có thể nhìn thấy được trong gót chân, mang đến cho người hâm mộ nhiều điều hơn là chỉ cảm giác về đệm khí&mdash;đột nhiên họ có thể nhìn thấy nó. Kể từ đó, giày Air Max thế hệ tiếp theo đã trở thành điểm nhấn với các vận động viên và nhà sưu tập nhờ mang đến sự kết hợp màu sắc nổi bật và lớp đệm nhẹ, đáng tin cậy.&lt;/p&gt;', 'http://res.cloudinary.com/da5wewzih/image/upload/v1704269813/ftllqqdrl0sveehjomp9.png', 'Phong cách sống đầu tiên của Nike Air Max mang đến cho bạn phong cách, sự thoải mái và Air lớn trong Nike Air Max 270.', 1600000.0, NULL, NULL, 3, '2024-01-03 01:16:52', '2024-01-03 01:16:52', 0, 0),
(11, 'Nike Air Max 90', '&lt;p&gt;Giao hàng miễn phí*&lt;/p&gt;&lt;p&gt;Để có được thông tin giao hàng chính xác &lt;a href=&quot;/user/address&quot;&gt;Chỉnh sửa vị trí&lt;/a&gt;&lt;/p&gt;&lt;p&gt; &lt;mạnh&gt;THOẢI MÁI, DI SẢN. KHÔNG CÓ GÌ TỐT HƠN.&lt;/strong&gt;&lt;/p&gt;&lt;p&gt;Không gì bằng bay, không gì thoải mái bằng, không gì bằng đã được chứng minh. Nike Air Max 90 vẫn đúng với nguồn gốc chạy OG của nó với đế Waffle mang tính biểu tượng, lớp phủ được khâu và các chi tiết TPU cổ điển. Màu sắc cổ điển tôn vinh vẻ ngoài tươi mới của bạn trong khi đệm Max Air tăng thêm sự thoải mái cho hành trình.&lt;/p&gt;&lt;p&gt;&lt;strong&gt;Hiệu suất Thoải mái&lt;/strong&gt;&lt;/p&gt;&lt;p&gt;Được thiết kế ban đầu để chạy hiệu suất, bộ phận Max Air ở gót chân bổ sung khả năng giảm chấn đáng kinh ngạc.&lt;/p&gt;&lt;p&gt;&lt;strong&gt;Phong cách đa năng&lt;/strong&gt;&lt;/p&gt;&lt;p&gt;Thiết kế cổ thấp kết hợp với cổ áo có đệm cho kiểu dáng đẹp, tạo cảm giác mềm mại và thoải mái.&lt;/p&gt;&lt;p&gt;&lt;strong&gt;Retro Vibes&lt;/strong&gt;&lt;/p&gt;&lt;p&gt;Các lớp phủ được khâu và các điểm nhấn TPU tăng thêm độ bền, sự thoải mái và tính biểu tượng Những năm 90 nhìn bạn yêu quá.&lt;/p&gt;&lt;p&gt;&lt;strong&gt;Chi tiết sản phẩm&lt;/strong&gt;&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Phần trên dệt với da và lớp phủ tổng hợp&lt;/li&gt;&lt ;li&gt;Đế giữa bằng xốp&lt;/li&gt;&lt;li&gt;Đế ngoài bằng cao su hình bánh quế tăng thêm lực kéo và độ bền&lt;ul&gt;&lt;li&gt;Hiển thị: Xám sói/Đen/Trắng/Đen&lt;/li&gt;&lt;li&gt;Phong cách: CN8490-001&lt ;/li&gt;&lt;/ul&gt;&lt;/li&gt;&lt;/ul&gt;&lt;p&gt;&lt;strong&gt;Nike Air Max Origins&lt;/strong&gt;&lt;/p&gt;&lt;p&gt;Công nghệ Revolutionary Air lần đầu tiên xuất hiện được đưa vào giày Nike vào năm 1978. Năm 1987, Air Max 1 ra mắt với công nghệ Air có thể nhìn thấy ở gót chân, mang đến cho người hâm mộ nhiều thứ hơn là chỉ cảm giác về đệm Air&mdash;đột nhiên họ có thể nhìn thấy nó. Kể từ đó, giày Air Max thế hệ tiếp theo đã trở thành điểm nhấn với các vận động viên và nhà sưu tập nhờ mang đến sự kết hợp màu sắc nổi bật và lớp đệm nhẹ, đáng tin cậy.&lt;/p&gt;', 'http://res.cloudinary.com/da5wewzih/image/upload/v1704270012/njsatpli7rviso6zqtp1.png', 'Không có gì bằng bay, không có gì thoải mái bằng, không có gì được chứng minh.', 1360000.0, NULL, NULL, 4, '2024-01-03 01:20:11', '2024-01-03 01:20:11', 0, 0),
(12, 'Jordan Spizike Low', '&lt;p&gt;&lt;strong&gt;Giao hàng miễn phí*&lt;/strong&gt;&lt;/p&gt;&lt;p&gt;Để có được thông tin giao hàng chính xác &lt;a href=&quot;/user/address&quot;&gt;Chỉnh sửa Địa điểm&lt;/a&gt; &lt;/p&gt;&lt;p&gt;Spizike lấy các yếu tố của bốn đôi Jordan cổ điển, kết hợp chúng và mang đến cho bạn một đôi giày sneaker mang tính biểu tượng. Đó là sự tôn kính đối với Spike Lee khi chính thức giới thiệu Hollywood và giới thiệu về một khoảnh khắc văn hóa. Bạn sẽ có được một đôi đá đẹp mắt với một số lịch sử. Bạn có thể yêu cầu gì hơn nữa? Ya dig?&lt;/p&gt;&lt;p&gt;&lt;strong&gt;Lợi ích&lt;/strong&gt;&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Đế Nike Air-Sole có thể nhìn thấy được cung cấp lớp đệm nhẹ.&lt;/li&gt;&lt ;li&gt;Đế ngoài bằng cao su mang lại cho bạn lực kéo dồi dào.&lt;/li&gt;&lt;/ul&gt;&lt;p&gt;&lt;strong&gt;Chi tiết sản phẩm&lt;/strong&gt;&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Không dành cho sử dụng làm Thiết bị bảo hộ cá nhân (PPE)&lt;ul&gt;&lt;li&gt;Hiển thị: Xanh quân đoàn/Nâu quân đội/Đỏ đại học/Đen&lt;/li&gt;&lt;li&gt;Phong cách: FD4653-300&lt;/li&gt;&lt;/ul&gt; &lt;/li&gt;&lt;/ul&gt;', 'http://res.cloudinary.com/da5wewzih/image/upload/v1704270190/ucfxuf0zmifaezmbitp0.png', 'Spizike lấy các yếu tố của bốn đôi Jordan cổ điển, kết hợp chúng và mang đến cho bạn một đôi giày sneaker mang tính biểu tượng.', 1560000.0, NULL, NULL, 1, '2024-01-03 01:23:10', '2024-01-03 01:23:10', 0, 0),
(13, 'Air Jordan 1 High G NRG', '&lt;p&gt;&lt;strong&gt;Giao hàng miễn phí*&lt;/strong&gt;&lt;/p&gt;&lt;p&gt;Để có được thông tin giao hàng chính xác &lt;a href=&quot;/user/address&quot;&gt;Chỉnh sửa Địa điểm&lt;/a&gt; &lt;/p&gt;&lt;p&gt;&amp;nbsp;&lt;/p&gt;&lt;p&gt;Một trong những lý do khiến MJ yêu thích chơi gôn đến vậy: Giống như việc nhìn vào gương. Đối thủ duy nhất mà anh ta nhìn thấy đang nhìn chằm chằm vào anh ta. Không có đồng đội để chơi. Không có hậu vệ nào để tấn công. Chỉ có anh ấy, cú swing của anh ấy và sân golf. Chiếc AJ1 High đặc biệt này, với lớp hoàn thiện bằng kim loại, các móc mạ crôm và các chi tiết Air Jordan bóng loáng, lấy cảm hứng từ động lực bên trong đã truyền cảm hứng cho cả MJ và chúng tôi không ngừng hoàn thiện hơn mỗi ngày.&lt;/p&gt;&lt;p&gt;&lt;strong&gt; AJ1 Design nguyên bản&lt;/strong&gt;&lt;/p&gt;&lt;p&gt;Da thật và tổng hợp cùng với khối màu đậm tái tạo lại vẻ cổ điển.&lt;/p&gt;&lt;p&gt;&lt;strong&gt;Đệm khí&lt;/strong&gt;&lt ;/p&gt;&lt;p&gt;Không khí được bao bọc ở đệm gót chân mỗi bước đi.&lt;/p&gt;&lt;p&gt;&lt;strong&gt;Heritage Traction&lt;/strong&gt;&lt;/p&gt;&lt;p&gt;Dựa trên thiết kế của đế ngoài nguyên bản, mô hình lực kéo tích hợp cao su bao gồm một vòng tròn xoay bàn chân trước.&lt;/p&gt;&lt;p&gt;&lt;strong&gt;Chi tiết sản phẩm&lt;/strong&gt;&lt;/p&gt;&lt;ul&gt;&lt;li&gt;1- năm bảo hành chống thấm nước&lt;/li&gt;&lt;li&gt;2 bộ dây buộc&lt;ul&gt;&lt;li&gt;Hiển thị: Bạc kim loại/Bụi Photon/Trắng/Bạc kim loại&lt;/li&gt;&lt;li&gt;Phong cách: FD6815-001&lt;/li&gt ;&lt;/ul&gt;&lt;/li&gt;&lt;/ul&gt;', 'http://res.cloudinary.com/da5wewzih/image/upload/v1704270515/vzqfnuxgyczzazte698u.png', 'Một trong những lý do khiến MJ yêu thích chơi gôn đến vậy: Giống như việc nhìn vào gương.', 2160000.0, NULL, NULL, 1, '2024-01-03 01:28:34', '2024-01-03 01:28:34', 0, 0),
(14, 'Air Jordan 1 Retro High OG', '&lt;p&gt;Bạn muốn thoải mái suốt ngày, mỗi ngày đúng không? Chúng tôi có sản phẩm cho bạn. Phiên bản AJ1 Low mang lại vẻ đẹp của phiên bản gốc dành cho bóng rổ, nhưng nhẹ hơn và có hình dáng mảnh mai hơn. Ngoài ra, chúng phù hợp với mọi trang phục chỉ cần ràng buộc dây giày và đi.&lt;/p&gt;&lt;p&gt;&lt;br&gt;&amp;nbsp;&lt;/p&gt;&lt;p&gt;&lt;strong&gt;Lợi ích&lt;/strong&gt;&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Công nghệ Nike Air hấp thụ va chạm để mang lại sự êm ái mỗi bước đi.&lt;/li&gt;&lt;li&gt;Chất liệu da thật và da tổng hợp kết hợp với vật liệu dệt nhẹ nhàng mang lại độ bền cao và sự vừa vặn tốt.&lt;/li&gt;&lt;li&gt;Đế cao su cung cấp độ bám đầy đủ.&lt;/li&gt;&lt;/ul&gt;&lt;p&gt;&lt;br&gt;&amp;nbsp;&lt;/p&gt;&lt;p&gt;&lt;strong&gt;Thông tin sản phẩm&lt;/strong&gt;&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Logo Jumpman trên lưỡi giày&lt;/li&gt;&lt;li&gt;Logo Swoosh được may chắc&lt;ul&gt;&lt;li&gt;Hiển thị: Đen/Đen/Trắng&lt;/li&gt;&lt;li&gt;Kiểu dáng: DV0990-001&lt;/li&gt;&lt;/ul&gt;&lt;/li&gt;&lt;/ul&gt;', 'http://res.cloudinary.com/da5wewzih/image/upload/v1713722698/bhljw9mpo4fzo0xl4khn.png', 'Bạn muốn thoải mái suốt ngày, mỗi ngày đúng không? Chúng tôi có sản phẩm cho bạn.', 1700000.0, NULL, NULL, 2, '2024-04-21 11:04:48', '2024-04-21 11:04:48', 0, 0),
(15, 'Cosmic Unity 3', '&lt;p&gt;Bạn muốn thoải mái suốt ngày, mỗi ngày đúng không? Chúng tôi có sản phẩm cho bạn. Phiên bản AJ1 Low mang lại vẻ đẹp của phiên bản gốc dành cho bóng rổ, nhưng nhẹ hơn và có hình dáng mảnh mai hơn. Ngoài ra, chúng phù hợp với mọi trang phục chỉ cần ràng buộc dây giày và đi.&lt;/p&gt;&lt;p&gt;&lt;br&gt;&amp;nbsp;&lt;/p&gt;&lt;p&gt;&lt;strong&gt;Lợi ích&lt;/strong&gt;&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Công nghệ Nike Air hấp thụ va chạm để mang lại sự êm ái mỗi bước đi.&lt;/li&gt;&lt;li&gt;Chất liệu da thật và da tổng hợp kết hợp với vật liệu dệt nhẹ nhàng mang lại độ bền cao và sự vừa vặn tốt.&lt;/li&gt;&lt;li&gt;Đế cao su cung cấp độ bám đầy đủ.&lt;/li&gt;&lt;/ul&gt;&lt;p&gt;&lt;br&gt;&amp;nbsp;&lt;/p&gt;&lt;p&gt;&lt;strong&gt;Thông tin sản phẩm&lt;/strong&gt;&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Logo Jumpman trên lưỡi giày&lt;/li&gt;&lt;li&gt;Logo Swoosh được may chắc&lt;ul&gt;&lt;li&gt;Hiển thị: Đen/Đen/Trắng&lt;/li&gt;&lt;li&gt;Kiểu dáng: DV0990-001&lt;/li&gt;&lt;/ul&gt;&lt;/li&gt;&lt;/ul&gt;', 'http://res.cloudinary.com/da5wewzih/image/upload/v1713722833/msgdwh744fqeawb8vktj.png', 'Không có gì bằng bay, không có gì thoải mái bằng, không có gì được chứng minh.', 1900000.0, NULL, NULL, 2, '2024-04-21 11:07:04', '2024-04-21 11:07:04', 0, 0),
(16, 'Nike Air Max 90 GORE-TEX', '&lt;p&gt;Bạn muốn thoải mái suốt ngày, mỗi ngày đúng không? Chúng tôi có sản phẩm cho bạn. Phiên bản AJ1 Low mang lại vẻ đẹp của phiên bản gốc dành cho bóng rổ, nhưng nhẹ hơn và có hình dáng mảnh mai hơn. Ngoài ra, chúng phù hợp với mọi trang phục chỉ cần ràng buộc dây giày và đi.&lt;/p&gt;&lt;p&gt;&lt;br&gt;&amp;nbsp;&lt;/p&gt;&lt;p&gt;&lt;strong&gt;Lợi ích&lt;/strong&gt;&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Công nghệ Nike Air hấp thụ va chạm để mang lại sự êm ái mỗi bước đi.&lt;/li&gt;&lt;li&gt;Chất liệu da thật và da tổng hợp kết hợp với vật liệu dệt nhẹ nhàng mang lại độ bền cao và sự vừa vặn tốt.&lt;/li&gt;&lt;li&gt;Đế cao su cung cấp độ bám đầy đủ.&lt;/li&gt;&lt;/ul&gt;&lt;p&gt;&lt;br&gt;&amp;nbsp;&lt;/p&gt;&lt;p&gt;&lt;strong&gt;Thông tin sản phẩm&lt;/strong&gt;&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Logo Jumpman trên lưỡi giày&lt;/li&gt;&lt;li&gt;Logo Swoosh được may chắc&lt;ul&gt;&lt;li&gt;Hiển thị: Đen/Đen/Trắng&lt;/li&gt;&lt;li&gt;Kiểu dáng: DV0990-001&lt;/li&gt;&lt;/ul&gt;&lt;/li&gt;&lt;/ul&gt;', 'http://res.cloudinary.com/da5wewzih/image/upload/v1713725290/gc0pzdmt8ipyvrlycejd.png', 'Bạn muốn thoải m&aacute;i suốt ng&agrave;y, mỗi ng&agrave;y đ&uacute;ng kh&ocirc;ng? Ch&uacute;ng t&ocirc;i c&oacute; sản phẩm cho bạn.', 1320000.0, NULL, NULL, 3, '2024-04-21 11:48:13', '2024-04-21 11:48:13', 0, 0),
(17, 'Nike Air Max Alpha Trainer 5', '&lt;p&gt;&lt;strong&gt;Giao hàng miễn phí*&lt;/strong&gt;&lt;/p&gt;&lt;p&gt;Để có được thông tin giao hàng chính xác &lt;a href=&quot;/user/address&quot;&gt;Chỉnh sửa Địa điểm&lt;/a&gt; &lt;/p&gt;&lt;p&gt;&amp;nbsp;&lt;/p&gt;&lt;p&gt;Một trong những lý do khiến MJ yêu thích chơi gôn đến vậy: Giống như việc nhìn vào gương. Đối thủ duy nhất mà anh ta nhìn thấy đang nhìn chằm chằm vào anh ta. Không có đồng đội để chơi. Không có hậu vệ nào để tấn công. Chỉ có anh ấy, cú swing của anh ấy và sân golf. Chiếc AJ1 High đặc biệt này, với lớp hoàn thiện bằng kim loại, các móc mạ crôm và các chi tiết Air Jordan bóng loáng, lấy cảm hứng từ động lực bên trong đã truyền cảm hứng cho cả MJ và chúng tôi không ngừng hoàn thiện hơn mỗi ngày.&lt;/p&gt;&lt;p&gt;&lt;strong&gt; AJ1 Design nguyên bản&lt;/strong&gt;&lt;/p&gt;&lt;p&gt;Da thật và tổng hợp cùng với khối màu đậm tái tạo lại vẻ cổ điển.&lt;/p&gt;&lt;p&gt;&lt;strong&gt;Đệm khí&lt;/strong&gt;&lt ;/p&gt;&lt;p&gt;Không khí được bao bọc ở đệm gót chân mỗi bước đi.&lt;/p&gt;&lt;p&gt;&lt;strong&gt;Heritage Traction&lt;/strong&gt;&lt;/p&gt;&lt;p&gt;Dựa trên thiết kế của đế ngoài nguyên bản, mô hình lực kéo tích hợp cao su bao gồm một vòng tròn xoay bàn chân trước.&lt;/p&gt;&lt;p&gt;&lt;strong&gt;Chi tiết sản phẩm&lt;/strong&gt;&lt;/p&gt;&lt;ul&gt;&lt;li&gt;1- năm bảo hành chống thấm nước&lt;/li&gt;&lt;li&gt;2 bộ dây buộc&lt;ul&gt;&lt;li&gt;Hiển thị: Bạc kim loại/Bụi Photon/Trắng/Bạc kim loại&lt;/li&gt;&lt;li&gt;Phong cách: FD6815-001&lt;/li&gt ;&lt;/ul&gt;&lt;/li&gt;&lt;/ul&gt;', 'http://res.cloudinary.com/da5wewzih/image/upload/v1713725670/xfa4rs0nfjk3fyyzdnzj.png', 'Bạn muốn thoải m&aacute;i suốt ng&agrave;y, mỗi ng&agrave;y đ&uacute;ng kh&ocirc;ng? Ch&uacute;ng t&ocirc;i c&oacute; sản phẩm cho bạn.', 1320000.0, NULL, NULL, 2, '2024-04-21 11:54:20', '2024-04-21 11:54:20', 0, 0),
(18, 'Nike Air Max Dn', '&lt;p&gt;&lt;strong&gt;Giao hàng miễn phí*&lt;/strong&gt;&lt;/p&gt;&lt;p&gt;Để có được thông tin giao hàng chính xác &lt;a href=&quot;/user/address&quot;&gt;Chỉnh sửa Địa điểm&lt;/a&gt; &lt;/p&gt;&lt;p&gt;&amp;nbsp;&lt;/p&gt;&lt;p&gt;Một trong những lý do khiến MJ yêu thích chơi gôn đến vậy: Giống như việc nhìn vào gương. Đối thủ duy nhất mà anh ta nhìn thấy đang nhìn chằm chằm vào anh ta. Không có đồng đội để chơi. Không có hậu vệ nào để tấn công. Chỉ có anh ấy, cú swing của anh ấy và sân golf. Chiếc AJ1 High đặc biệt này, với lớp hoàn thiện bằng kim loại, các móc mạ crôm và các chi tiết Air Jordan bóng loáng, lấy cảm hứng từ động lực bên trong đã truyền cảm hứng cho cả MJ và chúng tôi không ngừng hoàn thiện hơn mỗi ngày.&lt;/p&gt;&lt;p&gt;&lt;strong&gt; AJ1 Design nguyên bản&lt;/strong&gt;&lt;/p&gt;&lt;p&gt;Da thật và tổng hợp cùng với khối màu đậm tái tạo lại vẻ cổ điển.&lt;/p&gt;&lt;p&gt;&lt;strong&gt;Đệm khí&lt;/strong&gt;&lt ;/p&gt;&lt;p&gt;Không khí được bao bọc ở đệm gót chân mỗi bước đi.&lt;/p&gt;&lt;p&gt;&lt;strong&gt;Heritage Traction&lt;/strong&gt;&lt;/p&gt;&lt;p&gt;Dựa trên thiết kế của đế ngoài nguyên bản, mô hình lực kéo tích hợp cao su bao gồm một vòng tròn xoay bàn chân trước.&lt;/p&gt;&lt;p&gt;&lt;strong&gt;Chi tiết sản phẩm&lt;/strong&gt;&lt;/p&gt;&lt;ul&gt;&lt;li&gt;1- năm bảo hành chống thấm nước&lt;/li&gt;&lt;li&gt;2 bộ dây buộc&lt;ul&gt;&lt;li&gt;Hiển thị: Bạc kim loại/Bụi Photon/Trắng/Bạc kim loại&lt;/li&gt;&lt;li&gt;Phong cách: FD6815-001&lt;/li&gt ;&lt;/ul&gt;&lt;/li&gt;&lt;/ul&gt;', 'http://res.cloudinary.com/da5wewzih/image/upload/v1713725865/tziukyby4yecgakml5dh.png', 'Bạn muốn thoải m&aacute;i suốt ng&agrave;y, mỗi ng&agrave;y đ&uacute;ng kh&ocirc;ng? Ch&uacute;ng t&ocirc;i c&oacute; sản phẩm cho bạn.', 1617000.0, '', NULL, 2, '2024-04-21 11:57:36', '2024-04-21 11:57:45', 0, 0),
(19, 'Nike Dunk Low', '&lt;p&gt;&lt;strong&gt;Giao hàng miễn phí*&lt;/strong&gt;&lt;/p&gt;&lt;p&gt;Để có được thông tin giao hàng chính xác &lt;a href=&quot;/user/address&quot;&gt;Chỉnh sửa Địa điểm&lt;/a&gt; &lt;/p&gt;&lt;p&gt;Với những đường nét thiết kế quen thuộc, tính thẩm mỹ của đường đua truyền thống và lớp đệm Max Air có thể nhìn thấy được, Nike Air Max SC là cách hoàn hảo để hoàn thiện bất kỳ trang phục nào. Da mịn và vải dệt kim nhẹ tăng thêm độ sâu và độ bền trong khi bộ phận Air màu ở gót chân làm cho ngày của bạn tươi sáng hơn sau mỗi bước đi.&lt;/p&gt;&lt;p&gt;&lt;strong&gt;Lợi ích&lt;/strong&gt;&lt;/p&gt;&lt; ul&gt;&lt;li&gt;Da kết hợp với vải dệt kim và lưới thoáng mát để tạo nên kết cấu bền bỉ, thoáng khí và đủ thoải mái để mang cả ngày.&lt;/li&gt;&lt;li&gt;Được thiết kế ban đầu để chạy bộ, bộ phận Max Air ở gót chân mang lại khả năng giảm chấn nhẹ với mọi hoạt động bước.&lt;/li&gt;&lt;li&gt;Đế giữa bằng xốp bổ sung khả năng giảm chấn bền lâu.&lt;/li&gt;&lt;li&gt;Đế ngoài cao su mang lại lực kéo và độ bền.&lt;ul&gt;&lt;li&gt;Hiển thị: White/Light Lemon Twist/ Fireberry/Blue Tint&lt;/li&gt;&lt;li&gt;Phong cách: FQ8886-100&lt;/li&gt;&lt;/ul&gt;&lt;/li&gt;&lt;/ul&gt;&lt;p&gt;&lt;strong&gt;Nike Air Max Origins&lt;/ mạnh mẽ&gt;&lt;/p&gt;&lt;p&gt;Công nghệ Revolutionary Air lần đầu tiên được đưa vào giày Nike vào năm 1978. Năm 1987, Air Max 1 ra mắt với công nghệ Air có thể nhìn thấy ở gót chân, mang đến cho người hâm mộ nhiều thứ hơn là chỉ cảm nhận về đệm Air&mdash ;đột nhiên họ có thể nhìn thấy nó. Kể từ đó, giày Air Max thế hệ tiếp theo đã trở thành điểm nhấn với các vận động viên và nhà sưu tập nhờ mang đến sự kết hợp màu sắc nổi bật và lớp đệm nhẹ, đáng tin cậy.&lt;/p&gt;&lt;p&gt;&amp;nbsp;&lt;/p&gt;', 'http://res.cloudinary.com/da5wewzih/image/upload/v1713725955/b79wtbtujvlvln1q026d.png', 'Bạn muốn thoải m&aacute;i suốt ng&agrave;y, mỗi ng&agrave;y đ&uacute;ng kh&ocirc;ng? Ch&uacute;ng t&ocirc;i c&oacute; sản phẩm cho bạn.', 900000.0, '', NULL, 4, '2024-04-21 11:59:06', '2024-04-21 11:59:13', 0, 0),
(20, 'Nike Flex Runner 3', '&lt;p&gt;&lt;strong&gt;Giao hàng miễn phí*&lt;/strong&gt;&lt;/p&gt;&lt;p&gt;Để có được thông tin giao hàng chính xác &lt;a href=&quot;/user/address&quot;&gt;Chỉnh sửa Địa điểm&lt;/a&gt; &lt;/p&gt;&lt;p&gt;Với những đường nét thiết kế quen thuộc, tính thẩm mỹ của đường đua truyền thống và lớp đệm Max Air có thể nhìn thấy được, Nike Air Max SC là cách hoàn hảo để hoàn thiện bất kỳ trang phục nào. Da mịn và vải dệt kim nhẹ tăng thêm độ sâu và độ bền trong khi bộ phận Air màu ở gót chân làm cho ngày của bạn tươi sáng hơn sau mỗi bước đi.&lt;/p&gt;&lt;p&gt;&lt;strong&gt;Lợi ích&lt;/strong&gt;&lt;/p&gt;&lt; ul&gt;&lt;li&gt;Da kết hợp với vải dệt kim và lưới thoáng mát để tạo nên kết cấu bền bỉ, thoáng khí và đủ thoải mái để mang cả ngày.&lt;/li&gt;&lt;li&gt;Được thiết kế ban đầu để chạy bộ, bộ phận Max Air ở gót chân mang lại khả năng giảm chấn nhẹ với mọi hoạt động bước.&lt;/li&gt;&lt;li&gt;Đế giữa bằng xốp bổ sung khả năng giảm chấn bền lâu.&lt;/li&gt;&lt;li&gt;Đế ngoài cao su mang lại lực kéo và độ bền.&lt;ul&gt;&lt;li&gt;Hiển thị: White/Light Lemon Twist/ Fireberry/Blue Tint&lt;/li&gt;&lt;li&gt;Phong cách: FQ8886-100&lt;/li&gt;&lt;/ul&gt;&lt;/li&gt;&lt;/ul&gt;&lt;p&gt;&lt;strong&gt;Nike Air Max Origins&lt;/ mạnh mẽ&gt;&lt;/p&gt;&lt;p&gt;Công nghệ Revolutionary Air lần đầu tiên được đưa vào giày Nike vào năm 1978. Năm 1987, Air Max 1 ra mắt với công nghệ Air có thể nhìn thấy ở gót chân, mang đến cho người hâm mộ nhiều thứ hơn là chỉ cảm nhận về đệm Air&mdash ;đột nhiên họ có thể nhìn thấy nó. Kể từ đó, giày Air Max thế hệ tiếp theo đã trở thành điểm nhấn với các vận động viên và nhà sưu tập nhờ mang đến sự kết hợp màu sắc nổi bật và lớp đệm nhẹ, đáng tin cậy.&lt;/p&gt;&lt;p&gt;&amp;nbsp;&lt;/p&gt;', 'http://res.cloudinary.com/da5wewzih/image/upload/v1713726032/v1xtk4qoefpli9nzk9ub.png', 'Bạn muốn thoải m&aacute;i suốt ng&agrave;y, mỗi ng&agrave;y đ&uacute;ng kh&ocirc;ng? Ch&uacute;ng t&ocirc;i c&oacute; sản phẩm cho bạn.', 1450000.0, '', NULL, 5, '2024-04-21 12:00:23', '2024-04-21 12:00:32', 0, 0),
(21, 'Nike Free Metcon 5', '&lt;p&gt;&lt;strong&gt;Giao hàng miễn phí*&lt;/strong&gt;&lt;/p&gt;&lt;p&gt;Để có được thông tin giao hàng chính xác &lt;a href=&quot;/user/address&quot;&gt;Chỉnh sửa Địa điểm&lt;/a&gt; &lt;/p&gt;&lt;p&gt;Với những đường nét thiết kế quen thuộc, tính thẩm mỹ của đường đua truyền thống và lớp đệm Max Air có thể nhìn thấy được, Nike Air Max SC là cách hoàn hảo để hoàn thiện bất kỳ trang phục nào. Da mịn và vải dệt kim nhẹ tăng thêm độ sâu và độ bền trong khi bộ phận Air màu ở gót chân làm cho ngày của bạn tươi sáng hơn sau mỗi bước đi.&lt;/p&gt;&lt;p&gt;&lt;strong&gt;Lợi ích&lt;/strong&gt;&lt;/p&gt;&lt; ul&gt;&lt;li&gt;Da kết hợp với vải dệt kim và lưới thoáng mát để tạo nên kết cấu bền bỉ, thoáng khí và đủ thoải mái để mang cả ngày.&lt;/li&gt;&lt;li&gt;Được thiết kế ban đầu để chạy bộ, bộ phận Max Air ở gót chân mang lại khả năng giảm chấn nhẹ với mọi hoạt động bước.&lt;/li&gt;&lt;li&gt;Đế giữa bằng xốp bổ sung khả năng giảm chấn bền lâu.&lt;/li&gt;&lt;li&gt;Đế ngoài cao su mang lại lực kéo và độ bền.&lt;ul&gt;&lt;li&gt;Hiển thị: White/Light Lemon Twist/ Fireberry/Blue Tint&lt;/li&gt;&lt;li&gt;Phong cách: FQ8886-100&lt;/li&gt;&lt;/ul&gt;&lt;/li&gt;&lt;/ul&gt;&lt;p&gt;&lt;strong&gt;Nike Air Max Origins&lt;/ mạnh mẽ&gt;&lt;/p&gt;&lt;p&gt;Công nghệ Revolutionary Air lần đầu tiên được đưa vào giày Nike vào năm 1978. Năm 1987, Air Max 1 ra mắt với công nghệ Air có thể nhìn thấy ở gót chân, mang đến cho người hâm mộ nhiều thứ hơn là chỉ cảm nhận về đệm Air&mdash ;đột nhiên họ có thể nhìn thấy nó. Kể từ đó, giày Air Max thế hệ tiếp theo đã trở thành điểm nhấn với các vận động viên và nhà sưu tập nhờ mang đến sự kết hợp màu sắc nổi bật và lớp đệm nhẹ, đáng tin cậy.&lt;/p&gt;&lt;p&gt;&amp;nbsp;&lt;/p&gt;', 'http://res.cloudinary.com/da5wewzih/image/upload/v1713726103/qfgrbpm6nvclxjaqzowg.png', 'Bạn muốn thoải m&aacute;i suốt ng&agrave;y, mỗi ng&agrave;y đ&uacute;ng kh&ocirc;ng? Ch&uacute;ng t&ocirc;i c&oacute; sản phẩm cho bạn.', 1510000.0, '', NULL, 7, '2024-04-21 12:01:33', '2024-04-21 12:01:38', 0, 0),
(22, 'Nike Invincible 3', '&lt;p&gt;Bạn muốn thoải mái suốt ngày, mỗi ngày đúng không? Chúng tôi có sản phẩm cho bạn. Phiên bản AJ1 Low mang lại vẻ đẹp của phiên bản gốc dành cho bóng rổ, nhưng nhẹ hơn và có hình dáng mảnh mai hơn. Ngoài ra, chúng phù hợp với mọi trang phục chỉ cần ràng buộc dây giày và đi.&lt;/p&gt;&lt;p&gt;&lt;br&gt;&amp;nbsp;&lt;/p&gt;&lt;p&gt;&lt;strong&gt;Lợi ích&lt;/strong&gt;&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Công nghệ Nike Air hấp thụ va chạm để mang lại sự êm ái mỗi bước đi.&lt;/li&gt;&lt;li&gt;Chất liệu da thật và da tổng hợp kết hợp với vật liệu dệt nhẹ nhàng mang lại độ bền cao và sự vừa vặn tốt.&lt;/li&gt;&lt;li&gt;Đế cao su cung cấp độ bám đầy đủ.&lt;/li&gt;&lt;/ul&gt;&lt;p&gt;&lt;br&gt;&amp;nbsp;&lt;/p&gt;&lt;p&gt;&lt;strong&gt;Thông tin sản phẩm&lt;/strong&gt;&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Logo Jumpman trên lưỡi giày&lt;/li&gt;&lt;li&gt;Logo Swoosh được may chắc&lt;ul&gt;&lt;li&gt;Hiển thị: Đen/Đen/Trắng&lt;/li&gt;&lt;li&gt;Kiểu dáng: DV0990-001&lt;/li&gt;&lt;/ul&gt;&lt;/li&gt;&lt;/ul&gt;', 'http://res.cloudinary.com/da5wewzih/image/upload/v1713726158/r4dibmz1w4xmmapo3axd.png', 'Bạn muốn thoải m&aacute;i suốt ng&agrave;y, mỗi ng&agrave;y đ&uacute;ng kh&ocirc;ng? Ch&uacute;ng t&ocirc;i c&oacute; sản phẩm cho bạn.', 1510000.0, '', NULL, 5, '2024-04-21 12:02:29', '2024-04-21 12:02:35', 0, 1),
(23, 'Nike Omni Multi-Court', '&lt;p&gt;Bạn muốn thoải mái suốt ngày, mỗi ngày đúng không? Chúng tôi có sản phẩm cho bạn. Phiên bản AJ1 Low mang lại vẻ đẹp của phiên bản gốc dành cho bóng rổ, nhưng nhẹ hơn và có hình dáng mảnh mai hơn. Ngoài ra, chúng phù hợp với mọi trang phục chỉ cần ràng buộc dây giày và đi.&lt;/p&gt;&lt;p&gt;&lt;br&gt;&amp;nbsp;&lt;/p&gt;&lt;p&gt;&lt;strong&gt;Lợi ích&lt;/strong&gt;&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Công nghệ Nike Air hấp thụ va chạm để mang lại sự êm ái mỗi bước đi.&lt;/li&gt;&lt;li&gt;Chất liệu da thật và da tổng hợp kết hợp với vật liệu dệt nhẹ nhàng mang lại độ bền cao và sự vừa vặn tốt.&lt;/li&gt;&lt;li&gt;Đế cao su cung cấp độ bám đầy đủ.&lt;/li&gt;&lt;/ul&gt;&lt;p&gt;&lt;br&gt;&amp;nbsp;&lt;/p&gt;&lt;p&gt;&lt;strong&gt;Thông tin sản phẩm&lt;/strong&gt;&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Logo Jumpman trên lưỡi giày&lt;/li&gt;&lt;li&gt;Logo Swoosh được may chắc&lt;ul&gt;&lt;li&gt;Hiển thị: Đen/Đen/Trắng&lt;/li&gt;&lt;li&gt;Kiểu dáng: DV0990-001&lt;/li&gt;&lt;/ul&gt;&lt;/li&gt;&lt;/ul&gt;', 'http://res.cloudinary.com/da5wewzih/image/upload/v1713726205/kntcjqdps5k4mjdkhvgi.png', 'Bạn muốn thoải m&aacute;i suốt ng&agrave;y, mỗi ng&agrave;y đ&uacute;ng kh&ocirc;ng? Ch&uacute;ng t&ocirc;i c&oacute; sản phẩm cho bạn.', 1510000.0, '', NULL, 4, '2024-04-21 12:03:15', '2024-04-21 12:03:21', 0, 0),
(24, 'Nike Pegasus Trail 4', '&lt;p&gt;&amp;amp;lt;p&amp;amp;gt;Bạn muốn thoải m&aacute;i suốt ng&agrave;y, mỗi ng&agrave;y đ&uacute;ng kh&ocirc;ng? Ch&uacute;ng t&ocirc;i c&oacute; sản phẩm cho bạn. Phi&ecirc;n bản AJ1 Low mang lại vẻ đẹp của phi&ecirc;n bản gốc d&agrave;nh cho b&oacute;ng rổ, nhưng nhẹ hơn v&agrave; c&oacute; h&igrave;nh d&aacute;ng mảnh mai hơn. Ngo&agrave;i ra, ch&uacute;ng ph&ugrave; hợp với mọi trang phục chỉ cần r&agrave;ng buộc d&acirc;y gi&agrave;y v&agrave; đi.&amp;amp;lt;/p&amp;amp;gt;&amp;amp;lt;p&amp;amp;gt;&amp;amp;lt;br&amp;amp;gt;&amp;amp;amp;nbsp;&amp;amp;lt;/p&amp;amp;gt;&amp;amp;lt;p&amp;amp;gt;&amp;amp;lt;strong&amp;amp;gt;Lợi &iacute;ch&amp;amp;lt;/strong&amp;amp;gt;&amp;amp;lt;/p&amp;amp;gt;&amp;amp;lt;ul&amp;amp;gt;&amp;amp;lt;li&amp;amp;gt;C&ocirc;ng nghệ Nike Air hấp thụ va chạm để mang lại sự &ecirc;m &aacute;i mỗi bước đi.&amp;amp;lt;/li&amp;amp;gt;&amp;amp;lt;li&amp;amp;gt;Chất liệu da thật v&agrave; da tổng hợp kết hợp với vật liệu dệt nhẹ nh&agrave;ng mang lại độ bền cao v&agrave; sự vừa vặn tốt.&amp;amp;lt;/li&amp;amp;gt;&amp;amp;lt;li&amp;amp;gt;Đế cao su cung cấp độ b&aacute;m đầy đủ.&amp;amp;lt;/li&amp;amp;gt;&amp;amp;lt;/ul&amp;amp;gt;&amp;amp;lt;p&amp;amp;gt;&amp;amp;lt;br&amp;amp;gt;&amp;amp;amp;nbsp;&amp;amp;lt;/p&amp;amp;gt;&amp;amp;lt;p&amp;amp;gt;&amp;amp;lt;strong&amp;amp;gt;Th&ocirc;ng tin sản phẩm&amp;amp;lt;/strong&amp;amp;gt;&amp;amp;lt;/p&amp;amp;gt;&amp;amp;lt;ul&amp;amp;gt;&amp;amp;lt;li&amp;amp;gt;Logo Jumpman tr&ecirc;n lưỡi gi&agrave;y&amp;amp;lt;/li&amp;amp;gt;&amp;amp;lt;li&amp;amp;gt;Logo Swoosh được may chắc&amp;amp;lt;ul&amp;amp;gt;&amp;amp;lt;li&amp;amp;gt;Hiển thị: Đen/Đen/Trắng&amp;amp;lt;/li&amp;amp;gt;&amp;amp;lt;li&amp;amp;gt;Kiểu d&aacute;ng: DV0990-001&amp;amp;lt;/li&amp;amp;gt;&amp;amp;lt;/ul&amp;amp;gt;&amp;amp;lt;/li&amp;amp;gt;&amp;amp;lt;/ul&amp;amp;gt;&lt;/p&gt;', 'http://res.cloudinary.com/da5wewzih/image/upload/v1713726262/gg5vwydwv6haqeowb33k.png', 'Bạn muốn thoải m&aacute;i suốt ng&agrave;y, mỗi ng&agrave;y đ&uacute;ng kh&ocirc;ng? Ch&uacute;ng t&ocirc;i c&oacute; sản phẩm cho bạn.', 1260000.0, '', NULL, 4, '2024-04-21 12:04:13', '2024-04-21 12:04:19', 0, 0),
(25, 'Nike SB Day One', '&lt;p&gt;Bạn muốn thoải mái suốt ngày, mỗi ngày đúng không? Chúng tôi có sản phẩm cho bạn. Phiên bản AJ1 Low mang lại vẻ đẹp của phiên bản gốc dành cho bóng rổ, nhưng nhẹ hơn và có hình dáng mảnh mai hơn. Ngoài ra, chúng phù hợp với mọi trang phục chỉ cần ràng buộc dây giày và đi.&lt;/p&gt;&lt;p&gt;&lt;br&gt;&amp;nbsp;&lt;/p&gt;&lt;p&gt;&lt;strong&gt;Lợi ích&lt;/strong&gt;&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Công nghệ Nike Air hấp thụ va chạm để mang lại sự êm ái mỗi bước đi.&lt;/li&gt;&lt;li&gt;Chất liệu da thật và da tổng hợp kết hợp với vật liệu dệt nhẹ nhàng mang lại độ bền cao và sự vừa vặn tốt.&lt;/li&gt;&lt;li&gt;Đế cao su cung cấp độ bám đầy đủ.&lt;/li&gt;&lt;/ul&gt;&lt;p&gt;&lt;br&gt;&amp;nbsp;&lt;/p&gt;&lt;p&gt;&lt;strong&gt;Thông tin sản phẩm&lt;/strong&gt;&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Logo Jumpman trên lưỡi giày&lt;/li&gt;&lt;li&gt;Logo Swoosh được may chắc&lt;ul&gt;&lt;li&gt;Hiển thị: Đen/Đen/Trắng&lt;/li&gt;&lt;li&gt;Kiểu dáng: DV0990-001&lt;/li&gt;&lt;/ul&gt;&lt;/li&gt;&lt;/ul&gt;', 'http://res.cloudinary.com/da5wewzih/image/upload/v1713726309/fv52urarpzan2fcxykus.png', 'Bạn muốn thoải m&aacute;i suốt ng&agrave;y, mỗi ng&agrave;y đ&uacute;ng kh&ocirc;ng? Ch&uacute;ng t&ocirc;i c&oacute; sản phẩm cho bạn.', 1000000.0, '', NULL, 4, '2024-04-21 12:05:00', '2024-04-21 12:05:11', 0, 0),
(26, 'Nike Vaporfly 3', '&lt;p&gt;Bạn muốn thoải mái suốt ngày, mỗi ngày đúng không? Chúng tôi có sản phẩm cho bạn. Phiên bản AJ1 Low mang lại vẻ đẹp của phiên bản gốc dành cho bóng rổ, nhưng nhẹ hơn và có hình dáng mảnh mai hơn. Ngoài ra, chúng phù hợp với mọi trang phục chỉ cần ràng buộc dây giày và đi.&lt;/p&gt;&lt;p&gt;&lt;br&gt;&amp;nbsp;&lt;/p&gt;&lt;p&gt;&lt;strong&gt;Lợi ích&lt;/strong&gt;&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Công nghệ Nike Air hấp thụ va chạm để mang lại sự êm ái mỗi bước đi.&lt;/li&gt;&lt;li&gt;Chất liệu da thật và da tổng hợp kết hợp với vật liệu dệt nhẹ nhàng mang lại độ bền cao và sự vừa vặn tốt.&lt;/li&gt;&lt;li&gt;Đế cao su cung cấp độ bám đầy đủ.&lt;/li&gt;&lt;/ul&gt;&lt;p&gt;&lt;br&gt;&amp;nbsp;&lt;/p&gt;&lt;p&gt;&lt;strong&gt;Thông tin sản phẩm&lt;/strong&gt;&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Logo Jumpman trên lưỡi giày&lt;/li&gt;&lt;li&gt;Logo Swoosh được may chắc&lt;ul&gt;&lt;li&gt;Hiển thị: Đen/Đen/Trắng&lt;/li&gt;&lt;li&gt;Kiểu dáng: DV0990-001&lt;/li&gt;&lt;/ul&gt;&lt;/li&gt;&lt;/ul&gt;', 'http://res.cloudinary.com/da5wewzih/image/upload/v1713726398/cykyeweo71id4iw4oyur.png', 'Bạn muốn thoải m&aacute;i suốt ng&agrave;y, mỗi ng&agrave;y đ&uacute;ng kh&ocirc;ng? Ch&uacute;ng t&ocirc;i c&oacute; sản phẩm cho bạn.', 999000.0, '', NULL, 6, '2024-04-21 12:06:29', '2024-04-21 12:06:35', 0, 0),
(27, 'Nike Winflo 10', '&lt;p&gt;Bạn muốn thoải mái suốt ngày, mỗi ngày đúng không? Chúng tôi có sản phẩm cho bạn. Phiên bản AJ1 Low mang lại vẻ đẹp của phiên bản gốc dành cho bóng rổ, nhưng nhẹ hơn và có hình dáng mảnh mai hơn. Ngoài ra, chúng phù hợp với mọi trang phục chỉ cần ràng buộc dây giày và đi.&lt;/p&gt;&lt;p&gt;&lt;br&gt;&amp;nbsp;&lt;/p&gt;&lt;p&gt;&lt;strong&gt;Lợi ích&lt;/strong&gt;&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Công nghệ Nike Air hấp thụ va chạm để mang lại sự êm ái mỗi bước đi.&lt;/li&gt;&lt;li&gt;Chất liệu da thật và da tổng hợp kết hợp với vật liệu dệt nhẹ nhàng mang lại độ bền cao và sự vừa vặn tốt.&lt;/li&gt;&lt;li&gt;Đế cao su cung cấp độ bám đầy đủ.&lt;/li&gt;&lt;/ul&gt;&lt;p&gt;&lt;br&gt;&amp;nbsp;&lt;/p&gt;&lt;p&gt;&lt;strong&gt;Thông tin sản phẩm&lt;/strong&gt;&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Logo Jumpman trên lưỡi giày&lt;/li&gt;&lt;li&gt;Logo Swoosh được may chắc&lt;ul&gt;&lt;li&gt;Hiển thị: Đen/Đen/Trắng&lt;/li&gt;&lt;li&gt;Kiểu dáng: DV0990-001&lt;/li&gt;&lt;/ul&gt;&lt;/li&gt;&lt;/ul&gt;', 'http://res.cloudinary.com/da5wewzih/image/upload/v1713726465/ogsv89vpdnwr1gof02kr.png', 'Bạn muốn thoải m&aacute;i suốt ng&agrave;y, mỗi ng&agrave;y đ&uacute;ng kh&ocirc;ng? Ch&uacute;ng t&ocirc;i c&oacute; sản phẩm cho bạn.', 2000000.0, '', NULL, 7, '2024-04-21 12:07:36', '2024-04-21 12:07:41', 0, 0),
(28, 'Nike Zoom HyperAce 2', '&lt;p&gt;Bạn muốn thoải mái suốt ngày, mỗi ngày đúng không? Chúng tôi có sản phẩm cho bạn. Phiên bản AJ1 Low mang lại vẻ đẹp của phiên bản gốc dành cho bóng rổ, nhưng nhẹ hơn và có hình dáng mảnh mai hơn. Ngoài ra, chúng phù hợp với mọi trang phục chỉ cần ràng buộc dây giày và đi.&lt;/p&gt;&lt;p&gt;&lt;br&gt;&amp;nbsp;&lt;/p&gt;&lt;p&gt;&lt;strong&gt;Lợi ích&lt;/strong&gt;&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Công nghệ Nike Air hấp thụ va chạm để mang lại sự êm ái mỗi bước đi.&lt;/li&gt;&lt;li&gt;Chất liệu da thật và da tổng hợp kết hợp với vật liệu dệt nhẹ nhàng mang lại độ bền cao và sự vừa vặn tốt.&lt;/li&gt;&lt;li&gt;Đế cao su cung cấp độ bám đầy đủ.&lt;/li&gt;&lt;/ul&gt;&lt;p&gt;&lt;br&gt;&amp;nbsp;&lt;/p&gt;&lt;p&gt;&lt;strong&gt;Thông tin sản phẩm&lt;/strong&gt;&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Logo Jumpman trên lưỡi giày&lt;/li&gt;&lt;li&gt;Logo Swoosh được may chắc&lt;ul&gt;&lt;li&gt;Hiển thị: Đen/Đen/Trắng&lt;/li&gt;&lt;li&gt;Kiểu dáng: DV0990-001&lt;/li&gt;&lt;/ul&gt;&lt;/li&gt;&lt;/ul&gt;', 'http://res.cloudinary.com/da5wewzih/image/upload/v1713726561/grdvdiudgw8bpq9rufav.png', 'Bạn muốn thoải m&aacute;i suốt ng&agrave;y, mỗi ng&agrave;y đ&uacute;ng kh&ocirc;ng? Ch&uacute;ng t&ocirc;i c&oacute; sản phẩm cho bạn.', 4300000.0, '', NULL, 5, '2024-04-21 12:09:11', '2024-04-21 12:09:18', 0, 0),
(29, 'Nike Zoom Vomero 5 SE', '&lt;p&gt;Bạn muốn thoải mái suốt ngày, mỗi ngày đúng không? Chúng tôi có sản phẩm cho bạn. Phiên bản AJ1 Low mang lại vẻ đẹp của phiên bản gốc dành cho bóng rổ, nhưng nhẹ hơn và có hình dáng mảnh mai hơn. Ngoài ra, chúng phù hợp với mọi trang phục chỉ cần ràng buộc dây giày và đi.&lt;/p&gt;&lt;p&gt;&lt;br&gt;&amp;nbsp;&lt;/p&gt;&lt;p&gt;&lt;strong&gt;Lợi ích&lt;/strong&gt;&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Công nghệ Nike Air hấp thụ va chạm để mang lại sự êm ái mỗi bước đi.&lt;/li&gt;&lt;li&gt;Chất liệu da thật và da tổng hợp kết hợp với vật liệu dệt nhẹ nhàng mang lại độ bền cao và sự vừa vặn tốt.&lt;/li&gt;&lt;li&gt;Đế cao su cung cấp độ bám đầy đủ.&lt;/li&gt;&lt;/ul&gt;&lt;p&gt;&lt;br&gt;&amp;nbsp;&lt;/p&gt;&lt;p&gt;&lt;strong&gt;Thông tin sản phẩm&lt;/strong&gt;&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Logo Jumpman trên lưỡi giày&lt;/li&gt;&lt;li&gt;Logo Swoosh được may chắc&lt;ul&gt;&lt;li&gt;Hiển thị: Đen/Đen/Trắng&lt;/li&gt;&lt;li&gt;Kiểu dáng: DV0990-001&lt;/li&gt;&lt;/ul&gt;&lt;/li&gt;&lt;/ul&gt;', 'http://res.cloudinary.com/da5wewzih/image/upload/v1713726615/wzj2lti74ptzjqntmwdr.png', 'Bạn muốn thoải m&aacute;i suốt ng&agrave;y, mỗi ng&agrave;y đ&uacute;ng kh&ocirc;ng? Ch&uacute;ng t&ocirc;i c&oacute; sản phẩm cho bạn.', 2700000.0, '', NULL, 4, '2024-04-21 12:10:06', '2024-04-21 12:10:13', 0, 0),
(30, 'Sabrina 1 (Team)', '&lt;p&gt;Bạn muốn thoải mái suốt ngày, mỗi ngày đúng không? Chúng tôi có sản phẩm cho bạn. Phiên bản AJ1 Low mang lại vẻ đẹp của phiên bản gốc dành cho bóng rổ, nhưng nhẹ hơn và có hình dáng mảnh mai hơn. Ngoài ra, chúng phù hợp với mọi trang phục chỉ cần ràng buộc dây giày và đi.&lt;/p&gt;&lt;p&gt;&lt;br&gt;&amp;nbsp;&lt;/p&gt;&lt;p&gt;&lt;strong&gt;Lợi ích&lt;/strong&gt;&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Công nghệ Nike Air hấp thụ va chạm để mang lại sự êm ái mỗi bước đi.&lt;/li&gt;&lt;li&gt;Chất liệu da thật và da tổng hợp kết hợp với vật liệu dệt nhẹ nhàng mang lại độ bền cao và sự vừa vặn tốt.&lt;/li&gt;&lt;li&gt;Đế cao su cung cấp độ bám đầy đủ.&lt;/li&gt;&lt;/ul&gt;&lt;p&gt;&lt;br&gt;&amp;nbsp;&lt;/p&gt;&lt;p&gt;&lt;strong&gt;Thông tin sản phẩm&lt;/strong&gt;&lt;/p&gt;&lt;ul&gt;&lt;li&gt;Logo Jumpman trên lưỡi giày&lt;/li&gt;&lt;li&gt;Logo Swoosh được may chắc&lt;ul&gt;&lt;li&gt;Hiển thị: Đen/Đen/Trắng&lt;/li&gt;&lt;li&gt;Kiểu dáng: DV0990-001&lt;/li&gt;&lt;/ul&gt;&lt;/li&gt;&lt;/ul&gt;', 'http://res.cloudinary.com/da5wewzih/image/upload/v1713726694/bsji4vuuidbixhk90v2e.png', 'Bạn muốn thoải m&aacute;i suốt ng&agrave;y, mỗi ng&agrave;y đ&uacute;ng kh&ocirc;ng? Ch&uacute;ng t&ocirc;i c&oacute; sản phẩm cho bạn.', 3500000.0, '', NULL, 6, '2024-04-21 12:11:24', '2024-04-21 12:11:33', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `product_images`
--

CREATE TABLE `product_images` (
  `id` bigint(20) NOT NULL,
  `imageUrl` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `productId` bigint(20) DEFAULT NULL,
  `createAt` timestamp NULL DEFAULT current_timestamp(),
  `updateAt` timestamp NULL DEFAULT current_timestamp(),
  `isDeleted` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product_images`
--

INSERT INTO `product_images` (`id`, `imageUrl`, `productId`, `createAt`, `updateAt`, `isDeleted`) VALUES
(1, 'http://res.cloudinary.com/da5wewzih/image/upload/v1704212062/tud3vdjpcvo3xduowkki.webp', 1, '2024-01-02 09:14:22', '2024-01-02 09:14:22', 0),
(2, 'http://res.cloudinary.com/da5wewzih/image/upload/v1704212065/d9lzteivb6jvhloba09t.webp', 1, '2024-01-02 09:14:25', '2024-01-02 09:14:25', 0),
(3, 'http://res.cloudinary.com/da5wewzih/image/upload/v1704212068/bdtrn5m3yauabs0auwzu.jpg', 1, '2024-01-02 09:14:28', '2024-01-02 09:14:28', 0),
(5, 'http://res.cloudinary.com/da5wewzih/image/upload/v1704215359/no6sjoahkjvgvzqnypte.webp', 2, '2024-01-02 10:09:19', '2024-01-02 10:09:19', 0),
(6, 'http://res.cloudinary.com/da5wewzih/image/upload/v1704215362/sbdjsryaqkczs9ouyaeb.webp', 2, '2024-01-02 10:09:22', '2024-01-02 10:09:22', 0),
(7, 'http://res.cloudinary.com/da5wewzih/image/upload/v1704215365/ims67scqedezkkjevsya.webp', 2, '2024-01-02 10:09:24', '2024-01-02 10:09:24', 0),
(8, 'http://res.cloudinary.com/da5wewzih/image/upload/v1704215367/v4wa22furczvc5zj5ed6.webp', 2, '2024-01-02 10:09:27', '2024-01-02 10:09:27', 0),
(9, 'http://res.cloudinary.com/da5wewzih/image/upload/v1704233335/mcq62nibcg9aebukyikx.png', 3, '2024-01-02 15:08:55', '2024-01-02 15:08:55', 0),
(10, 'http://res.cloudinary.com/da5wewzih/image/upload/v1704233341/c9aqzef3nflaxp5b3qgq.png', 3, '2024-01-02 15:09:01', '2024-01-02 15:09:01', 0),
(11, 'http://res.cloudinary.com/da5wewzih/image/upload/v1704233693/ay0yiik1p3gtzr8qph8y.png', 4, '2024-01-02 15:15:00', '2024-01-02 15:15:00', 0),
(12, 'http://res.cloudinary.com/da5wewzih/image/upload/v1704233707/ujlef0wvnlbqmzjmtpxr.png', 4, '2024-01-02 15:15:15', '2024-01-02 15:15:15', 0),
(13, 'http://res.cloudinary.com/da5wewzih/image/upload/v1704234104/ayvcche62iszn9gbqsxn.png', 5, '2024-01-02 15:21:44', '2024-01-02 15:21:44', 0),
(14, 'http://res.cloudinary.com/da5wewzih/image/upload/v1704268743/nglns6zs8lh6fr2mpsar.png', 7, '2024-01-03 00:59:03', '2024-01-03 00:59:03', 0),
(15, 'http://res.cloudinary.com/da5wewzih/image/upload/v1704268747/dxyghctoerajrh9qebty.png', 7, '2024-01-03 00:59:06', '2024-01-03 00:59:06', 0),
(16, 'http://res.cloudinary.com/da5wewzih/image/upload/v1704268750/e31sfo9gpvxmirpopgms.png', 7, '2024-01-03 00:59:09', '2024-01-03 00:59:09', 0),
(17, 'http://res.cloudinary.com/da5wewzih/image/upload/v1704268754/b4uafpa8odfhxcanqx4j.png', 7, '2024-01-03 00:59:13', '2024-01-03 00:59:13', 0),
(18, 'http://res.cloudinary.com/da5wewzih/image/upload/v1704269229/viqoo2otlqc4tbfcxpdu.png', 8, '2024-01-03 01:07:09', '2024-01-03 01:07:09', 0),
(19, 'http://res.cloudinary.com/da5wewzih/image/upload/v1704269233/p5b9mdrfl18e3vb4d5zk.png', 8, '2024-01-03 01:07:13', '2024-01-03 01:07:13', 0),
(20, 'http://res.cloudinary.com/da5wewzih/image/upload/v1704269237/d9dxsjdtvwot9bjuqvtq.png', 8, '2024-01-03 01:07:16', '2024-01-03 01:07:16', 0),
(21, 'http://res.cloudinary.com/da5wewzih/image/upload/v1704269239/dw4kkchcfhb8c4tf9swd.jpg', 8, '2024-01-03 01:07:19', '2024-01-03 01:07:19', 0),
(22, 'http://res.cloudinary.com/da5wewzih/image/upload/v1704269659/inqwkloa7kbldec3e9i6.png', 9, '2024-01-03 01:14:18', '2024-01-03 01:14:18', 0),
(23, 'http://res.cloudinary.com/da5wewzih/image/upload/v1704269662/wifzbnkbnldppiuq7pfx.png', 9, '2024-01-03 01:14:21', '2024-01-03 01:14:21', 0),
(24, 'http://res.cloudinary.com/da5wewzih/image/upload/v1704269665/brh9alf2n6xlewb58zm3.png', 9, '2024-01-03 01:14:24', '2024-01-03 01:14:24', 0),
(25, 'http://res.cloudinary.com/da5wewzih/image/upload/v1704269669/ryem7cnz69qci1jj7dc6.png', 9, '2024-01-03 01:14:29', '2024-01-03 01:14:29', 0),
(26, 'http://res.cloudinary.com/da5wewzih/image/upload/v1704269815/ansruelqmpfxxvtmohlh.jpg', 10, '2024-01-03 01:16:55', '2024-01-03 01:16:55', 0),
(27, 'http://res.cloudinary.com/da5wewzih/image/upload/v1704269819/bmp8jxw0sghq1cnxlptp.png', 10, '2024-01-03 01:16:58', '2024-01-03 01:16:58', 0),
(28, 'http://res.cloudinary.com/da5wewzih/image/upload/v1704269822/hrf99ku4d0kzgskr6nqw.png', 10, '2024-01-03 01:17:01', '2024-01-03 01:17:01', 0),
(29, 'http://res.cloudinary.com/da5wewzih/image/upload/v1704269825/bizm5uhyidrr0cbv3cg7.png', 10, '2024-01-03 01:17:05', '2024-01-03 01:17:05', 0),
(30, 'http://res.cloudinary.com/da5wewzih/image/upload/v1704270015/gcrgvjswi9edw6ahwlnl.png', 11, '2024-01-03 01:20:15', '2024-01-03 01:20:15', 0),
(31, 'http://res.cloudinary.com/da5wewzih/image/upload/v1704270019/j51ih79g25jstnrzgplg.png', 11, '2024-01-03 01:20:18', '2024-01-03 01:20:18', 0),
(32, 'http://res.cloudinary.com/da5wewzih/image/upload/v1704270023/tvetag7hynmzzjxf8bs8.png', 11, '2024-01-03 01:20:22', '2024-01-03 01:20:22', 0),
(33, 'http://res.cloudinary.com/da5wewzih/image/upload/v1704270026/rlnarvzyezg7nv1hq1cr.png', 11, '2024-01-03 01:20:26', '2024-01-03 01:20:26', 0),
(34, 'http://res.cloudinary.com/da5wewzih/image/upload/v1704270194/nokr31avojva7z85nwof.png', 12, '2024-01-03 01:23:14', '2024-01-03 01:23:14', 0),
(35, 'http://res.cloudinary.com/da5wewzih/image/upload/v1704270198/gratmjohlb8iw5cxkvth.png', 12, '2024-01-03 01:23:17', '2024-01-03 01:23:17', 0),
(36, 'http://res.cloudinary.com/da5wewzih/image/upload/v1704270201/jdsgvumbcjlwjojhznos.png', 12, '2024-01-03 01:23:20', '2024-01-03 01:23:20', 0),
(37, 'http://res.cloudinary.com/da5wewzih/image/upload/v1704270204/phhorvcbk7ano1dviyqy.jpg', 12, '2024-01-03 01:23:23', '2024-01-03 01:23:23', 0),
(38, 'http://res.cloudinary.com/da5wewzih/image/upload/v1704270518/fgotplqnjlr9ybsjtntd.jpg', 13, '2024-01-03 01:28:37', '2024-01-03 01:28:37', 0),
(39, 'http://res.cloudinary.com/da5wewzih/image/upload/v1704270521/ta793baehabbjuitflqc.jpg', 13, '2024-01-03 01:28:40', '2024-01-03 01:28:40', 0),
(40, 'http://res.cloudinary.com/da5wewzih/image/upload/v1704270524/etuas4oioeiekancagio.jpg', 13, '2024-01-03 01:28:44', '2024-01-03 01:28:44', 0),
(41, 'http://res.cloudinary.com/da5wewzih/image/upload/v1704270527/j6ac5uvwlw1phf5uqdch.jpg', 13, '2024-01-03 01:28:47', '2024-01-03 01:28:47', 0),
(42, 'http://res.cloudinary.com/da5wewzih/image/upload/v1713722700/srxmtcwigtrcxschzpmc.jpg', 14, '2024-04-21 11:04:51', '2024-04-21 11:04:51', 0),
(43, 'http://res.cloudinary.com/da5wewzih/image/upload/v1713722703/dxakxluaigj86d6dkvy2.webp', 14, '2024-04-21 11:04:53', '2024-04-21 11:04:53', 0),
(44, 'http://res.cloudinary.com/da5wewzih/image/upload/v1713722705/penxemawrsi9mmvyiiv0.webp', 14, '2024-04-21 11:04:56', '2024-04-21 11:04:56', 0),
(45, 'http://res.cloudinary.com/da5wewzih/image/upload/v1713722836/w2brs5ziaalbqjdr60jh.jpg', 15, '2024-04-21 11:07:07', '2024-04-21 11:07:07', 0),
(46, 'http://res.cloudinary.com/da5wewzih/image/upload/v1713722838/bizidfzgp2tvsxvrwxju.jpg', 15, '2024-04-21 11:07:09', '2024-04-21 11:07:09', 0),
(47, 'http://res.cloudinary.com/da5wewzih/image/upload/v1713722840/diroygibqp8zmnb347mx.jpg', 15, '2024-04-21 11:07:11', '2024-04-21 11:07:11', 0),
(48, 'http://res.cloudinary.com/da5wewzih/image/upload/v1713725305/ftag3ygdyui7erdixwro.webp', 16, '2024-04-21 11:48:16', '2024-04-21 11:48:16', 0),
(49, 'http://res.cloudinary.com/da5wewzih/image/upload/v1713725307/lpff27dnuiqcqf7so3xq.webp', 16, '2024-04-21 11:48:18', '2024-04-21 11:48:18', 0),
(50, 'http://res.cloudinary.com/da5wewzih/image/upload/v1713725309/wqazbikwehg0p4w1jfuk.webp', 16, '2024-04-21 11:48:19', '2024-04-21 11:48:19', 0),
(51, 'http://res.cloudinary.com/da5wewzih/image/upload/v1713725672/uiyqo2emnlpxkgbg7ugp.jpg', 17, '2024-04-21 11:54:23', '2024-04-21 11:54:23', 0),
(52, 'http://res.cloudinary.com/da5wewzih/image/upload/v1713725675/eghsnmzyxr4zthqdfnee.jpg', 17, '2024-04-21 11:54:25', '2024-04-21 11:54:25', 0),
(53, 'http://res.cloudinary.com/da5wewzih/image/upload/v1713725677/epd256jq50gedjblcejk.jpg', 17, '2024-04-21 11:54:27', '2024-04-21 11:54:27', 0),
(54, 'http://res.cloudinary.com/da5wewzih/image/upload/v1713725868/gwt2c7yojlpojbu7l2yr.webp', 18, '2024-04-21 11:57:38', '2024-04-21 11:57:38', 0),
(55, 'http://res.cloudinary.com/da5wewzih/image/upload/v1713725870/uaeoccykzbdbttvbbcmk.webp', 18, '2024-04-21 11:57:40', '2024-04-21 11:57:40', 0),
(56, 'http://res.cloudinary.com/da5wewzih/image/upload/v1713725873/dcf4nlduu4jnimydtnm3.jpg', 18, '2024-04-21 11:57:43', '2024-04-21 11:57:43', 0),
(57, 'http://res.cloudinary.com/da5wewzih/image/upload/v1713725875/frucbsdzo2o13lh0ivcd.webp', 18, '2024-04-21 11:57:45', '2024-04-21 11:57:45', 0),
(58, 'http://res.cloudinary.com/da5wewzih/image/upload/v1713725958/rbhvxzx6yphxrbi261cc.webp', 19, '2024-04-21 11:59:08', '2024-04-21 11:59:08', 0),
(59, 'http://res.cloudinary.com/da5wewzih/image/upload/v1713725960/ukgehbm0x0ouvz0vf66o.webp', 19, '2024-04-21 11:59:10', '2024-04-21 11:59:10', 0),
(60, 'http://res.cloudinary.com/da5wewzih/image/upload/v1713725962/qjx6saldixpojluqrppr.webp', 19, '2024-04-21 11:59:13', '2024-04-21 11:59:13', 0),
(61, 'http://res.cloudinary.com/da5wewzih/image/upload/v1713726035/cplslydqu7ef3x3zpm5v.webp', 20, '2024-04-21 12:00:26', '2024-04-21 12:00:26', 0),
(62, 'http://res.cloudinary.com/da5wewzih/image/upload/v1713726037/jp6izehvcsfd3qchzp79.webp', 20, '2024-04-21 12:00:27', '2024-04-21 12:00:27', 0),
(63, 'http://res.cloudinary.com/da5wewzih/image/upload/v1713726039/rthal57pmlbpnn8auk8w.webp', 20, '2024-04-21 12:00:29', '2024-04-21 12:00:29', 0),
(64, 'http://res.cloudinary.com/da5wewzih/image/upload/v1713726041/he9zkvnghgiqzx20doiu.webp', 20, '2024-04-21 12:00:32', '2024-04-21 12:00:32', 0),
(65, 'http://res.cloudinary.com/da5wewzih/image/upload/v1713726105/sqttzmxvihfyvlllizbo.webp', 21, '2024-04-21 12:01:36', '2024-04-21 12:01:36', 0),
(66, 'http://res.cloudinary.com/da5wewzih/image/upload/v1713726107/ywym3bp4zj1s3gitdxm4.webp', 21, '2024-04-21 12:01:38', '2024-04-21 12:01:38', 0),
(67, 'http://res.cloudinary.com/da5wewzih/image/upload/v1713726161/qhky6pshdjhfhnumjuhr.webp', 22, '2024-04-21 12:02:32', '2024-04-21 12:02:32', 0),
(68, 'http://res.cloudinary.com/da5wewzih/image/upload/v1713726163/i6kaimyqzsmevb5rjjz4.webp', 22, '2024-04-21 12:02:34', '2024-04-21 12:02:34', 0),
(69, 'http://res.cloudinary.com/da5wewzih/image/upload/v1713726165/dh2g0wmxyojfuduirj3y.webp', 22, '2024-04-21 12:02:35', '2024-04-21 12:02:35', 0),
(70, 'http://res.cloudinary.com/da5wewzih/image/upload/v1713726207/juqu4ay3fpkjpznfrkoh.webp', 23, '2024-04-21 12:03:17', '2024-04-21 12:03:17', 0),
(71, 'http://res.cloudinary.com/da5wewzih/image/upload/v1713726209/qjbw8znvv7tmfobrfcgj.webp', 23, '2024-04-21 12:03:19', '2024-04-21 12:03:19', 0),
(72, 'http://res.cloudinary.com/da5wewzih/image/upload/v1713726211/ceblvekbwkfqgfyiqi4j.webp', 23, '2024-04-21 12:03:21', '2024-04-21 12:03:21', 0),
(73, 'http://res.cloudinary.com/da5wewzih/image/upload/v1713726265/odqfszpchdgijmpjd04l.webp', 24, '2024-04-21 12:04:15', '2024-04-21 12:04:15', 0),
(74, 'http://res.cloudinary.com/da5wewzih/image/upload/v1713726267/ko8p8sggablcr3l1zxra.webp', 24, '2024-04-21 12:04:17', '2024-04-21 12:04:17', 0),
(75, 'http://res.cloudinary.com/da5wewzih/image/upload/v1713726269/e4ti6kpa6hf5ciy3jeug.webp', 24, '2024-04-21 12:04:19', '2024-04-21 12:04:19', 0),
(76, 'http://res.cloudinary.com/da5wewzih/image/upload/v1713726312/ljbt5fk3ndh0tlkvrvhr.webp', 25, '2024-04-21 12:05:03', '2024-04-21 12:05:03', 0),
(77, 'http://res.cloudinary.com/da5wewzih/image/upload/v1713726314/t1rjohpjei6j82x6dn4l.webp', 25, '2024-04-21 12:05:05', '2024-04-21 12:05:05', 0),
(78, 'http://res.cloudinary.com/da5wewzih/image/upload/v1713726316/nu44lyiogx6xb62dwhyo.webp', 25, '2024-04-21 12:05:07', '2024-04-21 12:05:07', 0),
(79, 'http://res.cloudinary.com/da5wewzih/image/upload/v1713726321/qnlddtymj5nznakcjfsl.jpg', 25, '2024-04-21 12:05:11', '2024-04-21 12:05:11', 0),
(80, 'http://res.cloudinary.com/da5wewzih/image/upload/v1713726400/duuqu8dzxng5rq3w4zkl.webp', 26, '2024-04-21 12:06:31', '2024-04-21 12:06:31', 0),
(81, 'http://res.cloudinary.com/da5wewzih/image/upload/v1713726402/i7xebpsjpsawjj1xuawm.webp', 26, '2024-04-21 12:06:33', '2024-04-21 12:06:33', 0),
(82, 'http://res.cloudinary.com/da5wewzih/image/upload/v1713726404/xjcbc1rheauunpmtqkbl.webp', 26, '2024-04-21 12:06:35', '2024-04-21 12:06:35', 0),
(83, 'http://res.cloudinary.com/da5wewzih/image/upload/v1713726467/sadjhap5xgdh2olhxw96.webp', 27, '2024-04-21 12:07:38', '2024-04-21 12:07:38', 0),
(84, 'http://res.cloudinary.com/da5wewzih/image/upload/v1713726469/ngq5ddw773xsz70hdl3w.webp', 27, '2024-04-21 12:07:39', '2024-04-21 12:07:39', 0),
(85, 'http://res.cloudinary.com/da5wewzih/image/upload/v1713726471/cm8jktmolab8pm2jaars.webp', 27, '2024-04-21 12:07:41', '2024-04-21 12:07:41', 0),
(86, 'http://res.cloudinary.com/da5wewzih/image/upload/v1713726563/wnbzggjsjfkawxfhz9h6.webp', 28, '2024-04-21 12:09:13', '2024-04-21 12:09:13', 0),
(87, 'http://res.cloudinary.com/da5wewzih/image/upload/v1713726565/kytuxk9hywr3kkhb999d.webp', 28, '2024-04-21 12:09:15', '2024-04-21 12:09:15', 0),
(88, 'http://res.cloudinary.com/da5wewzih/image/upload/v1713726568/hyvmsqfpv0qejjajs9xy.jpg', 28, '2024-04-21 12:09:18', '2024-04-21 12:09:18', 0),
(89, 'http://res.cloudinary.com/da5wewzih/image/upload/v1713726618/rq6c1uhxotshxfcukpsq.webp', 29, '2024-04-21 12:10:09', '2024-04-21 12:10:09', 0),
(90, 'http://res.cloudinary.com/da5wewzih/image/upload/v1713726621/uidxvhawvd6rhjkbhcww.webp', 29, '2024-04-21 12:10:11', '2024-04-21 12:10:11', 0),
(91, 'http://res.cloudinary.com/da5wewzih/image/upload/v1713726623/pigadbjonae99oo25ihh.webp', 29, '2024-04-21 12:10:13', '2024-04-21 12:10:13', 0),
(92, 'http://res.cloudinary.com/da5wewzih/image/upload/v1713726696/sywivrtv4phtqb4ncrlx.webp', 30, '2024-04-21 12:11:27', '2024-04-21 12:11:27', 0),
(93, 'http://res.cloudinary.com/da5wewzih/image/upload/v1713726698/vdw1idwgdxi9kn7xvj36.webp', 30, '2024-04-21 12:11:29', '2024-04-21 12:11:29', 0),
(94, 'http://res.cloudinary.com/da5wewzih/image/upload/v1713726702/nrdlyuzlym9ufirpse4f.jpg', 30, '2024-04-21 12:11:33', '2024-04-21 12:11:33', 0);

-- --------------------------------------------------------

--
-- Table structure for table `product_sizes`
--

CREATE TABLE `product_sizes` (
  `id` bigint(20) NOT NULL,
  `sizeId` bigint(20) DEFAULT NULL,
  `productId` bigint(20) DEFAULT NULL,
  `price` decimal(20,1) DEFAULT NULL,
  `createAt` timestamp NULL DEFAULT current_timestamp(),
  `updateAt` timestamp NULL DEFAULT current_timestamp(),
  `isDeleted` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product_sizes`
--

INSERT INTO `product_sizes` (`id`, `sizeId`, `productId`, `price`, `createAt`, `updateAt`, `isDeleted`) VALUES
(1, 22, 1, 1020000.0, '2024-01-02 09:14:19', '2024-01-02 09:14:19', 0),
(2, 23, 1, 1030000.0, '2024-01-02 09:14:19', '2024-01-02 09:14:19', 0),
(3, 24, 1, 1040000.0, '2024-01-02 09:14:19', '2024-01-02 09:14:19', 0),
(4, 25, 1, 1050000.0, '2024-01-02 09:14:19', '2024-01-02 09:14:19', 0),
(5, 1, 2, 1160000.0, '2024-01-02 10:09:17', '2024-01-02 10:09:17', 0),
(6, 2, 2, 1170000.0, '2024-01-02 10:09:17', '2024-01-02 10:09:17', 0),
(7, 3, 2, 1180000.0, '2024-01-02 10:09:17', '2024-01-02 10:09:17', 0),
(8, 4, 2, 1190000.0, '2024-01-02 10:09:17', '2024-01-02 10:09:17', 0),
(9, 5, 2, 1200000.0, '2024-01-02 10:09:17', '2024-01-02 10:09:17', 0),
(10, 6, 2, 1210000.0, '2024-01-02 10:09:17', '2024-01-02 10:09:17', 0),
(11, 2, 3, 879000.0, '2024-01-02 15:08:47', '2024-01-02 15:08:47', 0),
(12, 3, 3, 889000.0, '2024-01-02 15:08:50', '2024-01-02 15:08:50', 0),
(13, 4, 3, 899000.0, '2024-01-02 15:08:50', '2024-01-02 15:08:50', 0),
(14, 5, 3, 909000.0, '2024-01-02 15:08:50', '2024-01-02 15:08:50', 0),
(15, 6, 3, 919000.0, '2024-01-02 15:08:50', '2024-01-02 15:08:50', 0),
(16, 5, 4, 1658000.0, '2024-01-02 15:14:43', '2024-01-02 15:14:43', 0),
(17, 6, 4, 1668000.0, '2024-01-02 15:14:43', '2024-01-02 15:14:43', 0),
(18, 7, 4, 1678000.0, '2024-01-02 15:14:43', '2024-01-02 15:14:43', 0),
(19, 8, 4, 1688000.0, '2024-01-02 15:14:43', '2024-01-02 15:14:43', 0),
(20, 9, 4, 1698000.0, '2024-01-02 15:14:43', '2024-01-02 15:14:43', 0),
(21, 1, 5, 2060000.0, '2024-01-02 15:20:50', '2024-01-02 15:20:50', 0),
(22, 2, 5, 2070000.0, '2024-01-02 15:20:50', '2024-01-02 15:20:50', 0),
(23, 3, 5, 2080000.0, '2024-01-02 15:20:50', '2024-01-02 15:20:50', 0),
(25, 19, 7, 640000.0, '2024-01-03 00:58:59', '2024-01-03 00:58:59', 0),
(26, 20, 7, 645000.0, '2024-01-03 00:58:59', '2024-01-03 00:58:59', 0),
(27, 21, 7, 650000.0, '2024-01-03 00:58:59', '2024-01-03 00:58:59', 0),
(28, 22, 7, 660000.0, '2024-01-03 00:58:59', '2024-01-03 00:58:59', 0),
(29, 1, 8, 910000.0, '2024-01-03 01:07:05', '2024-01-03 01:07:05', 0),
(30, 2, 8, 920000.0, '2024-01-03 01:07:05', '2024-01-03 01:07:05', 0),
(31, 3, 8, 930000.0, '2024-01-03 01:07:05', '2024-01-03 01:07:05', 0),
(32, 4, 8, 940000.0, '2024-01-03 01:07:05', '2024-01-03 01:07:05', 0),
(33, 5, 8, 950000.0, '2024-01-03 01:07:05', '2024-01-03 01:07:05', 0),
(34, 6, 8, 960000.0, '2024-01-03 01:07:05', '2024-01-03 01:07:05', 0),
(35, 1, 9, 740000.0, '2024-01-03 01:14:14', '2024-01-03 01:14:14', 0),
(36, 2, 9, 750000.0, '2024-01-03 01:14:14', '2024-01-03 01:14:14', 0),
(37, 3, 9, 760000.0, '2024-01-03 01:14:14', '2024-01-03 01:14:14', 0),
(38, 4, 9, 770000.0, '2024-01-03 01:14:14', '2024-01-03 01:14:14', 0),
(39, 19, 10, 1600000.0, '2024-01-03 01:16:52', '2024-01-03 01:16:52', 0),
(40, 20, 10, 1605000.0, '2024-01-03 01:16:52', '2024-01-03 01:16:52', 0),
(41, 21, 10, 1610000.0, '2024-01-03 01:16:52', '2024-01-03 01:16:52', 0),
(42, 22, 10, 1620000.0, '2024-01-03 01:16:52', '2024-01-03 01:16:52', 0),
(43, 23, 10, 1630000.0, '2024-01-03 01:16:52', '2024-01-03 01:16:52', 0),
(44, 24, 10, 1640000.0, '2024-01-03 01:16:52', '2024-01-03 01:16:52', 0),
(45, 1, 11, 1360000.0, '2024-01-03 01:20:11', '2024-01-03 01:20:11', 0),
(46, 2, 11, 1370000.0, '2024-01-03 01:20:11', '2024-01-03 01:20:11', 0),
(47, 3, 11, 1380000.0, '2024-01-03 01:20:11', '2024-01-03 01:20:11', 0),
(48, 4, 11, 1390000.0, '2024-01-03 01:20:11', '2024-01-03 01:20:11', 0),
(49, 1, 12, 1560000.0, '2024-01-03 01:23:10', '2024-01-03 01:23:10', 0),
(50, 2, 12, 1570000.0, '2024-01-03 01:23:10', '2024-01-03 01:23:10', 0),
(51, 3, 12, 1580000.0, '2024-01-03 01:23:10', '2024-01-03 01:23:10', 0),
(52, 4, 12, 1590000.0, '2024-01-03 01:23:10', '2024-01-03 01:23:10', 0),
(53, 1, 13, 2160000.0, '2024-01-03 01:28:34', '2024-01-03 01:28:34', 0),
(54, 2, 13, 2170000.0, '2024-01-03 01:28:34', '2024-01-03 01:28:34', 0),
(55, 3, 13, 2180000.0, '2024-01-03 01:28:34', '2024-01-03 01:28:34', 0),
(56, 4, 13, 2190000.0, '2024-01-03 01:28:34', '2024-01-03 01:28:34', 0),
(57, 1, 14, 1700000.0, '2024-04-21 11:04:49', '2024-04-21 11:04:49', 0),
(58, 2, 14, 1720000.0, '2024-04-21 11:04:49', '2024-04-21 11:04:49', 0),
(59, 3, 14, 1730000.0, '2024-04-21 11:04:49', '2024-04-21 11:04:49', 0),
(60, 4, 14, 1740000.0, '2024-04-21 11:04:49', '2024-04-21 11:04:49', 0),
(61, 5, 15, 1900000.0, '2024-04-21 11:07:04', '2024-04-21 11:07:04', 0),
(62, 6, 15, 1910000.0, '2024-04-21 11:07:04', '2024-04-21 11:07:04', 0),
(63, 7, 15, 1930000.0, '2024-04-21 11:07:04', '2024-04-21 11:07:04', 0),
(64, 8, 15, 1940000.0, '2024-04-21 11:07:04', '2024-04-21 11:07:04', 0),
(65, 13, 16, 1320000.0, '2024-04-21 11:48:13', '2024-04-21 11:48:13', 0),
(66, 14, 16, 1340000.0, '2024-04-21 11:48:13', '2024-04-21 11:48:13', 0),
(67, 15, 16, 1360000.0, '2024-04-21 11:48:13', '2024-04-21 11:48:13', 0),
(68, 16, 16, 1380000.0, '2024-04-21 11:48:13', '2024-04-21 11:48:13', 0),
(69, 19, 17, 1320000.0, '2024-04-21 11:54:20', '2024-04-21 11:54:20', 0),
(70, 20, 17, 1330000.0, '2024-04-21 11:54:20', '2024-04-21 11:54:20', 0),
(71, 21, 17, 1340000.0, '2024-04-21 11:54:20', '2024-04-21 11:54:20', 0),
(72, 22, 17, 1350000.0, '2024-04-21 11:54:20', '2024-04-21 11:54:20', 0),
(73, 23, 17, 1360000.0, '2024-04-21 11:54:20', '2024-04-21 11:54:20', 0),
(74, 24, 17, 1370000.0, '2024-04-21 11:54:20', '2024-04-21 11:54:20', 0),
(75, 5, 18, 1617000.0, '2024-04-21 11:57:36', '2024-04-21 11:57:36', 0),
(76, 6, 18, 1620000.0, '2024-04-21 11:57:36', '2024-04-21 11:57:36', 0),
(77, 7, 18, 1624000.0, '2024-04-21 11:57:36', '2024-04-21 11:57:36', 0),
(78, 6, 19, 900000.0, '2024-04-21 11:59:06', '2024-04-21 11:59:06', 0),
(79, 7, 19, 950000.0, '2024-04-21 11:59:06', '2024-04-21 11:59:06', 0),
(80, 8, 19, 1000000.0, '2024-04-21 11:59:06', '2024-04-21 11:59:06', 0),
(81, 9, 19, 1050000.0, '2024-04-21 11:59:06', '2024-04-21 11:59:06', 0),
(82, 7, 20, 1450000.0, '2024-04-21 12:00:23', '2024-04-21 12:00:23', 0),
(83, 8, 20, 1460000.0, '2024-04-21 12:00:23', '2024-04-21 12:00:23', 0),
(84, 9, 20, 1470000.0, '2024-04-21 12:00:23', '2024-04-21 12:00:23', 0),
(85, 10, 20, 1478000.0, '2024-04-21 12:00:23', '2024-04-21 12:00:23', 0),
(86, 13, 21, 1510000.0, '2024-04-21 12:01:33', '2024-04-21 12:01:33', 0),
(87, 14, 21, 1560000.0, '2024-04-21 12:01:34', '2024-04-21 12:01:34', 0),
(88, 15, 21, 1609000.0, '2024-04-21 12:01:34', '2024-04-21 12:01:34', 0),
(89, 6, 22, 1510000.0, '2024-04-21 12:02:29', '2024-04-21 12:02:29', 0),
(90, 7, 22, 1520000.0, '2024-04-21 12:02:29', '2024-04-21 12:02:29', 0),
(91, 8, 22, 1530000.0, '2024-04-21 12:02:29', '2024-04-21 12:02:29', 0),
(92, 9, 22, 1546000.0, '2024-04-21 12:02:29', '2024-04-21 12:02:29', 0),
(93, 3, 23, 1510000.0, '2024-04-21 12:03:15', '2024-04-21 12:03:15', 0),
(94, 4, 23, 1535000.0, '2024-04-21 12:03:15', '2024-04-21 12:03:15', 0),
(95, 5, 23, 1544000.0, '2024-04-21 12:03:15', '2024-04-21 12:03:15', 0),
(96, 10, 24, 1260000.0, '2024-04-21 12:04:13', '2024-04-21 12:04:13', 0),
(97, 11, 24, 1280000.0, '2024-04-21 12:04:13', '2024-04-21 12:04:13', 0),
(98, 12, 24, 1300000.0, '2024-04-21 12:04:13', '2024-04-21 12:04:13', 0),
(99, 6, 25, 1000000.0, '2024-04-21 12:05:00', '2024-04-21 12:05:00', 0),
(100, 7, 25, 1100000.0, '2024-04-21 12:05:00', '2024-04-21 12:05:00', 0),
(101, 8, 25, 1200000.0, '2024-04-21 12:05:00', '2024-04-21 12:05:00', 0),
(102, 19, 26, 999000.0, '2024-04-21 12:06:29', '2024-04-21 12:06:29', 0),
(103, 20, 26, 999000.0, '2024-04-21 12:06:29', '2024-04-21 12:06:29', 0),
(104, 21, 26, 1100000.0, '2024-04-21 12:06:29', '2024-04-21 12:06:29', 0),
(105, 22, 26, 1200000.0, '2024-04-21 12:06:29', '2024-04-21 12:06:29', 0),
(106, 23, 26, 1300000.0, '2024-04-21 12:06:29', '2024-04-21 12:06:29', 0),
(107, 24, 26, 1400000.0, '2024-04-21 12:06:29', '2024-04-21 12:06:29', 0),
(108, 25, 26, 1500000.0, '2024-04-21 12:06:29', '2024-04-21 12:06:29', 0),
(109, 12, 27, 2000000.0, '2024-04-21 12:07:36', '2024-04-21 12:07:36', 0),
(110, 13, 27, 2050000.0, '2024-04-21 12:07:36', '2024-04-21 12:07:36', 0),
(111, 14, 27, 2100000.0, '2024-04-21 12:07:36', '2024-04-21 12:07:36', 0),
(112, 17, 28, 4500000.0, '2024-04-21 12:09:11', '2024-04-21 12:09:11', 0),
(113, 18, 28, 4550000.0, '2024-04-21 12:09:11', '2024-04-21 12:09:11', 0),
(114, 19, 28, 4300000.0, '2024-04-21 12:09:11', '2024-04-21 12:09:11', 0),
(115, 20, 28, 4350000.0, '2024-04-21 12:09:11', '2024-04-21 12:09:11', 0),
(116, 8, 29, 2700000.0, '2024-04-21 12:10:06', '2024-04-21 12:10:06', 0),
(117, 9, 29, 2800000.0, '2024-04-21 12:10:06', '2024-04-21 12:10:06', 0),
(118, 10, 29, 2900000.0, '2024-04-21 12:10:06', '2024-04-21 12:10:06', 0),
(119, 11, 29, 3200000.0, '2024-04-21 12:10:06', '2024-04-21 12:10:06', 0),
(120, 4, 30, 3500000.0, '2024-04-21 12:11:25', '2024-04-21 12:11:25', 0),
(121, 5, 30, 3600000.0, '2024-04-21 12:11:25', '2024-04-21 12:11:25', 0),
(122, 6, 30, 3700000.0, '2024-04-21 12:11:25', '2024-04-21 12:11:25', 0),
(123, 7, 30, 3800000.0, '2024-04-21 12:11:25', '2024-04-21 12:11:25', 0),
(124, 8, 30, 3900000.0, '2024-04-21 12:11:25', '2024-04-21 12:11:25', 0),
(125, 9, 30, 4000000.0, '2024-04-21 12:11:25', '2024-04-21 12:11:25', 0);

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) NOT NULL,
  `code` varchar(50) DEFAULT NULL,
  `value` varchar(100) DEFAULT NULL,
  `createAt` timestamp NULL DEFAULT current_timestamp(),
  `updateAt` timestamp NULL DEFAULT current_timestamp(),
  `isDeleted` tinyint(4) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `code`, `value`, `createAt`, `updateAt`, `isDeleted`) VALUES
(1, 'R1', 'admin', '2024-04-05 20:18:44', '2024-04-05 20:18:44', 0),
(2, 'R2', 'moderator', '2024-04-05 20:18:44', '2024-04-05 20:18:44', 0),
(3, 'R3', 'user', '2024-04-05 20:18:44', '2024-04-05 20:18:44', 0);

-- --------------------------------------------------------

--
-- Table structure for table `sizes`
--

CREATE TABLE `sizes` (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `createAt` timestamp NULL DEFAULT current_timestamp(),
  `updateAt` timestamp NULL DEFAULT current_timestamp(),
  `isDeleted` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sizes`
--

INSERT INTO `sizes` (`id`, `name`, `createAt`, `updateAt`, `isDeleted`) VALUES
(1, 'M 7 / W 8.5', '2024-01-01 13:31:05', '2024-01-08 00:22:33', 0),
(2, 'M 7.5 / W 9', '2024-01-01 13:31:06', '2024-01-01 13:31:06', 0),
(3, 'M 8 / W 9.5', '2024-01-01 13:31:06', '2024-01-01 13:31:06', 0),
(4, 'M 8.5 / W 10', '2024-01-01 13:31:06', '2024-01-01 13:31:06', 0),
(5, 'M 9 / W 10.5', '2024-01-01 13:31:06', '2024-01-01 13:31:06', 0),
(6, 'M 9.5 / W 11', '2024-01-01 13:31:06', '2024-01-01 13:31:06', 0),
(7, 'M 10 / W 11.5', '2024-01-01 13:31:06', '2024-01-01 13:31:06', 0),
(8, 'M 10.5 / W 12', '2024-01-01 13:31:06', '2024-01-01 13:31:06', 0),
(9, 'M 11 / W 12.5', '2024-01-01 13:31:06', '2024-01-01 13:31:06', 0),
(10, 'M 11.5 / W 13', '2024-01-01 13:31:06', '2024-01-01 13:31:06', 0),
(11, 'M 12 / W 13.5', '2024-01-01 13:31:06', '2024-01-01 13:31:06', 0),
(12, 'M 12.5 / W 14', '2024-01-01 13:31:06', '2024-01-01 13:31:06', 0),
(13, 'M 13 / W 14.5', '2024-01-01 13:31:06', '2024-01-01 13:31:06', 0),
(14, 'M 14 / W 15.5', '2024-01-01 13:31:06', '2024-01-01 13:31:06', 0),
(15, 'M 15 / W 16.5', '2024-01-01 13:31:06', '2024-01-01 13:31:06', 0),
(16, 'M 16 / W 17.5', '2024-01-01 13:31:06', '2024-01-01 13:31:06', 0),
(17, 'M 17 / W 18.5', '2024-01-01 13:31:06', '2024-01-01 13:31:06', 0),
(18, 'M 18 / W 19.5', '2024-01-01 13:31:06', '2024-01-01 13:31:06', 0),
(19, 'M 3.5 / W 5', '2024-01-01 13:34:41', '2024-01-01 13:34:41', 0),
(20, 'M 4 / W 5.5', '2024-01-01 13:34:41', '2024-01-01 13:34:41', 0),
(21, 'M 4.5 / W 6', '2024-01-01 13:34:41', '2024-01-01 13:34:41', 0),
(22, 'M 5 / W 6.5', '2024-01-01 13:34:41', '2024-01-01 13:34:41', 0),
(23, 'M 5.5 / W 7', '2024-01-01 13:34:41', '2024-01-01 13:34:41', 0),
(24, 'M 6 / W 7.5', '2024-01-01 13:34:41', '2024-01-01 13:34:41', 0),
(25, 'M 6.5 / W 8', '2024-01-01 13:34:41', '2024-01-01 13:34:41', 0);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) NOT NULL,
  `userName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `fullName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `birthDay` date DEFAULT NULL,
  `association` varchar(20) DEFAULT 'none',
  `lastLogged` timestamp NULL DEFAULT current_timestamp(),
  `roleId` bigint(20) DEFAULT 3,
  `createAt` timestamp NULL DEFAULT current_timestamp(),
  `updateAt` timestamp NULL DEFAULT current_timestamp(),
  `isDeleted` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `userName`, `email`, `password`, `fullName`, `birthDay`, `association`, `lastLogged`, `roleId`, `createAt`, `updateAt`, `isDeleted`) VALUES
(6, 'hoanghuydev', 'tranvohoanghuy12ab@gmail.com', '$2a$12$n1ZRw5rmlRGU0uqK6USVR.p8i66degNqeanwUZK9j0hdgDF8gfvVm', 'Tran Vo Hoang Huy', NULL, 'none', '2024-04-28 15:52:41', 1, '2023-12-27 01:23:38', '2024-04-28 15:52:41', 0),
(8, '111635119529567317993', '21130386@st.hcmuaf.edu.vn', NULL, 'Trần Võ Hoàng Huy', NULL, 'google', '2024-04-06 04:21:10', 2, '2023-12-27 21:21:13', '2024-04-06 04:21:10', 0),
(14, 'a', 'vophihoang252003@gmail.com', '$2a$12$9szEjqLykjaQVvPTnccyRuPLqAfBwCUMRNut8OECjLXLS4HW0LyiG', 'Vo Hoang', NULL, 'none', '2024-04-21 02:55:40', 1, '2024-03-13 01:14:47', '2024-04-21 02:55:40', 0),
(16, 'b', 'vophihoang@gmail.com', '$2a$12$9szEjqLykjaQVvPTnccyRuPLqAfBwCUMRNut8OECjLXLS4HW0LyiG', 'Vo Hoang', NULL, 'none', '2024-04-07 05:15:04', 3, '2024-03-13 01:14:47', '2024-04-07 05:15:05', 0),
(17, 'zxc', '21130363@st.hcmuaf.edu.vn', '$2a$12$TxpeSfw/IbB2lQQBKRL1xOPAouLae87JhEYs7uodTc.CZA5G.57Ea', 'Phi Nhan', NULL, 'none', '2024-04-19 01:42:01', 3, '2024-04-19 01:42:01', '2024-04-19 02:24:13', 1);

-- --------------------------------------------------------

--
-- Table structure for table `user_addresses`
--

CREATE TABLE `user_addresses` (
  `id` bigint(20) NOT NULL,
  `addressId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `createAt` timestamp NULL DEFAULT current_timestamp(),
  `updateAt` timestamp NULL DEFAULT current_timestamp(),
  `isDeleted` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_orders`
--

CREATE TABLE `user_orders` (
  `id` bigint(20) NOT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `orderId` bigint(20) DEFAULT NULL,
  `createAt` timestamp NULL DEFAULT current_timestamp(),
  `updateAt` timestamp NULL DEFAULT current_timestamp(),
  `isDeleted` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_orders`
--

INSERT INTO `user_orders` (`id`, `userId`, `orderId`, `createAt`, `updateAt`, `isDeleted`) VALUES
(3, 14, 11, '2024-04-04 17:19:08', '2024-04-04 17:19:08', 0);

-- --------------------------------------------------------

--
-- Table structure for table `vouchers`
--

CREATE TABLE `vouchers` (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `code` varchar(100) NOT NULL,
  `startDate` timestamp NULL DEFAULT current_timestamp(),
  `endDate` timestamp NULL DEFAULT current_timestamp(),
  `usageLimit` int(11) DEFAULT 0,
  `shortDescription` varchar(400) DEFAULT NULL,
  `content` varchar(2000) DEFAULT NULL,
  `active` tinyint(1) DEFAULT 1,
  `isDeleted` tinyint(1) DEFAULT 0,
  `createAt` timestamp NULL DEFAULT current_timestamp(),
  `updateAt` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `voucher_conditions`
--

CREATE TABLE `voucher_conditions` (
  `id` bigint(20) NOT NULL,
  `voucherId` bigint(20) DEFAULT NULL,
  `tableName` varchar(80) DEFAULT NULL,
  `columnName` varchar(80) DEFAULT NULL,
  `condition` varchar(255) DEFAULT NULL,
  `isDeleted` tinyint(1) DEFAULT 0,
  `createAt` timestamp NULL DEFAULT current_timestamp(),
  `updateAt` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `voucher_usage`
--

CREATE TABLE `voucher_usage` (
  `id` bigint(20) NOT NULL,
  `voucherId` bigint(20) DEFAULT NULL,
  `userId` bigint(20) DEFAULT NULL,
  `createAt` timestamp NULL DEFAULT current_timestamp(),
  `updateAt` timestamp NULL DEFAULT current_timestamp(),
  `isDeleted` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `addresses`
--
ALTER TABLE `addresses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Cart_fk0` (`userId`),
  ADD KEY `Cart_fk1` (`orderDetailsId`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `category_pk` (`code`);

--
-- Indexes for table `import_orders`
--
ALTER TABLE `import_orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `import_order_details`
--
ALTER TABLE `import_order_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK__product` (`productSizeId`) USING BTREE,
  ADD KEY `FK_import_order_details_import_orders` (`importOrderId`);

--
-- Indexes for table `logs`
--
ALTER TABLE `logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `opinions`
--
ALTER TABLE `opinions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `comment_product_id_fk` (`productId`),
  ADD KEY `opinion_user_id_fk` (`userId`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `order_pk` (`slug`),
  ADD KEY `Order_fk0` (`addressId`);

--
-- Indexes for table `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orderDetails_fk0` (`orderId`),
  ADD KEY `orderDetails_fk1` (`productSizeId`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_category_id_fk` (`categoryId`);

--
-- Indexes for table `product_images`
--
ALTER TABLE `product_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `productImage_fk0` (`productId`);

--
-- Indexes for table `product_sizes`
--
ALTER TABLE `product_sizes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `productSize_fk0` (`sizeId`),
  ADD KEY `productSize_fk1` (`productId`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_pk` (`code`),
  ADD UNIQUE KEY `roles_pk_2` (`value`);

--
-- Indexes for table `sizes`
--
ALTER TABLE `sizes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `size_pk` (`name`),
  ADD UNIQUE KEY `size_pk2` (`name`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `userName` (`userName`),
  ADD KEY `users_roles_id_fk` (`roleId`);

--
-- Indexes for table `user_addresses`
--
ALTER TABLE `user_addresses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userAddress_fk0` (`addressId`),
  ADD KEY `userAddress_fk1` (`userId`);

--
-- Indexes for table `user_orders`
--
ALTER TABLE `user_orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userOrder_fk0` (`userId`),
  ADD KEY `userOrder_fk1` (`orderId`);

--
-- Indexes for table `vouchers`
--
ALTER TABLE `vouchers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `DiscountCodes_pk_2` (`code`);

--
-- Indexes for table `voucher_conditions`
--
ALTER TABLE `voucher_conditions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `voucher_coditions_vouchers_id_fk` (`voucherId`);

--
-- Indexes for table `voucher_usage`
--
ALTER TABLE `voucher_usage`
  ADD PRIMARY KEY (`id`),
  ADD KEY `voucher_usage_vouchers_id_fk` (`voucherId`),
  ADD KEY `voucher_usage_users_id_fk` (`userId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `addresses`
--
ALTER TABLE `addresses`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `carts`
--
ALTER TABLE `carts`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `logs`
--
ALTER TABLE `logs`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=650;

--
-- AUTO_INCREMENT for table `opinions`
--
ALTER TABLE `opinions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `order_details`
--
ALTER TABLE `order_details`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `product_images`
--
ALTER TABLE `product_images`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=95;

--
-- AUTO_INCREMENT for table `product_sizes`
--
ALTER TABLE `product_sizes`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=126;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `sizes`
--
ALTER TABLE `sizes`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `user_addresses`
--
ALTER TABLE `user_addresses`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_orders`
--
ALTER TABLE `user_orders`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `vouchers`
--
ALTER TABLE `vouchers`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `voucher_conditions`
--
ALTER TABLE `voucher_conditions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `voucher_usage`
--
ALTER TABLE `voucher_usage`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `carts`
--
ALTER TABLE `carts`
  ADD CONSTRAINT `Cart_fk0` FOREIGN KEY (`userId`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `Cart_fk1` FOREIGN KEY (`orderDetailsId`) REFERENCES `order_details` (`id`);

--
-- Constraints for table `import_order_details`
--
ALTER TABLE `import_order_details`
  ADD CONSTRAINT `FK_import_order_details_import_orders` FOREIGN KEY (`importOrderId`) REFERENCES `import_orders` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_import_order_details_product_sizes` FOREIGN KEY (`productSizeId`) REFERENCES `product_sizes` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `opinions`
--
ALTER TABLE `opinions`
  ADD CONSTRAINT `comment_product_id_fk` FOREIGN KEY (`productId`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `opinion_user_id_fk` FOREIGN KEY (`userId`) REFERENCES `users` (`id`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `Order_fk0` FOREIGN KEY (`addressId`) REFERENCES `addresses` (`id`);

--
-- Constraints for table `order_details`
--
ALTER TABLE `order_details`
  ADD CONSTRAINT `orderDetails_fk0` FOREIGN KEY (`orderId`) REFERENCES `orders` (`id`),
  ADD CONSTRAINT `orderDetails_fk1` FOREIGN KEY (`productSizeId`) REFERENCES `product_sizes` (`id`);

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `product_category_id_fk` FOREIGN KEY (`categoryId`) REFERENCES `categories` (`id`);

--
-- Constraints for table `product_images`
--
ALTER TABLE `product_images`
  ADD CONSTRAINT `productImage_fk0` FOREIGN KEY (`productId`) REFERENCES `products` (`id`);

--
-- Constraints for table `product_sizes`
--
ALTER TABLE `product_sizes`
  ADD CONSTRAINT `productSize_fk0` FOREIGN KEY (`sizeId`) REFERENCES `sizes` (`id`),
  ADD CONSTRAINT `productSize_fk1` FOREIGN KEY (`productId`) REFERENCES `products` (`id`);

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_roles_id_fk` FOREIGN KEY (`roleId`) REFERENCES `roles` (`id`);

--
-- Constraints for table `user_addresses`
--
ALTER TABLE `user_addresses`
  ADD CONSTRAINT `userAddress_fk0` FOREIGN KEY (`addressId`) REFERENCES `addresses` (`id`),
  ADD CONSTRAINT `userAddress_fk1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`);

--
-- Constraints for table `user_orders`
--
ALTER TABLE `user_orders`
  ADD CONSTRAINT `userOrder_fk0` FOREIGN KEY (`userId`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `userOrder_fk1` FOREIGN KEY (`orderId`) REFERENCES `orders` (`id`);

--
-- Constraints for table `voucher_conditions`
--
ALTER TABLE `voucher_conditions`
  ADD CONSTRAINT `voucher_coditions_vouchers_id_fk` FOREIGN KEY (`voucherId`) REFERENCES `vouchers` (`id`);

--
-- Constraints for table `voucher_usage`
--
ALTER TABLE `voucher_usage`
  ADD CONSTRAINT `voucher_usage_users_id_fk` FOREIGN KEY (`userId`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `voucher_usage_vouchers_id_fk` FOREIGN KEY (`voucherId`) REFERENCES `vouchers` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
