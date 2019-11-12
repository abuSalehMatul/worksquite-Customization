-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 18, 2019 at 11:06 PM
-- Server version: 10.4.8-MariaDB
-- PHP Version: 7.3.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `workata`
--

-- --------------------------------------------------------

--
-- Table structure for table `attendances`
--

CREATE TABLE `attendances` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `clock_in_time` datetime NOT NULL,
  `clock_out_time` datetime DEFAULT NULL,
  `clock_in_ip` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `clock_out_ip` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `working_from` varchar(191) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'office',
  `late` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  `half_day` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `attendances`
--

INSERT INTO `attendances` (`id`, `company_id`, `user_id`, `clock_in_time`, `clock_out_time`, `clock_in_ip`, `clock_out_ip`, `working_from`, `late`, `half_day`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '2019-06-05 20:22:24', '2019-06-05 20:22:52', '208.180.132.178', '208.180.132.178', 'office', 'yes', 'no', '2019-06-06 00:22:24', '2019-06-06 00:22:52'),
(2, 1, 1, '2019-06-05 20:23:01', '2019-06-05 20:23:10', '208.180.132.178', '208.180.132.178', 'office', 'no', 'no', '2019-06-06 00:23:01', '2019-06-06 00:23:10');

-- --------------------------------------------------------

--
-- Table structure for table `attendance_settings`
--

CREATE TABLE `attendance_settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `office_start_time` time NOT NULL,
  `office_end_time` time NOT NULL,
  `halfday_mark_time` time DEFAULT NULL,
  `late_mark_duration` tinyint(4) NOT NULL,
  `clockin_in_day` int(11) NOT NULL DEFAULT 1,
  `employee_clock_in_out` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'yes',
  `office_open_days` varchar(191) COLLATE utf8_unicode_ci NOT NULL DEFAULT '[1,2,3,4,5]',
  `ip_address` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `radius` int(11) DEFAULT NULL,
  `radius_check` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  `ip_check` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `attendance_settings`
--

INSERT INTO `attendance_settings` (`id`, `company_id`, `office_start_time`, `office_end_time`, `halfday_mark_time`, `late_mark_duration`, `clockin_in_day`, `employee_clock_in_out`, `office_open_days`, `ip_address`, `radius`, `radius_check`, `ip_check`, `created_at`, `updated_at`) VALUES
(1, NULL, '09:00:00', '18:00:00', NULL, 20, 2, 'yes', '[1,2,3,4,5]', NULL, NULL, 'no', 'no', '2019-05-31 22:26:05', '2019-05-31 22:26:05'),
(2, 1, '09:00:00', '18:00:00', NULL, 20, 1, 'yes', '[1,2,3,4,5]', NULL, NULL, 'no', 'no', '2019-05-31 22:26:13', '2019-05-31 22:26:13'),
(3, 2, '09:00:00', '18:00:00', NULL, 20, 1, 'yes', '[1,2,3,4,5]', NULL, NULL, 'no', 'no', '2019-06-13 00:32:44', '2019-06-13 00:32:44'),
(4, 3, '09:00:00', '18:00:00', NULL, 20, 1, 'yes', '[1,2,3,4,5]', NULL, NULL, 'no', 'no', '2019-07-06 20:18:36', '2019-07-06 20:18:36'),
(5, 4, '09:00:00', '18:00:00', NULL, 20, 1, 'yes', '[1,2,3,4,5]', NULL, NULL, 'no', 'no', '2019-07-31 19:32:05', '2019-07-31 19:32:05'),
(6, 5, '09:00:00', '18:00:00', NULL, 20, 1, 'yes', '[1,2,3,4,5]', NULL, NULL, 'no', 'no', '2019-07-31 19:38:54', '2019-07-31 19:38:54'),
(7, 6, '09:00:00', '18:00:00', NULL, 20, 1, 'yes', '[1,2,3,4,5]', NULL, NULL, 'no', 'no', '2019-07-31 19:41:25', '2019-07-31 19:41:25');

-- --------------------------------------------------------

--
-- Table structure for table `client_contacts`
--

CREATE TABLE `client_contacts` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `contact_name` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `client_details`
--

CREATE TABLE `client_details` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mobile` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `company_name` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `website` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `note` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `linkedin` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `facebook` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `twitter` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `skype` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gst_number` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `client_details`
--

INSERT INTO `client_details` (`id`, `company_id`, `user_id`, `name`, `email`, `image`, `mobile`, `company_name`, `address`, `website`, `note`, `linkedin`, `facebook`, `twitter`, `skype`, `gst_number`, `created_at`, `updated_at`) VALUES
(1, 1, 4, 'Datagroup', 'dticlient@workatask.com', NULL, NULL, 'DTI', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-06-05 00:18:49', '2019-07-30 23:36:12'),
(2, 1, 5, 'Highclick', 'hcclient@workatask.com', NULL, NULL, 'Highclick', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-06-05 00:23:12', '2019-07-30 23:36:12'),
(3, 1, 6, 'Encounterworks', 'ewclient@workatask.com', NULL, NULL, 'EncounterWorks', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-06-05 00:23:48', '2019-07-30 23:36:12'),
(4, 1, 21, 'clinet', 'client@workatask.com', NULL, NULL, 'client', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-08-14 20:35:23', '2019-08-14 20:35:23');

-- --------------------------------------------------------

--
-- Table structure for table `companies`
--

CREATE TABLE `companies` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_name` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `company_email` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `company_phone` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `logo` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `login_background` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8_unicode_ci NOT NULL,
  `website` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `currency_id` int(10) UNSIGNED DEFAULT NULL,
  `package_id` int(10) UNSIGNED DEFAULT NULL,
  `package_type` enum('monthly','annual') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'monthly',
  `timezone` varchar(191) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Asia/Kolkata',
  `date_format` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'd-m-Y',
  `time_format` varchar(20) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'h:i a',
  `locale` varchar(191) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'en',
  `latitude` decimal(10,8) NOT NULL DEFAULT 26.91243360,
  `longitude` decimal(11,8) NOT NULL DEFAULT 75.78727090,
  `leaves_start_from` enum('joining_date','year_start') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'joining_date',
  `active_theme` enum('default','custom') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'default',
  `status` enum('active','inactive','license_expired') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'active',
  `task_self` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'yes',
  `last_updated_by` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `stripe_id` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `card_brand` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `card_last_four` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `trial_ends_at` timestamp NULL DEFAULT NULL,
  `licence_expire_on` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `companies`
--

INSERT INTO `companies` (`id`, `company_name`, `company_email`, `company_phone`, `logo`, `login_background`, `address`, `website`, `currency_id`, `package_id`, `package_type`, `timezone`, `date_format`, `time_format`, `locale`, `latitude`, `longitude`, `leaves_start_from`, `active_theme`, `status`, `task_self`, `last_updated_by`, `created_at`, `updated_at`, `stripe_id`, `card_brand`, `card_last_four`, `trial_ends_at`, `licence_expire_on`) VALUES
(1, 'Datagroup Technologies Inc.', 'dtiadmin@workatask.com', '2523291382', NULL, NULL, '100 Fox haven Drive\r\nGreenville, NC 27858', 'dtinetworks.com', 1, 5, 'monthly', 'America/New_York', 'd-m-Y', 'h:i A', 'en', '26.91243360', '75.78727090', 'joining_date', 'default', 'active', 'yes', 7, '2019-05-31 22:26:13', '2019-07-01 18:44:53', NULL, NULL, NULL, NULL, '2020-06-12'),
(2, 'companyxyz', 'joethigpen62@gmail.com', '', NULL, NULL, '', NULL, 5, 2, 'monthly', 'America/New_York', 'd-m-Y', 'h:i a', 'en', '26.91243360', '75.78727090', 'joining_date', 'default', 'active', 'yes', NULL, '2019-06-13 00:32:44', '2019-06-13 00:32:44', NULL, NULL, NULL, NULL, '2019-06-26'),
(3, 'testco', 'joethigpen@dtihost.com', '', NULL, NULL, '', NULL, 9, 2, 'monthly', 'America/New_York', 'd-m-Y', 'h:i a', 'en', '26.91243360', '75.78727090', 'joining_date', 'default', 'active', 'yes', NULL, '2019-07-06 20:18:36', '2019-07-06 20:18:36', NULL, NULL, NULL, NULL, '2019-07-20'),
(4, 'Test Company', 'mbutler@dtinetworks.com', '', NULL, NULL, '', NULL, 13, 2, 'monthly', 'America/New_York', 'd-m-Y', 'h:i a', 'en', '26.91243360', '75.78727090', 'joining_date', 'default', 'active', 'yes', NULL, '2019-07-31 19:32:04', '2019-07-31 19:32:05', NULL, NULL, NULL, NULL, '2019-08-14'),
(5, 'test', 'matt@mabutler.us', '', NULL, NULL, '', NULL, 17, 2, 'monthly', 'America/New_York', 'd-m-Y', 'h:i a', 'en', '26.91243360', '75.78727090', 'joining_date', 'default', 'active', 'yes', NULL, '2019-07-31 19:38:54', '2019-07-31 19:38:54', NULL, NULL, NULL, NULL, '2019-08-14'),
(6, 'test hide plan', 'joeweb2@dtihost.com', '', NULL, NULL, '', NULL, 21, 4, 'monthly', 'America/New_York', 'd-m-Y', 'h:i a', 'en', '26.91243360', '75.78727090', 'joining_date', 'default', 'active', 'yes', NULL, '2019-07-31 19:41:25', '2019-07-31 19:43:12', NULL, NULL, NULL, NULL, '2019-08-31');

-- --------------------------------------------------------

--
-- Table structure for table `conversation`
--

CREATE TABLE `conversation` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_one` int(10) UNSIGNED NOT NULL,
  `user_two` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `conversation_reply`
--

CREATE TABLE `conversation_reply` (
  `id` int(10) UNSIGNED NOT NULL,
  `conversation_id` int(10) UNSIGNED NOT NULL,
  `reply` text COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE `countries` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `is_visible` tinyint(4) NOT NULL,
  `iso_alpha2` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `iso_alpha3` char(2) COLLATE utf8_unicode_ci NOT NULL,
  `iso_numeric` int(10) UNSIGNED NOT NULL,
  `currency_code` varchar(3) COLLATE utf8_unicode_ci NOT NULL,
  `currency_name` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `currency_symbol` varchar(3) COLLATE utf8_unicode_ci NOT NULL,
  `flag` varchar(6) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`id`, `name`, `is_visible`, `iso_alpha2`, `iso_alpha3`, `iso_numeric`, `currency_code`, `currency_name`, `currency_symbol`, `flag`) VALUES
(1, 'Aruba', 1, 'AW', 'AB', 0, 'AWG', 'Guilder', 'ƒ', 'aw.png'),
(2, 'Afghanistan', 1, 'AF', 'AF', 0, 'AFN', 'Afghani', '؋', 'af.png'),
(3, 'Angola', 1, 'AO', 'AG', 0, 'AOA', 'Kwanza', 'Kz', 'ao.png'),
(4, 'Anguilla', 1, 'AI', 'AI', 0, 'XCD', 'Dollar', '$', 'ai.png'),
(5, 'Albania', 1, 'AL', 'AL', 0, 'ALL', 'Lek', 'Lek', 'al.png'),
(6, 'Andorra', 1, 'AD', 'AN', 0, 'EUR', 'Euro', '€', 'ad.png'),
(7, 'Netherlands Antilles', 1, 'AN', 'AN', 0, 'ANG', 'Guilder', 'ƒ', 'an.png'),
(8, 'United Arab Emirates', 1, 'AE', 'AR', 0, 'AED', 'Dirham', '', 'ae.png'),
(9, 'Argentina', 1, 'AR', 'AR', 0, 'ARS', 'Peso', '$', 'ar.png'),
(10, 'Armenia', 1, 'AM', 'AR', 0, 'AMD', 'Dram', '', 'am.png'),
(11, 'American Samoa', 1, 'AS', 'AS', 0, 'USD', 'Dollar', '$', 'as.png'),
(12, 'Antarctica', 1, 'AQ', 'AT', 0, '', '', '', 'aq.png'),
(13, 'French Southern territories', 1, 'TF', 'AT', 0, 'EUR', 'Euro  ', '€', 'tf.png'),
(14, 'Antigua and Barbuda', 1, 'AG', 'AT', 0, 'XCD', 'Dollar', '$', 'ag.png'),
(15, 'Australia', 1, 'AU', 'AU', 0, 'AUD', 'Dollar', '$', 'au.png'),
(16, 'Austria', 1, 'AT', 'AU', 0, 'EUR', 'Euro', '€', 'at.png'),
(17, 'Azerbaijan', 1, 'AZ', 'AZ', 0, 'AZN', 'Manat', 'ман', 'az.png'),
(18, 'Burundi', 1, 'BI', 'BD', 0, 'BIF', 'Franc', '', 'bi.png'),
(19, 'Belgium', 1, 'BE', 'BE', 0, 'EUR', 'Euro', '€', 'be.png'),
(20, 'Benin', 1, 'BJ', 'BE', 0, 'XOF', 'Franc', '', 'bj.png'),
(21, 'Burkina Faso', 1, 'BF', 'BF', 0, 'XOF', 'Franc', '', 'bf.png'),
(22, 'Bangladesh', 1, 'BD', 'BG', 0, 'BDT', 'Taka', '', 'bd.png'),
(23, 'Bulgaria', 1, 'BG', 'BG', 0, 'BGN', 'Lev', 'лв', 'bg.png'),
(24, 'Bahrain', 1, 'BH', 'BH', 0, 'BHD', 'Dinar', '', 'bh.png'),
(25, 'Bahamas', 1, 'BS', 'BH', 0, 'BSD', 'Dollar', '$', 'bs.png'),
(26, 'Bosnia and Herzegovina', 1, 'BA', 'BI', 0, 'BAM', 'Marka', 'KM', 'ba.png'),
(27, 'Belarus', 1, 'BY', 'BL', 0, 'BYR', 'Ruble', 'p.', 'by.png'),
(28, 'Belize', 1, 'BZ', 'BL', 0, 'BZD', 'Dollar', 'BZ$', 'bz.png'),
(29, 'Bermuda', 1, 'BM', 'BM', 0, 'BMD', 'Dollar', '$', 'bm.png'),
(30, 'Bolivia', 1, 'BO', 'BO', 0, 'BOB', 'Boliviano', '$b', 'bo.png'),
(31, 'Brazil', 1, 'BR', 'BR', 0, 'BRL', 'Real', 'R$', 'br.png'),
(32, 'Barbados', 1, 'BB', 'BR', 0, 'BBD', 'Dollar', '$', 'bb.png'),
(33, 'Brunei', 1, 'BN', 'BR', 0, 'BND', 'Dollar', '$', 'bn.png'),
(34, 'Bhutan', 1, 'BT', 'BT', 0, 'BTN', 'Ngultrum', '', 'bt.png'),
(35, 'Bouvet Island', 1, 'BV', 'BV', 0, 'NOK', 'Krone', 'kr', 'bv.png'),
(36, 'Botswana', 1, 'BW', 'BW', 0, 'BWP', 'Pula', 'P', 'bw.png'),
(37, 'Central African Republic', 1, 'CF', 'CA', 0, 'XAF', 'Franc', 'FCF', 'cf.png'),
(38, 'Canada', 1, 'CA', 'CA', 0, 'CAD', 'Dollar', '$', 'ca.png'),
(40, 'Switzerland', 1, 'CH', 'CH', 0, 'CHF', 'Franc', 'CHF', 'ch.png'),
(41, 'Chile', 1, 'CL', 'CH', 0, 'CLP', 'Peso', '', 'cl.png'),
(42, 'China', 1, 'CN', 'CH', 0, 'CNY', 'Yuan Renminbi', '¥', 'cn.png'),
(44, 'Cameroon', 1, 'CM', 'CM', 0, 'XAF', 'Franc', 'FCF', 'cm.png'),
(47, 'Cook Islands', 1, 'CK', 'CO', 0, 'NZD', 'Dollar', '$', 'ck.png'),
(48, 'Colombia', 1, 'CO', 'CO', 0, 'COP', 'Peso', '$', 'co.png'),
(49, 'Comoros', 1, 'KM', 'CO', 0, 'KMF', 'Franc', '', 'km.png'),
(50, 'Cape Verde', 1, 'CV', 'CP', 0, 'CVE', 'Escudo', '', 'cv.png'),
(51, 'Costa Rica', 1, 'CR', 'CR', 0, 'CRC', 'Colon', '₡', 'cr.png'),
(52, 'Cuba', 1, 'CU', 'CU', 0, 'CUP', 'Peso', '₱', 'cu.png'),
(53, 'Christmas Island', 1, 'CX', 'CX', 0, 'AUD', 'Dollar', '$', 'cx.png'),
(54, 'Cayman Islands', 1, 'KY', 'CY', 0, 'KYD', 'Dollar', '$', 'ky.png'),
(55, 'Cyprus', 1, 'CY', 'CY', 0, 'CYP', 'Pound', '', 'cy.png'),
(56, 'Czech Republic', 1, 'CZ', 'CZ', 0, 'CZK', 'Koruna', 'Kč', 'cz.png'),
(57, 'Germany', 1, 'DE', 'DE', 0, 'EUR', 'Euro', '€', 'de.png'),
(58, 'Djibouti', 1, 'DJ', 'DJ', 0, 'DJF', 'Franc', '', 'dj.png'),
(59, 'Dominica', 1, 'DM', 'DM', 0, 'XCD', 'Dollar', '$', 'dm.png'),
(60, 'Denmark', 1, 'DK', 'DN', 0, 'DKK', 'Krone', 'kr', 'dk.png'),
(61, 'Dominican Republic', 1, 'DO', 'DO', 0, 'DOP', 'Peso', 'RD$', 'do.png'),
(62, 'Algeria', 1, 'DZ', 'DZ', 0, 'DZD', 'Dinar', '', 'dz.png'),
(63, 'Ecuador', 1, 'EC', 'EC', 0, 'USD', 'Dollar', '$', 'ec.png'),
(64, 'Egypt', 1, 'EG', 'EG', 0, 'EGP', 'Pound', '£', 'eg.png'),
(65, 'Eritrea', 1, 'ER', 'ER', 0, 'ERN', 'Nakfa', 'Nfk', 'er.png'),
(66, 'Western Sahara', 1, 'EH', 'ES', 0, 'MAD', 'Dirham', '', 'eh.png'),
(67, 'Spain', 1, 'ES', 'ES', 0, 'EUR', 'Euro', '€', 'es.png'),
(68, 'Estonia', 1, 'EE', 'ES', 0, 'EEK', 'Kroon', 'kr', 'ee.png'),
(69, 'Ethiopia', 1, 'ET', 'ET', 0, 'ETB', 'Birr', '', 'et.png'),
(70, 'Finland', 1, 'FI', 'FI', 0, 'EUR', 'Euro', '€', 'fi.png'),
(72, 'Falkland Islands', 1, 'FK', 'FL', 0, 'FKP', 'Pound', '£', 'fk.png'),
(73, 'France', 1, 'FR', 'FR', 0, 'EUR', 'Euro', '€', 'fr.png'),
(74, 'Faroe Islands', 1, 'FO', 'FR', 0, 'DKK', 'Krone', 'kr', 'fo.png'),
(76, 'Gabon', 1, 'GA', 'GA', 0, 'XAF', 'Franc', 'FCF', 'ga.png'),
(77, 'United Kingdom', 1, 'GB', 'GB', 0, 'GBP', 'Pound', '£', 'gb.png'),
(78, 'Georgia', 1, 'GE', 'GE', 0, 'GEL', 'Lari', '', 'ge.png'),
(79, 'Ghana', 1, 'GH', 'GH', 0, 'GHC', 'Cedi', '¢', 'gh.png'),
(80, 'Gibraltar', 1, 'GI', 'GI', 0, 'GIP', 'Pound', '£', 'gi.png'),
(81, 'Guinea', 1, 'GN', 'GI', 0, 'GNF', 'Franc', '', 'gn.png'),
(82, 'Guadeloupe', 1, 'GP', 'GL', 0, 'EUR', 'Euro', '€', 'gp.png'),
(83, 'Gambia', 1, 'GM', 'GM', 0, 'GMD', 'Dalasi', 'D', 'gm.png'),
(84, 'Guinea-Bissau', 1, 'GW', 'GN', 0, 'XOF', 'Franc', '', 'gw.png'),
(85, 'Equatorial Guinea', 1, 'GQ', 'GN', 0, 'XAF', 'Franc', 'FCF', 'gq.png'),
(86, 'Greece', 1, 'GR', 'GR', 0, 'EUR', 'Euro', '€', 'gr.png'),
(87, 'Grenada', 1, 'GD', 'GR', 0, 'XCD', 'Dollar', '$', 'gd.png'),
(88, 'Greenland', 1, 'GL', 'GR', 0, 'DKK', 'Krone', 'kr', 'gl.png'),
(89, 'Guatemala', 1, 'GT', 'GT', 0, 'GTQ', 'Quetzal', 'Q', 'gt.png'),
(90, 'French Guiana', 1, 'GF', 'GU', 0, 'EUR', 'Euro', '€', 'gf.png'),
(91, 'Guam', 1, 'GU', 'GU', 0, 'USD', 'Dollar', '$', 'gu.png'),
(92, 'Guyana', 1, 'GY', 'GU', 0, 'GYD', 'Dollar', '$', 'gy.png'),
(93, 'Hong Kong', 1, 'HK', 'HK', 0, 'HKD', 'Dollar', '$', 'hk.png'),
(95, 'Honduras', 1, 'HN', 'HN', 0, 'HNL', 'Lempira', 'L', 'hn.png'),
(96, 'Croatia', 1, 'HR', 'HR', 0, 'HRK', 'Kuna', 'kn', 'hr.png'),
(97, 'Haiti', 1, 'HT', 'HT', 0, 'HTG', 'Gourde', 'G', 'ht.png'),
(98, 'Hungary', 1, 'HU', 'HU', 0, 'HUF', 'Forint', 'Ft', 'hu.png'),
(99, 'Indonesia', 1, 'ID', 'ID', 0, 'IDR', 'Rupiah', 'Rp', 'id.png'),
(100, 'India', 1, 'IN', 'IN', 0, 'INR', 'Rupee', '₹', 'in.png'),
(101, 'British Indian Ocean Territory', 1, 'IO', 'IO', 0, 'USD', 'Dollar', '$', 'io.png'),
(102, 'Ireland', 1, 'IE', 'IR', 0, 'EUR', 'Euro', '€', 'ie.png'),
(103, 'Iran', 1, 'IR', 'IR', 0, 'IRR', 'Rial', '﷼', 'ir.png'),
(104, 'Iraq', 1, 'IQ', 'IR', 0, 'IQD', 'Dinar', '', 'iq.png'),
(105, 'Iceland', 1, 'IS', 'IS', 0, 'ISK', 'Krona', 'kr', 'is.png'),
(106, 'Israel', 1, 'IL', 'IS', 0, 'ILS', 'Shekel', '₪', 'il.png'),
(107, 'Italy', 1, 'IT', 'IT', 0, 'EUR', 'Euro', '€', 'it.png'),
(108, 'Jamaica', 1, 'JM', 'JA', 0, 'JMD', 'Dollar', '$', 'jm.png'),
(109, 'Jordan', 1, 'JO', 'JO', 0, 'JOD', 'Dinar', '', 'jo.png'),
(110, 'Japan', 1, 'JP', 'JP', 0, 'JPY', 'Yen', '¥', 'jp.png'),
(112, 'Kenya', 1, 'KE', 'KE', 0, 'KES', 'Shilling', '', 'ke.png'),
(113, 'Kyrgyzstan', 1, 'KG', 'KG', 0, 'KGS', 'Som', 'лв', 'kg.png'),
(114, 'Cambodia', 1, 'KH', 'KH', 0, 'KHR', 'Riels', '៛', 'kh.png'),
(115, 'Kiribati', 1, 'KI', 'KI', 0, 'AUD', 'Dollar', '$', 'ki.png'),
(116, 'Saint Kitts and Nevis', 1, 'KN', 'KN', 0, 'XCD', 'Dollar', '$', 'kn.png'),
(117, 'South Korea', 1, 'KR', 'KO', 0, 'KRW', 'Won', '₩', 'kr.png'),
(118, 'Kuwait', 1, 'KW', 'KW', 0, 'KWD', 'Dinar', '', 'kw.png'),
(119, 'Laos', 1, 'LA', 'LA', 0, 'LAK', 'Kip', '₭', 'la.png'),
(120, 'Lebanon', 1, 'LB', 'LB', 0, 'LBP', 'Pound', '£', 'lb.png'),
(121, 'Liberia', 1, 'LR', 'LB', 0, 'LRD', 'Dollar', '$', 'lr.png'),
(123, 'Saint Lucia', 1, 'LC', 'LC', 0, 'XCD', 'Dollar', '$', 'lc.png'),
(124, 'Liechtenstein', 1, 'LI', 'LI', 0, 'CHF', 'Franc', 'CHF', 'li.png'),
(125, 'Sri Lanka', 1, 'LK', 'LK', 0, 'LKR', 'Rupee', '₨', 'lk.png'),
(126, 'Lesotho', 1, 'LS', 'LS', 0, 'LSL', 'Loti', 'L', 'ls.png'),
(127, 'Lithuania', 1, 'LT', 'LT', 0, 'LTL', 'Litas', 'Lt', 'lt.png'),
(128, 'Luxembourg', 1, 'LU', 'LU', 0, 'EUR', 'Euro', '€', 'lu.png'),
(129, 'Latvia', 1, 'LV', 'LV', 0, 'LVL', 'Lat', 'Ls', 'lv.png'),
(130, 'Macao', 1, 'MO', 'MA', 0, 'MOP', 'Pataca', 'MOP', 'mo.png'),
(131, 'Morocco', 1, 'MA', 'MA', 0, 'MAD', 'Dirham', '', 'ma.png'),
(132, 'Monaco', 1, 'MC', 'MC', 0, 'EUR', 'Euro', '€', 'mc.png'),
(133, 'Moldova', 1, 'MD', 'MD', 0, 'MDL', 'Leu', '', 'md.png'),
(134, 'Madagascar', 1, 'MG', 'MD', 0, 'MGA', 'Ariary', '', 'mg.png'),
(135, 'Maldives', 1, 'MV', 'MD', 0, 'MVR', 'Rufiyaa', 'Rf', 'mv.png'),
(136, 'Mexico', 1, 'MX', 'ME', 0, 'MXN', 'Peso', '$', 'mx.png'),
(137, 'Marshall Islands', 1, 'MH', 'MH', 0, 'USD', 'Dollar', '$', 'mh.png'),
(138, 'Macedonia', 1, 'MK', 'MK', 0, 'MKD', 'Denar', 'ден', 'mk.png'),
(139, 'Mali', 1, 'ML', 'ML', 0, 'XOF', 'Franc', '', 'ml.png'),
(140, 'Malta', 1, 'MT', 'ML', 0, 'MTL', 'Lira', '', 'mt.png'),
(141, 'Myanmar', 1, 'MM', 'MM', 0, 'MMK', 'Kyat', 'K', 'mm.png'),
(142, 'Mongolia', 1, 'MN', 'MN', 0, 'MNT', 'Tugrik', '₮', 'mn.png'),
(143, 'Northern Mariana Islands', 1, 'MP', 'MN', 0, 'USD', 'Dollar', '$', 'mp.png'),
(144, 'Mozambique', 1, 'MZ', 'MO', 0, 'MZN', 'Meticail', 'MT', 'mz.png'),
(145, 'Mauritania', 1, 'MR', 'MR', 0, 'MRO', 'Ouguiya', 'UM', 'mr.png'),
(146, 'Montserrat', 1, 'MS', 'MS', 0, 'XCD', 'Dollar', '$', 'ms.png'),
(147, 'Martinique', 1, 'MQ', 'MT', 0, 'EUR', 'Euro', '€', 'mq.png'),
(148, 'Mauritius', 1, 'MU', 'MU', 0, 'MUR', 'Rupee', '₨', 'mu.png'),
(149, 'Malawi', 1, 'MW', 'MW', 0, 'MWK', 'Kwacha', 'MK', 'mw.png'),
(150, 'Malaysia', 1, 'MY', 'MY', 0, 'MYR', 'Ringgit', 'RM', 'my.png'),
(151, 'Mayotte', 1, 'YT', 'MY', 0, 'EUR', 'Euro', '€', 'yt.png'),
(152, 'Namibia', 1, 'NA', 'NA', 0, 'NAD', 'Dollar', '$', 'na.png'),
(153, 'New Caledonia', 1, 'NC', 'NC', 0, 'XPF', 'Franc', '', 'nc.png'),
(154, 'Niger', 1, 'NE', 'NE', 0, 'XOF', 'Franc', '', 'ne.png'),
(155, 'Norfolk Island', 1, 'NF', 'NF', 0, 'AUD', 'Dollar', '$', 'nf.png'),
(156, 'Nigeria', 1, 'NG', 'NG', 0, 'NGN', 'Naira', '₦', 'ng.png'),
(157, 'Nicaragua', 1, 'NI', 'NI', 0, 'NIO', 'Cordoba', 'C$', 'ni.png'),
(158, 'Niue', 1, 'NU', 'NI', 0, 'NZD', 'Dollar', '$', 'nu.png'),
(159, 'Netherlands', 1, 'NL', 'NL', 0, 'EUR', 'Euro', '€', 'nl.png'),
(160, 'Norway', 1, 'NO', 'NO', 0, 'NOK', 'Krone', 'kr', 'no.png'),
(161, 'Nepal', 1, 'NP', 'NP', 0, 'NPR', 'Rupee', '₨', 'np.png'),
(162, 'Nauru', 1, 'NR', 'NR', 0, 'AUD', 'Dollar', '$', 'nr.png'),
(163, 'New Zealand', 1, 'NZ', 'NZ', 0, 'NZD', 'Dollar', '$', 'nz.png'),
(164, 'Oman', 1, 'OM', 'OM', 0, 'OMR', 'Rial', '﷼', 'om.png'),
(165, 'Pakistan', 1, 'PK', 'PA', 0, 'PKR', 'Rupee', '₨', 'pk.png'),
(166, 'Panama', 1, 'PA', 'PA', 0, 'PAB', 'Balboa', 'B/.', 'pa.png'),
(167, 'Pitcairn', 1, 'PN', 'PC', 0, 'NZD', 'Dollar', '$', 'pn.png'),
(168, 'Peru', 1, 'PE', 'PE', 0, 'PEN', 'Sol', 'S/.', 'pe.png'),
(169, 'Philippines', 1, 'PH', 'PH', 0, 'PHP', 'Peso', 'Php', 'ph.png'),
(170, 'Palau', 1, 'PW', 'PL', 0, 'USD', 'Dollar', '$', 'pw.png'),
(171, 'Papua New Guinea', 1, 'PG', 'PN', 0, 'PGK', 'Kina', '', 'pg.png'),
(172, 'Poland', 1, 'PL', 'PO', 0, 'PLN', 'Zloty', 'zł', 'pl.png'),
(173, 'Puerto Rico', 1, 'PR', 'PR', 0, 'USD', 'Dollar', '$', 'pr.png'),
(174, 'North Korea', 1, 'KP', 'PR', 0, 'KPW', 'Won', '₩', 'kp.png'),
(175, 'Portugal', 1, 'PT', 'PR', 0, 'EUR', 'Euro', '€', 'pt.png'),
(176, 'Paraguay', 1, 'PY', 'PR', 0, 'PYG', 'Guarani', 'Gs', 'py.png'),
(178, 'French Polynesia', 1, 'PF', 'PY', 0, 'XPF', 'Franc', '', 'pf.png'),
(179, 'Qatar', 1, 'QA', 'QA', 0, 'QAR', 'Rial', '﷼', 'qa.png'),
(181, 'Romania', 1, 'RO', 'RO', 0, 'RON', 'Leu', 'lei', 'ro.png'),
(183, 'Rwanda', 1, 'RW', 'RW', 0, 'RWF', 'Franc', '', 'rw.png'),
(184, 'Saudi Arabia', 1, 'SA', 'SA', 0, 'SAR', 'Rial', '﷼', 'sa.png'),
(185, 'Sudan', 1, 'SD', 'SD', 0, 'SDD', 'Dinar', '', 'sd.png'),
(186, 'Senegal', 1, 'SN', 'SE', 0, 'XOF', 'Franc', '', 'sn.png'),
(187, 'Singapore', 1, 'SG', 'SG', 0, 'SGD', 'Dollar', '$', 'sg.png'),
(189, 'Saint Helena', 1, 'SH', 'SH', 0, 'SHP', 'Pound', '£', 'sh.png'),
(190, 'Svalbard and Jan Mayen', 1, 'SJ', 'SJ', 0, 'NOK', 'Krone', 'kr', 'sj.png'),
(191, 'Solomon Islands', 1, 'SB', 'SL', 0, 'SBD', 'Dollar', '$', 'sb.png'),
(192, 'Sierra Leone', 1, 'SL', 'SL', 0, 'SLL', 'Leone', 'Le', 'sl.png'),
(193, 'El Salvador', 1, 'SV', 'SL', 0, 'SVC', 'Colone', '$', 'sv.png'),
(194, 'San Marino', 1, 'SM', 'SM', 0, 'EUR', 'Euro', '€', 'sm.png'),
(195, 'Somalia', 1, 'SO', 'SO', 0, 'SOS', 'Shilling', 'S', 'so.png'),
(196, 'Saint Pierre and Miquelon', 1, 'PM', 'SP', 0, 'EUR', 'Euro', '€', 'pm.png'),
(197, 'Sao Tome and Principe', 1, 'ST', 'ST', 0, 'STD', 'Dobra', 'Db', 'st.png'),
(198, 'Suriname', 1, 'SR', 'SU', 0, 'SRD', 'Dollar', '$', 'sr.png'),
(199, 'Slovakia', 1, 'SK', 'SV', 0, 'SKK', 'Koruna', 'Sk', 'sk.png'),
(200, 'Slovenia', 1, 'SI', 'SV', 0, 'EUR', 'Euro', '€', 'si.png'),
(201, 'Sweden', 1, 'SE', 'SW', 0, 'SEK', 'Krona', 'kr', 'se.png'),
(202, 'Swaziland', 1, 'SZ', 'SW', 0, 'SZL', 'Lilangeni', '', 'sz.png'),
(203, 'Seychelles', 1, 'SC', 'SY', 0, 'SCR', 'Rupee', '₨', 'sc.png'),
(204, 'Syria', 1, 'SY', 'SY', 0, 'SYP', 'Pound', '£', 'sy.png'),
(205, 'Turks and Caicos Islands', 1, 'TC', 'TC', 0, 'USD', 'Dollar', '$', 'tc.png'),
(206, 'Chad', 1, 'TD', 'TC', 0, 'XAF', 'Franc', '', 'td.png'),
(207, 'Togo', 1, 'TG', 'TG', 0, 'XOF', 'Franc', '', 'tg.png'),
(208, 'Thailand', 1, 'TH', 'TH', 0, 'THB', 'Baht', '฿', 'th.png'),
(209, 'Tajikistan', 1, 'TJ', 'TJ', 0, 'TJS', 'Somoni', '', 'tj.png'),
(210, 'Tokelau', 1, 'TK', 'TK', 0, 'NZD', 'Dollar', '$', 'tk.png'),
(211, 'Turkmenistan', 1, 'TM', 'TK', 0, 'TMM', 'Manat', 'm', 'tm.png'),
(212, 'East Timor', 1, 'TL', 'TL', 0, 'USD', 'Dollar', '$', 'tl.png'),
(213, 'Tonga', 1, 'TO', 'TO', 0, 'TOP', 'Pa\"anga', 'T$', 'to.png'),
(214, 'Trinidad and Tobago', 1, 'TT', 'TT', 0, 'TTD', 'Dollar', 'TT$', 'tt.png'),
(215, 'Tunisia', 1, 'TN', 'TU', 0, 'TND', 'Dinar', '', 'tn.png'),
(216, 'Turkey', 1, 'TR', 'TU', 0, 'TRY', 'Lira', 'YTL', 'tr.png'),
(217, 'Tuvalu', 1, 'TV', 'TU', 0, 'AUD', 'Dollar', '$', 'tv.png'),
(218, 'Taiwan', 1, 'TW', 'TW', 0, 'TWD', 'Dollar', 'NT$', 'tw.png'),
(219, 'Tanzania', 1, 'TZ', 'TZ', 0, 'TZS', 'Shilling', '', 'tz.png'),
(220, 'Uganda', 1, 'UG', 'UG', 0, 'UGX', 'Shilling', '', 'ug.png'),
(221, 'Ukraine', 1, 'UA', 'UK', 0, 'UAH', 'Hryvnia', '₴', 'ua.png'),
(223, 'Uruguay', 1, 'UY', 'UR', 0, 'UYU', 'Peso', '$U', 'uy.png'),
(224, 'United States', 1, 'US', 'US', 0, 'USD', 'Dollar', '$', 'us.png'),
(225, 'Uzbekistan', 1, 'UZ', 'UZ', 0, 'UZS', 'Som', 'лв', 'uz.png'),
(228, 'Venezuela', 1, 'VE', 'VE', 0, 'VEF', 'Bolivar', 'Bs', 've.png'),
(231, 'Vietnam', 1, 'VN', 'VN', 0, 'VND', 'Dong', '₫', 'vn.png'),
(232, 'Vanuatu', 1, 'VU', 'VU', 0, 'VUV', 'Vatu', 'Vt', 'vu.png'),
(233, 'Wallis and Futuna', 1, 'WF', 'WL', 0, 'XPF', 'Franc', '', 'wf.png'),
(234, 'Samoa', 1, 'WS', 'WS', 0, 'WST', 'Tala', 'WS$', 'ws.png'),
(235, 'Yemen', 1, 'YE', 'YE', 0, 'YER', 'Rial', '﷼', 'ye.png'),
(237, 'South Africa', 1, 'ZA', 'ZA', 0, 'ZAR', 'Rand', 'R', 'za.png'),
(238, 'Zambia', 1, 'ZM', 'ZM', 0, 'ZMK', 'Kwacha', 'ZK', 'zm.png'),
(239, 'Zimbabwe', 1, 'ZW', 'ZW', 0, 'ZWD', 'Dollar', 'Z$', 'zw.png');

-- --------------------------------------------------------

--
-- Table structure for table `currencies`
--

CREATE TABLE `currencies` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `currency_name` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `currency_symbol` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `currency_code` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `exchange_rate` double DEFAULT NULL,
  `is_cryptocurrency` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  `usd_price` double DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `currencies`
--

INSERT INTO `currencies` (`id`, `company_id`, `currency_name`, `currency_symbol`, `currency_code`, `exchange_rate`, `is_cryptocurrency`, `usd_price`, `created_at`, `updated_at`) VALUES
(1, 1, 'Dollars', '$', 'USD', NULL, 'no', NULL, '2019-05-31 22:26:13', '2019-05-31 22:26:13'),
(5, 2, 'Dollars', '$', 'USD', NULL, 'no', NULL, '2019-06-13 00:32:44', '2019-06-13 00:32:44'),
(6, 2, 'Pounds', '£', 'GBP', NULL, 'no', NULL, '2019-06-13 00:32:44', '2019-06-13 00:32:44'),
(7, 2, 'Euros', '€', 'EUR', NULL, 'no', NULL, '2019-06-13 00:32:44', '2019-06-13 00:32:44'),
(8, 2, 'Rupee', '₹', 'INR', NULL, 'no', NULL, '2019-06-13 00:32:44', '2019-06-13 00:32:44'),
(9, 3, 'Dollars', '$', 'USD', NULL, 'no', NULL, '2019-07-06 20:18:36', '2019-07-06 20:18:36'),
(10, 3, 'Pounds', '£', 'GBP', NULL, 'no', NULL, '2019-07-06 20:18:36', '2019-07-06 20:18:36'),
(11, 3, 'Euros', '€', 'EUR', NULL, 'no', NULL, '2019-07-06 20:18:36', '2019-07-06 20:18:36'),
(12, 3, 'Rupee', '₹', 'INR', NULL, 'no', NULL, '2019-07-06 20:18:36', '2019-07-06 20:18:36'),
(13, 4, 'Dollars', '$', 'USD', NULL, 'no', NULL, '2019-07-31 19:32:04', '2019-07-31 19:32:04'),
(14, 4, 'Pounds', '£', 'GBP', NULL, 'no', NULL, '2019-07-31 19:32:05', '2019-07-31 19:32:05'),
(15, 4, 'Euros', '€', 'EUR', NULL, 'no', NULL, '2019-07-31 19:32:05', '2019-07-31 19:32:05'),
(16, 4, 'Rupee', '₹', 'INR', NULL, 'no', NULL, '2019-07-31 19:32:05', '2019-07-31 19:32:05'),
(17, 5, 'Dollars', '$', 'USD', NULL, 'no', NULL, '2019-07-31 19:38:54', '2019-07-31 19:38:54'),
(18, 5, 'Pounds', '£', 'GBP', NULL, 'no', NULL, '2019-07-31 19:38:54', '2019-07-31 19:38:54'),
(19, 5, 'Euros', '€', 'EUR', NULL, 'no', NULL, '2019-07-31 19:38:54', '2019-07-31 19:38:54'),
(20, 5, 'Rupee', '₹', 'INR', NULL, 'no', NULL, '2019-07-31 19:38:54', '2019-07-31 19:38:54'),
(21, 6, 'Dollars', '$', 'USD', NULL, 'no', NULL, '2019-07-31 19:41:25', '2019-07-31 19:41:25'),
(22, 6, 'Pounds', '£', 'GBP', NULL, 'no', NULL, '2019-07-31 19:41:25', '2019-07-31 19:41:25'),
(23, 6, 'Euros', '€', 'EUR', NULL, 'no', NULL, '2019-07-31 19:41:25', '2019-07-31 19:41:25'),
(24, 6, 'Rupee', '₹', 'INR', NULL, 'no', NULL, '2019-07-31 19:41:25', '2019-07-31 19:41:25');

-- --------------------------------------------------------

--
-- Table structure for table `custom_fields`
--

CREATE TABLE `custom_fields` (
  `id` int(10) UNSIGNED NOT NULL,
  `custom_field_group_id` int(10) UNSIGNED DEFAULT NULL,
  `label` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `required` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  `values` varchar(5000) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `custom_fields_data`
--

CREATE TABLE `custom_fields_data` (
  `id` int(10) UNSIGNED NOT NULL,
  `custom_field_id` int(10) UNSIGNED NOT NULL,
  `model_id` int(10) UNSIGNED NOT NULL,
  `model` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` varchar(10000) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `custom_field_groups`
--

CREATE TABLE `custom_field_groups` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `name` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `model` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `custom_field_groups`
--

INSERT INTO `custom_field_groups` (`id`, `company_id`, `name`, `model`) VALUES
(1, 1, 'Client', 'App\\ClientDetails'),
(2, 1, 'Employee', 'App\\EmployeeDetails'),
(3, 1, 'Project', 'App\\Project'),
(4, 2, 'Client', 'App\\ClientDetails'),
(5, 2, 'Employee', 'App\\EmployeeDetails'),
(6, 2, 'Project', 'App\\Project'),
(7, 3, 'Client', 'App\\ClientDetails'),
(8, 3, 'Employee', 'App\\EmployeeDetails'),
(9, 3, 'Project', 'App\\Project'),
(10, 4, 'Client', 'App\\ClientDetails'),
(11, 4, 'Employee', 'App\\EmployeeDetails'),
(12, 4, 'Project', 'App\\Project'),
(13, 5, 'Client', 'App\\ClientDetails'),
(14, 5, 'Employee', 'App\\EmployeeDetails'),
(15, 5, 'Project', 'App\\Project'),
(16, 6, 'Client', 'App\\ClientDetails'),
(17, 6, 'Employee', 'App\\EmployeeDetails'),
(18, 6, 'Project', 'App\\Project');

-- --------------------------------------------------------

--
-- Table structure for table `email_notification_settings`
--

CREATE TABLE `email_notification_settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `setting_name` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `send_email` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  `send_slack` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  `send_push` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `email_notification_settings`
--

INSERT INTO `email_notification_settings` (`id`, `company_id`, `setting_name`, `send_email`, `send_slack`, `send_push`, `created_at`, `updated_at`) VALUES
(7, 1, 'New Expense/Added by Admin', 'yes', 'no', 'no', '2019-05-31 22:26:13', '2019-05-31 22:26:13'),
(8, 1, 'New Expense/Added by Member', 'yes', 'no', 'no', '2019-05-31 22:26:13', '2019-05-31 22:26:13'),
(9, 1, 'Expense Status Changed', 'yes', 'no', 'no', '2019-05-31 22:26:13', '2019-05-31 22:26:13'),
(10, 1, 'New Support Ticket Request', 'yes', 'no', 'no', '2019-05-31 22:26:13', '2019-05-31 22:26:13'),
(11, 1, 'User Registration/Added by Admin', 'yes', 'no', 'no', '2019-05-31 22:26:13', '2019-05-31 22:26:13'),
(12, 1, 'Employee Assign to Project', 'yes', 'no', 'no', '2019-05-31 22:26:13', '2019-05-31 22:26:13'),
(13, 1, 'New Notice Published', 'yes', 'no', 'no', '2019-05-31 22:26:13', '2019-06-07 17:04:51'),
(14, 1, 'User Assign to Task', 'yes', 'no', 'no', '2019-05-31 22:26:13', '2019-05-31 22:26:13'),
(15, 1, 'New Leave Application', 'yes', 'no', 'no', '2019-05-31 22:26:13', '2019-05-31 22:26:13'),
(16, 1, 'Task Completed', 'yes', 'no', 'no', '2019-05-31 22:26:13', '2019-05-31 22:26:13'),
(17, 1, 'Invoice Create/Update Notification', 'yes', 'no', 'no', '2019-05-31 22:26:13', '2019-05-31 22:26:13'),
(18, NULL, 'User Registration/Added by Admin', 'yes', 'no', 'no', '2019-05-31 22:26:13', '2019-05-31 22:26:13'),
(19, NULL, 'Employee Assign to Project', 'yes', 'no', 'no', '2019-05-31 22:26:13', '2019-05-31 22:26:13'),
(20, NULL, 'New Notice Published', 'no', 'no', 'no', '2019-05-31 22:26:13', '2019-05-31 22:26:13'),
(21, NULL, 'User Assign to Task', 'yes', 'no', 'no', '2019-05-31 22:26:13', '2019-05-31 22:26:13'),
(22, 2, 'New Expense/Added by Admin', 'yes', 'no', 'no', '2019-06-13 00:32:44', '2019-06-13 00:32:44'),
(23, 2, 'New Expense/Added by Member', 'yes', 'no', 'no', '2019-06-13 00:32:44', '2019-06-13 00:32:44'),
(24, 2, 'Expense Status Changed', 'yes', 'no', 'no', '2019-06-13 00:32:44', '2019-06-13 00:32:44'),
(25, 2, 'New Support Ticket Request', 'yes', 'no', 'no', '2019-06-13 00:32:44', '2019-06-13 00:32:44'),
(26, 2, 'User Registration/Added by Admin', 'yes', 'no', 'no', '2019-06-13 00:32:44', '2019-06-13 00:32:44'),
(27, 2, 'Employee Assign to Project', 'yes', 'no', 'no', '2019-06-13 00:32:44', '2019-06-13 00:32:44'),
(28, 2, 'New Notice Published', 'no', 'no', 'no', '2019-06-13 00:32:44', '2019-06-13 00:32:44'),
(29, 2, 'User Assign to Task', 'yes', 'no', 'no', '2019-06-13 00:32:44', '2019-06-13 00:32:44'),
(30, 2, 'New Leave Application', 'yes', 'no', 'no', '2019-06-13 00:32:44', '2019-06-13 00:32:44'),
(31, 2, 'Task Completed', 'yes', 'no', 'no', '2019-06-13 00:32:44', '2019-06-13 00:32:44'),
(32, 2, 'Invoice Create/Update Notification', 'yes', 'no', 'no', '2019-06-13 00:32:44', '2019-06-13 00:32:44'),
(33, 3, 'New Expense/Added by Admin', 'yes', 'no', 'no', '2019-07-06 20:18:36', '2019-07-06 20:18:36'),
(34, 3, 'New Expense/Added by Member', 'yes', 'no', 'no', '2019-07-06 20:18:36', '2019-07-06 20:18:36'),
(35, 3, 'Expense Status Changed', 'yes', 'no', 'no', '2019-07-06 20:18:36', '2019-07-06 20:18:36'),
(36, 3, 'New Support Ticket Request', 'yes', 'no', 'no', '2019-07-06 20:18:36', '2019-07-06 20:18:36'),
(37, 3, 'User Registration/Added by Admin', 'yes', 'no', 'no', '2019-07-06 20:18:36', '2019-07-06 20:18:36'),
(38, 3, 'Employee Assign to Project', 'yes', 'no', 'no', '2019-07-06 20:18:36', '2019-07-06 20:18:36'),
(39, 3, 'New Notice Published', 'no', 'no', 'no', '2019-07-06 20:18:36', '2019-07-06 20:18:36'),
(40, 3, 'User Assign to Task', 'yes', 'no', 'no', '2019-07-06 20:18:36', '2019-07-06 20:18:36'),
(41, 3, 'New Leave Application', 'yes', 'no', 'no', '2019-07-06 20:18:36', '2019-07-06 20:18:36'),
(42, 3, 'Task Completed', 'yes', 'no', 'no', '2019-07-06 20:18:36', '2019-07-06 20:18:36'),
(43, 3, 'Invoice Create/Update Notification', 'yes', 'no', 'no', '2019-07-06 20:18:36', '2019-07-06 20:18:36'),
(44, 4, 'New Expense/Added by Admin', 'yes', 'no', 'no', '2019-07-31 19:32:04', '2019-07-31 19:32:04'),
(45, 4, 'New Expense/Added by Member', 'yes', 'no', 'no', '2019-07-31 19:32:04', '2019-07-31 19:32:04'),
(46, 4, 'Expense Status Changed', 'yes', 'no', 'no', '2019-07-31 19:32:04', '2019-07-31 19:32:04'),
(47, 4, 'New Support Ticket Request', 'yes', 'no', 'no', '2019-07-31 19:32:04', '2019-07-31 19:32:04'),
(48, 4, 'User Registration/Added by Admin', 'yes', 'no', 'no', '2019-07-31 19:32:04', '2019-07-31 19:32:04'),
(49, 4, 'Employee Assign to Project', 'yes', 'no', 'no', '2019-07-31 19:32:04', '2019-07-31 19:32:04'),
(50, 4, 'New Notice Published', 'no', 'no', 'no', '2019-07-31 19:32:04', '2019-07-31 19:32:04'),
(51, 4, 'User Assign to Task', 'yes', 'no', 'no', '2019-07-31 19:32:04', '2019-07-31 19:32:04'),
(52, 4, 'New Leave Application', 'yes', 'no', 'no', '2019-07-31 19:32:04', '2019-07-31 19:32:04'),
(53, 4, 'Task Completed', 'yes', 'no', 'no', '2019-07-31 19:32:04', '2019-07-31 19:32:04'),
(54, 4, 'Invoice Create/Update Notification', 'yes', 'no', 'no', '2019-07-31 19:32:04', '2019-07-31 19:32:04'),
(55, 5, 'New Expense/Added by Admin', 'yes', 'no', 'no', '2019-07-31 19:38:54', '2019-07-31 19:38:54'),
(56, 5, 'New Expense/Added by Member', 'yes', 'no', 'no', '2019-07-31 19:38:54', '2019-07-31 19:38:54'),
(57, 5, 'Expense Status Changed', 'yes', 'no', 'no', '2019-07-31 19:38:54', '2019-07-31 19:38:54'),
(58, 5, 'New Support Ticket Request', 'yes', 'no', 'no', '2019-07-31 19:38:54', '2019-07-31 19:38:54'),
(59, 5, 'User Registration/Added by Admin', 'yes', 'no', 'no', '2019-07-31 19:38:54', '2019-07-31 19:38:54'),
(60, 5, 'Employee Assign to Project', 'yes', 'no', 'no', '2019-07-31 19:38:54', '2019-07-31 19:38:54'),
(61, 5, 'New Notice Published', 'no', 'no', 'no', '2019-07-31 19:38:54', '2019-07-31 19:38:54'),
(62, 5, 'User Assign to Task', 'yes', 'no', 'no', '2019-07-31 19:38:54', '2019-07-31 19:38:54'),
(63, 5, 'New Leave Application', 'yes', 'no', 'no', '2019-07-31 19:38:54', '2019-07-31 19:38:54'),
(64, 5, 'Task Completed', 'yes', 'no', 'no', '2019-07-31 19:38:54', '2019-07-31 19:38:54'),
(65, 5, 'Invoice Create/Update Notification', 'yes', 'no', 'no', '2019-07-31 19:38:54', '2019-07-31 19:38:54'),
(66, 6, 'New Expense/Added by Admin', 'yes', 'no', 'no', '2019-07-31 19:41:25', '2019-07-31 19:41:25'),
(67, 6, 'New Expense/Added by Member', 'yes', 'no', 'no', '2019-07-31 19:41:25', '2019-07-31 19:41:25'),
(68, 6, 'Expense Status Changed', 'yes', 'no', 'no', '2019-07-31 19:41:25', '2019-07-31 19:41:25'),
(69, 6, 'New Support Ticket Request', 'yes', 'no', 'no', '2019-07-31 19:41:25', '2019-07-31 19:41:25'),
(70, 6, 'User Registration/Added by Admin', 'yes', 'no', 'no', '2019-07-31 19:41:25', '2019-07-31 19:41:25'),
(71, 6, 'Employee Assign to Project', 'yes', 'no', 'no', '2019-07-31 19:41:25', '2019-07-31 19:41:25'),
(72, 6, 'New Notice Published', 'no', 'no', 'no', '2019-07-31 19:41:25', '2019-07-31 19:41:25'),
(73, 6, 'User Assign to Task', 'yes', 'no', 'no', '2019-07-31 19:41:25', '2019-07-31 19:41:25'),
(74, 6, 'New Leave Application', 'yes', 'no', 'no', '2019-07-31 19:41:25', '2019-07-31 19:41:25'),
(75, 6, 'Task Completed', 'yes', 'no', 'no', '2019-07-31 19:41:25', '2019-07-31 19:41:25'),
(76, 6, 'Invoice Create/Update Notification', 'yes', 'no', 'no', '2019-07-31 19:41:25', '2019-07-31 19:41:25');

-- --------------------------------------------------------

--
-- Table structure for table `employee_details`
--

CREATE TABLE `employee_details` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `job_title` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `address` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `hourly_rate` double DEFAULT NULL,
  `slack_username` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `joining_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `last_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `employee_details`
--

INSERT INTO `employee_details` (`id`, `company_id`, `user_id`, `job_title`, `address`, `hourly_rate`, `slack_username`, `created_at`, `updated_at`, `joining_date`, `last_date`) VALUES
(1, 1, 1, 'Project Manager', '100 Fox haven Drive\r\nGreenville, NC 27858', 50, NULL, '2019-05-31 22:26:13', '2019-06-26 20:20:02', '2019-05-31 04:00:00', '2019-06-26'),
(2, 1, 2, 'Project Manager', 'address', 50, NULL, '2019-05-31 22:26:13', '2019-05-31 22:26:13', '2019-05-31 18:26:13', NULL),
(3, 1, 7, 'CEO', '100 Fox haven Drive\r\nGreenville NC 27858', 35, NULL, '2019-06-05 03:54:58', '2019-06-08 01:07:26', '2019-06-01 04:00:00', '2019-06-04'),
(4, 1, 8, 'Controller', NULL, 40, NULL, '2019-06-08 00:53:12', '2019-06-08 00:53:12', '2019-06-01 04:00:00', '2019-06-07'),
(5, 1, 9, 'EHR Operations Manager', NULL, 40, NULL, '2019-06-08 00:54:04', '2019-06-08 00:54:04', '2019-06-01 04:00:00', '2019-06-07'),
(6, 1, 10, 'Marketing Manager', NULL, 40, NULL, '2019-06-08 01:02:08', '2019-06-08 01:02:08', '2019-06-01 04:00:00', '2019-06-07'),
(7, 1, 11, 'IT Service Manager', NULL, 40, NULL, '2019-06-08 01:02:59', '2019-06-08 01:02:59', '2019-06-01 04:00:00', '2019-06-07'),
(8, 1, 12, 'Director of Sales', NULL, 40, NULL, '2019-06-08 01:03:49', '2019-06-26 21:08:04', '2019-06-01 04:00:00', '2019-06-07'),
(9, 1, 13, 'Creative Designer', NULL, 40, NULL, '2019-06-08 01:04:36', '2019-06-08 01:04:36', '2019-06-01 04:00:00', '2019-06-07'),
(10, 1, 14, 'Marketeer', NULL, 30, NULL, '2019-06-08 01:05:34', '2019-06-08 01:05:34', '2019-06-01 04:00:00', '2019-06-07'),
(11, 1, 15, 'Marketeer', NULL, 30, NULL, '2019-06-08 01:06:12', '2019-06-08 01:06:12', '2019-06-01 04:00:00', '2019-06-07'),
(12, 1, 22, 'employee', NULL, NULL, NULL, '2019-08-14 21:05:19', '2019-08-14 21:05:19', '2019-08-14 04:00:00', '2019-08-14');

-- --------------------------------------------------------

--
-- Table structure for table `employee_docs`
--

CREATE TABLE `employee_docs` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `filename` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `hashname` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `size` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `employee_skills`
--

CREATE TABLE `employee_skills` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `skill_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `employee_teams`
--

CREATE TABLE `employee_teams` (
  `id` int(10) UNSIGNED NOT NULL,
  `team_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `employee_teams`
--

INSERT INTO `employee_teams` (`id`, `team_id`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 3, 10, '2019-06-08 01:11:32', '2019-06-08 01:11:32'),
(2, 3, 13, '2019-06-08 01:11:32', '2019-06-08 01:11:32'),
(3, 3, 14, '2019-06-08 01:11:32', '2019-06-08 01:11:32'),
(4, 3, 15, '2019-06-08 01:11:32', '2019-06-08 01:11:32'),
(5, 4, 7, '2019-06-08 01:11:57', '2019-06-08 01:11:57'),
(6, 2, 11, '2019-06-08 01:12:19', '2019-06-08 01:12:19'),
(7, 1, 9, '2019-06-08 01:12:27', '2019-06-08 01:12:27'),
(8, 5, 7, '2019-06-08 01:12:50', '2019-06-08 01:12:50'),
(9, 5, 8, '2019-06-08 01:12:50', '2019-06-08 01:12:50'),
(10, 5, 9, '2019-06-08 01:12:50', '2019-06-08 01:12:50'),
(11, 5, 10, '2019-06-08 01:12:50', '2019-06-08 01:12:50'),
(12, 5, 12, '2019-06-08 01:12:50', '2019-06-08 01:12:50'),
(13, 6, 12, '2019-06-08 01:13:00', '2019-06-08 01:13:00'),
(14, 7, 7, '2019-06-26 20:33:21', '2019-06-26 20:33:21'),
(15, 7, 8, '2019-06-26 20:33:21', '2019-06-26 20:33:21'),
(16, 7, 9, '2019-06-26 20:33:21', '2019-06-26 20:33:21'),
(17, 7, 10, '2019-06-26 20:33:21', '2019-06-26 20:33:21'),
(18, 7, 11, '2019-06-26 20:33:21', '2019-06-26 20:33:21'),
(19, 7, 12, '2019-06-26 20:33:21', '2019-06-26 20:33:21'),
(20, 7, 13, '2019-06-26 20:33:21', '2019-06-26 20:33:21'),
(21, 7, 14, '2019-06-26 20:33:21', '2019-06-26 20:33:21'),
(22, 7, 15, '2019-06-26 20:33:21', '2019-06-26 20:33:21');

-- --------------------------------------------------------

--
-- Table structure for table `estimates`
--

CREATE TABLE `estimates` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `client_id` int(10) UNSIGNED NOT NULL,
  `estimate_number` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `valid_till` date NOT NULL,
  `sub_total` double(8,2) NOT NULL,
  `total` double(8,2) NOT NULL,
  `currency_id` int(10) UNSIGNED DEFAULT NULL,
  `status` enum('declined','accepted','waiting') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'waiting',
  `note` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `discount` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `discount_type` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `estimate_items`
--

CREATE TABLE `estimate_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `tax_id` int(10) UNSIGNED DEFAULT NULL,
  `estimate_id` int(10) UNSIGNED NOT NULL,
  `item_name` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `type` enum('item','discount','tax') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'item',
  `quantity` double(8,2) NOT NULL,
  `unit_price` double(8,2) NOT NULL,
  `amount` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

CREATE TABLE `events` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `event_name` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `label_color` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `where` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `description` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `start_date_time` datetime NOT NULL,
  `end_date_time` datetime NOT NULL,
  `repeat` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  `repeat_every` int(11) DEFAULT NULL,
  `repeat_cycles` int(11) DEFAULT NULL,
  `repeat_type` enum('day','week','month','year') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'day',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `event_attendees`
--

CREATE TABLE `event_attendees` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `event_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `expenses`
--

CREATE TABLE `expenses` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `item_name` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `purchase_date` date NOT NULL,
  `purchase_from` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `price` double(8,2) NOT NULL,
  `currency_id` int(10) UNSIGNED NOT NULL,
  `project_id` int(10) UNSIGNED DEFAULT NULL,
  `bill` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `status` enum('pending','approved','rejected') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `features`
--

CREATE TABLE `features` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `image` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `icon` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` enum('image','icon') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'image',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `features`
--

INSERT INTO `features` (`id`, `title`, `description`, `image`, `icon`, `type`, `created_at`, `updated_at`) VALUES
(1, 'Drag, drop, and share your files.', '<p>Not just your messages, but all your files, images, PDFs, documents, and spreadsheets can be dropped right into worksuite and shared with anyone you want. Add comments, star for later reference, and it’s all completely searchable.</p>\n                                    <p>If you use any services like Google Drive, Dropbox, or Box, just paste the link and that document is immediately in sync and searchable too.</p>', 'drag.png', NULL, 'image', '2019-05-31 22:26:12', '2019-05-31 22:26:12'),
(2, 'Works everywhere you go', '<p>Everything in worksuite—messages, notifications, files, and all—is automatically indexed and archived so that you can have it at your fingertips whenever you want. worksuite also indexes the content of every file so you can search within PDFs, Word documents, Google docs, and more. With one search box and a set of powerful search operators, you can slice and dice your way to that one message in your communication haystack.</p>', 'everywhere.png', NULL, 'image', '2019-05-31 22:26:12', '2019-05-31 22:26:12'),
(3, 'All your tools in one place.', '<p>Connect all the tools you use to worksuite and avoid all that constant switching between apps. Set up your integration so that you get all your notifications directly within worksuite—from support requests, code check-ins, and error logs to sales leads—all of them searchable in one central archive.</p>\n                                <p>If you use any services like Google Drive, Dropbox, or Box, just paste the link and that document is immediately in sync and searchable too.</p>', 'tools.png', NULL, 'image', '2019-05-31 22:26:12', '2019-05-31 22:26:12'),
(4, 'Responsive', 'Your website works on any device: desktop, tablet or mobile.', NULL, 'fas fa-desktop', 'icon', '2019-05-31 22:26:12', '2019-05-31 22:26:12'),
(5, 'Customizable', 'You can easily read, edit, and write your own code, or change everything.', NULL, 'fas fa-wrench', 'icon', '2019-05-31 22:26:12', '2019-05-31 22:26:12'),
(6, 'UI Elements', 'There is a bunch of useful and necessary elements for developing your website.', NULL, 'fas fa-cubes', 'icon', '2019-05-31 22:26:12', '2019-05-31 22:26:12'),
(7, 'Clean Code', 'You can find our code well organized, commented and readable.', NULL, 'fas fa-code', 'icon', '2019-05-31 22:26:12', '2019-05-31 22:26:12'),
(8, 'Documented', 'As you can see in the source code, we provided a comprehensive documentation.', NULL, 'far fa-file-alt', 'icon', '2019-05-31 22:26:12', '2019-05-31 22:26:12'),
(9, 'Free Updates', 'When you purchase this template, you\'ll freely receive future updates.', NULL, 'fas fa-download', 'icon', '2019-05-31 22:26:12', '2019-05-31 22:26:12');

-- --------------------------------------------------------

--
-- Table structure for table `file_storage_settings`
--

CREATE TABLE `file_storage_settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `filesystem` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `auth_keys` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` enum('enabled','disabled') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'disabled',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `file_storage_settings`
--

INSERT INTO `file_storage_settings` (`id`, `company_id`, `filesystem`, `auth_keys`, `status`, `created_at`, `updated_at`) VALUES
(1, NULL, 'local', NULL, 'enabled', '2019-05-31 22:26:07', '2019-05-31 22:26:07'),
(2, 1, 'local', NULL, 'enabled', '2019-05-31 22:26:13', '2019-05-31 22:26:13'),
(3, 2, 'local', NULL, 'enabled', '2019-06-13 00:32:44', '2019-06-13 00:32:44'),
(4, 3, 'local', NULL, 'enabled', '2019-07-06 20:18:36', '2019-07-06 20:18:36'),
(5, 4, 'local', NULL, 'enabled', '2019-07-31 19:32:05', '2019-07-31 19:32:05'),
(6, 5, 'local', NULL, 'enabled', '2019-07-31 19:38:54', '2019-07-31 19:38:54'),
(7, 6, 'local', NULL, 'enabled', '2019-07-31 19:41:25', '2019-07-31 19:41:25');

-- --------------------------------------------------------

--
-- Table structure for table `front_details`
--

CREATE TABLE `front_details` (
  `id` int(10) UNSIGNED NOT NULL,
  `header_title` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `header_description` text COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `get_started_show` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'yes',
  `sign_in_show` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'yes',
  `feature_title` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `feature_description` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `price_title` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `price_description` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(60) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `front_details`
--

INSERT INTO `front_details` (`id`, `header_title`, `header_description`, `image`, `get_started_show`, `sign_in_show`, `feature_title`, `feature_description`, `price_title`, `price_description`, `address`, `phone`, `email`, `created_at`, `updated_at`) VALUES
(1, 'Project Management System', 'The most powerful and simple way to collaborate with your team', 'dashboard.jpg', 'yes', 'yes', 'Team communications for the 21st century.', NULL, 'Affordable Pricing', 'Slack for Teams is a single workspace for your small- to medium-sized company or team.', 'Company address', '+91 1234567890', 'company@example.com', '2019-05-31 22:26:12', '2019-05-31 22:26:12');

-- --------------------------------------------------------

--
-- Table structure for table `global_currencies`
--

CREATE TABLE `global_currencies` (
  `id` int(10) UNSIGNED NOT NULL,
  `currency_name` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `currency_symbol` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `currency_code` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `exchange_rate` double DEFAULT NULL,
  `usd_price` double DEFAULT NULL,
  `is_cryptocurrency` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `global_currencies`
--

INSERT INTO `global_currencies` (`id`, `currency_name`, `currency_symbol`, `currency_code`, `exchange_rate`, `usd_price`, `is_cryptocurrency`, `created_at`, `updated_at`) VALUES
(1, 'Dollars', '$', 'USD', NULL, NULL, 'no', '2019-05-31 22:26:13', '2019-05-31 22:26:13'),
(2, 'Pounds', '£', 'GBP', NULL, NULL, 'no', '2019-05-31 22:26:13', '2019-05-31 22:26:13'),
(3, 'Euros', '€', 'EUR', NULL, NULL, 'no', '2019-05-31 22:26:13', '2019-05-31 22:26:13'),
(4, 'Rupee', '₹', 'INR', NULL, NULL, 'no', '2019-05-31 22:26:13', '2019-05-31 22:26:13');

-- --------------------------------------------------------

--
-- Table structure for table `global_settings`
--

CREATE TABLE `global_settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `currency_id` int(10) UNSIGNED DEFAULT NULL,
  `timezone` varchar(191) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Asia/Kolkata',
  `locale` varchar(191) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'en',
  `company_name` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `company_email` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `company_phone` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `logo` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `login_background` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8_unicode_ci NOT NULL,
  `website` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_updated_by` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `google_map_key` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `currency_converter_key` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `google_recaptcha_key` text COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `global_settings`
--

INSERT INTO `global_settings` (`id`, `currency_id`, `timezone`, `locale`, `company_name`, `company_email`, `company_phone`, `logo`, `login_background`, `address`, `website`, `last_updated_by`, `created_at`, `updated_at`, `google_map_key`, `currency_converter_key`, `google_recaptcha_key`) VALUES
(1, 1, 'America/New_York', 'en', 'Work A Task', 'info@workatask.com', '2523291382', 'zUGk9XU1HoBJfUyXxE6lcok8rJ3MaHpRheJ7M5NP.png', NULL, '100 Fox Haven Drive\r\nGreenville NC 27858', 'workatask.com', 3, '2019-05-31 22:26:13', '2019-06-07 19:38:02', '', '', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `holidays`
--

CREATE TABLE `holidays` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `date` date NOT NULL,
  `occassion` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `invoices`
--

CREATE TABLE `invoices` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `project_id` int(10) UNSIGNED DEFAULT NULL,
  `invoice_number` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `issue_date` date NOT NULL,
  `due_date` date NOT NULL,
  `sub_total` double(8,2) NOT NULL,
  `discount` double NOT NULL DEFAULT 0,
  `discount_type` enum('percent','fixed') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'percent',
  `total` double(8,2) NOT NULL,
  `currency_id` int(10) UNSIGNED DEFAULT NULL,
  `status` enum('paid','unpaid','partial') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'unpaid',
  `recurring` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  `billing_cycle` int(11) DEFAULT NULL,
  `billing_interval` int(11) DEFAULT NULL,
  `billing_frequency` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `file` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `file_original_name` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `note` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `invoices`
--

INSERT INTO `invoices` (`id`, `company_id`, `project_id`, `invoice_number`, `issue_date`, `due_date`, `sub_total`, `discount`, `discount_type`, `total`, `currency_id`, `status`, `recurring`, `billing_cycle`, `billing_interval`, `billing_frequency`, `file`, `file_original_name`, `note`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 2, 'INV#1', '2019-06-26', '2019-07-11', 350.00, 0, 'percent', 350.00, 1, 'unpaid', 'no', NULL, NULL, NULL, NULL, NULL, NULL, '2019-06-26 21:03:09', '2019-06-26 21:03:09', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `invoice_items`
--

CREATE TABLE `invoice_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `invoice_id` int(10) UNSIGNED NOT NULL,
  `item_name` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `type` enum('item','discount','tax') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'item',
  `quantity` double(8,2) NOT NULL,
  `unit_price` double(8,2) NOT NULL,
  `amount` double(8,2) NOT NULL,
  `tax_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `invoice_settings`
--

CREATE TABLE `invoice_settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `invoice_prefix` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `template` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `due_after` int(11) NOT NULL,
  `invoice_terms` text COLLATE utf8_unicode_ci NOT NULL,
  `gst_number` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `show_gst` enum('yes','no') COLLATE utf8_unicode_ci DEFAULT 'no',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `invoice_settings`
--

INSERT INTO `invoice_settings` (`id`, `company_id`, `invoice_prefix`, `template`, `due_after`, `invoice_terms`, `gst_number`, `show_gst`, `created_at`, `updated_at`) VALUES
(1, NULL, 'INV', 'invoice-1', 15, 'Thank you for your business. Please process this invoice within the due date.', NULL, 'no', '2019-05-31 22:26:05', '2019-05-31 22:26:05'),
(2, 1, 'INV', 'invoice-1', 15, 'Thank you for your business. Please process this invoice within the due date.', NULL, 'no', '2019-05-31 22:26:13', '2019-05-31 22:26:13'),
(3, 2, 'INV', 'invoice-1', 15, 'Thank you for your business. Please process this invoice within the due date.', NULL, 'no', '2019-06-13 00:32:44', '2019-06-13 00:32:44'),
(4, 3, 'INV', 'invoice-1', 15, 'Thank you for your business. Please process this invoice within the due date.', NULL, 'no', '2019-07-06 20:18:36', '2019-07-06 20:18:36'),
(5, 4, 'INV', 'invoice-1', 15, 'Thank you for your business. Please process this invoice within the due date.', NULL, 'no', '2019-07-31 19:32:05', '2019-07-31 19:32:05'),
(6, 5, 'INV', 'invoice-1', 15, 'Thank you for your business. Please process this invoice within the due date.', NULL, 'no', '2019-07-31 19:38:54', '2019-07-31 19:38:54'),
(7, 6, 'INV', 'invoice-1', 15, 'Thank you for your business. Please process this invoice within the due date.', NULL, 'no', '2019-07-31 19:41:25', '2019-07-31 19:41:25');

-- --------------------------------------------------------

--
-- Table structure for table `issues`
--

CREATE TABLE `issues` (
  `id` int(10) UNSIGNED NOT NULL,
  `description` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `project_id` int(10) UNSIGNED DEFAULT NULL,
  `status` enum('pending','resolved') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8_unicode_ci NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `language_settings`
--

CREATE TABLE `language_settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `language_code` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `language_name` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `status` enum('enabled','disabled') COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `language_settings`
--

INSERT INTO `language_settings` (`id`, `language_code`, `language_name`, `status`, `created_at`, `updated_at`) VALUES
(1, 'ar', 'Arabic', 'disabled', NULL, NULL),
(2, 'de', 'German', 'disabled', NULL, NULL),
(3, 'es', 'Spanish', 'enabled', NULL, NULL),
(4, 'et', 'Estonian', 'disabled', NULL, NULL),
(5, 'fa', 'Farsi', 'disabled', NULL, NULL),
(6, 'fr', 'French', 'enabled', NULL, NULL),
(7, 'gr', 'Greek', 'disabled', NULL, NULL),
(8, 'it', 'Italian', 'disabled', NULL, NULL),
(9, 'nl', 'Dutch', 'disabled', NULL, NULL),
(10, 'pl', 'Polish', 'disabled', NULL, NULL),
(11, 'pt', 'Portuguese', 'disabled', NULL, NULL),
(12, 'pt-br', 'Portuguese (Brazil)', 'disabled', NULL, NULL),
(13, 'ro', 'Romanian', 'disabled', NULL, NULL),
(14, 'ru', 'Russian', 'enabled', NULL, NULL),
(15, 'tr', 'Turkish', 'disabled', NULL, NULL),
(16, 'zh-CN', 'Chinese (S)', 'disabled', NULL, NULL),
(17, 'zh-TW', 'Chinese (T)', 'disabled', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `leads`
--

CREATE TABLE `leads` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `client_id` int(11) DEFAULT NULL,
  `source_id` int(11) DEFAULT NULL,
  `status_id` int(11) DEFAULT NULL,
  `company_name` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `website` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `client_name` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `client_email` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `mobile` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `note` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `next_follow_up` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'yes',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `lead_files`
--

CREATE TABLE `lead_files` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `lead_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `filename` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `hashname` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `size` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `google_url` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dropbox_link` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `lead_follow_up`
--

CREATE TABLE `lead_follow_up` (
  `id` int(10) UNSIGNED NOT NULL,
  `lead_id` int(10) UNSIGNED NOT NULL,
  `remark` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `next_follow_up_date` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `lead_sources`
--

CREATE TABLE `lead_sources` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `type` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `lead_sources`
--

INSERT INTO `lead_sources` (`id`, `company_id`, `type`, `created_at`, `updated_at`) VALUES
(1, NULL, 'email', NULL, NULL),
(2, NULL, 'google', NULL, NULL),
(3, NULL, 'facebook', NULL, NULL),
(4, NULL, 'friend', NULL, NULL),
(5, NULL, 'direct visit', NULL, NULL),
(6, NULL, 'tv ad', NULL, NULL),
(7, 1, 'email', NULL, NULL),
(8, 1, 'google', NULL, NULL),
(9, 1, 'facebook', NULL, NULL),
(10, 1, 'friend', NULL, NULL),
(11, 1, 'direct visit', NULL, NULL),
(12, 1, 'tv ad', NULL, NULL),
(13, 2, 'email', NULL, NULL),
(14, 2, 'google', NULL, NULL),
(15, 2, 'facebook', NULL, NULL),
(16, 2, 'friend', NULL, NULL),
(17, 2, 'direct visit', NULL, NULL),
(18, 2, 'tv ad', NULL, NULL),
(19, 3, 'email', NULL, NULL),
(20, 3, 'google', NULL, NULL),
(21, 3, 'facebook', NULL, NULL),
(22, 3, 'friend', NULL, NULL),
(23, 3, 'direct visit', NULL, NULL),
(24, 3, 'tv ad', NULL, NULL),
(25, 4, 'email', NULL, NULL),
(26, 4, 'google', NULL, NULL),
(27, 4, 'facebook', NULL, NULL),
(28, 4, 'friend', NULL, NULL),
(29, 4, 'direct visit', NULL, NULL),
(30, 4, 'tv ad', NULL, NULL),
(31, 5, 'email', NULL, NULL),
(32, 5, 'google', NULL, NULL),
(33, 5, 'facebook', NULL, NULL),
(34, 5, 'friend', NULL, NULL),
(35, 5, 'direct visit', NULL, NULL),
(36, 5, 'tv ad', NULL, NULL),
(37, 6, 'email', NULL, NULL),
(38, 6, 'google', NULL, NULL),
(39, 6, 'facebook', NULL, NULL),
(40, 6, 'friend', NULL, NULL),
(41, 6, 'direct visit', NULL, NULL),
(42, 6, 'tv ad', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `lead_status`
--

CREATE TABLE `lead_status` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `type` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `lead_status`
--

INSERT INTO `lead_status` (`id`, `company_id`, `type`, `created_at`, `updated_at`) VALUES
(1, NULL, 'pending', NULL, NULL),
(2, NULL, 'inprocess', NULL, NULL),
(3, NULL, 'converted', NULL, NULL),
(4, 1, 'pending', NULL, NULL),
(5, 1, 'inprocess', NULL, NULL),
(6, 1, 'converted', NULL, NULL),
(7, 2, 'pending', NULL, NULL),
(8, 2, 'inprocess', NULL, NULL),
(9, 2, 'converted', NULL, NULL),
(10, 3, 'pending', NULL, NULL),
(11, 3, 'inprocess', NULL, NULL),
(12, 3, 'converted', NULL, NULL),
(13, 4, 'pending', NULL, NULL),
(14, 4, 'inprocess', NULL, NULL),
(15, 4, 'converted', NULL, NULL),
(16, 5, 'pending', NULL, NULL),
(17, 5, 'inprocess', NULL, NULL),
(18, 5, 'converted', NULL, NULL),
(19, 6, 'pending', NULL, NULL),
(20, 6, 'inprocess', NULL, NULL),
(21, 6, 'converted', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `leaves`
--

CREATE TABLE `leaves` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `leave_type_id` int(10) UNSIGNED NOT NULL,
  `duration` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `leave_date` date NOT NULL,
  `reason` text COLLATE utf8_unicode_ci NOT NULL,
  `status` enum('approved','pending','rejected') COLLATE utf8_unicode_ci NOT NULL,
  `reject_reason` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `leave_types`
--

CREATE TABLE `leave_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `type_name` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `color` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `no_of_leaves` int(11) NOT NULL DEFAULT 5,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `leave_types`
--

INSERT INTO `leave_types` (`id`, `company_id`, `type_name`, `color`, `no_of_leaves`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Casual', 'success', 5, '2019-05-31 22:26:06', '2019-05-31 22:26:06'),
(2, NULL, 'Sick', 'danger', 5, '2019-05-31 22:26:06', '2019-05-31 22:26:06'),
(3, NULL, 'Earned', 'info', 5, '2019-05-31 22:26:06', '2019-05-31 22:26:06'),
(4, 1, 'Casual', 'success', 5, '2019-05-31 22:26:13', '2019-05-31 22:26:13'),
(5, 1, 'Sick', 'danger', 5, '2019-05-31 22:26:13', '2019-05-31 22:26:13'),
(6, 1, 'Earned', 'info', 5, '2019-05-31 22:26:13', '2019-05-31 22:26:13'),
(7, 2, 'Casual', 'success', 5, '2019-06-13 00:32:44', '2019-06-13 00:32:44'),
(8, 2, 'Sick', 'danger', 5, '2019-06-13 00:32:44', '2019-06-13 00:32:44'),
(9, 2, 'Earned', 'info', 5, '2019-06-13 00:32:44', '2019-06-13 00:32:44'),
(10, 3, 'Casual', 'success', 5, '2019-07-06 20:18:36', '2019-07-06 20:18:36'),
(11, 3, 'Sick', 'danger', 5, '2019-07-06 20:18:36', '2019-07-06 20:18:36'),
(12, 3, 'Earned', 'info', 5, '2019-07-06 20:18:36', '2019-07-06 20:18:36'),
(13, 4, 'Casual', 'success', 5, '2019-07-31 19:32:04', '2019-07-31 19:32:04'),
(14, 4, 'Sick', 'danger', 5, '2019-07-31 19:32:04', '2019-07-31 19:32:04'),
(15, 4, 'Earned', 'info', 5, '2019-07-31 19:32:04', '2019-07-31 19:32:04'),
(16, 5, 'Casual', 'success', 5, '2019-07-31 19:38:54', '2019-07-31 19:38:54'),
(17, 5, 'Sick', 'danger', 5, '2019-07-31 19:38:54', '2019-07-31 19:38:54'),
(18, 5, 'Earned', 'info', 5, '2019-07-31 19:38:54', '2019-07-31 19:38:54'),
(19, 6, 'Casual', 'success', 5, '2019-07-31 19:41:25', '2019-07-31 19:41:25'),
(20, 6, 'Sick', 'danger', 5, '2019-07-31 19:41:25', '2019-07-31 19:41:25'),
(21, 6, 'Earned', 'info', 5, '2019-07-31 19:41:25', '2019-07-31 19:41:25');

-- --------------------------------------------------------

--
-- Table structure for table `licences`
--

CREATE TABLE `licences` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `license_number` char(29) COLLATE utf8_unicode_ci NOT NULL,
  `package_id` int(10) UNSIGNED DEFAULT NULL,
  `company_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `contact_person` varchar(70) COLLATE utf8_unicode_ci DEFAULT NULL,
  `billing_name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `billing_address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tax_number` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `expire_date` date DEFAULT NULL,
  `last_payment_date` date DEFAULT NULL,
  `next_payment_date` date DEFAULT NULL,
  `status` enum('valid','invalid') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'valid',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `log_time_for`
--

CREATE TABLE `log_time_for` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `log_time_for` enum('project','task') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'project',
  `auto_timer_stop` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `log_time_for`
--

INSERT INTO `log_time_for` (`id`, `company_id`, `log_time_for`, `auto_timer_stop`, `created_at`, `updated_at`) VALUES
(1, 1, 'project', 'no', '2019-05-31 22:26:13', '2019-05-31 22:26:13'),
(2, 2, 'project', 'no', '2019-06-13 00:32:44', '2019-06-13 00:32:44'),
(3, 3, 'project', 'no', '2019-07-06 20:18:36', '2019-07-06 20:18:36'),
(4, 4, 'project', 'no', '2019-07-31 19:32:05', '2019-07-31 19:32:05'),
(5, 5, 'project', 'no', '2019-07-31 19:38:54', '2019-07-31 19:38:54'),
(6, 6, 'project', 'no', '2019-07-31 19:41:25', '2019-07-31 19:41:25');

-- --------------------------------------------------------

--
-- Table structure for table `ltm_translations`
--

CREATE TABLE `ltm_translations` (
  `id` int(10) UNSIGNED NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `locale` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `group` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `key` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `value` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `message_settings`
--

CREATE TABLE `message_settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `allow_client_admin` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  `allow_client_employee` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `message_settings`
--

INSERT INTO `message_settings` (`id`, `company_id`, `allow_client_admin`, `allow_client_employee`, `created_at`, `updated_at`) VALUES
(1, NULL, 'no', 'no', '2019-05-31 22:26:06', '2019-05-31 22:26:06'),
(2, 1, 'no', 'no', '2019-05-31 22:26:13', '2019-05-31 22:26:13'),
(3, 2, 'no', 'no', '2019-06-13 00:32:44', '2019-06-13 00:32:44'),
(4, 3, 'no', 'no', '2019-07-06 20:18:36', '2019-07-06 20:18:36'),
(5, 4, 'no', 'no', '2019-07-31 19:32:05', '2019-07-31 19:32:05'),
(6, 5, 'no', 'no', '2019-07-31 19:38:54', '2019-07-31 19:38:54'),
(7, 6, 'no', 'no', '2019-07-31 19:41:25', '2019-07-31 19:41:25');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_04_02_193003_create_countries_table', 1),
(2, '2014_04_02_193005_create_translations_table', 1),
(3, '2014_10_12_000000_create_users_table', 1),
(4, '2014_10_12_100000_create_password_resets_table', 1),
(5, '2016_06_20_112951_create_user_chat_table', 1),
(6, '2017_03_23_110416_add_column_users_table', 1),
(7, '2017_03_23_111036_create_client_details_table', 1),
(8, '2017_03_23_112028_create_client_contacts_table', 1),
(9, '2017_03_23_112353_create_employee_details_table', 1),
(10, '2017_03_23_114438_create_organisation_settings_table', 1),
(11, '2017_03_23_122646_create_project_category_table', 1),
(12, '2017_03_23_123601_create_projects_table', 1),
(13, '2017_03_23_125424_create_project_members_table', 1),
(14, '2017_03_23_125625_create_project_time_logs_table', 1),
(15, '2017_03_23_130413_create_project_files_table', 1),
(16, '2017_03_24_051800_create_tasks_table', 1),
(17, '2017_03_24_054355_create_notices_table', 1),
(18, '2017_03_24_055005_create_conversation_table', 1),
(19, '2017_03_24_055539_create_conversation_reply_table', 1),
(20, '2017_03_24_055859_create_invoices_table', 1),
(21, '2017_03_24_060421_create_invoice_items_table', 1),
(22, '2017_03_24_060751_create_quotations_table', 1),
(23, '2017_03_24_061241_create_quotation_items_table', 1),
(24, '2017_03_24_061505_create_sticky_notes_table', 1),
(25, '2017_03_24_064541_create_issues_table', 1),
(26, '2017_03_29_123858_entrust_setup_tables', 1),
(27, '2017_04_04_193158_AddColumnsProjectFilesTable', 1),
(28, '2017_04_05_063103_change_clientid_projectid_invoice_table', 1),
(29, '2017_04_06_051401_add_discount_column_invoice_table', 1),
(30, '2017_04_06_054728_add_status_column_issues_table', 1),
(31, '2017_04_08_152902_add_total_hours_column_time_log_table', 1),
(32, '2017_04_18_095809_create_project_activity_table', 1),
(33, '2017_04_18_103815_create_user_activities_table', 1),
(34, '2017_04_19_101519_create_email_notification_settings_table', 1),
(35, '2017_04_20_185211_add_colour_column_sticky_notes_table', 1),
(36, '2017_04_28_114154_create_notifications_table', 1),
(37, '2017_05_03_131016_add_project_completion_field_projects', 1),
(38, '2017_05_03_174333_create_currencies_table', 1),
(39, '2017_05_05_124330_create_module_settings_table', 1),
(40, '2017_05_05_233111_add_status_column_invoices', 1),
(41, '2017_05_11_140502_add_currency_symbol_column_invoices', 1),
(42, '2017_05_11_170244_add_currency_id_column_organisation_settings_table', 1),
(43, '2017_05_22_172748_add_timezone_column_settings_table', 1),
(44, '2017_05_24_120216_create_smtp_settings_table', 1),
(45, '2017_05_31_112158_create_universal_search_table', 1),
(46, '2017_06_22_131112_add_locale_organisation_settings_table', 1),
(47, '2017_07_13_091922_add_calculate_task_progress_column_project_table', 1),
(48, '2017_07_20_093528_on_delete_setnull_timelog', 1),
(49, '2017_07_21_120958_create_theme_settings_table', 1),
(50, '2017_07_24_113657_add_link_color_column_theme_settings_table', 1),
(51, '2017_07_24_123050_add_login_background_organisation_settings_table', 1),
(52, '2017_07_27_101351_add_column_type_invoice_items_table', 1),
(53, '2017_07_28_102010_create_estimates_table', 1),
(54, '2017_07_28_103230_create_estimate_items_table', 1),
(55, '2017_08_04_064431_create_payments_table', 1),
(56, '2017_08_05_103940_create_payment_gateway_credential_table', 1),
(57, '2017_08_08_055908_add_enable_paypal_column_payment_gateway_table', 1),
(58, '2017_08_09_054230_create_expenses_table', 1),
(59, '2017_08_21_065430_add_exchange_rate_column_currency_table', 1),
(60, '2017_08_21_131318_create_invoice_setting_table', 1),
(61, '2017_08_22_055908_add_expense_email_setting_to_email_notification_setting_table', 1),
(62, '2017_08_28_110759_add_recurring_columns_in_invoice_table', 1),
(63, '2017_08_30_061016_add_plan_id_to_payments_table', 1),
(64, '2017_08_30_093400_create_settings_table', 1),
(65, '2017_08_30_123956_add_slack_username_column_employee_details_table', 1),
(66, '2017_08_30_133725_add_send_slack_column_email_notification_settings_table', 1),
(67, '2017_09_01_060715_add_stipe_column_to_payment_credentials_table', 1),
(68, '2017_09_01_090124_add_customer_id_column_to_payments_table', 1),
(69, '2017_09_02_084049_add_locale_column_users_table', 1),
(70, '2017_09_14_095429_create_ticket_reply_templates_table', 1),
(71, '2017_09_14_095815_create_ticket_types_table', 1),
(72, '2017_09_14_100400_create_ticket_groups_table', 1),
(73, '2017_09_14_100530_create_ticket_tag_list_table', 1),
(74, '2017_09_14_114900_create_ticket_channels_table', 1),
(75, '2017_09_14_115003_create_ticket_agent_groups_table', 1),
(76, '2017_09_14_115004_create_tickets_table', 1),
(77, '2017_09_14_115005_create_ticket_tags_table', 1),
(78, '2017_09_18_064917_add_status_column_ticket_agent_group_table', 1),
(79, '2017_09_24_101700_create_ticket_replies_table', 1),
(80, '2017_09_25_060229_drop_description_column_ticket_table', 1),
(81, '2017_09_25_072611_add_deleted_at_column_tickets', 1),
(82, '2017_09_25_072627_add_deleted_at_column_ticket_reply', 1),
(83, '2017_10_03_094922_ticket_notification_migration', 1),
(84, '2017_10_03_134003_add_latitude_longitude_column', 1),
(85, '2017_10_12_111741_create_attendance_setting_table', 1),
(86, '2017_10_13_051909_create_attendance_table', 1),
(87, '2017_10_26_051335_add_mail_from_email_column_smtp_settings_table', 1),
(88, '2017_10_26_112253_add_office_open_days_column_attendance_settings_table', 1),
(89, '2017_11_01_054603_add_columns_to_client_details', 1),
(90, '2017_11_02_045542_change_on_cascade_project_members', 1),
(91, '2017_11_07_054438_add_project_admin_column_project_table', 1),
(92, '2017_11_07_125619_remove_project_admin_role', 1),
(93, '2017_11_08_045549_make_project_id_nullable_tasks_table', 1),
(94, '2017_11_09_071318_create_taskboard_columns_table', 1),
(95, '2017_11_09_092817_add_column_tasks_table', 1),
(96, '2017_11_20_070830_create_custom_fields_table', 1),
(97, '2017_11_20_071758_create_custom_fields__data_table', 1),
(98, '2017_11_22_071535_create_events_table', 1),
(99, '2017_11_23_065323_add_cryptocurrency_columns', 1),
(100, '2017_11_24_103957_create_event_attendees_table', 1),
(101, '2017_12_07_034433_change cascade users in time log table', 1),
(102, '2017_12_12_071823_create_modules_table', 1),
(103, '2017_12_12_073501_add_module_id_column_permissions_table', 1),
(104, '2017_12_21_114839_change_upload_folder', 1),
(105, '2017_12_28_112910_create_leave_types_table', 1),
(106, '2017_12_30_184422_create_leaves_table', 1),
(107, '2018_01_02_122442_add_leaves_notification_setting', 1),
(108, '2018_01_05_062543_add_user_css_column_theme_settings', 1),
(109, '2018_01_09_180937_add_task_completed_notification_setting', 1),
(110, '2018_01_29_073527_create_message_setting_table', 1),
(111, '2018_04_12_100452_add_dropbox_link_column_project_files_table', 1),
(112, '2018_04_12_123243_create_file_storage_table', 1),
(113, '2018_04_13_072732_create_groups_table', 1),
(114, '2018_04_13_092757_create_employee_groups_table', 1),
(115, '2018_04_17_113657_set_attendance_late_column_default', 1),
(116, '2018_05_07_065407_alter_invoice_id_null_payments', 1),
(117, '2018_05_07_065557_add_currency_id_column_payments_table', 1),
(118, '2018_05_08_064539_add_note_column_invoices', 1),
(119, '2018_05_15_072536_add_project_id_column_payments', 1),
(120, '2018_05_28_094515_set_gateway_column_null_payments_table', 1),
(122, '2018_05_29_114402_populate_file_storage_settings_table', 1),
(123, '2018_05_30_051128_add_google_url_to_project_files_table', 1),
(124, '2018_06_05_092136_create_sub_tasks_table', 1),
(125, '2018_06_06_091511_create_task_comments_table', 1),
(126, '2018_06_11_054204_create_push_subscriptions_table', 1),
(127, '2018_06_14_094059_create_taxes_table', 1),
(128, '2018_06_18_065034_add_tax_id_column_invoice_items_table', 1),
(129, '2018_06_18_071442_add_discount_column_invoice_items_table', 1),
(130, '2018_06_21_052408_change_default_taskboard_columns', 1),
(131, '2018_06_26_160023_add_leave_count_column_leave_types_table', 1),
(132, '2018_06_27_072813_add_leaves_start_from_column', 1),
(133, '2018_06_27_075233_add_joining_date_column', 1),
(134, '2018_06_27_113713_add_gender_column_users_table', 1),
(135, '2018_06_28_054604_add_client_view_task_column_project_table', 1),
(136, '2018_06_28_191256_create_language_settings_table', 1),
(137, '2018_06_29_060331_add_active_theme_column_settings', 1),
(138, '2018_06_29_081128_add_manual_timelog_column_project_timelog', 1),
(139, '2018_06_29_104709_seed_languages', 1),
(140, '2018_08_02_121259_add_minutes_column_time_log_table', 1),
(141, '2018_08_22_103829_add_leaves_module', 1),
(142, '2018_08_22_104302_add_leaves_permissions', 1),
(143, '2018_08_27_114329_add_module_list_in_module_settings', 1),
(144, '2018_08_30_065158_add_status_column_users_table', 1),
(145, '2018_08_31_095814_create_lead_table', 1),
(146, '2018_08_31_095815_create_lead_source_table', 1),
(147, '2018_08_31_095815_create_lead_status_table', 1),
(148, '2018_08_31_095816_create_lead_follow_up_table', 1),
(149, '2018_09_04_095158_alter_lead_table', 1),
(150, '2018_09_04_095816_add_lead_module', 1),
(151, '2018_09_05_102010_create_proposal_table', 1),
(152, '2018_09_05_113230_create_proposal_items_table', 1),
(153, '2018_09_07_051239_alter_lead_website_table', 1),
(154, '2018_09_15_174026_add_default_lead_settings', 1),
(155, '2018_09_17_045718_add_leads_permission', 1),
(156, '2018_09_19_091643_add_remarks_to_payments_table', 1),
(157, '2018_09_19_100708_create_products_table', 1),
(158, '2018_09_21_095816_create_offline_payment_method_table', 1),
(159, '2018_09_25_065158_alter_payment_table', 1),
(160, '2018_09_28_110029_create_log_time_for_table', 1),
(161, '2018_09_28_965158_alter_project_time_log_table', 1),
(162, '2018_10_03_121901_create_packages_table', 1),
(163, '2018_10_03_121902_alter_organisation_settings_table', 1),
(164, '2018_10_04_042418_create_licences_table', 1),
(165, '2018_10_04_082754_add_super_admin_column_in_users_table', 1),
(166, '2018_10_08_091643_alter_project_table', 1),
(167, '2018_10_08_095950_create_subscriptions_table', 1),
(168, '2018_10_08_110029_create_lead_files_table', 1),
(169, '2018_10_08_120639_add_company_id_in_users_table', 1),
(170, '2018_10_10_110029_create_holidays_table', 1),
(171, '2018_10_10_114514_add_company_id_in_teams_table', 1),
(172, '2018_10_10_120621_add_company_id_in_leads_table', 1),
(173, '2018_10_10_123601_create_project_templates_table', 1),
(174, '2018_10_10_125424_create_project_template_members_table', 1),
(175, '2018_10_10_135816_add_holiday_module', 1),
(176, '2018_10_10_251800_create_project_template_tasks_table', 1),
(177, '2018_10_11_044355_add_company_id_in_attendances_table', 1),
(178, '2018_10_11_055814_add_company_id_in_holidays_table', 1),
(179, '2018_10_11_061029_add_company_id_in_projects_table', 1),
(180, '2018_10_11_061955_add_company_id_in_project_category_table', 1),
(181, '2018_10_11_063520_add_company_id_in_project_members_table', 1),
(182, '2018_10_11_065229_add_company_id_in_invoices_table', 1),
(183, '2018_10_11_070557_add_company_id_in_project_activity_table', 1),
(184, '2018_10_11_071656_add_company_id_in_products_table', 1),
(185, '2018_10_11_072547_add_company_id_in_taxes_table', 1),
(186, '2018_10_11_081816_add_company_id_in_tasks_table', 1),
(187, '2018_10_11_083600_add_company_id_in_taskboard_columns_table', 1),
(188, '2018_10_11_100425_add_company_id_in_estimates_table', 1),
(189, '2018_10_11_101701_add_company_id_in_payments_table', 1),
(190, '2018_10_11_102047_add_company_id_in_expenses_table', 1),
(191, '2018_10_11_110008_add_company_id_in_employee_details_table', 1),
(192, '2018_10_11_115208_add_company_id_in_project_time_logs_table', 1),
(193, '2018_10_11_115805_add_company_id_in_user_activities_table', 1),
(194, '2018_10_12_045341_add_company_id_in_tickets_table', 1),
(195, '2018_10_12_051409_add_company_id_in_ticket_channels_table', 1),
(196, '2018_10_12_052646_add_company_id_in_ticket_types_table', 1),
(197, '2018_10_12_060038_add_company_id_in_ticket_groups_table', 1),
(198, '2018_10_12_061136_add_company_id_in_ticket_agent_groups_table', 1),
(199, '2018_10_12_061807_add_company_id_in_ticket_reply_templates_table', 1),
(200, '2018_10_12_072321_add_company_id_in_events_table', 1),
(201, '2018_10_12_090132_add_company_id_in_leave_types_table', 1),
(202, '2018_10_12_090146_add_company_id_in_leaves_table', 1),
(203, '2018_10_12_093431_add_company_id_in_notices_table', 1),
(204, '2018_10_12_110433_add_company_id_in_email_notification_settings_table', 1),
(205, '2018_10_12_110842_add_company_id_in_smtp_settings_table', 1),
(206, '2018_10_15_051607_add_company_id_in_currencies_table', 1),
(207, '2018_10_15_052819_create_global_settings_table', 1),
(208, '2018_10_15_065737_add_company_id_in_theme_settings_table', 1),
(209, '2018_10_15_070856_alter_currency_id_in_companies_table', 1),
(210, '2018_10_15_083914_add_company_id_in_payment_gateway_credentials_table', 1),
(211, '2018_10_15_093625_add_company_id_in_invoice_settings_table', 1),
(212, '2018_10_15_094709_add_company_id_in_slack_settings_table', 1),
(213, '2018_10_15_105445_add_company_id_in_attendance_settings_table', 1),
(214, '2018_10_15_115927_add_company_id_in_custom_field_groups_table', 1),
(215, '2018_10_16_045235_add_company_id_in_module_settings_table', 1),
(216, '2018_10_16_071301_add_company_id_in_roles_table', 1),
(217, '2018_10_16_095816_add_holiday_module_detail', 1),
(218, '2018_10_17_043749_add_company_id_in_message_settings_table', 1),
(219, '2018_10_17_052214_add_company_id_in_file_storage_settings_table', 1),
(220, '2018_10_17_063334_add_company_id_in_lead_sources_table', 1),
(221, '2018_10_17_063359_add_company_id_in_lead_status_table', 1),
(222, '2018_10_17_081757_remove_config_datatable_file', 1),
(223, '2018_10_17_965158_alter_leads_address_table', 1),
(224, '2018_10_17_965168_alter_leads_phone_table', 1),
(225, '2018_10_18_034518_create_stripe_invoices_table', 1),
(226, '2018_10_18_075228_add_column_in_global_settings_table', 1),
(227, '2018_10_18_091643_alter_attendance_setting_table', 1),
(228, '2018_10_19_045718_add_holidays_permission', 1),
(229, '2018_10_20_094413_add_products_module', 1),
(230, '2018_10_20_094504_add_products_permissions', 1),
(231, '2018_10_21_051239_alter_holiday_website_table', 1),
(232, '2018_10_22_050933_alter_state_column_companies_table', 1),
(233, '2018_10_23_071525_remove_company_id_column_smtp_settings_table', 1),
(234, '2018_10_24_041117_add_column_email_verification_code_in_users_table', 1),
(235, '2018_10_24_071300_add_file_column_to_invoices_table', 1),
(236, '2018_10_24_965158_alter_employee_detail_table', 1),
(237, '2018_10_29_965158_alter_attendance_setting_default_table', 1),
(238, '2018_11_02_061629_add_column_in_proposals_table', 1),
(239, '2018_11_10_071300_alter_user_table', 1),
(240, '2018_11_10_122646_create_task_category_table', 1),
(241, '2018_11_15_105021_alter_stripe_invoices_table', 1),
(242, '2018_11_16_072246_add_company_id_in_client_details_table', 1),
(243, '2018_11_16_104747_add_column_in_estimate_items_table', 1),
(244, '2018_11_16_112847_add_column_in_proposals_items_table', 1),
(245, '2018_11_22_044348_add_estimate_number_column_in_estimates_table', 1),
(246, '2018_11_30_965158_alter_invoice_item_table', 1),
(247, '2018_12_12_965158_alter_invoice_estimate_response_table', 1),
(248, '2018_12_14_094504_add_expenses_permissions', 1),
(249, '2018_12_14_194504_add_expenses_permissions_detail', 1),
(250, '2018_12_20_1065158_alter_company_setting_table', 1),
(251, '2018_12_20_965158_alter_estimate_quantity_table', 1),
(252, '2018_12_27_074504_check_verify_purchase_file', 1),
(253, '2018_12_28_075730_create_push_notification_settings_table', 1),
(254, '2018_12_28_082056_add_send_push_column_email_notification_table', 1),
(255, '2018_12_28_123245_add_onesignal_player_id_column_users_table', 1),
(256, '2019_01_02_1065158_alter_module_setting_table', 1),
(257, '2019_01_02_2065158_insert_module_setting_client_table', 1),
(258, '2019_01_04_110029_create_employee_docs_table', 1),
(259, '2019_01_10_063520_add_company_id_in_lead_files_table', 1),
(260, '2019_01_17_045235_add_company_id_in_project_template_table', 1),
(261, '2019_01_17_055235_add_company_id_in_task_category_table', 1),
(262, '2019_01_17_065235_add_company_id_in_employee_docs_table', 1),
(263, '2019_01_17_075235_add_company_id_in_log_time_for_table', 1),
(264, '2019_01_21_1065158_alter_task_creator_table', 1),
(265, '2019_02_06_1065158_alter_attendance_check_table', 1),
(266, '2019_02_08_174333_create_global_currencies_table', 1),
(267, '2019_02_08_275235_add_currency_id_in_global_setting_table', 1),
(268, '2019_02_11_1065158_alter_log_time_for_table', 1),
(269, '2019_02_12_2065158_insert_module_setting_client_task_table', 1),
(270, '2019_02_13_110029_create_skills_table', 1),
(271, '2019_02_13_130029_create_employee_skills_table', 1),
(272, '2019_02_15_1065158_alter_employee_end_date_table', 1),
(273, '2019_02_15_1165158_alter_custom_status_table', 1),
(274, '2019_02_20_074848_create_jobs_table', 1),
(275, '2019_02_22_1165158_add_company_currency_api_google_api', 1),
(276, '2019_02_22_1165158_add_currency_api_google_api', 1),
(277, '2019_02_25_965158_alter_package_max_size_table', 1),
(278, '2019_02_28_965158_alter_package_sort_billing_cycle_table', 1),
(279, '2019_03_04_073501_change_module_id_notice_permissions_table', 1),
(280, '2019_03_05_110029_create_front_detail_table', 1),
(281, '2019_03_05_110039_create_feature_table', 1),
(282, '2019_03_08_1165158_create_stripe_table', 1),
(283, '2019_03_08_965158_alter_invoice_project_id_null_table', 1),
(284, '2019_03_11_132024_seed_front_end_data', 1),
(285, '2019_03_18_1165158_alter_stripe_setting_table', 1),
(286, '2019_03_19_061905_add_google_recaptcha_key_column_global_settings', 1),
(287, '2019_03_19_1265158_paypal_invoice_table', 1),
(288, '2019_04_03_965158_alter_project_deadline_table', 1),
(289, '2019_04_04_074848_alter_invoice_setting_table', 1),
(290, '2019_04_04_075848_alter_client_Details_table', 1),
(291, '2019_04_04_1165158_alter_package_default_table', 1),
(292, '2019_04_10_075848_alter_company_task_table', 1),
(293, '2019_04_17_1165158_create_package_setting_table', 1),
(294, '2019_04_22_075848_alter_package_setting_table', 1),
(295, '2019_08_22_055908_add_invoice_email_setting_to_email_notification_setting_table', 1),
(296, '2019_06_05_163256_add_timezone_column_global_settings_table', 2),
(297, '2019_06_05_180258_add_locale_column_global_settings_table', 2),
(298, '2019_06_21_100408_add_name_and_email_columns_to_client_details_table', 3),
(299, '2019_07_05_083850_add_company_id_in_client_contacts_table', 3),
(300, '2019_07_09_133247_remove_invoice_unique_index', 3),
(301, '2019_07_16_145850_add_deleted_at_in_estimates_table', 3),
(302, '2019_07_16_145851_add_deleted_at_in_invoices_table', 3),
(303, '2019_07_17_145848_remove_estimate_unique_index', 3),
(304, '2019_07_19_112506_add_project_id_column_in_expenses_table', 3),
(305, '2019_07_23_095837_add_is_show_plan_in_packages_table', 4),
(306, '2019_08_29_130146_add_section_add_tag_etc', 5),
(307, '2019_08_29_130808_add_section_add_tag_on_tasks', 5),
(308, '2019_08_31_133634_add_tag_adn_other', 6),
(309, '2019_08_31_221358_create_view_arrays_table', 7),
(310, '2019_09_01_085832_add_end_time_assignee', 8),
(311, '2019_09_01_221356_add_column_view_list', 9),
(312, '2019_09_02_122521_add_team_in_task', 10),
(313, '2019_09_03_003750_add_user_id_array', 11),
(314, '2019_09_03_072115_add_company_id_to_task', 12),
(315, '2019_09_03_072542_add_cat_id_andohter_few_to_task', 13),
(316, '2018_05_29_070343_change_completed_on_column_to_datetime', 14),
(317, '2019_09_03_214115_priority', 15),
(319, '2019_09_08_010530_add_groupby_info_viewarray', 16),
(320, '2019_09_22_072401_create_recurrence_patterns_table', 17),
(321, '2019_09_22_072705_add_recurrence', 17),
(322, '2019_09_22_081758_create_task_recurrence_patterns_table', 17),
(323, '2019_09_22_145605_add_end_satrt_date', 18),
(324, '2019_09_22_203047_create_tests_table', 19),
(325, '2019_09_23_181754_sub_task_edit', 20),
(326, '2019_10_18_205047_add_complete_ofo_on', 21);

-- --------------------------------------------------------

--
-- Table structure for table `modules`
--

CREATE TABLE `modules` (
  `id` int(10) UNSIGNED NOT NULL,
  `module_name` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `modules`
--

INSERT INTO `modules` (`id`, `module_name`, `description`, `created_at`, `updated_at`) VALUES
(1, 'clients', '', NULL, NULL),
(2, 'employees', '', NULL, NULL),
(3, 'projects', 'User can view the basic details of projects assigned to him even without any permission.', NULL, NULL),
(4, 'attendance', 'User can view his own attendance even without any permission.', NULL, NULL),
(5, 'tasks', 'User can view the tasks assigned to him even without any permission.', NULL, NULL),
(6, 'estimates', '', NULL, NULL),
(7, 'invoices', '', NULL, NULL),
(8, 'payments', '', NULL, NULL),
(9, 'timelogs', '', NULL, NULL),
(10, 'tickets', 'User can view the tickets generated by him as default even without any permission.', NULL, NULL),
(11, 'events', 'User can view the events to be attended by him as default even without any permission.', NULL, NULL),
(12, 'messages', '', NULL, NULL),
(13, 'notices', '', NULL, NULL),
(14, 'leaves', 'User can view the leaves applied by him as default even without any permission.', NULL, NULL),
(15, 'leads', NULL, NULL, NULL),
(16, 'holidays', NULL, '2019-05-31 22:26:11', '2019-05-31 22:26:11'),
(17, 'products', NULL, '2019-05-31 22:26:11', '2019-05-31 22:26:11'),
(18, 'expenses', 'User can view and add(self expenses) the expenses as default even without any permission.', '2019-05-31 22:26:11', '2019-05-31 22:26:11'),
(19, 'task Pro', 'User can view his own attendance even without any permission. condition apply', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `module_settings`
--

CREATE TABLE `module_settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `module_name` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `status` enum('active','deactive') COLLATE utf8_unicode_ci NOT NULL,
  `type` enum('admin','employee','client') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'admin',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `module_settings`
--

INSERT INTO `module_settings` (`id`, `company_id`, `module_name`, `status`, `type`, `created_at`, `updated_at`) VALUES
(158, 2, 'clients', 'active', 'employee', '2019-06-13 00:32:44', '2019-06-13 00:32:44'),
(159, 2, 'clients', 'active', 'admin', '2019-06-13 00:32:44', '2019-06-13 00:32:44'),
(160, 2, 'employees', 'active', 'employee', '2019-06-13 00:32:44', '2019-06-13 00:32:44'),
(161, 2, 'employees', 'active', 'admin', '2019-06-13 00:32:44', '2019-06-13 00:32:44'),
(162, 2, 'projects', 'active', 'client', '2019-06-13 00:32:44', '2019-06-13 00:32:44'),
(163, 2, 'projects', 'active', 'employee', '2019-06-13 00:32:44', '2019-06-13 00:32:44'),
(164, 2, 'projects', 'active', 'admin', '2019-06-13 00:32:44', '2019-06-13 00:32:44'),
(165, 2, 'attendance', 'active', 'employee', '2019-06-13 00:32:44', '2019-06-13 00:32:44'),
(166, 2, 'attendance', 'active', 'admin', '2019-06-13 00:32:44', '2019-06-13 00:32:44'),
(167, 2, 'tasks', 'active', 'client', '2019-06-13 00:32:44', '2019-06-13 00:32:44'),
(168, 2, 'tasks', 'active', 'employee', '2019-06-13 00:32:44', '2019-06-13 00:32:44'),
(169, 2, 'tasks', 'active', 'admin', '2019-06-13 00:32:44', '2019-06-13 00:32:44'),
(170, 2, 'estimates', 'active', 'client', '2019-06-13 00:32:44', '2019-06-13 00:32:44'),
(171, 2, 'estimates', 'active', 'employee', '2019-06-13 00:32:44', '2019-06-13 00:32:44'),
(172, 2, 'estimates', 'active', 'admin', '2019-06-13 00:32:44', '2019-06-13 00:32:44'),
(173, 2, 'invoices', 'active', 'client', '2019-06-13 00:32:44', '2019-06-13 00:32:44'),
(174, 2, 'invoices', 'active', 'employee', '2019-06-13 00:32:44', '2019-06-13 00:32:44'),
(175, 2, 'invoices', 'active', 'admin', '2019-06-13 00:32:44', '2019-06-13 00:32:44'),
(176, 2, 'payments', 'active', 'employee', '2019-06-13 00:32:44', '2019-06-13 00:32:44'),
(177, 2, 'payments', 'active', 'admin', '2019-06-13 00:32:44', '2019-06-13 00:32:44'),
(178, 2, 'timelogs', 'active', 'employee', '2019-06-13 00:32:44', '2019-06-13 00:32:44'),
(179, 2, 'timelogs', 'active', 'admin', '2019-06-13 00:32:44', '2019-06-13 00:32:44'),
(180, 2, 'tickets', 'active', 'client', '2019-06-13 00:32:44', '2019-06-13 00:32:44'),
(181, 2, 'tickets', 'active', 'employee', '2019-06-13 00:32:44', '2019-06-13 00:32:44'),
(182, 2, 'tickets', 'active', 'admin', '2019-06-13 00:32:44', '2019-06-13 00:32:44'),
(183, 2, 'events', 'active', 'client', '2019-06-13 00:32:44', '2019-06-13 00:32:44'),
(184, 2, 'events', 'active', 'employee', '2019-06-13 00:32:44', '2019-06-13 00:32:44'),
(185, 2, 'events', 'active', 'admin', '2019-06-13 00:32:44', '2019-06-13 00:32:44'),
(186, 2, 'messages', 'active', 'client', '2019-06-13 00:32:44', '2019-06-13 00:32:44'),
(187, 2, 'messages', 'active', 'employee', '2019-06-13 00:32:44', '2019-06-13 00:32:44'),
(188, 2, 'messages', 'active', 'admin', '2019-06-13 00:32:44', '2019-06-13 00:32:44'),
(189, 2, 'notices', 'active', 'employee', '2019-06-13 00:32:44', '2019-06-13 00:32:44'),
(190, 2, 'notices', 'active', 'admin', '2019-06-13 00:32:44', '2019-06-13 00:32:44'),
(191, 2, 'leaves', 'active', 'employee', '2019-06-13 00:32:44', '2019-06-13 00:32:44'),
(192, 2, 'leaves', 'active', 'admin', '2019-06-13 00:32:44', '2019-06-13 00:32:44'),
(193, 2, 'leads', 'active', 'employee', '2019-06-13 00:32:44', '2019-06-13 00:32:44'),
(194, 2, 'leads', 'active', 'admin', '2019-06-13 00:32:44', '2019-06-13 00:32:44'),
(195, 2, 'holidays', 'active', 'employee', '2019-06-13 00:32:44', '2019-06-13 00:32:44'),
(196, 2, 'holidays', 'active', 'admin', '2019-06-13 00:32:44', '2019-06-13 00:32:44'),
(197, 2, 'products', 'active', 'employee', '2019-06-13 00:32:44', '2019-06-13 00:32:44'),
(198, 2, 'products', 'active', 'admin', '2019-06-13 00:32:44', '2019-06-13 00:32:44'),
(199, 2, 'expenses', 'active', 'employee', '2019-06-13 00:32:44', '2019-06-13 00:32:44'),
(200, 2, 'expenses', 'active', 'admin', '2019-06-13 00:32:44', '2019-06-13 00:32:44'),
(242, 3, 'clients', 'active', 'employee', '2019-07-06 20:18:36', '2019-07-06 20:18:36'),
(243, 3, 'clients', 'active', 'admin', '2019-07-06 20:18:36', '2019-07-06 20:18:36'),
(244, 3, 'employees', 'active', 'employee', '2019-07-06 20:18:36', '2019-07-06 20:18:36'),
(245, 3, 'employees', 'active', 'admin', '2019-07-06 20:18:36', '2019-07-06 20:18:36'),
(246, 3, 'projects', 'active', 'client', '2019-07-06 20:18:36', '2019-07-06 20:18:36'),
(247, 3, 'projects', 'active', 'employee', '2019-07-06 20:18:36', '2019-07-06 20:18:36'),
(248, 3, 'projects', 'active', 'admin', '2019-07-06 20:18:36', '2019-07-06 20:18:36'),
(249, 3, 'attendance', 'active', 'employee', '2019-07-06 20:18:36', '2019-07-06 20:18:36'),
(250, 3, 'attendance', 'active', 'admin', '2019-07-06 20:18:36', '2019-07-06 20:18:36'),
(251, 3, 'tasks', 'active', 'client', '2019-07-06 20:18:36', '2019-07-06 20:18:36'),
(252, 3, 'tasks', 'active', 'employee', '2019-07-06 20:18:36', '2019-07-06 20:18:36'),
(253, 3, 'tasks', 'active', 'admin', '2019-07-06 20:18:36', '2019-07-06 20:18:36'),
(254, 3, 'estimates', 'active', 'client', '2019-07-06 20:18:36', '2019-07-06 20:18:36'),
(255, 3, 'estimates', 'active', 'employee', '2019-07-06 20:18:36', '2019-07-06 20:18:36'),
(256, 3, 'estimates', 'active', 'admin', '2019-07-06 20:18:36', '2019-07-06 20:18:36'),
(257, 3, 'invoices', 'active', 'client', '2019-07-06 20:18:36', '2019-07-06 20:18:36'),
(258, 3, 'invoices', 'active', 'employee', '2019-07-06 20:18:36', '2019-07-06 20:18:36'),
(259, 3, 'invoices', 'active', 'admin', '2019-07-06 20:18:36', '2019-07-06 20:18:36'),
(260, 3, 'payments', 'active', 'employee', '2019-07-06 20:18:36', '2019-07-06 20:18:36'),
(261, 3, 'payments', 'active', 'admin', '2019-07-06 20:18:36', '2019-07-06 20:18:36'),
(262, 3, 'timelogs', 'active', 'employee', '2019-07-06 20:18:36', '2019-07-06 20:18:36'),
(263, 3, 'timelogs', 'active', 'admin', '2019-07-06 20:18:36', '2019-07-06 20:18:36'),
(264, 3, 'tickets', 'active', 'client', '2019-07-06 20:18:36', '2019-07-06 20:18:36'),
(265, 3, 'tickets', 'active', 'employee', '2019-07-06 20:18:36', '2019-07-06 20:18:36'),
(266, 3, 'tickets', 'active', 'admin', '2019-07-06 20:18:36', '2019-07-06 20:18:36'),
(267, 3, 'events', 'active', 'client', '2019-07-06 20:18:36', '2019-07-06 20:18:36'),
(268, 3, 'events', 'active', 'employee', '2019-07-06 20:18:36', '2019-07-06 20:18:36'),
(269, 3, 'events', 'active', 'admin', '2019-07-06 20:18:36', '2019-07-06 20:18:36'),
(270, 3, 'messages', 'active', 'client', '2019-07-06 20:18:36', '2019-07-06 20:18:36'),
(271, 3, 'messages', 'active', 'employee', '2019-07-06 20:18:36', '2019-07-06 20:18:36'),
(272, 3, 'messages', 'active', 'admin', '2019-07-06 20:18:36', '2019-07-06 20:18:36'),
(273, 3, 'notices', 'active', 'employee', '2019-07-06 20:18:36', '2019-07-06 20:18:36'),
(274, 3, 'notices', 'active', 'admin', '2019-07-06 20:18:36', '2019-07-06 20:18:36'),
(275, 3, 'leaves', 'active', 'employee', '2019-07-06 20:18:36', '2019-07-06 20:18:36'),
(276, 3, 'leaves', 'active', 'admin', '2019-07-06 20:18:36', '2019-07-06 20:18:36'),
(277, 3, 'leads', 'active', 'employee', '2019-07-06 20:18:36', '2019-07-06 20:18:36'),
(278, 3, 'leads', 'active', 'admin', '2019-07-06 20:18:36', '2019-07-06 20:18:36'),
(279, 3, 'holidays', 'active', 'employee', '2019-07-06 20:18:36', '2019-07-06 20:18:36'),
(280, 3, 'holidays', 'active', 'admin', '2019-07-06 20:18:36', '2019-07-06 20:18:36'),
(281, 3, 'products', 'active', 'employee', '2019-07-06 20:18:36', '2019-07-06 20:18:36'),
(282, 3, 'products', 'active', 'admin', '2019-07-06 20:18:36', '2019-07-06 20:18:36'),
(283, 3, 'expenses', 'active', 'employee', '2019-07-06 20:18:36', '2019-07-06 20:18:36'),
(284, 3, 'expenses', 'active', 'admin', '2019-07-06 20:18:36', '2019-07-06 20:18:36'),
(285, 4, 'clients', 'active', 'employee', '2019-07-31 19:32:04', '2019-07-31 19:32:04'),
(286, 4, 'clients', 'active', 'admin', '2019-07-31 19:32:04', '2019-07-31 19:32:04'),
(287, 4, 'employees', 'active', 'employee', '2019-07-31 19:32:04', '2019-07-31 19:32:04'),
(288, 4, 'employees', 'active', 'admin', '2019-07-31 19:32:04', '2019-07-31 19:32:04'),
(289, 4, 'projects', 'active', 'client', '2019-07-31 19:32:04', '2019-07-31 19:32:04'),
(290, 4, 'projects', 'active', 'employee', '2019-07-31 19:32:04', '2019-07-31 19:32:04'),
(291, 4, 'projects', 'active', 'admin', '2019-07-31 19:32:04', '2019-07-31 19:32:04'),
(292, 4, 'attendance', 'active', 'employee', '2019-07-31 19:32:04', '2019-07-31 19:32:04'),
(293, 4, 'attendance', 'active', 'admin', '2019-07-31 19:32:04', '2019-07-31 19:32:04'),
(294, 4, 'tasks', 'active', 'client', '2019-07-31 19:32:04', '2019-07-31 19:32:04'),
(295, 4, 'tasks', 'active', 'employee', '2019-07-31 19:32:04', '2019-07-31 19:32:04'),
(296, 4, 'tasks', 'active', 'admin', '2019-07-31 19:32:04', '2019-07-31 19:32:04'),
(297, 4, 'estimates', 'active', 'client', '2019-07-31 19:32:04', '2019-07-31 19:32:04'),
(298, 4, 'estimates', 'active', 'employee', '2019-07-31 19:32:04', '2019-07-31 19:32:04'),
(299, 4, 'estimates', 'active', 'admin', '2019-07-31 19:32:04', '2019-07-31 19:32:04'),
(300, 4, 'invoices', 'active', 'client', '2019-07-31 19:32:04', '2019-07-31 19:32:04'),
(301, 4, 'invoices', 'active', 'employee', '2019-07-31 19:32:04', '2019-07-31 19:32:04'),
(302, 4, 'invoices', 'active', 'admin', '2019-07-31 19:32:04', '2019-07-31 19:32:04'),
(303, 4, 'payments', 'active', 'employee', '2019-07-31 19:32:04', '2019-07-31 19:32:04'),
(304, 4, 'payments', 'active', 'admin', '2019-07-31 19:32:04', '2019-07-31 19:32:04'),
(305, 4, 'timelogs', 'active', 'employee', '2019-07-31 19:32:04', '2019-07-31 19:32:04'),
(306, 4, 'timelogs', 'active', 'admin', '2019-07-31 19:32:04', '2019-07-31 19:32:04'),
(307, 4, 'tickets', 'active', 'client', '2019-07-31 19:32:04', '2019-07-31 19:32:04'),
(308, 4, 'tickets', 'active', 'employee', '2019-07-31 19:32:04', '2019-07-31 19:32:04'),
(309, 4, 'tickets', 'active', 'admin', '2019-07-31 19:32:04', '2019-07-31 19:32:04'),
(310, 4, 'events', 'active', 'client', '2019-07-31 19:32:04', '2019-07-31 19:32:04'),
(311, 4, 'events', 'active', 'employee', '2019-07-31 19:32:04', '2019-07-31 19:32:04'),
(312, 4, 'events', 'active', 'admin', '2019-07-31 19:32:04', '2019-07-31 19:32:04'),
(313, 4, 'messages', 'active', 'client', '2019-07-31 19:32:04', '2019-07-31 19:32:04'),
(314, 4, 'messages', 'active', 'employee', '2019-07-31 19:32:04', '2019-07-31 19:32:04'),
(315, 4, 'messages', 'active', 'admin', '2019-07-31 19:32:04', '2019-07-31 19:32:04'),
(316, 4, 'notices', 'active', 'employee', '2019-07-31 19:32:04', '2019-07-31 19:32:04'),
(317, 4, 'notices', 'active', 'admin', '2019-07-31 19:32:04', '2019-07-31 19:32:04'),
(318, 4, 'leaves', 'active', 'employee', '2019-07-31 19:32:04', '2019-07-31 19:32:04'),
(319, 4, 'leaves', 'active', 'admin', '2019-07-31 19:32:04', '2019-07-31 19:32:04'),
(320, 4, 'leads', 'active', 'employee', '2019-07-31 19:32:04', '2019-07-31 19:32:04'),
(321, 4, 'leads', 'active', 'admin', '2019-07-31 19:32:04', '2019-07-31 19:32:04'),
(322, 4, 'holidays', 'active', 'employee', '2019-07-31 19:32:04', '2019-07-31 19:32:04'),
(323, 4, 'holidays', 'active', 'admin', '2019-07-31 19:32:04', '2019-07-31 19:32:04'),
(324, 4, 'products', 'active', 'employee', '2019-07-31 19:32:04', '2019-07-31 19:32:04'),
(325, 4, 'products', 'active', 'admin', '2019-07-31 19:32:04', '2019-07-31 19:32:04'),
(326, 4, 'expenses', 'active', 'employee', '2019-07-31 19:32:04', '2019-07-31 19:32:04'),
(327, 4, 'expenses', 'active', 'admin', '2019-07-31 19:32:04', '2019-07-31 19:32:04'),
(328, 5, 'clients', 'active', 'employee', '2019-07-31 19:38:54', '2019-07-31 19:38:54'),
(329, 5, 'clients', 'active', 'admin', '2019-07-31 19:38:54', '2019-07-31 19:38:54'),
(330, 5, 'employees', 'active', 'employee', '2019-07-31 19:38:54', '2019-07-31 19:38:54'),
(331, 5, 'employees', 'active', 'admin', '2019-07-31 19:38:54', '2019-07-31 19:38:54'),
(332, 5, 'projects', 'active', 'client', '2019-07-31 19:38:54', '2019-07-31 19:38:54'),
(333, 5, 'projects', 'active', 'employee', '2019-07-31 19:38:54', '2019-07-31 19:38:54'),
(334, 5, 'projects', 'active', 'admin', '2019-07-31 19:38:54', '2019-07-31 19:38:54'),
(335, 5, 'attendance', 'active', 'employee', '2019-07-31 19:38:54', '2019-07-31 19:38:54'),
(336, 5, 'attendance', 'active', 'admin', '2019-07-31 19:38:54', '2019-07-31 19:38:54'),
(337, 5, 'tasks', 'active', 'client', '2019-07-31 19:38:54', '2019-07-31 19:38:54'),
(338, 5, 'tasks', 'active', 'employee', '2019-07-31 19:38:54', '2019-07-31 19:38:54'),
(339, 5, 'tasks', 'active', 'admin', '2019-07-31 19:38:54', '2019-07-31 19:38:54'),
(340, 5, 'estimates', 'active', 'client', '2019-07-31 19:38:54', '2019-07-31 19:38:54'),
(341, 5, 'estimates', 'active', 'employee', '2019-07-31 19:38:54', '2019-07-31 19:38:54'),
(342, 5, 'estimates', 'active', 'admin', '2019-07-31 19:38:54', '2019-07-31 19:38:54'),
(343, 5, 'invoices', 'active', 'client', '2019-07-31 19:38:54', '2019-07-31 19:38:54'),
(344, 5, 'invoices', 'active', 'employee', '2019-07-31 19:38:54', '2019-07-31 19:38:54'),
(345, 5, 'invoices', 'active', 'admin', '2019-07-31 19:38:54', '2019-07-31 19:38:54'),
(346, 5, 'payments', 'active', 'employee', '2019-07-31 19:38:54', '2019-07-31 19:38:54'),
(347, 5, 'payments', 'active', 'admin', '2019-07-31 19:38:54', '2019-07-31 19:38:54'),
(348, 5, 'timelogs', 'active', 'employee', '2019-07-31 19:38:54', '2019-07-31 19:38:54'),
(349, 5, 'timelogs', 'active', 'admin', '2019-07-31 19:38:54', '2019-07-31 19:38:54'),
(350, 5, 'tickets', 'active', 'client', '2019-07-31 19:38:54', '2019-07-31 19:38:54'),
(351, 5, 'tickets', 'active', 'employee', '2019-07-31 19:38:54', '2019-07-31 19:38:54'),
(352, 5, 'tickets', 'active', 'admin', '2019-07-31 19:38:54', '2019-07-31 19:38:54'),
(353, 5, 'events', 'active', 'client', '2019-07-31 19:38:54', '2019-07-31 19:38:54'),
(354, 5, 'events', 'active', 'employee', '2019-07-31 19:38:54', '2019-07-31 19:38:54'),
(355, 5, 'events', 'active', 'admin', '2019-07-31 19:38:54', '2019-07-31 19:38:54'),
(356, 5, 'messages', 'active', 'client', '2019-07-31 19:38:54', '2019-07-31 19:38:54'),
(357, 5, 'messages', 'active', 'employee', '2019-07-31 19:38:54', '2019-07-31 19:38:54'),
(358, 5, 'messages', 'active', 'admin', '2019-07-31 19:38:54', '2019-07-31 19:38:54'),
(359, 5, 'notices', 'active', 'employee', '2019-07-31 19:38:54', '2019-07-31 19:38:54'),
(360, 5, 'notices', 'active', 'admin', '2019-07-31 19:38:54', '2019-07-31 19:38:54'),
(361, 5, 'leaves', 'active', 'employee', '2019-07-31 19:38:54', '2019-07-31 19:38:54'),
(362, 5, 'leaves', 'active', 'admin', '2019-07-31 19:38:54', '2019-07-31 19:38:54'),
(363, 5, 'leads', 'active', 'employee', '2019-07-31 19:38:54', '2019-07-31 19:38:54'),
(364, 5, 'leads', 'active', 'admin', '2019-07-31 19:38:54', '2019-07-31 19:38:54'),
(365, 5, 'holidays', 'active', 'employee', '2019-07-31 19:38:54', '2019-07-31 19:38:54'),
(366, 5, 'holidays', 'active', 'admin', '2019-07-31 19:38:54', '2019-07-31 19:38:54'),
(367, 5, 'products', 'active', 'employee', '2019-07-31 19:38:54', '2019-07-31 19:38:54'),
(368, 5, 'products', 'active', 'admin', '2019-07-31 19:38:54', '2019-07-31 19:38:54'),
(369, 5, 'expenses', 'active', 'employee', '2019-07-31 19:38:54', '2019-07-31 19:38:54'),
(370, 5, 'expenses', 'active', 'admin', '2019-07-31 19:38:54', '2019-07-31 19:38:54'),
(496, 1, 'clients', 'active', 'employee', '2019-08-24 03:04:51', '2019-08-24 03:04:51'),
(497, 1, 'clients', 'active', 'admin', '2019-08-24 03:04:51', '2019-08-24 03:04:51'),
(498, 1, 'employees', 'active', 'employee', '2019-08-24 03:04:51', '2019-08-24 03:04:51'),
(499, 1, 'employees', 'active', 'admin', '2019-08-24 03:04:52', '2019-08-24 03:04:52'),
(500, 1, 'projects', 'active', 'client', '2019-08-24 03:04:52', '2019-08-24 03:04:52'),
(501, 1, 'projects', 'active', 'employee', '2019-08-24 03:04:52', '2019-08-24 03:04:52'),
(502, 1, 'projects', 'active', 'admin', '2019-08-24 03:04:52', '2019-08-24 03:04:52'),
(503, 1, 'tasks', 'active', 'client', '2019-08-24 03:04:52', '2019-08-24 03:04:52'),
(504, 1, 'tasks', 'active', 'employee', '2019-08-24 03:04:52', '2019-08-24 03:04:52'),
(505, 1, 'tasks', 'active', 'admin', '2019-08-24 03:04:52', '2019-08-24 03:04:52'),
(506, 1, 'task Pro', 'active', 'employee', '2019-08-24 03:04:52', '2019-08-24 03:04:52'),
(507, 1, 'task Pro', 'active', 'admin', '2019-08-24 03:04:52', '2019-08-24 03:04:52'),
(508, 6, 'clients', 'active', 'employee', '2019-08-24 03:06:25', '2019-08-24 03:06:25'),
(509, 6, 'clients', 'active', 'admin', '2019-08-24 03:06:25', '2019-08-24 03:06:25'),
(510, 6, 'employees', 'active', 'employee', '2019-08-24 03:06:25', '2019-08-24 03:06:25'),
(511, 6, 'employees', 'active', 'admin', '2019-08-24 03:06:25', '2019-08-24 03:06:25'),
(512, 6, 'projects', 'active', 'client', '2019-08-24 03:06:25', '2019-08-24 03:06:25'),
(513, 6, 'projects', 'active', 'employee', '2019-08-24 03:06:25', '2019-08-24 03:06:25'),
(514, 6, 'projects', 'active', 'admin', '2019-08-24 03:06:25', '2019-08-24 03:06:25'),
(515, 6, 'attendance', 'active', 'employee', '2019-08-24 03:06:25', '2019-08-24 03:06:25'),
(516, 6, 'attendance', 'active', 'admin', '2019-08-24 03:06:25', '2019-08-24 03:06:25'),
(517, 6, 'tasks', 'active', 'client', '2019-08-24 03:06:25', '2019-08-24 03:06:25'),
(518, 6, 'tasks', 'active', 'employee', '2019-08-24 03:06:25', '2019-08-24 03:06:25'),
(519, 6, 'tasks', 'active', 'admin', '2019-08-24 03:06:25', '2019-08-24 03:06:25'),
(520, 6, 'estimates', 'active', 'client', '2019-08-24 03:06:25', '2019-08-24 03:06:25'),
(521, 6, 'estimates', 'active', 'employee', '2019-08-24 03:06:25', '2019-08-24 03:06:25'),
(522, 6, 'estimates', 'active', 'admin', '2019-08-24 03:06:25', '2019-08-24 03:06:25'),
(523, 6, 'invoices', 'active', 'client', '2019-08-24 03:06:25', '2019-08-24 03:06:25'),
(524, 6, 'invoices', 'active', 'employee', '2019-08-24 03:06:25', '2019-08-24 03:06:25'),
(525, 6, 'invoices', 'active', 'admin', '2019-08-24 03:06:25', '2019-08-24 03:06:25'),
(526, 6, 'payments', 'active', 'employee', '2019-08-24 03:06:25', '2019-08-24 03:06:25'),
(527, 6, 'payments', 'active', 'admin', '2019-08-24 03:06:26', '2019-08-24 03:06:26'),
(528, 6, 'timelogs', 'active', 'employee', '2019-08-24 03:06:26', '2019-08-24 03:06:26'),
(529, 6, 'timelogs', 'active', 'admin', '2019-08-24 03:06:26', '2019-08-24 03:06:26'),
(530, 6, 'tickets', 'active', 'client', '2019-08-24 03:06:26', '2019-08-24 03:06:26'),
(531, 6, 'tickets', 'active', 'employee', '2019-08-24 03:06:26', '2019-08-24 03:06:26'),
(532, 6, 'tickets', 'active', 'admin', '2019-08-24 03:06:26', '2019-08-24 03:06:26'),
(533, 6, 'holidays', 'active', 'employee', '2019-08-24 03:06:26', '2019-08-24 03:06:26'),
(534, 6, 'holidays', 'active', 'admin', '2019-08-24 03:06:26', '2019-08-24 03:06:26'),
(535, 6, 'expenses', 'active', 'employee', '2019-08-24 03:06:26', '2019-08-24 03:06:26'),
(536, 6, 'expenses', 'active', 'admin', '2019-08-24 03:06:26', '2019-08-24 03:06:26'),
(537, 6, 'task Pro', 'active', 'employee', '2019-08-24 03:06:26', '2019-08-24 03:06:26'),
(538, 6, 'task Pro', 'active', 'admin', '2019-08-24 03:06:26', '2019-08-24 03:06:26');

-- --------------------------------------------------------

--
-- Table structure for table `notices`
--

CREATE TABLE `notices` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `heading` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `description` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` char(36) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `notifiable_type` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `notifiable_id` bigint(20) UNSIGNED NOT NULL,
  `data` text COLLATE utf8_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `type`, `notifiable_type`, `notifiable_id`, `data`, `read_at`, `created_at`, `updated_at`) VALUES
('06fa54e0-969e-4e19-8758-50e291088b7a', 'App\\Notifications\\NewTask', 'App\\User', 7, '{\"id\":18,\"company_id\":1,\"heading\":\"Task 5\",\"description\":null,\"due_date\":\"2019-08-14 00:00:00\",\"start_date\":\"2019-08-04 00:00:00\",\"user_id\":7,\"project_id\":1,\"task_category_id\":1,\"priority\":\"medium\",\"status\":\"incomplete\",\"board_column_id\":3,\"column_priority\":0,\"completed_on\":null,\"created_by\":7,\"created_at\":\"2019-08-04 14:56:59\",\"updated_at\":\"2019-08-04 14:56:59\",\"due_on\":\"14 Aug, 19\",\"create_on\":\"04 Aug, 19\"}', '2019-08-13 22:46:05', '2019-08-04 18:56:59', '2019-08-13 22:46:05'),
('08098f8e-93fe-4224-96ce-a11916580dec', 'App\\Notifications\\NewTask', 'App\\User', 9, '{\"id\":60,\"company_id\":1,\"heading\":\"Afif\",\"description\":null,\"due_date\":\"2019-09-12 00:00:00\",\"start_date\":\"2019-09-02 00:00:00\",\"user_id\":9,\"project_id\":null,\"task_category_id\":1,\"priority\":\"medium\",\"status\":\"incomplete\",\"board_column_id\":3,\"column_priority\":0,\"completed_on\":null,\"created_by\":7,\"created_at\":\"2019-09-02 21:05:49\",\"updated_at\":\"2019-09-02 21:05:49\",\"tag\":null,\"section_tiles\":null,\"est_hour\":null,\"act_hour\":null,\"on_team\":null,\"due_on\":\"12 Sep, 19\",\"create_on\":\"02 Sep, 19\"}', NULL, '2019-09-02 15:05:49', '2019-09-02 15:05:49'),
('082496da-0ec2-4ab3-8958-e32893038411', 'App\\Notifications\\NewUser', 'App\\User', 4, '{\"id\":4,\"company_id\":1,\"name\":\"Datagroup\",\"email\":\"jthigpen@dtinetworks.com\",\"image\":null,\"mobile\":null,\"gender\":\"male\",\"locale\":\"en\",\"status\":\"active\",\"login\":\"enable\",\"onesignal_player_id\":null,\"created_at\":\"2019-06-04 20:18:49\",\"updated_at\":\"2019-06-04 20:18:49\",\"super_admin\":\"0\",\"email_verification_code\":null}', NULL, '2019-06-05 00:18:49', '2019-06-05 00:18:49'),
('0a23bd3e-dc70-4862-89ad-a3a2a1190ce7', 'App\\Notifications\\NewTask', 'App\\User', 12, '{\"id\":24,\"company_id\":1,\"heading\":\"Test\",\"description\":null,\"due_date\":\"2019-09-18 00:00:00\",\"start_date\":\"2019-09-02 00:00:00\",\"user_id\":12,\"project_id\":1,\"task_category_id\":1,\"priority\":\"medium\",\"status\":\"incomplete\",\"board_column_id\":3,\"column_priority\":0,\"completed_on\":null,\"created_by\":7,\"created_at\":\"2019-09-02 17:46:20\",\"updated_at\":\"2019-09-02 17:46:20\",\"tag\":null,\"section_tiles\":null,\"est_hour\":null,\"act_hour\":null,\"on_team\":null,\"due_on\":\"18 Sep, 19\",\"create_on\":\"02 Sep, 19\"}', NULL, '2019-09-02 11:46:20', '2019-09-02 11:46:20'),
('0aa88587-7edc-4f3d-a92a-90dea70f8f6e', 'App\\Notifications\\NewUser', 'App\\User', 12, '{\"id\":12,\"company_id\":1,\"name\":\"Victor\",\"email\":\"vsaavedra@workatask.com\",\"image\":null,\"mobile\":null,\"gender\":\"male\",\"locale\":\"en\",\"status\":\"active\",\"login\":\"enable\",\"onesignal_player_id\":null,\"created_at\":\"2019-06-07 21:03:49\",\"updated_at\":\"2019-06-07 21:03:49\",\"super_admin\":\"0\",\"email_verification_code\":null}', NULL, '2019-06-08 01:03:49', '2019-06-08 01:03:49'),
('0ce43266-c180-422b-8525-afec467846e6', 'App\\Notifications\\NewTask', 'App\\User', 7, '{\"id\":66,\"company_id\":1,\"heading\":\"TEst hkilo\",\"description\":null,\"due_date\":\"2019-09-12 00:00:00\",\"start_date\":\"2019-09-02 00:00:00\",\"user_id\":7,\"project_id\":null,\"task_category_id\":1,\"priority\":\"medium\",\"status\":\"incomplete\",\"board_column_id\":3,\"column_priority\":0,\"completed_on\":null,\"created_by\":7,\"created_at\":\"2019-09-02 21:32:56\",\"updated_at\":\"2019-09-02 21:32:56\",\"tag\":null,\"section_tiles\":null,\"est_hour\":null,\"act_hour\":null,\"on_team\":null,\"due_on\":\"12 Sep, 19\",\"create_on\":\"02 Sep, 19\"}', NULL, '2019-09-02 15:32:56', '2019-09-02 15:32:56'),
('0e4effa2-1981-404f-883d-ff2b47572399', 'App\\Notifications\\NewUser', 'App\\User', 15, '{\"id\":15,\"company_id\":1,\"name\":\"Richard Haar\",\"email\":\"richard@workatask.com\",\"image\":null,\"mobile\":null,\"gender\":\"male\",\"locale\":\"en\",\"status\":\"active\",\"login\":\"enable\",\"onesignal_player_id\":null,\"created_at\":\"2019-06-07 21:06:12\",\"updated_at\":\"2019-06-07 21:06:12\",\"super_admin\":\"0\",\"email_verification_code\":null}', NULL, '2019-06-08 01:06:12', '2019-06-08 01:06:12'),
('0f0385eb-1c0e-4fb4-a314-b39ed6b85d8c', 'App\\Notifications\\NewTask', 'App\\User', 1, '{\"id\":3,\"company_id\":1,\"heading\":\"Excused error and created task anyway\",\"description\":null,\"due_date\":\"2019-06-05 00:00:00\",\"start_date\":\"2019-06-05 00:00:00\",\"user_id\":1,\"project_id\":null,\"task_category_id\":null,\"priority\":\"medium\",\"status\":\"incomplete\",\"board_column_id\":3,\"column_priority\":0,\"completed_on\":null,\"created_by\":1,\"created_at\":\"2019-06-05 13:18:19\",\"updated_at\":\"2019-06-05 13:18:19\",\"due_on\":\"05 Jun, 19\",\"create_on\":\"05 Jun, 19\"}', '2019-06-06 00:36:01', '2019-06-05 17:18:19', '2019-06-06 00:36:01'),
('10865dc1-24d8-443a-8c79-9af5b54f7393', 'App\\Notifications\\NewTask', 'App\\User', 9, '{\"id\":57,\"company_id\":1,\"heading\":\"Afif\",\"description\":null,\"due_date\":\"2019-09-12 00:00:00\",\"start_date\":\"2019-09-02 00:00:00\",\"user_id\":9,\"project_id\":null,\"task_category_id\":1,\"priority\":\"medium\",\"status\":\"incomplete\",\"board_column_id\":3,\"column_priority\":0,\"completed_on\":null,\"created_by\":7,\"created_at\":\"2019-09-02 20:57:58\",\"updated_at\":\"2019-09-02 20:57:58\",\"tag\":null,\"section_tiles\":null,\"est_hour\":null,\"act_hour\":null,\"on_team\":null,\"due_on\":\"12 Sep, 19\",\"create_on\":\"02 Sep, 19\"}', NULL, '2019-09-02 14:57:58', '2019-09-02 14:57:58'),
('1591f306-f6a6-4e19-a3b9-21fd8fe71bab', 'App\\Notifications\\TaskUpdated', 'App\\User', 1, '{\"id\":8,\"company_id\":1,\"heading\":\"test task\",\"description\":null,\"due_date\":\"2019-06-06 00:00:00\",\"start_date\":\"2019-06-06 00:00:00\",\"user_id\":1,\"project_id\":null,\"task_category_id\":1,\"priority\":\"medium\",\"status\":\"incomplete\",\"board_column_id\":3,\"column_priority\":1,\"completed_on\":null,\"created_by\":1,\"created_at\":\"2019-06-06 00:21:28\",\"updated_at\":\"2019-06-07 21:18:28\",\"due_on\":\"06 Jun, 19\",\"create_on\":\"06 Jun, 19\"}', NULL, '2019-06-08 01:18:28', '2019-06-08 01:18:28'),
('15ba291c-9b5c-40d1-a89b-e4a62f6808bd', 'App\\Notifications\\NewTask', 'App\\User', 9, '{\"id\":50,\"company_id\":1,\"heading\":\"Afif\",\"description\":null,\"due_date\":\"2019-09-12 00:00:00\",\"start_date\":\"2019-09-02 00:00:00\",\"user_id\":9,\"project_id\":null,\"task_category_id\":1,\"priority\":\"medium\",\"status\":\"incomplete\",\"board_column_id\":3,\"column_priority\":0,\"completed_on\":null,\"created_by\":7,\"created_at\":\"2019-09-02 20:39:21\",\"updated_at\":\"2019-09-02 20:39:21\",\"tag\":null,\"section_tiles\":null,\"est_hour\":null,\"act_hour\":null,\"on_team\":null,\"due_on\":\"12 Sep, 19\",\"create_on\":\"02 Sep, 19\"}', NULL, '2019-09-02 14:39:21', '2019-09-02 14:39:21'),
('15be0493-4b1c-4445-9742-5e64d83899d0', 'App\\Notifications\\NewTask', 'App\\User', 7, '{\"id\":69,\"company_id\":1,\"heading\":\"TEst hkilo\",\"description\":null,\"due_date\":\"2019-09-12 00:00:00\",\"start_date\":\"2019-09-02 00:00:00\",\"user_id\":7,\"project_id\":null,\"task_category_id\":1,\"priority\":\"medium\",\"status\":\"incomplete\",\"board_column_id\":3,\"column_priority\":0,\"completed_on\":null,\"created_by\":7,\"created_at\":\"2019-09-02 21:33:25\",\"updated_at\":\"2019-09-02 21:33:25\",\"tag\":null,\"section_tiles\":null,\"est_hour\":null,\"act_hour\":null,\"on_team\":null,\"due_on\":\"12 Sep, 19\",\"create_on\":\"02 Sep, 19\"}', NULL, '2019-09-02 15:33:25', '2019-09-02 15:33:25'),
('19362ece-a91a-417b-bd75-05813e83e64c', 'App\\Notifications\\TaskUpdated', 'App\\User', 7, '{\"id\":11,\"company_id\":1,\"heading\":\"add template task 1\",\"description\":null,\"due_date\":\"2019-06-12 00:00:00\",\"start_date\":\"2019-08-31 00:00:00\",\"user_id\":7,\"project_id\":2,\"task_category_id\":1,\"priority\":\"medium\",\"status\":\"incomplete\",\"board_column_id\":3,\"column_priority\":1,\"completed_on\":null,\"created_by\":null,\"created_at\":\"2019-06-11 11:32:25\",\"updated_at\":\"2019-08-31 19:24:42\",\"tag\":null,\"section_tiles\":null,\"est_hour\":null,\"act_hour\":null,\"due_on\":\"12 Jun, 19\",\"create_on\":\"31 Aug, 19\"}', NULL, '2019-08-31 13:24:45', '2019-08-31 13:24:45'),
('194b5813-96ac-4e3f-a0d4-b317777c77bc', 'App\\Notifications\\NewTask', 'App\\User', 7, '{\"id\":12,\"company_id\":1,\"heading\":\"test task\",\"description\":null,\"due_date\":\"2019-07-02 00:00:00\",\"start_date\":\"2019-07-01 00:00:00\",\"user_id\":7,\"project_id\":null,\"task_category_id\":1,\"priority\":\"medium\",\"status\":\"incomplete\",\"board_column_id\":3,\"column_priority\":0,\"completed_on\":null,\"created_by\":7,\"created_at\":\"2019-07-01 19:07:39\",\"updated_at\":\"2019-07-01 19:07:39\",\"due_on\":\"02 Jul, 19\",\"create_on\":\"01 Jul, 19\"}', '2019-08-13 22:46:05', '2019-07-01 23:07:40', '2019-08-13 22:46:05'),
('23691848-74c1-44e7-ba5d-47454eaceb31', 'App\\Notifications\\NewTask', 'App\\User', 9, '{\"id\":32,\"company_id\":1,\"heading\":\"Afif\",\"description\":null,\"due_date\":\"2019-09-04 00:00:00\",\"start_date\":\"2019-09-26 00:00:00\",\"user_id\":9,\"project_id\":null,\"task_category_id\":1,\"priority\":\"medium\",\"status\":\"incomplete\",\"board_column_id\":3,\"column_priority\":0,\"completed_on\":null,\"created_by\":7,\"created_at\":\"2019-09-02 18:16:32\",\"updated_at\":\"2019-09-02 18:16:32\",\"tag\":null,\"section_tiles\":null,\"est_hour\":null,\"act_hour\":null,\"on_team\":null,\"due_on\":\"04 Sep, 19\",\"create_on\":\"26 Sep, 19\"}', NULL, '2019-09-02 12:16:32', '2019-09-02 12:16:32'),
('243dafea-866f-4200-865a-f58656bf29da', 'App\\Notifications\\NewTask', 'App\\User', 1, '{\"id\":2,\"company_id\":1,\"heading\":\"New task added from employee panel\",\"description\":null,\"due_date\":\"2019-06-01 00:00:00\",\"start_date\":\"2019-05-31 00:00:00\",\"user_id\":1,\"project_id\":null,\"task_category_id\":null,\"priority\":\"medium\",\"status\":\"incomplete\",\"board_column_id\":3,\"column_priority\":0,\"completed_on\":null,\"created_by\":1,\"created_at\":\"2019-05-31 20:57:47\",\"updated_at\":\"2019-05-31 20:57:47\",\"due_on\":\"01 Jun, 19\",\"create_on\":\"31 May, 19\"}', '2019-06-06 00:36:01', '2019-06-01 00:57:47', '2019-06-06 00:36:01'),
('2601183a-8c7c-46fc-9198-08b6808d781a', 'App\\Notifications\\TaskCompleted', 'App\\User', 7, '{\"id\":15,\"company_id\":1,\"heading\":\"Task 1\",\"description\":null,\"due_date\":\"2019-08-15 00:00:00\",\"start_date\":\"2019-08-04 00:00:00\",\"user_id\":7,\"project_id\":1,\"task_category_id\":1,\"priority\":\"high\",\"status\":\"incomplete\",\"board_column_id\":4,\"column_priority\":0,\"completed_on\":\"2019-08-30 19:30:46\",\"created_by\":7,\"created_at\":\"2019-08-05 00:52:31\",\"updated_at\":\"2019-08-30 19:30:46\",\"tag\":null,\"section_tiles\":null,\"est_hour\":null,\"act_hour\":null,\"due_on\":\"15 Aug, 19\",\"create_on\":\"04 Aug, 19\"}', NULL, '2019-08-30 13:30:47', '2019-08-30 13:30:47'),
('2688b97f-be94-4683-b8dc-ab2a12068573', 'App\\Notifications\\NewTask', 'App\\User', 9, '{\"id\":76,\"company_id\":1,\"heading\":\"jikijki\",\"description\":null,\"due_date\":\"2019-09-12 00:00:00\",\"start_date\":\"2019-09-02 00:00:00\",\"user_id\":9,\"project_id\":null,\"task_category_id\":1,\"priority\":\"medium\",\"status\":\"incomplete\",\"board_column_id\":3,\"column_priority\":0,\"completed_on\":null,\"created_by\":7,\"created_at\":\"2019-09-02 21:40:33\",\"updated_at\":\"2019-09-02 21:40:33\",\"tag\":null,\"section_tiles\":null,\"est_hour\":null,\"act_hour\":null,\"on_team\":null,\"due_on\":\"12 Sep, 19\",\"create_on\":\"02 Sep, 19\"}', NULL, '2019-09-02 15:40:33', '2019-09-02 15:40:33'),
('29128d70-bc05-4885-b561-463658b00665', 'App\\Notifications\\NewCompanyRegister', 'App\\User', 3, '{\"id\":3,\"company_id\":null,\"name\":null,\"email\":null,\"image\":null,\"mobile\":null,\"gender\":\"male\",\"locale\":\"en\",\"status\":\"active\",\"login\":\"enable\",\"onesignal_player_id\":null,\"created_at\":\"2019-05-31 18:26:13\",\"updated_at\":\"2019-06-26 16:35:55\",\"super_admin\":\"1\",\"email_verification_code\":null,\"company_name\":\"Test Company\"}', NULL, '2019-07-31 19:32:06', '2019-07-31 19:32:06'),
('2be8d385-82c7-4253-9283-c2a6fba6beb1', 'App\\Notifications\\NewTask', 'App\\User', 7, '{\"id\":70,\"company_id\":1,\"heading\":\"TEst hkilo\",\"description\":null,\"due_date\":\"2019-09-12 00:00:00\",\"start_date\":\"2019-09-02 00:00:00\",\"user_id\":7,\"project_id\":null,\"task_category_id\":1,\"priority\":\"medium\",\"status\":\"incomplete\",\"board_column_id\":3,\"column_priority\":0,\"completed_on\":null,\"created_by\":7,\"created_at\":\"2019-09-02 21:33:38\",\"updated_at\":\"2019-09-02 21:33:38\",\"tag\":null,\"section_tiles\":null,\"est_hour\":null,\"act_hour\":null,\"on_team\":null,\"due_on\":\"12 Sep, 19\",\"create_on\":\"02 Sep, 19\"}', NULL, '2019-09-02 15:33:38', '2019-09-02 15:33:38'),
('32b66472-b0ad-42de-b409-4b32c5a9fb4a', 'App\\Notifications\\NewTask', 'App\\User', 7, '{\"id\":71,\"company_id\":1,\"heading\":\"TEst hkilo\",\"description\":null,\"due_date\":\"2019-09-12 00:00:00\",\"start_date\":\"2019-09-02 00:00:00\",\"user_id\":7,\"project_id\":null,\"task_category_id\":1,\"priority\":\"medium\",\"status\":\"incomplete\",\"board_column_id\":3,\"column_priority\":0,\"completed_on\":null,\"created_by\":7,\"created_at\":\"2019-09-02 21:33:40\",\"updated_at\":\"2019-09-02 21:33:40\",\"tag\":null,\"section_tiles\":null,\"est_hour\":null,\"act_hour\":null,\"on_team\":null,\"due_on\":\"12 Sep, 19\",\"create_on\":\"02 Sep, 19\"}', NULL, '2019-09-02 15:33:40', '2019-09-02 15:33:40'),
('3558e47f-003d-411a-835a-909519564663', 'App\\Notifications\\TaskUpdated', 'App\\User', 1, '{\"id\":8,\"company_id\":1,\"heading\":\"test task\",\"description\":null,\"due_date\":\"2019-06-06 00:00:00\",\"start_date\":\"2019-06-06 00:00:00\",\"user_id\":1,\"project_id\":null,\"task_category_id\":1,\"priority\":\"medium\",\"status\":\"incomplete\",\"board_column_id\":4,\"column_priority\":1,\"completed_on\":\"2019-06-26 00:00:00\",\"created_by\":1,\"created_at\":\"2019-06-06 00:21:28\",\"updated_at\":\"2019-06-26 15:59:44\",\"due_on\":\"06 Jun, 19\",\"create_on\":\"06 Jun, 19\"}', NULL, '2019-06-26 19:59:44', '2019-06-26 19:59:44'),
('37ff5da7-204e-4ff2-926f-37199455d34e', 'App\\Notifications\\TaskCompleted', 'App\\User', 12, '{\"id\":9,\"company_id\":1,\"heading\":\"Duties Task 1\",\"description\":null,\"due_date\":\"2019-06-30 00:00:00\",\"start_date\":\"2019-06-07 00:00:00\",\"user_id\":12,\"project_id\":1,\"task_category_id\":1,\"priority\":\"medium\",\"status\":\"incomplete\",\"board_column_id\":4,\"column_priority\":0,\"completed_on\":\"2019-06-07 00:00:00\",\"created_by\":7,\"created_at\":\"2019-06-07 21:16:53\",\"updated_at\":\"2019-06-07 21:28:46\",\"due_on\":\"30 Jun, 19\",\"create_on\":\"07 Jun, 19\",\"project\":{\"id\":1,\"company_id\":1,\"project_name\":\"Duties Managers\",\"project_summary\":\"<p>These are the General Manager Duties<\\/p>\",\"project_admin\":7,\"start_date\":\"2019-06-01 00:00:00\",\"deadline\":null,\"notes\":null,\"category_id\":3,\"client_id\":null,\"feedback\":null,\"manual_timelog\":\"enable\",\"client_view_task\":\"enable\",\"allow_client_notification\":\"enable\",\"completion_percent\":0,\"calculate_task_progress\":\"true\",\"created_at\":\"2019-06-07 21:14:35\",\"updated_at\":\"2019-06-07 21:15:03\",\"deleted_at\":null,\"isProjectAdmin\":true}}', NULL, '2019-06-08 01:28:47', '2019-06-08 01:28:47'),
('38378a26-bac9-432c-880c-5785992c083d', 'App\\Notifications\\NewTask', 'App\\User', 9, '{\"id\":58,\"company_id\":1,\"heading\":\"Afif\",\"description\":null,\"due_date\":\"2019-09-12 00:00:00\",\"start_date\":\"2019-09-02 00:00:00\",\"user_id\":9,\"project_id\":null,\"task_category_id\":1,\"priority\":\"medium\",\"status\":\"incomplete\",\"board_column_id\":3,\"column_priority\":0,\"completed_on\":null,\"created_by\":7,\"created_at\":\"2019-09-02 21:02:23\",\"updated_at\":\"2019-09-02 21:02:23\",\"tag\":null,\"section_tiles\":null,\"est_hour\":null,\"act_hour\":null,\"on_team\":null,\"due_on\":\"12 Sep, 19\",\"create_on\":\"02 Sep, 19\"}', NULL, '2019-09-02 15:02:24', '2019-09-02 15:02:24'),
('3aafa75b-693f-48b5-b7d3-454d68820927', 'App\\Notifications\\NewTask', 'App\\User', 9, '{\"id\":33,\"company_id\":1,\"heading\":\"Afif\",\"description\":null,\"due_date\":\"2019-09-04 00:00:00\",\"start_date\":\"2019-09-26 00:00:00\",\"user_id\":9,\"project_id\":null,\"task_category_id\":1,\"priority\":\"medium\",\"status\":\"incomplete\",\"board_column_id\":3,\"column_priority\":0,\"completed_on\":null,\"created_by\":7,\"created_at\":\"2019-09-02 18:17:59\",\"updated_at\":\"2019-09-02 18:17:59\",\"tag\":null,\"section_tiles\":null,\"est_hour\":null,\"act_hour\":null,\"on_team\":null,\"due_on\":\"04 Sep, 19\",\"create_on\":\"26 Sep, 19\"}', NULL, '2019-09-02 12:18:00', '2019-09-02 12:18:00'),
('3b9ac29b-fde0-44de-9656-5e10880f512e', 'App\\Notifications\\NewTask', 'App\\User', 9, '{\"id\":56,\"company_id\":1,\"heading\":\"Afif\",\"description\":null,\"due_date\":\"2019-09-12 00:00:00\",\"start_date\":\"2019-09-02 00:00:00\",\"user_id\":9,\"project_id\":null,\"task_category_id\":1,\"priority\":\"medium\",\"status\":\"incomplete\",\"board_column_id\":3,\"column_priority\":0,\"completed_on\":null,\"created_by\":7,\"created_at\":\"2019-09-02 20:57:25\",\"updated_at\":\"2019-09-02 20:57:25\",\"tag\":null,\"section_tiles\":null,\"est_hour\":null,\"act_hour\":null,\"on_team\":null,\"due_on\":\"12 Sep, 19\",\"create_on\":\"02 Sep, 19\"}', NULL, '2019-09-02 14:57:26', '2019-09-02 14:57:26'),
('3ce763ac-859d-40b0-b552-c73a71d9e380', 'App\\Notifications\\NewUser', 'App\\User', 13, '{\"id\":13,\"company_id\":1,\"name\":\"Kendall Walston\",\"email\":\"kendall@workatask.com\",\"image\":null,\"mobile\":null,\"gender\":\"female\",\"locale\":\"en\",\"status\":\"active\",\"login\":\"enable\",\"onesignal_player_id\":null,\"created_at\":\"2019-06-07 21:04:36\",\"updated_at\":\"2019-06-07 21:04:36\",\"super_admin\":\"0\",\"email_verification_code\":null}', NULL, '2019-06-08 01:04:36', '2019-06-08 01:04:36'),
('3e564eaf-9f7f-4386-841e-31bf4ba20caa', 'App\\Notifications\\NewTask', 'App\\User', 9, '{\"id\":53,\"company_id\":1,\"heading\":\"Afif\",\"description\":null,\"due_date\":\"2019-09-12 00:00:00\",\"start_date\":\"2019-09-02 00:00:00\",\"user_id\":9,\"project_id\":null,\"task_category_id\":1,\"priority\":\"medium\",\"status\":\"incomplete\",\"board_column_id\":3,\"column_priority\":0,\"completed_on\":null,\"created_by\":7,\"created_at\":\"2019-09-02 20:51:09\",\"updated_at\":\"2019-09-02 20:51:09\",\"tag\":null,\"section_tiles\":null,\"est_hour\":null,\"act_hour\":null,\"on_team\":null,\"due_on\":\"12 Sep, 19\",\"create_on\":\"02 Sep, 19\"}', NULL, '2019-09-02 14:51:09', '2019-09-02 14:51:09'),
('40c4f412-8e36-4ebc-b890-602d7c29c6c3', 'App\\Notifications\\NewTask', 'App\\User', 9, '{\"id\":63,\"company_id\":1,\"heading\":\"Afif\",\"description\":null,\"due_date\":\"2019-09-12 00:00:00\",\"start_date\":\"2019-09-02 00:00:00\",\"user_id\":9,\"project_id\":null,\"task_category_id\":1,\"priority\":\"medium\",\"status\":\"incomplete\",\"board_column_id\":3,\"column_priority\":0,\"completed_on\":null,\"created_by\":7,\"created_at\":\"2019-09-02 21:08:34\",\"updated_at\":\"2019-09-02 21:08:34\",\"tag\":null,\"section_tiles\":null,\"est_hour\":null,\"act_hour\":null,\"on_team\":null,\"due_on\":\"12 Sep, 19\",\"create_on\":\"02 Sep, 19\"}', NULL, '2019-09-02 15:08:34', '2019-09-02 15:08:34'),
('433d57af-5c0a-4572-99ff-aec95435d86c', 'App\\Notifications\\NewTask', 'App\\User', 1, '{\"id\":8,\"company_id\":1,\"heading\":\"test task\",\"description\":null,\"due_date\":\"2019-06-06 00:00:00\",\"start_date\":\"2019-06-06 00:00:00\",\"user_id\":1,\"project_id\":null,\"task_category_id\":null,\"priority\":\"medium\",\"status\":\"incomplete\",\"board_column_id\":3,\"column_priority\":0,\"completed_on\":null,\"created_by\":1,\"created_at\":\"2019-06-06 00:21:28\",\"updated_at\":\"2019-06-06 00:21:28\",\"due_on\":\"06 Jun, 19\",\"create_on\":\"06 Jun, 19\"}', NULL, '2019-06-06 04:21:28', '2019-06-06 04:21:28'),
('43ed4b2d-56b5-4391-ba2d-f5d959804b13', 'App\\Notifications\\NewTask', 'App\\User', 8, '{\"id\":20,\"company_id\":1,\"heading\":\"new one\",\"description\":\"<p>kkkkkkkkkkkkkkkkkkk<\\/p>\",\"due_date\":\"2019-08-30 00:00:00\",\"start_date\":\"2019-08-29 00:00:00\",\"user_id\":8,\"project_id\":2,\"task_category_id\":1,\"priority\":\"medium\",\"status\":\"incomplete\",\"board_column_id\":3,\"column_priority\":0,\"completed_on\":null,\"created_by\":7,\"created_at\":\"2019-08-28 18:48:37\",\"updated_at\":\"2019-08-28 18:48:37\",\"due_on\":\"30 Aug, 19\",\"create_on\":\"29 Aug, 19\"}', NULL, '2019-08-28 12:48:41', '2019-08-28 12:48:41'),
('44a870fb-065a-4dfb-9fc6-d7f904467aa0', 'App\\Notifications\\NewTask', 'App\\User', 7, '{\"id\":72,\"company_id\":1,\"heading\":\"TEst hkilo\",\"description\":null,\"due_date\":\"2019-09-12 00:00:00\",\"start_date\":\"2019-09-02 00:00:00\",\"user_id\":7,\"project_id\":null,\"task_category_id\":1,\"priority\":\"medium\",\"status\":\"incomplete\",\"board_column_id\":3,\"column_priority\":0,\"completed_on\":null,\"created_by\":7,\"created_at\":\"2019-09-02 21:34:08\",\"updated_at\":\"2019-09-02 21:34:08\",\"tag\":null,\"section_tiles\":null,\"est_hour\":null,\"act_hour\":null,\"on_team\":null,\"due_on\":\"12 Sep, 19\",\"create_on\":\"02 Sep, 19\"}', NULL, '2019-09-02 15:34:08', '2019-09-02 15:34:08'),
('47410f51-e643-4adc-8869-ca4e4d77f81e', 'App\\Notifications\\NewUser', 'App\\User', 11, '{\"id\":11,\"company_id\":1,\"name\":\"Brad Caudill\",\"email\":\"bcaudill@dtinetworks.com\",\"image\":null,\"mobile\":null,\"gender\":\"male\",\"locale\":\"en\",\"status\":\"active\",\"login\":\"enable\",\"onesignal_player_id\":null,\"created_at\":\"2019-06-07 21:02:59\",\"updated_at\":\"2019-06-07 21:02:59\",\"super_admin\":\"0\",\"email_verification_code\":null}', NULL, '2019-06-08 01:02:59', '2019-06-08 01:02:59'),
('48c91075-4f63-4d84-8091-fe3eb21968bd', 'App\\Notifications\\NewTask', 'App\\User', 9, '{\"id\":46,\"company_id\":1,\"heading\":\"Afif\",\"description\":null,\"due_date\":\"2019-09-12 00:00:00\",\"start_date\":\"2019-09-02 00:00:00\",\"user_id\":9,\"project_id\":null,\"task_category_id\":1,\"priority\":\"medium\",\"status\":\"incomplete\",\"board_column_id\":3,\"column_priority\":0,\"completed_on\":null,\"created_by\":7,\"created_at\":\"2019-09-02 20:22:47\",\"updated_at\":\"2019-09-02 20:22:47\",\"tag\":null,\"section_tiles\":null,\"est_hour\":null,\"act_hour\":null,\"on_team\":null,\"due_on\":\"12 Sep, 19\",\"create_on\":\"02 Sep, 19\"}', NULL, '2019-09-02 14:22:49', '2019-09-02 14:22:49'),
('4a86b5f4-ced2-4824-91d2-6a18f53322c4', 'App\\Notifications\\NewTask', 'App\\User', 7, '{\"id\":17,\"company_id\":1,\"heading\":\"Task 3\",\"description\":null,\"due_date\":\"2019-08-14 00:00:00\",\"start_date\":\"2019-08-04 00:00:00\",\"user_id\":7,\"project_id\":1,\"task_category_id\":1,\"priority\":\"medium\",\"status\":\"incomplete\",\"board_column_id\":3,\"column_priority\":0,\"completed_on\":null,\"created_by\":7,\"created_at\":\"2019-08-04 14:56:30\",\"updated_at\":\"2019-08-04 14:56:30\",\"due_on\":\"14 Aug, 19\",\"create_on\":\"04 Aug, 19\"}', '2019-08-13 22:46:05', '2019-08-04 18:56:30', '2019-08-13 22:46:05'),
('4f92143e-def4-4de7-a41c-c939f03fb4af', 'App\\Notifications\\NewTask', 'App\\User', 9, '{\"id\":51,\"company_id\":1,\"heading\":\"Afif\",\"description\":null,\"due_date\":\"2019-09-12 00:00:00\",\"start_date\":\"2019-09-02 00:00:00\",\"user_id\":9,\"project_id\":null,\"task_category_id\":1,\"priority\":\"medium\",\"status\":\"incomplete\",\"board_column_id\":3,\"column_priority\":0,\"completed_on\":null,\"created_by\":7,\"created_at\":\"2019-09-02 20:46:07\",\"updated_at\":\"2019-09-02 20:46:07\",\"tag\":null,\"section_tiles\":null,\"est_hour\":null,\"act_hour\":null,\"on_team\":null,\"due_on\":\"12 Sep, 19\",\"create_on\":\"02 Sep, 19\"}', NULL, '2019-09-02 14:46:09', '2019-09-02 14:46:09'),
('505af26f-eec6-41d6-9b33-db005574b2d5', 'App\\Notifications\\NewUser', 'App\\User', 7, '{\"id\":7,\"company_id\":1,\"name\":\"Joe Thigpen\",\"email\":\"joethigpen62@gmail.com\",\"image\":null,\"mobile\":null,\"gender\":\"male\",\"locale\":\"en\",\"status\":\"active\",\"login\":\"enable\",\"onesignal_player_id\":null,\"created_at\":\"2019-06-04 23:54:58\",\"updated_at\":\"2019-06-04 23:54:58\",\"super_admin\":\"0\",\"email_verification_code\":null}', '2019-08-13 22:46:05', '2019-06-05 03:54:58', '2019-08-13 22:46:05'),
('51bdc6ae-af44-4142-b449-c348f776556a', 'App\\Notifications\\TaskCompleted', 'App\\User', 7, '{\"id\":16,\"company_id\":1,\"heading\":\"Task 2\",\"description\":null,\"due_date\":\"2019-08-14 00:00:00\",\"start_date\":\"2019-08-04 00:00:00\",\"user_id\":7,\"project_id\":1,\"task_category_id\":1,\"priority\":\"medium\",\"status\":\"incomplete\",\"board_column_id\":4,\"column_priority\":0,\"completed_on\":\"2019-08-04 16:04:39\",\"created_by\":7,\"created_at\":\"2019-08-04 14:54:13\",\"updated_at\":\"2019-08-04 16:04:39\",\"due_on\":\"14 Aug, 19\",\"create_on\":\"04 Aug, 19\",\"project\":{\"id\":1,\"company_id\":1,\"project_name\":\"Duties Managers\",\"project_summary\":\"<p>These are the General Manager Duties<\\/p>\",\"project_admin\":7,\"start_date\":\"2019-06-01 00:00:00\",\"deadline\":null,\"notes\":null,\"category_id\":3,\"client_id\":null,\"feedback\":null,\"manual_timelog\":\"enable\",\"client_view_task\":\"enable\",\"allow_client_notification\":\"enable\",\"completion_percent\":0,\"calculate_task_progress\":\"true\",\"created_at\":\"2019-06-07 21:14:35\",\"updated_at\":\"2019-06-07 21:28:49\",\"deleted_at\":null,\"isProjectAdmin\":true}}', '2019-08-13 22:46:05', '2019-08-04 20:04:39', '2019-08-13 22:46:05'),
('56b433ba-5479-4a28-adf3-463abee8fa92', 'App\\Notifications\\NewTask', 'App\\User', 9, '{\"id\":74,\"company_id\":1,\"heading\":\"jikijki\",\"description\":null,\"due_date\":\"2019-09-12 00:00:00\",\"start_date\":\"2019-09-02 00:00:00\",\"user_id\":9,\"project_id\":null,\"task_category_id\":1,\"priority\":\"medium\",\"status\":\"incomplete\",\"board_column_id\":3,\"column_priority\":0,\"completed_on\":null,\"created_by\":7,\"created_at\":\"2019-09-02 21:38:12\",\"updated_at\":\"2019-09-02 21:38:12\",\"tag\":null,\"section_tiles\":null,\"est_hour\":null,\"act_hour\":null,\"on_team\":null,\"due_on\":\"12 Sep, 19\",\"create_on\":\"02 Sep, 19\"}', NULL, '2019-09-02 15:38:14', '2019-09-02 15:38:14'),
('5ce54438-6902-49a0-acb5-4adcce8e1aba', 'App\\Notifications\\NewTask', 'App\\User', 9, '{\"id\":34,\"company_id\":1,\"heading\":\"Afif\",\"description\":null,\"due_date\":\"2019-09-12 00:00:00\",\"start_date\":\"2019-09-02 00:00:00\",\"user_id\":9,\"project_id\":null,\"task_category_id\":1,\"priority\":\"medium\",\"status\":\"incomplete\",\"board_column_id\":3,\"column_priority\":0,\"completed_on\":null,\"created_by\":7,\"created_at\":\"2019-09-02 20:18:11\",\"updated_at\":\"2019-09-02 20:18:11\",\"tag\":null,\"section_tiles\":null,\"est_hour\":null,\"act_hour\":null,\"on_team\":null,\"due_on\":\"12 Sep, 19\",\"create_on\":\"02 Sep, 19\"}', NULL, '2019-09-02 14:18:13', '2019-09-02 14:18:13'),
('5d2eff6c-68d1-4a12-95bd-9ee60634001a', 'App\\Notifications\\NewTask', 'App\\User', 9, '{\"id\":30,\"company_id\":1,\"heading\":\"Afif\",\"description\":null,\"due_date\":\"2019-09-04 00:00:00\",\"start_date\":\"2019-09-26 00:00:00\",\"user_id\":9,\"project_id\":null,\"task_category_id\":1,\"priority\":\"medium\",\"status\":\"incomplete\",\"board_column_id\":3,\"column_priority\":0,\"completed_on\":null,\"created_by\":7,\"created_at\":\"2019-09-02 18:11:52\",\"updated_at\":\"2019-09-02 18:11:52\",\"tag\":null,\"section_tiles\":null,\"est_hour\":null,\"act_hour\":null,\"on_team\":null,\"due_on\":\"04 Sep, 19\",\"create_on\":\"26 Sep, 19\"}', NULL, '2019-09-02 12:11:55', '2019-09-02 12:11:55'),
('5ef6f9f6-9401-4117-880c-4fc7c57ff1a5', 'App\\Notifications\\NewTask', 'App\\User', 9, '{\"id\":62,\"company_id\":1,\"heading\":\"Afif\",\"description\":null,\"due_date\":\"2019-09-12 00:00:00\",\"start_date\":\"2019-09-02 00:00:00\",\"user_id\":9,\"project_id\":null,\"task_category_id\":1,\"priority\":\"medium\",\"status\":\"incomplete\",\"board_column_id\":3,\"column_priority\":0,\"completed_on\":null,\"created_by\":7,\"created_at\":\"2019-09-02 21:08:00\",\"updated_at\":\"2019-09-02 21:08:00\",\"tag\":null,\"section_tiles\":null,\"est_hour\":null,\"act_hour\":null,\"on_team\":null,\"due_on\":\"12 Sep, 19\",\"create_on\":\"02 Sep, 19\"}', NULL, '2019-09-02 15:08:01', '2019-09-02 15:08:01'),
('605d5fff-9d39-42d9-a3e4-42f910140d89', 'App\\Notifications\\NewTask', 'App\\User', 9, '{\"id\":19,\"company_id\":1,\"heading\":\"Task 4\",\"description\":null,\"due_date\":\"2019-08-14 00:00:00\",\"start_date\":\"2019-08-04 00:00:00\",\"user_id\":9,\"project_id\":null,\"task_category_id\":1,\"priority\":\"medium\",\"status\":\"incomplete\",\"board_column_id\":3,\"column_priority\":0,\"completed_on\":null,\"created_by\":7,\"created_at\":\"2019-08-04 14:57:50\",\"updated_at\":\"2019-08-04 14:57:50\",\"due_on\":\"14 Aug, 19\",\"create_on\":\"04 Aug, 19\"}', NULL, '2019-08-04 18:57:50', '2019-08-04 18:57:50'),
('64d31a4b-ead7-4e14-9b0e-6aa454b23e05', 'App\\Notifications\\NewTask', 'App\\User', 7, '{\"id\":16,\"company_id\":1,\"heading\":\"Task 2\",\"description\":null,\"due_date\":\"2019-08-14 00:00:00\",\"start_date\":\"2019-08-04 00:00:00\",\"user_id\":7,\"project_id\":1,\"task_category_id\":1,\"priority\":\"medium\",\"status\":\"incomplete\",\"board_column_id\":3,\"column_priority\":0,\"completed_on\":null,\"created_by\":7,\"created_at\":\"2019-08-04 14:54:13\",\"updated_at\":\"2019-08-04 14:54:13\",\"due_on\":\"14 Aug, 19\",\"create_on\":\"04 Aug, 19\"}', '2019-08-13 22:46:05', '2019-08-04 18:54:13', '2019-08-13 22:46:05'),
('6726977f-9d0e-43c0-9b41-b1a3f12fa081', 'App\\Notifications\\TaskUpdated', 'App\\User', 12, '{\"id\":9,\"company_id\":1,\"heading\":\"Duties Task 1\",\"description\":\"<p>dsadsadsada<\\/p>\",\"due_date\":\"2019-06-30 00:00:00\",\"start_date\":\"2019-06-07 00:00:00\",\"user_id\":12,\"project_id\":1,\"task_category_id\":1,\"priority\":\"medium\",\"status\":\"incomplete\",\"board_column_id\":3,\"column_priority\":0,\"completed_on\":null,\"created_by\":7,\"created_at\":\"2019-06-07 21:16:53\",\"updated_at\":\"2019-06-07 21:29:07\",\"due_on\":\"30 Jun, 19\",\"create_on\":\"07 Jun, 19\"}', NULL, '2019-06-08 01:29:07', '2019-06-08 01:29:07'),
('6b017393-1a18-4a35-9ba5-e96e292eef11', 'App\\Notifications\\NewTask', 'App\\User', 1, '{\"id\":1,\"company_id\":1,\"heading\":\"test task created by admin\",\"description\":null,\"due_date\":\"2019-06-01 00:00:00\",\"start_date\":\"2019-05-31 00:00:00\",\"user_id\":1,\"project_id\":null,\"task_category_id\":null,\"priority\":\"medium\",\"status\":\"incomplete\",\"board_column_id\":3,\"column_priority\":0,\"completed_on\":null,\"created_by\":1,\"created_at\":\"2019-05-31 19:48:34\",\"updated_at\":\"2019-05-31 19:48:34\",\"due_on\":\"01 Jun, 19\",\"create_on\":\"31 May, 19\"}', '2019-06-06 00:36:01', '2019-05-31 23:48:34', '2019-06-06 00:36:01'),
('745e7c7d-64e7-43bf-bccd-1e10ab087097', 'App\\Notifications\\NewTask', 'App\\User', 7, '{\"id\":7,\"company_id\":1,\"heading\":\"test in new column 2\",\"description\":null,\"due_date\":\"2019-06-12 00:00:00\",\"start_date\":\"2019-06-05 00:00:00\",\"user_id\":7,\"project_id\":null,\"task_category_id\":null,\"priority\":\"medium\",\"status\":\"incomplete\",\"board_column_id\":3,\"column_priority\":0,\"completed_on\":null,\"created_by\":1,\"created_at\":\"2019-06-05 20:06:33\",\"updated_at\":\"2019-06-05 20:06:33\",\"due_on\":\"12 Jun, 19\",\"create_on\":\"05 Jun, 19\"}', '2019-08-13 22:46:05', '2019-06-06 00:06:33', '2019-08-13 22:46:05'),
('754ed05d-28be-4dfc-8f0c-a719fd54dcb8', 'App\\Notifications\\TaskUpdated', 'App\\User', 7, '{\"id\":15,\"company_id\":1,\"heading\":\"Task 1\",\"description\":null,\"due_date\":\"2019-08-15 00:00:00\",\"start_date\":\"2019-08-04 00:00:00\",\"user_id\":7,\"project_id\":1,\"task_category_id\":1,\"priority\":\"medium\",\"status\":\"incomplete\",\"board_column_id\":3,\"column_priority\":0,\"completed_on\":null,\"created_by\":7,\"created_at\":\"2019-08-04 14:52:31\",\"updated_at\":\"2019-08-04 14:55:21\",\"due_on\":\"15 Aug, 19\",\"create_on\":\"04 Aug, 19\"}', '2019-08-13 22:46:05', '2019-08-04 18:55:21', '2019-08-13 22:46:05'),
('757bdbb0-a4ba-4b43-811c-142a8a9c425a', 'App\\Notifications\\NewTask', 'App\\User', 12, '{\"id\":25,\"company_id\":1,\"heading\":\"Test\",\"description\":null,\"due_date\":\"2019-09-18 00:00:00\",\"start_date\":\"2019-09-02 00:00:00\",\"user_id\":12,\"project_id\":1,\"task_category_id\":1,\"priority\":\"medium\",\"status\":\"incomplete\",\"board_column_id\":3,\"column_priority\":0,\"completed_on\":null,\"created_by\":7,\"created_at\":\"2019-09-02 17:48:26\",\"updated_at\":\"2019-09-02 17:48:26\",\"tag\":null,\"section_tiles\":null,\"est_hour\":null,\"act_hour\":null,\"on_team\":null,\"due_on\":\"18 Sep, 19\",\"create_on\":\"02 Sep, 19\"}', NULL, '2019-09-02 11:48:26', '2019-09-02 11:48:26'),
('766a2b5e-98a7-4b57-b1f8-15f9871a1145', 'App\\Notifications\\NewUser', 'App\\User', 8, '{\"id\":8,\"company_id\":1,\"name\":\"Rhonda Rouse\",\"email\":\"rrouse@workatask.com\",\"image\":null,\"mobile\":null,\"gender\":\"female\",\"locale\":\"en\",\"status\":\"active\",\"login\":\"enable\",\"onesignal_player_id\":null,\"created_at\":\"2019-06-07 20:53:12\",\"updated_at\":\"2019-06-07 20:53:12\",\"super_admin\":\"0\",\"email_verification_code\":null}', NULL, '2019-06-08 00:53:13', '2019-06-08 00:53:13'),
('76a0b6c9-069e-44b6-9406-31a2da2f91c5', 'App\\Notifications\\NewUser', 'App\\User', 6, '{\"id\":6,\"company_id\":1,\"name\":\"Encounterworks\",\"email\":\"joe.thigpen@encounterworks.com\",\"image\":null,\"mobile\":null,\"gender\":\"male\",\"locale\":\"en\",\"status\":\"active\",\"login\":\"enable\",\"onesignal_player_id\":null,\"created_at\":\"2019-06-04 20:23:48\",\"updated_at\":\"2019-06-04 20:23:48\",\"super_admin\":\"0\",\"email_verification_code\":null}', NULL, '2019-06-05 00:23:48', '2019-06-05 00:23:48'),
('79bd48d2-a8d2-4f8c-9c24-5ba95531fda6', 'App\\Notifications\\NewTask', 'App\\User', 9, '{\"id\":49,\"company_id\":1,\"heading\":\"Afif\",\"description\":null,\"due_date\":\"2019-09-12 00:00:00\",\"start_date\":\"2019-09-02 00:00:00\",\"user_id\":9,\"project_id\":null,\"task_category_id\":1,\"priority\":\"medium\",\"status\":\"incomplete\",\"board_column_id\":3,\"column_priority\":0,\"completed_on\":null,\"created_by\":7,\"created_at\":\"2019-09-02 20:38:08\",\"updated_at\":\"2019-09-02 20:38:08\",\"tag\":null,\"section_tiles\":null,\"est_hour\":null,\"act_hour\":null,\"on_team\":null,\"due_on\":\"12 Sep, 19\",\"create_on\":\"02 Sep, 19\"}', NULL, '2019-09-02 14:38:09', '2019-09-02 14:38:09'),
('7daa8397-be4b-4810-9f62-98eac7729dda', 'App\\Notifications\\NewUser', 'App\\User', 21, '{\"id\":21,\"company_id\":1,\"name\":\"clinet\",\"email\":\"client@workatask.com\",\"image\":null,\"mobile\":null,\"gender\":\"male\",\"locale\":\"en\",\"status\":\"active\",\"login\":\"enable\",\"onesignal_player_id\":null,\"created_at\":\"2019-08-14 16:35:23\",\"updated_at\":\"2019-08-14 16:35:23\",\"super_admin\":\"0\",\"email_verification_code\":null}', NULL, '2019-08-14 20:35:24', '2019-08-14 20:35:24'),
('81afb425-4060-4b09-a791-3568c4ce5c96', 'App\\Notifications\\TaskCompleted', 'App\\User', 1, '{\"id\":16,\"company_id\":1,\"heading\":\"Task 2\",\"description\":null,\"due_date\":\"2019-08-14 00:00:00\",\"start_date\":\"2019-08-04 00:00:00\",\"user_id\":7,\"project_id\":1,\"task_category_id\":1,\"priority\":\"medium\",\"status\":\"incomplete\",\"board_column_id\":4,\"column_priority\":0,\"completed_on\":\"2019-08-04 16:04:39\",\"created_by\":7,\"created_at\":\"2019-08-04 14:54:13\",\"updated_at\":\"2019-08-04 16:04:39\",\"due_on\":\"14 Aug, 19\",\"create_on\":\"04 Aug, 19\",\"project\":{\"id\":1,\"company_id\":1,\"project_name\":\"Duties Managers\",\"project_summary\":\"<p>These are the General Manager Duties<\\/p>\",\"project_admin\":7,\"start_date\":\"2019-06-01 00:00:00\",\"deadline\":null,\"notes\":null,\"category_id\":3,\"client_id\":null,\"feedback\":null,\"manual_timelog\":\"enable\",\"client_view_task\":\"enable\",\"allow_client_notification\":\"enable\",\"completion_percent\":0,\"calculate_task_progress\":\"true\",\"created_at\":\"2019-06-07 21:14:35\",\"updated_at\":\"2019-06-07 21:28:49\",\"deleted_at\":null,\"isProjectAdmin\":true}}', NULL, '2019-08-04 20:04:40', '2019-08-04 20:04:40'),
('82b8cbc8-20d9-4a10-9db4-25a2145151e9', 'App\\Notifications\\NewTask', 'App\\User', 7, '{\"id\":5,\"company_id\":1,\"heading\":\"Test Task\",\"description\":\"This is a test task\",\"due_date\":\"2019-06-05 00:00:00\",\"start_date\":\"2019-06-05 00:00:00\",\"user_id\":7,\"project_id\":null,\"task_category_id\":null,\"priority\":\"medium\",\"status\":\"incomplete\",\"board_column_id\":3,\"column_priority\":0,\"completed_on\":null,\"created_by\":1,\"created_at\":\"2019-06-05 19:58:46\",\"updated_at\":\"2019-06-05 19:58:46\",\"due_on\":\"05 Jun, 19\",\"create_on\":\"05 Jun, 19\"}', '2019-08-13 22:46:05', '2019-06-05 23:58:46', '2019-08-13 22:46:05'),
('852c46bb-e2b4-4ca6-84de-054f3cdc6158', 'App\\Notifications\\NewTask', 'App\\User', 9, '{\"id\":59,\"company_id\":1,\"heading\":\"Afif\",\"description\":null,\"due_date\":\"2019-09-12 00:00:00\",\"start_date\":\"2019-09-02 00:00:00\",\"user_id\":9,\"project_id\":null,\"task_category_id\":1,\"priority\":\"medium\",\"status\":\"incomplete\",\"board_column_id\":3,\"column_priority\":0,\"completed_on\":null,\"created_by\":7,\"created_at\":\"2019-09-02 21:03:40\",\"updated_at\":\"2019-09-02 21:03:40\",\"tag\":null,\"section_tiles\":null,\"est_hour\":null,\"act_hour\":null,\"on_team\":null,\"due_on\":\"12 Sep, 19\",\"create_on\":\"02 Sep, 19\"}', NULL, '2019-09-02 15:03:40', '2019-09-02 15:03:40'),
('86a6f296-1d9f-4adf-98a6-6c6d27dc0e8d', 'App\\Notifications\\NewCompanyRegister', 'App\\User', 3, '{\"id\":3,\"company_id\":null,\"name\":null,\"email\":null,\"image\":null,\"mobile\":null,\"gender\":\"male\",\"locale\":\"en\",\"status\":\"active\",\"login\":\"enable\",\"onesignal_player_id\":null,\"created_at\":\"2019-05-31 18:26:13\",\"updated_at\":\"2019-06-26 16:35:55\",\"super_admin\":\"1\",\"email_verification_code\":null,\"company_name\":\"test hide plan\"}', NULL, '2019-07-31 19:41:25', '2019-07-31 19:41:25'),
('88213d8c-79ed-44a8-99ea-fe95b2898f3f', 'App\\Notifications\\NewTask', 'App\\User', 9, '{\"id\":35,\"company_id\":1,\"heading\":\"Afif\",\"description\":null,\"due_date\":\"2019-09-12 00:00:00\",\"start_date\":\"2019-09-02 00:00:00\",\"user_id\":9,\"project_id\":null,\"task_category_id\":1,\"priority\":\"medium\",\"status\":\"incomplete\",\"board_column_id\":3,\"column_priority\":0,\"completed_on\":null,\"created_by\":7,\"created_at\":\"2019-09-02 20:18:37\",\"updated_at\":\"2019-09-02 20:18:37\",\"tag\":null,\"section_tiles\":null,\"est_hour\":null,\"act_hour\":null,\"on_team\":null,\"due_on\":\"12 Sep, 19\",\"create_on\":\"02 Sep, 19\"}', NULL, '2019-09-02 14:18:38', '2019-09-02 14:18:38'),
('8846ba97-3afa-47ed-8c57-75c2af7622ad', 'App\\Notifications\\NewTask', 'App\\User', 9, '{\"id\":61,\"company_id\":1,\"heading\":\"Afif\",\"description\":null,\"due_date\":\"2019-09-12 00:00:00\",\"start_date\":\"2019-09-02 00:00:00\",\"user_id\":9,\"project_id\":null,\"task_category_id\":1,\"priority\":\"medium\",\"status\":\"incomplete\",\"board_column_id\":3,\"column_priority\":0,\"completed_on\":null,\"created_by\":7,\"created_at\":\"2019-09-02 21:06:31\",\"updated_at\":\"2019-09-02 21:06:31\",\"tag\":null,\"section_tiles\":null,\"est_hour\":null,\"act_hour\":null,\"on_team\":null,\"due_on\":\"12 Sep, 19\",\"create_on\":\"02 Sep, 19\"}', NULL, '2019-09-02 15:06:31', '2019-09-02 15:06:31'),
('8936d04b-a4fd-47ca-bda8-846863deed5c', 'App\\Notifications\\TaskUpdated', 'App\\User', 7, '{\"id\":15,\"company_id\":1,\"heading\":\"Task 1\",\"description\":null,\"due_date\":\"2019-08-15 00:00:00\",\"start_date\":\"2019-08-04 00:00:00\",\"user_id\":7,\"project_id\":1,\"task_category_id\":1,\"priority\":\"high\",\"status\":\"incomplete\",\"board_column_id\":4,\"column_priority\":0,\"completed_on\":\"2019-08-30 19:30:57\",\"created_by\":7,\"created_at\":\"2019-08-05 00:52:31\",\"updated_at\":\"2019-08-30 19:30:57\",\"tag\":null,\"section_tiles\":null,\"est_hour\":null,\"act_hour\":null,\"due_on\":\"15 Aug, 19\",\"create_on\":\"04 Aug, 19\"}', NULL, '2019-08-30 13:30:57', '2019-08-30 13:30:57'),
('8d61c9ab-2343-4be9-a84c-7c03ebb4d3d0', 'App\\Notifications\\NewUser', 'App\\User', 14, '{\"id\":14,\"company_id\":1,\"name\":\"Leah\",\"email\":\"leah@workatask.com\",\"image\":null,\"mobile\":null,\"gender\":\"female\",\"locale\":\"en\",\"status\":\"active\",\"login\":\"enable\",\"onesignal_player_id\":null,\"created_at\":\"2019-06-07 21:05:34\",\"updated_at\":\"2019-06-07 21:05:34\",\"super_admin\":\"0\",\"email_verification_code\":null}', NULL, '2019-06-08 01:05:34', '2019-06-08 01:05:34'),
('935823aa-a046-44b1-a9d8-265f83c0f614', 'App\\Notifications\\NewUser', 'App\\User', 5, '{\"id\":5,\"company_id\":1,\"name\":\"Highclick\",\"email\":\"joeweb2@dtihost.com\",\"image\":null,\"mobile\":null,\"gender\":\"male\",\"locale\":\"en\",\"status\":\"active\",\"login\":\"enable\",\"onesignal_player_id\":null,\"created_at\":\"2019-06-04 20:23:12\",\"updated_at\":\"2019-06-04 20:23:12\",\"super_admin\":\"0\",\"email_verification_code\":null}', NULL, '2019-06-05 00:23:12', '2019-06-05 00:23:12'),
('942c95e0-79dd-4882-bce9-aa85179d8c95', 'App\\Notifications\\NewCompanyRegister', 'App\\User', 3, '{\"id\":3,\"company_id\":null,\"name\":\"Super Admin\",\"email\":\"superadmin@workatask.com\",\"image\":null,\"mobile\":null,\"gender\":\"male\",\"locale\":\"en\",\"status\":\"active\",\"login\":\"enable\",\"onesignal_player_id\":null,\"created_at\":\"2019-05-31 18:26:13\",\"updated_at\":\"2019-06-26 16:35:55\",\"super_admin\":\"1\",\"email_verification_code\":null,\"company_name\":\"testco\"}', NULL, '2019-07-06 20:18:38', '2019-07-06 20:18:38'),
('973597cd-c0ee-45e6-acd2-28e055ac96f2', 'App\\Notifications\\NewTask', 'App\\User', 12, '{\"id\":23,\"company_id\":1,\"heading\":\"Test\",\"description\":null,\"due_date\":\"2019-09-18 00:00:00\",\"start_date\":\"2019-09-02 00:00:00\",\"user_id\":12,\"project_id\":1,\"task_category_id\":1,\"priority\":\"medium\",\"status\":\"incomplete\",\"board_column_id\":3,\"column_priority\":0,\"completed_on\":null,\"created_by\":7,\"created_at\":\"2019-09-02 17:45:30\",\"updated_at\":\"2019-09-02 17:45:30\",\"tag\":null,\"section_tiles\":null,\"est_hour\":null,\"act_hour\":null,\"on_team\":null,\"due_on\":\"18 Sep, 19\",\"create_on\":\"02 Sep, 19\"}', NULL, '2019-09-02 11:45:30', '2019-09-02 11:45:30'),
('980d946e-e96b-41ac-94c5-1d1ffccab50f', 'App\\Notifications\\TaskCompleted', 'App\\User', 7, '{\"id\":5,\"company_id\":1,\"heading\":\"Test Task\",\"description\":\"This is a test task\",\"due_date\":\"2019-06-05 00:00:00\",\"start_date\":\"2019-06-05 00:00:00\",\"user_id\":7,\"project_id\":null,\"task_category_id\":null,\"priority\":\"medium\",\"status\":\"incomplete\",\"board_column_id\":4,\"column_priority\":0,\"completed_on\":\"2019-06-05 00:00:00\",\"created_by\":1,\"created_at\":\"2019-06-05 19:58:46\",\"updated_at\":\"2019-06-05 20:05:03\",\"due_on\":\"05 Jun, 19\",\"create_on\":\"05 Jun, 19\",\"project\":null}', '2019-08-13 22:46:05', '2019-06-06 00:05:03', '2019-08-13 22:46:05'),
('981b0dd7-71e4-4c14-93cf-d6cd37306147', 'App\\Notifications\\NewTask', 'App\\User', 9, '{\"id\":29,\"company_id\":1,\"heading\":\"Afif\",\"description\":null,\"due_date\":\"2019-09-04 00:00:00\",\"start_date\":\"2019-09-26 00:00:00\",\"user_id\":9,\"project_id\":null,\"task_category_id\":1,\"priority\":\"medium\",\"status\":\"incomplete\",\"board_column_id\":3,\"column_priority\":0,\"completed_on\":null,\"created_by\":7,\"created_at\":\"2019-09-02 18:11:03\",\"updated_at\":\"2019-09-02 18:11:03\",\"tag\":null,\"section_tiles\":null,\"est_hour\":null,\"act_hour\":null,\"on_team\":null,\"due_on\":\"04 Sep, 19\",\"create_on\":\"26 Sep, 19\"}', NULL, '2019-09-02 12:11:07', '2019-09-02 12:11:07'),
('991a0374-fff7-41ef-9218-739dd690a7d9', 'App\\Notifications\\TaskUpdated', 'App\\User', 7, '{\"id\":15,\"company_id\":1,\"heading\":\"Task 1\",\"description\":null,\"due_date\":\"2019-08-15 00:00:00\",\"start_date\":\"2019-08-04 00:00:00\",\"user_id\":7,\"project_id\":1,\"task_category_id\":1,\"priority\":\"high\",\"status\":\"incomplete\",\"board_column_id\":3,\"column_priority\":0,\"completed_on\":null,\"created_by\":7,\"created_at\":\"2019-08-05 00:52:31\",\"updated_at\":\"2019-08-30 19:27:20\",\"tag\":null,\"section_tiles\":null,\"est_hour\":null,\"act_hour\":null,\"due_on\":\"15 Aug, 19\",\"create_on\":\"04 Aug, 19\"}', NULL, '2019-08-30 13:27:26', '2019-08-30 13:27:26'),
('99a94ee5-37ef-449d-b7e3-748dfca90b94', 'App\\Notifications\\NewTask', 'App\\User', 12, '{\"id\":22,\"company_id\":1,\"heading\":\"Test\",\"description\":null,\"due_date\":\"2019-09-18 00:00:00\",\"start_date\":\"2019-09-02 00:00:00\",\"user_id\":12,\"project_id\":1,\"task_category_id\":1,\"priority\":\"medium\",\"status\":\"incomplete\",\"board_column_id\":3,\"column_priority\":0,\"completed_on\":null,\"created_by\":7,\"created_at\":\"2019-09-02 17:45:02\",\"updated_at\":\"2019-09-02 17:45:02\",\"tag\":null,\"section_tiles\":null,\"est_hour\":null,\"act_hour\":null,\"on_team\":null,\"due_on\":\"18 Sep, 19\",\"create_on\":\"02 Sep, 19\"}', NULL, '2019-09-02 11:45:05', '2019-09-02 11:45:05'),
('99e64131-3f77-420a-b471-19c2c44ec254', 'App\\Notifications\\TaskCompleted', 'App\\User', 1, '{\"id\":5,\"company_id\":1,\"heading\":\"Test Task\",\"description\":\"This is a test task\",\"due_date\":\"2019-06-05 00:00:00\",\"start_date\":\"2019-06-05 00:00:00\",\"user_id\":7,\"project_id\":null,\"task_category_id\":null,\"priority\":\"medium\",\"status\":\"incomplete\",\"board_column_id\":4,\"column_priority\":0,\"completed_on\":\"2019-06-05 00:00:00\",\"created_by\":1,\"created_at\":\"2019-06-05 19:58:46\",\"updated_at\":\"2019-06-05 20:05:03\",\"due_on\":\"05 Jun, 19\",\"create_on\":\"05 Jun, 19\",\"project\":null}', '2019-06-06 00:36:01', '2019-06-06 00:05:03', '2019-06-06 00:36:01'),
('ac242fa6-8604-49af-a0be-7432400fc0e2', 'App\\Notifications\\NewTask', 'App\\User', 7, '{\"id\":65,\"company_id\":1,\"heading\":\"TEst hkilo\",\"description\":null,\"due_date\":\"2019-09-12 00:00:00\",\"start_date\":\"2019-09-02 00:00:00\",\"user_id\":7,\"project_id\":null,\"task_category_id\":1,\"priority\":\"medium\",\"status\":\"incomplete\",\"board_column_id\":3,\"column_priority\":0,\"completed_on\":null,\"created_by\":7,\"created_at\":\"2019-09-02 21:25:06\",\"updated_at\":\"2019-09-02 21:25:06\",\"tag\":null,\"section_tiles\":null,\"est_hour\":null,\"act_hour\":null,\"on_team\":null,\"due_on\":\"12 Sep, 19\",\"create_on\":\"02 Sep, 19\"}', NULL, '2019-09-02 15:25:08', '2019-09-02 15:25:08'),
('b480bee0-0f51-41c7-8582-7aa2e4ab3875', 'App\\Notifications\\NewUser', 'App\\User', 9, '{\"id\":9,\"company_id\":1,\"name\":\"Ken Tyson\",\"email\":\"ken.tyson@workatask.com\",\"image\":null,\"mobile\":null,\"gender\":\"male\",\"locale\":\"en\",\"status\":\"active\",\"login\":\"enable\",\"onesignal_player_id\":null,\"created_at\":\"2019-06-07 20:54:04\",\"updated_at\":\"2019-06-07 20:54:04\",\"super_admin\":\"0\",\"email_verification_code\":null}', NULL, '2019-06-08 00:54:04', '2019-06-08 00:54:04'),
('b5404d22-63d3-4c3c-83e6-f0977df7d18e', 'App\\Notifications\\NewCompanyRegister', 'App\\User', 3, '{\"id\":3,\"company_id\":null,\"name\":null,\"email\":null,\"image\":null,\"mobile\":null,\"gender\":\"male\",\"locale\":\"en\",\"status\":\"active\",\"login\":\"enable\",\"onesignal_player_id\":null,\"created_at\":\"2019-05-31 18:26:13\",\"updated_at\":\"2019-06-26 16:35:55\",\"super_admin\":\"1\",\"email_verification_code\":null,\"company_name\":\"test\"}', NULL, '2019-07-31 19:38:54', '2019-07-31 19:38:54'),
('b728ec2a-f50b-440d-847e-f3850fe35e2c', 'App\\Notifications\\NewTask', 'App\\User', 9, '{\"id\":31,\"company_id\":1,\"heading\":\"Afif\",\"description\":null,\"due_date\":\"2019-09-04 00:00:00\",\"start_date\":\"2019-09-26 00:00:00\",\"user_id\":9,\"project_id\":null,\"task_category_id\":1,\"priority\":\"medium\",\"status\":\"incomplete\",\"board_column_id\":3,\"column_priority\":0,\"completed_on\":null,\"created_by\":7,\"created_at\":\"2019-09-02 18:14:58\",\"updated_at\":\"2019-09-02 18:14:58\",\"tag\":null,\"section_tiles\":null,\"est_hour\":null,\"act_hour\":null,\"on_team\":null,\"due_on\":\"04 Sep, 19\",\"create_on\":\"26 Sep, 19\"}', NULL, '2019-09-02 12:15:01', '2019-09-02 12:15:01'),
('b89edaa5-7648-4460-841d-da207b352d9e', 'App\\Notifications\\NewTask', 'App\\User', 9, '{\"id\":52,\"company_id\":1,\"heading\":\"Afif\",\"description\":null,\"due_date\":\"2019-09-12 00:00:00\",\"start_date\":\"2019-09-02 00:00:00\",\"user_id\":9,\"project_id\":null,\"task_category_id\":1,\"priority\":\"medium\",\"status\":\"incomplete\",\"board_column_id\":3,\"column_priority\":0,\"completed_on\":null,\"created_by\":7,\"created_at\":\"2019-09-02 20:50:17\",\"updated_at\":\"2019-09-02 20:50:17\",\"tag\":null,\"section_tiles\":null,\"est_hour\":null,\"act_hour\":null,\"on_team\":null,\"due_on\":\"12 Sep, 19\",\"create_on\":\"02 Sep, 19\"}', NULL, '2019-09-02 14:50:17', '2019-09-02 14:50:17');
INSERT INTO `notifications` (`id`, `type`, `notifiable_type`, `notifiable_id`, `data`, `read_at`, `created_at`, `updated_at`) VALUES
('bb9f945f-74b4-476b-958a-089b0a5f56ce', 'App\\Notifications\\NewUser', 'App\\User', 10, '{\"id\":10,\"company_id\":1,\"name\":\"Michelle Pittman\",\"email\":\"michelle@workatask.com\",\"image\":null,\"mobile\":null,\"gender\":\"female\",\"locale\":\"en\",\"status\":\"active\",\"login\":\"enable\",\"onesignal_player_id\":null,\"created_at\":\"2019-06-07 21:02:08\",\"updated_at\":\"2019-06-07 21:02:08\",\"super_admin\":\"0\",\"email_verification_code\":null}', NULL, '2019-06-08 01:02:08', '2019-06-08 01:02:08'),
('bd049e07-fb32-43a6-9c76-6804cdc80140', 'App\\Notifications\\NewTask', 'App\\User', 7, '{\"id\":68,\"company_id\":1,\"heading\":\"TEst hkilo\",\"description\":null,\"due_date\":\"2019-09-12 00:00:00\",\"start_date\":\"2019-09-02 00:00:00\",\"user_id\":7,\"project_id\":null,\"task_category_id\":1,\"priority\":\"medium\",\"status\":\"incomplete\",\"board_column_id\":3,\"column_priority\":0,\"completed_on\":null,\"created_by\":7,\"created_at\":\"2019-09-02 21:33:18\",\"updated_at\":\"2019-09-02 21:33:18\",\"tag\":null,\"section_tiles\":null,\"est_hour\":null,\"act_hour\":null,\"on_team\":null,\"due_on\":\"12 Sep, 19\",\"create_on\":\"02 Sep, 19\"}', NULL, '2019-09-02 15:33:18', '2019-09-02 15:33:18'),
('bdcf3ccb-f195-4ce4-a0e8-105708bc140f', 'App\\Notifications\\TaskCompleted', 'App\\User', 7, '{\"id\":10,\"company_id\":1,\"heading\":\"add template task 2\",\"description\":null,\"due_date\":\"2019-06-12 00:00:00\",\"start_date\":null,\"user_id\":7,\"project_id\":2,\"task_category_id\":null,\"priority\":\"medium\",\"status\":\"incomplete\",\"board_column_id\":4,\"column_priority\":0,\"completed_on\":\"2019-06-26 00:00:00\",\"created_by\":null,\"created_at\":\"2019-06-11 01:32:25\",\"updated_at\":\"2019-06-26 17:10:45\",\"due_on\":\"12 Jun, 19\",\"create_on\":\"\",\"project\":{\"id\":2,\"company_id\":1,\"project_name\":\"project Template test\",\"project_summary\":\"<p>dsdsadsad<\\/p>\",\"project_admin\":null,\"start_date\":\"2019-06-10 00:00:00\",\"deadline\":null,\"notes\":null,\"category_id\":3,\"client_id\":null,\"feedback\":null,\"manual_timelog\":\"disable\",\"client_view_task\":\"disable\",\"allow_client_notification\":\"disable\",\"completion_percent\":50,\"calculate_task_progress\":\"true\",\"created_at\":\"2019-06-11 01:32:24\",\"updated_at\":\"2019-06-26 17:10:38\",\"deleted_at\":null,\"isProjectAdmin\":false}}', '2019-08-13 22:46:05', '2019-06-26 21:10:45', '2019-08-13 22:46:05'),
('c34d4e78-827c-47bf-967c-1f05541ca25d', 'App\\Notifications\\NewUser', 'App\\User', 22, '{\"id\":22,\"company_id\":1,\"name\":null,\"email\":null,\"image\":null,\"mobile\":null,\"gender\":\"male\",\"locale\":\"en\",\"status\":\"active\",\"login\":\"enable\",\"onesignal_player_id\":null,\"created_at\":\"2019-08-14 17:05:19\",\"updated_at\":\"2019-08-14 17:05:19\",\"super_admin\":\"0\",\"email_verification_code\":null}', NULL, '2019-08-14 21:05:19', '2019-08-14 21:05:19'),
('c4dca080-2450-4d61-acd2-3764280bd5eb', 'App\\Notifications\\NewTask', 'App\\User', 7, '{\"id\":15,\"company_id\":1,\"heading\":\"Task 1\",\"description\":null,\"due_date\":\"2019-08-30 00:00:00\",\"start_date\":\"2019-08-04 00:00:00\",\"user_id\":7,\"project_id\":1,\"task_category_id\":1,\"priority\":\"medium\",\"status\":\"incomplete\",\"board_column_id\":3,\"column_priority\":0,\"completed_on\":null,\"created_by\":7,\"created_at\":\"2019-08-04 14:52:31\",\"updated_at\":\"2019-08-04 14:52:31\",\"due_on\":\"30 Aug, 19\",\"create_on\":\"04 Aug, 19\"}', '2019-08-13 22:46:05', '2019-08-04 18:52:31', '2019-08-13 22:46:05'),
('c638c16b-6cac-406e-be91-3dd3fab9badb', 'App\\Notifications\\TaskCompleted', 'App\\User', 7, '{\"id\":4,\"company_id\":1,\"heading\":\"task on board\",\"description\":null,\"due_date\":\"2019-07-06 00:00:00\",\"start_date\":\"2019-06-05 00:00:00\",\"user_id\":7,\"project_id\":null,\"task_category_id\":null,\"priority\":\"medium\",\"status\":\"incomplete\",\"board_column_id\":4,\"column_priority\":0,\"completed_on\":\"2019-06-26 00:00:00\",\"created_by\":1,\"created_at\":\"2019-06-05 13:22:30\",\"updated_at\":\"2019-06-26 16:01:44\",\"due_on\":\"06 Jul, 19\",\"create_on\":\"05 Jun, 19\",\"project\":null}', '2019-08-13 22:46:05', '2019-06-26 20:01:44', '2019-08-13 22:46:05'),
('c740efba-b0ec-4d2f-afeb-b4221068a8bf', 'App\\Notifications\\TaskUpdated', 'App\\User', 7, '{\"id\":15,\"company_id\":1,\"heading\":\"Task 1\",\"description\":null,\"due_date\":\"2019-08-15 00:00:00\",\"start_date\":\"2019-08-04 00:00:00\",\"user_id\":7,\"project_id\":1,\"task_category_id\":1,\"priority\":\"high\",\"status\":\"incomplete\",\"board_column_id\":4,\"column_priority\":0,\"completed_on\":\"2019-08-30 19:39:53\",\"created_by\":7,\"created_at\":\"2019-08-05 00:52:31\",\"updated_at\":\"2019-08-30 19:39:53\",\"tag\":null,\"section_tiles\":null,\"est_hour\":null,\"act_hour\":null,\"due_on\":\"15 Aug, 19\",\"create_on\":\"04 Aug, 19\"}', NULL, '2019-08-30 13:39:55', '2019-08-30 13:39:55'),
('c74ee189-d33f-469a-a442-fa2df171e51d', 'App\\Notifications\\NewTask', 'App\\User', 9, '{\"id\":47,\"company_id\":1,\"heading\":\"Afif\",\"description\":null,\"due_date\":\"2019-09-12 00:00:00\",\"start_date\":\"2019-09-02 00:00:00\",\"user_id\":9,\"project_id\":null,\"task_category_id\":1,\"priority\":\"medium\",\"status\":\"incomplete\",\"board_column_id\":3,\"column_priority\":0,\"completed_on\":null,\"created_by\":7,\"created_at\":\"2019-09-02 20:25:03\",\"updated_at\":\"2019-09-02 20:25:03\",\"tag\":null,\"section_tiles\":null,\"est_hour\":null,\"act_hour\":null,\"on_team\":null,\"due_on\":\"12 Sep, 19\",\"create_on\":\"02 Sep, 19\"}', NULL, '2019-09-02 14:25:04', '2019-09-02 14:25:04'),
('ce3ebf18-ee1b-4a39-8f09-4ca32e5a40b3', 'App\\Notifications\\TaskCompleted', 'App\\User', 7, '{\"id\":9,\"company_id\":1,\"heading\":\"Duties Task 1\",\"description\":null,\"due_date\":\"2019-06-30 00:00:00\",\"start_date\":\"2019-06-07 00:00:00\",\"user_id\":12,\"project_id\":1,\"task_category_id\":1,\"priority\":\"medium\",\"status\":\"incomplete\",\"board_column_id\":4,\"column_priority\":0,\"completed_on\":\"2019-06-07 00:00:00\",\"created_by\":7,\"created_at\":\"2019-06-07 21:16:53\",\"updated_at\":\"2019-06-07 21:28:46\",\"due_on\":\"30 Jun, 19\",\"create_on\":\"07 Jun, 19\",\"project\":{\"id\":1,\"company_id\":1,\"project_name\":\"Duties Managers\",\"project_summary\":\"<p>These are the General Manager Duties<\\/p>\",\"project_admin\":7,\"start_date\":\"2019-06-01 00:00:00\",\"deadline\":null,\"notes\":null,\"category_id\":3,\"client_id\":null,\"feedback\":null,\"manual_timelog\":\"enable\",\"client_view_task\":\"enable\",\"allow_client_notification\":\"enable\",\"completion_percent\":0,\"calculate_task_progress\":\"true\",\"created_at\":\"2019-06-07 21:14:35\",\"updated_at\":\"2019-06-07 21:15:03\",\"deleted_at\":null,\"isProjectAdmin\":true}}', '2019-08-13 22:46:05', '2019-06-08 01:28:47', '2019-08-13 22:46:05'),
('cf2ae9a0-9458-4e0b-b92b-19c42526376d', 'App\\Notifications\\NewTask', 'App\\User', 7, '{\"id\":6,\"company_id\":1,\"heading\":\"test in new column\",\"description\":null,\"due_date\":\"2019-06-25 00:00:00\",\"start_date\":\"2019-06-05 00:00:00\",\"user_id\":7,\"project_id\":null,\"task_category_id\":null,\"priority\":\"medium\",\"status\":\"incomplete\",\"board_column_id\":3,\"column_priority\":0,\"completed_on\":null,\"created_by\":1,\"created_at\":\"2019-06-05 20:05:48\",\"updated_at\":\"2019-06-05 20:05:48\",\"due_on\":\"25 Jun, 19\",\"create_on\":\"05 Jun, 19\"}', '2019-08-13 22:46:05', '2019-06-06 00:05:48', '2019-08-13 22:46:05'),
('cfa247ab-6544-4a22-aabb-19c0a44529a6', 'App\\Notifications\\TaskCompleted', 'App\\User', 1, '{\"id\":4,\"company_id\":1,\"heading\":\"task on board\",\"description\":null,\"due_date\":\"2019-07-06 00:00:00\",\"start_date\":\"2019-06-05 00:00:00\",\"user_id\":7,\"project_id\":null,\"task_category_id\":null,\"priority\":\"medium\",\"status\":\"incomplete\",\"board_column_id\":4,\"column_priority\":0,\"completed_on\":\"2019-06-26 00:00:00\",\"created_by\":1,\"created_at\":\"2019-06-05 13:22:30\",\"updated_at\":\"2019-06-26 16:01:44\",\"due_on\":\"06 Jul, 19\",\"create_on\":\"05 Jun, 19\",\"project\":null}', NULL, '2019-06-26 20:01:44', '2019-06-26 20:01:44'),
('d4b9d687-008a-43bd-84f6-3e27e0b35f83', 'App\\Notifications\\NewTask', 'App\\User', 7, '{\"id\":67,\"company_id\":1,\"heading\":\"TEst hkilo\",\"description\":null,\"due_date\":\"2019-09-12 00:00:00\",\"start_date\":\"2019-09-02 00:00:00\",\"user_id\":7,\"project_id\":null,\"task_category_id\":1,\"priority\":\"medium\",\"status\":\"incomplete\",\"board_column_id\":3,\"column_priority\":0,\"completed_on\":null,\"created_by\":7,\"created_at\":\"2019-09-02 21:33:05\",\"updated_at\":\"2019-09-02 21:33:05\",\"tag\":null,\"section_tiles\":null,\"est_hour\":null,\"act_hour\":null,\"on_team\":null,\"due_on\":\"12 Sep, 19\",\"create_on\":\"02 Sep, 19\"}', NULL, '2019-09-02 15:33:05', '2019-09-02 15:33:05'),
('d8c1ce40-d3b8-4a44-86f8-8642dc114dae', 'App\\Notifications\\NewTask', 'App\\User', 12, '{\"id\":28,\"company_id\":1,\"heading\":\"Test\",\"description\":null,\"due_date\":\"2019-09-18 00:00:00\",\"start_date\":\"2019-09-02 00:00:00\",\"user_id\":12,\"project_id\":1,\"task_category_id\":1,\"priority\":\"medium\",\"status\":\"incomplete\",\"board_column_id\":3,\"column_priority\":0,\"completed_on\":null,\"created_by\":7,\"created_at\":\"2019-09-02 17:57:02\",\"updated_at\":\"2019-09-02 17:57:02\",\"tag\":null,\"section_tiles\":null,\"est_hour\":null,\"act_hour\":null,\"on_team\":null,\"due_on\":\"18 Sep, 19\",\"create_on\":\"02 Sep, 19\"}', NULL, '2019-09-02 11:57:06', '2019-09-02 11:57:06'),
('dcc157a6-2176-42ce-8e30-0b220f279250', 'App\\Notifications\\NewTask', 'App\\User', 7, '{\"id\":14,\"company_id\":1,\"heading\":\"New Task after upgrade\",\"description\":\"<p>test<\\/p>\",\"due_date\":\"2019-07-30 00:00:00\",\"start_date\":\"2019-07-30 00:00:00\",\"user_id\":7,\"project_id\":1,\"task_category_id\":1,\"priority\":\"medium\",\"status\":\"incomplete\",\"board_column_id\":3,\"column_priority\":0,\"completed_on\":null,\"created_by\":7,\"created_at\":\"2019-07-30 19:39:19\",\"updated_at\":\"2019-07-30 19:39:19\",\"due_on\":\"30 Jul, 19\",\"create_on\":\"30 Jul, 19\"}', '2019-08-13 22:46:05', '2019-07-30 23:39:19', '2019-08-13 22:46:05'),
('e11ec48c-806f-48f9-bf8c-e56f59412315', 'App\\Notifications\\NewTask', 'App\\User', 9, '{\"id\":54,\"company_id\":1,\"heading\":\"Afif\",\"description\":null,\"due_date\":\"2019-09-12 00:00:00\",\"start_date\":\"2019-09-02 00:00:00\",\"user_id\":9,\"project_id\":null,\"task_category_id\":1,\"priority\":\"medium\",\"status\":\"incomplete\",\"board_column_id\":3,\"column_priority\":0,\"completed_on\":null,\"created_by\":7,\"created_at\":\"2019-09-02 20:54:16\",\"updated_at\":\"2019-09-02 20:54:16\",\"tag\":null,\"section_tiles\":null,\"est_hour\":null,\"act_hour\":null,\"on_team\":null,\"due_on\":\"12 Sep, 19\",\"create_on\":\"02 Sep, 19\"}', NULL, '2019-09-02 14:54:16', '2019-09-02 14:54:16'),
('e1ee323a-2405-4b49-90ff-f24fa96482af', 'App\\Notifications\\NewTask', 'App\\User', 9, '{\"id\":48,\"company_id\":1,\"heading\":\"Afif\",\"description\":null,\"due_date\":\"2019-09-12 00:00:00\",\"start_date\":\"2019-09-02 00:00:00\",\"user_id\":9,\"project_id\":null,\"task_category_id\":1,\"priority\":\"medium\",\"status\":\"incomplete\",\"board_column_id\":3,\"column_priority\":0,\"completed_on\":null,\"created_by\":7,\"created_at\":\"2019-09-02 20:25:21\",\"updated_at\":\"2019-09-02 20:25:21\",\"tag\":null,\"section_tiles\":null,\"est_hour\":null,\"act_hour\":null,\"on_team\":null,\"due_on\":\"12 Sep, 19\",\"create_on\":\"02 Sep, 19\"}', NULL, '2019-09-02 14:25:21', '2019-09-02 14:25:21'),
('e35fc3ef-106e-4f54-98b7-b48b61e51896', 'App\\Notifications\\TaskCompleted', 'App\\User', 1, '{\"id\":10,\"company_id\":1,\"heading\":\"add template task 2\",\"description\":null,\"due_date\":\"2019-06-12 00:00:00\",\"start_date\":null,\"user_id\":7,\"project_id\":2,\"task_category_id\":null,\"priority\":\"medium\",\"status\":\"incomplete\",\"board_column_id\":4,\"column_priority\":0,\"completed_on\":\"2019-06-26 00:00:00\",\"created_by\":null,\"created_at\":\"2019-06-11 01:32:25\",\"updated_at\":\"2019-06-26 17:10:45\",\"due_on\":\"12 Jun, 19\",\"create_on\":\"\",\"project\":{\"id\":2,\"company_id\":1,\"project_name\":\"project Template test\",\"project_summary\":\"<p>dsdsadsad<\\/p>\",\"project_admin\":null,\"start_date\":\"2019-06-10 00:00:00\",\"deadline\":null,\"notes\":null,\"category_id\":3,\"client_id\":null,\"feedback\":null,\"manual_timelog\":\"disable\",\"client_view_task\":\"disable\",\"allow_client_notification\":\"disable\",\"completion_percent\":50,\"calculate_task_progress\":\"true\",\"created_at\":\"2019-06-11 01:32:24\",\"updated_at\":\"2019-06-26 17:10:38\",\"deleted_at\":null,\"isProjectAdmin\":false}}', NULL, '2019-06-26 21:10:45', '2019-06-26 21:10:45'),
('e4d63d32-5405-498b-a7c5-8e71da865311', 'App\\Notifications\\NewTask', 'App\\User', 7, '{\"id\":73,\"company_id\":1,\"heading\":\"TEst hkilo\",\"description\":null,\"due_date\":\"2019-09-12 00:00:00\",\"start_date\":\"2019-09-02 00:00:00\",\"user_id\":7,\"project_id\":null,\"task_category_id\":1,\"priority\":\"medium\",\"status\":\"incomplete\",\"board_column_id\":3,\"column_priority\":0,\"completed_on\":null,\"created_by\":7,\"created_at\":\"2019-09-02 21:35:08\",\"updated_at\":\"2019-09-02 21:35:08\",\"tag\":null,\"section_tiles\":null,\"est_hour\":null,\"act_hour\":null,\"on_team\":null,\"due_on\":\"12 Sep, 19\",\"create_on\":\"02 Sep, 19\"}', NULL, '2019-09-02 15:35:08', '2019-09-02 15:35:08'),
('e62365ad-b830-40e8-8f4e-e0b5507f68c7', 'App\\Notifications\\NewCompanyRegister', 'App\\User', 3, '{\"id\":3,\"company_id\":null,\"name\":\"Super Admin\",\"email\":\"superadmin@example.com\",\"image\":null,\"mobile\":null,\"gender\":\"male\",\"locale\":\"en\",\"status\":\"active\",\"login\":\"enable\",\"onesignal_player_id\":null,\"created_at\":\"2019-05-31 18:26:13\",\"updated_at\":\"2019-05-31 18:26:13\",\"super_admin\":\"1\",\"email_verification_code\":null,\"company_name\":\"companyxyz\"}', NULL, '2019-06-13 00:32:46', '2019-06-13 00:32:46'),
('e88a6dc5-f4e8-47ff-b2a6-039cd18babaa', 'App\\Notifications\\NewTask', 'App\\User', 12, '{\"id\":26,\"company_id\":1,\"heading\":\"Test\",\"description\":null,\"due_date\":\"2019-09-18 00:00:00\",\"start_date\":\"2019-09-02 00:00:00\",\"user_id\":12,\"project_id\":1,\"task_category_id\":1,\"priority\":\"medium\",\"status\":\"incomplete\",\"board_column_id\":3,\"column_priority\":0,\"completed_on\":null,\"created_by\":7,\"created_at\":\"2019-09-02 17:49:37\",\"updated_at\":\"2019-09-02 17:49:37\",\"tag\":null,\"section_tiles\":null,\"est_hour\":null,\"act_hour\":null,\"on_team\":null,\"due_on\":\"18 Sep, 19\",\"create_on\":\"02 Sep, 19\"}', NULL, '2019-09-02 11:49:37', '2019-09-02 11:49:37'),
('e8d25334-8cf8-4e01-8d1c-fe6fd07998f2', 'App\\Notifications\\TaskUpdated', 'App\\User', 7, '{\"id\":10,\"company_id\":1,\"heading\":\"add template task 2\",\"description\":null,\"due_date\":\"2019-06-12 00:00:00\",\"start_date\":null,\"user_id\":7,\"project_id\":2,\"task_category_id\":null,\"priority\":\"medium\",\"status\":\"incomplete\",\"board_column_id\":5,\"column_priority\":0,\"completed_on\":null,\"created_by\":null,\"created_at\":\"2019-06-11 01:32:25\",\"updated_at\":\"2019-06-26 15:59:23\",\"due_on\":\"12 Jun, 19\",\"create_on\":\"\"}', '2019-08-13 22:46:05', '2019-06-26 19:59:24', '2019-08-13 22:46:05'),
('ec403ae0-6146-45ca-a879-fedd70c5f1f6', 'App\\Notifications\\NewTask', 'App\\User', 7, '{\"id\":13,\"company_id\":1,\"heading\":\"Task 2\",\"description\":null,\"due_date\":\"2019-07-16 00:00:00\",\"start_date\":\"2019-07-02 00:00:00\",\"user_id\":7,\"project_id\":null,\"task_category_id\":1,\"priority\":\"medium\",\"status\":\"incomplete\",\"board_column_id\":3,\"column_priority\":0,\"completed_on\":null,\"created_by\":7,\"created_at\":\"2019-07-02 02:49:44\",\"updated_at\":\"2019-07-02 02:49:44\",\"due_on\":\"16 Jul, 19\",\"create_on\":\"02 Jul, 19\"}', '2019-08-13 22:46:05', '2019-07-02 06:49:45', '2019-08-13 22:46:05'),
('f1141286-e850-4354-8e46-aa0b69e685ab', 'App\\Notifications\\TaskCompleted', 'App\\User', 7, '{\"id\":11,\"company_id\":1,\"heading\":\"add template task 1\",\"description\":null,\"due_date\":\"2019-06-12 00:00:00\",\"start_date\":null,\"user_id\":7,\"project_id\":2,\"task_category_id\":null,\"priority\":\"medium\",\"status\":\"incomplete\",\"board_column_id\":4,\"column_priority\":1,\"completed_on\":\"2019-06-26 00:00:00\",\"created_by\":null,\"created_at\":\"2019-06-11 01:32:25\",\"updated_at\":\"2019-06-26 17:10:37\",\"due_on\":\"12 Jun, 19\",\"create_on\":\"\",\"project\":{\"id\":2,\"company_id\":1,\"project_name\":\"project Template test\",\"project_summary\":\"<p>dsdsadsad<\\/p>\",\"project_admin\":null,\"start_date\":\"2019-06-10 00:00:00\",\"deadline\":null,\"notes\":null,\"category_id\":3,\"client_id\":null,\"feedback\":null,\"manual_timelog\":\"disable\",\"client_view_task\":\"disable\",\"allow_client_notification\":\"disable\",\"completion_percent\":0,\"calculate_task_progress\":\"true\",\"created_at\":\"2019-06-11 01:32:24\",\"updated_at\":\"2019-06-11 01:32:24\",\"deleted_at\":null,\"isProjectAdmin\":false}}', '2019-08-13 22:46:05', '2019-06-26 21:10:37', '2019-08-13 22:46:05'),
('f1d1023d-f372-4bdf-8b13-91211b115de7', 'App\\Notifications\\NewTask', 'App\\User', 9, '{\"id\":55,\"company_id\":1,\"heading\":\"Afif\",\"description\":null,\"due_date\":\"2019-09-12 00:00:00\",\"start_date\":\"2019-09-02 00:00:00\",\"user_id\":9,\"project_id\":null,\"task_category_id\":1,\"priority\":\"medium\",\"status\":\"incomplete\",\"board_column_id\":3,\"column_priority\":0,\"completed_on\":null,\"created_by\":7,\"created_at\":\"2019-09-02 20:54:27\",\"updated_at\":\"2019-09-02 20:54:27\",\"tag\":null,\"section_tiles\":null,\"est_hour\":null,\"act_hour\":null,\"on_team\":null,\"due_on\":\"12 Sep, 19\",\"create_on\":\"02 Sep, 19\"}', NULL, '2019-09-02 14:54:27', '2019-09-02 14:54:27'),
('f5a636e9-a1b6-4e72-9ac2-212da2d81cc9', 'App\\Notifications\\NewTask', 'App\\User', 12, '{\"id\":9,\"company_id\":1,\"heading\":\"Duties Task 1\",\"description\":null,\"due_date\":\"2019-06-30 00:00:00\",\"start_date\":\"2019-06-07 00:00:00\",\"user_id\":12,\"project_id\":1,\"task_category_id\":1,\"priority\":\"medium\",\"status\":\"incomplete\",\"board_column_id\":3,\"column_priority\":0,\"completed_on\":null,\"created_by\":7,\"created_at\":\"2019-06-07 21:16:53\",\"updated_at\":\"2019-06-07 21:16:53\",\"due_on\":\"30 Jun, 19\",\"create_on\":\"07 Jun, 19\"}', NULL, '2019-06-08 01:16:53', '2019-06-08 01:16:53'),
('f689a386-fdf4-4f97-a3c8-3361174f5689', 'App\\Notifications\\NewTask', 'App\\User', 9, '{\"id\":64,\"company_id\":1,\"heading\":\"Afif\",\"description\":null,\"due_date\":\"2019-09-12 00:00:00\",\"start_date\":\"2019-09-02 00:00:00\",\"user_id\":9,\"project_id\":null,\"task_category_id\":1,\"priority\":\"medium\",\"status\":\"incomplete\",\"board_column_id\":3,\"column_priority\":0,\"completed_on\":null,\"created_by\":7,\"created_at\":\"2019-09-02 21:08:43\",\"updated_at\":\"2019-09-02 21:08:43\",\"tag\":null,\"section_tiles\":null,\"est_hour\":null,\"act_hour\":null,\"on_team\":null,\"due_on\":\"12 Sep, 19\",\"create_on\":\"02 Sep, 19\"}', NULL, '2019-09-02 15:08:44', '2019-09-02 15:08:44'),
('f721609e-25a3-4d19-be8f-857747cf2f40', 'App\\Notifications\\TaskCompleted', 'App\\User', 1, '{\"id\":9,\"company_id\":1,\"heading\":\"Duties Task 1\",\"description\":null,\"due_date\":\"2019-06-30 00:00:00\",\"start_date\":\"2019-06-07 00:00:00\",\"user_id\":12,\"project_id\":1,\"task_category_id\":1,\"priority\":\"medium\",\"status\":\"incomplete\",\"board_column_id\":4,\"column_priority\":0,\"completed_on\":\"2019-06-07 00:00:00\",\"created_by\":7,\"created_at\":\"2019-06-07 21:16:53\",\"updated_at\":\"2019-06-07 21:28:46\",\"due_on\":\"30 Jun, 19\",\"create_on\":\"07 Jun, 19\",\"project\":{\"id\":1,\"company_id\":1,\"project_name\":\"Duties Managers\",\"project_summary\":\"<p>These are the General Manager Duties<\\/p>\",\"project_admin\":7,\"start_date\":\"2019-06-01 00:00:00\",\"deadline\":null,\"notes\":null,\"category_id\":3,\"client_id\":null,\"feedback\":null,\"manual_timelog\":\"enable\",\"client_view_task\":\"enable\",\"allow_client_notification\":\"enable\",\"completion_percent\":0,\"calculate_task_progress\":\"true\",\"created_at\":\"2019-06-07 21:14:35\",\"updated_at\":\"2019-06-07 21:15:03\",\"deleted_at\":null,\"isProjectAdmin\":true}}', NULL, '2019-06-08 01:28:47', '2019-06-08 01:28:47'),
('fab9b180-5e7e-4b6a-9e9f-912de3e9f9f0', 'App\\Notifications\\TaskCompleted', 'App\\User', 1, '{\"id\":11,\"company_id\":1,\"heading\":\"add template task 1\",\"description\":null,\"due_date\":\"2019-06-12 00:00:00\",\"start_date\":null,\"user_id\":7,\"project_id\":2,\"task_category_id\":null,\"priority\":\"medium\",\"status\":\"incomplete\",\"board_column_id\":4,\"column_priority\":1,\"completed_on\":\"2019-06-26 00:00:00\",\"created_by\":null,\"created_at\":\"2019-06-11 01:32:25\",\"updated_at\":\"2019-06-26 17:10:37\",\"due_on\":\"12 Jun, 19\",\"create_on\":\"\",\"project\":{\"id\":2,\"company_id\":1,\"project_name\":\"project Template test\",\"project_summary\":\"<p>dsdsadsad<\\/p>\",\"project_admin\":null,\"start_date\":\"2019-06-10 00:00:00\",\"deadline\":null,\"notes\":null,\"category_id\":3,\"client_id\":null,\"feedback\":null,\"manual_timelog\":\"disable\",\"client_view_task\":\"disable\",\"allow_client_notification\":\"disable\",\"completion_percent\":0,\"calculate_task_progress\":\"true\",\"created_at\":\"2019-06-11 01:32:24\",\"updated_at\":\"2019-06-11 01:32:24\",\"deleted_at\":null,\"isProjectAdmin\":false}}', NULL, '2019-06-26 21:10:37', '2019-06-26 21:10:37'),
('fc003afa-c358-4ff9-bea8-e8cfc03f2364', 'App\\Notifications\\NewTask', 'App\\User', 7, '{\"id\":4,\"company_id\":1,\"heading\":\"task on board\",\"description\":null,\"due_date\":\"2019-07-06 00:00:00\",\"start_date\":\"2019-06-05 00:00:00\",\"user_id\":7,\"project_id\":null,\"task_category_id\":null,\"priority\":\"medium\",\"status\":\"incomplete\",\"board_column_id\":3,\"column_priority\":0,\"completed_on\":null,\"created_by\":1,\"created_at\":\"2019-06-05 13:22:30\",\"updated_at\":\"2019-06-05 13:22:30\",\"due_on\":\"06 Jul, 19\",\"create_on\":\"05 Jun, 19\"}', '2019-08-13 22:46:05', '2019-06-05 17:22:30', '2019-08-13 22:46:05'),
('ff4262fb-6674-4647-99e1-6a6d19bc9b52', 'App\\Notifications\\NewTask', 'App\\User', 9, '{\"id\":75,\"company_id\":1,\"heading\":\"jikijki\",\"description\":null,\"due_date\":\"2019-09-12 00:00:00\",\"start_date\":\"2019-09-02 00:00:00\",\"user_id\":9,\"project_id\":null,\"task_category_id\":1,\"priority\":\"medium\",\"status\":\"incomplete\",\"board_column_id\":3,\"column_priority\":0,\"completed_on\":null,\"created_by\":7,\"created_at\":\"2019-09-02 21:38:40\",\"updated_at\":\"2019-09-02 21:38:40\",\"tag\":null,\"section_tiles\":null,\"est_hour\":null,\"act_hour\":null,\"on_team\":null,\"due_on\":\"12 Sep, 19\",\"create_on\":\"02 Sep, 19\"}', NULL, '2019-09-02 15:38:40', '2019-09-02 15:38:40');

-- --------------------------------------------------------

--
-- Table structure for table `offline_payment_methods`
--

CREATE TABLE `offline_payment_methods` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `name` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` enum('yes','no') COLLATE utf8_unicode_ci DEFAULT 'yes',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `packages`
--

CREATE TABLE `packages` (
  `id` int(10) UNSIGNED NOT NULL,
  `currency_id` int(10) UNSIGNED DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `max_storage_size` int(10) UNSIGNED DEFAULT NULL,
  `max_file_size` int(10) UNSIGNED DEFAULT NULL,
  `annual_price` decimal(8,2) UNSIGNED NOT NULL DEFAULT 0.00,
  `monthly_price` decimal(8,2) UNSIGNED NOT NULL DEFAULT 0.00,
  `billing_cycle` tinyint(3) UNSIGNED DEFAULT NULL,
  `max_employees` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `sort` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `module_in_package` varchar(1000) COLLATE utf8_unicode_ci NOT NULL,
  `stripe_annual_plan_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `stripe_monthly_plan_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `default` enum('yes','no','trial') COLLATE utf8_unicode_ci DEFAULT 'no',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `isShowPlan` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `packages`
--

INSERT INTO `packages` (`id`, `currency_id`, `name`, `description`, `max_storage_size`, `max_file_size`, `annual_price`, `monthly_price`, `billing_cycle`, `max_employees`, `sort`, `module_in_package`, `stripe_annual_plan_id`, `stripe_monthly_plan_id`, `default`, `created_at`, `updated_at`, `isShowPlan`) VALUES
(1, 1, 'Default', 'Its a default package and cannot be deleted', NULL, NULL, '0.00', '0.00', NULL, 20, NULL, '{\"19\":\"task Pro\"}', 'default_plan', 'default_plan', 'yes', '2019-05-31 22:26:13', '2019-08-24 03:06:50', 1),
(2, NULL, 'Free Trial', 'Its a trial package', NULL, NULL, '0.00', '0.00', NULL, 20, NULL, '{\"1\":\"clients\",\"2\":\"employees\",\"3\":\"projects\",\"4\":\"attendance\",\"5\":\"tasks\",\"6\":\"estimates\",\"7\":\"invoices\",\"8\":\"payments\",\"9\":\"timelogs\",\"10\":\"tickets\",\"11\":\"events\",\"12\":\"messages\",\"13\":\"notices\",\"14\":\"leaves\",\"15\":\"leads\",\"16\":\"holidays\",\"17\":\"products\",\"18\":\"expenses\"}', 'trial_plan', 'trial_plan', 'trial', '2019-05-31 22:26:13', '2019-06-05 17:32:57', 1),
(3, 1, 'Free', 'It\'s a free package.', 500, 10, '0.00', '0.00', NULL, 20, NULL, '{\"1\":\"clients\",\"2\":\"employees\",\"3\":\"projects\",\"4\":\"attendance\",\"5\":\"tasks\",\"6\":\"estimates\",\"7\":\"invoices\",\"8\":\"payments\",\"9\":\"timelogs\",\"10\":\"tickets\",\"11\":\"events\",\"12\":\"messages\",\"13\":\"notices\",\"14\":\"leaves\",\"15\":\"leads\",\"16\":\"holidays\",\"17\":\"products\",\"18\":\"expenses\",\"19\":\"task Pro\"}', '', '', 'no', '2019-05-31 22:26:13', '2019-08-24 03:06:07', 1),
(4, 1, 'Starter', 'Quidem deserunt nobis asperiores fuga Ullamco corporis culpa', 1024, 30, '1.00', '1.00', NULL, 50, NULL, '{\"1\":\"clients\",\"2\":\"employees\",\"3\":\"projects\",\"4\":\"attendance\",\"5\":\"tasks\",\"6\":\"estimates\",\"7\":\"invoices\",\"8\":\"payments\",\"9\":\"timelogs\",\"10\":\"tickets\",\"16\":\"holidays\",\"18\":\"expenses\",\"19\":\"task Pro\"}', 'starter_annual', 'starter_monthly', 'no', '2019-05-31 22:26:13', '2019-08-24 03:06:25', 0),
(5, 1, 'Medium', 'Quidem deserunt nobis asperiores fuga Ullamco corporis culpa', 3072, 50, '1.00', '1.00', NULL, 100, NULL, '{\"1\":\"clients\",\"2\":\"employees\",\"3\":\"projects\",\"5\":\"tasks\",\"19\":\"task Pro\"}', 'medium_annual', 'medium_monthly', 'no', '2019-05-31 22:26:13', '2019-08-24 03:04:51', 1),
(6, 1, 'Larger', 'Quidem deserunt nobis asperiores fuga Ullamco corporis culpa', 10240, 100, '2.00', '2.00', NULL, 500, NULL, '{\"1\":\"clients\",\"2\":\"employees\",\"3\":\"projects\",\"4\":\"attendance\",\"5\":\"tasks\",\"6\":\"estimates\",\"7\":\"invoices\",\"8\":\"payments\",\"9\":\"timelogs\",\"10\":\"tickets\",\"11\":\"events\",\"12\":\"messages\",\"13\":\"notices\",\"14\":\"leaves\",\"15\":\"leads\",\"16\":\"holidays\",\"17\":\"products\",\"18\":\"expenses\",\"19\":\"task Pro\"}', 'larger_annual', 'larger_monthly', 'no', '2019-05-31 22:26:13', '2019-08-24 03:06:39', 1);

-- --------------------------------------------------------

--
-- Table structure for table `package_settings`
--

CREATE TABLE `package_settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `status` enum('active','inactive') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'inactive',
  `no_of_days` int(11) DEFAULT 30,
  `modules` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `notification_before` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `package_settings`
--

INSERT INTO `package_settings` (`id`, `status`, `no_of_days`, `modules`, `notification_before`, `created_at`, `updated_at`) VALUES
(1, 'active', 14, '{\"1\":\"clients\",\"2\":\"employees\",\"3\":\"projects\",\"4\":\"attendance\",\"5\":\"tasks\",\"6\":\"estimates\",\"7\":\"invoices\",\"8\":\"payments\",\"9\":\"timelogs\",\"10\":\"tickets\",\"11\":\"events\",\"12\":\"messages\",\"13\":\"notices\",\"14\":\"leaves\",\"15\":\"leads\",\"16\":\"holidays\",\"17\":\"products\",\"18\":\"expenses\"}', 3, '2019-05-31 22:26:13', '2019-06-05 17:32:57');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `password_resets`
--

INSERT INTO `password_resets` (`email`, `token`, `created_at`) VALUES
('jthigpen@dtinetworks.com', '$2y$10$Cby307lQYN/lRwViGhRzfeoTkdAYRW/AK85iToD77M914/YxBEn7q', '2019-08-13 19:49:21');

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `project_id` int(10) UNSIGNED DEFAULT NULL,
  `invoice_id` int(10) UNSIGNED DEFAULT NULL,
  `amount` double NOT NULL,
  `gateway` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `transaction_id` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `currency_id` int(10) UNSIGNED DEFAULT NULL,
  `plan_id` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `customer_id` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `event_id` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` enum('complete','pending') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'complete',
  `paid_on` datetime DEFAULT NULL,
  `remarks` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payment_gateway_credentials`
--

CREATE TABLE `payment_gateway_credentials` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `paypal_client_id` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `paypal_secret` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `paypal_status` enum('active','deactive') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'active',
  `stripe_client_id` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `stripe_secret` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `stripe_webhook_secret` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `stripe_status` enum('active','deactive') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `payment_gateway_credentials`
--

INSERT INTO `payment_gateway_credentials` (`id`, `company_id`, `paypal_client_id`, `paypal_secret`, `paypal_status`, `stripe_client_id`, `stripe_secret`, `stripe_webhook_secret`, `stripe_status`, `created_at`, `updated_at`) VALUES
(1, NULL, NULL, NULL, 'active', NULL, NULL, NULL, 'active', '2019-05-31 22:26:05', '2019-05-31 22:26:05'),
(2, 1, 'cthigpen@composuretherapy.com', 'carrie39', 'active', NULL, NULL, NULL, 'deactive', '2019-05-31 22:26:13', '2019-06-12 17:09:06'),
(3, 2, 'cthigpen@composuretherapy.com', 'carrie39', 'active', NULL, NULL, NULL, 'deactive', '2019-06-13 00:32:44', '2019-06-13 00:36:10'),
(4, 3, NULL, NULL, 'active', NULL, NULL, NULL, 'active', '2019-07-06 20:18:36', '2019-07-06 20:18:36'),
(5, 4, NULL, NULL, 'active', NULL, NULL, NULL, 'active', '2019-07-31 19:32:05', '2019-07-31 19:32:05'),
(6, 5, NULL, NULL, 'active', NULL, NULL, NULL, 'active', '2019-07-31 19:38:54', '2019-07-31 19:38:54'),
(7, 6, NULL, NULL, 'active', NULL, NULL, NULL, 'active', '2019-07-31 19:41:25', '2019-07-31 19:41:25');

-- --------------------------------------------------------

--
-- Table structure for table `paypal_invoices`
--

CREATE TABLE `paypal_invoices` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `currency_id` int(10) UNSIGNED DEFAULT NULL,
  `package_id` int(10) UNSIGNED DEFAULT NULL,
  `sub_total` double DEFAULT NULL,
  `total` double DEFAULT NULL,
  `transaction_id` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `remarks` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `billing_frequency` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `billing_interval` int(11) DEFAULT NULL,
  `paid_on` datetime DEFAULT NULL,
  `next_pay_date` datetime DEFAULT NULL,
  `recurring` enum('yes','no') COLLATE utf8_unicode_ci DEFAULT 'no',
  `status` enum('paid','unpaid','pending') COLLATE utf8_unicode_ci DEFAULT 'pending',
  `plan_id` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `event_id` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `end_on` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `paypal_invoices`
--

INSERT INTO `paypal_invoices` (`id`, `company_id`, `currency_id`, `package_id`, `sub_total`, `total`, `transaction_id`, `remarks`, `billing_frequency`, `billing_interval`, `paid_on`, `next_pay_date`, `recurring`, `status`, `plan_id`, `event_id`, `end_on`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 5, NULL, 100, NULL, NULL, 'month', 1, NULL, NULL, 'no', 'pending', 'P-7ES41809E3230725KFVSILDA', NULL, NULL, '2019-06-06 19:24:59', '2019-06-06 19:24:59'),
(2, 1, 1, 6, NULL, 1, NULL, NULL, 'year', 1, NULL, NULL, 'no', 'pending', 'P-930514878U085923YFZTTE7A', NULL, NULL, '2019-06-07 00:07:33', '2019-06-07 00:07:33'),
(3, 1, 1, 5, NULL, 1, NULL, NULL, 'year', 1, NULL, NULL, 'no', 'pending', 'P-649640919P222222JGJFYIOA', NULL, NULL, '2019-06-07 18:15:47', '2019-06-07 18:15:47'),
(4, 1, 1, 4, NULL, 1, NULL, NULL, 'year', 1, NULL, NULL, 'no', 'pending', 'P-1P168984CU007424EGJICVJA', NULL, NULL, '2019-06-07 18:20:52', '2019-06-07 18:20:52'),
(5, 1, 1, 4, NULL, 1, NULL, NULL, 'month', 1, NULL, NULL, 'no', 'pending', 'P-75S03820UC169304UJO74KNQ', NULL, NULL, '2019-06-12 16:53:10', '2019-06-12 16:53:10'),
(6, 1, 1, 4, NULL, 1, 'I-P9EK8GU4NBWS', NULL, 'year', 1, '2019-06-12 13:10:02', '2020-06-12 00:00:00', 'no', 'paid', 'P-0XK90343282673242JPHLONI', NULL, '2019-07-12 10:00:00', '2019-06-12 17:09:30', '2019-06-12 17:27:00'),
(7, 1, 1, 5, NULL, 1, 'I-X7YJ55CWTRLW', NULL, 'year', 1, '2019-06-12 13:27:00', '2020-06-12 00:00:00', 'no', 'paid', 'P-92A585612X5915506JPOS7ZA', NULL, '2020-06-12 10:00:00', '2019-06-12 17:25:18', '2019-06-12 17:43:18'),
(8, 1, 1, 6, NULL, 2, 'I-HNYA0MT90WYH', NULL, 'year', 1, '2019-06-12 13:48:17', '2020-06-12 00:00:00', 'no', 'paid', 'P-2HT91071YU770212HJPY64VI', NULL, '2020-06-12 10:00:00', '2019-06-12 17:47:57', '2019-06-13 19:14:22'),
(9, 1, 1, 4, NULL, 1, NULL, NULL, 'month', 1, NULL, NULL, 'no', 'pending', 'P-9W8031538W146983MKFRG23A', NULL, NULL, '2019-06-13 19:08:57', '2019-06-13 19:08:57'),
(10, 1, 1, 5, NULL, 1, 'I-WFT9AGUYH684', NULL, 'month', 1, '2019-06-13 15:14:22', '2019-07-13 00:00:00', 'no', 'paid', 'P-0F4035372J657073SKFRZQ7I', NULL, NULL, '2019-06-13 19:10:12', '2019-06-13 19:14:22');

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `display_name` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `module_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `display_name`, `description`, `module_id`, `created_at`, `updated_at`) VALUES
(1, 'add_clients', 'Add Clients', NULL, 1, NULL, NULL),
(2, 'view_clients', 'View Clients', NULL, 1, NULL, NULL),
(3, 'edit_clients', 'Edit Clients', NULL, 1, NULL, NULL),
(4, 'delete_clients', 'Delete Clients', NULL, 1, NULL, NULL),
(5, 'add_employees', 'Add Employees', NULL, 2, NULL, NULL),
(6, 'view_employees', 'View Employees', NULL, 2, NULL, NULL),
(7, 'edit_employees', 'Edit Employees', NULL, 2, NULL, NULL),
(8, 'delete_employees', 'Delete Employees', NULL, 2, NULL, NULL),
(9, 'add_projects', 'Add Project', NULL, 3, NULL, NULL),
(10, 'view_projects', 'View Project', NULL, 3, NULL, NULL),
(11, 'edit_projects', 'Edit Project', NULL, 3, NULL, NULL),
(12, 'delete_projects', 'Delete Project', NULL, 3, NULL, NULL),
(13, 'add_attendance', 'Add Attendance', NULL, 4, NULL, NULL),
(14, 'view_attendance', 'View Attendance', NULL, 4, NULL, NULL),
(15, 'add_tasks', 'Add Tasks', NULL, 5, NULL, NULL),
(16, 'view_tasks', 'View Tasks', NULL, 5, NULL, NULL),
(17, 'edit_tasks', 'Edit Tasks', NULL, 5, NULL, NULL),
(18, 'delete_tasks', 'Delete Tasks', NULL, 5, NULL, NULL),
(19, 'add_estimates', 'Add Estimates', NULL, 6, NULL, NULL),
(20, 'view_estimates', 'View Estimates', NULL, 6, NULL, NULL),
(21, 'edit_estimates', 'Edit Estimates', NULL, 6, NULL, NULL),
(22, 'delete_estimates', 'Delete Estimates', NULL, 6, NULL, NULL),
(23, 'add_invoices', 'Add Invoices', NULL, 7, NULL, NULL),
(24, 'view_invoices', 'View Invoices', NULL, 7, NULL, NULL),
(25, 'edit_invoices', 'Edit Invoices', NULL, 7, NULL, NULL),
(26, 'delete_invoices', 'Delete Invoices', NULL, 7, NULL, NULL),
(27, 'add_payments', 'Add Payments', NULL, 8, NULL, NULL),
(28, 'view_payments', 'View Payments', NULL, 8, NULL, NULL),
(29, 'edit_payments', 'Edit Payments', NULL, 8, NULL, NULL),
(30, 'delete_payments', 'Delete Payments', NULL, 8, NULL, NULL),
(31, 'add_timelogs', 'Add Timelogs', NULL, 9, NULL, NULL),
(32, 'view_timelogs', 'View Timelogs', NULL, 9, NULL, NULL),
(33, 'edit_timelogs', 'Edit Timelogs', NULL, 9, NULL, NULL),
(34, 'delete_timelogs', 'Delete Timelogs', NULL, 9, NULL, NULL),
(35, 'add_tickets', 'Add Tickets', NULL, 10, NULL, NULL),
(36, 'view_tickets', 'View Tickets', NULL, 10, NULL, NULL),
(37, 'edit_tickets', 'Edit Tickets', NULL, 10, NULL, NULL),
(38, 'delete_tickets', 'Delete Tickets', NULL, 10, NULL, NULL),
(39, 'add_events', 'Add Events', NULL, 11, NULL, NULL),
(40, 'view_events', 'View Events', NULL, 11, NULL, NULL),
(41, 'edit_events', 'Edit Events', NULL, 11, NULL, NULL),
(42, 'delete_events', 'Delete Events', NULL, 11, NULL, NULL),
(43, 'add_notice', 'Add Notice', NULL, 13, NULL, '2019-05-31 22:26:12'),
(44, 'view_notice', 'View Notice', NULL, 13, NULL, '2019-05-31 22:26:12'),
(45, 'edit_notice', 'Edit Notice', NULL, 13, NULL, '2019-05-31 22:26:12'),
(46, 'delete_notice', 'Delete Notice', NULL, 13, NULL, '2019-05-31 22:26:12'),
(47, 'add_leave', 'Add Leave', NULL, 14, NULL, NULL),
(48, 'view_leave', 'View Leave', NULL, 14, NULL, NULL),
(49, 'edit_leave', 'Edit Leave', NULL, 14, NULL, NULL),
(50, 'delete_leave', 'Delete Leave', NULL, 14, NULL, NULL),
(51, 'add_lead', 'Add Lead', NULL, 15, NULL, NULL),
(52, 'view_lead', 'View Lead', NULL, 15, NULL, NULL),
(53, 'edit_lead', 'Edit Lead', NULL, 15, NULL, NULL),
(54, 'delete_lead', 'Delete Lead', NULL, 15, NULL, NULL),
(55, 'add_holiday', 'Add Holiday', NULL, 16, NULL, NULL),
(56, 'view_holiday', 'View Holiday', NULL, 16, NULL, NULL),
(57, 'edit_holiday', 'Edit Holiday', NULL, 16, NULL, NULL),
(58, 'delete_holiday', 'Delete Holiday', NULL, 16, NULL, NULL),
(59, 'add_product', 'Add Product', NULL, 17, NULL, NULL),
(60, 'view_product', 'View Product', NULL, 17, NULL, NULL),
(61, 'edit_product', 'Edit Product', NULL, 17, NULL, NULL),
(62, 'delete_product', 'Delete Product', NULL, 17, NULL, NULL),
(63, 'add_expenses', 'Add Expenses', NULL, 18, NULL, NULL),
(64, 'view_expenses', 'View Expenses', NULL, 18, NULL, NULL),
(65, 'edit_expenses', 'Edit Expenses', NULL, 18, NULL, NULL),
(66, 'delete_expenses', 'Delete Expenses', NULL, 18, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `permission_role`
--

CREATE TABLE `permission_role` (
  `permission_id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `priority`
--

CREATE TABLE `priority` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `priority`
--

INSERT INTO `priority` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'High', NULL, NULL),
(2, 'Medium', NULL, NULL),
(3, 'Low', NULL, NULL),
(4, 'Normal', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `name` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `price` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `tax_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `projects`
--

CREATE TABLE `projects` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `project_name` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `project_summary` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `project_admin` int(10) UNSIGNED DEFAULT NULL,
  `start_date` date NOT NULL,
  `deadline` date DEFAULT NULL,
  `notes` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `category_id` int(10) UNSIGNED DEFAULT NULL,
  `client_id` int(10) UNSIGNED DEFAULT NULL,
  `feedback` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `manual_timelog` enum('enable','disable') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'disable',
  `client_view_task` enum('enable','disable') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'disable',
  `allow_client_notification` enum('enable','disable') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'disable',
  `completion_percent` tinyint(4) NOT NULL,
  `calculate_task_progress` enum('true','false') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'true',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `project_phase` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `frequency` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `projects`
--

INSERT INTO `projects` (`id`, `company_id`, `project_name`, `project_summary`, `project_admin`, `start_date`, `deadline`, `notes`, `category_id`, `client_id`, `feedback`, `manual_timelog`, `client_view_task`, `allow_client_notification`, `completion_percent`, `calculate_task_progress`, `created_at`, `updated_at`, `deleted_at`, `project_phase`, `frequency`) VALUES
(1, 1, 'Duties Managers', '<p>These are the General Manager Duties</p>', 7, '2019-06-01', NULL, NULL, 1, 6, NULL, 'enable', 'enable', 'enable', 0, 'true', '2019-06-08 01:14:35', '2019-10-18 05:17:24', NULL, 'System Admini', NULL),
(2, 1, 'project Template test', '<p>dsdsadsad</p>', NULL, '2019-06-10', NULL, NULL, 3, NULL, NULL, 'disable', 'disable', 'disable', 0, 'true', '2019-06-11 05:32:24', '2019-09-04 16:17:34', NULL, 'Web dev', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `project_activity`
--

CREATE TABLE `project_activity` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `project_id` int(10) UNSIGNED NOT NULL,
  `activity` text COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `project_activity`
--

INSERT INTO `project_activity` (`id`, `company_id`, `project_id`, `activity`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'Duties Managers added as new project.', '2019-06-08 01:14:35', '2019-06-08 01:14:35'),
(2, 1, 1, 'New task added to the project.', '2019-06-08 01:16:53', '2019-06-08 01:16:53'),
(3, 1, 1, 'Timer started by Joe Thigpen', '2019-06-08 01:31:13', '2019-06-08 01:31:13'),
(4, 1, 1, 'Timer stopped by Joe Thigpen', '2019-06-08 01:32:30', '2019-06-08 01:32:30'),
(5, 1, 1, 'Timer started by Joe Thigpen', '2019-06-08 01:33:28', '2019-06-08 01:33:28'),
(6, 1, 2, 'Project Template Test added as new project.', '2019-06-11 05:32:25', '2019-06-11 05:32:25'),
(7, 1, 2, 'New file uploaded to the project.', '2019-06-26 21:02:15', '2019-06-26 21:02:15'),
(8, 1, 1, 'New task added to the project.', '2019-07-30 23:39:19', '2019-07-30 23:39:19'),
(9, 1, 1, 'New task added to the project.', '2019-08-04 18:52:32', '2019-08-04 18:52:32'),
(10, 1, 1, 'New task added to the project.', '2019-08-04 18:54:13', '2019-08-04 18:54:13'),
(11, 1, 1, 'New task added to the project.', '2019-08-04 18:56:30', '2019-08-04 18:56:30'),
(12, 1, 1, 'New task added to the project.', '2019-08-04 18:56:59', '2019-08-04 18:56:59'),
(13, 1, 2, 'New task added to the project.', '2019-09-04 16:17:34', '2019-09-04 16:17:34'),
(14, 1, 1, 'New task added to the project.', '2019-09-06 12:01:20', '2019-09-06 12:01:20'),
(15, 1, 1, 'New task added to the project.', '2019-09-06 12:21:40', '2019-09-06 12:21:40'),
(16, 1, 2, 'New task added to the project.', '2019-09-06 14:26:04', '2019-09-06 14:26:04'),
(17, 1, 2, 'New task added to the project.', '2019-09-06 18:53:54', '2019-09-06 18:53:54'),
(18, 1, 2, 'New task added to the project.', '2019-09-07 17:05:06', '2019-09-07 17:05:06'),
(19, 1, 2, 'New task added to the project.', '2019-09-11 05:52:04', '2019-09-11 05:52:04'),
(20, 1, 1, 'New task added to the project.', '2019-10-11 21:17:09', '2019-10-11 21:17:09'),
(21, 1, 1, 'New task added to the project.', '2019-10-11 21:17:10', '2019-10-11 21:17:10'),
(22, 1, 1, 'New task added to the project.', '2019-10-11 21:17:10', '2019-10-11 21:17:10'),
(23, 1, 1, 'New task added to the project.', '2019-10-11 21:17:10', '2019-10-11 21:17:10'),
(24, 1, 1, 'New task added to the project.', '2019-10-13 05:07:38', '2019-10-13 05:07:38'),
(25, 1, 1, 'New task added to the project.', '2019-10-14 23:45:02', '2019-10-14 23:45:02');

-- --------------------------------------------------------

--
-- Table structure for table `project_category`
--

CREATE TABLE `project_category` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `category_name` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `project_category`
--

INSERT INTO `project_category` (`id`, `company_id`, `category_name`, `created_at`, `updated_at`) VALUES
(1, 1, 'Laravel', '2019-05-31 22:26:13', '2019-05-31 22:26:13'),
(2, 1, 'Java', '2019-05-31 22:26:13', '2019-05-31 22:26:13'),
(3, 1, 'Duties', '2019-06-08 01:13:48', '2019-06-08 01:13:48');

-- --------------------------------------------------------

--
-- Table structure for table `project_files`
--

CREATE TABLE `project_files` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `project_id` int(10) UNSIGNED NOT NULL,
  `filename` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `hashname` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `size` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `google_url` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dropbox_link` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `project_files`
--

INSERT INTO `project_files` (`id`, `company_id`, `user_id`, `project_id`, `filename`, `hashname`, `size`, `description`, `google_url`, `dropbox_link`, `created_at`, `updated_at`) VALUES
(1, 1, 7, 2, 'GNC Law Telecom Proposal - DTI.pdf', '5GdhB7KiZ6ETb6TxB9dxiKG6WT4xtAZzJGzF6c4b.pdf', '103025', NULL, NULL, NULL, '2019-06-26 21:02:15', '2019-06-26 21:02:15');

-- --------------------------------------------------------

--
-- Table structure for table `project_members`
--

CREATE TABLE `project_members` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `project_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `project_members`
--

INSERT INTO `project_members` (`id`, `company_id`, `user_id`, `project_id`, `created_at`, `updated_at`) VALUES
(1, 1, 7, 1, '2019-06-08 01:14:50', '2019-06-08 01:14:50'),
(2, 1, 8, 1, '2019-06-08 01:14:50', '2019-06-08 01:14:50'),
(3, 1, 9, 1, '2019-06-08 01:14:50', '2019-06-08 01:14:50'),
(4, 1, 10, 1, '2019-06-08 01:14:50', '2019-06-08 01:14:50'),
(5, 1, 12, 1, '2019-06-08 01:14:50', '2019-06-08 01:14:50'),
(6, 1, 7, 2, '2019-06-11 05:32:24', '2019-06-11 05:32:24'),
(7, 1, 8, 2, '2019-06-11 05:32:24', '2019-06-11 05:32:24'),
(8, 1, 9, 2, '2019-06-11 05:32:24', '2019-06-11 05:32:24'),
(9, 1, 10, 2, '2019-06-11 05:32:24', '2019-06-11 05:32:24'),
(10, 1, 12, 2, '2019-06-11 05:32:25', '2019-06-11 05:32:25');

-- --------------------------------------------------------

--
-- Table structure for table `project_templates`
--

CREATE TABLE `project_templates` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `project_name` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `category_id` int(10) UNSIGNED DEFAULT NULL,
  `client_id` int(10) UNSIGNED DEFAULT NULL,
  `project_summary` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `notes` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `feedback` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `client_view_task` enum('enable','disable') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'disable',
  `allow_client_notification` enum('enable','disable') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'disable',
  `manual_timelog` enum('enable','disable') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'disable',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `project_templates`
--

INSERT INTO `project_templates` (`id`, `company_id`, `project_name`, `category_id`, `client_id`, `project_summary`, `notes`, `feedback`, `client_view_task`, `allow_client_notification`, `manual_timelog`, `created_at`, `updated_at`) VALUES
(1, 1, 'project Template test', 3, NULL, '<p>dsdsadsad</p>', NULL, NULL, 'disable', 'disable', 'disable', '2019-06-11 05:28:57', '2019-06-11 05:28:57');

-- --------------------------------------------------------

--
-- Table structure for table `project_template_members`
--

CREATE TABLE `project_template_members` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `project_template_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `project_template_members`
--

INSERT INTO `project_template_members` (`id`, `user_id`, `project_template_id`, `created_at`, `updated_at`) VALUES
(1, 7, 1, '2019-06-11 05:30:47', '2019-06-11 05:30:47'),
(2, 8, 1, '2019-06-11 05:30:47', '2019-06-11 05:30:47'),
(3, 9, 1, '2019-06-11 05:30:47', '2019-06-11 05:30:47'),
(4, 10, 1, '2019-06-11 05:30:47', '2019-06-11 05:30:47'),
(5, 12, 1, '2019-06-11 05:30:47', '2019-06-11 05:30:47');

-- --------------------------------------------------------

--
-- Table structure for table `project_template_tasks`
--

CREATE TABLE `project_template_tasks` (
  `id` int(10) UNSIGNED NOT NULL,
  `heading` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `description` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `project_template_id` int(10) UNSIGNED NOT NULL,
  `priority` enum('low','medium','high') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'medium',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `project_template_tasks`
--

INSERT INTO `project_template_tasks` (`id`, `heading`, `description`, `user_id`, `project_template_id`, `priority`, `created_at`, `updated_at`) VALUES
(1, 'add template task 1', NULL, 7, 1, 'medium', '2019-06-11 05:31:10', '2019-06-11 05:31:10'),
(2, 'add template task 2', NULL, 7, 1, 'medium', '2019-06-11 05:31:23', '2019-06-11 05:31:23');

-- --------------------------------------------------------

--
-- Table structure for table `project_time_logs`
--

CREATE TABLE `project_time_logs` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `project_id` int(10) UNSIGNED DEFAULT NULL,
  `task_id` int(10) UNSIGNED DEFAULT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `start_time` datetime NOT NULL,
  `end_time` datetime DEFAULT NULL,
  `memo` text COLLATE utf8_unicode_ci NOT NULL,
  `total_hours` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `total_minutes` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `edited_by_user` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `project_time_logs`
--

INSERT INTO `project_time_logs` (`id`, `company_id`, `project_id`, `task_id`, `user_id`, `start_time`, `end_time`, `memo`, `total_hours`, `total_minutes`, `edited_by_user`, `created_at`, `updated_at`) VALUES
(1, 1, 1, NULL, 7, '2019-06-07 21:31:13', '2019-06-07 21:32:30', 'worked on task 1', '0', '1', 7, '2019-06-08 01:31:13', '2019-06-08 01:32:30'),
(2, 1, 1, NULL, 7, '2019-06-07 21:33:28', '2019-06-07 21:33:54', 'second log', '0', NULL, 7, '2019-06-08 01:33:28', '2019-06-08 01:33:54');

-- --------------------------------------------------------

--
-- Table structure for table `proposals`
--

CREATE TABLE `proposals` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `lead_id` int(10) UNSIGNED NOT NULL,
  `valid_till` date NOT NULL,
  `sub_total` double(8,2) NOT NULL,
  `total` double(8,2) NOT NULL,
  `currency_id` int(10) UNSIGNED DEFAULT NULL,
  `status` enum('declined','accepted','waiting') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'waiting',
  `note` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `discount` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `discount_type` varchar(191) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `proposal_items`
--

CREATE TABLE `proposal_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `tax_id` int(10) UNSIGNED DEFAULT NULL,
  `proposal_id` int(10) UNSIGNED NOT NULL,
  `item_name` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `type` enum('item','discount','tax') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'item',
  `quantity` double(8,2) NOT NULL,
  `unit_price` double(8,2) NOT NULL,
  `amount` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `push_notification_settings`
--

CREATE TABLE `push_notification_settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `onesignal_app_id` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `onesignal_rest_api_key` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `notification_logo` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` enum('active','inactive') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `push_notification_settings`
--

INSERT INTO `push_notification_settings` (`id`, `onesignal_app_id`, `onesignal_rest_api_key`, `notification_logo`, `status`, `created_at`, `updated_at`) VALUES
(1, NULL, NULL, NULL, 'inactive', '2019-05-31 22:26:11', '2019-05-31 22:26:11');

-- --------------------------------------------------------

--
-- Table structure for table `push_subscriptions`
--

CREATE TABLE `push_subscriptions` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `endpoint` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `public_key` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `auth_token` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `quotations`
--

CREATE TABLE `quotations` (
  `id` int(10) UNSIGNED NOT NULL,
  `business_name` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `client_name` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `client_email` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `sub_total` double(8,2) NOT NULL,
  `total` double(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `quotation_items`
--

CREATE TABLE `quotation_items` (
  `id` int(10) UNSIGNED NOT NULL,
  `quotation_id` int(10) UNSIGNED NOT NULL,
  `item_name` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `quantity` int(11) NOT NULL,
  `unit_price` int(11) NOT NULL,
  `amount` double(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `recurrence_patterns`
--

CREATE TABLE `recurrence_patterns` (
  `id` int(10) UNSIGNED NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `recurring_type` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `separation_count` int(11) NOT NULL,
  `max_num_recurrence` int(11) DEFAULT NULL,
  `day_of_week` int(11) DEFAULT NULL,
  `week_of_month` int(11) DEFAULT NULL,
  `day_of_month` int(11) DEFAULT NULL,
  `month_of_year` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `last_ocurrence` date DEFAULT NULL,
  `total_ocurrence` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `name` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `display_name` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `company_id`, `name`, `display_name`, `description`, `created_at`, `updated_at`) VALUES
(1, 1, 'admin', 'App Administrator', 'Admin is allowed to manage everything of the app.', '2019-05-31 22:26:13', '2019-05-31 22:26:13'),
(2, 1, 'employee', 'Employee', 'Employee can see tasks and projects assigned to him.', '2019-05-31 22:26:13', '2019-05-31 22:26:13'),
(3, 1, 'client', 'Client', 'Client can see own tasks and projects.', '2019-05-31 22:26:13', '2019-05-31 22:26:13'),
(4, 2, 'admin', 'App Administrator', 'Admin is allowed to manage everything of the app.', '2019-06-13 00:32:44', '2019-06-13 00:32:44'),
(5, 2, 'employee', 'Employee', 'Employee can see tasks and projects assigned to him.', '2019-06-13 00:32:44', '2019-06-13 00:32:44'),
(6, 2, 'client', 'Client', 'Client can see own tasks and projects.', '2019-06-13 00:32:44', '2019-06-13 00:32:44'),
(7, 3, 'admin', 'App Administrator', 'Admin is allowed to manage everything of the app.', '2019-07-06 20:18:36', '2019-07-06 20:18:36'),
(8, 3, 'employee', 'Employee', 'Employee can see tasks and projects assigned to him.', '2019-07-06 20:18:36', '2019-07-06 20:18:36'),
(9, 3, 'client', 'Client', 'Client can see own tasks and projects.', '2019-07-06 20:18:36', '2019-07-06 20:18:36'),
(10, 4, 'admin', 'App Administrator', 'Admin is allowed to manage everything of the app.', '2019-07-31 19:32:05', '2019-07-31 19:32:05'),
(11, 4, 'employee', 'Employee', 'Employee can see tasks and projects assigned to him.', '2019-07-31 19:32:05', '2019-07-31 19:32:05'),
(12, 4, 'client', 'Client', 'Client can see own tasks and projects.', '2019-07-31 19:32:05', '2019-07-31 19:32:05'),
(13, 5, 'admin', 'App Administrator', 'Admin is allowed to manage everything of the app.', '2019-07-31 19:38:54', '2019-07-31 19:38:54'),
(14, 5, 'employee', 'Employee', 'Employee can see tasks and projects assigned to him.', '2019-07-31 19:38:54', '2019-07-31 19:38:54'),
(15, 5, 'client', 'Client', 'Client can see own tasks and projects.', '2019-07-31 19:38:54', '2019-07-31 19:38:54'),
(16, 6, 'admin', 'App Administrator', 'Admin is allowed to manage everything of the app.', '2019-07-31 19:41:25', '2019-07-31 19:41:25'),
(17, 6, 'employee', 'Employee', 'Employee can see tasks and projects assigned to him.', '2019-07-31 19:41:25', '2019-07-31 19:41:25'),
(18, 6, 'client', 'Client', 'Client can see own tasks and projects.', '2019-07-31 19:41:25', '2019-07-31 19:41:25');

-- --------------------------------------------------------

--
-- Table structure for table `role_user`
--

CREATE TABLE `role_user` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `role_user`
--

INSERT INTO `role_user` (`user_id`, `role_id`) VALUES
(1, 1),
(1, 2),
(4, 3),
(5, 3),
(6, 3),
(7, 1),
(7, 2),
(8, 2),
(9, 2),
(10, 2),
(11, 2),
(12, 2),
(13, 2),
(14, 2),
(15, 2),
(16, 4),
(16, 5),
(18, 10),
(18, 11),
(20, 16),
(20, 17),
(21, 3),
(22, 2);

-- --------------------------------------------------------

--
-- Table structure for table `skills`
--

CREATE TABLE `skills` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `slack_settings`
--

CREATE TABLE `slack_settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `slack_webhook` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `slack_logo` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `slack_settings`
--

INSERT INTO `slack_settings` (`id`, `company_id`, `slack_webhook`, `slack_logo`, `created_at`, `updated_at`) VALUES
(1, NULL, NULL, NULL, '2019-05-31 22:26:05', '2019-05-31 22:26:05'),
(2, 1, NULL, NULL, '2019-05-31 22:26:13', '2019-05-31 22:26:13'),
(3, 2, NULL, NULL, '2019-06-13 00:32:44', '2019-06-13 00:32:44'),
(4, 3, NULL, NULL, '2019-07-06 20:18:36', '2019-07-06 20:18:36'),
(5, 4, NULL, NULL, '2019-07-31 19:32:05', '2019-07-31 19:32:05'),
(6, 5, NULL, NULL, '2019-07-31 19:38:54', '2019-07-31 19:38:54'),
(7, 6, NULL, NULL, '2019-07-31 19:41:25', '2019-07-31 19:41:25');

-- --------------------------------------------------------

--
-- Table structure for table `smtp_settings`
--

CREATE TABLE `smtp_settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `mail_driver` varchar(191) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'smtp',
  `mail_host` varchar(191) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'smtp.gmail.com',
  `mail_port` varchar(191) COLLATE utf8_unicode_ci NOT NULL DEFAULT '587',
  `mail_username` varchar(191) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'youremail@gmail.com',
  `mail_password` varchar(191) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'your password',
  `mail_from_name` varchar(191) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'your name',
  `mail_from_email` varchar(191) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'from@email.com',
  `mail_encryption` enum('tls','ssl') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'tls',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `smtp_settings`
--

INSERT INTO `smtp_settings` (`id`, `mail_driver`, `mail_host`, `mail_port`, `mail_username`, `mail_password`, `mail_from_name`, `mail_from_email`, `mail_encryption`, `created_at`, `updated_at`) VALUES
(1, 'mail', 'mail.workatask.com', '465', 'noreply@workatask.com', 'hqW;gtqda[8T', 'Task System', 'noreply@workatask.com', 'tls', '2019-05-31 22:26:11', '2019-06-05 17:29:38');

-- --------------------------------------------------------

--
-- Table structure for table `sticky_notes`
--

CREATE TABLE `sticky_notes` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `note_text` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `colour` enum('blue','yellow','red','gray','purple','green') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'blue',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `stripe_invoices`
--

CREATE TABLE `stripe_invoices` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED NOT NULL,
  `invoice_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `package_id` int(10) UNSIGNED NOT NULL,
  `transaction_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `amount` decimal(12,2) UNSIGNED NOT NULL,
  `pay_date` date NOT NULL,
  `next_pay_date` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `stripe_invoices`
--

INSERT INTO `stripe_invoices` (`id`, `company_id`, `invoice_id`, `package_id`, `transaction_id`, `amount`, `pay_date`, `next_pay_date`, `created_at`, `updated_at`) VALUES
(1, 1, NULL, 6, NULL, '1.00', '2019-05-31', '2019-07-01', '2019-05-31 22:37:57', '2019-05-31 22:37:57'),
(2, 6, NULL, 4, NULL, '1.00', '2019-07-31', '2019-08-31', '2019-07-31 19:43:12', '2019-07-31 19:43:12');

-- --------------------------------------------------------

--
-- Table structure for table `stripe_setting`
--

CREATE TABLE `stripe_setting` (
  `id` int(10) UNSIGNED NOT NULL,
  `api_key` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `api_secret` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `webhook_key` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `paypal_client_id` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `paypal_secret` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `paypal_status` enum('active','inactive') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'inactive',
  `stripe_status` enum('active','inactive') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `stripe_setting`
--

INSERT INTO `stripe_setting` (`id`, `api_key`, `api_secret`, `webhook_key`, `paypal_client_id`, `paypal_secret`, `paypal_status`, `stripe_status`, `created_at`, `updated_at`) VALUES
(1, NULL, NULL, NULL, NULL, NULL, 'inactive', 'inactive', '2019-05-31 22:26:12', '2019-08-13 20:08:39');

-- --------------------------------------------------------

--
-- Table structure for table `subscriptions`
--

CREATE TABLE `subscriptions` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `stripe_id` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `stripe_plan` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `quantity` int(11) NOT NULL,
  `trial_ends_at` timestamp NULL DEFAULT NULL,
  `ends_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sub_tasks`
--

CREATE TABLE `sub_tasks` (
  `id` int(10) UNSIGNED NOT NULL,
  `task_id` int(10) UNSIGNED NOT NULL,
  `title` text COLLATE utf8_unicode_ci NOT NULL,
  `due_date` date DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `status` enum('incomplete','complete') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'incomplete',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `tag` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `act_hour` int(11) DEFAULT NULL,
  `est_hour` int(11) DEFAULT NULL,
  `priority` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_id` text COLLATE utf8_unicode_ci NOT NULL,
  `team_id` text COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'null:noTeam,value:teamId',
  `completed_on` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sub_tasks`
--

INSERT INTO `sub_tasks` (`id`, `task_id`, `title`, `due_date`, `start_date`, `end_date`, `status`, `created_at`, `updated_at`, `tag`, `act_hour`, `est_hour`, `priority`, `description`, `user_id`, `team_id`, `completed_on`) VALUES
(2, 185, 'new sub', '2019-10-15', '2019-09-30', NULL, 'incomplete', '2019-09-30 00:04:06', '2019-09-30 18:23:47', NULL, NULL, NULL, NULL, NULL, '[\"7\"]', NULL, NULL),
(3, 185, 'new sub', '2019-10-15', '2019-09-30', NULL, 'incomplete', '2019-09-30 00:04:33', '2019-09-30 18:23:47', NULL, NULL, NULL, NULL, NULL, '[\"7\"]', NULL, NULL),
(4, 185, 'new', '2019-10-15', '2019-09-30', NULL, 'incomplete', '2019-09-30 00:08:15', '2019-09-30 02:40:20', NULL, NULL, NULL, NULL, NULL, '[\"10\"]', NULL, NULL),
(5, 185, 'mty', '2019-10-15', '2019-09-30', NULL, 'incomplete', '2019-09-30 17:55:06', '2019-09-30 18:23:47', NULL, NULL, NULL, NULL, NULL, '[\"9\"]', NULL, NULL),
(6, 174, 'test', '2019-10-15', '2019-09-30', '2019-10-18', 'complete', '2019-10-02 02:59:17', '2019-10-18 13:07:44', NULL, NULL, NULL, NULL, NULL, '[\"7\"]', NULL, '2019-10-18'),
(7, 175, 'test', NULL, '2019-09-30', NULL, 'incomplete', '2019-10-02 06:09:40', '2019-10-05 05:52:55', NULL, NULL, NULL, NULL, NULL, '[\"7\"]', NULL, NULL),
(8, 175, 'test 2', '2019-10-16', '2019-10-01', NULL, 'incomplete', '2019-10-02 06:10:04', '2019-10-05 05:52:55', NULL, NULL, NULL, NULL, NULL, '[\"7\"]', NULL, NULL),
(9, 190, 'sub under demo1', '2019-10-21', '2019-10-06', NULL, 'incomplete', '2019-10-07 22:22:29', '2019-10-07 22:22:29', NULL, NULL, NULL, NULL, NULL, '[\"7\"]', NULL, NULL),
(10, 190, 'sub under demo1', '2019-10-21', '2019-10-06', NULL, 'incomplete', '2019-10-07 22:22:31', '2019-10-07 22:22:31', NULL, NULL, NULL, NULL, NULL, '[\"7\"]', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `taskboard_columns`
--

CREATE TABLE `taskboard_columns` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `column_name` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `label_color` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `priority` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `taskboard_columns`
--

INSERT INTO `taskboard_columns` (`id`, `company_id`, `column_name`, `slug`, `label_color`, `priority`, `created_at`, `updated_at`) VALUES
(3, 1, 'Incomplete', 'incomplete', '#d21010', 1, '2019-05-31 22:26:13', '2019-05-31 22:26:13'),
(4, 1, 'Completed', 'completed', '#679c0d', 3, '2019-05-31 22:26:13', '2019-06-05 23:57:55'),
(5, 1, 'Working', 'middle', '#ff0000', 2, '2019-06-05 17:22:05', '2019-06-05 23:57:55'),
(6, 2, 'Incomplete', 'incomplete', '#d21010', 1, '2019-06-13 00:32:44', '2019-06-13 00:32:44'),
(7, 2, 'Completed', 'completed', '#679c0d', 2, '2019-06-13 00:32:44', '2019-06-13 00:32:44'),
(8, 3, 'Incomplete', 'incomplete', '#d21010', 1, '2019-07-06 20:18:36', '2019-07-06 20:18:36'),
(9, 3, 'Completed', 'completed', '#679c0d', 2, '2019-07-06 20:18:36', '2019-07-06 20:18:36'),
(10, 4, 'Incomplete', 'incomplete', '#d21010', 1, '2019-07-31 19:32:04', '2019-07-31 19:32:04'),
(11, 4, 'Completed', 'completed', '#679c0d', 2, '2019-07-31 19:32:04', '2019-07-31 19:32:04'),
(12, 5, 'Incomplete', 'incomplete', '#d21010', 1, '2019-07-31 19:38:54', '2019-07-31 19:38:54'),
(13, 5, 'Completed', 'completed', '#679c0d', 2, '2019-07-31 19:38:54', '2019-07-31 19:38:54'),
(14, 6, 'Incomplete', 'incomplete', '#d21010', 1, '2019-07-31 19:41:25', '2019-07-31 19:41:25'),
(15, 6, 'Completed', 'completed', '#679c0d', 2, '2019-07-31 19:41:25', '2019-07-31 19:41:25');

-- --------------------------------------------------------

--
-- Table structure for table `tasks`
--

CREATE TABLE `tasks` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `heading` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `description` mediumtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `due_date` date DEFAULT NULL,
  `user_id` text COLLATE utf8_unicode_ci NOT NULL,
  `project_id` int(10) UNSIGNED DEFAULT NULL,
  `task_category_id` int(10) UNSIGNED DEFAULT NULL,
  `priority` enum('low','medium','high') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'medium',
  `status` enum('incomplete','completed') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'incomplete',
  `completed_on` datetime DEFAULT NULL,
  `created_by` int(10) UNSIGNED DEFAULT NULL,
  `team_id` text COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'null:noTeam,value:teamId',
  `tag` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `section_tiles` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `est_hour` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `act_hour` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `board_column_id` int(10) UNSIGNED DEFAULT 1,
  `column_priority` int(11) NOT NULL,
  `is_recurrence` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `own` int(11) DEFAULT NULL,
  `is_future_task` varchar(191) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tasks`
--

INSERT INTO `tasks` (`id`, `company_id`, `heading`, `description`, `due_date`, `user_id`, `project_id`, `task_category_id`, `priority`, `status`, `completed_on`, `created_by`, `team_id`, `tag`, `section_tiles`, `est_hour`, `act_hour`, `created_at`, `updated_at`, `start_date`, `board_column_id`, `column_priority`, `is_recurrence`, `own`, `is_future_task`) VALUES
(173, 1, 'demo 1', NULL, '2019-10-13', '[\"9\",\"11\",7]', 2, 1, 'medium', 'incomplete', NULL, 7, NULL, NULL, NULL, NULL, NULL, '2019-09-28 01:02:10', '2019-10-10 06:04:08', '2019-09-28', 3, 0, NULL, 9, ''),
(174, 1, 'demo 1', NULL, '2019-10-03', '[\"10\",7]', 2, 1, 'medium', 'incomplete', NULL, 7, NULL, NULL, NULL, NULL, NULL, '2019-09-28 01:04:04', '2019-10-18 12:52:15', '2019-09-28', 3, 0, NULL, 1, 'no'),
(175, 1, 'A demo 1', NULL, '2019-10-05', '[\"9\",\"12\",7]', 2, 1, 'medium', 'incomplete', NULL, 7, '[\"3\"]', NULL, NULL, NULL, NULL, '2019-09-28 01:06:23', '2019-09-29 19:57:02', '2019-09-29', 3, 0, NULL, 9, 'no'),
(183, 1, 'A Copy Of A demo 1', NULL, NULL, '[\"9\",\"11\",7]', 2, 1, 'medium', 'incomplete', NULL, 7, NULL, NULL, NULL, NULL, NULL, '2019-09-28 15:28:53', '2019-09-30 02:40:02', '2019-09-28', 3, 0, NULL, NULL, 'no'),
(184, 1, 'A Copy Of A demo 1', NULL, '2019-10-02', '[\"9\",\"11\",7]', 2, 1, 'medium', 'incomplete', NULL, 7, NULL, NULL, NULL, NULL, NULL, '2019-09-28 15:31:27', '2019-09-28 15:31:27', '2019-09-28', 3, 0, NULL, NULL, 'no'),
(185, 1, 'A Copy Of demo 1', NULL, NULL, '[\"9\",\"11\",7]', 2, 1, 'medium', 'incomplete', NULL, 7, NULL, NULL, NULL, NULL, NULL, '2019-09-28 15:45:41', '2019-09-30 02:40:54', '2019-09-28', 3, 0, NULL, NULL, 'no'),
(186, 1, 'A Copy Of demo 1', NULL, NULL, '[\"9\",\"11\",7]', 2, 1, 'medium', 'incomplete', NULL, 7, NULL, NULL, NULL, NULL, NULL, '2019-09-29 19:58:50', '2019-09-29 19:58:50', '2019-09-28', 3, 0, NULL, NULL, 'no'),
(187, 1, 'A Copy matul', NULL, NULL, '[\"9\",\"11\"]', 2, 1, 'medium', 'incomplete', NULL, 7, NULL, NULL, NULL, NULL, NULL, '2019-09-30 03:06:34', '2019-09-30 03:06:34', '2019-09-28', 3, 0, NULL, NULL, 'no'),
(188, 1, 'A Copy Of demo 1', NULL, NULL, '[\"9\",\"11\",7]', 2, 1, 'medium', 'incomplete', NULL, 7, NULL, NULL, NULL, NULL, NULL, '2019-10-02 04:41:03', '2019-10-02 04:41:03', '2019-09-28', 3, 0, NULL, NULL, 'no'),
(189, 1, 'A Copy Of dem 12', NULL, NULL, '[\"10\",7]', 2, 1, 'medium', 'incomplete', NULL, 7, NULL, NULL, NULL, NULL, NULL, '2019-10-02 04:41:23', '2019-10-02 04:41:23', '2019-09-28', 3, 0, NULL, NULL, 'no'),
(190, 1, 'demo 1', NULL, NULL, '[\"9\",\"11\",7]', 2, 1, 'medium', 'incomplete', NULL, 7, NULL, NULL, NULL, NULL, NULL, '2019-10-02 06:07:23', '2019-10-02 06:07:23', '2019-09-28', 3, 0, NULL, NULL, 'no'),
(193, 1, 'test 2 parent', NULL, '2019-10-02', '[\"7\"]', NULL, 1, 'medium', 'incomplete', NULL, 7, NULL, NULL, NULL, NULL, NULL, '2019-10-02 06:12:24', '2019-10-02 06:12:24', '2019-10-02', 3, 0, NULL, 1, 'no'),
(194, 1, 'test 2 parent', NULL, '2019-10-02', '[\"7\"]', NULL, 1, 'medium', 'incomplete', NULL, 7, NULL, NULL, NULL, NULL, NULL, '2019-10-02 06:12:31', '2019-10-02 06:12:31', '2019-10-02', 3, 0, NULL, 1, 'no'),
(195, 1, 'A Copy Of demo 1', NULL, NULL, '[\"9\",\"11\",7]', 2, 1, 'medium', 'incomplete', NULL, 7, NULL, NULL, NULL, NULL, NULL, '2019-10-07 22:27:17', '2019-10-07 22:27:17', '2019-09-28', 3, 0, NULL, NULL, 'no'),
(196, 1, 'test', NULL, '2019-10-10', '[\"7\"]', NULL, 1, 'medium', 'incomplete', NULL, 7, NULL, NULL, NULL, NULL, NULL, '2019-10-10 05:44:19', '2019-10-10 05:44:19', '2019-10-10', 3, 0, NULL, 1, 'no'),
(197, 1, 'task created from wizard', 'this is a test', '2019-10-18', '[\"7\"]', NULL, 1, 'medium', 'incomplete', NULL, 7, NULL, NULL, NULL, NULL, NULL, '2019-10-11 21:13:19', '2019-10-11 21:13:19', '2019-10-11', 3, 0, NULL, 1, 'no'),
(198, 1, 'task ceratedy from group', NULL, '2019-10-25', '[\"7\"]', 1, NULL, 'high', 'completed', '2019-10-18 00:00:00', 7, NULL, 'llood', 'pko', '8', '10', '2019-10-11 21:17:09', '2019-10-18 15:03:13', '2019-10-11', 4, 0, NULL, NULL, 'no'),
(200, 1, 'task cerated from group', NULL, '2019-10-11', '[\"7\"]', 1, NULL, 'medium', 'incomplete', NULL, 7, NULL, NULL, NULL, NULL, NULL, '2019-10-11 21:17:10', '2019-10-11 21:17:10', '2019-10-11', 3, 0, NULL, NULL, 'no'),
(201, 1, 'task cerated from group', NULL, '2019-10-11', '[\"7\"]', 1, NULL, 'medium', 'incomplete', NULL, 7, NULL, NULL, NULL, NULL, NULL, '2019-10-11 21:17:10', '2019-10-11 21:17:10', '2019-10-11', 3, 0, NULL, NULL, 'no'),
(202, 1, 'Test 2 from wizard', NULL, '2019-10-25', '[\"8\"]', NULL, 1, 'medium', 'incomplete', NULL, 7, NULL, NULL, NULL, NULL, NULL, '2019-10-11 21:19:45', '2019-10-11 21:19:45', '2019-10-11', 3, 0, NULL, 1, 'no'),
(204, 1, 'Task entered by wizard', NULL, '2019-10-31', '[\"7\"]', NULL, 1, 'medium', 'incomplete', NULL, 7, NULL, NULL, NULL, NULL, NULL, '2019-10-14 23:30:41', '2019-10-14 23:30:41', '2019-10-14', 3, 0, NULL, 1, 'no'),
(205, 1, 'Recuring from wizard', NULL, '2019-10-23', '[\"7\"]', NULL, 1, 'medium', 'incomplete', NULL, 7, NULL, NULL, NULL, NULL, NULL, '2019-10-14 23:31:57', '2019-10-14 23:31:57', '2019-10-14', 3, 0, NULL, 1, 'no'),
(206, 1, 'test from wizard 34', NULL, '2019-10-23', '[\"7\"]', NULL, 1, 'medium', 'incomplete', NULL, 7, NULL, NULL, NULL, NULL, NULL, '2019-10-14 23:41:46', '2019-10-14 23:41:46', '2019-10-14', 3, 0, NULL, 1, 'no'),
(207, 1, 'test from wizard w recurr', NULL, '2019-10-24', '[\"7\"]', NULL, 1, 'medium', 'incomplete', NULL, 7, NULL, NULL, NULL, NULL, NULL, '2019-10-14 23:43:00', '2019-10-14 23:43:00', '2019-10-14', 3, 0, NULL, 1, 'no'),
(208, 1, 'test from quicl 34', NULL, '2019-10-14', '[\"7\"]', 1, NULL, 'medium', 'incomplete', NULL, 7, NULL, NULL, NULL, NULL, NULL, '2019-10-14 23:45:02', '2019-10-14 23:45:02', '2019-10-14', 3, 0, NULL, NULL, 'no'),
(209, 1, 'aa', NULL, '2019-10-18', '[\"8\"]', NULL, 1, 'medium', 'incomplete', NULL, 7, NULL, NULL, NULL, NULL, NULL, '2019-10-18 13:46:31', '2019-10-18 13:46:31', '2019-10-18', 3, 0, NULL, 1, 'no');

-- --------------------------------------------------------

--
-- Table structure for table `task_category`
--

CREATE TABLE `task_category` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `category_name` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `task_category`
--

INSERT INTO `task_category` (`id`, `company_id`, `category_name`, `created_at`, `updated_at`) VALUES
(1, 1, 'Duties', '2019-06-08 01:16:00', '2019-06-08 01:16:00');

-- --------------------------------------------------------

--
-- Table structure for table `task_comments`
--

CREATE TABLE `task_comments` (
  `id` int(10) UNSIGNED NOT NULL,
  `comment` text COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `task_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `task_recurrence_patterns`
--

CREATE TABLE `task_recurrence_patterns` (
  `id` int(10) UNSIGNED NOT NULL,
  `parent_id` int(11) NOT NULL,
  `task_id` int(11) NOT NULL,
  `pattern_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `task_recurrence_patterns`
--

INSERT INTO `task_recurrence_patterns` (`id`, `parent_id`, `task_id`, `pattern_id`, `created_at`, `updated_at`) VALUES
(169, 8117413, 178, 13, '2019-09-28 09:40:01', '2019-09-28 09:40:01'),
(170, 1217314, 179, 14, '2019-09-28 09:40:01', '2019-09-28 09:40:01');

-- --------------------------------------------------------

--
-- Table structure for table `taxes`
--

CREATE TABLE `taxes` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `tax_name` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `rate_percent` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `teams`
--

CREATE TABLE `teams` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `team_name` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `teams`
--

INSERT INTO `teams` (`id`, `company_id`, `team_name`, `created_at`, `updated_at`) VALUES
(1, 1, 'EW', '2019-06-08 01:10:22', '2019-06-08 01:10:22'),
(2, 1, 'DTI', '2019-06-08 01:10:32', '2019-06-08 01:10:32'),
(3, 1, 'HC', '2019-06-08 01:10:43', '2019-06-08 01:10:43'),
(4, 1, 'Cloud', '2019-06-08 01:10:54', '2019-06-08 01:10:54'),
(5, 1, 'Managers', '2019-06-08 01:11:04', '2019-06-08 01:11:04'),
(6, 1, 'Sales', '2019-06-08 01:11:44', '2019-06-08 01:11:44'),
(7, 1, 'All Users', '2019-06-26 20:32:54', '2019-06-26 20:32:54');

-- --------------------------------------------------------

--
-- Table structure for table `tests`
--

CREATE TABLE `tests` (
  `id` int(10) UNSIGNED NOT NULL,
  `now` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `some_data` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tests`
--

INSERT INTO `tests` (`id`, `now`, `user_id`, `some_data`, `created_at`, `updated_at`) VALUES
(1, 783, 34, NULL, '2019-09-22 14:41:41', '2019-09-22 14:41:41');

-- --------------------------------------------------------

--
-- Table structure for table `theme_settings`
--

CREATE TABLE `theme_settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `panel` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `header_color` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `sidebar_color` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `sidebar_text_color` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `link_color` varchar(191) COLLATE utf8_unicode_ci NOT NULL DEFAULT '#ffffff',
  `user_css` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `theme_settings`
--

INSERT INTO `theme_settings` (`id`, `company_id`, `panel`, `header_color`, `sidebar_color`, `sidebar_text_color`, `link_color`, `user_css`, `created_at`, `updated_at`) VALUES
(1, 1, 'admin', '#ed4040', '#292929', '#cbcbcb', '#ffffff', NULL, '2019-05-31 22:26:13', '2019-05-31 22:26:13'),
(2, 1, 'project_admin', '#5475ed', '#292929', '#cbcbcb', '#ffffff', NULL, '2019-05-31 22:26:13', '2019-05-31 22:26:13'),
(3, 1, 'employee', '#f7c80c', '#292929', '#cbcbcb', '#ffffff', NULL, '2019-05-31 22:26:13', '2019-05-31 22:26:13'),
(4, 1, 'client', '#00c292', '#292929', '#cbcbcb', '#ffffff', NULL, '2019-05-31 22:26:13', '2019-05-31 22:26:13'),
(5, 2, 'admin', '#ed4040', '#292929', '#cbcbcb', '#ffffff', NULL, '2019-06-13 00:32:44', '2019-06-13 00:32:44'),
(6, 2, 'project_admin', '#5475ed', '#292929', '#cbcbcb', '#ffffff', NULL, '2019-06-13 00:32:44', '2019-06-13 00:32:44'),
(7, 2, 'employee', '#f7c80c', '#292929', '#cbcbcb', '#ffffff', NULL, '2019-06-13 00:32:44', '2019-06-13 00:32:44'),
(8, 2, 'client', '#00c292', '#292929', '#cbcbcb', '#ffffff', NULL, '2019-06-13 00:32:44', '2019-06-13 00:32:44'),
(9, 3, 'admin', '#ed4040', '#292929', '#cbcbcb', '#ffffff', NULL, '2019-07-06 20:18:36', '2019-07-06 20:18:36'),
(10, 3, 'project_admin', '#5475ed', '#292929', '#cbcbcb', '#ffffff', NULL, '2019-07-06 20:18:36', '2019-07-06 20:18:36'),
(11, 3, 'employee', '#f7c80c', '#292929', '#cbcbcb', '#ffffff', NULL, '2019-07-06 20:18:36', '2019-07-06 20:18:36'),
(12, 3, 'client', '#00c292', '#292929', '#cbcbcb', '#ffffff', NULL, '2019-07-06 20:18:36', '2019-07-06 20:18:36'),
(13, 4, 'admin', '#ed4040', '#292929', '#cbcbcb', '#ffffff', NULL, '2019-07-31 19:32:05', '2019-07-31 19:32:05'),
(14, 4, 'project_admin', '#5475ed', '#292929', '#cbcbcb', '#ffffff', NULL, '2019-07-31 19:32:05', '2019-07-31 19:32:05'),
(15, 4, 'employee', '#f7c80c', '#292929', '#cbcbcb', '#ffffff', NULL, '2019-07-31 19:32:05', '2019-07-31 19:32:05'),
(16, 4, 'client', '#00c292', '#292929', '#cbcbcb', '#ffffff', NULL, '2019-07-31 19:32:05', '2019-07-31 19:32:05'),
(17, 5, 'admin', '#ed4040', '#292929', '#cbcbcb', '#ffffff', NULL, '2019-07-31 19:38:54', '2019-07-31 19:38:54'),
(18, 5, 'project_admin', '#5475ed', '#292929', '#cbcbcb', '#ffffff', NULL, '2019-07-31 19:38:54', '2019-07-31 19:38:54'),
(19, 5, 'employee', '#f7c80c', '#292929', '#cbcbcb', '#ffffff', NULL, '2019-07-31 19:38:54', '2019-07-31 19:38:54'),
(20, 5, 'client', '#00c292', '#292929', '#cbcbcb', '#ffffff', NULL, '2019-07-31 19:38:54', '2019-07-31 19:38:54'),
(21, 6, 'admin', '#ed4040', '#292929', '#cbcbcb', '#ffffff', NULL, '2019-07-31 19:41:25', '2019-07-31 19:41:25'),
(22, 6, 'project_admin', '#5475ed', '#292929', '#cbcbcb', '#ffffff', NULL, '2019-07-31 19:41:25', '2019-07-31 19:41:25'),
(23, 6, 'employee', '#f7c80c', '#292929', '#cbcbcb', '#ffffff', NULL, '2019-07-31 19:41:25', '2019-07-31 19:41:25'),
(24, 6, 'client', '#00c292', '#292929', '#cbcbcb', '#ffffff', NULL, '2019-07-31 19:41:25', '2019-07-31 19:41:25');

-- --------------------------------------------------------

--
-- Table structure for table `tickets`
--

CREATE TABLE `tickets` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `subject` text COLLATE utf8_unicode_ci NOT NULL,
  `status` enum('open','pending','resolved','closed') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'open',
  `priority` enum('low','medium','high','urgent') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'medium',
  `agent_id` int(10) UNSIGNED DEFAULT NULL,
  `channel_id` int(10) UNSIGNED DEFAULT NULL,
  `type_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ticket_agent_groups`
--

CREATE TABLE `ticket_agent_groups` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `agent_id` int(10) UNSIGNED NOT NULL,
  `group_id` int(10) UNSIGNED DEFAULT NULL,
  `status` enum('enabled','disabled') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'enabled',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ticket_channels`
--

CREATE TABLE `ticket_channels` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `channel_name` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `ticket_channels`
--

INSERT INTO `ticket_channels` (`id`, `company_id`, `channel_name`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Email', '2019-05-31 22:26:05', '2019-05-31 22:26:05'),
(2, NULL, 'Phone', '2019-05-31 22:26:05', '2019-05-31 22:26:05'),
(3, NULL, 'Twitter', '2019-05-31 22:26:05', '2019-05-31 22:26:05'),
(4, NULL, 'Facebook', '2019-05-31 22:26:05', '2019-05-31 22:26:05'),
(5, 1, 'Email', '2019-05-31 22:26:13', '2019-05-31 22:26:13'),
(6, 1, 'Phone', '2019-05-31 22:26:13', '2019-05-31 22:26:13'),
(7, 1, 'Twitter', '2019-05-31 22:26:13', '2019-05-31 22:26:13'),
(8, 1, 'Facebook', '2019-05-31 22:26:13', '2019-05-31 22:26:13'),
(9, 2, 'Email', '2019-06-13 00:32:44', '2019-06-13 00:32:44'),
(10, 2, 'Phone', '2019-06-13 00:32:44', '2019-06-13 00:32:44'),
(11, 2, 'Twitter', '2019-06-13 00:32:44', '2019-06-13 00:32:44'),
(12, 2, 'Facebook', '2019-06-13 00:32:44', '2019-06-13 00:32:44'),
(13, 3, 'Email', '2019-07-06 20:18:36', '2019-07-06 20:18:36'),
(14, 3, 'Phone', '2019-07-06 20:18:36', '2019-07-06 20:18:36'),
(15, 3, 'Twitter', '2019-07-06 20:18:36', '2019-07-06 20:18:36'),
(16, 3, 'Facebook', '2019-07-06 20:18:36', '2019-07-06 20:18:36'),
(17, 4, 'Email', '2019-07-31 19:32:04', '2019-07-31 19:32:04'),
(18, 4, 'Phone', '2019-07-31 19:32:04', '2019-07-31 19:32:04'),
(19, 4, 'Twitter', '2019-07-31 19:32:04', '2019-07-31 19:32:04'),
(20, 4, 'Facebook', '2019-07-31 19:32:04', '2019-07-31 19:32:04'),
(21, 5, 'Email', '2019-07-31 19:38:54', '2019-07-31 19:38:54'),
(22, 5, 'Phone', '2019-07-31 19:38:54', '2019-07-31 19:38:54'),
(23, 5, 'Twitter', '2019-07-31 19:38:54', '2019-07-31 19:38:54'),
(24, 5, 'Facebook', '2019-07-31 19:38:54', '2019-07-31 19:38:54'),
(25, 6, 'Email', '2019-07-31 19:41:25', '2019-07-31 19:41:25'),
(26, 6, 'Phone', '2019-07-31 19:41:25', '2019-07-31 19:41:25'),
(27, 6, 'Twitter', '2019-07-31 19:41:25', '2019-07-31 19:41:25'),
(28, 6, 'Facebook', '2019-07-31 19:41:25', '2019-07-31 19:41:25');

-- --------------------------------------------------------

--
-- Table structure for table `ticket_groups`
--

CREATE TABLE `ticket_groups` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `group_name` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `ticket_groups`
--

INSERT INTO `ticket_groups` (`id`, `company_id`, `group_name`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Sales', '2019-05-31 22:26:05', '2019-05-31 22:26:05'),
(2, NULL, 'Code', '2019-05-31 22:26:05', '2019-05-31 22:26:05'),
(3, NULL, 'Management', '2019-05-31 22:26:05', '2019-05-31 22:26:05'),
(4, 1, 'Sales', '2019-05-31 22:26:13', '2019-05-31 22:26:13'),
(5, 1, 'Code', '2019-05-31 22:26:13', '2019-05-31 22:26:13'),
(6, 1, 'Management', '2019-05-31 22:26:13', '2019-05-31 22:26:13'),
(7, 2, 'Sales', '2019-06-13 00:32:44', '2019-06-13 00:32:44'),
(8, 2, 'Code', '2019-06-13 00:32:44', '2019-06-13 00:32:44'),
(9, 2, 'Management', '2019-06-13 00:32:44', '2019-06-13 00:32:44'),
(10, 3, 'Sales', '2019-07-06 20:18:36', '2019-07-06 20:18:36'),
(11, 3, 'Code', '2019-07-06 20:18:36', '2019-07-06 20:18:36'),
(12, 3, 'Management', '2019-07-06 20:18:36', '2019-07-06 20:18:36'),
(13, 4, 'Sales', '2019-07-31 19:32:04', '2019-07-31 19:32:04'),
(14, 4, 'Code', '2019-07-31 19:32:04', '2019-07-31 19:32:04'),
(15, 4, 'Management', '2019-07-31 19:32:04', '2019-07-31 19:32:04'),
(16, 5, 'Sales', '2019-07-31 19:38:54', '2019-07-31 19:38:54'),
(17, 5, 'Code', '2019-07-31 19:38:54', '2019-07-31 19:38:54'),
(18, 5, 'Management', '2019-07-31 19:38:54', '2019-07-31 19:38:54'),
(19, 6, 'Sales', '2019-07-31 19:41:25', '2019-07-31 19:41:25'),
(20, 6, 'Code', '2019-07-31 19:41:25', '2019-07-31 19:41:25'),
(21, 6, 'Management', '2019-07-31 19:41:25', '2019-07-31 19:41:25');

-- --------------------------------------------------------

--
-- Table structure for table `ticket_replies`
--

CREATE TABLE `ticket_replies` (
  `id` int(10) UNSIGNED NOT NULL,
  `ticket_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `message` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ticket_reply_templates`
--

CREATE TABLE `ticket_reply_templates` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `reply_heading` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `reply_text` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ticket_tags`
--

CREATE TABLE `ticket_tags` (
  `id` int(10) UNSIGNED NOT NULL,
  `tag_id` int(10) UNSIGNED NOT NULL,
  `ticket_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ticket_tag_list`
--

CREATE TABLE `ticket_tag_list` (
  `id` int(10) UNSIGNED NOT NULL,
  `tag_name` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ticket_types`
--

CREATE TABLE `ticket_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `type` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `ticket_types`
--

INSERT INTO `ticket_types` (`id`, `company_id`, `type`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Question', '2019-05-31 22:26:05', '2019-05-31 22:26:05'),
(2, NULL, 'Problem', '2019-05-31 22:26:05', '2019-05-31 22:26:05'),
(3, NULL, 'Incident', '2019-05-31 22:26:05', '2019-05-31 22:26:05'),
(4, NULL, 'Feature Request', '2019-05-31 22:26:05', '2019-05-31 22:26:05'),
(5, 1, 'Question', '2019-05-31 22:26:13', '2019-05-31 22:26:13'),
(6, 1, 'Problem', '2019-05-31 22:26:13', '2019-05-31 22:26:13'),
(7, 1, 'Incident', '2019-05-31 22:26:13', '2019-05-31 22:26:13'),
(8, 1, 'Feature Request', '2019-05-31 22:26:13', '2019-05-31 22:26:13'),
(9, 2, 'Question', '2019-06-13 00:32:44', '2019-06-13 00:32:44'),
(10, 2, 'Problem', '2019-06-13 00:32:44', '2019-06-13 00:32:44'),
(11, 2, 'Incident', '2019-06-13 00:32:44', '2019-06-13 00:32:44'),
(12, 2, 'Feature Request', '2019-06-13 00:32:44', '2019-06-13 00:32:44'),
(13, 3, 'Question', '2019-07-06 20:18:36', '2019-07-06 20:18:36'),
(14, 3, 'Problem', '2019-07-06 20:18:36', '2019-07-06 20:18:36'),
(15, 3, 'Incident', '2019-07-06 20:18:36', '2019-07-06 20:18:36'),
(16, 3, 'Feature Request', '2019-07-06 20:18:36', '2019-07-06 20:18:36'),
(17, 4, 'Question', '2019-07-31 19:32:04', '2019-07-31 19:32:04'),
(18, 4, 'Problem', '2019-07-31 19:32:04', '2019-07-31 19:32:04'),
(19, 4, 'Incident', '2019-07-31 19:32:04', '2019-07-31 19:32:04'),
(20, 4, 'Feature Request', '2019-07-31 19:32:04', '2019-07-31 19:32:04'),
(21, 5, 'Question', '2019-07-31 19:38:54', '2019-07-31 19:38:54'),
(22, 5, 'Problem', '2019-07-31 19:38:54', '2019-07-31 19:38:54'),
(23, 5, 'Incident', '2019-07-31 19:38:54', '2019-07-31 19:38:54'),
(24, 5, 'Feature Request', '2019-07-31 19:38:54', '2019-07-31 19:38:54'),
(25, 6, 'Question', '2019-07-31 19:41:25', '2019-07-31 19:41:25'),
(26, 6, 'Problem', '2019-07-31 19:41:25', '2019-07-31 19:41:25'),
(27, 6, 'Incident', '2019-07-31 19:41:25', '2019-07-31 19:41:25'),
(28, 6, 'Feature Request', '2019-07-31 19:41:25', '2019-07-31 19:41:25');

-- --------------------------------------------------------

--
-- Table structure for table `universal_search`
--

CREATE TABLE `universal_search` (
  `id` int(10) UNSIGNED NOT NULL,
  `searchable_id` int(11) NOT NULL,
  `title` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `route_name` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `universal_search`
--

INSERT INTO `universal_search` (`id`, `searchable_id`, `title`, `route_name`, `created_at`, `updated_at`) VALUES
(1, 1, 'Admin Name', 'admin.employees.show', '2019-05-31 22:26:13', '2019-05-31 22:26:13'),
(2, 2, 'Jennyfer Kihn', 'admin.employees.show', '2019-05-31 22:26:13', '2019-05-31 22:26:13'),
(3, 1, 'Task test task created by admin', 'admin.all-tasks.edit', '2019-05-31 23:48:34', '2019-05-31 23:48:34'),
(4, 2, 'Task New task added from employee panel', 'admin.all-tasks.edit', '2019-06-01 00:57:47', '2019-06-01 00:57:47'),
(5, 4, 'Datagroup', 'admin.clients.edit', '2019-06-05 00:18:50', '2019-06-05 00:18:50'),
(6, 4, 'jthigpen@dtinetworks.com', 'admin.clients.edit', '2019-06-05 00:18:50', '2019-06-05 00:18:50'),
(7, 4, 'DTI', 'admin.clients.edit', '2019-06-05 00:18:50', '2019-06-05 00:18:50'),
(8, 5, 'Highclick', 'admin.clients.edit', '2019-06-05 00:23:12', '2019-06-05 00:23:12'),
(9, 5, 'joeweb2@dtihost.com', 'admin.clients.edit', '2019-06-05 00:23:12', '2019-06-05 00:23:12'),
(10, 5, 'Highclick', 'admin.clients.edit', '2019-06-05 00:23:12', '2019-06-05 00:23:12'),
(11, 6, 'Encounterworks', 'admin.clients.edit', '2019-06-05 00:23:48', '2019-06-05 00:23:48'),
(12, 6, 'joe.thigpen@encounterworks.com', 'admin.clients.edit', '2019-06-05 00:23:48', '2019-06-05 00:23:48'),
(13, 6, 'EncounterWorks', 'admin.clients.edit', '2019-06-05 00:23:48', '2019-06-05 00:23:48'),
(14, 7, 'Joe Thigpen', 'admin.employees.show', '2019-06-05 03:54:58', '2019-06-05 03:54:58'),
(15, 3, 'Task Excused error and created task anyway', 'admin.all-tasks.edit', '2019-06-05 17:18:20', '2019-06-05 17:18:20'),
(16, 4, 'Task task on board', 'admin.all-tasks.edit', '2019-06-05 17:22:30', '2019-06-05 17:22:30'),
(17, 5, 'Task Test Task', 'admin.all-tasks.edit', '2019-06-05 23:58:46', '2019-06-05 23:58:46'),
(18, 6, 'Task test in new column', 'admin.all-tasks.edit', '2019-06-06 00:05:48', '2019-06-06 00:05:48'),
(19, 7, 'Task test in new column 2', 'admin.all-tasks.edit', '2019-06-06 00:06:33', '2019-06-06 00:06:33'),
(20, 8, 'Task test task', 'admin.all-tasks.edit', '2019-06-06 04:21:28', '2019-06-06 04:21:28'),
(21, 8, 'Rhonda Rouse', 'admin.employees.show', '2019-06-08 00:53:14', '2019-06-08 00:53:14'),
(22, 9, 'Ken Tyson', 'admin.employees.show', '2019-06-08 00:54:04', '2019-06-08 00:54:04'),
(23, 10, 'Michelle Pittman', 'admin.employees.show', '2019-06-08 01:02:08', '2019-06-08 01:02:08'),
(24, 11, 'Brad Caudill', 'admin.employees.show', '2019-06-08 01:02:59', '2019-06-08 01:02:59'),
(25, 12, 'Victor', 'admin.employees.show', '2019-06-08 01:03:49', '2019-06-08 01:03:49'),
(26, 13, 'Kendall Walston', 'admin.employees.show', '2019-06-08 01:04:36', '2019-06-08 01:04:36'),
(27, 14, 'Leah', 'admin.employees.show', '2019-06-08 01:05:34', '2019-06-08 01:05:34'),
(28, 15, 'Richard Haar', 'admin.employees.show', '2019-06-08 01:06:12', '2019-06-08 01:06:12'),
(29, 1, 'Project: Duties Managers', 'admin.projects.show', '2019-06-08 01:14:35', '2019-06-08 01:14:35'),
(30, 9, 'Task Duties Task 1', 'admin.all-tasks.edit', '2019-06-08 01:16:53', '2019-06-08 01:16:53'),
(31, 2, 'Project: project Template test', 'admin.projects.show', '2019-06-11 05:32:25', '2019-06-11 05:32:25'),
(32, 12, 'Task test task', 'admin.all-tasks.edit', '2019-07-01 23:07:41', '2019-07-01 23:07:41'),
(33, 13, 'Task Task 2', 'admin.all-tasks.edit', '2019-07-02 06:49:46', '2019-07-02 06:49:46'),
(34, 14, 'Task: New Task after upgrade', 'admin.all-tasks.edit', '2019-07-30 23:39:19', '2019-07-30 23:39:19'),
(35, 15, 'Task Task 1', 'admin.all-tasks.edit', '2019-08-04 18:52:32', '2019-08-04 18:52:32'),
(36, 16, 'Task Task 2', 'admin.all-tasks.edit', '2019-08-04 18:54:13', '2019-08-04 18:54:13'),
(37, 17, 'Task Task 3', 'admin.all-tasks.edit', '2019-08-04 18:56:30', '2019-08-04 18:56:30'),
(38, 18, 'Task Task 5', 'admin.all-tasks.edit', '2019-08-04 18:56:59', '2019-08-04 18:56:59'),
(39, 19, 'Task Task 4', 'admin.all-tasks.edit', '2019-08-04 18:57:51', '2019-08-04 18:57:51'),
(40, 21, 'clinet', 'admin.clients.edit', '2019-08-14 20:35:23', '2019-08-14 20:35:23'),
(41, 21, 'client@workatask.com', 'admin.clients.edit', '2019-08-14 20:35:23', '2019-08-14 20:35:23'),
(42, 21, 'client', 'admin.clients.edit', '2019-08-14 20:35:23', '2019-08-14 20:35:23'),
(43, 22, 'employee', 'admin.employees.show', '2019-08-14 21:05:20', '2019-08-14 21:05:20'),
(44, 1, 'Task Test', 'admin.all-tasks.edit', '2019-09-03 07:57:09', '2019-09-03 07:57:09'),
(45, 2, 'Task Matul2', 'admin.all-tasks.edit', '2019-09-04 16:17:35', '2019-09-04 16:17:35'),
(46, 3, 'Task Affif', 'admin.all-tasks.edit', '2019-09-04 16:18:35', '2019-09-04 16:18:35'),
(47, 4, 'Task New', 'admin.all-tasks.edit', '2019-09-06 12:01:20', '2019-09-06 12:01:20'),
(48, 5, 'Task j', 'admin.all-tasks.edit', '2019-09-06 12:21:40', '2019-09-06 12:21:40'),
(49, 6, 'Task new32', 'admin.all-tasks.edit', '2019-09-06 14:26:04', '2019-09-06 14:26:04'),
(50, 7, 'Task Iam 2', 'admin.all-tasks.edit', '2019-09-06 18:53:54', '2019-09-06 18:53:54'),
(51, 8, 'Task A new', 'admin.all-tasks.edit', '2019-09-07 17:05:06', '2019-09-07 17:05:06'),
(52, 9, 'Task new more man', 'admin.all-tasks.edit', '2019-09-07 17:05:56', '2019-09-07 17:05:56'),
(53, 10, 'Task a new one', 'admin.all-tasks.edit', '2019-09-08 21:31:26', '2019-09-08 21:31:26'),
(54, 11, 'Task a new tow', 'admin.all-tasks.edit', '2019-09-08 21:31:56', '2019-09-08 21:31:56'),
(55, 12, 'Task new3', 'admin.all-tasks.edit', '2019-09-08 21:36:57', '2019-09-08 21:36:57'),
(56, 14, 'Task im aaa', 'admin.all-tasks.edit', '2019-09-10 21:36:44', '2019-09-10 21:36:44'),
(57, 15, 'Task team', 'admin.all-tasks.edit', '2019-09-11 05:52:04', '2019-09-11 05:52:04'),
(58, 16, 'Task huhuhuh', 'admin.all-tasks.edit', '2019-09-11 12:24:55', '2019-09-11 12:24:55'),
(59, 17, 'Task huhuhuh', 'admin.all-tasks.edit', '2019-09-11 12:25:10', '2019-09-11 12:25:10'),
(60, 18, 'Task huhuhuh', 'admin.all-tasks.edit', '2019-09-11 12:25:18', '2019-09-11 12:25:18'),
(61, 19, 'Task huhuhuh', 'admin.all-tasks.edit', '2019-09-11 12:26:17', '2019-09-11 12:26:17'),
(62, 196, 'Task test', 'admin.all-tasks.edit', '2019-10-10 05:44:19', '2019-10-10 05:44:19'),
(63, 197, 'Task task created from wizard', 'admin.all-tasks.edit', '2019-10-11 21:13:19', '2019-10-11 21:13:19'),
(64, 198, 'Task task cerated from group', 'admin.all-tasks.edit', '2019-10-11 21:17:09', '2019-10-11 21:17:09'),
(65, 199, 'Task task cerated from group', 'admin.all-tasks.edit', '2019-10-11 21:17:10', '2019-10-11 21:17:10'),
(66, 200, 'Task task cerated from group', 'admin.all-tasks.edit', '2019-10-11 21:17:10', '2019-10-11 21:17:10'),
(67, 201, 'Task task cerated from group', 'admin.all-tasks.edit', '2019-10-11 21:17:10', '2019-10-11 21:17:10'),
(68, 202, 'Task Test 2 from wizard', 'admin.all-tasks.edit', '2019-10-11 21:19:45', '2019-10-11 21:19:45'),
(69, 203, 'Task new quick task', 'admin.all-tasks.edit', '2019-10-13 05:07:38', '2019-10-13 05:07:38'),
(70, 204, 'Task Task entered by wizard', 'admin.all-tasks.edit', '2019-10-14 23:30:41', '2019-10-14 23:30:41'),
(71, 205, 'Task Recuring from wizard', 'admin.all-tasks.edit', '2019-10-14 23:31:57', '2019-10-14 23:31:57'),
(72, 206, 'Task test from wizard 34', 'admin.all-tasks.edit', '2019-10-14 23:41:46', '2019-10-14 23:41:46'),
(73, 207, 'Task test from wizard w recurr', 'admin.all-tasks.edit', '2019-10-14 23:43:00', '2019-10-14 23:43:00'),
(74, 208, 'Task test from quicl 34', 'admin.all-tasks.edit', '2019-10-14 23:45:02', '2019-10-14 23:45:02'),
(75, 209, 'Task aa', 'admin.all-tasks.edit', '2019-10-18 13:46:31', '2019-10-18 13:46:31');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `name` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mobile` varchar(191) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gender` enum('male','female','others') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'male',
  `locale` varchar(191) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'en',
  `status` enum('active','deactive') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'active',
  `login` enum('enable','disable') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'enable',
  `onesignal_player_id` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `super_admin` enum('0','1') COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `email_verification_code` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `company_id`, `name`, `email`, `password`, `remember_token`, `image`, `mobile`, `gender`, `locale`, `status`, `login`, `onesignal_player_id`, `created_at`, `updated_at`, `super_admin`, `email_verification_code`) VALUES
(1, 1, 'Admin Name', 'dtiadmin@workatask.com', '$2y$12$zqUIKtV7EKAxOGfeQesN1eD3htV26JnqHwqDydIqGwgw/yYeMqHcK', 'fHFu5JWsCAJfdKFNIflwM0Mef3YaXjrBccnRRZ2UWYPnwgPTa24jl7j6Dy7u', NULL, NULL, 'male', 'en', 'active', 'enable', NULL, '2019-05-31 22:26:13', '2019-08-23 10:02:24', '0', NULL),
(2, 1, 'Jennyfer Kihn', 'darrion88@example.net', '$2y$12$zqUIKtV7EKAxOGfeQesN1eD3htV26JnqHwqDydIqGwgw/yYeMqHcK', NULL, NULL, NULL, 'male', 'en', 'active', 'enable', NULL, '2019-05-31 22:26:13', '2019-08-23 10:02:25', '0', NULL),
(3, NULL, 'Super Admin', 'superadmin@workatask.com', '$2y$12$zqUIKtV7EKAxOGfeQesN1eD3htV26JnqHwqDydIqGwgw/yYeMqHcK', 'MGxxs8BYRQhK0gpdEw7I0BgDRN7Ena9Xgl9pTr6yBn2A1TAPajDcC7kqLhLm', NULL, NULL, 'male', 'en', 'active', 'enable', NULL, '2019-05-31 22:26:13', '2019-08-23 10:02:25', '1', NULL),
(4, 1, 'Datagroup', 'dticlient@workatask.com', '$2y$12$zqUIKtV7EKAxOGfeQesN1eD3htV26JnqHwqDydIqGwgw/yYeMqHcK', 'mnDiEhQ9lc4YZE0sCcoJ8pKsTDwMt8MWMcP2aeaUrp9P46A7KRpyM6nMO7DB', NULL, NULL, 'male', 'en', 'active', 'enable', NULL, '2019-06-05 00:18:49', '2019-08-23 10:02:26', '0', NULL),
(5, 1, 'Highclick', 'hcclient@workatask.com', '$2y$12$zqUIKtV7EKAxOGfeQesN1eD3htV26JnqHwqDydIqGwgw/yYeMqHcK', NULL, NULL, NULL, 'male', 'en', 'active', 'enable', NULL, '2019-06-05 00:23:12', '2019-08-23 10:02:26', '0', NULL),
(6, 1, 'Encounterworks', 'ewclient@workatask.com', '$2y$12$zqUIKtV7EKAxOGfeQesN1eD3htV26JnqHwqDydIqGwgw/yYeMqHcK', NULL, NULL, NULL, 'male', 'en', 'active', 'enable', NULL, '2019-06-05 00:23:48', '2019-08-23 10:02:26', '0', NULL),
(7, 1, 'Joe Thigpen', 'jthigpen@dtinetworks.com', '$2y$12$zqUIKtV7EKAxOGfeQesN1eD3htV26JnqHwqDydIqGwgw/yYeMqHcK', 'Eu2f4X8BriRdTmWqMDiDDFuMoMIVzhggRsXlX1F5o0sOxJx8tzNH8ee7izRT', 'YSEAX4wpaOObG1p2thAh9WN395SywXUXmQ72r0ar.gif', NULL, 'male', 'en', 'active', 'enable', NULL, '2019-06-05 03:54:58', '2019-08-23 10:02:27', '0', NULL),
(8, 1, 'Rhonda Rouse', 'rrouse@workatask.com', '$2y$12$zqUIKtV7EKAxOGfeQesN1eD3htV26JnqHwqDydIqGwgw/yYeMqHcK', 'sbFiAVg5Ve4kyyt9ZK7X0GQc2KwrREuwdiQkuhmrhljyFoZLU2pwNFo4RxAM', NULL, NULL, 'female', 'en', 'active', 'enable', NULL, '2019-06-08 00:53:12', '2019-08-23 10:02:27', '0', NULL),
(9, 1, 'Ken Tyson', 'ken.tyson@workatask.com', '$2y$12$zqUIKtV7EKAxOGfeQesN1eD3htV26JnqHwqDydIqGwgw/yYeMqHcK', 'WZLM1eih2QlG0xfV6YEobcTzCAsF1ABHM2Rviikztz8ejBOAm1vrgxHnlG5u', NULL, NULL, 'male', 'en', 'active', 'enable', NULL, '2019-06-08 00:54:04', '2019-08-23 10:02:27', '0', NULL),
(10, 1, 'Michelle Pittman', 'michelle@workatask.com', '$2y$12$zqUIKtV7EKAxOGfeQesN1eD3htV26JnqHwqDydIqGwgw/yYeMqHcK', NULL, NULL, NULL, 'female', 'en', 'active', 'enable', NULL, '2019-06-08 01:02:08', '2019-08-23 10:02:28', '0', NULL),
(11, 1, 'Brad Caudill', 'bcaudill@dtinetworks.com', '$2y$12$zqUIKtV7EKAxOGfeQesN1eD3htV26JnqHwqDydIqGwgw/yYeMqHcK', NULL, NULL, NULL, 'male', 'en', 'active', 'enable', NULL, '2019-06-08 01:02:59', '2019-08-23 10:02:28', '0', NULL),
(12, 1, 'Elizabeth Semple', 'esemple@workatask.com', '$2y$12$zqUIKtV7EKAxOGfeQesN1eD3htV26JnqHwqDydIqGwgw/yYeMqHcK', NULL, NULL, NULL, 'male', 'en', 'active', 'enable', NULL, '2019-06-08 01:03:49', '2019-08-23 10:02:28', '0', NULL),
(13, 1, 'Kendall Walston', 'kendall@workatask.com', '$2y$12$zqUIKtV7EKAxOGfeQesN1eD3htV26JnqHwqDydIqGwgw/yYeMqHcK', NULL, NULL, NULL, 'female', 'en', 'active', 'enable', NULL, '2019-06-08 01:04:36', '2019-08-23 10:02:28', '0', NULL),
(14, 1, 'Leah', 'leah@workatask.com', '$2y$12$zqUIKtV7EKAxOGfeQesN1eD3htV26JnqHwqDydIqGwgw/yYeMqHcK', NULL, NULL, NULL, 'female', 'en', 'active', 'enable', NULL, '2019-06-08 01:05:34', '2019-08-23 10:02:28', '0', NULL),
(15, 1, 'Richard Haar', 'richard@workatask.com', '$2y$12$zqUIKtV7EKAxOGfeQesN1eD3htV26JnqHwqDydIqGwgw/yYeMqHcK', NULL, NULL, NULL, 'male', 'en', 'active', 'enable', NULL, '2019-06-08 01:06:12', '2019-08-23 10:02:28', '0', NULL),
(16, 2, 'admin', 'joethigpen62@gmail.com', '$2y$12$zqUIKtV7EKAxOGfeQesN1eD3htV26JnqHwqDydIqGwgw/yYeMqHcK', 'DxCbzEzzeLr4IZdCuPlpyUvRF4b5jWMGl9zi7J7Egl7uY7cIy8aOeNsFOiml', NULL, NULL, 'male', 'en', 'active', 'enable', NULL, '2019-06-13 00:32:44', '2019-08-23 10:02:28', '0', ''),
(17, 3, 'admin', 'joethigpen@dtihost.com', '$2y$10$EVUBSu37kWziZe4l2Gpa9eiy1ALFQlhTJ2JkoN2zyWqpkMM51ccUa', NULL, NULL, NULL, 'male', 'en', 'deactive', 'enable', NULL, '2019-07-06 20:18:37', '2019-07-06 20:18:37', '0', 'CIAeqP2BueQhqbWQ85m90REaoBoYEsZAtxgLn4LZ'),
(18, 4, 'admin', 'mbutler@dtinetworks.com', '$2y$12$zqUIKtV7EKAxOGfeQesN1eD3htV26JnqHwqDydIqGwgw/yYeMqHcK', 'VqZJvcOUZBRjHRLg7EIpCdSPDPu7IUqQxMHL2b8qtFdEesCUeWu1bWE9zKVV', NULL, NULL, 'male', 'en', 'active', 'enable', NULL, '2019-07-31 19:32:05', '2019-08-23 10:02:28', '0', ''),
(19, 5, 'admin', 'matt@mabutler.us', '$2y$10$ZHwf2xIGje48MEJEAlXzU.Rnluki2gS/fxGDVXvzORq5u6/EJA8PC', NULL, NULL, NULL, 'male', 'en', 'deactive', 'enable', NULL, '2019-07-31 19:38:54', '2019-07-31 19:38:54', '0', 'cbDlo5yGqsxppSl4rlWexzlfZfzN8hFy950O3SD3'),
(20, 6, 'admin', 'joeweb2@dtihost.com', '$2y$12$zqUIKtV7EKAxOGfeQesN1eD3htV26JnqHwqDydIqGwgw/yYeMqHcK', NULL, NULL, NULL, 'male', 'en', 'active', 'enable', NULL, '2019-07-31 19:41:25', '2019-08-23 10:02:28', '0', ''),
(21, 1, 'clinet', 'client@workatask.com', '$2y$12$zqUIKtV7EKAxOGfeQesN1eD3htV26JnqHwqDydIqGwgw/yYeMqHcK', 'PsAAYl4XZB8Q1FE3w7fWpXM6LFYLGlRCa8zhqJvc8SK0llncJAadRKlrWLZB', NULL, NULL, 'male', 'en', 'active', 'enable', NULL, '2019-08-14 20:35:23', '2019-08-23 10:02:28', '0', NULL),
(22, 1, 'employee', 'employee@workatask.com', '$2y$12$zqUIKtV7EKAxOGfeQesN1eD3htV26JnqHwqDydIqGwgw/yYeMqHcK', 'rj7sb2i7SeCK04gfoqksPbm3P1IZXGBHcSOYYRsXFw1F4jw8WiWJzMuFWrPC', NULL, NULL, 'male', 'en', 'active', 'enable', NULL, '2019-08-14 21:05:19', '2019-08-23 10:02:28', '0', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users_chat`
--

CREATE TABLE `users_chat` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_one` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `message` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `from` int(10) UNSIGNED DEFAULT NULL,
  `to` int(10) UNSIGNED DEFAULT NULL,
  `message_seen` enum('yes','no') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'no',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_activities`
--

CREATE TABLE `user_activities` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(10) UNSIGNED DEFAULT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `activity` text COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `user_activities`
--

INSERT INTO `user_activities` (`id`, `company_id`, `user_id`, `activity`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'Updated profile.', '2019-06-07 17:04:40', '2019-06-07 17:04:40'),
(2, 1, 7, 'Updated profile.', '2019-06-08 01:07:26', '2019-06-08 01:07:26'),
(3, 1, 7, 'Marked the task as <i>completed</i> : <strong>Duties Task 1</strong>', '2019-06-08 01:28:47', '2019-06-08 01:28:47'),
(4, 1, 7, 'Marked the task as <i>incomplete</i> : <strong>Duties Task 1</strong>', '2019-06-08 01:28:49', '2019-06-08 01:28:49'),
(5, 1, 7, 'Started the timer for project Duties Managers', '2019-06-08 01:31:13', '2019-06-08 01:31:13'),
(6, 1, 7, 'Started the timer for project Duties Managers', '2019-06-08 01:33:28', '2019-06-08 01:33:28');

-- --------------------------------------------------------

--
-- Table structure for table `view_arrays`
--

CREATE TABLE `view_arrays` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `role` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `array` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `is_project` int(11) NOT NULL DEFAULT 1 COMMENT '0:not_view,1:view',
  `is_project_phase` int(11) NOT NULL DEFAULT 1 COMMENT '0:not_view,1:view',
  `is_start_date` int(11) NOT NULL DEFAULT 1 COMMENT '0:not_view,1:view',
  `is_due_date` int(11) NOT NULL DEFAULT 1 COMMENT '0:not_view,1:view',
  `is_end_date` int(11) NOT NULL DEFAULT 1 COMMENT '0:not_view,1:view',
  `is_priority` int(11) NOT NULL DEFAULT 1 COMMENT '0:not_view,1:view',
  `is_project_cat` int(11) NOT NULL DEFAULT 1 COMMENT '0:not_view,1:view',
  `is_task_cat` int(11) NOT NULL DEFAULT 1 COMMENT '0:not_view,1:view',
  `is_est_hour` int(11) NOT NULL DEFAULT 1 COMMENT '0:not_view,1:view',
  `is_act_hour` int(11) NOT NULL DEFAULT 1 COMMENT '0:not_view,1:view',
  `is_created_at` int(11) NOT NULL DEFAULT 1 COMMENT '0:not_view,1:view',
  `is_section_tiles` int(11) NOT NULL DEFAULT 1 COMMENT '0:not_view,1:view',
  `is_tag` int(11) NOT NULL DEFAULT 1 COMMENT '0:not_view,1:view',
  `order_by_column` varchar(191) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'created_at',
  `group_by_column` varchar(191) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'heading',
  `group_by_table` varchar(191) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'tasks',
  `hide_show_completed` int(11) DEFAULT 1 COMMENT '0:not,1:yes'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `view_arrays`
--

INSERT INTO `view_arrays` (`id`, `user_id`, `role`, `array`, `created_at`, `updated_at`, `is_project`, `is_project_phase`, `is_start_date`, `is_due_date`, `is_end_date`, `is_priority`, `is_project_cat`, `is_task_cat`, `is_est_hour`, `is_act_hour`, `is_created_at`, `is_section_tiles`, `is_tag`, `order_by_column`, `group_by_column`, `group_by_table`, `hide_show_completed`) VALUES
(2, 7, 'admin', '{\"198\":[],\"199\":[],\"200\":[],\"201\":[],\"203\":[],\"208\":[],\"174\":[6],\"175\":[7,8],\"178\":[],\"179\":[],\"183\":[],\"184\":[],\"185\":[2,3,4,5],\"186\":[],\"187\":[],\"188\":[],\"189\":[],\"190\":[9,10],\"195\":[],\"193\":[],\"194\":[],\"196\":[],\"197\":[],\"202\":[],\"204\":[],\"205\":[],\"206\":[],\"207\":[],\"173\":[]}', '2019-09-03 08:03:15', '2019-10-18 15:04:47', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 'created_at', 'project_name', 'projects', 1),
(3, 1, 'admin', '{\"8\":[],\"9\":[]}', '2019-09-07 19:03:28', '2019-09-08 01:15:43', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 'created_at', 'heading', 'tasks', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `attendances`
--
ALTER TABLE `attendances`
  ADD PRIMARY KEY (`id`),
  ADD KEY `attendances_user_id_foreign` (`user_id`),
  ADD KEY `attendances_company_id_foreign` (`company_id`);

--
-- Indexes for table `attendance_settings`
--
ALTER TABLE `attendance_settings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `attendance_settings_company_id_foreign` (`company_id`);

--
-- Indexes for table `client_contacts`
--
ALTER TABLE `client_contacts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `client_contacts_user_id_foreign` (`user_id`),
  ADD KEY `client_contacts_company_id_foreign` (`company_id`);

--
-- Indexes for table `client_details`
--
ALTER TABLE `client_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `client_details_user_id_foreign` (`user_id`),
  ADD KEY `client_details_company_id_foreign` (`company_id`);

--
-- Indexes for table `companies`
--
ALTER TABLE `companies`
  ADD PRIMARY KEY (`id`),
  ADD KEY `organisation_settings_last_updated_by_foreign` (`last_updated_by`),
  ADD KEY `companies_package_id_foreign` (`package_id`),
  ADD KEY `companies_currency_id_foreign` (`currency_id`);

--
-- Indexes for table `conversation`
--
ALTER TABLE `conversation`
  ADD PRIMARY KEY (`id`),
  ADD KEY `conversation_user_one_foreign` (`user_one`),
  ADD KEY `conversation_user_two_foreign` (`user_two`);

--
-- Indexes for table `conversation_reply`
--
ALTER TABLE `conversation_reply`
  ADD PRIMARY KEY (`id`),
  ADD KEY `conversation_reply_conversation_id_foreign` (`conversation_id`),
  ADD KEY `conversation_reply_user_id_foreign` (`user_id`);

--
-- Indexes for table `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `countries_iso_alpha2_index` (`iso_alpha2`),
  ADD KEY `countries_iso_alpha3_index` (`iso_alpha3`);

--
-- Indexes for table `currencies`
--
ALTER TABLE `currencies`
  ADD PRIMARY KEY (`id`),
  ADD KEY `currencies_company_id_foreign` (`company_id`);

--
-- Indexes for table `custom_fields`
--
ALTER TABLE `custom_fields`
  ADD PRIMARY KEY (`id`),
  ADD KEY `custom_fields_custom_field_group_id_foreign` (`custom_field_group_id`);

--
-- Indexes for table `custom_fields_data`
--
ALTER TABLE `custom_fields_data`
  ADD PRIMARY KEY (`id`),
  ADD KEY `custom_fields_data_custom_field_id_foreign` (`custom_field_id`),
  ADD KEY `custom_fields_data_model_index` (`model`);

--
-- Indexes for table `custom_field_groups`
--
ALTER TABLE `custom_field_groups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `custom_field_groups_model_index` (`model`),
  ADD KEY `custom_field_groups_company_id_foreign` (`company_id`);

--
-- Indexes for table `email_notification_settings`
--
ALTER TABLE `email_notification_settings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `email_notification_settings_company_id_foreign` (`company_id`);

--
-- Indexes for table `employee_details`
--
ALTER TABLE `employee_details`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `employee_details_slack_username_unique` (`slack_username`),
  ADD KEY `employee_details_user_id_foreign` (`user_id`),
  ADD KEY `employee_details_company_id_foreign` (`company_id`);

--
-- Indexes for table `employee_docs`
--
ALTER TABLE `employee_docs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employee_docs_user_id_foreign` (`user_id`),
  ADD KEY `employee_docs_company_id_foreign` (`company_id`);

--
-- Indexes for table `employee_skills`
--
ALTER TABLE `employee_skills`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employee_skills_user_id_foreign` (`user_id`),
  ADD KEY `employee_skills_skill_id_foreign` (`skill_id`);

--
-- Indexes for table `employee_teams`
--
ALTER TABLE `employee_teams`
  ADD PRIMARY KEY (`id`),
  ADD KEY `employee_teams_team_id_foreign` (`team_id`),
  ADD KEY `employee_teams_user_id_foreign` (`user_id`);

--
-- Indexes for table `estimates`
--
ALTER TABLE `estimates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `estimates_client_id_foreign` (`client_id`),
  ADD KEY `estimates_currency_id_foreign` (`currency_id`),
  ADD KEY `estimates_company_id_foreign` (`company_id`);

--
-- Indexes for table `estimate_items`
--
ALTER TABLE `estimate_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `estimate_items_estimate_id_foreign` (`estimate_id`),
  ADD KEY `estimate_items_tax_id_foreign` (`tax_id`);

--
-- Indexes for table `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`id`),
  ADD KEY `events_company_id_foreign` (`company_id`);

--
-- Indexes for table `event_attendees`
--
ALTER TABLE `event_attendees`
  ADD PRIMARY KEY (`id`),
  ADD KEY `event_attendees_user_id_foreign` (`user_id`),
  ADD KEY `event_attendees_event_id_foreign` (`event_id`);

--
-- Indexes for table `expenses`
--
ALTER TABLE `expenses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `expenses_currency_id_foreign` (`currency_id`),
  ADD KEY `expenses_user_id_foreign` (`user_id`),
  ADD KEY `expenses_company_id_foreign` (`company_id`);

--
-- Indexes for table `features`
--
ALTER TABLE `features`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `file_storage_settings`
--
ALTER TABLE `file_storage_settings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `file_storage_settings_company_id_foreign` (`company_id`);

--
-- Indexes for table `front_details`
--
ALTER TABLE `front_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `global_currencies`
--
ALTER TABLE `global_currencies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `global_settings`
--
ALTER TABLE `global_settings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `global_settings_last_updated_by_foreign` (`last_updated_by`),
  ADD KEY `global_settings_currency_id_foreign` (`currency_id`);

--
-- Indexes for table `holidays`
--
ALTER TABLE `holidays`
  ADD PRIMARY KEY (`id`),
  ADD KEY `holidays_company_id_foreign` (`company_id`);

--
-- Indexes for table `invoices`
--
ALTER TABLE `invoices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `invoices_project_id_foreign` (`project_id`),
  ADD KEY `invoices_currency_id_foreign` (`currency_id`),
  ADD KEY `invoices_company_id_foreign` (`company_id`);

--
-- Indexes for table `invoice_items`
--
ALTER TABLE `invoice_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `invoice_items_invoice_id_foreign` (`invoice_id`),
  ADD KEY `invoice_items_tax_id_foreign` (`tax_id`);

--
-- Indexes for table `invoice_settings`
--
ALTER TABLE `invoice_settings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `invoice_settings_company_id_foreign` (`company_id`);

--
-- Indexes for table `issues`
--
ALTER TABLE `issues`
  ADD PRIMARY KEY (`id`),
  ADD KEY `issues_user_id_foreign` (`user_id`),
  ADD KEY `issues_project_id_foreign` (`project_id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `language_settings`
--
ALTER TABLE `language_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `leads`
--
ALTER TABLE `leads`
  ADD PRIMARY KEY (`id`),
  ADD KEY `leads_company_id_foreign` (`company_id`);

--
-- Indexes for table `lead_files`
--
ALTER TABLE `lead_files`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lead_files_lead_id_foreign` (`lead_id`),
  ADD KEY `lead_files_user_id_foreign` (`user_id`),
  ADD KEY `lead_files_company_id_foreign` (`company_id`);

--
-- Indexes for table `lead_follow_up`
--
ALTER TABLE `lead_follow_up`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lead_follow_up_lead_id_foreign` (`lead_id`);

--
-- Indexes for table `lead_sources`
--
ALTER TABLE `lead_sources`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lead_sources_company_id_foreign` (`company_id`);

--
-- Indexes for table `lead_status`
--
ALTER TABLE `lead_status`
  ADD PRIMARY KEY (`id`),
  ADD KEY `lead_status_company_id_foreign` (`company_id`);

--
-- Indexes for table `leaves`
--
ALTER TABLE `leaves`
  ADD PRIMARY KEY (`id`),
  ADD KEY `leaves_user_id_foreign` (`user_id`),
  ADD KEY `leaves_leave_type_id_foreign` (`leave_type_id`),
  ADD KEY `leaves_company_id_foreign` (`company_id`);

--
-- Indexes for table `leave_types`
--
ALTER TABLE `leave_types`
  ADD PRIMARY KEY (`id`),
  ADD KEY `leave_types_company_id_foreign` (`company_id`);

--
-- Indexes for table `licences`
--
ALTER TABLE `licences`
  ADD PRIMARY KEY (`id`),
  ADD KEY `licences_company_id_foreign` (`company_id`),
  ADD KEY `licences_package_id_foreign` (`package_id`);

--
-- Indexes for table `log_time_for`
--
ALTER TABLE `log_time_for`
  ADD PRIMARY KEY (`id`),
  ADD KEY `log_time_for_company_id_foreign` (`company_id`);

--
-- Indexes for table `ltm_translations`
--
ALTER TABLE `ltm_translations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `message_settings`
--
ALTER TABLE `message_settings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `message_settings_company_id_foreign` (`company_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `modules`
--
ALTER TABLE `modules`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `module_settings`
--
ALTER TABLE `module_settings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `module_settings_company_id_foreign` (`company_id`);

--
-- Indexes for table `notices`
--
ALTER TABLE `notices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notices_company_id_foreign` (`company_id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`);

--
-- Indexes for table `offline_payment_methods`
--
ALTER TABLE `offline_payment_methods`
  ADD PRIMARY KEY (`id`),
  ADD KEY `offline_payment_methods_company_id_foreign` (`company_id`);

--
-- Indexes for table `packages`
--
ALTER TABLE `packages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `packages_currency_id_foreign` (`currency_id`);

--
-- Indexes for table `package_settings`
--
ALTER TABLE `package_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`),
  ADD KEY `password_resets_token_index` (`token`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `payments_transaction_id_unique` (`transaction_id`),
  ADD UNIQUE KEY `payments_plan_id_unique` (`plan_id`),
  ADD UNIQUE KEY `payments_event_id_unique` (`event_id`),
  ADD KEY `payments_currency_id_foreign` (`currency_id`),
  ADD KEY `payments_project_id_foreign` (`project_id`),
  ADD KEY `payments_invoice_id_foreign` (`invoice_id`),
  ADD KEY `payments_company_id_foreign` (`company_id`);

--
-- Indexes for table `payment_gateway_credentials`
--
ALTER TABLE `payment_gateway_credentials`
  ADD PRIMARY KEY (`id`),
  ADD KEY `payment_gateway_credentials_company_id_foreign` (`company_id`);

--
-- Indexes for table `paypal_invoices`
--
ALTER TABLE `paypal_invoices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `paypal_invoices_company_id_foreign` (`company_id`),
  ADD KEY `paypal_invoices_currency_id_foreign` (`currency_id`),
  ADD KEY `paypal_invoices_package_id_foreign` (`package_id`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_unique` (`name`),
  ADD KEY `permissions_module_id_foreign` (`module_id`);

--
-- Indexes for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `permission_role_role_id_foreign` (`role_id`);

--
-- Indexes for table `priority`
--
ALTER TABLE `priority`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_tax_id_foreign` (`tax_id`),
  ADD KEY `products_company_id_foreign` (`company_id`);

--
-- Indexes for table `projects`
--
ALTER TABLE `projects`
  ADD PRIMARY KEY (`id`),
  ADD KEY `projects_category_id_foreign` (`category_id`),
  ADD KEY `projects_client_id_foreign` (`client_id`),
  ADD KEY `projects_project_admin_foreign` (`project_admin`),
  ADD KEY `projects_company_id_foreign` (`company_id`);

--
-- Indexes for table `project_activity`
--
ALTER TABLE `project_activity`
  ADD PRIMARY KEY (`id`),
  ADD KEY `project_activity_project_id_foreign` (`project_id`),
  ADD KEY `project_activity_company_id_foreign` (`company_id`);

--
-- Indexes for table `project_category`
--
ALTER TABLE `project_category`
  ADD PRIMARY KEY (`id`),
  ADD KEY `project_category_company_id_foreign` (`company_id`);

--
-- Indexes for table `project_files`
--
ALTER TABLE `project_files`
  ADD PRIMARY KEY (`id`),
  ADD KEY `project_files_user_id_foreign` (`user_id`),
  ADD KEY `project_files_project_id_foreign` (`project_id`),
  ADD KEY `project_files_company_id_foreign` (`company_id`);

--
-- Indexes for table `project_members`
--
ALTER TABLE `project_members`
  ADD PRIMARY KEY (`id`),
  ADD KEY `project_members_project_id_foreign` (`project_id`),
  ADD KEY `project_members_user_id_foreign` (`user_id`),
  ADD KEY `project_members_company_id_foreign` (`company_id`);

--
-- Indexes for table `project_templates`
--
ALTER TABLE `project_templates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `project_templates_category_id_foreign` (`category_id`),
  ADD KEY `project_templates_client_id_foreign` (`client_id`),
  ADD KEY `project_templates_company_id_foreign` (`company_id`);

--
-- Indexes for table `project_template_members`
--
ALTER TABLE `project_template_members`
  ADD PRIMARY KEY (`id`),
  ADD KEY `project_template_members_user_id_foreign` (`user_id`),
  ADD KEY `project_template_members_project_template_id_foreign` (`project_template_id`);

--
-- Indexes for table `project_template_tasks`
--
ALTER TABLE `project_template_tasks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `project_template_tasks_user_id_foreign` (`user_id`),
  ADD KEY `project_template_tasks_project_template_id_foreign` (`project_template_id`);

--
-- Indexes for table `project_time_logs`
--
ALTER TABLE `project_time_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `project_time_logs_edited_by_user_foreign` (`edited_by_user`),
  ADD KEY `project_time_logs_project_id_foreign` (`project_id`),
  ADD KEY `project_time_logs_user_id_foreign` (`user_id`),
  ADD KEY `project_time_logs_task_id_foreign` (`task_id`),
  ADD KEY `project_time_logs_company_id_foreign` (`company_id`);

--
-- Indexes for table `proposals`
--
ALTER TABLE `proposals`
  ADD PRIMARY KEY (`id`),
  ADD KEY `proposals_lead_id_foreign` (`lead_id`),
  ADD KEY `proposals_currency_id_foreign` (`currency_id`),
  ADD KEY `proposals_company_id_foreign` (`company_id`);

--
-- Indexes for table `proposal_items`
--
ALTER TABLE `proposal_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `proposal_items_proposal_id_foreign` (`proposal_id`),
  ADD KEY `proposal_items_tax_id_foreign` (`tax_id`);

--
-- Indexes for table `push_notification_settings`
--
ALTER TABLE `push_notification_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `push_subscriptions`
--
ALTER TABLE `push_subscriptions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `push_subscriptions_endpoint_unique` (`endpoint`),
  ADD KEY `push_subscriptions_user_id_index` (`user_id`);

--
-- Indexes for table `quotations`
--
ALTER TABLE `quotations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `quotation_items`
--
ALTER TABLE `quotation_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `quotation_items_quotation_id_foreign` (`quotation_id`);

--
-- Indexes for table `recurrence_patterns`
--
ALTER TABLE `recurrence_patterns`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `roles_company_id_foreign` (`company_id`);

--
-- Indexes for table `role_user`
--
ALTER TABLE `role_user`
  ADD PRIMARY KEY (`user_id`,`role_id`),
  ADD KEY `role_user_role_id_foreign` (`role_id`);

--
-- Indexes for table `skills`
--
ALTER TABLE `skills`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `slack_settings`
--
ALTER TABLE `slack_settings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `slack_settings_company_id_foreign` (`company_id`);

--
-- Indexes for table `smtp_settings`
--
ALTER TABLE `smtp_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sticky_notes`
--
ALTER TABLE `sticky_notes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sticky_notes_user_id_foreign` (`user_id`);

--
-- Indexes for table `stripe_invoices`
--
ALTER TABLE `stripe_invoices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `stripe_invoices_company_id_foreign` (`company_id`),
  ADD KEY `stripe_invoices_package_id_foreign` (`package_id`);

--
-- Indexes for table `stripe_setting`
--
ALTER TABLE `stripe_setting`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subscriptions`
--
ALTER TABLE `subscriptions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sub_tasks`
--
ALTER TABLE `sub_tasks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sub_tasks_task_id_foreign` (`task_id`);

--
-- Indexes for table `taskboard_columns`
--
ALTER TABLE `taskboard_columns`
  ADD PRIMARY KEY (`id`),
  ADD KEY `taskboard_columns_company_id_foreign` (`company_id`);

--
-- Indexes for table `tasks`
--
ALTER TABLE `tasks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tasks_project_id_foreign` (`project_id`),
  ADD KEY `tasks_board_column_id_foreign` (`board_column_id`),
  ADD KEY `tasks_company_id_foreign` (`company_id`),
  ADD KEY `tasks_task_category_id_foreign` (`task_category_id`),
  ADD KEY `tasks_created_by_foreign` (`created_by`);

--
-- Indexes for table `task_category`
--
ALTER TABLE `task_category`
  ADD PRIMARY KEY (`id`),
  ADD KEY `task_category_company_id_foreign` (`company_id`);

--
-- Indexes for table `task_comments`
--
ALTER TABLE `task_comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `task_comments_user_id_foreign` (`user_id`),
  ADD KEY `task_comments_task_id_foreign` (`task_id`);

--
-- Indexes for table `task_recurrence_patterns`
--
ALTER TABLE `task_recurrence_patterns`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `taxes`
--
ALTER TABLE `taxes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `taxes_company_id_foreign` (`company_id`);

--
-- Indexes for table `teams`
--
ALTER TABLE `teams`
  ADD PRIMARY KEY (`id`),
  ADD KEY `teams_company_id_foreign` (`company_id`);

--
-- Indexes for table `tests`
--
ALTER TABLE `tests`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `theme_settings`
--
ALTER TABLE `theme_settings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `theme_settings_company_id_foreign` (`company_id`);

--
-- Indexes for table `tickets`
--
ALTER TABLE `tickets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tickets_user_id_foreign` (`user_id`),
  ADD KEY `tickets_agent_id_foreign` (`agent_id`),
  ADD KEY `tickets_channel_id_foreign` (`channel_id`),
  ADD KEY `tickets_type_id_foreign` (`type_id`),
  ADD KEY `tickets_company_id_foreign` (`company_id`);

--
-- Indexes for table `ticket_agent_groups`
--
ALTER TABLE `ticket_agent_groups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ticket_agent_groups_agent_id_foreign` (`agent_id`),
  ADD KEY `ticket_agent_groups_group_id_foreign` (`group_id`),
  ADD KEY `ticket_agent_groups_company_id_foreign` (`company_id`);

--
-- Indexes for table `ticket_channels`
--
ALTER TABLE `ticket_channels`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ticket_channels_company_id_foreign` (`company_id`);

--
-- Indexes for table `ticket_groups`
--
ALTER TABLE `ticket_groups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ticket_groups_company_id_foreign` (`company_id`);

--
-- Indexes for table `ticket_replies`
--
ALTER TABLE `ticket_replies`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ticket_replies_ticket_id_foreign` (`ticket_id`),
  ADD KEY `ticket_replies_user_id_foreign` (`user_id`);

--
-- Indexes for table `ticket_reply_templates`
--
ALTER TABLE `ticket_reply_templates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ticket_reply_templates_company_id_foreign` (`company_id`);

--
-- Indexes for table `ticket_tags`
--
ALTER TABLE `ticket_tags`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ticket_tags_tag_id_foreign` (`tag_id`),
  ADD KEY `ticket_tags_ticket_id_foreign` (`ticket_id`);

--
-- Indexes for table `ticket_tag_list`
--
ALTER TABLE `ticket_tag_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ticket_types`
--
ALTER TABLE `ticket_types`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ticket_types_company_id_foreign` (`company_id`);

--
-- Indexes for table `universal_search`
--
ALTER TABLE `universal_search`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_company_id_foreign` (`company_id`);

--
-- Indexes for table `users_chat`
--
ALTER TABLE `users_chat`
  ADD PRIMARY KEY (`id`),
  ADD KEY `users_chat_user_one_foreign` (`user_one`),
  ADD KEY `users_chat_user_id_foreign` (`user_id`),
  ADD KEY `users_chat_from_foreign` (`from`),
  ADD KEY `users_chat_to_foreign` (`to`);

--
-- Indexes for table `user_activities`
--
ALTER TABLE `user_activities`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_activities_user_id_foreign` (`user_id`),
  ADD KEY `user_activities_company_id_foreign` (`company_id`);

--
-- Indexes for table `view_arrays`
--
ALTER TABLE `view_arrays`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `attendances`
--
ALTER TABLE `attendances`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `attendance_settings`
--
ALTER TABLE `attendance_settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `client_contacts`
--
ALTER TABLE `client_contacts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `client_details`
--
ALTER TABLE `client_details`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `companies`
--
ALTER TABLE `companies`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `conversation`
--
ALTER TABLE `conversation`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `conversation_reply`
--
ALTER TABLE `conversation_reply`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=240;

--
-- AUTO_INCREMENT for table `currencies`
--
ALTER TABLE `currencies`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `custom_fields`
--
ALTER TABLE `custom_fields`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `custom_fields_data`
--
ALTER TABLE `custom_fields_data`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `custom_field_groups`
--
ALTER TABLE `custom_field_groups`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `email_notification_settings`
--
ALTER TABLE `email_notification_settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=77;

--
-- AUTO_INCREMENT for table `employee_details`
--
ALTER TABLE `employee_details`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `employee_docs`
--
ALTER TABLE `employee_docs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `employee_skills`
--
ALTER TABLE `employee_skills`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `employee_teams`
--
ALTER TABLE `employee_teams`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `estimates`
--
ALTER TABLE `estimates`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `estimate_items`
--
ALTER TABLE `estimate_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `events`
--
ALTER TABLE `events`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `event_attendees`
--
ALTER TABLE `event_attendees`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `expenses`
--
ALTER TABLE `expenses`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `features`
--
ALTER TABLE `features`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `file_storage_settings`
--
ALTER TABLE `file_storage_settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `front_details`
--
ALTER TABLE `front_details`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `global_currencies`
--
ALTER TABLE `global_currencies`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `global_settings`
--
ALTER TABLE `global_settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `holidays`
--
ALTER TABLE `holidays`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `invoices`
--
ALTER TABLE `invoices`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `invoice_items`
--
ALTER TABLE `invoice_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `invoice_settings`
--
ALTER TABLE `invoice_settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `issues`
--
ALTER TABLE `issues`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `language_settings`
--
ALTER TABLE `language_settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `leads`
--
ALTER TABLE `leads`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `lead_files`
--
ALTER TABLE `lead_files`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `lead_follow_up`
--
ALTER TABLE `lead_follow_up`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `lead_sources`
--
ALTER TABLE `lead_sources`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `lead_status`
--
ALTER TABLE `lead_status`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `leaves`
--
ALTER TABLE `leaves`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `leave_types`
--
ALTER TABLE `leave_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `licences`
--
ALTER TABLE `licences`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `log_time_for`
--
ALTER TABLE `log_time_for`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `ltm_translations`
--
ALTER TABLE `ltm_translations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `message_settings`
--
ALTER TABLE `message_settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=327;

--
-- AUTO_INCREMENT for table `modules`
--
ALTER TABLE `modules`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `module_settings`
--
ALTER TABLE `module_settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=539;

--
-- AUTO_INCREMENT for table `notices`
--
ALTER TABLE `notices`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `offline_payment_methods`
--
ALTER TABLE `offline_payment_methods`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `packages`
--
ALTER TABLE `packages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `package_settings`
--
ALTER TABLE `package_settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payment_gateway_credentials`
--
ALTER TABLE `payment_gateway_credentials`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `paypal_invoices`
--
ALTER TABLE `paypal_invoices`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;

--
-- AUTO_INCREMENT for table `priority`
--
ALTER TABLE `priority`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `projects`
--
ALTER TABLE `projects`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `project_activity`
--
ALTER TABLE `project_activity`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `project_category`
--
ALTER TABLE `project_category`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `project_files`
--
ALTER TABLE `project_files`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `project_members`
--
ALTER TABLE `project_members`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `project_templates`
--
ALTER TABLE `project_templates`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `project_template_members`
--
ALTER TABLE `project_template_members`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `project_template_tasks`
--
ALTER TABLE `project_template_tasks`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `project_time_logs`
--
ALTER TABLE `project_time_logs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `proposals`
--
ALTER TABLE `proposals`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `proposal_items`
--
ALTER TABLE `proposal_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `push_notification_settings`
--
ALTER TABLE `push_notification_settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `push_subscriptions`
--
ALTER TABLE `push_subscriptions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `quotations`
--
ALTER TABLE `quotations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `quotation_items`
--
ALTER TABLE `quotation_items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `recurrence_patterns`
--
ALTER TABLE `recurrence_patterns`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `skills`
--
ALTER TABLE `skills`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `slack_settings`
--
ALTER TABLE `slack_settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `smtp_settings`
--
ALTER TABLE `smtp_settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sticky_notes`
--
ALTER TABLE `sticky_notes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `stripe_invoices`
--
ALTER TABLE `stripe_invoices`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `stripe_setting`
--
ALTER TABLE `stripe_setting`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `subscriptions`
--
ALTER TABLE `subscriptions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sub_tasks`
--
ALTER TABLE `sub_tasks`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `taskboard_columns`
--
ALTER TABLE `taskboard_columns`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `tasks`
--
ALTER TABLE `tasks`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=210;

--
-- AUTO_INCREMENT for table `task_category`
--
ALTER TABLE `task_category`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `task_comments`
--
ALTER TABLE `task_comments`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `task_recurrence_patterns`
--
ALTER TABLE `task_recurrence_patterns`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=171;

--
-- AUTO_INCREMENT for table `taxes`
--
ALTER TABLE `taxes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `teams`
--
ALTER TABLE `teams`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tests`
--
ALTER TABLE `tests`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `theme_settings`
--
ALTER TABLE `theme_settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `tickets`
--
ALTER TABLE `tickets`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ticket_agent_groups`
--
ALTER TABLE `ticket_agent_groups`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ticket_channels`
--
ALTER TABLE `ticket_channels`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `ticket_groups`
--
ALTER TABLE `ticket_groups`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `ticket_replies`
--
ALTER TABLE `ticket_replies`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ticket_reply_templates`
--
ALTER TABLE `ticket_reply_templates`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ticket_tags`
--
ALTER TABLE `ticket_tags`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ticket_tag_list`
--
ALTER TABLE `ticket_tag_list`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ticket_types`
--
ALTER TABLE `ticket_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `universal_search`
--
ALTER TABLE `universal_search`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=76;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `users_chat`
--
ALTER TABLE `users_chat`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_activities`
--
ALTER TABLE `user_activities`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
