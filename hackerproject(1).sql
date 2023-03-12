-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Mar 12, 2023 at 02:50 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

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
(40, 'Can view modules', 10, 'view_modules'),
(41, 'Can add agent tasks', 11, 'add_agenttasks'),
(42, 'Can change agent tasks', 11, 'change_agenttasks'),
(43, 'Can delete agent tasks', 11, 'delete_agenttasks'),
(44, 'Can view agent tasks', 11, 'view_agenttasks');

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
(1, 'pbkdf2_sha256$260000$6IxdJB0Ip4iwB9k8rWmOWc$9HsvMSqWlgknQBL1Fr6llECIL5lI8e9bIsu8NoggkgQ=', '2023-03-12 13:29:20.838559', 1, 'admin', '', '', 'admin@gmail.com', 1, 1, '2022-10-20 10:10:02.435570'),
(2, 'pbkdf2_sha256$390000$VcJyCcXjTw3BLzdoAFOs4l$vzeQ5BNSBrTDnreTIz0Ivyaf8+BHyD0XtSvRGsb8M80=', '2022-10-21 18:01:51.788209', 1, 'tamer', '', '', 'tamer@gmail.com', 1, 1, '2022-10-21 18:00:11.000000'),
(3, 'pbkdf2_sha256$390000$rBKtztMUtF8v2WViZlwh44$xM7mHlGyOQe+JHSXq2wLKha8Woj7XOpOR4D2aj+zJGY=', NULL, 0, 'rana', '', '', 'rana@gmail.com', 0, 1, '2022-10-21 18:41:06.000000'),
(4, 'pbkdf2_sha256$260000$jV5L1tD0CutfiRzuXnPMFF$pKxOqqYj3GGTCfGPy1x/vGGaXE+cOeeRsTU21CbGNQU=', '2023-03-12 12:54:18.904657', 0, 'hawary', '', '', 'asdjavsliasugfpaispui@gmail.com', 0, 1, '2023-03-12 12:53:25.017954');

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
  `updated_date` date NOT NULL,
  `username` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `blog_agent`
--

INSERT INTO `blog_agent` (`id`, `name`, `ip`, `hname`, `created_date`, `updated_date`, `username`) VALUES
(5, 'DMRBGY', '192.168.250.3', 'DESKTOP-1QDAKG8', '2022-12-15 15:50:29.567477', '2022-12-17', 'Moham'),
(6, 'NGFZPH', '192.168.19.1', 'DESKTOP-GR51O7C', '2022-12-15 21:38:15.049385', '2023-03-01', 'AbdulazizAladdinAli'),
(7, 'ZQHHPF', '192.168.116.129', 'kali', '2022-12-18 23:32:55.786996', '2022-12-19', 'root'),
(8, 'EWQDLD', '192.168.116.136', 'metasploitable', '2022-12-18 23:59:57.443649', '2022-12-19', 'www-data'),
(9, 'VMZBXP', '192.168.19.130', 'DESKTOP-KNTV3C3', '2023-03-06 00:03:35.825569', '2023-03-06', 'MoSa'),
(10, 'MATEME', '192.168.19.130', 'DESKTOP-KNTV3C3', '2023-03-06 00:09:22.493603', '2023-03-06', 'desktop-kntv3c3\\kerles'),
(12, 'VZPILP', '192.168.19.130', 'DESKTOP-KNTV3C3', '2023-03-10 23:28:29.335502', '2023-03-11', 'desktop-kntv3c3\\abdulazizaladdinali');

-- --------------------------------------------------------

--
-- Table structure for table `blog_agenttasks`
--

