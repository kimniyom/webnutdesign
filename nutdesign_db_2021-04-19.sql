/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50531
Source Host           : localhost:3306
Source Database       : nutdesign_db

Target Server Type    : MYSQL
Target Server Version : 50531
File Encoding         : 65001

Date: 2021-04-19 02:25:39
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `account`
-- ----------------------------
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
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='ตารางแผนกบัญชี';

-- ----------------------------
-- Records of account
-- ----------------------------
INSERT INTO `account` VALUES ('1', null, 'M3WXmZ9MvqSupx-IMQMhhy', null, null, null, null, '0', '0', null, null, null);
INSERT INTO `account` VALUES ('2', null, 'UDWK-DAQc70Et3wK9u6p0B', null, null, null, null, '0', '0', null, null, null);
INSERT INTO `account` VALUES ('3', null, 'QFL0OnpzYwt6hjY62FgbbL', null, null, null, null, '0', '0', null, null, null);

-- ----------------------------
-- Table structure for `customer`
-- ----------------------------
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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of customer
-- ----------------------------
INSERT INTO `customer` VALUES ('2', 'erewrewrew', '321323213', '0821684717', '2', '-', '2321', '2', '232', null, '2021-04-16', '20:34:00', '4', null, null, null, 'M3WXmZ9MvqSupx-IMQMhhy', '0', '0', '0', '0', '1', '1');
INSERT INTO `customer` VALUES ('5', 'gggg', 'gggggg', '0821684717', '2', '-', '', '2', 'gggg', null, '2021-04-22', '20:56:00', '', null, null, null, 'Xb3SesqT3v_Tml0FWJpPqZ', '0', '0', '0', '0', null, '0');
INSERT INTO `customer` VALUES ('6', '2323', '123123', '232323', '3', '-', '', '2', '23', null, '2021-04-16', '20:58:00', '4', null, null, null, 'QFL0OnpzYwt6hjY62FgbbL', '0', '0', '0', '0', '1', '1');
INSERT INTO `customer` VALUES ('7', '55555555', '1234', '0821684717', '2', '-', '', '1', '123456', null, '2021-04-16', '21:57:00', '', null, null, null, 'kjA8s4eFTtNKrv0pz7fnAW', '0', '0', '0', '0', null, '0');
INSERT INTO `customer` VALUES ('8', 'trhtr', 'srsrer', '', '2', '-', '', null, '', null, '2021-04-16', '00:03:00', '3, 4', null, null, null, '-RyGzto0I_wEOoIr4fF6BW', '0', '0', '0', '0', null, '0');
INSERT INTO `customer` VALUES ('9', '5545534545', '12121212', '0821684717', '1', 'คิมนิยม', '', null, '', null, '2021-04-17', '00:21:00', '4', null, null, null, 'UDWK-DAQc70Et3wK9u6p0B', '1', '1', '1', '0', '1', '1');
INSERT INTO `customer` VALUES ('10', '123456', 'test', '0821684717', '2', '-', 'ไม่มีการจัดส่ง', null, '123456', null, '2021-04-18', '20:18:00', '4', null, '2021-04-16 00:54:29', '2', 'cKFxaRmd48wawnBIKP6gp9', '0', '0', '0', '0', '0', '0');
INSERT INTO `customer` VALUES ('11', '1212', '12121', '121212', '2', '-', '1212', null, '1212', null, '2021-04-19', '17:43:00', '2, 3', null, '2021-04-18 17:56:04', '1', 'eqhwD2d5Ss_TqsyL9jSWdC', '0', '0', '0', '0', '0', '1');
INSERT INTO `customer` VALUES ('12', '2343432', '2334', '2343', '2', '-', '343', null, '23432', null, '2021-04-20', '17:37:00', '2, 3', null, '2021-04-18 20:13:13', '2', 'EVawA3izzajfxIR9lREUdr', '0', '0', '0', '0', '0', '1');

