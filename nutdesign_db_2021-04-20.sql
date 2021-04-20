# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.7.26-log)
# Database: nutdesign_db
# Generation Time: 2021-04-20 01:52:51 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table account
# ------------------------------------------------------------

DROP TABLE IF EXISTS `account`;

CREATE TABLE `account` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) DEFAULT NULL COMMENT 'รหัสลูกค้า',
  `ref` varchar(50) DEFAULT NULL COMMENT 'ref อ้างอิงลูกค้า',
  `link` varchar(255) DEFAULT NULL COMMENT 'ลิงแนบใบเสนอราคา',
  `ref_account` varchar(100) DEFAULT NULL COMMENT 'รหัสอ้างอิงอัพโหลดไฟล์',
  `user_id` int(11) DEFAULT NULL COMMENT 'ผู้บันทึกงาน',
  `last_dep` int(11) DEFAULT NULL COMMENT 'แผนกที่ส่งมา',
  `status` int(1) DEFAULT '0' COMMENT '0 = ยังไม่รับงาน 1 = รับงาน 2 = งานถูกยกเลิก',
  `approve` int(1) DEFAULT '0' COMMENT '0 = งานยังไม่approve 1 = งาน approve แล้ว',
  `create_date` timestamp NULL DEFAULT NULL COMMENT 'วันที่รับบงาน',
  `update_date` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'วันที่แก้ไขล่าสุด',
  `detail` text COMMENT 'อื่น ๆ',
  `file` varchar(255) DEFAULT NULL COMMENT 'แนบใบเสนอราคา',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='ตารางแผนกบัญชี';

LOCK TABLES `account` WRITE;
/*!40000 ALTER TABLE `account` DISABLE KEYS */;

INSERT INTO `account` (`id`, `customer_id`, `ref`, `link`, `ref_account`, `user_id`, `last_dep`, `status`, `approve`, `create_date`, `update_date`, `detail`, `file`)
VALUES
	(2,NULL,'M3WXmZ9MvqSupx-IMQMhhy',NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,NULL),
	(3,NULL,'5GUUxMgM-wXJFSbGtXW2WO',NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,NULL),
	(4,NULL,'eqhwD2d5Ss_TqsyL9jSWdC',NULL,NULL,NULL,NULL,2,0,NULL,'2021-04-20 02:38:56',NULL,NULL);

