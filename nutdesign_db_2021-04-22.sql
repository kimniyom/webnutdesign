# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.7.26-log)
# Database: nutdesign_db
# Generation Time: 2021-04-22 09:49:50 +0000
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='ตารางแผนกบัญชี';

LOCK TABLES `account` WRITE;
/*!40000 ALTER TABLE `account` DISABLE KEYS */;

INSERT INTO `account` (`id`, `customer_id`, `ref`, `link`, `ref_account`, `user_id`, `last_dep`, `status`, `approve`, `create_date`, `update_date`, `detail`, `file`)
VALUES
	(1,NULL,'M3WXmZ9MvqSupx-IMQMhhy','',NULL,6,NULL,1,0,'2021-04-22 11:45:30','2021-04-22 11:45:30','ส่งแผนกกราฟิก','516bc47987d3df33c72a5880390ae3c1.pdf'),
	(2,NULL,'EVawA3izzajfxIR9lREUdr',NULL,NULL,NULL,NULL,0,0,NULL,NULL,NULL,NULL);

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
  `outside` int(1) DEFAULT '0' COMMENT '1 = ส่งผลิตนอกร้าน',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;

INSERT INTO `customer` (`id`, `project_name`, `customer`, `tel`, `channel`, `channel_etc`, `address`, `typework`, `detail`, `file`, `date_getjob`, `time_getjob`, `cur_dep`, `last_dep`, `create_date`, `user_id`, `ref`, `transport`, `setup`, `fast`, `flag`, `quotation`, `confirm`, `outside`)
VALUES
	(2,'โล่รางวัลงานวิ่ง','สำนักงานสาธารณสุขจังหวัดตาก','0821684717',3,'-','165 หมู่ 7 ตำบลไม้งาม อ เมือง จ ตาก 63000',2,'โล่ต้องการไม่ซ้ำที่อื่น',NULL,'2021-04-30','13:10:00','3,4',NULL,'2021-04-18 09:38:54',NULL,'M3WXmZ9MvqSupx-IMQMhhy',0,0,0,0,1,1,0),
	(5,'gggg','gggggg','0821684717',2,'-','',2,'gggg',NULL,'2021-04-22','20:56:00','4',NULL,'2021-04-19 09:38:59',NULL,'Xb3SesqT3v_Tml0FWJpPqZ',0,0,0,0,1,1,0),
	(6,'2323','123123','232323',3,'-','',2,'23',NULL,'2021-04-16','20:58:00','4',NULL,'2021-04-18 09:39:05',NULL,'QFL0OnpzYwt6hjY62FgbbL',0,0,0,0,1,1,0),
	(7,'55555555','1234','0821684717',2,'-','',1,'123456',NULL,'2021-04-16','21:57:00','3,4',NULL,NULL,NULL,'kjA8s4eFTtNKrv0pz7fnAW',0,0,0,0,1,1,0),
	(8,'trhtr','srsrer','',2,'-','',NULL,'',NULL,'2021-04-16','00:03:00','3, 4',NULL,NULL,NULL,'-RyGzto0I_wEOoIr4fF6BW',0,0,0,0,NULL,0,0),
	(9,'5545534545','12121212','0821684717',1,'คิมนิยม','',NULL,'',NULL,'2021-04-17','00:21:00','4',NULL,NULL,NULL,'UDWK-DAQc70Et3wK9u6p0B',1,1,1,0,1,1,0),
	(10,'ทำป้าย','test','0821684717',2,'-','ไม่มีการจัดส่ง',NULL,'123456',NULL,'2021-04-18','20:18:00','4',NULL,'2021-04-16 00:54:29',2,'cKFxaRmd48wawnBIKP6gp9',0,0,0,2,1,1,0),
	(11,'1212','12121','121212',2,'-','1212',NULL,'1212',NULL,'2021-04-19','17:43:00','4',NULL,'2021-04-18 17:56:04',1,'eqhwD2d5Ss_TqsyL9jSWdC',0,0,0,0,0,1,0),
	(12,' แผ่นพับ','คุณน้อย','0822191019',1,'ID Noie1213','',NULL,'แผ่นพับขนาด A 4 3 ทบ',NULL,'2021-04-22','11:37:00','3,4',NULL,'2021-04-18 20:13:13',2,'EVawA3izzajfxIR9lREUdr',0,0,0,0,1,1,0),
	(13,'ป้ายตั้งโต๊ะ 10 ป้าย','ทรงพล คำสะอาด','0821684717',2,'-','สสจ.ตาก',NULL,'ป้ายตั้งโต๊ะพื้นหลังสีน้ำเงิน\r\nป้ายไม้',NULL,'2021-04-21','12:23:00','4',NULL,'2021-04-19 16:25:02',1,'5GUUxMgM-wXJFSbGtXW2WO',0,0,0,0,1,1,0),
	(14,'ป้ายไวนิล ยาว 8 กว้าง 2.5 เมตร','คุณมานะ','0800260265',1,'Mana','ป่าไม้',NULL,'ป้ายไวนิล ยาว 8 กว้าง 2.5 เมตร',NULL,'2021-04-29','16:00:00','4',NULL,'2021-04-20 15:17:12',2,'iaEY0EcmD4yUAgS39owt6t',0,0,0,0,1,1,0),
	(15,'111111111111111111','123123','0800282928',2,'-','sfsdf',NULL,'111',NULL,'2021-04-28','14:32:00','4',NULL,'2021-04-21 14:33:23',1,'Ffp9smFEE67GpADRHNnqii',0,0,0,0,1,1,0);

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
	(1,'รับงาน / คุยงาน',1,NULL,'fa fa-users','customer'),
	(2,'การตลาด / ลูกค้าสัมพันธ์',0,NULL,'fa fa-tags',NULL),
	(3,'กราฟิก',1,NULL,'fa fa-paint-brush','graphic'),
	(4,'บัญชี',1,NULL,'fa fa-usd','account'),
	(5,'งานพิมพ์',0,NULL,'fa fa-print',NULL),
	(6,'CNC / Laser',0,NULL,'fa fa-magnet',NULL),
	(7,'ผลิตทั่วไป',0,NULL,'fas fa-air-freshener',NULL),
	(8,'ช่าง / ติดตั้ง',0,NULL,'fa fa-wrench',NULL),
	(9,'จัดส่ง',0,NULL,'fa fa-truck',NULL);

