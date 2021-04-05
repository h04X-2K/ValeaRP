-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 07. Okt 2020 um 21:41
-- Server-Version: 10.4.6-MariaDB
-- PHP-Version: 7.3.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `gta`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `accounts`
--

CREATE TABLE `accounts` (
  `id` int(11) NOT NULL,
  `username` varchar(64) NOT NULL DEFAULT 'N/A',
  `email` varchar(64) NOT NULL,
  `socialid` bigint(64) UNSIGNED NOT NULL,
  `password` varchar(256) NOT NULL,
  `hwid` bigint(255) UNSIGNED NOT NULL DEFAULT 0,
  `online` int(1) NOT NULL DEFAULT 0,
  `whitelisted` tinyint(1) NOT NULL,
  `ban` tinyint(1) NOT NULL,
  `banReason` varchar(128) NOT NULL,
  `adminlevel` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `accounts_characters`
--

CREATE TABLE `accounts_characters` (
  `charId` int(11) NOT NULL,
  `accountId` int(11) NOT NULL,
  `charname` varchar(35) NOT NULL,
  `death` tinyint(1) NOT NULL,
  `accState` int(11) NOT NULL DEFAULT 0,
  `firstjoin` tinyint(1) NOT NULL,
  `firstspawnplace` varchar(32) NOT NULL,
  `firstJoinTimestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  `gender` tinyint(1) NOT NULL COMMENT '0 = male, 1 = female',
  `birthdate` varchar(32) NOT NULL,
  `birthplace` varchar(64) NOT NULL DEFAULT 'None',
  `health` int(11) NOT NULL DEFAULT 100,
  `armor` int(11) NOT NULL DEFAULT 0,
  `hunger` int(11) NOT NULL DEFAULT 100,
  `thirst` int(11) NOT NULL DEFAULT 100,
  `address` varchar(64) NOT NULL DEFAULT 'Boulevard Del Perro 2a',
  `phonenumber` int(11) NOT NULL,
  `isCrime` tinyint(1) NOT NULL DEFAULT 0,
  `paydayTime` int(11) NOT NULL,
  `job` varchar(64) NOT NULL DEFAULT 'None',
  `jobHourCounter` int(11) NOT NULL DEFAULT 0,
  `lastJobPaycheck` timestamp NOT NULL DEFAULT current_timestamp(),
  `weapon_primary` varchar(128) NOT NULL DEFAULT 'None',
  `weapon_primary_ammo` int(11) NOT NULL DEFAULT 0,
  `weapon_secondary` varchar(128) NOT NULL DEFAULT 'None',
  `weapon_secondary_ammo` int(11) NOT NULL DEFAULT 0,
  `weapon_secondary2` varchar(128) NOT NULL DEFAULT 'None',
  `weapon_secondary2_ammo` int(11) NOT NULL DEFAULT 0,
  `weapon_fist` varchar(128) NOT NULL DEFAULT 'None',
  `weapon_fist_ammo` int(11) NOT NULL DEFAULT 0,
  `isUnconscious` tinyint(1) NOT NULL DEFAULT 0,
  `unconsciousTime` int(11) NOT NULL DEFAULT 0,
  `isFastFarm` tinyint(1) NOT NULL DEFAULT 0,
  `fastFarmTime` int(11) NOT NULL DEFAULT 0,
  `lastLogin` timestamp NOT NULL DEFAULT current_timestamp(),
  `isPhoneEquipped` tinyint(1) NOT NULL DEFAULT 0,
  `playtimeHours` int(11) NOT NULL DEFAULT 0,
  `isInJail` tinyint(1) NOT NULL DEFAULT 0,
  `jailTime` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `characters_bank`
--

CREATE TABLE `characters_bank` (
  `id` int(11) NOT NULL,
  `charid` int(11) NOT NULL,
  `accountnumber` int(11) NOT NULL,
  `money` int(11) NOT NULL,
  `pin` int(11) NOT NULL,
  `mainaccount` tinyint(1) NOT NULL DEFAULT 0,
  `closed` tinyint(1) NOT NULL DEFAULT 0 COMMENT '1 = gesperrt, 0 = entsperrt',
  `pinTrys` int(11) NOT NULL DEFAULT 0 COMMENT 'wie oft ein PIN falsch eingegeben wurde',
  `createZone` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `characters_inventory`
--

CREATE TABLE `characters_inventory` (
  `id` int(11) NOT NULL,
  `charid` int(11) NOT NULL,
  `itemName` varchar(128) NOT NULL,
  `itemAmount` int(11) NOT NULL,
  `itemLocation` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `characters_lastpos`
--

CREATE TABLE `characters_lastpos` (
  `charid` int(11) NOT NULL,
  `lastPosX` float NOT NULL,
  `lastPosY` float NOT NULL,
  `lastPosZ` float NOT NULL,
  `lastDimension` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `characters_licenses`
--

CREATE TABLE `characters_licenses` (
  `id` int(11) NOT NULL,
  `charId` int(11) NOT NULL,
  `pkw` tinyint(1) NOT NULL DEFAULT 0,
  `lkw` tinyint(1) NOT NULL DEFAULT 0,
  `bike` tinyint(1) NOT NULL DEFAULT 0,
  `boat` tinyint(1) NOT NULL DEFAULT 0,
  `fly` tinyint(1) NOT NULL DEFAULT 0,
  `helicopter` tinyint(1) NOT NULL DEFAULT 0,
  `passengertransport` tinyint(1) NOT NULL DEFAULT 0,
  `weaponlicense` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `characters_minijobs`
--

CREATE TABLE `characters_minijobs` (
  `id` int(11) NOT NULL,
  `charId` int(11) NOT NULL,
  `jobName` varchar(64) NOT NULL,
  `exp` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `characters_ownedclothes`
--

CREATE TABLE `characters_ownedclothes` (
  `id` int(11) NOT NULL,
  `charId` int(11) NOT NULL,
  `clothesName` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `characters_permissions`
--

CREATE TABLE `characters_permissions` (
  `id` int(11) NOT NULL,
  `charId` int(11) NOT NULL,
  `permissionName` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `characters_phone_chatmessages`
--

CREATE TABLE `characters_phone_chatmessages` (
  `id` int(11) NOT NULL,
  `chatId` int(11) NOT NULL,
  `fromNumber` int(11) NOT NULL,
  `toNumber` int(11) NOT NULL,
  `unix` int(11) NOT NULL,
  `message` varchar(2560) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `characters_phone_chats`
--

CREATE TABLE `characters_phone_chats` (
  `chatId` int(11) NOT NULL,
  `phoneNumber` int(11) NOT NULL,
  `anotherNumber` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `characters_phone_contacts`
--

CREATE TABLE `characters_phone_contacts` (
  `contactId` int(11) NOT NULL,
  `phoneNumber` int(11) NOT NULL,
  `contactName` varchar(64) NOT NULL,
  `contactNumber` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `characters_skin`
--

CREATE TABLE `characters_skin` (
  `id` int(11) NOT NULL,
  `charId` int(11) NOT NULL,
  `facefeatures` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `headblendsdata` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `headoverlays` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `clothesTop` varchar(64) NOT NULL DEFAULT 'None',
  `clothesTorso` varchar(64) NOT NULL DEFAULT 'None',
  `clothesLeg` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT 'None',
  `clothesFeet` varchar(64) NOT NULL DEFAULT 'None',
  `clothesHat` varchar(64) NOT NULL DEFAULT 'None',
  `clothesGlass` varchar(64) NOT NULL DEFAULT 'None',
  `clothesEarring` varchar(64) NOT NULL DEFAULT 'None',
  `clothesNecklace` varchar(64) NOT NULL DEFAULT 'None',
  `clothesMask` varchar(64) NOT NULL DEFAULT 'None',
  `clothesArmor` varchar(64) NOT NULL DEFAULT 'None',
  `clothesUndershirt` varchar(64) NOT NULL DEFAULT 'None',
  `clothesBracelet` varchar(64) NOT NULL DEFAULT 'None',
  `clothesWatch` varchar(64) NOT NULL DEFAULT 'None',
  `clothesBag` varchar(64) NOT NULL DEFAULT 'None',
  `clothesDecal` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `characters_tablet_apps`
--

CREATE TABLE `characters_tablet_apps` (
  `id` int(11) NOT NULL,
  `charId` int(11) NOT NULL,
  `weather` tinyint(1) NOT NULL DEFAULT 0,
  `news` tinyint(1) NOT NULL DEFAULT 0,
  `banking` tinyint(1) NOT NULL DEFAULT 0,
  `lifeinvader` tinyint(1) NOT NULL DEFAULT 0,
  `vehicles` tinyint(1) NOT NULL DEFAULT 0,
  `events` tinyint(1) NOT NULL DEFAULT 0,
  `company` tinyint(1) NOT NULL DEFAULT 0,
  `buyapp` tinyint(1) NOT NULL DEFAULT 0,
  `notices` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `characters_tablet_tutorial`
--

CREATE TABLE `characters_tablet_tutorial` (
  `id` int(11) NOT NULL,
  `charId` int(11) NOT NULL,
  `openTablet` tinyint(1) NOT NULL DEFAULT 0,
  `openInventory` tinyint(1) NOT NULL DEFAULT 0,
  `createBankAccount` tinyint(1) NOT NULL DEFAULT 0,
  `buyVehicle` tinyint(1) NOT NULL DEFAULT 0,
  `useGarage` tinyint(1) NOT NULL DEFAULT 0,
  `acceptJob` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `characters_tattoos`
--

CREATE TABLE `characters_tattoos` (
  `id` int(11) NOT NULL,
  `charId` int(11) NOT NULL,
  `tattooId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `characters_wanteds`
--

CREATE TABLE `characters_wanteds` (
  `id` int(11) NOT NULL,
  `charId` int(11) NOT NULL,
  `wantedId` int(11) NOT NULL,
  `givenString` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `logs_company`
--

CREATE TABLE `logs_company` (
  `id` int(11) NOT NULL,
  `companyId` int(11) NOT NULL,
  `charId` int(11) NOT NULL,
  `targetCharId` int(11) NOT NULL,
  `type` varchar(64) NOT NULL,
  `text` varchar(256) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `logs_faction`
--

CREATE TABLE `logs_faction` (
  `id` int(11) NOT NULL,
  `factionId` int(11) NOT NULL,
  `charId` int(11) NOT NULL,
  `targetCharId` int(11) NOT NULL,
  `type` varchar(64) NOT NULL,
  `text` varchar(256) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `logs_login`
--

CREATE TABLE `logs_login` (
  `id` int(11) NOT NULL,
  `username` varchar(64) NOT NULL,
  `socialclub` bigint(64) UNSIGNED NOT NULL,
  `text` varchar(256) NOT NULL,
  `ipadress` varchar(64) NOT NULL,
  `hardwareid` bigint(64) UNSIGNED NOT NULL,
  `success` tinyint(1) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `server_all_vehicles`
--

CREATE TABLE `server_all_vehicles` (
  `id` int(11) NOT NULL,
  `category` varchar(64) NOT NULL,
  `manufactor` varchar(64) NOT NULL,
  `name` varchar(64) NOT NULL,
  `hash` bigint(64) UNSIGNED NOT NULL,
  `price` int(11) NOT NULL,
  `trunkcapacity` int(11) NOT NULL,
  `maxfuel` int(11) NOT NULL,
  `fueltype` varchar(64) NOT NULL,
  `seats` int(11) NOT NULL,
  `tax` int(11) NOT NULL DEFAULT 0 COMMENT 'Fahrzeugsteuer',
  `vehClass` int(11) NOT NULL COMMENT '0 - Auto | 1- Boot | 2 - Flugzeug | 3 - Helikopter'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `server_all_vehicles`
--

INSERT INTO `server_all_vehicles` (`id`, `category`, `manufactor`, `name`, `hash`, `price`, `trunkcapacity`, `maxfuel`, `fueltype`, `seats`, `tax`, `vehClass`) VALUES
(1, 'Sports', 'Dinka', 'Jester', 2997294755, 25000, 20, 120, 'Benzin', 2, 0, 0),
(2, 'Emergency', 'Vapid', 'Police Interceptor', 1912215274, 9999999, 25, 80, 'Benzin', 4, 0, 0),
(3, 'Emergency', 'Vapid', 'Police Schafter V12', 3460360209, 9999999, 25, 80, 'Benzin', 4, 0, 0),
(4, 'Emergency', 'Vapid', 'Police Maverick', 353883353, 9999999, 15, 80, 'Kerosin', 4, 0, 3),
(5, 'Vans', 'Brute', 'Boxville', 2307837162, 99999, 0, 120, 'Benzin', 6, 0, 0),
(6, 'Planes', 'Buckingham', 'Vestra', 1341619767, 999999, 0, 120, 'Kerosin', 2, 0, 2),
(7, 'Planes', 'Western', 'Nimbus', 2999939664, 9999999, 0, 120, 'Kerosin', 2, 0, 2),
(8, 'Planes', 'JoBuilt', 'Velum', 2621610858, 9999999, 0, 120, 'Kerosin', 5, 0, 2),
(9, 'Service', 'JoBuilt', 'Muellwagen', 3039269212, 999999, 0, 120, 'Benzin', 2, 0, 0),
(10, 'Services', 'Brute', 'Stadtbus', 3581397346, 9999999, 0, 120, 'Benzin', 8, 0, 0),
(11, 'Emergency', 'Vapid', 'Police Cruiser', 2046537925, 9999999, 25, 80, 'Benzin', 4, 0, 0),
(12, 'Emergency', 'Vapid', 'Police Buffalo', 2667966721, 9999999, 15, 80, 'Benzin', 4, 0, 0),
(13, 'Bike', 'Cycles', 'BMX', 1131912276, 1500, 0, 999, 'Benzin', 1, 0, 0),
(14, 'Sports', 'Leader', 'Schafter6', 1922255844, 2500000, 50, 120, 'Benzin', 4, 10, 0),
(15, 'LKW', 'LKW', 'Surfer2', 2983726598, 55000, 85, 60, 'Benzin', 2, 20, 0),
(16, 'LKW', 'LKW', 'Pony', 4175309224, 55000, 85, 60, 'Benzin', 2, 20, 0),
(17, 'LKW', 'LKW', 'Pony2', 943752001, 55000, 85, 60, 'Benzin', 2, 20, 0),
(18, 'LKW', 'LKW', 'Rumpo', 1162065741, 65000, 85, 60, 'Benzin', 2, 20, 0),
(19, 'LKW', 'LKW', 'GBurrito', 2549763894, 110000, 110, 90, 'Benzin', 2, 40, 0),
(20, 'LKW', 'LKW', 'GBurrito2', 296357396, 110000, 110, 90, 'Benzin', 2, 40, 0),
(21, 'LKW', 'LKW', 'Burrito2', 3387490166, 110000, 110, 90, 'Benzin', 2, 40, 0),
(22, 'LKW', 'LKW', 'Burrito3', 2551651283, 110000, 110, 90, 'Benzin', 2, 40, 0),
(23, 'LKW', 'LKW', 'Burrito', 2948279460, 110000, 110, 90, 'Benzin', 2, 40, 0),
(24, 'LKW', 'LKW', 'Mule3', 2242229361, 500000, 160, 150, 'Benzin', 2, 40, 0),
(25, 'LKW', 'LKW', 'Benson', 2053223216, 2000000, 250, 150, 'Benzin', 2, 70, 0),
(26, 'LKW', 'LKW', 'Pounder', 2112052861, 3600000, 440, 180, 'Benzin', 2, 70, 0),
(27, 'Compact', 'Compact', 'Asbo', 3164157193, 20000, 15, 60, 'Benzin', 2, 15, 0),
(28, 'Compact', 'Compact', 'Blista', 3950024287, 25000, 20, 50, 'Benzin', 2, 15, 0),
(29, 'Compact', 'Compact', 'Issi2', 3117103977, 20000, 15, 65, 'Benzin', 2, 15, 0),
(30, 'Compact', 'Compact', 'Prairie', 2844316578, 22500, 20, 60, 'Benzin', 2, 15, 0),
(31, 'Compact', 'Compact', 'Dilettante', 3164157193, 22000, 30, 60, 'Benzin', 4, 15, 0),
(32, 'Flughafen', 'Flughafen', 'Faggio', 2452219115, 2000, 2, 20, 'Benzin', 2, 1, 0),
(33, 'Flughafen', 'Flughafen', 'Ratloader', 3627815886, 3500, 35, 70, 'Benzin', 2, 1, 0),
(34, 'Emergency', 'Emergency', 'Rettungswagen', 1171614426, 50000000, 50, 200, 'Benzin', 4, 20, 0),
(35, 'Sports', 'Sports', 'Revolter', 3884762073, 250000, 20, 120, 'Benzin', 4, 15, 0),
(36, 'FIB', 'FIB', 'FIB', 1127131465, 20000000, 50, 200, 'Benzin', 4, 10, 0),
(37, 'FBI2', 'FBI2', 'FBI2', 2647026068, 2000000, 50, 200, 'Benzin', 4, 0, 0),
(38, 'LowRider', 'LowRider', 'Chino2', 349605904, 20000000, 25, 100, 'Benzin', 2, 0, 0),
(39, 'SUV', 'SUV', 'Granger', 2519238556, 2000000, 75, 100, 'Benzin', 2, 0, 0),
(40, 'ACLS', 'ACLS', 'Abschlepper', 2971866336, 20000000, 50, 120, 'Benzin', 2, 0, 0),
(41, 'Emergency', 'Vapid', 'Frogger', 744705981, 999999999, 50, 4000, 'Benzin', 4, 0, 2),
(42, 'schafter', 'schafter', 'schafter4', 1489967196, 2000000, 50, 100, 'Benzin', 4, 0, 0),
(43, 'Import', 'Import', 'Jackal', 3670438162, 220000, 20, 50, 'Benzin', 4, 0, 0),
(44, 'Import', 'Import', 'Windsor2', 2364918497, 800000, 20, 70, 'Benzin', 4, 0, 0),
(45, 'Import', 'Import', 'Baller4', 634118882, 350000, 40, 60, 'Benzin', 4, 0, 0),
(46, 'Import', 'Import', 'Zion2', 3101863448, 180000, 25, 50, 'Benzin', 2, 0, 0),
(47, 'Import', 'Import', 'Gresley', 2751205197, 200000, 40, 55, 'Benzin', 4, 0, 0),
(48, 'Import', 'Import', 'Revolter', 3884762073, 800000, 20, 60, 'Benzin', 4, 0, 0),
(49, 'Import', 'Import', 'Oracle2', 3783366066, 270000, 20, 60, 'Benzin', 4, 0, 0),
(50, 'Import', 'Import', 'Buffalo', 3990165190, 250000, 30, 60, 'Benzin', 2, 0, 0),
(51, 'Import', 'Import', 'Jester', 2997294755, 640000, 30, 55, 'Benzin', 2, 0, 0);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `server_all_vehicle_mods`
--

CREATE TABLE `server_all_vehicle_mods` (
  `id` int(11) NOT NULL,
  `vehiclehash` bigint(20) NOT NULL DEFAULT 0,
  `modname` varchar(128) NOT NULL,
  `modtype` int(11) NOT NULL,
  `modid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `server_animations`
--

CREATE TABLE `server_animations` (
  `animId` int(11) NOT NULL,
  `displayName` varchar(64) NOT NULL,
  `animDict` varchar(64) NOT NULL,
  `animName` varchar(64) NOT NULL,
  `animFlag` int(11) NOT NULL,
  `duration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `server_animations`
--

INSERT INTO `server_animations` (`animId`, `displayName`, `animDict`, `animName`, `animFlag`, `duration`) VALUES
(1, 'Geben', 'anim@narcotics@trash', 'drop_front', 1, 500),
(2, 'Aufheben', 'pickup_object', 'pickup_low', 1, 1100),
(4, 'Wiederbeleben', 'missheistfbi3b_ig8_2', 'cpr_loop_paramedic', 1, 8000);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `server_atm`
--

CREATE TABLE `server_atm` (
  `id` int(11) NOT NULL,
  `posX` float NOT NULL,
  `posY` float NOT NULL,
  `posZ` float NOT NULL,
  `zoneName` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `server_banks`
--

CREATE TABLE `server_banks` (
  `id` int(11) NOT NULL,
  `posX` float NOT NULL,
  `posY` float NOT NULL,
  `posZ` float NOT NULL,
  `zoneName` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `server_banks`
--

INSERT INTO `server_banks` (`id`, `posX`, `posY`, `posZ`, `zoneName`) VALUES
(1, -1212.62, -330.789, 37.787, 'Rockford Hills'),
(2, -350.941, -49.9481, 49.0426, 'Burton'),
(3, 314.231, -279.191, 54.1708, 'Alta'),
(4, 149.938, -1040.83, 29.3741, 'Pillbox Hill'),
(5, -2962.57, 482.964, 15.7031, 'Banham Canyon'),
(6, 1174.96, 2706.81, 38.0941, 'Grand-Senora-Wüste'),
(7, -112.067, 6469.16, 31.6267, 'Paleto Bay'),
(8, -1308.74, -823.744, 17.1482, 'Maze Bank Fraktion'),
(9, -1310.31, -825.016, 17.1482, 'Maze Bank'),
(10, -1306.93, -822.481, 17.1483, 'Maze Bank Company');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `server_bank_paper`
--

CREATE TABLE `server_bank_paper` (
  `id` int(11) NOT NULL,
  `accountNumber` int(11) NOT NULL,
  `Date` varchar(64) NOT NULL,
  `Time` varchar(64) NOT NULL,
  `Type` varchar(64) NOT NULL,
  `ToOrFrom` varchar(64) NOT NULL,
  `TransactionMessage` varchar(64) NOT NULL,
  `moneyAmount` varchar(64) NOT NULL,
  `zoneName` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `server_barbers`
--

CREATE TABLE `server_barbers` (
  `id` int(11) NOT NULL,
  `posX` float NOT NULL,
  `posY` float NOT NULL,
  `posZ` float NOT NULL,
  `pedModel` varchar(64) NOT NULL,
  `pedX` float NOT NULL,
  `pedY` float NOT NULL,
  `pedZ` float NOT NULL,
  `pedRot` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `server_barbers`
--

INSERT INTO `server_barbers` (`id`, `posX`, `posY`, `posZ`, `pedModel`, `pedX`, `pedY`, `pedZ`, `pedRot`) VALUES
(1, -35.3531, -154.968, 57.0765, 's_f_m_fembarber', -35.3531, -154.968, 56.0765, 295.28),
(2, 1215.08, -475.233, 66.2081, 'cs_guadalope', 1215.08, -475.233, 65.2081, 13.6481),
(3, 140.461, -1706.41, 29.2916, 'csb_denise_friend', 140.461, -1706.41, 28.2916, 89.1236),
(4, -815.826, -186.875, 37.569, 'ig_abigail', -815.826, -186.875, 36.569, 19.7743),
(5, -1279.39, -1118.78, 6.99012, 'a_f_y_genhot_01', -1279.39, -1118.78, 5.99012, 36.6105),
(6, -276.963, 6224.98, 31.6955, 'a_f_m_soucentmc_01', -276.963, 6224.98, 30.6955, 356.058),
(7, 1931.46, 3734.23, 32.8445, 'ig_tonya', 1931.46, 3734.23, 31.8445, 166.098);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `server_blips`
--

CREATE TABLE `server_blips` (
  `id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `color` int(11) NOT NULL,
  `scale` float NOT NULL,
  `shortRange` tinyint(1) NOT NULL,
  `sprite` int(11) NOT NULL,
  `posX` float NOT NULL,
  `posY` float NOT NULL,
  `posZ` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `server_blips`
--

INSERT INTO `server_blips` (`id`, `name`, `color`, `scale`, `shortRange`, `sprite`, `posX`, `posY`, `posZ`) VALUES
(1, 'Rathaus', 0, 1, 1, 419, -545.085, -204.337, 38.2152),
(2, 'Pillbox Hill Medical Center', 1, 1, 1, 61, 343.959, -590.119, 43.3151),
(3, 'Arbeitsamt', 1, 1, 1, 269, -534.574, -166.223, 38.3247),
(4, 'Zulassungsstelle', 0, 1, 1, 498, -582.936, -194.511, 38.3247),
(6, 'Einwohnermeldeamt', 3, 1, 1, 409, -555.468, -228.237, 38.159),
(7, 'LSPD - Mission Row', 29, 1, 1, 60, 437.921, -987.508, 44);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `server_clothes`
--

CREATE TABLE `server_clothes` (
  `id` int(11) NOT NULL,
  `clothesName` varchar(128) NOT NULL,
  `type` varchar(64) NOT NULL,
  `draw` int(11) NOT NULL,
  `texture` int(11) NOT NULL,
  `gender` int(11) NOT NULL COMMENT '0 = M, 1 = W, 2 = Unisex',
  `faction` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `server_clothes`
--

INSERT INTO `server_clothes` (`id`, `clothesName`, `type`, `draw`, `texture`, `gender`, `faction`) VALUES
(1, 'Polizeihemd M', 'Torso', 55, 0, 0, 0);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `server_clothesshops`
--

CREATE TABLE `server_clothesshops` (
  `id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `posX` float NOT NULL,
  `posY` float NOT NULL,
  `posZ` float NOT NULL,
  `pedX` float NOT NULL,
  `pedY` float NOT NULL,
  `pedZ` float NOT NULL,
  `pedRot` float NOT NULL,
  `pedModel` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `server_clothesshops`
--

INSERT INTO `server_clothesshops` (`id`, `name`, `posX`, `posY`, `posZ`, `pedX`, `pedY`, `pedZ`, `pedRot`, `pedModel`) VALUES
(1, 'Kleiderladen Strawberry', 75.41, -1391.1, 29.36, 73.83, -1392.93, 29.36, -82, 's_m_m_ammucountry');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `server_clothesshops_items`
--

CREATE TABLE `server_clothesshops_items` (
  `id` int(11) NOT NULL,
  `shopId` int(11) NOT NULL,
  `clothesName` varchar(128) NOT NULL,
  `itemPrice` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `server_clothesshops_items`
--

INSERT INTO `server_clothesshops_items` (`id`, `shopId`, `clothesName`, `itemPrice`) VALUES
(1, 1, 'Polizeihemd M', 1);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `server_clothes_storages`
--

CREATE TABLE `server_clothes_storages` (
  `id` int(11) NOT NULL,
  `posX` float NOT NULL,
  `posY` float NOT NULL,
  `posZ` float NOT NULL,
  `faction` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `server_clothes_storages`
--

INSERT INTO `server_clothes_storages` (`id`, `posX`, `posY`, `posZ`, `faction`) VALUES
(1, 84.8571, -1404.87, 29.397, 0);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `server_companys`
--

CREATE TABLE `server_companys` (
  `id` int(11) NOT NULL,
  `companyName` varchar(64) NOT NULL,
  `companyOwnerId` int(11) NOT NULL,
  `posX` float NOT NULL,
  `posY` float NOT NULL,
  `posZ` float NOT NULL,
  `givenLicense` varchar(64) NOT NULL,
  `createdTimestamp` timestamp NULL DEFAULT current_timestamp(),
  `companyMoney` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `server_company_members`
--

CREATE TABLE `server_company_members` (
  `id` int(11) NOT NULL,
  `companyId` int(11) NOT NULL,
  `charId` int(11) NOT NULL,
  `rank` int(11) NOT NULL DEFAULT 0 COMMENT '0 = Mitglied | 1 = Co Chef | 2 = Chef',
  `invitedTimestamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `server_doors`
--

CREATE TABLE `server_doors` (
  `id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `posX` float NOT NULL,
  `posY` float NOT NULL,
  `posZ` float NOT NULL,
  `hash` varchar(64) NOT NULL,
  `state` tinyint(1) NOT NULL DEFAULT 0 COMMENT '1 = abgeschlossen',
  `doorKey` varchar(64) NOT NULL,
  `doorKey2` varchar(64) NOT NULL,
  `type` varchar(64) NOT NULL DEFAULT 'Door',
  `lockPosX` float NOT NULL,
  `lockPosY` float NOT NULL,
  `lockPosZ` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `server_factions`
--

CREATE TABLE `server_factions` (
  `id` int(11) NOT NULL,
  `factionName` varchar(128) NOT NULL,
  `factionShort` varchar(64) NOT NULL,
  `factionMoney` int(11) NOT NULL DEFAULT 0,
  `phoneNumber` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `server_factions`
--

INSERT INTO `server_factions` (`id`, `factionName`, `factionShort`, `factionMoney`, `phoneNumber`) VALUES
(1, 'Department of Justice', 'DOJ', 0, 0),
(2, 'Los Santos Police Department', 'LSPD', 99897034, 0),
(3, 'Los Santos Fire Department', 'LSFD', 727178, 0),
(4, 'Auto Club Los Santos', 'ACLS', 127500, 0),
(5, 'Los Santos Fahrschule', 'LSF', 1100, 0);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `server_faction_clothes`
--

CREATE TABLE `server_faction_clothes` (
  `id` int(11) NOT NULL,
  `faction` int(11) NOT NULL,
  `clothesName` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `server_faction_members`
--

CREATE TABLE `server_faction_members` (
  `id` int(11) NOT NULL,
  `charId` int(11) NOT NULL,
  `factionId` int(11) NOT NULL,
  `rank` int(11) NOT NULL DEFAULT 1,
  `servicenumber` int(11) NOT NULL DEFAULT 0,
  `isDuty` tinyint(1) NOT NULL DEFAULT 0,
  `lastChange` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `server_faction_positions`
--

CREATE TABLE `server_faction_positions` (
  `id` int(11) NOT NULL,
  `factionId` int(11) NOT NULL,
  `posType` varchar(64) NOT NULL COMMENT 'storage | duty | manage',
  `posX` float NOT NULL,
  `posY` float NOT NULL,
  `posZ` float NOT NULL,
  `rotation` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `server_faction_positions`
--

INSERT INTO `server_faction_positions` (`id`, `factionId`, `posType`, `posX`, `posY`, `posZ`, `rotation`) VALUES
(1, 2, 'duty', 444.818, -975.218, 29.6783, 151.208),
(2, 2, 'storage', 459.112, -993.27, 30.6783, 0),
(3, 3, 'duty', 310.101, -603.27, 43.2821, -0.7),
(4, 3, 'storage', 303.811, -600.686, 43.2821, 1.1),
(6, 7, 'storage', -1516.4, 851.763, 181.585, 0),
(7, 8, 'storage', 1367.13, -624.105, 74.7069, 0),
(8, 4, 'duty', 391.292, -1602.16, 29.2799, 2.9),
(9, 12, 'duty', 144.788, -761.068, 241, 0),
(10, 12, 'storage', 143.526, -765.286, 242, 0);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `server_faction_ranks`
--

CREATE TABLE `server_faction_ranks` (
  `id` int(11) NOT NULL,
  `factionId` int(11) NOT NULL,
  `rankId` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `paycheck` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `server_faction_ranks`
--

INSERT INTO `server_faction_ranks` (`id`, `factionId`, `rankId`, `name`, `paycheck`) VALUES
(1, 2, 1, 'Rekrut', 2500),
(2, 2, 2, 'Cadet', 3000),
(3, 2, 3, 'Officer', 3500),
(4, 2, 4, 'Senior Officer', 4000),
(5, 2, 5, 'Corporal', 4500),
(6, 2, 6, 'Senior Corporal', 5000),
(7, 2, 7, 'Sergeant', 7000),
(8, 2, 8, 'Deputy Chief', 8000),
(9, 2, 9, 'Inspector', 9500),
(10, 2, 10, 'Chief of Police', 10000),
(11, 5, 1, 'Auszubildender', 25),
(12, 5, 2, 'Fahrlehrer', 50),
(13, 5, 3, 'Stelv. Geschäftsführer', 75),
(14, 5, 4, 'Geschäftsführer', 100),
(15, 1, 1, 'Pflichtverteidiger', 0),
(16, 1, 2, 'Staatsanwalt', 0),
(17, 1, 3, 'Richter', 0),
(18, 1, 4, 'Generalstaatsanwalt', 0),
(19, 1, 5, 'Oberster Richter', 0),
(20, 1, 6, 'Stelv. Justizminister', 0),
(21, 1, 7, 'Justizminister', 1),
(22, 4, 1, 'ACLS Irgendwas\r\n', 0),
(23, 6, 9, 'Sek OG', 0),
(24, 6, 8, 'Runner', 1),
(25, 6, 7, 'Soulja', 0),
(26, 6, 6, 'Original Balla', 0),
(27, 6, 5, 'Gangster', 0),
(28, 6, 4, 'Young G', 0),
(29, 6, 3, 'Lil\'G', 0),
(30, 6, 2, 'Hustler', 1),
(31, 6, 1, 'Homie', 0),
(32, 7, 10, 'Oyabun', 750),
(33, 7, 9, 'Wakagashira', 600),
(34, 7, 8, 'Onee San', 0),
(35, 7, 7, 'Shateigashira', 500),
(36, 7, 6, 'Saiko Komon', 400),
(37, 7, 5, 'Fuku Honbucho', 300),
(38, 7, 4, 'Komon', 0),
(39, 7, 3, 'Kyodai', 0),
(40, 7, 2, 'Kobun', 0),
(41, 7, 1, 'Shatei', 0),
(42, 8, 10, 'Big Og', 0),
(43, 8, 9, 'OG', 0),
(44, 8, 8, 'Little Og', 0),
(45, 8, 7, 'Old Member', 0),
(46, 8, 6, 'Member', 0),
(47, 8, 5, 'Homie', 0),
(48, 8, 4, 'Runner', 0),
(49, 8, 3, 'Pusher', 0),
(50, 8, 2, 'Gangster', 0),
(51, 8, 1, 'Baby Gangster', 0),
(52, 3, 10, 'Ärztlicher Direktor', 10000),
(53, 3, 9, 'Leitender Chefarzt', 3000),
(54, 3, 8, 'Stationsarzt', 3000),
(55, 3, 7, 'Leitender Notarzt', 2000),
(56, 3, 6, 'Notarzt', 2000),
(57, 3, 5, 'Fahrzeugwart', 2000),
(58, 3, 4, 'Notfallsanitäter', 2000),
(59, 3, 3, 'Sanitäter', 2000),
(60, 3, 2, 'Assistent Helfer', 2000),
(61, 3, 1, 'Helfer', 1000),
(62, 10, 10, 'Don', 10000),
(63, 10, 9, 'Capo', 0),
(64, 10, 8, 'Gestione', 0),
(65, 10, 7, 'Gestione dell\'istruttore', 0),
(66, 10, 6, 'Allenatore', 0),
(67, 10, 5, 'Gestione della sicurezza', 0),
(68, 10, 4, 'Servizio di sicurezza', 0),
(69, 10, 3, 'Membro onorario', 0),
(70, 10, 2, 'Fratteli', 0),
(71, 10, 1, 'Apprendista', 0),
(72, 4, 1, 'Praktikant', 0),
(73, 4, 2, 'Auszubildener', 0),
(74, 4, 3, 'Junggeselle', 0),
(75, 4, 4, 'Geselle', 0),
(76, 4, 5, 'Ausbilder', 0),
(77, 4, 6, 'Vorarbeiter', 0),
(78, 4, 7, 'Meister', 0),
(79, 4, 8, 'Buchhalter', 0),
(80, 4, 9, 'Stellv. Chef', 0),
(81, 4, 10, 'Chef', 1),
(82, 11, 10, 'General', 0),
(83, 11, 9, 'General-Major', 0),
(84, 11, 8, 'Major', 0),
(85, 11, 7, 'Pukovnik', 0),
(86, 11, 6, 'Kapetan', 0),
(87, 11, 5, 'Vodnik', 0),
(88, 11, 4, 'Mladi Vodnik', 0),
(89, 11, 3, 'Desetar', 0),
(90, 11, 2, 'Razvodnik', 0),
(91, 11, 1, 'Vojnik', 0),
(92, 12, 10, 'FIB Director', 0),
(93, 12, 9, 'Deputy Director', 0),
(94, 12, 8, 'Assistant Director', 0),
(95, 12, 7, 'Executive Agent', 0),
(96, 13, 10, 'Rang10', 0),
(97, 13, 9, 'Rang9', 0),
(98, 12, 6, 'Chief Agent', 0),
(99, 12, 5, 'Special Agent', 0),
(100, 13, 8, 'Rang8\r\n', 0),
(101, 13, 7, 'Rang7\r\n', 0),
(102, 12, 4, 'Senior Agent', 0),
(103, 12, 3, 'Agent', 0),
(104, 12, 2, 'Junior Agent', 0),
(105, 12, 1, 'Trainee Agent', 0),
(106, 13, 6, 'Rang6', 0),
(107, 13, 5, 'Rang5\r\n', 0),
(108, 13, 4, 'Rang4', 0),
(109, 13, 3, 'Rang3', 0),
(110, 13, 2, 'Rang2', 0),
(111, 13, 1, 'Rang1', 0);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `server_faction_storage_items`
--

CREATE TABLE `server_faction_storage_items` (
  `id` int(11) NOT NULL,
  `charId` int(11) NOT NULL,
  `factionId` int(11) NOT NULL,
  `itemName` varchar(128) NOT NULL,
  `amount` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `server_farming_producer`
--

CREATE TABLE `server_farming_producer` (
  `id` int(11) NOT NULL,
  `posX` float NOT NULL,
  `posY` float NOT NULL,
  `posZ` float NOT NULL,
  `pedRotation` float NOT NULL,
  `pedModel` varchar(64) NOT NULL,
  `neededItem` varchar(64) NOT NULL,
  `producedItem` varchar(64) NOT NULL,
  `range` float NOT NULL,
  `duration` int(11) NOT NULL,
  `neededItemAmount` int(11) NOT NULL,
  `producedItemAmount` int(11) NOT NULL,
  `blipName` varchar(64) NOT NULL,
  `isBlipVisible` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `server_farming_producer`
--

INSERT INTO `server_farming_producer` (`id`, `posX`, `posY`, `posZ`, `pedRotation`, `pedModel`, `neededItem`, `producedItem`, `range`, `duration`, `neededItemAmount`, `producedItemAmount`, `blipName`, `isBlipVisible`) VALUES
(1, -707.631, -2448.22, 12.9297, -124.564, 's_m_y_dockwork_01', 'Sand', 'Glasscheibe', 5, 900, 8, 1, 'Sand', 0),
(2, 910.18, -1064.43, 36.9407, 173.045, 's_m_m_linecook', 'Tomaten', 'Ketchup', 5, 1000, 5, 1, 'Tomatenverarbeiter', 0),
(3, 93.9956, 6356.02, 30.3693, 19.5796, 's_m_m_linecook', 'Mais', 'Popcorn', 5, 600, 3, 2, 'Maisverarbeiter', 0),
(4, 806.004, -2380.66, 28.0945, 128.808, 's_m_m_linecook', 'Traube', 'Traubensaft', 5, 400, 50, 10, 'Traubenverarbeiter', 0),
(5, 813.165, -281.011, 65.4506, -0.2473, 's_m_m_linecook', 'Aramid', 'Weste', 5, 666, 90, 1, 'Westen Verarbeiter', 0),
(6, 1281.77, 1887.24, 83.5026, -2.42422, 's_m_m_linecook', 'Hanfpflanze', 'Hanf', 5, 500, 50, 1, '', 0),
(7, -291.323, 2543.08, 75.4147, 0, 's_m_m_linecook', 'Hanf', 'Joint', 5, 5000, 2, 1, '', 0),
(8, -127.593, 1921.91, 196.306, 0, 's_m_m_linecook', 'Kroete', 'Gehaeutete Kroete', 10, 1000, 10, 10, '', 0),
(9, 2078.43, 1686.54, 103.116, 2.8, 's_m_m_linecook', 'Gehaeutete Kroete', 'Ephedrin', 15, 1000, 20, 2, '', 0),
(10, 29.2352, 3667.99, 40.4344, 2.12738, 's_m_m_linecook', 'Ephedrin', 'Methamphetamin', 5, 3560, 5, 25, '', 0),
(11, 2047.79, 3183.86, 45.0176, 0, 's_m_m_linecook', 'Kokablatt', 'Kokain', 15, 1000, 50, 1, '', 0);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `server_farming_spots`
--

CREATE TABLE `server_farming_spots` (
  `id` int(11) NOT NULL,
  `posX` float NOT NULL,
  `posY` float NOT NULL,
  `posZ` float NOT NULL,
  `itemName` varchar(64) NOT NULL,
  `animation` varchar(64) NOT NULL,
  `neededItemToFarm` varchar(64) NOT NULL DEFAULT 'None',
  `itemMinAmount` int(11) NOT NULL,
  `itemMaxAmount` int(11) NOT NULL,
  `markerColorR` int(11) NOT NULL,
  `markerColorG` int(11) NOT NULL,
  `markerColorB` int(11) NOT NULL,
  `blipColor` int(11) NOT NULL DEFAULT 1,
  `range` float NOT NULL,
  `duration` int(11) NOT NULL,
  `isBlipVisible` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `server_farming_spots`
--

INSERT INTO `server_farming_spots` (`id`, `posX`, `posY`, `posZ`, `itemName`, `animation`, `neededItemToFarm`, `itemMinAmount`, `itemMaxAmount`, `markerColorR`, `markerColorG`, `markerColorB`, `blipColor`, `range`, `duration`, `isBlipVisible`) VALUES
(1, 2631.47, 2868.83, 43.2439, 'Sand', 'farmPickup', 'Schaufel', 1, 2, 120, 120, 120, 36, 13, 1100, 0),
(2, -1809.2, 2090.82, 133.344, 'Traube', 'farmPickup', 'None', 1, 3, 120, 120, 120, 7, 30, 300, 0),
(3, 3288.17, 5179.44, 18.5297, 'Mais', 'farmPickup', 'None', 1, 2, 120, 120, 120, 36, 13, 3500, 0),
(4, 1803.01, 5025.1, 57.8572, 'Tomaten', 'farmPickup', 'None', 1, 3, 120, 120, 120, 36, 13, 1100, 0),
(5, 1806.36, 5019.1, 57.1494, 'Tomaten', 'farmPickup', 'None', 1, 3, 120, 120, 120, 36, 13, 1100, 0),
(6, 183.158, 5046.83, 58.5311, 'Tomaten', 'farmPickup', 'None', 1, 3, 120, 120, 120, 36, 13, 1100, 0),
(7, 1834.01, 5042.15, 58.2616, 'Tomaten', 'farmPickup', 'None', 1, 3, 120, 120, 120, 36, 13, 1100, 0),
(8, 3911.8, 4356.95, -10, 'Aramid', 'farmPickup', 'None', 1, 2, 255, 255, 255, 36, 15, 16000, 0),
(9, 2222.48, 5577.19, 40, 'Hanfpflanze', 'farmPickup', 'None', 1, 2, 255, 255, 255, 0, 15, 5000, 0),
(10, 1993.36, 392.585, 141.601, 'Kroete', 'farmPickup', 'Kescher', 1, 3, 255, 255, 255, 1, 30, 5000, 0),
(11, 57.0725, 3215.54, 29.8865, 'Kokablatt', 'farmPickup', 'None', 1, 3, 255, 255, 255, 1, 15, 5000, 0);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `server_fuel_spots`
--

CREATE TABLE `server_fuel_spots` (
  `id` int(11) NOT NULL,
  `fuelStationId` int(11) NOT NULL,
  `posX` float NOT NULL,
  `posY` float NOT NULL,
  `posZ` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `server_fuel_spots`
--

INSERT INTO `server_fuel_spots` (`id`, `fuelStationId`, `posX`, `posY`, `posZ`) VALUES
(1, 1, 254.004, -1268.25, 28.37),
(2, 1, 254.189, -1261.24, 28.37),
(3, 1, 254.018, -1253.39, 28.4205),
(4, 1, 259.345, -1253.55, 28.37),
(5, 1, 259.068, -1261.44, 28.37),
(6, 1, 259.134, -1268.81, 28.37),
(7, 1, 262.286, -1268.48, 28.37),
(8, 1, 262.536, -1260.91, 28.37),
(9, 1, 262.721, -1253.31, 28.37),
(10, 1, 267.574, -1254.16, 28.37),
(11, 1, 267.574, -1261.61, 28.37),
(12, 1, 267.574, -1268.8, 28.37),
(13, 1, 271.516, -1268.41, 28.37),
(14, 1, 271.345, -1260.94, 28.37),
(15, 1, 271.345, -1253.24, 28.37),
(16, 1, 276.251, -1253.79, 28.3868),
(17, 1, 276.066, -1261.37, 28.3868),
(18, 1, 275.947, -1268.64, 28.3868),
(19, 2, 2679.77, 3267.11, 55.2285),
(20, 2, 2677.49, 3263.08, 55.2285),
(21, 2, 2679.56, 3261.75, 55.2285),
(22, 2, 2681.85, 3265.53, 55.2285),
(23, 3, -1794.98, 812.888, 138.5),
(24, 3, -1789.66, 807.31, 138.5),
(25, 3, -1791.97, 805.437, 138.5),
(26, 3, -1791.97, 805.437, 138.5),
(27, 3, -1800.95, 807.31, 138.517),
(28, 3, -1796.11, 801.574, 138.5),
(29, 3, -1798.6, 799.451, 138.5),
(30, 3, -1803.55, 804.673, 138.517),
(31, 3, -1806.8, 801.231, 138.517),
(32, 3, -1802.44, 796.22, 138.5),
(33, 3, -1805.1, 793.2, 138.5),
(34, 3, -1809.52, 798.198, 138.5),
(35, 4, 1706.19, 6415.56, 32.6329),
(36, 4, 1702.52, 6417.68, 31.6329),
(37, 4, 1698.34, 6419.46, 32.6329),
(38, 4, 1697.04, 6417.26, 32.6498),
(39, 4, 1701.28, 6415.17, 32.6498),
(40, 4, 1704.84, 6413.59, 32.6666),
(41, 5, -2551.39, 2325.8, 33.071),
(42, 5, -2556.91, 2324.98, 33.0542),
(43, 5, -2558.16, 2328.3, 33.0542),
(44, 5, -2551.5, 2328.75, 33.0542),
(45, 5, -2552.25, 2332.83, 33.0542),
(46, 5, -2558.39, 2332.58, 33.0542),
(47, 5, -2558.51, 2335.6, 33.0542),
(48, 5, -2552.8, 2336.2, 33.0542),
(49, 5, -2552.32, 2340.2, 33.0542),
(50, 5, -2558.45, 2340.03, 33.071),
(51, 5, -2559.13, 2343.07, 33.0542),
(52, 5, -2552.55, 2343.27, 33.071),
(53, 6, 1179.59, -340.866, 69.1633),
(54, 6, 1186.06, -340.114, 69.1633),
(55, 6, 1185.24, -336.752, 69.1633),
(56, 6, 1178.6, -337.56, 69.16),
(57, 6, 1184.93, -336.712, 69.16),
(58, 6, 1177.68, -332.796, 69.16),
(59, 6, 1184.24, -331.398, 69.16),
(60, 6, 1184.3, -327.75, 69),
(61, 6, 1177.79, -329.19, 69),
(62, 6, 1176.59, -323.69, 69),
(63, 6, 1182.21, -322.747, 69),
(64, 6, 1176.26, -320.7, 69),
(65, 7, -713.88, -939.297, 19),
(66, 7, -713.81, -832.63, 19),
(67, 7, -716.88, -932.426, 19),
(68, 7, -716.83, -938.78, 19),
(69, 7, -722.37, -938.82, 19),
(70, 7, -722.09, -932.71, 19),
(71, 7, -725.61, -932.41, 19),
(72, 7, -725.6, -938.67, 19),
(73, 7, -730.971, -939.28, 19),
(74, 7, -730.9, -933.178, 19),
(75, 7, -734.189, -932.46, 19),
(76, 7, -734.25, -938.74, 19),
(77, 8, -2085.61, -313.18, 13),
(78, 8, -2086.6, -321.125, 13),
(79, 8, -2087.18, -327.83, 13),
(80, 8, -2090.23, -327.27, 13),
(81, 8, -2089.81, -320.76, 13),
(82, 8, -2088.84, -313.26, 13),
(83, 8, -2094.34, -312.02, 13),
(84, 8, -2095.35, -320.17, 13),
(85, 8, -2096.04, -325.99, 13),
(86, 8, -2098.94, -326.4, 13),
(87, 8, -2098.27, -312.51, 13),
(88, 8, -2097.6, -312.51, 13),
(89, 8, -2102.9, -311.327, 13),
(90, 8, -2103.56, -319.26, 13),
(91, 8, -2104.52, -326.04, 13),
(92, 8, -2106.01, -310.99, 13),
(93, 8, -2106.79, -319.16, 13),
(94, 8, -2107.41, -325.29, 13);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `server_fuel_stations`
--

CREATE TABLE `server_fuel_stations` (
  `id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `owner` int(11) NOT NULL DEFAULT 0,
  `availableFuel` varchar(128) NOT NULL,
  `availableLiters` int(11) NOT NULL DEFAULT 0,
  `bank` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `server_fuel_stations`
--

INSERT INTO `server_fuel_stations` (`id`, `name`, `owner`, `availableFuel`, `availableLiters`, `bank`) VALUES
(1, 'Xero Gas - Strawberry', 0, '[{ \"fueltype\": \"Benzin\", \"fuelPrice\": 18 }, { \"fueltype\": \"Diesel\", \"fuelPrice\": 9999 }, { \"fueltype\": \"Strom\", \"fuelPrice\": 2 }', 9000, 368),
(2, 'Xero Gas - East-Hyw', 0, '[{ \"fueltype\": \"Benzin\", \"fuelPrice\": 17 }, { \"fueltype\": \"Diesel\", \"fuelPrice\": 9999 }, { \"fueltype\": \"Strom\", \"fuelPrice\": 2 }', 9000, 14),
(3, 'LTD Gasoline - Yakuza Strasse', 0, '[{ \"fueltype\": \"Benzin\", \"fuelPrice\": 18 }, { \"fueltype\": \"Diesel\", \"fuelPrice\": 9999 }, { \"fueltype\": \"Strom\", \"fuelPrice\": 2 }', 9000, 172),
(4, 'Globe Oil - Paleto Bay', 0, '[{ \"fueltype\": \"Benzin\", \"fuelPrice\": 19 }, { \"fueltype\": \"Diesel\", \"fuelPrice\": 9999 }, { \"fueltype\": \"Strom\", \"fuelPrice\": 2 }', 9000, 0),
(5, 'Ron Oil - Naturschutzgebiet', 0, '[{ \"fueltype\": \"Benzin\", \"fuelPrice\": 18 }, { \"fueltype\": \"Diesel\", \"fuelPrice\": 9999 }, { \"fueltype\": \"Strom\", \"fuelPrice\": 2 }', 9000, 2),
(6, 'LTD Gasoline - Mirror Park', 0, '[{ \"fueltype\": \"Benzin\", \"fuelPrice\": 15 }, { \"fueltype\": \"Diesel\", \"fuelPrice\": 9999 }, { \"fueltype\": \"Strom\", \"fuelPrice\": 2 }', 9000, 6),
(7, 'LTD Gasoline - Little Seoul', 0, '[{ \"fueltype\": \"Benzin\", \"fuelPrice\": 18 }, { \"fueltype\": \"Diesel\", \"fuelPrice\": 9999 }, { \"fueltype\": \"Strom\", \"fuelPrice\": 2 }', 9000, 0),
(8, 'Xero Gas - Pacific Bluffs', 0, '[{ \"fueltype\": \"Benzin\", \"fuelPrice\": 18 }, { \"fueltype\": \"Diesel\", \"fuelPrice\": 9999 }, { \"fueltype\": \"Strom\", \"fuelPrice\": 2 }', 9000, 0);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `server_garages`
--

CREATE TABLE `server_garages` (
  `id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `posX` float NOT NULL,
  `posY` float NOT NULL,
  `posZ` float NOT NULL,
  `rotation` float NOT NULL,
  `type` int(11) NOT NULL DEFAULT 0 COMMENT '0 Auto | 1 Boot | 2 Flugzeug | 3 Heli',
  `isBlipVisible` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `server_garages`
--

INSERT INTO `server_garages` (`id`, `name`, `posX`, `posY`, `posZ`, `rotation`, `type`, `isBlipVisible`) VALUES
(1, 'Pillbox Hill', 213.897, -808.424, 30.0149, 161.937, 0, 0),
(2, 'Bahama Mamas', -1359.05, -471.575, 30.5957, 99.5463, 0, 0),
(3, 'Hawick', 509.207, -28.9762, 87.8592, 148.006, 0, 0),
(4, 'Vespucci', -976.536, -1490.53, 3.99926, -52.4358, 0, 0),
(5, 'La Mesa', 926.505, -1560.21, 29.7421, 94.9846, 0, 0),
(6, 'International Airport', -928.576, -2544.05, 15.3451, -1.97896, 0, 0),
(7, 'Paleto Bay', -1.11111, 6307.02, 31.3763, 41.4539, 0, 0),
(8, 'Fraktion LSPD Mission Row', 459.084, -1007.99, 27.2614, 99.3405, 0, 0),
(9, 'Fraktion LSPD Mission Row Heligarage', 463.681, -982.407, 42.692, 90.3732, 3, 0),
(10, 'Verwahrstelle LosSantos', 408.976, -1622.85, 29.2799, 0, 0, 0),
(11, 'Fraktion FYB Garage', 83.6571, -1973.51, 19.9224, 0.742109, 0, 0),
(12, 'Fraktion Yakuza Garage', -1520.41, 849.218, 180.585, -0.197786, 0, 0),
(13, 'Fraktion GF Garage', 1357.38, -597.587, 74.3363, 0.742109, 0, 0),
(16, 'Fraktion LSFD Garage', 299.723, -602.914, 43.0495, -1.7, 0, 0),
(17, 'Fraktion ACLS Garage', 372.119, -1618.62, 28.2799, 2.2, 0, 0),
(18, 'Fraktion LCN Garage', -1532.22, 78.5011, 57.762, 0.1, 0, 0),
(19, 'Fraktion BG Garage', -1925.09, 2048.99, 139.826, 1.7, 0, 0),
(20, 'Fraktion Crips Garage', 340.088, -2036.43, 20.4952, 0, 0, 0);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `server_garage_slots`
--

CREATE TABLE `server_garage_slots` (
  `id` int(11) NOT NULL,
  `garageId` int(11) NOT NULL,
  `parkid` int(11) NOT NULL,
  `posX` float NOT NULL,
  `posY` float NOT NULL,
  `posZ` float NOT NULL,
  `rotX` float NOT NULL,
  `rotY` float NOT NULL,
  `rotZ` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `server_garage_slots`
--

INSERT INTO `server_garage_slots` (`id`, `garageId`, `parkid`, `posX`, `posY`, `posZ`, `rotX`, `rotY`, `rotZ`) VALUES
(1, 1, 1, 216.396, -802.035, 30.0212, 0, 0, 1.17188),
(2, 1, 2, 222.046, -803.99, 29.9073, 0, 0, -1.95312),
(3, 1, 3, 217.293, -799.513, 30.0117, 0, 0, 1.17188),
(4, 1, 4, 222.902, -801.589, 29.8973, 0, 0, -1.95312),
(5, 2, 1, -1368.88, -479.473, 30.8132, 0, 0, 0.125),
(6, 2, 2, -1370.86, -467.789, 30.8132, 0, 0, -2.98438),
(7, 2, 3, -1372.21, -479.934, 30.8132, 0, 0, 0.125),
(8, 2, 4, -1373.75, -467.987, 30.8132, 0, 0, -2.98438),
(9, 3, 1, 501.244, -31.8462, 88.0857, 0, 0, 1.01562),
(10, 3, 2, 511.371, -37.8725, 88.0857, 0, 0, -2.07812),
(11, 3, 3, 499.437, -35.3407, 88.0857, 0, 0, 1.04688),
(12, 3, 4, 509.565, -41.0901, 88.0857, 0, 0, -2.125),
(13, 4, 1, -964.787, -1484.8, 4.24097, 0, 0, 1.90625),
(14, 4, 2, -966.409, -1481.62, 4.24097, 0, 0, 1.90625),
(15, 4, 3, -967.688, -1478.28, 4.24097, 0, 0, 1.875),
(16, 4, 4, -968.598, -1474.56, 4.24097, 0, 0, 1.89062),
(17, 5, 1, 921.798, -1539.18, 30.0718, 0, 0, 3.125),
(18, 5, 2, 921.692, -1560.51, 29.9707, 0, 0, 3.125),
(19, 6, 1, -935.525, -2543.6, 13.2726, 0, 0, 2.64062),
(20, 6, 2, -926.637, -2549.08, 13.2726, 0, 0, 2.67188),
(21, 7, 1, 7.33187, 6320.6, 30.4594, 0, 0, 0.28125),
(22, 7, 2, 10.6945, 6321.84, 30.4594, 0, 0, 0.296875),
(23, 8, 1, 462.646, -1015.02, 27.2916, 0, 0, 1.54688),
(24, 8, 2, 462.567, -1019.68, 27.3253, 0, 0, 1.5625),
(25, 9, 1, 449.868, -980.901, 44.074, 0, 0, 1.57812),
(26, 9, 2, 482.716, -981.837, 41.3781, 0, 0, 1.5625),
(27, 11, 1, 93.8374, -1961.88, 20.7371, 0, 0, 0.692635),
(28, 12, 1, -1518.99, 863.974, 181.67, 0, 0, 0.2473),
(29, 13, 1, 1360.3, -601.807, 74.3363, 0, 0, 0),
(30, 16, 1, 290.664, -610.536, 43.3663, 0, 0, -1.2),
(31, 17, 1, 390.752, -1610.69, 29.2799, 0, 0, 2.2),
(32, 18, 1, -1523.15, 84.7121, 56.4923, 0, 0, 1.4),
(33, 19, 1, -1923.63, 2036.02, 140.724, 0, 0, 1.7),
(34, 20, 1, 317.749, -2025.58, 20.6359, 0, 0, -0.841056),
(35, 10, 1, 419.473, -1642.02, 29.2799, 0, 0, -1.6);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `server_hotels`
--

CREATE TABLE `server_hotels` (
  `id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `posX` float NOT NULL,
  `posY` float NOT NULL,
  `posZ` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `server_hotels_apartments`
--

CREATE TABLE `server_hotels_apartments` (
  `id` int(11) NOT NULL,
  `hotelId` int(11) NOT NULL,
  `interiorId` int(11) NOT NULL,
  `ownerId` int(11) NOT NULL DEFAULT 0,
  `rentPrice` int(11) NOT NULL DEFAULT 0,
  `maxRentHours` int(11) NOT NULL DEFAULT 72,
  `lastRent` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `server_hotels_storage`
--

CREATE TABLE `server_hotels_storage` (
  `id` int(11) NOT NULL,
  `apartmentId` int(11) NOT NULL,
  `itemName` varchar(64) NOT NULL,
  `amount` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `server_houses`
--

CREATE TABLE `server_houses` (
  `id` int(11) NOT NULL,
  `interiorId` int(11) NOT NULL,
  `ownerId` int(11) NOT NULL,
  `street` varchar(64) NOT NULL,
  `price` int(11) NOT NULL DEFAULT 0,
  `maxRenters` int(11) NOT NULL,
  `rentPrice` int(11) NOT NULL DEFAULT 0,
  `isRentable` tinyint(1) NOT NULL DEFAULT 0,
  `hasStorage` tinyint(1) NOT NULL DEFAULT 0,
  `hasAlarm` tinyint(1) NOT NULL DEFAULT 0,
  `hasBank` tinyint(1) NOT NULL DEFAULT 0,
  `entranceX` float NOT NULL,
  `entranceY` float NOT NULL,
  `entranceZ` float NOT NULL,
  `money` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `server_houses_interior`
--

CREATE TABLE `server_houses_interior` (
  `interiorId` int(11) NOT NULL,
  `exitX` float NOT NULL,
  `exitY` float NOT NULL,
  `exitZ` float NOT NULL,
  `storageX` float NOT NULL,
  `storageY` float NOT NULL,
  `storageZ` float NOT NULL,
  `storageLimit` float NOT NULL,
  `manageX` float NOT NULL DEFAULT 0,
  `manageY` float NOT NULL DEFAULT 0,
  `manageZ` float NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `server_houses_interior`
--

INSERT INTO `server_houses_interior` (`interiorId`, `exitX`, `exitY`, `exitZ`, `storageX`, `storageY`, `storageZ`, `storageLimit`, `manageX`, `manageY`, `manageZ`) VALUES
(1, 266.196, -1007.35, -102.009, 265.973, -999.452, -99.0086, 5, 265.055, -996, -100);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `server_houses_renter`
--

CREATE TABLE `server_houses_renter` (
  `id` int(11) NOT NULL,
  `charId` int(11) NOT NULL,
  `houseId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `server_houses_storage`
--

CREATE TABLE `server_houses_storage` (
  `id` int(11) NOT NULL,
  `houseId` int(11) NOT NULL,
  `itemName` varchar(128) NOT NULL,
  `amount` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `server_items`
--

CREATE TABLE `server_items` (
  `id` int(11) NOT NULL,
  `itemName` varchar(64) NOT NULL,
  `itemType` varchar(64) NOT NULL,
  `itemDescription` varchar(256) NOT NULL,
  `itemWeight` float NOT NULL,
  `isItemDesire` tinyint(1) NOT NULL DEFAULT 0,
  `itemDesireFood` int(11) NOT NULL DEFAULT 0,
  `itemDesireDrink` int(11) NOT NULL DEFAULT 0,
  `hasItemAnimation` tinyint(1) NOT NULL DEFAULT 0,
  `itemAnimationName` varchar(64) NOT NULL DEFAULT 'None',
  `isItemDroppable` tinyint(1) NOT NULL DEFAULT 1,
  `isItemUseable` tinyint(1) NOT NULL DEFAULT 1,
  `isItemGiveable` tinyint(4) NOT NULL DEFAULT 1,
  `isItemClothes` tinyint(1) NOT NULL DEFAULT 0,
  `ClothesType` varchar(64) NOT NULL DEFAULT 'None',
  `ClothesDraw` int(11) NOT NULL DEFAULT 0,
  `ClothesTexture` int(11) NOT NULL DEFAULT 0,
  `ClothesUndershirt` int(11) NOT NULL DEFAULT 0,
  `ClothesUndershirtTexture` int(11) NOT NULL DEFAULT 0,
  `ClothesDecals` int(11) NOT NULL DEFAULT 0,
  `ClothesDecalsTexture` int(11) NOT NULL DEFAULT 0,
  `itemPicSRC` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `server_items`
--

INSERT INTO `server_items` (`id`, `itemName`, `itemType`, `itemDescription`, `itemWeight`, `isItemDesire`, `itemDesireFood`, `itemDesireDrink`, `hasItemAnimation`, `itemAnimationName`, `isItemDroppable`, `isItemUseable`, `isItemGiveable`, `isItemClothes`, `ClothesType`, `ClothesDraw`, `ClothesTexture`, `ClothesUndershirt`, `ClothesUndershirtTexture`, `ClothesDecals`, `ClothesDecalsTexture`, `itemPicSRC`) VALUES
(4, 'Tasche', 'clothes', 'Eine Tasche.', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Bag', 44, 0, 0, 0, 0, 0, 'Tasche.png'),
(5, 'Rucksack', 'clothes', 'Ein Rucksack', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Bag', 31, 0, 0, 0, 0, 0, 'Rucksack.png'),
(8, 'Ausweis', 'cards', 'Ein Ausweis.', 0, 0, 0, 0, 0, 'None', 0, 0, 0, 0, 'None', 0, 0, 0, 0, 0, 0, 'Ausweis.png'),
(9, 'EC Karte', 'cards', 'Eine EC Karte.', 0, 0, 0, 0, 0, 'None', 1, 1, 1, 0, 'None', 0, 0, 0, 0, 0, 0, 'EC_Karte.png'),
(10, 'Rosa Schweine-Maske', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 1, 0, 0, 0, 0, 0, 'Maske.png'),
(11, 'Braune Schweine-Maske', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 1, 1, 0, 0, 0, 0, 'Maske.png'),
(12, 'Graue Totenkopf-Maske', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 2, 0, 0, 0, 0, 0, 'Maske.png'),
(13, 'Beige Totenkopf-Maske', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 2, 1, 0, 0, 0, 0, 'Maske.png'),
(14, 'Affen-Maske mit Zigarre', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 3, 0, 0, 0, 0, 0, 'Maske.png'),
(15, 'Weiß-Rote Baseball-Maske', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 4, 0, 0, 0, 0, 0, 'Maske.png'),
(16, 'Rote Baseball-Maske', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 4, 1, 0, 0, 0, 0, 'Maske.png'),
(17, 'Braune-Affenmaske', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 5, 0, 0, 0, 0, 0, 'Maske.png'),
(18, 'Dunkelbraune-Affenmaske', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 5, 1, 0, 0, 0, 0, 'Maske.png'),
(19, 'Gruene-Affenmaske', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 5, 2, 0, 0, 0, 0, 'Maske.png'),
(20, 'Weise-Affenmaske', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 5, 3, 0, 0, 0, 0, 'Maske.png'),
(21, 'Rot-Gelbe Kunstmaske', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 6, 0, 0, 0, 0, 0, 'Maske.png'),
(22, 'Schwarz-Weise Kunstmaske', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 6, 1, 0, 0, 0, 0, 'Maske.png'),
(23, 'Blaue Kunstmaske', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 6, 2, 0, 0, 0, 0, 'Maske.png'),
(24, 'Schwarz-Rote Kunstmaske', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 6, 3, 0, 0, 0, 0, 'Maske.png'),
(25, 'Braune Devil-Maske', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 7, 0, 0, 0, 0, 0, 'Maske.png'),
(26, 'Rote Devil-Maske', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 7, 1, 0, 0, 0, 0, 'Maske.png'),
(27, 'Schwarze Devil-Maske', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 7, 2, 0, 0, 0, 0, 'Maske.png'),
(28, 'Graue Devil-Maske', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 7, 3, 0, 0, 0, 0, 'Maske.png'),
(29, 'Weise Weihnachsmann-Maske', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 8, 0, 0, 0, 0, 0, 'Maske.png'),
(30, 'Schwarze Weihnachtsmann-Maske', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 8, 1, 0, 0, 0, 0, 'Maske.png'),
(31, 'Braune Weihnachtsmann-Maske', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 8, 2, 0, 0, 0, 0, 'Maske.png'),
(32, 'Rentier-Maske', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 9, 0, 0, 0, 0, 0, 'Maske.png'),
(33, 'Schneemann-Maske', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 10, 0, 0, 0, 0, 0, 'Maske.png'),
(34, 'Weise Erotik-Maske', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 11, 0, 0, 0, 0, 0, 'Maske.png'),
(35, 'Rote Erotik-Maske', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 11, 1, 0, 0, 0, 0, 'Maske.png'),
(36, 'Schwarze Erotik-Maske', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 11, 2, 0, 0, 0, 0, 'Maske.png'),
(37, 'Beige Venezianische-Maske', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 12, 0, 0, 0, 0, 0, 'Maske.png'),
(38, 'Weise Venezianische-Maske', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 12, 1, 0, 0, 0, 0, 'Maske.png'),
(39, 'Schwarze Venezianische-Maske', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 12, 2, 0, 0, 0, 0, 'Maske.png'),
(40, 'Engels-Maske', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 13, 0, 0, 0, 0, 0, 'Maske.png'),
(41, 'Blaue Baseball-Maske', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 14, 0, 0, 0, 0, 0, 'Maske.png'),
(42, 'Vinewood Baseball-Maske', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 14, 1, 0, 0, 0, 0, 'Maske.png'),
(43, 'Schwarze Totenkopf Baseball-Maske', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 15, 0, 0, 0, 0, 0, 'Maske.png'),
(44, 'Braune getakerte Baseball-Maske', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 15, 1, 0, 0, 0, 0, 'Maske.png'),
(45, 'Beige getakerte Baseball-Maske', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 15, 2, 0, 0, 0, 0, 'Maske.png'),
(46, 'Schwarz-Gelb-Weise Baseball-Maske', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 15, 3, 0, 0, 0, 0, 'Maske.png'),
(47, 'Graue Eisen-Maske', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 16, 0, 0, 0, 0, 0, 'Maske.png'),
(48, 'Gruene Eisen-Maske', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 16, 1, 0, 0, 0, 0, 'Maske.png'),
(49, 'Schwarz-Orangene Eisen-Maske', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 16, 2, 0, 0, 0, 0, 'Maske.png'),
(50, 'Lila Eisen-Maske', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 16, 3, 0, 0, 0, 0, 'Maske.png'),
(51, 'Schwarze Eisenmaske', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 16, 4, 0, 0, 0, 0, 'Maske.png'),
(52, 'Graue Katzen-Maske', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 17, 0, 0, 0, 0, 0, 'Maske.png'),
(53, 'Katzen-Maske', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 17, 1, 0, 0, 0, 0, 'Maske.png'),
(54, 'Fuchs-Maske', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 18, 0, 0, 0, 0, 0, 'Maske.png'),
(55, 'Braune Fuchs-Maske', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 18, 1, 0, 0, 0, 0, 'Maske.png'),
(56, 'Braune Eulen-Maske', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 19, 0, 0, 0, 0, 0, 'Maske.png'),
(57, 'Weise Eulen-Maske', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 19, 1, 0, 0, 0, 0, 'Maske.png'),
(58, 'Waschbaeren-Maske', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 20, 0, 0, 0, 0, 0, 'Maske.png'),
(59, 'Graue Waschbaeren-Maske', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 20, 1, 0, 0, 0, 0, 'Maske.png'),
(60, 'Braune Baeren-Maske', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 21, 0, 0, 0, 0, 0, 'Maske.png'),
(61, 'Weise Baeren-Maske', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 21, 1, 0, 0, 0, 0, 'Maske.png'),
(62, 'Dunkelbraune Bullen-Maske', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 22, 0, 0, 0, 0, 0, 'Maske.png'),
(63, 'Braune Bullen-Maske', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 22, 1, 0, 0, 0, 0, 'Maske.png'),
(64, 'Schwarze Stier-Maske', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 23, 0, 0, 0, 0, 0, 'Maske.png'),
(65, 'Braube Stier-Maske', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 23, 1, 0, 0, 0, 0, 'Maske.png'),
(66, 'Braune Adler-Maske', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 24, 0, 0, 0, 0, 0, 'Maske.png'),
(67, 'Weise Adler-Maske', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 24, 1, 0, 0, 0, 0, 'Maske.png'),
(68, 'Rosa Geier-Maske', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 25, 0, 0, 0, 0, 0, 'Maske.png'),
(69, 'Schwarze Geier-Maske', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 25, 1, 0, 0, 0, 0, 'Maske.png'),
(70, 'Braune Wolfs-Maske', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 26, 0, 0, 0, 0, 0, 'Maske.png'),
(71, 'Schwarze Wolfs-Maske', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 26, 1, 0, 0, 0, 0, 'Maske.png'),
(72, 'Fliegermaske', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 27, 0, 0, 0, 0, 0, 'Maske.png'),
(73, 'NOOSE-Maske', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 28, 0, 0, 0, 0, 0, 'Maske.png'),
(74, 'Graue NOOSE-Maske', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 28, 1, 0, 0, 0, 0, 'Maske.png'),
(75, 'Schwarze Totenkopfmaske mit Gummi', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 29, 0, 0, 0, 0, 0, 'Maske.png'),
(76, 'Graue Totenkopfmaske mit Gummi', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 29, 1, 0, 0, 0, 0, 'Maske.png'),
(77, 'Dunkelgraue Totenkopfmaske mit Gummi', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 29, 2, 0, 0, 0, 0, 'Maske.png'),
(78, 'Beige Totenkopfmaske mit Gummi', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 29, 3, 0, 0, 0, 0, 'Maske.png'),
(79, 'Gruene Totenkopfmaske mit Gummi', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 29, 4, 0, 0, 0, 0, 'Maske.png'),
(80, 'Pleas-Stop Baseball-Maske', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 30, 0, 0, 0, 0, 0, 'Maske.png'),
(81, 'Pinguin-Maske', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 31, 0, 0, 0, 0, 0, 'Maske.png'),
(82, 'Strumpf-Maske', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 32, 0, 0, 0, 0, 0, 'Maske.png'),
(83, 'Freundliche Keks-Maske', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 33, 0, 0, 0, 0, 0, 'Maske.png'),
(84, 'Weise Opa-Maske', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 34, 0, 0, 0, 0, 0, 'Maske.png'),
(85, 'Schwarze Opa-Maske', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 34, 1, 0, 0, 0, 0, 'Maske.png'),
(86, 'SWAT-Sturmhaube', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 35, 0, 0, 0, 0, 0, 'Maske.png'),
(87, 'Atemschutz-Maske', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 36, 0, 0, 0, 0, 0, 'Maske.png'),
(88, 'Schwarze Socken-Maske', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 37, 0, 0, 0, 0, 0, 'Maske.png'),
(89, 'Tauchermaske', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 38, 0, 0, 0, 0, 0, 'Maske.png'),
(90, 'Helle Zombie-Maske', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 39, 0, 0, 0, 0, 0, 'Maske.png'),
(91, 'Dunkle Zombie-Maske', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 39, 1, 0, 0, 0, 0, 'Maske.png'),
(92, 'Beige Mumien-Maske', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 40, 0, 0, 0, 0, 0, 'Maske.png'),
(93, 'Gruene Mumien-Maske', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 40, 1, 0, 0, 0, 0, 'Maske.png'),
(94, 'Vampier-Maske', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 41, 0, 0, 0, 0, 0, 'Maske.png'),
(95, 'Blaue Vampier-Maske', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 41, 1, 0, 0, 0, 0, 'Maske.png'),
(96, 'Helle Frankenstein-Maske', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 42, 0, 0, 0, 0, 0, 'Maske.png'),
(97, 'Graue Frankenstein-Maske', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 42, 1, 0, 0, 0, 0, 'Maske.png'),
(98, 'King Crimson-Maske', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 43, 0, 0, 0, 0, 0, 'Maske.png'),
(99, 'Anime-Maske', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 44, 0, 0, 0, 0, 0, 'Maske.png'),
(100, 'Detektiv-Maske', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 45, 0, 0, 0, 0, 0, 'Maske.png'),
(101, 'Gasmaske', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 46, 0, 0, 0, 0, 0, 'Maske.png'),
(102, 'Crime Abspeerband', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 47, 0, 0, 0, 0, 0, 'Maske.png'),
(103, 'Pfeil Abspeerband', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 47, 1, 0, 0, 0, 0, 'Maske.png'),
(104, 'Graues Klebeband', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 48, 0, 0, 0, 0, 0, 'Maske.png'),
(105, 'Schwarzes Klebeband', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 48, 1, 0, 0, 0, 0, 'Maske.png'),
(106, 'Weises Klebeband', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 48, 2, 0, 0, 0, 0, 'Maske.png'),
(107, 'Buntes Klebeband', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 48, 3, 0, 0, 0, 0, 'Maske.png'),
(108, 'Papiertueten-Maske', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 49, 0, 0, 0, 0, 0, 'Maske.png'),
(109, 'Grinsende Papiertueten-Maske', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 49, 1, 0, 0, 0, 0, 'Maske.png'),
(110, 'Weinende Papiertueten-Maske', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 49, 2, 0, 0, 0, 0, 'Maske.png'),
(111, 'Mund Papiertueten-Maske', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 49, 3, 0, 0, 0, 0, 'Maske.png'),
(112, 'Katzen Paiertueten-Maske', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 49, 4, 0, 0, 0, 0, 'Maske.png'),
(113, 'Gruene Gesichtsmaske', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 50, 0, 0, 0, 0, 0, 'Maske.png'),
(114, 'Gesichtsmaske', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 50, 1, 0, 0, 0, 0, 'Maske.png'),
(115, 'Rosane Gesichtsmaske', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 50, 2, 0, 0, 0, 0, 'Maske.png'),
(116, 'Clown Gesichtsmaske', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 50, 3, 0, 0, 0, 0, 'Maske.png'),
(117, 'Schwarze Gesichtsmaske', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 50, 4, 0, 0, 0, 0, 'Maske.png'),
(118, 'Braune Gesichtsmaske', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 50, 5, 0, 0, 0, 0, 'Maske.png'),
(119, 'Gesichtsmaske mit schwarzen Augen', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 50, 6, 0, 0, 0, 0, 'Maske.png'),
(120, 'Erroetete Gesichtsmaske', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 50, 7, 0, 0, 0, 0, 'Maske.png'),
(121, 'Gesichtsmaske mit blauen Augen', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 50, 8, 0, 0, 0, 0, 'Maske.png'),
(122, 'Weis-Schwarze Gesichtsmaske', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 50, 9, 0, 0, 0, 0, 'Maske.png'),
(123, 'Ganz Schwarzes Bandana', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 51, 0, 0, 0, 0, 0, 'Maske.png'),
(124, 'Totenkopf Bandana', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 51, 1, 0, 0, 0, 0, 'Maske.png'),
(125, 'Graues Bandana', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 51, 2, 0, 0, 0, 0, 'Maske.png'),
(126, 'Beiges Bandana', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 51, 3, 0, 0, 0, 0, 'Maske.png'),
(127, 'Tarnfarbenes Bandana', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 51, 4, 0, 0, 0, 0, 'Maske.png'),
(128, 'Gruenes Bandana', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 51, 5, 0, 0, 0, 0, 'Maske.png'),
(129, 'Purple Bandana', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 51, 6, 0, 0, 0, 0, 'Maske.png'),
(130, 'Schwarzes Bandana', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 51, 7, 0, 0, 0, 0, 'Maske.png'),
(131, 'Gelbes Bandana', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 51, 8, 0, 0, 0, 0, 'Maske.png'),
(132, 'Elektro Totenkof Bandana', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 51, 9, 0, 0, 0, 0, 'Maske.png'),
(133, 'Schwarze Sturmhaube', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 52, 0, 0, 0, 0, 0, 'Maske.png'),
(134, 'Graue Sturmhaube', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 52, 1, 0, 0, 0, 0, 'Maske.png'),
(135, 'Weise Sturmhaube', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 52, 2, 0, 0, 0, 0, 'Maske.png'),
(136, 'Gruene Sturmhaube', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 52, 3, 0, 0, 0, 0, 'Maske.png'),
(137, 'Braune Sturmhaube', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 52, 4, 0, 0, 0, 0, 'Maske.png'),
(138, 'Dunkelgraue Sturmhaube', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 52, 5, 0, 0, 0, 0, 'Maske.png'),
(139, 'Tarnfarbene Sturmhaube', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 52, 6, 0, 0, 0, 0, 'Maske.png'),
(140, 'Graue-Tarn Sturmhaube', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 52, 7, 0, 0, 0, 0, 'Maske.png'),
(141, 'Blaue Sturmhaube', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 52, 8, 0, 0, 0, 0, 'Maske.png'),
(142, 'Gelbe Sturmhaube', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 52, 9, 0, 0, 0, 0, 'Maske.png'),
(143, 'Schwarze Sturmhaube mit Kaputze', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 53, 0, 0, 0, 0, 0, 'Maske.png'),
(144, 'Graue Sturmhaube mit Kaputze', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 53, 1, 0, 0, 0, 0, 'Maske.png'),
(145, 'Weise Stumhaube mit Kaputze', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 53, 2, 0, 0, 0, 0, 'Maske.png'),
(146, 'Gruene Sturmhaube mit Kaputze', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 53, 3, 0, 0, 0, 0, 'Maske.png'),
(147, 'Braune Sturmhaube mit Kaputze', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 53, 4, 0, 0, 0, 0, 'Maske.png'),
(148, 'Dunkelgraue Sturmhaube mit Kaputze', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 53, 5, 0, 0, 0, 0, 'Maske.png'),
(149, 'Tarn Sturmhaube mit Kaputze', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 53, 6, 0, 0, 0, 0, 'Maske.png'),
(150, 'Graue-Tarn Sturmhaube mit Kaputze', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 53, 7, 0, 0, 0, 0, 'Maske.png'),
(151, 'Schwarze Totenkopf Sturmhaube mit Kaputze', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 53, 8, 0, 0, 0, 0, 'Maske.png'),
(152, 'Schwarzes T-Shirtbandana', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 54, 0, 0, 0, 0, 0, 'Maske.png'),
(153, 'Weises T-Shirtbandana', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 54, 1, 0, 0, 0, 0, 'Maske.png'),
(154, 'Beiges T-Shirtbandana', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 54, 2, 0, 0, 0, 0, 'Maske.png'),
(155, 'Braunes T-Shirtbandana', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 54, 3, 0, 0, 0, 0, 'Maske.png'),
(156, 'Graues T-Shirtbandana', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 54, 4, 0, 0, 0, 0, 'Maske.png'),
(157, 'Armee T-Shirtbandana', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 54, 5, 0, 0, 0, 0, 'Armee_T-Shirtbandana.png'),
(158, 'Rot-Weises T-Shirtbandana', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 54, 6, 0, 0, 0, 0, 'Maske.png'),
(159, 'Dunkelbraunes T-Shirtbandana', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 54, 7, 0, 0, 0, 0, 'Maske.png'),
(160, 'Hellgraues T-Shirtbandana', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 54, 8, 0, 0, 0, 0, 'Maske.png'),
(161, 'Rosanes T-Shirtbandana', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 54, 9, 0, 0, 0, 0, 'Maske.png'),
(162, 'Schwarze Maske mit Gummizug', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 55, 0, 0, 0, 0, 0, 'Maske.png'),
(163, 'Braune Maske mit Gummizug', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 55, 1, 0, 0, 0, 0, 'Maske.png'),
(164, 'Blaue Lockere Sturmhaube', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 56, 0, 0, 0, 0, 0, 'Maske.png'),
(165, 'Schwarze lockere Sturmhaube', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 56, 1, 0, 0, 0, 0, 'Maske.png'),
(166, 'Lockere Sturmhaube mit Totenkopf', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 56, 2, 0, 0, 0, 0, 'Maske.png'),
(167, 'Schwarze Strickhaube', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 57, 0, 0, 0, 0, 0, 'Maske.png'),
(168, 'Gruene Strickhaube', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 57, 1, 0, 0, 0, 0, 'Maske.png'),
(169, 'Rostbraune Strickhaube', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 57, 2, 0, 0, 0, 0, 'Maske.png'),
(170, 'Graue Strickhaube', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 57, 3, 0, 0, 0, 0, 'Maske.png'),
(171, 'Braune Strickhaube', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 57, 4, 0, 0, 0, 0, 'Maske.png'),
(172, 'Bunte Strickhaube', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 57, 5, 0, 0, 0, 0, 'Maske.png'),
(173, 'Tarn Strickhaube', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 57, 6, 0, 0, 0, 0, 'Maske.png'),
(174, 'Beige Strickhaube', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 57, 7, 0, 0, 0, 0, 'Maske.png'),
(175, 'Rosane Strickhaube', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 57, 8, 0, 0, 0, 0, 'Maske.png'),
(176, 'Rot-Gruene Strickhaube', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 57, 9, 0, 0, 0, 0, 'Maske.png'),
(177, 'Schwarze Strickhaube mit SChiff', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 57, 10, 0, 0, 0, 0, 'Maske.png'),
(178, 'Schwarz-Weise Strickhaube', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 58, 0, 0, 0, 0, 0, 'Maske.png'),
(179, 'Gruen-Graue Strickhaube', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 58, 1, 0, 0, 0, 0, 'Maske.png'),
(180, 'Camo Strickhaube', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 58, 2, 0, 0, 0, 0, 'Maske.png'),
(181, 'Pinke Strickhaube', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 58, 3, 0, 0, 0, 0, 'Maske.png'),
(182, 'Oangene Flecken Strickhaube', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 58, 4, 0, 0, 0, 0, 'Maske.png'),
(183, 'RAGE Strickhaube', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 58, 5, 0, 0, 0, 0, 'Maske.png'),
(184, 'Affen Strickhaube', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 58, 6, 0, 0, 0, 0, 'Affen_Strickhaube.png'),
(185, 'Hellblaue Strickhaube', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 58, 7, 0, 0, 0, 0, 'Maske.png'),
(186, 'Gelb-Schwarze Strickhaube', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 58, 8, 0, 0, 0, 0, 'Maske.png'),
(187, 'Rosa-Pinke Strickhaube', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 58, 9, 0, 0, 0, 0, 'Maske.png'),
(188, 'Werwolf-Maske', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 59, 0, 0, 0, 0, 0, 'Maske.png'),
(189, 'Kuerbis-Maske', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 60, 0, 0, 0, 0, 0, 'Maske.png'),
(190, 'Hellgruene Kuerbis-Maske', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 60, 1, 0, 0, 0, 0, 'Maske.png'),
(191, 'Gruene Kuerbis-Maske', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 60, 2, 0, 0, 0, 0, 'Maske.png'),
(192, 'Weise Opa Zombi-Maske', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 61, 0, 0, 0, 0, 0, 'Maske.png'),
(193, 'Graue Opa Zombie-Maske', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 61, 1, 0, 0, 0, 0, 'Maske.png'),
(194, 'Gruene Opa Zombie-Maske', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 61, 2, 0, 0, 0, 0, 'Maske.png'),
(195, 'Freddy-Maske', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 62, 0, 0, 0, 0, 0, 'Maske.png'),
(196, 'Blutverschmierte Freddy-Maske', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 62, 1, 0, 0, 0, 0, 'Maske.png'),
(197, 'Dunkle Freddy-Maske', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 62, 2, 0, 0, 0, 0, 'Maske.png'),
(198, 'Gehaeutete-Maske', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 63, 0, 0, 0, 0, 0, 'Maske.png'),
(199, 'Gruene Gehaeutete-Maske', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 63, 1, 0, 0, 0, 0, 'Maske.png'),
(200, 'Graue Gehaeutete-Maske', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 63, 2, 0, 0, 0, 0, 'Maske.png'),
(201, 'Totenkopfmaske mit Zunge', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 64, 0, 0, 0, 0, 0, 'Maske.png'),
(202, 'Gruene Totenkopfmaske mit Zunge', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 64, 1, 0, 0, 0, 0, 'Maske.png'),
(203, 'Dunkle Totenkopfmaske mit Zunge', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 64, 2, 0, 0, 0, 0, 'Maske.png'),
(204, 'Helle Werwolfmaske', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 65, 0, 0, 0, 0, 0, 'Maske.png'),
(205, 'Braune Werwolfmaske', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 65, 1, 0, 0, 0, 0, 'Maske.png'),
(206, 'Graue Werwolfmaske', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 65, 2, 0, 0, 0, 0, 'Maske.png'),
(207, 'Gruene Insektenmaske', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 66, 0, 0, 0, 0, 0, 'Maske.png'),
(208, 'Rote Insektenmaske', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 66, 1, 0, 0, 0, 0, 'Maske.png'),
(209, 'Lilane Insektenmaske', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 66, 2, 0, 0, 0, 0, 'Maske.png'),
(210, 'Graue Golummaske', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 67, 0, 0, 0, 0, 0, 'Maske.png'),
(211, 'Gruene Golummaske', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 67, 1, 0, 0, 0, 0, 'Maske.png'),
(212, 'Weise Golummaske', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 67, 2, 0, 0, 0, 0, 'Maske.png'),
(213, 'Rote Teufelmaske', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 68, 0, 0, 0, 0, 0, 'Maske.png'),
(214, 'Orangene Teufelmaske', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 68, 1, 0, 0, 0, 0, 'Maske.png'),
(215, 'Schwarze Teufelmaske', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 68, 2, 0, 0, 0, 0, 'Maske.png'),
(216, 'Beige Sack-Maske', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 69, 0, 0, 0, 0, 0, 'Maske.png'),
(217, 'Braune Sack-Maske', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 69, 1, 0, 0, 0, 0, 'Maske.png'),
(218, 'Schwarze Sack-Maske', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 69, 2, 0, 0, 0, 0, 'Maske.png'),
(219, 'Blaue Hypnosemaske', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 70, 0, 0, 0, 0, 0, 'Maske.png'),
(220, 'Gruene Hypnosemaske', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 70, 1, 0, 0, 0, 0, 'Maske.png'),
(221, 'Pinke Hypnosemaske', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 70, 2, 0, 0, 0, 0, 'Maske.png'),
(222, 'Gruene Hexenmaske', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 71, 0, 0, 0, 0, 0, 'Maske.png'),
(223, 'Weise Hexenmaske', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 71, 1, 0, 0, 0, 0, 'Maske.png'),
(224, 'Hexenmaske', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 71, 2, 0, 0, 0, 0, 'Maske.png'),
(225, 'Rote Teufelsmaske mit Bart', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 72, 0, 0, 0, 0, 0, 'Maske.png'),
(226, 'Orangene Teufelsmaske mit Bart', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 72, 1, 0, 0, 0, 0, 'Maske.png'),
(227, 'Schwarze Teufelsmaske mit Bart', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 72, 2, 0, 0, 0, 0, 'Maske.png'),
(228, 'Verbrannter wuetender Keks-Maske', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 74, 0, 0, 0, 0, 0, 'Maske.png'),
(229, 'Wuetender Keks-Maske', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 75, 0, 0, 0, 0, 0, 'Maske.png'),
(230, 'Weiser Weihnachtsmann mit Zigarre', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 76, 0, 0, 0, 0, 0, 'Maske.png'),
(231, 'Schwarzer Weihnachtsmann mit Zigarre', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 76, 1, 0, 0, 0, 0, 'Maske.png'),
(232, 'Brauner Weihnachtsmann mit Zigarre', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 76, 2, 0, 0, 0, 0, 'Maske.png'),
(233, 'Tannenbaum-Maske', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 77, 0, 0, 0, 0, 0, 'Maske.png'),
(234, 'Werwolfmaske mit Cap', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 80, 0, 0, 0, 0, 0, 'Maske.png'),
(235, 'Werwolfmaske mit Weihnachtsmuetze', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 83, 0, 0, 0, 0, 0, 'Maske.png'),
(236, 'Yeti-Maske', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 84, 0, 0, 0, 0, 0, 'Maske.png'),
(237, 'Rohe Huehnchen-Maske', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 85, 0, 0, 0, 0, 0, 'Maske.png'),
(238, 'Gebratene Huehnchen-Maske', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 85, 1, 0, 0, 0, 0, 'Maske.png'),
(239, 'Weise Betrunkene Oma-Maske', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 86, 0, 0, 0, 0, 0, 'Maske.png'),
(240, 'Schwarze Betrunkene Oma-Maske', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 86, 1, 0, 0, 0, 0, 'Maske.png'),
(241, 'Braune Betrunkene Oma-Maske', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 86, 2, 0, 0, 0, 0, 'Maske.png'),
(242, 'Weiser Betrunkener Opa-Maske', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 87, 0, 0, 0, 0, 0, 'Maske.png'),
(243, 'Schwarzer Betrunkener Opa-Maske', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 87, 1, 0, 0, 0, 0, 'Maske.png'),
(244, 'Brauner Betrunkener Opa-Maske', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 87, 2, 0, 0, 0, 0, 'Maske.png'),
(245, 'Weise Oma-Maske', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 88, 0, 0, 0, 0, 0, 'Maske.png'),
(246, 'Schwarze Oma-Maske', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 88, 1, 0, 0, 0, 0, 'Maske.png'),
(247, 'Braune Oma-Maske', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 88, 2, 0, 0, 0, 0, 'Maske.png'),
(248, 'Gruene Alien-Maske', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 92, 0, 0, 0, 0, 0, 'Maske.png'),
(249, 'Graue Alien-Maske', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 92, 1, 0, 0, 0, 0, 'Maske.png'),
(250, 'Rote Alien-Maske', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 92, 2, 0, 0, 0, 0, 'Maske.png'),
(251, 'Helle Alien-Maske', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 92, 3, 0, 0, 0, 0, 'Maske.png'),
(252, 'Braune Alien-Maske', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 92, 4, 0, 0, 0, 0, 'Maske.png'),
(253, 'Schwarze Alien-Maske', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 92, 5, 0, 0, 0, 0, 'Maske.png'),
(254, 'Orangene Dino-Maske', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 93, 0, 0, 0, 0, 0, 'Maske.png'),
(255, 'Graue Dino-Maske', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 93, 1, 0, 0, 0, 0, 'Maske.png'),
(256, 'Blaue Dino-Maske', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 93, 2, 0, 0, 0, 0, 'Maske.png'),
(257, 'Braune Dino-Maske', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 93, 3, 0, 0, 0, 0, 'Maske.png'),
(258, 'Gruene Dino-Maske', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 93, 4, 0, 0, 0, 0, 'Maske.png'),
(259, 'Gelbe Dino-Maske', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 93, 5, 0, 0, 0, 0, 'Maske.png'),
(260, 'Rote Punkerteufel-Maske', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 94, 0, 0, 0, 0, 0, 'Maske.png'),
(261, 'Blaue Punkerteufel-Maske', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 94, 1, 0, 0, 0, 0, 'Maske.png'),
(262, 'Graue Punkerteufel-Maske', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 94, 2, 0, 0, 0, 0, 'Maske.png'),
(263, 'Schwarze Punkerteufel-Maske', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 94, 3, 0, 0, 0, 0, 'Maske.png'),
(264, 'Goldene Punkerteufel-Maske', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 94, 4, 0, 0, 0, 0, 'Maske.png'),
(265, 'Gruene Punkerteufel-Maske', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 94, 5, 0, 0, 0, 0, 'Maske.png'),
(266, 'Clownmaske', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 95, 0, 0, 0, 0, 0, 'Maske.png'),
(267, 'Clownmaske mit Tuerkisen Haar', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 95, 1, 0, 0, 0, 0, 'Maske.png'),
(268, 'Clownmaske mit Gruenen Haar', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 95, 2, 0, 0, 0, 0, 'Maske.png'),
(269, 'Clownmaske mit Orangenen Haar', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 95, 3, 0, 0, 0, 0, 'Maske.png'),
(270, 'Clownmaske mit Braunen Haar', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 95, 4, 0, 0, 0, 0, 'Maske.png'),
(271, 'Clownmaske mit Pinken Haar', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 95, 5, 0, 0, 0, 0, 'Maske.png'),
(272, 'Clownmaske mit Blauen Haar', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 95, 6, 0, 0, 0, 0, 'Maske.png'),
(273, 'Schwarze Gorilla-Maske', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 96, 0, 0, 0, 0, 0, 'Maske.png'),
(274, 'Braune Gorilla Maske', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 96, 1, 0, 0, 0, 0, 'Maske.png'),
(275, 'Graue Gorilla-Maske', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 96, 2, 0, 0, 0, 0, 'Maske.png'),
(276, 'Helle Gorilla-Maske', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 96, 3, 0, 0, 0, 0, 'Maske.png'),
(277, 'Braune Pferdemaske', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 97, 0, 0, 0, 0, 0, 'Maske.png'),
(278, 'Schwarze Pferdemaske', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 97, 1, 0, 0, 0, 0, 'Maske.png'),
(279, 'Graue Pferdemaske', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 97, 2, 0, 0, 0, 0, 'Maske.png'),
(280, 'Einhornmaske', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 98, 0, 0, 0, 0, 0, 'Maske.png'),
(281, 'Rote Schoene Totenkopfmaske', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 99, 0, 0, 0, 0, 0, 'Maske.png'),
(282, 'Graue Schoene Totenkopfmaske', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 99, 1, 0, 0, 0, 0, 'Maske.png'),
(283, 'Blaue Schoene Totenkopfmaske', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 99, 2, 0, 0, 0, 0, 'Maske.png'),
(284, 'Gruene Schoene Totenkopfmaske', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 99, 3, 0, 0, 0, 0, 'Maske.png'),
(285, 'Weise Schoene Totenkopfmaske', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 99, 4, 0, 0, 0, 0, 'Maske.png'),
(286, 'Schwarze Schoene Totenkopfmaske', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 99, 5, 0, 0, 0, 0, 'Maske.png'),
(287, 'Beige Mopsmaske', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 100, 0, 0, 0, 0, 0, 'Maske.png'),
(288, 'Schwarze Mopsmaske', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 100, 1, 0, 0, 0, 0, 'Maske.png'),
(289, 'Graue Mopsmaske', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 100, 2, 0, 0, 0, 0, 'Maske.png'),
(290, 'Dunkelbraune Mopsmaske', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 100, 3, 0, 0, 0, 0, 'Maske.png'),
(291, 'Hellbraune Mopsmaske', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 100, 4, 0, 0, 0, 0, 'Maske.png'),
(292, 'Schwarze-Beige Mopsmaske', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 100, 5, 0, 0, 0, 0, 'Maske.png'),
(293, 'Orangener Bigness Mundschutz', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 101, 0, 0, 0, 0, 0, 'Maske.png'),
(294, 'Blauer Bigness Mundschutz', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 101, 1, 0, 0, 0, 0, 'Maske.png'),
(295, 'Pinker Bigness Mundschutz', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 101, 2, 0, 0, 0, 0, 'Maske.png'),
(296, 'Gelber Bigness Mundschutz', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 101, 3, 0, 0, 0, 0, 'Maske.png'),
(297, 'Wuestentarn Bigness Mundschutz', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 101, 4, 0, 0, 0, 0, 'Maske.png'),
(298, 'Grauer Bigness Mundschutz', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 101, 5, 0, 0, 0, 0, 'Maske.png'),
(299, 'Tarn Bigness Mundschutz', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 101, 6, 0, 0, 0, 0, 'Maske.png'),
(300, 'Neon-Maske 1', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 102, 0, 0, 0, 0, 0, 'Maske.png'),
(301, 'Neon-Maske 2', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 102, 1, 0, 0, 0, 0, 'Maske.png'),
(302, 'Neon-Maske 3', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 102, 2, 0, 0, 0, 0, 'Maske.png'),
(303, 'Weise Zombiemaske mit Blauen Helm', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 103, 0, 0, 0, 0, 0, 'Maske.png'),
(304, 'Weise Zombiemaske mit Hellen Helm', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 103, 1, 0, 0, 0, 0, 'Maske.png'),
(305, 'Weise Zombiemaske mit Gruenen Helm', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 103, 2, 0, 0, 0, 0, 'Maske.png'),
(306, 'Schwarze Zombiemaske mit Schwarzen Helm', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 103, 20, 0, 0, 0, 0, 'Maske.png'),
(307, 'Schwarze Zombiemaske mit Grauen Helm', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 103, 21, 0, 0, 0, 0, 'Maske.png'),
(308, 'Schwarze Zombiemaske mit Gruenen Helm', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 103, 22, 0, 0, 0, 0, 'Maske.png'),
(309, 'Blauer Mundschutz', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 107, 0, 0, 0, 0, 0, 'Maske.png'),
(310, 'Gruener Mundschutz', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 107, 2, 0, 0, 0, 0, 'Maske.png'),
(311, 'Gelber Mundschutz', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 107, 19, 0, 0, 0, 0, 'Maske.png'),
(312, 'Orangener Mundschutz', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 107, 21, 0, 0, 0, 0, 'Maske.png'),
(313, 'Lilaner Mundschutz', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 107, 22, 0, 0, 0, 0, 'Maske.png'),
(314, 'Pinker Mundschutz', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 107, 23, 0, 0, 0, 0, 'Maske.png'),
(315, 'Graue Maske mit Roten Augen ', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 110, 0, 0, 0, 0, 0, 'Maske.png'),
(316, 'Blaue Maske mit Roten Augen', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 110, 1, 0, 0, 0, 0, 'Maske.png'),
(317, 'Gruene Maske mit Roten Augen', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 110, 3, 0, 0, 0, 0, 'Maske.png'),
(318, 'Zebra Maske mit Roten Augen', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 110, 20, 0, 0, 0, 0, 'Maske.png'),
(319, 'Weise Maske mit Roten Augen', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 110, 21, 0, 0, 0, 0, 'Maske.png'),
(320, 'Ganz Gruene Maske mit Roten Augen', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 110, 22, 0, 0, 0, 0, 'Maske.png'),
(321, 'Orangene Maske mit Roten Augen', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 110, 23, 0, 0, 0, 0, 'Maske.png'),
(322, 'Lilane Maske mit Roten Augen', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 110, 24, 0, 0, 0, 0, 'Maske.png'),
(323, 'Pinke Maske mit Roten Augen', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 110, 25, 0, 0, 0, 0, 'Maske.png'),
(324, 'Gruenes Totenkopf-Bandana', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 111, 0, 0, 0, 0, 0, 'Maske.png'),
(325, 'Orangenes Totenkopf-Bandana', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 111, 1, 0, 0, 0, 0, 'Maske.png'),
(326, 'Lilanes Totenkopf-Bandana', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 111, 2, 0, 0, 0, 0, 'Maske.png'),
(327, 'Pinkes Totenkopf-Bandana', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 111, 3, 0, 0, 0, 0, 'Maske.png'),
(328, 'Blaues Camo Bandana', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 111, 4, 0, 0, 0, 0, 'Maske.png'),
(329, 'Rotes Camo Bandana', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 111, 5, 0, 0, 0, 0, 'Maske.png'),
(330, 'Gemustertes Bigness-Bandana 1', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 111, 6, 0, 0, 0, 0, 'Maske.png'),
(331, 'Gemustertes Bigness-Bandana 2', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 111, 7, 0, 0, 0, 0, 'Maske.png'),
(332, 'Schwarz-Gruenes Bigness-Bandana', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 111, 8, 0, 0, 0, 0, 'Maske.png'),
(333, 'Rotes Bigness-Bandana', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 111, 9, 0, 0, 0, 0, 'Maske.png'),
(334, 'Gruenes Bandana mit Blattmuster', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 111, 10, 0, 0, 0, 0, 'Maske.png'),
(335, 'Blaues Bandana mit Blattmuster', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 111, 11, 0, 0, 0, 0, 'Maske.png'),
(336, 'Rot-Blaues Karo Bandana', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 111, 12, 0, 0, 0, 0, 'Maske.png'),
(337, 'Schwarz-Blaues Karo Bandana', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 111, 13, 0, 0, 0, 0, 'Maske.png'),
(338, 'Schwarzes MANOR-DEM Bandana', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 111, 14, 0, 0, 0, 0, 'Maske.png'),
(339, 'Weises BROKEN-Bandana', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 111, 15, 0, 0, 0, 0, 'Maske.png'),
(340, 'Orangenes BROKEN-Bandana', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 111, 16, 0, 0, 0, 0, 'Maske.png'),
(341, 'Schwarz-Gruen-Rostes Bandana', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 111, 17, 0, 0, 0, 0, 'Maske.png'),
(342, 'Beige-Gruen-Rotes Bandana', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 111, 18, 0, 0, 0, 0, 'Maske.png'),
(343, 'USA-Bandana', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 111, 19, 0, 0, 0, 0, 'Maske.png'),
(344, 'Buntes-Bandana', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 111, 20, 0, 0, 0, 0, 'Maske.png'),
(345, 'Rosa-Blaues Bandana', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 111, 21, 0, 0, 0, 0, 'Maske.png'),
(346, 'Camoflage Bandana', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 111, 22, 0, 0, 0, 0, 'Maske.png'),
(347, 'Zebra-Bandana', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 111, 23, 0, 0, 0, 0, 'Maske.png'),
(348, 'Buntgemustertes Bandana 1', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 111, 24, 0, 0, 0, 0, 'Maske.png'),
(349, 'Buntgemustertes Bandana 2', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 111, 25, 0, 0, 0, 0, 'Maske.png'),
(350, 'Graue Sturmhaube mit Totenkopf', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 112, 0, 0, 0, 0, 0, 'Maske.png'),
(351, 'Blaue Sturmhaube mit Totenkopf', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 112, 1, 0, 0, 0, 0, 'Maske.png'),
(352, 'Braune Sturmhaube mit Totenkopf', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 112, 2, 0, 0, 0, 0, 'Maske.png'),
(353, 'Gruene Sturmhaube mit Totenkopf', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 112, 3, 0, 0, 0, 0, 'Maske.png'),
(354, 'Beige Sturmhaube mit Totenkopf', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 112, 4, 0, 0, 0, 0, 'Maske.png'),
(355, 'Rote GUEFFY Sturmhaube', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 113, 0, 0, 0, 0, 0, 'Maske.png'),
(356, 'Blattmuster Sturmhaube', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 113, 1, 0, 0, 0, 0, 'Maske.png'),
(357, 'Gelbe XERO Sturmhaube', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 113, 2, 0, 0, 0, 0, 'Maske.png'),
(358, 'Blaue XERO Sturmhaube', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 113, 3, 0, 0, 0, 0, 'Maske.png'),
(359, 'Weise Sturmhaube mit Rotem Strich', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 113, 4, 0, 0, 0, 0, 'Maske.png'),
(360, 'Bigness Sturmhaube', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 113, 5, 0, 0, 0, 0, 'Maske.png'),
(361, 'Bunte Sturmhaube', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 113, 7, 0, 0, 0, 0, 'Maske.png'),
(362, 'USA Sturmhaube', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 113, 10, 0, 0, 0, 0, 'Maske.png'),
(363, 'Schwarze Sturmhaube mit Totenkopf', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 113, 11, 0, 0, 0, 0, 'Maske.png'),
(364, 'Weise Sturmhaube mit totenkopf', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 113, 12, 0, 0, 0, 0, 'Maske.png'),
(366, 'Orangene Sturmhaube', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 113, 14, 0, 0, 0, 0, 'Maske.png'),
(367, 'Lilane Sturmhaube', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 113, 15, 0, 0, 0, 0, 'Maske.png'),
(368, 'Rosane Sturmhaube', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 113, 16, 0, 0, 0, 0, 'Maske.png'),
(369, 'Beiges Palituch mit Cap', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 114, 0, 0, 0, 0, 0, 'Maske.png'),
(370, 'Blaues Palituch mit Cap', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 114, 1, 0, 0, 0, 0, 'Maske.png'),
(371, 'Gruenes Palituch mit Cap', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 114, 2, 0, 0, 0, 0, 'Maske.png'),
(372, 'Gelbes Palituch mit Cap', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 114, 3, 0, 0, 0, 0, 'Maske.png'),
(373, 'Rotes Palituch mit Cap', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 114, 7, 0, 0, 0, 0, 'Maske.png'),
(374, 'Beigesn Palituch', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 115, 0, 0, 0, 0, 0, 'Maske.png'),
(375, 'Blaues Palituch', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 115, 1, 0, 0, 0, 0, 'Maske.png'),
(376, 'Gruenes Palituch', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 115, 2, 0, 0, 0, 0, 'Maske.png'),
(377, 'Gelbes Palituch', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 115, 3, 0, 0, 0, 0, 'Maske.png'),
(378, 'Rotes Palituch', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 115, 6, 0, 0, 0, 0, 'Maske.png'),
(379, 'Beiges Kragentuch', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 116, 0, 0, 0, 0, 0, 'Maske.png');
INSERT INTO `server_items` (`id`, `itemName`, `itemType`, `itemDescription`, `itemWeight`, `isItemDesire`, `itemDesireFood`, `itemDesireDrink`, `hasItemAnimation`, `itemAnimationName`, `isItemDroppable`, `isItemUseable`, `isItemGiveable`, `isItemClothes`, `ClothesType`, `ClothesDraw`, `ClothesTexture`, `ClothesUndershirt`, `ClothesUndershirtTexture`, `ClothesDecals`, `ClothesDecalsTexture`, `itemPicSRC`) VALUES
(380, 'Blaues Kragentuch', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 116, 1, 0, 0, 0, 0, 'Maske.png'),
(381, 'Gruenes Kragentuch', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 116, 2, 0, 0, 0, 0, 'Maske.png'),
(382, 'Gelbes Kragentuch', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 116, 3, 0, 0, 0, 0, 'Maske.png'),
(383, 'Rotes Kragentuch', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 116, 6, 0, 0, 0, 0, 'Maske.png'),
(384, 'Gruenes T-Shirt Bandana', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 118, 0, 0, 0, 0, 0, 'Maske.png'),
(385, 'Orangenes T-Shirt Bandana', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 118, 1, 0, 0, 0, 0, 'Maske.png'),
(386, 'Lilanes T-Shirt Bandana', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 118, 2, 0, 0, 0, 0, 'Maske.png'),
(387, 'Pinkes T-Shirt Bandana', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 118, 3, 0, 0, 0, 0, 'Maske.png'),
(388, 'Blattmuster T-Shirt Bandana', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 118, 6, 0, 0, 0, 0, 'Maske.png'),
(389, 'Blaues T-Shirt Bandana', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 118, 8, 0, 0, 0, 0, 'Maske.png'),
(390, 'Rotes T-Shirt Bandana', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 118, 9, 0, 0, 0, 0, 'Maske.png'),
(391, 'Buntes T-Shirt Bandana', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 118, 21, 0, 0, 0, 0, 'Maske.png'),
(392, 'Schwarze Sockenmaske mit Totenkopf', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 119, 0, 0, 0, 0, 0, 'Maske.png'),
(393, 'Graue Sockenmaske', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 119, 1, 0, 0, 0, 0, 'Maske.png'),
(394, 'Dunkelgraue Sockenmaske', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 119, 2, 0, 0, 0, 0, 'Maske.png'),
(395, 'Braune Sockenmaske', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 119, 3, 0, 0, 0, 0, 'Maske.png'),
(396, 'Blaue Sockenmaske', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 119, 4, 0, 0, 0, 0, 'Maske.png'),
(397, 'Rote Sockenmaske', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 119, 6, 0, 0, 0, 0, 'Maske.png'),
(398, 'Gruene Sockenmaske', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 119, 7, 0, 0, 0, 0, 'Maske.png'),
(399, 'Orangene Sockenmaske', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 119, 8, 0, 0, 0, 0, 'Maske.png'),
(400, 'Lilane Sockenmaske', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 119, 9, 0, 0, 0, 0, 'Maske.png'),
(401, 'Rosane Sockenmaske', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 119, 10, 0, 0, 0, 0, 'Maske.png'),
(402, 'Bunte Sockenmaske', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 119, 17, 0, 0, 0, 0, 'Maske.png'),
(403, 'Schwarze Metall-Maske', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 125, 0, 0, 0, 0, 0, 'Maske.png'),
(404, 'Graue Metall-Maske', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 125, 1, 0, 0, 0, 0, 'Maske.png'),
(405, 'Weise Metall-Maske', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 125, 2, 0, 0, 0, 0, 'Maske.png'),
(406, 'Beige Metall-Maske', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 125, 3, 0, 0, 0, 0, 'Maske.png'),
(407, 'Gruene Metall-Maske', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 125, 4, 0, 0, 0, 0, 'Maske.png'),
(408, 'Orangene Metall-Maske', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 125, 5, 0, 0, 0, 0, 'Maske.png'),
(409, 'Lilane Metall-Maske', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 125, 6, 0, 0, 0, 0, 'Maske.png'),
(410, 'Rosane Metall-Maske', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 125, 7, 0, 0, 0, 0, 'Maske.png'),
(411, 'Schwarz-Rote Metall-Maske', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 125, 15, 0, 0, 0, 0, 'Maske.png'),
(412, 'Schwarz-Blaue Metall-Maske', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 125, 16, 0, 0, 0, 0, 'Maske.png'),
(413, 'Schwarz-Gelbe Metall-Maske', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 125, 17, 0, 0, 0, 0, 'Maske.png'),
(414, 'Gelbe Gehirn-Alien-Maske', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 139, 0, 0, 0, 0, 0, 'Maske.png'),
(415, 'Rote Gehirn-Alien-Maske', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 139, 1, 0, 0, 0, 0, 'Maske.png'),
(416, 'Beige Gehirn-Alien-Maske', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 139, 2, 0, 0, 0, 0, 'Maske.png'),
(417, 'Hellblaue Gehirn-Alien-Maske', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 139, 3, 0, 0, 0, 0, 'Maske.png'),
(418, 'Lilane Gehirn-Alien-Maske', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 139, 4, 0, 0, 0, 0, 'Maske.png'),
(419, 'Gruene Gehirn-Alien-Maske', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 139, 5, 0, 0, 0, 0, 'Maske.png'),
(420, 'Blaue Gehirn-Alien-Maske', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 139, 6, 0, 0, 0, 0, 'Maske.png'),
(421, 'Dunkelrote Gehirn-Alien-Maske', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 139, 8, 0, 0, 0, 0, 'Maske.png'),
(422, 'Gelbe Augen-Alien-Maske', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 140, 0, 0, 0, 0, 0, 'Maske.png'),
(423, 'Rote Augen-Alien-Maske', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 140, 1, 0, 0, 0, 0, 'Maske.png'),
(424, 'Beige Augen-Alien-Maske', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 140, 2, 0, 0, 0, 0, 'Maske.png'),
(425, 'Hellblaue Augen-Alien-Maske', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 140, 3, 0, 0, 0, 0, 'Maske.png'),
(426, 'Lilane Augen-Alien-Maske', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 140, 4, 0, 0, 0, 0, 'Maske.png'),
(427, 'Gruene Augen-Alien-Maske', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 140, 5, 0, 0, 0, 0, 'Maske.png'),
(428, 'Blaue Augen-Alien-Maske', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 140, 6, 0, 0, 0, 0, 'Maske.png'),
(429, 'Dunkelrote Augen-Alien-Maske', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 140, 8, 0, 0, 0, 0, 'Maske.png'),
(430, 'Gelbe Mini-Alien-Maske', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 141, 0, 0, 0, 0, 0, 'Maske.png'),
(431, 'Rote Mini-Alien-Maske', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 141, 1, 0, 0, 0, 0, 'Maske.png'),
(432, 'Beige Mini-Alien-Maske', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 141, 2, 0, 0, 0, 0, 'Maske.png'),
(433, 'Hellblaue Mini-Alien-Maske', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 141, 3, 0, 0, 0, 0, 'Maske.png'),
(434, 'Lilane Mini-Alien-Maske', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 141, 4, 0, 0, 0, 0, 'Maske.png'),
(435, 'Gruene Mini-Alien-Maske', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 141, 5, 0, 0, 0, 0, 'Maske.png'),
(436, 'Blaue Mini-Alien-Maske', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 141, 6, 0, 0, 0, 0, 'Maske.png'),
(437, 'Dunkelrote Mini-Alien-Maske', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 141, 8, 0, 0, 0, 0, 'Maske.png'),
(438, 'Taco-Maske', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 143, 0, 0, 0, 0, 0, 'Maske.png'),
(439, 'Burger-Maske', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 144, 0, 0, 0, 0, 0, 'Maske.png'),
(440, 'Chicken-Maske', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 145, 0, 0, 0, 0, 0, 'Maske.png'),
(441, 'Banditen-Maske', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 148, 0, 0, 0, 0, 0, 'Maske.png'),
(442, 'Erdbeer-Maske ', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 149, 0, 0, 0, 0, 0, 'Maske.png'),
(443, 'Zitronen-Maske', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 150, 0, 0, 0, 0, 0, 'Maske.png'),
(444, 'Trauben-Maske', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 151, 0, 0, 0, 0, 0, 'Maske.png'),
(445, 'Ananas-Maske', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 152, 0, 0, 0, 0, 0, 'Maske.png'),
(446, 'Kirsch-Maske', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 153, 0, 0, 0, 0, 0, 'Maske.png'),
(447, '7-Maske', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 154, 0, 0, 0, 0, 0, '7-Maske.png'),
(448, 'Koenigs-Maske', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 156, 0, 0, 0, 0, 0, 'Maske.png'),
(449, 'Dame-Maske', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 157, 0, 0, 0, 0, 0, 'Maske.png'),
(450, 'Hut-Koenigs-Maske', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 158, 0, 0, 0, 0, 0, 'Maske.png'),
(451, 'Totenkopf-Maske mit Hut', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 159, 0, 0, 0, 0, 0, 'Maske.png'),
(452, 'Joker-Maske', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Mask', 155, 0, 0, 0, 0, 0, 'Maske.png'),
(453, 'Bargeld', 'divers', 'Geld regiert die Welt.', 0, 0, 0, 0, 0, 'None', 1, 0, 1, 0, 'None', 0, 0, 0, 0, 0, 0, 'Bargeld.png'),
(454, 'Schwarze Ausgewaschene Baggy-Hose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 1, 0, 0, 0, 0, 0, 'Hose_-M-.png'),
(455, 'Schwarze Baggy-Hose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 1, 1, 0, 0, 0, 0, 'Hose_-M-.png'),
(456, 'Graue Baggy-Hose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 1, 2, 0, 0, 0, 0, 'Hose_-M-.png'),
(457, 'Hellblaue Baggy-Hose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 1, 3, 0, 0, 0, 0, 'Hose_-M-.png'),
(458, 'Braune Baggy-Hose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 1, 4, 0, 0, 0, 0, 'Hose_-M-.png'),
(459, 'Dunkelblaue Baggy-Hose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 1, 5, 0, 0, 0, 0, 'Hose_-M-.png'),
(460, 'Hellgraue Baggy-Hose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 1, 6, 0, 0, 0, 0, 'Hose_-M-.png'),
(461, 'Hellbraune Baggy-Hose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 1, 7, 0, 0, 0, 0, 'Hose_-M-.png'),
(462, 'Blaue Baggy-Hose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 1, 8, 0, 0, 0, 0, 'Hose_-M-.png'),
(463, 'Gruene Baggy-Hose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 1, 9, 0, 0, 0, 0, 'Hose_-M-.png'),
(464, 'Rote Baggy-Hose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 1, 10, 0, 0, 0, 0, 'Hose_-M-.png'),
(465, 'Antrazitfarbene Baggy-Hose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 1, 11, 0, 0, 0, 0, 'Hose_-M-.png'),
(466, 'Mittelblaue Baggy-Hose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 1, 12, 0, 0, 0, 0, 'Hose_-M-.png'),
(467, 'Hellbraune Baggy-Hose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 1, 13, 0, 0, 0, 0, 'Hose_-M-.png'),
(468, 'Beige Baggy-Hose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 1, 14, 0, 0, 0, 0, 'Hose_-M-.png'),
(469, 'Ausgewaschene Baggy-Hose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 1, 15, 0, 0, 0, 0, 'Hose_-M-.png'),
(470, 'Weise Joggingshose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 3, 0, 0, 0, 0, 0, 'Hose_-M-.png'),
(471, 'Hellgraue Joggingshose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 3, 1, 0, 0, 0, 0, 'Hose_-M-.png'),
(472, 'Schwarze Joggingshose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 3, 2, 0, 0, 0, 0, 'Hose_-M-.png'),
(473, 'Blaue Joggingshose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 3, 3, 0, 0, 0, 0, 'Hose_-M-.png'),
(474, 'Mittelblaue Joggingshose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 3, 4, 0, 0, 0, 0, 'Hose_-M-.png'),
(475, 'Rote Joggingshose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 3, 5, 0, 0, 0, 0, 'Hose_-M-.png'),
(476, 'Gruene Joggingshose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 3, 6, 0, 0, 0, 0, 'Hose_-M-.png'),
(477, 'Orange Joggingshose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 3, 7, 0, 0, 0, 0, 'Hose_-M-.png'),
(478, 'Gelbe Joggingshose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 3, 8, 0, 0, 0, 0, 'Hose_-M-.png'),
(479, 'Lilane Joggingshose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 3, 9, 0, 0, 0, 0, 'Hose_-M-.png'),
(480, 'Braune Joggingshose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 3, 10, 0, 0, 0, 0, 'Hose_-M-.png'),
(481, 'Beige Joggingshose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 3, 11, 0, 0, 0, 0, 'Hose_-M-.png'),
(482, 'Dunkellilane Joggingshose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 3, 12, 0, 0, 0, 0, 'Hose_-M-.png'),
(483, 'Dunkelblaue Joggingshose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 3, 13, 0, 0, 0, 0, 'Hose_-M-.png'),
(484, 'Dunkelgraue Joggingshose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 3, 14, 0, 0, 0, 0, 'Hose_-M-.png'),
(485, 'Dunkelrote Joggingshose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 3, 15, 0, 0, 0, 0, 'Hose_-M-.png'),
(486, 'Schwarze Schlanke Jeans -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 4, 0, 0, 0, 0, 0, 'Hose_-M-.png'),
(487, 'Dunkelblaue Schlanke Jeans -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 4, 1, 0, 0, 0, 0, 'Hose_-M-.png'),
(488, 'Hellgraue Schlanke Jeans -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 4, 2, 0, 0, 0, 0, 'Hose_-M-.png'),
(489, 'Hellblaue schlanke Jeans  -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 4, 4, 0, 0, 0, 0, 'Hose_-M-.png'),
(490, 'Weise Weite Joggingshose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 5, 0, 0, 0, 0, 0, 'Hose_-M-.png'),
(491, 'Hellgraue Weite Joggingshose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 5, 1, 0, 0, 0, 0, 'Hose_-M-.png'),
(492, 'Schwarze Weite Joggingshose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 5, 2, 0, 0, 0, 0, 'Hose_-M-.png'),
(493, 'Hellblaue Weite Joggingshose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 5, 3, 0, 0, 0, 0, 'Hose_-M-.png'),
(494, 'Deunkelblaue Weite Joggingshose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 5, 4, 0, 0, 0, 0, 'Hose_-M-.png'),
(495, 'Rote Weite Joggingshose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 5, 5, 0, 0, 0, 0, 'Hose_-M-.png'),
(496, 'Gruene Weite Joggingshose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 5, 6, 0, 0, 0, 0, 'Hose_-M-.png'),
(497, 'Orange Weite Joggingshose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 5, 7, 0, 0, 0, 0, 'Hose_-M-.png'),
(498, 'Gelbe Weite Joggingshose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 5, 8, 0, 0, 0, 0, 'Hose_-M-.png'),
(499, 'Lilane Weite Joggingshose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 5, 9, 0, 0, 0, 0, 'Hose_-M-.png'),
(500, 'Braune Weite Joggingshose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 5, 10, 0, 0, 0, 0, 'Hose_-M-.png'),
(501, 'Beige Weite Joggingshose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 5, 11, 0, 0, 0, 0, 'Hose_-M-.png'),
(502, 'Dunkellilane Weite Joggingshose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 5, 12, 0, 0, 0, 0, 'Hose_-M-.png'),
(503, 'Camofarbene Weite Joggingshose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 5, 13, 0, 0, 0, 0, 'Hose_-M-.png'),
(504, 'Graugefleckte Weite Joggingshose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 5, 14, 0, 0, 0, 0, 'Hose_-M-.png'),
(505, 'Dunkelgraue Weite Joggingshose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 5, 15, 0, 0, 0, 0, 'Hose_-M-.png'),
(506, 'Weise Badehose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 6, 0, 0, 0, 0, 0, 'Hose_-M-.png'),
(507, 'Schwarze Badehose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 6, 1, 0, 0, 0, 0, 'Hose_-M-.png'),
(508, 'Graue Badehose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 6, 2, 0, 0, 0, 0, 'Hose_-M-.png'),
(509, 'Dunkelblaue Badehose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 6, 10, 0, 0, 0, 0, 'Hose_-M-.png'),
(510, 'Schwarze Stoffhose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 7, 0, 0, 0, 0, 0, 'Hose_-M-.png'),
(511, 'Braune Stoffhose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 7, 1, 0, 0, 0, 0, 'Hose_-M-.png'),
(512, 'Hellgraue Stoffhose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 7, 2, 0, 0, 0, 0, 'Hose_-M-.png'),
(513, 'Blaue Stoffhose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 7, 3, 0, 0, 0, 0, 'Hose_-M-.png'),
(514, 'Beige Stoffhose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 7, 4, 0, 0, 0, 0, 'Hose_-M-.png'),
(515, 'Weise Stoffhose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 7, 5, 0, 0, 0, 0, 'Hose_-M-.png'),
(516, 'Dunkelgruene Stoffhose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 7, 6, 0, 0, 0, 0, 'Hose_-M-.png'),
(517, 'Gruene Stoffhose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 7, 7, 0, 0, 0, 0, 'Hose_-M-.png'),
(518, 'Rote Stoffhose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 7, 8, 0, 0, 0, 0, 'Hose_-M-.png'),
(519, 'Hellblaue Stoffhose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 7, 10, 0, 0, 0, 0, 'Hose_-M-.png'),
(520, 'Dunkelrote Stoffhose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 7, 11, 0, 0, 0, 0, 'Hose_-M-.png'),
(521, 'Mittelblaube Stoffhose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 7, 14, 0, 0, 0, 0, 'Hose_-M-.png'),
(522, 'Orangene Stoffhose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 7, 15, 0, 0, 0, 0, 'Hose_-M-.png'),
(523, 'Armeegruene Hose mit Taschen -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 9, 0, 0, 0, 0, 0, 'Hose_-M-.png'),
(524, 'Beige Hose mit Taschen -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 9, 1, 0, 0, 0, 0, 'Hose_-M-.png'),
(525, 'Dunkellilane Hose mit Taschen -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 9, 2, 0, 0, 0, 0, 'Hose_-M-.png'),
(526, 'Dunkelblaue Hose mit Taschen -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 9, 3, 0, 0, 0, 0, 'Hose_-M-.png'),
(527, 'Orangene Hose mit Taschen -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 9, 4, 0, 0, 0, 0, 'Hose_-M-.png'),
(528, 'Braune Hose mit Taschen -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 9, 5, 0, 0, 0, 0, 'Hose_-M-.png'),
(529, 'Hellgraue Hose mit Taschen -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 9, 6, 0, 0, 0, 0, 'Hose_-M-.png'),
(530, 'Schwarze Hose mit Taschen -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 9, 7, 0, 0, 0, 0, 'Hose_-M-.png'),
(531, 'Gelbe Hose mit Taschen -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 9, 8, 0, 0, 0, 0, 'Hose_-M-.png'),
(532, 'Braungefleckte Hose mit Taschen -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 9, 9, 0, 0, 0, 0, 'Hose_-M-.png'),
(533, 'Grauegefleckte Hose mit Taschen -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 9, 10, 0, 0, 0, 0, 'Hose_-M-.png'),
(534, 'Rotgefleckte Hose mit Taschen -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 9, 11, 0, 0, 0, 0, 'Hose_-M-.png'),
(535, 'Gruengefleckte Hose mit Taschen -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 9, 12, 0, 0, 0, 0, 'Hose_-M-.png'),
(536, 'Schwarzgefleckte Hose mit Taschen -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 9, 13, 0, 0, 0, 0, 'Hose_-M-.png'),
(537, 'Armeefarbene Hose mit Taschen -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 9, 14, 0, 0, 0, 0, 'Hose_-M-.png'),
(538, 'Blaugefleckte Hose mit Taschen -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 9, 15, 0, 0, 0, 0, 'Hose_-M-.png'),
(539, 'Schwarze Schlanke Anzugshose  -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 10, 0, 0, 0, 0, 0, 'Hose_-M-.png'),
(540, 'Graue Schlanke Anzugshose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 10, 1, 0, 0, 0, 0, 'Hose_-M-.png'),
(541, 'Blaue Schlanke Anzugshose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 10, 2, 0, 0, 0, 0, 'Hose_-M-.png'),
(542, 'Schwarz kurze Hose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 12, 0, 0, 0, 0, 0, 'Hose_-M-.png'),
(543, 'Grauekarierte kurze Hose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 12, 4, 0, 0, 0, 0, 'Hose_-M-.png'),
(544, 'Graue kurze Hose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 12, 5, 0, 0, 0, 0, 'Hose_-M-.png'),
(545, 'Beige kurze Hose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 12, 7, 0, 0, 0, 0, 'Hose_-M-.png'),
(546, 'Blaue kurze Hose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 12, 12, 0, 0, 0, 0, 'Hose_-M-.png'),
(547, 'Schwarze Weite Anzugshose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 13, 0, 0, 0, 0, 0, 'Hose_-M-.png'),
(548, 'Graue Weite Anzugshose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 13, 1, 0, 0, 0, 0, 'Hose_-M-.png'),
(549, 'Blaue Weite Anzugshose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 13, 2, 0, 0, 0, 0, 'Hose_-M-.png'),
(550, 'Graue kurze Sporthose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 14, 0, 0, 0, 0, 0, 'Hose_-M-.png'),
(551, 'Schwarze kurze Sporthose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 14, 1, 0, 0, 0, 0, 'Hose_-M-.png'),
(552, 'Rote kurze Sporthose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 14, 3, 0, 0, 0, 0, 'Hose_-M-.png'),
(553, 'Weise kurze Sporthose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 14, 12, 0, 0, 0, 0, 'Hose_-M-.png'),
(554, 'Beige Kurze Hose mit Taschen -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 15, 0, 0, 0, 0, 0, 'Hose_-M-.png'),
(555, 'Hellbraune Kurze Hose mit Taschen -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 15, 1, 0, 0, 0, 0, 'Hose_-M-.png'),
(556, 'Weise Kurze Hose mit Taschen -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 15, 2, 0, 0, 0, 0, 'Hose_-M-.png'),
(557, 'Schwarze Kurze Hose mit Taschen -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 15, 3, 0, 0, 0, 0, 'Hose_-M-.png'),
(558, 'Hellorange Kurze Hose mit Taschen -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 15, 4, 0, 0, 0, 0, 'Hose_-M-.png'),
(559, 'Hellgraue Kurze Hose mit Taschen -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 15, 5, 0, 0, 0, 0, 'Hose_-M-.png'),
(560, 'Rote Kurze Hose mit Taschen -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 15, 6, 0, 0, 0, 0, 'Hose_-M-.png'),
(561, 'Dunkelbraune Kurze Hose mit Taschen -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 15, 7, 0, 0, 0, 0, 'Hose_-M-.png'),
(562, 'Lilane Kurze Hose mit Taschen -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 15, 8, 0, 0, 0, 0, 'Hose_-M-.png'),
(563, 'Schwarze Camoflage Kurze Hose mit Taschen -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 15, 9, 0, 0, 0, 0, 'Hose_-M-.png'),
(564, 'Camohose Kurze Hose mit Taschen -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 15, 10, 0, 0, 0, 0, 'Hose_-M-.png'),
(565, 'Wuestentarnfarbene Kurze Hose mit Taschen -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 15, 11, 0, 0, 0, 0, 'Hose_-M-.png'),
(566, 'Graugefleckte Kurze Hose mit Taschen -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 15, 12, 0, 0, 0, 0, 'Hose_-M-.png'),
(567, 'Gruene Kurze Hose mit Taschen -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 15, 13, 0, 0, 0, 0, 'Hose_-M-.png'),
(568, 'Blaue Kurze Hose mit Taschen -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 15, 14, 0, 0, 0, 0, 'Hose_-M-.png'),
(569, 'Orange Kurze Hose mit Taschen -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 15, 15, 0, 0, 0, 0, 'Hose_-M-.png'),
(570, 'Graue-Rosane Badehose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 16, 0, 0, 0, 0, 0, 'Hose_-M-.png'),
(571, 'Rote-karierte Badehose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 16, 1, 0, 0, 0, 0, 'Hose_-M-.png'),
(572, 'Gelbe Badehose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 16, 2, 0, 0, 0, 0, 'Hose_-M-.png'),
(573, 'Orangene Badehose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 16, 3, 0, 0, 0, 0, 'Hose_-M-.png'),
(574, 'Gruene Badehose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 16, 4, 0, 0, 0, 0, 'Hose_-M-.png'),
(575, 'Lila-Geblumte Badehose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 16, 5, 0, 0, 0, 0, 'Hose_-M-.png'),
(576, 'Gruen-Weise Badehose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 16, 6, 0, 0, 0, 0, 'Hose_-M-.png'),
(577, 'Weis-Gruene Badehose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 16, 7, 0, 0, 0, 0, 'Hose_-M-.png'),
(578, 'Blau-Geblumte Badehose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 16, 8, 0, 0, 0, 0, 'Hose_-M-.png'),
(579, 'Rosane Badehose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 16, 9, 0, 0, 0, 0, 'Hose_-M-.png'),
(580, 'Hellgelbe Badehose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 16, 10, 0, 0, 0, 0, 'Hose_-M-.png'),
(581, 'Beige Badehose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 16, 11, 0, 0, 0, 0, 'Hose_-M-.png'),
(582, 'Braune Kurze Hose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 17, 0, 0, 0, 0, 0, 'Hose_-M-.png'),
(583, 'Schwarz Karierte Kurze Hose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 17, 1, 0, 0, 0, 0, 'Hose_-M-.png'),
(584, 'Hellgelbe Kurze Hose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 17, 2, 0, 0, 0, 0, 'Hose_-M-.png'),
(585, 'Grau-Gelbe Kurze Hose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 17, 3, 0, 0, 0, 0, 'Hose_-M-.png'),
(586, 'Hellblaue Kurze Hose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 17, 4, 0, 0, 0, 0, 'Hose_-M-.png'),
(587, 'Weis-karierte Kurze Hose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 17, 5, 0, 0, 0, 0, 'Hose_-M-.png'),
(588, 'Hellgraue Kurze Hose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 17, 6, 0, 0, 0, 0, 'Hose_-M-.png'),
(589, 'Tuerkis-Karierte Kurze Hose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 17, 7, 0, 0, 0, 0, 'Hose_-M-.png'),
(590, 'Braun-Karierte Kurze Hose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 17, 8, 0, 0, 0, 0, 'Hose_-M-.png'),
(591, 'Rote Kurze Hose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 17, 9, 0, 0, 0, 0, 'Hose_-M-.png'),
(592, 'Dunkelgruene Kurze Hose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 17, 10, 0, 0, 0, 0, 'Hose_-M-.png'),
(593, 'Gelbe Kurze Sporthose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 18, 0, 0, 0, 0, 0, 'Hose_-M-.png'),
(594, 'Dunkelblaue Kurze Sporthose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 18, 1, 0, 0, 0, 0, 'Hose_-M-.png'),
(595, 'Kurze Sporthose mit Palmenmuster -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 18, 2, 0, 0, 0, 0, 'Hose_-M-.png'),
(596, 'Rote-Weise Kurze Sporthose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 18, 3, 0, 0, 0, 0, 'Hose_-M-.png'),
(597, 'Hellgruene Kurze Sporthose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 18, 4, 0, 0, 0, 0, 'Hose_-M-.png'),
(598, 'Hellkarierte Kurze Sporthose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 18, 5, 0, 0, 0, 0, 'Hose_-M-.png'),
(599, 'Dunkelblau-karierte Kurze Sporthose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 18, 6, 0, 0, 0, 0, 'Hose_-M-.png'),
(600, 'Geblumte Kurze Sporthose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 18, 7, 0, 0, 0, 0, 'Hose_-M-.png'),
(601, 'Tuerkiese Kurze Sporthose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 18, 8, 0, 0, 0, 0, 'Hose_-M-.png'),
(602, 'Oranggefleckte Kurze Sporthose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 18, 9, 0, 0, 0, 0, 'Hose_-M-.png'),
(603, 'Gelbe Leoparten Kurze Sporthose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 18, 10, 0, 0, 0, 0, 'Hose_-M-.png'),
(604, 'Schwarze tropical Kurze Sporthose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 18, 11, 0, 0, 0, 0, 'Hose_-M-.png'),
(605, 'Rote Weite Anzugshose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 19, 0, 0, 0, 0, 0, 'Hose_-M-.png'),
(606, 'Gruene Weite Anzugshose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 19, 1, 0, 0, 0, 0, 'Hose_-M-.png'),
(607, 'Weise Schlanke Anzugshose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 20, 0, 0, 0, 0, 0, 'Hose_-M-.png'),
(608, 'Blaue Schlanke Anzugshose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 20, 1, 0, 0, 0, 0, 'Hose_-M-.png'),
(609, 'Schwarz gestreifte Anzugshose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 20, 2, 0, 0, 0, 0, 'Hose_-M-.png'),
(610, 'Hellgraue Schlanke Anzugshose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 22, 0, 0, 0, 0, 0, 'Hose_-M-.png'),
(611, 'Dunkelgruene Schlanke Anzugshose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 22, 1, 0, 0, 0, 0, 'Hose_-M-.png'),
(612, 'Weise Weite Anzugshose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 23, 0, 0, 0, 0, 0, 'Hose_-M-.png'),
(613, 'Dunkelgruene Weite Anzugshose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 23, 1, 0, 0, 0, 0, 'Hose_-M-.png'),
(614, 'Lilane Weite Anzugshose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 23, 2, 0, 0, 0, 0, 'Hose_-M-.png'),
(615, 'Dunkelrote Weite Anzugshose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 23, 3, 0, 0, 0, 0, 'Hose_-M-.png'),
(616, 'Dunkelbraune Weite Anzugshose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 23, 5, 0, 0, 0, 0, 'Hose_-M-.png'),
(617, 'Braun-Karierte Weite Anzugshose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 23, 6, 0, 0, 0, 0, 'Hose_-M-.png'),
(618, 'Beige Weite Anzugshose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 23, 7, 0, 0, 0, 0, 'Hose_-M-.png'),
(619, 'Hellbeige Weite Anzugshose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 23, 8, 0, 0, 0, 0, 'Hose_-M-.png'),
(620, 'Dunkelblaue Weite Anzugshose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 23, 9, 0, 0, 0, 0, 'Hose_-M-.png'),
(621, 'Weis-Karierte Weite Anzugshose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 23, 10, 0, 0, 0, 0, 'Hose_-M-.png'),
(622, 'Blau-Karierte Weite Anzugshose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 23, 11, 0, 0, 0, 0, 'Hose_-M-.png'),
(623, 'Schwarze Sakkohose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 24, 0, 0, 0, 0, 0, 'Hose_-M-.png'),
(624, 'Graue Sakkohose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 24, 1, 0, 0, 0, 0, 'Hose_-M-.png'),
(625, 'Dunkelgraue Sakkohose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 24, 2, 0, 0, 0, 0, 'Hose_-M-.png'),
(626, 'Dunkelgruene Sakkohose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 24, 3, 0, 0, 0, 0, 'Hose_-M-.png'),
(627, 'Dunkelrote Sakkohose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 24, 4, 0, 0, 0, 0, 'Hose_-M-.png'),
(628, 'Weise Sakkohose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 24, 5, 0, 0, 0, 0, 'Hose_-M-.png'),
(629, 'Dunkelbraune Sakkohose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 24, 6, 0, 0, 0, 0, 'Hose_-M-.png'),
(630, 'Schwarze Schlanke Stoffhose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 25, 0, 0, 0, 0, 0, 'Hose_-M-.png'),
(631, 'Graue Schlanke Stoffhose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 25, 1, 0, 0, 0, 0, 'Hose_-M-.png'),
(632, 'Dunkelblaue Schlanke Stoffhose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 25, 2, 0, 0, 0, 0, 'Hose_-M-.png'),
(633, 'Dunkelgruene Schlanke Stoffhose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 25, 3, 0, 0, 0, 0, 'Hose_-M-.png'),
(634, 'Dunkelrote Schlanke Stoffhose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 25, 4, 0, 0, 0, 0, 'Hose_-M-.png'),
(635, 'Weise Schlanke Stoffhose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 25, 5, 0, 0, 0, 0, 'Hose_-M-.png'),
(636, 'Dunkelbraune Schlanke Stoffhose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 25, 6, 0, 0, 0, 0, 'Hose_-M-.png'),
(637, 'Schwarze Camofarbene Schlanke Jeans -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 26, 0, 0, 0, 0, 0, 'Hose_-M-.png'),
(638, 'Lilane Schlanke Jeans -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 26, 1, 0, 0, 0, 0, 'Hose_-M-.png'),
(639, 'Gruene Schlanke Jeans -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 26, 2, 0, 0, 0, 0, 'Hose_-M-.png'),
(640, 'Hellgruene Schlanke Jeans -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 26, 3, 0, 0, 0, 0, 'Hose_-M-.png'),
(641, 'Hellblaue Schlanke Jeans -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 26, 4, 0, 0, 0, 0, 'Hose_-M-.png'),
(642, 'Rote Schlanke Jean s-M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 26, 5, 0, 0, 0, 0, 'Hose_-M-.png'),
(643, 'Mintfarbene Schlanke Jeans -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 26, 7, 0, 0, 0, 0, 'Hose_-M-.png'),
(644, 'Gelbe Gummizughose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 27, 0, 0, 0, 0, 0, 'Hose_-M-.png'),
(645, 'Blaue Gummizughose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 27, 0, 0, 0, 0, 0, 'Hose_-M-.png'),
(646, 'Orangene Gummizughose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 27, 0, 0, 0, 0, 0, 'Hose_-M-.png'),
(647, 'Weise Gummizughose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 27, 0, 0, 0, 0, 0, 'Hose_-M-.png'),
(648, 'Rote Gummizughose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 27, 0, 0, 0, 0, 0, 'Hose_-M-.png'),
(649, 'Mintfarbene Gummizughose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 27, 0, 0, 0, 0, 0, 'Hose_-M-.png'),
(650, 'Dunkelrote Gummizughose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 27, 0, 0, 0, 0, 0, 'Hose_-M-.png'),
(651, 'Gruene Gummizughose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 27, 0, 0, 0, 0, 0, 'Hose_-M-.png'),
(652, 'Braune Gummizughose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 27, 0, 0, 0, 0, 0, 'Hose_-M-.png'),
(653, 'Petrolfarbene Gummizughose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 27, 0, 0, 0, 0, 0, 'Hose_-M-.png'),
(654, 'Dunkelgruene Gummizughose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 27, 0, 0, 0, 0, 0, 'Hose_-M-.png'),
(655, 'Lilane Gummizughose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 27, 0, 0, 0, 0, 0, 'Hose_-M-.png'),
(656, 'Schwarze Schlanke Sakkohose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 28, 0, 0, 0, 0, 0, 'Hose_-M-.png'),
(657, 'Rote Schlanke Sakkohose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 28, 2, 0, 0, 0, 0, 'Hose_-M-.png'),
(658, 'Dunkelgraue Schlanke Sakkohose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 28, 3, 0, 0, 0, 0, 'Hose_-M-.png'),
(659, 'Braune Schlanke Sakkohose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 28, 4, 0, 0, 0, 0, 'Hose_-M-.png'),
(660, 'Dunkelbraune Schlanke Sakkohose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 28, 5, 0, 0, 0, 0, 'Hose_-M-.png'),
(661, 'Hellgraue Schlanke Sakkohose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 28, 6, 0, 0, 0, 0, 'Hose_-M-.png'),
(662, 'Braun-Karierte Schlanke Sakkohose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 28, 7, 0, 0, 0, 0, 'Hose_-M-.png'),
(663, 'Graue Schlanke Sakkohose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 28, 8, 0, 0, 0, 0, 'Hose_-M-.png'),
(664, 'Lilane Schlanke Sakkohose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 28, 9, 0, 0, 0, 0, 'Hose_-M-.png'),
(665, 'Dunkelblaue Schlanke Sakkohose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 28, 11, 0, 0, 0, 0, 'Hose_-M-.png'),
(666, 'Leoparten Schlanke Sakkohose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 28, 12, 0, 0, 0, 0, 'Hose_-M-.png'),
(667, 'USA-Hose 1 -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 29, 0, 0, 0, 0, 0, 'Hose_-M-.png'),
(668, 'USA-Hose 2 -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 29, 1, 0, 0, 0, 0, 'Hose_-M-.png'),
(669, 'USA-Hose 3 -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 29, 2, 0, 0, 0, 0, 'Hose_-M-.png'),
(670, 'Fliegerhose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 30, 0, 0, 0, 0, 0, 'Hose_-M-.png'),
(671, 'Schwarze Polizei Hose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 31, 0, 0, 0, 0, 0, 'Hose_-M-.png'),
(672, 'Graue SWAT Hose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 31, 1, 0, 0, 0, 0, 'Hose_-M-.png'),
(673, 'Schwarze Kampfhose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 33, 0, 0, 0, 0, 0, 'Hose_-M-.png'),
(674, 'NOOSE-Hose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 34, 0, 0, 0, 0, 0, 'Hose_-M-.png'),
(675, 'Polizei-Hose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 0, 1, 'Leg', 35, 0, 0, 0, 0, 0, 'Hose_-M-.png'),
(676, 'Müllmannhose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 36, 0, 0, 0, 0, 0, 'Hose_-M-.png'),
(677, 'Rote Hausmeisterbundhose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 38, 0, 0, 0, 0, 0, 'Hose_-M-.png'),
(678, 'Schwarze Hausmeisterbundhose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 38, 1, 0, 0, 0, 0, 'Hose_-M-.png'),
(679, 'Gruene Hausmeisterbundhose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 38, 2, 0, 0, 0, 0, 'Hose_-M-.png'),
(680, 'Graue Hausmeisterbundhose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 38, 3, 0, 0, 0, 0, 'Hose_-M-.png'),
(681, 'Rote Hausmeisterhose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 39, 0, 0, 0, 0, 0, 'Hose_-M-.png'),
(682, 'Schwarze Hausmeisterhose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 39, 1, 0, 0, 0, 0, 'Hose_-M-.png'),
(683, 'Gruene Hausmeisterhose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 39, 2, 0, 0, 0, 0, 'Hose_-M-.png'),
(684, 'Graue Hausmeisterhose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 39, 3, 0, 0, 0, 0, 'Hose_-M-.png'),
(685, 'Schwarze Fliegerhose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 41, 0, 0, 0, 0, 0, 'Hose_-M-.png'),
(686, 'Schwarze kurze Jogginghose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 42, 0, 0, 0, 0, 0, 'Hose_-M-.png'),
(687, 'Weise kurze Jogginghose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 42, 1, 0, 0, 0, 0, 'Hose_-M-.png'),
(688, 'Dunkelblaue Weite Jeanshose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 43, 0, 0, 0, 0, 0, 'Hose_-M-.png'),
(689, 'Schwarze Weite Jeanshose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 43, 1, 0, 0, 0, 0, 'Hose_-M-.png'),
(690, 'Schwarze Seiden Pyjamahose-M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 45, 0, 0, 0, 0, 0, 'Hose_-M-.png'),
(691, 'Lilane Seiden Pyjamahose-M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 45, 1, 0, 0, 0, 0, 'Hose_-M-.png'),
(692, 'Beige Einsatzhose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 46, 0, 0, 0, 0, 0, 'Hose_-M-.png'),
(693, 'Gruene Einsatzhose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 46, 1, 0, 0, 0, 0, 'Hose_-M-.png'),
(694, 'Beige lange Hose mit Taschen -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 47, 0, 0, 0, 0, 0, 'Hose_-M-.png'),
(695, 'Gruene lange Hose mit Taschen -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 47, 1, 0, 0, 0, 0, 'Hose_-M-.png'),
(696, 'Rote Seiden Anzugshose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 50, 0, 0, 0, 0, 0, 'Hose_-M-.png'),
(697, 'Blaue Seiden Anzugshose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 50, 1, 0, 0, 0, 0, 'Hose_-M-.png'),
(698, 'Schwarze Seiden Anzugshose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 50, 2, 0, 0, 0, 0, 'Hose_-M-.png'),
(699, 'Grune Seiden Anzugshose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 50, 3, 0, 0, 0, 0, 'Hose_-M-.png'),
(700, 'Gold-Schwarze Anzugshose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 51, 0, 0, 0, 0, 0, 'Hose_-M-.png'),
(701, 'Rote schmale Seiden Anzugshose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 52, 0, 0, 0, 0, 0, 'Hose_-M-.png'),
(702, 'Blaue schmale Seiden Anzugshose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 52, 1, 0, 0, 0, 0, 'Hose_-M-.png'),
(703, 'Gold-Schwarze schmale Anzugshose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 53, 0, 0, 0, 0, 0, 'Hose_-M-.png'),
(704, 'Dunkelblau gemusterte Badehose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 54, 0, 0, 0, 0, 0, 'Hose_-M-.png'),
(705, 'Schwarz-Weis beschriftete Badehose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 54, 1, 0, 0, 0, 0, 'Hose_-M-.png'),
(706, 'Weises Bademantel Unterteil -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 56, 0, 0, 0, 0, 0, 'Hose_-M-.png'),
(707, 'Graues Bademantel Unterteil -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 56, 1, 0, 0, 0, 0, 'Hose_-M-.png'),
(708, 'Schwarzes Bademantel Unterteil -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 56, 2, 0, 0, 0, 0, 'Hose_-M-.png'),
(709, 'Rotes Bademantel Unterteil -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 56, 3, 0, 0, 0, 0, 'Hose_-M-.png'),
(710, 'Rote Pyjamahose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 58, 0, 0, 0, 0, 0, 'Hose_-M-.png'),
(711, 'Petrolfarbene Pyjamahose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 58, 1, 0, 0, 0, 0, 'Hose_-M-.png'),
(712, 'Schwarz-Karierte Pyjamahose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 58, 2, 0, 0, 0, 0, 'Hose_-M-.png'),
(713, 'Gruene Kampfhose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 59, 0, 0, 0, 0, 0, 'Hose_-M-.png'),
(714, 'Orangene Kampfhose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 59, 1, 0, 0, 0, 0, 'Hose_-M-.png'),
(715, 'Lilane Kampfhose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 59, 2, 0, 0, 0, 0, 'Hose_-M-.png'),
(716, 'Rosane Kampfhose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 59, 3, 0, 0, 0, 0, 'Hose_-M-.png'),
(717, 'Rote Kampfhose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 59, 4, 0, 0, 0, 0, 'Hose_-M-.png'),
(718, 'Blaue Kampfhose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 59, 5, 0, 0, 0, 0, 'Hose_-M-.png'),
(719, 'Graue Kampfhose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 59, 6, 0, 0, 0, 0, 'Hose_-M-.png'),
(720, 'Beige Kampfhose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 59, 7, 0, 0, 0, 0, 'Hose_-M-.png'),
(721, 'Weise Kampfhose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 59, 8, 0, 0, 0, 0, 'Hose_-M-.png'),
(722, 'Weise Boxershort -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 61, 0, 0, 0, 0, 0, 'Hose_-M-.png'),
(723, 'Schwarze Boxershort -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 61, 1, 0, 0, 0, 0, 'Hose_-M-.png'),
(724, 'Graue Boxershort -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 61, 2, 0, 0, 0, 0, 'Hose_-M-.png'),
(725, 'Leoparten Boxershort -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 61, 3, 0, 0, 0, 0, 'Hose_-M-.png'),
(726, 'Weise Herzchen Boxershort -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 61, 4, 0, 0, 0, 0, 'Hose_-M-.png'),
(727, 'Schwarze kurze Faltenhose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 62, 0, 0, 0, 0, 0, 'Hose_-M-.png'),
(728, 'Beige kurze Faltenhose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 62, 1, 0, 0, 0, 0, 'Hose_-M-.png'),
(729, 'Graue kurze Faltenhose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 62, 2, 0, 0, 0, 0, 'Hose_-M-.png'),
(730, 'Gruene kurze Faltenhose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 62, 3, 0, 0, 0, 0, 'Hose_-M-.png'),
(731, 'Blaue Jogginghose mit Streifen -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 64, 0, 0, 0, 0, 0, 'Hose_-M-.png'),
(732, 'Hellrote Jogginghose mit Streifen -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 64, 1, 0, 0, 0, 0, 'Hose_-M-.png'),
(733, 'Beige Jogginghose mit Streifen -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 64, 2, 0, 0, 0, 0, 'Hose_-M-.png'),
(734, 'Dunkelblaue Jogginghose mit Streifen -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 64, 3, 0, 0, 0, 0, 'Hose_-M-.png'),
(735, 'Rote Jogginghose mit Streifen -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 64, 4, 0, 0, 0, 0, 'Hose_-M-.png'),
(736, 'Hellblaue Jogginghose mit Streifen -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 64, 5, 0, 0, 0, 0, 'Hose_-M-.png'),
(737, 'Orangene Jogginghose mit Streifen -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 64, 6, 0, 0, 0, 0, 'Hose_-M-.png'),
(738, 'Lilane Jogginghose mit Streifen -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 64, 7, 0, 0, 0, 0, 'Hose_-M-.png');
INSERT INTO `server_items` (`id`, `itemName`, `itemType`, `itemDescription`, `itemWeight`, `isItemDesire`, `itemDesireFood`, `itemDesireDrink`, `hasItemAnimation`, `itemAnimationName`, `isItemDroppable`, `isItemUseable`, `isItemGiveable`, `isItemClothes`, `ClothesType`, `ClothesDraw`, `ClothesTexture`, `ClothesUndershirt`, `ClothesUndershirtTexture`, `ClothesDecals`, `ClothesDecalsTexture`, `itemPicSRC`) VALUES
(739, 'Graue Jogginghose mit Streifen -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 64, 8, 0, 0, 0, 0, 'Hose_-M-.png'),
(740, 'Gruene Jogginghose mit Streifen -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 64, 9, 0, 0, 0, 0, 'Hose_-M-.png'),
(741, 'Weise Jogginghose mit Streifen -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 64, 10, 0, 0, 0, 0, 'Hose_-M-.png'),
(742, 'Hellblau gestreifte Pyjamahose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 65, 0, 0, 0, 0, 0, 'Hose_-M-.png'),
(743, 'Gelbe Pyjamahose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 65, 1, 0, 0, 0, 0, 'Hose_-M-.png'),
(744, 'Rosane Pyjamahose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 65, 2, 0, 0, 0, 0, 'Hose_-M-.png'),
(745, 'Mintfarbene Pyjamahose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 65, 3, 0, 0, 0, 0, 'Hose_-M-.png'),
(746, 'Lila-karierte Pyjamahose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 65, 4, 0, 0, 0, 0, 'Hose_-M-.png'),
(747, 'Blau-karierte Pyjamahose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 65, 5, 0, 0, 0, 0, 'Hose_-M-.png'),
(748, 'Rot-gemusterte Pyjamahose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 65, 6, 0, 0, 0, 0, 'Hose_-M-.png'),
(749, 'Weis-Schwarze Pyjamahose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 65, 7, 0, 0, 0, 0, 'Hose_-M-.png'),
(750, 'Lila-gemusterte Pyjamahose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 65, 8, 0, 0, 0, 0, 'Hose_-M-.png'),
(751, 'Gelb-gemusterte Pyjamahose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 65, 9, 0, 0, 0, 0, 'Hose_-M-.png'),
(752, 'Rot-gemusterte Pyjamahose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 65, 10, 0, 0, 0, 0, 'Hose_-M-.png'),
(753, 'Gruene Motorcross-Hose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 67, 0, 0, 0, 0, 0, 'Hose_-M-.png'),
(754, 'Rote Motorcross-Hose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 67, 1, 0, 0, 0, 0, 'Hose_-M-.png'),
(755, 'Schwarze Motorcross-Hose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 67, 3, 0, 0, 0, 0, 'Hose_-M-.png'),
(756, 'Blau-Rote Motorcross-Hose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 67, 4, 0, 0, 0, 0, 'Hose_-M-.png'),
(757, 'Gelbe Motorcross-Hose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 67, 5, 0, 0, 0, 0, 'Hose_-M-.png'),
(758, 'Rosane Motorcross-Hose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 67, 6, 0, 0, 0, 0, 'Hose_-M-.png'),
(759, 'Blaue Motorcross-Hose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 67, 7, 0, 0, 0, 0, 'Hose_-M-.png'),
(760, 'Orangene Motorcross-Hose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 67, 9, 0, 0, 0, 0, 'Hose_-M-.png'),
(761, 'Lilane Motorcross-Hose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 67, 10, 0, 0, 0, 0, 'Hose_-M-.png'),
(762, 'Große Totenkopf Jogginghose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 69, 0, 0, 0, 0, 0, 'Hose_-M-.png'),
(763, 'Große Tarnmuster Jogginghose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 69, 1, 0, 0, 0, 0, 'Hose_-M-.png'),
(764, 'Große Schwarze Jogginghose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 69, 2, 0, 0, 0, 0, 'Hose_-M-.png'),
(765, 'Große Blaue Stern Jogginghose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 69, 3, 0, 0, 0, 0, 'Hose_-M-.png'),
(766, 'Große Gruen Stern Jogginghose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 69, 4, 0, 0, 0, 0, 'Hose_-M-.png'),
(767, 'Schwarze Glatte Lederhose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 71, 0, 0, 0, 0, 0, 'Hose_-M-.png'),
(768, 'Rote Glatte Lederhose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 71, 1, 0, 0, 0, 0, 'Hose_-M-.png'),
(769, 'Braune Glatte Lederhose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 71, 2, 0, 0, 0, 0, 'Hose_-M-.png'),
(770, 'abgeranzte Schwarze Glatte Lederhose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 71, 3, 0, 0, 0, 0, 'Hose_-M-.png'),
(771, 'abgeranzte Rote Glatte Lederhose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 71, 4, 0, 0, 0, 0, 'Hose_-M-.png'),
(772, 'abgeranzte Braune Glatte Lederhose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 71, 5, 0, 0, 0, 0, 'Hose_-M-.png'),
(773, 'Schwarze Glatte Lederhose zum reinstecken -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 72, 0, 0, 0, 0, 0, 'Hose_-M-.png'),
(774, 'Rote Glatte Lederhose zum reinstecken -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 72, 1, 0, 0, 0, 0, 'Hose_-M-.png'),
(775, 'Braune Glatte Lederhose zum reinstecken -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 72, 2, 0, 0, 0, 0, 'Hose_-M-.png'),
(776, 'abgeranzte Schwarze Glatte Lederhose zum reinstecken -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 72, 3, 0, 0, 0, 0, 'Hose_-M-.png'),
(777, 'abgeranzte Rote Glatte Lederhose zum reinstecken -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 72, 4, 0, 0, 0, 0, 'Hose_-M-.png'),
(778, 'abgeranzte Braune Glatte Lederhose zum reinstecken -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 72, 5, 0, 0, 0, 0, 'Hose_-M-.png'),
(779, 'Schwarze gepolsterte Lederhose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 73, 0, 0, 0, 0, 0, 'Hose_-M-.png'),
(780, 'Rote gepolsterte Lederhose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 73, 1, 0, 0, 0, 0, 'Hose_-M-.png'),
(781, 'Braune gepolsterte Lederhose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 73, 2, 0, 0, 0, 0, 'Hose_-M-.png'),
(782, 'abgeranzte Schwarze gepolsterte Lederhose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 73, 3, 0, 0, 0, 0, 'Hose_-M-.png'),
(783, 'abgeranzte Rote gepolsterte Lederhose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 73, 4, 0, 0, 0, 0, 'Hose_-M-.png'),
(784, 'abgeranzte Braune gepolsterte Lederhose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 73, 5, 0, 0, 0, 0, 'Hose_-M-.png'),
(785, 'Schwarze gepolsterte Lederhose zum reinstecken -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 74, 1, 0, 0, 0, 0, 'Hose_-M-.png'),
(786, 'Rote gepolsterte Lederhose zum reinstecken -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 74, 2, 0, 0, 0, 0, 'Hose_-M-.png'),
(787, 'Braune gepolsterte Lederhose zum reinstecken -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 74, 3, 0, 0, 0, 0, 'Hose_-M-.png'),
(788, 'abgeranzte Schwarze gepolsterte Lederhose zum reinstecken -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 74, 4, 0, 0, 0, 0, 'Hose_-M-.png'),
(789, 'abgeranzte Rote gepolsterte Lederhose zum reinstecken -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 74, 5, 0, 0, 0, 0, 'Hose_-M-.png'),
(790, 'abgeranzte Braune gepolsterte Lederhose zum reinstecken -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 74, 6, 0, 0, 0, 0, 'Hose_-M-.png'),
(791, 'Dunkelblaue Bikerhose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 75, 0, 0, 0, 0, 0, 'Hose_-M-.png'),
(792, 'Hellblaue Bikerhose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 75, 1, 0, 0, 0, 0, 'Hose_-M-.png'),
(793, 'Graue Bikerhose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 75, 2, 0, 0, 0, 0, 'Hose_-M-.png'),
(794, 'Schwarze Bikerhose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 75, 3, 0, 0, 0, 0, 'Hose_-M-.png'),
(795, 'Dunkelblaue zerrissene Bikerhose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 76, 0, 0, 0, 0, 0, 'Hose_-M-.png'),
(796, 'Hellblaue zerrissene Bikerhose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 76, 1, 0, 0, 0, 0, 'Hose_-M-.png'),
(797, 'Graue zerrissene Bikerhose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 76, 2, 0, 0, 0, 0, 'Hose_-M-.png'),
(798, 'Schwarze zerrissene Bikerhose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 76, 3, 0, 0, 0, 0, 'Hose_-M-.png'),
(799, 'Schwarz-Gelbe Motorradhose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 77, 0, 0, 0, 0, 0, 'Hose_-M-.png'),
(800, 'Schwarz-Gruene Motorradhose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 77, 1, 0, 0, 0, 0, 'Hose_-M-.png'),
(801, 'Schwarz-Orangene Motorradhose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 77, 2, 0, 0, 0, 0, 'Hose_-M-.png'),
(802, 'Schwarz-Blaue Motorradhose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 77, 3, 0, 0, 0, 0, 'Hose_-M-.png'),
(803, 'Schwarz-Rosane Motorradhose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 77, 4, 0, 0, 0, 0, 'Hose_-M-.png'),
(804, 'Schwarz-Rote Motorradhose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 77, 5, 0, 0, 0, 0, 'Hose_-M-.png'),
(805, 'Schwarz-Graue Motorradhose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 77, 6, 0, 0, 0, 0, 'Hose_-M-.png'),
(806, 'Schwarz-Weise Motorradhose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 77, 7, 0, 0, 0, 0, 'Hose_-M-.png'),
(807, 'Braune gummizug Jogginghose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 78, 0, 0, 0, 0, 0, 'Hose_-M-.png'),
(808, 'Camo gummizug Jogginghose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 78, 1, 0, 0, 0, 0, 'Hose_-M-.png'),
(809, 'Schwarze gummizug Jogginghose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 78, 2, 0, 0, 0, 0, 'Hose_-M-.png'),
(810, 'Blaue gummizug Jogginghose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 78, 3, 0, 0, 0, 0, 'Hose_-M-.png'),
(811, 'Schwarze Leder Jogginghose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 79, 0, 0, 0, 0, 0, 'Hose_-M-.png'),
(812, 'Rote Leder Jogginghose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 79, 1, 0, 0, 0, 0, 'Hose_-M-.png'),
(813, 'Weise Leder Jogginghose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 79, 2, 0, 0, 0, 0, 'Hose_-M-.png'),
(814, 'Braune kurze gummizug-Jogginghose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 80, 0, 0, 0, 0, 0, 'Hose_-M-.png'),
(815, 'Camo kurze gummizug-Jogginghose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 80, 1, 0, 0, 0, 0, 'Hose_-M-.png'),
(816, 'Schwarze kurze gummizug-Jogginghose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 80, 2, 0, 0, 0, 0, 'Hose_-M-.png'),
(817, 'Blaue kurze gummizug-Jogginghose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 80, 3, 0, 0, 0, 0, 'Hose_-M-.png'),
(818, 'Schwarze kurze Leder Joggingshose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 81, 0, 0, 0, 0, 0, 'Hose_-M-.png'),
(819, 'Rote kurze Leder Jogginghose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 81, 1, 0, 0, 0, 0, 'Hose_-M-.png'),
(820, 'Weise kurze Leder Jogginghose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 81, 2, 0, 0, 0, 0, 'Hose_-M-.png'),
(821, 'Dunkelblaue Hipstarhose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 82, 0, 0, 0, 0, 0, 'Hose_-M-.png'),
(822, 'Schwarze Hipstarhose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 82, 1, 0, 0, 0, 0, 'Hose_-M-.png'),
(823, 'Hellblaue Hipstarhose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 82, 2, 0, 0, 0, 0, 'Hose_-M-.png'),
(824, 'Graue Hipstarhose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 82, 3, 0, 0, 0, 0, 'Hose_-M-.png'),
(825, 'Schwarze Leder Hipstarhose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 83, 1, 0, 0, 0, 0, 'Hose_-M-.png'),
(826, 'Rote Leder Hipstarhose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 83, 2, 0, 0, 0, 0, 'Hose_-M-.png'),
(827, 'Weise Leder Hipstarhose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 83, 3, 0, 0, 0, 0, 'Hose_-M-.png'),
(828, 'Braune Leder Hipstarhose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 83, 4, 0, 0, 0, 0, 'Hose_-M-.png'),
(829, 'Neonhose 1 -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 85, 0, 0, 0, 0, 0, 'Hose_-M-.png'),
(830, 'Neonhose 2 -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 85, 1, 0, 0, 0, 0, 'Hose_-M-.png'),
(831, 'Neonhose 3 -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 85, 2, 0, 0, 0, 0, 'Hose_-M-.png'),
(832, 'Blaue Flecken Hose mit Taschen -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 86, 0, 0, 0, 0, 0, 'Hose_-M-.png'),
(833, 'Braune Flecken Hose mit Taschen -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 86, 1, 0, 0, 0, 0, 'Hose_-M-.png'),
(834, 'Gruene Flecken Hose mit Taschen -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 86, 2, 0, 0, 0, 0, 'Hose_-M-.png'),
(835, 'Beige Flecken Hose mit Taschen -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 86, 3, 0, 0, 0, 0, 'Hose_-M-.png'),
(836, 'Wuestentarn Hose mit Taschen -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 86, 5, 0, 0, 0, 0, 'Hose_-M-.png'),
(837, 'Tarn Hose mit Taschen -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 86, 6, 0, 0, 0, 0, 'Hose_-M-.png'),
(838, 'Karierte Hose mit Taschen -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 86, 7, 0, 0, 0, 0, 'Hose_-M-.png'),
(839, 'Blaue Tarn Hose mit Taschen -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 86, 10, 0, 0, 0, 0, 'Hose_-M-.png'),
(840, 'Armee Hose mit Taschen -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 86, 16, 0, 0, 0, 0, 'Hose_-M-.png'),
(841, 'Gruene Tarn Hose mit Taschen -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 86, 20, 0, 0, 0, 0, 'Hose_-M-.png'),
(842, 'Orangene Tarn Hose mit Taschen -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 86, 21, 0, 0, 0, 0, 'Hose_-M-.png'),
(843, 'Lilane Tarn Hose mit Taschen -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 86, 22, 0, 0, 0, 0, 'Hose_-M-.png'),
(844, 'Rosane Tarn Hose mit Taschen -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 86, 23, 0, 0, 0, 0, 'Hose_-M-.png'),
(845, 'Blaue Flecken Hose zum reinstecken -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 87, 0, 0, 0, 0, 0, 'Hose_-M-.png'),
(846, 'Braune Flecken Hose zum reinstecken -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 87, 1, 0, 0, 0, 0, 'Hose_-M-.png'),
(847, 'Gruene Flecken Hose zum reinstecken -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 87, 2, 0, 0, 0, 0, 'Hose_-M-.png'),
(848, 'Beige Flecken Hose zum reinstecken -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 87, 3, 0, 0, 0, 0, 'Hose_-M-.png'),
(849, 'Wuestentarn Hose zum reinstecken -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 87, 5, 0, 0, 0, 0, 'Hose_-M-.png'),
(850, 'Tarn Hose zum reinstecken -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 87, 6, 0, 0, 0, 0, 'Hose_-M-.png'),
(851, 'Karierte Hose zum reinstecken -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 87, 7, 0, 0, 0, 0, 'Hose_-M-.png'),
(852, 'Blaue Tarn Hose zum reinstecken -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 87, 10, 0, 0, 0, 0, 'Hose_-M-.png'),
(853, 'ArmeeHose zum reinstecken -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 87, 16, 0, 0, 0, 0, 'Hose_-M-.png'),
(854, 'Gruene Hose zum reinstecken -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 87, 20, 0, 0, 0, 0, 'Hose_-M-.png'),
(855, 'Orangene Hose zum reinstecken -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 87, 21, 0, 0, 0, 0, 'Hose_-M-.png'),
(856, 'Lilane Hose zum reinstecken -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 87, 22, 0, 0, 0, 0, 'Hose_-M-.png'),
(857, 'Rosane Hose zum reinstecken -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 87, 23, 0, 0, 0, 0, 'Hose_-M-.png'),
(858, 'Wuestentarn Shorts -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 88, 5, 0, 0, 0, 0, 'Hose_-M-.png'),
(859, 'Karierte Shorts -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 88, 7, 0, 0, 0, 0, 'Hose_-M-.png'),
(860, 'Blaue Tarn Shorts -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 88, 10, 0, 0, 0, 0, 'Hose_-M-.png'),
(861, 'Armee Shorts -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 88, 17, 0, 0, 0, 0, 'Hose_-M-.png'),
(862, 'Gruene Tarn Shorts -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 88, 20, 0, 0, 0, 0, 'Hose_-M-.png'),
(863, 'Orangene Tarn Shorts -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 88, 21, 0, 0, 0, 0, 'Hose_-M-.png'),
(864, 'Lilane Tarn Shorts -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 88, 22, 0, 0, 0, 0, 'Hose_-M-.png'),
(865, 'Rosane Tarn Shorts -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 88, 23, 0, 0, 0, 0, 'Hose_-M-.png'),
(866, 'Blaue Flecken Latzhose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 89, 0, 0, 0, 0, 0, 'Hose_-M-.png'),
(867, 'Braune Latzhose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 89, 1, 0, 0, 0, 0, 'Hose_-M-.png'),
(868, 'Gruene Latzhose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 89, 2, 0, 0, 0, 0, 'Hose_-M-.png'),
(869, 'Graue Latzhose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 89, 3, 0, 0, 0, 0, 'Hose_-M-.png'),
(870, 'Beige Latzhose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 89, 4, 0, 0, 0, 0, 'Hose_-M-.png'),
(871, 'Karierte Latzhose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 89, 7, 0, 0, 0, 0, 'Hose_-M-.png'),
(872, 'Blaue Tarn Latzhose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 89, 10, 0, 0, 0, 0, 'Hose_-M-.png'),
(873, 'Hellgruene Latzhose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 89, 18, 0, 0, 0, 0, 'Hose_-M-.png'),
(874, 'Gelbe Latzhose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 89, 19, 0, 0, 0, 0, 'Hose_-M-.png'),
(875, 'Schwarze Latzhose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 89, 20, 0, 0, 0, 0, 'Hose_-M-.png'),
(876, 'Graue Latzhose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 89, 21, 0, 0, 0, 0, 'Hose_-M-.png'),
(877, 'Weise Latzhose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 89, 22, 0, 0, 0, 0, 'Hose_-M-.png'),
(878, 'Braune Latzhose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 89, 23, 0, 0, 0, 0, 'Hose_-M-.png'),
(879, 'Dunkelblaue Jeans-Latzhose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 90, 0, 0, 0, 0, 0, 'Hose_-M-.png'),
(880, 'Hellblaue Jeans-Latzhose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 90, 1, 0, 0, 0, 0, 'Hose_-M-.png'),
(881, 'Graue Jeans-Latzhose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 90, 3, 0, 0, 0, 0, 'Hose_-M-.png'),
(882, 'Schwarze Jeans-Latzhose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 90, 8, 0, 0, 0, 0, 'Hose_-M-.png'),
(883, 'Schwarze Maennerleggings -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 94, 0, 0, 0, 0, 0, 'Hose_-M-.png'),
(884, 'Graue Maennerleggings -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 94, 1, 0, 0, 0, 0, 'Hose_-M-.png'),
(885, 'Gelbe Arbeitshose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 98, 0, 0, 0, 0, 0, 'Hose_-M-.png'),
(886, 'Schwarze Arbeitshose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 98, 1, 0, 0, 0, 0, 'Hose_-M-.png'),
(887, 'Weise Arbeitshose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 98, 3, 0, 0, 0, 0, 'Hose_-M-.png'),
(888, 'Graue Arbeitshose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 98, 4, 0, 0, 0, 0, 'Hose_-M-.png'),
(889, 'Hellbraune Arbeitshose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 98, 5, 0, 0, 0, 0, 'Hose_-M-.png'),
(890, 'Beige Arbeitshose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 0, 1, 'Leg', 98, 6, 0, 0, 0, 0, 'Hose_-M-.png'),
(891, 'Orangene Arbeitshose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 98, 7, 0, 0, 0, 0, 'Hose_-M-.png'),
(892, 'Tarnflecken Arbeitshose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 98, 8, 0, 0, 0, 0, 'Hose_-M-.png'),
(893, 'Gelbe Arbeitshose zum Reinstecken -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 97, 0, 0, 0, 0, 0, 'Hose_-M-.png'),
(894, 'Schwarze Arbeitshose zum Reinstecken -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 97, 1, 0, 0, 0, 0, 'Hose_-M-.png'),
(895, 'Weise Arbeitshose zum Reinstecken -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 97, 2, 0, 0, 0, 0, 'Hose_-M-.png'),
(896, 'Graue Arbeitshose zum Reinstecken -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 97, 3, 0, 0, 0, 0, 'Hose_-M-.png'),
(897, 'Braune Arbeitshose zum Reinstecken -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 97, 4, 0, 0, 0, 0, 'Hose_-M-.png'),
(898, 'Beige Arbeitshose zum Reinstecken -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 97, 5, 0, 0, 0, 0, 'Hose_-M-.png'),
(899, 'Orangene Arbeitshose zum Reinstecken -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 97, 6, 0, 0, 0, 0, 'Hose_-M-.png'),
(900, 'Tarnfecken Arbeitshose zum Reinstecken -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 97, 7, 0, 0, 0, 0, 'Hose_-M-.png'),
(901, 'Grau-Blaue Arbeitshose zum Reinstecken -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 97, 8, 0, 0, 0, 0, 'Hose_-M-.png'),
(902, 'Hellblaue Arbeitshose zum Reinstecken -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 97, 9, 0, 0, 0, 0, 'Hose_-M-.png'),
(903, 'Pinke Arbeitshose zum Reinstecken -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 97, 10, 0, 0, 0, 0, 'Hose_-M-.png'),
(904, 'Hellgraue Arbeitshose zum Reinstecken -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 97, 11, 0, 0, 0, 0, 'Hose_-M-.png'),
(905, 'Orang-Schwarze Arbeitshose zum Reinstecken -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 97, 16, 0, 0, 0, 0, 'Hose_-M-.png'),
(906, 'Rot-Schwarze Arbeitshose zum Reinstecken -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 97, 17, 0, 0, 0, 0, 'Hose_-M-.png'),
(907, 'Weis-Rote Arbeitshose zum Reinstecken -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 97, 22, 0, 0, 0, 0, 'Hose_-M-.png'),
(908, 'Große Schwarz-geblumte Jogginghose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 100, 0, 0, 0, 0, 0, 'Hose_-M-.png'),
(909, 'Große Weis-geblumte Jogginghose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 100, 1, 0, 0, 0, 0, 'Hose_-M-.png'),
(910, 'Große Rot-geblumte Jogginghose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 100, 2, 0, 0, 0, 0, 'Hose_-M-.png'),
(911, 'Große Blau-gemusterte Jogginghose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 100, 3, 0, 0, 0, 0, 'Hose_-M-.png'),
(912, 'Große Gruen-gemusterte Jogginghose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 100, 4, 0, 0, 0, 0, 'Hose_-M-.png'),
(913, 'Große Wuestentarn Jogginghose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 100, 5, 0, 0, 0, 0, 'Hose_-M-.png'),
(914, 'Große Orangene-Tarn Jogginghose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 100, 6, 0, 0, 0, 0, 'Hose_-M-.png'),
(915, 'Große Lilane-Tarn Jogginghose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 100, 7, 0, 0, 0, 0, 'Hose_-M-.png'),
(916, 'Schwarze Hose mit Ketten -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 102, 0, 0, 0, 0, 0, 'Hose_-M-.png'),
(917, 'Graue Hose mit Ketten -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 102, 1, 0, 0, 0, 0, 'Hose_-M-.png'),
(918, 'Weise Hose mit Ketten -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 102, 2, 0, 0, 0, 0, 'Hose_-M-.png'),
(919, 'Braune Hose mit Ketten -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 102, 3, 0, 0, 0, 0, 'Hose_-M-.png'),
(920, 'Beige Hose mit Ketten -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 102, 4, 0, 0, 0, 0, 'Hose_-M-.png'),
(921, 'Graue Tarn Hose mit Ketten -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 102, 6, 0, 0, 0, 0, 'Hose_-M-.png'),
(922, 'Tarn Hose mit Ketten -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 102, 7, 0, 0, 0, 0, 'Hose_-M-.png'),
(923, 'Gruene Tarn Hose mit Ketten -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 102, 14, 0, 0, 0, 0, 'Hose_-M-.png'),
(924, 'Orangene Tarn Hose mit Ketten -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 102, 15, 0, 0, 0, 0, 'Hose_-M-.png'),
(925, 'Lilane Tarn Hose mit Ketten -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 102, 16, 0, 0, 0, 0, 'Hose_-M-.png'),
(926, 'Rosane Tarn Hose mit Ketten -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 102, 17, 0, 0, 0, 0, 'Hose_-M-.png'),
(927, 'Schwarze Kurze Hose mit Ketten -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 103, 0, 0, 0, 0, 0, 'Hose_-M-.png'),
(928, 'Graue Kurze Hose mit Ketten -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 103, 1, 0, 0, 0, 0, 'Hose_-M-.png'),
(929, 'Weise Kurze Hose mit Ketten -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 103, 2, 0, 0, 0, 0, 'Hose_-M-.png'),
(930, 'Braune Kurze Hose mit Ketten -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 103, 3, 0, 0, 0, 0, 'Hose_-M-.png'),
(931, 'Beige Kurze Hose mit Ketten -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 103, 4, 0, 0, 0, 0, 'Hose_-M-.png'),
(932, 'Graue Tarn Kurze Hose mit Ketten -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 103, 6, 0, 0, 0, 0, 'Hose_-M-.png'),
(933, 'Tarn Kurze Hose mit Ketten -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 103, 7, 0, 0, 0, 0, 'Hose_-M-.png'),
(934, 'Gruene Tarn Kurze Hose mit Ketten -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 103, 14, 0, 0, 0, 0, 'Hose_-M-.png'),
(935, 'Orangene Tarn Kurze Hose mit Ketten -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 103, 15, 0, 0, 0, 0, 'Hose_-M-.png'),
(936, 'Lilane Tarn Kurze Hose mit Ketten -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 103, 16, 0, 0, 0, 0, 'Hose_-M-.png'),
(937, 'Rosane Tarn Kurze Hose mit Ketten -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 103, 17, 0, 0, 0, 0, 'Hose_-M-.png'),
(938, 'Schwarze Cowboyhose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 105, 0, 0, 0, 0, 0, 'Hose_-M-.png'),
(939, 'Rot-Schwarze Cowboyhose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 105, 1, 0, 0, 0, 0, 'Hose_-M-.png'),
(940, 'Braune Outlawhose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 107, 0, 0, 0, 0, 0, 'Hose_-M-.png'),
(941, 'Schwarze Outlawhose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 107, 1, 0, 0, 0, 0, 'Hose_-M-.png'),
(942, 'Beige Outlawhose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 107, 3, 0, 0, 0, 0, 'Hose_-M-.png'),
(943, 'Rote Outlawhose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 107, 10, 0, 0, 0, 0, 'Hose_-M-.png'),
(944, 'Blaue Neonhose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 106, 4, 0, 0, 0, 0, 'Hose_-M-.png'),
(945, 'Lilan Neonhose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 106, 5, 0, 0, 0, 0, 'Hose_-M-.png'),
(946, 'Gruene Neonhose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 106, 8, 0, 0, 0, 0, 'Hose_-M-.png'),
(947, 'Pinke Neonhose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 106, 9, 0, 0, 0, 0, 'Hose_-M-.png'),
(948, 'Universum Neonhose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 106, 12, 0, 0, 0, 0, 'Hose_-M-.png'),
(964, 'Schwarz-Weise Schuhe -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 1, 0, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(965, 'Weise Schuhe -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 1, 1, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(966, 'Schwarze Schuhe -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 1, 2, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(967, 'Pink-Schwarze Schuhe -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 1, 3, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(968, 'Braune Schuhe -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 1, 4, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(969, 'Tuerikiese Schuhe -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 1, 5, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(970, 'Petrolfabene Schuhe -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 1, 6, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(971, 'Schwarz-Rote Schuhe -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 1, 7, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(972, 'Tarnfarbene Schuhe -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 1, 8, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(973, 'Schwarz-Karierte Schuhe -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 1, 9, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(974, 'Rot-Schwarze Schuhe -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 1, 10, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(975, 'Gruene Schuhe -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 1, 11, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(976, 'Beige Schuhe -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 1, 12, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(977, 'Graue Schuhe -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 1, 13, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(978, 'Ganz Schwarze Schuhe -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 1, 14, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(979, 'Weis-Schwarze Schuhe -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 1, 15, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(980, 'Schwarz-Graue Asiaschuhe -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 3, 0, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(981, 'Schwarze Asiaschuhe -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 3, 1, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(982, 'Dunkelgraue Asiaschuhe -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 3, 2, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(983, 'Braune Asiaschuhe -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 3, 3, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(984, 'Schwarz-Weise Asiaschuhe -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 3, 4, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(985, 'Graue Asiaschuhe -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 3, 5, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(986, 'Rote Asiaschuhe -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 3, 6, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(987, 'Gruene Asiaschuhe -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 3, 7, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(988, 'Beige Asiaschuhe -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 3, 8, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(989, 'Orangene Asiaschuhe -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 3, 9, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(990, 'Lilane Asiaschuhe -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 3, 10, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(991, 'Karierte Asiaschuhe -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 3, 11, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(992, 'Grau-Rote Asiaschuhe -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 3, 12, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(993, 'Grau-Schwarze Asiaschuhe -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 3, 13, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(994, 'Blaue Asiaschuhe -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 3, 14, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(995, 'Dunkelblaue Chucks -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 4, 0, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(996, 'Ganz-Schwarze Chucks -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 4, 1, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(997, 'Ganz-Weise Chucks -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 4, 2, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(998, 'Rote Chucks -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 4, 4, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(999, 'Schwarz-Weise FlipFlops -M-', 'clothes', 'eine paar Schuhe', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 5, 0, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1000, 'Graue FlipFlops -M-', 'clothes', 'eine paar Schuhe', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 5, 1, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1001, 'Schwarze FlipFlops -M-', 'clothes', 'eine paar Schuhe', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 5, 2, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1002, 'Schwarz-Gruene FlipFlops -M-', 'clothes', 'eine paar Schuhe', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 5, 3, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1003, 'Schwarze Badeschlappen -M-', 'clothes', 'eine paar Schuhe', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 6, 0, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1004, 'Blaue Badeschlappen -M-', 'clothes', 'eine paar Schuhe', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 6, 1, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1005, 'Weise Schuhe mit Socken -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 7, 0, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1006, 'Graue Schuhe mit Socken -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 7, 1, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1007, 'Schwarze Schuhe mit Socken -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 7, 2, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1008, 'Armeefarbene Schuhe mit Socken -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 7, 3, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1009, 'Schwarze-Blaue Schuhe mit Socken -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 7, 4, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1010, 'Rot-Gelbe Schuhe mit Socken -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 7, 5, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1011, 'Weis-Rote Schuhe mit Socken -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 7, 6, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1012, 'Orang-Schwarze Schuhe mit Socken -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 7, 7, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1013, 'Schwarz-Gruene Schuhe mit Socken -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 7, 8, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1014, 'Rot-Weise Schuhe mit Socken -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 7, 9, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1015, 'Blau-Gruene Schuhe mit Socken -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 7, 10, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1016, 'Gelbe Schuhe mit Socken -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 7, 11, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1017, 'Schwarz-Lilane Schuhe mit Socken -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 7, 14, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1018, 'Weis-Gelbe Schuhe mit Socken -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 7, 15, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1019, 'Graue Schuhe mit Streifen -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 8, 0, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1020, 'Schwarze Schuhe mit Streifen -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 8, 1, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1021, 'Schwarz-Weise Schuhe mit Streifen -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 8, 2, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1022, 'Schwarz-Blaue Schuhe mit Streifen -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 8, 3, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1023, 'Blaue Schuhe mit Streifen -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 8, 4, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1024, 'Gelbe Schuhe mit Streifen -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 8, 5, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1025, 'Rote Schuhe mit Streifen -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 8, 6, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1026, 'Orangene Schuhe mit Streifen -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 8, 7, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1027, 'Blau-Graue Schuhe mit Streifen -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 8, 8, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1028, 'Grau-Orangene Schuhe mit Streifen -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 8, 9, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1029, 'Rot-Weise Schuhe mit Streifen -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 8, 10, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1030, 'Lila-Orangene Schuhe mit Streifen -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 8, 11, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1031, 'Gruen-Gelbe Schuhe mit Streifen -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 8, 12, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1032, 'Leoparten Schuhe mit Streifen -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 8, 13, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1033, 'Neon Gelbe Schuhe mit Streifen -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 8, 14, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1034, 'Weise Schuhe mit Pfeil -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 9, 0, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1035, 'Graue Schuhe mit Pfeil -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 9, 1, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1036, 'Schwarze Schuhe mit Pfeil -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 9, 2, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1037, 'Rote Schuhe mit Pfeil -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 9, 3, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1038, 'Gruene Schuhe mit Pfeil -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 9, 4, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1039, 'Lilane Schuhe mit Pfeil -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 9, 5, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1040, 'Gelbe Schuhe mit Pfeil -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 9, 6, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1041, 'Blaue Schuhe mit Pfeil -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 9, 7, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1042, 'Orangene Schuhe mit Pfeil -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 9, 8, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1043, 'Rot-Gelbe Schuhe mit Pfeil -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 9, 9, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1044, 'Gruen-Weise Schuhe mit Pfeil -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 9, 10, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1045, 'Orang-Weise Schuhe mit Pfeil -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 9, 11, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1046, 'Gelb-Blaue Schuhe mit Pfeil -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 9, 12, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1047, 'Schwarz-Weise Schuhe mit Pfeil -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 9, 13, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1048, 'Leoparten Schuhe mit Pfeil -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 9, 14, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1049, 'Schwarze Schicke-Anzugsschuhe -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 10, 0, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1050, 'Braune Timberland-Boots -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 12, 0, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1051, 'Schwarz-Weise Timberland-Boots -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 12, 1, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1052, 'Hellblaue Timberland-Boots -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 12, 2, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1053, 'Schwarz-Graue Timberland-Boots -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 12, 3, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1054, 'Weis-Braune Timberland-Boots -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 12, 4, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1055, 'Dunkelblaue Timberland-Boots -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 12, 5, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1056, 'Schwarze Timberland-Boots -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 12, 6, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1057, 'Graue Timberland-Boots -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 12, 7, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1058, 'Dunkelbraune Timberland-Boots -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 12, 8, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1059, 'Rote Timberland-Boots -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 12, 9, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1060, 'Weise Timberland-Boots -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 12, 10, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1061, 'Weis-Blaue Timberland-Boots -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 12, 11, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1062, 'Beige Timberland-Boots -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 12, 12, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1063, 'Pinke Timberland-Boots -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 12, 13, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1064, 'Schwarz Braune Timberland-Boots -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 12, 14, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1065, 'Tarnmuster Timberland-Boots -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 12, 15, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1066, 'Dunkelgraue Boots -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 14, 0, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1067, 'Schwarze Boots -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 14, 1, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1068, 'Schwarz-Gruene Boots -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 14, 2, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1069, 'Dunkelblau-Pinke Boots -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 14, 3, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1070, 'Beige Boots -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 14, 4, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1071, 'Orangene Boots -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 14, 5, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1072, 'Rote Boots -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 14, 6, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1073, 'Hellgraue Boots -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 14, 7, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1074, 'Braune Boots -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 14, 8, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1075, 'Graue Boots -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 14, 9, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1076, 'Weis-SChwarze Boots -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 14, 10, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1077, 'Hellbraune Boots -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 14, 11, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1078, 'Schwarz-Blaue Boots -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 14, 12, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1079, 'Beige-Orange Boots -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 14, 13, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1080, 'Schwarz-Braune Boots -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 14, 14, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1081, 'Schwarz-Weise Boots -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 14, 16, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1082, 'Schwarze Lederschuhe -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 15, 0, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1083, 'Braune Lederschuhe -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 15, 1, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1084, 'Rote Lederschuhe -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 15, 2, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1085, 'Gruene Lederschuhe -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 15, 3, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1086, 'Hellbraune Lederschuhe -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 15, 5, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1087, 'Graue Lederschuhe -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 15, 7, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1088, 'Blaue Lederschuhe -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 15, 15, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1089, 'Gruene FlipFlops -M-', 'clothes', 'eine paar Schuhe', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 16, 1, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1090, 'Lilane FlipFlops -M-', 'clothes', 'eine paar Schuhe', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 16, 2, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1091, 'Gelbe FlipFlops -M-', 'clothes', 'eine paar Schuhe', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 16, 8, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1092, 'Schwarz-Weise Schicke-Anzugsschuhe -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 18, 0, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1093, 'Weis-Schwarze Schicke-Anzugsschuhe -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 18, 1, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1094, 'Weis-Scharze Anzugsschuhe mit Knöpfe -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 19, 0, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1095, 'Braune Schicke Anzugsschuhe -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 20, 0, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1096, 'Schwarz-Braune Schicke Anzugsschuhe -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 20, 1, 0, 0, 0, 0, 'Schuhe_-M-.png');
INSERT INTO `server_items` (`id`, `itemName`, `itemType`, `itemDescription`, `itemWeight`, `isItemDesire`, `itemDesireFood`, `itemDesireDrink`, `hasItemAnimation`, `itemAnimationName`, `isItemDroppable`, `isItemUseable`, `isItemGiveable`, `isItemClothes`, `ClothesType`, `ClothesDraw`, `ClothesTexture`, `ClothesUndershirt`, `ClothesUndershirtTexture`, `ClothesDecals`, `ClothesDecalsTexture`, `itemPicSRC`) VALUES
(1097, 'Schwarze Smokingschuhe -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 21, 0, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1098, 'Rote Smokingschuhe -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 21, 1, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1099, 'Braune Smokingschuhe -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 21, 2, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1100, 'Gruene Smokingschuhe -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 21, 4, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1101, 'Hellbraune Smokingschuhe -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 21, 5, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1102, 'Blaue Smokingschuhe -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 21, 7, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1103, 'Weise Smokingschuhe -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 21, 9, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1104, 'Hellblaue Chucks -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 22, 0, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1105, 'Hellgruene Chucks -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 22, 1, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1106, 'Orangene Chucks -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 22, 2, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1107, 'Gelbe Chucks -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 22, 3, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1108, 'Lilane Chucks -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 22, 4, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1109, 'Grau-Schwarze Chucks -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 22, 5, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1110, 'Karierte Chucks -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 22, 6, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1111, 'Tarnfarbene Chucks -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 22, 7, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1112, 'Braune Chucks -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 22, 8, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1113, 'Hellblaue-Karierte Chucks -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 22, 9, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1114, 'Grune-Karierte Chucks -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 22, 10, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1115, 'Beige Chucks -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 22, 11, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1116, 'Schwarze Bikerstiefel -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 24, 0, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1117, 'Schwarze Kampfstiefel -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 25, 0, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1118, 'Dreckige Bikerstiefel -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 27, 0, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1119, 'Weise Nieten-Schuhe -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 28, 0, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1120, 'Schwarze Nieten-Schuhe -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 28, 1, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1121, 'Goldene Hohe Schuhe -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 29, 0, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1122, 'Schwarze-Weise Schlappen -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 30, 0, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1123, 'Schwarze Schlappe -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 30, 1, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1124, 'Grau-Gelbe Turnschuhe -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 31, 0, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1125, 'Schwarze-Gelbe Turnschuhe -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 31, 1, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1126, 'Weis-Gelbe Turnschuhe -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 31, 2, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1127, 'Schwarz-Weise Baskettballschuhe -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 32, 0, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1128, 'Weis-Schwarze Baskettballschuhe -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 32, 1, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1129, 'Weis-Dunkelblaue Baskettballschuhe -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 32, 2, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1130, 'Schwarz-Rote Baskettballschuhe -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 32, 3, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1131, 'Weise Baskettballschuhe -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 32, 4, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1132, 'Rot-Weise Baskettballschuhe -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 32, 5, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1133, 'Beige Kampfstiefel  -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 35, 0, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1134, 'Gruene Kampfstiefel -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 35, 1, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1135, 'Schwarze Cowboy-Stiefel -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 37, 0, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1136, 'Braune Cowboy-Stiefel -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 37, 1, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1137, 'Beige Cowboy-Stiefel -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 37, 2, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1138, 'Dunkelbraune Cowboy-Stiefel -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 37, 3, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1139, 'Schwarze-Rote Cowboy-Stiefel -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 37, 4, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1140, 'Schwarze Cowboy-Boots -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 38, 0, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1141, 'Braune Cowboy-Boots -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 38, 1, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1142, 'Beige Cowboy-Boots -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 38, 2, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1143, 'Dunkelbraune Cowboy-Boots -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 38, 3, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1144, 'Schwarz-Rote Cowboy-Boots -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 38, 4, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1145, 'Blaue Schicke-Anzugsschuhe -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 40, 0, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1146, 'Rot-WEise Schicke-Anzugsschuhe -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 40, 1, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1147, 'Rote Hausschuhe -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 41, 0, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1148, 'Weise Slipper -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 42, 0, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1149, 'Schwarze Slipper -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 42, 1, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1150, 'Gelbe Lederboots -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 43, 0, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1151, 'Braune Lederboots -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 43, 1, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1152, 'Graue Lederboots -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 43, 2, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1153, 'Schware Lederboots -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 43, 3, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1154, 'Blaue Lederboots -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 43, 4, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1155, 'Rote Lederboots -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 43, 5, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1156, 'Gruene Lederboots -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 43, 6, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1157, 'Tuerkiese Cowboy-Stiefel -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 44, 0, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1158, 'Rosane Cowboy-Stiefel -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 44, 1, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1159, 'Weis-Rote Cowboy-Stiefel -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 44, 2, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1160, 'Rot-Gruene Cowboy-Stiefel -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 44, 3, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1161, 'Dunkelrote Cowboy-Stiefel -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 44, 4, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1162, 'Rote Cowboy-Stiefel -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 44, 5, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1163, 'Hellgruene Cowboy-Stiefel -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 44, 6, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1164, 'Lilane Cowboy-Stiefel -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 44, 7, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1165, 'Orangene Cowboy-Stiefel -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 44, 8, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1166, 'Tuerkiese Cowboy-Boots -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 45, 0, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1167, 'Rosane Cowboy-Boots -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 45, 1, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1168, 'Weis-Rote Cowboy-Boots -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 45, 2, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1169, 'Rot-Gruene Cowboy-Boots -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 45, 3, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1170, 'Dunkelrote Cowboy-Boots -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 45, 4, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1171, 'Rote Cowboy-Boots -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 45, 5, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1172, 'Hellgruene Cowboy-Boots -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 45, 6, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1173, 'Lilane Cowboy-Boots -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 45, 7, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1174, 'Orangene Cowboy-Boots -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 45, 8, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1175, 'Blau-Weise Hohe Sneaker -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 46, 0, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1176, 'Schwarz-Weise Hohe Sneaker -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 46, 1, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1177, 'Rot-Weise Hohe Sneaker -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 46, 2, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1178, 'Schwarze Hohe Sneaker -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 46, 3, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1179, 'Gruene-Beige Hohe Sneaker -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 46, 4, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1180, 'Weise Hohe Sneaker -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 46, 5, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1181, 'Grun-Weise Hohe Sneaker -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 46, 6, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1182, 'Orang-Weise Hohe Sneaker -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 46, 7, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1183, 'Lila-Weise Hohe Sneaker -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 46, 8, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1184, 'Rosa-Weise Hohe Sneaker -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 46, 9, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1185, 'Rosane Chucks -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 48, 0, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1186, 'Schwarze geschnuerrte Lederstiefel -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 50, 0, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1187, 'Rote geschnuerrte Lederstiefel -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 50, 1, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1188, 'Braune geschnuerrte Lederstiefel -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 50, 2, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1189, 'Schwarz geschnuerrte Lederboots -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 51, 0, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1190, 'Rote geschnuerrte Lederboots -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 51, 1, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1191, 'Braune geschnuerrte Lederboots -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 51, 2, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1192, 'Braune Stiefeletten -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 52, 0, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1193, 'Schwarze Stiefeletten -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 52, 1, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1194, 'Schwarze offene Lederstiefel -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 53, 0, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1195, 'Rote offene Lederstiefel -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 53, 1, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1196, 'Braune offene Lederstiefel -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 53, 2, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1197, 'Schwarz-Gelbe Motorradschuhe -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 55, 0, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1198, 'Schwarz-Gruene Motorradschuhe -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 55, 1, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1199, 'Schwarz-Orange Motorradschuhe -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 55, 2, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1200, 'Schwarz-Blaue Motorradschuhe -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 55, 3, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1201, 'Schwarz-Pinke Motorradschuhe -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 55, 4, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1202, 'Schwarz-Rote Motorradschuhe -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 55, 5, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1203, 'Schwarz-Graue Motorradschuhe -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 55, 6, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1204, 'Beige Hohe Schuhe -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 57, 0, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1205, 'Lilane Hohe Schuhe -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 57, 0, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1206, 'Hellblaue Hohe Schuhe -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 57, 0, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1207, 'Orange Hohe Schuhe -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 57, 0, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1208, 'Neonschuhe 1 -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 58, 0, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1209, 'Neonschuhe 2 -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 58, 1, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1210, 'Neonschuhe 3 -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 58, 2, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1211, 'Schwarze Wanderstiefel -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 60, 0, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1212, 'Beige Wanderstiefel -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 60, 1, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1213, 'Braun-Beige Wanderstiefel -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 60, 2, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1214, 'Dunkelgruene Wanderstiefel -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 60, 3, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1215, 'Orangene Wanderstiefel -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 0, 1, 'Feet', 60, 4, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1216, 'Dunkelbraune Wanderstiefel -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 60, 5, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1217, 'Gelbe Wanderstiefel -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 60, 6, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1218, 'Braune Wanderstiefel -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 60, 7, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1219, 'Schwarze Wanderschuhe -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 61, 0, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1220, 'Beige Wanderschuhe -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 61, 1, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1221, 'Braun-Beige Wanderschuhe -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 61, 2, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1222, 'Dunkelgruene Wanderschuhe -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 61, 3, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1223, 'Orangene Wanderschuhe -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 61, 4, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1224, 'Dunkelbraune Wanderschuhe -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 61, 5, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1225, 'Gelbe Wanderschuhe -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 61, 6, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1226, 'Braune Wanderschuhe -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 61, 7, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1227, 'Gruene Hohe Sneaker -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 64, 0, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1228, 'Schwarz-Tuerkiese Hohe Sneaker -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 64, 1, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1229, 'Rot-Blaue Hohe Sneaker -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 64, 2, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1230, 'Rot-Schwarze Hohe Sneaker -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 64, 3, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1231, 'Schwarz-Goldene Hohe Sneaker -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 64, 4, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1232, 'Schwarz-Gelbe Hohe Sneaker -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 64, 5, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1233, 'Weis-Schwarze Hohe Sneaker -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 64, 6, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1234, 'Hellbraune Hohe Sneaker -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 64, 7, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1235, 'Beige-Braune Arbeitsstiefel -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 70, 0, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1236, 'Graue Arbeitsstiefel -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 70, 1, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1237, 'Rot-Weise Arbeitsstiefel -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 70, 2, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1238, 'Hellgraue Arbeitsstiefel -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 70, 3, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1239, 'Orangene Arbeitsstiefel -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 70, 6, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1240, 'Grau-Blaue Arbeitsstiefel -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 70, 8, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1241, 'Blaue Arbeitsstiefel -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 70, 9, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1242, 'Pinke Arbeitsstiefel -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 70, 10, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1243, 'Weis-Graue Arbeitsstiefel -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 70, 11, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1244, 'Schwarz-Orangene Arbeitsstiefel -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 70, 16, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1245, 'Schwarz-Rote Arbeitsstiefel -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 70, 17, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1246, 'Beige-Braune Arbeitsschuhe -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 71, 0, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1247, 'Graue Arbeitsschuhe -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 71, 1, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1248, 'Rot-Weise Arbeitsschuhe -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 71, 2, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1249, 'Hellgraue Arbeitsschuhe -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 71, 3, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1250, 'Orangene Arbeitsschuhe -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 71, 6, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1251, 'Grau-Blaue Arbeitsschuhe -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 71, 8, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1252, 'Blaue Arbeitsschuhe -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 71, 9, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1253, 'Pinke Arbeitsschuhe -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 71, 10, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1254, 'Weis-Graue Arbeitsschuhe -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 71, 11, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1255, 'Schwarz-Orangene Arbeitsschuhe -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 71, 16, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1256, 'Schwarz-Rote Arbeitsschuhe -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 71, 17, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1257, 'Tuerkies-Weise hohe Sneaker -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 74, 0, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1258, 'Gelb-Weise hohe Sneaker -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 74, 1, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1259, 'Weise Große Sportschuhe -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 74, 0, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1260, 'Schwarz-Tuerkiese Große Sportschuhe -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 74, 1, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1261, 'Schwarze Große Sportschuhe -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 74, 2, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1262, 'Hellgruene Große Sportschuhe -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 74, 3, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1263, 'Weis-Graue Große Sportschuhe -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 74, 4, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1264, 'Schwarz-Rote Große Sportschuhe -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 74, 5, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1265, 'Orang-Schwarze Große Sportschuhe -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 74, 6, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1266, 'Gruene Große Sportschuhe -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 74, 7, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1267, 'Orangene Große Sportschuhe -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 74, 8, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1268, 'Lilane Große Sportschuhe -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 74, 9, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1269, 'Rosane Große Sportschuhe -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 74, 10, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1270, 'Hellgraue Große Sportschuhe -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 74, 11, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1271, 'Schwarz-Pinke Große Sportschuhe -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 74, 12, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1272, 'Weis-Graue Große Sportschuhe -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 74, 13, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1273, 'Rot-Weise Große Sportschuhe -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 74, 14, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1274, 'Beige Große Sportschuhe -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 74, 16, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1275, 'Tuerkiese Große Sportschuhe -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 74, 18, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1276, 'Rote Große Sportschuhe -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 74, 19, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1277, 'Weis-Hellblaue LED-Schuhe -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 77, 0, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1278, 'Weis-Gruene LED-Schuhe -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 77, 1, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1279, 'Weis-Pinke LED-Schuhe -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 77, 2, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1280, 'Weis-Rote LED-Schuhe -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 77, 3, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1281, 'Weis-Tuerkiese LED-Schuhe -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 77, 4, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1282, 'Weis-Dunkelgruen LED-Schuhe -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 77, 5, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1283, 'Weis-Lilane LED-Schuhe -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 77, 6, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1284, 'Weis-Rote LED-Schuhe -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 77, 7, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1285, 'Scharz-Hellblaue LED-Schuhe -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 77, 8, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1286, 'Schwarz-Gruene LED-Schuhe -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 77, 9, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1287, 'Schwarz-Pinke LED-Schuhe -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 77, 10, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1288, 'Schwarz-Rote LED-Schuhe -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 77, 11, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1289, 'Pink-Weise Hellblaue LED-Schuhe -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 77, 12, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1290, 'Pink-Schwarz Gruene LED-Schuhe -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 77, 13, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1291, 'Schwarz-Weis Pinke LED-Schuhe -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 77, 14, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1292, 'Flammen-Stiefel -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 79, 0, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1293, 'Flammen-Schuhe -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 80, 0, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1294, 'Schwarze Schnuerrboots -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 81, 0, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1295, 'Braune Schnuerrboots -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 81, 1, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1296, 'Beige Schnuerrboots -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 81, 2, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1297, 'Braune Outlaw-Stiefel -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 84, 0, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1298, 'Schwarze Outlaw-Stiefel -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 84, 1, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1299, 'Beige Outlaw-Stiefel -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 84, 3, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1300, 'Rote Outlaw-Stiefel -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 84, 6, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1301, 'Braune Outlaw-Boots -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 85, 0, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1302, 'Schwarze Outlaw-Boots -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 85, 1, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1303, 'Beige Outlaw-Boots -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 85, 3, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1304, 'Rote Outlaw-Boots -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 85, 10, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1305, 'Braune Outlaw-Schuhe -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 86, 0, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1306, 'Schwarze Outlaw-Schuhe -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 86, 1, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1307, 'Beige Outlaw-Schuhe -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 86, 3, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1308, 'Rote Outlaw-Schuhe -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 86, 10, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1309, 'Blaue Große Basketballschuhe -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 93, 0, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1310, 'Gelbe Große Basketballschuhe -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 93, 1, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1311, 'Gruene Große Basketballschuhe -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 93, 2, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1312, 'Lilane Große Basketballschuhe -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 93, 3, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1313, 'Rote Große Basketballschuhe -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 93, 4, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1314, 'Grau Große Basketballschuhe -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 93, 5, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1315, 'Schwarze Große Basketballschuhe -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 93, 6, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1316, 'Tuerkiese Große Basketballschuhe -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 93, 7, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1317, 'Rosane Große Basketballschuhe -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 93, 8, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1318, 'Lila-Minte Große Basketballschuhe -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 93, 8, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1319, 'Orangene Große Baetballschuhe -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 93, 10, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1320, 'Grau-Schwarze Große Basketballschuhe -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 93, 11, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1321, 'Grau-Weise Große Basketballschuhe -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 93, 12, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1322, 'Hellgraue Große Basketballschuhe -M-', 'clothes', 'eine paar Schuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 93, 13, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(1323, 'Bagel', 'food', 'Ein Bagel', 1, 1, 20, 5, 1, 'eat', 1, 1, 1, 0, 'None', 0, 0, 0, 0, 0, 0, 'Bagel.png'),
(1324, 'BonBon', 'food', 'Ein BonBon', 0.25, 1, 5, 0, 1, 'eat', 1, 1, 1, 0, 'None', 0, 0, 0, 0, 0, 0, 'BonBon.png'),
(1325, 'Chips', 'food', 'eine Packung Chips', 1, 1, 15, 0, 1, 'eat', 1, 1, 1, 0, 'None', 0, 0, 0, 0, 0, 0, 'Chips.png'),
(1326, 'Donut', 'food', 'Ein Donut', 0.8, 1, 20, 0, 1, 'eat', 1, 1, 1, 0, 'None', 0, 0, 0, 0, 0, 0, 'Donut.png'),
(1327, 'Eis', 'food', 'ein Eis', 1, 1, 15, 5, 1, 'eat', 1, 1, 1, 0, 'None', 0, 0, 0, 0, 0, 0, 'Eis.png'),
(1328, 'HotDog', 'food', 'ein HotDog', 1, 1, 35, 5, 1, 'eat', 1, 1, 1, 0, 'None', 0, 0, 0, 0, 0, 0, 'HotDog.png'),
(1329, 'Müsli-Riegel', 'food', 'ein Müsli-Riegel', 0.75, 1, 10, 0, 1, 'eat', 1, 1, 1, 0, 'None', 0, 0, 0, 0, 0, 0, 'Muesli-Riegel.png'),
(1330, 'Sandwich', 'food', 'ein Sandwich', 1, 1, 40, 0, 1, 'eat', 1, 1, 1, 0, 'None', 0, 0, 0, 0, 0, 0, 'Sandwich.png'),
(1331, 'Schokolade', 'food', 'eine Schokolade', 0.9, 1, 15, 0, 1, 'eat', 1, 1, 1, 0, 'None', 0, 0, 0, 0, 0, 0, 'Schokolade.png'),
(1332, 'Wrap', 'food', 'Ein Wrap', 1, 1, 30, 0, 1, 'eat', 1, 1, 1, 0, 'None', 0, 0, 0, 0, 0, 0, 'Wrap.png'),
(1333, 'Fahrzeugschluessel', 'keys', 'ein Fahrzeugschluessel', 0, 0, 0, 0, 0, 'None', 1, 0, 1, 0, 'None', 0, 0, 0, 0, 0, 0, 'Fahrzeugschluessel.png'),
(1334, 'Sand', 'divers', 'einfach Sand.', 1, 0, 0, 0, 0, 'None', 1, 0, 1, 0, 'None', 0, 0, 0, 0, 0, 0, 'Sand.png'),
(1335, 'Pistole', 'weapon', 'Eine Pistole', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 0, 'None', 0, 0, 0, 0, 0, 0, 'Pistole.png'),
(1336, 'Pistolen Munition', 'weapon', 'Munition', 0.05, 0, 0, 0, 0, 'None', 1, 1, 1, 0, 'None', 0, 0, 0, 0, 0, 0, 'Pistolen_Munition.png'),
(1337, 'Pistolen Munitionsbox', 'weapon', 'Waffenkiste', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 0, 'None', 0, 0, 0, 0, 0, 0, 'Pistolen_Munitionsbox.png'),
(1338, 'Elektroschocker', 'weapon', 'taser', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 0, 'None', 0, 0, 0, 0, 0, 0, 'Elektroschocker.png'),
(1339, 'MkII Pistole', 'weapon', 'waffe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 0, 'None', 0, 0, 0, 0, 0, 0, 'MkII_Pistole.png'),
(1340, 'MkII Pistolen Munition', 'weapon', 'muni', 0.05, 0, 0, 0, 0, 'None', 1, 1, 1, 0, 'None', 0, 0, 0, 0, 0, 0, 'MkII_Pistolen_Munition.png'),
(1341, 'MkII Pistolen Munitionsbox', 'weapon', 'muni', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 0, 'None', 0, 0, 0, 0, 0, 0, 'MkII_Pistolen_Munitionsbox.png'),
(1342, 'PDW', 'weapon', 'pdw', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 0, 'None', 0, 0, 0, 0, 0, 0, 'pdw.png'),
(1344, 'PDW Munitionsbox', 'weapon', 'munibox', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 0, 'None', 0, 0, 0, 0, 0, 0, 'box.png'),
(1346, 'Schlagstock', 'weapon', 'ein Schlagstock', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 0, 'None', 0, 0, 0, 0, 0, 0, 'Schlagstock.png'),
(1347, 'Tablet', 'divers', 'ein Tablet.', 1, 0, 0, 0, 0, 'None', 1, 0, 1, 0, 'None', 0, 0, 0, 0, 0, 0, 'Tablet.png'),
(1348, 'Weises V-Ausschnitt T-Shirt -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 1, 0, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1349, 'Graues V-Ausschnitt T-Shirt -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 1, 1, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1350, 'Gelbes V-Ausschnitt T-Shirt -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 1, 3, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1351, 'Rotes V-Ausschnitt T-Shirt -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 1, 4, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1352, 'Dunkelblaues V-Ausschnitt T-Shirt -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 1, 5, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1353, 'Lilanes V-Ausschnitt T-Shirt -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 1, 6, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1354, 'Gruenes V-Ausschnitt T-Shirt -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 1, 7, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1355, 'Lachsfarbenes V-Ausschnitt T-Shirt -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 1, 8, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1356, 'Oranges V-Ausschnitt T-Shirt -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 1, 11, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1357, 'Hellbraunes V-Ausschnitt T-Shirt -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 1, 12, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1358, 'Beiges V-Ausschnitt T-Shirt -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 1, 14, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1359, 'Weises Tanktop -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 5, 0, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1360, 'Graues Tanktop -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 5, 1, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1361, 'Schwarzes Tanktop -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 5, 2, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1362, 'Rotes Tanktop -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 5, 7, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1363, 'Rot-Blauer Pulli -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 8, 0, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1364, 'Weis-Blauer Pulli -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 8, 10, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1365, 'Schwarzer Pulli -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 8, 13, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1366, 'Hellgrau-Weiser Pulli -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 8, 14, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1367, 'Schwarz-Weis gestreiftes Polo-Shirt -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 9, 0, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1368, 'Graues Polo-Shirt -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 9, 1, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1369, 'Schwarzes Polo-Shirt -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 9, 2, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1370, 'Rosanes Polo-Shirt -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 9, 3, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1371, 'Blaues Polo-Shirt -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 9, 4, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1372, 'Orangenes Polo-Shirt -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 9, 5, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1373, 'Pinkes Polo-Shirt -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 9, 6, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1374, 'Lilanes Polo-Shirt -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 9, 7, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1375, 'Blau-Weises Polo-Shirt -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 9, 10, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1376, 'Weises Polo-Shirt -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 9, 11, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1377, 'Gruenes Polo-Shirt -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 9, 12, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1378, 'Dunkelgruenes Polo-Shirt -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 9, 13, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1379, 'Rotes Polo-Shirt -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 9, 14, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1380, 'Gelbes Polo-Shirt -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 9, 15, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1381, 'Weises Hemd drausen -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 12, 0, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1382, 'Graues Hemd drausen -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 12, 1, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1383, 'Schwarzes Hemd drausen -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 12, 2, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1384, 'Blaues Hemd drausen -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 12, 3, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1385, 'Dunkelblaues Hemd drausen -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 12, 4, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1386, 'Dunkelrotes Hemd drausen -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 12, 5, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1387, 'Grunes Hemd drausen -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 12, 6, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1388, 'Beiges Hemd drausen -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 12, 7, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1389, 'Orangenes Hemd drausen -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 12, 8, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1390, 'Gelbes Hemd drausen -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 12, 9, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1391, 'Gruen-Kariertes Hemd drausen -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 12, 10, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1392, 'Blau-Kariertes Hemd drausen -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 12, 11, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1393, 'Weises Hemd drin -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 13, 0, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1394, 'Graues Hemd drin -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 13, 1, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1395, 'Schwarzes Hemd drin -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 13, 2, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1396, 'Blaues Hemd drin -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 13, 3, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1397, 'Rotes Hemd drin -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 13, 5, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1398, 'Gruen-Kariertes Hemd drin -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 13, 13, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1399, 'Blau Kariertes Hemd mit Pullover -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 14, 0, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1400, 'Gelb Kariertes Hemd mit Pullover -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 14, 1, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1401, 'Weises Kariertes Hemd mit Pullover -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 14, 2, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1402, 'Gelb-Weises Kariertes Hemd mit Pullover -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 14, 3, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1403, 'Rot Kariertes Hemd mit Pullover -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 14, 4, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1404, 'Rot-Gruenes Kariertes Hemd mit Pullover -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 14, 5, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1405, 'Tuerkieses Kariertes Hemd mit Pullover -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 14, 6, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1406, 'Schwarzes Kariertes Hemd mit Pullover -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 14, 7, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1407, 'Petrol-Weis Kariertes Hemd mit Pullover -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 14, 8, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1408, 'Rot-Weis Kariertes Hemd mit Pullover -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 14, 9, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1409, 'Hellblau Kariertes Hemd mit Pullover -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 14, 10, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1410, 'Graue Kariertes Hemd mit Pullover -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 14, 11, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1411, 'Rot-Blau Kariertes Hemd mit Pullover -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 14, 12, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1412, 'Schwarz-Gruen Kariertes Hemd mit Pullover -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 14, 13, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1413, 'Gruen-Braun Kariertes Hemd mit Pullover -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 14, 14, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1414, 'Braun Kariertes Hemd mit Pullover -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 14, 15, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1415, 'Braunes V-Ausschnitt T-Shirt -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 16, 0, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1416, 'Hellblaues V-Ausschnitt T-Shirt -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 16, 1, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1417, 'Hellrotes V-Ausschnitt T-Shirt -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 16, 2, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1418, 'Blaues Tanktop -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 17, 0, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1419, 'Gelbes Tanktop -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 17, 1, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1420, 'Orangenes Tanktop -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 17, 2, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1421, 'Lila-Pinkes Tanktop -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 17, 3, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1422, 'Gelb-Rotes Tanktop -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 17, 4, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1423, 'Weises Einfaches t-Shirt -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 22, 0, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1424, 'Schwarz Einfaches t-Shirt -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 22, 1, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1425, 'Rotes Einfaches t-Shirt -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 22, 2, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1426, 'Dunkelblaues Hemd drin -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 26, 0, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1427, 'Gruenes Hemd drin -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 26, 1, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1428, 'Hellbraunes Hemd drin -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 26, 2, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1429, 'Orangenes Hemd drin -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 26, 3, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1430, 'Gelbes Hemd drin -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 26, 4, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1431, 'Rosanes Hemd drin -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 26, 5, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1432, 'Rotes Hemd drin -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 26, 6, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1433, 'Lila Kariertes Hemd drin -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 26, 7, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1434, 'Blau Kariertes Hemd drin -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 26, 8, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1435, 'Schwarz-Weis Kariertes Hemd drin -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 26, 9, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1436, 'Schwarz-Weis Gestreiftes Einfaches T-Shirt -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 33, 0, 0, 0, 0, 0, 'Oberteil_-M-.png');
INSERT INTO `server_items` (`id`, `itemName`, `itemType`, `itemDescription`, `itemWeight`, `isItemDesire`, `itemDesireFood`, `itemDesireDrink`, `hasItemAnimation`, `itemAnimationName`, `isItemDroppable`, `isItemUseable`, `isItemGiveable`, `isItemClothes`, `ClothesType`, `ClothesDraw`, `ClothesTexture`, `ClothesUndershirt`, `ClothesUndershirtTexture`, `ClothesDecals`, `ClothesDecalsTexture`, `itemPicSRC`) VALUES
(1437, 'Schwarz V-Ausschnitt T-Shirt -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 34, 0, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1438, 'Blau-Weis Gestreiftes V-Ausschnitt T-Shirt -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 34, 1, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1439, 'Gestreiftes Tanktop -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 36, 0, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1440, 'Lilanes Tanktop -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 36, 1, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1441, 'Pinkes Tanktop -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 36, 2, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1442, 'Armeefarbenes Tanktop -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 36, 3, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1443, 'Gruen-Gelbes Tanktop -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 36, 4, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1444, 'Grau-Gemustertes Tanktop -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 36, 5, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1445, 'Schwarz-Grauer Pulli -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 38, 0, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1446, 'Armee-Gelber Pulli -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 38, 1, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1447, 'Lila-Weiser Pulli -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 38, 2, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1448, 'Dunkelblau-Gelber Pulli -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 38, 3, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1449, 'Rotest STANK-Shirt -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 39, 0, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1450, 'Blaues STANK-Shirt -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 39, 1, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1451, 'Rot-Schwarz kariertes Hemd-drausen -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 41, 0, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1452, 'Rosa kariertes Hemd-drausen -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 41, 1, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1453, 'Beige kariertes Hemd-drausen -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 41, 2, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1454, 'Hemd mit Hosentraeger zu -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 42, 0, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1455, 'Hemd mit Hosentraeger offen -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 43, 0, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1456, 'Hellgruenes Einfaches T-Shirt -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 44, 0, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1457, 'Gelbes Einfaches T-Shirt -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 44, 1, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1458, 'Marine-Blaues Einfaches T-Shirt -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 47, 0, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1459, 'USA Einfaches T-Shirt -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 47, 1, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1460, 'NOOSE Oberteil -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 49, 0, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1461, 'Graues Kampf-Oberteil gemustert -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 49, 1, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1462, 'Graues Kampf-Oberteil -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 49, 2, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1463, 'Beiges Kampf-Oberteil -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 49, 3, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1464, 'Gruenes Kampf-Oberteil -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 49, 4, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1465, 'Schwarzer Kampfpulli -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 50, 0, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1466, 'Hellgrauer Kampfpulli -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 50, 1, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1467, 'Grauer Kampfpulli -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 50, 2, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1468, 'Beiger Kampfpulli -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 50, 3, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1469, 'Gruener Kampfpulli -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 50, 4, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1470, 'Schwarzer Einsatzpulli -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 53, 0, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1471, 'Grauer Einsatzpulli -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 53, 1, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1472, 'Beiger Einsatzpulli -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 53, 2, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1473, 'Tarnfarbener Einsatzpulli -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 53, 3, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1474, 'Schwarze Fliegerjacke -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 54, 0, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1475, 'Polizei-Oberteil -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 0, 1, 'Top', 55, 0, 58, 0, 0, 0, 'Oberteil_-M-.png'),
(1476, 'Dreckihes Weises-Shirt -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 56, 0, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1477, 'Schwarze Sweet-Jacke -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 57, 0, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1478, 'Schwarzes Arbeitshemd -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 63, 0, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1479, 'Rotes Hausmeister-Oberteil -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 65, 0, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1480, 'Schwarzes Hausmeister-Oberteil -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 65, 1, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1481, 'Gruenes Hausmeister-Oberteil -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 65, 2, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1482, 'Graues Hausmeister-Oberteil -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 65, 3, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1483, 'Rotes Hausmeisteroberteil mit Pullover -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 66, 0, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1484, 'Schwarze Hausmeisteroberteil mit Pullover -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 66, 1, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1485, 'Gruenes Hausmeisteroberteil mit Pullover -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 66, 2, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1486, 'Graues Hausmeisteroberteil mit Pullover -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 66, 3, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1487, 'Goldenes T-Shirt -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 71, 0, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1488, 'T-Shirt mit Bild 1 -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 73, 0, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1489, 'T-Shirt mit Bild 2 -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 73, 1, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1490, 'T-Shirt mit Bild 3 -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 73, 2, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1491, 'T-Shirt mit Bild 4 -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 73, 3, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1492, 'Braunes T-Shirt -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 73, 4, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1493, 'Braune NS Jacke -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 75, 0, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1494, 'Dunkelblaue PP Jacke -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 75, 1, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1495, 'Schwarze NS Jacke -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 75, 2, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1496, 'Bunte NS Jacke -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 75, 3, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1497, 'Braune Gemusterte Jacke -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 75, 4, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1498, 'Dunkelblaue Gemusterte Jacke -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 75, 5, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1499, 'Lilane Jacke -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 75, 6, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1500, 'Schwarz-weis Gemusterte Jacke -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 75, 7, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1501, 'Schwarz-Weise Jacke -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 75, 8, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1502, 'Schwarze LE Jacke -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 75, 9, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1503, 'Rote LE Jacke -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 75, 10, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1504, 'Beige-Weiser Einfacher Pullover -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 78, 0, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1505, 'LE CHIEN Einfacher Pullover -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 78, 1, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1506, 'Schwarz-Grauer Einfacher Pullover -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 78, 2, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1507, 'Grau-Weiser Einfacher Pullover -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 78, 3, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1508, 'Weis-Grauer Einfacher Pullover -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 78, 4, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1509, 'Rot-Weise Collange-Jacke -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 79, 0, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1510, 'Weises Großes T-Shirt -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 80, 0, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1511, 'Schwarzes Großes T-Shirt -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 80, 1, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1512, 'Schwarzes Trikot -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 81, 0, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1513, 'Weises Trikot -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 81, 1, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1514, 'Graues Trikot -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 81, 2, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1515, 'Graues YETI Polo-Shirt -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 82, 0, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1516, 'Schwarz-Gelbes YETI Polo-Shirt -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 82, 1, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1517, 'Schwarzes YETI Polo-Shirt -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 82, 2, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1518, 'Braun-Gestreiftes YETI Polo-Shirt -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 82, 3, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1519, 'Graues Baseballshirt -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 83, 0, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1520, 'Blau-Weises Baseballshirt -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 83, 1, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1521, 'Weis-Gruenes Baseballshirt -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 83, 2, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1522, 'Weis-Gestreiftes Baseballshirt -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 83, 3, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1523, 'Dunkelgraues Baseballshirt -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 83, 4, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1524, 'Corkers Pulli -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 84, 0, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1525, 'LS Pulli -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 84, 1, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1526, 'SA Pulli -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 84, 2, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1527, 'Squeezes Pulli -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 84, 3, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1528, 'The Feud Pulli -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 84, 4, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1529, 'Boars Pulli -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 84, 5, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1530, 'Graue Knopf-Regenjacke -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 85, 0, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1531, 'Schwarzer Einfacher Hoody -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 86, 0, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1532, 'Grauer Einfacher Hoody -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 86, 1, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1533, 'DOUPLE-P 1 Collage-Jacke -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 87, 0, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1534, 'MAGNETICK 1 Collage-Jacke -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 87, 1, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1535, 'HINTERLAND Collage-Jacke -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 87, 2, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1536, 'MAGNETICK 2 Collage-Jacke -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 87, 3, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1537, 'BROKER 1 Collage-Jacke -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 87, 4, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1538, 'BROCKER 2 Collage-Jacke -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 87, 5, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1539, 'BROKER 3 Collage-Jacke -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 87, 6, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1540, 'TRICKSTER 1 Collage-Jacke -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 87, 7, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1541, 'TRICKSTER 2 Collage-Jacke -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 87, 8, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1542, 'LOS SANTOS 1 Collage-Jacke -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 87, 9, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1543, 'DOUPLE-P 2 Collage-Jacke -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 87, 10, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1544, 'LOS SANTOS 2 Collage-Jacke -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 87, 11, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1545, 'Schwarzer Einfacher Pulli -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 89, 0, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1546, 'Grauer Einfacher Pulli -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 89, 1, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1547, 'Weiser Einfacher Pulli -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 89, 2, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1548, 'Gruener Einfacher Pulli -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 89, 3, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1549, 'Weise Collage-Jacke  -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 90, 0, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1550, 'Schwarzer Seiden Pyjama-Oberteil -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 92, 0, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1551, 'Lilanes Seiden Pyjama-Oberteil -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 92, 1, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1552, 'Gruenes Poloshirt drausen -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 93, 0, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1553, 'Buntes Poloshirt drausen -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 93, 1, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1554, 'Schwarze-Gruenes Poloshirt drausen -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 93, 2, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1555, 'Grunes Poloshirt drin -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 94, 0, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1556, 'Buntes Poloshirt drin -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 94, 1, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1557, 'Schwarz-Grunes Poloshirt drin -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 94, 2, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1558, 'Dunkelgrau Hemd Hochgekrempelt -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 95, 0, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1559, 'Schwarz Hemd Hochgekrempelt -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 95, 1, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1560, 'Gruen-Kariert Hemd Hochgekrempelt -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 95, 2, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1561, 'Hellblauer FB-Pulllover -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 96, 0, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1562, 'Beiges Dreckes T-shirt -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 97, 0, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1563, 'Grunes Dreckiges T-Shirt -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 97, 1, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1564, 'Beiger Einsatzpulli -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 98, 0, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1565, 'Gruener Einsatzpulli -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 98, 1, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1566, 'Weises Geblumtes Hemd -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 105, 0, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1567, 'Weiser Kimono -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 107, 0, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1568, 'Schwarzer Kimono -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 107, 1, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1569, 'Weise Strickweste -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 109, 0, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1570, 'Braune Lederjacke mit Guertel -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 110, 0, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1571, 'Rot-Schwarze Trainingsjacke -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 113, 0, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1572, 'Dunkelgraue Trainingsjacke -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 113, 1, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1573, 'Weises Bademantel-Oberteil -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 114, 0, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1574, 'Graues Bademantel -Oberteil -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 114, 1, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1575, 'Rot-Kariertes Pyjama-Obeteil -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 117, 0, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1576, 'Gruene-Kariertes Pyjama-Obeteil -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 117, 1, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1577, 'Schwarz-Kariertes Pyjama-Obeteil -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 117, 2, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1578, 'Gestreiftes Pyjama-Obeteil -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 117, 3, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1579, 'Weis-Schwarzes Hippi-Oberteil -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 121, 0, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1580, 'Schwarz-Weisses Hippi-Oberteil -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 121, 1, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1581, 'Grau-Getreiftes Hippi-Oberteil -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 121, 2, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1582, 'Jamaika Hippi-Oberteil -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 121, 3, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1583, 'Weises Hippi-Oberteil -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 121, 4, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1584, 'Braun-Graues Hippi-Oberteil -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 121, 5, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1585, 'Braunes-Gestreiftes Hippi-Oberteil -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 121, 6, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1586, 'Braunes Hippi-Oberteil -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 121, 7, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1587, 'Braunes YETI Hippi-Oberteil -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 121, 8, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1588, 'Weises SWEATBOX Hippi-Oberteil -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 121, 9, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1589, 'Beiges Hippi-Oberteil -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 121, 10, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1590, 'Grunes DENSE Hippi-Oberteil -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 121, 11, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1591, 'Weises Shirt -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 123, 0, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1592, 'Blaugraunes Shirt -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 123, 1, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1593, 'Dunkelgraues Shirt -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 123, 2, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1594, 'Orangene Jacke -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 125, 0, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1595, 'Tuerkies-Graues Langaermliches Hemd geschlosses -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 126, 0, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1596, 'Orang-Graues Langaermliches Hemd geschlosses -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 126, 1, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1597, 'Gruen-Graues Langaermliches Hemd geschlosses -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 126, 2, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1598, 'Lila-Graues Langaermliches Hemd geschlosses -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 126, 3, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1599, 'Hellbraun-Graunes Langaermliches Hemd geschlosses -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 126, 4, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1600, 'Blau-Weises Langaermliches Hemd geschlosses -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 126, 5, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1601, 'Lila-Weises Langaermliches Hemd geschlosses -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 126, 6, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1602, 'Schwarz-Weises Langaermliches Hemd geschlosses -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 126, 7, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1603, 'Gelb-Weises Langaermliches Hemd geschlosses -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 126, 8, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1604, 'Gruenes Langaermliches Hemd geschlosses -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 126, 9, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1605, 'Rot Langaermliches Hemd geschlosses -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 126, 10, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1606, 'Schwarz Langaermliches Hemd geschlosses -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 126, 11, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1607, 'Gelb Langaermliches Hemd geschlosses -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 126, 12, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1608, 'Lila Langaermliches Hemd geschlosses -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 126, 13, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1609, 'Weis Langaermliches Hemd geschlosses -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 126, 14, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1610, 'Gruen Einfarbiges Trikot -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 128, 0, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1611, 'Orang Einfarbiges Trikot -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 128, 1, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1612, 'Lila Einfarbiges Trikot -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 128, 2, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1613, 'Rosa Einfarbiges Trikot -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 128, 3, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1614, 'Rot Einfarbiges Trikot -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 128, 4, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1615, 'Blau Einfarbiges Trikot -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 128, 5, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1616, 'Grau Einfarbiges Trikot -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 128, 6, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1617, 'Braun Einfarbiges Trikot -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 128, 7, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1618, 'Weis Einfarbiges Trikot -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 128, 8, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1619, 'Schwarz Einfarbiges Trikot -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 128, 9, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1620, 'LIBERTY Poloshirt drausen  -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 131, 0, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1621, 'LIBERTY Poloshirt drin -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 132, 0, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1622, 'Rosanes Hochgekrempeltel Hemd -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 133, 0, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1623, 'Schwarzer LIBERTY Hoody -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 134, 0, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1624, 'Roter LIBERTY Hoody -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 134, 1, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1625, 'Schwarz-Goldenes Gemustertes Hemd -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 135, 0, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1626, 'Lila Gemustertes Hemd -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 135, 1, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1627, 'Rot Gemustertes Hemd -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 135, 2, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1628, 'Blau Gemustertes Hemd -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 135, 3, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1629, 'Dunkelbraune Lederjacke mit Guertel -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 138, 0, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1630, 'Schwarze Lederjacke mit Guertel -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 138, 1, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1631, 'Hellbraune Lederjacke mit Guertel -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 138, 2, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1632, 'Grauer Rollkragenpullover -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 139, 0, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1633, 'Roter Rollkragenpullover -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 139, 1, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1634, 'Brauner Rollkragenpullover -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 139, 2, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1635, 'Schwarzer Rollkragenpullover -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 139, 3, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1636, 'Dunkelblauer Rollkragenpullover -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 139, 4, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1637, 'Weiser Rollkragenpullover -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 139, 5, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1638, 'Lilaner Rollkragenpullover -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 139, 6, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1639, 'Gruener Rollkragenpullover -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 139, 7, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1640, 'Hellblaue Trainingsjacke -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 141, 0, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1641, 'Rote Trainingsjacke -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 141, 1, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1642, 'Beige Trainingsjacke -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 141, 2, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1643, 'Beige-Gruene Trainingsjacke -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 141, 3, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1644, 'Dunkelblaue Trainingsjacke -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 141, 4, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1645, 'Weise Trainingsjacke -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 141, 5, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1646, 'Tuerkiese Trainingsjacke -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 141, 6, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1647, 'Orange-Lila Trainingsjacke -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 141, 7, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1648, 'Lila-Gruene Trainingsjacke -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 141, 8, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1649, 'Hellgraue Trainingsjacke -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 141, 9, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1650, 'Gruen-Schwarze Trainingsjacke -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 141, 10, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1651, 'Gruene Collange-Jacke -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 143, 0, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1652, 'Orangene Collange-Jacke -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 143, 1, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1653, 'Lilane Collange-Jacke -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 143, 2, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1654, 'Rosane Collange-Jacke -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 143, 3, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1655, 'Hellblau Pyjama-Oberteil -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 144, 0, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1656, 'Gelb Pyjama-Oberteil -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 144, 1, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1657, 'Rosa Pyjama-Oberteil -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 144, 2, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1658, 'hellgruen Pyjama-Oberteil -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 144, 3, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1659, 'Lila-Orang Kariertes Pyjama-Oberteil -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 144, 4, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1660, 'Dunkelblau Kariertes Pyjama-Oberteil -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 144, 5, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1661, 'Dunkelrotes Pyjama-Oberteil -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 144, 6, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1662, 'Weis-SChwarz gemustertes Pyjama-Oberteil -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 144, 7, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1663, 'Lila Gemustertes Pyjama-Oberteil -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 144, 8, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1664, 'Gelb Gemustertes Pyjama-Oberteil -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 144, 9, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1665, 'Rot Gemustertes Pyjama-Oberteil -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 144, 10, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1666, 'Weises T-Shirt -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 146, 0, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1667, 'Schwarzes T-Shirt -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 146, 1, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1668, 'Rotes T-Shirt -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 146, 2, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1669, 'Gelbes T-Shirt -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 146, 3, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1670, 'Beiges T-Shirt -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 146, 4, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1671, 'Dunkelrotes T-Shirt -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 146, 5, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1672, 'Blaues T-Shirt -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 146, 6, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1673, 'Orangenes T-Shirt -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 146, 7, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1674, 'Hellblaues T-Shirt -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 146, 8, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1675, 'Gruenes Motorgross-Oberteil -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 148, 0, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1676, 'Schwarz-Rotes Motorgross-Oberteil -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 148, 1, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1677, 'Rot-Weises Motorgross-Oberteil -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 148, 2, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1678, 'Schwarzes Motorgross-Oberteil -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 148, 3, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1679, 'Rot-Blaues Motorgross-Oberteil -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 148, 4, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1680, 'Gelb-Schwarze Motorgross-Oberteil -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 148, 5, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1681, 'Weis-Rosane Motorgross-Oberteil -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 148, 6, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1682, 'Weis-Blaue Motorgross-Oberteil -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 148, 7, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1683, 'Weis-Gruene Motorgross-Oberteil -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 148, 8, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1684, 'Weis-Orangene Motorgross-Oberteil -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 148, 9, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1685, 'Weis-Lilane Motorgross-Oberteil -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 148, 10, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1686, 'Schwarze Asia Windjacke -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 150, 0, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1687, 'Dunkelblaue Asia Windjacke -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 150, 1, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1688, 'Schwarz-Weise Asia Windjacke -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 150, 2, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1689, 'Weise Asia  Mit Tiger -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 150, 3, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1690, 'Gruen-Gelbe Asia Windjacke -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 150, 4, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1691, 'Lila-Weise Asia Windjacke -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 150, 5, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1692, 'Blau-Weise Asia Windjacke -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 150, 6, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1693, 'Weise Asia Windjacke -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 150, 7, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1694, 'Dunkelrote Asia Windjacke -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 150, 8, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1695, 'Petrolfarbene Asia Windjacke -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 150, 9, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1696, 'Weis-Tuerkiese Asia Windjacke -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 150, 10, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1697, 'Pinker Motorgross-Pullover -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 152, 0, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1698, 'Hellblau-Rosaner Motorgross-Pullover -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 152, 1, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1699, 'Weis-Gruener Motorgross-Pullover -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 152, 2, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1700, 'Gruener Motorgross-Pullover -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 152, 3, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1701, 'Weiser Motorgross-Pullover -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 152, 4, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1702, 'Gruen-Lilaner Motorgross-Pullover -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 152, 5, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1703, 'Pink-Gelber Motorgross-Pullover -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 152, 6, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1704, 'Blau-Gruener Motorgross-Pullover -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 152, 7, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1705, 'Orangener Motorgross-Pullover -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 152, 8, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1706, 'Bunter Motorgross-Pullover -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 152, 9, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1707, 'Rot-Weiser Motorgross-Pullover -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 152, 10, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1708, 'Weis-Roter Motorgross-Pullover -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 152, 11, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1709, 'Dunkelblauer Motorgross-Pullover -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 152, 12, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1710, 'Gelber Motorgross-Pullover -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 152, 13, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1711, 'Lilaner Motorgross-Pullover -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 152, 14, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1712, 'Rot-Gelber Motorgross-Pullover -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 152, 15, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1713, 'Rot-Braune Windjacke -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 153, 0, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1714, 'Schwarze Windjacke -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 153, 1, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1715, 'Weise Windjacke -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 153, 2, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1716, 'Weis-Blaue Windjacke -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 153, 3, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1717, 'Orang-Weise Windjacke -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 153, 4, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1718, 'Schwarz-Weise Windjacke -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 153, 5, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1719, 'Gruen-Weise Windjacke -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 153, 6, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1720, 'Beige Windjacke -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 153, 7, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1721, 'Rot-Braune  Windjacke mit Totenkopf -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 153, 8, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1722, 'Schwarz-Weise  Windjacke mit Totenkopf -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 153, 9, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1723, 'Schwarze Windjacke mit Blitz -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 153, 10, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1724, 'Blau-Weise Windjacke -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 153, 11, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1725, 'Beige Windjacke -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 153, 12, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1726, 'Weise Windjacke -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 153, 13, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1727, 'Schwarz-Weise Windjacke -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 153, 14, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1728, 'Gruen-Weise Windjacke -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 153, 15, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1729, 'Schwarz-Gelbe Windjacke -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 153, 16, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1730, 'Braune Lederjacke mit Kaputze -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 168, 0, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1731, 'Schwarze Lederjacke mit Kaputze -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 168, 1, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1732, 'Graue Lederjacke mit Kaputze -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 168, 2, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1733, 'Weiser Einfacher Hoody -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 171, 1, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1734, 'Schwarz-Gelbe Motorrad-Jacke -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 178, 0, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1735, 'Schwarz-Gruene Motorrad-Jacke -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 178, 1, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1736, 'Schwarz-Orangene Motorrad-Jacke -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 178, 2, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1737, 'Schwarz-Lilane Motorrad-Jacke -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 178, 3, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1738, 'Schwarz-Rosane Motorrad-Jacke -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 178, 4, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1739, 'Schwarz-Rote Motorrad-Jacke -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 178, 5, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1740, 'Schwarz-Hellblaue Motorrad-Jacke -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 178, 6, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1741, 'Schwarz-Graue Motorrad-Jacke -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 178, 7, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1742, 'Olivfarbene Regenjacke-geschlossen -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 184, 0, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1743, 'Olivfabene Regenjacke mit Zielscheibe-geschlossen -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 184, 1, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1744, 'Olivfarbene Regenjacke-geschlossen -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 184, 2, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1745, 'Schwarzer Mantel mit Kaputze -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 187, 0, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1746, 'Dunkelgrauer Mantel mit Kaputze -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 187, 1, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1747, 'Grauer Mantel mit Kaputze -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 187, 2, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1748, 'Hellgrauer Mantel mit Kaputze -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 187, 3, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1749, 'Weiser Mantel mit Kaputze -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 187, 4, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1750, 'Roter Mantel mit Kaputze -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 187, 5, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1751, 'Pinker Mantel mit Kaputze -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 187, 6, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1752, 'Hellbrauner Mantel mit Kaputze -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 187, 7, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1753, 'Beiger Mantel mit Kaputze -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 187, 8, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1754, 'Gruener Mantel mit Kaputze -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 187, 9, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1755, 'Grau-Weiser Mantel mit Kaputze -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 187, 10, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1756, 'Dunkelbrauner Mantel mit Kaputze -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 187, 11, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1757, 'Hellorangene Regenjacke -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 188, 0, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1758, 'Rote Regenjacke -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 188, 1, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1759, 'Beige Regenjacke -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 188, 2, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1760, 'Gruene Regenjacke -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 188, 3, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1761, 'Tuerkiese Regenjacke -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 188, 4, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1762, 'Orangene Regenjacke -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 188, 5, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1763, 'Grau-Gefleckte Regenjacke -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 188, 6, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1764, 'Grün-Getarnte Regenjacke -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 188, 7, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1765, 'Hellgraue Regenjacke -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 188, 8, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1766, 'Beige-Getarnte Regenjacke -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 188, 9, 0, 0, 0, 0, 'Oberteil_-M-.png');
INSERT INTO `server_items` (`id`, `itemName`, `itemType`, `itemDescription`, `itemWeight`, `isItemDesire`, `itemDesireFood`, `itemDesireDrink`, `hasItemAnimation`, `itemAnimationName`, `isItemDroppable`, `isItemUseable`, `isItemGiveable`, `isItemClothes`, `ClothesType`, `ClothesDraw`, `ClothesTexture`, `ClothesUndershirt`, `ClothesUndershirtTexture`, `ClothesDecals`, `ClothesDecalsTexture`, `itemPicSRC`) VALUES
(1767, 'Blau-Getarnte Regenjacke -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 188, 10, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1768, 'Schwarz-Gemusterter Pullover -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 190, 0, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1769, 'Rot-Gemusterter Pullover -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 190, 1, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1770, 'Hellblau-Gemusterter Pullover -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 190, 2, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1771, 'Gelb-Gemusterter Pullover -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 190, 3, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1772, 'Hellblauer-Tarn Pullover -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 190, 4, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1773, 'Orangener-Tarn Pullover -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 190, 5, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1774, 'Orangener SQUASH Pullover -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 190, 6, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1775, 'Roter SQUASH Pullover -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 190, 7, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1776, 'Gelber SQUASH Pullover -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 190, 8, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1777, 'Pinker Bananen Pullover -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 190, 9, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1778, 'Hellgruener Tomaten Pullover -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 190, 10, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1779, 'Dunkelblauer SQUASH Pullover -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 190, 11, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1780, 'Tuerkieser SQUASH Pullover -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 190, 12, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1781, 'Hellgruener SQUASH Pullover -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 190, 13, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1782, 'Weis-Lilaner GUEFFY Pullover -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 190, 14, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1783, 'Weis-Pinker GUEFFY Pullover -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 190, 15, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1784, 'Tuerkieser GUEFFY Pullover -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 190, 16, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1785, 'Pinker GUEFFY Pullover -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 190, 17, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1786, 'Weiser GUEFFY Pullover -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 190, 18, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1787, 'Schwarzer GUEFFY Pullover -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 190, 19, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1788, 'Weis-Bunter MANOR Pullover -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 190, 20, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1789, 'Weiser MANOR Pullover -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 190, 21, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1790, 'Weis-Hellblauer MANOR Pullover -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 190, 22, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1791, 'Weis-Pinker MANOR Pullover -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 190, 23, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1792, 'Schwarzer MANOR Pullover -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 190, 24, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1793, 'Weises GUEFFI T-Shirt -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 193, 0, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1794, 'Rotes MANOR T-Shirt -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 193, 1, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1795, 'Schwarzes T-Shirt mit Blättern -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 193, 2, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1796, 'Schwarzes BLAGUEURS T-Shirt -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 193, 3, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1797, 'Weises BLAGUEURS T-Shirt -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 193, 4, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1798, 'Buntes BLAGUEURS T-Shirt -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 193, 5, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1799, 'Weises T-Shirt mit Flaschen -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 193, 6, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1800, 'Pinkes Bananen T-Shirt -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 193, 7, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1801, 'Weis-Pinkel GUEFFY T-Shirt -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 193, 8, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1802, 'Weis-Schwarzes GUEFFY T-Shirt -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 193, 9, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1803, 'Schwqarz-Graues GUEFFY T-Shirt -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 193, 10, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1804, 'Schwarz-Pinkes GUEFFY T-Shirt -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 193, 11, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1805, 'Blaues SAND CASTLE T-Shirt -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 193, 12, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1806, 'Gelb-Roter Hoody -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 200, 0, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1807, 'Schwarz-Pinker Hoody -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 200, 1, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1808, 'Schwarzer BLAGUEURS Hoody -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 200, 2, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1809, 'Gelber BLAGUEURS Hoody -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 200, 3, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1810, 'Bunter SQUASH Hoody -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 200, 4, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1811, 'Dunkelblauber GUEFFY Hoody -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 200, 5, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1812, 'Beiger GUEFFY Hoody -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 200, 6, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1813, 'Weis-Roter GUEFFY Hoody -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 200, 7, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1814, 'Pinker GUEFFY Hoody -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 200, 8, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1815, 'Neon-Oberteil 1 -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 201, 0, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1816, 'Neon-Oberteil 2 -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 201, 1, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1817, 'Neon-Oberteil 3 -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 201, 2, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1818, 'Schwarzer Aermelloser Hoody mit Kaputze -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 202, 0, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1819, 'Dunkelgrauer Aermelloser Hoody mit Kaputze -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 202, 1, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1820, 'Hellgrauer Aermelloser Hoody mit Kaputze -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 202, 2, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1821, 'Weiser Aermelloser Hoody mit Kaputze -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 202, 3, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1822, 'Schwarzer Aermelloser Hoody -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 205, 0, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1823, 'Dunkelgrau Aermelloser Hoody -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 205, 1, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1824, 'Hellgrau Aermelloser Hoody -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 205, 2, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1825, 'Weis Aermelloser Hoody -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 205, 3, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1826, 'Olivfarbener Aermelloser Hoody -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 205, 4, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1827, 'Blau-Gefleckter Aermelloser Hoody -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 206, 0, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1828, 'Braun-Gefleckter Aermelloser Hoody -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 206, 1, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1829, 'Gruen-Gefleckter Aermelloser Hoody -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 206, 2, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1830, 'Beige-Gefleckter Aermelloser Hoody -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 206, 3, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1831, 'Gelb-Gefleckter Aermelloser Hoody -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 206, 4, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1832, 'Wuestentarnfarbener Aermelloser Hoody -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 206, 5, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1833, 'Camoflagfarbener Aermelloser Hoody -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 206, 6, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1834, 'Kleinkarierter Aermelloser Hoody -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 206, 7, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1835, 'Dunkelgruen-Gefleckter Aermelloser Hoody -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 206, 8, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1836, 'Beige-Tarn Aermelloser Hoody -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 206, 9, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1837, 'Blau-Getarnter Aermelloser Hoody -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 206, 10, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1838, 'Tarnfarbener Aermelloser Hoody -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 206, 17, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1839, 'Gruener Aermelloser Hoody -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 206, 18, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1840, 'Gelber Aermelloser Hoody -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 206, 19, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1841, 'Gruen-Getarnter Aermelloser Hoody -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 206, 20, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1842, 'Orang-Getarnter Aermelloser Hoody -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 206, 21, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1843, 'Lila-Getarnter Aermelloser Hoody -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 206, 22, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1844, 'Rosa-Getarnter Aermelloser Hoody -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 206, 23, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1845, 'Tarnfarbenes Einfaches Shirt -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 208, 17, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1846, 'Gruenes Einfaches Shirt -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 208, 18, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1847, 'Gelbers Einfaches Shirt -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 208, 19, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1848, 'Gruenes-Getarntes Einfaches Shirt -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 208, 20, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1849, 'Orang-Getarntes Einfaches Shirt -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 208, 21, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1850, 'Lila-Getarntes Einfaches Shirt -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 208, 22, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1851, 'Rosanes-Getarntes Einfaches Shirt -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 208, 23, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1852, 'Graue Regenjacke ohne Kaputze -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 217, 0, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1853, 'Olivfarbene Regenjacke ohne Kaputze -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 217, 1, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1854, 'Hellorangene Regenjacke ohne Kaputze -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 217, 2, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1855, 'Rote Regenjacke ohne Kaputze -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 217, 3, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1856, 'Gelbe Regenjacke ohne Kaputze -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 217, 4, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1857, 'Hellgruene Regenjacke ohne Kaputze -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 217, 5, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1858, 'Tuerkiese Regenjacke ohne Kaputze -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 217, 6, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1859, 'Orange Regenjacke ohne Kaputze -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 217, 7, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1860, 'Grau-Gefleckte Regenjacke ohne Kaputze -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 217, 8, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1861, 'Gruen-Gefleckte Regenjacke ohne Kaputze -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 217, 9, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1862, 'Kleinkarierter Regenjacke ohne Kaputze -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 217, 10, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1863, 'Tarnfarbene Regenjacke ohne Kaputze -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 217, 11, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1864, 'Blau-Getarnte Regenjacke ohne Kaputze -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 217, 12, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1865, 'Olivfarbene Regenjacke mit Zielscheibe ohne Kaputze -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 217, 13, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1866, 'Gruen Hemd ohne Aermel -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 219, 18, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1867, 'Gelb Hemd ohne Aermel -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 219, 19, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1868, 'Schwarz Hemd ohne Aermel -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 219, 20, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1869, 'Dunkelgrau Hemd ohne Aermel -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 219, 21, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1870, 'Hellgrau Hemd ohne Aermel -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 219, 22, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1871, 'Rot Hemd ohne Aermel -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 219, 23, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1872, 'Dunkelblau Hemd ohne Aermel -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 219, 24, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1873, 'Hellbraun Hemd ohne Aermel -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 219, 25, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1874, 'Gruener Arbeitspullover -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 220, 18, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1875, 'Gelber Arbeitspullover -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 220, 19, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1876, 'Schwarzer Arbeitspullover -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 220, 20, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1877, 'Dunkelgrauer Arbeitspullover -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 220, 21, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1878, 'Hellgrauer Arbeitspullover -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 220, 22, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1879, 'Brauner Arbeitspullover -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 220, 23, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1880, 'Roter Arbeitspullover -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 220, 24, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1881, 'Blauer Arbeitspullover -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 220, 25, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1882, 'Kleinkarierte Arbeitsjacke -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 221, 7, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1883, 'Blaugetarnte Arbeitsjacke -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 221, 10, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1884, 'Tarnfarbene Arbeitsjacke -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 221, 17, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1885, 'Gruene Arbeitsjacke -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 221, 18, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1886, 'Gelbe Arbeitsjacke -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 221, 19, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1887, 'Schwarze Arbeitsjacke -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 221, 20, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1888, 'Graue Arbeitsjacke -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 221, 21, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1889, 'Weise Arbeitsjacke -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 221, 22, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1890, 'Braune Arbeitsjacke -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 221, 23, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1891, 'Olivfarbene Arbeitsjacke -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 221, 24, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1892, 'Blaue Arbeitsjacke -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 221, 0, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1893, 'kleinkariertes Arbeitshemd -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 222, 7, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1894, 'Blaugetarntes Arbeitshemd -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 222, 10, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1895, 'Tarnfarbenes Arbeitshemd -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 222, 17, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1896, 'Gruenes Arbeitshemd -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 222, 18, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1897, 'Gelbes Arbeitshemd -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 222, 19, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1898, 'Graues Arbeitshemd -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 222, 21, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1899, 'Weises Arbeitshemd -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 222, 22, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1900, 'Braunes Arbeitshemd -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 222, 23, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1901, 'Olivfarbenes Arbeitshemd -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 222, 24, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1902, 'Hellblaues Arbeitshemd -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 222, 25, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1903, 'Schwarze Steppweste -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 223, 0, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1904, 'Graue Steppweste -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 223, 1, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1905, 'Weise Steppweste -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 223, 2, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1906, 'Rote Steppweste -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 223, 3, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1907, 'Orangene Steppweste -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 223, 4, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1908, 'Gelbe Steppweste -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 223, 5, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1909, 'Hellgruene Steppweste -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 223, 6, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1910, 'Dunkelgruene Steppweste -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 223, 7, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1911, 'Hellblaue Steppweste -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 223, 8, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1912, 'Blaue Steppweste -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 223, 9, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1913, 'Rosane Steppweste -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 223, 10, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1914, 'Beige Steppweste -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 223, 11, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1915, 'Gruen-Getarnte Steppweste -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 223, 12, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1916, 'Orang-Getarnte Steppweste -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 223, 13, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1917, 'Lila-Getarnte Steppweste -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 223, 14, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1918, 'Rosa-Getarnte Steppweste -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 223, 15, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1919, 'Schwarze Steppjacke -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 224, 0, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1920, 'Graue Steppjacke -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 224, 1, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1921, 'Weise Steppjacke -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 224, 2, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1922, 'Rote Steppjacke -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 224, 3, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1923, 'Orangene Steppjacke -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 224, 4, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1924, 'Gelbe Steppjacke -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 224, 5, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1925, 'Hellgruene Steppjacke -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 224, 6, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1926, 'Dunkelgruene Steppjacke -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 224, 7, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1927, 'Hellblaue Steppjacke -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 224, 8, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1928, 'Blaue Steppjacke -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 224, 9, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1929, 'Rosane Steppjacke -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 224, 10, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1930, 'Beige Steppjacke -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 224, 11, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1931, 'Gruen-Getarnte Steppjacke -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 224, 12, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1932, 'Orang-Getarnte Steppjacke -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 224, 13, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1933, 'Lila-Getarnte Steppjacke -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 224, 14, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1934, 'Rosa-Getarnte Steppjacke -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 224, 15, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1935, 'Rockstar-Games Shirt Blau -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 225, 0, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1936, 'Rockstar-Games Shirt Rot -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 225, 1, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1937, 'Schwarzes Shirt mit Brusttasche -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 226, 0, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1938, 'Olivfarbene Bomberjacke geschlossen -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 229, 0, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1939, 'Hellbraune Bomberjacke geschlossen -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 229, 1, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1940, 'Schwarze Bomberjacke geschlossen -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 229, 2, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1941, 'Graue Bomberjacke geschlossen -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 229, 3, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1942, 'Weise Bomberjacke geschlossen -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 229, 4, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1943, 'Tuerkiese Bomberjacke geschlossen -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 229, 5, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1944, 'Dunkelblaue Bomberjacke geschlossen -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 229, 6, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1945, 'Rote Bomberjacke geschlossen -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 229, 7, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1946, 'Gruene Bomberjacke geschlossen -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 229, 8, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1947, 'Orangene Bomberjacke geschlossen -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 229, 9, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1948, 'Lilane Bomberjacke geschlossen -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 229, 10, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1949, 'Rosane Bomberjacke geschlossen -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 229, 11, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1950, 'Schwarzes gekloepftes Hemd -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 234, 0, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1951, 'Dunkelgraues gekloepftes Hemd -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 234, 1, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1952, 'Graues gekloepftes Hemd -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 234, 2, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1953, 'Hellgraues gekloepftes Hemd -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 234, 3, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1954, 'Weises gekloepftes Hemd -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 234, 4, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1955, 'Braunes gekloepftes Hemd -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 234, 5, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1956, 'Rosanes gekloepftes -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 234, 6, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1957, 'Tuerkieses/Rosa gekloepftes Hemd mit Blazzmuster -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 234, 7, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1958, 'Tuerkieses gekloepftes Hemd mit Blatmuster -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 234, 8, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1959, 'Beiges gekloepftes Hemd -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 234, 9, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1960, 'Hellblaues gekloepftes Hemd -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 234, 10, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1961, 'Weises hochgekrempeltes Shirt -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 238, 0, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1962, 'Schwarzes hochgekrempeltes Shirt -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 238, 1, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1963, 'Rotes hochgekrempeltes Shirt -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 238, 2, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1964, 'Gestreiftes hochgekrempeltes Shirt -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 238, 3, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1965, 'Beiges hochgekrempeltes Shirt -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 238, 4, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1966, 'Olivfarbenes hochgekrempeltes Shirt -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 238, 5, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1967, 'Blaugeflecktes hochgekrempeltes Shirt -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 239, 0, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1968, 'Braungeflecktes hochgekrempeltes Shirt -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 239, 1, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1969, 'Gruengeflecktes hochgekrempeltes Shirt -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 239, 2, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1970, 'Beigegeflecktes hochgekrempeltes Shirt -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 239, 3, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1971, 'Gelbgeflecktes hochgekrempeltes Shirt -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 239, 4, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1972, 'Wuestentarnfarbenes hochgekrempeltes Shirt -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 239, 5, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1973, 'Tarnfarbenes hochgekrempeltes Shirt -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 239, 6, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1974, 'Hellgraues Zweifarbiges-Poloshirt -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 241, 0, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1975, 'Blaues Zweifarbiges-Poloshirt -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 241, 1, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1976, 'Weises Zweifarbiges-Poloshirt -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 241, 2, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1977, 'Beiges Zweifarbiges-Poloshirt -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 241, 3, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1978, 'Schwarzes Zweifarbiges-Poloshirt -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 241, 4, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1979, 'Rotes Zweifarbiges-Poloshirt -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 241, 5, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1980, 'Hellgraues Zweifarbiges-Poloshirt drin -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 242, 0, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1981, 'Blaues Zweifarbiges-Poloshirt drin -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 242, 1, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1982, 'Weises Zweifarbiges-Poloshirt drin -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 242, 2, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1983, 'Beiges Zweifarbiges-Poloshirt drin -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 242, 3, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1984, 'Schwarzes Zweifarbiges-Poloshirt drin -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 242, 4, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1985, 'Rotes Zweifarbiges-Poloshirt drin -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 242, 5, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1986, 'Schwarzes PRO-LAPS Oberteil -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 243, 0, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1987, 'Weises PRO-LAPS Oberteil -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 243, 1, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1988, 'Blaues PRO-LAPS Oberteil -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 243, 2, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1989, 'Rotes PRO-LAPS Oberteil -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 243, 3, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1990, 'Gelbes PRO-LAPS Oberteil -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 243, 7, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1991, 'Tuerkieses PRO-LAPS Oberteil -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 243, 10, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1992, 'Pinkes PRO-LAPS Oberteil -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 243, 19, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1993, 'Hellblaues PRO-LAPS Oberteil -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 243, 20, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1994, 'Gruenes PRO-LAPS Oberteil -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 243, 22, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1995, 'Orangenes PRO-LAPS Oberteil -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 243, 23, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1996, 'Lilanes PRO-LAPS Oberteil -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 243, 24, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1997, 'Rosanes PRO-LAPS Oberteil -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 243, 25, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1998, 'Olivfarbene Geknoepfte-Arbeitsjacke -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 244, 0, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(1999, 'Gruene Geknoepfte-Arbeitsjacke -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 244, 1, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(2000, 'Hellgraue Geknoepfte-Arbeitsjacke -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 244, 2, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(2001, 'Blaugemusterte Geknoepfte-Arbeitsjacke -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 244, 3, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(2002, 'Hellblaue Geknoepfte-Arbeitsjacke -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 244, 4, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(2003, 'Schwarze Geknoepfte-Arbeitsjacke -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 244, 5, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(2004, 'Schwarz-Weise Geknoepfte-Arbeitsjacke -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 244, 6, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(2005, 'Weise Geknoepfte-Arbeitsjacke -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 244, 7, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(2006, 'Dunkelgruene Geknoepfte-Arbeitsjacke -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 244, 8, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(2007, 'Pinke Geknoepfte-Arbeitsjacke -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 244, 9, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(2008, 'Graue Geknoepfte-Arbeitsjacke -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 244, 10, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(2009, 'Schwarze Dicke-Arbeitsjacke -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 248, 0, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(2010, 'Hellbraune Dicke-Arbeitsjacke -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 248, 1, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(2011, 'Blaue Dicke-Arbeitsjacke -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 248, 4, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(2012, 'Hellblaue Dicke-Arbeitsjacke -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 248, 9, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(2013, 'Pinke Dicke-Arbeitsjacke -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 248, 10, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(2014, 'Orangene Dicke-Arbeitsjacke -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 248, 14, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(2015, 'Grau-Rote Dicke-Arbeitsjacke -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 248, 15, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(2016, 'Dunkelblaue Dicke-Arbeitsjacke -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 248, 16, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(2017, 'Weise Dicke-Arbeitsjacke -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 248, 17, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(2018, 'Hellgraue Dicke-Arbeitsjacke -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 248, 18, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(2019, 'Dunkelbraune Dicke-Arbeitsjacke -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 248, 19, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(2020, 'Graue Dicke-Arbeitsjacke -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 248, 23, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(2021, 'Medic-Jacke Blau -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 0, 1, 'Top', 249, 0, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(2022, 'Medic-Jacke Gruen -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 0, 1, 'Top', 249, 1, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(2023, 'Medic-Hemd Blau -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 0, 1, 'Top', 250, 0, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(2024, 'Medic-Hemd Gruen -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 0, 1, 'Top', 250, 1, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(2025, 'Senfgelber Windbeaker -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 251, 0, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(2026, 'Grauer Windbeaker -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 251, 1, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(2027, 'Weiser Windbeaker -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 251, 2, 0, 0, 0, 0, 'Oberteil_-M-.png'),
(2028, 'Polizei-Oberteil Patches -M-', 'clothes', 'ein Oberteil mit Patches', 0.8, 0, 0, 0, 0, 'None', 1, 1, 0, 1, 'Top', 55, 0, 58, 0, 8, 1, 'Oberteil_-M-.png'),
(2029, 'Polizei-Oberteil Patches2 -M-', 'clothes', 'ein Oberteil mit Patches II', 0.8, 0, 0, 0, 0, 'None', 1, 1, 0, 1, 'Top', 55, 0, 58, 0, 8, 2, 'Oberteil_-M-.png'),
(2031, 'Generalschluessel', 'keys', 'ein Generalschluessel', 0, 0, 0, 0, 0, 'None', 1, 0, 0, 0, 'None', 0, 0, 0, 0, 0, 0, 'Generalschluessel.png'),
(2032, 'Handschellen', 'tools', 'ein paar Handschellen', 0.2, 0, 0, 0, 0, 'None', 1, 0, 1, 0, 'None', 0, 0, 0, 0, 0, 0, 'Handschellen.png'),
(2033, 'Handschellenschluessel', 'tools', 'zum Öffnen von Handschellen', 0.2, 0, 0, 0, 0, 'None', 1, 0, 1, 0, 'None', 0, 0, 0, 0, 0, 0, 'Handschellenschluessel.png'),
(2034, 'Seil', 'tools', 'ein Seil', 0.2, 0, 0, 0, 0, 'None', 1, 0, 1, 0, 'None', 0, 0, 0, 0, 0, 0, 'Seil.png'),
(2035, 'Brecheisen', 'tools', 'Ein Brecheisen.', 3, 0, 0, 0, 0, 'None', 1, 1, 1, 0, 'None', 0, 0, 0, 0, 0, 0, 'Brecheisen.png'),
(2036, 'Smartphone', 'divers', 'Ein Smartphone', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 0, 'None', 0, 0, 0, 0, 0, 0, 'Smartphone.png'),
(2037, 'Defibrilator', 'tools', 'Zum Wiederbeleben von Personen', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 0, 'None', 0, 0, 0, 0, 0, 0, 'Defibrilator.png'),
(2038, 'Glasscheibe', 'divers', 'eine Glasscheibe.', 3, 0, 0, 0, 0, 'None', 1, 0, 1, 0, 'None', 0, 0, 0, 0, 0, 0, 'Glasscheibe.png'),
(2039, 'Traube', 'food', 'Traube', 0.2, 1, 2, 0, 1, 'eat', 1, 1, 1, 0, 'None', 0, 0, 0, 0, 0, 0, 'Trauben.png'),
(2040, 'Traubensaft', 'food', 'Traubensaft', 0.5, 1, 0, 4, 1, 'drink', 1, 1, 1, 0, 'None', 0, 0, 0, 0, 0, 0, 'Traubensaft.png'),
(2041, 'Tomaten', 'food', 'Tomaten', 0.2, 1, 5, 0, 1, 'eat', 1, 1, 1, 0, 'None', 0, 0, 0, 0, 0, 0, 'Tomaten.png'),
(2042, 'Ketchup', 'divers', 'Ketchup', 0.7, 0, 0, 0, 0, 'None', 1, 0, 1, 0, 'None', 0, 0, 0, 0, 0, 0, 'Ketchup.png'),
(2043, 'Maiskolben', 'food', 'Maiskolben', 0.2, 1, 7, 0, 1, 'eat', 1, 1, 1, 0, 'None', 0, 0, 0, 0, 0, 0, 'Maiskolben.png'),
(2044, 'Popcorn', 'food', 'Popcorn', 0.6, 1, 4, 0, 1, 'eat', 1, 1, 1, 0, 'None', 0, 0, 0, 0, 0, 0, 'Popcorn.png'),
(2045, 'Wasser', 'food', 'Wasser', 0.5, 1, 0, 25, 1, 'eat', 1, 1, 1, 0, 'None', 0, 0, 0, 0, 0, 0, 'Wasser.png'),
(2047, 'Mais', 'food', 'Maiskolben', 0.3, 1, 7, 0, 1, 'eat', 1, 1, 1, 0, 'None', 0, 0, 0, 0, 0, 0, 'Mais.png'),
(2048, 'Schaufel', 'tools', 'Zum schaufeln von Sand', 3, 0, 0, 0, 0, 'None', 1, 1, 1, 0, 'None', 0, 0, 0, 0, 0, 0, 'Schaufel.png'),
(2049, 'Milch', 'food', 'Milch', 0.5, 1, 0, 5, 1, 'eat', 1, 1, 1, 0, 'None', 0, 0, 0, 0, 0, 0, 'Milch.png'),
(2050, 'O-Saft', 'food', 'O-Saft', 0.5, 1, 0, 5, 1, 'eat', 1, 1, 1, 0, 'None', 0, 0, 0, 0, 0, 0, 'O-Saft.png'),
(2051, 'Energy Drink', 'food', 'Energy Drink', 0.3, 1, 0, 5, 1, 'eat', 1, 1, 1, 0, 'None', 0, 0, 0, 0, 0, 0, 'Energy_Drink.png'),
(2052, 'Weste', 'divers', 'Weste', 1, 0, 0, 0, 1, 'weste', 1, 1, 1, 0, 'None', 0, 0, 0, 0, 0, 0, 'weste.png'),
(2053, 'Joint', 'divers', 'Joint', 0.01, 0, 0, 0, 1, 'smoke', 1, 1, 1, 0, 'None', 0, 0, 0, 0, 0, 0, 'joint.png'),
(2054, 'Aramid', 'divers', 'Aramid', 0.05, 0, 0, 0, 0, 'None', 1, 0, 1, 0, 'None', 0, 0, 0, 0, 0, 0, 'aramid.png'),
(2055, 'Hanfpflanze', 'divers', 'Hanfpflanze', 0.1, 0, 0, 0, 0, 'None', 1, 0, 1, 0, 'None', 0, 0, 0, 0, 0, 0, 'hanfpflanze.png'),
(2056, 'Hanf', 'divers', 'Hanf', 1, 0, 0, 0, 0, 'None', 1, 0, 1, 0, 'None', 0, 0, 0, 0, 0, 0, 'hanf.png'),
(2057, 'Verbandskasten', 'divers', 'Verbandskasten', 0.25, 0, 0, 0, 1, 'verband', 1, 1, 1, 0, 'None', 0, 0, 0, 0, 0, 0, 'verband.png'),
(2058, 'Baseballschlaeger', 'weapon', 'Baseballschlaeger', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 0, 'None', 0, 0, 0, 0, 0, 0, 'baseball.png'),
(2059, 'Schlagring', 'weapon', 'Schlagring', 2, 0, 0, 0, 0, 'None', 1, 1, 0, 0, 'None', 0, 0, 0, 0, 0, 0, 'schlagring.png'),
(2060, 'Cal50 Pistole', 'weapon', 'Caliber 50', 2, 0, 0, 0, 0, 'None', 1, 1, 1, 0, 'None', 0, 0, 0, 0, 0, 0, 'pistol50.png'),
(2061, 'Cal50 Pistolen Munition', 'weapon', 'muni', 0.05, 0, 0, 0, 0, 'None', 1, 1, 1, 0, 'None', 0, 0, 0, 0, 0, 0, 'box.png'),
(2062, 'Springmesser', 'weapon', 'Springmesser', 2, 0, 0, 0, 0, 'None', 1, 1, 0, 0, 'None', 0, 0, 0, 0, 0, 0, 'springmesser.png'),
(2063, 'LSPD T-Shirtbandana', 'clothes', 'Eine Maske', 0.5, 0, 0, 0, 0, 'None', 1, 1, 0, 1, 'Mask', 54, 10, 0, 0, 0, 0, 'Maske.png'),
(2064, 'SMG', 'weapon', 'SMG', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 0, 'None', 0, 0, 0, 0, 0, 0, 'smg.png'),
(2065, 'Taschenlampe', 'weapon', 'Taschenlampe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 0, 'None', 0, 0, 0, 0, 0, 0, 'taschenlampe.png'),
(2066, 'SMG Munition', 'weapon', 'muni', 0.05, 0, 0, 0, 0, 'None', 1, 1, 1, 0, 'None', 0, 0, 0, 0, 0, 0, 'smg.png'),
(2067, 'SMG Munitionsbox', 'weapon', 'munibox', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 0, 'None', 0, 0, 0, 0, 0, 0, 'box.png'),
(2069, 'PDW Munition', 'weapon', 'muni', 0.05, 0, 0, 0, 0, 'None', 1, 1, 1, 0, 'None', 0, 0, 0, 0, 0, 0, 'box.png'),
(2071, 'Kroete', 'divers', 'Ein Frosch', 0.25, 0, 0, 0, 0, 'None', 1, 0, 1, 0, 'None', 0, 0, 0, 0, 0, 0, 'Kroete.png'),
(2072, 'Gehaeutete Kroete', 'divers', 'Eine gehäutete Kröte', 0.2, 0, 0, 0, 0, 'None', 1, 0, 1, 0, 'None', 0, 0, 0, 0, 0, 0, 'GehaeuteteKroete.png'),
(2073, 'Ephedrin', 'divers', 'Ephedrin', 0.5, 0, 0, 0, 0, 'None', 1, 0, 1, 0, 'None', 0, 0, 0, 0, 0, 0, 'Ephedrin.png'),
(2074, 'Schultershirt grau -F-', 'clothes', 'Ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 2, 1, 0, 0, 0, 0, 'Oberteil.png'),
(2075, 'Jeans hochgekrämpelt dunkelgrau -F-', 'clothes', 'Eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Leg', 4, 0, 0, 0, 0, 0, 'Hose_-M-.png'),
(2076, 'Turnschuhe grau -F-', 'clothes', 'Ein Paar SChuhe', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Feet', 1, 0, 0, 0, 0, 0, 'Schuhe_-M-.png'),
(2077, 'Methamphetamin', 'divers', 'Methamphetamin', 0.1, 0, 0, 0, 0, 'None', 1, 0, 1, 0, 'None', 0, 0, 0, 0, 0, 0, 'Meth.png'),
(2078, 'Reparaturkit', 'divers', 'Reparaturkit', 0.25, 0, 0, 0, 0, 'None', 1, 1, 1, 0, 'None', 0, 0, 0, 0, 0, 0, 'werkzeugkasten.png'),
(2079, 'Cal50 Pistolen Munitionsbox', 'weapon', 'muni', 0.05, 0, 0, 0, 0, 'None', 1, 1, 1, 0, 'None', 0, 0, 0, 0, 0, 0, 'box.png'),
(2080, 'Kescher', 'tools', 'Kescher', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 0, 'None', 0, 0, 0, 0, 0, 0, 'Kescher.png'),
(2081, 'Medic-Hemd Blau mit Patches -M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 0, 1, 'Top', 250, 0, 0, 0, 58, 0, 'Oberteil_-M-.png'),
(2082, 'Medic-Hemd Gruen mit Patches-M-', 'clothes', 'ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 0, 1, 'Top', 250, 1, 0, 0, 58, 0, 'Oberteil_-M-.png'),
(2083, 'PolizeiHemd mit Patches 2 -F-', 'clothes', 'Ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 0, 1, 'Top', 48, 0, 35, 0, 7, 1, 'Oberteil-M-.png'),
(2084, 'Chefarzthose -M-', 'clothes', 'eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 0, 1, 'Leg', 20, 0, 0, 0, 0, 0, 'Hose_-M-.png'),
(2085, 'Golfschlaeger', 'Golfschlaeger', 'Golfschlaeger', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 0, 'None', 0, 0, 0, 0, 0, 0, 'Golfschlaeger.png'),
(2086, 'Kokain', 'divers', 'Kokain', 0.25, 0, 0, 0, 1, 'Kokain', 1, 1, 1, 0, 'None', 0, 0, 0, 0, 0, 0, 'Kokain.png'),
(2087, 'Gruene Medizinerhose -M-', 'clothes', 'Eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 0, 1, 'Leg', 96, 1, 0, 0, 0, 0, 'Hose_-M-.png'),
(2088, 'Blaue Medizinerhose -M-', 'clothes', 'Eine Hose', 0.7, 0, 0, 0, 0, 'None', 1, 1, 0, 1, 'Leg', 96, 0, 0, 0, 0, 0, 'Hose_-M-.png'),
(2089, 'Kokablatt', 'divers', 'Kokablatt', 0.25, 0, 0, 0, 0, 'None', 1, 0, 1, 0, 'None', 0, 0, 0, 0, 0, 0, 'Kokablatt.png'),
(2090, 'FIB OhrCau', 'clothes', 'Ein Ohrstöpsel', 0.05, 0, 0, 0, 0, 'None', 1, 1, 0, 1, 'Mask', 121, 0, 0, 0, 0, 0, 'Maske.png'),
(2091, 'Schwarzes Sakkohemd -M-', 'clothes', 'Ein Oberteil', 0.8, 0, 0, 0, 0, 'None', 1, 1, 1, 1, 'Top', 31, 0, 32, 0, 0, 0, 'Oberteil.png'),
(2092, 'Smartphone', 'divers', 'nen handy', 0.5, 0, 0, 0, 0, 'None', 1, 1, 1, 0, 'None', 0, 0, 0, 0, 0, 0, 'Smartphone.png'),
(2093, 'Karabiner', 'weapon', 'lol', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 0, 'None', 0, 0, 0, 0, 0, 0, 'Karabiner.png'),
(2094, 'Karabiner Munition', 'weapon', 'ss', 0, 0, 0, 0, 0, 'None', 1, 1, 1, 0, 'None', 0, 0, 0, 0, 0, 0, 'KarabinerMunition.png'),
(2095, 'Karabiner Munitionsbox', 'weapon', 's', 1, 0, 0, 0, 0, 'None', 1, 1, 1, 0, 'None', 0, 0, 0, 0, 0, 0, 'Munikiste.png');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `server_jobs`
--

CREATE TABLE `server_jobs` (
  `id` int(11) NOT NULL,
  `jobName` varchar(64) NOT NULL,
  `jobPaycheck` int(11) NOT NULL DEFAULT 0,
  `jobNeededHours` int(11) NOT NULL DEFAULT 0,
  `jobPic` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `server_jobs`
--

INSERT INTO `server_jobs` (`id`, `jobName`, `jobPaycheck`, `jobNeededHours`, `jobPic`) VALUES
(1, 'Webentwickler', 1000, 2, 'code.png'),
(2, 'Reiseberater', 1000, 2, 'globe2.png'),
(3, 'Steuerberater', 1000, 2, 'arrows.png'),
(4, 'Einrichtungsberater', 1000, 2, 'design.png'),
(5, 'Produkttester', 4500, 8, 'protection.png'),
(6, 'Influencer', 1250, 2, 'ui-design.png'),
(7, 'Grafiker', 1500, 2, 'creativity.png'),
(8, 'Autor', 2300, 4, 'editor.png'),
(9, 'Kundenberater', 3455, 6, 'headset.png');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `server_licenses`
--

CREATE TABLE `server_licenses` (
  `id` int(11) NOT NULL,
  `licCut` varchar(64) NOT NULL,
  `licName` varchar(64) NOT NULL,
  `licPrice` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `server_licenses`
--

INSERT INTO `server_licenses` (`id`, `licCut`, `licName`, `licPrice`) VALUES
(8, 'pkw', 'PKW', 2500);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `server_markers`
--

CREATE TABLE `server_markers` (
  `id` int(11) NOT NULL,
  `type` int(11) NOT NULL DEFAULT 1,
  `posX` float NOT NULL,
  `posY` float NOT NULL,
  `posZ` float NOT NULL,
  `scaleX` float NOT NULL,
  `scaleY` float NOT NULL,
  `scaleZ` float NOT NULL,
  `red` int(11) NOT NULL,
  `green` int(11) NOT NULL,
  `blue` int(11) NOT NULL,
  `alpha` int(11) NOT NULL DEFAULT 255,
  `bobUpAndDown` tinyint(1) NOT NULL DEFAULT 0,
  `kommentar` varchar(64) NOT NULL DEFAULT ' '
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `server_markers`
--

INSERT INTO `server_markers` (`id`, `type`, `posX`, `posY`, `posZ`, `scaleX`, `scaleY`, `scaleZ`, `red`, `green`, `blue`, `alpha`, `bobUpAndDown`, `kommentar`) VALUES
(1, 36, -567.568, -165.799, 38.069, 1, 1, 1, 242, 56, 46, 50, 1, 'Zulassungsstelle Fahrzeug');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `server_minijob_busdriver_routes`
--

CREATE TABLE `server_minijob_busdriver_routes` (
  `id` int(11) NOT NULL,
  `routeId` int(11) NOT NULL,
  `routeName` varchar(64) NOT NULL,
  `hash` bigint(64) UNSIGNED NOT NULL,
  `neededExp` int(11) NOT NULL,
  `givenExp` int(11) NOT NULL,
  `paycheck` int(11) NOT NULL,
  `neededTime` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `server_minijob_busdriver_routes`
--

INSERT INTO `server_minijob_busdriver_routes` (`id`, `routeId`, `routeName`, `hash`, `neededExp`, `givenExp`, `paycheck`, `neededTime`) VALUES
(1, 1, 'Linie 1 - Innenstadt', 3581397346, 0, 5, 200, '12 Minuten'),
(2, 2, 'Linie 2 - Innenstadt', 3581397346, 5, 10, 280, '15 Minuten'),
(3, 3, 'Linie 3 - Innenstadt', 3581397346, 0, 5, 0, '13 Minuten');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `server_minijob_busdriver_spots`
--

CREATE TABLE `server_minijob_busdriver_spots` (
  `id` int(11) NOT NULL,
  `routeId` int(11) NOT NULL,
  `spotId` int(11) NOT NULL,
  `posX` float NOT NULL,
  `posY` float NOT NULL,
  `posZ` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `server_minijob_busdriver_spots`
--

INSERT INTO `server_minijob_busdriver_spots` (`id`, `routeId`, `spotId`, `posX`, `posY`, `posZ`) VALUES
(1, 1, 1, 306.807, -765.519, 29.2055),
(2, 1, 2, 114.571, -784.056, 31.3008),
(3, 1, 3, 28.1131, -322.328, 45.3064),
(4, 1, 4, -38.1961, -108.155, 57.4176),
(5, 1, 5, -286.176, -23.5634, 48.9622),
(6, 1, 6, -503.769, 21.0123, 44.6884),
(7, 1, 7, -694.971, -7.47456, 38.1206),
(8, 1, 8, -929.042, -124.891, 37.5828),
(9, 1, 9, -1260.31, -311.016, 37.0287),
(10, 1, 10, -2316.79, 435.901, 174.467),
(11, 1, 11, -1263.88, -1040.74, 8.57769),
(12, 1, 12, -1212.62, -1218.7, 7.57564),
(13, 1, 13, -1167.84, -1472.22, 4.2886),
(14, 1, 14, -816.338, -1158.59, 7.82898),
(15, 1, 15, -558.111, -846.168, 27.4906),
(16, 1, 16, -249.104, -883.841, 30.5187),
(17, 1, 17, 355.975, -1064.73, 29.398),
(18, 2, 1, 306.807, -765.519, 29.2055),
(19, 2, 2, 355.975, -1064.73, 29.398),
(20, 2, 3, 788.568, -1369.49, 26.5344),
(21, 2, 4, 824.669, -1639.19, 30.2328),
(22, 2, 5, 879.052, -1767.07, 29.8785),
(23, 2, 6, -1035.19, -2729.82, 20.056),
(24, 2, 7, -740.278, -751.036, 26.7183),
(25, 2, 8, -1667.35, -541.689, 34.9868),
(26, 2, 9, -2316.79, 435.901, 174.467),
(27, 2, 10, -1419.22, -86.5848, 52.4089),
(28, 2, 11, -1206.16, -131.614, 40.8809),
(29, 2, 12, -680.456, -376.346, 34.2002),
(30, 2, 13, 938.265, 147.661, 80.8303),
(31, 3, 1, 938.265, 147.661, 80.8303),
(32, 3, 2, -173.229, -819.688, 31.0335),
(33, 3, 3, -271.002, -822.931, 31.723),
(34, 3, 4, -286.176, -23.5634, 48.9622),
(35, 3, 5, -503.769, 21.0123, 44.6884),
(36, 3, 6, -694.971, -7.47456, 38.1206),
(37, 3, 7, -929.042, -124.891, 37.5828),
(38, 3, 8, -1260.31, -311.016, 37.0287),
(39, 3, 9, -1419.22, -86.5848, 52.4089),
(40, 3, 10, -1206.16, -131.614, 40.8809),
(41, 3, 11, -680.456, -376.346, 34.2002),
(42, 3, 12, 355.975, -1064.73, 29.398),
(43, 3, 13, -108.725, -1687.01, 29.1899),
(44, 3, 14, -136.433, -1976.79, 22.8053),
(45, 3, 15, 440.376, -2030.9, 23.4762),
(46, 3, 16, 932.264, -1752.06, 31.0396),
(47, 3, 17, 807.181, -1352.87, 26.2612);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `server_minijob_garbage_spots`
--

CREATE TABLE `server_minijob_garbage_spots` (
  `id` int(11) NOT NULL,
  `routeId` int(11) NOT NULL,
  `spotId` int(11) NOT NULL,
  `posX` float NOT NULL,
  `posY` float NOT NULL,
  `posZ` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `server_minijob_garbage_spots`
--

INSERT INTO `server_minijob_garbage_spots` (`id`, `routeId`, `spotId`, `posX`, `posY`, `posZ`) VALUES
(1, 1, 1, -362.195, -1860.78, 20.5329),
(2, 1, 2, -361.679, -1864.89, 20.5281),
(3, 1, 3, -360.983, -1869.22, 20.528),
(4, 1, 4, -28.5535, -1641.7, 29.2901),
(5, 1, 5, -26.8333, -1639.69, 29.2942),
(6, 1, 6, 8.85564, -1597, 29.294),
(7, 1, 7, 115.643, -1576.16, 29.6025),
(8, 1, 8, 118.095, -1578.18, 29.6025),
(9, 1, 9, 139.947, -1590.69, 29.444),
(10, 1, 10, 138.698, -1592.48, 29.4149),
(11, 1, 11, 132.675, -1599, 29.4393),
(12, 1, 12, 109.841, -1746.13, 29.2037),
(13, 1, 13, 230.766, -1847.6, 26.8521),
(14, 1, 14, 153.701, -1974.44, 18.469),
(15, 1, 15, -149.074, -2022.88, 22.8675),
(16, 1, 16, -311.057, -1535.47, 27.8204),
(17, 1, 17, -312.003, -1537.37, 27.8464),
(18, 1, 18, -313.092, -1539.76, 27.8464),
(19, 1, 19, -313.999, -1541.49, 27.8475),
(20, 2, 1, -716.995, -1162.51, 10.6093),
(21, 2, 2, -714.206, -1133.83, 10.8126),
(22, 2, 3, -710.663, -1141.52, 10.8119),
(23, 2, 4, -708.869, -1139.88, 10.8126),
(24, 2, 5, -611.1, -1039.99, 22.2781),
(25, 2, 6, -608.506, -1040.04, 22.2781),
(26, 2, 7, -577.89, -981.487, 22.3736),
(27, 2, 8, -563.867, -974.348, 22.1781),
(28, 2, 9, -558.622, -977.081, 22.1781),
(29, 2, 10, -559.71, -821.888, 27.5424),
(30, 2, 11, -561.86, -821.908, 27.3926),
(31, 3, 1, -1112.94, -574.028, 31.8499),
(32, 3, 2, -1103.62, -568.451, 32.9835),
(33, 3, 3, -1102.36, -567.867, 33.1351),
(34, 3, 4, -1085.68, -554.218, 34.6005),
(35, 3, 5, -1087.84, -555.329, 34.5031),
(36, 3, 6, -1091.52, -545.529, 35.1669),
(37, 3, 7, -1073.83, -472.999, 36.6562),
(38, 3, 8, -1073.51, -471.502, 36.6495),
(39, 3, 9, -1089.32, -441.398, 36.5595),
(40, 3, 10, -1090.24, -439.898, 36.5591),
(41, 3, 11, -1093.66, -429.68, 36.6234),
(42, 3, 12, -1097.18, -494.884, 35.8617),
(43, 3, 13, -1132.12, -429.092, 36.2471),
(44, 3, 14, -1134.87, -429.878, 36.1793),
(45, 3, 15, -1138.04, -429.504, 36.153),
(46, 3, 16, -1156.66, -453.892, 34.737),
(47, 3, 17, -1172.67, -463.733, 33.9842),
(48, 3, 18, -1201.15, -473.593, 32.9471),
(49, 3, 19, -1219.88, -486.394, 31.9533),
(50, 3, 20, -1230.79, -495.247, 31.5968),
(51, 3, 21, -1232.3, -497.017, 31.5042),
(52, 3, 22, -1234.39, -497.907, 31.4747),
(53, 3, 23, -1226.61, -503.724, 30.6964),
(54, 3, 24, -1224.39, -505.424, 30.6155),
(55, 3, 25, -1222.17, -508.765, 30.4462),
(56, 3, 26, -1268.19, -650.871, 26.927),
(57, 3, 27, -1258.43, -663.525, 26.32),
(58, 3, 28, -1246.79, -678.935, 25.9936),
(59, 3, 29, -1244.68, -681.093, 25.9936),
(60, 3, 30, -1234.57, -689.993, 23.8637),
(61, 3, 31, -1234.32, -694.274, 23.6043),
(62, 3, 32, -1207.81, -726.692, 21.4212),
(63, 3, 33, -1207.81, -726.692, 21.4212),
(64, 3, 34, -1181.74, -749.098, 19.7007),
(65, 3, 35, -1178.54, -748.575, 19.6208),
(66, 3, 36, -1169.86, -754.026, 19.1153),
(67, 3, 37, -1167.41, -754.27, 19.0406),
(68, 3, 38, -1165.41, -753.644, 19.0343),
(69, 4, 1, -1264.36, -270.204, 38.897),
(70, 4, 2, -1266.83, -271.22, 38.8227),
(71, 4, 3, -1270.64, -288.724, 37.7099),
(72, 4, 4, -1280.08, -281.466, 38.1769),
(73, 4, 5, -1281.16, -279.768, 38.2796),
(74, 4, 6, -1295.01, -280.762, 38.799),
(75, 4, 7, -1297.53, -282.275, 38.8345),
(76, 4, 8, -1309.1, -280.16, 39.6457),
(77, 4, 9, -1506.6, -200.614, 51.8939),
(78, 4, 10, -1504.82, -199.441, 51.3669),
(79, 4, 11, -1501.02, -188.142, 50.3971),
(80, 4, 12, -1499.26, -186.713, 50.3975),
(81, 4, 13, -1610.53, -506.328, 35.5416),
(82, 4, 14, -1510, -660.951, 29.1673),
(83, 4, 15, -1507.81, -659.307, 29.2381),
(84, 4, 16, -1460.92, -627.183, 30.7878),
(85, 4, 17, -1345.24, -556.055, 30.4522),
(86, 5, 1, -1179.51, 721.629, 151.182),
(87, 5, 2, -1178.21, 722.411, 151.6),
(88, 5, 3, -1178, 723.122, 151.511),
(89, 5, 4, -1177.45, 723.703, 151.58),
(90, 5, 5, -1177.19, 724.376, 151.579),
(91, 5, 6, -1113.35, 775.003, 162.656),
(92, 5, 7, -814.383, 802.855, 202.186),
(93, 5, 8, -748.348, 814.813, 213.498),
(94, 5, 9, -591.472, 748.372, 183.723),
(95, 5, 10, -591.334, 746.677, 183.751),
(96, 5, 11, -619.908, 683.143, 149.929),
(97, 5, 12, -509.081, 575.301, 119.786),
(98, 5, 13, -541.424, 547.222, 110.946),
(99, 5, 14, -542.23, 547.937, 110.865),
(100, 5, 15, -557.51, 310.034, 83.7062),
(101, 5, 16, -557.773, 307.141, 83.754),
(102, 5, 17, -558.318, 295.103, 83.0249),
(103, 5, 18, -548.586, 297.238, 83.014),
(104, 5, 19, -547.141, 286.507, 83.0205),
(105, 6, 1, 800.462, -2040.97, 29.3438),
(106, 6, 2, 838.854, -1881.15, 29.0408),
(107, 6, 3, 840.258, -1879.34, 29.0277),
(108, 6, 4, 894.405, -1730.21, 30.3335),
(109, 6, 5, 916.768, -1781.68, 30.7939),
(110, 6, 6, 914.894, -1781.16, 30.7721),
(111, 6, 7, 975.205, -1813.81, 31.1373),
(112, 6, 8, 977.07, -1813.87, 31.1525),
(113, 6, 9, 972.602, -1829.97, 31.2849),
(114, 6, 10, 970.536, -1829.68, 31.268),
(115, 6, 11, 941.625, -1858.09, 31.164),
(116, 6, 12, 958.765, -1872.83, 31.0377),
(117, 6, 13, 959.172, -1870.6, 31.0227),
(118, 6, 14, 1001.1, -1878.97, 29.5125),
(119, 6, 15, 1002.95, -1876.6, 29.3342),
(120, 6, 16, 1011.54, -1896.37, 28.8697),
(121, 6, 17, 1013.21, -1896.34, 28.7347),
(122, 6, 18, 1055.35, -1888.84, 30.1339),
(123, 6, 19, 1053.82, -1889.4, 29.9371),
(124, 6, 20, 1041.75, -2162.08, 31.53),
(125, 6, 21, 1039.16, -2162.01, 31.5334),
(126, 6, 22, 1038.7, -2183.35, 31.4712),
(127, 6, 23, 1038.11, -2186.18, 31.5124),
(128, 6, 24, 1061.26, -2210.88, 30.3831),
(129, 6, 25, 1060.91, -2209.46, 30.4116),
(130, 6, 26, 1051.35, -2389.5, 30.34),
(131, 6, 27, 1048.65, -2423.41, 30.3045),
(132, 6, 28, 1048.58, -2424.87, 30.3045),
(133, 6, 29, 1047.98, -2431.08, 30.3045),
(134, 7, 1, -1097.74, -1364.04, 5.20405),
(135, 7, 2, -1131.24, -1414.89, 5.15277),
(136, 7, 3, -1000.79, -1461.65, 4.97492),
(137, 7, 4, -1001.15, -1463.56, 4.9803),
(138, 7, 5, -1076.39, -1499.61, 5.10437),
(139, 7, 6, -1077.39, -1498.24, 5.10536),
(140, 7, 7, -1032.86, -1565.26, 5.12903),
(141, 7, 8, -1031.64, -1567.07, 5.13764),
(142, 7, 9, -1023.34, -1576.45, 5.193),
(143, 7, 10, -1022.5, -1587.25, 5.16062),
(144, 7, 11, -1024.64, -1588.85, 5.16333),
(145, 7, 12, -1026.44, -1590.21, 5.15448),
(146, 7, 13, -1054.19, -1609.51, 4.39747),
(147, 7, 14, -1113.07, -1526.72, 4.383),
(148, 7, 15, -1123.71, -1514.32, 4.38517),
(149, 7, 16, -1161.41, -1456.21, 4.33919),
(150, 7, 17, -1251.55, -1280.8, 4.01352),
(151, 7, 18, -1277.34, -1210.6, 4.7201),
(152, 7, 19, -1291.5, -1149.91, 5.51262),
(153, 7, 20, -1147.6, -955.288, 2.65941),
(154, 7, 21, -1127.34, -943.712, 2.64086),
(155, 7, 22, -1072, -1027.8, 2.09414),
(156, 7, 23, -1018.97, -1118.61, 2.13532),
(157, 8, 1, 480.903, -1448.59, 29.1466),
(158, 8, 2, 483.326, -1448.65, 29.2958),
(159, 8, 3, 490.476, -998.9, 27.7847),
(160, 8, 4, 468.794, -948.467, 27.8024),
(161, 8, 5, 466.095, -948.365, 27.9149),
(162, 8, 6, 412.638, -797.091, 29.2954),
(163, 8, 7, 412.277, -794.311, 29.1329),
(164, 8, 8, 425.082, -685.016, 29.2839),
(165, 8, 9, 311.781, -739.833, 29.3114),
(166, 8, 10, 291.842, -809.01, 29.3693),
(167, 8, 11, 243.844, -825.063, 29.9532),
(168, 8, 12, 242.152, -824.278, 29.9972),
(169, 8, 13, 238.937, -681.446, 37.2969),
(170, 8, 14, 250.163, -661.095, 38.461),
(171, 8, 15, -359.438, -641.795, 31.715),
(172, 8, 16, -562.478, -707.56, 33.0092),
(173, 8, 17, -561.534, -709.912, 32.9822),
(174, 8, 18, -515.92, -811.615, 30.4858),
(175, 8, 19, -515.875, -813.583, 30.4828),
(176, 8, 20, -517.972, -870.407, 29.1367),
(177, 8, 21, -518.026, -868.114, 29.3268);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `server_peds`
--

CREATE TABLE `server_peds` (
  `id` int(11) NOT NULL,
  `model` varchar(64) NOT NULL,
  `posX` float NOT NULL,
  `posY` float NOT NULL,
  `posZ` float NOT NULL,
  `rotation` float NOT NULL,
  `kommentar` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `server_peds`
--

INSERT INTO `server_peds` (`id`, `model`, `posX`, `posY`, `posZ`, `rotation`, `kommentar`) VALUES
(1, 'a_f_y_business_01', -111, 6470.14, 30.6267, 136.17, ''),
(2, 'a_f_y_business_01', -1310.15, -821.906, 16.1482, -141.641, 'Maze Bank'),
(3, 'a_f_y_business_01', -1311.61, -823.102, 16.1483, -144.838, 'Maze Bank'),
(4, 'a_f_y_business_01', -1308.59, -820.841, 16.1483, -140.431, 'Maze Bank'),
(5, 's_m_y_airworker', -582.936, -194.511, 37.3247, 34.3664, 'Zulassungsstelle'),
(6, 'ig_andreas', -555.468, -228.237, 37.1597, -63, 'Einwohnermeldeamt');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `server_shops`
--

CREATE TABLE `server_shops` (
  `shopid` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `posX` float NOT NULL DEFAULT 0,
  `posY` float NOT NULL DEFAULT 0,
  `posZ` float NOT NULL DEFAULT 0,
  `pedX` float NOT NULL,
  `pedY` float NOT NULL,
  `pedZ` float NOT NULL,
  `pedRot` float NOT NULL,
  `pedModel` varchar(64) NOT NULL,
  `neededLicense` varchar(64) NOT NULL DEFAULT 'None',
  `isOnlySelling` tinyint(1) NOT NULL,
  `isBlipVisible` tinyint(1) NOT NULL,
  `faction` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `server_shops`
--

INSERT INTO `server_shops` (`shopid`, `name`, `posX`, `posY`, `posZ`, `pedX`, `pedY`, `pedZ`, `pedRot`, `pedModel`, `neededLicense`, `isOnlySelling`, `isBlipVisible`, `faction`) VALUES
(1, '24-7 Supermarket', 374.304, 327.894, 103.566, 372.804, 328.008, 102.566, 0, 's_f_y_shop_low', 'None', 0, 1, 0),
(2, '24-7 Supermarket', 25.7966, -1345.41, 29.497, 24.3966, -1345.41, 28.7966, 0, 's_f_y_shop_low', 'None', 0, 1, 0),
(3, 'Limited LTD Gasoline', -707.56, -912.718, 19.2156, -706.06, -912.718, 18.2156, 0, 'a_m_y_polynesian_01', 'None', 0, 1, 0),
(4, 'Limited LTD Gasoline', -47.2591, -1756.55, 29.421, -47.2591, -1756.55, 28.421, 0, 'a_m_y_polynesian_01', 'None', 0, 1, 0),
(5, 'Limited LTD Gasoline', 1163.29, -322.133, 69.205, 1165.29, -322.133, 68.205, 0, 'a_m_y_polynesian_01', 'None', 0, 1, 0),
(6, '24-7 Supermarket', 2555.61, 382.161, 108.623, 2555.61, 382.161, 107.623, 0, 's_f_y_shop_low', 'None', 0, 1, 0),
(7, '24-7 Supermarket', 2677.24, 3281.31, 55.2411, 2677.24, 3281.31, 2676.24, 0, 's_f_y_shop_low', 'None', 0, 1, 0),
(8, '24-7 Supermarket', 1729.79, 6416.12, 35.0372, 1728.79, 6417.17, 35.025, 0, 's_f_y_shop_low', 'None', 0, 1, 0),
(9, '24-7 Supermarket', -3243.93, 1001.4, 12.8307, -3243.93, 999.9, 11.8207, 0, 's_f_y_shop_low', 'None', 0, 1, 0),
(10, '24-7 Supermarket', -3040.97, 585.163, 7.90893, -3040.97, 585.163, -3039.97, 0, 's_f_y_shop_low', 'None', 0, 1, 0),
(11, 'Limited LTD Gasoline', -1821.64, 793.945, 138.117, -1820.57, 794.756, 138.079, -2.2263, 'a_m_y_polynesian_01', 'None', 0, 1, 0),
(12, '24-7 Supermarket', 548.037, 2669.37, 42.1565, 549.037, 2668.37, 42.1565, 0, 's_f_y_shop_low', 'None', 0, 1, 0),
(13, '24-7 Supermarket', 1960.29, 3742.23, 32.3437, 1959.22, 3741.51, 31.3297, -63.5248, 's_f_y_shop_low', 'None', 0, 1, 0),
(14, 'Limited LTD Gasoline', 1699.37, 4923.52, 42.0637, 1699.37, 4923.52, 1698.37, 0, 'a_m_y_polynesian_01', 'None', 0, 1, 0),
(15, 'Sand', 2580.99, 464.772, 108.625, 2580.99, 464.772, 107.625, -179.76, 's_m_y_construct_01', 'None', 1, 1, 0),
(17, 'Kleiderladen Vinewood', 122.185, -217.992, 54.5579, 126.898, -224.288, 53.5578, 70.6203, 's_f_y_shop_low', 'None', 0, 1, 0),
(18, 'LSPD Waffenkammer', 452.453, -980.174, 30.6893, 454.292, -980.05, 29.6896, 80.6786, 'mp_s_m_armoured_01', 'None', 0, 1, 0),
(19, 'LSPD Kleiderschrank', 449.945, -993.155, 30.6893, 449.945, -993.155, 29.6893, -47.1952, 's_f_y_cop_01', 'None', 0, 1, 0),
(20, 'Würfelpark Kleidungsladen', 425.182, -806.321, 29.3821, 427.266, -806.44, 28.3821, -1.38527, 'a_m_y_polynesian_01', 'None', 0, 1, 0),
(21, 'Tomaten', 2548.58, 2581.32, 37.9407, 2548.58, 2581.32, 36.9407, 82.5872, 'cs_marnie', 'None', 1, 1, 0),
(22, 'Trauben', -3204.14, 1198.3, 9.53, -3204.14, 1198.3, 8.53, 8.53, 'u_m_y_chip', 'None', 1, 1, 0),
(23, 'Mais', 1552.14, 2190.21, 78.8352, 1552.14, 2190.21, 77.8352, 0, 'a_m_m_farmer_01', 'None', 1, 1, 0),
(24, 'Baumarkt', 2747.55, 3473.21, 55.6666, 2747.55, 3473.21, 54.6666, -112.997, 'a_m_m_farmer_01', 'None', 0, 1, 0),
(25, 'Ballas Waffenkammer', 75.6659, -1970.18, 21.1245, 75.6659, -1970.18, 20.1245, -2.62212, 'csb_ballasog', 'None', 0, 1, 0),
(26, 'Yakuza Waffenkammer', -1564.87, 775.767, 189.185, -1564.87, 775.767, 188.185, 2.67159, 's_f_y_shop_low', 'None', 0, 1, 0),
(27, 'Flughafenshop', -1041.45, -2747.67, 20.3436, -1041.45, -2747.67, 20.3436, 0, 's_f_y_shop_low', 'None', 0, 1, 0),
(28, 'Flughafen Kleidungsshop', -1044.65, -2746.1, 20.3436, -1044.65, -2746.1, 20.3436, 0, 's_f_y_shop_low', 'None', 0, 1, 0),
(29, 'GF Waffenkammer', 1392.65, -607.635, 74.3363, 1392.65, -607.635, 71.3363, -0.8, 'g_m_y_famca_01', 'None', 0, 1, 0),
(30, 'LSFD Kleiderschrank', 299.076, -598.958, 43, 299.076, -598.958, 33, 1.1, 'g_m_y_famca_01', 'None', 0, 1, 0),
(31, 'LSFD Waffenkammer', 306.079, -597.284, 43.2821, 306.079, -597.284, 33.2821, 0.2, 'g_m_y_famca_01', 'None', 0, 1, 0),
(32, 'Verkaufer1', 737.684, -743.987, 26.3817, 737.684, -743.987, 26.3817, 0, 'g_m_y_famca_01', 'None', 1, 1, 0),
(33, 'Verkaufer2', -1422.5, 4212.95, 45.641, -1422.5, 4212.95, 45.641, 0.593687, 'g_m_y_famca_01', 'None', 1, 1, 0),
(34, 'Verkaufer3', 1919.89, 603.6, 181.366, 1919.89, 603.6, 181.366, -1.23685, 'g_m_y_famca_01', 'None', 1, 1, 0),
(35, 'Ammunation Würfelpark', 20.6769, -1106.93, 29.7854, 21.389, -1105.02, 28.7854, -2.77053, 's_m_y_ammucity_01', 'None', 0, 1, 0),
(36, 'Ammunation - West-Hwy', -3172.59, 1086.26, 20.8381, -3174.03, 1087.69, 19.8381, 1.92948, 's_m_y_ammucity_01', 'None', 0, 1, 0),
(37, 'ACLS Kleiderschrank', 371.512, -1612.58, 28.2799, 371.512, -1612.58, 28.2799, 0.6, 's_m_y_airworker', 'None', 0, 1, 0),
(38, 'ACLS Waffenkammer', 372.224, -1627.48, 28.2799, 372.224, -1627.48, 28.2799, -0.2, 's_m_y_airworker', 'None', 0, 1, 0),
(39, 'LCN Waffenkammer', -1536.25, 98.2154, 56.762, -1536.25, 98.2154, 56.762, -2.3, 's_m_y_airworker', 'None', 0, 1, 0),
(40, 'Verkaufer4', 5.23517, 2118.11, 129.132, 5.23517, 2118.11, 128.132, 0, 'g_m_y_famca_01', 'None', 1, 1, 0),
(41, 'BG Waffenkammer', -1888.28, 2050.38, 140.977, -1888.28, 2050.38, 139.977, 2.7, 'g_m_y_famca_01', 'None', 0, 1, 0),
(42, 'FIB Waffenschrank', 118.244, -729.36, 242, 118.244, -729.36, 241, 0, 's_m_m_fiboffice_01', 'None', 0, 1, 0),
(43, 'FIB Kleiderschrank', 127.486, -727.258, 242, 127.486, -727.258, 241, 0, 's_m_m_fiboffice_01', 'None', 0, 1, 0),
(44, 'Crips Waffenkammer', 325.16, -2050.47, 20.9224, 325.16, -2050.47, 20.9224, 0, 'csb_ballasog', 'None', 0, 1, 0),
(45, 'Verkaufer5', 809.719, -490.656, 30.62, 809.719, -490.656, 30.62, 0, 'g_m_y_famca_01', 'None', 1, 1, 0),
(46, 'Verkaufer6', -45.2184, -1289.98, 29.194, -45.2184, -1289.98, 29.194, 0, 'g_m_y_famca_01', 'None', 1, 1, 0);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `server_shop_items`
--

CREATE TABLE `server_shop_items` (
  `id` int(11) NOT NULL,
  `shopid` int(11) NOT NULL,
  `itemName` varchar(128) NOT NULL,
  `itemAmount` int(11) NOT NULL,
  `itemPrice` int(11) NOT NULL,
  `itemGender` int(11) NOT NULL DEFAULT 2 COMMENT '0: male | 1: female | 2: universal'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `server_shop_items`
--

INSERT INTO `server_shop_items` (`id`, `shopid`, `itemName`, `itemAmount`, `itemPrice`, `itemGender`) VALUES
(1, 1, 'Bagel', 20, 5, 2),
(2, 1, 'BonBon', 20, 2, 2),
(3, 1, 'Chips', 20, 4, 2),
(4, 1, 'Donut', 20, 2, 2),
(5, 1, 'Eis', 20, 1, 2),
(6, 1, 'HotDog', 20, 5, 2),
(7, 1, 'Müsli-Riegel', 20, 2, 2),
(8, 1, 'Sandwich', 20, 4, 2),
(9, 1, 'Schokolade', 20, 3, 2),
(10, 1, 'Wrap', 20, 4, 2),
(11, 2, 'Bagel', 20, 5, 2),
(12, 2, 'BonBon', 20, 2, 2),
(13, 2, 'Chips', 20, 4, 2),
(14, 2, 'Donut', 20, 2, 2),
(15, 2, 'Eis', 20, 1, 2),
(16, 2, 'HotDog', 20, 5, 2),
(17, 2, 'Müsli-Riegel', 20, 2, 2),
(18, 2, 'Sandwich', 20, 4, 2),
(19, 2, 'Schokolade', 20, 3, 2),
(20, 2, 'Wrap', 20, 4, 2),
(21, 3, 'Bagel', 20, 5, 2),
(22, 3, 'BonBon', 20, 2, 2),
(23, 3, 'Chips', 20, 4, 2),
(24, 3, 'Donut', 20, 2, 2),
(25, 3, 'Eis', 20, 1, 2),
(26, 3, 'HotDog', 20, 5, 2),
(27, 3, 'Müsli-Riegel', 20, 2, 2),
(28, 3, 'Sandwich', 20, 4, 2),
(29, 3, 'Schokolade', 20, 3, 2),
(30, 3, 'Wrap', 20, 4, 2),
(31, 4, 'Bagel', 20, 5, 2),
(32, 4, 'BonBon', 20, 2, 2),
(33, 4, 'Chips', 20, 4, 2),
(34, 4, 'Donut', 20, 2, 2),
(35, 4, 'Eis', 20, 1, 2),
(36, 4, 'HotDog', 20, 5, 2),
(37, 4, 'Müsli-Riegel', 20, 2, 2),
(38, 4, 'Sandwich', 20, 4, 2),
(39, 4, 'Schokolade', 20, 3, 2),
(40, 4, 'Wrap', 20, 4, 2),
(41, 5, 'Bagel', 20, 5, 2),
(42, 5, 'BonBon', 20, 2, 2),
(43, 5, 'Chips', 20, 4, 2),
(44, 5, 'Donut', 20, 2, 2),
(45, 5, 'Eis', 20, 1, 2),
(46, 5, 'HotDog', 20, 5, 2),
(47, 5, 'Müsli-Riegel', 20, 2, 2),
(48, 5, 'Sandwich', 20, 4, 2),
(49, 5, 'Schokolade', 20, 3, 2),
(50, 5, 'Wrap', 20, 4, 2),
(51, 6, 'Bagel', 20, 5, 2),
(52, 6, 'BonBon', 20, 2, 2),
(53, 6, 'Chips', 20, 4, 2),
(54, 6, 'Donut', 20, 2, 2),
(55, 6, 'Eis', 20, 1, 2),
(56, 6, 'HotDog', 20, 5, 2),
(57, 6, 'Müsli-Riegel', 20, 2, 2),
(58, 6, 'Sandwich', 20, 4, 2),
(59, 6, 'Schokolade', 20, 3, 2),
(60, 6, 'Wrap', 20, 4, 2),
(61, 7, 'Bagel', 20, 5, 2),
(62, 7, 'BonBon', 20, 2, 2),
(63, 7, 'Chips', 20, 4, 2),
(64, 7, 'Donut', 20, 2, 2),
(65, 7, 'Eis', 20, 1, 2),
(66, 7, 'HotDog', 20, 5, 2),
(67, 7, 'Müsli-Riegel', 20, 2, 2),
(68, 7, 'Sandwich', 20, 4, 2),
(69, 7, 'Schokolade', 20, 3, 2),
(70, 7, 'Wrap', 20, 4, 2),
(71, 8, 'Bagel', 20, 5, 2),
(72, 8, 'BonBon', 20, 2, 2),
(73, 8, 'Chips', 20, 4, 2),
(74, 8, 'Donut', 20, 2, 2),
(75, 8, 'Eis', 20, 1, 2),
(76, 8, 'HotDog', 20, 5, 2),
(77, 8, 'Müsli-Riegel', 20, 2, 2),
(78, 8, 'Sandwich', 20, 4, 2),
(79, 8, 'Schokolade', 20, 3, 2),
(80, 8, 'Wrap', 20, 4, 2),
(81, 9, 'Bagel', 20, 5, 2),
(82, 9, 'BonBon', 20, 2, 2),
(83, 9, 'Chips', 20, 4, 2),
(84, 9, 'Donut', 20, 2, 2),
(85, 9, 'Eis', 20, 1, 2),
(86, 9, 'HotDog', 20, 5, 2),
(87, 9, 'Müsli-Riegel', 20, 2, 2),
(88, 9, 'Sandwich', 20, 4, 2),
(89, 9, 'Schokolade', 20, 3, 2),
(90, 9, 'Wrap', 20, 4, 2),
(91, 10, 'Bagel', 20, 5, 2),
(92, 10, 'BonBon', 20, 2, 2),
(93, 10, 'Chips', 20, 4, 2),
(94, 10, 'Donut', 20, 2, 2),
(95, 10, 'Eis', 20, 1, 2),
(96, 10, 'HotDog', 20, 5, 2),
(97, 10, 'Müsli-Riegel', 20, 2, 2),
(98, 10, 'Sandwich', 20, 4, 2),
(99, 10, 'Schokolade', 20, 3, 2),
(100, 10, 'Wrap', 20, 4, 2),
(101, 11, 'Bagel', 20, 5, 2),
(102, 11, 'BonBon', 20, 2, 2),
(103, 11, 'Chips', 20, 4, 2),
(104, 11, 'Donut', 20, 2, 2),
(105, 11, 'Eis', 20, 1, 2),
(106, 11, 'HotDog', 20, 5, 2),
(107, 11, 'Müsli-Riegel', 20, 2, 2),
(108, 11, 'Sandwich', 20, 4, 2),
(109, 11, 'Schokolade', 20, 3, 2),
(110, 11, 'Wrap', 20, 4, 2),
(111, 12, 'Bagel', 20, 5, 2),
(112, 12, 'BonBon', 20, 2, 2),
(113, 12, 'Chips', 20, 4, 2),
(114, 12, 'Donut', 20, 2, 2),
(115, 12, 'Eis', 20, 1, 2),
(116, 12, 'HotDog', 20, 5, 2),
(117, 12, 'Müsli-Riegel', 20, 2, 2),
(118, 12, 'Sandwich', 20, 4, 2),
(119, 12, 'Schokolade', 20, 3, 2),
(120, 12, 'Wrap', 20, 4, 2),
(121, 13, 'Bagel', 20, 5, 2),
(122, 13, 'BonBon', 20, 2, 2),
(123, 13, 'Chips', 20, 4, 2),
(124, 13, 'Donut', 20, 2, 2),
(125, 13, 'Eis', 20, 1, 2),
(126, 13, 'HotDog', 20, 5, 2),
(127, 13, 'Müsli-Riegel', 20, 2, 2),
(128, 13, 'Sandwich', 20, 4, 2),
(129, 13, 'Schokolade', 20, 3, 2),
(130, 13, 'Wrap', 20, 4, 2),
(131, 14, 'Bagel', 20, 5, 2),
(132, 14, 'BonBon', 20, 2, 2),
(133, 14, 'Chips', 20, 4, 2),
(134, 14, 'Donut', 20, 2, 2),
(135, 14, 'Eis', 20, 1, 2),
(136, 14, 'HotDog', 20, 5, 2),
(137, 14, 'Müsli-Riegel', 20, 2, 2),
(138, 14, 'Sandwich', 20, 4, 2),
(139, 14, 'Schokolade', 20, 3, 2),
(140, 14, 'Wrap', 20, 4, 2),
(141, 15, 'Glasscheibe', 2, 55, 2),
(142, 1, 'Tablet', 1, 5, 2),
(143, 18, 'Cal50 Pistole', 3, 10, 2),
(144, 18, 'Cal50 Pistolen Munitionsbox', 5, 5, 2),
(145, 18, 'Generalschluessel LSPD', 2, 5, 2),
(146, 18, 'Handschellen', 2, 5, 2),
(147, 18, 'Handschellenschluessel', 2, 5, 2),
(148, 1, 'Seil', 5, 2, 2),
(149, 2, 'Seil', 5, 2, 2),
(150, 3, 'Seil', 5, 2, 2),
(151, 4, 'Seil', 5, 2, 2),
(152, 5, 'Seil', 5, 2, 2),
(153, 6, 'Seil', 5, 2, 2),
(154, 7, 'Seil', 5, 2, 2),
(155, 8, 'Seil', 5, 2, 2),
(156, 9, 'Seil', 5, 2, 2),
(157, 10, 'Seil', 5, 2, 2),
(158, 11, 'Seil', 5, 2, 2),
(159, 12, 'Seil', 5, 2, 2),
(160, 13, 'Seil', 5, 2, 2),
(161, 14, 'Seil', 5, 2, 2),
(162, 18, 'Fahrzeugschluessel LSPD', 1, 5, 2),
(163, 20, 'Rosa Schweine-Maske', 1, 50, 2),
(164, 20, 'Braune Schweine-Maske', 1, 50, 2),
(165, 20, 'Graue Totenkopf-Maske', 1, 50, 2),
(166, 20, 'Beige Totenkopf-Maske', 1, 50, 2),
(167, 20, 'Affen-Maske mit Zigarre', 1, 50, 2),
(168, 20, 'Weiß-Rote Baseball-Maske', 1, 50, 2),
(169, 20, 'Rote Baseball-Maske', 1, 50, 2),
(170, 20, 'Braune-Affenmaske', 1, 50, 2),
(171, 20, 'Dunkelbraune-Affenmaske', 1, 50, 2),
(172, 20, 'Gruene-Affenmaske', 1, 50, 2),
(173, 20, 'Weise-Affenmaske', 1, 50, 2),
(174, 20, 'Rot-Gelbe Kunstmaske', 1, 50, 2),
(175, 20, 'Schwarz-Weise Kunstmaske', 1, 50, 2),
(176, 20, 'Blaue Kunstmaske', 1, 50, 2),
(177, 20, 'Schwarz-Rote Kunstmaske', 1, 50, 2),
(178, 20, 'Braune Devil-Maske', 1, 50, 2),
(179, 20, 'Rote Devil-Maske', 1, 50, 2),
(180, 20, 'Schwarze Devil-Maske', 1, 50, 2),
(181, 20, 'Graue Devil-Maske', 1, 50, 2),
(182, 20, 'Weise Weihnachsmann-Maske', 1, 50, 2),
(183, 20, 'Schwarze Weihnachtsmann-Maske', 1, 50, 2),
(184, 20, 'Braune Weihnachtsmann-Maske', 1, 50, 2),
(185, 20, 'Rentier-Maske', 1, 50, 2),
(186, 20, 'Schneemann-Maske', 1, 50, 2),
(187, 20, 'Weise Erotik-Maske', 1, 50, 2),
(188, 20, 'Rote Erotik-Maske', 1, 50, 2),
(189, 20, 'Schwarze Erotik-Maske', 1, 50, 2),
(190, 20, 'Beige Venezianische-Maske', 1, 50, 2),
(191, 20, 'Weise Venezianische-Maske', 1, 50, 2),
(192, 20, 'Schwarze Venezianische-Maske', 1, 50, 2),
(193, 20, 'Engels-Maske', 1, 50, 2),
(194, 20, 'Blaue Baseball-Maske', 1, 50, 2),
(195, 20, 'Vinewood Baseball-Maske', 1, 50, 2),
(196, 20, 'Schwarze Totenkopf Baseball-Maske', 1, 50, 2),
(197, 20, 'Braune getakerte Baseball-Maske', 1, 50, 2),
(198, 20, 'Beige getakerte Baseball-Maske', 1, 50, 2),
(199, 20, 'Schwarz-Gelb-Weise Baseball-Maske', 1, 50, 2),
(200, 20, 'Graue Eisen-Maske', 1, 50, 2),
(201, 20, 'Gruene Eisen-Maske', 1, 50, 2),
(202, 20, 'Schwarz-Orangene Eisen-Maske', 1, 50, 2),
(203, 20, 'Lila Eisen-Maske', 1, 50, 2),
(204, 20, 'Schwarze Eisenmaske', 1, 50, 2),
(205, 20, 'Graue Katzen-Maske', 1, 50, 2),
(206, 20, 'Katzen-Maske', 1, 50, 2),
(207, 20, 'Fuchs-Maske', 1, 50, 2),
(208, 20, 'Braune Fuchs-Maske', 1, 50, 2),
(209, 20, 'Braune Eulen-Maske', 1, 50, 2),
(210, 20, 'Weise Eulen-Maske', 1, 50, 2),
(211, 20, 'Waschbaeren-Maske', 1, 50, 2),
(212, 20, 'Graue Waschbaeren-Maske', 1, 50, 2),
(213, 20, 'Braune Baeren-Maske', 1, 50, 2),
(214, 20, 'Weise Baeren-Maske', 1, 50, 2),
(215, 20, 'Dunkelbraune Bullen-Maske', 1, 50, 2),
(216, 20, 'Braune Bullen-Maske', 1, 50, 2),
(217, 20, 'Schwarze Stier-Maske', 1, 50, 2),
(218, 20, 'Braube Stier-Maske', 1, 50, 2),
(219, 20, 'Braune Adler-Maske', 1, 50, 2),
(220, 20, 'Weise Adler-Maske', 1, 50, 2),
(221, 20, 'Rosa Geier-Maske', 1, 50, 2),
(222, 20, 'Schwarze Geier-Maske', 1, 50, 2),
(223, 20, 'Braune Wolfs-Maske', 1, 50, 2),
(224, 20, 'Schwarze Wolfs-Maske', 1, 50, 2),
(225, 20, 'Fliegermaske', 1, 50, 2),
(226, 20, 'NOOSE-Maske', 1, 50, 2),
(227, 20, 'Graue NOOSE-Maske', 1, 50, 2),
(228, 20, 'Schwarze Totenkopfmaske mit Gummi', 1, 50, 2),
(229, 20, 'Graue Totenkopfmaske mit Gummi', 1, 50, 2),
(230, 20, 'Dunkelgraue Totenkopfmaske mit Gummi', 1, 50, 2),
(231, 20, 'Beige Totenkopfmaske mit Gummi', 1, 50, 2),
(232, 20, 'Gruene Totenkopfmaske mit Gummi', 1, 50, 2),
(233, 20, 'Pleas-Stop Baseball-Maske', 1, 50, 2),
(234, 20, 'Pinguin-Maske', 1, 50, 2),
(235, 20, 'Strumpf-Maske', 1, 50, 2),
(236, 20, 'Freundliche Keks-Maske', 1, 50, 2),
(237, 20, 'Weise Opa-Maske', 1, 50, 2),
(238, 20, 'Schwarze Opa-Maske', 1, 50, 2),
(239, 20, 'SWAT-Sturmhaube', 1, 50, 2),
(240, 20, 'Atemschutz-Maske', 1, 50, 2),
(241, 20, 'Schwarze Socken-Maske', 1, 50, 2),
(242, 20, 'Tauchermaske', 1, 50, 2),
(243, 20, 'Helle Zombie-Maske', 1, 50, 2),
(244, 20, 'Dunkle Zombie-Maske', 1, 50, 2),
(245, 20, 'Beige Mumien-Maske', 1, 50, 2),
(246, 20, 'Gruene Mumien-Maske', 1, 50, 2),
(247, 20, 'Vampier-Maske', 1, 50, 2),
(248, 20, 'Blaue Vampier-Maske', 1, 50, 2),
(249, 20, 'Helle Frankenstein-Maske', 1, 50, 2),
(250, 20, 'Graue Frankenstein-Maske', 1, 50, 2),
(251, 20, 'King Crimson-Maske', 1, 50, 2),
(252, 20, 'Anime-Maske', 1, 50, 2),
(253, 20, 'Detektiv-Maske', 1, 50, 2),
(254, 20, 'Gasmaske', 1, 50, 2),
(255, 20, 'Crime Abspeerband', 1, 50, 2),
(256, 20, 'Pfeil Abspeerband', 1, 50, 2),
(257, 20, 'Graues Klebeband', 1, 50, 2),
(258, 20, 'Schwarzes Klebeband', 1, 50, 2),
(259, 20, 'Weises Klebeband', 1, 50, 2),
(260, 20, 'Buntes Klebeband', 1, 50, 2),
(261, 20, 'Papiertueten-Maske', 1, 50, 2),
(262, 20, 'Grinsende Papiertueten-Maske', 1, 50, 2),
(263, 20, 'Weinende Papiertueten-Maske', 1, 50, 2),
(264, 20, 'Mund Papiertueten-Maske', 1, 50, 2),
(265, 20, 'Katzen Paiertueten-Maske', 1, 50, 2),
(266, 20, 'Gruene Gesichtsmaske', 1, 50, 2),
(267, 20, 'Gesichtsmaske', 1, 50, 2),
(268, 20, 'Rosane Gesichtsmaske', 1, 50, 2),
(269, 20, 'Clown Gesichtsmaske', 1, 50, 2),
(270, 20, 'Schwarze Gesichtsmaske', 1, 50, 2),
(271, 20, 'Braune Gesichtsmaske', 1, 50, 2),
(272, 20, 'Gesichtsmaske mit schwarzen Augen', 1, 50, 2),
(273, 20, 'Erroetete Gesichtsmaske', 1, 50, 2),
(274, 20, 'Gesichtsmaske mit blauen Augen', 1, 50, 2),
(275, 20, 'Weis-Schwarze Gesichtsmaske', 1, 50, 2),
(276, 20, 'Ganz Schwarzes Bandana', 1, 25, 2),
(277, 20, 'Totenkopf Bandana', 1, 25, 2),
(278, 20, 'Graues Bandana', 1, 25, 2),
(279, 20, 'Beiges Bandana', 1, 25, 2),
(280, 20, 'Tarnfarbenes Bandana', 1, 25, 2),
(281, 20, 'Gruenes Bandana', 1, 25, 2),
(282, 20, 'Purple Bandana', 1, 25, 2),
(283, 20, 'Schwarzes Bandana', 1, 25, 2),
(284, 20, 'Gelbes Bandana', 1, 25, 2),
(285, 20, 'Elektro Totenkof Bandana', 1, 25, 2),
(286, 20, 'Schwarze Sturmhaube', 1, 35, 2),
(287, 20, 'Graue Sturmhaube', 1, 35, 2),
(288, 20, 'Weise Sturmhaube', 1, 35, 2),
(289, 20, 'Gruene Sturmhaube', 1, 35, 2),
(290, 20, 'Braune Sturmhaube', 1, 35, 2),
(291, 20, 'Dunkelgraue Sturmhaube', 1, 35, 2),
(292, 20, 'Tarnfarbene Sturmhaube', 1, 35, 2),
(293, 20, 'Graue-Tarn Sturmhaube', 1, 35, 2),
(294, 20, 'Blaue Sturmhaube', 1, 35, 2),
(295, 20, 'Gelbe Sturmhaube', 1, 35, 2),
(296, 20, 'Schwarze Sturmhaube mit Kaputze', 1, 35, 2),
(297, 20, 'Graue Sturmhaube mit Kaputze', 1, 35, 2),
(298, 20, 'Weise Stumhaube mit Kaputze', 1, 35, 2),
(299, 20, 'Gruene Sturmhaube mit Kaputze', 1, 35, 2),
(300, 20, 'Braune Sturmhaube mit Kaputze', 1, 35, 2),
(301, 20, 'Dunkelgraue Sturmhaube mit Kaputze', 1, 35, 2),
(302, 20, 'Tarn Sturmhaube mit Kaputze', 1, 35, 2),
(303, 20, 'Graue-Tarn Sturmhaube mit Kaputze', 1, 35, 2),
(304, 20, 'Schwarze Totenkopf Sturmhaube mit Kaputze', 1, 35, 2),
(305, 20, 'Schwarzes T-Shirtbandana', 1, 30, 2),
(306, 20, 'Weises T-Shirtbandana', 1, 30, 2),
(307, 20, 'Beiges T-Shirtbandana', 1, 30, 2),
(308, 20, 'Braunes T-Shirtbandana', 1, 30, 2),
(309, 20, 'Graues T-Shirtbandana', 1, 30, 2),
(310, 20, 'Armee T-Shirtbandana', 1, 30, 2),
(311, 20, 'Rot-Weises T-Shirtbandana', 1, 30, 2),
(312, 20, 'Dunkelbraunes T-Shirtbandana', 1, 30, 2),
(313, 20, 'Hellgraues T-Shirtbandana', 1, 30, 2),
(314, 20, 'Rosanes T-Shirtbandana', 1, 30, 2),
(315, 20, 'Schwarze Maske mit Gummizug', 1, 50, 2),
(316, 20, 'Braune Maske mit Gummizug', 1, 50, 2),
(317, 20, 'Blaue Lockere Sturmhaube', 1, 35, 2),
(318, 20, 'Schwarze lockere Sturmhaube', 1, 35, 2),
(319, 20, 'Lockere Sturmhaube mit Totenkopf', 1, 35, 2),
(320, 20, 'Schwarze Strickhaube', 1, 35, 2),
(321, 20, 'Gruene Strickhaube', 1, 35, 2),
(322, 20, 'Rostbraune Strickhaube', 1, 35, 2),
(323, 20, 'Graue Strickhaube', 1, 35, 2),
(324, 20, 'Braune Strickhaube', 1, 35, 2),
(325, 20, 'Bunte Strickhaube', 1, 35, 2),
(326, 20, 'Tarn Strickhaube', 1, 35, 2),
(327, 20, 'Beige Strickhaube', 1, 35, 2),
(328, 20, 'Rosane Strickhaube', 1, 35, 2),
(329, 20, 'Rot-Gruene Strickhaube', 1, 35, 2),
(330, 20, 'Schwarze Strickhaube mit SChiff', 1, 35, 2),
(331, 20, 'Schwarz-Weise Strickhaube', 1, 35, 2),
(332, 20, 'Gruen-Graue Strickhaube', 1, 35, 2),
(333, 20, 'Camo Strickhaube', 1, 35, 2),
(334, 20, 'Pinke Strickhaube', 1, 35, 2),
(335, 20, 'Oangene Flecken Strickhaube', 1, 35, 2),
(336, 20, 'RAGE Strickhaube', 1, 35, 2),
(337, 20, 'Affen Strickhaube', 1, 35, 2),
(338, 20, 'Hellblaue Strickhaube', 1, 35, 2),
(339, 20, 'Gelb-Schwarze Strickhaube', 1, 35, 2),
(340, 20, 'Rosa-Pinke Strickhaube', 1, 35, 2),
(341, 20, 'Werwolf-Maske', 1, 50, 2),
(342, 20, 'Kuerbis-Maske', 1, 50, 2),
(343, 20, 'Hellgruene Kuerbis-Maske', 1, 50, 2),
(344, 20, 'Gruene Kuerbis-Maske', 1, 50, 2),
(345, 20, 'Weise Opa Zombi-Maske', 1, 50, 2),
(346, 20, 'Graue Opa Zombie-Maske', 1, 50, 2),
(347, 20, 'Gruene Opa Zombie-Maske', 1, 50, 2),
(348, 20, 'Freddy-Maske', 1, 50, 2),
(349, 20, 'Blutverschmierte Freddy-Maske', 1, 50, 2),
(350, 20, 'Dunkle Freddy-Maske', 1, 50, 2),
(351, 20, 'Gehaeutete-Maske', 1, 50, 2),
(352, 20, 'Gruene Gehaeutete-Maske', 1, 50, 2),
(353, 20, 'Graue Gehaeutete-Maske', 1, 50, 2),
(354, 20, 'Totenkopfmaske mit Zunge', 1, 50, 2),
(355, 20, 'Gruene Totenkopfmaske mit Zunge', 1, 50, 2),
(356, 20, 'Dunkle Totenkopfmaske mit Zunge', 1, 50, 2),
(357, 20, 'Helle Werwolfmaske', 1, 50, 2),
(358, 20, 'Braune Werwolfmaske', 1, 50, 2),
(359, 20, 'Graue Werwolfmaske', 1, 50, 2),
(360, 20, 'Gruene Insektenmaske', 1, 50, 2),
(361, 20, 'Rote Insektenmaske', 1, 50, 2),
(362, 20, 'Lilane Insektenmaske', 1, 50, 2),
(363, 20, 'Graue Golummaske', 1, 50, 2),
(364, 20, 'Gruene Golummaske', 1, 50, 2),
(365, 20, 'Weise Golummaske', 1, 50, 2),
(366, 20, 'Rote Teufelmaske', 1, 50, 2),
(367, 20, 'Orangene Teufelmaske', 1, 50, 2),
(368, 20, 'Schwarze Teufelmaske', 1, 50, 2),
(369, 20, 'Beige Sack-Maske', 1, 50, 2),
(370, 20, 'Braune Sack-Maske', 1, 50, 2),
(371, 20, 'Schwarze Sack-Maske', 1, 50, 2),
(372, 20, 'Blaue Hypnosemaske', 1, 50, 2),
(373, 20, 'Gruene Hypnosemaske', 1, 50, 2),
(374, 20, 'Pinke Hypnosemaske', 1, 50, 2),
(375, 20, 'Gruene Hexenmaske', 1, 50, 2),
(376, 20, 'Weise Hexenmaske', 1, 50, 2),
(377, 20, 'Hexenmaske', 1, 50, 2),
(378, 20, 'Rote Teufelsmaske mit Bart', 1, 50, 2),
(379, 20, 'Orangene Teufelsmaske mit Bart', 1, 50, 2),
(380, 20, 'Schwarze Teufelsmaske mit Bart', 1, 50, 2),
(381, 20, 'Verbrannter wuetender Keks-Maske', 1, 50, 2),
(382, 20, 'Wuetender Keks-Maske', 1, 50, 2),
(383, 20, 'Weiser Weihnachtsmann mit Zigarre', 1, 50, 2),
(384, 20, 'Schwarzer Weihnachtsmann mit Zigarre', 1, 50, 2),
(385, 20, 'Brauner Weihnachtsmann mit Zigarre', 1, 50, 2),
(386, 20, 'Tannenbaum-Maske', 1, 50, 2),
(387, 20, 'Werwolfmaske mit Cap', 1, 50, 2),
(388, 20, 'Werwolfmaske mit Weihnachtsmuetze', 1, 50, 2),
(389, 20, 'Yeti-Maske', 1, 50, 2),
(390, 20, 'Rohe Huehnchen-Maske', 1, 50, 2),
(391, 20, 'Gebratene Huehnchen-Maske', 1, 50, 2),
(392, 20, 'Weise Betrunkene Oma-Maske', 1, 50, 2),
(393, 20, 'Schwarze Betrunkene Oma-Maske', 1, 50, 2),
(394, 20, 'Braune Betrunkene Oma-Maske', 1, 50, 2),
(395, 20, 'Weiser Betrunkener Opa-Maske', 1, 50, 2),
(396, 20, 'Schwarzer Betrunkener Opa-Maske', 1, 50, 2),
(397, 20, 'Brauner Betrunkener Opa-Maske', 1, 50, 2),
(398, 20, 'Weise Oma-Maske', 1, 50, 2),
(399, 20, 'Schwarze Oma-Maske', 1, 50, 2),
(400, 20, 'Braune Oma-Maske', 1, 50, 2),
(401, 20, 'Gruene Alien-Maske', 1, 50, 2),
(402, 20, 'Graue Alien-Maske', 1, 50, 2),
(403, 20, 'Rote Alien-Maske', 1, 50, 2),
(404, 20, 'Helle Alien-Maske', 1, 50, 2),
(405, 20, 'Braune Alien-Maske', 1, 50, 2),
(406, 20, 'Schwarze Alien-Maske', 1, 50, 2),
(407, 20, 'Orangene Dino-Maske', 1, 50, 2),
(408, 20, 'Graue Dino-Maske', 1, 50, 2),
(409, 20, 'Blaue Dino-Maske', 1, 50, 2),
(410, 20, 'Braune Dino-Maske', 1, 50, 2),
(411, 20, 'Gruene Dino-Maske', 1, 50, 2),
(412, 20, 'Gelbe Dino-Maske', 1, 50, 2),
(413, 20, 'Rote Punkerteufel-Maske', 1, 50, 2),
(414, 20, 'Blaue Punkerteufel-Maske', 1, 50, 2),
(415, 20, 'Graue Punkerteufel-Maske', 1, 50, 2),
(416, 20, 'Schwarze Punkerteufel-Maske', 1, 50, 2),
(417, 20, 'Goldene Punkerteufel-Maske', 1, 50, 2),
(418, 20, 'Gruene Punkerteufel-Maske', 1, 50, 2),
(419, 20, 'Clownmaske', 1, 50, 2),
(420, 20, 'Clownmaske mit Tuerkisen Haar', 1, 50, 2),
(421, 20, 'Clownmaske mit Gruenen Haar', 1, 50, 2),
(422, 20, 'Clownmaske mit Orangenen Haar', 1, 50, 2),
(423, 20, 'Clownmaske mit Braunen Haar', 1, 50, 2),
(424, 20, 'Clownmaske mit Pinken Haar', 1, 50, 2),
(425, 20, 'Clownmaske mit Blauen Haar', 1, 50, 2),
(426, 20, 'Schwarze Gorilla-Maske', 1, 50, 2),
(427, 20, 'Braune Gorilla Maske', 1, 50, 2),
(428, 20, 'Graue Gorilla-Maske', 1, 50, 2),
(429, 20, 'Helle Gorilla-Maske', 1, 50, 2),
(430, 20, 'Braune Pferdemaske', 1, 50, 2),
(431, 20, 'Schwarze Pferdemaske', 1, 50, 2),
(432, 20, 'Graue Pferdemaske', 1, 50, 2),
(433, 20, 'Einhornmaske', 1, 50, 2),
(434, 20, 'Rote Schoene Totenkopfmaske', 1, 50, 2),
(435, 20, 'Graue Schoene Totenkopfmaske', 1, 50, 2),
(436, 20, 'Blaue Schoene Totenkopfmaske', 1, 50, 2),
(437, 20, 'Gruene Schoene Totenkopfmaske', 1, 50, 2),
(438, 20, 'Weise Schoene Totenkopfmaske', 1, 50, 2),
(439, 20, 'Schwarze Schoene Totenkopfmaske', 1, 50, 2),
(440, 20, 'Beige Mopsmaske', 1, 50, 2),
(441, 20, 'Schwarze Mopsmaske', 1, 50, 2),
(442, 20, 'Graue Mopsmaske', 1, 50, 2),
(443, 20, 'Dunkelbraune Mopsmaske', 1, 50, 2),
(444, 20, 'Hellbraune Mopsmaske', 1, 50, 2),
(445, 20, 'Schwarze-Beige Mopsmaske', 1, 50, 2),
(446, 20, 'Orangener Bigness Mundschutz', 1, 50, 2),
(447, 20, 'Blauer Bigness Mundschutz', 1, 50, 2),
(448, 20, 'Pinker Bigness Mundschutz', 1, 50, 2),
(449, 20, 'Gelber Bigness Mundschutz', 1, 50, 2),
(450, 20, 'Wuestentarn Bigness Mundschutz', 1, 50, 2),
(451, 20, 'Grauer Bigness Mundschutz', 1, 50, 2),
(452, 20, 'Tarn Bigness Mundschutz', 1, 50, 2),
(453, 20, 'Neon-Maske 1', 1, 50, 2),
(454, 20, 'Neon-Maske 2', 1, 50, 2),
(455, 20, 'Neon-Maske 3', 1, 50, 2),
(456, 20, 'Weise Zombiemaske mit Blauen Helm', 1, 50, 2),
(457, 20, 'Weise Zombiemaske mit Hellen Helm', 1, 50, 2),
(458, 20, 'Weise Zombiemaske mit Gruenen Helm', 1, 50, 2),
(459, 20, 'Schwarze Zombiemaske mit Schwarzen Helm', 1, 50, 2),
(460, 20, 'Schwarze Zombiemaske mit Grauen Helm', 1, 50, 2),
(461, 20, 'Schwarze Zombiemaske mit Gruenen Helm', 1, 50, 2),
(462, 20, 'Blauer Mundschutz', 1, 20, 2),
(463, 20, 'Gruener Mundschutz', 1, 20, 2),
(464, 20, 'Gelber Mundschutz', 1, 20, 2),
(465, 20, 'Orangener Mundschutz', 1, 20, 2),
(466, 20, 'Lilaner Mundschutz', 1, 20, 2),
(467, 20, 'Pinker Mundschutz', 1, 20, 2),
(468, 20, 'Graue Maske mit Roten Augen ', 1, 50, 2),
(469, 20, 'Blaue Maske mit Roten Augen', 1, 50, 2),
(470, 20, 'Gruene Maske mit Roten Augen', 1, 50, 2),
(471, 20, 'Zebra Maske mit Roten Augen', 1, 50, 2),
(472, 20, 'Weise Maske mit Roten Augen', 1, 50, 2),
(473, 20, 'Ganz Gruene Maske mit Roten Augen', 1, 50, 2),
(474, 20, 'Orangene Maske mit Roten Augen', 1, 50, 2),
(475, 20, 'Lilane Maske mit Roten Augen', 1, 50, 2),
(476, 20, 'Pinke Maske mit Roten Augen', 1, 50, 2),
(477, 20, 'Gruenes Totenkopf-Bandana', 1, 25, 2),
(478, 20, 'Orangenes Totenkopf-Bandana', 1, 25, 2),
(479, 20, 'Lilanes Totenkopf-Bandana', 1, 25, 2),
(480, 20, 'Pinkes Totenkopf-Bandana', 1, 25, 2),
(481, 20, 'Blaues Camo Bandana', 1, 25, 2),
(482, 20, 'Rotes Camo Bandana', 1, 25, 2),
(483, 20, 'Gemustertes Bigness-Bandana 1', 1, 25, 2),
(484, 20, 'Gemustertes Bigness-Bandana 2', 1, 25, 2),
(485, 20, 'Schwarz-Gruenes Bigness-Bandana', 1, 25, 2),
(486, 20, 'Rotes Bigness-Bandana', 1, 25, 2),
(487, 20, 'Gruenes Bandana mit Blattmuster', 1, 25, 2),
(488, 20, 'Blaues Bandana mit Blattmuster', 1, 25, 2),
(489, 20, 'Rot-Blaues Karo Bandana', 1, 25, 2),
(490, 20, 'Schwarz-Blaues Karo Bandana', 1, 25, 2),
(491, 20, 'Schwarzes MANOR-DEM Bandana', 1, 25, 2),
(492, 20, 'Weises BROKEN-Bandana', 1, 25, 2),
(493, 20, 'Orangenes BROKEN-Bandana', 1, 25, 2),
(494, 20, 'Schwarz-Gruen-Rostes Bandana', 1, 25, 2),
(495, 20, 'Beige-Gruen-Rotes Bandana', 1, 25, 2),
(496, 20, 'USA-Bandana', 1, 25, 2),
(497, 20, 'Buntes-Bandana', 1, 25, 2),
(498, 20, 'Rosa-Blaues Bandana', 1, 25, 2),
(499, 20, 'Camoflage Bandana', 1, 25, 2),
(500, 20, 'Zebra-Bandana', 1, 25, 2),
(501, 20, 'Buntgemustertes Bandana 1', 1, 25, 2),
(502, 20, 'Buntgemustertes Bandana 2', 1, 25, 2),
(503, 20, 'Graue Sturmhaube mit Totenkopf', 1, 35, 2),
(504, 20, 'Blaue Sturmhaube mit Totenkopf', 1, 35, 2),
(505, 20, 'Braune Sturmhaube mit Totenkopf', 1, 35, 2),
(506, 20, 'Gruene Sturmhaube mit Totenkopf', 1, 35, 2),
(507, 20, 'Beige Sturmhaube mit Totenkopf', 1, 35, 2),
(508, 20, 'Rote GUEFFY Sturmhaube', 1, 35, 2),
(509, 20, 'Blattmuster Sturmhaube', 1, 35, 2),
(510, 20, 'Gelbe XERO Sturmhaube', 1, 35, 2),
(511, 20, 'Blaue XERO Sturmhaube', 1, 35, 2),
(512, 20, 'Weise Sturmhaube mit Rotem Strich', 1, 35, 2),
(513, 20, 'Bigness Sturmhaube', 1, 35, 2),
(514, 20, 'Bunte Sturmhaube', 1, 35, 2),
(515, 20, 'USA Sturmhaube', 1, 35, 2),
(516, 20, 'Schwarze Sturmhaube mit Totenkopf', 1, 35, 2),
(517, 20, 'Weise Sturmhaube mit totenkopf', 1, 35, 2),
(519, 20, 'Orangene Sturmhaube', 1, 35, 2),
(520, 20, 'Lilane Sturmhaube', 1, 35, 2),
(521, 20, 'Rosane Sturmhaube', 1, 35, 2),
(522, 20, 'Beiges Palituch mit Cap', 1, 45, 2),
(523, 20, 'Blaues Palituch mit Cap', 1, 45, 2),
(524, 20, 'Gruenes Palituch mit Cap', 1, 45, 2),
(525, 20, 'Gelbes Palituch mit Cap', 1, 45, 2),
(526, 20, 'Rotes Palituch mit Cap', 1, 45, 2),
(527, 20, 'Beigesn Palituch', 1, 35, 2),
(528, 20, 'Blaues Palituch', 1, 35, 2),
(529, 20, 'Gruenes Palituch', 1, 35, 2),
(530, 20, 'Gelbes Palituch', 1, 35, 2),
(531, 20, 'Rotes Palituch', 1, 35, 2),
(532, 20, 'Beiges Kragentuch', 1, 35, 2),
(533, 20, 'Blaues Kragentuch', 1, 35, 2),
(534, 20, 'Gruenes Kragentuch', 1, 35, 2),
(535, 20, 'Gelbes Kragentuch', 1, 35, 2),
(536, 20, 'Rotes Kragentuch', 1, 35, 2),
(537, 20, 'Gruenes T-Shirt Bandana', 1, 30, 2),
(538, 20, 'Orangenes T-Shirt Bandana', 1, 30, 2),
(539, 20, 'Lilanes T-Shirt Bandana', 1, 30, 2),
(540, 20, 'Pinkes T-Shirt Bandana', 1, 30, 2),
(541, 20, 'Blattmuster T-Shirt Bandana', 1, 30, 2),
(542, 20, 'Blaues T-Shirt Bandana', 1, 30, 2),
(543, 20, 'Rotes T-Shirt Bandana', 1, 30, 2),
(544, 20, 'Buntes T-Shirt Bandana', 1, 30, 2),
(545, 20, 'Schwarze Sockenmaske mit Totenkopf', 1, 50, 2),
(546, 20, 'Graue Sockenmaske', 1, 35, 2),
(547, 20, 'Dunkelgraue Sockenmaske', 1, 35, 2),
(548, 20, 'Braune Sockenmaske', 1, 35, 2),
(549, 20, 'Blaue Sockenmaske', 1, 35, 2),
(550, 20, 'Rote Sockenmaske', 1, 35, 2),
(551, 20, 'Gruene Sockenmaske', 1, 35, 2),
(552, 20, 'Orangene Sockenmaske', 1, 35, 2),
(553, 20, 'Lilane Sockenmaske', 1, 35, 2),
(554, 20, 'Rosane Sockenmaske', 1, 35, 2),
(555, 20, 'Bunte Sockenmaske', 1, 35, 2),
(556, 20, 'Schwarze Metall-Maske', 1, 50, 2),
(557, 20, 'Graue Metall-Maske', 1, 50, 2),
(558, 20, 'Weise Metall-Maske', 1, 50, 2),
(559, 20, 'Beige Metall-Maske', 1, 50, 2),
(560, 20, 'Gruene Metall-Maske', 1, 50, 2),
(561, 20, 'Orangene Metall-Maske', 1, 50, 2),
(562, 20, 'Lilane Metall-Maske', 1, 50, 2),
(563, 20, 'Rosane Metall-Maske', 1, 50, 2),
(564, 20, 'Schwarz-Rote Metall-Maske', 1, 50, 2),
(565, 20, 'Schwarz-Blaue Metall-Maske', 1, 50, 2),
(566, 20, 'Schwarz-Gelbe Metall-Maske', 1, 50, 2),
(567, 20, 'Gelbe Gehirn-Alien-Maske', 1, 50, 2),
(568, 20, 'Rote Gehirn-Alien-Maske', 1, 50, 2),
(569, 20, 'Beige Gehirn-Alien-Maske', 1, 50, 2),
(570, 20, 'Hellblaue Gehirn-Alien-Maske', 1, 50, 2),
(571, 20, 'Lilane Gehirn-Alien-Maske', 1, 50, 2),
(572, 20, 'Gruene Gehirn-Alien-Maske', 1, 50, 2),
(573, 20, 'Blaue Gehirn-Alien-Maske', 1, 50, 2),
(574, 20, 'Dunkelrote Gehirn-Alien-Maske', 1, 50, 2),
(575, 20, 'Gelbe Augen-Alien-Maske', 1, 50, 2),
(576, 20, 'Rote Augen-Alien-Maske', 1, 50, 2),
(577, 20, 'Beige Augen-Alien-Maske', 1, 50, 2),
(578, 20, 'Hellblaue Augen-Alien-Maske', 1, 50, 2),
(579, 20, 'Lilane Augen-Alien-Maske', 1, 50, 2),
(580, 20, 'Gruene Augen-Alien-Maske', 1, 50, 2),
(581, 20, 'Blaue Augen-Alien-Maske', 1, 50, 2),
(582, 20, 'Dunkelrote Augen-Alien-Maske', 1, 50, 2),
(583, 20, 'Gelbe Mini-Alien-Maske', 1, 50, 2),
(584, 20, 'Rote Mini-Alien-Maske', 1, 50, 2),
(585, 20, 'Beige Mini-Alien-Maske', 1, 50, 2),
(586, 20, 'Hellblaue Mini-Alien-Maske', 1, 50, 2),
(587, 20, 'Lilane Mini-Alien-Maske', 1, 50, 2),
(588, 20, 'Gruene Mini-Alien-Maske', 1, 50, 2),
(589, 20, 'Blaue Mini-Alien-Maske', 1, 50, 2),
(590, 20, 'Dunkelrote Mini-Alien-Maske', 1, 50, 2),
(591, 20, 'Taco-Maske', 1, 50, 2),
(592, 20, 'Burger-Maske', 1, 50, 2),
(593, 20, 'Chicken-Maske', 1, 50, 2),
(594, 20, 'Banditen-Maske', 1, 50, 2),
(595, 20, 'Erdbeer-Maske ', 1, 50, 2),
(596, 20, 'Zitronen-Maske', 1, 50, 2),
(597, 20, 'Trauben-Maske', 1, 50, 2),
(598, 20, 'Ananas-Maske', 1, 50, 2),
(599, 20, 'Kirsch-Maske', 1, 50, 2),
(600, 20, '7-Maske', 1, 50, 2),
(601, 20, 'Koenigs-Maske', 1, 50, 2),
(602, 20, 'Dame-Maske', 1, 50, 2),
(603, 20, 'Hut-Koenigs-Maske', 1, 50, 2),
(604, 20, 'Totenkopf-Maske mit Hut', 1, 50, 2),
(605, 20, 'Joker-Maske', 1, 50, 2),
(606, 20, 'Schwarze Ausgewaschene Baggy-Hose -M-', 1, 45, 0),
(607, 20, 'Schwarze Baggy-Hose -M-', 1, 45, 0),
(608, 20, 'Graue Baggy-Hose -M-', 1, 45, 0),
(609, 20, 'Hellblaue Baggy-Hose -M-', 1, 45, 0),
(610, 20, 'Braune Baggy-Hose -M-', 1, 45, 0),
(611, 20, 'Dunkelblaue Baggy-Hose -M-', 1, 45, 0),
(612, 20, 'Hellgraue Baggy-Hose -M-', 1, 45, 0),
(613, 20, 'Hellbraune Baggy-Hose -M-', 1, 45, 0),
(614, 20, 'Blaue Baggy-Hose -M-', 1, 45, 0),
(615, 20, 'Gruene Baggy-Hose -M-', 1, 45, 0),
(616, 20, 'Rote Baggy-Hose -M-', 1, 45, 0),
(617, 20, 'Antrazitfarbene Baggy-Hose -M-', 1, 45, 0),
(618, 20, 'Mittelblaue Baggy-Hose -M-', 1, 45, 0),
(619, 20, 'Hellbraune Baggy-Hose -M-', 1, 45, 0),
(620, 20, 'Beige Baggy-Hose -M-', 1, 45, 0),
(621, 20, 'Ausgewaschene Baggy-Hose -M-', 1, 45, 0),
(622, 20, 'Weise Joggingshose -M-', 1, 25, 0),
(623, 20, 'Hellgraue Joggingshose -M-', 1, 25, 0),
(624, 20, 'Schwarze Joggingshose -M-', 1, 25, 0),
(625, 20, 'Blaue Joggingshose -M-', 1, 25, 0),
(626, 20, 'Mittelblaue Joggingshose -M-', 1, 25, 0),
(627, 20, 'Rote Joggingshose -M-', 1, 25, 0),
(628, 20, 'Gruene Joggingshose -M-', 1, 25, 0),
(629, 20, 'Orange Joggingshose -M-', 1, 25, 0),
(630, 20, 'Gelbe Joggingshose -M-', 1, 25, 0),
(631, 20, 'Lilane Joggingshose -M-', 1, 25, 0),
(632, 20, 'Braune Joggingshose -M-', 1, 25, 0),
(633, 20, 'Beige Joggingshose -M-', 1, 25, 0),
(634, 20, 'Dunkellilane Joggingshose -M-', 1, 25, 0),
(635, 20, 'Dunkelblaue Joggingshose -M-', 1, 25, 0),
(636, 20, 'Dunkelgraue Joggingshose -M-', 1, 25, 0),
(637, 20, 'Dunkelrote Joggingshose -M-', 1, 25, 0),
(638, 20, 'Schwarze Schlanke Jeans -M-', 1, 25, 0),
(639, 20, 'Dunkelblaue Schlanke Jeans -M-', 1, 45, 0),
(640, 20, 'Hellgraue Schlanke Jeans -M-', 1, 45, 0),
(641, 20, 'Hellblaue schlanke Jeans  -M-', 1, 45, 0),
(642, 20, 'Weise Weite Joggingshose -M-', 1, 25, 0),
(643, 20, 'Hellgraue Weite Joggingshose -M-', 1, 25, 0),
(644, 20, 'Schwarze Weite Joggingshose -M-', 1, 25, 0),
(645, 20, 'Hellblaue Weite Joggingshose -M-', 1, 25, 0),
(646, 20, 'Deunkelblaue Weite Joggingshose -M-', 1, 25, 0),
(647, 20, 'Rote Weite Joggingshose -M-', 1, 25, 0),
(648, 20, 'Gruene Weite Joggingshose -M-', 1, 25, 0),
(649, 20, 'Orange Weite Joggingshose -M-', 1, 25, 0),
(650, 20, 'Gelbe Weite Joggingshose -M-', 1, 25, 0),
(651, 20, 'Lilane Weite Joggingshose -M-', 1, 25, 0),
(652, 20, 'Braune Weite Joggingshose -M-', 1, 25, 0),
(653, 20, 'Beige Weite Joggingshose -M-', 1, 25, 0),
(654, 20, 'Dunkellilane Weite Joggingshose -M-', 1, 25, 0),
(655, 20, 'Camofarbene Weite Joggingshose -M-', 1, 25, 0),
(656, 20, 'Graugefleckte Weite Joggingshose -M-', 1, 25, 0),
(657, 20, 'Dunkelgraue Weite Joggingshose -M-', 1, 25, 0),
(658, 20, 'Weise Badehose -M-', 1, 20, 0),
(659, 20, 'Schwarze Badehose -M-', 1, 20, 0),
(660, 20, 'Graue Badehose -M-', 1, 20, 0),
(661, 20, 'Dunkelblaue Badehose -M-', 1, 20, 0),
(662, 20, 'Schwarze Stoffhose -M-', 1, 1, 0),
(663, 20, 'Braune Stoffhose -M-', 1, 1, 0),
(664, 20, 'Hellgraue Stoffhose -M-', 1, 1, 0),
(665, 20, 'Blaue Stoffhose -M-', 1, 1, 0),
(666, 20, 'Beige Stoffhose -M-', 1, 1, 0),
(667, 20, 'Weise Stoffhose -M-', 1, 1, 0),
(668, 20, 'Dunkelgruene Stoffhose -M-', 1, 1, 0),
(669, 20, 'Gruene Stoffhose -M-', 1, 1, 0),
(670, 20, 'Rote Stoffhose -M-', 1, 1, 0),
(671, 20, 'Hellblaue Stoffhose -M-', 1, 1, 0),
(672, 20, 'Dunkelrote Stoffhose -M-', 1, 1, 0),
(673, 20, 'Mittelblaube Stoffhose -M-', 1, 1, 0),
(674, 20, 'Orangene Stoffhose -M-', 1, 1, 0),
(675, 20, 'Armeegruene Hose mit Taschen -M-', 1, 1, 0),
(676, 20, 'Beige Hose mit Taschen -M-', 1, 1, 0),
(677, 20, 'Dunkellilane Hose mit Taschen -M-', 1, 1, 0),
(678, 20, 'Dunkelblaue Hose mit Taschen -M-', 1, 1, 0),
(679, 20, 'Orangene Hose mit Taschen -M-', 1, 1, 0),
(680, 20, 'Braune Hose mit Taschen -M-', 1, 1, 0),
(681, 20, 'Hellgraue Hose mit Taschen -M-', 1, 1, 0),
(682, 20, 'Schwarze Hose mit Taschen -M-', 1, 1, 0),
(683, 20, 'Gelbe Hose mit Taschen -M-', 1, 1, 0),
(684, 20, 'Braungefleckte Hose mit Taschen -M-', 1, 1, 0),
(685, 20, 'Grauegefleckte Hose mit Taschen -M-', 1, 1, 0),
(686, 20, 'Rotgefleckte Hose mit Taschen -M-', 1, 1, 0),
(687, 20, 'Gruengefleckte Hose mit Taschen -M-', 1, 1, 0),
(688, 20, 'Schwarzgefleckte Hose mit Taschen -M-', 1, 1, 0),
(689, 20, 'Armeefarbene Hose mit Taschen -M-', 1, 1, 0),
(690, 20, 'Blaugefleckte Hose mit Taschen -M-', 1, 1, 0),
(691, 20, 'Schwarze Schlanke Anzugshose  -M-', 1, 1, 0),
(692, 20, 'Graue Schlanke Anzugshose -M-', 1, 1, 0),
(693, 20, 'Blaue Schlanke Anzugshose -M-', 1, 1, 0),
(694, 20, 'Schwarz kurze Hose -M-', 1, 1, 0),
(695, 20, 'Grauekarierte kurze Hose -M-', 1, 1, 0),
(696, 20, 'Graue kurze Hose -M-', 1, 1, 0),
(697, 20, 'Beige kurze Hose -M-', 1, 1, 0),
(698, 20, 'Blaue kurze Hose -M-', 1, 1, 0),
(699, 20, 'Schwarze Weite Anzugshose -M-', 1, 1, 0),
(700, 20, 'Graue Weite Anzugshose -M-', 1, 1, 0),
(701, 20, 'Blaue Weite Anzugshose -M-', 1, 1, 0),
(702, 20, 'Graue kurze Sporthose -M-', 1, 1, 0),
(703, 20, 'Schwarze kurze Sporthose -M-', 1, 1, 0),
(704, 20, 'Rote kurze Sporthose -M-', 1, 1, 0),
(705, 20, 'Weise kurze Sporthose -M-', 1, 1, 0),
(706, 20, 'Beige Kurze Hose mit Taschen -M-', 1, 1, 0),
(707, 20, 'Hellbraune Kurze Hose mit Taschen -M-', 1, 1, 0),
(708, 20, 'Weise Kurze Hose mit Taschen -M-', 1, 1, 0),
(709, 20, 'Schwarze Kurze Hose mit Taschen -M-', 1, 1, 0),
(710, 20, 'Hellorange Kurze Hose mit Taschen -M-', 1, 1, 0),
(711, 20, 'Hellgraue Kurze Hose mit Taschen -M-', 1, 1, 0),
(712, 20, 'Rote Kurze Hose mit Taschen -M-', 1, 1, 0),
(713, 20, 'Dunkelbraune Kurze Hose mit Taschen -M-', 1, 1, 0),
(714, 20, 'Lilane Kurze Hose mit Taschen -M-', 1, 1, 0),
(715, 20, 'Schwarze Camoflage Kurze Hose mit Taschen -M-', 1, 1, 0),
(716, 20, 'Camohose Kurze Hose mit Taschen -M-', 1, 1, 0),
(717, 20, 'Wuestentarnfarbene Kurze Hose mit Taschen -M-', 1, 1, 0),
(718, 20, 'Graugefleckte Kurze Hose mit Taschen -M-', 1, 1, 0),
(719, 20, 'Gruene Kurze Hose mit Taschen -M-', 1, 1, 0),
(720, 20, 'Blaue Kurze Hose mit Taschen -M-', 1, 1, 0),
(721, 20, 'Orange Kurze Hose mit Taschen -M-', 1, 1, 0),
(722, 20, 'Graue-Rosane Badehose -M-', 1, 1, 0),
(723, 20, 'Rote-karierte Badehose -M-', 1, 1, 0),
(724, 20, 'Gelbe Badehose -M-', 1, 1, 0),
(725, 20, 'Orangene Badehose -M-', 1, 1, 0),
(726, 20, 'Gruene Badehose -M-', 1, 1, 0),
(727, 20, 'Lila-Geblumte Badehose -M-', 1, 1, 0),
(728, 20, 'Gruen-Weise Badehose -M-', 1, 1, 0),
(729, 20, 'Weis-Gruene Badehose -M-', 1, 1, 0),
(730, 20, 'Blau-Geblumte Badehose -M-', 1, 1, 0),
(731, 20, 'Rosane Badehose -M-', 1, 1, 0),
(732, 20, 'Hellgelbe Badehose -M-', 1, 1, 0),
(733, 20, 'Beige Badehose -M-', 1, 1, 0),
(734, 20, 'Braune Kurze Hose -M-', 1, 1, 0),
(735, 20, 'Schwarz Karierte Kurze Hose -M-', 1, 1, 0),
(736, 20, 'Hellgelbe Kurze Hose -M-', 1, 1, 0),
(737, 20, 'Grau-Gelbe Kurze Hose -M-', 1, 1, 0),
(738, 20, 'Hellblaue Kurze Hose -M-', 1, 1, 0),
(739, 20, 'Weis-karierte Kurze Hose -M-', 1, 1, 0),
(740, 20, 'Hellgraue Kurze Hose -M-', 1, 1, 0),
(741, 20, 'Tuerkis-Karierte Kurze Hose -M-', 1, 1, 0),
(742, 20, 'Braun-Karierte Kurze Hose -M-', 1, 1, 0),
(743, 20, 'Rote Kurze Hose -M-', 1, 1, 0),
(744, 20, 'Dunkelgruene Kurze Hose -M-', 1, 1, 0),
(745, 20, 'Gelbe Kurze Sporthose -M-', 1, 1, 0),
(746, 20, 'Dunkelblaue Kurze Sporthose -M-', 1, 1, 0),
(747, 20, 'Kurze Sporthose mit Palmenmuster -M-', 1, 1, 0),
(748, 20, 'Rote-Weise Kurze Sporthose -M-', 1, 1, 0),
(749, 20, 'Hellgruene Kurze Sporthose -M-', 1, 1, 0),
(750, 20, 'Hellkarierte Kurze Sporthose -M-', 1, 1, 0),
(751, 20, 'Dunkelblau-karierte Kurze Sporthose -M-', 1, 1, 0),
(752, 20, 'Geblumte Kurze Sporthose -M-', 1, 1, 0),
(753, 20, 'Tuerkiese Kurze Sporthose -M-', 1, 1, 0),
(754, 20, 'Oranggefleckte Kurze Sporthose -M-', 1, 1, 0),
(755, 20, 'Gelbe Leoparten Kurze Sporthose -M-', 1, 1, 0),
(756, 20, 'Schwarze tropical Kurze Sporthose -M-', 1, 1, 0),
(757, 20, 'Rote Weite Anzugshose -M-', 1, 1, 0),
(758, 20, 'Gruene Weite Anzugshose -M-', 1, 1, 0),
(759, 20, 'Weise Schlanke Anzugshose -M-', 1, 1, 0),
(760, 20, 'Blaue Schlanke Anzugshose -M-', 1, 1, 0),
(761, 20, 'Schwarz gestreifte Anzugshose -M-', 1, 1, 0),
(762, 20, 'Hellgraue Schlanke Anzugshose -M-', 1, 1, 0),
(763, 20, 'Dunkelgruene Schlanke Anzugshose -M-', 1, 1, 0),
(764, 20, 'Weise Weite Anzugshose -M-', 1, 1, 0),
(765, 20, 'Dunkelgruene Weite Anzugshose -M-', 1, 1, 0),
(766, 20, 'Lilane Weite Anzugshose -M-', 1, 1, 0),
(767, 20, 'Dunkelrote Weite Anzugshose -M-', 1, 1, 0),
(768, 20, 'Dunkelbraune Weite Anzugshose -M-', 1, 1, 0),
(769, 20, 'Braun-Karierte Weite Anzugshose -M-', 1, 1, 0),
(770, 20, 'Beige Weite Anzugshose -M-', 1, 1, 0),
(771, 20, 'Hellbeige Weite Anzugshose -M-', 1, 1, 0),
(772, 20, 'Dunkelblaue Weite Anzugshose -M-', 1, 1, 0),
(773, 20, 'Weis-Karierte Weite Anzugshose -M-', 1, 1, 0),
(774, 20, 'Blau-Karierte Weite Anzugshose -M-', 1, 1, 0),
(775, 20, 'Schwarze Sakkohose -M-', 1, 1, 0),
(776, 20, 'Graue Sakkohose -M-', 1, 1, 0),
(777, 20, 'Dunkelgraue Sakkohose -M-', 1, 1, 0),
(778, 20, 'Dunkelgruene Sakkohose -M-', 1, 1, 0),
(779, 20, 'Dunkelrote Sakkohose -M-', 1, 1, 0),
(780, 20, 'Weise Sakkohose -M-', 1, 1, 0),
(781, 20, 'Dunkelbraune Sakkohose -M-', 1, 1, 0),
(782, 20, 'Schwarze Schlanke Stoffhose -M-', 1, 1, 0),
(783, 20, 'Graue Schlanke Stoffhose -M-', 1, 1, 0),
(784, 20, 'Dunkelblaue Schlanke Stoffhose -M-', 1, 1, 0),
(785, 20, 'Dunkelgruene Schlanke Stoffhose -M-', 1, 1, 0),
(786, 20, 'Dunkelrote Schlanke Stoffhose -M-', 1, 1, 0),
(787, 20, 'Weise Schlanke Stoffhose -M-', 1, 1, 0),
(788, 20, 'Dunkelbraune Schlanke Stoffhose -M-', 1, 1, 0),
(789, 20, 'Schwarze Camofarbene Schlanke Jeans -M-', 1, 1, 0),
(790, 20, 'Lilane Schlanke Jeans -M-', 1, 1, 0),
(791, 20, 'Gruene Schlanke Jeans -M-', 1, 1, 0),
(792, 20, 'Hellgruene Schlanke Jeans -M-', 1, 1, 0),
(793, 20, 'Hellblaue Schlanke Jeans -M-', 1, 1, 0),
(794, 20, 'Rote Schlanke Jean s-M-', 1, 1, 0),
(795, 20, 'Mintfarbene Schlanke Jeans -M-', 1, 1, 0),
(796, 20, 'Gelbe Gummizughose -M-', 1, 1, 0),
(797, 20, 'Blaue Gummizughose -M-', 1, 1, 0),
(798, 20, 'Orangene Gummizughose -M-', 1, 1, 0),
(799, 20, 'Weise Gummizughose -M-', 1, 1, 0),
(800, 20, 'Rote Gummizughose -M-', 1, 1, 0),
(801, 20, 'Mintfarbene Gummizughose -M-', 1, 1, 0),
(802, 20, 'Dunkelrote Gummizughose -M-', 1, 1, 0),
(803, 20, 'Gruene Gummizughose -M-', 1, 1, 0),
(804, 20, 'Braune Gummizughose -M-', 1, 1, 0),
(805, 20, 'Petrolfarbene Gummizughose -M-', 1, 1, 0),
(806, 20, 'Dunkelgruene Gummizughose -M-', 1, 1, 0),
(807, 20, 'Lilane Gummizughose -M-', 1, 1, 0),
(808, 20, 'Schwarze Schlanke Sakkohose -M-', 1, 1, 0),
(809, 20, 'Rote Schlanke Sakkohose -M-', 1, 1, 0),
(810, 20, 'Dunkelgraue Schlanke Sakkohose -M-', 1, 1, 0),
(811, 20, 'Braune Schlanke Sakkohose -M-', 1, 1, 0),
(812, 20, 'Dunkelbraune Schlanke Sakkohose -M-', 1, 1, 0),
(813, 20, 'Hellgraue Schlanke Sakkohose -M-', 1, 1, 0),
(814, 20, 'Braun-Karierte Schlanke Sakkohose -M-', 1, 1, 0),
(815, 20, 'Graue Schlanke Sakkohose -M-', 1, 1, 0),
(816, 20, 'Lilane Schlanke Sakkohose -M-', 1, 1, 0),
(817, 20, 'Dunkelblaue Schlanke Sakkohose -M-', 1, 1, 0),
(818, 20, 'Leoparten Schlanke Sakkohose -M-', 1, 1, 0),
(819, 20, 'USA-Hose 1 -M-', 1, 1, 0),
(820, 20, 'USA-Hose 2 -M-', 1, 1, 0),
(821, 20, 'USA-Hose 3 -M-', 1, 1, 0),
(822, 20, 'Fliegerhose -M-', 1, 1, 0),
(823, 20, 'Schwarze Polizei Hose -M-', 1, 1, 0),
(824, 20, 'Graue SWAT Hose -M-', 1, 1, 0),
(825, 20, 'Schwarze Kampfhose -M-', 1, 1, 0),
(826, 20, 'NOOSE-Hose -M-', 1, 1, 0),
(828, 20, 'Müllmannhose -M-', 1, 1, 0),
(829, 20, 'Rote Hausmeisterbundhose -M-', 1, 1, 0),
(830, 20, 'Schwarze Hausmeisterbundhose -M-', 1, 1, 0),
(831, 20, 'Gruene Hausmeisterbundhose -M-', 1, 1, 0),
(832, 20, 'Graue Hausmeisterbundhose -M-', 1, 1, 0),
(833, 20, 'Rote Hausmeisterhose -M-', 1, 1, 0),
(834, 20, 'Schwarze Hausmeisterhose -M-', 1, 1, 0),
(835, 20, 'Gruene Hausmeisterhose -M-', 1, 1, 0),
(836, 20, 'Graue Hausmeisterhose -M-', 1, 1, 0),
(837, 20, 'Schwarze Fliegerhose -M-', 1, 1, 0),
(838, 20, 'Schwarze kurze Jogginghose -M-', 1, 1, 0),
(839, 20, 'Weise kurze Jogginghose -M-', 1, 1, 0),
(840, 20, 'Dunkelblaue Weite Jeanshose -M-', 1, 1, 0),
(841, 20, 'Schwarze Weite Jeanshose -M-', 1, 1, 0),
(842, 20, 'Schwarze Seiden Pyjamahose-M-', 1, 1, 0),
(843, 20, 'Lilane Seiden Pyjamahose-M-', 1, 1, 0),
(844, 20, 'Beige Einsatzhose -M-', 1, 1, 0),
(845, 20, 'Gruene Einsatzhose -M-', 1, 1, 0),
(846, 20, 'Beige lange Hose mit Taschen -M-', 1, 1, 0),
(847, 20, 'Gruene lange Hose mit Taschen -M-', 1, 1, 0),
(848, 20, 'Rote Seiden Anzugshose -M-', 1, 1, 0),
(849, 20, 'Blaue Seiden Anzugshose -M-', 1, 1, 0),
(850, 20, 'Schwarze Seiden Anzugshose -M-', 1, 1, 0),
(851, 20, 'Grune Seiden Anzugshose -M-', 1, 1, 0),
(852, 20, 'Gold-Schwarze Anzugshose -M-', 1, 1, 0),
(853, 20, 'Rote schmale Seiden Anzugshose -M-', 1, 1, 0),
(854, 20, 'Blaue schmale Seiden Anzugshose -M-', 1, 1, 0),
(855, 20, 'Gold-Schwarze schmale Anzugshose -M-', 1, 1, 0),
(856, 20, 'Dunkelblau gemusterte Badehose -M-', 1, 1, 0),
(857, 20, 'Schwarz-Weis beschriftete Badehose -M-', 1, 1, 0),
(858, 20, 'Weises Bademantel Unterteil -M-', 1, 1, 0),
(859, 20, 'Graues Bademantel Unterteil -M-', 1, 1, 0),
(860, 20, 'Schwarzes Bademantel Unterteil -M-', 1, 1, 0),
(861, 20, 'Rotes Bademantel Unterteil -M-', 1, 1, 0),
(862, 20, 'Rote Pyjamahose -M-', 1, 1, 0),
(863, 20, 'Petrolfarbene Pyjamahose -M-', 1, 1, 0),
(864, 20, 'Schwarz-Karierte Pyjamahose -M-', 1, 1, 0),
(865, 20, 'Gruene Kampfhose -M-', 1, 1, 0),
(866, 20, 'Orangene Kampfhose -M-', 1, 1, 0),
(867, 20, 'Lilane Kampfhose -M-', 1, 1, 0),
(868, 20, 'Rosane Kampfhose -M-', 1, 1, 0),
(869, 20, 'Rote Kampfhose -M-', 1, 1, 0),
(870, 20, 'Blaue Kampfhose -M-', 1, 1, 0),
(871, 20, 'Graue Kampfhose -M-', 1, 1, 0),
(872, 20, 'Beige Kampfhose -M-', 1, 1, 0),
(873, 20, 'Weise Kampfhose -M-', 1, 1, 0),
(874, 20, 'Weise Boxershort -M-', 1, 1, 0),
(875, 20, 'Schwarze Boxershort -M-', 1, 1, 0),
(876, 20, 'Graue Boxershort -M-', 1, 1, 0),
(877, 20, 'Leoparten Boxershort -M-', 1, 1, 0),
(878, 20, 'Weise Herzchen Boxershort -M-', 1, 1, 0),
(879, 20, 'Schwarze kurze Faltenhose -M-', 1, 1, 0),
(880, 20, 'Beige kurze Faltenhose -M-', 1, 1, 0),
(881, 20, 'Graue kurze Faltenhose -M-', 1, 1, 0),
(882, 20, 'Gruene kurze Faltenhose -M-', 1, 1, 0),
(883, 20, 'Blaue Jogginghose mit Streifen -M-', 1, 1, 0),
(884, 20, 'Hellrote Jogginghose mit Streifen -M-', 1, 1, 0),
(885, 20, 'Beige Jogginghose mit Streifen -M-', 1, 1, 0),
(886, 20, 'Dunkelblaue Jogginghose mit Streifen -M-', 1, 1, 0),
(887, 20, 'Rote Jogginghose mit Streifen -M-', 1, 1, 0),
(888, 20, 'Hellblaue Jogginghose mit Streifen -M-', 1, 1, 0),
(889, 20, 'Orangene Jogginghose mit Streifen -M-', 1, 1, 0),
(890, 20, 'Lilane Jogginghose mit Streifen -M-', 1, 1, 0),
(891, 20, 'Graue Jogginghose mit Streifen -M-', 1, 1, 0),
(892, 20, 'Gruene Jogginghose mit Streifen -M-', 1, 1, 0),
(893, 20, 'Weise Jogginghose mit Streifen -M-', 1, 1, 0),
(894, 20, 'Hellblau gestreifte Pyjamahose -M-', 1, 1, 0),
(895, 20, 'Gelbe Pyjamahose -M-', 1, 1, 0),
(896, 20, 'Rosane Pyjamahose -M-', 1, 1, 0),
(897, 20, 'Mintfarbene Pyjamahose -M-', 1, 1, 0),
(898, 20, 'Lila-karierte Pyjamahose -M-', 1, 1, 0),
(899, 20, 'Blau-karierte Pyjamahose -M-', 1, 1, 0),
(900, 20, 'Rot-gemusterte Pyjamahose -M-', 1, 1, 0),
(901, 20, 'Weis-Schwarze Pyjamahose -M-', 1, 1, 0),
(902, 20, 'Lila-gemusterte Pyjamahose -M-', 1, 1, 0),
(903, 20, 'Gelb-gemusterte Pyjamahose -M-', 1, 1, 0),
(904, 20, 'Rot-gemusterte Pyjamahose -M-', 1, 1, 0),
(905, 20, 'Gruene Motorcross-Hose -M-', 1, 1, 0),
(906, 20, 'Rote Motorcross-Hose -M-', 1, 1, 0),
(907, 20, 'Schwarze Motorcross-Hose -M-', 1, 1, 0),
(908, 20, 'Blau-Rote Motorcross-Hose -M-', 1, 1, 0),
(909, 20, 'Gelbe Motorcross-Hose -M-', 1, 1, 0),
(910, 20, 'Rosane Motorcross-Hose -M-', 1, 1, 0),
(911, 20, 'Blaue Motorcross-Hose -M-', 1, 1, 0),
(912, 20, 'Orangene Motorcross-Hose -M-', 1, 1, 0),
(913, 20, 'Lilane Motorcross-Hose -M-', 1, 1, 0),
(914, 20, 'Große Totenkopf Jogginghose -M-', 1, 1, 0),
(915, 20, 'Große Tarnmuster Jogginghose -M-', 1, 1, 0),
(916, 20, 'Große Schwarze Jogginghose -M-', 1, 1, 0),
(917, 20, 'Große Blaue Stern Jogginghose -M-', 1, 1, 0),
(918, 20, 'Große Gruen Stern Jogginghose -M-', 1, 1, 0),
(919, 20, 'Schwarze Glatte Lederhose -M-', 1, 1, 0),
(920, 20, 'Rote Glatte Lederhose -M-', 1, 1, 0),
(921, 20, 'Braune Glatte Lederhose -M-', 1, 1, 0),
(922, 20, 'abgeranzte Schwarze Glatte Lederhose -M-', 1, 1, 0),
(923, 20, 'abgeranzte Rote Glatte Lederhose -M-', 1, 1, 0),
(924, 20, 'abgeranzte Braune Glatte Lederhose -M-', 1, 1, 0),
(925, 20, 'Schwarze Glatte Lederhose zum reinstecken -M-', 1, 1, 0),
(926, 20, 'Rote Glatte Lederhose zum reinstecken -M-', 1, 1, 0),
(927, 20, 'Braune Glatte Lederhose zum reinstecken -M-', 1, 1, 0),
(928, 20, 'abgeranzte Schwarze Glatte Lederhose zum reinstecken -M-', 1, 1, 0),
(929, 20, 'abgeranzte Rote Glatte Lederhose zum reinstecken -M-', 1, 1, 0),
(930, 20, 'abgeranzte Braune Glatte Lederhose zum reinstecken -M-', 1, 1, 0),
(931, 20, 'Schwarze gepolsterte Lederhose -M-', 1, 1, 0),
(932, 20, 'Rote gepolsterte Lederhose -M-', 1, 1, 0),
(933, 20, 'Braune gepolsterte Lederhose -M-', 1, 1, 0),
(934, 20, 'abgeranzte Schwarze gepolsterte Lederhose -M-', 1, 1, 0),
(935, 20, 'abgeranzte Rote gepolsterte Lederhose -M-', 1, 1, 0),
(936, 20, 'abgeranzte Braune gepolsterte Lederhose -M-', 1, 1, 0),
(937, 20, 'Schwarze gepolsterte Lederhose zum reinstecken -M-', 1, 1, 0),
(938, 20, 'Rote gepolsterte Lederhose zum reinstecken -M-', 1, 1, 0),
(939, 20, 'Braune gepolsterte Lederhose zum reinstecken -M-', 1, 1, 0),
(940, 20, 'abgeranzte Schwarze gepolsterte Lederhose zum reinstecken -M-', 1, 1, 0),
(941, 20, 'abgeranzte Rote gepolsterte Lederhose zum reinstecken -M-', 1, 1, 0),
(942, 20, 'abgeranzte Braune gepolsterte Lederhose zum reinstecken -M-', 1, 1, 0),
(943, 20, 'Dunkelblaue Bikerhose -M-', 1, 1, 0),
(944, 20, 'Hellblaue Bikerhose -M-', 1, 1, 0),
(945, 20, 'Graue Bikerhose -M-', 1, 1, 0),
(946, 20, 'Schwarze Bikerhose -M-', 1, 1, 0),
(947, 20, 'Dunkelblaue zerrissene Bikerhose -M-', 1, 1, 0),
(948, 20, 'Hellblaue zerrissene Bikerhose -M-', 1, 1, 0),
(949, 20, 'Graue zerrissene Bikerhose -M-', 1, 1, 0),
(950, 20, 'Schwarze zerrissene Bikerhose -M-', 1, 1, 0),
(951, 20, 'Schwarz-Gelbe Motorradhose -M-', 1, 1, 0),
(952, 20, 'Schwarz-Gruene Motorradhose -M-', 1, 1, 0),
(953, 20, 'Schwarz-Orangene Motorradhose -M-', 1, 1, 0),
(954, 20, 'Schwarz-Blaue Motorradhose -M-', 1, 1, 0),
(955, 20, 'Schwarz-Rosane Motorradhose -M-', 1, 1, 0),
(956, 20, 'Schwarz-Rote Motorradhose -M-', 1, 1, 0),
(957, 20, 'Schwarz-Graue Motorradhose -M-', 1, 1, 0),
(958, 20, 'Schwarz-Weise Motorradhose -M-', 1, 1, 0),
(959, 20, 'Braune gummizug Jogginghose -M-', 1, 1, 0),
(960, 20, 'Camo gummizug Jogginghose -M-', 1, 1, 0),
(961, 20, 'Schwarze gummizug Jogginghose -M-', 1, 1, 0),
(962, 20, 'Blaue gummizug Jogginghose -M-', 1, 1, 0),
(963, 20, 'Schwarze Leder Jogginghose -M-', 1, 1, 0),
(964, 20, 'Rote Leder Jogginghose -M-', 1, 1, 0),
(965, 20, 'Weise Leder Jogginghose -M-', 1, 1, 0),
(966, 20, 'Braune kurze gummizug-Jogginghose -M-', 1, 1, 0),
(967, 20, 'Camo kurze gummizug-Jogginghose -M-', 1, 1, 0),
(968, 20, 'Schwarze kurze gummizug-Jogginghose -M-', 1, 1, 0),
(969, 20, 'Blaue kurze gummizug-Jogginghose -M-', 1, 1, 0),
(970, 20, 'Schwarze kurze Leder Joggingshose -M-', 1, 1, 0),
(971, 20, 'Rote kurze Leder Jogginghose -M-', 1, 1, 0),
(972, 20, 'Weise kurze Leder Jogginghose -M-', 1, 1, 0),
(973, 20, 'Dunkelblaue Hipstarhose -M-', 1, 1, 0),
(974, 20, 'Schwarze Hipstarhose -M-', 1, 1, 0),
(975, 20, 'Hellblaue Hipstarhose -M-', 1, 1, 0),
(976, 20, 'Graue Hipstarhose -M-', 1, 1, 0),
(977, 20, 'Schwarze Leder Hipstarhose -M-', 1, 1, 0),
(978, 20, 'Rote Leder Hipstarhose -M-', 1, 1, 0),
(979, 20, 'Weise Leder Hipstarhose -M-', 1, 1, 0),
(980, 20, 'Braune Leder Hipstarhose -M-', 1, 1, 0),
(981, 20, 'Neonhose 1 -M-', 1, 1, 0),
(982, 20, 'Neonhose 2 -M-', 1, 1, 0),
(983, 20, 'Neonhose 3 -M-', 1, 1, 0),
(984, 20, 'Blaue Flecken Hose mit Taschen -M-', 1, 1, 0),
(985, 20, 'Braune Flecken Hose mit Taschen -M-', 1, 1, 0),
(986, 20, 'Gruene Flecken Hose mit Taschen -M-', 1, 1, 0),
(987, 20, 'Beige Flecken Hose mit Taschen -M-', 1, 1, 0),
(988, 20, 'Wuestentarn Hose mit Taschen -M-', 1, 1, 0),
(989, 20, 'Tarn Hose mit Taschen -M-', 1, 1, 0),
(990, 20, 'Karierte Hose mit Taschen -M-', 1, 1, 0),
(991, 20, 'Blaue Tarn Hose mit Taschen -M-', 1, 1, 0),
(992, 20, 'Armee Hose mit Taschen -M-', 1, 1, 0),
(993, 20, 'Gruene Tarn Hose mit Taschen -M-', 1, 1, 0),
(994, 20, 'Orangene Tarn Hose mit Taschen -M-', 1, 1, 0),
(995, 20, 'Lilane Tarn Hose mit Taschen -M-', 1, 1, 0),
(996, 20, 'Rosane Tarn Hose mit Taschen -M-', 1, 1, 0),
(997, 20, 'Blaue Flecken Hose zum reinstecken -M-', 1, 1, 0),
(998, 20, 'Braune Flecken Hose zum reinstecken -M-', 1, 1, 0),
(999, 20, 'Gruene Flecken Hose zum reinstecken -M-', 1, 1, 0),
(1000, 20, 'Beige Flecken Hose zum reinstecken -M-', 1, 1, 0),
(1001, 20, 'Wuestentarn Hose zum reinstecken -M-', 1, 1, 0),
(1002, 20, 'Tarn Hose zum reinstecken -M-', 1, 1, 0),
(1003, 20, 'Karierte Hose zum reinstecken -M-', 1, 1, 0),
(1004, 20, 'Blaue Tarn Hose zum reinstecken -M-', 1, 1, 0),
(1005, 20, 'ArmeeHose zum reinstecken -M-', 1, 1, 0),
(1006, 20, 'Gruene Hose zum reinstecken -M-', 1, 1, 0),
(1007, 20, 'Orangene Hose zum reinstecken -M-', 1, 1, 0),
(1008, 20, 'Lilane Hose zum reinstecken -M-', 1, 1, 0),
(1009, 20, 'Rosane Hose zum reinstecken -M-', 1, 1, 0),
(1010, 20, 'Wuestentarn Shorts -M-', 1, 1, 0),
(1011, 20, 'Karierte Shorts -M-', 1, 1, 0),
(1012, 20, 'Blaue Tarn Shorts -M-', 1, 1, 0),
(1013, 20, 'Armee Shorts -M-', 1, 1, 0),
(1014, 20, 'Gruene Tarn Shorts -M-', 1, 1, 0),
(1015, 20, 'Orangene Tarn Shorts -M-', 1, 1, 0),
(1016, 20, 'Lilane Tarn Shorts -M-', 1, 1, 0),
(1017, 20, 'Rosane Tarn Shorts -M-', 1, 1, 0),
(1018, 20, 'Blaue Flecken Latzhose -M-', 1, 1, 0),
(1019, 20, 'Braune Latzhose -M-', 1, 1, 0),
(1020, 20, 'Gruene Latzhose -M-', 1, 1, 0),
(1021, 20, 'Graue Latzhose -M-', 1, 1, 0),
(1022, 20, 'Beige Latzhose -M-', 1, 1, 0),
(1023, 20, 'Karierte Latzhose -M-', 1, 1, 0),
(1024, 20, 'Blaue Tarn Latzhose -M-', 1, 1, 0),
(1025, 20, 'Hellgruene Latzhose -M-', 1, 1, 0),
(1026, 20, 'Gelbe Latzhose -M-', 1, 1, 0),
(1027, 20, 'Schwarze Latzhose -M-', 1, 1, 0),
(1028, 20, 'Graue Latzhose -M-', 1, 1, 0),
(1029, 20, 'Weise Latzhose -M-', 1, 1, 0),
(1030, 20, 'Braune Latzhose -M-', 1, 1, 0),
(1031, 20, 'Dunkelblaue Jeans-Latzhose -M-', 1, 1, 0),
(1032, 20, 'Hellblaue Jeans-Latzhose -M-', 1, 1, 0),
(1033, 20, 'Graue Jeans-Latzhose -M-', 1, 1, 0),
(1034, 20, 'Schwarze Jeans-Latzhose -M-', 1, 1, 0),
(1035, 20, 'Schwarze Maennerleggings -M-', 1, 1, 0),
(1036, 20, 'Graue Maennerleggings -M-', 1, 1, 0),
(1037, 20, 'Gelbe Arbeitshose -M-', 1, 1, 0),
(1038, 20, 'Schwarze Arbeitshose -M-', 1, 1, 0),
(1039, 20, 'Weise Arbeitshose -M-', 1, 1, 0),
(1040, 20, 'Graue Arbeitshose -M-', 1, 1, 0),
(1041, 20, 'Hellbraune Arbeitshose -M-', 1, 1, 0),
(1043, 20, 'Orangene Arbeitshose -M-', 1, 1, 0),
(1044, 20, 'Tarnflecken Arbeitshose -M-', 1, 1, 0),
(1045, 20, 'Gelbe Arbeitshose zum Reinstecken -M-', 1, 1, 0),
(1046, 20, 'Schwarze Arbeitshose zum Reinstecken -M-', 1, 1, 0),
(1047, 20, 'Weise Arbeitshose zum Reinstecken -M-', 1, 1, 0),
(1048, 20, 'Graue Arbeitshose zum Reinstecken -M-', 1, 1, 0),
(1049, 20, 'Braune Arbeitshose zum Reinstecken -M-', 1, 1, 0),
(1050, 20, 'Beige Arbeitshose zum Reinstecken -M-', 1, 1, 0),
(1051, 20, 'Orangene Arbeitshose zum Reinstecken -M-', 1, 1, 0),
(1052, 20, 'Tarnfecken Arbeitshose zum Reinstecken -M-', 1, 1, 0),
(1053, 20, 'Grau-Blaue Arbeitshose zum Reinstecken -M-', 1, 1, 0),
(1054, 20, 'Hellblaue Arbeitshose zum Reinstecken -M-', 1, 1, 0),
(1055, 20, 'Pinke Arbeitshose zum Reinstecken -M-', 1, 1, 0),
(1056, 20, 'Hellgraue Arbeitshose zum Reinstecken -M-', 1, 1, 0),
(1057, 20, 'Orang-Schwarze Arbeitshose zum Reinstecken -M-', 1, 1, 0),
(1058, 20, 'Rot-Schwarze Arbeitshose zum Reinstecken -M-', 1, 1, 0),
(1059, 20, 'Weis-Rote Arbeitshose zum Reinstecken -M-', 1, 1, 0),
(1060, 20, 'Große Schwarz-geblumte Jogginghose -M-', 1, 1, 0),
(1061, 20, 'Große Weis-geblumte Jogginghose -M-', 1, 1, 0),
(1062, 20, 'Große Rot-geblumte Jogginghose -M-', 1, 1, 0),
(1063, 20, 'Große Blau-gemusterte Jogginghose -M-', 1, 1, 0),
(1064, 20, 'Große Gruen-gemusterte Jogginghose -M-', 1, 1, 0),
(1065, 20, 'Große Wuestentarn Jogginghose -M-', 1, 1, 0),
(1066, 20, 'Große Orangene-Tarn Jogginghose -M-', 1, 1, 0),
(1067, 20, 'Große Lilane-Tarn Jogginghose -M-', 1, 1, 0),
(1068, 20, 'Schwarze Hose mit Ketten -M-', 1, 1, 0),
(1069, 20, 'Graue Hose mit Ketten -M-', 1, 1, 0),
(1070, 20, 'Weise Hose mit Ketten -M-', 1, 1, 0),
(1071, 20, 'Braune Hose mit Ketten -M-', 1, 1, 0),
(1072, 20, 'Beige Hose mit Ketten -M-', 1, 1, 0),
(1073, 20, 'Graue Tarn Hose mit Ketten -M-', 1, 1, 0),
(1074, 20, 'Tarn Hose mit Ketten -M-', 1, 1, 0),
(1075, 20, 'Gruene Tarn Hose mit Ketten -M-', 1, 1, 0),
(1076, 20, 'Orangene Tarn Hose mit Ketten -M-', 1, 1, 0),
(1077, 20, 'Lilane Tarn Hose mit Ketten -M-', 1, 1, 0),
(1078, 20, 'Rosane Tarn Hose mit Ketten -M-', 1, 1, 0),
(1079, 20, 'Schwarze Kurze Hose mit Ketten -M-', 1, 1, 0),
(1080, 20, 'Graue Kurze Hose mit Ketten -M-', 1, 1, 0),
(1081, 20, 'Weise Kurze Hose mit Ketten -M-', 1, 1, 0),
(1082, 20, 'Braune Kurze Hose mit Ketten -M-', 1, 1, 0),
(1083, 20, 'Beige Kurze Hose mit Ketten -M-', 1, 1, 0),
(1084, 20, 'Graue Tarn Kurze Hose mit Ketten -M-', 1, 1, 0),
(1085, 20, 'Tarn Kurze Hose mit Ketten -M-', 1, 1, 0),
(1086, 20, 'Gruene Tarn Kurze Hose mit Ketten -M-', 1, 1, 0),
(1087, 20, 'Orangene Tarn Kurze Hose mit Ketten -M-', 1, 1, 0),
(1088, 20, 'Lilane Tarn Kurze Hose mit Ketten -M-', 1, 1, 0),
(1089, 20, 'Rosane Tarn Kurze Hose mit Ketten -M-', 1, 1, 0),
(1090, 20, 'Schwarze Cowboyhose -M-', 1, 1, 0),
(1091, 20, 'Rot-Schwarze Cowboyhose -M-', 1, 1, 0),
(1092, 20, 'Braune Outlawhose -M-', 1, 1, 0),
(1093, 20, 'Schwarze Outlawhose -M-', 1, 1, 0),
(1094, 20, 'Beige Outlawhose -M-', 1, 1, 0),
(1095, 20, 'Rote Outlawhose -M-', 1, 1, 0),
(1096, 20, 'Blaue Neonhose -M-', 1, 1, 0),
(1097, 20, 'Lilan Neonhose -M-', 1, 1, 0),
(1098, 20, 'Gruene Neonhose -M-', 1, 1, 0),
(1099, 20, 'Pinke Neonhose -M-', 1, 1, 0),
(1100, 20, 'Universum Neonhose -M-', 1, 1, 0),
(1101, 20, 'Schwarz-Weise Schuhe -M-', 1, 1, 0),
(1102, 20, 'Weise Schuhe -M-', 1, 1, 0),
(1103, 20, 'Schwarze Schuhe -M-', 1, 1, 0),
(1104, 20, 'Pink-Schwarze Schuhe -M-', 1, 1, 0),
(1105, 20, 'Braune Schuhe -M-', 1, 1, 0),
(1106, 20, 'Tuerikiese Schuhe -M-', 1, 1, 0),
(1107, 20, 'Petrolfabene Schuhe -M-', 1, 1, 0),
(1108, 20, 'Schwarz-Rote Schuhe -M-', 1, 1, 0),
(1109, 20, 'Tarnfarbene Schuhe -M-', 1, 1, 0);
INSERT INTO `server_shop_items` (`id`, `shopid`, `itemName`, `itemAmount`, `itemPrice`, `itemGender`) VALUES
(1110, 20, 'Schwarz-Karierte Schuhe -M-', 1, 1, 0),
(1111, 20, 'Rot-Schwarze Schuhe -M-', 1, 1, 0),
(1112, 20, 'Gruene Schuhe -M-', 1, 1, 0),
(1113, 20, 'Beige Schuhe -M-', 1, 1, 0),
(1114, 20, 'Graue Schuhe -M-', 1, 1, 0),
(1115, 20, 'Ganz Schwarze Schuhe -M-', 1, 1, 0),
(1116, 20, 'Weis-Schwarze Schuhe -M-', 1, 1, 0),
(1117, 20, 'Schwarz-Graue Asiaschuhe -M-', 1, 1, 0),
(1118, 20, 'Schwarze Asiaschuhe -M-', 1, 1, 0),
(1119, 20, 'Dunkelgraue Asiaschuhe -M-', 1, 1, 0),
(1120, 20, 'Braune Asiaschuhe -M-', 1, 1, 0),
(1121, 20, 'Schwarz-Weise Asiaschuhe -M-', 1, 1, 0),
(1122, 20, 'Graue Asiaschuhe -M-', 1, 1, 0),
(1123, 20, 'Rote Asiaschuhe -M-', 1, 1, 0),
(1124, 20, 'Gruene Asiaschuhe -M-', 1, 1, 0),
(1125, 20, 'Beige Asiaschuhe -M-', 1, 1, 0),
(1126, 20, 'Orangene Asiaschuhe -M-', 1, 1, 0),
(1127, 20, 'Lilane Asiaschuhe -M-', 1, 1, 0),
(1128, 20, 'Karierte Asiaschuhe -M-', 1, 1, 0),
(1129, 20, 'Grau-Rote Asiaschuhe -M-', 1, 1, 0),
(1130, 20, 'Grau-Schwarze Asiaschuhe -M-', 1, 1, 0),
(1131, 20, 'Blaue Asiaschuhe -M-', 1, 1, 0),
(1132, 20, 'Dunkelblaue Chucks -M-', 1, 1, 0),
(1133, 20, 'Ganz-Schwarze Chucks -M-', 1, 1, 0),
(1134, 20, 'Ganz-Weise Chucks -M-', 1, 1, 0),
(1135, 20, 'Rote Chucks -M-', 1, 1, 0),
(1136, 20, 'Schwarz-Weise FlipFlops -M-', 1, 1, 0),
(1137, 20, 'Graue FlipFlops -M-', 1, 1, 0),
(1138, 20, 'Schwarze FlipFlops -M-', 1, 1, 0),
(1139, 20, 'Schwarz-Gruene FlipFlops -M-', 1, 1, 0),
(1140, 20, 'Schwarze Badeschlappen -M-', 1, 1, 0),
(1141, 20, 'Blaue Badeschlappen -M-', 1, 1, 0),
(1142, 20, 'Weise Schuhe mit Socken -M-', 1, 1, 0),
(1143, 20, 'Graue Schuhe mit Socken -M-', 1, 1, 0),
(1144, 20, 'Schwarze Schuhe mit Socken -M-', 1, 1, 0),
(1145, 20, 'Armeefarbene Schuhe mit Socken -M-', 1, 1, 0),
(1146, 20, 'Schwarze-Blaue Schuhe mit Socken -M-', 1, 1, 0),
(1147, 20, 'Rot-Gelbe Schuhe mit Socken -M-', 1, 1, 0),
(1148, 20, 'Weis-Rote Schuhe mit Socken -M-', 1, 1, 0),
(1149, 20, 'Orang-Schwarze Schuhe mit Socken -M-', 1, 1, 0),
(1150, 20, 'Schwarz-Gruene Schuhe mit Socken -M-', 1, 1, 0),
(1151, 20, 'Rot-Weise Schuhe mit Socken -M-', 1, 1, 0),
(1152, 20, 'Blau-Gruene Schuhe mit Socken -M-', 1, 1, 0),
(1153, 20, 'Gelbe Schuhe mit Socken -M-', 1, 1, 0),
(1154, 20, 'Schwarz-Lilane Schuhe mit Socken -M-', 1, 1, 0),
(1155, 20, 'Weis-Gelbe Schuhe mit Socken -M-', 1, 1, 0),
(1156, 20, 'Graue Schuhe mit Streifen -M-', 1, 1, 0),
(1157, 20, 'Schwarze Schuhe mit Streifen -M-', 1, 1, 0),
(1158, 20, 'Schwarz-Weise Schuhe mit Streifen -M-', 1, 1, 0),
(1159, 20, 'Schwarz-Blaue Schuhe mit Streifen -M-', 1, 1, 0),
(1160, 20, 'Blaue Schuhe mit Streifen -M-', 1, 1, 0),
(1161, 20, 'Gelbe Schuhe mit Streifen -M-', 1, 1, 0),
(1162, 20, 'Rote Schuhe mit Streifen -M-', 1, 1, 0),
(1163, 20, 'Orangene Schuhe mit Streifen -M-', 1, 1, 0),
(1164, 20, 'Blau-Graue Schuhe mit Streifen -M-', 1, 1, 0),
(1165, 20, 'Grau-Orangene Schuhe mit Streifen -M-', 1, 1, 0),
(1166, 20, 'Rot-Weise Schuhe mit Streifen -M-', 1, 1, 0),
(1167, 20, 'Lila-Orangene Schuhe mit Streifen -M-', 1, 1, 0),
(1168, 20, 'Gruen-Gelbe Schuhe mit Streifen -M-', 1, 1, 0),
(1169, 20, 'Leoparten Schuhe mit Streifen -M-', 1, 1, 0),
(1170, 20, 'Neon Gelbe Schuhe mit Streifen -M-', 1, 1, 0),
(1171, 20, 'Weise Schuhe mit Pfeil -M-', 1, 1, 0),
(1172, 20, 'Graue Schuhe mit Pfeil -M-', 1, 1, 0),
(1173, 20, 'Schwarze Schuhe mit Pfeil -M-', 1, 1, 0),
(1174, 20, 'Rote Schuhe mit Pfeil -M-', 1, 1, 0),
(1175, 20, 'Gruene Schuhe mit Pfeil -M-', 1, 1, 0),
(1176, 20, 'Lilane Schuhe mit Pfeil -M-', 1, 1, 0),
(1177, 20, 'Gelbe Schuhe mit Pfeil -M-', 1, 1, 0),
(1178, 20, 'Blaue Schuhe mit Pfeil -M-', 1, 1, 0),
(1179, 20, 'Orangene Schuhe mit Pfeil -M-', 1, 1, 0),
(1180, 20, 'Rot-Gelbe Schuhe mit Pfeil -M-', 1, 1, 0),
(1181, 20, 'Gruen-Weise Schuhe mit Pfeil -M-', 1, 1, 0),
(1182, 20, 'Orang-Weise Schuhe mit Pfeil -M-', 1, 1, 0),
(1183, 20, 'Gelb-Blaue Schuhe mit Pfeil -M-', 1, 1, 0),
(1184, 20, 'Schwarz-Weise Schuhe mit Pfeil -M-', 1, 1, 0),
(1185, 20, 'Leoparten Schuhe mit Pfeil -M-', 1, 1, 0),
(1186, 20, 'Schwarze Schicke-Anzugsschuhe -M-', 1, 1, 0),
(1187, 20, 'Braune Timberland-Boots -M-', 1, 1, 0),
(1188, 20, 'Schwarz-Weise Timberland-Boots -M-', 1, 1, 0),
(1189, 20, 'Hellblaue Timberland-Boots -M-', 1, 1, 0),
(1190, 20, 'Schwarz-Graue Timberland-Boots -M-', 1, 1, 0),
(1191, 20, 'Weis-Braune Timberland-Boots -M-', 1, 1, 0),
(1192, 20, 'Dunkelblaue Timberland-Boots -M-', 1, 1, 0),
(1193, 20, 'Schwarze Timberland-Boots -M-', 1, 1, 0),
(1194, 20, 'Graue Timberland-Boots -M-', 1, 1, 0),
(1195, 20, 'Dunkelbraune Timberland-Boots -M-', 1, 1, 0),
(1196, 20, 'Rote Timberland-Boots -M-', 1, 1, 0),
(1197, 20, 'Weise Timberland-Boots -M-', 1, 1, 0),
(1198, 20, 'Weis-Blaue Timberland-Boots -M-', 1, 1, 0),
(1199, 20, 'Beige Timberland-Boots -M-', 1, 1, 0),
(1200, 20, 'Pinke Timberland-Boots -M-', 1, 1, 0),
(1201, 20, 'Schwarz Braune Timberland-Boots -M-', 1, 1, 0),
(1202, 20, 'Tarnmuster Timberland-Boots -M-', 1, 1, 0),
(1203, 20, 'Dunkelgraue Boots -M-', 1, 1, 0),
(1204, 20, 'Schwarze Boots -M-', 1, 1, 0),
(1205, 20, 'Schwarz-Gruene Boots -M-', 1, 1, 0),
(1206, 20, 'Dunkelblau-Pinke Boots -M-', 1, 1, 0),
(1207, 20, 'Beige Boots -M-', 1, 1, 0),
(1208, 20, 'Orangene Boots -M-', 1, 1, 0),
(1209, 20, 'Rote Boots -M-', 1, 1, 0),
(1210, 20, 'Hellgraue Boots -M-', 1, 1, 0),
(1211, 20, 'Braune Boots -M-', 1, 1, 0),
(1212, 20, 'Graue Boots -M-', 1, 1, 0),
(1213, 20, 'Weis-SChwarze Boots -M-', 1, 1, 0),
(1214, 20, 'Hellbraune Boots -M-', 1, 1, 0),
(1215, 20, 'Schwarz-Blaue Boots -M-', 1, 1, 0),
(1216, 20, 'Beige-Orange Boots -M-', 1, 1, 0),
(1217, 20, 'Schwarz-Braune Boots -M-', 1, 1, 0),
(1218, 20, 'Schwarz-Weise Boots -M-', 1, 1, 0),
(1219, 20, 'Schwarze Lederschuhe -M-', 1, 1, 0),
(1220, 20, 'Braune Lederschuhe -M-', 1, 1, 0),
(1221, 20, 'Rote Lederschuhe -M-', 1, 1, 0),
(1222, 20, 'Gruene Lederschuhe -M-', 1, 1, 0),
(1223, 20, 'Hellbraune Lederschuhe -M-', 1, 1, 0),
(1224, 20, 'Graue Lederschuhe -M-', 1, 1, 0),
(1225, 20, 'Blaue Lederschuhe -M-', 1, 1, 0),
(1226, 20, 'Gruene FlipFlops -M-', 1, 1, 0),
(1227, 20, 'Lilane FlipFlops -M-', 1, 1, 0),
(1228, 20, 'Gelbe FlipFlops -M-', 1, 1, 0),
(1229, 20, 'Schwarz-Weise Schicke-Anzugsschuhe -M-', 1, 1, 0),
(1230, 20, 'Weis-Schwarze Schicke-Anzugsschuhe -M-', 1, 1, 0),
(1231, 20, 'Weis-Scharze Anzugsschuhe mit Knöpfe -M-', 1, 1, 0),
(1232, 20, 'Braune Schicke Anzugsschuhe -M-', 1, 1, 0),
(1233, 20, 'Schwarz-Braune Schicke Anzugsschuhe -M-', 1, 1, 0),
(1234, 20, 'Schwarze Smokingschuhe -M-', 1, 1, 0),
(1235, 20, 'Rote Smokingschuhe -M-', 1, 1, 0),
(1236, 20, 'Braune Smokingschuhe -M-', 1, 1, 0),
(1237, 20, 'Gruene Smokingschuhe -M-', 1, 1, 0),
(1238, 20, 'Hellbraune Smokingschuhe -M-', 1, 1, 0),
(1239, 20, 'Blaue Smokingschuhe -M-', 1, 1, 0),
(1240, 20, 'Weise Smokingschuhe -M-', 1, 1, 0),
(1241, 20, 'Hellblaue Chucks -M-', 1, 1, 0),
(1242, 20, 'Hellgruene Chucks -M-', 1, 1, 0),
(1243, 20, 'Orangene Chucks -M-', 1, 1, 0),
(1244, 20, 'Gelbe Chucks -M-', 1, 1, 0),
(1245, 20, 'Lilane Chucks -M-', 1, 1, 0),
(1246, 20, 'Grau-Schwarze Chucks -M-', 1, 1, 0),
(1247, 20, 'Karierte Chucks -M-', 1, 1, 0),
(1248, 20, 'Tarnfarbene Chucks -M-', 1, 1, 0),
(1249, 20, 'Braune Chucks -M-', 1, 1, 0),
(1250, 20, 'Hellblaue-Karierte Chucks -M-', 1, 1, 0),
(1251, 20, 'Grune-Karierte Chucks -M-', 1, 1, 0),
(1252, 20, 'Beige Chucks -M-', 1, 1, 0),
(1253, 20, 'Schwarze Bikerstiefel -M-', 1, 1, 0),
(1254, 20, 'Schwarze Kampfstiefel -M-', 1, 1, 0),
(1255, 20, 'Dreckige Bikerstiefel -M-', 1, 1, 0),
(1256, 20, 'Weise Nieten-Schuhe -M-', 1, 1, 0),
(1257, 20, 'Schwarze Nieten-Schuhe -M-', 1, 1, 0),
(1258, 20, 'Goldene Hohe Schuhe -M-', 1, 1, 0),
(1259, 20, 'Schwarze-Weise Schlappen -M-', 1, 1, 0),
(1260, 20, 'Schwarze Schlappe -M-', 1, 1, 0),
(1261, 20, 'Grau-Gelbe Turnschuhe -M-', 1, 1, 0),
(1262, 20, 'Schwarze-Gelbe Turnschuhe -M-', 1, 1, 0),
(1263, 20, 'Weis-Gelbe Turnschuhe -M-', 1, 1, 0),
(1264, 20, 'Schwarz-Weise Baskettballschuhe -M-', 1, 1, 0),
(1265, 20, 'Weis-Schwarze Baskettballschuhe -M-', 1, 1, 0),
(1266, 20, 'Weis-Dunkelblaue Baskettballschuhe -M-', 1, 1, 0),
(1267, 20, 'Schwarz-Rote Baskettballschuhe -M-', 1, 1, 0),
(1268, 20, 'Weise Baskettballschuhe -M-', 1, 1, 0),
(1269, 20, 'Rot-Weise Baskettballschuhe -M-', 1, 1, 0),
(1270, 20, 'Beige Kampfstiefel  -M-', 1, 1, 0),
(1271, 20, 'Gruene Kampfstiefel -M-', 1, 1, 0),
(1272, 20, 'Schwarze Cowboy-Stiefel -M-', 1, 1, 0),
(1273, 20, 'Braune Cowboy-Stiefel -M-', 1, 1, 0),
(1274, 20, 'Beige Cowboy-Stiefel -M-', 1, 1, 0),
(1275, 20, 'Dunkelbraune Cowboy-Stiefel -M-', 1, 1, 0),
(1276, 20, 'Schwarze-Rote Cowboy-Stiefel -M-', 1, 1, 0),
(1277, 20, 'Schwarze Cowboy-Boots -M-', 1, 1, 0),
(1278, 20, 'Braune Cowboy-Boots -M-', 1, 1, 0),
(1279, 20, 'Beige Cowboy-Boots -M-', 1, 1, 0),
(1280, 20, 'Dunkelbraune Cowboy-Boots -M-', 1, 1, 0),
(1281, 20, 'Schwarz-Rote Cowboy-Boots -M-', 1, 1, 0),
(1282, 20, 'Blaue Schicke-Anzugsschuhe -M-', 1, 1, 0),
(1283, 20, 'Rot-WEise Schicke-Anzugsschuhe -M-', 1, 1, 0),
(1284, 20, 'Rote Hausschuhe -M-', 1, 1, 0),
(1285, 20, 'Weise Slipper -M-', 1, 1, 0),
(1286, 20, 'Schwarze Slipper -M-', 1, 1, 0),
(1287, 20, 'Gelbe Lederboots -M-', 1, 1, 0),
(1288, 20, 'Braune Lederboots -M-', 1, 1, 0),
(1289, 20, 'Graue Lederboots -M-', 1, 1, 0),
(1290, 20, 'Schware Lederboots -M-', 1, 1, 0),
(1291, 20, 'Blaue Lederboots -M-', 1, 1, 0),
(1292, 20, 'Rote Lederboots -M-', 1, 1, 0),
(1293, 20, 'Gruene Lederboots -M-', 1, 1, 0),
(1294, 20, 'Tuerkiese Cowboy-Stiefel -M-', 1, 1, 0),
(1295, 20, 'Rosane Cowboy-Stiefel -M-', 1, 1, 0),
(1296, 20, 'Weis-Rote Cowboy-Stiefel -M-', 1, 1, 0),
(1297, 20, 'Rot-Gruene Cowboy-Stiefel -M-', 1, 1, 0),
(1298, 20, 'Dunkelrote Cowboy-Stiefel -M-', 1, 1, 0),
(1299, 20, 'Rote Cowboy-Stiefel -M-', 1, 1, 0),
(1300, 20, 'Hellgruene Cowboy-Stiefel -M-', 1, 1, 0),
(1301, 20, 'Lilane Cowboy-Stiefel -M-', 1, 1, 0),
(1302, 20, 'Orangene Cowboy-Stiefel -M-', 1, 1, 0),
(1303, 20, 'Tuerkiese Cowboy-Boots -M-', 1, 1, 0),
(1304, 20, 'Rosane Cowboy-Boots -M-', 1, 1, 0),
(1305, 20, 'Weis-Rote Cowboy-Boots -M-', 1, 1, 0),
(1306, 20, 'Rot-Gruene Cowboy-Boots -M-', 1, 1, 0),
(1307, 20, 'Dunkelrote Cowboy-Boots -M-', 1, 1, 0),
(1308, 20, 'Rote Cowboy-Boots -M-', 1, 1, 0),
(1309, 20, 'Hellgruene Cowboy-Boots -M-', 1, 1, 0),
(1310, 20, 'Lilane Cowboy-Boots -M-', 1, 1, 0),
(1311, 20, 'Orangene Cowboy-Boots -M-', 1, 1, 0),
(1312, 20, 'Blau-Weise Hohe Sneaker -M-', 1, 1, 0),
(1313, 20, 'Schwarz-Weise Hohe Sneaker -M-', 1, 1, 0),
(1314, 20, 'Rot-Weise Hohe Sneaker -M-', 1, 1, 0),
(1315, 20, 'Schwarze Hohe Sneaker -M-', 1, 1, 0),
(1316, 20, 'Gruene-Beige Hohe Sneaker -M-', 1, 1, 0),
(1317, 20, 'Weise Hohe Sneaker -M-', 1, 1, 0),
(1318, 20, 'Grun-Weise Hohe Sneaker -M-', 1, 1, 0),
(1319, 20, 'Orang-Weise Hohe Sneaker -M-', 1, 1, 0),
(1320, 20, 'Lila-Weise Hohe Sneaker -M-', 1, 1, 0),
(1321, 20, 'Rosa-Weise Hohe Sneaker -M-', 1, 1, 0),
(1322, 20, 'Rosane Chucks -M-', 1, 1, 0),
(1323, 20, 'Schwarze geschnuerrte Lederstiefel -M-', 1, 1, 0),
(1324, 20, 'Rote geschnuerrte Lederstiefel -M-', 1, 1, 0),
(1325, 20, 'Braune geschnuerrte Lederstiefel -M-', 1, 1, 0),
(1326, 20, 'Schwarz geschnuerrte Lederboots -M-', 1, 1, 0),
(1327, 20, 'Rote geschnuerrte Lederboots -M-', 1, 1, 0),
(1328, 20, 'Braune geschnuerrte Lederboots -M-', 1, 1, 0),
(1329, 20, 'Braune Stiefeletten -M-', 1, 1, 0),
(1330, 20, 'Schwarze Stiefeletten -M-', 1, 1, 0),
(1331, 20, 'Schwarze offene Lederstiefel -M-', 1, 1, 0),
(1332, 20, 'Rote offene Lederstiefel -M-', 1, 1, 0),
(1333, 20, 'Braune offene Lederstiefel -M-', 1, 1, 0),
(1334, 20, 'Schwarz-Gelbe Motorradschuhe -M-', 1, 1, 0),
(1335, 20, 'Schwarz-Gruene Motorradschuhe -M-', 1, 1, 0),
(1336, 20, 'Schwarz-Orange Motorradschuhe -M-', 1, 1, 0),
(1337, 20, 'Schwarz-Blaue Motorradschuhe -M-', 1, 1, 0),
(1338, 20, 'Schwarz-Pinke Motorradschuhe -M-', 1, 1, 0),
(1339, 20, 'Schwarz-Rote Motorradschuhe -M-', 1, 1, 0),
(1340, 20, 'Schwarz-Graue Motorradschuhe -M-', 1, 1, 0),
(1341, 20, 'Beige Hohe Schuhe -M-', 1, 1, 0),
(1342, 20, 'Lilane Hohe Schuhe -M-', 1, 1, 0),
(1343, 20, 'Hellblaue Hohe Schuhe -M-', 1, 1, 0),
(1344, 20, 'Orange Hohe Schuhe -M-', 1, 1, 0),
(1345, 20, 'Neonschuhe 1 -M-', 1, 1, 0),
(1346, 20, 'Neonschuhe 2 -M-', 1, 1, 0),
(1347, 20, 'Neonschuhe 3 -M-', 1, 1, 0),
(1348, 20, 'Schwarze Wanderstiefel -M-', 1, 1, 0),
(1349, 20, 'Beige Wanderstiefel -M-', 1, 1, 0),
(1350, 20, 'Braun-Beige Wanderstiefel -M-', 1, 1, 0),
(1351, 20, 'Dunkelgruene Wanderstiefel -M-', 1, 1, 0),
(1353, 20, 'Dunkelbraune Wanderstiefel -M-', 1, 1, 0),
(1354, 20, 'Gelbe Wanderstiefel -M-', 1, 1, 0),
(1355, 20, 'Braune Wanderstiefel -M-', 1, 1, 0),
(1356, 20, 'Schwarze Wanderschuhe -M-', 1, 1, 0),
(1357, 20, 'Beige Wanderschuhe -M-', 1, 1, 0),
(1358, 20, 'Braun-Beige Wanderschuhe -M-', 1, 1, 0),
(1359, 20, 'Dunkelgruene Wanderschuhe -M-', 1, 1, 0),
(1360, 20, 'Orangene Wanderschuhe -M-', 1, 1, 0),
(1361, 20, 'Dunkelbraune Wanderschuhe -M-', 1, 1, 0),
(1362, 20, 'Gelbe Wanderschuhe -M-', 1, 1, 0),
(1363, 20, 'Braune Wanderschuhe -M-', 1, 1, 0),
(1364, 20, 'Gruene Hohe Sneaker -M-', 1, 1, 0),
(1365, 20, 'Schwarz-Tuerkiese Hohe Sneaker -M-', 1, 1, 0),
(1366, 20, 'Rot-Blaue Hohe Sneaker -M-', 1, 1, 0),
(1367, 20, 'Rot-Schwarze Hohe Sneaker -M-', 1, 1, 0),
(1368, 20, 'Schwarz-Goldene Hohe Sneaker -M-', 1, 1, 0),
(1369, 20, 'Schwarz-Gelbe Hohe Sneaker -M-', 1, 1, 0),
(1370, 20, 'Weis-Schwarze Hohe Sneaker -M-', 1, 1, 0),
(1371, 20, 'Hellbraune Hohe Sneaker -M-', 1, 1, 0),
(1372, 20, 'Beige-Braune Arbeitsstiefel -M-', 1, 1, 0),
(1373, 20, 'Orangene Arbeitsstiefel -M-', 1, 1, 0),
(1374, 20, 'Grau-Blaue Arbeitsstiefel -M-', 1, 1, 0),
(1375, 20, 'Blaue Arbeitsstiefel -M-', 1, 1, 0),
(1376, 20, 'Pinke Arbeitsstiefel -M-', 1, 1, 0),
(1377, 20, 'Weis-Graue Arbeitsstiefel -M-', 1, 1, 0),
(1378, 20, 'Schwarz-Orangene Arbeitsstiefel -M-', 1, 1, 0),
(1379, 20, 'Schwarz-Rote Arbeitsstiefel -M-', 1, 1, 0),
(1380, 20, 'Beige-Braune Arbeitsschuhe -M-', 1, 1, 0),
(1381, 20, 'Graue Arbeitsschuhe -M-', 1, 1, 0),
(1382, 20, 'Rot-Weise Arbeitsschuhe -M-', 1, 1, 0),
(1383, 20, 'Hellgraue Arbeitsschuhe -M-', 1, 1, 0),
(1384, 20, 'Orangene Arbeitsschuhe -M-', 1, 1, 0),
(1385, 20, 'Grau-Blaue Arbeitsschuhe -M-', 1, 1, 0),
(1386, 20, 'Blaue Arbeitsschuhe -M-', 1, 1, 0),
(1387, 20, 'Pinke Arbeitsschuhe -M-', 1, 1, 0),
(1388, 20, 'Weis-Graue Arbeitsschuhe -M-', 1, 1, 0),
(1389, 20, 'Schwarz-Orangene Arbeitsschuhe -M-', 1, 1, 0),
(1390, 20, 'Schwarz-Rote Arbeitsschuhe -M-', 1, 1, 0),
(1391, 20, 'Tuerkies-Weise hohe Sneaker -M-', 1, 1, 0),
(1392, 20, 'Gelb-Weise hohe Sneaker -M-', 1, 1, 0),
(1393, 20, 'Weise Große Sportschuhe -M-', 1, 1, 0),
(1394, 20, 'Schwarz-Tuerkiese Große Sportschuhe -M-', 1, 1, 0),
(1395, 20, 'Schwarze Große Sportschuhe -M-', 1, 1, 0),
(1396, 20, 'Hellgruene Große Sportschuhe -M-', 1, 1, 0),
(1397, 20, 'Weis-Graue Große Sportschuhe -M-', 1, 1, 0),
(1398, 20, 'Schwarz-Rote Große Sportschuhe -M-', 1, 1, 0),
(1399, 20, 'Orang-Schwarze Große Sportschuhe -M-', 1, 1, 0),
(1400, 20, 'Gruene Große Sportschuhe -M-', 1, 1, 0),
(1401, 20, 'Orangene Große Sportschuhe -M-', 1, 1, 0),
(1402, 20, 'Lilane Große Sportschuhe -M-', 1, 1, 0),
(1403, 20, 'Rosane Große Sportschuhe -M-', 1, 1, 0),
(1404, 20, 'Hellgraue Große Sportschuhe -M-', 1, 1, 0),
(1405, 20, 'Schwarz-Pinke Große Sportschuhe -M-', 1, 1, 0),
(1406, 20, 'Weis-Graue Große Sportschuhe -M-', 1, 1, 0),
(1407, 20, 'Rot-Weise Große Sportschuhe -M-', 1, 1, 0),
(1408, 20, 'Beige Große Sportschuhe -M-', 1, 1, 0),
(1409, 20, 'Tuerkiese Große Sportschuhe -M-', 1, 1, 0),
(1410, 20, 'Rote Große Sportschuhe -M-', 1, 1, 0),
(1411, 20, 'Weis-Hellblaue LED-Schuhe -M-', 1, 1, 0),
(1412, 20, 'Weis-Gruene LED-Schuhe -M-', 1, 1, 0),
(1413, 20, 'Weis-Pinke LED-Schuhe -M-', 1, 1, 0),
(1414, 20, 'Weis-Rote LED-Schuhe -M-', 1, 1, 0),
(1415, 20, 'Weis-Tuerkiese LED-Schuhe -M-', 1, 1, 0),
(1416, 20, 'Weis-Dunkelgruen LED-Schuhe -M-', 1, 1, 0),
(1417, 20, 'Weis-Lilane LED-Schuhe -M-', 1, 1, 0),
(1418, 20, 'Weis-Rote LED-Schuhe -M-', 1, 1, 0),
(1419, 20, 'Scharz-Hellblaue LED-Schuhe -M-', 1, 1, 0),
(1420, 20, 'Schwarz-Gruene LED-Schuhe -M-', 1, 1, 0),
(1421, 20, 'Schwarz-Pinke LED-Schuhe -M-', 1, 1, 0),
(1422, 20, 'Schwarz-Rote LED-Schuhe -M-', 1, 1, 0),
(1423, 20, 'Pink-Weise Hellblaue LED-Schuhe -M-', 1, 1, 0),
(1424, 20, 'Pink-Schwarz Gruene LED-Schuhe -M-', 1, 1, 0),
(1425, 20, 'Schwarz-Weis Pinke LED-Schuhe -M-', 1, 1, 0),
(1426, 20, 'Flammen-Stiefel -M-', 1, 1, 0),
(1427, 20, 'Flammen-Schuhe -M-', 1, 1, 0),
(1428, 20, 'Schwarze Schnuerrboots -M-', 1, 1, 0),
(1429, 20, 'Braune Schnuerrboots -M-', 1, 1, 0),
(1430, 20, 'Beige Schnuerrboots -M-', 1, 1, 0),
(1431, 20, 'Braune Outlaw-Stiefel -M-', 1, 1, 0),
(1432, 20, 'Schwarze Outlaw-Stiefel -M-', 1, 1, 0),
(1433, 20, 'Beige Outlaw-Stiefel -M-', 1, 1, 0),
(1434, 20, 'Rote Outlaw-Stiefel -M-', 1, 1, 0),
(1435, 20, 'Braune Outlaw-Boots -M-', 1, 1, 0),
(1436, 20, 'Schwarze Outlaw-Boots -M-', 1, 1, 0),
(1437, 20, 'Beige Outlaw-Boots -M-', 1, 1, 0),
(1438, 20, 'Rote Outlaw-Boots -M-', 1, 1, 0),
(1439, 20, 'Braune Outlaw-Schuhe -M-', 1, 1, 0),
(1440, 20, 'Schwarze Outlaw-Schuhe -M-', 1, 1, 0),
(1441, 20, 'Beige Outlaw-Schuhe -M-', 1, 1, 0),
(1442, 20, 'Rote Outlaw-Schuhe -M-', 1, 1, 0),
(1443, 20, 'Blaue Große Basketballschuhe -M-', 1, 1, 0),
(1444, 20, 'Gelbe Große Basketballschuhe -M-', 1, 1, 0),
(1445, 20, 'Gruene Große Basketballschuhe -M-', 1, 1, 0),
(1446, 20, 'Lilane Große Basketballschuhe -M-', 1, 1, 0),
(1447, 20, 'Rote Große Basketballschuhe -M-', 1, 1, 0),
(1448, 20, 'Grau Große Basketballschuhe -M-', 1, 1, 0),
(1449, 20, 'Schwarze Große Basketballschuhe -M-', 1, 1, 0),
(1450, 20, 'Tuerkiese Große Basketballschuhe -M-', 1, 1, 0),
(1451, 20, 'Rosane Große Basketballschuhe -M-', 1, 1, 0),
(1452, 20, 'Lila-Minte Große Basketballschuhe -M-', 1, 1, 0),
(1453, 20, 'Orangene Große Baetballschuhe -M-', 1, 1, 0),
(1454, 20, 'Grau-Schwarze Große Basketballschuhe -M-', 1, 1, 0),
(1455, 20, 'Grau-Weise Große Basketballschuhe -M-', 1, 1, 0),
(1456, 20, 'Hellgraue Große Basketballschuhe -M-', 1, 1, 0),
(1457, 20, 'Weises V-Ausschnitt T-Shirt -M-', 1, 1, 0),
(1458, 20, 'Graues V-Ausschnitt T-Shirt -M-', 1, 1, 0),
(1459, 20, 'Gelbes V-Ausschnitt T-Shirt -M-', 1, 1, 0),
(1460, 20, 'Rotes V-Ausschnitt T-Shirt -M-', 1, 1, 0),
(1461, 20, 'Dunkelblaues V-Ausschnitt T-Shirt -M-', 1, 1, 0),
(1462, 20, 'Lilanes V-Ausschnitt T-Shirt -M-', 1, 1, 0),
(1463, 20, 'Gruenes V-Ausschnitt T-Shirt -M-', 1, 1, 0),
(1464, 20, 'Lachsfarbenes V-Ausschnitt T-Shirt -M-', 1, 1, 0),
(1465, 20, 'Oranges V-Ausschnitt T-Shirt -M-', 1, 1, 0),
(1466, 20, 'Hellbraunes V-Ausschnitt T-Shirt -M-', 1, 1, 0),
(1467, 20, 'Beiges V-Ausschnitt T-Shirt -M-', 1, 1, 0),
(1468, 20, 'Weises Tanktop -M-', 1, 1, 0),
(1469, 20, 'Graues Tanktop -M-', 1, 1, 0),
(1470, 20, 'Schwarzes Tanktop -M-', 1, 1, 0),
(1471, 20, 'Rotes Tanktop -M-', 1, 1, 0),
(1472, 20, 'Rot-Blauer Pulli -M-', 1, 1, 0),
(1473, 20, 'Weis-Blauer Pulli -M-', 1, 1, 0),
(1474, 20, 'Schwarzer Pulli -M-', 1, 1, 0),
(1475, 20, 'Hellgrau-Weiser Pulli -M-', 1, 1, 0),
(1476, 20, 'Schwarz-Weis gestreiftes Polo-Shirt -M-', 1, 1, 0),
(1477, 20, 'Graues Polo-Shirt -M-', 1, 1, 0),
(1478, 20, 'Schwarzes Polo-Shirt -M-', 1, 1, 0),
(1479, 20, 'Rosanes Polo-Shirt -M-', 1, 1, 0),
(1480, 20, 'Blaues Polo-Shirt -M-', 1, 1, 0),
(1481, 20, 'Orangenes Polo-Shirt -M-', 1, 1, 0),
(1482, 20, 'Pinkes Polo-Shirt -M-', 1, 1, 0),
(1483, 20, 'Lilanes Polo-Shirt -M-', 1, 1, 0),
(1484, 20, 'Blau-Weises Polo-Shirt -M-', 1, 1, 0),
(1485, 20, 'Weises Polo-Shirt -M-', 1, 1, 0),
(1486, 20, 'Gruenes Polo-Shirt -M-', 1, 1, 0),
(1487, 20, 'Dunkelgruenes Polo-Shirt -M-', 1, 1, 0),
(1488, 20, 'Rotes Polo-Shirt -M-', 1, 1, 0),
(1489, 20, 'Gelbes Polo-Shirt -M-', 1, 1, 0),
(1490, 20, 'Weises Hemd drausen -M-', 1, 1, 0),
(1491, 20, 'Graues Hemd drausen -M-', 1, 1, 0),
(1492, 20, 'Schwarzes Hemd drausen -M-', 1, 1, 0),
(1493, 20, 'Blaues Hemd drausen -M-', 1, 1, 0),
(1494, 20, 'Dunkelblaues Hemd drausen -M-', 1, 1, 0),
(1495, 20, 'Dunkelrotes Hemd drausen -M-', 1, 1, 0),
(1496, 20, 'Grunes Hemd drausen -M-', 1, 1, 0),
(1497, 20, 'Beiges Hemd drausen -M-', 1, 1, 0),
(1498, 20, 'Orangenes Hemd drausen -M-', 1, 1, 0),
(1499, 20, 'Gelbes Hemd drausen -M-', 1, 1, 0),
(1500, 20, 'Gruen-Kariertes Hemd drausen -M-', 1, 1, 0),
(1501, 20, 'Blau-Kariertes Hemd drausen -M-', 1, 1, 0),
(1502, 20, 'Weises Hemd drin -M-', 1, 1, 0),
(1503, 20, 'Graues Hemd drin -M-', 1, 1, 0),
(1504, 20, 'Schwarzes Hemd drin -M-', 1, 1, 0),
(1505, 20, 'Blaues Hemd drin -M-', 1, 1, 0),
(1506, 20, 'Rotes Hemd drin -M-', 1, 1, 0),
(1507, 20, 'Gruen-Kariertes Hemd drin -M-', 1, 1, 0),
(1508, 20, 'Blau Kariertes Hemd mit Pullover -M-', 1, 1, 0),
(1509, 20, 'Gelb Kariertes Hemd mit Pullover -M-', 1, 1, 0),
(1510, 20, 'Weises Kariertes Hemd mit Pullover -M-', 1, 1, 0),
(1511, 20, 'Gelb-Weises Kariertes Hemd mit Pullover -M-', 1, 1, 0),
(1512, 20, 'Rot Kariertes Hemd mit Pullover -M-', 1, 1, 0),
(1513, 20, 'Rot-Gruenes Kariertes Hemd mit Pullover -M-', 1, 1, 0),
(1514, 20, 'Tuerkieses Kariertes Hemd mit Pullover -M-', 1, 1, 0),
(1515, 20, 'Schwarzes Kariertes Hemd mit Pullover -M-', 1, 1, 0),
(1516, 20, 'Petrol-Weis Kariertes Hemd mit Pullover -M-', 1, 1, 0),
(1517, 20, 'Rot-Weis Kariertes Hemd mit Pullover -M-', 1, 1, 0),
(1518, 20, 'Hellblau Kariertes Hemd mit Pullover -M-', 1, 1, 0),
(1519, 20, 'Graue Kariertes Hemd mit Pullover -M-', 1, 1, 0),
(1520, 20, 'Rot-Blau Kariertes Hemd mit Pullover -M-', 1, 1, 0),
(1521, 20, 'Schwarz-Gruen Kariertes Hemd mit Pullover -M-', 1, 1, 0),
(1522, 20, 'Gruen-Braun Kariertes Hemd mit Pullover -M-', 1, 1, 0),
(1523, 20, 'Braun Kariertes Hemd mit Pullover -M-', 1, 1, 0),
(1524, 20, 'Braunes V-Ausschnitt T-Shirt -M-', 1, 1, 0),
(1525, 20, 'Hellblaues V-Ausschnitt T-Shirt -M-', 1, 1, 0),
(1526, 20, 'Hellrotes V-Ausschnitt T-Shirt -M-', 1, 1, 0),
(1527, 20, 'Blaues Tanktop -M-', 1, 1, 0),
(1528, 20, 'Gelbes Tanktop -M-', 1, 1, 0),
(1529, 20, 'Orangenes Tanktop -M-', 1, 1, 0),
(1530, 20, 'Lila-Pinkes Tanktop -M-', 1, 1, 0),
(1531, 20, 'Gelb-Rotes Tanktop -M-', 1, 1, 0),
(1532, 20, 'Weises Einfaches t-Shirt -M-', 1, 1, 0),
(1533, 20, 'Schwarz Einfaches t-Shirt -M-', 1, 1, 0),
(1534, 20, 'Rotes Einfaches t-Shirt -M-', 1, 1, 0),
(1535, 20, 'Dunkelblaues Hemd drin -M-', 1, 1, 0),
(1536, 20, 'Gruenes Hemd drin -M-', 1, 1, 0),
(1537, 20, 'Hellbraunes Hemd drin -M-', 1, 1, 0),
(1538, 20, 'Orangenes Hemd drin -M-', 1, 1, 0),
(1539, 20, 'Gelbes Hemd drin -M-', 1, 1, 0),
(1540, 20, 'Rosanes Hemd drin -M-', 1, 1, 0),
(1541, 20, 'Rotes Hemd drin -M-', 1, 1, 0),
(1542, 20, 'Lila Kariertes Hemd drin -M-', 1, 1, 0),
(1543, 20, 'Blau Kariertes Hemd drin -M-', 1, 1, 0),
(1544, 20, 'Schwarz-Weis Kariertes Hemd drin -M-', 1, 1, 0),
(1545, 20, 'Schwarz-Weis Gestreiftes Einfaches T-Shirt -M-', 1, 1, 0),
(1546, 20, 'Schwarz V-Ausschnitt T-Shirt -M-', 1, 1, 0),
(1547, 20, 'Blau-Weis Gestreiftes V-Ausschnitt T-Shirt -M-', 1, 1, 0),
(1548, 20, 'Gestreiftes Tanktop -M-', 1, 1, 0),
(1549, 20, 'Lilanes Tanktop -M-', 1, 1, 0),
(1550, 20, 'Pinkes Tanktop -M-', 1, 1, 0),
(1551, 20, 'Armeefarbenes Tanktop -M-', 1, 1, 0),
(1552, 20, 'Gruen-Gelbes Tanktop -M-', 1, 1, 0),
(1553, 20, 'Grau-Gemustertes Tanktop -M-', 1, 1, 0),
(1554, 20, 'Schwarz-Grauer Pulli -M-', 1, 1, 0),
(1555, 20, 'Armee-Gelber Pulli -M-', 1, 1, 0),
(1556, 20, 'Lila-Weiser Pulli -M-', 1, 1, 0),
(1557, 20, 'Dunkelblau-Gelber Pulli -M-', 1, 1, 0),
(1558, 20, 'Rotest STANK-Shirt -M-', 1, 1, 0),
(1559, 20, 'Blaues STANK-Shirt -M-', 1, 1, 0),
(1560, 20, 'Rot-Schwarz kariertes Hemd-drausen -M-', 1, 1, 0),
(1561, 20, 'Rosa kariertes Hemd-drausen -M-', 1, 1, 0),
(1562, 20, 'Beige kariertes Hemd-drausen -M-', 1, 1, 0),
(1563, 20, 'Hemd mit Hosentraeger zu -M-', 1, 1, 0),
(1564, 20, 'Hemd mit Hosentraeger offen -M-', 1, 1, 0),
(1565, 20, 'Hellgruenes Einfaches T-Shirt -M-', 1, 1, 0),
(1566, 20, 'Gelbes Einfaches T-Shirt -M-', 1, 1, 0),
(1567, 20, 'Marine-Blaues Einfaches T-Shirt -M-', 1, 1, 0),
(1568, 20, 'USA Einfaches T-Shirt -M-', 1, 1, 0),
(1569, 20, 'NOOSE Oberteil -M-', 1, 1, 0),
(1570, 20, 'Graues Kampf-Oberteil gemustert -M-', 1, 1, 0),
(1571, 20, 'Graues Kampf-Oberteil -M-', 1, 1, 0),
(1572, 20, 'Beiges Kampf-Oberteil -M-', 1, 1, 0),
(1573, 20, 'Gruenes Kampf-Oberteil -M-', 1, 1, 0),
(1574, 20, 'Schwarzer Kampfpulli -M-', 1, 1, 0),
(1575, 20, 'Hellgrauer Kampfpulli -M-', 1, 1, 0),
(1576, 20, 'Grauer Kampfpulli -M-', 1, 1, 0),
(1577, 20, 'Beiger Kampfpulli -M-', 1, 1, 0),
(1578, 20, 'Gruener Kampfpulli -M-', 1, 1, 0),
(1579, 20, 'Schwarzer Einsatzpulli -M-', 1, 1, 0),
(1580, 20, 'Grauer Einsatzpulli -M-', 1, 1, 0),
(1581, 20, 'Beiger Einsatzpulli -M-', 1, 1, 0),
(1582, 20, 'Tarnfarbener Einsatzpulli -M-', 1, 1, 0),
(1583, 20, 'Schwarze Fliegerjacke -M-', 1, 1, 0),
(1585, 20, 'Dreckihes Weises-Shirt -M-', 1, 1, 0),
(1586, 20, 'Schwarze Sweet-Jacke -M-', 1, 1, 0),
(1587, 20, 'Schwarzes Arbeitshemd -M-', 1, 1, 0),
(1588, 20, 'Rotes Hausmeister-Oberteil -M-', 1, 1, 0),
(1589, 20, 'Schwarzes Hausmeister-Oberteil -M-', 1, 1, 0),
(1590, 20, 'Gruenes Hausmeister-Oberteil -M-', 1, 1, 0),
(1591, 20, 'Graues Hausmeister-Oberteil -M-', 1, 1, 0),
(1592, 20, 'Rotes Hausmeisteroberteil mit Pullover -M-', 1, 1, 0),
(1593, 20, 'Schwarze Hausmeisteroberteil mit Pullover -M-', 1, 1, 0),
(1594, 20, 'Gruenes Hausmeisteroberteil mit Pullover -M-', 1, 1, 0),
(1595, 20, 'Graues Hausmeisteroberteil mit Pullover -M-', 1, 1, 0),
(1596, 20, 'Goldenes T-Shirt -M-', 1, 1, 0),
(1597, 20, 'T-Shirt mit Bild 1 -M-', 1, 1, 0),
(1598, 20, 'T-Shirt mit Bild 2 -M-', 1, 1, 0),
(1599, 20, 'T-Shirt mit Bild 3 -M-', 1, 1, 0),
(1600, 20, 'T-Shirt mit Bild 4 -M-', 1, 1, 0),
(1601, 20, 'Braunes T-Shirt -M-', 1, 1, 0),
(1602, 20, 'Braune NS Jacke -M-', 1, 1, 0),
(1603, 20, 'Dunkelblaue PP Jacke -M-', 1, 1, 0),
(1604, 20, 'Schwarze NS Jacke -M-', 1, 1, 0),
(1605, 20, 'Bunte NS Jacke -M-', 1, 1, 0),
(1606, 20, 'Braune Gemusterte Jacke -M-', 1, 1, 0),
(1607, 20, 'Dunkelblaue Gemusterte Jacke -M-', 1, 1, 0),
(1608, 20, 'Lilane Jacke -M-', 1, 1, 0),
(1609, 20, 'Schwarz-weis Gemusterte Jacke -M-', 1, 1, 0),
(1610, 20, 'Schwarz-Weise Jacke -M-', 1, 1, 0),
(1611, 20, 'Schwarze LE Jacke -M-', 1, 1, 0),
(1612, 20, 'Rote LE Jacke -M-', 1, 1, 0),
(1613, 20, 'Beige-Weiser Einfacher Pullover -M-', 1, 1, 0),
(1614, 20, 'LE CHIEN Einfacher Pullover -M-', 1, 1, 0),
(1615, 20, 'Schwarz-Grauer Einfacher Pullover -M-', 1, 1, 0),
(1616, 20, 'Grau-Weiser Einfacher Pullover -M-', 1, 1, 0),
(1617, 20, 'Weis-Grauer Einfacher Pullover -M-', 1, 1, 0),
(1618, 20, 'Rot-Weise Collange-Jacke -M-', 1, 1, 0),
(1619, 20, 'Weises Großes T-Shirt -M-', 1, 1, 0),
(1620, 20, 'Schwarzes Großes T-Shirt -M-', 1, 1, 0),
(1621, 20, 'Schwarzes Trikot -M-', 1, 1, 0),
(1622, 20, 'Weises Trikot -M-', 1, 1, 0),
(1623, 20, 'Graues Trikot -M-', 1, 1, 0),
(1624, 20, 'Graues YETI Polo-Shirt -M-', 1, 1, 0),
(1625, 20, 'Schwarz-Gelbes YETI Polo-Shirt -M-', 1, 1, 0),
(1626, 20, 'Schwarzes YETI Polo-Shirt -M-', 1, 1, 0),
(1627, 20, 'Braun-Gestreiftes YETI Polo-Shirt -M-', 1, 1, 0),
(1628, 20, 'Graues Baseballshirt -M-', 1, 1, 0),
(1629, 20, 'Blau-Weises Baseballshirt -M-', 1, 1, 0),
(1630, 20, 'Weis-Gruenes Baseballshirt -M-', 1, 1, 0),
(1631, 20, 'Weis-Gestreiftes Baseballshirt -M-', 1, 1, 0),
(1632, 20, 'Dunkelgraues Baseballshirt -M-', 1, 1, 0),
(1633, 20, 'Corkers Pulli -M-', 1, 1, 0),
(1634, 20, 'LS Pulli -M-', 1, 1, 0),
(1635, 20, 'SA Pulli -M-', 1, 1, 0),
(1636, 20, 'Squeezes Pulli -M-', 1, 1, 0),
(1637, 20, 'The Feud Pulli -M-', 1, 1, 0),
(1638, 20, 'Boars Pulli -M-', 1, 1, 0),
(1639, 20, 'Graue Knopf-Regenjacke -M-', 1, 1, 0),
(1640, 20, 'Schwarzer Einfacher Hoody -M-', 1, 1, 0),
(1641, 20, 'Grauer Einfacher Hoody -M-', 1, 1, 0),
(1642, 20, 'DOUPLE-P 1 Collage-Jacke -M-', 1, 1, 0),
(1643, 20, 'MAGNETICK 1 Collage-Jacke -M-', 1, 1, 0),
(1644, 20, 'HINTERLAND Collage-Jacke -M-', 1, 1, 0),
(1645, 20, 'MAGNETICK 2 Collage-Jacke -M-', 1, 1, 0),
(1646, 20, 'BROKER 1 Collage-Jacke -M-', 1, 1, 0),
(1647, 20, 'BROCKER 2 Collage-Jacke -M-', 1, 1, 0),
(1648, 20, 'BROKER 3 Collage-Jacke -M-', 1, 1, 0),
(1649, 20, 'TRICKSTER 1 Collage-Jacke -M-', 1, 1, 0),
(1650, 20, 'TRICKSTER 2 Collage-Jacke -M-', 1, 1, 0),
(1651, 20, 'LOS SANTOS 1 Collage-Jacke -M-', 1, 1, 0),
(1652, 20, 'DOUPLE-P 2 Collage-Jacke -M-', 1, 1, 0),
(1653, 20, 'LOS SANTOS 2 Collage-Jacke -M-', 1, 1, 0),
(1654, 20, 'Schwarzer Einfacher Pulli -M-', 1, 1, 0),
(1655, 20, 'Grauer Einfacher Pulli -M-', 1, 1, 0),
(1656, 20, 'Weiser Einfacher Pulli -M-', 1, 1, 0),
(1657, 20, 'Gruener Einfacher Pulli -M-', 1, 1, 0),
(1658, 20, 'Weise Collage-Jacke  -M-', 1, 1, 0),
(1659, 20, 'Schwarzer Seiden Pyjama-Oberteil -M-', 1, 1, 0),
(1660, 20, 'Lilanes Seiden Pyjama-Oberteil -M-', 1, 1, 0),
(1661, 20, 'Gruenes Poloshirt drausen -M-', 1, 1, 0),
(1662, 20, 'Buntes Poloshirt drausen -M-', 1, 1, 0),
(1663, 20, 'Schwarze-Gruenes Poloshirt drausen -M-', 1, 1, 0),
(1664, 20, 'Grunes Poloshirt drin -M-', 1, 1, 0),
(1665, 20, 'Buntes  Poloshirt drin -M-', 1, 1, 0),
(1666, 20, 'Schwarz-Grunes Poloshirt drin -M-', 1, 1, 0),
(1667, 20, 'Dunkelgrau Hemd Hochgekrempelt -M-', 1, 1, 0),
(1668, 20, 'Schwarz Hemd Hochgekrempelt -M-', 1, 1, 0),
(1669, 20, 'Gruen-Kariert Hemd Hochgekrempelt -M-', 1, 1, 0),
(1670, 20, 'Hellblauer FB-Pulllover -M-', 1, 1, 0),
(1671, 20, 'Beiges Dreckes T-shirt -M-', 1, 1, 0),
(1672, 20, 'Grunes Dreckiges T-Shirt -M-', 1, 1, 0),
(1673, 20, 'Beiger Einsatzpulli -M-', 1, 1, 0),
(1674, 20, 'Gruener Einsatzpulli -M-', 1, 1, 0),
(1675, 20, 'Weises Geblumtes Hemd -M-', 1, 1, 0),
(1676, 20, 'Weiser Kimono -M-', 1, 1, 0),
(1677, 20, 'Schwarzer Kimono -M-', 1, 1, 0),
(1678, 20, 'Weise Strickweste -M-', 1, 1, 0),
(1679, 20, 'Braune Lederjacke mit Guertel -M-', 1, 1, 0),
(1680, 20, 'Rot-Schwarze Trainingsjacke -M-', 1, 1, 0),
(1681, 20, 'Dunkelgraue Trainingsjacke -M-', 1, 1, 0),
(1682, 20, 'Weises Bademantel-Oberteil -M-', 1, 1, 0),
(1683, 20, 'Graues Bademantel -Oberteil -M-', 1, 1, 0),
(1684, 20, 'Rot-Kariertes Pyjama-Obeteil -M-', 1, 1, 0),
(1685, 20, 'Gruene-Kariertes Pyjama-Obeteil -M-', 1, 1, 0),
(1686, 20, 'Schwarz-Kariertes Pyjama-Obeteil -M-', 1, 1, 0),
(1687, 20, 'Gestreiftes Pyjama-Obeteil -M-', 1, 1, 0),
(1688, 20, 'Weis-Schwarzes Hippi-Oberteil -M-', 1, 1, 0),
(1689, 20, 'Schwarz-Weisses Hippi-Oberteil -M-', 1, 1, 0),
(1690, 20, 'Grau-Getreiftes Hippi-Oberteil -M-', 1, 1, 0),
(1691, 20, 'Jamaika Hippi-Oberteil -M-', 1, 1, 0),
(1692, 20, 'Weises Hippi-Oberteil -M-', 1, 1, 0),
(1693, 20, 'Braun-Graues Hippi-Oberteil -M-', 1, 1, 0),
(1694, 20, 'Braunes-Gestreiftes Hippi-Oberteil -M-', 1, 1, 0),
(1695, 20, 'Braunes Hippi-Oberteil -M-', 1, 1, 0),
(1696, 20, 'Braunes YETI Hippi-Oberteil -M-', 1, 1, 0),
(1697, 20, 'Weises SWEATBOX Hippi-Oberteil -M-', 1, 1, 0),
(1698, 20, 'Beiges Hippi-Oberteil -M-', 1, 1, 0),
(1699, 20, 'Grunes DENSE Hippi-Oberteil -M-', 1, 1, 0),
(1700, 20, 'Weises Shirt -M-', 1, 1, 0),
(1701, 20, 'Blaugraunes Shirt -M-', 1, 1, 0),
(1702, 20, 'Dunkelgraues Shirt -M-', 1, 1, 0),
(1703, 20, 'Orangene Jacke -M-', 1, 1, 0),
(1704, 20, 'Tuerkies-Graues Langaermliches Hemd geschlosses -M-', 1, 1, 0),
(1705, 20, 'Orang-Graues Langaermliches Hemd geschlosses -M-', 1, 1, 0),
(1706, 20, 'Gruen-Graues Langaermliches Hemd geschlosses -M-', 1, 1, 0),
(1707, 20, 'Lila-Graues Langaermliches Hemd geschlosses -M-', 1, 1, 0),
(1708, 20, 'Hellbraun-Graunes Langaermliches Hemd geschlosses -M-', 1, 1, 0),
(1709, 20, 'Blau-Weises Langaermliches Hemd geschlosses -M-', 1, 1, 0),
(1710, 20, 'Lila-Weises Langaermliches Hemd geschlosses -M-', 1, 1, 0),
(1711, 20, 'Schwarz-Weises Langaermliches Hemd geschlosses -M-', 1, 1, 0),
(1712, 20, 'Gelb-Weises Langaermliches Hemd geschlosses -M-', 1, 1, 0),
(1713, 20, 'Gruenes Langaermliches Hemd geschlosses -M-', 1, 1, 0),
(1714, 20, 'Rot Langaermliches Hemd geschlosses -M-', 1, 1, 0),
(1715, 20, 'Schwarz Langaermliches Hemd geschlosses -M-', 1, 1, 0),
(1716, 20, 'Gelb Langaermliches Hemd geschlosses -M-', 1, 1, 0),
(1717, 20, 'Lila Langaermliches Hemd geschlosses -M-', 1, 1, 0),
(1718, 20, 'Weis Langaermliches Hemd geschlosses -M-', 1, 1, 0),
(1719, 20, 'Gruen Einfarbiges Trikot -M-', 1, 1, 0),
(1720, 20, 'Orang Einfarbiges Trikot -M-', 1, 1, 0),
(1721, 20, 'Lila Einfarbiges Trikot -M-', 1, 1, 0),
(1722, 20, 'Rosa Einfarbiges Trikot -M-', 1, 1, 0),
(1723, 20, 'Rot Einfarbiges Trikot -M-', 1, 1, 0),
(1724, 20, 'Blau Einfarbiges Trikot -M-', 1, 1, 0),
(1725, 20, 'Grau Einfarbiges Trikot -M-', 1, 1, 0),
(1726, 20, 'Braun Einfarbiges Trikot -M-', 1, 1, 0),
(1727, 20, 'Weis Einfarbiges Trikot -M-', 1, 1, 0),
(1728, 20, 'Schwarz Einfarbiges Trikot -M-', 1, 1, 0),
(1729, 20, 'LIBERTY Poloshirt drausen  -M-', 1, 1, 0),
(1730, 20, 'LIBERTY Poloshirt drin -M-', 1, 1, 0),
(1731, 20, 'Rosanes Hochgekrempeltel Hemd -M-', 1, 1, 0),
(1732, 20, 'Schwarzer LIBERTY Hoody -M-', 1, 1, 0),
(1733, 20, 'Roter LIBERTY Hoody -M-', 1, 1, 0),
(1734, 20, 'Schwarz-Goldenes Gemustertes Hemd -M-', 1, 1, 0),
(1735, 20, 'Lila Gemustertes Hemd -M-', 1, 1, 0),
(1736, 20, 'Rot Gemustertes Hemd -M-', 1, 1, 0),
(1737, 20, 'Blau Gemustertes Hemd -M-', 1, 1, 0),
(1738, 20, 'Dunkelbraune Lederjacke mit Guertel -M-', 1, 1, 0),
(1739, 20, 'Schwarze Lederjacke mit Guertel -M-', 1, 1, 0),
(1740, 20, 'Hellbraune Lederjacke mit Guertel -M-', 1, 1, 0),
(1741, 20, 'Grauer Rollkragenpullover -M-', 1, 1, 0),
(1742, 20, 'Roter Rollkragenpullover -M-', 1, 1, 0),
(1743, 20, 'Brauner Rollkragenpullover -M-', 1, 1, 0),
(1744, 20, 'Schwarzer Rollkragenpullover -M-', 1, 1, 0),
(1745, 20, 'Dunkelblauer Rollkragenpullover -M-', 1, 1, 0),
(1746, 20, 'Weiser Rollkragenpullover -M-', 1, 1, 0),
(1747, 20, 'Lilaner Rollkragenpullover -M-', 1, 1, 0),
(1748, 20, 'Gruener Rollkragenpullover -M-', 1, 1, 0),
(1749, 20, 'Hellblaue Trainingsjacke -M-', 1, 1, 0),
(1750, 20, 'Rote Trainingsjacke -M-', 1, 1, 0),
(1751, 20, 'Beige Trainingsjacke -M-', 1, 1, 0),
(1752, 20, 'Beige-Gruene Trainingsjacke -M-', 1, 1, 0),
(1753, 20, 'Dunkelblaue Trainingsjacke -M-', 1, 1, 0),
(1754, 20, 'Weise Trainingsjacke -M-', 1, 1, 0),
(1755, 20, 'Tuerkiese Trainingsjacke -M-', 1, 1, 0),
(1756, 20, 'Orange-Lila Trainingsjacke -M-', 1, 1, 0),
(1757, 20, 'Lila-Gruene Trainingsjacke -M-', 1, 1, 0),
(1758, 20, 'Hellgraue Trainingsjacke -M-', 1, 1, 0),
(1759, 20, 'Gruen-Schwarze Trainingsjacke -M-', 1, 1, 0),
(1760, 20, 'Gruene Collange-Jacke -M-', 1, 1, 0),
(1761, 20, 'Orangene Collange-Jacke -M-', 1, 1, 0),
(1762, 20, 'Lilane Collange-Jacke -M-', 1, 1, 0),
(1763, 20, 'Rosane Collange-Jacke -M-', 1, 1, 0),
(1764, 20, 'Hellblau Pyjama-Oberteil -M-', 1, 1, 0),
(1765, 20, 'Gelb Pyjama-Oberteil -M-', 1, 1, 0),
(1766, 20, 'Rosa Pyjama-Oberteil -M-', 1, 1, 0),
(1767, 20, 'hellgruen Pyjama-Oberteil -M-', 1, 1, 0),
(1768, 20, 'Lila-Orang Kariertes Pyjama-Oberteil -M-', 1, 1, 0),
(1769, 20, 'Dunkelblau Kariertes Pyjama-Oberteil -M-', 1, 1, 0),
(1770, 20, 'Dunkelrotes Pyjama-Oberteil -M-', 1, 1, 0),
(1771, 20, 'Weis-SChwarz gemustertes Pyjama-Oberteil -M-', 1, 1, 0),
(1772, 20, 'Lila Gemustertes Pyjama-Oberteil -M-', 1, 1, 0),
(1773, 20, 'Gelb Gemustertes Pyjama-Oberteil -M-', 1, 1, 0),
(1774, 20, 'Rot Gemustertes Pyjama-Oberteil -M-', 1, 1, 0),
(1775, 20, 'Weises T-Shirt -M-', 1, 1, 0),
(1776, 20, 'Schwarzes T-Shirt -M-', 1, 1, 0),
(1777, 20, 'Rotes T-Shirt -M-', 1, 1, 0),
(1778, 20, 'Gelbes T-Shirt -M-', 1, 1, 0),
(1779, 20, 'Beiges T-Shirt -M-', 1, 1, 0),
(1780, 20, 'Dunkelrotes T-Shirt -M-', 1, 1, 0),
(1781, 20, 'Blaues T-Shirt -M-', 1, 1, 0),
(1782, 20, 'Orangenes T-Shirt -M-', 1, 1, 0),
(1783, 20, 'Hellblaues T-Shirt -M-', 1, 1, 0),
(1784, 20, 'Gruenes Motorgross-Oberteil -M-', 1, 1, 0),
(1785, 20, 'Schwarz-Rotes Motorgross-Oberteil -M-', 1, 1, 0),
(1786, 20, 'Rot-Weises Motorgross-Oberteil -M-', 1, 1, 0),
(1787, 20, 'Schwarzes Motorgross-Oberteil -M-', 1, 1, 0),
(1788, 20, 'Rot-Blaues Motorgross-Oberteil -M-', 1, 1, 0),
(1789, 20, 'Gelb-Schwarze Motorgross-Oberteil -M-', 1, 1, 0),
(1790, 20, 'Weis-Rosane Motorgross-Oberteil -M-', 1, 1, 0),
(1791, 20, 'Weis-Blaue Motorgross-Oberteil -M-', 1, 1, 0),
(1792, 20, 'Weis-Gruene Motorgross-Oberteil -M-', 1, 1, 0),
(1793, 20, 'Weis-Orangene Motorgross-Oberteil -M-', 1, 1, 0),
(1794, 20, 'Weis-Lilane Motorgross-Oberteil -M-', 1, 1, 0),
(1795, 20, 'Schwarze Asia Windjacke -M-', 1, 1, 0),
(1796, 20, 'Dunkelblaue Asia Windjacke -M-', 1, 1, 0),
(1797, 20, 'Schwarz-Weise Asia Windjacke -M-', 1, 1, 0),
(1798, 20, 'Weise Asia  Mit Tiger -M-', 1, 1, 0),
(1799, 20, 'Gruen-Gelbe Asia Windjacke -M-', 1, 1, 0),
(1800, 20, 'Lila-Weise Asia Windjacke -M-', 1, 1, 0),
(1801, 20, 'Blau-Weise Asia Windjacke -M-', 1, 1, 0),
(1802, 20, 'Weise Asia Windjacke -M-', 1, 1, 0),
(1803, 20, 'Dunkelrote Asia Windjacke -M-', 1, 1, 0),
(1804, 20, 'Petrolfarbene Asia Windjacke -M-', 1, 1, 0),
(1805, 20, 'Weis-Tuerkiese Asia Windjacke -M-', 1, 1, 0),
(1806, 20, 'Pinker Motorgross-Pullover -M-', 1, 1, 0),
(1807, 20, 'Hellblau-Rosaner Motorgross-Pullover -M-', 1, 1, 0),
(1808, 20, 'Weis-Gruener Motorgross-Pullover -M-', 1, 1, 0),
(1809, 20, 'Gruener Motorgross-Pullover -M-', 1, 1, 0),
(1810, 20, 'Weiser Motorgross-Pullover -M-', 1, 1, 0),
(1811, 20, 'Gruen-Lilaner Motorgross-Pullover -M-', 1, 1, 0),
(1812, 20, 'Pink-Gelber Motorgross-Pullover -M-', 1, 1, 0),
(1813, 20, 'Blau-Gruener Motorgross-Pullover -M-', 1, 1, 0),
(1814, 20, 'Orangener Motorgross-Pullover -M-', 1, 1, 0),
(1815, 20, 'Bunter Motorgross-Pullover -M-', 1, 1, 0),
(1816, 20, 'Rot-Weiser Motorgross-Pullover -M-', 1, 1, 0),
(1817, 20, 'Weis-Roter Motorgross-Pullover -M-', 1, 1, 0),
(1818, 20, 'Dunkelblauer Motorgross-Pullover -M-', 1, 1, 0),
(1819, 20, 'Gelber Motorgross-Pullover -M-', 1, 1, 0),
(1820, 20, 'Lilaner Motorgross-Pullover -M-', 1, 1, 0),
(1821, 20, 'Rot-Gelber Motorgross-Pullover -M-', 1, 1, 0),
(1822, 20, 'Rot-Braune Windjacke -M-', 1, 1, 0),
(1823, 20, 'Schwarze Windjacke -M-', 1, 1, 0),
(1824, 20, 'Weise Windjacke -M-', 1, 1, 0),
(1825, 20, 'Weis-Blaue Windjacke -M-', 1, 1, 0),
(1826, 20, 'Orang-Weise Windjacke -M-', 1, 1, 0),
(1827, 20, 'Schwarz-Weise Windjacke -M-', 1, 1, 0),
(1828, 20, 'Gruen-Weise Windjacke -M-', 1, 1, 0),
(1829, 20, 'Beige Windjacke -M-', 1, 1, 0),
(1830, 20, 'Rot-Braune  Windjacke mit Totenkopf -M-', 1, 1, 0),
(1831, 20, 'Schwarz-Weise  Windjacke mit Totenkopf -M-', 1, 1, 0),
(1832, 20, 'Schwarze Windjacke mit Blitz -M-', 1, 1, 0),
(1833, 20, 'Blau-Weise Windjacke -M-', 1, 1, 0),
(1834, 20, 'Beige Windjacke -M-', 1, 1, 0),
(1835, 20, 'Weise Windjacke -M-', 1, 1, 0),
(1836, 20, 'Schwarz-Weise Windjacke -M-', 1, 1, 0),
(1837, 20, 'Gruen-Weise Windjacke -M-', 1, 1, 0),
(1838, 20, 'Schwarz-Gelbe Windjacke -M-', 1, 1, 0),
(1839, 20, 'Braune Lederjacke mit Kaputze -M-', 1, 1, 0),
(1840, 20, 'Schwarze Lederjacke mit Kaputze -M-', 1, 1, 0),
(1841, 20, 'Graue Lederjacke mit Kaputze -M-', 1, 1, 0),
(1842, 20, 'Weiser Einfacher Hoody -M-', 1, 1, 0),
(1843, 20, 'Schwarz-Gelbe Motorrad-Jacke -M-', 1, 1, 0),
(1844, 20, 'Schwarz-Gruene Motorrad-Jacke -M-', 1, 1, 0),
(1845, 20, 'Schwarz-Orangene Motorrad-Jacke -M-', 1, 1, 0),
(1846, 20, 'Schwarz-Lilane Motorrad-Jacke -M-', 1, 1, 0),
(1847, 20, 'Schwarz-Rosane Motorrad-Jacke -M-', 1, 1, 0),
(1848, 20, 'Schwarz-Rote Motorrad-Jacke -M-', 1, 1, 0),
(1849, 20, 'Schwarz-Hellblaue Motorrad-Jacke -M-', 1, 1, 0),
(1850, 20, 'Schwarz-Graue Motorrad-Jacke -M-', 1, 1, 0),
(1851, 20, 'Olivfarbene Regenjacke-geschlossen -M-', 1, 1, 0),
(1852, 20, 'Olivfabene Regenjacke mit Zielscheibe-geschlossen -M-', 1, 1, 0),
(1853, 20, 'Olivfarbene Regenjacke-geschlossen -M-', 1, 1, 0),
(1854, 20, 'Schwarzer Mantel mit Kaputze -M-', 1, 1, 0),
(1855, 20, 'Dunkelgrauer Mantel mit Kaputze -M-', 1, 1, 0),
(1856, 20, 'Grauer Mantel mit Kaputze -M-', 1, 1, 0),
(1857, 20, 'Hellgrauer Mantel mit Kaputze -M-', 1, 1, 0),
(1858, 20, 'Weiser Mantel mit Kaputze -M-', 1, 1, 0),
(1859, 20, 'Roter Mantel mit Kaputze -M-', 1, 1, 0),
(1860, 20, 'Pinker Mantel mit Kaputze -M-', 1, 1, 0),
(1861, 20, 'Hellbrauner Mantel mit Kaputze -M-', 1, 1, 0),
(1862, 20, 'Beiger Mantel mit Kaputze -M-', 1, 1, 0),
(1863, 20, 'Gruener Mantel mit Kaputze -M-', 1, 1, 0),
(1864, 20, 'Grau-Weiser Mantel mit Kaputze -M-', 1, 1, 0),
(1865, 20, 'Dunkelbrauner Mantel mit Kaputze -M-', 1, 1, 0),
(1866, 20, 'Hellorangene Regenjacke -M-', 1, 1, 0),
(1867, 20, 'Rote Regenjacke -M-', 1, 1, 0),
(1868, 20, 'Beige Regenjacke -M-', 1, 1, 0),
(1869, 20, 'Gruene Regenjacke -M-', 1, 1, 0),
(1870, 20, 'Tuerkiese Regenjacke -M-', 1, 1, 0),
(1871, 20, 'Orangene Regenjacke -M-', 1, 1, 0),
(1872, 20, 'Grau-Gefleckte Regenjacke -M-', 1, 1, 0),
(1873, 20, 'Grün-Getarnte Regenjacke -M-', 1, 1, 0),
(1874, 20, 'Hellgraue Regenjacke -M-', 1, 1, 0),
(1875, 20, 'Beige-Getarnte Regenjacke -M-', 1, 1, 0),
(1876, 20, 'Blau-Getarnte Regenjacke -M-', 1, 1, 0),
(1877, 20, 'Schwarz-Gemusterter Pullover -M-', 1, 1, 0),
(1878, 20, 'Rot-Gemusterter Pullover -M-', 1, 1, 0),
(1879, 20, 'Hellblau-Gemusterter Pullover -M-', 1, 1, 0),
(1880, 20, 'Gelb-Gemusterter Pullover -M-', 1, 1, 0),
(1881, 20, 'Hellblauer-Tarn Pullover -M-', 1, 1, 0),
(1882, 20, 'Orangener-Tarn Pullover -M-', 1, 1, 0),
(1883, 20, 'Orangener SQUASH Pullover -M-', 1, 1, 0),
(1884, 20, 'Roter SQUASH Pullover -M-', 1, 1, 0),
(1885, 20, 'Gelber SQUASH Pullover -M-', 1, 1, 0),
(1886, 20, 'Pinker Bananen Pullover -M-', 1, 1, 0),
(1887, 20, 'Hellgruener Tomaten Pullover -M-', 1, 1, 0),
(1888, 20, 'Dunkelblauer SQUASH Pullover -M-', 1, 1, 0),
(1889, 20, 'Tuerkieser SQUASH Pullover -M-', 1, 1, 0),
(1890, 20, 'Hellgruener SQUASH Pullover -M-', 1, 1, 0),
(1891, 20, 'Weis-Lilaner GUEFFY Pullover -M-', 1, 1, 0),
(1892, 20, 'Weis-Pinker GUEFFY Pullover -M-', 1, 1, 0),
(1893, 20, 'Tuerkieser GUEFFY Pullover -M-', 1, 1, 0),
(1894, 20, 'Pinker GUEFFY Pullover -M-', 1, 1, 0),
(1895, 20, 'Weiser GUEFFY Pullover -M-', 1, 1, 0),
(1896, 20, 'Schwarzer GUEFFY Pullover -M-', 1, 1, 0),
(1897, 20, 'Weis-Bunter MANOR Pullover -M-', 1, 1, 0),
(1898, 20, 'Weiser MANOR Pullover -M-', 1, 1, 0),
(1899, 20, 'Weis-Hellblauer MANOR Pullover -M-', 1, 1, 0),
(1900, 20, 'Weis-Pinker MANOR Pullover -M-', 1, 1, 0),
(1901, 20, 'Schwarzer MANOR Pullover -M-', 1, 1, 0),
(1902, 20, 'Weises GUEFFI T-Shirt -M-', 1, 1, 0),
(1903, 20, 'Rotes MANOR T-Shirt -M-', 1, 1, 0),
(1904, 20, 'Schwarzes T-Shirt mit Blättern -M-', 1, 1, 0),
(1905, 20, 'Schwarzes BLAGUEURS T-Shirt -M-', 1, 1, 0),
(1906, 20, 'Weises BLAGUEURS T-Shirt -M-', 1, 1, 0),
(1907, 20, 'Buntes BLAGUEURS T-Shirt -M-', 1, 1, 0),
(1908, 20, 'Weises T-Shirt mit Flaschen -M-', 1, 1, 0),
(1909, 20, 'Pinkes Bananen T-Shirt -M-', 1, 1, 0),
(1910, 20, 'Weis-Pinkel GUEFFY T-Shirt -M-', 1, 1, 0),
(1911, 20, 'Weis-Schwarzes GUEFFY T-Shirt -M-', 1, 1, 0),
(1912, 20, 'Schwqarz-Graues GUEFFY T-Shirt -M-', 1, 1, 0),
(1913, 20, 'Schwarz-Pinkes GUEFFY T-Shirt -M-', 1, 1, 0),
(1914, 20, 'Blaues SAND CASTLE T-Shirt -M-', 1, 1, 0),
(1915, 20, 'Gelb-Roter Hoody -M-', 1, 1, 0),
(1916, 20, 'Schwarz-Pinker Hoody -M-', 1, 1, 0),
(1917, 20, 'Schwarzer BLAGUEURS Hoody -M-', 1, 1, 0),
(1918, 20, 'Gelber BLAGUEURS Hoody -M-', 1, 1, 0),
(1919, 20, 'Bunter SQUASH Hoody -M-', 1, 1, 0),
(1920, 20, 'Dunkelblauber GUEFFY Hoody -M-', 1, 1, 0),
(1921, 20, 'Beiger GUEFFY Hoody -M-', 1, 1, 0),
(1922, 20, 'Weis-Roter GUEFFY Hoody -M-', 1, 1, 0),
(1923, 20, 'Pinker GUEFFY Hoody -M-', 1, 1, 0),
(1924, 20, 'Neon-Oberteil 1 -M-', 1, 1, 0),
(1925, 20, 'Neon-Oberteil 2 -M-', 1, 1, 0),
(1926, 20, 'Neon-Oberteil 3 -M-', 1, 1, 0),
(1927, 20, 'Schwarzer Aermelloser Hoody mit Kaputze -M-', 1, 1, 0),
(1928, 20, 'Dunkelgrauer Aermelloser Hoody mit Kaputze -M-', 1, 1, 0),
(1929, 20, 'Hellgrauer Aermelloser Hoody mit Kaputze -M-', 1, 1, 0),
(1930, 20, 'Weiser Aermelloser Hoody mit Kaputze -M-', 1, 1, 0),
(1931, 20, 'Schwarzer Aermelloser Hoody -M-', 1, 1, 0),
(1932, 20, 'Dunkelgrau Aermelloser Hoody -M-', 1, 1, 0),
(1933, 20, 'Hellgrau Aermelloser Hoody -M-', 1, 1, 0),
(1934, 20, 'Weis Aermelloser Hoody -M-', 1, 1, 0),
(1935, 20, 'Olivfarbener Aermelloser Hoody -M-', 1, 1, 0),
(1936, 20, 'Blau-Gefleckter Aermelloser Hoody -M-', 1, 1, 0),
(1937, 20, 'Braun-Gefleckter Aermelloser Hoody -M-', 1, 1, 0),
(1938, 20, 'Gruen-Gefleckter Aermelloser Hoody -M-', 1, 1, 0),
(1939, 20, 'Beige-Gefleckter Aermelloser Hoody -M-', 1, 1, 0),
(1940, 20, 'Gelb-Gefleckter Aermelloser Hoody -M-', 1, 1, 0),
(1941, 20, 'Wuestentarnfarbener Aermelloser Hoody -M-', 1, 1, 0),
(1942, 20, 'Camoflagfarbener Aermelloser Hoody -M-', 1, 1, 0),
(1943, 20, 'Kleinkarierter Aermelloser Hoody -M-', 1, 1, 0),
(1944, 20, 'Dunkelgruen-Gefleckter Aermelloser Hoody -M-', 1, 1, 0),
(1945, 20, 'Beige-Tarn Aermelloser Hoody -M-', 1, 1, 0),
(1946, 20, 'Blau-Getarnter Aermelloser Hoody -M-', 1, 1, 0),
(1947, 20, 'Tarnfarbener Aermelloser Hoody -M-', 1, 1, 0),
(1948, 20, 'Gruener Aermelloser Hoody -M-', 1, 1, 0),
(1949, 20, 'Gelber Aermelloser Hoody -M-', 1, 1, 0),
(1950, 20, 'Gruen-Getarnter Aermelloser Hoody -M-', 1, 1, 0),
(1951, 20, 'Orang-Getarnter Aermelloser Hoody -M-', 1, 1, 0),
(1952, 20, 'Lila-Getarnter Aermelloser Hoody -M-', 1, 1, 0),
(1953, 20, 'Rosa-Getarnter Aermelloser Hoody -M-', 1, 1, 0),
(1954, 20, 'Tarnfarbenes Einfaches Shirt -M-', 1, 1, 0),
(1955, 20, 'Gruenes Einfaches Shirt -M-', 1, 1, 0),
(1956, 20, 'Gelbers Einfaches Shirt -M-', 1, 1, 0),
(1957, 20, 'Gruenes-Getarntes Einfaches Shirt -M-', 1, 1, 0),
(1958, 20, 'Orang-Getarntes Einfaches Shirt -M-', 1, 1, 0),
(1959, 20, 'Lila-Getarntes Einfaches Shirt -M-', 1, 1, 0),
(1960, 20, 'Rosanes-Getarntes Einfaches Shirt -M-', 1, 1, 0),
(1961, 20, 'Graue Regenjacke ohne Kaputze -M-', 1, 1, 0),
(1962, 20, 'Olivfarbene Regenjacke ohne Kaputze -M-', 1, 1, 0),
(1963, 20, 'Hellorangene Regenjacke ohne Kaputze -M-', 1, 1, 0),
(1964, 20, 'Rote Regenjacke ohne Kaputze -M-', 1, 1, 0),
(1965, 20, 'Gelbe Regenjacke ohne Kaputze -M-', 1, 1, 0),
(1966, 20, 'Hellgruene Regenjacke ohne Kaputze -M-', 1, 1, 0),
(1967, 20, 'Tuerkiese Regenjacke ohne Kaputze -M-', 1, 1, 0),
(1968, 20, 'Orange Regenjacke ohne Kaputze -M-', 1, 1, 0),
(1969, 20, 'Grau-Gefleckte Regenjacke ohne Kaputze -M-', 1, 1, 0),
(1970, 20, 'Gruen-Gefleckte Regenjacke ohne Kaputze -M-', 1, 1, 0),
(1971, 20, 'Kleinkarierter Regenjacke ohne Kaputze -M-', 1, 1, 0),
(1972, 20, 'Tarnfarbene Regenjacke ohne Kaputze -M-', 1, 1, 0),
(1973, 20, 'Blau-Getarnte Regenjacke ohne Kaputze -M-', 1, 1, 0),
(1974, 20, 'Olivfarbene Regenjacke mit Zielscheibe ohne Kaputze -M-', 1, 1, 0),
(1975, 20, 'Gruen Hemd ohne Aermel -M-', 1, 1, 0),
(1976, 20, 'Gelb Hemd ohne Aermel -M-', 1, 1, 0),
(1977, 20, 'Schwarz Hemd ohne Aermel -M-', 1, 1, 0),
(1978, 20, 'Dunkelgrau Hemd ohne Aermel -M-', 1, 1, 0),
(1979, 20, 'Hellgrau Hemd ohne Aermel -M-', 1, 1, 0),
(1980, 20, 'Rot Hemd ohne Aermel -M-', 1, 1, 0),
(1981, 20, 'Dunkelblau Hemd ohne Aermel -M-', 1, 1, 0),
(1982, 20, 'Hellbraun Hemd ohne Aermel -M-', 1, 1, 0),
(1983, 20, 'Gruener Arbeitspullover -M-', 1, 1, 0),
(1984, 20, 'Gelber Arbeitspullover -M-', 1, 1, 0),
(1985, 20, 'Schwarzer Arbeitspullover -M-', 1, 1, 0),
(1986, 20, 'Dunkelgrauer Arbeitspullover -M-', 1, 1, 0),
(1987, 20, 'Hellgrauer Arbeitspullover -M-', 1, 1, 0),
(1988, 20, 'Brauner Arbeitspullover -M-', 1, 1, 0),
(1989, 20, 'Roter Arbeitspullover -M-', 1, 1, 0),
(1990, 20, 'Blauer Arbeitspullover -M-', 1, 1, 0),
(1991, 20, 'Kleinkarierte Arbeitsjacke -M-', 1, 1, 0),
(1992, 20, 'Blaugetarnte Arbeitsjacke -M-', 1, 1, 0),
(1993, 20, 'Tarnfarbene Arbeitsjacke -M-', 1, 1, 0),
(1994, 20, 'Gruene Arbeitsjacke -M-', 1, 1, 0),
(1995, 20, 'Gelbe Arbeitsjacke -M-', 1, 1, 0),
(1996, 20, 'Schwarze Arbeitsjacke -M-', 1, 1, 0),
(1997, 20, 'Graue Arbeitsjacke -M-', 1, 1, 0),
(1998, 20, 'Weise Arbeitsjacke -M-', 1, 1, 0),
(1999, 20, 'Braune Arbeitsjacke -M-', 1, 1, 0),
(2000, 20, 'Olivfarbene Arbeitsjacke -M-', 1, 1, 0),
(2001, 20, 'Blaue Arbeitsjacke -M-', 1, 1, 0),
(2002, 20, 'kleinkariertes Arbeitshemd -M-', 1, 1, 0),
(2003, 20, 'Blaugetarntes Arbeitshemd -M-', 1, 1, 0),
(2004, 20, 'Tarnfarbenes Arbeitshemd -M-', 1, 1, 0),
(2005, 20, 'Gruenes Arbeitshemd -M-', 1, 1, 0),
(2006, 20, 'Gelbes Arbeitshemd -M-', 1, 1, 0),
(2007, 20, 'Graues Arbeitshemd -M-', 1, 1, 0),
(2008, 20, 'Weises Arbeitshemd -M-', 1, 1, 0),
(2009, 20, 'Braunes Arbeitshemd -M-', 1, 1, 0),
(2010, 20, 'Olivfarbenes Arbeitshemd -M-', 1, 1, 0),
(2011, 20, 'Hellblaues Arbeitshemd -M-', 1, 1, 0),
(2012, 20, 'Schwarze Steppweste -M-', 1, 1, 0),
(2013, 20, 'Graue Steppweste -M-', 1, 1, 0),
(2014, 20, 'Weise Steppweste -M-', 1, 1, 0),
(2015, 20, 'Rote Steppweste -M-', 1, 1, 0),
(2016, 20, 'Orangene Steppweste -M-', 1, 1, 0),
(2017, 20, 'Gelbe Steppweste -M-', 1, 1, 0),
(2018, 20, 'Hellgruene Steppweste -M-', 1, 1, 0),
(2019, 20, 'Dunkelgruene Steppweste -M-', 1, 1, 0),
(2020, 20, 'Hellblaue Steppweste -M-', 1, 1, 0),
(2021, 20, 'Blaue Steppweste -M-', 1, 1, 0),
(2022, 20, 'Rosane Steppweste -M-', 1, 1, 0),
(2023, 20, 'Beige Steppweste -M-', 1, 1, 0),
(2024, 20, 'Gruen-Getarnte Steppweste -M-', 1, 1, 0),
(2025, 20, 'Orang-Getarnte Steppweste -M-', 1, 1, 0),
(2026, 20, 'Lila-Getarnte Steppweste -M-', 1, 1, 0),
(2027, 20, 'Rosa-Getarnte Steppweste -M-', 1, 1, 0),
(2028, 20, 'Schwarze Steppjacke -M-', 1, 1, 0),
(2029, 20, 'Graue Steppjacke -M-', 1, 1, 0),
(2030, 20, 'Weise Steppjacke -M-', 1, 1, 0),
(2031, 20, 'Rote Steppjacke -M-', 1, 1, 0),
(2032, 20, 'Orangene Steppjacke -M-', 1, 1, 0),
(2033, 20, 'Gelbe Steppjacke -M-', 1, 1, 0),
(2035, 20, 'Dunkelgruene Steppjacke -M-', 1, 1, 0),
(2036, 20, 'Hellblaue Steppjacke -M-', 1, 1, 0),
(2037, 20, 'Blaue Steppjacke -M-', 1, 1, 0),
(2038, 20, 'Rosane Steppjacke -M-', 1, 1, 0),
(2039, 20, 'Beige Steppjacke -M-', 1, 1, 0),
(2040, 20, 'Gruen-Getarnte Steppjacke -M-', 1, 1, 0),
(2041, 20, 'Orang-Getarnte Steppjacke -M-', 1, 1, 0),
(2042, 20, 'Lila-Getarnte Steppjacke -M-', 1, 1, 0),
(2043, 20, 'Rosa-Getarnte Steppjacke -M-', 1, 1, 0),
(2044, 20, 'Rockstar-Games Shirt Blau -M-', 1, 1, 0),
(2045, 20, 'Rockstar-Games Shirt Rot -M-', 1, 1, 0),
(2046, 20, 'Schwarzes Shirt mit Brusttasche -M-', 1, 1, 0),
(2047, 20, 'Olivfarbene Bomberjacke geschlossen -M-', 1, 1, 0),
(2048, 20, 'Hellbraune Bomberjacke geschlossen -M-', 1, 1, 0),
(2049, 20, 'Schwarze Bomberjacke geschlossen -M-', 1, 1, 0),
(2050, 20, 'Graue Bomberjacke geschlossen -M-', 1, 1, 0),
(2051, 20, 'Weise Bomberjacke geschlossen -M-', 1, 1, 0),
(2052, 20, 'Tuerkiese Bomberjacke geschlossen -M-', 1, 1, 0),
(2053, 20, 'Dunkelblaue Bomberjacke geschlossen -M-', 1, 1, 0),
(2054, 20, 'Rote Bomberjacke geschlossen -M-', 1, 1, 0),
(2055, 20, 'Gruene Bomberjacke geschlossen -M-', 1, 1, 0),
(2056, 20, 'Orangene Bomberjacke geschlossen -M-', 1, 1, 0),
(2057, 20, 'Lilane Bomberjacke geschlossen -M-', 1, 1, 0),
(2058, 20, 'Rosane Bomberjacke geschlossen -M-', 1, 1, 0),
(2059, 20, 'Schwarzes gekloepftes Hemd -M-', 1, 1, 0),
(2060, 20, 'Dunkelgraues gekloepftes Hemd -M-', 1, 1, 0),
(2061, 20, 'Graues gekloepftes Hemd -M-', 1, 1, 0),
(2062, 20, 'Hellgraues gekloepftes Hemd -M-', 1, 1, 0),
(2063, 20, 'Weises gekloepftes Hemd -M-', 1, 1, 0),
(2064, 20, 'Braunes gekloepftes Hemd -M-', 1, 1, 0),
(2065, 20, 'Rosanes gekloepftes -M-', 1, 1, 0),
(2066, 20, 'Tuerkieses/Rosa gekloepftes Hemd mit Blazzmuster -M-', 1, 1, 0),
(2067, 20, 'Tuerkieses gekloepftes Hemd mit Blatmuster -M-', 1, 1, 0),
(2068, 20, 'Beiges gekloepftes Hemd -M-', 1, 1, 0),
(2069, 20, 'Hellblaues gekloepftes Hemd -M-', 1, 1, 0),
(2070, 20, 'Weises hochgekrempeltes Shirt -M-', 1, 1, 0),
(2071, 20, 'Schwarzes hochgekrempeltes Shirt -M-', 1, 1, 0),
(2072, 20, 'Rotes hochgekrempeltes Shirt -M-', 1, 1, 0),
(2073, 20, 'Gestreiftes hochgekrempeltes Shirt -M-', 1, 1, 0),
(2074, 20, 'Beiges hochgekrempeltes Shirt -M-', 1, 1, 0),
(2075, 20, 'Olivfarbenes hochgekrempeltes Shirt -M-', 1, 1, 0),
(2076, 20, 'Blaugeflecktes hochgekrempeltes Shirt -M-', 1, 1, 0),
(2077, 20, 'Braungeflecktes hochgekrempeltes Shirt -M-', 1, 1, 0),
(2078, 20, 'Gruengeflecktes hochgekrempeltes Shirt -M-', 1, 1, 0),
(2079, 20, 'Beigegeflecktes hochgekrempeltes Shirt -M-', 1, 1, 0),
(2080, 20, 'Gelbgeflecktes hochgekrempeltes Shirt -M-', 1, 1, 0);
INSERT INTO `server_shop_items` (`id`, `shopid`, `itemName`, `itemAmount`, `itemPrice`, `itemGender`) VALUES
(2081, 20, 'Wuestentarnfarbenes hochgekrempeltes Shirt -M-', 1, 1, 0),
(2082, 20, 'Tarnfarbenes hochgekrempeltes Shirt -M-', 1, 1, 0),
(2083, 20, 'Hellgraues Zweifarbiges-Poloshirt -M-', 1, 1, 0),
(2084, 20, 'Blaues Zweifarbiges-Poloshirt -M-', 1, 1, 0),
(2085, 20, 'Weises Zweifarbiges-Poloshirt -M-', 1, 1, 0),
(2086, 20, 'Beiges Zweifarbiges-Poloshirt -M-', 1, 1, 0),
(2087, 20, 'Schwarzes Zweifarbiges-Poloshirt -M-', 1, 1, 0),
(2088, 20, 'Rotes Zweifarbiges-Poloshirt -M-', 1, 1, 0),
(2089, 20, 'Hellgraues Zweifarbiges-Poloshirt drin -M-', 1, 1, 0),
(2090, 20, 'Blaues Zweifarbiges-Poloshirt drin -M-', 1, 1, 0),
(2091, 20, 'Weises Zweifarbiges-Poloshirt drin -M-', 1, 1, 0),
(2092, 20, 'Beiges Zweifarbiges-Poloshirt drin -M-', 1, 1, 0),
(2093, 20, 'Schwarzes Zweifarbiges-Poloshirt drin -M-', 1, 1, 0),
(2094, 20, 'Rotes Zweifarbiges-Poloshirt drin -M-', 1, 1, 0),
(2095, 20, 'Schwarzes PRO-LAPS Oberteil -M-', 1, 1, 0),
(2096, 20, 'Weises PRO-LAPS Oberteil -M-', 1, 1, 0),
(2097, 20, 'Blaues PRO-LAPS Oberteil -M-', 1, 1, 0),
(2098, 20, 'Rotes PRO-LAPS Oberteil -M-', 1, 1, 0),
(2099, 20, 'Gelbes PRO-LAPS Oberteil -M-', 1, 1, 0),
(2100, 20, 'Tuerkieses PRO-LAPS Oberteil -M-', 1, 1, 0),
(2101, 20, 'Pinkes PRO-LAPS Oberteil -M-', 1, 1, 0),
(2102, 20, 'Hellblaues PRO-LAPS Oberteil -M-', 1, 1, 0),
(2103, 20, 'Gruenes PRO-LAPS Oberteil -M-', 1, 1, 0),
(2104, 20, 'Orangenes PRO-LAPS Oberteil -M-', 1, 1, 0),
(2105, 20, 'Lilanes PRO-LAPS Oberteil -M-', 1, 1, 0),
(2106, 20, 'Rosanes PRO-LAPS Oberteil -M-', 1, 1, 0),
(2107, 20, 'Olivfarbene Geknoepfte-Arbeitsjacke -M-', 1, 1, 0),
(2108, 20, 'Gruene Geknoepfte-Arbeitsjacke -M-', 1, 1, 0),
(2109, 20, 'Hellgraue Geknoepfte-Arbeitsjacke -M-', 1, 1, 0),
(2110, 20, 'Blaugemusterte Geknoepfte-Arbeitsjacke -M-', 1, 1, 0),
(2111, 20, 'Hellblaue Geknoepfte-Arbeitsjacke -M-', 1, 1, 0),
(2112, 20, 'Schwarze Geknoepfte-Arbeitsjacke -M-', 1, 1, 0),
(2113, 20, 'Schwarz-Weise Geknoepfte-Arbeitsjacke -M-', 1, 1, 0),
(2114, 20, 'Weise Geknoepfte-Arbeitsjacke -M-', 1, 1, 0),
(2115, 20, 'Dunkelgruene Geknoepfte-Arbeitsjacke -M-', 1, 1, 0),
(2116, 20, 'Pinke Geknoepfte-Arbeitsjacke -M-', 1, 1, 0),
(2117, 20, 'Graue Geknoepfte-Arbeitsjacke -M-', 1, 1, 0),
(2118, 20, 'Schwarze Dicke-Arbeitsjacke -M-', 1, 1, 0),
(2119, 20, 'Hellbraune Dicke-Arbeitsjacke -M-', 1, 1, 0),
(2120, 20, 'Blaue Dicke-Arbeitsjacke -M-', 1, 1, 0),
(2121, 20, 'Hellblaue Dicke-Arbeitsjacke -M-', 1, 1, 0),
(2122, 20, 'Pinke Dicke-Arbeitsjacke -M-', 1, 1, 0),
(2124, 20, 'Grau-Rote Dicke-Arbeitsjacke -M-', 1, 1, 0),
(2125, 20, 'Dunkelblaue Dicke-Arbeitsjacke -M-', 1, 1, 0),
(2126, 20, 'Weise Dicke-Arbeitsjacke -M-', 1, 1, 0),
(2127, 20, 'Hellgraue Dicke-Arbeitsjacke -M-', 1, 1, 0),
(2128, 20, 'Dunkelbraune Dicke-Arbeitsjacke -M-', 1, 1, 0),
(2129, 20, 'Graue Dicke-Arbeitsjacke -M-', 1, 1, 0),
(2134, 20, 'Senfgelber Windbeaker -M-', 1, 1, 0),
(2135, 20, 'Grauer Windbeaker -M-', 1, 1, 0),
(2136, 20, 'Weiser Windbeaker -M-', 1, 1, 0),
(2142, 21, 'Ketchup', 20, 6, 2),
(2143, 23, 'Popcorn', 1, 49, 2),
(2144, 22, 'Traubensaft', 2, 22, 2),
(2145, 3, 'Wasser', 20, 1, 2),
(2146, 4, 'Wasser', 20, 1, 2),
(2147, 5, 'Wasser', 20, 1, 2),
(2148, 6, 'Wasser', 20, 1, 2),
(2149, 7, 'Wasser', 20, 1, 2),
(2150, 8, 'Wasser', 20, 1, 2),
(2151, 9, 'Wasser', 20, 1, 2),
(2152, 10, 'Wasser', 20, 1, 2),
(2153, 11, 'Wasser', 20, 1, 2),
(2154, 12, 'Wasser', 20, 1, 2),
(2155, 13, 'Wasser', 20, 1, 2),
(2156, 1, 'Wasser', 20, 1, 2),
(2157, 2, 'Wasser', 20, 1, 2),
(2158, 14, 'Wasser', 20, 1, 2),
(2159, 1, 'Energy Drink', 30, 5, 2),
(2160, 2, 'Energy Drink', 30, 5, 2),
(2161, 3, 'Energy Drink', 30, 5, 2),
(2162, 4, 'Energy Drink', 30, 5, 2),
(2163, 5, 'Energy Drink', 30, 5, 2),
(2164, 6, 'Energy Drink', 30, 5, 2),
(2165, 7, 'Energy Drink', 30, 5, 2),
(2166, 8, 'Energy Drink', 30, 5, 2),
(2167, 9, 'Energy Drink', 30, 5, 2),
(2168, 10, 'Energy Drink', 30, 5, 2),
(2169, 11, 'Energy Drink', 30, 5, 2),
(2170, 12, 'Energy Drink', 30, 5, 2),
(2171, 13, 'Energy Drink', 30, 5, 2),
(2172, 14, 'Energy Drink', 30, 5, 2),
(2173, 1, 'O-Saft', 40, 2, 2),
(2174, 2, 'O-Saft', 40, 2, 2),
(2175, 3, 'O-Saft', 40, 2, 2),
(2176, 4, 'O-Saft', 40, 2, 2),
(2177, 5, 'O-Saft', 40, 2, 2),
(2179, 6, 'O-Saft', 40, 2, 2),
(2180, 7, 'O-Saft', 40, 2, 2),
(2181, 8, 'O-Saft', 40, 2, 2),
(2182, 9, 'O-Saft', 40, 2, 2),
(2183, 10, 'O-Saft', 40, 2, 2),
(2184, 11, 'O-Saft', 40, 2, 2),
(2185, 12, 'O-Saft', 40, 2, 2),
(2186, 13, 'O-Saft', 40, 2, 2),
(2187, 14, 'O-Saft', 40, 2, 2),
(2188, 1, 'Milch', 30, 2, 2),
(2189, 2, 'Milch', 30, 2, 2),
(2190, 3, 'Milch', 30, 2, 2),
(2191, 4, 'Milch', 30, 2, 2),
(2192, 5, 'Milch', 30, 2, 2),
(2193, 6, 'Milch', 30, 2, 2),
(2194, 7, 'Milch', 30, 2, 2),
(2195, 8, 'Milch', 30, 2, 2),
(2196, 9, 'Milch', 30, 2, 2),
(2197, 10, 'Milch', 30, 2, 2),
(2198, 11, 'Milch', 30, 2, 2),
(2199, 12, 'Milch', 30, 2, 2),
(2200, 13, 'Milch', 30, 2, 2),
(2201, 14, 'Milch', 30, 2, 2),
(2202, 24, 'Schaufel', 20, 27, 2),
(2204, 25, 'Fahrzeugschluessel FYB', 1, 5, 2),
(2205, 25, 'Schlagring', 1, 75, 2),
(2206, 25, 'Cal50 Pistole', 1, 75, 2),
(2207, 25, 'Cal50 Pistolen Munitionsbox', 10, 25, 2),
(2208, 26, 'Cal50 Pistole', 1, 75, 2),
(2209, 26, 'Cal50 Pistolen Munitionsbox', 10, 25, 2),
(2210, 26, 'Springmesser', 1, 75, 2),
(2211, 26, 'Fahrzeugschluessel Yakuza', 1, 5, 2),
(2212, 18, 'Verbandskasten', 1, 5, 2),
(2213, 19, 'LSPD T-Shirtbandana', 1, 0, 2),
(2214, 19, 'Polizei-Oberteil Patches -M-', 1, 0, 0),
(2215, 19, 'Polizei-Oberteil Patches2 -M-', 1, 0, 0),
(2216, 19, 'Polizei-Hose -M-', 1, 0, 0),
(2217, 19, 'Polizei-Oberteil -M-', 1, 0, 0),
(2218, 18, 'SMG', 1, 1000, 2),
(2220, 18, 'Taschenlampe', 1, 0, 2),
(2221, 18, 'Elektroschocker', 1, 250, 2),
(2224, 18, 'SMG Munitionsbox', 5, 30, 2),
(2225, 18, 'Karabiner Munitionsbox', 5, 50, 2),
(2227, 18, 'Karabiner', 1, 6000, 2),
(2228, 27, 'Tablet', 1, 200, 2),
(2229, 28, 'Schwarze Schlanke Jeans -M-', 1, 10, 0),
(2230, 28, 'Gelbes T-Shirt -M-', 1, 10, 0),
(2231, 28, 'Graue Schuhe -M-', 1, 10, 0),
(2232, 29, 'Fahrzeugschluessel GF', 1, 5, 2),
(2233, 29, 'Baseballschlaeger', 1, 75, 2),
(2234, 29, 'Cal50 Pistolen Munitionsbox', 10, 25, 2),
(2235, 29, 'Cal50 Pistole', 1, 75, 2),
(2236, 28, 'Turnschuhe grau -F-', 1, 10, 1),
(2237, 28, 'Jeans hochgekrämpelt dunkelgrau -F-', 1, 10, 1),
(2238, 28, 'Schultershirt grau -F-', 1, 10, 1),
(2239, 31, 'Defibrilator', 1, 75, 2),
(2240, 31, 'Fahrzeugschluessel LSFD', 1, 5, 2),
(2241, 31, 'Verbandskasten', 10, 5, 2),
(2242, 31, 'Reparaturkit', 10, 5, 2),
(2243, 2, 'Reparaturkit', 10, 500, 2),
(2246, 32, 'Methamphetamin', 1, 112, 2),
(2247, 33, 'Methamphetamin', 1, 112, 2),
(2248, 34, 'Methamphetamin', 1, 112, 2),
(2249, 24, 'Kescher', 1, 1500, 2),
(2250, 30, 'Medic-Jacke Blau -M-', 1, 0, 0),
(2251, 30, 'Medic-Jacke Gruen -M-', 1, 0, 0),
(2252, 30, 'Medic-Hemd Blau -M-', 1, 0, 0),
(2253, 30, 'Medic-Hemd Gruen -M-', 1, 0, 0),
(2254, 30, 'Medic-Hemd Blau mit Patches -M-', 1, 0, 0),
(2255, 19, 'PolizeiHemd mit Patches 2 -F-', 1, 0, 1),
(2256, 30, 'Chefarzthose -M-', 1, 0, 0),
(2257, 35, 'Pistolen Munitionsbox', 5, 3500, 2),
(2258, 35, 'Pistole', 1, 15500, 2),
(2259, 36, 'Pistolen Munitionsbox', 5, 3500, 2),
(2260, 36, 'Pistole', 1, 15500, 2),
(2261, 1, 'Tablet', 1, 200, 2),
(2262, 2, 'Tablet', 1, 200, 2),
(2263, 3, 'Tablet', 1, 200, 2),
(2264, 4, 'Tablet', 1, 200, 2),
(2265, 5, 'Tablet', 1, 200, 2),
(2266, 6, 'Tablet', 1, 200, 2),
(2267, 7, 'Tablet', 1, 200, 2),
(2268, 8, 'Tablet', 1, 200, 2),
(2269, 9, 'Tablet', 1, 200, 2),
(2270, 10, 'Tablet', 1, 200, 2),
(2271, 11, 'Tablet', 1, 200, 2),
(2272, 12, 'Tablet', 1, 200, 2),
(2273, 13, 'Tablet', 1, 200, 2),
(2274, 14, 'Tablet', 1, 200, 2),
(2275, 1, 'Tasche', 1, 50, 2),
(2276, 2, 'Tasche', 1, 50, 2),
(2277, 3, 'Tasche', 1, 50, 2),
(2278, 4, 'Tasche', 1, 50, 2),
(2279, 5, 'Tasche', 1, 50, 2),
(2280, 6, 'Tasche', 1, 50, 2),
(2281, 7, 'Tasche', 1, 50, 2),
(2282, 8, 'Tasche', 1, 50, 2),
(2283, 9, 'Tasche', 1, 50, 2),
(2284, 10, 'Tasche', 1, 50, 2),
(2285, 11, 'Tasche', 1, 50, 2),
(2286, 12, 'Tasche', 1, 50, 2),
(2287, 13, 'Tasche', 1, 50, 2),
(2288, 14, 'Tasche', 1, 50, 2),
(2291, 38, 'Fahrzeugschluessel ACLS', 1, 5, 2),
(2292, 38, 'Reparaturkit', 10, 5, 2),
(2293, 38, 'Verbandskasten', 5, 5, 2),
(2294, 18, 'Weste', 4, 150, 2),
(2295, 37, 'Beige Arbeitshose -M-', 1, 0, 0),
(2296, 37, 'Orangene Wanderstiefel -M-', 1, 0, 0),
(2297, 37, 'Orangene Dicke-Arbeitsjacke -M-', 1, 0, 0),
(2298, 39, 'Fahrzeugschluessel LCN', 1, 5, 2),
(2299, 39, 'Cal50 Pistole', 1, 75, 2),
(2300, 39, 'Cal50 Pistolen Munitionsbox', 10, 5, 2),
(2301, 39, 'Golfschlaeger', 1, 75, 2),
(2302, 40, 'Methamphetamin', 1, 112, 2),
(2303, 1, 'Verbandskasten', 1, 750, 2),
(2304, 2, 'Verbandskasten', 1, 750, 2),
(2305, 3, 'Verbandskasten', 1, 750, 2),
(2306, 4, 'Verbandskasten', 1, 750, 2),
(2307, 5, 'Verbandskasten', 1, 750, 2),
(2308, 6, 'Verbandskasten', 1, 750, 2),
(2309, 7, 'Verbandskasten', 1, 750, 2),
(2310, 8, 'Verbandskasten', 1, 750, 2),
(2311, 9, 'Verbandskasten', 1, 750, 2),
(2312, 10, 'Verbandskasten', 1, 750, 2),
(2313, 11, 'Verbandskasten', 1, 750, 2),
(2314, 12, 'Verbandskasten', 1, 750, 2),
(2315, 13, 'Verbandskasten', 1, 750, 2),
(2316, 14, 'Verbandskasten', 1, 750, 2),
(2317, 30, 'Gruene Medizinerhose -M-', 1, 0, 0),
(2318, 30, 'Blaue Medizinerhose -M-', 1, 0, 0),
(2319, 41, 'Fahrzeugschluessel BG', 1, 5, 2),
(2320, 41, 'Cal50 Pistole', 1, 75, 2),
(2321, 41, 'Cal50 Pistolen Munitionsbox', 10, 25, 2),
(2322, 19, 'FIB Ohrstöpsel', 1, 0, 2),
(2323, 42, 'Cal50 Pistole', 3, 10, 2),
(2324, 42, 'Cal50 Pistolen Munitionsbox', 5, 5, 2),
(2325, 42, 'Generalschluessel FIB', 2, 5, 2),
(2326, 42, 'Handschellen', 2, 5, 2),
(2327, 42, 'Handschellenschluessel', 2, 5, 2),
(2328, 42, 'Fahrzeugschluessel FIB', 1, 5, 2),
(2329, 42, 'Verbandskasten', 1, 5, 2),
(2330, 42, 'SMG', 1, 1000, 2),
(2332, 42, 'Taschenlampe', 1, 0, 2),
(2333, 42, 'Elektroschocker', 1, 250, 2),
(2334, 42, 'SMG Munitionsbox', 5, 30, 2),
(2335, 42, 'Karabiner Munitionsbox', 5, 50, 2),
(2337, 42, 'Karabiner', 1, 6000, 2),
(2339, 42, 'Weste', 4, 150, 2),
(2340, 44, 'Fahrzeugschluessel Crips', 1, 5, 2),
(2341, 44, 'Baseballschlaeger', 1, 75, 2),
(2342, 44, 'Cal50 Pistole', 1, 75, 2),
(2343, 44, 'Cal50 Pistolen Munitionsbox', 10, 25, 2),
(2344, 45, 'Methamphetamin', 1, 112, 2),
(2345, 46, 'Methamphetamin', 1, 112, 2),
(2346, 19, 'Schwarze Sakkohose -M-', 1, 0, 0),
(2347, 19, 'Schwarzes Sakkohemd -M-', 1, 0, 0),
(2348, 19, 'Schwarze Schicke-Anzugsschuhe -M-', 1, 0, 0);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `server_tablet_apps`
--

CREATE TABLE `server_tablet_apps` (
  `id` int(11) NOT NULL,
  `appName` varchar(64) NOT NULL,
  `appPrice` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `server_tablet_apps`
--

INSERT INTO `server_tablet_apps` (`id`, `appName`, `appPrice`) VALUES
(1, 'weather', 5),
(2, 'news', 10),
(3, 'banking', 5),
(4, 'lifeinvader', 15),
(5, 'vehicles', 10),
(6, 'events', 15),
(7, 'sales', 20),
(8, 'buyapp', 25),
(9, 'notices', 4);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `server_tablet_events`
--

CREATE TABLE `server_tablet_events` (
  `id` int(11) NOT NULL,
  `charId` int(11) NOT NULL,
  `title` varchar(64) NOT NULL,
  `owner` varchar(64) NOT NULL,
  `callnumber` varchar(64) NOT NULL,
  `location` varchar(64) NOT NULL,
  `eventtype` varchar(64) NOT NULL,
  `date` varchar(64) NOT NULL,
  `time` varchar(64) NOT NULL,
  `info` varchar(128) NOT NULL,
  `created` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `server_tablet_notes`
--

CREATE TABLE `server_tablet_notes` (
  `id` int(11) NOT NULL,
  `charId` int(11) NOT NULL,
  `color` varchar(64) NOT NULL,
  `title` varchar(64) NOT NULL,
  `text` varchar(128) NOT NULL,
  `created` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `server_tattoos`
--

CREATE TABLE `server_tattoos` (
  `id` int(11) NOT NULL,
  `collection` varchar(64) NOT NULL,
  `nameHash` varchar(64) NOT NULL,
  `name` varchar(64) NOT NULL,
  `part` varchar(64) NOT NULL,
  `price` int(11) NOT NULL,
  `gender` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `server_tattoos`
--

INSERT INTO `server_tattoos` (`id`, `collection`, `nameHash`, `name`, `part`, `price`, `gender`) VALUES
(1, 'mpairraces_overlays', 'MP_Airraces_Tattoo_000_M', 'Turbulence', 'Torso', 1320, 0),
(2, 'mpairraces_overlays', 'MP_Airraces_Tattoo_001_M', 'Pilot Skull', 'Torso', 1810, 0),
(3, 'mpairraces_overlays', 'MP_Airraces_Tattoo_002_M', 'Winged Bombshell', 'Torso', 1648, 0),
(4, 'mpairraces_overlays', 'MP_Airraces_Tattoo_003_M', 'Toxic Trails', 'leftArm', 1198, 0),
(5, 'mpairraces_overlays', 'MP_Airraces_Tattoo_004_M', 'Balloon Pioneer', 'Torso', 1039, 0),
(6, 'mpairraces_overlays', 'MP_Airraces_Tattoo_005_M', 'Parachute Belle', 'Torso', 1527, 0),
(7, 'mpairraces_overlays', 'MP_Airraces_Tattoo_006_M', 'Bombs Away', 'Torso', 1252, 0),
(8, 'mpairraces_overlays', 'MP_Airraces_Tattoo_007_M', 'Eagle Eyes', 'Torso', 1392, 0),
(9, 'mpbeach_overlays', 'MP_Bea_M_Back_000', 'Ship Arms', 'Torso', 725, 0),
(10, 'mpbeach_overlays', 'MP_Bea_M_Chest_000', 'Tribal Hammerhead', 'Torso', 580, 0),
(11, 'mpbeach_overlays', 'MP_Bea_M_Chest_001', 'Tribal Shark', 'Torso', 590, 0),
(12, 'mpbeach_overlays', 'MP_Bea_M_Head_000', 'Pirate Skull', 'Head', 1200, 0),
(13, 'mpbeach_overlays', 'MP_Bea_M_Head_001', 'Surf LS', 'Head', 145, 0),
(14, 'mpbeach_overlays', 'MP_Bea_M_Head_002', 'Shark', 'Head', 185, 0),
(15, 'mpbeach_overlays', 'MP_Bea_M_Lleg_000', 'Tribal Star', 'leftLeg', 445, 0),
(16, 'mpbeach_overlays', 'MP_Bea_M_Rleg_000', 'Tribal Tiki Tower', 'rightLeg', 650, 0),
(17, 'mpbeach_overlays', 'MP_Bea_M_RArm_000', 'Tribal Sun', 'rightArm', 620, 0),
(18, 'mpbeach_overlays', 'MP_Bea_M_LArm_000', 'Tiki Tower', 'leftArm', 480, 0),
(19, 'mpbeach_overlays', 'MP_Bea_M_LArm_001', 'Mermaid L.S.', 'leftArm', 660, 0),
(20, 'mpbeach_overlays', 'MP_Bea_M_Neck_000', 'Little Fish', 'Head', 165, 0),
(21, 'mpbeach_overlays', 'MP_Bea_M_Neck_001', 'Surfs Up', 'Head', 225, 0),
(22, 'mpbeach_overlays', 'MP_Bea_M_RArm_001', 'Vespucci Beauty', 'rightArm', 700, 0),
(23, 'mpbeach_overlays', 'MP_Bea_M_Stom_000', 'Swordfish', 'Torso', 310, 0),
(24, 'mpbeach_overlays', 'MP_Bea_M_Stom_001', 'Wheel', 'Torso', 550, 0),
(25, 'mpbiker_overlays', 'MP_MP_Biker_Tat_000_M', 'Demon Rider', 'Torso', 672, 0),
(26, 'mpbiker_overlays', 'MP_MP_Biker_Tat_001_M', 'Both Barrels', 'Torso', 1080, 0),
(27, 'mpbiker_overlays', 'MP_MP_Biker_Tat_002_M', 'Rose Tribute', 'leftLeg', 1682, 0),
(28, 'mpbiker_overlays', 'MP_MP_Biker_Tat_003_M', 'Web Rider', 'Torso', 1085, 0),
(29, 'mpbiker_overlays', 'MP_MP_Biker_Tat_004_M', 'Dragon\'s Fury', 'rightLeg', 1795, 0),
(30, 'mpbiker_overlays', 'MP_MP_Biker_Tat_005_M', 'Made In America', 'Torso', 923, 0),
(31, 'mpbiker_overlays', 'MP_MP_Biker_Tat_006_M', 'Chopper Freedom', 'Torso', 1040, 0),
(32, 'mpbiker_overlays', 'MP_MP_Biker_Tat_007_M', 'Swooping Eagle', 'rightArm', 510, 0),
(33, 'mpbiker_overlays', 'MP_MP_Biker_Tat_008_M', 'Freedom Wheels', 'Torso', 878, 0),
(34, 'mpbiker_overlays', 'MP_MP_Biker_Tat_009_M', 'Morbid Arachnid', 'Head', 635, 0),
(35, 'mpbiker_overlays', 'MP_MP_Biker_Tat_010_M', 'Skull Of Taurus', 'Torso', 1135, 0),
(36, 'mpbiker_overlays', 'MP_MP_Biker_Tat_011_M', 'R.I.P. My Brothers', 'Torso', 1235, 0),
(37, 'mpbiker_overlays', 'MP_MP_Biker_Tat_012_M', 'Urban Stunter', 'leftArm', 498, 0),
(38, 'mpbiker_overlays', 'MP_MP_Biker_Tat_013_M', 'Demon Crossbones', 'Torso', 1114, 0),
(39, 'mpbiker_overlays', 'MP_MP_Biker_Tat_014_M', 'Lady Mortality', 'rightArm', 830, 0),
(40, 'mpbiker_overlays', 'MP_MP_Biker_Tat_015_M', 'Ride or Die', 'leftLeg', 897, 0),
(41, 'mpbiker_overlays', 'MP_MP_Biker_Tat_016_M', 'Macabre Tree', 'leftArm', 900, 0),
(42, 'mpbiker_overlays', 'MP_MP_Biker_Tat_017_M', 'Clawed Beast', 'Torso', 1565, 0),
(43, 'mpbiker_overlays', 'MP_MP_Biker_Tat_018_M', 'Skeletal Chopper', 'Torso', 765, 0),
(44, 'mpbiker_overlays', 'MP_MP_Biker_Tat_019_M', 'Gruesome Talons', 'Torso', 990, 0),
(45, 'mpbiker_overlays', 'MP_MP_Biker_Tat_020_M', 'Cranial Rose', 'leftArm', 974, 0),
(46, 'mpbiker_overlays', 'MP_MP_Biker_Tat_021_M', 'Flaming Reaper', 'Torso', 1370, 0),
(47, 'mpbiker_overlays', 'MP_MP_Biker_Tat_022_M', 'Western Insignia', 'rightLeg', 938, 0),
(48, 'mpbiker_overlays', 'MP_MP_Biker_Tat_023_M', 'Western MC', 'Torso', 1000, 0),
(49, 'mpbiker_overlays', 'MP_MP_Biker_Tat_024_M', 'Live to Ride', 'leftArm', 1532, 0),
(50, 'mpbiker_overlays', 'MP_MP_Biker_Tat_025_M', 'Good Luck', 'leftArm', 1295, 0),
(51, 'mpbiker_overlays', 'MP_MP_Biker_Tat_026_M', 'American Dream', 'Torso', 1100, 0),
(52, 'mpbiker_overlays', 'MP_MP_Biker_Tat_027_M', 'Bad Luck', 'leftLeg', 696, 0),
(53, 'mpbiker_overlays', 'MP_MP_Biker_Tat_028_M', 'Dusk Rider', 'rightLeg', 1452, 0),
(54, 'mpbiker_overlays', 'MP_MP_Biker_Tat_029_M', 'Bone Wrench', 'Torso', 963, 0),
(55, 'mpbiker_overlays', 'MP_MP_Biker_Tat_030_M', 'Brothers For Life', 'Torso', 981, 0),
(56, 'mpbiker_overlays', 'MP_MP_Biker_Tat_031_M', 'Gear Head', 'Torso', 860, 0),
(57, 'mpbiker_overlays', 'MP_MP_Biker_Tat_032_M', 'Western Eagle', 'Torso', 765, 0),
(58, 'mpbiker_overlays', 'MP_MP_Biker_Tat_033_M', 'Eagle Emblem', 'rightArm', 438, 0),
(59, 'mpbiker_overlays', 'MP_MP_Biker_Tat_034_M', 'Brotherhood of Bikes', 'Torso', 997, 0),
(60, 'mpbiker_overlays', 'MP_MP_Biker_Tat_035_M', 'Chain Fist', 'leftArm', 578, 0),
(61, 'mpbiker_overlays', 'MP_MP_Biker_Tat_036_M', 'Engulfed Skull', 'leftLeg', 930, 0),
(62, 'mpbiker_overlays', 'MP_MP_Biker_Tat_037_M', 'Scorched Soul', 'leftLeg', 1249, 0),
(63, 'mpbiker_overlays', 'MP_MP_Biker_Tat_038_M', 'FTW', 'Head', 390, 0),
(64, 'mpbiker_overlays', 'MP_MP_Biker_Tat_039_M', 'Gas Guzzler', 'Torso', 1095, 0),
(65, 'mpbiker_overlays', 'MP_MP_Biker_Tat_040_M', 'American Made', 'rightLeg', 1362, 0),
(66, 'mpbiker_overlays', 'MP_MP_Biker_Tat_041_M', 'No Regrets', 'Torso', 832, 0),
(67, 'mpbiker_overlays', 'MP_MP_Biker_Tat_042_M', 'Grim Rider', 'rightArm', 786, 0),
(68, 'mpbiker_overlays', 'MP_MP_Biker_Tat_043_M', 'Ride Forever', 'Torso', 685, 0),
(69, 'mpbiker_overlays', 'MP_MP_Biker_Tat_044_M', 'Ride Free', 'leftLeg', 1190, 0),
(70, 'mpbiker_overlays', 'MP_MP_Biker_Tat_045_M', 'Ride Hard Die Fast', 'leftArm', 632, 0),
(71, 'mpbiker_overlays', 'MP_MP_Biker_Tat_046_M', 'Skull Chain', 'rightArm', 498, 0),
(72, 'mpbiker_overlays', 'MP_MP_Biker_Tat_047_M', 'Snake Bike', 'rightArm', 1350, 0),
(73, 'mpbiker_overlays', 'MP_MP_Biker_Tat_048_M', 'STFU', 'rightLeg', 893, 0),
(74, 'mpbiker_overlays', 'MP_MP_Biker_Tat_049_M', 'These Colors Don\'t Run', 'rightArm', 879, 0),
(75, 'mpbiker_overlays', 'MP_MP_Biker_Tat_050_M', 'Unforgiven', 'Torso', 872, 0),
(76, 'mpbiker_overlays', 'MP_MP_Biker_Tat_051_M', 'Western Stylized', 'Head', 412, 0),
(77, 'mpbiker_overlays', 'MP_MP_Biker_Tat_052_M', 'Biker Mount', 'Torso', 913, 0),
(78, 'mpbiker_overlays', 'MP_MP_Biker_Tat_053_M', 'Muffler Helmet', 'leftArm', 840, 0),
(79, 'mpbiker_overlays', 'MP_MP_Biker_Tat_054_M', 'Mum', 'rightArm', 1045, 0),
(80, 'mpbiker_overlays', 'MP_MP_Biker_Tat_055_M', 'Poison Scorpion', 'leftArm', 1099, 0),
(81, 'mpbiker_overlays', 'MP_MP_Biker_Tat_056_M', 'Bone Cruiser', 'leftLeg', 1496, 0),
(82, 'mpbiker_overlays', 'MP_MP_Biker_Tat_057_M', 'Laughing Skull', 'leftLeg', 1386, 0),
(83, 'mpbiker_overlays', 'MP_MP_Biker_Tat_058_M', 'Reaper Vulture', 'Torso', 798, 0),
(84, 'mpbiker_overlays', 'MP_MP_Biker_Tat_059_M', 'Faggio', 'Torso', 639, 0),
(85, 'mpbiker_overlays', 'MP_MP_Biker_Tat_060_M', 'We Are The Mods!', 'Torso', 710, 0),
(86, 'mpbusiness_overlays', 'MP_Buis_M_Neck_000', 'Cash is King', 'Head', 500, 0),
(87, 'mpbusiness_overlays', 'MP_Buis_M_Neck_001', 'Bold Dollar Sign', 'Head', 160, 0),
(88, 'mpbusiness_overlays', 'MP_Buis_M_Neck_002', 'Script Dollar Sign', 'Head', 175, 0),
(89, 'mpbusiness_overlays', 'MP_Buis_M_Neck_003', '$100', 'Head', 690, 0),
(90, 'mpbusiness_overlays', 'MP_Buis_M_LeftArm_000', '$100 Bill', 'leftArm', 350, 0),
(91, 'mpbusiness_overlays', 'MP_Buis_M_LeftArm_001', 'All-Seeing Eye', 'leftArm', 730, 0),
(92, 'mpbusiness_overlays', 'MP_Buis_M_RightArm_000', 'Dollar Skull', 'rightArm', 480, 0),
(93, 'mpbusiness_overlays', 'MP_Buis_M_RightArm_001', 'Green', 'rightArm', 150, 0),
(94, 'mpbusiness_overlays', 'MP_Buis_M_Stomach_000', 'Refined Hustler', 'Torso', 640, 0),
(95, 'mpbusiness_overlays', 'MP_Buis_M_Chest_000', 'Rich', 'Torso', 325, 0),
(96, 'mpbusiness_overlays', 'MP_Buis_M_Chest_001', '$$$', 'Torso', 350, 0),
(97, 'mpbusiness_overlays', 'MP_Buis_M_Back_000', 'Makin\' Paper', 'Torso', 550, 0),
(98, 'mpchristmas2017_overlays', 'MP_Christmas2017_Tattoo_000_M', 'Thor & Goblin', 'Torso', 1350, 0),
(99, 'mpchristmas2017_overlays', 'MP_Christmas2017_Tattoo_001_M', 'Viking Warrior', 'leftArm', 1726, 0),
(100, 'mpchristmas2017_overlays', 'MP_Christmas2017_Tattoo_002_M', 'Kabuto', 'Torso', 1836, 0),
(101, 'mpchristmas2017_overlays', 'MP_Christmas2017_Tattoo_003_M', 'Native Warrior', 'Torso', 1778, 0),
(102, 'mpchristmas2017_overlays', 'MP_Christmas2017_Tattoo_004_M', 'Tiger & Mask', 'leftArm', 2040, 0),
(103, 'mpchristmas2017_overlays', 'MP_Christmas2017_Tattoo_005_M', 'Ghost Dragon', 'Torso', 5266, 0),
(104, 'mpchristmas2017_overlays', 'MP_Christmas2017_Tattoo_006_M', 'Medusa', 'rightArm', 2203, 0),
(105, 'mpchristmas2017_overlays', 'MP_Christmas2017_Tattoo_007_M', 'Spartan Combat', 'leftArm', 1967, 0),
(106, 'mpchristmas2017_overlays', 'MP_Christmas2017_Tattoo_008_M', 'Spartan Warrior', 'Torso', 3680, 0),
(107, 'mpchristmas2017_overlays', 'MP_Christmas2017_Tattoo_009_M', 'Norse Rune', 'Torso', 2387, 0),
(108, 'mpchristmas2017_overlays', 'MP_Christmas2017_Tattoo_010_M', 'Spartan Shield', 'Torso', 4954, 0),
(109, 'mpchristmas2017_overlays', 'MP_Christmas2017_Tattoo_011_M', 'Weathered Skull', 'Torso', 5395, 0),
(110, 'mpchristmas2017_overlays', 'MP_Christmas2017_Tattoo_012_M', 'Tiger Headdress', 'rightArm', 2119, 0),
(111, 'mpchristmas2017_overlays', 'MP_Christmas2017_Tattoo_013_M', 'Katana', 'leftArm', 2293, 0),
(112, 'mpchristmas2017_overlays', 'MP_Christmas2017_Tattoo_014_M', 'Celtic Band', 'rightArm', 1186, 0),
(113, 'mpchristmas2017_overlays', 'MP_Christmas2017_Tattoo_015_M', 'Samurai Combat', 'Torso', 5046, 0),
(114, 'mpchristmas2017_overlays', 'MP_Christmas2017_Tattoo_016_M', 'Odin & Raven', 'Torso', 5150, 0),
(115, 'mpchristmas2017_overlays', 'MP_Christmas2017_Tattoo_017_M', 'Feather Sleeve', 'rightArm', 3208, 0),
(116, 'mpchristmas2017_overlays', 'MP_Christmas2017_Tattoo_018_M', 'Muscle Tear', 'rightArm', 3441, 0),
(117, 'mpchristmas2017_overlays', 'MP_Christmas2017_Tattoo_019_M', 'Strike Force', 'Torso', 1678, 0),
(118, 'mpchristmas2017_overlays', 'MP_Christmas2017_Tattoo_020_M', 'Medusa\'s Gaze', 'Torso', 4689, 0),
(119, 'mpchristmas2017_overlays', 'MP_Christmas2017_Tattoo_021_M', 'Spartan & Lion', 'Torso', 2487, 0),
(120, 'mpchristmas2017_overlays', 'MP_Christmas2017_Tattoo_022_M', 'Spartan & Horse', 'Torso', 2997, 0),
(121, 'mpchristmas2017_overlays', 'MP_Christmas2017_Tattoo_023_M', 'Samurai Tallship', 'rightArm', 3924, 0),
(122, 'mpchristmas2017_overlays', 'MP_Christmas2017_Tattoo_024_M', 'Dragon Slayer', 'Torso', 4174, 0),
(123, 'mpchristmas2017_overlays', 'MP_Christmas2017_Tattoo_025_M', 'Winged Serpent', 'leftArm', 2756, 0),
(124, 'mpchristmas2017_overlays', 'MP_Christmas2017_Tattoo_026_M', 'Spartan Skull', 'Torso', 1898, 0),
(125, 'mpchristmas2017_overlays', 'MP_Christmas2017_Tattoo_027_M', 'Molon Labe', 'Torso', 4428, 0),
(126, 'mpchristmas2017_overlays', 'MP_Christmas2017_Tattoo_028_M', 'Spartan Mural', 'rightArm', 1515, 0),
(127, 'mpchristmas2017_overlays', 'MP_Christmas2017_Tattoo_029_M', 'Cerberus', 'leftArm', 2592, 0),
(128, 'mpchristmas2018_overlays', 'MP_Christmas2018_Tat_000_M', '???', 'Torso', 10, 0),
(129, 'mpchristmas2_overlays', 'MP_Xmas2_M_Tat_000', 'Skull Rider', 'leftArm', 595, 0),
(130, 'mpchristmas2_overlays', 'MP_Xmas2_M_Tat_001', 'Spider Outline', 'leftLeg', 465, 0),
(131, 'mpchristmas2_overlays', 'MP_Xmas2_M_Tat_002', 'Spider Color', 'leftLeg', 635, 0),
(132, 'mpchristmas2_overlays', 'MP_Xmas2_M_Tat_003', 'Snake Outline', 'rightArm', 845, 0),
(133, 'mpchristmas2_overlays', 'MP_Xmas2_M_Tat_004', 'Snake Shaded', 'rightArm', 1325, 0),
(134, 'mpchristmas2_overlays', 'MP_Xmas2_M_Tat_005', 'Carp Outline', 'Torso', 875, 0),
(135, 'mpchristmas2_overlays', 'MP_Xmas2_M_Tat_006', 'Carp Shaded', 'Torso', 1450, 0),
(136, 'mpchristmas2_overlays', 'MP_Xmas2_M_Tat_007', 'Los Muertos', 'Head', 395, 0),
(137, 'mpchristmas2_overlays', 'MP_Xmas2_M_Tat_008', 'Death Before Dishonor', 'rightArm', 430, 0),
(138, 'mpchristmas2_overlays', 'MP_Xmas2_M_Tat_009', 'Time To Die', 'Torso', 780, 0),
(139, 'mpchristmas2_overlays', 'MP_Xmas2_M_Tat_010', 'Electric Snake', 'leftArm', 620, 0),
(140, 'mpchristmas2_overlays', 'MP_Xmas2_M_Tat_011', 'Roaring Tiger', 'Torso', 685, 0),
(141, 'mpchristmas2_overlays', 'MP_Xmas2_M_Tat_012', '8 Ball Skull', 'leftArm', 825, 0),
(142, 'mpchristmas2_overlays', 'MP_Xmas2_M_Tat_013', 'Lizard', 'Torso', 790, 0),
(143, 'mpchristmas2_overlays', 'MP_Xmas2_M_Tat_014', 'Floral Dagger', 'rightLeg', 1050, 0),
(144, 'mpchristmas2_overlays', 'MP_Xmas2_M_Tat_015', 'Japanese Warrior', 'Torso', 1100, 0),
(145, 'mpchristmas2_overlays', 'MP_Xmas2_M_Tat_016', 'Loose Lips Outline', 'Torso', 315, 0),
(146, 'mpchristmas2_overlays', 'MP_Xmas2_M_Tat_017', 'Loose Lips Color', 'Torso', 635, 0),
(147, 'mpchristmas2_overlays', 'MP_Xmas2_M_Tat_018', 'Royal Dagger Outline', 'Torso', 430, 0),
(148, 'mpchristmas2_overlays', 'MP_Xmas2_M_Tat_019', 'Royal Dagger Color', 'Torso', 750, 0),
(149, 'mpchristmas2_overlays', 'MP_Xmas2_M_Tat_020', 'Time\'s Up Outline', 'leftArm', 250, 0),
(150, 'mpchristmas2_overlays', 'MP_Xmas2_M_Tat_021', 'Time\'s Up Color', 'leftArm', 375, 0),
(151, 'mpchristmas2_overlays', 'MP_Xmas2_M_Tat_022', 'You\'re Next Outline', 'rightArm', 380, 0),
(152, 'mpchristmas2_overlays', 'MP_Xmas2_M_Tat_023', 'You\'re Next Color', 'rightArm', 510, 0),
(153, 'mpchristmas2_overlays', 'MP_Xmas2_M_Tat_024', 'Snake Head Outline', 'Head', 210, 0),
(154, 'mpchristmas2_overlays', 'MP_Xmas2_M_Tat_025', 'Snake Head Color', 'Head', 460, 0),
(155, 'mpchristmas2_overlays', 'MP_Xmas2_M_Tat_026', 'Fuck Luck Outline', 'rightArm', 130, 0),
(156, 'mpchristmas2_overlays', 'MP_Xmas2_M_Tat_027', 'Fuck Luck Color', 'rightArm', 220, 0),
(157, 'mpchristmas2_overlays', 'MP_Xmas2_M_Tat_028', 'Executioner', 'Torso', 570, 0),
(158, 'mpchristmas2_overlays', 'MP_Xmas2_M_Tat_029', 'Beautiful Death', 'Head', 315, 0),
(159, 'mpgunrunning_overlays', 'MP_Gunrunning_Tattoo_000_M', 'Bullet Proof', 'Torso', 1698, 0),
(160, 'mpgunrunning_overlays', 'MP_Gunrunning_Tattoo_001_M', 'Crossed Weapons', 'Torso', 1935, 0),
(161, 'mpgunrunning_overlays', 'MP_Gunrunning_Tattoo_002_M', 'Grenade', 'rightArm', 1465, 0),
(162, 'mpgunrunning_overlays', 'MP_Gunrunning_Tattoo_003_M', 'Lock & Load', 'Head', 875, 0),
(163, 'mpgunrunning_overlays', 'MP_Gunrunning_Tattoo_004_M', 'Sidearm', 'leftArm', 1128, 0),
(164, 'mpgunrunning_overlays', 'MP_Gunrunning_Tattoo_005_M', 'Patriot Skull', 'leftLeg', 912, 0),
(165, 'mpgunrunning_overlays', 'MP_Gunrunning_Tattoo_006_M', 'Combat Skull', 'rightLeg', 1067, 0),
(166, 'mpgunrunning_overlays', 'MP_Gunrunning_Tattoo_007_M', 'Stylized Tiger', 'leftLeg', 966, 0),
(167, 'mpgunrunning_overlays', 'MP_Gunrunning_Tattoo_008_M', 'Bandolier', 'leftArm', 1344, 0),
(168, 'mpgunrunning_overlays', 'MP_Gunrunning_Tattoo_009_M', 'Butterfly Knife', 'Torso', 1465, 0),
(169, 'mpgunrunning_overlays', 'MP_Gunrunning_Tattoo_010_M', 'Cash Money', 'Torso', 1905, 0),
(170, 'mpgunrunning_overlays', 'MP_Gunrunning_Tattoo_011_M', 'Death Skull', 'leftLeg', 978, 0),
(171, 'mpgunrunning_overlays', 'MP_Gunrunning_Tattoo_012_M', 'Dollar Daggers', 'Torso', 1506, 0),
(172, 'mpgunrunning_overlays', 'MP_Gunrunning_Tattoo_013_M', 'Wolf Insignia', 'Torso', 1611, 0),
(173, 'mpgunrunning_overlays', 'MP_Gunrunning_Tattoo_014_M', 'Backstabber', 'Torso', 1720, 0),
(174, 'mpgunrunning_overlays', 'MP_Gunrunning_Tattoo_015_M', 'Spiked Skull', 'leftArm', 1042, 0),
(175, 'mpgunrunning_overlays', 'MP_Gunrunning_Tattoo_016_M', 'Blood Money', 'leftArm', 1036, 0),
(176, 'mpgunrunning_overlays', 'MP_Gunrunning_Tattoo_017_M', 'Dog Tags', 'Torso', 898, 0),
(177, 'mpgunrunning_overlays', 'MP_Gunrunning_Tattoo_018_M', 'Dual Wield Skull', 'Torso', 1775, 0),
(178, 'mpgunrunning_overlays', 'MP_Gunrunning_Tattoo_019_M', 'Pistol Wings', 'Torso', 1802, 0),
(179, 'mpgunrunning_overlays', 'MP_Gunrunning_Tattoo_020_M', 'Crowned Weapons', 'Torso', 1987, 0),
(180, 'mpgunrunning_overlays', 'MP_Gunrunning_Tattoo_021_M', 'Have a Nice Day', 'rightArm', 946, 0),
(181, 'mpgunrunning_overlays', 'MP_Gunrunning_Tattoo_022_M', 'Explosive Heart', 'Torso', 1082, 0),
(182, 'mpgunrunning_overlays', 'MP_Gunrunning_Tattoo_023_M', 'Rose Revolver', 'leftLeg', 888, 0),
(183, 'mpgunrunning_overlays', 'MP_Gunrunning_Tattoo_024_M', 'Combat Reaper', 'rightArm', 1034, 0),
(184, 'mpgunrunning_overlays', 'MP_Gunrunning_Tattoo_025_M', 'Praying Skull', 'leftArm', 1215, 0),
(185, 'mpgunrunning_overlays', 'MP_Gunrunning_Tattoo_026_M', 'Restless Skull', 'rightLeg', 1151, 0),
(186, 'mpgunrunning_overlays', 'MP_Gunrunning_Tattoo_027_M', 'Serpent Revolver', 'leftArm', 842, 0),
(187, 'mpgunrunning_overlays', 'MP_Gunrunning_Tattoo_028_M', 'Micro SMG Chain', 'Torso', 996, 0),
(188, 'mpgunrunning_overlays', 'MP_Gunrunning_Tattoo_029_M', 'Win Some Lose Some', 'Torso', 1409, 0),
(189, 'mpgunrunning_overlays', 'MP_Gunrunning_Tattoo_030_M', 'Pistol Ace', 'rightLeg', 1105, 0),
(190, 'mphipster_overlays', 'FM_Hip_M_Tat_000', 'Crossed Arrows', 'Torso', 675, 0),
(191, 'mphipster_overlays', 'FM_Hip_M_Tat_001', 'Single Arrow', 'rightArm', 200, 0),
(192, 'mphipster_overlays', 'FM_Hip_M_Tat_002', 'Chemistry', 'Torso', 290, 0),
(193, 'mphipster_overlays', 'FM_Hip_M_Tat_003', 'Diamond Sparkle', 'leftArm', 210, 0),
(194, 'mphipster_overlays', 'FM_Hip_M_Tat_004', 'Bone', 'rightArm', 290, 0),
(195, 'mphipster_overlays', 'FM_Hip_M_Tat_005', 'Beautiful Eye', 'Head', 745, 0),
(196, 'mphipster_overlays', 'FM_Hip_M_Tat_006', 'Feather Birds', 'Torso', 455, 0),
(197, 'mphipster_overlays', 'FM_Hip_M_Tat_007', 'Bricks', 'leftArm', 600, 0),
(198, 'mphipster_overlays', 'FM_Hip_M_Tat_008', 'Cube', 'rightArm', 485, 0),
(199, 'mphipster_overlays', 'FM_Hip_M_Tat_009', 'Squares', 'leftLeg', 400, 0),
(200, 'mphipster_overlays', 'FM_Hip_M_Tat_010', 'Horseshoe', 'rightArm', 315, 0),
(201, 'mphipster_overlays', 'FM_Hip_M_Tat_011', 'Infinity', 'Torso', 300, 0),
(202, 'mphipster_overlays', 'FM_Hip_M_Tat_012', 'Antlers', 'Torso', 650, 0),
(203, 'mphipster_overlays', 'FM_Hip_M_Tat_013', 'Boombox', 'Torso', 695, 0),
(204, 'mphipster_overlays', 'FM_Hip_M_Tat_014', 'Spray Can', 'rightArm', 430, 0),
(205, 'mphipster_overlays', 'FM_Hip_M_Tat_015', 'Mustache', 'leftArm', 340, 0),
(206, 'mphipster_overlays', 'FM_Hip_M_Tat_016', 'Lightning Bolt', 'leftArm', 370, 0),
(207, 'mphipster_overlays', 'FM_Hip_M_Tat_017', 'Eye Triangle', 'rightArm', 265, 0),
(208, 'mphipster_overlays', 'FM_Hip_M_Tat_018', 'Origami', 'rightArm', 180, 0),
(209, 'mphipster_overlays', 'FM_Hip_M_Tat_019', 'Charm', 'leftLeg', 340, 0),
(210, 'mphipster_overlays', 'FM_Hip_M_Tat_020', 'Geo Pattern', 'rightArm', 735, 0),
(211, 'mphipster_overlays', 'FM_Hip_M_Tat_021', 'Geo Fox', 'Head', 785, 0),
(212, 'mphipster_overlays', 'FM_Hip_M_Tat_022', 'Pencil', 'rightArm', 225, 0),
(213, 'mphipster_overlays', 'FM_Hip_M_Tat_023', 'Smiley', 'rightArm', 700, 0),
(214, 'mphipster_overlays', 'FM_Hip_M_Tat_024', 'Pyramid', 'Torso', 295, 0),
(215, 'mphipster_overlays', 'FM_Hip_M_Tat_025', 'Watch Your Step', 'Torso', 350, 0),
(216, 'mphipster_overlays', 'FM_Hip_M_Tat_026', 'Pizza', 'leftArm', 240, 0),
(217, 'mphipster_overlays', 'FM_Hip_M_Tat_027', 'Padlock', 'leftArm', 575, 0),
(218, 'mphipster_overlays', 'FM_Hip_M_Tat_028', 'Thorny Rose', 'leftArm', 480, 0),
(219, 'mphipster_overlays', 'FM_Hip_M_Tat_029', 'Sad', 'Torso', 185, 0),
(220, 'mphipster_overlays', 'FM_Hip_M_Tat_030', 'Shark Fin', 'Torso', 225, 0),
(221, 'mphipster_overlays', 'FM_Hip_M_Tat_031', 'Skateboard', 'Torso', 495, 0),
(222, 'mphipster_overlays', 'FM_Hip_M_Tat_032', 'Paper Plane', 'Torso', 435, 0),
(223, 'mphipster_overlays', 'FM_Hip_M_Tat_033', 'Stag', 'Torso', 695, 0),
(224, 'mphipster_overlays', 'FM_Hip_M_Tat_034', 'Stop', 'leftArm', 950, 0),
(225, 'mphipster_overlays', 'FM_Hip_M_Tat_035', 'Sewn Heart', 'Torso', 750, 0),
(226, 'mphipster_overlays', 'FM_Hip_M_Tat_036', 'Shapes', 'rightArm', 515, 0),
(227, 'mphipster_overlays', 'FM_Hip_M_Tat_037', 'Sunrise', 'leftArm', 375, 0),
(228, 'mphipster_overlays', 'FM_Hip_M_Tat_038', 'Grub', 'rightLeg', 350, 0),
(229, 'mphipster_overlays', 'FM_Hip_M_Tat_039', 'Sleeve', 'leftArm', 1000, 0),
(230, 'mphipster_overlays', 'FM_Hip_M_Tat_040', 'Black Anchor', 'leftLeg', 295, 0),
(231, 'mphipster_overlays', 'FM_Hip_M_Tat_041', 'Tooth', 'Torso', 257, 0),
(232, 'mphipster_overlays', 'FM_Hip_M_Tat_042', 'Sparkplug', 'rightLeg', 430, 0),
(233, 'mphipster_overlays', 'FM_Hip_M_Tat_043', 'Triangle White', 'leftArm', 550, 0),
(234, 'mphipster_overlays', 'FM_Hip_M_Tat_044', 'Triangle Black', 'rightArm', 550, 0),
(235, 'mphipster_overlays', 'FM_Hip_M_Tat_045', 'Mesh Band', 'rightArm', 400, 0),
(236, 'mphipster_overlays', 'FM_Hip_M_Tat_046', 'Triangles', 'Torso', 375, 0),
(237, 'mphipster_overlays', 'FM_Hip_M_Tat_047', 'Cassette', 'Torso', 190, 0),
(238, 'mphipster_overlays', 'FM_Hip_M_Tat_048', 'Peace', 'leftArm', 785, 0),
(239, 'mpimportexport_overlays', 'MP_MP_ImportExport_Tat_000_M', 'Block Back', 'Torso', 1378, 0),
(240, 'mpimportexport_overlays', 'MP_MP_ImportExport_Tat_001_M', 'Power Plant', 'Torso', 1290, 0),
(241, 'mpimportexport_overlays', 'MP_MP_ImportExport_Tat_002_M', 'Tuned to Death', 'Torso', 1212, 0),
(242, 'mpimportexport_overlays', 'MP_MP_ImportExport_Tat_003_M', 'Mechanical Sleeve', 'rightArm', 1720, 0),
(243, 'mpimportexport_overlays', 'MP_MP_ImportExport_Tat_004_M', 'Piston Sleeve', 'leftArm', 1635, 0),
(244, 'mpimportexport_overlays', 'MP_MP_ImportExport_Tat_005_M', 'Dialed In', 'rightArm', 1861, 0),
(245, 'mpimportexport_overlays', 'MP_MP_ImportExport_Tat_006_M', 'Engulfed Block', 'rightArm', 1572, 0),
(246, 'mpimportexport_overlays', 'MP_MP_ImportExport_Tat_007_M', 'Drive Forever', 'rightArm', 1668, 0),
(247, 'mpimportexport_overlays', 'MP_MP_ImportExport_Tat_008_M', 'Scarlett', 'leftArm', 1990, 0),
(248, 'mpimportexport_overlays', 'MP_MP_ImportExport_Tat_009_M', 'Serpents of Destruction', 'Torso', 1650, 0),
(249, 'mpimportexport_overlays', 'MP_MP_ImportExport_Tat_010_M', 'Take the Wheel', 'Torso', 1423, 0),
(250, 'mpimportexport_overlays', 'MP_MP_ImportExport_Tat_011_M', 'Talk Shit Get Hit', 'Torso', 1598, 0),
(251, 'mplowrider2_overlays', 'MP_LR_Tat_000_M', 'SA Assault', 'Torso', 1900, 0),
(252, 'mplowrider2_overlays', 'MP_LR_Tat_003_M', 'Lady Vamp', 'rightArm', 595, 0),
(253, 'mplowrider2_overlays', 'MP_LR_Tat_006_M', 'Love Hustle', 'leftArm', 745, 0),
(254, 'mplowrider2_overlays', 'MP_LR_Tat_008_M', 'Love the Game', 'Torso', 1875, 0),
(255, 'mplowrider2_overlays', 'MP_LR_Tat_011_M', 'Lady Liberty', 'Torso', 800, 0),
(256, 'mplowrider2_overlays', 'MP_LR_Tat_012_M', 'Royal Kiss', 'Torso', 765, 0),
(257, 'mplowrider2_overlays', 'MP_LR_Tat_016_M', 'Two Face', 'Torso', 640, 0),
(258, 'mplowrider2_overlays', 'MP_LR_Tat_018_M', 'Skeleton Party', 'leftArm', 1100, 0),
(259, 'mplowrider2_overlays', 'MP_LR_Tat_019_M', 'Death Behind', 'Torso', 975, 0),
(260, 'mplowrider2_overlays', 'MP_LR_Tat_022_M', 'My Crazy Life', 'leftArm', 735, 0),
(261, 'mplowrider2_overlays', 'MP_LR_Tat_028_M', 'Loving Los Muertos', 'rightArm', 880, 0),
(262, 'mplowrider2_overlays', 'MP_LR_Tat_029_M', 'Death Us Do Part', 'leftLeg', 625, 0),
(263, 'mplowrider2_overlays', 'MP_LR_Tat_030_M', 'San Andreas Prayer', 'rightLeg', 815, 0),
(264, 'mplowrider2_overlays', 'MP_LR_Tat_031_M', 'Dead Pretty', 'Torso', 1650, 0),
(265, 'mplowrider2_overlays', 'MP_LR_Tat_032_M', 'Reign Over', 'Torso', 1850, 0),
(266, 'mplowrider2_overlays', 'MP_LR_Tat_035_M', 'Black Tears', 'rightArm', 825, 0),
(267, 'mplowrider_overlays', 'MP_LR_Tat_001_M', 'King Fight', 'Torso', 610, 0),
(268, 'mplowrider_overlays', 'MP_LR_Tat_002_M', 'Holy Mary', 'Torso', 1025, 0),
(269, 'mplowrider_overlays', 'MP_LR_Tat_004_M', 'Gun Mic', 'Torso', 350, 0),
(270, 'mplowrider_overlays', 'MP_LR_Tat_005_M', 'No Evil', 'leftArm', 590, 0),
(271, 'mplowrider_overlays', 'MP_LR_Tat_007_M', 'LS Serpent', 'leftLeg', 550, 0),
(272, 'mplowrider_overlays', 'MP_LR_Tat_009_M', 'Amazon', 'Torso', 950, 0),
(273, 'mplowrider_overlays', 'MP_LR_Tat_010_M', 'Bad Angel', 'Torso', 1650, 0),
(274, 'mplowrider_overlays', 'MP_LR_Tat_013_M', 'Love Gamble', 'Torso', 830, 0),
(275, 'mplowrider_overlays', 'MP_LR_Tat_014_M', 'Love is Blind', 'Torso', 1775, 0),
(276, 'mplowrider_overlays', 'MP_LR_Tat_015_M', 'Seductress', 'rightArm', 615, 0),
(277, 'mplowrider_overlays', 'MP_LR_Tat_017_M', 'Ink Me', 'rightLeg', 770, 0),
(278, 'mplowrider_overlays', 'MP_LR_Tat_020_M', 'Presidents', 'leftLeg', 685, 0),
(279, 'mplowrider_overlays', 'MP_LR_Tat_021_M', 'Sad Angel', 'Torso', 1500, 0),
(280, 'mplowrider_overlays', 'MP_LR_Tat_023_M', 'Dance of Hearts', 'rightLeg', 650, 0),
(281, 'mplowrider_overlays', 'MP_LR_Tat_026_M', 'Royal Takeover', 'Torso', 740, 0),
(282, 'mplowrider_overlays', 'MP_LR_Tat_027_M', 'Los Santos Life', 'leftArm', 780, 0),
(283, 'mplowrider_overlays', 'MP_LR_Tat_033_M', 'City Sorrow', 'leftArm', 1000, 0),
(284, 'mpluxe2_overlays', 'MP_LUXE_TAT_002_M', 'The Howler', 'Torso', 1100, 0),
(285, 'mpluxe2_overlays', 'MP_LUXE_TAT_005_M', 'Fatal Dagger', 'leftArm', 1025, 0),
(286, 'mpluxe2_overlays', 'MP_LUXE_TAT_010_M', 'Intrometric', 'rightArm', 1465, 0),
(287, 'mpluxe2_overlays', 'MP_LUXE_TAT_011_M', 'Cross of Roses', 'leftLeg', 1325, 0),
(288, 'mpluxe2_overlays', 'MP_LUXE_TAT_012_M', 'Geometric Galaxy', 'Torso', 2650, 0),
(289, 'mpluxe2_overlays', 'MP_LUXE_TAT_016_M', 'Egyptian Mural', 'leftArm', 1860, 0),
(290, 'mpluxe2_overlays', 'MP_LUXE_TAT_017_M', 'Heavenly Deity', 'rightArm', 2155, 0),
(291, 'mpluxe2_overlays', 'MP_LUXE_TAT_018_M', 'Divine Goddess', 'leftArm', 2340, 0),
(292, 'mpluxe2_overlays', 'MP_LUXE_TAT_022_M', 'Cloaked Angel', 'Torso', 2850, 0),
(293, 'mpluxe2_overlays', 'MP_LUXE_TAT_023_M', 'Starmetric', 'rightLeg', 1560, 0),
(294, 'mpluxe2_overlays', 'MP_LUXE_TAT_025_M', 'Reaper Sway', 'Torso', 1150, 0),
(295, 'mpluxe2_overlays', 'MP_LUXE_TAT_026_M', 'Floral Print', 'rightArm', 1470, 0),
(296, 'mpluxe2_overlays', 'MP_LUXE_TAT_027_M', 'Cobra Dawn', 'Torso', 1275, 0),
(297, 'mpluxe2_overlays', 'MP_LUXE_TAT_028_M', 'Python Skull', 'leftArm', 1130, 0),
(298, 'mpluxe2_overlays', 'MP_LUXE_TAT_029_M', 'Geometric Design', 'Torso', 3000, 0),
(299, 'mpluxe2_overlays', 'MP_LUXE_TAT_030_M', 'Geometric Design', 'rightArm', 5, 0),
(300, 'mpluxe2_overlays', 'MP_LUXE_TAT_031_M', 'Geometric Design', 'leftArm', 5, 0),
(301, 'mpluxe_overlays', 'MP_LUXE_TAT_000_M', 'Serpent of Death', 'leftLeg', 1190, 0),
(302, 'mpluxe_overlays', 'MP_LUXE_TAT_001_M', 'Elaborate Los Muertos', 'rightLeg', 1435, 0),
(303, 'mpluxe_overlays', 'MP_LUXE_TAT_003_M', 'Abstract Skull', 'Torso', 835, 0),
(304, 'mpluxe_overlays', 'MP_LUXE_TAT_004_M', 'Floral Raven', 'rightArm', 1220, 0),
(305, 'mpluxe_overlays', 'MP_LUXE_TAT_006_M', 'Adorned Wolf', 'Torso', 2500, 0),
(306, 'mpluxe_overlays', 'MP_LUXE_TAT_007_M', 'Eye of the Griffin', 'Torso', 1245, 0),
(307, 'mpluxe_overlays', 'MP_LUXE_TAT_008_M', 'Flying Eye', 'Torso', 1800, 0),
(308, 'mpluxe_overlays', 'MP_LUXE_TAT_009_M', 'Floral Symmetry', 'leftArm', 1915, 0),
(309, 'mpluxe_overlays', 'MP_LUXE_TAT_013_M', 'Mermaid Harpist', 'rightArm', 1690, 0),
(310, 'mpluxe_overlays', 'MP_LUXE_TAT_014_M', 'Ancient Queen', 'Torso', 1820, 0),
(311, 'mpluxe_overlays', 'MP_LUXE_TAT_015_M', 'Smoking Sisters', 'Torso', 1625, 0),
(312, 'mpluxe_overlays', 'MP_LUXE_TAT_019_M', 'Geisha Bloom', 'rightArm', 1685, 0),
(313, 'mpluxe_overlays', 'MP_LUXE_TAT_020_M', 'Archangel & Mary', 'leftArm', 2250, 0),
(314, 'mpluxe_overlays', 'MP_LUXE_TAT_021_M', 'Gabriel', 'leftArm', 1285, 0),
(315, 'mpluxe_overlays', 'MP_LUXE_TAT_024_M', 'Feather Mural', 'Torso', 2725, 0),
(316, 'mpsmuggler_overlays', 'MP_Smuggler_Tattoo_000_M', 'Bless The Dead', 'Torso', 1127, 0),
(317, 'mpsmuggler_overlays', 'MP_Smuggler_Tattoo_001_M', 'Crackshot', 'rightArm', 1082, 0),
(318, 'mpsmuggler_overlays', 'MP_Smuggler_Tattoo_002_M', 'Dead Lies', 'Torso', 1243, 0),
(319, 'mpsmuggler_overlays', 'MP_Smuggler_Tattoo_003_M', 'Give Nothing Back', 'Torso', 1309, 0),
(320, 'mpsmuggler_overlays', 'MP_Smuggler_Tattoo_004_M', 'Honor', 'leftArm', 815, 0),
(321, 'mpsmuggler_overlays', 'MP_Smuggler_Tattoo_005_M', 'Mutiny', 'rightArm', 792, 0),
(322, 'mpsmuggler_overlays', 'MP_Smuggler_Tattoo_006_M', 'Never Surrender', 'Torso', 947, 0),
(323, 'mpsmuggler_overlays', 'MP_Smuggler_Tattoo_007_M', 'No Honor', 'Torso', 852, 0),
(324, 'mpsmuggler_overlays', 'MP_Smuggler_Tattoo_008_M', 'Horrors Of The Deep', 'leftArm', 1104, 0),
(325, 'mpsmuggler_overlays', 'MP_Smuggler_Tattoo_009_M', 'Tall Ship Conflict', 'Torso', 1662, 0),
(326, 'mpsmuggler_overlays', 'MP_Smuggler_Tattoo_010_M', 'See You In Hell', 'Torso', 1281, 0),
(327, 'mpsmuggler_overlays', 'MP_Smuggler_Tattoo_011_M', 'Sinner', 'Head', 811, 0),
(328, 'mpsmuggler_overlays', 'MP_Smuggler_Tattoo_012_M', 'Thief', 'Head', 1072, 0),
(329, 'mpsmuggler_overlays', 'MP_Smuggler_Tattoo_013_M', 'Torn Wings', 'Torso', 1054, 0),
(330, 'mpsmuggler_overlays', 'MP_Smuggler_Tattoo_014_M', 'Mermaid\'s Curse', 'leftArm', 882, 0),
(331, 'mpsmuggler_overlays', 'MP_Smuggler_Tattoo_015_M', 'Jolly Roger', 'Torso', 976, 0),
(332, 'mpsmuggler_overlays', 'MP_Smuggler_Tattoo_016_M', 'Skull Compass', 'Torso', 1379, 0),
(333, 'mpsmuggler_overlays', 'MP_Smuggler_Tattoo_017_M', 'Framed Tall Ship', 'Torso', 1885, 0),
(334, 'mpsmuggler_overlays', 'MP_Smuggler_Tattoo_018_M', 'Finders Keepers', 'Torso', 1699, 0),
(335, 'mpsmuggler_overlays', 'MP_Smuggler_Tattoo_019_M', 'Lost At Sea', 'Torso', 1110, 0),
(336, 'mpsmuggler_overlays', 'MP_Smuggler_Tattoo_020_M', 'Homeward Bound', 'rightLeg', 915, 0),
(337, 'mpsmuggler_overlays', 'MP_Smuggler_Tattoo_021_M', 'Dead Tales', 'Torso', 1486, 0),
(338, 'mpsmuggler_overlays', 'MP_Smuggler_Tattoo_022_M', 'X Marks The Spot', 'Torso', 1671, 0),
(339, 'mpsmuggler_overlays', 'MP_Smuggler_Tattoo_023_M', 'Stylized Kraken', 'rightArm', 1440, 0),
(340, 'mpsmuggler_overlays', 'MP_Smuggler_Tattoo_024_M', 'Pirate Captain', 'Torso', 1821, 0),
(341, 'mpsmuggler_overlays', 'MP_Smuggler_Tattoo_025_M', 'Claimed By The Beast', 'Torso', 1745, 0),
(342, 'mpstunt_overlays', 'MP_MP_Stunt_Tat_000_M', 'Stunt Skull', 'Head', 485, 0),
(343, 'mpstunt_overlays', 'MP_MP_Stunt_tat_001_M', '8 Eyed Skull', 'leftArm', 1160, 0),
(344, 'mpstunt_overlays', 'MP_MP_Stunt_tat_002_M', 'Big Cat', 'leftArm', 885, 0),
(345, 'mpstunt_overlays', 'MP_MP_Stunt_tat_003_M', 'Poison Wrench', 'rightArm', 430, 0),
(346, 'mpstunt_overlays', 'MP_MP_Stunt_tat_004_M', 'Scorpion', 'Head', 635, 0),
(347, 'mpstunt_overlays', 'MP_MP_Stunt_tat_005_M', 'Demon Spark Plug', 'rightLeg', 885, 0),
(348, 'mpstunt_overlays', 'MP_MP_Stunt_tat_006_M', 'Toxic Spider', 'Head', 590, 0),
(349, 'mpstunt_overlays', 'MP_MP_Stunt_tat_007_M', 'Dagger Devil', 'leftLeg', 815, 0),
(350, 'mpstunt_overlays', 'MP_MP_Stunt_tat_008_M', 'Moonlight Ride', 'leftArm', 1475, 0),
(351, 'mpstunt_overlays', 'MP_MP_Stunt_tat_009_M', 'Arachnid of Death', 'rightArm', 1080, 0),
(352, 'mpstunt_overlays', 'MP_MP_Stunt_tat_010_M', 'Grave Vulture', 'rightArm', 1100, 0),
(353, 'mpstunt_overlays', 'MP_MP_Stunt_tat_011_M', 'Wheels of Death', 'Torso', 1075, 0),
(354, 'mpstunt_overlays', 'MP_MP_Stunt_tat_012_M', 'Punk Biker', 'Torso', 1195, 0),
(355, 'mpstunt_overlays', 'MP_MP_Stunt_tat_013_M', 'Dirt Track Hero', 'leftLeg', 1550, 0),
(356, 'mpstunt_overlays', 'MP_MP_Stunt_tat_014_M', 'Bat Cat of Spades', 'Torso', 830, 0),
(357, 'mpstunt_overlays', 'MP_MP_Stunt_tat_015_M', 'Praying Gloves', 'rightLeg', 1340, 0),
(358, 'mpstunt_overlays', 'MP_MP_Stunt_tat_016_M', 'Coffin Racer', 'rightArm', 1295, 0),
(359, 'mpstunt_overlays', 'MP_MP_Stunt_tat_017_M', 'Bat Wheel', 'Head', 380, 0),
(360, 'mpstunt_overlays', 'MP_MP_Stunt_tat_018_M', 'Vintage Bully', 'Torso', 540, 0),
(361, 'mpstunt_overlays', 'MP_MP_Stunt_tat_019_M', 'Engine Heart', 'Torso', 890, 0),
(362, 'mpstunt_overlays', 'MP_MP_Stunt_tat_020_M', 'Piston Angel', 'rightLeg', 695, 0),
(363, 'mpstunt_overlays', 'MP_MP_Stunt_tat_021_M', 'Golden Cobra', 'leftLeg', 2120, 0),
(364, 'mpstunt_overlays', 'MP_MP_Stunt_tat_022_M', 'Piston Head', 'leftArm', 1685, 0),
(365, 'mpstunt_overlays', 'MP_MP_Stunt_tat_023_M', 'Tanked', 'leftArm', 1850, 0),
(366, 'mpstunt_overlays', 'MP_MP_Stunt_tat_024_M', 'Road Kill', 'Torso', 865, 0),
(367, 'mpstunt_overlays', 'MP_MP_Stunt_tat_025_M', 'Speed Freak', 'rightLeg', 720, 0),
(368, 'mpstunt_overlays', 'MP_MP_Stunt_tat_026_M', 'Winged Wheel', 'Torso', 1230, 0),
(369, 'mpstunt_overlays', 'MP_MP_Stunt_tat_027_M', 'Punk Road Hog', 'Torso', 895, 0),
(370, 'mpstunt_overlays', 'MP_MP_Stunt_tat_028_M', 'Quad Goblin', 'leftLeg', 985, 0),
(371, 'mpstunt_overlays', 'MP_MP_Stunt_tat_029_M', 'Majestic Finish', 'Torso', 1735, 0),
(372, 'mpstunt_overlays', 'MP_MP_Stunt_tat_030_M', 'Man\'s Ruin', 'Torso', 815, 0),
(373, 'mpstunt_overlays', 'MP_MP_Stunt_tat_031_M', 'Stunt Jesus', 'leftLeg', 1100, 0),
(374, 'mpstunt_overlays', 'MP_MP_Stunt_tat_032_M', 'Wheelie Mouse', 'rightLeg', 1035, 0),
(375, 'mpstunt_overlays', 'MP_MP_Stunt_tat_033_M', 'Sugar Skull Trucker', 'Torso', 1040, 0),
(376, 'mpstunt_overlays', 'MP_MP_Stunt_tat_034_M', 'Feather Road Kill', 'Torso', 990, 0),
(377, 'mpstunt_overlays', 'MP_MP_Stunt_tat_035_M', 'Stuntman\'s End', 'leftArm', 1270, 0),
(378, 'mpstunt_overlays', 'MP_MP_Stunt_tat_036_M', 'Biker Stallion', 'rightArm', 235, 0),
(379, 'mpstunt_overlays', 'MP_MP_Stunt_tat_037_M', 'Big Grills', 'Torso', 685, 0),
(380, 'mpstunt_overlays', 'MP_MP_Stunt_tat_038_M', 'One Down Five Up', 'rightArm', 575, 0),
(381, 'mpstunt_overlays', 'MP_MP_Stunt_tat_039_M', 'Kaboom', 'leftArm', 935, 0),
(382, 'mpstunt_overlays', 'MP_MP_Stunt_tat_040_M', 'Monkey Chopper', 'Torso', 1595, 0),
(383, 'mpstunt_overlays', 'MP_MP_Stunt_tat_041_M', 'Brapp', 'Torso', 1010, 0),
(384, 'mpstunt_overlays', 'MP_MP_Stunt_tat_042_M', 'Flaming Quad', 'Head', 415, 0),
(385, 'mpstunt_overlays', 'MP_MP_Stunt_tat_043_M', 'Engine Arm', 'leftArm', 1030, 0),
(386, 'mpstunt_overlays', 'MP_MP_Stunt_tat_044_M', 'Ram Skull', 'Torso', 1390, 0),
(387, 'mpstunt_overlays', 'MP_MP_Stunt_tat_045_M', 'Severed Hand', 'rightLeg', 1965, 0),
(388, 'mpstunt_overlays', 'MP_MP_Stunt_tat_046_M', 'Full Throttle', 'Torso', 1275, 0),
(389, 'mpstunt_overlays', 'MP_MP_Stunt_tat_047_M', 'Brake Knife', 'rightLeg', 920, 0),
(390, 'mpstunt_overlays', 'MP_MP_Stunt_tat_048_M', 'Racing Doll', 'Torso', 1130, 0),
(391, 'mpstunt_overlays', 'MP_MP_Stunt_tat_049_M', 'Seductive Mechanic', 'rightArm', 2300, 0),
(392, 'multiplayer_overlays', 'FM_Tat_Award_M_000', 'NULL', 'Head', 2000, 0),
(393, 'multiplayer_overlays', 'FM_Tat_Award_M_001', 'NULL', 'leftArm', 140, 0),
(394, 'multiplayer_overlays', 'FM_Tat_Award_M_002', 'NULL', 'rightArm', 975, 0),
(395, 'multiplayer_overlays', 'FM_Tat_Award_M_003', 'NULL', 'Torso', 215, 0),
(396, 'multiplayer_overlays', 'FM_Tat_Award_M_004', 'NULL', 'Torso', 1000, 0),
(397, 'multiplayer_overlays', 'FM_Tat_Award_M_005', 'NULL', 'Torso', 1240, 0),
(398, 'multiplayer_overlays', 'FM_Tat_Award_M_006', 'NULL', 'rightLeg', 350, 0),
(399, 'multiplayer_overlays', 'FM_Tat_Award_M_007', 'NULL', 'leftArm', 495, 0),
(400, 'multiplayer_overlays', 'FM_Tat_Award_M_008', 'NULL', 'Torso', 135, 0),
(401, 'multiplayer_overlays', 'FM_Tat_Award_M_009', 'NULL', 'leftLeg', 145, 0),
(402, 'multiplayer_overlays', 'FM_Tat_Award_M_010', 'NULL', 'rightArm', 270, 0),
(403, 'multiplayer_overlays', 'FM_Tat_Award_M_011', 'NULL', 'Torso', 120, 0),
(404, 'multiplayer_overlays', 'FM_Tat_Award_M_012', 'NULL', 'Torso', 150, 0),
(405, 'multiplayer_overlays', 'FM_Tat_Award_M_013', 'NULL', 'Torso', 265, 0),
(406, 'multiplayer_overlays', 'FM_Tat_Award_M_014', 'NULL', 'Torso', 190, 0),
(407, 'multiplayer_overlays', 'FM_Tat_Award_M_015', 'NULL', 'leftArm', 495, 0),
(408, 'multiplayer_overlays', 'FM_Tat_Award_M_016', 'NULL', 'Torso', 240, 0),
(409, 'multiplayer_overlays', 'FM_Tat_Award_M_017', 'NULL', 'Torso', 510, 0),
(410, 'multiplayer_overlays', 'FM_Tat_Award_M_018', 'NULL', 'Torso', 740, 0),
(411, 'multiplayer_overlays', 'FM_Tat_Award_M_019', 'NULL', 'Torso', 1000, 0),
(412, 'multiplayer_overlays', 'FM_Tat_M_000', 'NULL', 'rightArm', 1000, 0),
(413, 'multiplayer_overlays', 'FM_Tat_M_001', 'NULL', 'rightArm', 1250, 0),
(414, 'multiplayer_overlays', 'FM_Tat_M_002', 'NULL', 'leftLeg', 375, 0),
(415, 'multiplayer_overlays', 'FM_Tat_M_003', 'NULL', 'rightArm', 1000, 0),
(416, 'multiplayer_overlays', 'FM_Tat_M_004', 'NULL', 'Torso', 1000, 0),
(417, 'multiplayer_overlays', 'FM_Tat_M_005', 'NULL', 'leftArm', 240, 0),
(418, 'multiplayer_overlays', 'FM_Tat_M_006', 'NULL', 'leftArm', 510, 0),
(419, 'multiplayer_overlays', 'FM_Tat_M_007', 'NULL', 'rightLeg', 375, 0),
(420, 'multiplayer_overlays', 'FM_Tat_M_008', 'NULL', 'leftLeg', 480, 0),
(421, 'multiplayer_overlays', 'FM_Tat_M_009', 'NULL', 'Torso', 1235, 0),
(422, 'multiplayer_overlays', 'FM_Tat_M_010', 'NULL', 'Torso', 250, 0),
(423, 'multiplayer_overlays', 'FM_Tat_M_011', 'NULL', 'Torso', 190, 0),
(424, 'multiplayer_overlays', 'FM_Tat_M_012', 'NULL', 'Torso', 1000, 0),
(425, 'multiplayer_overlays', 'FM_Tat_M_013', 'NULL', 'Torso', 450, 0),
(426, 'multiplayer_overlays', 'FM_Tat_M_014', 'NULL', 'rightArm', 500, 0),
(427, 'multiplayer_overlays', 'FM_Tat_M_015', 'NULL', 'leftArm', 360, 0),
(428, 'multiplayer_overlays', 'FM_Tat_M_016', 'NULL', 'Torso', 1225, 0),
(429, 'multiplayer_overlays', 'FM_Tat_M_017', 'NULL', 'rightLeg', 350, 0),
(430, 'multiplayer_overlays', 'FM_Tat_M_018', 'NULL', 'rightArm', 750, 0),
(431, 'multiplayer_overlays', 'FM_Tat_M_019', 'NULL', 'Torso', 1230, 0),
(432, 'multiplayer_overlays', 'FM_Tat_M_020', 'NULL', 'Torso', 750, 0),
(433, 'multiplayer_overlays', 'FM_Tat_M_021', 'NULL', 'leftLeg', 500, 0),
(434, 'multiplayer_overlays', 'FM_Tat_M_022', 'NULL', 'rightLeg', 730, 0),
(435, 'multiplayer_overlays', 'FM_Tat_M_023', 'NULL', 'leftLeg', 725, 0),
(436, 'multiplayer_overlays', 'FM_Tat_M_024', 'NULL', 'Torso', 1190, 0),
(437, 'multiplayer_overlays', 'FM_Tat_M_025', 'NULL', 'Torso', 275, 0),
(438, 'multiplayer_overlays', 'FM_Tat_M_026', 'NULL', 'leftLeg', 175, 0),
(439, 'multiplayer_overlays', 'FM_Tat_M_027', 'NULL', 'rightArm', 730, 0),
(440, 'multiplayer_overlays', 'FM_Tat_M_028', 'NULL', 'rightArm', 325, 0),
(441, 'multiplayer_overlays', 'FM_Tat_M_029', 'NULL', 'Torso', 100, 0),
(442, 'multiplayer_overlays', 'FM_Tat_M_030', 'NULL', 'Torso', 500, 0),
(443, 'multiplayer_overlays', 'FM_Tat_M_031', 'NULL', 'leftArm', 750, 0),
(444, 'multiplayer_overlays', 'FM_Tat_M_032', 'NULL', 'leftLeg', 510, 0),
(445, 'multiplayer_overlays', 'FM_Tat_M_033', 'NULL', 'leftLeg', 505, 0),
(446, 'multiplayer_overlays', 'FM_Tat_M_034', 'NULL', 'Torso', 245, 0),
(447, 'multiplayer_overlays', 'FM_Tat_M_035', 'NULL', 'leftLeg', 495, 0),
(448, 'multiplayer_overlays', 'FM_Tat_M_036', 'NULL', 'Torso', 510, 0),
(449, 'multiplayer_overlays', 'FM_Tat_M_037', 'NULL', 'leftLeg', 1225, 0),
(450, 'multiplayer_overlays', 'FM_Tat_M_038', 'NULL', 'rightArm', 115, 0),
(451, 'multiplayer_overlays', 'FM_Tat_M_039', 'NULL', 'rightLeg', 750, 0),
(452, 'multiplayer_overlays', 'FM_Tat_M_040', 'NULL', 'rightLeg', 760, 0),
(453, 'multiplayer_overlays', 'FM_Tat_M_041', 'NULL', 'leftArm', 260, 0),
(454, 'multiplayer_overlays', 'FM_Tat_M_042', 'NULL', 'rightLeg', 250, 0),
(455, 'multiplayer_overlays', 'FM_Tat_M_043', 'NULL', 'rightLeg', 745, 0),
(456, 'multiplayer_overlays', 'FM_Tat_M_044', 'NULL', 'Torso', 750, 0),
(457, 'multiplayer_overlays', 'FM_Tat_M_045', 'NULL', 'Torso', 1000, 0),
(458, 'multiplayer_overlays', 'FM_Tat_M_047', 'NULL', 'rightArm', 250, 0),
(459, 'mpairraces_overlays', 'MP_Airraces_Tattoo_000_F', 'Turbulence', 'Torso', 1320, 1),
(460, 'mpairraces_overlays', 'MP_Airraces_Tattoo_001_F', 'Pilot Skull', 'Torso', 1810, 1),
(461, 'mpairraces_overlays', 'MP_Airraces_Tattoo_002_F', 'Winged Bombshell', 'Torso', 1648, 1),
(462, 'mpairraces_overlays', 'MP_Airraces_Tattoo_003_F', 'Toxic Trails', 'leftArm', 1198, 1),
(463, 'mpairraces_overlays', 'MP_Airraces_Tattoo_004_F', 'Balloon Pioneer', 'Torso', 1039, 1),
(464, 'mpairraces_overlays', 'MP_Airraces_Tattoo_005_F', 'Parachute Belle', 'Torso', 1527, 1),
(465, 'mpairraces_overlays', 'MP_Airraces_Tattoo_006_F', 'Bombs Away', 'Torso', 1252, 1),
(466, 'mpairraces_overlays', 'MP_Airraces_Tattoo_007_F', 'Eagle Eyes', 'Torso', 1392, 1),
(467, 'mpbeach_overlays', 'MP_Bea_F_Back_000', 'Rock Solid', 'Torso', 550, 1),
(468, 'mpbeach_overlays', 'MP_Bea_F_Back_001', 'Hibiscus Flower Duo', 'Torso', 690, 1),
(469, 'mpbeach_overlays', 'MP_Bea_F_Back_002', 'Shrimp', 'Torso', 250, 1),
(470, 'mpbeach_overlays', 'MP_Bea_F_Chest_000', 'Anchor', 'Torso', 250, 1),
(471, 'mpbeach_overlays', 'MP_Bea_F_Chest_001', 'Anchor', 'Torso', 250, 1),
(472, 'mpbeach_overlays', 'MP_Bea_F_Chest_002', 'Los Santos Wreath', 'Torso', 850, 1),
(473, 'mpbeach_overlays', 'MP_Bea_F_RSide_000', 'Love Dagger', 'Torso', 685, 1),
(474, 'mpbeach_overlays', 'MP_Bea_F_RLeg_000', 'School of Fish', 'rightLeg', 295, 1),
(475, 'mpbeach_overlays', 'MP_Bea_F_RArm_001', 'Tribal Fish', 'rightArm', 370, 1),
(476, 'mpbeach_overlays', 'MP_Bea_F_Neck_000', 'Tribal Butterfly', 'Head', 170, 1),
(477, 'mpbeach_overlays', 'MP_Bea_F_Should_000', 'Sea Horses', 'Torso', 510, 1),
(478, 'mpbeach_overlays', 'MP_Bea_F_Should_001', 'Catfish', 'Torso', 525, 1),
(479, 'mpbeach_overlays', 'MP_Bea_F_Stom_000', 'Swallow', 'Torso', 210, 1),
(480, 'mpbeach_overlays', 'MP_Bea_F_Stom_001', 'Hibiscus Flower', 'Torso', 265, 1),
(481, 'mpbeach_overlays', 'MP_Bea_F_Stom_002', 'Dolphin', 'Torso', 190, 1),
(482, 'mpbeach_overlays', 'MP_Bea_F_LArm_000', 'Tribal Flower', 'leftArm', 350, 1),
(483, 'mpbeach_overlays', 'MP_Bea_F_LArm_001', 'Parrot', 'leftArm', 525, 1),
(484, 'mpbiker_overlays', 'MP_MP_Biker_Tat_000_F', 'Demon Rider', 'Torso', 672, 1),
(485, 'mpbiker_overlays', 'MP_MP_Biker_Tat_001_F', 'Both Barrels', 'Torso', 1080, 1),
(486, 'mpbiker_overlays', 'MP_MP_Biker_Tat_002_F', 'Rose Tribute', 'leftLeg', 1682, 1),
(487, 'mpbiker_overlays', 'MP_MP_Biker_Tat_003_F', 'Web Rider', 'Torso', 1085, 1),
(488, 'mpbiker_overlays', 'MP_MP_Biker_Tat_004_F', 'Dragon\'s Fury', 'rightLeg', 1795, 1),
(489, 'mpbiker_overlays', 'MP_MP_Biker_Tat_005_F', 'Made In America', 'Torso', 923, 1),
(490, 'mpbiker_overlays', 'MP_MP_Biker_Tat_006_F', 'Chopper Freedom', 'Torso', 1040, 1),
(491, 'mpbiker_overlays', 'MP_MP_Biker_Tat_007_F', 'Swooping Eagle', 'rightArm', 510, 1),
(492, 'mpbiker_overlays', 'MP_MP_Biker_Tat_008_F', 'Freedom Wheels', 'Torso', 878, 1),
(493, 'mpbiker_overlays', 'MP_MP_Biker_Tat_009_F', 'Morbid Arachnid', 'Head', 635, 1),
(494, 'mpbiker_overlays', 'MP_MP_Biker_Tat_010_F', 'Skull Of Taurus', 'Torso', 1135, 1),
(495, 'mpbiker_overlays', 'MP_MP_Biker_Tat_011_F', 'R.I.P. My Brothers', 'Torso', 1235, 1),
(496, 'mpbiker_overlays', 'MP_MP_Biker_Tat_012_F', 'Urban Stunter', 'leftArm', 498, 1),
(497, 'mpbiker_overlays', 'MP_MP_Biker_Tat_013_F', 'Demon Crossbones', 'Torso', 1114, 1),
(498, 'mpbiker_overlays', 'MP_MP_Biker_Tat_014_F', 'Lady Mortality', 'rightArm', 830, 1),
(499, 'mpbiker_overlays', 'MP_MP_Biker_Tat_015_F', 'Ride or Die', 'leftLeg', 897, 1),
(500, 'mpbiker_overlays', 'MP_MP_Biker_Tat_016_F', 'Macabre Tree', 'leftArm', 900, 1),
(501, 'mpbiker_overlays', 'MP_MP_Biker_Tat_017_F', 'Clawed Beast', 'Torso', 1565, 1),
(502, 'mpbiker_overlays', 'MP_MP_Biker_Tat_018_F', 'Skeletal Chopper', 'Torso', 765, 1),
(503, 'mpbiker_overlays', 'MP_MP_Biker_Tat_019_F', 'Gruesome Talons', 'Torso', 990, 1),
(504, 'mpbiker_overlays', 'MP_MP_Biker_Tat_020_F', 'Cranial Rose', 'leftArm', 974, 1),
(505, 'mpbiker_overlays', 'MP_MP_Biker_Tat_021_F', 'Flaming Reaper', 'Torso', 1370, 1),
(506, 'mpbiker_overlays', 'MP_MP_Biker_Tat_022_F', 'Western Insignia', 'rightLeg', 938, 1),
(507, 'mpbiker_overlays', 'MP_MP_Biker_Tat_023_F', 'Western MC', 'Torso', 1000, 1),
(508, 'mpbiker_overlays', 'MP_MP_Biker_Tat_024_F', 'Live to Ride', 'leftArm', 1532, 1),
(509, 'mpbiker_overlays', 'MP_MP_Biker_Tat_025_F', 'Good Luck', 'leftArm', 1295, 1),
(510, 'mpbiker_overlays', 'MP_MP_Biker_Tat_026_F', 'American Dream', 'Torso', 1100, 1),
(511, 'mpbiker_overlays', 'MP_MP_Biker_Tat_027_F', 'Bad Luck', 'leftLeg', 696, 1),
(512, 'mpbiker_overlays', 'MP_MP_Biker_Tat_028_F', 'Dusk Rider', 'rightLeg', 1452, 1),
(513, 'mpbiker_overlays', 'MP_MP_Biker_Tat_029_F', 'Bone Wrench', 'Torso', 963, 1),
(514, 'mpbiker_overlays', 'MP_MP_Biker_Tat_030_F', 'Brothers For Life', 'Torso', 981, 1),
(515, 'mpbiker_overlays', 'MP_MP_Biker_Tat_031_F', 'Gear Head', 'Torso', 860, 1),
(516, 'mpbiker_overlays', 'MP_MP_Biker_Tat_032_F', 'Western Eagle', 'Torso', 765, 1),
(517, 'mpbiker_overlays', 'MP_MP_Biker_Tat_033_F', 'Eagle Emblem', 'rightArm', 438, 1),
(518, 'mpbiker_overlays', 'MP_MP_Biker_Tat_034_F', 'Brotherhood of Bikes', 'Torso', 997, 1),
(519, 'mpbiker_overlays', 'MP_MP_Biker_Tat_035_F', 'Chain Fist', 'leftArm', 578, 1),
(520, 'mpbiker_overlays', 'MP_MP_Biker_Tat_036_F', 'Engulfed Skull', 'leftLeg', 930, 1),
(521, 'mpbiker_overlays', 'MP_MP_Biker_Tat_037_F', 'Scorched Soul', 'leftLeg', 1249, 1),
(522, 'mpbiker_overlays', 'MP_MP_Biker_Tat_038_F', 'FTW', 'Head', 390, 1),
(523, 'mpbiker_overlays', 'MP_MP_Biker_Tat_039_F', 'Gas Guzzler', 'Torso', 1095, 1),
(524, 'mpbiker_overlays', 'MP_MP_Biker_Tat_040_F', 'American Made', 'rightLeg', 1362, 1),
(525, 'mpbiker_overlays', 'MP_MP_Biker_Tat_041_F', 'No Regrets', 'Torso', 832, 1),
(526, 'mpbiker_overlays', 'MP_MP_Biker_Tat_042_F', 'Grim Rider', 'rightArm', 786, 1),
(527, 'mpbiker_overlays', 'MP_MP_Biker_Tat_043_F', 'Ride Forever', 'Torso', 685, 1),
(528, 'mpbiker_overlays', 'MP_MP_Biker_Tat_044_F', 'Ride Free', 'leftLeg', 1190, 1),
(529, 'mpbiker_overlays', 'MP_MP_Biker_Tat_045_F', 'Ride Hard Die Fast', 'leftArm', 632, 1),
(530, 'mpbiker_overlays', 'MP_MP_Biker_Tat_046_F', 'Skull Chain', 'rightArm', 498, 1),
(531, 'mpbiker_overlays', 'MP_MP_Biker_Tat_047_F', 'Snake Bike', 'rightArm', 1350, 1),
(532, 'mpbiker_overlays', 'MP_MP_Biker_Tat_048_F', 'STFU', 'rightLeg', 893, 1),
(533, 'mpbiker_overlays', 'MP_MP_Biker_Tat_049_F', 'These Colors Don\'t Run', 'rightArm', 879, 1),
(534, 'mpbiker_overlays', 'MP_MP_Biker_Tat_050_F', 'Unforgiven', 'Torso', 872, 1),
(535, 'mpbiker_overlays', 'MP_MP_Biker_Tat_051_F', 'Western Stylized', 'Head', 412, 1),
(536, 'mpbiker_overlays', 'MP_MP_Biker_Tat_052_F', 'Biker Mount', 'Torso', 913, 1),
(537, 'mpbiker_overlays', 'MP_MP_Biker_Tat_053_F', 'Muffler Helmet', 'leftArm', 840, 1),
(538, 'mpbiker_overlays', 'MP_MP_Biker_Tat_054_F', 'Mum', 'rightArm', 1045, 1),
(539, 'mpbiker_overlays', 'MP_MP_Biker_Tat_055_F', 'Poison Scorpion', 'leftArm', 1099, 1),
(540, 'mpbiker_overlays', 'MP_MP_Biker_Tat_056_F', 'Bone Cruiser', 'leftLeg', 1496, 1),
(541, 'mpbiker_overlays', 'MP_MP_Biker_Tat_057_F', 'Laughing Skull', 'leftLeg', 1386, 1),
(542, 'mpbiker_overlays', 'MP_MP_Biker_Tat_058_F', 'Reaper Vulture', 'Torso', 798, 1),
(543, 'mpbiker_overlays', 'MP_MP_Biker_Tat_059_F', 'Faggio', 'Torso', 639, 1),
(544, 'mpbiker_overlays', 'MP_MP_Biker_Tat_060_F', 'We Are The Mods!', 'Torso', 710, 1),
(545, 'mpbusiness_overlays', 'MP_Buis_F_Chest_000', 'High Roller', 'Torso', 700, 1),
(546, 'mpbusiness_overlays', 'MP_Buis_F_Chest_001', 'Makin\' Money', 'Torso', 720, 1),
(547, 'mpbusiness_overlays', 'MP_Buis_F_Chest_002', 'Love Money', 'Torso', 160, 1),
(548, 'mpbusiness_overlays', 'MP_Buis_F_Stom_000', 'Diamond Back', 'Torso', 680, 1),
(549, 'mpbusiness_overlays', 'MP_Buis_F_Stom_001', 'Santo Capra Logo', 'Torso', 180, 1),
(550, 'mpbusiness_overlays', 'MP_Buis_F_Stom_002', 'Money Bag', 'Torso', 150, 1),
(551, 'mpbusiness_overlays', 'MP_Buis_F_Back_000', 'Respect', 'Torso', 420, 1),
(552, 'mpbusiness_overlays', 'MP_Buis_F_Back_001', 'Gold Digger', 'Torso', 400, 1),
(553, 'mpbusiness_overlays', 'MP_Buis_F_Neck_000', 'Val-de-Grace Logo', 'Head', 190, 1),
(554, 'mpbusiness_overlays', 'MP_Buis_F_Neck_001', 'Money Rose', 'Head', 250, 1),
(555, 'mpbusiness_overlays', 'MP_Buis_F_RArm_000', 'Dollar Sign', 'rightArm', 490, 1),
(556, 'mpbusiness_overlays', 'MP_Buis_F_LArm_000', 'Greed is Good', 'leftArm', 550, 1),
(557, 'mpbusiness_overlays', 'MP_Buis_F_LLeg_000', 'Single', 'leftLeg', 485, 1),
(558, 'mpbusiness_overlays', 'MP_Buis_F_RLeg_000', 'Diamond Crown', 'rightLeg', 450, 1),
(559, 'mpchristmas2017_overlays', 'MP_Christmas2017_Tattoo_000_F', 'Thor & Goblin', 'Torso', 1350, 1),
(560, 'mpchristmas2017_overlays', 'MP_Christmas2017_Tattoo_001_F', 'Viking Warrior', 'leftArm', 1726, 1),
(561, 'mpchristmas2017_overlays', 'MP_Christmas2017_Tattoo_002_F', 'Kabuto', 'Torso', 1836, 1),
(562, 'mpchristmas2017_overlays', 'MP_Christmas2017_Tattoo_003_F', 'Native Warrior', 'Torso', 1778, 1),
(563, 'mpchristmas2017_overlays', 'MP_Christmas2017_Tattoo_004_F', 'Tiger & Mask', 'leftArm', 2040, 1),
(564, 'mpchristmas2017_overlays', 'MP_Christmas2017_Tattoo_005_F', 'Ghost Dragon', 'Torso', 5266, 1),
(565, 'mpchristmas2017_overlays', 'MP_Christmas2017_Tattoo_006_F', 'Medusa', 'rightArm', 2203, 1),
(566, 'mpchristmas2017_overlays', 'MP_Christmas2017_Tattoo_007_F', 'Spartan Combat', 'leftArm', 1967, 1),
(567, 'mpchristmas2017_overlays', 'MP_Christmas2017_Tattoo_008_F', 'Spartan Warrior', 'Torso', 3680, 1),
(568, 'mpchristmas2017_overlays', 'MP_Christmas2017_Tattoo_009_F', 'Norse Rune', 'Torso', 2387, 1),
(569, 'mpchristmas2017_overlays', 'MP_Christmas2017_Tattoo_010_F', 'Spartan Shield', 'Torso', 4954, 1),
(570, 'mpchristmas2017_overlays', 'MP_Christmas2017_Tattoo_011_F', 'Weathered Skull', 'Torso', 5395, 1),
(571, 'mpchristmas2017_overlays', 'MP_Christmas2017_Tattoo_012_F', 'Tiger Headdress', 'rightArm', 2119, 1),
(572, 'mpchristmas2017_overlays', 'MP_Christmas2017_Tattoo_013_F', 'Katana', 'leftArm', 2293, 1),
(573, 'mpchristmas2017_overlays', 'MP_Christmas2017_Tattoo_014_F', 'Celtic Band', 'rightArm', 1186, 1),
(574, 'mpchristmas2017_overlays', 'MP_Christmas2017_Tattoo_015_F', 'Samurai Combat', 'Torso', 5046, 1),
(575, 'mpchristmas2017_overlays', 'MP_Christmas2017_Tattoo_016_F', 'Odin & Raven', 'Torso', 5150, 1),
(576, 'mpchristmas2017_overlays', 'MP_Christmas2017_Tattoo_017_F', 'Feather Sleeve', 'rightArm', 3208, 1),
(577, 'mpchristmas2017_overlays', 'MP_Christmas2017_Tattoo_018_F', 'Muscle Tear', 'rightArm', 3441, 1),
(578, 'mpchristmas2017_overlays', 'MP_Christmas2017_Tattoo_019_F', 'Strike Force', 'Torso', 1678, 1),
(579, 'mpchristmas2017_overlays', 'MP_Christmas2017_Tattoo_020_F', 'Medusa\'s Gaze', 'Torso', 4689, 1),
(580, 'mpchristmas2017_overlays', 'MP_Christmas2017_Tattoo_021_F', 'Spartan & Lion', 'Torso', 2487, 1),
(581, 'mpchristmas2017_overlays', 'MP_Christmas2017_Tattoo_022_F', 'Spartan & Horse', 'Torso', 2997, 1),
(582, 'mpchristmas2017_overlays', 'MP_Christmas2017_Tattoo_023_F', 'Samurai Tallship', 'rightArm', 3924, 1),
(583, 'mpchristmas2017_overlays', 'MP_Christmas2017_Tattoo_024_F', 'Dragon Slayer', 'Torso', 4174, 1),
(584, 'mpchristmas2017_overlays', 'MP_Christmas2017_Tattoo_025_F', 'Winged Serpent', 'leftArm', 2756, 1),
(585, 'mpchristmas2017_overlays', 'MP_Christmas2017_Tattoo_026_F', 'Spartan Skull', 'Torso', 1898, 1);
INSERT INTO `server_tattoos` (`id`, `collection`, `nameHash`, `name`, `part`, `price`, `gender`) VALUES
(586, 'mpchristmas2017_overlays', 'MP_Christmas2017_Tattoo_027_F', 'Molon Labe', 'Torso', 4428, 1),
(587, 'mpchristmas2017_overlays', 'MP_Christmas2017_Tattoo_028_F', 'Spartan Mural', 'rightArm', 1515, 1),
(588, 'mpchristmas2017_overlays', 'MP_Christmas2017_Tattoo_029_F', 'Cerberus', 'leftArm', 2592, 1),
(589, 'mpchristmas2018_overlays', 'MP_Christmas2018_Tat_000_F', '???', 'Torso', 10, 1),
(590, 'mpchristmas2_overlays', 'MP_Xmas2_F_Tat_000', 'Skull Rider', 'leftArm', 595, 1),
(591, 'mpchristmas2_overlays', 'MP_Xmas2_F_Tat_001', 'Spider Outline', 'leftLeg', 465, 1),
(592, 'mpchristmas2_overlays', 'MP_Xmas2_F_Tat_002', 'Spider Color', 'leftLeg', 635, 1),
(593, 'mpchristmas2_overlays', 'MP_Xmas2_F_Tat_003', 'Snake Outline', 'rightArm', 845, 1),
(594, 'mpchristmas2_overlays', 'MP_Xmas2_F_Tat_004', 'Snake Shaded', 'rightArm', 1325, 1),
(595, 'mpchristmas2_overlays', 'MP_Xmas2_F_Tat_005', 'Carp Outline', 'Torso', 875, 1),
(596, 'mpchristmas2_overlays', 'MP_Xmas2_F_Tat_006', 'Carp Shaded', 'Torso', 1450, 1),
(597, 'mpchristmas2_overlays', 'MP_Xmas2_F_Tat_007', 'Los Muertos', 'Head', 395, 1),
(598, 'mpchristmas2_overlays', 'MP_Xmas2_F_Tat_008', 'Death Before Dishonor', 'rightArm', 430, 1),
(599, 'mpchristmas2_overlays', 'MP_Xmas2_F_Tat_009', 'Time To Die', 'Torso', 780, 1),
(600, 'mpchristmas2_overlays', 'MP_Xmas2_F_Tat_010', 'Electric Snake', 'leftArm', 620, 1),
(601, 'mpchristmas2_overlays', 'MP_Xmas2_F_Tat_011', 'Roaring Tiger', 'Torso', 685, 1),
(602, 'mpchristmas2_overlays', 'MP_Xmas2_F_Tat_012', '8 Ball Skull', 'leftArm', 825, 1),
(603, 'mpchristmas2_overlays', 'MP_Xmas2_F_Tat_013', 'Lizard', 'Torso', 790, 1),
(604, 'mpchristmas2_overlays', 'MP_Xmas2_F_Tat_014', 'Floral Dagger', 'rightLeg', 1050, 1),
(605, 'mpchristmas2_overlays', 'MP_Xmas2_F_Tat_015', 'Japanese Warrior', 'Torso', 1100, 1),
(606, 'mpchristmas2_overlays', 'MP_Xmas2_F_Tat_016', 'Loose Lips Outline', 'Torso', 315, 1),
(607, 'mpchristmas2_overlays', 'MP_Xmas2_F_Tat_017', 'Loose Lips Color', 'Torso', 635, 1),
(608, 'mpchristmas2_overlays', 'MP_Xmas2_F_Tat_018', 'Royal Dagger Outline', 'Torso', 430, 1),
(609, 'mpchristmas2_overlays', 'MP_Xmas2_F_Tat_019', 'Royal Dagger Color', 'Torso', 750, 1),
(610, 'mpchristmas2_overlays', 'MP_Xmas2_F_Tat_020', 'Time\'s Up Outline', 'leftArm', 250, 1),
(611, 'mpchristmas2_overlays', 'MP_Xmas2_F_Tat_021', 'Time\'s Up Color', 'leftArm', 375, 1),
(612, 'mpchristmas2_overlays', 'MP_Xmas2_F_Tat_022', 'You\'re Next Outline', 'rightArm', 380, 1),
(613, 'mpchristmas2_overlays', 'MP_Xmas2_F_Tat_023', 'You\'re Next Color', 'rightArm', 510, 1),
(614, 'mpchristmas2_overlays', 'MP_Xmas2_F_Tat_024', 'Snake Head Outline', 'Head', 210, 1),
(615, 'mpchristmas2_overlays', 'MP_Xmas2_F_Tat_025', 'Snake Head Color', 'Head', 460, 1),
(616, 'mpchristmas2_overlays', 'MP_Xmas2_F_Tat_026', 'Fuck Luck Outline', 'rightArm', 130, 1),
(617, 'mpchristmas2_overlays', 'MP_Xmas2_F_Tat_027', 'Fuck Luck Color', 'rightArm', 220, 1),
(618, 'mpchristmas2_overlays', 'MP_Xmas2_F_Tat_028', 'Executioner', 'Torso', 570, 1),
(619, 'mpchristmas2_overlays', 'MP_Xmas2_F_Tat_029', 'Beautiful Death', 'Head', 315, 1),
(620, 'mpgunrunning_overlays', 'MP_Gunrunning_Tattoo_000_F', 'Bullet Proof', 'Torso', 1698, 1),
(621, 'mpgunrunning_overlays', 'MP_Gunrunning_Tattoo_001_F', 'Crossed Weapons', 'Torso', 1935, 1),
(622, 'mpgunrunning_overlays', 'MP_Gunrunning_Tattoo_002_F', 'Grenade', 'rightArm', 1465, 1),
(623, 'mpgunrunning_overlays', 'MP_Gunrunning_Tattoo_003_F', 'Lock & Load', 'Head', 875, 1),
(624, 'mpgunrunning_overlays', 'MP_Gunrunning_Tattoo_004_F', 'Sidearm', 'leftArm', 1128, 1),
(625, 'mpgunrunning_overlays', 'MP_Gunrunning_Tattoo_005_F', 'Patriot Skull', 'leftLeg', 912, 1),
(626, 'mpgunrunning_overlays', 'MP_Gunrunning_Tattoo_006_F', 'Combat Skull', 'rightLeg', 1067, 1),
(627, 'mpgunrunning_overlays', 'MP_Gunrunning_Tattoo_007_F', 'Stylized Tiger', 'leftLeg', 966, 1),
(628, 'mpgunrunning_overlays', 'MP_Gunrunning_Tattoo_008_F', 'Bandolier', 'leftArm', 1344, 1),
(629, 'mpgunrunning_overlays', 'MP_Gunrunning_Tattoo_009_F', 'Butterfly Knife', 'Torso', 1465, 1),
(630, 'mpgunrunning_overlays', 'MP_Gunrunning_Tattoo_010_F', 'Cash Money', 'Torso', 1905, 1),
(631, 'mpgunrunning_overlays', 'MP_Gunrunning_Tattoo_011_F', 'Death Skull', 'leftLeg', 978, 1),
(632, 'mpgunrunning_overlays', 'MP_Gunrunning_Tattoo_012_F', 'Dollar Daggers', 'Torso', 1506, 1),
(633, 'mpgunrunning_overlays', 'MP_Gunrunning_Tattoo_013_F', 'Wolf Insignia', 'Torso', 1611, 1),
(634, 'mpgunrunning_overlays', 'MP_Gunrunning_Tattoo_014_F', 'Backstabber', 'Torso', 1720, 1),
(635, 'mpgunrunning_overlays', 'MP_Gunrunning_Tattoo_015_F', 'Spiked Skull', 'leftArm', 1042, 1),
(636, 'mpgunrunning_overlays', 'MP_Gunrunning_Tattoo_016_F', 'Blood Money', 'leftArm', 1036, 1),
(637, 'mpgunrunning_overlays', 'MP_Gunrunning_Tattoo_017_F', 'Dog Tags', 'Torso', 898, 1),
(638, 'mpgunrunning_overlays', 'MP_Gunrunning_Tattoo_018_F', 'Dual Wield Skull', 'Torso', 1775, 1),
(639, 'mpgunrunning_overlays', 'MP_Gunrunning_Tattoo_019_F', 'Pistol Wings', 'Torso', 1802, 1),
(640, 'mpgunrunning_overlays', 'MP_Gunrunning_Tattoo_020_F', 'Crowned Weapons', 'Torso', 1987, 1),
(641, 'mpgunrunning_overlays', 'MP_Gunrunning_Tattoo_021_F', 'Have a Nice Day', 'rightArm', 946, 1),
(642, 'mpgunrunning_overlays', 'MP_Gunrunning_Tattoo_022_F', 'Explosive Heart', 'Torso', 1082, 1),
(643, 'mpgunrunning_overlays', 'MP_Gunrunning_Tattoo_023_F', 'Rose Revolver', 'leftLeg', 888, 1),
(644, 'mpgunrunning_overlays', 'MP_Gunrunning_Tattoo_024_F', 'Combat Reaper', 'rightArm', 1034, 1),
(645, 'mpgunrunning_overlays', 'MP_Gunrunning_Tattoo_025_F', 'Praying Skull', 'leftArm', 1215, 1),
(646, 'mpgunrunning_overlays', 'MP_Gunrunning_Tattoo_026_F', 'Restless Skull', 'rightLeg', 1151, 1),
(647, 'mpgunrunning_overlays', 'MP_Gunrunning_Tattoo_027_F', 'Serpent Revolver', 'leftArm', 842, 1),
(648, 'mpgunrunning_overlays', 'MP_Gunrunning_Tattoo_028_F', 'Micro SMG Chain', 'Torso', 996, 1),
(649, 'mpgunrunning_overlays', 'MP_Gunrunning_Tattoo_029_F', 'Win Some Lose Some', 'Torso', 1409, 1),
(650, 'mpgunrunning_overlays', 'MP_Gunrunning_Tattoo_030_F', 'Pistol Ace', 'rightLeg', 1105, 1),
(651, 'mphipster_overlays', 'FM_Hip_F_Tat_000', 'Crossed Arrows', 'Torso', 675, 1),
(652, 'mphipster_overlays', 'FM_Hip_F_Tat_001', 'Single Arrow', 'rightArm', 200, 1),
(653, 'mphipster_overlays', 'FM_Hip_F_Tat_002', 'Chemistry', 'Torso', 290, 1),
(654, 'mphipster_overlays', 'FM_Hip_F_Tat_003', 'Diamond Sparkle', 'leftArm', 210, 1),
(655, 'mphipster_overlays', 'FM_Hip_F_Tat_004', 'Bone', 'rightArm', 290, 1),
(656, 'mphipster_overlays', 'FM_Hip_F_Tat_005', 'Beautiful Eye', 'Head', 745, 1),
(657, 'mphipster_overlays', 'FM_Hip_F_Tat_006', 'Feather Birds', 'Torso', 455, 1),
(658, 'mphipster_overlays', 'FM_Hip_F_Tat_007', 'Bricks', 'leftArm', 600, 1),
(659, 'mphipster_overlays', 'FM_Hip_F_Tat_008', 'Cube', 'rightArm', 485, 1),
(660, 'mphipster_overlays', 'FM_Hip_F_Tat_009', 'Squares', 'leftLeg', 400, 1),
(661, 'mphipster_overlays', 'FM_Hip_F_Tat_010', 'Horseshoe', 'rightArm', 315, 1),
(662, 'mphipster_overlays', 'FM_Hip_F_Tat_011', 'Infinity', 'Torso', 300, 1),
(663, 'mphipster_overlays', 'FM_Hip_F_Tat_012', 'Antlers', 'Torso', 650, 1),
(664, 'mphipster_overlays', 'FM_Hip_F_Tat_013', 'Boombox', 'Torso', 695, 1),
(665, 'mphipster_overlays', 'FM_Hip_F_Tat_014', 'Spray Can', 'rightArm', 430, 1),
(666, 'mphipster_overlays', 'FM_Hip_F_Tat_015', 'Mustache', 'leftArm', 340, 1),
(667, 'mphipster_overlays', 'FM_Hip_F_Tat_016', 'Lightning Bolt', 'leftArm', 370, 1),
(668, 'mphipster_overlays', 'FM_Hip_F_Tat_017', 'Eye Triangle', 'rightArm', 265, 1),
(669, 'mphipster_overlays', 'FM_Hip_F_Tat_018', 'Origami', 'rightArm', 180, 1),
(670, 'mphipster_overlays', 'FM_Hip_F_Tat_019', 'Charm', 'leftLeg', 340, 1),
(671, 'mphipster_overlays', 'FM_Hip_F_Tat_020', 'Geo Pattern', 'rightArm', 735, 1),
(672, 'mphipster_overlays', 'FM_Hip_F_Tat_021', 'Geo Fox', 'Head', 785, 1),
(673, 'mphipster_overlays', 'FM_Hip_F_Tat_022', 'Pencil', 'rightArm', 225, 1),
(674, 'mphipster_overlays', 'FM_Hip_F_Tat_023', 'Smiley', 'rightArm', 700, 1),
(675, 'mphipster_overlays', 'FM_Hip_F_Tat_024', 'Pyramid', 'Torso', 295, 1),
(676, 'mphipster_overlays', 'FM_Hip_F_Tat_025', 'Watch Your Step', 'Torso', 350, 1),
(677, 'mphipster_overlays', 'FM_Hip_F_Tat_026', 'Pizza', 'leftArm', 240, 1),
(678, 'mphipster_overlays', 'FM_Hip_F_Tat_027', 'Padlock', 'leftArm', 575, 1),
(679, 'mphipster_overlays', 'FM_Hip_F_Tat_028', 'Thorny Rose', 'leftArm', 480, 1),
(680, 'mphipster_overlays', 'FM_Hip_F_Tat_029', 'Sad', 'Torso', 185, 1),
(681, 'mphipster_overlays', 'FM_Hip_F_Tat_030', 'Shark Fin', 'Torso', 225, 1),
(682, 'mphipster_overlays', 'FM_Hip_F_Tat_031', 'Skateboard', 'Torso', 495, 1),
(683, 'mphipster_overlays', 'FM_Hip_F_Tat_032', 'Paper Plane', 'Torso', 435, 1),
(684, 'mphipster_overlays', 'FM_Hip_F_Tat_033', 'Stag', 'Torso', 695, 1),
(685, 'mphipster_overlays', 'FM_Hip_F_Tat_034', 'Stop', 'leftArm', 950, 1),
(686, 'mphipster_overlays', 'FM_Hip_F_Tat_035', 'Sewn Heart', 'Torso', 750, 1),
(687, 'mphipster_overlays', 'FM_Hip_F_Tat_036', 'Shapes', 'rightArm', 515, 1),
(688, 'mphipster_overlays', 'FM_Hip_F_Tat_037', 'Sunrise', 'leftArm', 375, 1),
(689, 'mphipster_overlays', 'FM_Hip_F_Tat_038', 'Grub', 'rightLeg', 350, 1),
(690, 'mphipster_overlays', 'FM_Hip_F_Tat_039', 'Sleeve', 'leftArm', 1000, 1),
(691, 'mphipster_overlays', 'FM_Hip_F_Tat_040', 'Black Anchor', 'leftLeg', 295, 1),
(692, 'mphipster_overlays', 'FM_Hip_F_Tat_041', 'Tooth', 'Torso', 257, 1),
(693, 'mphipster_overlays', 'FM_Hip_F_Tat_042', 'Sparkplug', 'rightLeg', 430, 1),
(694, 'mphipster_overlays', 'FM_Hip_F_Tat_043', 'Triangle White', 'leftArm', 550, 1),
(695, 'mphipster_overlays', 'FM_Hip_F_Tat_044', 'Triangle Black', 'rightArm', 550, 1),
(696, 'mphipster_overlays', 'FM_Hip_F_Tat_045', 'Mesh Band', 'rightArm', 400, 1),
(697, 'mphipster_overlays', 'FM_Hip_F_Tat_046', 'Triangles', 'Torso', 375, 1),
(698, 'mphipster_overlays', 'FM_Hip_F_Tat_047', 'Cassette', 'Torso', 190, 1),
(699, 'mphipster_overlays', 'FM_Hip_F_Tat_048', 'Peace', 'leftArm', 785, 1),
(700, 'mpimportexport_overlays', 'MP_MP_ImportExport_Tat_000_F', 'Block Back', 'Torso', 1378, 1),
(701, 'mpimportexport_overlays', 'MP_MP_ImportExport_Tat_001_F', 'Power Plant', 'Torso', 1290, 1),
(702, 'mpimportexport_overlays', 'MP_MP_ImportExport_Tat_002_F', 'Tuned to Death', 'Torso', 1212, 1),
(703, 'mpimportexport_overlays', 'MP_MP_ImportExport_Tat_003_F', 'Mechanical Sleeve', 'rightArm', 1720, 1),
(704, 'mpimportexport_overlays', 'MP_MP_ImportExport_Tat_004_F', 'Piston Sleeve', 'leftArm', 1635, 1),
(705, 'mpimportexport_overlays', 'MP_MP_ImportExport_Tat_005_F', 'Dialed In', 'rightArm', 1861, 1),
(706, 'mpimportexport_overlays', 'MP_MP_ImportExport_Tat_006_F', 'Engulfed Block', 'rightArm', 1572, 1),
(707, 'mpimportexport_overlays', 'MP_MP_ImportExport_Tat_007_F', 'Drive Forever', 'rightArm', 1668, 1),
(708, 'mpimportexport_overlays', 'MP_MP_ImportExport_Tat_008_F', 'Scarlett', 'leftArm', 1990, 1),
(709, 'mpimportexport_overlays', 'MP_MP_ImportExport_Tat_009_F', 'Serpents of Destruction', 'Torso', 1650, 1),
(710, 'mpimportexport_overlays', 'MP_MP_ImportExport_Tat_010_F', 'Take the Wheel', 'Torso', 1423, 1),
(711, 'mpimportexport_overlays', 'MP_MP_ImportExport_Tat_011_F', 'Talk Shit Get Hit', 'Torso', 1598, 1),
(712, 'mplowrider2_overlays', 'MP_LR_Tat_000_F', 'SA Assault', 'Torso', 1900, 1),
(713, 'mplowrider2_overlays', 'MP_LR_Tat_003_F', 'Lady Vamp', 'rightArm', 595, 1),
(714, 'mplowrider2_overlays', 'MP_LR_Tat_006_F', 'Love Hustle', 'leftArm', 745, 1),
(715, 'mplowrider2_overlays', 'MP_LR_Tat_008_F', 'Love the Game', 'Torso', 1875, 1),
(716, 'mplowrider2_overlays', 'MP_LR_Tat_011_F', 'Lady Liberty', 'Torso', 800, 1),
(717, 'mplowrider2_overlays', 'MP_LR_Tat_012_F', 'Royal Kiss', 'Torso', 765, 1),
(718, 'mplowrider2_overlays', 'MP_LR_Tat_016_F', 'Two Face', 'Torso', 640, 1),
(719, 'mplowrider2_overlays', 'MP_LR_Tat_018_F', 'Skeleton Party', 'leftArm', 1100, 1),
(720, 'mplowrider2_overlays', 'MP_LR_Tat_019_F', 'Death Behind', 'Torso', 975, 1),
(721, 'mplowrider2_overlays', 'MP_LR_Tat_022_F', 'My Crazy Life', 'leftArm', 735, 1),
(722, 'mplowrider2_overlays', 'MP_LR_Tat_028_F', 'Loving Los Muertos', 'rightArm', 880, 1),
(723, 'mplowrider2_overlays', 'MP_LR_Tat_029_F', 'Death Us Do Part', 'leftLeg', 625, 1),
(724, 'mplowrider2_overlays', 'MP_LR_Tat_030_F', 'San Andreas Prayer', 'rightLeg', 815, 1),
(725, 'mplowrider2_overlays', 'MP_LR_Tat_031_F', 'Dead Pretty', 'Torso', 1650, 1),
(726, 'mplowrider2_overlays', 'MP_LR_Tat_032_F', 'Reign Over', 'Torso', 1850, 1),
(727, 'mplowrider2_overlays', 'MP_LR_Tat_035_F', 'Black Tears', 'rightArm', 825, 1),
(728, 'mplowrider_overlays', 'MP_LR_Tat_001_F', 'King Fight', 'Torso', 610, 1),
(729, 'mplowrider_overlays', 'MP_LR_Tat_002_F', 'Holy Mary', 'Torso', 1025, 1),
(730, 'mplowrider_overlays', 'MP_LR_Tat_004_F', 'Gun Mic', 'Torso', 350, 1),
(731, 'mplowrider_overlays', 'MP_LR_Tat_005_F', 'No Evil', 'leftArm', 590, 1),
(732, 'mplowrider_overlays', 'MP_LR_Tat_007_F', 'LS Serpent', 'leftLeg', 550, 1),
(733, 'mplowrider_overlays', 'MP_LR_Tat_009_F', 'Amazon', 'Torso', 950, 1),
(734, 'mplowrider_overlays', 'MP_LR_Tat_010_F', 'Bad Angel', 'Torso', 1650, 1),
(735, 'mplowrider_overlays', 'MP_LR_Tat_013_F', 'Love Gamble', 'Torso', 830, 1),
(736, 'mplowrider_overlays', 'MP_LR_Tat_014_F', 'Love is Blind', 'Torso', 1775, 1),
(737, 'mplowrider_overlays', 'MP_LR_Tat_015_F', 'Seductress', 'rightArm', 615, 1),
(738, 'mplowrider_overlays', 'MP_LR_Tat_017_F', 'Ink Me', 'rightLeg', 770, 1),
(739, 'mplowrider_overlays', 'MP_LR_Tat_020_F', 'Presidents', 'leftLeg', 685, 1),
(740, 'mplowrider_overlays', 'MP_LR_Tat_021_F', 'Sad Angel', 'Torso', 1500, 1),
(741, 'mplowrider_overlays', 'MP_LR_Tat_023_F', 'Dance of Hearts', 'rightLeg', 650, 1),
(742, 'mplowrider_overlays', 'MP_LR_Tat_026_F', 'Royal Takeover', 'Torso', 740, 1),
(743, 'mplowrider_overlays', 'MP_LR_Tat_027_F', 'Los Santos Life', 'leftArm', 780, 1),
(744, 'mplowrider_overlays', 'MP_LR_Tat_033_F', 'City Sorrow', 'leftArm', 1000, 1),
(745, 'mpluxe2_overlays', 'MP_LUXE_TAT_002_F', 'The Howler', 'Torso', 1100, 1),
(746, 'mpluxe2_overlays', 'MP_LUXE_TAT_005_F', 'Fatal Dagger', 'leftArm', 1025, 1),
(747, 'mpluxe2_overlays', 'MP_LUXE_TAT_010_F', 'Intrometric', 'rightArm', 1465, 1),
(748, 'mpluxe2_overlays', 'MP_LUXE_TAT_011_F', 'Cross of Roses', 'leftLeg', 1325, 1),
(749, 'mpluxe2_overlays', 'MP_LUXE_TAT_012_F', 'Geometric Galaxy', 'Torso', 2650, 1),
(750, 'mpluxe2_overlays', 'MP_LUXE_TAT_016_F', 'Egyptian Mural', 'leftArm', 1860, 1),
(751, 'mpluxe2_overlays', 'MP_LUXE_TAT_017_F', 'Heavenly Deity', 'rightArm', 2155, 1),
(752, 'mpluxe2_overlays', 'MP_LUXE_TAT_018_F', 'Divine Goddess', 'leftArm', 2340, 1),
(753, 'mpluxe2_overlays', 'MP_LUXE_TAT_022_F', 'Cloaked Angel', 'Torso', 2850, 1),
(754, 'mpluxe2_overlays', 'MP_LUXE_TAT_023_F', 'Starmetric', 'rightLeg', 1560, 1),
(755, 'mpluxe2_overlays', 'MP_LUXE_TAT_025_F', 'Reaper Sway', 'Torso', 1150, 1),
(756, 'mpluxe2_overlays', 'MP_LUXE_TAT_026_F', 'Floral Print', 'rightArm', 1470, 1),
(757, 'mpluxe2_overlays', 'MP_LUXE_TAT_027_F', 'Cobra Dawn', 'Torso', 1275, 1),
(758, 'mpluxe2_overlays', 'MP_LUXE_TAT_028_F', 'Python Skull', 'leftArm', 1130, 1),
(759, 'mpluxe2_overlays', 'MP_LUXE_TAT_029_F', 'Geometric Design', 'Torso', 3000, 1),
(760, 'mpluxe2_overlays', 'MP_LUXE_TAT_030_F', 'Geometric Design', 'rightArm', 0, 1),
(761, 'mpluxe2_overlays', 'MP_LUXE_TAT_031_F', 'Geometric Design', 'leftArm', 0, 1),
(762, 'mpluxe_overlays', 'MP_LUXE_TAT_000_F', 'Serpent of Death', 'leftLeg', 1190, 1),
(763, 'mpluxe_overlays', 'MP_LUXE_TAT_001_F', 'Elaborate Los Muertos', 'rightLeg', 1435, 1),
(764, 'mpluxe_overlays', 'MP_LUXE_TAT_003_F', 'Abstract Skull', 'Torso', 835, 1),
(765, 'mpluxe_overlays', 'MP_LUXE_TAT_004_F', 'Floral Raven', 'rightArm', 1220, 1),
(766, 'mpluxe_overlays', 'MP_LUXE_TAT_006_F', 'Adorned Wolf', 'Torso', 2500, 1),
(767, 'mpluxe_overlays', 'MP_LUXE_TAT_007_F', 'Eye of the Griffin', 'Torso', 1245, 1),
(768, 'mpluxe_overlays', 'MP_LUXE_TAT_008_F', 'Flying Eye', 'Torso', 1800, 1),
(769, 'mpluxe_overlays', 'MP_LUXE_TAT_009_F', 'Floral Symmetry', 'leftArm', 1915, 1),
(770, 'mpluxe_overlays', 'MP_LUXE_TAT_013_F', 'Mermaid Harpist', 'rightArm', 1690, 1),
(771, 'mpluxe_overlays', 'MP_LUXE_TAT_014_F', 'Ancient Queen', 'Torso', 1820, 1),
(772, 'mpluxe_overlays', 'MP_LUXE_TAT_015_F', 'Smoking Sisters', 'Torso', 1625, 1),
(773, 'mpluxe_overlays', 'MP_LUXE_TAT_019_F', 'Geisha Bloom', 'rightArm', 1685, 1),
(774, 'mpluxe_overlays', 'MP_LUXE_TAT_020_F', 'Archangel & Mary', 'leftArm', 2250, 1),
(775, 'mpluxe_overlays', 'MP_LUXE_TAT_021_F', 'Gabriel', 'leftArm', 1285, 1),
(776, 'mpluxe_overlays', 'MP_LUXE_TAT_024_F', 'Feather Mural', 'Torso', 2725, 1),
(777, 'mpsmuggler_overlays', 'MP_Smuggler_Tattoo_000_F', 'Bless The Dead', 'Torso', 1127, 1),
(778, 'mpsmuggler_overlays', 'MP_Smuggler_Tattoo_001_F', 'Crackshot', 'rightArm', 1082, 1),
(779, 'mpsmuggler_overlays', 'MP_Smuggler_Tattoo_002_F', 'Dead Lies', 'Torso', 1243, 1),
(780, 'mpsmuggler_overlays', 'MP_Smuggler_Tattoo_003_F', 'Give Nothing Back', 'Torso', 1309, 1),
(781, 'mpsmuggler_overlays', 'MP_Smuggler_Tattoo_004_F', 'Honor', 'leftArm', 815, 1),
(782, 'mpsmuggler_overlays', 'MP_Smuggler_Tattoo_005_F', 'Mutiny', 'rightArm', 792, 1),
(783, 'mpsmuggler_overlays', 'MP_Smuggler_Tattoo_006_F', 'Never Surrender', 'Torso', 947, 1),
(784, 'mpsmuggler_overlays', 'MP_Smuggler_Tattoo_007_F', 'No Honor', 'Torso', 852, 1),
(785, 'mpsmuggler_overlays', 'MP_Smuggler_Tattoo_008_F', 'Horrors Of The Deep', 'leftArm', 1104, 1),
(786, 'mpsmuggler_overlays', 'MP_Smuggler_Tattoo_009_F', 'Tall Ship Conflict', 'Torso', 1662, 1),
(787, 'mpsmuggler_overlays', 'MP_Smuggler_Tattoo_010_F', 'See You In Hell', 'Torso', 1281, 1),
(788, 'mpsmuggler_overlays', 'MP_Smuggler_Tattoo_011_F', 'Sinner', 'Head', 811, 1),
(789, 'mpsmuggler_overlays', 'MP_Smuggler_Tattoo_012_F', 'Thief', 'Head', 1072, 1),
(790, 'mpsmuggler_overlays', 'MP_Smuggler_Tattoo_013_F', 'Torn Wings', 'Torso', 1054, 1),
(791, 'mpsmuggler_overlays', 'MP_Smuggler_Tattoo_014_F', 'Mermaid\'s Curse', 'leftArm', 882, 1),
(792, 'mpsmuggler_overlays', 'MP_Smuggler_Tattoo_015_F', 'Jolly Roger', 'Torso', 976, 1),
(793, 'mpsmuggler_overlays', 'MP_Smuggler_Tattoo_016_F', 'Skull Compass', 'Torso', 1379, 1),
(794, 'mpsmuggler_overlays', 'MP_Smuggler_Tattoo_017_F', 'Framed Tall Ship', 'Torso', 1885, 1),
(795, 'mpsmuggler_overlays', 'MP_Smuggler_Tattoo_018_F', 'Finders Keepers', 'Torso', 1699, 1),
(796, 'mpsmuggler_overlays', 'MP_Smuggler_Tattoo_019_F', 'Lost At Sea', 'Torso', 1110, 1),
(797, 'mpsmuggler_overlays', 'MP_Smuggler_Tattoo_020_F', 'Homeward Bound', 'rightLeg', 915, 1),
(798, 'mpsmuggler_overlays', 'MP_Smuggler_Tattoo_021_F', 'Dead Tales', 'Torso', 1486, 1),
(799, 'mpsmuggler_overlays', 'MP_Smuggler_Tattoo_022_F', 'X Marks The Spot', 'Torso', 1671, 1),
(800, 'mpsmuggler_overlays', 'MP_Smuggler_Tattoo_023_F', 'Stylized Kraken', 'rightArm', 1440, 1),
(801, 'mpsmuggler_overlays', 'MP_Smuggler_Tattoo_024_F', 'Pirate Captain', 'Torso', 1821, 1),
(802, 'mpsmuggler_overlays', 'MP_Smuggler_Tattoo_025_F', 'Claimed By The Beast', 'Torso', 1745, 1),
(803, 'mpstunt_overlays', 'MP_MP_Stunt_Tat_000_F', 'Stunt Skull', 'Head', 485, 1),
(804, 'mpstunt_overlays', 'MP_MP_Stunt_tat_001_F', '8 Eyed Skull', 'leftArm', 1160, 1),
(805, 'mpstunt_overlays', 'MP_MP_Stunt_tat_002_F', 'Big Cat', 'leftArm', 885, 1),
(806, 'mpstunt_overlays', 'MP_MP_Stunt_tat_003_F', 'Poison Wrench', 'rightArm', 430, 1),
(807, 'mpstunt_overlays', 'MP_MP_Stunt_tat_004_F', 'Scorpion', 'Head', 635, 1),
(808, 'mpstunt_overlays', 'MP_MP_Stunt_tat_005_F', 'Demon Spark Plug', 'rightLeg', 885, 1),
(809, 'mpstunt_overlays', 'MP_MP_Stunt_tat_006_F', 'Toxic Spider', 'Head', 590, 1),
(810, 'mpstunt_overlays', 'MP_MP_Stunt_tat_007_F', 'Dagger Devil', 'leftLeg', 815, 1),
(811, 'mpstunt_overlays', 'MP_MP_Stunt_tat_008_F', 'Moonlight Ride', 'leftArm', 1475, 1),
(812, 'mpstunt_overlays', 'MP_MP_Stunt_tat_009_F', 'Arachnid of Death', 'rightArm', 1080, 1),
(813, 'mpstunt_overlays', 'MP_MP_Stunt_tat_010_F', 'Grave Vulture', 'rightArm', 1100, 1),
(814, 'mpstunt_overlays', 'MP_MP_Stunt_tat_011_F', 'Wheels of Death', 'Torso', 1075, 1),
(815, 'mpstunt_overlays', 'MP_MP_Stunt_tat_012_F', 'Punk Biker', 'Torso', 1195, 1),
(816, 'mpstunt_overlays', 'MP_MP_Stunt_tat_013_F', 'Dirt Track Hero', 'leftLeg', 1550, 1),
(817, 'mpstunt_overlays', 'MP_MP_Stunt_tat_014_F', 'Bat Cat of Spades', 'Torso', 830, 1),
(818, 'mpstunt_overlays', 'MP_MP_Stunt_tat_015_F', 'Praying Gloves', 'rightLeg', 1340, 1),
(819, 'mpstunt_overlays', 'MP_MP_Stunt_tat_016_F', 'Coffin Racer', 'rightArm', 1295, 1),
(820, 'mpstunt_overlays', 'MP_MP_Stunt_tat_017_F', 'Bat Wheel', 'Head', 380, 1),
(821, 'mpstunt_overlays', 'MP_MP_Stunt_tat_018_F', 'Vintage Bully', 'Torso', 540, 1),
(822, 'mpstunt_overlays', 'MP_MP_Stunt_tat_019_F', 'Engine Heart', 'Torso', 890, 1),
(823, 'mpstunt_overlays', 'MP_MP_Stunt_tat_020_F', 'Piston Angel', 'rightLeg', 695, 1),
(824, 'mpstunt_overlays', 'MP_MP_Stunt_tat_021_F', 'Golden Cobra', 'leftLeg', 2120, 1),
(825, 'mpstunt_overlays', 'MP_MP_Stunt_tat_022_F', 'Piston Head', 'leftArm', 1685, 1),
(826, 'mpstunt_overlays', 'MP_MP_Stunt_tat_023_F', 'Tanked', 'leftArm', 1850, 1),
(827, 'mpstunt_overlays', 'MP_MP_Stunt_tat_024_F', 'Road Kill', 'Torso', 865, 1),
(828, 'mpstunt_overlays', 'MP_MP_Stunt_tat_025_F', 'Speed Freak', 'rightLeg', 720, 1),
(829, 'mpstunt_overlays', 'MP_MP_Stunt_tat_026_F', 'Winged Wheel', 'Torso', 1230, 1),
(830, 'mpstunt_overlays', 'MP_MP_Stunt_tat_027_F', 'Punk Road Hog', 'Torso', 895, 1),
(831, 'mpstunt_overlays', 'MP_MP_Stunt_tat_028_F', 'Quad Goblin', 'leftLeg', 985, 1),
(832, 'mpstunt_overlays', 'MP_MP_Stunt_tat_029_F', 'Majestic Finish', 'Torso', 1735, 1),
(833, 'mpstunt_overlays', 'MP_MP_Stunt_tat_030_F', 'Man\'s Ruin', 'Torso', 815, 1),
(834, 'mpstunt_overlays', 'MP_MP_Stunt_tat_031_F', 'Stunt Jesus', 'leftLeg', 1100, 1),
(835, 'mpstunt_overlays', 'MP_MP_Stunt_tat_032_F', 'Wheelie Mouse', 'rightLeg', 1035, 1),
(836, 'mpstunt_overlays', 'MP_MP_Stunt_tat_033_F', 'Sugar Skull Trucker', 'Torso', 1040, 1),
(837, 'mpstunt_overlays', 'MP_MP_Stunt_tat_034_F', 'Feather Road Kill', 'Torso', 990, 1),
(838, 'mpstunt_overlays', 'MP_MP_Stunt_tat_035_F', 'Stuntman\'s End', 'leftArm', 1270, 1),
(839, 'mpstunt_overlays', 'MP_MP_Stunt_tat_036_F', 'Biker Stallion', 'rightArm', 235, 1),
(840, 'mpstunt_overlays', 'MP_MP_Stunt_tat_037_F', 'Big Grills', 'Torso', 685, 1),
(841, 'mpstunt_overlays', 'MP_MP_Stunt_tat_038_F', 'One Down Five Up', 'rightArm', 575, 1),
(842, 'mpstunt_overlays', 'MP_MP_Stunt_tat_039_F', 'Kaboom', 'leftArm', 935, 1),
(843, 'mpstunt_overlays', 'MP_MP_Stunt_tat_040_F', 'Monkey Chopper', 'Torso', 1595, 1),
(844, 'mpstunt_overlays', 'MP_MP_Stunt_tat_041_F', 'Brapp', 'Torso', 1010, 1),
(845, 'mpstunt_overlays', 'MP_MP_Stunt_tat_042_F', 'Flaming Quad', 'Head', 415, 1),
(846, 'mpstunt_overlays', 'MP_MP_Stunt_tat_043_F', 'Engine Arm', 'leftArm', 1030, 1),
(847, 'mpstunt_overlays', 'MP_MP_Stunt_tat_044_F', 'Ram Skull', 'Torso', 1390, 1),
(848, 'mpstunt_overlays', 'MP_MP_Stunt_tat_045_F', 'Severed Hand', 'rightLeg', 1965, 1),
(849, 'mpstunt_overlays', 'MP_MP_Stunt_tat_046_F', 'Full Throttle', 'Torso', 1275, 1),
(850, 'mpstunt_overlays', 'MP_MP_Stunt_tat_047_F', 'Brake Knife', 'rightLeg', 920, 1),
(851, 'mpstunt_overlays', 'MP_MP_Stunt_tat_048_F', 'Racing Doll', 'Torso', 1130, 1),
(852, 'mpstunt_overlays', 'MP_MP_Stunt_tat_049_F', 'Seductive Mechanic', 'rightArm', 2300, 1),
(853, 'multiplayer_overlays', 'FM_Tat_Award_F_000', 'NULL', 'Head', 2000, 1),
(854, 'multiplayer_overlays', 'FM_Tat_Award_F_001', 'NULL', 'leftArm', 140, 1),
(855, 'multiplayer_overlays', 'FM_Tat_Award_F_002', 'NULL', 'rightArm', 975, 1),
(856, 'multiplayer_overlays', 'FM_Tat_Award_F_003', 'NULL', 'Torso', 215, 1),
(857, 'multiplayer_overlays', 'FM_Tat_Award_F_004', 'NULL', 'Torso', 1000, 1),
(858, 'multiplayer_overlays', 'FM_Tat_Award_F_005', 'NULL', 'Torso', 1240, 1),
(859, 'multiplayer_overlays', 'FM_Tat_Award_F_006', 'NULL', 'rightLeg', 350, 1),
(860, 'multiplayer_overlays', 'FM_Tat_Award_F_007', 'NULL', 'leftArm', 495, 1),
(861, 'multiplayer_overlays', 'FM_Tat_Award_F_008', 'NULL', 'Torso', 135, 1),
(862, 'multiplayer_overlays', 'FM_Tat_Award_F_009', 'NULL', 'leftLeg', 145, 1),
(863, 'multiplayer_overlays', 'FM_Tat_Award_F_010', 'NULL', 'rightArm', 270, 1),
(864, 'multiplayer_overlays', 'FM_Tat_Award_F_011', 'NULL', 'Torso', 120, 1),
(865, 'multiplayer_overlays', 'FM_Tat_Award_F_012', 'NULL', 'Torso', 150, 1),
(866, 'multiplayer_overlays', 'FM_Tat_Award_F_013', 'NULL', 'Torso', 265, 1),
(867, 'multiplayer_overlays', 'FM_Tat_Award_F_014', 'NULL', 'Torso', 190, 1),
(868, 'multiplayer_overlays', 'FM_Tat_Award_F_015', 'NULL', 'leftArm', 495, 1),
(869, 'multiplayer_overlays', 'FM_Tat_Award_F_016', 'NULL', 'Torso', 240, 1),
(870, 'multiplayer_overlays', 'FM_Tat_Award_F_017', 'NULL', 'Torso', 510, 1),
(871, 'multiplayer_overlays', 'FM_Tat_Award_F_018', 'NULL', 'Torso', 740, 1),
(872, 'multiplayer_overlays', 'FM_Tat_Award_F_019', 'NULL', 'Torso', 1000, 1),
(873, 'multiplayer_overlays', 'FM_Tat_F_000', 'NULL', 'rightArm', 1000, 1),
(874, 'multiplayer_overlays', 'FM_Tat_F_001', 'NULL', 'rightArm', 1250, 1),
(875, 'multiplayer_overlays', 'FM_Tat_F_002', 'NULL', 'leftLeg', 375, 1),
(876, 'multiplayer_overlays', 'FM_Tat_F_003', 'NULL', 'rightArm', 1000, 1),
(877, 'multiplayer_overlays', 'FM_Tat_F_004', 'NULL', 'Torso', 1000, 1),
(878, 'multiplayer_overlays', 'FM_Tat_F_005', 'NULL', 'leftArm', 240, 1),
(879, 'multiplayer_overlays', 'FM_Tat_F_006', 'NULL', 'leftArm', 510, 1),
(880, 'multiplayer_overlays', 'FM_Tat_F_007', 'NULL', 'rightLeg', 375, 1),
(881, 'multiplayer_overlays', 'FM_Tat_F_008', 'NULL', 'leftLeg', 480, 1),
(882, 'multiplayer_overlays', 'FM_Tat_F_009', 'NULL', 'Torso', 1235, 1),
(883, 'multiplayer_overlays', 'FM_Tat_F_010', 'NULL', 'Torso', 250, 1),
(884, 'multiplayer_overlays', 'FM_Tat_F_011', 'NULL', 'Torso', 190, 1),
(885, 'multiplayer_overlays', 'FM_Tat_F_012', 'NULL', 'Torso', 1000, 1),
(886, 'multiplayer_overlays', 'FM_Tat_F_013', 'NULL', 'Torso', 450, 1),
(887, 'multiplayer_overlays', 'FM_Tat_F_014', 'NULL', 'rightArm', 500, 1),
(888, 'multiplayer_overlays', 'FM_Tat_F_015', 'NULL', 'leftArm', 360, 1),
(889, 'multiplayer_overlays', 'FM_Tat_F_016', 'NULL', 'Torso', 1225, 1),
(890, 'multiplayer_overlays', 'FM_Tat_F_017', 'NULL', 'rightLeg', 350, 1),
(891, 'multiplayer_overlays', 'FM_Tat_F_018', 'NULL', 'rightArm', 750, 1),
(892, 'multiplayer_overlays', 'FM_Tat_F_019', 'NULL', 'Torso', 1230, 1),
(893, 'multiplayer_overlays', 'FM_Tat_F_020', 'NULL', 'Torso', 750, 1),
(894, 'multiplayer_overlays', 'FM_Tat_F_021', 'NULL', 'leftLeg', 500, 1),
(895, 'multiplayer_overlays', 'FM_Tat_F_022', 'NULL', 'rightLeg', 730, 1),
(896, 'multiplayer_overlays', 'FM_Tat_F_023', 'NULL', 'leftLeg', 725, 1),
(897, 'multiplayer_overlays', 'FM_Tat_F_024', 'NULL', 'Torso', 1190, 1),
(898, 'multiplayer_overlays', 'FM_Tat_F_025', 'NULL', 'Torso', 275, 1),
(899, 'multiplayer_overlays', 'FM_Tat_F_026', 'NULL', 'leftLeg', 175, 1),
(900, 'multiplayer_overlays', 'FM_Tat_F_027', 'NULL', 'rightArm', 730, 1),
(901, 'multiplayer_overlays', 'FM_Tat_F_028', 'NULL', 'rightArm', 325, 1),
(902, 'multiplayer_overlays', 'FM_Tat_F_029', 'NULL', 'Torso', 100, 1),
(903, 'multiplayer_overlays', 'FM_Tat_F_030', 'NULL', 'Torso', 500, 1),
(904, 'multiplayer_overlays', 'FM_Tat_F_031', 'NULL', 'leftArm', 750, 1),
(905, 'multiplayer_overlays', 'FM_Tat_F_032', 'NULL', 'leftLeg', 510, 1),
(906, 'multiplayer_overlays', 'FM_Tat_F_033', 'NULL', 'leftLeg', 505, 1),
(907, 'multiplayer_overlays', 'FM_Tat_F_034', 'NULL', 'Torso', 245, 1),
(908, 'multiplayer_overlays', 'FM_Tat_F_035', 'NULL', 'leftLeg', 495, 1),
(909, 'multiplayer_overlays', 'FM_Tat_F_036', 'NULL', 'Torso', 510, 1),
(910, 'multiplayer_overlays', 'FM_Tat_F_037', 'NULL', 'leftLeg', 1225, 1),
(911, 'multiplayer_overlays', 'FM_Tat_F_038', 'NULL', 'rightArm', 115, 1),
(912, 'multiplayer_overlays', 'FM_Tat_F_039', 'NULL', 'rightLeg', 750, 1),
(913, 'multiplayer_overlays', 'FM_Tat_F_040', 'NULL', 'rightLeg', 760, 1),
(914, 'multiplayer_overlays', 'FM_Tat_F_041', 'NULL', 'leftArm', 260, 1),
(915, 'multiplayer_overlays', 'FM_Tat_F_042', 'NULL', 'rightLeg', 250, 1),
(916, 'multiplayer_overlays', 'FM_Tat_F_043', 'NULL', 'rightLeg', 745, 1),
(917, 'multiplayer_overlays', 'FM_Tat_F_044', 'NULL', 'Torso', 750, 1),
(918, 'multiplayer_overlays', 'FM_Tat_F_045', 'NULL', 'Torso', 1000, 1),
(919, 'multiplayer_overlays', 'FM_Tat_F_047', 'NULL', 'rightArm', 250, 1);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `server_tattooshops`
--

CREATE TABLE `server_tattooshops` (
  `id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `owner` int(11) NOT NULL,
  `bank` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `pedX` float NOT NULL,
  `pedY` float NOT NULL,
  `pedZ` float NOT NULL,
  `pedModel` varchar(64) NOT NULL,
  `pedRot` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `server_tattooshops`
--

INSERT INTO `server_tattooshops` (`id`, `name`, `owner`, `bank`, `price`, `pedX`, `pedY`, `pedZ`, `pedModel`, `pedRot`) VALUES
(1, 'Blazing Tattoo Vinewood', 1, 16742, 0, 319.74, 181.38, 102.57, '', -111.764);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `server_teleports`
--

CREATE TABLE `server_teleports` (
  `id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `posX` float NOT NULL,
  `posY` float NOT NULL,
  `posZ` float NOT NULL,
  `targetX` float NOT NULL,
  `targetY` float NOT NULL,
  `targetZ` float NOT NULL,
  `dimension` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `server_teleports`
--

INSERT INTO `server_teleports` (`id`, `name`, `posX`, `posY`, `posZ`, `targetX`, `targetY`, `targetZ`, `dimension`) VALUES
(4, 'PillboxHill Krankenhaus-Dach', 331.899, -595.648, 43.2821, 338.624, -583.78, 74.15, 0),
(5, 'PillboxHill Dach-Krankenhaus', 338.624, -583.78, 74.15, 331.899, -595.648, 43.2821, 0),
(6, 'FIB Aufzug unten - oben', 136.167, -762.037, 45.752, 136.185, -761.943, 242.152, 0),
(7, 'FIB Aufzug oben - unten', 136.167, -762.037, 242.152, 136.185, -761.943, 45.752, 0),
(8, 'FIB Aufzug unten - Garage', 139.012, -762.65, 45.75, 108.242, -735.863, 33.1332, 0),
(9, 'FIB Aufzug Garagen - unten', 108.242, -735.863, 33.1332, 139.012, -762.65, 45.75, 0);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `server_vehicles`
--

CREATE TABLE `server_vehicles` (
  `id` int(11) NOT NULL,
  `charid` int(11) NOT NULL,
  `hash` bigint(64) UNSIGNED NOT NULL,
  `vehType` int(11) NOT NULL,
  `faction` int(11) NOT NULL DEFAULT 0,
  `fuel` float NOT NULL,
  `km` float NOT NULL DEFAULT 0,
  `enginestate` tinyint(1) NOT NULL DEFAULT 0,
  `isEngineHealthy` tinyint(1) NOT NULL DEFAULT 1,
  `lockstate` tinyint(1) NOT NULL DEFAULT 0,
  `isingarage` tinyint(1) NOT NULL DEFAULT 0,
  `garageid` int(11) NOT NULL,
  `posX` float NOT NULL,
  `posY` float NOT NULL,
  `posZ` float NOT NULL,
  `rotX` float NOT NULL,
  `rotY` float NOT NULL,
  `rotZ` float NOT NULL,
  `plate` varchar(8) NOT NULL,
  `lastUsage` timestamp NOT NULL DEFAULT current_timestamp(),
  `buyDate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `server_vehicles_mod`
--

CREATE TABLE `server_vehicles_mod` (
  `id` int(11) NOT NULL,
  `vehId` int(11) NOT NULL,
  `colorPrimary` int(11) NOT NULL DEFAULT 0,
  `colorSecondary` int(11) NOT NULL DEFAULT 0,
  `colorPearl` int(11) NOT NULL DEFAULT 0,
  `headlightColor` int(11) NOT NULL DEFAULT 0,
  `spoiler` int(11) NOT NULL DEFAULT 0,
  `front_bumper` int(11) NOT NULL DEFAULT 0,
  `rear_bumper` int(11) NOT NULL DEFAULT 0,
  `side_skirt` int(11) NOT NULL DEFAULT 0,
  `exhaust` int(11) DEFAULT 0,
  `frame` int(11) NOT NULL DEFAULT 0,
  `grille` int(11) NOT NULL DEFAULT 0,
  `hood` int(11) NOT NULL DEFAULT 0,
  `fender` int(11) NOT NULL DEFAULT 0,
  `right_fender` int(11) NOT NULL DEFAULT 0,
  `roof` int(11) NOT NULL DEFAULT 0,
  `engine` int(11) NOT NULL DEFAULT 0,
  `brakes` int(11) NOT NULL DEFAULT 0,
  `transmission` int(11) NOT NULL DEFAULT 0,
  `horns` int(11) NOT NULL DEFAULT 0,
  `suspension` int(11) NOT NULL DEFAULT 0,
  `armor` int(11) NOT NULL DEFAULT 0,
  `turbo` int(11) NOT NULL DEFAULT 0,
  `xenon` int(11) NOT NULL DEFAULT 0,
  `wheel_type` int(11) NOT NULL DEFAULT 0,
  `wheels` int(11) NOT NULL DEFAULT 0,
  `wheelcolor` int(11) NOT NULL DEFAULT 0,
  `plate_holder` int(11) NOT NULL DEFAULT 0,
  `trim_design` int(11) NOT NULL DEFAULT 0,
  `ornaments` int(11) NOT NULL DEFAULT 0,
  `dial_design` int(11) NOT NULL DEFAULT 0,
  `steering_wheel` int(11) NOT NULL DEFAULT 0,
  `shift_lever` int(11) NOT NULL DEFAULT 0,
  `plaques` int(11) NOT NULL DEFAULT 0,
  `hydraulics` int(11) NOT NULL DEFAULT 0,
  `airfilter` int(11) NOT NULL DEFAULT 0,
  `window_tint` int(11) NOT NULL DEFAULT 0,
  `livery` int(11) NOT NULL DEFAULT 0,
  `plate` int(11) NOT NULL DEFAULT 0,
  `neon` int(11) NOT NULL DEFAULT 0,
  `neon_r` int(11) NOT NULL DEFAULT 255,
  `neon_g` int(11) NOT NULL DEFAULT 255,
  `neon_b` int(11) NOT NULL DEFAULT 255,
  `smoke_r` int(11) NOT NULL DEFAULT 0,
  `smoke_g` int(11) NOT NULL DEFAULT 0,
  `smoke_b` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `server_vehicle_items`
--

CREATE TABLE `server_vehicle_items` (
  `id` int(11) NOT NULL,
  `vehId` int(11) NOT NULL,
  `itemName` varchar(128) NOT NULL,
  `itemAmount` int(11) NOT NULL,
  `isInGlovebox` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `server_vehicle_items`
--

INSERT INTO `server_vehicle_items` (`id`, `vehId`, `itemName`, `itemAmount`, `isInGlovebox`) VALUES
(1, 2, 'Bargeld', 9, 0),
(2, 2, 'Bargeld', 5, 1);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `server_vehicle_shops`
--

CREATE TABLE `server_vehicle_shops` (
  `id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `pedX` float NOT NULL,
  `pedY` float NOT NULL,
  `pedZ` float NOT NULL,
  `pedRot` float NOT NULL,
  `parkOutX` float NOT NULL,
  `parkOutY` float NOT NULL,
  `parkOutZ` float NOT NULL,
  `parkOutRotX` float NOT NULL,
  `parkOutRotY` float NOT NULL,
  `parkOutRotZ` float NOT NULL,
  `neededLicense` varchar(64) NOT NULL DEFAULT 'None'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `server_vehicle_shops`
--

INSERT INTO `server_vehicle_shops` (`id`, `name`, `pedX`, `pedY`, `pedZ`, `pedRot`, `parkOutX`, `parkOutY`, `parkOutZ`, `parkOutRotX`, `parkOutRotY`, `parkOutRotZ`, `neededLicense`) VALUES
(1, 'Premium Deluxe Motorsports', -56.6182, -1098.63, 25.4224, 30.9921, -13.0418, -1080.87, 25.8931, 0, 0, 1.1875, 'None'),
(2, 'LKWS', 638.215, 205.78, 97.589, 0.395791, 630.079, 195.746, 97.0835, 0, 0, 1.92948, 'None'),
(3, 'Compact Wagen', 268.404, -1156.35, 28.2799, -1.53369, 256.312, -1161.03, 29.1787, 0, 0, 0.0989478, 'None'),
(4, 'Flughafen verleih', -984.322, -2640.86, 13.9464, -2.57264, -993.679, -2655.82, 13.9634, 0, 0, -2, 'None'),
(5, 'Tanaka Imports', -584.664, 191.802, 71.3677, 93.3184, -594.075, 186.012, 70.7325, 0, 0, 91.3126, 'None');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `server_vehicle_shops_items`
--

CREATE TABLE `server_vehicle_shops_items` (
  `id` int(11) NOT NULL,
  `shopid` int(11) NOT NULL,
  `hash` bigint(64) UNSIGNED NOT NULL,
  `price` int(11) NOT NULL,
  `posX` float NOT NULL,
  `posY` float NOT NULL,
  `posZ` float NOT NULL,
  `rotX` float NOT NULL,
  `rotY` float NOT NULL,
  `rotZ` float NOT NULL,
  `isOnlyOnlineAvailable` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `server_vehicle_shops_items`
--

INSERT INTO `server_vehicle_shops_items` (`id`, `shopid`, `hash`, `price`, `posX`, `posY`, `posZ`, `rotX`, `rotY`, `rotZ`, `isOnlyOnlineAvailable`) VALUES
(9, 2, 2983726598, 55000, 660.29, 196.444, 94.9941, 0, 0, -1.1379, 0),
(10, 2, 4175309224, 55000, 658.51, 192.079, 95.011, 0, 0, -1.1379, 0),
(11, 2, 943752001, 55000, 655.51, 185.248, 95.011, 0, 0, -1.1379, 0),
(12, 2, 1162065741, 55000, 655.51, 181.49, 95.011, 0, 0, -1.1379, 0),
(13, 2, 2549763894, 75000, 653.51, 177.086, 95.011, 0, 0, -1.1379, 0),
(14, 2, 296357396, 75000, 652.51, 173.235, 95.011, 0, 0, -1.1379, 0),
(15, 2, 3387490166, 75000, 651.51, 169.622, 95.011, 0, 0, -1.1379, 0),
(16, 2, 2551651283, 75000, 650.51, 165.732, 95.011, 0, 0, -1.1379, 0),
(17, 2, 2948279460, 75000, 649.51, 162, 95.011, 0, 0, -1.1379, 0),
(18, 2, 2242229361, 2500000, 624.897, 180.396, 97.1003, 0, 0, 1.9, 0),
(19, 2, 2053223216, 3500000, 624.897, 186.949, 97.1003, 0, 0, 1.9, 0),
(20, 2, 2112052861, 5000000, 619.609, 150.949, 96.8308, 0, 0, 0.3, 0),
(21, 3, 3164157193, 20000, 243.508, -1150.05, 29.1956, 0, 0, -3.06738, 0),
(22, 3, 3950024287, 25000, 246.508, -1150.05, 29.1956, 0, 0, -3.06738, 0),
(23, 3, 3117103977, 20000, 250.009, -1150.05, 29.1956, 0, 0, -3.06738, 0),
(24, 3, 2844316578, 22500, 253.009, -1150.05, 29.1956, 0, 0, -3.06738, 0),
(25, 3, 3164157193, 22000, 256.009, -1150.05, 29.1956, 0, 0, -3.06738, 0),
(26, 4, 2452219115, 2000, -996.501, -2668.75, 13.9802, 0, 0, -2.1, 0),
(27, 4, 3627815886, 3500, -1003, -2664.4, 13.9802, 0, 0, 2.8, 0),
(28, 5, 3670438162, 220000, 597.56, 200.753, 71.4274, 0, 0, 181.72, 0),
(29, 5, 2364918497, 800000, 601.59, 200.885, 71.3886, 0, 0, 181.72, 0),
(30, 5, 634118882, 350000, -607.374, 201.217, 71.3532, 0, 0, 181.72, 0),
(31, 5, 3101863448, 180000, -610.353, 200.741, 71.2921, 0, 0, 181.72, 0),
(32, 5, 2751205197, 200000, -613.662, 200.811, 71.2612, 0, 0, 181.72, 0),
(33, 5, 3884762073, 800000, -616.566, 200.818, 71.2294, 0, 0, 181.72, 0),
(34, 5, 3783366066, 270000, -622.667, 200.807, 71.0666, 0, 0, 181.72, 0),
(35, 1, 2983726598, 55000, -47.9, -1093.92, 25.64, 0, 0, 2.14, 0);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `server_wanteds`
--

CREATE TABLE `server_wanteds` (
  `wantedId` int(11) NOT NULL,
  `category` int(11) NOT NULL,
  `wantedName` varchar(128) NOT NULL,
  `paragraph` int(11) NOT NULL,
  `jailtime` int(11) NOT NULL,
  `ticketfine` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `server_wanteds`
--

INSERT INTO `server_wanteds` (`wantedId`, `category`, `wantedName`, `paragraph`, `jailtime`, `ticketfine`) VALUES
(1, 1, '1-25km/h Geschwindigkeitsüberschreitung', 1, 0, 1500),
(2, 1, '50-75km/h Geschwindigkeitsüberschreitung', 2, 0, 2500),
(3, 2, 'Gefährlicher Eingriff in den Straßenverkehr', 1, 20, 10000);

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `accounts`
--
ALTER TABLE `accounts`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `accounts_characters`
--
ALTER TABLE `accounts_characters`
  ADD PRIMARY KEY (`charId`);

--
-- Indizes für die Tabelle `characters_bank`
--
ALTER TABLE `characters_bank`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `characters_inventory`
--
ALTER TABLE `characters_inventory`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `characters_lastpos`
--
ALTER TABLE `characters_lastpos`
  ADD PRIMARY KEY (`charid`);

--
-- Indizes für die Tabelle `characters_licenses`
--
ALTER TABLE `characters_licenses`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `characters_minijobs`
--
ALTER TABLE `characters_minijobs`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `characters_ownedclothes`
--
ALTER TABLE `characters_ownedclothes`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `characters_permissions`
--
ALTER TABLE `characters_permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `characters_phone_chatmessages`
--
ALTER TABLE `characters_phone_chatmessages`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `characters_phone_chats`
--
ALTER TABLE `characters_phone_chats`
  ADD PRIMARY KEY (`chatId`);

--
-- Indizes für die Tabelle `characters_phone_contacts`
--
ALTER TABLE `characters_phone_contacts`
  ADD PRIMARY KEY (`contactId`);

--
-- Indizes für die Tabelle `characters_skin`
--
ALTER TABLE `characters_skin`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `characters_tablet_apps`
--
ALTER TABLE `characters_tablet_apps`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `characters_tablet_tutorial`
--
ALTER TABLE `characters_tablet_tutorial`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `characters_tattoos`
--
ALTER TABLE `characters_tattoos`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `characters_wanteds`
--
ALTER TABLE `characters_wanteds`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `logs_company`
--
ALTER TABLE `logs_company`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `logs_faction`
--
ALTER TABLE `logs_faction`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `logs_login`
--
ALTER TABLE `logs_login`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `server_all_vehicles`
--
ALTER TABLE `server_all_vehicles`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `server_all_vehicle_mods`
--
ALTER TABLE `server_all_vehicle_mods`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `server_animations`
--
ALTER TABLE `server_animations`
  ADD PRIMARY KEY (`animId`);

--
-- Indizes für die Tabelle `server_atm`
--
ALTER TABLE `server_atm`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `server_banks`
--
ALTER TABLE `server_banks`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `server_bank_paper`
--
ALTER TABLE `server_bank_paper`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `server_barbers`
--
ALTER TABLE `server_barbers`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `server_blips`
--
ALTER TABLE `server_blips`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `server_clothes`
--
ALTER TABLE `server_clothes`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `server_clothesshops`
--
ALTER TABLE `server_clothesshops`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `server_clothesshops_items`
--
ALTER TABLE `server_clothesshops_items`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `server_clothes_storages`
--
ALTER TABLE `server_clothes_storages`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `server_companys`
--
ALTER TABLE `server_companys`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `server_company_members`
--
ALTER TABLE `server_company_members`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `server_doors`
--
ALTER TABLE `server_doors`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `server_factions`
--
ALTER TABLE `server_factions`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `server_faction_clothes`
--
ALTER TABLE `server_faction_clothes`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `server_faction_members`
--
ALTER TABLE `server_faction_members`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `server_faction_positions`
--
ALTER TABLE `server_faction_positions`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `server_faction_ranks`
--
ALTER TABLE `server_faction_ranks`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `server_faction_storage_items`
--
ALTER TABLE `server_faction_storage_items`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `server_farming_producer`
--
ALTER TABLE `server_farming_producer`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `server_farming_spots`
--
ALTER TABLE `server_farming_spots`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `server_fuel_spots`
--
ALTER TABLE `server_fuel_spots`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `server_fuel_stations`
--
ALTER TABLE `server_fuel_stations`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `server_garages`
--
ALTER TABLE `server_garages`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `server_garage_slots`
--
ALTER TABLE `server_garage_slots`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `server_hotels`
--
ALTER TABLE `server_hotels`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `server_hotels_apartments`
--
ALTER TABLE `server_hotels_apartments`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `server_hotels_storage`
--
ALTER TABLE `server_hotels_storage`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `server_houses`
--
ALTER TABLE `server_houses`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `server_houses_interior`
--
ALTER TABLE `server_houses_interior`
  ADD PRIMARY KEY (`interiorId`);

--
-- Indizes für die Tabelle `server_houses_renter`
--
ALTER TABLE `server_houses_renter`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `server_houses_storage`
--
ALTER TABLE `server_houses_storage`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `server_items`
--
ALTER TABLE `server_items`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `server_jobs`
--
ALTER TABLE `server_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `server_licenses`
--
ALTER TABLE `server_licenses`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `server_markers`
--
ALTER TABLE `server_markers`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `server_minijob_busdriver_routes`
--
ALTER TABLE `server_minijob_busdriver_routes`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `server_minijob_busdriver_spots`
--
ALTER TABLE `server_minijob_busdriver_spots`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `server_minijob_garbage_spots`
--
ALTER TABLE `server_minijob_garbage_spots`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `server_peds`
--
ALTER TABLE `server_peds`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `server_shops`
--
ALTER TABLE `server_shops`
  ADD PRIMARY KEY (`shopid`);

--
-- Indizes für die Tabelle `server_shop_items`
--
ALTER TABLE `server_shop_items`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `server_tablet_apps`
--
ALTER TABLE `server_tablet_apps`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `server_tablet_events`
--
ALTER TABLE `server_tablet_events`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `server_tablet_notes`
--
ALTER TABLE `server_tablet_notes`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `server_tattoos`
--
ALTER TABLE `server_tattoos`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `server_tattooshops`
--
ALTER TABLE `server_tattooshops`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `server_teleports`
--
ALTER TABLE `server_teleports`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `server_vehicles`
--
ALTER TABLE `server_vehicles`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `server_vehicles_mod`
--
ALTER TABLE `server_vehicles_mod`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `server_vehicle_items`
--
ALTER TABLE `server_vehicle_items`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `server_vehicle_shops`
--
ALTER TABLE `server_vehicle_shops`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `server_vehicle_shops_items`
--
ALTER TABLE `server_vehicle_shops_items`
  ADD PRIMARY KEY (`id`);

--
-- Indizes für die Tabelle `server_wanteds`
--
ALTER TABLE `server_wanteds`
  ADD PRIMARY KEY (`wantedId`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `accounts`
--
ALTER TABLE `accounts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `accounts_characters`
--
ALTER TABLE `accounts_characters`
  MODIFY `charId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `characters_bank`
--
ALTER TABLE `characters_bank`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `characters_inventory`
--
ALTER TABLE `characters_inventory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `characters_licenses`
--
ALTER TABLE `characters_licenses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `characters_minijobs`
--
ALTER TABLE `characters_minijobs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `characters_ownedclothes`
--
ALTER TABLE `characters_ownedclothes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `characters_permissions`
--
ALTER TABLE `characters_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `characters_phone_chatmessages`
--
ALTER TABLE `characters_phone_chatmessages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `characters_phone_chats`
--
ALTER TABLE `characters_phone_chats`
  MODIFY `chatId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `characters_phone_contacts`
--
ALTER TABLE `characters_phone_contacts`
  MODIFY `contactId` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `characters_skin`
--
ALTER TABLE `characters_skin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `characters_tablet_apps`
--
ALTER TABLE `characters_tablet_apps`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `characters_tablet_tutorial`
--
ALTER TABLE `characters_tablet_tutorial`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `characters_tattoos`
--
ALTER TABLE `characters_tattoos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `characters_wanteds`
--
ALTER TABLE `characters_wanteds`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `logs_company`
--
ALTER TABLE `logs_company`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `logs_faction`
--
ALTER TABLE `logs_faction`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `logs_login`
--
ALTER TABLE `logs_login`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `server_all_vehicles`
--
ALTER TABLE `server_all_vehicles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT für Tabelle `server_all_vehicle_mods`
--
ALTER TABLE `server_all_vehicle_mods`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3683;

--
-- AUTO_INCREMENT für Tabelle `server_animations`
--
ALTER TABLE `server_animations`
  MODIFY `animId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT für Tabelle `server_atm`
--
ALTER TABLE `server_atm`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=106;

--
-- AUTO_INCREMENT für Tabelle `server_banks`
--
ALTER TABLE `server_banks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT für Tabelle `server_bank_paper`
--
ALTER TABLE `server_bank_paper`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `server_barbers`
--
ALTER TABLE `server_barbers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT für Tabelle `server_blips`
--
ALTER TABLE `server_blips`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT für Tabelle `server_clothes`
--
ALTER TABLE `server_clothes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT für Tabelle `server_clothesshops`
--
ALTER TABLE `server_clothesshops`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT für Tabelle `server_clothesshops_items`
--
ALTER TABLE `server_clothesshops_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT für Tabelle `server_clothes_storages`
--
ALTER TABLE `server_clothes_storages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT für Tabelle `server_companys`
--
ALTER TABLE `server_companys`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `server_company_members`
--
ALTER TABLE `server_company_members`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `server_doors`
--
ALTER TABLE `server_doors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `server_factions`
--
ALTER TABLE `server_factions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT für Tabelle `server_faction_clothes`
--
ALTER TABLE `server_faction_clothes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `server_faction_members`
--
ALTER TABLE `server_faction_members`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `server_faction_positions`
--
ALTER TABLE `server_faction_positions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT für Tabelle `server_faction_ranks`
--
ALTER TABLE `server_faction_ranks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=112;

--
-- AUTO_INCREMENT für Tabelle `server_faction_storage_items`
--
ALTER TABLE `server_faction_storage_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `server_farming_producer`
--
ALTER TABLE `server_farming_producer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT für Tabelle `server_farming_spots`
--
ALTER TABLE `server_farming_spots`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT für Tabelle `server_fuel_spots`
--
ALTER TABLE `server_fuel_spots`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=95;

--
-- AUTO_INCREMENT für Tabelle `server_fuel_stations`
--
ALTER TABLE `server_fuel_stations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT für Tabelle `server_garages`
--
ALTER TABLE `server_garages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT für Tabelle `server_garage_slots`
--
ALTER TABLE `server_garage_slots`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT für Tabelle `server_hotels`
--
ALTER TABLE `server_hotels`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT für Tabelle `server_hotels_apartments`
--
ALTER TABLE `server_hotels_apartments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT für Tabelle `server_hotels_storage`
--
ALTER TABLE `server_hotels_storage`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `server_houses`
--
ALTER TABLE `server_houses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT für Tabelle `server_houses_interior`
--
ALTER TABLE `server_houses_interior`
  MODIFY `interiorId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT für Tabelle `server_houses_renter`
--
ALTER TABLE `server_houses_renter`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `server_houses_storage`
--
ALTER TABLE `server_houses_storage`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `server_items`
--
ALTER TABLE `server_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2096;

--
-- AUTO_INCREMENT für Tabelle `server_jobs`
--
ALTER TABLE `server_jobs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT für Tabelle `server_licenses`
--
ALTER TABLE `server_licenses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT für Tabelle `server_markers`
--
ALTER TABLE `server_markers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT für Tabelle `server_minijob_busdriver_routes`
--
ALTER TABLE `server_minijob_busdriver_routes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT für Tabelle `server_minijob_busdriver_spots`
--
ALTER TABLE `server_minijob_busdriver_spots`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT für Tabelle `server_minijob_garbage_spots`
--
ALTER TABLE `server_minijob_garbage_spots`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=178;

--
-- AUTO_INCREMENT für Tabelle `server_peds`
--
ALTER TABLE `server_peds`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT für Tabelle `server_shops`
--
ALTER TABLE `server_shops`
  MODIFY `shopid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT für Tabelle `server_shop_items`
--
ALTER TABLE `server_shop_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2349;

--
-- AUTO_INCREMENT für Tabelle `server_tablet_apps`
--
ALTER TABLE `server_tablet_apps`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT für Tabelle `server_tablet_events`
--
ALTER TABLE `server_tablet_events`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `server_tablet_notes`
--
ALTER TABLE `server_tablet_notes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `server_tattoos`
--
ALTER TABLE `server_tattoos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=920;

--
-- AUTO_INCREMENT für Tabelle `server_tattooshops`
--
ALTER TABLE `server_tattooshops`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT für Tabelle `server_teleports`
--
ALTER TABLE `server_teleports`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT für Tabelle `server_vehicles`
--
ALTER TABLE `server_vehicles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `server_vehicles_mod`
--
ALTER TABLE `server_vehicles_mod`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT für Tabelle `server_vehicle_items`
--
ALTER TABLE `server_vehicle_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT für Tabelle `server_vehicle_shops`
--
ALTER TABLE `server_vehicle_shops`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT für Tabelle `server_vehicle_shops_items`
--
ALTER TABLE `server_vehicle_shops_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT für Tabelle `server_wanteds`
--
ALTER TABLE `server_wanteds`
  MODIFY `wantedId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