/*!40000 ALTER TABLE `account` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table customer
# ------------------------------------------------------------

DROP TABLE IF EXISTS `customer`;

CREATE TABLE `customer` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `project_name` varchar(255) DEFAULT NULL COMMENT 'ชื่องาน',
  `customer` varchar(100) DEFAULT NULL COMMENT 'ชื่อ-สกุล / หน่วยงาน ผู้ว่าจ้าง',
  `tel` varchar(100) DEFAULT NULL COMMENT 'เบอร์โทรศัพท์',
  `channel` int(3) DEFAULT NULL COMMENT 'ช่องทางที่ลูกค้าติดต่อ',
  `channel_etc` varchar(255) DEFAULT NULL COMMENT 'อื่น ๆ ระบุ เช่น line Id',
  `address` varchar(255) DEFAULT NULL COMMENT 'ที่อยู่',
  `typework` int(11) DEFAULT NULL COMMENT 'ประเภทงาน',
  `detail` text COMMENT 'รายละเอียดงาน',
  `file` varchar(100) DEFAULT NULL COMMENT 'ไฟล์แนบ',
  `date_getjob` date DEFAULT NULL COMMENT 'วันที่รับสินค้า',
  `time_getjob` time DEFAULT NULL COMMENT 'เวลาลูกค้ารับสินค้า',
  `cur_dep` varchar(100) DEFAULT NULL COMMENT 'แผนกปัจุบัน',
  `last_dep` int(3) DEFAULT NULL COMMENT 'แผนกก่อนหน้า',
  `create_date` timestamp NULL DEFAULT NULL COMMENT 'วันที่บันทึก',
  `user_id` int(11) DEFAULT NULL COMMENT 'ผู้บันทึกข้อมูล',
  `ref` varchar(255) DEFAULT NULL,
  `transport` int(1) DEFAULT '0' COMMENT '0 ไม่จัดส่ง 1 จัดส่ง',
  `setup` int(1) DEFAULT '0' COMMENT '0 ไม่ติดตั้ง 1 ติดตั้ง',
  `fast` int(1) DEFAULT '0' COMMENT '0 ทั่วไป 1 เร่งด่วน',
  `flag` int(1) DEFAULT '0' COMMENT '0 = NoApprove 1 = Approve 2 =  Cancel',
  `quotation` int(1) DEFAULT NULL COMMENT 'ใบเสนอราคา 0 = ไม่ออกใบเสนอราคา 1 = ออกใบเสนอราคา',
  `confirm` int(1) DEFAULT '0' COMMENT '0 = ยังไม่ตกลงซื้อ 1 = ตกลงซื้อ',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;

INSERT INTO `customer` (`id`, `project_name`, `customer`, `tel`, `channel`, `channel_etc`, `address`, `typework`, `detail`, `file`, `date_getjob`, `time_getjob`, `cur_dep`, `last_dep`, `create_date`, `user_id`, `ref`, `transport`, `setup`, `fast`, `flag`, `quotation`, `confirm`)
VALUES
	(2,'erewrewrew','321323213','0821684717',2,'-','2321',2,'232',NULL,'2021-04-16','20:34:00','4',NULL,NULL,NULL,'M3WXmZ9MvqSupx-IMQMhhy',0,0,0,0,1,1),
	(5,'gggg','gggggg','0821684717',2,'-','',2,'gggg',NULL,'2021-04-22','20:56:00','',NULL,NULL,NULL,'Xb3SesqT3v_Tml0FWJpPqZ',0,0,0,0,NULL,0),
	(6,'2323','123123','232323',3,'-','',2,'23',NULL,'2021-04-16','20:58:00','4',NULL,NULL,NULL,'QFL0OnpzYwt6hjY62FgbbL',0,0,0,0,1,1),
	(7,'55555555','1234','0821684717',2,'-','',1,'123456',NULL,'2021-04-16','21:57:00','',NULL,NULL,NULL,'kjA8s4eFTtNKrv0pz7fnAW',0,0,0,2,NULL,0),
	(8,'trhtr','srsrer','',2,'-','',NULL,'',NULL,'2021-04-16','00:03:00','3, 4',NULL,NULL,NULL,'-RyGzto0I_wEOoIr4fF6BW',0,0,0,0,NULL,0),
	(9,'5545534545','12121212','0821684717',1,'คิมนิยม','',NULL,'',NULL,'2021-04-17','00:21:00','4',NULL,NULL,NULL,'UDWK-DAQc70Et3wK9u6p0B',1,1,1,0,1,1),
	(10,'123456','test','0821684717',2,'-','ไม่มีการจัดส่ง',NULL,'123456',NULL,'2021-04-18','20:18:00','4',NULL,'2021-04-16 00:54:29',2,'cKFxaRmd48wawnBIKP6gp9',0,0,0,0,0,0),
	(11,'1212','12121','121212',2,'-','1212',NULL,'1212',NULL,'2021-04-19','17:43:00','4',NULL,'2021-04-18 17:56:04',1,'eqhwD2d5Ss_TqsyL9jSWdC',0,0,0,2,0,1),
	(12,'2343432','2334','2343',2,'-','343',NULL,'23432',NULL,'2021-04-20','17:37:00','2, 3',NULL,'2021-04-18 20:13:13',2,'EVawA3izzajfxIR9lREUdr',0,0,0,0,0,1),
	(13,'ป้ายตั้งโต๊ะ 10 ป้าย','ทรงพล คำสะอาด','0821684717',2,'-','สสจ.ตาก',NULL,'ป้ายตั้งโต๊ะพื้นหลังสีน้ำเงิน\r\nป้ายไม้',NULL,'2021-04-21','12:23:00','4',NULL,'2021-04-19 16:25:02',1,'5GUUxMgM-wXJFSbGtXW2WO',0,0,0,0,1,1);

/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table department
# ------------------------------------------------------------

DROP TABLE IF EXISTS `department`;

CREATE TABLE `department` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `department` varchar(255) DEFAULT NULL COMMENT 'แผนก',
  `active` int(1) DEFAULT '1' COMMENT '1 = ใช้งาน 0 = ไม่ใช้งาน',
  `description` varchar(255) DEFAULT NULL COMMENT 'หน้าที่',
  `icon` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;

INSERT INTO `department` (`id`, `department`, `active`, `description`, `icon`, `url`)
VALUES
	(1,'รับงาน',1,NULL,'fa fa-users','customer'),
	(2,'การตลาด / ลูกค้าสัมพันธ์',0,NULL,'fa fa-tags',NULL),
	(3,'กราฟิก',1,NULL,'fa fa-paint-brush',NULL),
	(4,'บัญชี',1,NULL,'fa fa-usd','account'),
	(5,'งานพิมพ์',0,NULL,'fa fa-print',NULL),
	(6,'CNC / Laser',0,NULL,'fa fa-magnet',NULL),
	(7,'ผลิตทั่วไป',0,NULL,'fas fa-air-freshener',NULL),
	(8,'ช่าง',0,NULL,'fa fa-wrench',NULL),
	(9,'จัดส่ง',0,NULL,'fa fa-truck',NULL);

/*!40000 ALTER TABLE `department` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table migration
# ------------------------------------------------------------

DROP TABLE IF EXISTS `migration`;

CREATE TABLE `migration` (
  `version` varchar(180) NOT NULL,
  `apply_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `migration` WRITE;
/*!40000 ALTER TABLE `migration` DISABLE KEYS */;

