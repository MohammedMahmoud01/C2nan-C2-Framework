-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 13, 2022 at 05:19 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 7.4.28

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$390000$0pGk3o3yl73xS2iQenRLp3$hILWC9dCD+Bvkbua6RgVlZZEx21QbQSNxXpf/janPgE=', '2022-12-13 16:06:22.089137', 1, 'admin', '', '', 'admin@gmail.com', 1, 1, '2022-10-20 10:10:02.435570'),
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
  `updated_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `blog_listenerform`
--

CREATE TABLE `blog_listenerform` (
  `id` bigint(20) NOT NULL,
  `interface` varchar(100) NOT NULL,
  `created_date` datetime(6) NOT NULL,
  `stoped_date` datetime(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `blog_modules`
--

CREATE TABLE `blog_modules` (
  `id` bigint(20) NOT NULL,
  `module_name` varchar(200) NOT NULL,
  `module_type` int(11) NOT NULL,
  `created_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
(31, 'Whoami', 2, '2022-12-08 17:21:49.652072');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
(71, '2022-12-13 16:06:45.298175', '30', 'ListenerForm object (30)', 3, '', 7, 1);

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
(29, 'blog', '0011_agent_created_date_agent_updated_date', '2022-12-13 16:03:33.175113');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('5qdhdhplv8y3l21rh5ap71zsfafzfitg', '.eJxVjDsOwjAQBe_iGll21r-lpOcMlj9rHEC2FCcV4u4QKQW0b2bei_mwrdVvgxY_Z3Zmkp1-txjSg9oO8j20W-ept3WZI98VftDBrz3T83K4fwc1jPqtFYBIDi1MQlqFGtHSZECqLK2hkqMhJ4pTRusSAaLTAYW1hChUAgjs_QGfdjZx:1op7g2:LMxm_cR-B8PAcvOTUMXxkPv-OA7NTfC_L5IAhXeVzQ8', '2022-11-13 12:44:34.235275'),
('9mu5xksxhxxvgyow4zr76e7j5l31y9qh', '.eJxVjDsOwjAQBe_iGll21r-lpOcMlj9rHEC2FCcV4u4QKQW0b2bei_mwrdVvgxY_Z3Zmkp1-txjSg9oO8j20W-ept3WZI98VftDBrz3T83K4fwc1jPqtFYBIDi1MQlqFGtHSZECqLK2hkqMhJ4pTRusSAaLTAYW1hChUAgjs_QGfdjZx:1oqwCm:kUwZ0hbWFTi6tELkYZs9N6Ryr3jN95y168T5zXOXruo', '2022-11-18 12:53:52.923814'),
('ffkmtxohnmj9wox5b4pwd62vq559zb1v', '.eJxVjDsOwjAQBe_iGll21r-lpOcMlj9rHEC2FCcV4u4QKQW0b2bei_mwrdVvgxY_Z3Zmkp1-txjSg9oO8j20W-ept3WZI98VftDBrz3T83K4fwc1jPqtFYBIDi1MQlqFGtHSZECqLK2hkqMhJ4pTRusSAaLTAYW1hChUAgjs_QGfdjZx:1olUXq:N9mYZcQTKkF441xKs8JclFkNfC407UwZzvw5CLmqGQ4', '2022-11-03 12:21:06.188784'),
('fjjxjii6eoew1r2gbcxbizyf6iw0sge4', '.eJxVjDsOwjAQBe_iGll21r-lpOcMlj9rHEC2FCcV4u4QKQW0b2bei_mwrdVvgxY_Z3Zmkp1-txjSg9oO8j20W-ept3WZI98VftDBrz3T83K4fwc1jPqtFYBIDi1MQlqFGtHSZECqLK2hkqMhJ4pTRusSAaLTAYW1hChUAgjs_QGfdjZx:1ooAER:hvZ_kl_Jh-FgCuwfW14-fmGGglFuywIX_uXYrjBuP84', '2022-11-10 21:16:07.793420'),
('hyauwhwr7kkf8pt9foob30y05od2w49h', '.eJxVjDsOwjAQBe_iGll21r-lpErDGSJ_NiQQxVLsVIi740gpoH0zb95s8Hudhr3QNsyJXZlkl98t-Pii9QDp6ddH5jGvdZsDPxR-0sLvOdFyO92_wOTL1N4KQESHFjohrUKNaKkzIFWS1tCYgiEnRqeM1mMACE57FNYSolARwLdopVJbqacls88Xtl46pw:1p57nS:4-tY49mJ-gR6S6e6WYA411BD0m0FGpKGgCF44u_BxXs', '2022-12-27 16:06:22.404142'),
('m2f688bvtn4iffzr6tfetq24r62mftyn', '.eJxVjDsOwjAQBe_iGll21r-lpErDGSJ_NiQQxVLsVIi740gpoH0zb95s8Hudhr3QNsyJXZlkl98t-Pii9QDp6ddH5jGvdZsDPxR-0sLvOdFyO92_wOTL1N4KQESHFjohrUKNaKkzIFWS1tCYgiEnRqeM1mMACE57FNYSolARwLdopVJbqacls88Xtl46pw:1p3PPO:Uqpt1kXfpt-KMpiQl6VVEzWM0smoweZ_m-3w5gjNKHk', '2022-12-22 22:30:26.830553'),
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
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `blog_listenerform`
--
ALTER TABLE `blog_listenerform`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `blog_modules`
--
ALTER TABLE `blog_modules`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=72;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

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
