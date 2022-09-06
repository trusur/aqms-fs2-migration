-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Aug 30, 2022 at 12:19 PM
-- Server version: 5.7.33
-- PHP Version: 7.4.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `aqms_fs2_migration`
--

-- --------------------------------------------------------

--
-- Table structure for table `a_groups`
--

CREATE TABLE `a_groups` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(50) NOT NULL,
  `menu_ids` text NOT NULL,
  `privileges` text NOT NULL,
  `xtimestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `a_groups`
--

INSERT INTO `a_groups` (`id`, `name`, `menu_ids`, `privileges`, `xtimestamp`) VALUES
(1, 'Administrator', '1,2,3,4,5,', '15,15,15,15,15,', '2021-05-20 04:25:19'),
(2, 'Operator', '1,4,5,', '15,15,15,', '2021-05-20 04:25:19');

-- --------------------------------------------------------

--
-- Table structure for table `a_menu`
--

CREATE TABLE `a_menu` (
  `id` int(10) UNSIGNED NOT NULL,
  `seqno` int(11) NOT NULL DEFAULT '0',
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `name_id` varchar(100) NOT NULL DEFAULT '',
  `name_en` varchar(100) NOT NULL DEFAULT '',
  `url` varchar(255) NOT NULL DEFAULT '',
  `icon` varchar(100) NOT NULL DEFAULT '',
  `xtimestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `a_menu`
--

INSERT INTO `a_menu` (`id`, `seqno`, `parent_id`, `name_id`, `name_en`, `url`, `icon`, `xtimestamp`) VALUES
(1, 1, 0, 'Beranda', 'Home', '/', '', '2021-05-20 04:25:19'),
(2, 2, 0, 'Konfigurasi', 'Configuration', 'configuration', '', '2021-05-20 04:25:19'),
(3, 3, 0, 'Parameter', 'Parameters', 'parameter', '', '2021-05-20 04:25:19'),
(4, 4, 0, 'Kalibrasi', 'Calibrations', 'calibration', '', '2021-05-20 04:25:19'),
(5, 5, 0, 'Ekspor', 'Export', 'export', '', '2021-05-20 04:25:19');

-- --------------------------------------------------------

--
-- Table structure for table `a_users`
--