CREATE TABLE `blog_agenttasks` (
  `id` bigint(20) NOT NULL,
  `created_date` datetime(6) NOT NULL,
  `agent_id` bigint(20) NOT NULL,
  `module_id` bigint(20) NOT NULL,
  `task_result` longtext DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `blog_agenttasks`
--

INSERT INTO `blog_agenttasks` (`id`, `created_date`, `agent_id`, `module_id`, `task_result`, `user_id`) VALUES
(10, '2023-02-09 19:13:37.171485', 5, 20, NULL, NULL),
(11, '2023-02-09 19:15:00.077607', 5, 21, NULL, NULL),
(12, '2023-02-09 19:17:25.166579', 5, 19, NULL, NULL),
(13, '2023-02-09 21:03:19.429565', 5, 1, NULL, NULL),
(14, '2023-02-09 21:05:31.261567', 5, 1, NULL, NULL),
(15, '2023-02-09 21:07:19.371567', 5, 16, NULL, NULL),
(16, '2023-02-10 13:12:36.112697', 5, 64, NULL, NULL),
(17, '2023-03-01 13:29:31.287152', 7, 69, NULL, NULL),
(18, '2023-03-01 13:34:20.924666', 6, 69, NULL, NULL),
(19, '2023-03-01 13:40:21.943950', 6, 69, NULL, NULL),
(20, '2023-03-01 13:47:51.678602', 6, 83, NULL, NULL),
(21, '2023-03-01 14:02:41.444234', 6, 87, NULL, NULL),
(22, '2023-03-01 14:08:15.007527', 6, 87, NULL, NULL),
(23, '2023-03-01 14:14:51.231515', 6, 87, NULL, NULL),
(24, '2023-03-01 14:15:52.963143', 6, 87, NULL, NULL),
(25, '2023-03-01 14:16:15.812445', 6, 87, NULL, NULL),
(26, '2023-03-01 14:19:00.503109', 6, 87, NULL, NULL),
(27, '2023-03-06 00:17:14.270029', 9, 83, NULL, NULL),
(28, '2023-03-06 00:18:59.351814', 9, 4, NULL, NULL),
(29, '2023-03-06 00:20:20.496621', 10, 83, NULL, NULL),
(30, '2023-03-06 00:22:53.401560', 10, 84, NULL, NULL),
(31, '2023-03-06 00:24:34.042412', 10, 84, NULL, NULL),
(32, '2023-03-06 09:04:51.222068', 10, 69, NULL, NULL),
(33, '2023-03-06 09:06:03.374082', 10, 12, NULL, NULL),
(34, '2023-03-06 09:10:37.212118', 10, 12, NULL, NULL),
(35, '2023-03-06 09:12:47.110673', 10, 2, NULL, NULL),
(36, '2023-03-06 09:13:07.417801', 10, 2, NULL, NULL),
(37, '2023-03-06 09:14:26.954378', 10, 83, NULL, NULL),
(38, '2023-03-06 09:15:53.417340', 10, 84, NULL, NULL),
(39, '2023-03-06 09:18:16.826548', 10, 84, NULL, NULL),
(40, '2023-03-06 09:20:27.240501', 10, 84, NULL, NULL),
(41, '2023-03-06 09:20:37.019926', 10, 84, NULL, NULL),
(42, '2023-03-06 09:23:00.722472', 10, 84, NULL, NULL),
(43, '2023-03-06 09:25:27.777054', 10, 84, NULL, NULL),
(44, '2023-03-06 09:25:55.808644', 10, 84, NULL, NULL),
(45, '2023-03-06 09:28:10.727792', 10, 84, NULL, NULL),
(46, '2023-03-06 09:31:49.487162', 10, 84, NULL, NULL),
(47, '2023-03-06 09:33:40.855943', 10, 83, NULL, NULL),
(48, '2023-03-06 09:34:13.859017', 10, 83, NULL, NULL),
(49, '2023-03-06 09:37:06.907821', 10, 84, NULL, NULL),
(50, '2023-03-06 09:38:18.598543', 10, 84, NULL, NULL),
(51, '2023-03-06 09:38:51.054155', 10, 83, NULL, NULL),
(52, '2023-03-06 09:49:20.665443', 9, 83, NULL, NULL),
(53, '2023-03-06 09:49:41.150948', 9, 12, NULL, NULL),
(54, '2023-03-06 09:50:28.580910', 9, 12, NULL, NULL),
(55, '2023-03-06 09:51:10.074174', 9, 7, NULL, NULL),
(56, '2023-03-06 09:53:59.733866', 10, 12, NULL, NULL),
(57, '2023-03-06 09:55:03.365040', 10, 1, NULL, NULL),
(58, '2023-03-06 09:55:20.162406', 10, 12, NULL, NULL),
(59, '2023-03-06 09:55:56.491151', 10, 12, NULL, NULL),
(60, '2023-03-06 09:56:22.182213', 10, 83, NULL, NULL),
(61, '2023-03-06 09:57:38.899651', 10, 84, NULL, NULL),
(62, '2023-03-06 09:58:42.454294', 10, 84, NULL, NULL),
(63, '2023-03-06 09:59:19.786394', 10, 84, NULL, NULL),
(64, '2023-03-06 10:00:23.577153', 10, 84, NULL, NULL),
(65, '2023-03-06 11:26:58.897306', 10, 69, NULL, NULL),
(66, '2023-03-06 11:28:24.521783', 10, 69, NULL, NULL),
(67, '2023-03-06 11:30:23.418507', 10, 69, NULL, NULL),
(68, '2023-03-06 11:50:15.827726', 10, 69, NULL, NULL),
(69, '2023-03-06 11:50:38.443282', 10, 69, NULL, NULL),
(70, '2023-03-06 11:51:19.784157', 10, 86, NULL, NULL),
(71, '2023-03-06 11:51:29.520607', 10, 86, NULL, NULL),
(72, '2023-03-06 11:52:44.756324', 10, 86, NULL, NULL),
(73, '2023-03-06 11:52:59.011642', 10, 86, NULL, NULL),
(74, '2023-03-06 11:54:07.770395', 10, 86, NULL, NULL),
(75, '2023-03-09 21:42:34.352324', 5, 73, NULL, NULL),
(76, '2023-03-09 21:43:05.389540', 5, 73, NULL, NULL),
(77, '2023-03-09 21:43:23.330947', 5, 73, NULL, NULL),
(78, '2023-03-09 21:47:30.368477', 5, 73, NULL, NULL),
(79, '2023-03-09 21:48:27.734468', 5, 73, NULL, NULL),
(80, '2023-03-09 21:56:45.382384', 5, 73, NULL, NULL),
(81, '2023-03-09 22:10:44.520310', 5, 73, NULL, NULL),
(82, '2023-03-09 22:14:20.002063', 5, 73, NULL, NULL),
(83, '2023-03-09 22:16:20.330621', 5, 73, NULL, NULL),
(84, '2023-03-09 22:19:22.109816', 5, 73, NULL, NULL),
(85, '2023-03-10 14:12:15.676908', 5, 73, NULL, NULL),
(86, '2023-03-10 14:13:14.850995', 5, 2, NULL, NULL),
(87, '2023-03-10 14:13:36.867538', 5, 1, NULL, NULL),
(88, '2023-03-10 14:13:59.183448', 5, 1, NULL, NULL),
(89, '2023-03-10 23:29:21.436635', 12, 4, '++++++++++++++++++\r\n===============All_environment_variables===============\r\n	\r\nName                           Value                                                                                   \r\n----                           -----                                                                                   \r\nALLUSERSPROFILE                C:\\ProgramData                                                                          \r\nAPPDATA                        C:\\Users\\AbdulazizAladdinAli\\AppData\\Roaming                                            \r\nCommonProgramFiles             C:\\Program Files\\Common Files                                                           \r\nCommonProgramFiles(x86)        C:\\Program Files (x86)\\Common Files                                                     \r\nCommonProgramW6432             C:\\Program Files\\Common Files                                                           \r\nCOMPUTERNAME                   DESKTOP-KNTV3C3                                                                         \r\nComSpec                        C:\\Windows\\system32\\cmd.exe                                                             \r\nHOMEDRIVE                      C:                                                                                      \r\nHOMEPATH                       \\Users\\AbdulazizAladdinAli                                                              \r\nLOCALAPPDATA                   C:\\Users\\AbdulazizAladdinAli\\AppData\\Local                                              \r\nLOGONSERVER                    \\\\DESKTOP-KNTV3C3                                                                       \r\nNUMBER_OF_PROCESSORS           2                                                                                       \r\nOneDrive                       C:\\Users\\AbdulazizAladdinAli\\OneDrive                                                   \r\nOS                             Windows_NT                                                                              \r\nPath                           C:\\Windows\\system32;C:\\Windows;C:\\Windows\\System32\\Wbem;C:\\Windows\\System32\\WindowsPo...\r\nPATHEXT                        .COM;.EXE;.BAT;.CMD;.VBS;.VBE;.JS;.JSE;.WSF;.WSH;.MSC;.CPL                              \r\nPROCESSOR_ARCHITECTURE         AMD64                                                                                   \r\nPROCESSOR_IDENTIFIER           Intel64 Family 6 Model 142 Stepping 9, GenuineIntel                                     \r\nPROCESSOR_LEVEL                6                                                                                       \r\nPROCESSOR_REVISION             8e09                                                                                    \r\nProgramData                    C:\\ProgramData                                                                          \r\nProgramFiles                   C:\\Program Files                                                                        \r\nProgramFiles(x86)              C:\\Program Files (x86)                                                                  \r\nProgramW6432                   C:\\Program Files                                                                        \r\nPROMPT                         $P$G                                                                                    \r\nPSExecutionPolicyPreference    Bypass                                                                                  \r\nPSModulePath                   C:\\Users\\AbdulazizAladdinAli\\Documents\\WindowsPowerShell\\Modules;C:\\Program Files\\Win...\r\nPUBLIC                         C:\\Users\\Public                                                                         \r\nSystemDrive                    C:                                                                                      \r\nSystemRoot                     C:\\Windows                                                                              \r\nTEMP                           C:\\Users\\ABDULA~1\\AppData\\Local\\Temp                                                    \r\nTMP                            C:\\Users\\ABDULA~1\\AppData\\Local\\Temp                                                    \r\nUSERDOMAIN                     DESKTOP-KNTV3C3                                                                         \r\nUSERDOMAIN_ROAMINGPROFILE      DESKTOP-KNTV3C3                                                                         \r\nUSERNAME                       AbdulazizAladdinAli                                                                     \r\nUSERPROFILE                    C:\\Users\\AbdulazizAladdinAli                                                            \r\nwindir                         C:\\Windows                                                                              \r\n++++++++++++++++++ ', NULL),
(90, '2023-03-10 23:30:09.920545', 12, 84, '[+] Got Handle for ppid: 504\r\n[+] Updated proc attribute list\r\n[+] Starting c:/windows/system32/cmd.exe...True - pid: 4568 - Last error: 87 ', NULL),
(91, '2023-03-10 23:30:43.878437', 12, 84, '[+] Got Handle for ppid: 504\r\n[+] Updated proc attribute list\r\n[+] Starting c:/windows/system32/cmd.exe...True - pid: 4860 - Last error: 87 ', NULL),
(92, '2023-03-12 11:41:41.987688', 12, 84, '[+] Got Handle for ppid: 496\r\n[+] Updated proc attribute list\r\n[+] Starting C:WindowsSystem32cmd.exe...False - pid: 0 - Last error: 2 ', NULL),
(93, '2023-03-12 11:42:12.986408', 12, 84, '[+] Got Handle for ppid: 496\r\n[+] Updated proc attribute list\r\n[+] Starting C:Windows\\System32\\cmd.exe...False - pid: 0 - Last error: 3 ', NULL),
(94, '2023-03-12 11:43:57.292619', 12, 83, '++++++++++++++++++\r\n	\r\n===============Task_List===============\r\nImage Name                     PID Session Name        Session#    Mem Usage\r\n========================= ======== ================ =========== ============\r\nSystem Idle Process              0 Services                   0          4 K\r\nSystem                           4 Services                   0     41,040 K\r\nsmss.exe                       256 Services                   0        876 K\r\ncsrss.exe                      356 Services                   0      3,064 K\r\nwininit.exe                    424 Services                   0      3,952 K\r\ncsrss.exe                      432 Console                    1      9,416 K\r\nwinlogon.exe                   496 Console                    1      5,852 K\r\nservices.exe                   544 Services                   0      6,212 K\r\nlsass.exe                      560 Services                   0     10,612 K\r\nsvchost.exe                    628 Services                   0     17,616 K\r\nsvchost.exe                    684 Services                   0      8,796 K\r\ndwm.exe                        788 Console                    1     29,172 K\r\nsvchost.exe                    880 Services                   0     64,400 K\r\nsvchost.exe                    920 Services                   0     21,824 K\r\nsvchost.exe                    928 Services                   0      6,968 K\r\nsvchost.exe                    972 Services                   0     20,788 K\r\nsvchost.exe                     76 Services                   0     14,296 K\r\nsvchost.exe                    360 Services                   0     22,000 K\r\nsvchost.exe                   1164 Services                   0     14,500 K\r\nspoolsv.exe                   1244 Services                   0      9,704 K\r\nsvchost.exe                   1564 Services                   0      5,612 K\r\nsvchost.exe                   1696 Services                   0     21,868 K\r\nsvchost.exe                   1756 Services                   0     18,092 K\r\nVGAuthService.exe             1764 Services                   0      5,924 K\r\nMsMpEng.exe                   1832 Services                   0    177,132 K\r\nvm3dservice.exe               1840 Services                   0      4,636 K\r\nvmtoolsd.exe                  1848 Services                   0     14,260 K\r\nvm3dservice.exe               1080 Console                    1      4,944 K\r\nWmiPrvSE.exe                  2244 Services                   0     20,124 K\r\ndllhost.exe                   2416 Services                   0      9,216 K\r\nsihost.exe                    2648 Console                    1     17,056 K\r\ntaskhostw.exe                 2692 Console                    1     12,920 K\r\nMicrosoftEdgeUpdate.exe       2708 Services                   0        248 K\r\nMicrosoftEdgeUpdate.exe       2732 Console                    1        352 K\r\nRuntimeBroker.exe             2820 Console                    1     29,628 K\r\nexplorer.exe                  2912 Console                    1    188,108 K\r\nSkypeHost.exe                 3132 Console                    1      6,824 K\r\nmsdtc.exe                     3156 Services                   0      6,544 K\r\nSearchIndexer.exe             3320 Services                   0     20,320 K\r\nShellExperienceHost.exe       3648 Console                    1     61,788 K\r\nSearchUI.exe                  3780 Console                    1     93,640 K\r\nsvchost.exe                   2812 Services                   0     34,768 K\r\nSkypeHost.exe                 4288 Console                    1      4,592 K\r\nWmiPrvSE.exe                  4844 Services                   0     14,948 K\r\nNisSrv.exe                    5104 Services                   0      5,960 K\r\nvmtoolsd.exe                  4732 Console                    1     30,528 K\r\nOneDrive.exe                  1524 Console                    1     19,536 K\r\ntaskhostw.exe                 5580 Console                    1        624 K\r\nsvchost.exe                   4572 Console                    1     12,464 K\r\nsedsvc.exe                    5220 Services                   0     19,852 K\r\naudiodg.exe                   5128 Services                   0     10,328 K\r\ncmd.exe                       3236 Console                    1      3,316 K\r\nconhost.exe                   5916 Console                    1     14,812 K\r\npowershell.exe                4736 Console                    1     84,952 K\r\nInstallAgent.exe              4140 Console                    1     13,648 K\r\nwuauclt.exe                   2188 Services                   0      9,964 K\r\nWindowsUpdateBox.exe          2996 Services                   0      5,768 K\r\nTrustedInstaller.exe          5464 Services                   0      5,632 K\r\nCompatTelRunner.exe           4816 Services                   0      3,944 K\r\nOneDriveStandaloneUpdater     5144 Console                    1     12,488 K\r\nconhost.exe                   4812 Services                   0      5,528 K\r\nsppsvc.exe                    5848 Services                   0     13,036 K\r\nsetuphost.exe                 5388 Services                   0     28,876 K\r\nrundll32.exe                  3848 Services                   0     10,576 K\r\npowershell.exe                5448 Console                    1     63,696 K\r\nconhost.exe                   5868 Console                    1      6,584 K\r\nsvchost.exe                   6008 Services                   0     11,520 K\r\ntasklist.exe                  4596 Console                    1      7,000 K\r\n++++++++++++++++++ ', NULL),
(95, '2023-03-12 11:45:07.364001', 12, 84, '[+] Got Handle for ppid: 496\r\n[+] Updated proc attribute list\r\n[+] Starting C:\\Windows\\System32\\cmd.exe...True - pid: 4560 - Last error: 87 ', NULL),
(96, '2023-03-12 12:49:32.418354', 12, 1, '++++++++++++++++++\r\n	\r\n===============AppLocker_Rules===============\r\n===============AppLocker_Policy_Test===============\r\nFilePath                      PolicyDecision MatchingRule\r\n--------                      -------------- ------------\r\nC:\\Windows\\System32\\cmd.exe AllowedByDefault             \r\n++++++++++++++++++ ', 1),
(97, '2023-03-12 12:54:35.643502', 12, 4, '++++++++++++++++++\r\n	\r\n===============All_environment_variables===============\r\nName                           Value                                                                                   \r\n----                           -----                                                                                   \r\nALLUSERSPROFILE                C:\\ProgramData                                                                          \r\nAPPDATA                        C:\\Users\\AbdulazizAladdinAli\\AppData\\Roaming                                            \r\nCommonProgramFiles             C:\\Program Files\\Common Files                                                           \r\nCommonProgramFiles(x86)        C:\\Program Files (x86)\\Common Files                                                     \r\nCommonProgramW6432             C:\\Program Files\\Common Files                                                           \r\nCOMPUTERNAME                   DESKTOP-KNTV3C3                                                                         \r\nComSpec                        C:\\Windows\\system32\\cmd.exe                                                             \r\nHOMEDRIVE                      C:                                                                                      \r\nHOMEPATH                       \\Users\\AbdulazizAladdinAli                                                              \r\nLOCALAPPDATA                   C:\\Users\\AbdulazizAladdinAli\\AppData\\Local                                              \r\nLOGONSERVER                    \\\\DESKTOP-KNTV3C3                                                                       \r\nNUMBER_OF_PROCESSORS           2                                                                                       \r\nOneDrive                       C:\\Users\\AbdulazizAladdinAli\\OneDrive                                                   \r\nOS                             Windows_NT                                                                              \r\nPath                           C:\\Windows\\system32;C:\\Windows;C:\\Windows\\System32\\Wbem;C:\\Windows\\System32\\WindowsPo...\r\nPATHEXT                        .COM;.EXE;.BAT;.CMD;.VBS;.VBE;.JS;.JSE;.WSF;.WSH;.MSC;.CPL                              \r\nPROCESSOR_ARCHITECTURE         AMD64                                                                                   \r\nPROCESSOR_IDENTIFIER           Intel64 Family 6 Model 142 Stepping 9, GenuineIntel                                     \r\nPROCESSOR_LEVEL                6                                                                                       \r\nPROCESSOR_REVISION             8e09                                                                                    \r\nProgramData                    C:\\ProgramData                                                                          \r\nProgramFiles                   C:\\Program Files                                                                        \r\nProgramFiles(x86)              C:\\Program Files (x86)                                                                  \r\nProgramW6432                   C:\\Program Files                                                                        \r\nPROMPT                         $P$G                                                                                    \r\nPSExecutionPolicyPreference    Bypass                                                                                  \r\nPSModulePath                   C:\\Users\\AbdulazizAladdinAli\\Documents\\WindowsPowerShell\\Modules;C:\\Program Files\\Win...\r\nPUBLIC                         C:\\Users\\Public                                                                         \r\nSESSIONNAME                    Console                                                                                 \r\nSystemDrive                    C:                                                                                      \r\nSystemRoot                     C:\\Windows                                                                              \r\nTEMP                           C:\\Users\\ABDULA~1\\AppData\\Local\\Temp                                                    \r\nTMP                            C:\\Users\\ABDULA~1\\AppData\\Local\\Temp                                                    \r\nUSERDOMAIN                     DESKTOP-KNTV3C3                                                                         \r\nUSERDOMAIN_ROAMINGPROFILE      DESKTOP-KNTV3C3                                                                         \r\nUSERNAME                       AbdulazizAladdinAli                                                                     \r\nUSERPROFILE                    C:\\Users\\AbdulazizAladdinAli                                                            \r\nwindir                         C:\\Windows                                                                              \r\n++++++++++++++++++ ', 4),
(98, '2023-03-12 12:55:51.193727', 12, 6, '++++++++++++++++++\r\n	\r\n===============Interface_IP_and_DNS_information===============\r\nWindows IP Configuration\r\n   Host Name . . . . . . . . . . . . : DESKTOP-KNTV3C3\r\n   Primary Dns Suffix  . . . . . . . : \r\n   Node Type . . . . . . . . . . . . : Hybrid\r\n   IP Routing Enabled. . . . . . . . : No\r\n   WINS Proxy Enabled. . . . . . . . : No\r\n   DNS Suffix Search List. . . . . . : localdomain\r\nEthernet adapter Ethernet0:\r\n   Connection-specific DNS Suffix  . : localdomain\r\n   Description . . . . . . . . . . . : Intel(R) 82574L Gigabit Network Connection\r\n   Physical Address. . . . . . . . . : 00-0C-29-2B-F1-C9\r\n   DHCP Enabled. . . . . . . . . . . : Yes\r\n   Autoconfiguration Enabled . . . . : Yes\r\n   Link-local IPv6 Address . . . . . : fe80::74c4:8ec0:e7d4:e58b%3(Preferred) \r\n   IPv4 Address. . . . . . . . . . . : 192.168.19.130(Preferred) \r\n   Subnet Mask . . . . . . . . . . . : 255.255.255.0\r\n   Lease Obtained. . . . . . . . . . : Sunday, March 12, 2023 2:45:33 PM\r\n   Lease Expires . . . . . . . . . . : Sunday, March 12, 2023 3:15:33 PM\r\n   Default Gateway . . . . . . . . . : 192.168.19.2\r\n   DHCP Server . . . . . . . . . . . : 192.168.19.254\r\n   DHCPv6 IAID . . . . . . . . . . . : 33557545\r\n   DHCPv6 Client DUID. . . . . . . . : 00-01-00-01-2B-71-84-E1-00-0C-29-2B-F1-C9\r\n   DNS Servers . . . . . . . . . . . : 192.168.19.2\r\n   Primary WINS Server . . . . . . . : 192.168.19.2\r\n   NetBIOS over Tcpip. . . . . . . . : Enabled\r\nTunnel adapter isatap.localdomain:\r\n   Connection-specific DNS Suffix  . : localdomain\r\n   Description . . . . . . . . . . . : Microsoft ISATAP Adapter\r\n   Physical Address. . . . . . . . . : 00-00-00-00-00-00-00-E0\r\n   DHCP Enabled. . . . . . . . . . . : No\r\n   Autoconfiguration Enabled . . . . : Yes\r\nTunnel adapter Local Area Connection* 3:\r\n   Connection-specific DNS Suffix  . : \r\n   Description . . . . . . . . . . . : Teredo Tunneling Pseudo-Interface\r\n   Physical Address. . . . . . . . . : 00-00-00-00-00-00-00-E0\r\n   DHCP Enabled. . . . . . . . . . . : No\r\n   Autoconfiguration Enabled . . . . : Yes\r\n   IPv6 Address. . . . . . . . . . . : 2001:0:2851:782c:14d6:cd7a:3b69:ec5c(Preferred) \r\n   Link-local IPv6 Address . . . . . : fe80::14d6:cd7a:3b69:ec5c%14(Preferred) \r\n   Default Gateway . . . . . . . . . : ::\r\n   Media State . . . . . . . . . . . : Media disconnected\r\n   DHCPv6 IAID . . . . . . . . . . . : 134217728\r\n   DHCPv6 Client DUID. . . . . . . . : 00-01-00-01-2B-71-84-E1-00-0C-29-2B-F1-C9\r\n   NetBIOS over Tcpip. . . . . . . . : Disabled\r\n===============arp_table_information===============\r\nInterface: 192.168.19.130 --- 0x3\r\n  Internet Address      Physical Address      Type\r\n  192.168.19.2          00-50-56-e6-f2-3c     dynamic   \r\n  192.168.19.133        4e-c6-2b-8b-b9-db     dynamic   \r\n  192.168.19.254        00-50-56-e8-33-0f     dynamic   \r\n  192.168.19.255        ff-ff-ff-ff-ff-ff     static    \r\n  224.0.0.22            01-00-5e-00-00-16     static    \r\n  224.0.0.252           01-00-5e-00-00-fc     static    \r\n  239.255.255.250       01-00-5e-7f-ff-fa     static    \r\n  255.255.255.255       ff-ff-ff-ff-ff-ff     static    \r\n++++++++++++++++++ ', 4),
(99, '2023-03-12 13:32:47.308101', 12, 84, NULL, 1),
(100, '2023-03-12 13:35:23.869197', 12, 84, NULL, 1),
(101, '2023-03-12 13:35:26.324669', 12, 84, NULL, 1),
(102, '2023-03-12 13:35:27.844729', 12, 84, NULL, 1);

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `blog_listenerform`
--

INSERT INTO `blog_listenerform` (`id`, `interface`, `created_date`, `stoped_date`, `ip`) VALUES
(33, 'eth0', '2023-03-12 12:44:48.132380', NULL, '192.168.19.133');

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
(61, 'ffuf', 2, '2022-12-18 21:30:47.504490'),
(62, 'ExecuteCommandWithSpecUser', 2, '2022-12-18 21:31:03.311151'),
(63, 'DownloadOnAgent', 2, '2022-12-18 22:29:40.389482'),
(64, 'Fuff', 4, '2023-02-10 12:40:31.026431'),
(65, 'Active_Dir System Info', 3, '2023-02-28 21:21:41.371384'),
(66, 'Active_Dir DomainInfo', 3, '2023-02-28 21:21:58.722956'),
(67, 'Active_Dir DomainUsers', 3, '2023-02-28 21:22:06.768356'),
(68, 'Download_IWR', 1, '2023-03-01 12:32:19.750931'),
(69, 'DownloadFileAsync', 1, '2023-03-01 12:32:28.803945'),
(70, 'DownloadString', 1, '2023-03-01 12:32:39.432269'),
(71, 'Download_SMB', 1, '2023-03-01 12:32:45.402699'),
(72, 'Download_FTP', 1, '2023-03-01 12:32:52.781707'),
(73, 'Invoke_fileUpload', 1, '2023-03-01 12:32:59.230769'),
(74, 'FTP_fileUpload', 1, '2023-03-01 12:33:06.858632'),
(75, 'open_pythonserver', 1, '2023-03-01 12:33:14.083714'),
(76, 'open_SMBserver', 1, '2023-03-01 12:33:19.990386'),
(77, 'open_FTPserver', 1, '2023-03-01 12:33:26.242055'),
(78, 'open_PY_UploadServer', 1, '2023-03-01 12:33:31.701250'),
(79, 'open_FTP_UploadServer', 1, '2023-03-01 12:33:37.197153'),
(80, 'Perm_pip', 1, '2023-03-01 12:33:45.250655'),
(81, 'printspoofer', 1, '2023-03-01 12:33:50.450487'),
(82, 'procdump', 1, '2023-03-01 12:33:55.854386'),
(83, 'tasklist', 1, '2023-03-01 12:34:01.358276'),
(84, 'SeDebugPrivilege', 1, '2023-03-01 12:34:07.606145'),
(85, 'Import_Module', 1, '2023-03-01 12:34:13.782410'),
(86, 'Exec_Module', 1, '2023-03-01 12:34:20.635052'),
(87, 'Chk_File_Owner', 1, '2023-03-01 12:34:25.639413'),
(88, 'Take_Own', 1, '2023-03-01 12:34:30.653266'),
(89, 'ACL_modify', 1, '2023-03-01 12:34:36.164470'),
(90, 'SeBackUpPrivelege', 1, '2023-03-01 12:34:41.278826'),
(91, 'Auto_SeDebugPrivilege', 5, '2023-03-12 12:58:58.277679');

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
(109, '2022-12-18 21:31:03.313233', '62', 'Modules object (62)', 1, '[{\"added\": {}}]', 10, 1),
(110, '2022-12-18 22:29:40.391017', '63', 'Modules object (63)', 1, '[{\"added\": {}}]', 10, 1),
(111, '2023-02-02 23:48:41.057633', '61', 'Modules object (61)', 2, '[{\"changed\": {\"fields\": [\"Module name\"]}}]', 10, 1),
(112, '2023-02-09 16:01:18.849774', '1', 'AgentTasks object (1)', 1, '[{\"added\": {}}]', 11, 1),
(113, '2023-02-10 12:40:31.028432', '64', 'Fuff', 1, '[{\"added\": {}}]', 10, 1),
(114, '2023-02-28 21:21:41.372379', '65', 'Active_Dir System Info', 1, '[{\"added\": {}}]', 10, 1),
(115, '2023-02-28 21:21:58.724956', '66', 'Active_Dir DomainInfo', 1, '[{\"added\": {}}]', 10, 1),
(116, '2023-02-28 21:22:06.769366', '67', 'Active_Dir DomainUsers', 1, '[{\"added\": {}}]', 10, 1),
(117, '2023-03-01 12:32:19.755599', '68', 'Download_IWR', 1, '[{\"added\": {}}]', 10, 1),
(118, '2023-03-01 12:32:28.805335', '69', 'DownloadFileAsync', 1, '[{\"added\": {}}]', 10, 1),
(119, '2023-03-01 12:32:39.433614', '70', 'DownloadString', 1, '[{\"added\": {}}]', 10, 1),
(120, '2023-03-01 12:32:45.408341', '71', 'Download_SMB', 1, '[{\"added\": {}}]', 10, 1),
(121, '2023-03-01 12:32:52.783649', '72', 'Download_FTP', 1, '[{\"added\": {}}]', 10, 1),
(122, '2023-03-01 12:32:59.231991', '73', 'Invoke_fileUpload', 1, '[{\"added\": {}}]', 10, 1),
(123, '2023-03-01 12:33:06.859738', '74', 'FTP_fileUpload', 1, '[{\"added\": {}}]', 10, 1),
(124, '2023-03-01 12:33:14.085244', '75', 'open_pythonserver', 1, '[{\"added\": {}}]', 10, 1),
(125, '2023-03-01 12:33:19.996135', '76', 'open_SMBserver', 1, '[{\"added\": {}}]', 10, 1),
(126, '2023-03-01 12:33:26.243248', '77', 'open_FTPserver', 1, '[{\"added\": {}}]', 10, 1),
(127, '2023-03-01 12:33:31.702566', '78', 'open_PY_UploadServer', 1, '[{\"added\": {}}]', 10, 1),
(128, '2023-03-01 12:33:37.199291', '79', 'open_FTP_UploadServer', 1, '[{\"added\": {}}]', 10, 1),
(129, '2023-03-01 12:33:45.252142', '80', 'Perm_pip', 1, '[{\"added\": {}}]', 10, 1),
(130, '2023-03-01 12:33:50.451894', '81', 'printspoofer', 1, '[{\"added\": {}}]', 10, 1),
(131, '2023-03-01 12:33:55.855885', '82', 'procdump', 1, '[{\"added\": {}}]', 10, 1),
(132, '2023-03-01 12:34:01.359665', '83', 'tasklist', 1, '[{\"added\": {}}]', 10, 1),
(133, '2023-03-01 12:34:07.608351', '84', 'Exec_With_Prnt_Priv', 1, '[{\"added\": {}}]', 10, 1),
(134, '2023-03-01 12:34:13.784550', '85', 'Import_Module', 1, '[{\"added\": {}}]', 10, 1),
(135, '2023-03-01 12:34:20.639348', '86', 'Exec_Module', 1, '[{\"added\": {}}]', 10, 1),
(136, '2023-03-01 12:34:25.640465', '87', 'Chk_File_Owner', 1, '[{\"added\": {}}]', 10, 1),
(137, '2023-03-01 12:34:30.654890', '88', 'Take_Own', 1, '[{\"added\": {}}]', 10, 1),
(138, '2023-03-01 12:34:36.165546', '89', 'ACL_modify', 1, '[{\"added\": {}}]', 10, 1),
(139, '2023-03-01 12:34:41.279992', '90', 'SeBackUpPrivelege', 1, '[{\"added\": {}}]', 10, 1),
(140, '2023-03-01 12:38:11.748039', '90', 'SeBackUpPrivelege', 2, '[{\"changed\": {\"fields\": [\"Module type\"]}}]', 10, 1),
(141, '2023-03-01 12:38:25.750518', '87', 'Chk_File_Owner', 2, '[{\"changed\": {\"fields\": [\"Module type\"]}}]', 10, 1),
(142, '2023-03-01 12:38:35.206231', '89', 'ACL_modify', 2, '[{\"changed\": {\"fields\": [\"Module type\"]}}]', 10, 1),
(143, '2023-03-01 12:38:40.741468', '88', 'Take_Own', 2, '[{\"changed\": {\"fields\": [\"Module type\"]}}]', 10, 1),
(144, '2023-03-01 12:38:48.344642', '86', 'Exec_Module', 2, '[{\"changed\": {\"fields\": [\"Module type\"]}}]', 10, 1),
(145, '2023-03-01 12:38:54.201154', '85', 'Import_Module', 2, '[{\"changed\": {\"fields\": [\"Module type\"]}}]', 10, 1),
(146, '2023-03-01 12:38:59.955800', '84', 'Exec_With_Prnt_Priv', 2, '[{\"changed\": {\"fields\": [\"Module type\"]}}]', 10, 1),
(147, '2023-03-01 12:39:14.047696', '83', 'tasklist', 2, '[{\"changed\": {\"fields\": [\"Module type\"]}}]', 10, 1),
(148, '2023-03-01 12:40:17.249754', '82', 'procdump', 2, '[{\"changed\": {\"fields\": [\"Module type\"]}}]', 10, 1),
(149, '2023-03-01 12:40:31.830370', '81', 'printspoofer', 2, '[{\"changed\": {\"fields\": [\"Module type\"]}}]', 10, 1),
(150, '2023-03-01 12:40:46.208279', '68', 'Download_IWR', 2, '[{\"changed\": {\"fields\": [\"Module type\"]}}]', 10, 1),
(151, '2023-03-01 12:40:58.951860', '69', 'DownloadFileAsync', 2, '[{\"changed\": {\"fields\": [\"Module type\"]}}]', 10, 1),
(152, '2023-03-01 12:41:12.402200', '70', 'DownloadString', 2, '[]', 10, 1),
(153, '2023-03-01 12:41:23.058712', '80', 'Perm_pip', 2, '[{\"changed\": {\"fields\": [\"Module type\"]}}]', 10, 1),
(154, '2023-03-01 12:41:34.985524', '79', 'open_FTP_UploadServer', 2, '[{\"changed\": {\"fields\": [\"Module type\"]}}]', 10, 1),
(155, '2023-03-01 12:41:42.281531', '78', 'open_PY_UploadServer', 2, '[{\"changed\": {\"fields\": [\"Module type\"]}}]', 10, 1),
(156, '2023-03-01 12:41:48.636018', '77', 'open_FTPserver', 2, '[{\"changed\": {\"fields\": [\"Module type\"]}}]', 10, 1),
(157, '2023-03-01 12:41:54.255157', '76', 'open_SMBserver', 2, '[{\"changed\": {\"fields\": [\"Module type\"]}}]', 10, 1),
(158, '2023-03-01 12:41:59.139790', '75', 'open_pythonserver', 2, '[{\"changed\": {\"fields\": [\"Module type\"]}}]', 10, 1),
(159, '2023-03-01 12:42:05.153400', '74', 'FTP_fileUpload', 2, '[{\"changed\": {\"fields\": [\"Module type\"]}}]', 10, 1),
(160, '2023-03-01 12:42:11.153984', '73', 'Invoke_fileUpload', 2, '[{\"changed\": {\"fields\": [\"Module type\"]}}]', 10, 1),
(161, '2023-03-01 12:42:16.591968', '72', 'Download_FTP', 2, '[{\"changed\": {\"fields\": [\"Module type\"]}}]', 10, 1),
(162, '2023-03-01 12:42:21.909446', '71', 'Download_SMB', 2, '[{\"changed\": {\"fields\": [\"Module type\"]}}]', 10, 1),
(163, '2023-03-01 12:42:31.938325', '70', 'DownloadString', 2, '[{\"changed\": {\"fields\": [\"Module type\"]}}]', 10, 1),
(164, '2023-03-12 12:58:58.301685', '91', 'SeDebugPriviliege', 1, '[{\"added\": {}}]', 10, 1),
(165, '2023-03-12 13:29:00.014431', '91', 'Auto_SeDebugPrivilege', 2, '[{\"changed\": {\"fields\": [\"Module name\"]}}]', 10, 1),
(166, '2023-03-12 13:29:09.900133', '84', 'SeDebugPrivilege', 2, '[{\"changed\": {\"fields\": [\"Module name\"]}}]', 10, 1);

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
(11, 'blog', 'agenttasks'),
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
(29, 'blog', '0011_agent_created_date_agent_updated_date', '2022-12-13 16:03:33.175113'),
(30, 'blog', '0012_listenerform_ip', '2022-12-15 13:23:29.914820'),
(31, 'blog', '0013_agent_username', '2022-12-15 15:38:38.312221'),
(32, 'blog', '0014_agenttasks', '2023-02-09 13:16:42.535750'),
(33, 'blog', '0015_agenttasks_task_result', '2023-03-10 14:11:09.521381'),
(34, 'blog', '0016_agenttasks_user', '2023-03-12 12:43:32.617518');

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
('03jiik8cr72m2g61wf23y60ie818tquj', '.eJxVjDsOwjAQRO_iGllex_GHkj5niNbeNQ4gW8qnQtydREoB1Ujz3sxbjLitZdwWnseJxFWAuPx2EdOT6wHogfXeZGp1nacoD0WedJFDI37dTvfvoOBS9nUkCio7ZzNqC5zAZ2dcJO07gGQ6bzEo8Crv0TvNUffJkPJsEMhyEJ8v4OU3pQ:1pbLlJ:uFGqugakNqVn7CZsEk6Wy_VB3uYcOjItpruKCfeXsno', '2023-03-26 13:29:21.093404'),
('04w14m5ita1f9xv9v9axjjiolalhltc6', 'eyJhZ2VudE5hbWUiOiJaUUhIUEYifQ:1p739L:7o8HRt3nu1AJsK1zS-uZEMiuViJuHPxoN1ZDRLBciTw', '2023-01-01 23:32:55.793214'),
('0f09ec8w8tuah2a69etwhpy01ijxz84m', 'eyJhZ2VudE5hbWUiOiJETVJCR1kifQ:1p5vp2:URazYkpL0vgso5WHzBOOTzfEVbkGmtzp3OCZ7t0bays', '2022-12-29 21:31:20.091760'),
('26qucgoe0qlxi2qs1esjup15o7d6imbj', 'eyJhZ2VudE5hbWUiOiJWWlBJTFAifQ:1pamA1:8Zwd37inuVOxPH6HvC0efitdGUGebnHsbQqyi6zpE60', '2023-03-24 23:28:29.347240'),
('2xtlq2f4khdemslja6pjtvy78wvv6rgu', 'eyJhZ2VudE5hbWUiOiJNQVRFTUUifQ:1pZ7Bx:cpW7e4QMLe_xRBB_F2DtQ3FuV6pMIg_3VUhuBAqEKOQ', '2023-03-20 09:31:37.946845'),
('2yh832jpb5zvhodrj3z0vbdm1twl1zt5', 'eyJhZ2VudE5hbWUiOiJNQVRFTUUifQ:1pZ73l:QcyvweTX2wRMLVeEXJYp4CsmpShe6qj5cVC6V5AX0o4', '2023-03-20 09:23:09.257882'),
('39lq2m0r7awwwa243n8guosuc2mipsc9', 'eyJhZ2VudE5hbWUiOiJFV1FETEQifQ:1p73ZV:zx0Dl_EhLgffKiJQ5kp234QOoRDzwAFScTvYjXHOGHs', '2023-01-01 23:59:57.447000'),
('3h6ewm3ba3x4b3cw9nkbjufdcliifq2t', '.eJxVjDEOwyAQBP9CHSEQPgMpU6XxG6yDO4ITy0gGV1H-HltykbQ7s_MWI24tj1vldZxIXIUWl98tYHzxcgB64vIoMpalrVOQhyJPWuVQiOfb6f4FMta8v5MjMAo6sL2LFolBeUboXASVGLH3HrTvDFNIIWrE4MEqdsZbFQjdHm1c216681zE5wsXOjx7:1p719w:Eiw0avoiKsp4VLIeIsE3zU0uWk67Hq4GnbHQhfFiPro', '2023-01-01 21:25:24.274540'),
('3hhqt1m7pm9fgsm19rv4exw9sa06xcg6', 'eyJhZ2VudE5hbWUiOiJFV1FETEQifQ:1p73w1:g_eiJHOcDmgXTPwN9uE-f8_o8IC_f0UEd7hrb7tazlU', '2023-01-02 00:23:13.890029'),
('3o1tmphybx7kh8zcxufm4kjym0bx3p0w', 'eyJhZ2VudE5hbWUiOiJaUUhIUEYifQ:1pNjfG:llpGuOq1cXM-XIueCu8dHAahMpC5TDZJ3clX1_lpWVg', '2023-02-17 00:10:50.635196'),
('4yijms521i3sjfm3wamtyhagkzx3w63s', 'eyJhZ2VudE5hbWUiOiJNQVRFTUUifQ:1pZ6yz:NPzhNeP33zNVeoSkMcWigvQWsoLTQxC7ctamfh-_83I', '2023-03-20 09:18:13.681543'),
('5qdhdhplv8y3l21rh5ap71zsfafzfitg', '.eJxVjDsOwjAQBe_iGll21r-lpOcMlj9rHEC2FCcV4u4QKQW0b2bei_mwrdVvgxY_Z3Zmkp1-txjSg9oO8j20W-ept3WZI98VftDBrz3T83K4fwc1jPqtFYBIDi1MQlqFGtHSZECqLK2hkqMhJ4pTRusSAaLTAYW1hChUAgjs_QGfdjZx:1op7g2:LMxm_cR-B8PAcvOTUMXxkPv-OA7NTfC_L5IAhXeVzQ8', '2022-11-13 12:44:34.235275'),
('65hbgr59wfg1aaozop1sdcy028mhbbfx', '.eJxVjEEOwiAQRe_C2hAITAGX7j0DGZhBqgaS0q6Md9cmXej2v_f-S0Tc1hq3wUucSZyFFqffLWF-cNsB3bHdusy9rcuc5K7Igw557cTPy-H-HVQc9VsXT2AUWHCTzw6JQQVGsD6DKow4hQA6WMOUSsoaMQVwir0JTiVCL94f5qs4RQ:1p71QM:X1MceAKDb915APd-8svgjFrFXWc4sTWgVj7LIH5uvxI', '2023-01-01 21:42:22.305996'),
('69dk5hicqlors9x8wb1b7rmvq9o34ah7', 'eyJhZ2VudE5hbWUiOiJETVJCR1kifQ:1p5qVB:Hi0aejeJc6q-Ri17aezTHSinZDxzaQc88a8EohKBSyg', '2022-12-29 15:50:29.577238'),
('6ombpha0npttx06456lsbcyte2pdvbzs', 'eyJhZ2VudE5hbWUiOiJNQVRFTUUifQ:1pZ7SU:_Rw-d1bhz8dqKoWGdAOD_7VhBT_1lpuqICh40e7mFzU', '2023-03-20 09:48:42.487086'),
('76cyoyoeifxy2jd2kx3vduu0btl3ym9j', '.eJxVjDsOwjAQBe_iGln4l40p6TmDtd61cQDZUpxUiLuTSCmgfTPz3iLgupSw9jSHicVFKHH63SLSM9Ud8APrvUlqdZmnKHdFHrTLW-P0uh7u30HBXrY6KYXMo_MUrTI64whDHhQgqA3x2ZDV7C1g9pqzZe2ZrIvgCVx2hsTnC-f0OAs:1pX7vX:trTElhmppISZbqUgO_-FPRX9koXnFNnGDdSxCGMGbag', '2023-03-14 21:54:27.923812'),
('7d43wzw3iq69ernwtmiwyzcam1mkccje', 'eyJhZ2VudE5hbWUiOiJNQVRFTUUifQ:1pZ6iw:mBH98v5Fev0oNFBaIc1iS3NfalgTQmC8OppHQZ9FuRM', '2023-03-20 09:01:38.900189'),
('7ed2ignogasv35ggmg9us5h1xeukdn5b', 'eyJhZ2VudE5hbWUiOiJWTVpCWFAifQ:1pYyKF:4E28SWMHOc4WkXm-ZmTYxytIUW2zGIO8St55JlAW8hM', '2023-03-20 00:03:35.835815'),
('83jqz85jvm1qbdyqjy0dknve3rt55mte', '.eJxVjDsOwjAQBe_iGln4l40p6TmDtd61cQDZUpxUiLuTSCmgfTPz3iLgupSw9jSHicVFKHH63SLSM9Ud8APrvUlqdZmnKHdFHrTLW-P0uh7u30HBXrY6KYXMo_MUrTI64whDHhQgqA3x2ZDV7C1g9pqzZe2ZrIvgCVx2hsTnC-f0OAs:1pQ8F4:4m6URE6Am8UN2kNzSgl6ZWaK-ic4Er8h4aM1COIw9Y0', '2023-02-23 14:49:42.637533'),
('8fgbx9b6g1atklpshdeu0d6664154x54', 'eyJhZ2VudE5hbWUiOiJWTVpCWFAifQ:1pYyKW:0rv2XM76DvghAoTPMH5UZGsgbl1kNPrxk4MoMuQLSQQ', '2023-03-20 00:03:52.090563'),
('8ijdimq80ftwrqbf2j6556z5p8fwrjzp', 'eyJhZ2VudE5hbWUiOiJFV1FETEQifQ:1pMHCZ:nVQltl3O1f6bO-EWDI3hOXJBiBNBfi8DI8VyrSGSEQ0', '2023-02-12 23:35:11.984750'),
('8txylzc9ub35p5xftgvszafz0i2r2m3x', '.eJxVjEEOwiAQRe_C2hAITAGX7j0DGZhBqgaS0q6Md9cmXej2v_f-S0Tc1hq3wUucSZyFFqffLWF-cNsB3bHdusy9rcuc5K7Igw557cTPy-H-HVQc9VsXT2AUWHCTzw6JQQVGsD6DKow4hQA6WMOUSsoaMQVwir0JTiVCL94f5qs4RQ:1p6KDZ:bcD3v0FW8ykWwcCFAv1jLixnycg4iYHEV8FY0MVLP_g', '2022-12-30 23:34:17.920866'),
('9mu5xksxhxxvgyow4zr76e7j5l31y9qh', '.eJxVjDsOwjAQBe_iGll21r-lpOcMlj9rHEC2FCcV4u4QKQW0b2bei_mwrdVvgxY_Z3Zmkp1-txjSg9oO8j20W-ept3WZI98VftDBrz3T83K4fwc1jPqtFYBIDi1MQlqFGtHSZECqLK2hkqMhJ4pTRusSAaLTAYW1hChUAgjs_QGfdjZx:1oqwCm:kUwZ0hbWFTi6tELkYZs9N6Ryr3jN95y168T5zXOXruo', '2022-11-18 12:53:52.923814'),
('a0ajsutl85m6ptc46bzlfkuclcss7dju', 'eyJhZ2VudE5hbWUiOiJNQVRFTUUifQ:1pYyPq:YPqYPq7o7M0dVnw-KZ3BJ9Vh6-cOwIVA3hr8kSM9XeQ', '2023-03-20 00:09:22.502188'),
('asxahoj68y9in2pxxa9e2ketn1l3k58q', 'eyJhZ2VudE5hbWUiOiJWWlBJTFAifQ:1pbK4G:tg9XZgFKONPSw6lgIGTJa0-pGag6YqsZES7TOXqZzBU', '2023-03-26 11:40:48.091294'),
('bh08okh8kezplworz8vxiiuqmzeqnxkw', '.eJxVjEEOwiAQRe_C2hAITAGX7j0DGZhBqgaS0q6Md9cmXej2v_f-S0Tc1hq3wUucSZyFFqffLWF-cNsB3bHdusy9rcuc5K7Igw557cTPy-H-HVQc9VsXT2AUWHCTzw6JQQVGsD6DKow4hQA6WMOUSsoaMQVwir0JTiVCL94f5qs4RQ:1p6K3A:cLj8osX_cunL9ripRjL4cUw6V0O8f3Xz3uZVglf6rVM', '2022-12-30 23:23:32.601451'),
('bvx2pavxp45j9vbjnrh3nqbx89vwzqbb', 'eyJhZ2VudE5hbWUiOiJFV1FETEQifQ:1p73xQ:MuM7FuU92x37W4U4lX3WBBuYh4W-_nLAoGMYl9h7TrE', '2023-01-02 00:24:40.351377'),
('c6j5q8nsfe8dv2o2snnz30lnp7tev1v8', 'eyJhZ2VudE5hbWUiOiJNQVRFTUUifQ:1pZ76H:8xGTj9Ran4fOWkJbiFFUmhBm4L9xZY4YruxUHbTUKmI', '2023-03-20 09:25:45.484417'),
('df0t36q0wvfxjyqpsgniiqsarr63z4ln', '.eJxVjDsOwjAQRO_iGllex_GHkj5niNbeNQ4gW8qnQtydREoB1Ujz3sxbjLitZdwWnseJxFWAuPx2EdOT6wHogfXeZGp1nacoD0WedJFDI37dTvfvoOBS9nUkCio7ZzNqC5zAZ2dcJO07gGQ6bzEo8Crv0TvNUffJkPJsEMhyEJ8v4OU3pQ:1pXN6m:Bpry_O-A1EjTsl9xnociad191Psy8tVPe1UTjmYunSM', '2023-03-15 14:07:04.410017'),
('dfj6cdbqy25f5fb71ix6yw0nxrytcbzt', 'eyJhZ2VudE5hbWUiOiJOR0ZaUEgifQ:1pXMZz:cO37qCHIZOiAi4j_YXzM6YqTAEr13HoqWzer6uG6s48', '2023-03-15 13:33:11.456308'),
('dtipfsy8fjvrvb614uskuwmnp3ofhgbs', 'eyJhZ2VudE5hbWUiOiJMSUNXVFUifQ:1p5puD:YRx8UueyVvkSMYXOB9CWSkH58DQkaDgvvuvTP1NlyyI', '2022-12-29 15:12:17.512257'),
('dwo2kgehduz564w2ggmv1b32u0q5c6n9', 'eyJhZ2VudE5hbWUiOiJNQVRFTUUifQ:1pZ6oE:43gXlCKtSs7joIrIbB3hv4KP6mAdWaLOgR8MzGDts5Y', '2023-03-20 09:07:06.079759'),
('emsui0w30998nar6w324q39nj2613ydh', 'eyJhZ2VudE5hbWUiOiJOR0ZaUEgifQ:1pXMnr:KGPkyQEjQ23roPJ5TWljBzGMWhcPFeepnBxhnQOSerQ', '2023-03-15 13:47:31.280748'),
('eo4fftyszaiqo9xcbujxmh9i3ks23qp8', 'eyJhZ2VudE5hbWUiOiJFV1FETEQifQ:1pMGs9:WKEmPbNceFautRNFnM43WPv7yoVgBI27I-QbtxgxQJk', '2023-02-12 23:14:05.899754'),
('er2msm0jhi9rek8gtlvt1q1tk85axun8', '.eJxVjDsOwjAQBe_iGln4l40p6TmDtd61cQDZUpxUiLuTSCmgfTPz3iLgupSw9jSHicVFKHH63SLSM9Ud8APrvUlqdZmnKHdFHrTLW-P0uh7u30HBXrY6KYXMo_MUrTI64whDHhQgqA3x2ZDV7C1g9pqzZe2ZrIvgCVx2hsTnC-f0OAs:1pX7UL:ACTz0-QFhTeDBTkBgtuJFLAQhv_C_NWrlo-9Im1WGtc', '2023-03-14 21:26:21.339320'),
('fcvwzafi70sm4c50t7v6385ze5gp9f8h', 'eyJhZ2VudE5hbWUiOiJWTVpCWFAifQ:1pYyLF:xD6aEM7ZMkGBapZUN2gPd-HS1cIV8kOccPvhTTNm20k', '2023-03-20 00:04:37.963381'),
('ffkmtxohnmj9wox5b4pwd62vq559zb1v', '.eJxVjDsOwjAQBe_iGll21r-lpOcMlj9rHEC2FCcV4u4QKQW0b2bei_mwrdVvgxY_Z3Zmkp1-txjSg9oO8j20W-ept3WZI98VftDBrz3T83K4fwc1jPqtFYBIDi1MQlqFGtHSZECqLK2hkqMhJ4pTRusSAaLTAYW1hChUAgjs_QGfdjZx:1olUXq:N9mYZcQTKkF441xKs8JclFkNfC407UwZzvw5CLmqGQ4', '2022-11-03 12:21:06.188784'),
('fjjxjii6eoew1r2gbcxbizyf6iw0sge4', '.eJxVjDsOwjAQBe_iGll21r-lpOcMlj9rHEC2FCcV4u4QKQW0b2bei_mwrdVvgxY_Z3Zmkp1-txjSg9oO8j20W-ept3WZI98VftDBrz3T83K4fwc1jPqtFYBIDi1MQlqFGtHSZECqLK2hkqMhJ4pTRusSAaLTAYW1hChUAgjs_QGfdjZx:1ooAER:hvZ_kl_Jh-FgCuwfW14-fmGGglFuywIX_uXYrjBuP84', '2022-11-10 21:16:07.793420'),
('frr91x0u9mi8daechmerxlbyyqisq7m4', '.eJxVjEEOwiAQRe_C2hAITAGX7j0DGZhBqgaS0q6Md9cmXej2v_f-S0Tc1hq3wUucSZyFFqffLWF-cNsB3bHdusy9rcuc5K7Igw557cTPy-H-HVQc9VsXT2AUWHCTzw6JQQVGsD6DKow4hQA6WMOUSsoaMQVwir0JTiVCL94f5qs4RQ:1p6LpG:eY59qzpXIlPgqNed5waL-C1JIdSsW4puVJW0aBaXcrw', '2022-12-31 01:17:18.426188'),
('fuc4rz6terys5l4ay35rpn80qwik80n6', 'eyJhZ2VudE5hbWUiOiJaUUhIUEYifQ:1pMHHD:Mr9YRyQVIgW_l1f8KiHG18JIRJrsvU8lssQGI8GOSTk', '2023-02-12 23:39:59.305351'),
('g3y44q5b6l3tkmuqkrb2p8qogdwjf629', 'eyJhZ2VudE5hbWUiOiJaUUhIUEYifQ:1pNjeg:RI21fryYpJJO2qsGr2d0Oj90p14LOwElbjjoENerZX8', '2023-02-17 00:10:14.226648'),
('gh1g8ug2e5f6pmlvn83l0ez3kndij5kh', 'eyJhZ2VudE5hbWUiOiJMSUNXVFUifQ:1p5p5f:ksj0FGO8GusoIb1_lTXKXnbMsmJ-NbGawPumHvmfhb4', '2022-12-29 14:20:03.933630'),
('gjrr44psswmyv5hasxg4hjpferd4libz', 'eyJhZ2VudE5hbWUiOiJETVJCR1kifQ:1p6KIQ:j9c_O3ZTpM7-XnM5Cac_yOs3gMBRKrC8oK9yxbM6-80', '2022-12-30 23:39:18.093404'),
('hwpzwn6ao1k3vqxwwqfaluxgzwxi78k0', 'eyJhZ2VudE5hbWUiOiJETVJCR1kifQ:1p5qZk:mljkEmwqJtcFxN0lKr54JEVAjcWX6cA5w7loV51-RDs', '2022-12-29 15:55:12.485128'),
('hyauwhwr7kkf8pt9foob30y05od2w49h', '.eJxVjDsOwjAQBe_iGll21r-lpErDGSJ_NiQQxVLsVIi740gpoH0zb95s8Hudhr3QNsyJXZlkl98t-Pii9QDp6ddH5jGvdZsDPxR-0sLvOdFyO92_wOTL1N4KQESHFjohrUKNaKkzIFWS1tCYgiEnRqeM1mMACE57FNYSolARwLdopVJbqacls88Xtl46pw:1p5n9H:VPrmQEgcydiIhKEM4LnGvQzUbPLiUSKUrDVN79IA1EY', '2022-12-29 12:15:39.733762'),
('j58gm49m7fmr4aos8o4gf10b6o1cfit6', '.eJxVjEEOwiAQRe_C2hAITAGX7j0DGZhBqgaS0q6Md9cmXej2v_f-S0Tc1hq3wUucSZyFFqffLWF-cNsB3bHdusy9rcuc5K7Igw557cTPy-H-HVQc9VsXT2AUWHCTzw6JQQVGsD6DKow4hQA6WMOUSsoaMQVwir0JTiVCL94f5qs4RQ:1p6K3y:Go1z5XhRrw98WRwFuIdvvAulqm5o_AvBIgTuzN2CH7U', '2022-12-30 23:24:22.804274'),
('j5jprayidvvv3fpkt00wopfrtozw1cjr', 'eyJhZ2VudE5hbWUiOiJFV1FETEQifQ:1pNi6U:O9l0sRn8HG3LcTcgKQqWBMnA6zVNGRMAV49BvYMgW8k', '2023-02-16 22:30:50.550688'),
('jqsxwfzkjx6ctt07m1imbkigb6nv7y0d', 'eyJhZ2VudE5hbWUiOiJNQVRFTUUifQ:1pZ7Ga:xpghpn6y5GAWMe8OrzmQcdFG0zIB9KVAYFmioj8O_5E', '2023-03-20 09:36:24.511413'),
('knesz529jy1dp8qundjqxkaaygmeugd9', 'eyJhZ2VudE5hbWUiOiJETVJCR1kifQ:1p6LkW:xcApsYI3PKgDoCiihXwJQJBXU_DXfcXaH__xxC_zRKo', '2022-12-31 01:12:24.912974'),
('m2f688bvtn4iffzr6tfetq24r62mftyn', '.eJxVjDsOwjAQBe_iGll21r-lpErDGSJ_NiQQxVLsVIi740gpoH0zb95s8Hudhr3QNsyJXZlkl98t-Pii9QDp6ddH5jGvdZsDPxR-0sLvOdFyO92_wOTL1N4KQESHFjohrUKNaKkzIFWS1tCYgiEnRqeM1mMACE57FNYSolARwLdopVJbqacls88Xtl46pw:1p3PPO:Uqpt1kXfpt-KMpiQl6VVEzWM0smoweZ_m-3w5gjNKHk', '2022-12-22 22:30:26.830553'),
('mplryir6e3v1g7k7xq4snb9s21eskgc8', 'eyJhZ2VudE5hbWUiOiJNQVRFTUUifQ:1pZ7db:jc8CIfTuN59I6tnhQJZkNm4f5nUzSpGZ3XfWBjnyQRM', '2023-03-20 10:00:11.552191'),
('n3i25679ihytj64ymjnxmuu5x6eqdx28', 'eyJhZ2VudE5hbWUiOiJNQVRFTUUifQ:1pZ6r8:GlYBwbt9eDz44LlCFneyUbxJ7OaBOJ-Rw8kzBMLUO7A', '2023-03-20 09:10:06.349216'),
('nyke7c9whv3k86cjxch3uqgaxfy6nkm0', 'eyJhZ2VudE5hbWUiOiJFV1FETEQifQ:1p73xB:W-thsTs8vd0KcJnXYRwD3HDZW0GrtGGPFFzqEfQm3A0', '2023-01-02 00:24:25.043183'),
('o4sd6lmzm7nxdtdh2dgmpvx0fin7n3br', 'eyJhZ2VudE5hbWUiOiJFV1FETEQifQ:1pMHC4:bxF9N0-5SNxyIvVdaGgw-mgtpvWBGPHuRmDqm04ijG0', '2023-02-12 23:34:40.576448'),
('p9s6lcqb4wvjhe35s6676c88qlkogmny', 'eyJhZ2VudE5hbWUiOiJUVktGUkcifQ:1pYyQE:ltbKf0quQkDZ6IZX5RhNTMM2Plx76tobEpwVwEv7IjY', '2023-03-20 00:09:46.671993'),
('pr5ama9h89h1qwn5w93bgloulmsu3px6', '.eJxVjDsOwjAQBe_iGln4l40p6TmDtd61cQDZUpxUiLuTSCmgfTPz3iLgupSw9jSHicVFKHH63SLSM9Ud8APrvUlqdZmnKHdFHrTLW-P0uh7u30HBXrY6KYXMo_MUrTI64whDHhQgqA3x2ZDV7C1g9pqzZe2ZrIvgCVx2hsTnC-f0OAs:1pQSxp:lbQK-UowpIlEZeOjTbkTKOPlWn_F5XQT2656D92ZCVo', '2023-02-24 12:57:17.568505'),
('ps1wqvk4pgk69pdhx473fu5bpg3033m3', 'eyJhZ2VudE5hbWUiOiJOR0ZaUEgifQ:1pXNI8:66pTsgbNOwqBFN2aDIXLh1GNScttacaC0YpQrfYNJuo', '2023-03-15 14:18:48.782558'),
('pv8ayac1oqwhrq36jalfuut92cepljda', '.eJxVjEEOwiAQRe_C2hAITAGX7j0DGZhBqgaS0q6Md9cmXej2v_f-S0Tc1hq3wUucSZyFFqffLWF-cNsB3bHdusy9rcuc5K7Igw557cTPy-H-HVQc9VsXT2AUWHCTzw6JQQVGsD6DKow4hQA6WMOUSsoaMQVwir0JTiVCL94f5qs4RQ:1p71QT:S4Irg9kzDPtjZ4cvMf9sxUoHbZaIvxkHdz8dZMgUSxs', '2023-01-01 21:42:29.074869'),
('q2cgqaouioxpiy15prp0qd9tsg3404ib', 'eyJhZ2VudE5hbWUiOiJaUUhIUEYifQ:1pMHH0:HaIlD-9gB6kqLLMFjlbEk119arFz0EyFwGQJbpjeQ4c', '2023-02-12 23:39:46.900392'),
('qbgewmf8atgubednyxiuirhm2ei2uhjf', 'eyJhZ2VudE5hbWUiOiJNQVRFTUUifQ:1pZ9JB:-jeTnSm-49hQ6HPaiajW6EH3h7zixYYcFtvAdWiXlgs', '2023-03-20 11:47:13.861039'),
('qdr6fjqwk5dj4df34oend7v55dtqya1r', 'eyJhZ2VudE5hbWUiOiJFV1FETEQifQ:1p744j:H1-XC8t_UBC2zXjapo3ZtvvYLjZvKLxER530b2PUUFY', '2023-01-02 00:32:13.242797'),
('qf1mw84litrbdg2uhj44zuazg8f65loe', 'eyJhZ2VudE5hbWUiOiJOR0ZaUEgifQ:1pXMgs:ASloaKk2Uijj5IhJfWCP3JqYZBzWfNFrMF8Fk6I4jyU', '2023-03-15 13:40:18.034384'),
('qhfe8zvgs7aftnbbnf57qufu0b3c66cj', 'eyJhZ2VudE5hbWUiOiJNQVRFTUUifQ:1pZ7Il:AxxfyHFnv0AhiN2eTuMdHv5HeGjb3mxnDjaHGV5iF6w', '2023-03-20 09:38:39.274604'),
('s5rib14hicq2xpbjbiwb0hzoighsex2m', '.eJxVjEEOwiAQRe_C2hAITAGX7j0DGZhBqgaS0q6Md9cmXej2v_f-S0Tc1hq3wUucSZyFFqffLWF-cNsB3bHdusy9rcuc5K7Igw557cTPy-H-HVQc9VsXT2AUWHCTzw6JQQVGsD6DKow4hQA6WMOUSsoaMQVwir0JTiVCL94f5qs4RQ:1pMGqg:2LWHayIH8ueR7TV-sVuFyXXZZ7fq4PqRnIfZ6KQ249k', '2023-02-12 23:12:34.339617'),
('t4rmg0fh6owsfqeeghh3fvm2ev2mv495', '.eJxVjDEOwyAQBP9CHSEQPgMpU6XxG6yDO4ITy0gGV1H-HltykbQ7s_MWI24tj1vldZxIXIUWl98tYHzxcgB64vIoMpalrVOQhyJPWuVQiOfb6f4FMta8v5MjMAo6sL2LFolBeUboXASVGLH3HrTvDFNIIWrE4MEqdsZbFQjdHm1c216681zE5wsXOjx7:1p5oDC:IJ7G8tbamIm6MGMkKQFUPEQJ3pZWIUf6vfDtZTnh4RY', '2022-12-29 13:23:46.107247'),
('u38xytwv769vh9jt2v1tepeiupyyibev', '.eJxVjEEOwiAQRe_C2hAITAGX7j0DGZhBqgaS0q6Md9cmXej2v_f-S0Tc1hq3wUucSZyFFqffLWF-cNsB3bHdusy9rcuc5K7Igw557cTPy-H-HVQc9VsXT2AUWHCTzw6JQQVGsD6DKow4hQA6WMOUSsoaMQVwir0JTiVCL94f5qs4RQ:1p72iK:A1SnE4n_dIzvNSkiRQkK08tkcGhPQWna39ZI1qIFgak', '2023-01-01 23:05:00.761896'),
('umstiilj4uhwjhzdfongnl2xpaq3d4g3', 'eyJhZ2VudE5hbWUiOiJWWlBJTFAifQ:1pbL7S:OBfmzk5QZNh444Pbga6LOU-NFN2qg-xfG_4V5QHnIpU', '2023-03-26 12:48:10.603648'),
('uxhibwv0zimb8ufqtghsxe3336uvhtvu', 'eyJhZ2VudE5hbWUiOiJFV1FETEQifQ:1pMHBu:zf1CgI-UmrMft3u8GtEGAOFqgSgiYW2UWL2gHHTgbKg', '2023-02-12 23:34:30.703866'),
('va1wzymphjoo04osdbc2dvatlrskk7gu', 'eyJhZ2VudE5hbWUiOiJOR0ZaUEgifQ:1p5vvj:NNcPL2lZfWoO4KXzXF_1FJmQmVoJ6mJI-6aT9B37EAs', '2022-12-29 21:38:15.114521'),
('vnab4fh1695xtwpee269b9tinyciw72w', '.eJxVjDsOwjAQBe_iGll21r-lpOcMlj9rHEC2FCcV4u4QKQW0b2bei_mwrdVvgxY_Z3Zmkp1-txjSg9oO8j20W-ept3WZI98VftDBrz3T83K4fwc1jPqtFYBIDi1MQlqFGtHSZECqLK2hkqMhJ4pTRusSAaLTAYW1hChUAgjs_QGfdjZx:1olTI4:vWi9GqL4cENxdjVNG4d-AmN2zhFT11VAtusJF2hIcE4', '2022-11-03 11:00:44.367033'),
('wedkg9k6gkqs0wuvzyl44f7lm2dtpbiw', '.eJxVjDsOwjAQBe_iGll21r-lpErDGSJ_NiQQxVLsVIi740gpoH0zb95s8Hudhr3QNsyJXZlkl98t-Pii9QDp6ddH5jGvdZsDPxR-0sLvOdFyO92_wOTL1N4KQESHFjohrUKNaKkzIFWS1tCYgiEnRqeM1mMACE57FNYSolARwLdopVJbqacls88Xtl46pw:1p3Pkg:su_liNRKV4JIRIO9PZU6ndQHRzqHxz_ZsiPLhE80FOQ', '2022-12-22 22:52:26.564398'),
('wswalagvqmxvxhh8n7z4126984gmwyfs', '.eJxVjDsOwjAQBe_iGll21r-lpOcMlj9rHEC2FCcV4u4QKQW0b2bei_mwrdVvgxY_Z3Zmkp1-txjSg9oO8j20W-ept3WZI98VftDBrz3T83K4fwc1jPqtFYBIDi1MQlqFGtHSZECqLK2hkqMhJ4pTRusSAaLTAYW1hChUAgjs_QGfdjZx:1olSuO:0XpsH1tKce17ouHOBos3l7N1oxO6Dyt4Gz9fXGOYV0c', '2022-11-03 10:36:16.138598'),
('xp5pobyqnzugf5un7dw66awdksw17ix4', 'eyJhZ2VudE5hbWUiOiJNQVRFTUUifQ:1pZ8zS:_NISdTwboNktgtJTj_9xNmItw5CqV1u4JJTJrZ3TDg0', '2023-03-20 11:26:50.629347'),
('y98pqow2gesuwdt3dq7a50zj7r1dvh60', 'eyJhZ2VudE5hbWUiOiJNQVRFTUUifQ:1pYyWo:j3PTmXwnXNKGcJciFPKs5RFWg4v2uA5nSwPtP1oLjw4', '2023-03-20 00:16:34.511707');

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
-- Indexes for table `blog_agenttasks`
--
ALTER TABLE `blog_agenttasks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `blog_agenttasks_agent_id_83bb1206_fk_blog_agent_id` (`agent_id`),
  ADD KEY `blog_agenttasks_module_id_c7795aab_fk_blog_modules_id` (`module_id`),
  ADD KEY `blog_agenttasks_user_id_dfec30b6_fk_auth_user_id` (`user_id`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

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
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `blog_agenttasks`
--
ALTER TABLE `blog_agenttasks`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=103;

--
-- AUTO_INCREMENT for table `blog_listenerform`
--
ALTER TABLE `blog_listenerform`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `blog_modules`
--
ALTER TABLE `blog_modules`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=92;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=167;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

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
-- Constraints for table `blog_agenttasks`
--
ALTER TABLE `blog_agenttasks`
  ADD CONSTRAINT `blog_agenttasks_agent_id_83bb1206_fk_blog_agent_id` FOREIGN KEY (`agent_id`) REFERENCES `blog_agent` (`id`),
  ADD CONSTRAINT `blog_agenttasks_module_id_c7795aab_fk_blog_modules_id` FOREIGN KEY (`module_id`) REFERENCES `blog_modules` (`id`),
  ADD CONSTRAINT `blog_agenttasks_user_id_dfec30b6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

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