INSERT INTO `migration` (`version`, `apply_time`)
VALUES
	('m000000_000000_base',1617556826),
	('m140209_132017_init',1617556830),
	('m140403_174025_create_account_table',1617556830),
	('m140504_113157_update_tables',1617556831),
	('m140504_130429_create_token_table',1617556831),
	('m140830_171933_fix_ip_field',1617556831),
	('m140830_172703_change_account_table_name',1617556831),
	('m141222_110026_update_ip_field',1617556831),
	('m141222_135246_alter_username_length',1617556831),
	('m150614_103145_update_social_account_table',1617556831),
	('m150623_212711_fix_username_notnull',1617556831),
	('m151218_234654_add_timezone_to_profile',1617556831),
	('m160929_103127_add_last_login_at_to_user_table',1617556832);

/*!40000 ALTER TABLE `migration` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table privilege
# ------------------------------------------------------------

DROP TABLE IF EXISTS `privilege`;

CREATE TABLE `privilege` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `edit_project` int(1) DEFAULT '0' COMMENT 'แก้ไขรายละเอียดงาน 0 = ไม่มีสิทธิ์ 1 = มีสิทธิ์',
  `notify_customer` int(1) DEFAULT '0' COMMENT 'แจ้งงานลูกค้าทราบ 0 = ไม่มีสิทิ์ 1 = มีสิทธิ์',
  `edit_tranfer` int(1) DEFAULT '0' COMMENT 'ข้อมูลการจัดส่ง 0 = ไม่มีสิทธิ์ 1 = มีสิทธิ์',
  `approve` int(1) DEFAULT '0' COMMENT 'สิทธิ์ยืนยันงาน 0 = ไม่มีสิทธิ์ 1 = มีสิทธิ์',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='สิทธิ์การใช้งาน';

LOCK TABLES `privilege` WRITE;
/*!40000 ALTER TABLE `privilege` DISABLE KEYS */;

INSERT INTO `privilege` (`id`, `user_id`, `edit_project`, `notify_customer`, `edit_tranfer`, `approve`)
VALUES
	(1,5,1,0,0,0),
	(6,6,0,0,0,0),
	(7,1,1,1,1,0);

/*!40000 ALTER TABLE `privilege` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table profile
# ------------------------------------------------------------

DROP TABLE IF EXISTS `profile`;

CREATE TABLE `profile` (
  `user_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `public_email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gravatar_email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gravatar_id` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `location` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `website` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bio` text COLLATE utf8_unicode_ci,
  `timezone` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tel` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `department` int(11) DEFAULT NULL,
  `position` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nickname` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  CONSTRAINT `fk_user_profile` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `profile` WRITE;
/*!40000 ALTER TABLE `profile` DISABLE KEYS */;

INSERT INTO `profile` (`user_id`, `name`, `public_email`, `gravatar_email`, `gravatar_id`, `location`, `website`, `bio`, `timezone`, `tel`, `department`, `position`, `nickname`)
VALUES
	(1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),
	(2,'ทดสอบ',NULL,NULL,NULL,NULL,NULL,'',NULL,'0800260943',NULL,NULL,'ทดสอบ'),
	(3,'demo demo','','','d41d8cd98f00b204e9800998ecf8427e','','','',NULL,NULL,NULL,NULL,NULL),
	(5,'demo demo',NULL,NULL,NULL,NULL,NULL,'',NULL,'0800260943',NULL,NULL,'test'),
	(6,'kimniyom',NULL,NULL,NULL,NULL,NULL,'ทำงานด้านออกแบบ',NULL,'0821684717',NULL,NULL,'kang');

