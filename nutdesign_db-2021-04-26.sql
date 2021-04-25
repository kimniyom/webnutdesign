/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50531
Source Host           : localhost:3306
Source Database       : nutdesign_db

Target Server Type    : MYSQL
Target Server Version : 50531
File Encoding         : 65001

Date: 2021-04-26 03:28:48
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
  `file` varchar(255) DEFAULT NULL COMMENT 'แนบใบเสนอราคา',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='ตารางแผนกบัญชี';

-- ----------------------------
-- Records of account
-- ----------------------------
INSERT INTO `account` VALUES ('1', null, 'M3WXmZ9MvqSupx-IMQMhhy', '', null, '6', null, '2', '0', '2021-04-22 11:45:30', '2021-04-23 23:02:09', 'ส่งแผนกกราฟิก', '516bc47987d3df33c72a5880390ae3c1.pdf');
INSERT INTO `account` VALUES ('2', null, 'EVawA3izzajfxIR9lREUdr', null, null, null, null, '2', '0', null, '2021-04-23 02:07:00', null, null);
INSERT INTO `account` VALUES ('3', null, '-RyGzto0I_wEOoIr4fF6BW', '', null, '1', null, '2', '0', '2021-04-23 12:07:35', '2021-04-23 23:02:36', 'ทดสอบออกใบเสนอราคา', '275166c5bd1d27a2ceacafd5260e1a05.pdf');
INSERT INTO `account` VALUES ('4', null, 'QFL0OnpzYwt6hjY62FgbbL', '', null, '1', null, '2', '0', '2021-04-23 16:51:20', '2021-04-23 23:02:18', '', '53f82cd3dafc30fd973a3b21ca25342b.pdf');
INSERT INTO `account` VALUES ('5', null, 'kjA8s4eFTtNKrv0pz7fnAW', null, null, null, null, '2', '0', null, '2021-04-23 23:02:27', null, null);
INSERT INTO `account` VALUES ('6', null, 'iaEY0EcmD4yUAgS39owt6t', null, null, null, null, '2', '0', null, '2021-04-23 23:03:01', null, null);
INSERT INTO `account` VALUES ('7', null, 'kLcYl1xutvs4w9IwAX7cov', null, null, '1', null, '1', '0', '2021-04-25 23:58:43', '2021-04-25 23:58:43', '<p>ทดสอบส่งไปบัญชี</p>', null);
INSERT INTO `account` VALUES ('8', null, 'QdZJar3nEGX29yFlmRp4tt', null, null, '1', null, '1', '0', '2021-04-24 16:35:43', '2021-04-24 16:35:43', '<p>ใบเสนอราคาบัตรคิว</p>', null);
INSERT INTO `account` VALUES ('9', null, '-rwb3A8KYS0dTuDWZc4DRT', null, null, '1', null, '1', '0', '2021-04-25 23:57:40', '2021-04-25 23:57:40', '<p>ออกใบเสนอราคาแล้ว</p>', null);
INSERT INTO `account` VALUES ('10', null, 'CH-65aQi1QVCFyaTkdQk5F', null, null, '1', null, '1', '0', '2021-04-24 02:38:30', '2021-04-24 02:38:30', '<ul><li><a href=\"/webnutdesign/web/uploads/1/08ed03a192-qt2021030094-2-64.pdf\" target=\"_blank\">ใบเสนอราคา QT2021030094 วารสาร</a></li><li><a href=\"https://doc-api.flowaccount.com/quotation/share/html/th/alm0qxppbk24ykqcxmh4ra ใบเสนอราคา QT2021030095 แผ่นพับ https://doc-api.flowaccount.com/quotation/share/html/th/m2fi9avequiae49ospdja\" target=\"_blank\"><span style=\"color: rgb(73, 68, 41);\"></span>QT2021030094</a></li></ul><p><br></p>', null);