/*!40000 ALTER TABLE `department` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table graphic
# ------------------------------------------------------------

DROP TABLE IF EXISTS `graphic`;

CREATE TABLE `graphic` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ref` varchar(50) DEFAULT '' COMMENT 'ref อ้างอิงลูกค้า',
  `customer_id` int(11) DEFAULT NULL COMMENT 'รหัสลูกค้า',
  `detail` text COMMENT 'รายละเอียดข้อมูลใบสั่งงาน',
  `link` varchar(255) DEFAULT '' COMMENT 'ลิงแนบไฟล์ตัวอย่างงาน / แบบงาน',
  `ref_graphic` varchar(100) DEFAULT '' COMMENT 'รหัสอ้างอิงอัพโหลดไฟล์ตัวอย่างงาน / แบบงาน',
  `user_id` int(11) DEFAULT NULL COMMENT 'ผู้บันทึกงาน',
  `last_dep` int(11) DEFAULT NULL COMMENT 'แผนกที่ส่งมา',
  `status` int(1) DEFAULT '0' COMMENT '0 = ยังไม่รับงาน 1 = รับงาน 2 = งานถูกยกเลิก',
  `approve` int(1) DEFAULT '0' COMMENT '0 = งานยังไม่approve 1 = งาน approve แล้ว',
  `create_date` timestamp NULL DEFAULT NULL COMMENT 'วันที่รับบงาน',
  `update_date` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'วันที่แก้ไขล่าสุด',
  `flagsend` int(1) DEFAULT '1' COMMENT '1 = ยังไม่ส่งต่อ 2 = ส่งต่อ 3 = งานจบที่นี้',
  `todep` varchar(100) DEFAULT NULL COMMENT 'ส่งต่อแผนก',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='ตารางแผนกกราฟิก';

LOCK TABLES `graphic` WRITE;
/*!40000 ALTER TABLE `graphic` DISABLE KEYS */;

