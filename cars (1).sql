-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 15 ديسمبر 2025 الساعة 20:17
-- إصدار الخادم: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cars`
--

-- --------------------------------------------------------

--
-- بنية الجدول `cars`
--

CREATE TABLE `cars` (
  `id` int(11) NOT NULL,
  `brand` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  `year` int(11) NOT NULL,
  `color` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- إرجاع أو استيراد بيانات الجدول `cars`
--

INSERT INTO `cars` (`id`, `brand`, `model`, `year`, `color`, `created_at`, `updated_at`) VALUES
(1, 'Toyota', 'Corolla', 2020, 'White', '2025-12-15 19:03:51', '2025-12-15 19:03:51'),
(2, 'Toyota', 'Camry', 2021, 'Black', '2025-12-15 19:03:51', '2025-12-15 19:03:51'),
(3, 'Toyota', 'RAV4', 2019, 'Silver', '2025-12-15 19:03:51', '2025-12-15 19:03:51'),
(4, 'Toyota', 'Land Cruiser', 2018, 'White', '2025-12-15 19:03:51', '2025-12-15 19:03:51'),
(5, 'Honda', 'Civic', 2020, 'Blue', '2025-12-15 19:03:51', '2025-12-15 19:03:51'),
(6, 'Honda', 'Accord', 2019, 'Gray', '2025-12-15 19:03:51', '2025-12-15 19:03:51'),
(7, 'Honda', 'CR-V', 2021, 'White', '2025-12-15 19:03:51', '2025-12-15 19:03:51'),
(8, 'Honda', 'Pilot', 2018, 'Black', '2025-12-15 19:03:51', '2025-12-15 19:03:51'),
(9, 'Hyundai', 'Elantra', 2022, 'Red', '2025-12-15 19:03:51', '2025-12-15 19:03:51'),
(10, 'Hyundai', 'Sonata', 2020, 'Black', '2025-12-15 19:03:51', '2025-12-15 19:03:51'),
(11, 'Hyundai', 'Tucson', 2019, 'Silver', '2025-12-15 19:03:51', '2025-12-15 19:03:51'),
(12, 'Hyundai', 'Santa Fe', 2021, 'Gray', '2025-12-15 19:03:51', '2025-12-15 19:03:51'),
(13, 'Kia', 'Cerato', 2021, 'White', '2025-12-15 19:03:51', '2025-12-15 19:03:51'),
(14, 'Kia', 'Sportage', 2020, 'Gray', '2025-12-15 19:03:51', '2025-12-15 19:03:51'),
(15, 'Kia', 'Sorento', 2018, 'Blue', '2025-12-15 19:03:51', '2025-12-15 19:03:51'),
(16, 'Kia', 'K5', 2022, 'Black', '2025-12-15 19:03:51', '2025-12-15 19:03:51'),
(17, 'Nissan', 'Altima', 2019, 'White', '2025-12-15 19:03:51', '2025-12-15 19:03:51'),
(18, 'Nissan', 'Maxima', 2020, 'Black', '2025-12-15 19:03:51', '2025-12-15 19:03:51'),
(19, 'Nissan', 'X-Trail', 2021, 'Silver', '2025-12-15 19:03:51', '2025-12-15 19:03:51'),
(20, 'Ford', 'Focus', 2018, 'Blue', '2025-12-15 19:03:51', '2025-12-15 19:03:51'),
(21, 'Ford', 'Explorer', 2020, 'White', '2025-12-15 19:03:51', '2025-12-15 19:03:51'),
(22, 'Chevrolet', 'Malibu', 2019, 'Gray', '2025-12-15 19:03:51', '2025-12-15 19:03:51'),
(23, 'Chevrolet', 'Tahoe', 2021, 'Black', '2025-12-15 19:03:51', '2025-12-15 19:03:51'),
(24, 'Toyota', 'Corolla', 2020, 'White', '2025-12-15 19:08:21', '2025-12-15 19:08:21'),
(25, 'Toyota', 'Camry', 2021, 'Black', '2025-12-15 19:08:21', '2025-12-15 19:08:21'),
(26, 'Toyota', 'RAV4', 2019, 'Silver', '2025-12-15 19:08:21', '2025-12-15 19:08:21'),
(27, 'Toyota', 'Land Cruiser', 2018, 'White', '2025-12-15 19:08:21', '2025-12-15 19:08:21'),
(28, 'Honda', 'Civic', 2020, 'Blue', '2025-12-15 19:08:21', '2025-12-15 19:08:21'),
(29, 'Honda', 'Accord', 2019, 'Gray', '2025-12-15 19:08:21', '2025-12-15 19:08:21'),
(30, 'Honda', 'CR-V', 2021, 'White', '2025-12-15 19:08:21', '2025-12-15 19:08:21'),
(31, 'Honda', 'Pilot', 2018, 'Black', '2025-12-15 19:08:21', '2025-12-15 19:08:21'),
(32, 'Hyundai', 'Elantra', 2022, 'Red', '2025-12-15 19:08:21', '2025-12-15 19:08:21'),
(33, 'Hyundai', 'Sonata', 2020, 'Black', '2025-12-15 19:08:21', '2025-12-15 19:08:21'),
(34, 'Hyundai', 'Tucson', 2019, 'Silver', '2025-12-15 19:08:21', '2025-12-15 19:08:21'),
(35, 'Hyundai', 'Santa Fe', 2021, 'Gray', '2025-12-15 19:08:21', '2025-12-15 19:08:21'),
(36, 'Kia', 'Cerato', 2021, 'White', '2025-12-15 19:08:21', '2025-12-15 19:08:21'),
(37, 'Kia', 'Sportage', 2020, 'Gray', '2025-12-15 19:08:21', '2025-12-15 19:08:21'),
(38, 'Kia', 'Sorento', 2018, 'Blue', '2025-12-15 19:08:21', '2025-12-15 19:08:21'),
(39, 'Kia', 'K5', 2022, 'Black', '2025-12-15 19:08:21', '2025-12-15 19:08:21'),
(40, 'Nissan', 'Altima', 2019, 'White', '2025-12-15 19:08:21', '2025-12-15 19:08:21'),
(41, 'Nissan', 'Maxima', 2020, 'Black', '2025-12-15 19:08:21', '2025-12-15 19:08:21'),
(42, 'Nissan', 'X-Trail', 2021, 'Silver', '2025-12-15 19:08:21', '2025-12-15 19:08:21'),
(43, 'Ford', 'Focus', 2018, 'Blue', '2025-12-15 19:08:21', '2025-12-15 19:08:21'),
(44, 'Ford', 'Explorer', 2020, 'White', '2025-12-15 19:08:21', '2025-12-15 19:08:21'),
(45, 'Chevrolet', 'Malibu', 2019, 'Gray', '2025-12-15 19:08:21', '2025-12-15 19:08:21'),
(46, 'Chevrolet', 'Tahoe', 2021, 'Black', '2025-12-15 19:08:21', '2025-12-15 19:08:21'),
(47, 'Toyota', 'Corolla', 2020, 'White', '2025-12-15 19:10:41', '2025-12-15 19:10:41'),
(48, 'Toyota', 'Camry', 2021, 'Black', '2025-12-15 19:10:41', '2025-12-15 19:10:41'),
(49, 'Toyota', 'RAV4', 2019, 'Silver', '2025-12-15 19:10:41', '2025-12-15 19:10:41'),
(50, 'Toyota', 'Land Cruiser', 2018, 'White', '2025-12-15 19:10:41', '2025-12-15 19:10:41'),
(51, 'Honda', 'Civic', 2020, 'Blue', '2025-12-15 19:10:41', '2025-12-15 19:10:41'),
(52, 'Honda', 'Accord', 2019, 'Gray', '2025-12-15 19:10:41', '2025-12-15 19:10:41'),
(53, 'Honda', 'CR-V', 2021, 'White', '2025-12-15 19:10:41', '2025-12-15 19:10:41'),
(54, 'Honda', 'Pilot', 2018, 'Black', '2025-12-15 19:10:41', '2025-12-15 19:10:41'),
(55, 'Hyundai', 'Elantra', 2022, 'Red', '2025-12-15 19:10:41', '2025-12-15 19:10:41'),
(56, 'Hyundai', 'Sonata', 2020, 'Black', '2025-12-15 19:10:41', '2025-12-15 19:10:41'),
(57, 'Hyundai', 'Tucson', 2019, 'Silver', '2025-12-15 19:10:41', '2025-12-15 19:10:41'),
(58, 'Hyundai', 'Santa Fe', 2021, 'Gray', '2025-12-15 19:10:41', '2025-12-15 19:10:41'),
(59, 'Kia', 'Cerato', 2021, 'White', '2025-12-15 19:10:41', '2025-12-15 19:10:41'),
(60, 'Kia', 'Sportage', 2020, 'Gray', '2025-12-15 19:10:41', '2025-12-15 19:10:41'),
(61, 'Kia', 'Sorento', 2018, 'Blue', '2025-12-15 19:10:41', '2025-12-15 19:10:41'),
(62, 'Kia', 'K5', 2022, 'Black', '2025-12-15 19:10:41', '2025-12-15 19:10:41'),
(63, 'Nissan', 'Altima', 2019, 'White', '2025-12-15 19:10:41', '2025-12-15 19:10:41'),
(64, 'Nissan', 'Maxima', 2020, 'Black', '2025-12-15 19:10:41', '2025-12-15 19:10:41'),
(65, 'Nissan', 'X-Trail', 2021, 'Silver', '2025-12-15 19:10:41', '2025-12-15 19:10:41'),
(66, 'Ford', 'Focus', 2018, 'Blue', '2025-12-15 19:10:41', '2025-12-15 19:10:41'),
(67, 'Ford', 'Explorer', 2020, 'White', '2025-12-15 19:10:41', '2025-12-15 19:10:41'),
(68, 'Chevrolet', 'Malibu', 2019, 'Gray', '2025-12-15 19:10:41', '2025-12-15 19:10:41'),
(69, 'Chevrolet', 'Tahoe', 2021, 'Black', '2025-12-15 19:10:41', '2025-12-15 19:10:41');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cars`
--
ALTER TABLE `cars`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cars`
--
ALTER TABLE `cars`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=70;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