-- ----------------------------
-- Table structure for `branchfacture`
-- ----------------------------
DROP TABLE IF EXISTS `branchfacture`;
CREATE TABLE `branchfacture` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ref` varchar(50) DEFAULT NULL COMMENT 'รหัสอ้างอิง',
  `user_id` int(3) DEFAULT NULL COMMENT 'ผู้รับงาน',
  `status` int(1) DEFAULT '1' COMMENT 'สถานะ 1 ยังไม่รับงาน 2 รับงานกำลังผลิต 3  ส่งแก้ไขงาน 4 ผลิตเสร็จแล้ว',
  `flag` int(1) DEFAULT '0' COMMENT '0 = NoApprove 1 = Approve 2 =  Cancel',
  `create_date` timestamp NULL DEFAULT NULL,
  `confirm_date` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='งานผลิตทั่วไป';

-- ----------------------------
-- Records of branchfacture
-- ----------------------------
INSERT INTO `branchfacture` VALUES ('1', '-rwb3A8KYS0dTuDWZc4DRT', '1', '2', '0', '2021-04-26 03:26:30', null);

-- ----------------------------
-- Table structure for `branchlaser`
-- ----------------------------
DROP TABLE IF EXISTS `branchlaser`;
CREATE TABLE `branchlaser` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '0 = NoApprove 1 = Approve 2 =  Cancel',
  `ref` varchar(50) DEFAULT NULL COMMENT 'รหัสอ้างอิง',
  `user_id` int(3) DEFAULT NULL COMMENT 'ผู้รับงาน',
  `status` int(1) DEFAULT '1' COMMENT 'สถานะ 1 ยังไม่รับงาน 2 รับงานกำลังผลิต 3  ส่งแก้ไขงาน 4 ผลิตเสร็จแล้ว',
  `flag` int(1) DEFAULT '0' COMMENT '0 = NoApprove 1 = Approve 2 =  Cancel',
  `create_date` timestamp NULL DEFAULT NULL COMMENT 'วันที่รับงาน',
  `confirm_date` timestamp NULL DEFAULT NULL COMMENT 'วันที่ผลิตงานเสร็จ',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='งาน laser';

-- ----------------------------
-- Records of branchlaser
-- ----------------------------
INSERT INTO `branchlaser` VALUES ('4', 'kLcYl1xutvs4w9IwAX7cov', '1', '4', '0', '2021-04-26 03:01:58', '2021-04-26 03:03:50');
INSERT INTO `branchlaser` VALUES ('5', '-rwb3A8KYS0dTuDWZc4DRT', '1', '2', '0', '2021-04-26 03:02:45', null);

-- ----------------------------
-- Table structure for `branchprint`
-- ----------------------------
DROP TABLE IF EXISTS `branchprint`;
CREATE TABLE `branchprint` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ref` varchar(50) DEFAULT NULL COMMENT 'รหัสอ้างอิง',
  `user_id` int(3) DEFAULT NULL COMMENT 'ผู้รับงาน',
  `status` int(1) DEFAULT '1' COMMENT 'สถานะ 1 ยังไม่รับงาน 2 รับงานกำลังผลิต 3  ส่งแก้ไขงาน 4 ผลิตเสร็จแล้ว',
  `flag` int(1) DEFAULT '0' COMMENT '0 = NoApprove 1 = Approve 2 =  Cancel',
  `create_date` timestamp NULL DEFAULT NULL COMMENT 'วันที่รับงาน',
  `confirm_date` timestamp NULL DEFAULT NULL COMMENT 'วันที่ส่งงาน',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='งานพิมพ์';

-- ----------------------------
-- Records of branchprint
-- ----------------------------
INSERT INTO `branchprint` VALUES ('1', 'CH-65aQi1QVCFyaTkdQk5F', '1', '2', '0', '2021-04-25 20:54:49', null);
INSERT INTO `branchprint` VALUES ('2', 'QdZJar3nEGX29yFlmRp4tt', '5', '2', '0', '2021-04-25 21:48:11', '0000-00-00 00:00:00');
INSERT INTO `branchprint` VALUES ('8', 'kLcYl1xutvs4w9IwAX7cov', '1', '2', '0', '2021-04-26 03:00:36', null);
INSERT INTO `branchprint` VALUES ('10', '-rwb3A8KYS0dTuDWZc4DRT', null, '1', '0', null, null);