/*!40000 ALTER TABLE `profile` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table rule
# ------------------------------------------------------------

DROP TABLE IF EXISTS `rule`;

CREATE TABLE `rule` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `department_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `active` int(1) DEFAULT '1' COMMENT '0 = ไม่ใช้งาน  1 = ใช้งาน',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='สิทธิ์การเข้าถึงแผนก';

LOCK TABLES `rule` WRITE;
/*!40000 ALTER TABLE `rule` DISABLE KEYS */;

INSERT INTO `rule` (`id`, `department_id`, `user_id`, `active`)
VALUES
	(4,1,3,1),
	(5,2,3,1),
	(6,1,5,1),
	(9,1,1,1),
	(10,2,1,1),
	(11,4,1,1),
	(13,5,1,1),
	(14,6,1,1),
	(15,7,1,1),
	(16,8,1,1),
	(17,9,1,1),
	(18,1,2,1),
	(19,2,2,1),
	(20,3,2,1),
	(21,4,2,1),
	(22,5,2,1),
	(23,3,1,1);

/*!40000 ALTER TABLE `rule` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table social_account
# ------------------------------------------------------------

DROP TABLE IF EXISTS `social_account`;

CREATE TABLE `social_account` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `provider` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `client_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `data` text COLLATE utf8_unicode_ci,
  `code` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `account_unique` (`provider`,`client_id`),
  UNIQUE KEY `account_unique_code` (`code`),
  KEY `fk_user_account` (`user_id`),
  CONSTRAINT `fk_user_account` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;



# Dump of table timeline
# ------------------------------------------------------------

DROP TABLE IF EXISTS `timeline`;

CREATE TABLE `timeline` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) DEFAULT NULL COMMENT 'รหัสลูกค้า',
  `ref` varchar(100) DEFAULT NULL COMMENT 'รหัสใช้อ้างอิง',
  `department` int(3) DEFAULT NULL COMMENT 'แผนกที่บันทึก',
  `user_id` int(11) DEFAULT NULL COMMENT 'รหัสผู้บันทึกข้อมูล',
  `log` varchar(255) DEFAULT NULL COMMENT 'รายละเอียด',
  `d_update` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'วันที่บันทึกข้อมูล',
  `todep` varchar(2555) DEFAULT NULL COMMENT 'แผนกที่ส่งไป',
  `flag` int(1) DEFAULT '0' COMMENT '0 = กำลังผลิต 1 = Success 2 = Cancel',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `timeline` WRITE;
/*!40000 ALTER TABLE `timeline` DISABLE KEYS */;

INSERT INTO `timeline` (`id`, `customer_id`, `ref`, `department`, `user_id`, `log`, `d_update`, `todep`, `flag`)
VALUES
	(2,NULL,'EVawA3izzajfxIR9lREUdr',1,2,'บันทึกข้อมูลการรับงาน','2021-04-18 20:13:13','การตลาด / ลูกค้าสัมพันธ์,กราฟิก',NULL),
	(22,NULL,'UDWK-DAQc70Et3wK9u6p0B',1,1,'บันทึกข้อมูลการรับงาน','2021-04-19 00:47:21','บัญชี',NULL),
	(23,NULL,'QFL0OnpzYwt6hjY62FgbbL',1,1,'บันทึกข้อมูลการรับงาน','2021-04-19 00:47:55','บัญชี',NULL),
	(26,NULL,'M3WXmZ9MvqSupx-IMQMhhy',1,1,'บันทึกข้อมูลการรับงาน','2021-04-19 14:46:48','บัญชี',NULL),
	(27,NULL,'5GUUxMgM-wXJFSbGtXW2WO',1,1,'บันทึกข้อมูลการรับงาน','2021-04-19 16:25:02','บัญชี',NULL),
	(28,NULL,'eqhwD2d5Ss_TqsyL9jSWdC',1,1,'บันทึกข้อมูลการรับงาน','2021-04-20 01:30:25','บัญชี',NULL),
	(29,NULL,'kjA8s4eFTtNKrv0pz7fnAW',1,1,'ยกเลิกงาน','2021-04-20 02:36:44','ยกเลิกงาน',2),
	(30,NULL,'eqhwD2d5Ss_TqsyL9jSWdC',1,1,'ยกเลิกงาน','2021-04-20 02:38:56','ยกเลิกงาน',2);