CREATE TABLE `a_users` (
  `id` int(10) UNSIGNED NOT NULL,
  `group_id` int(11) NOT NULL DEFAULT '0',
  `email` varchar(100) NOT NULL DEFAULT '0',
  `password` varchar(255) NOT NULL DEFAULT '',
  `name` varchar(100) NOT NULL DEFAULT '',
  `xtimestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `a_users`
--

INSERT INTO `a_users` (`id`, `group_id`, `email`, `password`, `name`, `xtimestamp`) VALUES
(1, 0, 'superuser@aqms', '$argon2i$v=19$m=65536,t=4,p=1$dERlLmNabU91VU9VQWsvaA$YYS1ohqMxbQjkRtn96vS68B83M0HR6wu3p+HOE8vYtE', 'Superuser', '2022-08-18 13:23:19'),
(2, 1, 'admin@aqms', '$argon2i$v=19$m=65536,t=4,p=1$R1FSbEMwYWZRWlJKMEwuTg$Wdl4gb5ugJWwGuFdqpjYdqLrSLRCfKAadUxA3LV1tTw', 'Adminstrator', '2021-05-20 04:25:20'),
(3, 2, 'operator@aqms', '$argon2i$v=19$m=65536,t=4,p=1$R1FSbEMwYWZRWlJKMEwuTg$Wdl4gb5ugJWwGuFdqpjYdqLrSLRCfKAadUxA3LV1tTw', 'Operator', '2021-05-20 04:25:20');

-- --------------------------------------------------------

--
-- Table structure for table `calibrations`
--

CREATE TABLE `calibrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `calibrator_name` varchar(255) NOT NULL,
  `started_at` varchar(20) NOT NULL,
  `finished_at` varchar(20) NOT NULL,
  `sensor_reader_id` int(11) NOT NULL DEFAULT '0',
  `pin` int(11) NOT NULL DEFAULT '0',
  `value` text NOT NULL,
  `xtimestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `configurations`
--

CREATE TABLE `configurations` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(50) NOT NULL,
  `content` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `configurations`
--

INSERT INTO `configurations` (`id`, `name`, `content`) VALUES
(1, 'aqms_code', 'AQMS_FS2'),
(2, 'id_stasiun', 'MASTER'),
(3, 'nama_stasiun', 'AQMS MASTER'),
(4, 'address', '-'),
(5, 'city', ''),
(6, 'province', ''),
(7, 'latitude', '0'),
(8, 'longitude', '0'),
(9, 'pump_interval', '360'),
(10, 'pump_state', '1'),
(11, 'pump_last', '2022-08-22 15:23:10'),
(12, 'pump_speed', '200'),
(13, 'selenoid_state', 'q'),
(14, 'selenoid_names', ''),
(15, 'selenoid_commands', 'q;w;e;r'),
(16, 'purge_state', 'o'),
(17, 'data_interval', '30'),
(18, 'graph_interval', '0'),
(19, 'is_sampling', '0'),
(20, 'sampler_operator_name', ''),
(21, 'id_sampling', ''),
(22, 'start_sampling', '0'),
(23, 'zerocal_schedule', '00:00:00'),
(24, 'zerocal_duration', '360'),
(25, 'is_zerocal', '0'),
(26, 'calibrator_name', ''),
(27, 'zerocal_started_at', ''),
(28, 'zerocal_finished_at', ''),
(29, 'is_cems', '0'),
(30, 'is_valve_calibrator', '1'),
(31, 'is_psu_restarting', '1'),
(32, 'restart_schedule', ''),
(33, 'last_restart_schedule', ''),
(34, 'is_sentto_klhk', '1'),
(35, 'klhk_api_server', 'ispu.menlhk.go.id'),
(36, 'klhk_api_username', 'pt_trusur_unggul_teknusa'),
(37, 'klhk_api_password', 'c6eXK8EUpbuCoaki'),
(38, 'klhk_api_key', ''),
(39, 'is_sentto_trusur', '1'),
(40, 'trusur_api_server', 'api.trusur.tech'),
(41, 'trusur_api_username', 'KLHK-2019'),
(42, 'trusur_api_password', 'Project2016-2019'),
(43, 'trusur_api_key', 'VHJ1c3VyVW5nZ3VsVGVrbnVzYV9wVA=='),
(44, 'iot_path', '/iot/iot/'),
(45, 'setSpan', '');

-- --------------------------------------------------------

--
-- Table structure for table `ispu`
--

CREATE TABLE `ispu` (
  `id` int(10) UNSIGNED NOT NULL,
  `ispu_at` datetime NOT NULL,
  `parameter_id` int(11) NOT NULL DEFAULT '0',
  `value` double NOT NULL DEFAULT '0',
  `ispu` int(11) NOT NULL DEFAULT '0',
  `xtimestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `measurements`
--

CREATE TABLE `measurements` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `time_group` datetime NOT NULL,
  `parameter_id` int(11) NOT NULL DEFAULT '0',
  `value` double NOT NULL DEFAULT '0',
  `sensor_value` double NOT NULL DEFAULT '0',
  `is_sent_cloud` tinyint(4) NOT NULL DEFAULT '0',
  `sent_cloud_at` datetime NOT NULL,
  `is_sent_klhk` tinyint(4) NOT NULL DEFAULT '0',
  `sent_klhk_at` datetime NOT NULL,
  `xtimestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `measurement_histories`
--

CREATE TABLE `measurement_histories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `parameter_id` int(11) NOT NULL DEFAULT '0',
  `value` double NOT NULL DEFAULT '0',
  `sensor_value` double NOT NULL DEFAULT '0',
  `is_averaged` tinyint(4) NOT NULL DEFAULT '0',
  `xtimestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `measurement_logs`
--

CREATE TABLE `measurement_logs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `parameter_id` int(11) NOT NULL DEFAULT '0',
  `value` double NOT NULL DEFAULT '0',
  `sensor_value` double NOT NULL DEFAULT '0',
  `is_averaged` tinyint(4) NOT NULL DEFAULT '0',
  `xtimestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `version` varchar(255) NOT NULL,
  `class` varchar(255) NOT NULL,
  `group` varchar(255) NOT NULL,
  `namespace` varchar(255) NOT NULL,
  `time` int(11) NOT NULL,
  `batch` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `version`, `class`, `group`, `namespace`, `time`, `batch`) VALUES
(1, '2021-05-02-100939', 'App\\Database\\Migrations\\Configurations', 'default', 'App', 1621484654, 1),
(2, '2021-05-02-101023', 'App\\Database\\Migrations\\Measurements', 'default', 'App', 1621484654, 1),
(3, '2021-05-02-101033', 'App\\Database\\Migrations\\MeasurementLogs', 'default', 'App', 1621484655, 1),
(4, '2021-05-02-101052', 'App\\Database\\Migrations\\Ispu', 'default', 'App', 1621484655, 1),
(5, '2021-05-02-101105', 'App\\Database\\Migrations\\Parameters', 'default', 'App', 1621484655, 1),
(6, '2021-05-02-101127', 'App\\Database\\Migrations\\SerialPorts', 'default', 'App', 1621484655, 1),
(7, '2021-05-02-101151', 'App\\Database\\Migrations\\AGroups', 'default', 'App', 1621484655, 1),
(8, '2021-05-02-101157', 'App\\Database\\Migrations\\AMenu', 'default', 'App', 1621484655, 1),
(9, '2021-05-02-101200', 'App\\Database\\Migrations\\AUsers', 'default', 'App', 1621484655, 1),
(10, '2021-05-02-101313', 'App\\Database\\Migrations\\SensorReaders', 'default', 'App', 1621484655, 1),
(11, '2021-05-02-101324', 'App\\Database\\Migrations\\SensorValues', 'default', 'App', 1621484655, 1),
(12, '2021-05-02-101336', 'App\\Database\\Migrations\\SensorValueLogs', 'default', 'App', 1621484655, 1),
(13, '2021-05-02-131550', 'App\\Database\\Migrations\\MeasurementHistories', 'default', 'App', 1621484656, 1),
(14, '2021-05-05-101829', 'App\\Database\\Migrations\\AlterMeasurements', 'default', 'App', 1621484656, 1),
(15, '2021-05-05-233406', 'App\\Database\\Migrations\\AlterMeasurements20210506', 'default', 'App', 1621484656, 1),
(16, '2021-11-15-115849', 'App\\Database\\Migrations\\Calibrations', 'default', 'App', 1656312976, 2),
(17, '2021-11-18-025803', 'App\\Database\\Migrations\\AlterCalibration20211118', 'default', 'App', 1656312976, 2),
(18, '2022-04-06-071743', 'App\\Database\\Migrations\\AlterSerialPorts', 'default', 'App', 1656312976, 2),
(19, '2022-04-13-010212', 'App\\Database\\Migrations\\InsertConfiguration20220413', 'default', 'App', 1656312976, 2),
(20, '2022-04-13-014124', 'App\\Database\\Migrations\\InsertNewParameters20220413', 'default', 'App', 1656312976, 2),
(21, '2022-05-23-010213', 'App\\Database\\Migrations\\IsValveCalibrator', 'default', 'App', 1656312976, 2),
(22, '2022-05-23-091431', 'App\\Database\\Migrations\\IsPsuRestarting', 'default', 'App', 1656312976, 2),
(23, '2022-05-24-101126', 'App\\Database\\Migrations\\RestartSchedule', 'default', 'App', 1656312976, 2),
(24, '2022-05-30-011414', 'App\\Database\\Migrations\\ConfigurationsServers', 'default', 'App', 1656312976, 2);

-- --------------------------------------------------------

--
-- Table structure for table `parameters`
--

CREATE TABLE `parameters` (
  `id` int(10) UNSIGNED NOT NULL,
  `code` varchar(20) NOT NULL,
  `caption_id` varchar(100) NOT NULL,
  `caption_en` varchar(100) NOT NULL,
  `default_unit` varchar(10) NOT NULL,
  `molecular_mass` double NOT NULL DEFAULT '0',
  `formula` varchar(255) NOT NULL,
  `is_view` tinyint(4) NOT NULL DEFAULT '0',
  `p_type` varchar(30) NOT NULL DEFAULT 'gas',
  `is_graph` tinyint(4) NOT NULL DEFAULT '0',
  `sensor_value_id` int(11) NOT NULL DEFAULT '0',
  `voltage1` double NOT NULL DEFAULT '0',
  `voltage2` double NOT NULL DEFAULT '0',
  `concentration1` double NOT NULL DEFAULT '0',
  `concentration2` double NOT NULL DEFAULT '0',
  `xtimestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `parameters`
--

INSERT INTO `parameters` (`id`, `code`, `caption_id`, `caption_en`, `default_unit`, `molecular_mass`, `formula`, `is_view`, `p_type`, `is_graph`, `sensor_value_id`, `voltage1`, `voltage2`, `concentration1`, `concentration2`, `xtimestamp`) VALUES
(1, 'no2', 'NO<sub>2</sub>', 'NO<sub>2</sub>', 'µg/m<sup>3', 46.01, 'round((explode(\";\",$sensor[1][0])[1]) * 46010 / 24.45)', 1, 'gas', 1, 1, 0, 0, 0, 0, '2022-08-18 14:40:16'),
(2, 'o3', 'O<sub>3</sub>', 'O<sub>3</sub>', 'µg/m<sup>3', 48, 'round(abs(explode(\";\",$sensor[1][0])[4])* 48000 / 24.45,0)', 1, 'gas', 1, 0, 0, 0, 0, 0, '2022-08-18 14:00:10'),
(3, 'co', 'CO', 'CO', 'µg/m<sup>3', 28.01, 'round(abs(explode(\";\",$sensor[2][0])[2])* 28010 / 24.45,0)', 1, 'gas', 1, 0, 0, 0, 0, 0, '2022-08-18 14:28:16'),
(4, 'so2', 'SO<sub>2</sub>', 'SO<sub>2</sub>', 'µg/m<sup>3', 64.06, 'round(abs(explode(\";\",$sensor[1][0])[2])* 64060 / 24.45,0)', 1, 'gas', 1, 0, 0, 0, 0, 0, '2022-08-18 14:28:45'),
(5, 'hc', 'HC', 'HC', 'µg/m<sup>3', 13.0186, 'round(abs(explode(\";\",$sensor[2][0])[4])* 13018.6/ 24.45,0)', 1, 'gas', 1, 0, 0, 0, 0, 0, '2022-08-18 14:09:57'),
(6, 'h2s', 'H<sub>2</sub>S', 'H<sub>2</sub>S', 'µg/m<sup>3', 34.08, '', 0, 'gas', 0, 0, 0, 0, 0, 0, '2021-05-20 04:25:20'),
(7, 'cs2', 'CS<sub>2</sub>', 'CS<sub>2</sub>', 'µg/m<sup>3', 76.1407, '', 0, 'gas', 0, 0, 0, 0, 0, 0, '2021-05-20 04:25:20'),
(8, 'nh3', 'NH<sub>3</sub>', 'NH<sub>3</sub>', 'µg/m<sup>3', 76.1407, '', 0, 'gas', 0, 0, 0, 0, 0, 0, '2021-05-20 04:25:20'),
(9, 'ch4', 'CH<sub>4</sub>', 'CH<sub>4</sub>', 'µg/m<sup>3', 16.04, '', 0, 'gas', 0, 0, 0, 0, 0, 0, '2021-05-20 04:25:20'),
(10, 'voc', 'VOC', 'VOC', 'µg/m<sup>3', 78.9516, '', 0, 'gas', 0, 0, 0, 0, 0, 0, '2021-05-20 04:25:20'),
(11, 'nmhc', 'NMHC', 'NMHC', 'µg/m<sup>3', 110, '', 0, 'gas', 0, 0, 0, 0, 0, 0, '2021-05-20 04:25:20'),
(12, 'pm25', 'PM2.5', 'PM2.5', 'µg/m<sup>3', 0, 'substr($sensor[4][0],2,7) * 1000', 1, 'particulate', 1, 1, 0, 0, 0, 0, '2022-08-18 13:56:43'),
(13, 'pm25_flow', 'PM2.5 Flow', 'PM2.5 Flow', 'l/mnt', 0, 'substr($sensor[4][0],10,3)', 1, 'particulate_flow', 1, 0, 0, 0, 0, 0, '2022-08-18 13:53:42'),
(14, 'pm10', 'PM10', 'PM10', 'µg/m<sup>3', 0, 'substr($sensor[3][0],2,7) * 1000', 1, 'particulate', 1, 5, 0, 0, 0, 0, '2022-08-18 13:57:24'),
(15, 'pm10_flow', 'PM10 Flow', 'PM10 Flow', 'l/mnt', 0, 'substr($sensor[3][0],10,3)', 1, 'particulate_flow', 1, 0, 0, 0, 0, 0, '2022-08-18 13:51:59'),
(16, 'tsp', 'TSP', 'TSP', 'µg/m<sup>3', 0, '', 0, 'particulate', 0, 0, 0, 0, 0, 0, '2021-05-20 04:25:20'),
(17, 'tsp_flow', 'TSP Flow', 'TSP Flow', 'l/mnt', 0, '', 0, 'particulate_flow', 0, 0, 0, 0, 0, 0, '2021-05-20 04:25:20'),
(18, 'pressure', 'Tekanan', 'Barometer', 'MBar', 0, 'round((explode(\";\",$sensor[5][0])[2] * 33.8639),2)', 1, 'weather', 0, 5, 0, 0, 0, 0, '2022-08-18 13:42:58'),
(19, 'wd', 'Arah angin', 'Wind Direction', '°', 0, 'explode(\";\",$sensor[5][0])[8]', 1, 'weather', 0, 0, 0, 0, 0, 0, '2022-08-18 13:43:06'),
(20, 'ws', 'Kec. Angin', 'Wind Speed', 'Km/h', 0, 'explode(\";\",$sensor[5][0])[6]', 1, 'weather', 0, 0, 0, 0, 0, 0, '2022-08-18 13:43:21'),
(21, 'temperature', 'Suhu', 'Temperature', '°C', 0, 'round((explode(\";\",$sensor[5][0])[5] - 32) * 5/9,1)', 1, 'weather', 0, 0, 0, 0, 0, 0, '2022-08-18 13:43:31'),
(22, 'humidity', 'Kelembaban', 'Humidity', '%', 0, 'explode(\";\",$sensor[5][0])[9]', 1, 'weather', 0, 0, 0, 0, 0, 0, '2022-08-18 13:43:52'),
(23, 'sr', 'Solar Radiasi', 'Solar Radiation', 'watt/m2', 0, 'explode(\";\",$sensor[5][0])[12]', 1, 'weather', 0, 0, 0, 0, 0, 0, '2022-08-18 13:43:41'),
(24, 'rain_intensity', 'Curah Hujan', 'Rain Rate', 'mm/h', 0, 'explode(\";\",$sensor[5][0])[15]', 1, 'weather', 0, 5, 0, 0, 0, 0, '2022-08-18 13:44:16'),
(25, 'pm10_bar', 'Tekanan', 'Barometer', 'MBar', 0, '', 0, 'weather', 0, 0, 0, 0, 0, 0, '2021-05-20 04:25:20'),
(26, 'pm10_humid', 'Kelembaban', 'Humidity', '%', 0, '', 0, 'weather', 0, 0, 0, 0, 0, 0, '2021-05-20 04:25:20'),
(27, 'pm10_temp', 'Suhu', 'Temperature', '°C', 0, '', 0, 'weather', 0, 0, 0, 0, 0, 0, '2021-05-20 04:25:20'),
(28, 'pm25_bar', 'Tekanan', 'Barometer', 'MBar', 0, '', 0, 'weather', 0, 0, 0, 0, 0, 0, '2021-05-20 04:25:20'),
(29, 'pm25_humid', 'Kelembaban', 'Humidity', '%', 0, '', 0, 'weather', 0, 0, 0, 0, 0, 0, '2021-05-20 04:25:20'),
(30, 'pm25_temp', 'Suhu', 'Temperature', '°C', 0, '', 0, 'weather', 0, 0, 0, 0, 0, 0, '2021-05-20 04:25:20'),
(31, 'co2', 'CO<sub>2</sub>', 'CO<sub>2</sub>', 'µg/m<sup>3', 44.01, 'round((explode(\";\",$sensor[9][0])[0]) * 44010 / 24.45,3)', 0, 'gas', 0, 0, 0, 0, 0, 0, '2022-08-18 13:39:52'),
(32, 'o2', 'O<sub>2</sub>', 'O<sub>2</sub>', 'µg/m<sup>3', 15.99, 'round((explode(\";\",$sensor[10][0])[0]) * 15990 / 24.45,3)', 0, 'gas', 0, 0, 0, 0, 0, 0, '2022-08-18 13:39:14'),
(33, 'no', 'NO', 'NO', 'µg/m<sup>3', 30.0061, 'round((explode(\";\",$sensor[10][0])[0]) * 30006.1 / 24.45,3)', 0, 'gas', 0, 0, 0, 0, 0, 0, '2022-08-18 13:40:07');

-- --------------------------------------------------------

--
-- Table structure for table `sensor_readers`
--

CREATE TABLE `sensor_readers` (
  `id` int(10) UNSIGNED NOT NULL,
  `driver` varchar(50) NOT NULL,
  `sensor_code` varchar(30) NOT NULL,
  `baud_rate` varchar(100) NOT NULL,
  `pins` varchar(200) NOT NULL,
  `xtimestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sensor_readers`
--

INSERT INTO `sensor_readers` (`id`, `driver`, `sensor_code`, `baud_rate`, `pins`, `xtimestamp`) VALUES
(1, 'fs2_membrasens_v4.py', '/dev/ttyMEMBRASENS2', '19200', '', '2022-08-18 13:35:39'),
(2, 'fs2_membrasens_v4.py', '/dev/ttyMEMBRASENS1', '19200', '', '2022-08-18 13:35:39'),
(3, 'metone_82840.py', '/dev/ttyS1', '9600', '', '2022-08-18 13:11:38'),
(4, 'metone_82840.py', '/dev/ttyS0', '9600', '', '2022-08-18 13:11:42'),
(5, 'vantagepro2.py', '/dev/ttyWS', '19200', '', '2022-06-27 07:32:51'),
(6, 'fs2_autozerovalve.py', '/dev/ttyACM0', '9600', '', '2022-08-30 12:06:36');

-- --------------------------------------------------------

--
-- Table structure for table `sensor_values`
--

CREATE TABLE `sensor_values` (
  `id` int(10) UNSIGNED NOT NULL,
  `sensor_reader_id` int(11) NOT NULL DEFAULT '0',
  `pin` int(11) NOT NULL DEFAULT '0',
  `value` text NOT NULL,
  `xtimestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sensor_values`
--

INSERT INTO `sensor_values` (`id`, `sensor_reader_id`, `pin`, `value`, `xtimestamp`) VALUES
(1, 2, 0, 'FS2_MEMBRASENS;0;-0.7778670191764832;0;0.06369435787200928;0.04734954610466957;0.0007091521983966231;0.5026798248291016;0.49907949566841125;0;0;0;0;END;', '2022-08-22 08:23:24'),
(2, 1, 0, 'FS2_MEMBRASENS;0;0;0;0;0;0;0;0;0;0;0;0;END;', '2022-08-22 08:23:18'),
(3, 1, 0, 'FS2_MEMBRASENS;0;0;0;0;1.676108479499817;1.6744173765182495;0.4994067847728729;0.5003341436386108;0;0;0;0;END;', '2022-08-22 08:23:18'),
(4, 4, 0, 'b\'000.000,0.0,+0.0,0,0,00,*0\r\n\'', '2022-08-22 08:23:23'),
(5, 2, 0, 'FS2_MEMBRASENS;0;0;0;0;0;0;0;0;0;0;0;0;END;', '2022-08-22 08:23:24'),
(6, 5, 0, ';0;0;0;0;0;0;0;0;0;0;0;0;0.0;0;0;0;0', '2022-08-22 08:23:26'),
(7, 5, 0, ';0;0;0;0;0;0;0;0;0;0;0;0;0.0;0;0;0;0', '2022-08-22 08:23:26'),
(8, 3, 0, 'b\'000.027,2.0,+30.1,042,1008.4,00,*01533\r\n\'', '2022-08-22 08:23:26'),
(9, 3, 0, 'b\'000.028,2.0,+30.1,042,1008.4,00,*01534\r\n\'', '2022-08-22 08:23:27'),
(10, 4, 0, 'b\'000.000,0.0,+0.0,0,0,00,*0\r\n\'', '2022-08-22 08:23:28');

-- --------------------------------------------------------

--
-- Table structure for table `sensor_value_logs`
--

CREATE TABLE `sensor_value_logs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `sensor_value_id` int(11) NOT NULL DEFAULT '0',
  `value` varchar(255) NOT NULL DEFAULT '',
  `xtimestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `serial_ports`
--

CREATE TABLE `serial_ports` (
  `id` int(10) UNSIGNED NOT NULL,
  `port` varchar(20) NOT NULL,
  `id_product` varchar(100) NOT NULL,
  `id_vendor` varchar(100) NOT NULL,
  `serial` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `is_used` tinyint(4) NOT NULL DEFAULT '0',
  `xtimestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `a_groups`
--
ALTER TABLE `a_groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `a_menu`
--
ALTER TABLE `a_menu`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parent_id` (`parent_id`);

--
-- Indexes for table `a_users`
--
ALTER TABLE `a_users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `group_id` (`group_id`);

--
-- Indexes for table `calibrations`
--
ALTER TABLE `calibrations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `calibrator_name` (`calibrator_name`),
  ADD KEY `started_at` (`started_at`),
  ADD KEY `sensor_reader_id` (`sensor_reader_id`),
  ADD KEY `pin` (`pin`);

--
-- Indexes for table `configurations`
--
ALTER TABLE `configurations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`);

--
-- Indexes for table `ispu`
--
ALTER TABLE `ispu`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ispu_at` (`ispu_at`),
  ADD KEY `parameter_id` (`parameter_id`);

--
-- Indexes for table `measurements`
--
ALTER TABLE `measurements`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `time_group_parameter_id` (`time_group`,`parameter_id`),
  ADD KEY `is_sent_cloud` (`is_sent_cloud`),
  ADD KEY `is_sent_klhk` (`is_sent_klhk`);

--
-- Indexes for table `measurement_histories`
--
ALTER TABLE `measurement_histories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parameter_id` (`parameter_id`),
  ADD KEY `is_averaged` (`is_averaged`);

--
-- Indexes for table `measurement_logs`
--
ALTER TABLE `measurement_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `parameter_id` (`parameter_id`),
  ADD KEY `is_averaged` (`is_averaged`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `parameters`
--
ALTER TABLE `parameters`
  ADD PRIMARY KEY (`id`),
  ADD KEY `code` (`code`);

--
-- Indexes for table `sensor_readers`
--
ALTER TABLE `sensor_readers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sensor_values`
--
ALTER TABLE `sensor_values`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sensor_reader_id` (`sensor_reader_id`),
  ADD KEY `pin` (`pin`);

--
-- Indexes for table `sensor_value_logs`
--
ALTER TABLE `sensor_value_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sensor_value_id` (`sensor_value_id`);

--
-- Indexes for table `serial_ports`
--
ALTER TABLE `serial_ports`
  ADD PRIMARY KEY (`id`),
  ADD KEY `port` (`port`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `a_groups`
--
ALTER TABLE `a_groups`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `a_menu`
--
ALTER TABLE `a_menu`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `a_users`
--
ALTER TABLE `a_users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `calibrations`
--
ALTER TABLE `calibrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `configurations`
--
ALTER TABLE `configurations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `ispu`
--
ALTER TABLE `ispu`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `measurements`
--
ALTER TABLE `measurements`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `measurement_histories`
--
ALTER TABLE `measurement_histories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `measurement_logs`
--
ALTER TABLE `measurement_logs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `parameters`
--
ALTER TABLE `parameters`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `sensor_readers`
--
ALTER TABLE `sensor_readers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `sensor_values`
--
ALTER TABLE `sensor_values`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `sensor_value_logs`
--
ALTER TABLE `sensor_value_logs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `serial_ports`
--
ALTER TABLE `serial_ports`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
