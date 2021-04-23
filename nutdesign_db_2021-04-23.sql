/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50726
 Source Host           : localhost:3306
 Source Schema         : nutdesign_db

 Target Server Type    : MySQL
 Target Server Version : 50726
 File Encoding         : 65001

 Date: 23/04/2021 02:09:26
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for account
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
  `file` varchar(255) DEFAULT NULL COMMENT 'แนบใบเสนอราคา',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='ตารางแผนกบัญชี';

-- ----------------------------
-- Records of account
-- ----------------------------
BEGIN;
INSERT INTO `account` VALUES (1, NULL, 'M3WXmZ9MvqSupx-IMQMhhy', '', NULL, 6, NULL, 1, 0, '2021-04-22 11:45:30', '2021-04-22 11:45:30', 'ส่งแผนกกราฟิก', '516bc47987d3df33c72a5880390ae3c1.pdf');
INSERT INTO `account` VALUES (2, NULL, 'EVawA3izzajfxIR9lREUdr', NULL, NULL, NULL, NULL, 2, 0, NULL, '2021-04-23 02:07:00', NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for customer
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
  `outside` int(1) DEFAULT '0' COMMENT '1 = ส่งผลิตนอกร้าน',
  `mascancel` int(3) DEFAULT NULL COMMENT 'รหัสยกเลิกงาน',
  `canceletc` varchar(255) DEFAULT NULL COMMENT 'สาเหตุอื่น ที่ยกเลิกงาน',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of customer
-- ----------------------------
BEGIN;
INSERT INTO `customer` VALUES (2, 'โล่รางวัลงานวิ่ง', 'สำนักงานสาธารณสุขจังหวัดตาก', '0821684717', 3, '-', '165 หมู่ 7 ตำบลไม้งาม อ เมือง จ ตาก 63000', 2, 'โล่ต้องการไม่ซ้ำที่อื่น', NULL, '2021-04-30', '13:10:00', '3,4', NULL, '2021-04-18 09:38:54', NULL, 'M3WXmZ9MvqSupx-IMQMhhy', 0, 0, 0, 0, 1, 1, 0, NULL, NULL);
INSERT INTO `customer` VALUES (5, 'gggg', 'gggggg', '0821684717', 2, '-', '', 2, 'gggg', NULL, '2021-04-22', '20:56:00', '4', NULL, '2021-04-19 09:38:59', NULL, 'Xb3SesqT3v_Tml0FWJpPqZ', 0, 0, 0, 2, 1, 1, 0, 99, 'ลงรายการผิด');
INSERT INTO `customer` VALUES (6, '2323', '123123', '232323', 3, '-', '', 2, '23', NULL, '2021-04-16', '20:58:00', '4', NULL, '2021-04-18 09:39:05', NULL, 'QFL0OnpzYwt6hjY62FgbbL', 0, 0, 0, 0, 1, 1, 0, NULL, NULL);
INSERT INTO `customer` VALUES (7, '55555555', '1234', '0821684717', 2, '-', '', 1, '123456', NULL, '2021-04-16', '21:57:00', '3,4', NULL, NULL, NULL, 'kjA8s4eFTtNKrv0pz7fnAW', 0, 0, 0, 0, 1, 1, 0, NULL, NULL);
INSERT INTO `customer` VALUES (8, 'trhtr', 'srsrer', '', 2, '-', '', NULL, '', NULL, '2021-04-16', '00:03:00', '3, 4', NULL, NULL, NULL, '-RyGzto0I_wEOoIr4fF6BW', 0, 0, 0, 0, NULL, 0, 0, NULL, NULL);
INSERT INTO `customer` VALUES (9, '5545534545', '12121212', '0821684717', 1, 'คิมนิยม', '', NULL, '', NULL, '2021-04-17', '00:21:00', '4', NULL, NULL, NULL, 'UDWK-DAQc70Et3wK9u6p0B', 1, 1, 1, 0, 1, 1, 0, NULL, NULL);
INSERT INTO `customer` VALUES (10, 'ทำป้าย', 'test', '0821684717', 2, '-', 'ไม่มีการจัดส่ง', NULL, '123456', NULL, '2021-04-18', '20:18:00', '4', NULL, '2021-04-16 00:54:29', 2, 'cKFxaRmd48wawnBIKP6gp9', 0, 0, 0, 2, 1, 1, 0, NULL, NULL);
INSERT INTO `customer` VALUES (11, '1212', '12121', '121212', 2, '-', '1212', NULL, '1212', NULL, '2021-04-19', '17:43:00', '4', NULL, '2021-04-18 17:56:04', 1, 'eqhwD2d5Ss_TqsyL9jSWdC', 0, 0, 0, 0, 0, 1, 0, NULL, NULL);
INSERT INTO `customer` VALUES (12, ' แผ่นพับ', 'คุณน้อย', '0822191019', 1, 'ID Noie1213', '', NULL, 'แผ่นพับขนาด A 4 3 ทบ', NULL, '2021-04-22', '11:37:00', '3,4', NULL, '2021-04-18 20:13:13', 2, 'EVawA3izzajfxIR9lREUdr', 0, 0, 0, 2, 1, 1, 0, 2, '');
INSERT INTO `customer` VALUES (13, 'ป้ายตั้งโต๊ะ 10 ป้าย', 'ทรงพล คำสะอาด', '0821684717', 2, '-', 'สสจ.ตาก', NULL, 'ป้ายตั้งโต๊ะพื้นหลังสีน้ำเงิน\r\nป้ายไม้', NULL, '2021-04-21', '12:23:00', '4', NULL, '2021-04-19 16:25:02', 1, '5GUUxMgM-wXJFSbGtXW2WO', 0, 0, 0, 0, 1, 1, 0, NULL, NULL);
INSERT INTO `customer` VALUES (14, 'ป้ายไวนิล ยาว 8 กว้าง 2.5 เมตร', 'คุณมานะ', '0800260265', 1, 'Mana', 'ป่าไม้', NULL, 'ป้ายไวนิล ยาว 8 กว้าง 2.5 เมตร', NULL, '2021-04-29', '16:00:00', '4', NULL, '2021-04-20 15:17:12', 2, 'iaEY0EcmD4yUAgS39owt6t', 0, 0, 0, 0, 1, 1, 0, NULL, NULL);
INSERT INTO `customer` VALUES (15, '111111111111111111', '123123', '0800282928', 2, '-', 'sfsdf', NULL, '111', NULL, '2021-04-28', '14:32:00', '4', NULL, '2021-04-21 14:33:23', 1, 'Ffp9smFEE67GpADRHNnqii', 0, 0, 0, 0, 1, 1, 0, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for department
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
BEGIN;
INSERT INTO `department` VALUES (1, 'รับงาน / คุยงาน', 1, NULL, 'fa fa-users', 'customer/index');
INSERT INTO `department` VALUES (2, 'การตลาด / ลูกค้าสัมพันธ์', 0, NULL, 'fa fa-tags', NULL);
INSERT INTO `department` VALUES (3, 'กราฟิก', 1, NULL, 'fa fa-paint-brush', 'graphic/index');
INSERT INTO `department` VALUES (4, 'บัญชี', 1, NULL, 'fa fa-usd', 'account/index');
INSERT INTO `department` VALUES (5, 'งานพิมพ์', 0, NULL, 'fa fa-print', NULL);
INSERT INTO `department` VALUES (6, 'CNC / Laser', 0, NULL, 'fa fa-magnet', NULL);
INSERT INTO `department` VALUES (7, 'ผลิตทั่วไป', 0, NULL, 'fas fa-air-freshener', NULL);
INSERT INTO `department` VALUES (8, 'ช่าง / ติดตั้ง', 0, NULL, 'fa fa-wrench', NULL);
INSERT INTO `department` VALUES (9, 'จัดส่ง', 0, NULL, 'fa fa-truck', NULL);
COMMIT;

-- ----------------------------
-- Table structure for graphic
-- ----------------------------
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='ตารางแผนกกราฟิก';

-- ----------------------------
-- Records of graphic
-- ----------------------------
BEGIN;
INSERT INTO `graphic` VALUES (1, 'M3WXmZ9MvqSupx-IMQMhhy', NULL, '<p>โล่รางวัล</p><ul><li>ขนาด สูง 20 นิ้ว กว้างฐาน 10 x 10</li><li>ฐานเป็นไม้</li></ul>', '', 'g1vP0emhkg7BNXagOS9zrl', 1, NULL, 1, 0, '2021-04-22 14:17:53', '2021-04-22 14:17:53', 1, '');
INSERT INTO `graphic` VALUES (2, 'EVawA3izzajfxIR9lREUdr', NULL, NULL, '', '', NULL, NULL, 2, 0, NULL, '2021-04-23 02:07:00', 1, NULL);
COMMIT;

-- ----------------------------
-- Table structure for graphic_log
-- ----------------------------
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

-- ----------------------------
-- Table structure for mascancel
-- ----------------------------
DROP TABLE IF EXISTS `mascancel`;
CREATE TABLE `mascancel` (
  `id` int(3) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL COMMENT 'สาเหตุยกเลิกงาน',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='ตารางสาเหตุการยกเลิกงาน';

-- ----------------------------
-- Records of mascancel
-- ----------------------------
BEGIN;
INSERT INTO `mascancel` VALUES (1, 'ติดต่อลูกค้าไม่ได้');
INSERT INTO `mascancel` VALUES (2, 'ผลิตไม่ทัน');
INSERT INTO `mascancel` VALUES (3, 'ลูกค้าไม่ตกลงซื้อ');
COMMIT;

-- ----------------------------
-- Table structure for migration
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
BEGIN;
INSERT INTO `migration` VALUES ('m000000_000000_base', 1617556826);
INSERT INTO `migration` VALUES ('m140209_132017_init', 1617556830);
INSERT INTO `migration` VALUES ('m140403_174025_create_account_table', 1617556830);
INSERT INTO `migration` VALUES ('m140504_113157_update_tables', 1617556831);
INSERT INTO `migration` VALUES ('m140504_130429_create_token_table', 1617556831);
INSERT INTO `migration` VALUES ('m140830_171933_fix_ip_field', 1617556831);
INSERT INTO `migration` VALUES ('m140830_172703_change_account_table_name', 1617556831);
INSERT INTO `migration` VALUES ('m141222_110026_update_ip_field', 1617556831);
INSERT INTO `migration` VALUES ('m141222_135246_alter_username_length', 1617556831);
INSERT INTO `migration` VALUES ('m150614_103145_update_social_account_table', 1617556831);
INSERT INTO `migration` VALUES ('m150623_212711_fix_username_notnull', 1617556831);
INSERT INTO `migration` VALUES ('m151218_234654_add_timezone_to_profile', 1617556831);
INSERT INTO `migration` VALUES ('m160929_103127_add_last_login_at_to_user_table', 1617556832);
COMMIT;

-- ----------------------------
-- Table structure for privilege
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='สิทธิ์การใช้งาน';

-- ----------------------------
-- Records of privilege
-- ----------------------------
BEGIN;
INSERT INTO `privilege` VALUES (1, 5, 1, 0, 0, 0);
INSERT INTO `privilege` VALUES (6, 6, 0, 0, 0, 0);
INSERT INTO `privilege` VALUES (7, 1, 1, 1, 1, 0);
COMMIT;

-- ----------------------------
-- Table structure for profile
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
BEGIN;
INSERT INTO `profile` VALUES (1, 'admin', NULL, NULL, NULL, NULL, NULL, '', NULL, '0821684717', NULL, NULL, 'A');
INSERT INTO `profile` VALUES (2, 'ทดสอบ', NULL, NULL, NULL, NULL, NULL, '', NULL, '0800260943', NULL, NULL, 'ทดสอบ');
INSERT INTO `profile` VALUES (3, 'demo demo', '', '', 'd41d8cd98f00b204e9800998ecf8427e', '', '', '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `profile` VALUES (5, 'demo demo', NULL, NULL, NULL, NULL, NULL, '', NULL, '0800260943', NULL, NULL, 'test');
INSERT INTO `profile` VALUES (6, 'kimniyom', NULL, NULL, NULL, NULL, NULL, 'ทำงานด้านออกแบบ', NULL, '0821684717', NULL, NULL, 'kang');
COMMIT;

-- ----------------------------
-- Table structure for rule
-- ----------------------------
DROP TABLE IF EXISTS `rule`;
CREATE TABLE `rule` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `department_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `active` int(1) DEFAULT '1' COMMENT '0 = ไม่ใช้งาน  1 = ใช้งาน',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COMMENT='สิทธิ์การเข้าถึงแผนก';

-- ----------------------------
-- Records of rule
-- ----------------------------
BEGIN;
INSERT INTO `rule` VALUES (4, 1, 3, 1);
INSERT INTO `rule` VALUES (5, 2, 3, 1);
INSERT INTO `rule` VALUES (9, 1, 1, 1);
INSERT INTO `rule` VALUES (10, 2, 1, 1);
INSERT INTO `rule` VALUES (11, 4, 1, 1);
INSERT INTO `rule` VALUES (13, 5, 1, 1);
INSERT INTO `rule` VALUES (14, 6, 1, 1);
INSERT INTO `rule` VALUES (15, 7, 1, 1);
INSERT INTO `rule` VALUES (16, 8, 1, 1);
INSERT INTO `rule` VALUES (17, 9, 1, 1);
INSERT INTO `rule` VALUES (18, 1, 2, 1);
INSERT INTO `rule` VALUES (19, 2, 2, 1);
INSERT INTO `rule` VALUES (20, 3, 2, 1);
INSERT INTO `rule` VALUES (22, 5, 2, 1);
INSERT INTO `rule` VALUES (23, 3, 1, 1);
INSERT INTO `rule` VALUES (24, 4, 6, 1);
COMMIT;

-- ----------------------------
-- Table structure for social_account
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
-- Table structure for timeline
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
  `flag` int(1) DEFAULT '0' COMMENT '0 = กำลังผลิต 1 = Success 2 = Cancel',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of timeline
-- ----------------------------
BEGIN;
INSERT INTO `timeline` VALUES (8, NULL, 'EVawA3izzajfxIR9lREUdr', 1, 2, 'บันทึกข้อมูลการรับงาน', '2021-04-22 14:02:54', 'กราฟิก,บัญชี', 0);
INSERT INTO `timeline` VALUES (9, NULL, 'M3WXmZ9MvqSupx-IMQMhhy', 1, 1, 'บันทึกข้อมูลการรับงาน', '2021-04-22 14:17:19', 'กราฟิก,บัญชี', 0);
INSERT INTO `timeline` VALUES (10, NULL, 'M3WXmZ9MvqSupx-IMQMhhy', 3, 1, 'กราฟิก / ออกแบบ', '2021-04-22 14:17:53', 'กราฟิก(รับงาน)', 0);
INSERT INTO `timeline` VALUES (11, NULL, 'Xb3SesqT3v_Tml0FWJpPqZ', 1, 1, 'ยกเลิกงาน', '2021-04-22 18:56:00', 'ยกเลิกงาน', 2);
INSERT INTO `timeline` VALUES (12, NULL, 'EVawA3izzajfxIR9lREUdr', 1, 1, 'ยกเลิกงาน', '2021-04-22 19:07:00', 'ยกเลิกงาน', 2);
COMMIT;

-- ----------------------------
-- Table structure for token
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
BEGIN;
INSERT INTO `token` VALUES (1, 'tlftZ3ffWRyuYHSUCJ-x3YF0glWGHZBL', 1617557092, 0);
COMMIT;

-- ----------------------------
-- Table structure for uploads
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for user
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
BEGIN;
INSERT INTO `user` VALUES (1, 'admin', 'kimniyomclub@gmail.com', '$2y$12$MenOVpHsMKOW0zYIFAD1ruqkamrLlEG1YIkcKOD9/eGmR9ECXzzsO', 'eVObZ98v26jv2RAmbdeUIlaHK4uJ8S-8', 1617557741, NULL, NULL, '::1', 1617557092, 1617557092, 0, 1619108803, 'A');
INSERT INTO `user` VALUES (2, 'demo', 'demo@gmail.com', '$2y$12$ScVrSZM1VaIdB7rwZBAuK.SgNSPj8zvXPIO2n5jR.pHnw4EWjCWJ.', 'plDiCAlz6oFWCndrv4WHPeObSu1Ucf5-', 1617559566, NULL, NULL, '::1', 1617559566, 1618997823, 0, 1619109937, 'U');
INSERT INTO `user` VALUES (3, 'test', 'test@gmail.com', '$2y$12$xigkYiCrgq0WBx99U9.AHeesTmAPlVvs4DBzo7TTv5hHu0/PJAGEC', 'xarpZbvmW6kRpH6_7L8DLCjo_nv8HBum', 1617640742, NULL, NULL, '::1', 1617640742, 1617640783, 0, NULL, 'A');
INSERT INTO `user` VALUES (5, 'pdk', 'pdk@gmail.com', '$2y$12$L23eye2iC9BD5gYlCIr30u6AujEdO6J/.dZK55XlM56Jl5au9PHxq', '-GYruuDz28hFZZFRm0HbtzO9vwWI2MVC', 1617990517, NULL, NULL, '::1', 1617990517, 1617990517, 0, NULL, 'U');
INSERT INTO `user` VALUES (6, 'kimniyom', '123@gmail.com', '$2y$12$NL13psXOId80ykwkmNYdte/GXhrd/jXsHNms.WpWO.N6O6fVnAS42', 'b3uR2qjlXICxPVN7h-FDBTWMUON8R7v0', 1618703595, NULL, NULL, '::1', 1618703595, 1618703595, 0, 1619066604, 'U');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;