/*!40000 ALTER TABLE `timeline` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table token
# ------------------------------------------------------------

DROP TABLE IF EXISTS `token`;

CREATE TABLE `token` (
  `user_id` int(11) NOT NULL,
  `code` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` int(11) NOT NULL,
  `type` smallint(6) NOT NULL,
  UNIQUE KEY `token_unique` (`user_id`,`code`,`type`),
  CONSTRAINT `fk_user_token` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `token` WRITE;
/*!40000 ALTER TABLE `token` DISABLE KEYS */;

INSERT INTO `token` (`user_id`, `code`, `created_at`, `type`)
VALUES
	(1,'tlftZ3ffWRyuYHSUCJ-x3YF0glWGHZBL',1617557092,0);

/*!40000 ALTER TABLE `token` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table uploads
# ------------------------------------------------------------

DROP TABLE IF EXISTS `uploads`;

CREATE TABLE `uploads` (
  `upload_id` int(11) NOT NULL AUTO_INCREMENT,
  `ref` varchar(100) DEFAULT NULL,
  `file_name` varchar(150) DEFAULT NULL COMMENT 'ชื่อไฟล์',
  `real_filename` varchar(150) DEFAULT NULL COMMENT 'ชื่อไฟล์จริง',
  `create_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `type` int(11) DEFAULT NULL COMMENT 'ประเภท',
  `customer_id` int(11) DEFAULT NULL COMMENT 'รหัสลูกค้า',
  `typefile` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`upload_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `uploads` WRITE;
/*!40000 ALTER TABLE `uploads` DISABLE KEYS */;

INSERT INTO `uploads` (`upload_id`, `ref`, `file_name`, `real_filename`, `create_date`, `type`, `customer_id`, `typefile`)
VALUES
	(1,NULL,'170187.jpg','596947710099ad49e5fa9257646574ae.jpg','2021-04-15 20:18:17',NULL,NULL,NULL),
	(2,NULL,'121716693-testdrug.png','598a56fa2b2fed382aa8bdab7315f687.png','2021-04-15 20:44:09',NULL,NULL,NULL),
	(3,'','121716693-testdrug.png','dd3660eff521da4402f327a08d5237b6.png','2021-04-15 20:48:37',NULL,NULL,NULL),
	(4,'Xb3SesqT3v_Tml0FWJpPqZ','RawQ-Android.png','2708667e5e64744b7197d233402e80da.png','2021-04-15 20:57:03',NULL,NULL,NULL),
	(5,'Xb3SesqT3v_Tml0FWJpPqZ','business-infographic-step-flat-simple-template-design-black-background-business-infographic-step-flat-black-142414283.jpg','48d8a014663659ff05819c52262c6ff2.jpg','2021-04-15 20:57:50',NULL,NULL,NULL),
	(6,'QFL0OnpzYwt6hjY62FgbbL','fancy_uikit_12.jpg','402148fc3fccdb697c099031e3d4a0f5.jpg','2021-04-15 20:59:19',NULL,NULL,NULL),
	(7,'QFL0OnpzYwt6hjY62FgbbL','ipad1.jpg','b375f8105ff5b096a3a54c5505ee77ac.jpg','2021-04-15 21:26:36',NULL,NULL,NULL),
	(10,'kjA8s4eFTtNKrv0pz7fnAW','คู่มือติดตั้ง  Application Tak Covid-19 Tracking.pdf','fa844a55dc00cef96ee9f843da2d3082.pdf','2021-04-15 22:02:50',NULL,NULL,NULL),
	(11,'BmpfVnSz5jde7zyEgMYQtf','S__26427412.jpg','3bfb24cdc1c76eeb4090df0e42fc2027.jpg','2021-04-15 23:52:02',NULL,NULL,NULL),
	(12,'KAyxp3AvB4R-kt8dYvzGzi','S__26427413.jpg','36dc90643ee75c7874277bbdb13cdd97.jpg','2021-04-15 23:56:12',NULL,NULL,NULL),
	(13,'KAyxp3AvB4R-kt8dYvzGzi','S__26427413.jpg','29b20a360b7838d7517cc886f2680cf1.jpg','2021-04-15 23:56:27',NULL,NULL,NULL),
	(14,'UDWK-DAQc70Et3wK9u6p0B','Build-ionic.txt','28a0b627b8dcce1b96028d9f11645392.txt','2021-04-16 00:51:10',NULL,NULL,NULL),
	(15,'cKFxaRmd48wawnBIKP6gp9','main-kstudio.jpg','87bdd1b615f008b7320a750752b7fcaf.jpg','2021-04-18 00:25:45',NULL,NULL,NULL),
	(16,'cKFxaRmd48wawnBIKP6gp9','icon-l.png','746230aa8bf8d8eb259cebe8b4daa622.png','2021-04-18 01:20:45',NULL,NULL,NULL),
	(17,'cKFxaRmd48wawnBIKP6gp9','170187.jpg','0f42c3a7a4c2115cdadb02aa3f87d875.jpg','2021-04-18 01:23:25',NULL,NULL,NULL),
	(21,'cKFxaRmd48wawnBIKP6gp9','คู่มือติดตั้ง  Application Tak Covid-19 Tracking.pdf','36511bfd0bd56c8be10e022e1e56309c.pdf','2021-04-18 17:14:28',NULL,NULL,'2'),
	(22,'cKFxaRmd48wawnBIKP6gp9','mikedonovandesign-ui-kit-flat-dark.png','c6acaf65738808e7996ca1f293893926.png','2021-04-18 17:15:00',NULL,NULL,'1'),
	(23,'M3WXmZ9MvqSupx-IMQMhhy','RawQ-Android.png','b11b0343ea88712704aa4461722d7ba0.png','2021-04-19 00:19:24',NULL,NULL,'1'),
	(24,'5GUUxMgM-wXJFSbGtXW2WO','128592597_109666597638698_2792228581842476147_o.jpg','505b39ed6a9697b46782d7b126ac638d.jpg','2021-04-19 16:25:02',NULL,NULL,'1'),
	(25,'5GUUxMgM-wXJFSbGtXW2WO','129480353_110908537514504_217742368336997507_o.jpg','6d03ee4d24a5f623ade36c2e7abbeaec.jpg','2021-04-19 16:25:02',NULL,NULL,'1');

