-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- 主機： 127.0.0.1
-- 產生時間： 2025-09-16 06:46:54
-- 伺服器版本： 10.4.32-MariaDB
-- PHP 版本： 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 資料庫： `ohmygod`
--

-- --------------------------------------------------------

--
-- 資料表結構 `classroom`
--

CREATE TABLE `classroom` (
  `floor` int(11) NOT NULL,
  `id` int(11) NOT NULL,
  `door_1_status` int(11) NOT NULL,
  `door_2_status` int(11) DEFAULT NULL,
  `door_3_status` int(11) DEFAULT NULL,
  `lightstatus` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- 傾印資料表的資料 `classroom`
--

INSERT INTO `classroom` (`floor`, `id`, `door_1_status`, `door_2_status`, `door_3_status`, `lightstatus`) VALUES
(1, 104, 1, 1, NULL, 1),
(1, 105, 1, 1, NULL, 1),
(1, 106, 1, 1, NULL, 1),
(1, 107, 1, 1, NULL, 1),
(1, 108, 1, 1, NULL, 1),
(1, 109, 1, 1, NULL, 1),
(1, 110, 1, NULL, NULL, 1),
(1, 111, 1, NULL, NULL, NULL),
(1, 112, 1, NULL, NULL, NULL),
(1, 113, 1, NULL, NULL, NULL),
(1, 114, 1, NULL, NULL, NULL),
(1, 115, 1, NULL, NULL, NULL),
(1, 116, 1, NULL, NULL, NULL),
(1, 117, 0, NULL, NULL, NULL),
(1, 118, 1, NULL, NULL, NULL),
(1, 119, 0, NULL, NULL, NULL),
(2, 201, 1, 1, NULL, 1),
(2, 202, 0, 1, NULL, 1),
(2, 203, 1, 1, NULL, 1),
(2, 204, 0, 1, NULL, 1),
(2, 205, 0, 1, NULL, 1),
(2, 206, 1, NULL, NULL, 1),
(2, 207, 1, NULL, NULL, 1),
(2, 208, 1, NULL, NULL, 1),
(2, 209, 1, NULL, NULL, NULL),
(2, 210, 1, NULL, NULL, NULL),
(2, 211, 1, NULL, NULL, NULL),
(2, 212, 1, NULL, NULL, NULL),
(2, 213, 1, NULL, NULL, NULL),
(2, 214, 1, NULL, NULL, NULL),
(2, 215, 1, NULL, NULL, NULL),
(2, 216, 1, NULL, NULL, NULL),
(2, 217, 1, NULL, NULL, NULL),
(2, 218, 1, NULL, NULL, NULL),
(2, 219, 1, NULL, NULL, NULL),
(2, 220, 1, NULL, NULL, NULL),
(3, 301, 1, 1, NULL, 1),
(3, 302, 1, NULL, NULL, 1),
(3, 303, 1, NULL, NULL, 1),
(3, 304, 1, NULL, NULL, 1),
(3, 305, 1, NULL, NULL, 1),
(3, 306, 1, 1, NULL, 1),
(3, 307, 1, 1, NULL, 1),
(3, 308, 1, 1, NULL, 1),
(3, 309, 1, 1, NULL, 1),
(3, 310, 0, 0, 0, 1),
(3, 311, 1, NULL, NULL, 0),
(3, 312, 1, NULL, NULL, NULL),
(3, 313, 1, NULL, NULL, 1),
(3, 314, 1, NULL, NULL, NULL),
(3, 315, 1, NULL, NULL, NULL),
(3, 316, 1, NULL, NULL, NULL),
(3, 317, 0, NULL, NULL, NULL),
(3, 318, 1, NULL, NULL, NULL),
(3, 319, 1, NULL, NULL, 1),
(3, 320, 1, NULL, NULL, NULL),
(3, 321, 0, NULL, NULL, 1),
(3, 322, 1, NULL, NULL, NULL),
(3, 323, 1, NULL, NULL, NULL),
(4, 401, 1, 1, NULL, 1),
(4, 402, 1, NULL, NULL, 1),
(4, 403, 1, NULL, NULL, 0),
(4, 404, 1, NULL, NULL, 1),
(4, 405, 1, NULL, NULL, 1),
(4, 406, 1, NULL, NULL, 1),
(4, 407, 1, 1, NULL, 1),
(4, 408, 1, 1, NULL, 1),
(4, 409, 1, 1, NULL, 1),
(4, 410, 1, 1, NULL, 1),
(4, 411, 1, 1, 1, 1),
(4, 412, 1, NULL, NULL, 1),
(4, 413, 1, 1, NULL, 1),
(4, 414, 1, NULL, NULL, 1),
(4, 415, 1, NULL, NULL, NULL),
(4, 416, 1, NULL, NULL, NULL),
(4, 417, 1, NULL, NULL, NULL),
(4, 418, 1, NULL, NULL, NULL),
(4, 419, 1, NULL, NULL, NULL),
(5, 501, 1, 1, NULL, 1),
(5, 502, 1, NULL, NULL, 1),
(5, 503, 1, NULL, NULL, 1),
(5, 504, 1, NULL, NULL, 1),
(5, 505, 1, NULL, NULL, 0),
(5, 506, 1, NULL, NULL, 1),
(5, 507, 1, NULL, NULL, 1),
(5, 508, 1, 1, NULL, 1),
(5, 509, 1, 1, NULL, 1),
(5, 510, 1, 1, NULL, 1),
(5, 511, 1, 1, NULL, 1),
(5, 512, 1, 1, NULL, 1),
(5, 513, 1, NULL, NULL, 1),
(5, 514, 1, NULL, NULL, 1),
(5, 515, 1, NULL, NULL, NULL),
(5, 516, 1, NULL, NULL, NULL),
(5, 517, 1, NULL, NULL, NULL),
(5, 518, 1, NULL, NULL, NULL),
(5, 519, 1, NULL, NULL, NULL),
(6, 601, 1, 1, NULL, 1),
(6, 602, 1, NULL, NULL, 1),
(6, 603, 1, NULL, NULL, 1),
(6, 604, 1, NULL, NULL, 0),
(6, 605, 1, NULL, NULL, 1),
(6, 606, 1, 1, NULL, 1),
(6, 607, 1, NULL, NULL, 1),
(6, 608, 1, NULL, NULL, 1),
(6, 609, 1, 1, NULL, 1),
(6, 610, 1, 1, NULL, 1),
(6, 611, 1, NULL, NULL, 1),
(6, 612, 1, NULL, NULL, 1),
(6, 613, 1, NULL, NULL, 1),
(6, 614, 1, NULL, NULL, NULL),
(6, 615, 1, NULL, NULL, NULL),
(6, 616, 1, NULL, NULL, NULL),
(6, 617, 1, NULL, NULL, NULL),
(6, 618, 1, NULL, NULL, NULL),
(6, 619, 1, NULL, NULL, NULL),
(7, 701, 0, 0, NULL, 0),
(7, 702, 0, NULL, NULL, 0),
(7, 703, 0, NULL, NULL, 0),
(7, 704, 1, 1, NULL, 1),
(7, 705, 0, NULL, NULL, 1),
(7, 706, 0, 0, NULL, 0),
(7, 707, 0, 0, NULL, 0),
(7, 708, 0, NULL, NULL, 1),
(7, 709, 0, NULL, NULL, 0),
(7, 710, 0, 1, NULL, 1),
(7, 711, 0, NULL, NULL, 0),
(7, 712, 1, NULL, NULL, 1),
(7, 713, 0, NULL, NULL, 1),
(7, 714, 0, NULL, NULL, NULL),
(7, 715, 0, NULL, NULL, NULL),
(7, 716, 0, NULL, NULL, NULL),
(7, 717, 0, NULL, NULL, NULL),
(7, 718, 0, NULL, NULL, NULL),
(7, 719, 0, NULL, NULL, NULL),
(8, 801, 1, NULL, NULL, 1),
(8, 802, 1, NULL, NULL, 1),
(8, 803, 1, NULL, NULL, 0),
(8, 804, 1, NULL, NULL, 1),
(8, 805, 1, NULL, NULL, 0),
(8, 806, 1, NULL, NULL, 1),
(8, 807, 1, NULL, NULL, 1),
(8, 808, 1, NULL, NULL, 1),
(8, 809, 1, 1, NULL, 1),
(8, 810, 1, 1, NULL, 1),
(8, 811, 1, NULL, NULL, 1),
(8, 812, 1, NULL, NULL, 1),
(8, 813, 1, 1, NULL, 1),
(8, 814, 1, NULL, NULL, 1),
(8, 815, 1, NULL, NULL, 1),
(8, 816, 1, NULL, NULL, 1),
(8, 817, 1, NULL, NULL, NULL),
(8, 818, 1, NULL, NULL, NULL),
(8, 819, 1, NULL, NULL, NULL),
(8, 820, 1, NULL, NULL, NULL),
(8, 821, 1, NULL, NULL, NULL),
(8, 822, 1, NULL, NULL, NULL),
(9, 901, 1, 1, NULL, 1),
(9, 902, 1, NULL, NULL, 1),
(9, 903, 1, NULL, NULL, 1),
(9, 904, 1, NULL, NULL, 1),
(9, 905, 1, NULL, NULL, 1),
(9, 906, 1, NULL, NULL, 1),
(9, 907, 1, NULL, NULL, 1),
(9, 908, 1, NULL, NULL, 1),
(9, 909, 1, 1, NULL, 1),
(9, 910, 1, 1, NULL, 1),
(9, 911, 1, 1, NULL, 1),
(9, 912, 1, NULL, NULL, 1),
(9, 913, 1, NULL, NULL, 1),
(9, 914, 1, NULL, NULL, 1),
(9, 915, 1, NULL, NULL, NULL),
(9, 916, 1, NULL, NULL, NULL),
(9, 917, 1, NULL, NULL, NULL),
(9, 918, 1, NULL, NULL, NULL),
(9, 919, 1, NULL, NULL, NULL),
(9, 920, 1, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- 資料表結構 `classroom_712`
--

CREATE TABLE `classroom_712` (
  `id` int(11) NOT NULL,
  `door_712` int(11) DEFAULT NULL,
  `light_712` int(11) DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- 資料表結構 `classroom_811`
--

CREATE TABLE `classroom_811` (
  `id` int(11) NOT NULL,
  `door_811` int(11) DEFAULT NULL,
  `light_811` int(11) DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- 資料表結構 `home_2_light`
--

CREATE TABLE `home_2_light` (
  `id` int(11) NOT NULL,
  `light` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- 傾印資料表的資料 `home_2_light`
--

INSERT INTO `home_2_light` (`id`, `light`) VALUES
(408, 1),
(410, 1),
(412, 1),
(507, 1),
(509, 1),
(510, 1),
(511, 1),
(512, 1),
(514, 1),
(516, 1),
(607, 1),
(608, 1),
(609, 1),
(610, 1),
(611, 1),
(612, 1),
(614, 1),
(616, 1),
(618, 1),
(634, 1);

-- --------------------------------------------------------

--
-- 資料表結構 `teacher`
--

CREATE TABLE `teacher` (
  `id` int(20) NOT NULL,
  `name` varchar(20) NOT NULL,
  `value` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- 傾印資料表的資料 `teacher`
--

INSERT INTO `teacher` (`id`, `name`, `value`) VALUES
(1, '林士勛', 1),
(2, '鄭建富', 0),
(3, '馬尚彬', 1),
(4, '林致宇', 0),
(5, '辛華昀', 1),
(6, '陳世曄', 1),
(7, '蔡宗惠', 1),
(8, '周祥順', 0),
(9, '羅家堯', 0),
(10, '蔡宗儒', 0),
(11, '黃智賢', 1),
(12, '江海邦', 1),
(13, '陳政營', 1),
(14, '吳允中', 0),
(15, '林泰源', 1),
(16, '洪文誼', 1),
(17, '程華淮', 1),
(18, '張欽圳', 1),
(19, '葉春超', 1),
(20, '蔡東佐', 1),
(21, '蔡宇軒', 1),
(22, '翁世光', 1),
(23, '李孟書', 1),
(24, '丁培毅', 1),
(25, '張光遠', 1),
(26, '許玉平', 1),
(27, '馬永昌', 1),
(28, '阮義聰', 1),
(29, '林川傑', 1),
(30, '鄭錫齊', 1),
(31, '林韓禹', 1),
(32, '林清池', 1),
(33, '趙志民', 1),
(34, '張雅惠', 1),
(35, '嚴茂旭', 1),
(36, '許為元', 1);

-- --------------------------------------------------------

--
-- 資料表結構 `trash`
--

CREATE TABLE `trash` (
  `id` int(11) NOT NULL,
  `full` int(11) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- 傾印資料表的資料 `trash`
--

INSERT INTO `trash` (`id`, `full`, `timestamp`) VALUES
(1, 0, '2024-08-28 15:27:12'),
(2, 0, '2024-08-28 15:28:03'),
(3, 0, '2024-08-28 15:38:19'),
(4, 0, '2024-08-28 15:39:29'),
(5, 1, '2024-08-28 15:40:47'),
(6, 1, '2024-08-28 15:41:54'),
(7, 0, '2024-08-28 15:54:56'),
(8, 0, '2024-10-08 14:03:04'),
(9, 0, '2024-10-08 14:03:15'),
(10, 1, '2024-10-08 14:04:23'),
(11, 0, '2024-10-08 14:05:34'),
(12, 1, '2024-10-08 14:06:42'),
(13, 0, '2024-10-08 14:07:58'),
(14, 1, '2024-10-08 14:09:06'),
(15, 1, '2024-10-08 14:10:17'),
(16, 0, '2024-10-20 06:14:47'),
(17, 0, '2024-10-20 06:15:57'),
(18, 0, '2024-10-20 06:17:30'),
(19, 1, '2024-10-20 06:18:39'),
(20, 0, '2024-10-20 06:24:36'),
(21, 1, '2024-10-20 06:25:44'),
(22, 0, '2024-10-20 06:27:11'),
(23, 0, '2024-10-20 06:27:17'),
(24, 1, '2024-10-20 06:27:24'),
(25, 1, '2024-10-20 06:28:50'),
(26, 1, '2024-10-20 06:30:00'),
(27, 1, '2024-10-20 06:31:16'),
(28, 1, '2024-10-20 06:45:52'),
(29, 1, '2024-10-20 07:10:23'),
(30, 1, '2024-10-20 07:14:38'),
(31, 0, '2024-10-20 07:22:16'),
(32, 1, '2024-10-20 07:23:24'),
(33, 1, '2024-10-20 07:58:00'),
(34, 1, '2024-10-27 06:29:53'),
(35, 1, '2024-10-27 06:31:05'),
(36, 0, '2024-10-27 06:32:15');

-- --------------------------------------------------------

--
-- 資料表結構 `trash_fake`
--

CREATE TABLE `trash_fake` (
  `id` int(11) NOT NULL,
  `full` int(11) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- 傾印資料表的資料 `trash_fake`
--

INSERT INTO `trash_fake` (`id`, `full`, `timestamp`) VALUES
(101, 1, '2024-10-27 07:16:17'),
(102, 1, '2024-10-27 06:36:51'),
(201, 1, '2024-08-29 13:39:46'),
(301, 1, '2024-08-29 13:39:46'),
(401, 1, '2024-08-29 13:39:46'),
(501, 1, '2024-08-29 13:39:46'),
(601, 1, '2024-08-29 13:39:46'),
(701, 1, '2024-08-29 13:39:46'),
(801, 1, '2024-08-29 13:39:46'),
(901, 1, '2024-08-29 13:39:46');

--
-- 已傾印資料表的索引
--

--
-- 資料表索引 `classroom`
--
ALTER TABLE `classroom`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `classroom_712`
--
ALTER TABLE `classroom_712`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `classroom_811`
--
ALTER TABLE `classroom_811`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `teacher`
--
ALTER TABLE `teacher`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `trash`
--
ALTER TABLE `trash`
  ADD PRIMARY KEY (`id`);

--
-- 資料表索引 `trash_fake`
--
ALTER TABLE `trash_fake`
  ADD PRIMARY KEY (`id`);

--
-- 在傾印的資料表使用自動遞增(AUTO_INCREMENT)
--

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `classroom_712`
--
ALTER TABLE `classroom_712`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `classroom_811`
--
ALTER TABLE `classroom_811`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=366;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `trash`
--
ALTER TABLE `trash`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