-- ----------------------------
-- Table structure for `department`
-- ----------------------------
DROP TABLE IF EXISTS `department`;
CREATE TABLE `department` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `department` varchar(255) DEFAULT NULL COMMENT 'แผนก',
  `active` int(1) DEFAULT '1' COMMENT '1 = ใช้งาน 0 = ไม่ใช้งาน',
  `description` varchar(255) DEFAULT NULL COMMENT 'หน้าที่',
  `icon` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of department
-- ----------------------------
INSERT INTO `department` VALUES ('1', 'รับงาน', '1', null, 'fa fa-users', 'customer');
INSERT INTO `department` VALUES ('2', 'การตลาด / ลูกค้าสัมพันธ์', '1', null, 'fa fa-tags', null);
INSERT INTO `department` VALUES ('3', 'กราฟิก', '1', null, 'fa fa-paint-brush', null);
INSERT INTO `department` VALUES ('4', 'บัญชี', '1', null, 'fa fa-usd', 'account');
INSERT INTO `department` VALUES ('5', 'งานพิมพ์', '1', null, 'fa fa-print', null);
INSERT INTO `department` VALUES ('6', 'CNC / Laser', '1', null, 'fa fa-magnet', null);
INSERT INTO `department` VALUES ('7', 'ผลิตทั่วไป', '1', null, 'fas fa-air-freshener', null);
INSERT INTO `department` VALUES ('8', 'ช่าง', '1', null, 'fa fa-wrench', null);
INSERT INTO `department` VALUES ('9', 'จัดส่ง', '1', null, 'fa fa-truck', null);

