-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Dec 18, 2022 at 10:31 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hackerproject`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add users', 2, 'add_users'),
(6, 'Can change users', 2, 'change_users'),
(7, 'Can delete users', 2, 'delete_users'),
(8, 'Can view users', 2, 'view_users'),
(9, 'Can add permission', 3, 'add_permission'),
(10, 'Can change permission', 3, 'change_permission'),
(11, 'Can delete permission', 3, 'delete_permission'),
(12, 'Can view permission', 3, 'view_permission'),
(13, 'Can add group', 4, 'add_group'),
(14, 'Can change group', 4, 'change_group'),
(15, 'Can delete group', 4, 'delete_group'),
(16, 'Can view group', 4, 'view_group'),
(17, 'Can add user', 5, 'add_user'),
(18, 'Can change user', 5, 'change_user'),
(19, 'Can delete user', 5, 'delete_user'),
(20, 'Can view user', 5, 'view_user'),
(21, 'Can add content type', 6, 'add_contenttype'),
(22, 'Can change content type', 6, 'change_contenttype'),
(23, 'Can delete content type', 6, 'delete_contenttype'),
(24, 'Can view content type', 6, 'view_contenttype'),
(25, 'Can add listener form', 7, 'add_listenerform'),
(26, 'Can change listener form', 7, 'change_listenerform'),
(27, 'Can delete listener form', 7, 'delete_listenerform'),
(28, 'Can view listener form', 7, 'view_listenerform'),
(29, 'Can add agent', 8, 'add_agent'),
(30, 'Can change agent', 8, 'change_agent'),
(31, 'Can delete agent', 8, 'delete_agent'),
(32, 'Can view agent', 8, 'view_agent'),
(33, 'Can add session', 9, 'add_session'),
(34, 'Can change session', 9, 'change_session'),
(35, 'Can delete session', 9, 'delete_session'),
(36, 'Can view session', 9, 'view_session'),
(37, 'Can add modules', 10, 'add_modules'),
(38, 'Can change modules', 10, 'change_modules'),
(39, 'Can delete modules', 10, 'delete_modules'),
(40, 'Can view modules', 10, 'view_modules');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$260000$bbc3b7Qe1mhceos3O5Bnx5$nkrO67Nb81krqb4/H0Oa1eFpa2C4WC585ioDJtwdUO0=', '2022-12-18 21:25:24.161847', 1, 'admin', '', '', 'admin@gmail.com', 1, 1, '2022-10-20 10:10:02.435570'),
(2, 'pbkdf2_sha256$390000$VcJyCcXjTw3BLzdoAFOs4l$vzeQ5BNSBrTDnreTIz0Ivyaf8+BHyD0XtSvRGsb8M80=', '2022-10-21 18:01:51.788209', 1, 'tamer', '', '', 'tamer@gmail.com', 1, 1, '2022-10-21 18:00:11.000000'),
(3, 'pbkdf2_sha256$390000$rBKtztMUtF8v2WViZlwh44$xM7mHlGyOQe+JHSXq2wLKha8Woj7XOpOR4D2aj+zJGY=', NULL, 0, 'rana', '', '', 'rana@gmail.com', 0, 1, '2022-10-21 18:41:06.000000');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `blog_agent`
--

CREATE TABLE `blog_agent` (
  `id` bigint(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `ip` varchar(100) NOT NULL,
  `hname` varchar(100) NOT NULL,
  `created_date` datetime(6) NOT NULL,
  `updated_date` date NOT NULL,
  `username` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `blog_agent`
--

INSERT INTO `blog_agent` (`id`, `name`, `ip`, `hname`, `created_date`, `updated_date`, `username`) VALUES
(5, 'DMRBGY', '192.168.250.3', 'DESKTOP-1QDAKG8', '2022-12-15 15:50:29.567477', '2022-12-17', 'Moham'),
(6, 'NGFZPH', '192.168.250.144', 'DESKTOP-GR51O7C', '2022-12-15 21:38:15.049385', '2022-12-15', 'AbdulazizAladdinAli');

-- --------------------------------------------------------

--
-- Table structure for table `blog_listenerform`
--

CREATE TABLE `blog_listenerform` (
  `id` bigint(20) NOT NULL,
  `interface` varchar(100) NOT NULL,
  `created_date` datetime(6) NOT NULL,
  `stoped_date` datetime(6) DEFAULT NULL,
  `ip` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `blog_listenerform`
--

INSERT INTO `blog_listenerform` (`id`, `interface`, `created_date`, `stoped_date`, `ip`) VALUES
(33, 'eth0', '2022-12-15 13:32:14.568341', NULL, '192.168.250.252');

-- --------------------------------------------------------

--
-- Table structure for table `blog_modules`
--

CREATE TABLE `blog_modules` (
  `id` bigint(20) NOT NULL,
  `module_name` varchar(200) NOT NULL,
  `module_type` int(11) NOT NULL,
  `created_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `blog_modules`
--