INSERT INTO `graphic` (`id`, `ref`, `customer_id`, `detail`, `link`, `ref_graphic`, `user_id`, `last_dep`, `status`, `approve`, `create_date`, `update_date`, `flagsend`, `todep`)
VALUES
	(1,'M3WXmZ9MvqSupx-IMQMhhy',NULL,'<p>โล่รางวัล</p><ul><li>ขนาด สูง 20 นิ้ว กว้างฐาน 10 x 10</li><li>ฐานเป็นไม้</li></ul>','','g1vP0emhkg7BNXagOS9zrl',1,NULL,1,0,'2021-04-22 14:17:53','2021-04-22 14:17:53',1,''),
	(2,'EVawA3izzajfxIR9lREUdr',NULL,NULL,'','',NULL,NULL,0,0,NULL,'2021-04-22 14:06:26',1,NULL);

/*!40000 ALTER TABLE `graphic` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table graphic_log
# ------------------------------------------------------------

DROP TABLE IF EXISTS `graphic_log`;

CREATE TABLE `graphic_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ref` varchar(50) DEFAULT NULL COMMENT 'รหัสอ้างอิงงาน',
  `type_edit` int(1) DEFAULT NULL COMMENT 'รายการแก้ไข',
  `edit_etc` longtext COMMENT 'รายละเอียดแก้ไข อื่น ๆ',
  `send_dep` int(1) DEFAULT NULL COMMENT 'แผนกที่ส่งมาแก้ไข',
  `d_update` timestamp NULL DEFAULT NULL COMMENT 'วันที่บันทึก',
  `flag` int(1) DEFAULT '0' COMMENT '1 = ยังไม่แก้',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='ตารางเก็บประวัติส่งกลับมาแก้ไข';



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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='สิทธิ์การใช้งาน';

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
	(1,'admin',NULL,NULL,NULL,NULL,NULL,'',NULL,'0821684717',NULL,NULL,'A'),
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
	(22,5,2,1),
	(23,3,1,1),
	(24,4,6,1);

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
	(8,NULL,'EVawA3izzajfxIR9lREUdr',1,2,'บันทึกข้อมูลการรับงาน','2021-04-22 14:02:54','กราฟิก,บัญชี',0),
	(9,NULL,'M3WXmZ9MvqSupx-IMQMhhy',1,1,'บันทึกข้อมูลการรับงาน','2021-04-22 14:17:19','กราฟิก,บัญชี',0),
	(10,NULL,'M3WXmZ9MvqSupx-IMQMhhy',3,1,'กราฟิก / ออกแบบ','2021-04-22 14:17:53','กราฟิก(รับงาน)',0);

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
	(1,'admin','kimniyomclub@gmail.com','$2y$12$MenOVpHsMKOW0zYIFAD1ruqkamrLlEG1YIkcKOD9/eGmR9ECXzzsO','eVObZ98v26jv2RAmbdeUIlaHK4uJ8S-8',1617557741,NULL,NULL,'::1',1617557092,1617557092,0,1619084625,'A'),
	(2,'demo','demo@gmail.com','$2y$12$ScVrSZM1VaIdB7rwZBAuK.SgNSPj8zvXPIO2n5jR.pHnw4EWjCWJ.','plDiCAlz6oFWCndrv4WHPeObSu1Ucf5-',1617559566,NULL,NULL,'::1',1617559566,1618997823,0,1619066750,'U'),
	(3,'test','test@gmail.com','$2y$12$xigkYiCrgq0WBx99U9.AHeesTmAPlVvs4DBzo7TTv5hHu0/PJAGEC','xarpZbvmW6kRpH6_7L8DLCjo_nv8HBum',1617640742,NULL,NULL,'::1',1617640742,1617640783,0,NULL,'A'),
	(5,'pdk','pdk@gmail.com','$2y$12$L23eye2iC9BD5gYlCIr30u6AujEdO6J/.dZK55XlM56Jl5au9PHxq','-GYruuDz28hFZZFRm0HbtzO9vwWI2MVC',1617990517,NULL,NULL,'::1',1617990517,1617990517,0,NULL,'U'),
	(6,'kimniyom','123@gmail.com','$2y$12$NL13psXOId80ykwkmNYdte/GXhrd/jXsHNms.WpWO.N6O6fVnAS42','b3uR2qjlXICxPVN7h-FDBTWMUON8R7v0',1618703595,NULL,NULL,'::1',1618703595,1618703595,0,1619066604,'U');

/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