-- ----------------------------
-- Table structure for `migration`
-- ----------------------------
DROP TABLE IF EXISTS `migration`;
CREATE TABLE `migration` (
  `version` varchar(180) NOT NULL,
  `apply_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of migration
-- ----------------------------
INSERT INTO `migration` VALUES ('m000000_000000_base', '1617556826');
INSERT INTO `migration` VALUES ('m140209_132017_init', '1617556830');
INSERT INTO `migration` VALUES ('m140403_174025_create_account_table', '1617556830');
INSERT INTO `migration` VALUES ('m140504_113157_update_tables', '1617556831');
INSERT INTO `migration` VALUES ('m140504_130429_create_token_table', '1617556831');
INSERT INTO `migration` VALUES ('m140830_171933_fix_ip_field', '1617556831');
INSERT INTO `migration` VALUES ('m140830_172703_change_account_table_name', '1617556831');
INSERT INTO `migration` VALUES ('m141222_110026_update_ip_field', '1617556831');
INSERT INTO `migration` VALUES ('m141222_135246_alter_username_length', '1617556831');
INSERT INTO `migration` VALUES ('m150614_103145_update_social_account_table', '1617556831');
INSERT INTO `migration` VALUES ('m150623_212711_fix_username_notnull', '1617556831');
INSERT INTO `migration` VALUES ('m151218_234654_add_timezone_to_profile', '1617556831');
INSERT INTO `migration` VALUES ('m160929_103127_add_last_login_at_to_user_table', '1617556832');

-- ----------------------------
-- Table structure for `privilege`
-- ----------------------------
DROP TABLE IF EXISTS `privilege`;
CREATE TABLE `privilege` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `edit_project` int(1) DEFAULT '0' COMMENT 'แก้ไขรายละเอียดงาน 0 = ไม่มีสิทธิ์ 1 = มีสิทธิ์',
  `notify_customer` int(1) DEFAULT '0' COMMENT 'แจ้งงานลูกค้าทราบ 0 = ไม่มีสิทิ์ 1 = มีสิทธิ์',
  `edit_tranfer` int(1) DEFAULT '0' COMMENT 'ข้อมูลการจัดส่ง 0 = ไม่มีสิทธิ์ 1 = มีสิทธิ์',
  `approve` int(1) DEFAULT '0' COMMENT 'สิทธิ์ยืนยันงาน 0 = ไม่มีสิทธิ์ 1 = มีสิทธิ์',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='สิทธิ์การใช้งาน';

-- ----------------------------
-- Records of privilege
-- ----------------------------
INSERT INTO `privilege` VALUES ('1', '5', '1', '0', '0', '0');
INSERT INTO `privilege` VALUES ('6', '6', '0', '0', '0', '0');

-- ----------------------------
-- Table structure for `profile`
-- ----------------------------
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

-- ----------------------------
-- Records of profile
-- ----------------------------
INSERT INTO `profile` VALUES ('1', null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `profile` VALUES ('2', 'ทดสอบ', null, null, null, null, null, '', null, '0800260943', null, null, 'ทดสอบ');
INSERT INTO `profile` VALUES ('3', 'demo demo', '', '', 'd41d8cd98f00b204e9800998ecf8427e', '', '', '', null, null, null, null, null);
INSERT INTO `profile` VALUES ('5', 'demo demo', null, null, null, null, null, '', null, '0800260943', null, null, 'test');
INSERT INTO `profile` VALUES ('6', 'kimniyom', null, null, null, null, null, 'ทำงานด้านออกแบบ', null, '0821684717', null, null, 'kang');

-- ----------------------------
-- Table structure for `rule`
-- ----------------------------
DROP TABLE IF EXISTS `rule`;
CREATE TABLE `rule` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `department_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `active` int(1) DEFAULT '1' COMMENT '0 = ไม่ใช้งาน  1 = ใช้งาน',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COMMENT='สิทธิ์การเข้าถึงแผนก';

-- ----------------------------
-- Records of rule
-- ----------------------------
INSERT INTO `rule` VALUES ('4', '1', '3', '1');
INSERT INTO `rule` VALUES ('5', '2', '3', '1');
INSERT INTO `rule` VALUES ('6', '1', '5', '1');
INSERT INTO `rule` VALUES ('9', '1', '1', '1');
INSERT INTO `rule` VALUES ('10', '2', '1', '1');
INSERT INTO `rule` VALUES ('11', '4', '1', '1');
INSERT INTO `rule` VALUES ('12', '3', '1', '1');
INSERT INTO `rule` VALUES ('13', '5', '1', '1');
INSERT INTO `rule` VALUES ('14', '6', '1', '1');
INSERT INTO `rule` VALUES ('15', '7', '1', '1');
INSERT INTO `rule` VALUES ('16', '8', '1', '1');
INSERT INTO `rule` VALUES ('17', '9', '1', '1');
INSERT INTO `rule` VALUES ('18', '1', '2', '1');
INSERT INTO `rule` VALUES ('19', '2', '2', '1');
INSERT INTO `rule` VALUES ('20', '3', '2', '1');
INSERT INTO `rule` VALUES ('21', '4', '2', '1');
INSERT INTO `rule` VALUES ('22', '5', '2', '1');

-- ----------------------------
-- Table structure for `social_account`
-- ----------------------------
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

-- ----------------------------
-- Records of social_account
-- ----------------------------

-- ----------------------------
-- Table structure for `timeline`
-- ----------------------------
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of timeline
-- ----------------------------
INSERT INTO `timeline` VALUES ('1', null, 'eqhwD2d5Ss_TqsyL9jSWdC', '1', '1', 'บันทึกข้อมูลการรับงาน', '2021-04-18 17:56:04', 'การตลาด / ลูกค้าสัมพันธ์,กราฟิก');
INSERT INTO `timeline` VALUES ('2', null, 'EVawA3izzajfxIR9lREUdr', '1', '2', 'บันทึกข้อมูลการรับงาน', '2021-04-18 20:13:13', 'การตลาด / ลูกค้าสัมพันธ์,กราฟิก');
INSERT INTO `timeline` VALUES ('21', null, 'M3WXmZ9MvqSupx-IMQMhhy', '1', '1', 'บันทึกข้อมูลการรับงาน', '2021-04-19 00:19:24', 'บัญชี');
INSERT INTO `timeline` VALUES ('22', null, 'UDWK-DAQc70Et3wK9u6p0B', '1', '1', 'บันทึกข้อมูลการรับงาน', '2021-04-19 00:47:21', 'บัญชี');
INSERT INTO `timeline` VALUES ('23', null, 'QFL0OnpzYwt6hjY62FgbbL', '1', '1', 'บันทึกข้อมูลการรับงาน', '2021-04-19 00:47:55', 'บัญชี');

-- ----------------------------
-- Table structure for `token`
-- ----------------------------
DROP TABLE IF EXISTS `token`;
CREATE TABLE `token` (
  `user_id` int(11) NOT NULL,
  `code` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` int(11) NOT NULL,
  `type` smallint(6) NOT NULL,
  UNIQUE KEY `token_unique` (`user_id`,`code`,`type`),
  CONSTRAINT `fk_user_token` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of token
-- ----------------------------
INSERT INTO `token` VALUES ('1', 'tlftZ3ffWRyuYHSUCJ-x3YF0glWGHZBL', '1617557092', '0');

-- ----------------------------
-- Table structure for `uploads`
-- ----------------------------
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
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of uploads
-- ----------------------------
INSERT INTO `uploads` VALUES ('1', null, '170187.jpg', '596947710099ad49e5fa9257646574ae.jpg', '2021-04-15 20:18:17', null, null, null);
INSERT INTO `uploads` VALUES ('2', null, '121716693-testdrug.png', '598a56fa2b2fed382aa8bdab7315f687.png', '2021-04-15 20:44:09', null, null, null);
INSERT INTO `uploads` VALUES ('3', '', '121716693-testdrug.png', 'dd3660eff521da4402f327a08d5237b6.png', '2021-04-15 20:48:37', null, null, null);
INSERT INTO `uploads` VALUES ('4', 'Xb3SesqT3v_Tml0FWJpPqZ', 'RawQ-Android.png', '2708667e5e64744b7197d233402e80da.png', '2021-04-15 20:57:03', null, null, null);
INSERT INTO `uploads` VALUES ('5', 'Xb3SesqT3v_Tml0FWJpPqZ', 'business-infographic-step-flat-simple-template-design-black-background-business-infographic-step-flat-black-142414283.jpg', '48d8a014663659ff05819c52262c6ff2.jpg', '2021-04-15 20:57:50', null, null, null);
INSERT INTO `uploads` VALUES ('6', 'QFL0OnpzYwt6hjY62FgbbL', 'fancy_uikit_12.jpg', '402148fc3fccdb697c099031e3d4a0f5.jpg', '2021-04-15 20:59:19', null, null, null);
INSERT INTO `uploads` VALUES ('7', 'QFL0OnpzYwt6hjY62FgbbL', 'ipad1.jpg', 'b375f8105ff5b096a3a54c5505ee77ac.jpg', '2021-04-15 21:26:36', null, null, null);
INSERT INTO `uploads` VALUES ('10', 'kjA8s4eFTtNKrv0pz7fnAW', 'คู่มือติดตั้ง  Application Tak Covid-19 Tracking.pdf', 'fa844a55dc00cef96ee9f843da2d3082.pdf', '2021-04-15 22:02:50', null, null, null);
INSERT INTO `uploads` VALUES ('11', 'BmpfVnSz5jde7zyEgMYQtf', 'S__26427412.jpg', '3bfb24cdc1c76eeb4090df0e42fc2027.jpg', '2021-04-15 23:52:02', null, null, null);
INSERT INTO `uploads` VALUES ('12', 'KAyxp3AvB4R-kt8dYvzGzi', 'S__26427413.jpg', '36dc90643ee75c7874277bbdb13cdd97.jpg', '2021-04-15 23:56:12', null, null, null);
INSERT INTO `uploads` VALUES ('13', 'KAyxp3AvB4R-kt8dYvzGzi', 'S__26427413.jpg', '29b20a360b7838d7517cc886f2680cf1.jpg', '2021-04-15 23:56:27', null, null, null);
INSERT INTO `uploads` VALUES ('14', 'UDWK-DAQc70Et3wK9u6p0B', 'Build-ionic.txt', '28a0b627b8dcce1b96028d9f11645392.txt', '2021-04-16 00:51:10', null, null, null);
INSERT INTO `uploads` VALUES ('15', 'cKFxaRmd48wawnBIKP6gp9', 'main-kstudio.jpg', '87bdd1b615f008b7320a750752b7fcaf.jpg', '2021-04-18 00:25:45', null, null, null);
INSERT INTO `uploads` VALUES ('16', 'cKFxaRmd48wawnBIKP6gp9', 'icon-l.png', '746230aa8bf8d8eb259cebe8b4daa622.png', '2021-04-18 01:20:45', null, null, null);
INSERT INTO `uploads` VALUES ('17', 'cKFxaRmd48wawnBIKP6gp9', '170187.jpg', '0f42c3a7a4c2115cdadb02aa3f87d875.jpg', '2021-04-18 01:23:25', null, null, null);
INSERT INTO `uploads` VALUES ('21', 'cKFxaRmd48wawnBIKP6gp9', 'คู่มือติดตั้ง  Application Tak Covid-19 Tracking.pdf', '36511bfd0bd56c8be10e022e1e56309c.pdf', '2021-04-18 17:14:28', null, null, '2');
INSERT INTO `uploads` VALUES ('22', 'cKFxaRmd48wawnBIKP6gp9', 'mikedonovandesign-ui-kit-flat-dark.png', 'c6acaf65738808e7996ca1f293893926.png', '2021-04-18 17:15:00', null, null, '1');
INSERT INTO `uploads` VALUES ('23', 'M3WXmZ9MvqSupx-IMQMhhy', 'RawQ-Android.png', 'b11b0343ea88712704aa4461722d7ba0.png', '2021-04-19 00:19:24', null, null, '1');

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'admin', 'kimniyomclub@gmail.com', '$2y$12$MenOVpHsMKOW0zYIFAD1ruqkamrLlEG1YIkcKOD9/eGmR9ECXzzsO', 'eVObZ98v26jv2RAmbdeUIlaHK4uJ8S-8', '1617557741', null, null, '::1', '1617557092', '1617557092', '0', '1618758147', 'A');
INSERT INTO `user` VALUES ('2', 'demo', 'demo@gmail.com', '$2y$12$xLtGys.g2KKktF2/5Ytruu0VkWh2oYdHiDACmKztM.gWkzNS.QugC', 'plDiCAlz6oFWCndrv4WHPeObSu1Ucf5-', '1617559566', null, null, '::1', '1617559566', '1617989452', '0', '1618728642', 'U');
INSERT INTO `user` VALUES ('3', 'test', 'test@gmail.com', '$2y$12$xigkYiCrgq0WBx99U9.AHeesTmAPlVvs4DBzo7TTv5hHu0/PJAGEC', 'xarpZbvmW6kRpH6_7L8DLCjo_nv8HBum', '1617640742', null, null, '::1', '1617640742', '1617640783', '0', null, 'A');
INSERT INTO `user` VALUES ('5', 'pdk', 'pdk@gmail.com', '$2y$12$L23eye2iC9BD5gYlCIr30u6AujEdO6J/.dZK55XlM56Jl5au9PHxq', '-GYruuDz28hFZZFRm0HbtzO9vwWI2MVC', '1617990517', null, null, '::1', '1617990517', '1617990517', '0', null, 'U');
INSERT INTO `user` VALUES ('6', 'kimniyom', '123@gmail.com', '$2y$12$NL13psXOId80ykwkmNYdte/GXhrd/jXsHNms.WpWO.N6O6fVnAS42', 'b3uR2qjlXICxPVN7h-FDBTWMUON8R7v0', '1618703595', null, null, '::1', '1618703595', '1618703595', '0', '1618704003', 'U');