INSERT INTO `blog_modules` (`id`, `module_name`, `module_type`, `created_date`) VALUES
(1, 'Applocker', 1, '2022-11-30 18:26:02.783229'),
(2, 'DirectoryListing', 1, '2022-11-30 18:26:14.992253'),
(3, 'Download', 1, '2022-11-30 18:26:34.543678'),
(4, 'env_var', 1, '2022-11-30 18:27:04.836591'),
(5, 'Phrase_finder', 1, '2022-11-30 18:27:15.390513'),
(6, 'IPs', 1, '2022-11-30 18:27:31.477543'),
(7, 'logged_users', 1, '2022-11-30 18:27:41.200079'),
(8, 'Net_Connections', 1, '2022-11-30 18:27:49.279695'),
(9, 'Programs', 1, '2022-11-30 18:28:06.727387'),
(10, 'processes', 1, '2022-11-30 18:28:15.465485'),
(11, 'screenshot', 1, '2022-11-30 18:28:41.519129'),
(12, 'user_info', 1, '2022-11-30 18:29:12.336266'),
(13, 'Systeminfo', 1, '2022-11-30 18:29:21.325056'),
(14, 'Updates', 1, '2022-11-30 18:29:46.847832'),
(15, 'Upload', 1, '2022-11-30 18:29:55.945993'),
(16, 'WinDefStat', 1, '2022-11-30 18:30:05.703401'),
(17, 'Named_pipes', 1, '2022-12-08 16:56:34.506216'),
(18, 'juicypotato', 1, '2022-12-08 16:57:03.065772'),
(19, 'Apache', 2, '2022-12-08 17:11:11.724291'),
(20, 'Available Shell', 2, '2022-12-08 17:11:50.364717'),
(21, 'Cronjobs', 2, '2022-12-08 17:12:04.265437'),
(22, 'Hidden Files', 2, '2022-12-08 17:17:38.682779'),
(23, 'Lsof', 2, '2022-12-08 17:18:48.406120'),
(24, 'OS info', 2, '2022-12-08 17:19:12.653008'),
(25, 'Processes', 2, '2022-12-08 17:19:34.693143'),
(26, 'Selinux', 2, '2022-12-08 17:19:54.149273'),
(27, 'SpecialPermissions', 2, '2022-12-08 17:20:08.475925'),
(28, 'TCP_UDP', 2, '2022-12-08 17:20:19.301327'),
(29, 'usr_priv', 2, '2022-12-08 17:21:20.412562'),
(30, 'Usrs info', 2, '2022-12-08 17:21:34.429383'),
(31, 'Whoami', 2, '2022-12-08 17:21:49.652072'),
(32, 'ACCsforKerb', 3, '2022-12-15 10:37:41.311403'),
(33, 'ACC_listing', 3, '2022-12-15 10:37:52.716298'),
(34, 'adapter', 3, '2022-12-15 10:38:31.926101'),
(35, 'ArpTable', 3, '2022-12-15 10:38:58.079113'),
(36, 'DefenseCheck', 3, '2022-12-15 10:40:55.564223'),
(37, 'DomainInfo', 3, '2022-12-15 10:41:09.296096'),
(38, 'DomainUsers', 3, '2022-12-15 10:41:20.009499'),
(39, 'DownloadWindows', 3, '2022-12-15 10:43:19.652034'),
(40, 'EnvValue', 3, '2022-12-15 10:43:42.971482'),
(41, 'GroupsListing', 3, '2022-12-15 10:46:45.783833'),
(42, 'Groups', 3, '2022-12-15 10:47:02.101555'),
(43, 'HotFixes', 3, '2022-12-15 10:48:15.659150'),
(44, 'Ip4Route', 3, '2022-12-15 10:48:46.553516'),
(45, 'ListExecPolicies', 3, '2022-12-15 10:49:09.896642'),
(46, 'ListingModules', 3, '2022-12-15 10:49:57.328136'),
(47, 'DefenseCheck', 3, '2022-12-15 10:50:16.070901'),
(48, 'SysaccListing', 3, '2022-12-15 10:52:16.025370'),
(49, 'TrustMap', 3, '2022-12-15 10:52:28.196381'),
(50, 'TrustRelation', 3, '2022-12-15 10:52:39.049673'),
(51, 'LinuxChangeDirectory', 2, '2022-12-18 23:21:32.341000'),
(52, 'LinuxChmod', 2, '2022-12-18 21:25:46.204611'),
(53, 'Linuxcp', 2, '2022-12-18 21:26:08.152148'),
(54, 'Linuxgcc', 2, '2022-12-18 21:26:19.608549'),
(55, 'LinuxDirectoryListing_Details', 2, '2022-12-18 21:26:28.874146'),
(56, 'LinuxDirectoryListing', 2, '2022-12-18 21:26:38.364323'),
(57, 'LinuxMakeDirectory', 2, '2022-12-18 21:27:06.284330'),
(58, 'LinuxNetdiscover', 2, '2022-12-18 21:27:15.132191'),
(59, 'LinuxTouch', 2, '2022-12-18 21:27:24.934685'),
(60, 'LinuxBash', 2, '2022-12-18 21:27:39.662675'),
(61, 'LinuxWfuzz', 2, '2022-12-18 21:30:47.504490'),
(62, 'ExecuteCommandWithSpecUser', 2, '2022-12-18 21:31:03.311151');

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2022-10-20 11:50:46.597770', '1', 'ListenerForm object (1)', 1, '[{\"added\": {}}]', 7, 1),
(2, '2022-10-20 11:51:04.250933', '1', 'ListenerForm object (1)', 3, '', 7, 1),
(3, '2022-10-20 12:37:20.412558', '2', 'ListenerForm object (2)', 1, '[{\"added\": {}}]', 7, 1),
(4, '2022-10-20 13:18:12.551865', '2', 'ListenerForm object (2)', 3, '', 7, 1),
(5, '2022-10-20 13:54:16.939821', '3', 'ListenerForm object (3)', 1, '[{\"added\": {}}]', 7, 1),
(6, '2022-10-20 14:04:13.649079', '3', 'ListenerForm object (3)', 3, '', 7, 1),
(7, '2022-10-20 14:04:17.422237', '4', 'ListenerForm object (4)', 3, '', 7, 1),
(8, '2022-10-20 20:41:44.272795', '5', 'ListenerForm object (5)', 3, '', 7, 1),
(9, '2022-10-20 20:41:44.284764', '6', 'ListenerForm object (6)', 3, '', 7, 1),
(10, '2022-10-21 18:00:39.013807', '2', 'tamer', 2, '[{\"changed\": {\"fields\": [\"Superuser status\"]}}]', 5, 1),
(11, '2022-10-21 18:01:35.128352', '2', 'tamer', 2, '[{\"changed\": {\"fields\": [\"Staff status\"]}}]', 5, 1),
(12, '2022-10-21 18:41:30.923148', '3', 'rana', 2, '[{\"changed\": {\"fields\": [\"Staff status\", \"Superuser status\"]}}]', 5, 1),
(13, '2022-10-21 18:42:11.080390', '3', 'rana', 2, '[{\"changed\": {\"fields\": [\"Staff status\", \"Superuser status\"]}}]', 5, 1),
(14, '2022-11-30 18:26:02.785228', '1', 'Modules object (1)', 1, '[{\"added\": {}}]', 10, 1),
(15, '2022-11-30 18:26:14.993254', '2', 'Modules object (2)', 1, '[{\"added\": {}}]', 10, 1),
(16, '2022-11-30 18:26:34.544678', '3', 'Modules object (3)', 1, '[{\"added\": {}}]', 10, 1),
(17, '2022-11-30 18:26:45.448295', '2', 'Modules object (2)', 2, '[{\"changed\": {\"fields\": [\"Module type\"]}}]', 10, 1),
(18, '2022-11-30 18:27:04.837587', '4', 'Modules object (4)', 1, '[{\"added\": {}}]', 10, 1),
(19, '2022-11-30 18:27:15.391493', '5', 'Modules object (5)', 1, '[{\"added\": {}}]', 10, 1),
(20, '2022-11-30 18:27:31.478543', '6', 'Modules object (6)', 1, '[{\"added\": {}}]', 10, 1),
(21, '2022-11-30 18:27:41.202071', '7', 'Modules object (7)', 1, '[{\"added\": {}}]', 10, 1),
(22, '2022-11-30 18:27:49.280710', '8', 'Modules object (8)', 1, '[{\"added\": {}}]', 10, 1),
(23, '2022-11-30 18:28:06.729385', '9', 'Modules object (9)', 1, '[{\"added\": {}}]', 10, 1),
(24, '2022-11-30 18:28:15.466510', '10', 'Modules object (10)', 1, '[{\"added\": {}}]', 10, 1),
(25, '2022-11-30 18:28:41.520143', '11', 'Modules object (11)', 1, '[{\"added\": {}}]', 10, 1),
(26, '2022-11-30 18:29:12.337269', '12', 'Modules object (12)', 1, '[{\"added\": {}}]', 10, 1),
(27, '2022-11-30 18:29:21.326056', '13', 'Modules object (13)', 1, '[{\"added\": {}}]', 10, 1),
(28, '2022-11-30 18:29:46.848830', '14', 'Modules object (14)', 1, '[{\"added\": {}}]', 10, 1),
(29, '2022-11-30 18:29:55.947982', '15', 'Modules object (15)', 1, '[{\"added\": {}}]', 10, 1),
(30, '2022-11-30 18:30:05.704414', '16', 'Modules object (16)', 1, '[{\"added\": {}}]', 10, 1),
(31, '2022-11-30 22:23:27.143293', '7', 'ListenerForm object (7)', 3, '', 7, 1),
(32, '2022-11-30 22:23:27.151225', '8', 'ListenerForm object (8)', 3, '', 7, 1),
(33, '2022-11-30 22:23:27.154209', '9', 'ListenerForm object (9)', 3, '', 7, 1),
(34, '2022-11-30 22:23:27.159208', '10', 'ListenerForm object (10)', 3, '', 7, 1),
(35, '2022-11-30 22:23:27.162209', '11', 'ListenerForm object (11)', 3, '', 7, 1),
(36, '2022-12-08 16:56:34.507216', '17', 'Modules object (17)', 1, '[{\"added\": {}}]', 10, 1),
(37, '2022-12-08 16:57:03.066785', '18', 'Modules object (18)', 1, '[{\"added\": {}}]', 10, 1),
(38, '2022-12-08 17:11:11.726291', '19', 'Modules object (19)', 1, '[{\"added\": {}}]', 10, 1),
(39, '2022-12-08 17:11:50.365903', '20', 'Modules object (20)', 1, '[{\"added\": {}}]', 10, 1),
(40, '2022-12-08 17:12:04.265437', '21', 'Modules object (21)', 1, '[{\"added\": {}}]', 10, 1),
(41, '2022-12-08 17:17:38.686461', '22', 'Modules object (22)', 1, '[{\"added\": {}}]', 10, 1),
(42, '2022-12-08 17:18:48.407119', '23', 'Modules object (23)', 1, '[{\"added\": {}}]', 10, 1),
(43, '2022-12-08 17:19:12.654009', '24', 'Modules object (24)', 1, '[{\"added\": {}}]', 10, 1),
(44, '2022-12-08 17:19:34.693143', '25', 'Modules object (25)', 1, '[{\"added\": {}}]', 10, 1),
(45, '2022-12-08 17:19:54.150275', '26', 'Modules object (26)', 1, '[{\"added\": {}}]', 10, 1),
(46, '2022-12-08 17:20:08.477130', '27', 'Modules object (27)', 1, '[{\"added\": {}}]', 10, 1),
(47, '2022-12-08 17:20:19.302327', '28', 'Modules object (28)', 1, '[{\"added\": {}}]', 10, 1),
(48, '2022-12-08 17:21:20.413562', '29', 'Modules object (29)', 1, '[{\"added\": {}}]', 10, 1),
(49, '2022-12-08 17:21:34.431386', '30', 'Modules object (30)', 1, '[{\"added\": {}}]', 10, 1),
(50, '2022-12-08 17:21:49.653070', '31', 'Modules object (31)', 1, '[{\"added\": {}}]', 10, 1),
(51, '2022-12-08 22:18:54.394908', '12', 'ListenerForm object (12)', 3, '', 7, 1),
(52, '2022-12-08 22:18:54.398904', '13', 'ListenerForm object (13)', 3, '', 7, 1),
(53, '2022-12-08 22:18:54.402905', '14', 'ListenerForm object (14)', 3, '', 7, 1),
(54, '2022-12-08 22:18:54.405905', '15', 'ListenerForm object (15)', 3, '', 7, 1),
(55, '2022-12-08 22:18:54.409905', '16', 'ListenerForm object (16)', 3, '', 7, 1),
(56, '2022-12-08 22:18:54.413592', '17', 'ListenerForm object (17)', 3, '', 7, 1),
(57, '2022-12-08 22:18:54.416547', '18', 'ListenerForm object (18)', 3, '', 7, 1),
(58, '2022-12-08 22:18:54.420547', '19', 'ListenerForm object (19)', 3, '', 7, 1),
(59, '2022-12-08 22:18:54.424547', '20', 'ListenerForm object (20)', 3, '', 7, 1),
(60, '2022-12-08 22:18:54.427549', '21', 'ListenerForm object (21)', 3, '', 7, 1),
(61, '2022-12-13 16:05:13.792654', '1', 'Agent object (1)', 1, '[{\"added\": {}}]', 8, 1),
(62, '2022-12-13 16:06:08.773981', '1', 'Agent object (1)', 3, '', 8, 1),
(63, '2022-12-13 16:06:45.262209', '22', 'ListenerForm object (22)', 3, '', 7, 1),
(64, '2022-12-13 16:06:45.274172', '23', 'ListenerForm object (23)', 3, '', 7, 1),
(65, '2022-12-13 16:06:45.277171', '24', 'ListenerForm object (24)', 3, '', 7, 1),
(66, '2022-12-13 16:06:45.280169', '25', 'ListenerForm object (25)', 3, '', 7, 1),
(67, '2022-12-13 16:06:45.284176', '26', 'ListenerForm object (26)', 3, '', 7, 1),
(68, '2022-12-13 16:06:45.287170', '27', 'ListenerForm object (27)', 3, '', 7, 1),
(69, '2022-12-13 16:06:45.290170', '28', 'ListenerForm object (28)', 3, '', 7, 1),
(70, '2022-12-13 16:06:45.295170', '29', 'ListenerForm object (29)', 3, '', 7, 1),
(71, '2022-12-13 16:06:45.298175', '30', 'ListenerForm object (30)', 3, '', 7, 1),
(72, '2022-12-15 10:37:41.311403', '32', 'Modules object (32)', 1, '[{\"added\": {}}]', 10, 1),
(73, '2022-12-15 10:37:52.718302', '33', 'Modules object (33)', 1, '[{\"added\": {}}]', 10, 1),
(74, '2022-12-15 10:38:31.927099', '34', 'Modules object (34)', 1, '[{\"added\": {}}]', 10, 1),
(75, '2022-12-15 10:38:58.080801', '35', 'Modules object (35)', 1, '[{\"added\": {}}]', 10, 1),
(76, '2022-12-15 10:40:22.449796', '35', 'Modules object (35)', 2, '[{\"changed\": {\"fields\": [\"Module name\"]}}]', 10, 1),
(77, '2022-12-15 10:40:55.564223', '36', 'Modules object (36)', 1, '[{\"added\": {}}]', 10, 1),
(78, '2022-12-15 10:41:09.297096', '37', 'Modules object (37)', 1, '[{\"added\": {}}]', 10, 1),
(79, '2022-12-15 10:41:20.009499', '38', 'Modules object (38)', 1, '[{\"added\": {}}]', 10, 1),
(80, '2022-12-15 10:43:19.654688', '39', 'Modules object (39)', 1, '[{\"added\": {}}]', 10, 1),
(81, '2022-12-15 10:43:42.971482', '40', 'Modules object (40)', 1, '[{\"added\": {}}]', 10, 1),
(82, '2022-12-15 10:44:51.438967', '31', 'ListenerForm object (31)', 1, '[{\"added\": {}}]', 7, 1),
(83, '2022-12-15 10:45:01.454617', '32', 'ListenerForm object (32)', 1, '[{\"added\": {}}]', 7, 1),
(84, '2022-12-15 10:45:17.315539', '31', 'ListenerForm object (31)', 3, '', 7, 1),
(85, '2022-12-15 10:45:24.695870', '32', 'ListenerForm object (32)', 3, '', 7, 1),
(86, '2022-12-15 10:46:45.783833', '41', 'Modules object (41)', 1, '[{\"added\": {}}]', 10, 1),
(87, '2022-12-15 10:47:02.101555', '42', 'Modules object (42)', 1, '[{\"added\": {}}]', 10, 1),
(88, '2022-12-15 10:48:15.660592', '43', 'Modules object (43)', 1, '[{\"added\": {}}]', 10, 1),
(89, '2022-12-15 10:48:46.555255', '44', 'Modules object (44)', 1, '[{\"added\": {}}]', 10, 1),
(90, '2022-12-15 10:49:09.896642', '45', 'Modules object (45)', 1, '[{\"added\": {}}]', 10, 1),
(91, '2022-12-15 10:49:57.329142', '46', 'Modules object (46)', 1, '[{\"added\": {}}]', 10, 1),
(92, '2022-12-15 10:50:16.072694', '47', 'Modules object (47)', 1, '[{\"added\": {}}]', 10, 1),
(93, '2022-12-15 10:52:16.035628', '48', 'Modules object (48)', 1, '[{\"added\": {}}]', 10, 1),
(94, '2022-12-15 10:52:28.198380', '49', 'Modules object (49)', 1, '[{\"added\": {}}]', 10, 1),
(95, '2022-12-15 10:52:39.050674', '50', 'Modules object (50)', 1, '[{\"added\": {}}]', 10, 1),
(96, '2022-12-15 15:42:16.374892', '4', 'Agent object (4)', 3, '', 8, 1),
(97, '2022-12-15 15:42:16.398069', '3', 'Agent object (3)', 3, '', 8, 1),
(98, '2022-12-15 15:42:16.416381', '2', 'Agent object (2)', 3, '', 8, 1),
(99, '2022-12-18 21:25:46.206252', '52', 'Modules object (52)', 1, '[{\"added\": {}}]', 10, 1),
(100, '2022-12-18 21:26:08.154898', '53', 'Modules object (53)', 1, '[{\"added\": {}}]', 10, 1),
(101, '2022-12-18 21:26:19.610124', '54', 'Modules object (54)', 1, '[{\"added\": {}}]', 10, 1),
(102, '2022-12-18 21:26:28.876018', '55', 'Modules object (55)', 1, '[{\"added\": {}}]', 10, 1),
(103, '2022-12-18 21:26:38.367864', '56', 'Modules object (56)', 1, '[{\"added\": {}}]', 10, 1),
(104, '2022-12-18 21:27:06.285852', '57', 'Modules object (57)', 1, '[{\"added\": {}}]', 10, 1),
(105, '2022-12-18 21:27:15.133962', '58', 'Modules object (58)', 1, '[{\"added\": {}}]', 10, 1),
(106, '2022-12-18 21:27:24.936078', '59', 'Modules object (59)', 1, '[{\"added\": {}}]', 10, 1),
(107, '2022-12-18 21:27:39.664126', '60', 'Modules object (60)', 1, '[{\"added\": {}}]', 10, 1),
(108, '2022-12-18 21:30:47.506313', '61', 'Modules object (61)', 1, '[{\"added\": {}}]', 10, 1),
(109, '2022-12-18 21:31:03.313233', '62', 'Modules object (62)', 1, '[{\"added\": {}}]', 10, 1);

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(4, 'auth', 'group'),
(3, 'auth', 'permission'),
(5, 'auth', 'user'),
(8, 'blog', 'agent'),
(7, 'blog', 'listenerform'),
(10, 'blog', 'modules'),
(2, 'blog', 'users'),
(6, 'contenttypes', 'contenttype'),
(9, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2022-07-15 14:39:23.613146'),
(2, 'auth', '0001_initial', '2022-07-15 14:39:29.892549'),
(3, 'admin', '0001_initial', '2022-07-15 14:39:31.327884'),
(4, 'admin', '0002_logentry_remove_auto_add', '2022-07-15 14:39:31.378640'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2022-07-15 14:39:31.411621'),
(6, 'contenttypes', '0002_remove_content_type_name', '2022-07-15 14:39:32.137189'),
(7, 'auth', '0002_alter_permission_name_max_length', '2022-07-15 14:39:32.755496'),
(8, 'auth', '0003_alter_user_email_max_length', '2022-07-15 14:39:32.857956'),
(9, 'auth', '0004_alter_user_username_opts', '2022-07-15 14:39:32.904959'),
(10, 'auth', '0005_alter_user_last_login_null', '2022-07-15 14:39:33.337019'),
(11, 'auth', '0006_require_contenttypes_0002', '2022-07-15 14:39:33.371678'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2022-07-15 14:39:33.412682'),
(13, 'auth', '0008_alter_user_username_max_length', '2022-07-15 14:39:33.498677'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2022-07-15 14:39:33.581678'),
(15, 'auth', '0010_alter_group_name_max_length', '2022-07-15 14:39:33.691686'),
(16, 'auth', '0011_update_proxy_permissions', '2022-07-15 14:39:33.733689'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2022-07-15 14:39:33.858684'),
(18, 'blog', '0001_initial', '2022-07-15 14:39:34.036677'),
(19, 'blog', '0002_delete_users', '2022-07-15 16:13:48.288327'),
(20, 'blog', '0003_initial', '2022-10-20 09:41:31.744758'),
(21, 'blog', '0004_agent', '2022-10-20 09:41:31.768710'),
(22, 'blog', '0005_delete_listenerform_delete_movie_delete_payloadform_and_more', '2022-10-20 09:41:31.808446'),
(23, 'blog', '0006_listenerform_alter_agent_ip', '2022-10-20 09:41:31.888496'),
(24, 'blog', '0007_delete_agent', '2022-10-20 09:41:31.905461'),
(25, 'blog', '0008_agent', '2022-10-20 09:41:31.938424'),
(26, 'sessions', '0001_initial', '2022-10-20 09:41:31.980836'),
(27, 'blog', '0009_alter_listenerform_stoped_date', '2022-11-04 12:36:20.519196'),
(28, 'blog', '0010_modules', '2022-11-30 18:22:05.274373'),
(29, 'blog', '0011_agent_created_date_agent_updated_date', '2022-12-13 16:03:33.175113'),
(30, 'blog', '0012_listenerform_ip', '2022-12-15 13:23:29.914820'),
(31, 'blog', '0013_agent_username', '2022-12-15 15:38:38.312221');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('0f09ec8w8tuah2a69etwhpy01ijxz84m', 'eyJhZ2VudE5hbWUiOiJETVJCR1kifQ:1p5vp2:URazYkpL0vgso5WHzBOOTzfEVbkGmtzp3OCZ7t0bays', '2022-12-29 21:31:20.091760'),
('3h6ewm3ba3x4b3cw9nkbjufdcliifq2t', '.eJxVjDEOwyAQBP9CHSEQPgMpU6XxG6yDO4ITy0gGV1H-HltykbQ7s_MWI24tj1vldZxIXIUWl98tYHzxcgB64vIoMpalrVOQhyJPWuVQiOfb6f4FMta8v5MjMAo6sL2LFolBeUboXASVGLH3HrTvDFNIIWrE4MEqdsZbFQjdHm1c216681zE5wsXOjx7:1p719w:Eiw0avoiKsp4VLIeIsE3zU0uWk67Hq4GnbHQhfFiPro', '2023-01-01 21:25:24.274540'),
('5qdhdhplv8y3l21rh5ap71zsfafzfitg', '.eJxVjDsOwjAQBe_iGll21r-lpOcMlj9rHEC2FCcV4u4QKQW0b2bei_mwrdVvgxY_Z3Zmkp1-txjSg9oO8j20W-ept3WZI98VftDBrz3T83K4fwc1jPqtFYBIDi1MQlqFGtHSZECqLK2hkqMhJ4pTRusSAaLTAYW1hChUAgjs_QGfdjZx:1op7g2:LMxm_cR-B8PAcvOTUMXxkPv-OA7NTfC_L5IAhXeVzQ8', '2022-11-13 12:44:34.235275'),
('69dk5hicqlors9x8wb1b7rmvq9o34ah7', 'eyJhZ2VudE5hbWUiOiJETVJCR1kifQ:1p5qVB:Hi0aejeJc6q-Ri17aezTHSinZDxzaQc88a8EohKBSyg', '2022-12-29 15:50:29.577238'),
('8txylzc9ub35p5xftgvszafz0i2r2m3x', '.eJxVjEEOwiAQRe_C2hAITAGX7j0DGZhBqgaS0q6Md9cmXej2v_f-S0Tc1hq3wUucSZyFFqffLWF-cNsB3bHdusy9rcuc5K7Igw557cTPy-H-HVQc9VsXT2AUWHCTzw6JQQVGsD6DKow4hQA6WMOUSsoaMQVwir0JTiVCL94f5qs4RQ:1p6KDZ:bcD3v0FW8ykWwcCFAv1jLixnycg4iYHEV8FY0MVLP_g', '2022-12-30 23:34:17.920866'),
('9mu5xksxhxxvgyow4zr76e7j5l31y9qh', '.eJxVjDsOwjAQBe_iGll21r-lpOcMlj9rHEC2FCcV4u4QKQW0b2bei_mwrdVvgxY_Z3Zmkp1-txjSg9oO8j20W-ept3WZI98VftDBrz3T83K4fwc1jPqtFYBIDi1MQlqFGtHSZECqLK2hkqMhJ4pTRusSAaLTAYW1hChUAgjs_QGfdjZx:1oqwCm:kUwZ0hbWFTi6tELkYZs9N6Ryr3jN95y168T5zXOXruo', '2022-11-18 12:53:52.923814'),
('bh08okh8kezplworz8vxiiuqmzeqnxkw', '.eJxVjEEOwiAQRe_C2hAITAGX7j0DGZhBqgaS0q6Md9cmXej2v_f-S0Tc1hq3wUucSZyFFqffLWF-cNsB3bHdusy9rcuc5K7Igw557cTPy-H-HVQc9VsXT2AUWHCTzw6JQQVGsD6DKow4hQA6WMOUSsoaMQVwir0JTiVCL94f5qs4RQ:1p6K3A:cLj8osX_cunL9ripRjL4cUw6V0O8f3Xz3uZVglf6rVM', '2022-12-30 23:23:32.601451'),
('dtipfsy8fjvrvb614uskuwmnp3ofhgbs', 'eyJhZ2VudE5hbWUiOiJMSUNXVFUifQ:1p5puD:YRx8UueyVvkSMYXOB9CWSkH58DQkaDgvvuvTP1NlyyI', '2022-12-29 15:12:17.512257'),
('ffkmtxohnmj9wox5b4pwd62vq559zb1v', '.eJxVjDsOwjAQBe_iGll21r-lpOcMlj9rHEC2FCcV4u4QKQW0b2bei_mwrdVvgxY_Z3Zmkp1-txjSg9oO8j20W-ept3WZI98VftDBrz3T83K4fwc1jPqtFYBIDi1MQlqFGtHSZECqLK2hkqMhJ4pTRusSAaLTAYW1hChUAgjs_QGfdjZx:1olUXq:N9mYZcQTKkF441xKs8JclFkNfC407UwZzvw5CLmqGQ4', '2022-11-03 12:21:06.188784'),
('fjjxjii6eoew1r2gbcxbizyf6iw0sge4', '.eJxVjDsOwjAQBe_iGll21r-lpOcMlj9rHEC2FCcV4u4QKQW0b2bei_mwrdVvgxY_Z3Zmkp1-txjSg9oO8j20W-ept3WZI98VftDBrz3T83K4fwc1jPqtFYBIDi1MQlqFGtHSZECqLK2hkqMhJ4pTRusSAaLTAYW1hChUAgjs_QGfdjZx:1ooAER:hvZ_kl_Jh-FgCuwfW14-fmGGglFuywIX_uXYrjBuP84', '2022-11-10 21:16:07.793420'),
('frr91x0u9mi8daechmerxlbyyqisq7m4', '.eJxVjEEOwiAQRe_C2hAITAGX7j0DGZhBqgaS0q6Md9cmXej2v_f-S0Tc1hq3wUucSZyFFqffLWF-cNsB3bHdusy9rcuc5K7Igw557cTPy-H-HVQc9VsXT2AUWHCTzw6JQQVGsD6DKow4hQA6WMOUSsoaMQVwir0JTiVCL94f5qs4RQ:1p6LpG:eY59qzpXIlPgqNed5waL-C1JIdSsW4puVJW0aBaXcrw', '2022-12-31 01:17:18.426188'),
('gh1g8ug2e5f6pmlvn83l0ez3kndij5kh', 'eyJhZ2VudE5hbWUiOiJMSUNXVFUifQ:1p5p5f:ksj0FGO8GusoIb1_lTXKXnbMsmJ-NbGawPumHvmfhb4', '2022-12-29 14:20:03.933630'),
('gjrr44psswmyv5hasxg4hjpferd4libz', 'eyJhZ2VudE5hbWUiOiJETVJCR1kifQ:1p6KIQ:j9c_O3ZTpM7-XnM5Cac_yOs3gMBRKrC8oK9yxbM6-80', '2022-12-30 23:39:18.093404'),
('hwpzwn6ao1k3vqxwwqfaluxgzwxi78k0', 'eyJhZ2VudE5hbWUiOiJETVJCR1kifQ:1p5qZk:mljkEmwqJtcFxN0lKr54JEVAjcWX6cA5w7loV51-RDs', '2022-12-29 15:55:12.485128'),
('hyauwhwr7kkf8pt9foob30y05od2w49h', '.eJxVjDsOwjAQBe_iGll21r-lpErDGSJ_NiQQxVLsVIi740gpoH0zb95s8Hudhr3QNsyJXZlkl98t-Pii9QDp6ddH5jGvdZsDPxR-0sLvOdFyO92_wOTL1N4KQESHFjohrUKNaKkzIFWS1tCYgiEnRqeM1mMACE57FNYSolARwLdopVJbqacls88Xtl46pw:1p5n9H:VPrmQEgcydiIhKEM4LnGvQzUbPLiUSKUrDVN79IA1EY', '2022-12-29 12:15:39.733762'),
('j58gm49m7fmr4aos8o4gf10b6o1cfit6', '.eJxVjEEOwiAQRe_C2hAITAGX7j0DGZhBqgaS0q6Md9cmXej2v_f-S0Tc1hq3wUucSZyFFqffLWF-cNsB3bHdusy9rcuc5K7Igw557cTPy-H-HVQc9VsXT2AUWHCTzw6JQQVGsD6DKow4hQA6WMOUSsoaMQVwir0JTiVCL94f5qs4RQ:1p6K3y:Go1z5XhRrw98WRwFuIdvvAulqm5o_AvBIgTuzN2CH7U', '2022-12-30 23:24:22.804274'),
('knesz529jy1dp8qundjqxkaaygmeugd9', 'eyJhZ2VudE5hbWUiOiJETVJCR1kifQ:1p6LkW:xcApsYI3PKgDoCiihXwJQJBXU_DXfcXaH__xxC_zRKo', '2022-12-31 01:12:24.912974'),
('m2f688bvtn4iffzr6tfetq24r62mftyn', '.eJxVjDsOwjAQBe_iGll21r-lpErDGSJ_NiQQxVLsVIi740gpoH0zb95s8Hudhr3QNsyJXZlkl98t-Pii9QDp6ddH5jGvdZsDPxR-0sLvOdFyO92_wOTL1N4KQESHFjohrUKNaKkzIFWS1tCYgiEnRqeM1mMACE57FNYSolARwLdopVJbqacls88Xtl46pw:1p3PPO:Uqpt1kXfpt-KMpiQl6VVEzWM0smoweZ_m-3w5gjNKHk', '2022-12-22 22:30:26.830553'),
('t4rmg0fh6owsfqeeghh3fvm2ev2mv495', '.eJxVjDEOwyAQBP9CHSEQPgMpU6XxG6yDO4ITy0gGV1H-HltykbQ7s_MWI24tj1vldZxIXIUWl98tYHzxcgB64vIoMpalrVOQhyJPWuVQiOfb6f4FMta8v5MjMAo6sL2LFolBeUboXASVGLH3HrTvDFNIIWrE4MEqdsZbFQjdHm1c216681zE5wsXOjx7:1p5oDC:IJ7G8tbamIm6MGMkKQFUPEQJ3pZWIUf6vfDtZTnh4RY', '2022-12-29 13:23:46.107247'),
('va1wzymphjoo04osdbc2dvatlrskk7gu', 'eyJhZ2VudE5hbWUiOiJOR0ZaUEgifQ:1p5vvj:NNcPL2lZfWoO4KXzXF_1FJmQmVoJ6mJI-6aT9B37EAs', '2022-12-29 21:38:15.114521'),
('vnab4fh1695xtwpee269b9tinyciw72w', '.eJxVjDsOwjAQBe_iGll21r-lpOcMlj9rHEC2FCcV4u4QKQW0b2bei_mwrdVvgxY_Z3Zmkp1-txjSg9oO8j20W-ept3WZI98VftDBrz3T83K4fwc1jPqtFYBIDi1MQlqFGtHSZECqLK2hkqMhJ4pTRusSAaLTAYW1hChUAgjs_QGfdjZx:1olTI4:vWi9GqL4cENxdjVNG4d-AmN2zhFT11VAtusJF2hIcE4', '2022-11-03 11:00:44.367033'),
('wedkg9k6gkqs0wuvzyl44f7lm2dtpbiw', '.eJxVjDsOwjAQBe_iGll21r-lpErDGSJ_NiQQxVLsVIi740gpoH0zb95s8Hudhr3QNsyJXZlkl98t-Pii9QDp6ddH5jGvdZsDPxR-0sLvOdFyO92_wOTL1N4KQESHFjohrUKNaKkzIFWS1tCYgiEnRqeM1mMACE57FNYSolARwLdopVJbqacls88Xtl46pw:1p3Pkg:su_liNRKV4JIRIO9PZU6ndQHRzqHxz_ZsiPLhE80FOQ', '2022-12-22 22:52:26.564398'),
('wswalagvqmxvxhh8n7z4126984gmwyfs', '.eJxVjDsOwjAQBe_iGll21r-lpOcMlj9rHEC2FCcV4u4QKQW0b2bei_mwrdVvgxY_Z3Zmkp1-txjSg9oO8j20W-ept3WZI98VftDBrz3T83K4fwc1jPqtFYBIDi1MQlqFGtHSZECqLK2hkqMhJ4pTRusSAaLTAYW1hChUAgjs_QGfdjZx:1olSuO:0XpsH1tKce17ouHOBos3l7N1oxO6Dyt4Gz9fXGOYV0c', '2022-11-03 10:36:16.138598');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `blog_agent`
--
ALTER TABLE `blog_agent`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blog_listenerform`
--
ALTER TABLE `blog_listenerform`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blog_modules`
--
ALTER TABLE `blog_modules`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `blog_agent`
--
ALTER TABLE `blog_agent`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `blog_listenerform`
--
ALTER TABLE `blog_listenerform`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `blog_modules`
--
ALTER TABLE `blog_modules`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=110;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