/*!40000 ALTER TABLE `uploads` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table user
# ------------------------------------------------------------

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password_hash` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `auth_key` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `confirmed_at` int(11) DEFAULT NULL,
  `unconfirmed_email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `blocked_at` int(11) DEFAULT NULL,
  `registration_ip` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  `flags` int(11) NOT NULL DEFAULT '0',
  `last_login_at` int(11) DEFAULT NULL,
  `status` char(11) COLLATE utf8_unicode_ci DEFAULT 'U' COMMENT 'U = User,A = Admin,M = Manager',
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_unique_username` (`username`),
  UNIQUE KEY `user_unique_email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;

INSERT INTO `user` (`id`, `username`, `email`, `password_hash`, `auth_key`, `confirmed_at`, `unconfirmed_email`, `blocked_at`, `registration_ip`, `created_at`, `updated_at`, `flags`, `last_login_at`, `status`)
VALUES
	(1,'admin','kimniyomclub@gmail.com','$2y$12$MenOVpHsMKOW0zYIFAD1ruqkamrLlEG1YIkcKOD9/eGmR9ECXzzsO','eVObZ98v26jv2RAmbdeUIlaHK4uJ8S-8',1617557741,NULL,NULL,'::1',1617557092,1617557092,0,1618858551,'A'),
	(2,'demo','demo@gmail.com','$2y$12$xLtGys.g2KKktF2/5Ytruu0VkWh2oYdHiDACmKztM.gWkzNS.QugC','plDiCAlz6oFWCndrv4WHPeObSu1Ucf5-',1617559566,NULL,NULL,'::1',1617559566,1617989452,0,1618819645,'U'),
	(3,'test','test@gmail.com','$2y$12$xigkYiCrgq0WBx99U9.AHeesTmAPlVvs4DBzo7TTv5hHu0/PJAGEC','xarpZbvmW6kRpH6_7L8DLCjo_nv8HBum',1617640742,NULL,NULL,'::1',1617640742,1617640783,0,NULL,'A'),
	(5,'pdk','pdk@gmail.com','$2y$12$L23eye2iC9BD5gYlCIr30u6AujEdO6J/.dZK55XlM56Jl5au9PHxq','-GYruuDz28hFZZFRm0HbtzO9vwWI2MVC',1617990517,NULL,NULL,'::1',1617990517,1617990517,0,NULL,'U'),
	(6,'kimniyom','123@gmail.com','$2y$12$NL13psXOId80ykwkmNYdte/GXhrd/jXsHNms.WpWO.N6O6fVnAS42','b3uR2qjlXICxPVN7h-FDBTWMUON8R7v0',1618703595,NULL,NULL,'::1',1618703595,1618703595,0,1618704003,'U');

/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