-- ----------------------------
-- Table structure for `branchtechnician`
-- ----------------------------
DROP TABLE IF EXISTS `branchtechnician`;
CREATE TABLE `branchtechnician` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ref` varchar(50) DEFAULT NULL COMMENT 'รหัสอ้างอิง',
  `user_id` int(3) DEFAULT NULL COMMENT 'ผู้รับงาน',
  `status` int(1) DEFAULT '1' COMMENT 'สถานะ 1 ยังไม่รับงาน 2 รับงานกำลังผลิต 3  ส่งแก้ไขงาน 4 ผลิตเสร็จแล้ว',
  `flag` int(1) DEFAULT '0' COMMENT '0 = NoApprove 1 = Approve 2 =  Cancel',
  `create_date` timestamp NULL DEFAULT NULL,
  `confirm_date` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='งานช่างผลิต';

-- ----------------------------
-- Records of branchtechnician
-- ----------------------------

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
  `outside` int(1) DEFAULT '0' COMMENT '1 = ส่งผลิตนอกร้าน',
  `mascancel` int(3) DEFAULT NULL COMMENT 'รหัสยกเลิกงาน',
  `canceletc` varchar(255) DEFAULT NULL COMMENT 'สาเหตุอื่น ที่ยกเลิกงาน',
  `print_status` int(1) DEFAULT '0' COMMENT 'แผนกพิมพ์ 0 = ไม่ผลิต 1 = ผลิตยังไม่เสร็จ 2 = ผลิตเสร็จแล้ว',
  `cnc_status` int(1) DEFAULT '0' COMMENT 'แผนก cnc/laser 0 = ไม่ผลิต 1 = ผลิตยังไม่เสร็จ 2 = ผลิตเสร็จ',
  `manufacture_status` int(1) DEFAULT '0' COMMENT 'ผลิตทั่วไป 0 = ไม่ผลิต 1 = ผลิตยังไม่เสร็จ 2 ผลิตเสร็จแล้ว',
  `technician_status` int(1) DEFAULT '0' COMMENT 'แผนกช่าง 0 ไม่ผลิต 1 = ผลิตยังไม่เสณ้จ 2 ผลิตเสร็จ',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='เก็บรายละเอียดลูกค้า / รับงาน';

-- ----------------------------
-- Records of customer
-- ----------------------------
INSERT INTO `customer` VALUES ('1', 'พิมพ์เล่มใบเสร็จ/ใบกำกับภาษี', 'Noo Nidty', '0634419442', '1', 'Noo Nidty, dIew', 'ที่อยู่ ร้าน dIew factory autoparts (ติดไอยรารีสอร์ต) โทร 080-6961466 61/17 ม.15 ต.คลองสอง อ.คลองหลวง จ.ปทุมธานี 12120', null, '<p><strong>* บิล Copy นอก บิลใบเสร็จ A5 ขนาด 21 x 14.5 cm กระดาษปอนด์ ปรูฟ ก็อปปี้นอก </strong></p><p><strong>* ใช้คาร์บอน พิมพ์ 1 สี 1 หน้า ( 1 เล่ม มี 50 ชุดๆ ละ 3 ใบ) </strong></p><p><strong><span style=\"color: rgb(12, 12, 12);\">จำนวน 5 เล่มๆ ละ 450.-</span></strong><em></em><span></span><span></span></p>', null, '2021-05-07', '10:00:00', '4', null, '2021-04-24 02:12:20', '1', 'kLcYl1xutvs4w9IwAX7cov', '1', '0', '0', '0', '1', '1', '0', null, null, '2', '2', '0', '0');
INSERT INTO `customer` VALUES ('2', 'บัตรคิว', 'ผู้กองโอ๋ศรี', '', '1', 'ผู้กองโอ๋ศรี', 'ผู้กองโอ๋ ห้อง1 ตรวจคนเข้าเมือง จ.ปทุมธานี (ตึกหลัง ห้อง1) 159 ม.7 ต.สวนพริกไทย อ.เมือง จ.ปทุมธานี 12000 โทร.084-5892266', null, '<p>บัตรคิว แผ่นพีวีซีขาวขุ่น หนา 0.4 มิล พิมพ์ยูวี พิมพ์ 4 สี 1 ด้าน ขนาด 9x9 ซม. </p><p>จำนวน 37 ชิ้น ๆ ละ 30.- </p><p><strong><span style=\"color: rgb(0, 0, 0);\">รวมเป็นเงิน 1,110.-</span></strong></p>', null, '2021-04-27', '23:00:00', '3, 4', null, '2021-04-24 02:16:59', '1', 'QdZJar3nEGX29yFlmRp4tt', '1', '0', '1', '0', '1', '1', '0', null, null, '2', '0', '0', '0');
INSERT INTO `customer` VALUES ('3', 'นามบัตรกระดาษ', 'GNAP นามบัตรใส', '0850848723 คุณแป้ง', '1', 'GNAP นามบัตรใส', 'จัดส่ง.. คุณอรวรรณ สาระ บจก อาร์ตโก อินเตอร์เนชันแนล 700/50, 52, 54 ม. 6 ต.หนองไม้แดง อ.เมืองชลบุรี จ.ชลบุรี 20000 0850848723 ค่ะ', null, '<p>งานแก้นามบัตรกระดาษ 2 แบบๆละ 100 ใบ พร้อมส่งนามบัตรพีวีซีให้ลูกค้า</p>', null, '2021-04-28', '10:17:00', '3, 4', null, '2021-04-24 02:19:01', '1', '-rwb3A8KYS0dTuDWZc4DRT', '1', '0', '1', '0', '1', '1', '0', null, null, '1', '2', '2', '0');
INSERT INTO `customer` VALUES ('4', 'วารสาร/แผ่นพับ มค.-มีค.64', 'เฟริสท์ อบจ วารสาร', '', '1', 'ฟริสท์ อบจ วารสาร', 'อบจ.ตาก', null, '<p>จัดจ้างทำวารสาร ** </p><p>จัดจ้างทำวารสาร ออกแบบพร้อมผลิตวารสาร ประจำเดือนมกราคม-มีนาคม พ.ศ.2564 รูปเล่ม </p><p>ขนาด A4 หน้าปก พิมพ์ 4 สี กระดาษอาร์ตมัน 230 แกรม +เคลือบเงา เนื้อใน พิมพ์ 4 สี กระดาษอาร์ตมัน 160 แกรม</p><p> <span style=\"color: rgb(192, 80, 77);\"><strong>จำนวน 2,600 ฉบับ</strong> </span></p><p>** ออกแบบพร้อมผลิตแผ่นพับ ประจำเดือนมกราคม - มีนาคม พ.ศ.2564 กระดาษอาร์ตมัน 130 แกรม ขนาด A4 พิมพ์ 4 สี 2 หน้า 2 พับ 3 ตอน </p><p><span style=\"color: rgb(192, 80, 77);\"><strong>จำนวน 4,000 ฉ</strong>บับ</span></p>', null, '2021-04-30', '10:19:00', '3, 4', null, '2021-04-24 02:22:23', '1', 'CH-65aQi1QVCFyaTkdQk5F', '1', '1', '1', '0', '1', '1', '0', null, null, '2', '0', '0', '0');

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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='ตารางแผนก';

-- ----------------------------
-- Records of department
-- ----------------------------
INSERT INTO `department` VALUES ('1', 'รับงาน / คุยงาน', '1', null, 'fa fa-users', 'customer/index');
INSERT INTO `department` VALUES ('2', 'การตลาด / ลูกค้าสัมพันธ์', '0', null, 'fa fa-tags', null);
INSERT INTO `department` VALUES ('3', 'กราฟิก', '1', null, 'fa fa-paint-brush', 'graphic/index');
INSERT INTO `department` VALUES ('4', 'บัญชี', '1', null, 'fa fa-usd', 'account/index');
INSERT INTO `department` VALUES ('5', 'งานพิมพ์', '1', null, 'fa fa-print', 'branchprint/index');
INSERT INTO `department` VALUES ('6', 'CNC / Laser', '1', null, 'fa fa-magnet', 'branchlaser/index');
INSERT INTO `department` VALUES ('7', 'ผลิตทั่วไป', '1', null, 'fas fa-air-freshener', 'branchfacture/index');
INSERT INTO `department` VALUES ('8', 'ช่าง / ติดตั้ง', '0', null, 'fa fa-wrench', null);
INSERT INTO `department` VALUES ('9', 'จัดส่ง', '0', null, 'fa fa-truck', null);

-- ----------------------------
-- Table structure for `graphic`
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
  `status` int(1) DEFAULT '0' COMMENT '0 = ยังไม่รับงาน 1 = รับงาน 2 = งานถูกยกเลิก 3  = แก้ไข',
  `approve` int(1) DEFAULT '0' COMMENT '0 = งานยังไม่approve 1 = งาน approve แล้ว',
  `create_date` timestamp NULL DEFAULT NULL COMMENT 'วันที่รับบงาน',
  `update_date` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'วันที่แก้ไขล่าสุด',
  `flagsend` int(1) DEFAULT '1' COMMENT '1 = ยังไม่ส่งต่อ 2 = ส่งต่อ 3 = งานจบที่นี้ 4 = งานผลิตนอกร้าน',
  `todep` varchar(100) DEFAULT NULL COMMENT 'ส่งต่อแผนก',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='ตารางแผนกกราฟิก';

-- ----------------------------
-- Records of graphic
-- ----------------------------
INSERT INTO `graphic` VALUES ('1', 'QdZJar3nEGX29yFlmRp4tt', null, '<p>บัตรคิว</p><p>จำนวน 2,000 ใบ</p>', '', 'F0s8QYv_yM1FHH12NqmSUm', '1', null, '1', '0', '2021-04-24 16:40:09', '2021-04-24 16:40:09', '2', '5');
INSERT INTO `graphic` VALUES ('2', '-rwb3A8KYS0dTuDWZc4DRT', null, '<p>ทดสอบส่งงานไปยังแผนกต่าง ๆ</p>', '', 'UnGi9lFP3JwDHL6zRIa5zv', '1', null, '1', '0', '2021-04-26 03:23:32', '2021-04-26 03:23:32', '2', '5,6,7');
INSERT INTO `graphic` VALUES ('3', 'CH-65aQi1QVCFyaTkdQk5F', null, '<p>จัดจ้างทำวารสาร ออกแบบพร้อมผลิตวารสาร ประจำเดือนมกราคม-มีนาคม พ.ศ.2564 รูปเล่ม</p><p>ขนาด A4 หน้าปก พิมพ์ 4 สี กระดาษอาร์ตมัน 230 แกรม +เคลือบเงา เนื้อใน พิมพ์ 4 สี กระดาษอาร์ตมัน 160 แกรม</p><p><strong>จำนวน 2,600 ฉบับ</strong></p><p>** ออกแบบพร้อมผลิตแผ่นพับ ประจำเดือนมกราคม - มีนาคม พ.ศ.2564 กระดาษอาร์ตมัน 130 แกรม ขนาด A4 พิมพ์ 4 สี 2 หน้า 2 พับ 3 ตอน</p><p><strong>จำนวน 4,000 ฉ</strong>บับ</p>', '', 'ce2XmEhpRWjUX95bjee3wn', '1', null, '1', '0', '2021-04-24 16:33:19', '2021-04-24 16:33:19', '2', '5');
INSERT INTO `graphic` VALUES ('4', 'kLcYl1xutvs4w9IwAX7cov', null, '<p>343243554553535</p>', '', 'HkUgh-XGpvcPiKQKYVeEZ3', '1', null, '1', '0', '2021-04-26 02:59:48', '2021-04-26 02:59:48', '2', '5,6');

-- ----------------------------
-- Table structure for `graphic_log`
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
  `department` varchar(100) DEFAULT NULL COMMENT 'แผนกส่งแก้ไข',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='ตารางเก็บประวัติส่งกลับมาแก้ไข';

-- ----------------------------
-- Records of graphic_log
-- ----------------------------
INSERT INTO `graphic_log` VALUES ('1', '-rwb3A8KYS0dTuDWZc4DRT', null, '', null, '2021-04-26 00:48:10', '0', 'งานพิมพ์ส่งแก้ไข');
INSERT INTO `graphic_log` VALUES ('2', 'kLcYl1xutvs4w9IwAX7cov', '1', '', null, '2021-04-26 00:57:07', '0', 'งานพิมพ์ส่งแก้ไข');
INSERT INTO `graphic_log` VALUES ('3', 'kLcYl1xutvs4w9IwAX7cov', '99', 'พิมพ์ตัวอักษรตก', null, '2021-04-26 01:22:19', '0', 'งานพิมพ์ส่งแก้ไข');
INSERT INTO `graphic_log` VALUES ('4', '-rwb3A8KYS0dTuDWZc4DRT', '1', '', null, '2021-04-26 02:48:28', '0', 'cnc / laser ส่งแก้ไข');
INSERT INTO `graphic_log` VALUES ('5', 'kLcYl1xutvs4w9IwAX7cov', '1', '', null, '2021-04-26 02:55:55', '0', 'งานพิมพ์ส่งแก้ไข');
INSERT INTO `graphic_log` VALUES ('6', '-rwb3A8KYS0dTuDWZc4DRT', '1', '', null, '2021-04-26 02:56:00', '0', 'งานพิมพ์ส่งแก้ไข');
INSERT INTO `graphic_log` VALUES ('7', '-rwb3A8KYS0dTuDWZc4DRT', '1', '', null, '2021-04-26 02:56:25', '0', 'cnc / laser ส่งแก้ไข');
INSERT INTO `graphic_log` VALUES ('8', 'kLcYl1xutvs4w9IwAX7cov', '1', '', null, '2021-04-26 02:58:50', '0', 'cnc / laser ส่งแก้ไข');
INSERT INTO `graphic_log` VALUES ('9', '-rwb3A8KYS0dTuDWZc4DRT', '1', '', null, '2021-04-26 03:23:13', '0', 'งานพิมพ์ส่งแก้ไข');

-- ----------------------------
-- Table structure for `mascancel`
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
INSERT INTO `mascancel` VALUES ('1', 'ติดต่อลูกค้าไม่ได้');
INSERT INTO `mascancel` VALUES ('2', 'ผลิตไม่ทัน');
INSERT INTO `mascancel` VALUES ('3', 'ลูกค้าไม่ตกลงซื้อ');

-- ----------------------------
-- Table structure for `maseditwork`
-- ----------------------------
DROP TABLE IF EXISTS `maseditwork`;
CREATE TABLE `maseditwork` (
  `id` int(3) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL COMMENT 'สาเหตุยกเลิกงาน',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='ตารางสาเหตุการส่งกลับแก้ไข';

-- ----------------------------
-- Records of maseditwork
-- ----------------------------
INSERT INTO `maseditwork` VALUES ('1', 'งานไม่ถูกต้อง');

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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='สิทธิ์การใช้งาน';

-- ----------------------------
-- Records of privilege
-- ----------------------------
INSERT INTO `privilege` VALUES ('1', '5', '0', '0', '0', '0');
INSERT INTO `privilege` VALUES ('6', '6', '0', '0', '0', '0');
INSERT INTO `privilege` VALUES ('7', '1', '1', '1', '1', '0');

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
INSERT INTO `profile` VALUES ('1', 'admin', null, null, null, null, null, '', null, '0821684717', null, null, 'A');
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
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 COMMENT='สิทธิ์การเข้าถึงแผนก';

-- ----------------------------
-- Records of rule
-- ----------------------------
INSERT INTO `rule` VALUES ('4', '1', '3', '1');
INSERT INTO `rule` VALUES ('5', '2', '3', '1');
INSERT INTO `rule` VALUES ('9', '1', '1', '1');
INSERT INTO `rule` VALUES ('10', '2', '1', '1');
INSERT INTO `rule` VALUES ('11', '4', '1', '1');
INSERT INTO `rule` VALUES ('13', '5', '1', '1');
INSERT INTO `rule` VALUES ('14', '6', '1', '1');
INSERT INTO `rule` VALUES ('15', '7', '1', '1');
INSERT INTO `rule` VALUES ('16', '8', '1', '1');
INSERT INTO `rule` VALUES ('17', '9', '1', '1');
INSERT INTO `rule` VALUES ('18', '1', '2', '1');
INSERT INTO `rule` VALUES ('19', '2', '2', '1');
INSERT INTO `rule` VALUES ('20', '3', '2', '1');
INSERT INTO `rule` VALUES ('22', '5', '2', '1');
INSERT INTO `rule` VALUES ('23', '3', '1', '1');
INSERT INTO `rule` VALUES ('24', '4', '6', '1');
INSERT INTO `rule` VALUES ('25', '5', '5', '1');

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
  `flag` int(1) DEFAULT '0' COMMENT '0 = กำลังผลิต 1 = Success 2 = Cancel',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 COMMENT='ตารางเก็บประวัติการทำงาน';

-- ----------------------------
-- Records of timeline
-- ----------------------------
INSERT INTO `timeline` VALUES ('1', null, 'kLcYl1xutvs4w9IwAX7cov', '6', '1', 'ส่งแก้ไขงาน', '2021-04-26 02:58:50', 'cnc / laser(ส่งแก้ไข กราฟิก / ออกแบบ)', '0');
INSERT INTO `timeline` VALUES ('2', null, 'QdZJar3nEGX29yFlmRp4tt', '4', '1', 'รับงาน', '2021-04-24 16:35:43', 'กราฟิก / ออกแบบ', '0');
INSERT INTO `timeline` VALUES ('3', null, '-rwb3A8KYS0dTuDWZc4DRT', '5', '1', 'ส่งแก้ไขงาน', '2021-04-26 03:23:13', 'งานพิมพ์(ส่งแก้ไข กราฟิก / ออกแบบ)', '0');
INSERT INTO `timeline` VALUES ('6', null, 'CH-65aQi1QVCFyaTkdQk5F', '1', '1', 'บันทึกข้อมูลการรับงาน', '2021-04-24 02:40:13', 'กราฟิก,บัญชี', '0');
INSERT INTO `timeline` VALUES ('7', null, 'CH-65aQi1QVCFyaTkdQk5F', '3', '1', 'สั่งผลิต', '2021-04-24 16:33:19', 'งานพิมพ์', '0');
INSERT INTO `timeline` VALUES ('9', null, 'QdZJar3nEGX29yFlmRp4tt', '4', '1', 'รับงาน', '2021-04-24 16:35:43', 'กราฟิก / ออกแบบ', '0');
INSERT INTO `timeline` VALUES ('10', null, 'QdZJar3nEGX29yFlmRp4tt', '3', '1', 'สั่งผลิต', '2021-04-24 16:40:09', 'งานพิมพ์', '0');
INSERT INTO `timeline` VALUES ('13', null, 'QdZJar3nEGX29yFlmRp4tt', '5', '1', 'รับงาน', '2021-04-25 18:17:14', 'งานพิมพ์(รับงาน)', '0');
INSERT INTO `timeline` VALUES ('14', null, 'QdZJar3nEGX29yFlmRp4tt', '5', '1', 'ยืนยันการผลิต', '2021-04-25 19:58:54', 'งานพิมพ์(งานผลิตเสร็จแล้ว)', '0');
INSERT INTO `timeline` VALUES ('15', null, 'CH-65aQi1QVCFyaTkdQk5F', '5', '1', 'รับงาน', '2021-04-25 20:54:49', 'งานพิมพ์(รับงาน)', '0');
INSERT INTO `timeline` VALUES ('16', null, 'QdZJar3nEGX29yFlmRp4tt', '5', '5', 'รับงาน', '2021-04-25 21:48:11', 'งานพิมพ์(รับงาน)', '0');
INSERT INTO `timeline` VALUES ('17', null, '-rwb3A8KYS0dTuDWZc4DRT', '5', '1', 'ส่งแก้ไขงาน', '2021-04-26 03:23:13', 'งานพิมพ์(ส่งแก้ไข กราฟิก / ออกแบบ)', '0');
INSERT INTO `timeline` VALUES ('18', null, 'kLcYl1xutvs4w9IwAX7cov', '6', '1', 'ส่งแก้ไขงาน', '2021-04-26 02:58:50', 'cnc / laser(ส่งแก้ไข กราฟิก / ออกแบบ)', '0');
INSERT INTO `timeline` VALUES ('19', null, 'kLcYl1xutvs4w9IwAX7cov', '6', '1', 'ส่งแก้ไขงาน', '2021-04-26 02:58:50', 'cnc / laser(ส่งแก้ไข กราฟิก / ออกแบบ)', '0');
INSERT INTO `timeline` VALUES ('20', null, '-rwb3A8KYS0dTuDWZc4DRT', '5', '1', 'ส่งแก้ไขงาน', '2021-04-26 03:23:13', 'งานพิมพ์(ส่งแก้ไข กราฟิก / ออกแบบ)', '0');
INSERT INTO `timeline` VALUES ('21', null, '-rwb3A8KYS0dTuDWZc4DRT', '5', '1', 'ส่งแก้ไขงาน', '2021-04-26 03:23:13', 'งานพิมพ์(ส่งแก้ไข กราฟิก / ออกแบบ)', '0');
INSERT INTO `timeline` VALUES ('22', null, 'kLcYl1xutvs4w9IwAX7cov', '6', '1', 'ส่งแก้ไขงาน', '2021-04-26 02:58:50', 'cnc / laser(ส่งแก้ไข กราฟิก / ออกแบบ)', '0');
INSERT INTO `timeline` VALUES ('23', null, 'kLcYl1xutvs4w9IwAX7cov', '3', '1', 'สั่งผลิต', '2021-04-26 02:59:48', 'งานพิมพ์,CNC / Laser', '0');
INSERT INTO `timeline` VALUES ('24', null, 'kLcYl1xutvs4w9IwAX7cov', '5', '1', 'รับงาน', '2021-04-26 03:00:36', 'งานพิมพ์(รับงาน)', '0');
INSERT INTO `timeline` VALUES ('25', null, 'kLcYl1xutvs4w9IwAX7cov', '6', '1', 'รับงาน', '2021-04-26 03:01:58', 'CNC / Laser(รับงาน)', '0');
INSERT INTO `timeline` VALUES ('26', null, '-rwb3A8KYS0dTuDWZc4DRT', '5', '1', 'ส่งแก้ไขงาน', '2021-04-26 03:23:13', 'งานพิมพ์(ส่งแก้ไข กราฟิก / ออกแบบ)', '0');
INSERT INTO `timeline` VALUES ('27', null, '-rwb3A8KYS0dTuDWZc4DRT', '5', '1', 'ส่งแก้ไขงาน', '2021-04-26 03:23:13', 'งานพิมพ์(ส่งแก้ไข กราฟิก / ออกแบบ)', '0');
INSERT INTO `timeline` VALUES ('28', null, 'kLcYl1xutvs4w9IwAX7cov', '6', '1', 'ยืนยันการผลิต', '2021-04-26 03:03:50', 'CNC / Laser(งานผลิตเสร็จแล้ว)', '0');
INSERT INTO `timeline` VALUES ('29', null, '-rwb3A8KYS0dTuDWZc4DRT', '3', '1', 'สั่งผลิต', '2021-04-26 03:23:32', 'งานพิมพ์,CNC / Laser,ผลิตทั่วไป', '0');
INSERT INTO `timeline` VALUES ('30', null, '-rwb3A8KYS0dTuDWZc4DRT', '7', '1', 'รับงาน', '2021-04-26 03:26:30', 'ผลิตทั่วไป(รับงาน)', '0');

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of uploads
-- ----------------------------
INSERT INTO `uploads` VALUES ('1', 'ce2XmEhpRWjUX95bjee3wn', '170187.jpg', '58a5d8fab0b203e40d1627e9a06a4e80.jpg', '2021-04-24 02:47:08', null, null, '1');
INSERT INTO `uploads` VALUES ('2', 'F0s8QYv_yM1FHH12NqmSUm', 'icon-l.png', 'fcd33978799081a4bf69080f3e02f53d.png', '2021-04-24 16:34:46', null, null, '1');

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
INSERT INTO `user` VALUES ('1', 'admin', 'kimniyomclub@gmail.com', '$2y$12$MenOVpHsMKOW0zYIFAD1ruqkamrLlEG1YIkcKOD9/eGmR9ECXzzsO', 'eVObZ98v26jv2RAmbdeUIlaHK4uJ8S-8', '1617557741', null, null, '::1', '1617557092', '1617557092', '0', '1619345940', 'A');
INSERT INTO `user` VALUES ('2', 'demo', 'demo@gmail.com', '$2y$12$ScVrSZM1VaIdB7rwZBAuK.SgNSPj8zvXPIO2n5jR.pHnw4EWjCWJ.', 'plDiCAlz6oFWCndrv4WHPeObSu1Ucf5-', '1617559566', null, null, '::1', '1617559566', '1618997823', '0', '1619251213', 'U');
INSERT INTO `user` VALUES ('3', 'test', 'test@gmail.com', '$2y$12$xigkYiCrgq0WBx99U9.AHeesTmAPlVvs4DBzo7TTv5hHu0/PJAGEC', 'xarpZbvmW6kRpH6_7L8DLCjo_nv8HBum', '1617640742', null, null, '::1', '1617640742', '1617640783', '0', null, 'A');
INSERT INTO `user` VALUES ('5', 'pdk', 'pdk@gmail.com', '$2y$12$1u5/zSNYAEc8tymWNcdk2OJgGQGdVJ1zb6JOv/XnrqxTCECo3lCz6', '-GYruuDz28hFZZFRm0HbtzO9vwWI2MVC', '1617990517', null, null, '::1', '1617990517', '1619358716', '0', '1619358797', 'U');
INSERT INTO `user` VALUES ('6', 'kimniyom', '123@gmail.com', '$2y$12$NL13psXOId80ykwkmNYdte/GXhrd/jXsHNms.WpWO.N6O6fVnAS42', 'b3uR2qjlXICxPVN7h-FDBTWMUON8R7v0', '1618703595', null, null, '::1', '1618703595', '1618703595', '0', '1619066604', 'U');
