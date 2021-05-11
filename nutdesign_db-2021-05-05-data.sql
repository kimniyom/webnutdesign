/*
Navicat MySQL Data Transfer

Source Server         : 122.154.239.66
Source Server Version : 50640
Source Host           : 127.0.0.1:3333
Source Database       : nutdesign_db

Target Server Type    : MYSQL
Target Server Version : 50640
File Encoding         : 65001

Date: 2021-05-05 08:55:16
*/

SET FOREIGN_KEY_CHECKS=0;

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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='ตารางแผนกบัญชี';

-- ----------------------------
-- Records of account
-- ----------------------------
INSERT INTO `account` VALUES ('1', null, 'kLcYl1xutvs4w9IwAX7cov', null, null, '1', null, '2', '0', '2021-05-03 06:39:30', '2021-05-04 14:44:02', '<p>แนบลิงค์ใบเสนอราคา</p>', null);
INSERT INTO `account` VALUES ('2', null, 'YPOkJWAFYTfCHxSYsJJXBh', null, null, '1', null, '2', '0', '2021-05-03 06:56:56', '2021-05-04 14:44:34', '<p>แนบใบเสนอราคาการจ้างงาน</p>', null);
INSERT INTO `account` VALUES ('3', null, 'QdZJar3nEGX29yFlmRp4tt', null, null, '1', null, '2', '0', '2021-05-04 00:36:59', '2021-05-04 14:44:17', '<p>ออกใบเสนอราค</p>', null);
INSERT INTO `account` VALUES ('4', null, '-rwb3A8KYS0dTuDWZc4DRT', null, null, null, null, '2', '0', null, '2021-05-04 14:44:28', null, null);
INSERT INTO `account` VALUES ('5', null, 'SWD9qEJmfXcw3oGSIOXkAI', null, null, '1', null, '2', '0', '2021-05-04 14:49:31', '2021-05-04 14:50:29', '<p>สติกเกอร์ไดคัท ชาบูอินดี้ จำนวน 10 ตรมๆละ 300.- รวมเป็นเงิน 3,000.-<br><br></p>', null);
INSERT INTO `account` VALUES ('6', null, 'Gm26rtixrfo4yRwznzEGus', null, null, '1', null, '2', '0', '2021-05-04 14:52:49', '2021-05-05 08:33:12', '<p>พี่เฟิน ผู้อนุมัติงาน</p>', null);
INSERT INTO `account` VALUES ('7', null, '3MEAnf0PnkFKomng3t6LvM', null, null, '1', null, '2', '0', '2021-05-04 14:58:57', '2021-05-05 08:33:20', '<p>เสนอราคาผ่านไลน์@<br><br></p><table class=\"table\"><tbody><tr><td><p>ภาพพิมพ์ยูวีขนาด 60x80 ซม. 1ชิ้นๆละ 890.-<br>ค่าจัดรถตู้100.-</p></td></tr></tbody></table>', null);
INSERT INTO `account` VALUES ('8', null, 'MIXnBtXuG0APEX5V6EXiWh', null, null, '1', null, '2', '0', '2021-05-04 17:27:43', '2021-05-05 08:33:31', '<p>ลูกค้ามีแบบแล้ว ผลิตอย่างเดียว</p>', null);
INSERT INTO `account` VALUES ('9', null, 'DOe_Gy7tX1cPcIeHinjorp', null, null, '1', null, '2', '0', '2021-05-04 22:16:30', '2021-05-05 08:33:45', '<p><a href=\"https://chat.line.biz/Uf09f66ebd2022fc14d87c675b86a0fd2/chat/U65aaafb16c4917ba4af31857343b375d\" target=\"_blank\">https://chat.line.biz/Uf09f66ebd2022fc14d87c675b86a0fd2/chat/U65aaafb16c4917ba4af31857343b375d</a></p>', null);
INSERT INTO `account` VALUES ('10', null, 'RctXJWQL2-Dam-l7Fvdjrx', null, null, '1', null, '2', '0', '2021-05-04 22:41:17', '2021-05-05 08:33:51', '<p><a href=\"https://doc-api.flowaccount.com/quotation/share/html/th/cci0tiu40uevpgn4yflwq\" target=\"_blank\">https://doc-api.flowaccount.com/quotation/share/html/th/cci0tiu40uevpgn4yflwq</a></p>', null);
INSERT INTO `account` VALUES ('11', null, '8znXEWOhq0XpngMNBDRQAX', null, null, '9', null, '1', '0', '2021-05-05 08:51:25', '2021-05-05 08:51:25', '<p>ตรวจสอบแล้ว ยอดเสนอราคาถูกต้อง<br>ไม่ทำใบเสนอราคา</p>', null);

-- ----------------------------
-- Table structure for branchfacture
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='งานผลิตทั่วไป';

-- ----------------------------
-- Records of branchfacture
-- ----------------------------
INSERT INTO `branchfacture` VALUES ('1', 'YPOkJWAFYTfCHxSYsJJXBh', '1', '2', '0', '2021-05-03 07:01:00', '2021-05-03 07:01:02');
INSERT INTO `branchfacture` VALUES ('2', 'QdZJar3nEGX29yFlmRp4tt', '1', '2', '0', '2021-05-04 00:36:28', '2021-05-04 00:40:47');
INSERT INTO `branchfacture` VALUES ('3', '-rwb3A8KYS0dTuDWZc4DRT', '1', '2', '0', '2021-05-04 01:51:01', '2021-05-04 01:51:02');
INSERT INTO `branchfacture` VALUES ('4', '3MEAnf0PnkFKomng3t6LvM', '1', '2', '0', '2021-05-04 17:43:26', '2021-05-04 17:43:29');
INSERT INTO `branchfacture` VALUES ('5', 'RctXJWQL2-Dam-l7Fvdjrx', '1', '2', '0', '2021-05-04 22:46:05', null);

-- ----------------------------
-- Table structure for branchlaser
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='งาน laser';

-- ----------------------------
-- Records of branchlaser
-- ----------------------------
INSERT INTO `branchlaser` VALUES ('1', 'YPOkJWAFYTfCHxSYsJJXBh', '1', '2', '0', '2021-05-03 07:00:54', '2021-05-03 07:01:07');
INSERT INTO `branchlaser` VALUES ('2', 'QdZJar3nEGX29yFlmRp4tt', '1', '2', '0', '2021-05-04 00:35:58', '2021-05-04 00:40:26');
INSERT INTO `branchlaser` VALUES ('3', '-rwb3A8KYS0dTuDWZc4DRT', '1', '2', '0', '2021-05-04 01:50:54', '2021-05-04 01:50:56');
INSERT INTO `branchlaser` VALUES ('4', '3MEAnf0PnkFKomng3t6LvM', '1', '2', '0', '2021-05-04 17:42:21', '2021-05-04 17:42:48');
INSERT INTO `branchlaser` VALUES ('5', 'DOe_Gy7tX1cPcIeHinjorp', '1', '2', '0', '2021-05-04 22:19:56', '2021-05-04 22:20:00');
INSERT INTO `branchlaser` VALUES ('7', 'RctXJWQL2-Dam-l7Fvdjrx', '1', '2', '0', '2021-05-04 22:46:16', null);

-- ----------------------------
-- Table structure for branchmarketing
-- ----------------------------
DROP TABLE IF EXISTS `branchmarketing`;
CREATE TABLE `branchmarketing` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ref` varchar(50) DEFAULT NULL COMMENT 'รหัสอ้างอิง',
  `user_id` int(3) DEFAULT NULL COMMENT 'ผู้รับงาน',
  `status` int(1) DEFAULT '1' COMMENT 'สถานะ 1 ยังไม่รับงาน 2 รับงานกำลังผลิต 3  ส่งแก้ไขงาน 4 ผลิตเสร็จแล้ว',
  `flag` int(1) DEFAULT '0' COMMENT '0 = NoApprove 1 = Approve 2 =  Cancel',
  `create_date` timestamp NULL DEFAULT NULL,
  `confirm_date` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='การตลาด';

-- ----------------------------
-- Records of branchmarketing
-- ----------------------------

-- ----------------------------
-- Table structure for branchprint
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='งานพิมพ์';

-- ----------------------------
-- Records of branchprint
-- ----------------------------
INSERT INTO `branchprint` VALUES ('1', 'kLcYl1xutvs4w9IwAX7cov', '1', '2', '0', '2021-05-03 06:41:16', '2021-05-03 06:41:29');
INSERT INTO `branchprint` VALUES ('2', 'YPOkJWAFYTfCHxSYsJJXBh', '1', '2', '0', '2021-05-03 07:00:42', '2021-05-03 07:01:12');
INSERT INTO `branchprint` VALUES ('3', 'QdZJar3nEGX29yFlmRp4tt', '1', '2', '0', '2021-05-04 00:40:07', '2021-05-04 00:40:09');
INSERT INTO `branchprint` VALUES ('4', '-rwb3A8KYS0dTuDWZc4DRT', '1', '2', '0', '2021-05-04 01:50:42', '2021-05-04 01:50:45');
INSERT INTO `branchprint` VALUES ('5', '3MEAnf0PnkFKomng3t6LvM', '1', '2', '0', '2021-05-04 17:43:00', '2021-05-04 17:43:16');
INSERT INTO `branchprint` VALUES ('6', 'DOe_Gy7tX1cPcIeHinjorp', '1', '2', '0', '2021-05-04 22:20:19', '2021-05-04 22:20:46');

-- ----------------------------
-- Table structure for branchtechnician
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
  `print_status` int(1) DEFAULT '0' COMMENT 'แผนกพิมพ์ 0 = ไม่ผลิต 1 = ผลิตยังไม่เสร็จ 2 = ผลิตเสร็จแล้ว',
  `cnc_status` int(1) DEFAULT '0' COMMENT 'แผนก cnc/laser 0 = ไม่ผลิต 1 = ผลิตยังไม่เสร็จ 2 = ผลิตเสร็จ',
  `manufacture_status` int(1) DEFAULT '0' COMMENT 'ผลิตทั่วไป 0 = ไม่ผลิต 1 = ผลิตยังไม่เสร็จ 2 ผลิตเสร็จแล้ว',
  `technician_status` int(1) DEFAULT '0' COMMENT 'แผนกช่าง 0 ไม่ผลิต 1 = รับงาน 2 ติดตั้งเสร็จ',
  `approve` int(1) DEFAULT '0' COMMENT '0 = ยังไม่ส่งมอบงานลูกค้า 1 = ส่งมอบงานลูกค้า',
  `userapprove` int(11) DEFAULT NULL COMMENT 'พนักงานส่งมอบงาน',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='เก็บรายละเอียดลูกค้า / รับงาน';

-- ----------------------------
-- Records of customer
-- ----------------------------
INSERT INTO `customer` VALUES ('1', 'พิมพ์เล่มใบเสร็จ/ใบกำกับภาษี', 'Noo Nidty', '0634419442', '1', 'Noo Nidty, dIew', 'ที่อยู่ ร้าน dIew factory autoparts (ติดไอยรารีสอร์ต) โทร 080-6961466 61/17 ม.15 ต.คลองสอง อ.คลองหลวง จ.ปทุมธานี 12120', null, '<p><strong>* บิล Copy นอก บิลใบเสร็จ A5 ขนาด 21 x 14.5 cm กระดาษปอนด์ ปรูฟ ก็อปปี้นอก </strong></p><p><strong>* ใช้คาร์บอน พิมพ์ 1 สี 1 หน้า ( 1 เล่ม มี 50 ชุดๆ ละ 3 ใบ) </strong></p><p><strong><span style=\"color: rgb(12, 12, 12);\">จำนวน 5 เล่มๆ ละ 450.-</span></strong><em></em><span></span><span></span></p>', null, '2021-05-20', '10:00:00', '3,4', null, '2021-04-24 02:12:20', '1', 'kLcYl1xutvs4w9IwAX7cov', '1', '0', '0', '2', '1', '1', '0', '99', 'ทดลองระบบ', '2', '0', '0', '0', null, null);
INSERT INTO `customer` VALUES ('2', 'บัตรคิว', 'ผู้กองโอ๋ศรี', '0821684717', '1', 'ผู้กองโอ๋ศรี', 'ผู้กองโอ๋ ห้อง1 ตรวจคนเข้าเมือง จ.ปทุมธานี (ตึกหลัง ห้อง1) 159 ม.7 ต.สวนพริกไทย อ.เมือง จ.ปทุมธานี 12000 โทร.084-5892266', null, '<p>บัตรคิว แผ่นพีวีซีขาวขุ่น หนา 0.4 มิล พิมพ์ยูวี พิมพ์ 4 สี 1 ด้าน ขนาด 9x9 ซม. </p><p>จำนวน 37 ชิ้น ๆ ละ 30.- </p><p><strong><span style=\"color: rgb(0, 0, 0);\">รวมเป็นเงิน 1,110.-</span></strong></p>', null, '2021-04-27', '23:00:00', '3,4', null, '2021-04-24 02:16:59', '1', 'QdZJar3nEGX29yFlmRp4tt', '1', '1', '1', '2', '1', '1', '0', '99', 'ทดลองระบบ', '2', '2', '2', '2', null, null);
INSERT INTO `customer` VALUES ('3', 'นามบัตรกระดาษ', 'GNAP นามบัตรใส', '0850848723 คุณแป้ง', '1', 'GNAP นามบัตรใส', 'จัดส่ง.. คุณอรวรรณ สาระ บจก อาร์ตโก อินเตอร์เนชันแนล 700/50, 52, 54 ม. 6 ต.หนองไม้แดง อ.เมืองชลบุรี จ.ชลบุรี 20000 0850848723 ค่ะ', null, '<p>งานแก้นามบัตรกระดาษ 2 แบบๆละ 100 ใบ พร้อมส่งนามบัตรพีวีซีให้ลูกค้า</p>', null, '2021-04-28', '10:17:00', '3,4', null, '2021-04-24 02:19:01', '1', '-rwb3A8KYS0dTuDWZc4DRT', '1', '1', '1', '2', '1', '1', '0', '99', 'ทดลองระบบ', '2', '2', '2', '0', null, null);
INSERT INTO `customer` VALUES ('4', 'วารสาร/แผ่นพับ มค.-มีค.64', 'เฟริสท์ อบจ วารสาร', '0800260943', '1', 'ฟริสท์ อบจ วารสาร', 'อบจ.ตาก', null, '<p>จัดจ้างทำวารสาร ** </p><p>จัดจ้างทำวารสาร ออกแบบพร้อมผลิตวารสาร ประจำเดือนมกราคม-มีนาคม พ.ศ.2564 รูปเล่ม </p><p>ขนาด A4 หน้าปก พิมพ์ 4 สี กระดาษอาร์ตมัน 230 แกรม +เคลือบเงา เนื้อใน พิมพ์ 4 สี กระดาษอาร์ตมัน 160 แกรม</p><p> <span style=\"color: rgb(192, 80, 77);\"><strong>จำนวน 2,600 ฉบับ</strong> </span></p><p>** ออกแบบพร้อมผลิตแผ่นพับ ประจำเดือนมกราคม - มีนาคม พ.ศ.2564 กระดาษอาร์ตมัน 130 แกรม ขนาด A4 พิมพ์ 4 สี 2 หน้า 2 พับ 3 ตอน </p><p><span style=\"color: rgb(192, 80, 77);\"><strong>จำนวน 4,000 ฉ</strong>บับ</span></p>', null, '2021-04-30', '10:19:00', '3', null, '2021-04-24 02:22:23', '1', 'CH-65aQi1QVCFyaTkdQk5F', '1', '1', '1', '2', '1', '1', '0', '2', '', '0', '0', '0', '0', null, null);
INSERT INTO `customer` VALUES ('5', 'ออกแบบบูธ', 'แพทย์แผนไทย', '0857122920', '2', '-', 'สสจ.ตาก', null, '<p>          ปัจจุบันการออกร้าน ออกบูธ ในงานแสดงสินค้า (Exhibition) กำลังเป็นที่นิยม และอยู่ในความสนใจของผู้ประกอบการธุรกิจ รวมถึงบรรดาพ่อค้าแม่ค้าต่าง ๆ เพราะเป็นอีกช่องทางหนึ่งที่คุณจะสามารถช่วยให้คุณนำเสนอสินค้าหรือบริการให้กับคนทั่วไป หรือกลุ่มลูกค้าเป้าหมายของคุณได้ อีกทั้งยังช่วยให้คุณได้ประชาสัมพันธ์ธุรกิจ ได้สำรวจตลาดและพฤติกรรมผู้บริโภค รวมถึงคู่แข่งในธุรกิจเดียวกับคุณภายในงานแสดงสินค้าด้วย</p><p>           การออกบูธเป็นกลยุทธ์ทางการตลาดอย่างหนึ่งที่เจ้าของแบรนด์ต่าง ๆ ให้ความนิยมกันอย่างมาก เพราะฉะนั้นการออกแบบบูธ หรือ การดีไซน์บูธให้สวยงาม ก็มีความสำคัญเป็นอย่างมาก เพราะบูธเป็นสิ่งแรกที่จะช่วยดึงดูดผู้คนที่ผ่านไปผ่านมาให้ความสนใจ ฉะนั้นเราควรออกแบบบูธให้มีจุดเด่น มีเอกลักษณ์ และสไตล์ที่ไม่ซ้ำใคร และการออกบูธให้ประสบความสำเร็จไม่ใช่แค่ออกไปตั้งแผงโชว์และจำหน่ายสินค้าพอหมดวันก็เก็บของแยกย้ายกลับเท่านั้น แต่ยังต้องคำนึงถึงวิธีทำให้การออกบูธมีความน่าสนใจและดึงดูดลูกค้าให้เข้ามาชมด้วย ซึ่งแน่นอนว่า เมื่อคุณเข้ามาจับจองพื้นที่เพื่อออกบูธ ผู้คนกลุ่มนั้น ๆ จำนวนหลายร้อยหลายพันคนที่มาเดินในงานก็จะต้องพบเห็นบูธของคุณกันเป็นจำนวนมาก แม้ไม่ได้เข้ามาซื้อหรืออาจแค่มองเห็นผ่านตา ก็สามารถเกิดการรับรู้ หรืออาจเกิดการจดจำได้ไม่มากก็น้อย</p><p>           ถ้าหากผู้คนที่ได้พบเห็นเกิดความสนใจ ก็จะเข้ามาสอบถามและซื้อสินค้าติดไม้ติดมือกลับไป ซึ่งเมื่อซื้อสินค้ากลับไปแล้วพบว่าของมีคุณภาพดี ก็จะส่งผลให้พวกเขาหาซื้อสินค้าของคุณต่อไปอีกเรื่อย ๆ รวมถึงในบางครั้ง พวกเขาก็ยังจะแนะนำสินค้าของคุณไปยังคนอื่น ๆ ด้วยเช่นกัน </p><p>และเคล็ดลับการออกแบบบูธให้สวย โดดเด่นและดึงดูดลูกค้ามีดังต่อไปนี้</p><p>1.มีความคิดสร้างสรรค์</p><p>การออกแบบบูธเปิดตัวสินค้า หรือ การสร้างสรรค์พื้นที่ในการแสดงสินค้า ให้มีความน่าสนใจและโดดเด่นมากขึ้น ที่แน่นอนก็จะต้องมีการนำเสนอไอเดียที่แปลกใหม่ไม่ซ้ำใคร</p><p>2.สี</p><p>การเลือกใช้สีในการออกแบบบูธนั้นไม่ควรเลือกใช้สีที่เยอะจนเกินไป ควรเลือกใช้สีที่สร้างความโดดเด่นในกับบูธ อย่างเช่น สีตามองค์กร หรือ สีของแบรนด์นั้น ๆ</p><p>3.การจัดแสง</p><p>การจัดแสงสีให้อลังการตระการตาน่าก็เป็นอีกวิธีที่จะทำให้บูธของเรามีความน่าสนใจ และช่วยดึงดูดลูกค้ามาเข้าบูธ จัดไฟให้ถูกที่ว่าเราจะเน้นตรงไหนเป็นจุดเด่น</p><p>4.วัสดุ</p><p>การเลือกใช้วัสดุ ก็ควรเลือกใช้วัสดุที่เหมาะสมกับผลิตภัณฑ์ หรือ สินค้า ที่ต้องการจะแสดง</p>', null, '2021-06-23', '16:30:00', '3, 4', null, '2021-05-03 06:56:00', '1', 'YPOkJWAFYTfCHxSYsJJXBh', '1', '1', '1', '2', '1', '1', '0', '99', 'ทดลองระบบ', '2', '2', '2', '2', null, null);
INSERT INTO `customer` VALUES ('6', 'สติกเกอร์พีพี 10 ตรม.', 'ชาบูอินดี้ ', '0988824286', '1', 'ชาบูอินดี้', 'รับงานหน้าร้าน ', null, '<p>สติกเกอร์พีพี ชาบูอินดี้ 10 ตรม.ๆละ 300.- เป็นเงิน 3,000.-</p>', null, '2021-05-05', '15:00:00', '4', null, '2021-05-04 14:44:30', '1', 'SWD9qEJmfXcw3oGSIOXkAI', '0', '0', '0', '2', '0', '1', '0', '99', '-', '0', '0', '0', '0', '0', null);
INSERT INTO `customer` VALUES ('7', 'สติกเกอร์พีพี 10 ตรม.', 'ชาบูอินดี้ ', '0988824286', '1', 'ชาบูอินดี้', 'รับงานหน้าร้าน ', null, '<p>สติกเกอร์พีพี ชาบูอินดี้ 10 ตรม.ๆละ 300.- เป็นเงิน 3,000.-</p>', null, '2021-05-05', '15:00:00', '3, 4', null, '2021-05-04 14:49:30', '1', 'Gm26rtixrfo4yRwznzEGus', '0', '0', '0', '2', '0', '1', '0', '99', 'ทดสอบระบบ', '0', '0', '0', '0', '0', null);
INSERT INTO `customer` VALUES ('8', 'ภาพพิมพ์ยูวีขนาด 60x80 ซม. 1ชิ้นๆละ 890.-', 'Bombay', '0904528488', '1', 'Bombay', 'จัดส่ง ส่งรถตู้\r\nพงษ์สิทธิ์ มาขอด ที่อยู่ 633 หมู่ 1 ต.ท่าสายลวด อ.แม่สอด จ.ตาก 63110\r\nโทร.0904528488', null, '<p>ภาพพิมพ์ยูวีขนาด 60x80 ซม. 1ชิ้นๆละ 890.-<br>ค่าจัดรถตู้100.-<br><br>*งานนำภาพมารวมกันใน 1 ชิ้นงาน<br>*ข้อความว่า Happy birthday dear<br>ขอให้มีความสุขมากๆ นะจ้า คิดสิ่งใดขอให้สมปรารถนา ทำอะไรก็ให้ประสบแต่ความสำเร็จ (08/05/64) Love so much<br><br>ยอดชำระรวม 990.-</p>', null, '2021-05-05', '09:00:00', '4', null, '2021-05-04 14:55:03', '1', '3MEAnf0PnkFKomng3t6LvM', '1', '0', '1', '2', '0', '1', '0', '99', 'ทดสอบระบบ', '2', '2', '2', '0', '0', null);
INSERT INTO `customer` VALUES ('9', 'สติ๊กเกอร์ไดคัท 1 ตรม.', 'chamook', '0918829905', '1', 'chamook', 'สติ๊กเกอร์ไดคัท 1 ตรม. 400.-', null, '<p>สติ๊กเกอร์ไดคัท 1 ตรม.</p>', null, '2021-05-04', '16:00:00', '4', null, '2021-05-04 15:03:28', '1', 'MIXnBtXuG0APEX5V6EXiWh', '0', '0', '1', '2', '0', '1', '0', '99', 'ทดสอบระบบ', '0', '0', '0', '0', '0', null);
INSERT INTO `customer` VALUES ('10', 'สติ๊กเกอร์ติดกระจก', 'คลินิคยู้แอนด์ยู', '', '1', 'yu and u', 'ริมน้ำ', null, '<p>ติดสติ๊กเกอร์ ใส 2 ชิ้น<br>+ ส่งของ </p><p> อะคริลิค 3 ชิ้น</p>', null, '2021-05-05', '16:12:00', '4', null, '2021-05-04 22:15:41', '1', 'DOe_Gy7tX1cPcIeHinjorp', '0', '1', '1', '2', '1', '1', '0', '99', 'ทดสอบระบบ', '2', '2', '0', '2', '0', null);
INSERT INTO `customer` VALUES ('11', 'ฉากกั้นอะคริลิค', 'พัทลุงเครื่องชั่ง', '', '1', 'line nat : ภูกิจ พัทลุงเครื่องช', '11 หมู่ 8 ต.นาโหนด อำเภอเมือง จังหวัดพัทลุง 93000', null, '<p>ใบเสนอราคาคลิก <a href=\"https://doc-api.flowaccount.com/quotation/share/html/th/cci0tiu40uevpgn4yflwq\">https://doc-api.flowaccount.com/quotation/share/ht...</a></p>', null, '2021-05-05', '14:37:00', '4', null, '2021-05-04 22:40:34', '1', 'RctXJWQL2-Dam-l7Fvdjrx', '1', '0', '1', '2', '1', '1', '0', '99', 'ทดสอบระบบ', '0', '1', '1', '0', '0', null);
INSERT INTO `customer` VALUES ('12', 'ไวนิลน้ำแข็ง', 'Fam', '0931758306', '1', 'Fam', 'จัดส่ง.. รถตู้แม่สอด\r\n\r\nคุณศุทธวีร์ ที่อยุ่ 364 หมู่ที่ 6 ต.แม่ตาว อ.แม่สอด จ.ตาก 63110 \r\n0931758306', null, '<p>ป้ายไวนิล พิมพ์ 2 ด้าน พับ+ตาไก่ 4 มุม<br>ขนาด 58x112 ซม. จำนวน 1  ชิ้นๆ ละ 350.-<br><br>ค่าส่ง 100.-<br><br>รวมยอดชำระ 450.-</p><p><br></p><p>-----------------------------------------------------</p><p><br></p><p>ข้อความ</p><p>ร้านน้ำแข็ง<br>สะอาด<br>จำหน่าย<br>น้ำแข็งหลอด-บด<br>ปลีก/ส่ง รับส่งทุกงาน<br>ติดต่องาน0878472765<br> 0931758306<span class=\"redactor-invisible-space\"></span></p>', null, '2021-05-05', '15:00:00', '4', null, '2021-05-05 08:45:52', '16', '8znXEWOhq0XpngMNBDRQAX', '1', '0', '0', '0', '0', '1', '0', null, null, '0', '0', '0', '0', '0', null);

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
  `type` varchar(20) DEFAULT NULL,
  `isshow` int(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='ตารางแผนก';

-- ----------------------------
-- Records of department
-- ----------------------------
INSERT INTO `department` VALUES ('1', 'รับงาน / คุยงาน', '1', null, 'chatbubble-ellipses-outline', 'customer/index', 'ion', '0');
INSERT INTO `department` VALUES ('2', 'การตลาด / ลูกค้าสัมพันธ์', '0', null, 'fa fa-tags', null, 'fa', '1');
INSERT INTO `department` VALUES ('3', 'กราฟิก', '1', null, 'color-palette-outline', 'graphic/index', 'ion', '1');
INSERT INTO `department` VALUES ('4', 'บัญชี', '1', null, 'receipt-outline', 'account/index', 'ion', '1');
INSERT INTO `department` VALUES ('5', 'งานพิมพ์', '1', null, 'print-outline', 'branchprint/index', 'ion', '1');
INSERT INTO `department` VALUES ('6', 'CNC / Laser', '1', null, 'magnet-outline', 'branchlaser/index', 'ion', '1');
INSERT INTO `department` VALUES ('7', 'ผลิตทั่วไป', '1', null, 'construct-outline', 'branchfacture/index', 'ion', '1');
INSERT INTO `department` VALUES ('8', 'ช่าง / ติดตั้ง', '1', null, 'build-outline', 'setup/index', 'ion', '1');
INSERT INTO `department` VALUES ('9', 'จัดส่ง', '1', null, 'car-sport-outline', 'transport/index', 'ion', '0');
INSERT INTO `department` VALUES ('10', 'ลงคิวงาน', '1', null, 'calendar-outline', 'queue/index', 'ion', '0');
INSERT INTO `department` VALUES ('11', 'ดูงานทั้งหมด', '1', null, 'lnr lnr-enter', 'customer/all', 'lnr', '0');
INSERT INTO `department` VALUES ('12', 'ส่งมอบงาน', '0', null, 'thumbs-up-outline', 'customer/approve', 'ion', '0');

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
  `status` int(1) DEFAULT '0' COMMENT '0 = ยังไม่รับงาน 1 = รับงาน 2 = งานถูกยกเลิก 3  = แก้ไข',
  `approve` int(1) DEFAULT '0' COMMENT '0 = งานยังไม่approve 1 = งาน approve แล้ว',
  `create_date` timestamp NULL DEFAULT NULL COMMENT 'วันที่รับบงาน',
  `update_date` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'วันที่แก้ไขล่าสุด',
  `flagsend` int(1) DEFAULT '1' COMMENT '1 = ยังไม่ส่งต่อ 2 = ส่งต่อ 3 = งานจบที่นี้ 4 = งานผลิตนอกร้าน',
  `todep` varchar(100) DEFAULT NULL COMMENT 'ส่งต่อแผนก',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='ตารางแผนกกราฟิก';

-- ----------------------------
-- Records of graphic
-- ----------------------------
INSERT INTO `graphic` VALUES ('1', 'kLcYl1xutvs4w9IwAX7cov', null, '<p><strong>บิล Copy นอก บิลใบเสร็จ A5 ขนาด 21 x 14.5 cm กระดาษปอนด์ ปรูฟ ก็อปปี้นอก</strong></p><p><strong>ใช้คาร์บอน พิมพ์ 1 สี 1 หน้า ( 1 เล่ม มี 50 ชุดๆ ละ 3 ใบ)</strong></p><p><strong>จำนวน 5 เล่มๆ ละ 450.-</strong></p>', '', 'PsY4xb_OEKsfjXUlNfXfjX', '1', null, '2', '0', '2021-05-03 06:40:38', '2021-05-04 14:44:02', '2', '5');
INSERT INTO `graphic` VALUES ('2', 'YPOkJWAFYTfCHxSYsJJXBh', null, '<p>โครงใช้ไม้</p><p>backgrund ใช้ ไวนิล</p><p>เวทีใช้ผ้าสีดำคลุม</p>', '', 'bOhQLm1Gl5U9CQJQIR3dG3', '1', null, '2', '0', '2021-05-03 07:00:03', '2021-05-04 14:44:34', '2', '5,6,7');
INSERT INTO `graphic` VALUES ('3', 'QdZJar3nEGX29yFlmRp4tt', null, '<p>ทดสอบสั่งงานฝ่ายผลิต</p>', '', 'XMY5FOH_KWmnb9K1qhe4dd', '1', null, '2', '0', '2021-05-04 00:35:00', '2021-05-04 14:44:17', '2', '5,6,7');
INSERT INTO `graphic` VALUES ('4', 'CH-65aQi1QVCFyaTkdQk5F', null, null, '', '', null, null, '2', '0', null, '2021-05-04 04:22:12', '1', null);
INSERT INTO `graphic` VALUES ('5', '-rwb3A8KYS0dTuDWZc4DRT', null, '<p>ทดสอบส่งงาน<br></p>', '', 'zT1DDAD6Bj4eYGqMKNlKUc', '1', null, '2', '0', '2021-05-04 01:49:21', '2021-05-04 14:44:28', '2', '5,6,7');
INSERT INTO `graphic` VALUES ('6', 'Gm26rtixrfo4yRwznzEGus', null, null, '', '', null, null, '2', '0', null, '2021-05-05 08:33:12', '1', null);
INSERT INTO `graphic` VALUES ('7', 'SWD9qEJmfXcw3oGSIOXkAI', null, null, '', '', null, null, '2', '0', null, '2021-05-04 14:50:29', '1', null);
INSERT INTO `graphic` VALUES ('8', '3MEAnf0PnkFKomng3t6LvM', null, '', '', 'PZ2zZrMVrEKw3RI58MUp-s', '1', null, '2', '0', '2021-05-04 17:30:32', '2021-05-05 08:33:20', '2', '5,6,7');
INSERT INTO `graphic` VALUES ('9', 'MIXnBtXuG0APEX5V6EXiWh', null, null, '', '', null, null, '2', '0', null, '2021-05-05 08:33:31', '1', null);
INSERT INTO `graphic` VALUES ('10', 'DOe_Gy7tX1cPcIeHinjorp', null, '', '', 'VRUteXy2CJ5AyWm5Tnhzxn', '1', null, '2', '0', '2021-05-04 22:19:30', '2021-05-05 08:33:45', '2', '5,6');
INSERT INTO `graphic` VALUES ('11', 'RctXJWQL2-Dam-l7Fvdjrx', null, '', '', '386cVutHlZBTVmGHmKHhqS', '1', null, '2', '0', '2021-05-04 22:45:38', '2021-05-05 08:33:51', '2', '6');
INSERT INTO `graphic` VALUES ('12', '8znXEWOhq0XpngMNBDRQAX', null, null, '', '', null, null, '0', '0', null, null, '1', null);

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
  `department` varchar(100) DEFAULT NULL COMMENT 'แผนกส่งแก้ไข',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='ตารางเก็บประวัติส่งกลับมาแก้ไข';

-- ----------------------------
-- Records of graphic_log
-- ----------------------------
INSERT INTO `graphic_log` VALUES ('1', 'RctXJWQL2-Dam-l7Fvdjrx', '1', '', null, '2021-05-04 22:44:17', '0', 'cnc / laser ส่งแก้ไข');

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
INSERT INTO `mascancel` VALUES ('1', 'ติดต่อลูกค้าไม่ได้');
INSERT INTO `mascancel` VALUES ('2', 'ผลิตไม่ทัน');
INSERT INTO `mascancel` VALUES ('3', 'ลูกค้าไม่ตกลงซื้อ');

-- ----------------------------
-- Table structure for maseditwork
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
  `queue` int(1) DEFAULT '0' COMMENT 'สิทธิ์ลงคิวงาน 0 = ไม่มีสิทธิ์ 1 มีสิทธิ์',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COMMENT='สิทธิ์การใช้งาน';

-- ----------------------------
-- Records of privilege
-- ----------------------------
INSERT INTO `privilege` VALUES ('1', '5', '0', '0', '0', '0', '0');
INSERT INTO `privilege` VALUES ('2', '2', '0', '0', '0', '0', '1');
INSERT INTO `privilege` VALUES ('6', '6', '0', '0', '0', '0', '0');
INSERT INTO `privilege` VALUES ('7', '1', '1', '1', '1', '0', '0');
INSERT INTO `privilege` VALUES ('8', '7', '0', '0', '0', '0', '0');
INSERT INTO `privilege` VALUES ('9', '8', '1', '1', '1', '0', '0');
INSERT INTO `privilege` VALUES ('10', '9', '0', '0', '0', '0', '0');
INSERT INTO `privilege` VALUES ('11', '10', '0', '0', '0', '0', '0');
INSERT INTO `privilege` VALUES ('12', '11', '1', '1', '1', '0', '0');
INSERT INTO `privilege` VALUES ('13', '12', '1', '1', '1', '0', '0');
INSERT INTO `privilege` VALUES ('14', '13', '0', '0', '0', '0', '0');
INSERT INTO `privilege` VALUES ('15', '14', '0', '0', '0', '0', '0');
INSERT INTO `privilege` VALUES ('16', '15', '0', '0', '1', '0', '0');
INSERT INTO `privilege` VALUES ('17', '16', '1', '1', '1', '1', '0');
INSERT INTO `privilege` VALUES ('18', '17', '1', '1', '1', '1', '0');
INSERT INTO `privilege` VALUES ('19', '18', '0', '0', '0', '0', '0');

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
INSERT INTO `profile` VALUES ('1', 'admin', null, null, null, null, null, '', null, '0821684717', null, null, 'A');
INSERT INTO `profile` VALUES ('2', 'ทดสอบ', null, null, null, null, null, '', null, '0800260943', '3', null, 'ทดสอบ');
INSERT INTO `profile` VALUES ('6', 'kimniyom', null, null, null, null, null, 'ทำงานด้านออกแบบ', null, '0821684717', '4', null, 'kang');
INSERT INTO `profile` VALUES ('8', 'การตลาด', null, null, null, null, null, '', null, '0955019533', '2', null, 'เตย');
INSERT INTO `profile` VALUES ('9', 'การบัญชี (รับ)', null, null, null, null, null, '', null, '0955019533', '4', null, 'นุช');
INSERT INTO `profile` VALUES ('10', 'การบัญชี (จ่าย)', null, null, null, null, null, '', null, '0955019533', '4', null, 'ปอ');
INSERT INTO `profile` VALUES ('11', 'การบัญชี (แอดมิน)', null, null, null, null, null, '', null, '0955019533', '4', null, 'ฝน');
INSERT INTO `profile` VALUES ('12', 'กราฟฟิค', null, null, null, null, null, '', null, '0955019533', '3', null, 'บอล, ขิม');
INSERT INTO `profile` VALUES ('13', 'งานพิมพ์', null, null, null, null, null, '', null, '0955019533', '5', null, 'วุ้น, เอ้, เจ็น');
INSERT INTO `profile` VALUES ('14', 'งานตัด', null, null, null, null, null, '', null, '0955019533', '6', null, 'โต้ง');
INSERT INTO `profile` VALUES ('15', 'งานผลิต', null, null, null, null, null, '', null, '0955019533', '7', null, 'ตั๊ก');
INSERT INTO `profile` VALUES ('16', 'ผู้จัดการ', null, null, null, null, null, '', null, '0654944505', '2', null, 'เฟิน');
INSERT INTO `profile` VALUES ('17', 'ผู้บริหาร', null, null, null, null, null, '', null, '0862149586', '2', null, 'ณัฐ');
INSERT INTO `profile` VALUES ('18', 'งานติดตั้ง', null, null, null, null, null, '', null, '0955019533', '8', null, '-');

-- ----------------------------
-- Table structure for queue
-- ----------------------------
DROP TABLE IF EXISTS `queue`;
CREATE TABLE `queue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ref` varchar(50) DEFAULT NULL COMMENT 'รหัสอ้างอิง',
  `user_id` int(11) DEFAULT NULL COMMENT 'คนรับงาน',
  `queuedate` date DEFAULT NULL COMMENT 'วันที่ติดตั้ง',
  `timesetup` time DEFAULT NULL COMMENT 'เวลาเเข้าติดตั้ง',
  `approve` int(1) DEFAULT '0' COMMENT 'สถานะติดตั้งรับงาน 0 = ยังไม่ลงติดตั้ง 1 = ลงรับงาน 2 = ติดตั้งแล้ว',
  `confirm` int(11) DEFAULT '0' COMMENT '0 = ยังไม่ลงคิวงาน 1 = ลงคิวงานติดตั้งแล้ว',
  `dupdate` timestamp NULL DEFAULT NULL COMMENT 'วันที่บันทึกข้อมูล',
  `usersetup` int(11) DEFAULT NULL COMMENT 'ช่างติดตั้ง',
  `detail` longtext COMMENT 'ข้อความอื่น ๆ',
  `refsetup` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='ตารางคิวงานติดตั้ง ส่งมาเมื่อกราฟฟิกบันทึกข้อมูล';

-- ----------------------------
-- Records of queue
-- ----------------------------

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
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8 COMMENT='สิทธิ์การเข้าถึงแผนก';

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
INSERT INTO `rule` VALUES ('26', '10', '1', '1');
INSERT INTO `rule` VALUES ('27', '10', '3', '1');
INSERT INTO `rule` VALUES ('28', '11', '1', '1');
INSERT INTO `rule` VALUES ('29', '12', '1', '1');
INSERT INTO `rule` VALUES ('30', '1', '8', '1');
INSERT INTO `rule` VALUES ('31', '10', '8', '1');
INSERT INTO `rule` VALUES ('32', '11', '8', '1');
INSERT INTO `rule` VALUES ('33', '9', '8', '1');
INSERT INTO `rule` VALUES ('34', '4', '9', '1');
INSERT INTO `rule` VALUES ('35', '4', '10', '1');
INSERT INTO `rule` VALUES ('36', '1', '11', '1');
INSERT INTO `rule` VALUES ('37', '11', '11', '1');
INSERT INTO `rule` VALUES ('38', '10', '11', '1');
INSERT INTO `rule` VALUES ('39', '9', '11', '1');
INSERT INTO `rule` VALUES ('40', '4', '11', '1');
INSERT INTO `rule` VALUES ('41', '3', '12', '1');
INSERT INTO `rule` VALUES ('42', '5', '13', '1');
INSERT INTO `rule` VALUES ('43', '6', '14', '1');
INSERT INTO `rule` VALUES ('44', '7', '15', '1');
INSERT INTO `rule` VALUES ('45', '9', '15', '1');
INSERT INTO `rule` VALUES ('46', '3', '16', '1');
INSERT INTO `rule` VALUES ('47', '4', '16', '1');
INSERT INTO `rule` VALUES ('48', '5', '16', '1');
INSERT INTO `rule` VALUES ('50', '7', '16', '1');
INSERT INTO `rule` VALUES ('51', '8', '16', '1');
INSERT INTO `rule` VALUES ('52', '6', '16', '1');
INSERT INTO `rule` VALUES ('53', '9', '16', '1');
INSERT INTO `rule` VALUES ('54', '10', '16', '1');
INSERT INTO `rule` VALUES ('55', '11', '16', '1');
INSERT INTO `rule` VALUES ('57', '1', '16', '1');
INSERT INTO `rule` VALUES ('58', '1', '17', '1');
INSERT INTO `rule` VALUES ('59', '11', '17', '1');
INSERT INTO `rule` VALUES ('60', '9', '17', '1');
INSERT INTO `rule` VALUES ('61', '10', '17', '1');
INSERT INTO `rule` VALUES ('62', '8', '17', '1');
INSERT INTO `rule` VALUES ('63', '7', '17', '1');
INSERT INTO `rule` VALUES ('64', '6', '17', '1');
INSERT INTO `rule` VALUES ('65', '5', '17', '1');
INSERT INTO `rule` VALUES ('66', '3', '17', '1');
INSERT INTO `rule` VALUES ('67', '4', '17', '1');
INSERT INTO `rule` VALUES ('68', '8', '18', '1');
INSERT INTO `rule` VALUES ('70', '10', '18', '1');

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
-- Records of social_account
-- ----------------------------

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
) ENGINE=InnoDB AUTO_INCREMENT=87 DEFAULT CHARSET=utf8 COMMENT='ตารางเก็บประวัติการทำงาน';

-- ----------------------------
-- Records of timeline
-- ----------------------------
INSERT INTO `timeline` VALUES ('1', null, 'kLcYl1xutvs4w9IwAX7cov', '1', '1', 'บันทึกข้อมูลการรับงาน', '2021-05-03 06:39:00', 'กราฟิก,บัญชี', '0');
INSERT INTO `timeline` VALUES ('2', null, 'kLcYl1xutvs4w9IwAX7cov', '4', '1', 'รับงาน', '2021-05-03 06:39:30', 'กราฟิก / ออกแบบ', '0');
INSERT INTO `timeline` VALUES ('3', null, 'kLcYl1xutvs4w9IwAX7cov', '3', '1', 'สั่งผลิต', '2021-05-03 06:40:38', 'งานพิมพ์', '0');
INSERT INTO `timeline` VALUES ('4', null, 'kLcYl1xutvs4w9IwAX7cov', '5', '1', 'รับงาน', '2021-05-03 06:41:16', 'งานพิมพ์(รับงาน)', '0');
INSERT INTO `timeline` VALUES ('7', null, 'kLcYl1xutvs4w9IwAX7cov', '9', '1', 'ลงบันทึกเลขจัดส่ง', '2021-05-03 06:50:10', 'จัดส่ง(รับเข้าระบบ)', '0');
INSERT INTO `timeline` VALUES ('8', null, 'kLcYl1xutvs4w9IwAX7cov', '9', '1', 'ลูกค้าได้รับสินค้าแล้ว', '2021-05-03 06:50:19', 'จัดส่ง(ยืนยันการจัดส่ง)', '0');
INSERT INTO `timeline` VALUES ('9', null, 'YPOkJWAFYTfCHxSYsJJXBh', '1', '1', 'บันทึกข้อมูลการรับงาน', '2021-05-03 06:56:00', 'กราฟิก,บัญชี', '0');
INSERT INTO `timeline` VALUES ('10', null, 'YPOkJWAFYTfCHxSYsJJXBh', '4', '1', 'รับงาน', '2021-05-03 06:56:56', 'กราฟิก / ออกแบบ', '0');
INSERT INTO `timeline` VALUES ('11', null, 'YPOkJWAFYTfCHxSYsJJXBh', '3', '1', 'สั่งผลิต', '2021-05-03 07:00:03', 'งานพิมพ์,CNC / Laser,ผลิตทั่วไป', '0');
INSERT INTO `timeline` VALUES ('12', null, 'YPOkJWAFYTfCHxSYsJJXBh', '5', '1', 'รับงาน', '2021-05-03 07:00:42', 'งานพิมพ์(รับงาน)', '0');
INSERT INTO `timeline` VALUES ('13', null, 'YPOkJWAFYTfCHxSYsJJXBh', '6', '1', 'รับงาน', '2021-05-03 07:00:54', 'CNC / Laser(รับงาน)', '0');
INSERT INTO `timeline` VALUES ('14', null, 'YPOkJWAFYTfCHxSYsJJXBh', '7', '1', 'รับงาน', '2021-05-03 07:01:00', 'ผลิตทั่วไป(รับงาน)', '0');
INSERT INTO `timeline` VALUES ('15', null, 'YPOkJWAFYTfCHxSYsJJXBh', '7', '1', 'ยืนยันการผลิต', '2021-05-03 07:01:02', 'ผลิตทั่วไป(งานผลิตเสร็จแล้ว)', '0');
INSERT INTO `timeline` VALUES ('16', null, 'YPOkJWAFYTfCHxSYsJJXBh', '6', '1', 'ยืนยันการผลิต', '2021-05-03 07:01:07', 'CNC / Laser(งานผลิตเสร็จแล้ว)', '0');
INSERT INTO `timeline` VALUES ('17', null, 'YPOkJWAFYTfCHxSYsJJXBh', '5', '1', 'ยืนยันการผลิต', '2021-05-03 07:01:12', 'งานพิมพ์(งานผลิตเสร็จแล้ว)', '0');
INSERT INTO `timeline` VALUES ('18', null, 'YPOkJWAFYTfCHxSYsJJXBh', '2', '1', 'ลงคิวงานติดตั้ง', '2021-05-03 07:03:40', 'การตลาด(ลงคิวงาน)', '0');
INSERT INTO `timeline` VALUES ('19', null, 'YPOkJWAFYTfCHxSYsJJXBh', '8', '1', 'รับงาน', '2021-05-03 07:04:18', 'ช่างติดตั้ง(รับงาน)', '0');
INSERT INTO `timeline` VALUES ('20', null, 'YPOkJWAFYTfCHxSYsJJXBh', '8', '1', 'ติดตั้งงานลูกค้า', '2021-05-03 07:04:49', 'ช่างติดตั้ง(ส่งงานลูกค้า)', '0');
INSERT INTO `timeline` VALUES ('21', null, 'QdZJar3nEGX29yFlmRp4tt', '1', '1', 'บันทึกข้อมูลการรับงาน', '2021-05-03 08:24:03', 'กราฟิก,บัญชี', '0');
INSERT INTO `timeline` VALUES ('22', null, 'QdZJar3nEGX29yFlmRp4tt', '3', '1', 'สั่งผลิต', '2021-05-04 00:35:00', 'งานพิมพ์,CNC / Laser,ผลิตทั่วไป', '0');
INSERT INTO `timeline` VALUES ('23', null, 'QdZJar3nEGX29yFlmRp4tt', '6', '1', 'รับงาน', '2021-05-04 00:35:58', 'CNC / Laser(รับงาน)', '0');
INSERT INTO `timeline` VALUES ('24', null, 'QdZJar3nEGX29yFlmRp4tt', '7', '1', 'รับงาน', '2021-05-04 00:36:28', 'ผลิตทั่วไป(รับงาน)', '0');
INSERT INTO `timeline` VALUES ('25', null, 'QdZJar3nEGX29yFlmRp4tt', '4', '1', 'รับงาน', '2021-05-04 00:36:59', 'กราฟิก / ออกแบบ', '0');
INSERT INTO `timeline` VALUES ('26', null, 'QdZJar3nEGX29yFlmRp4tt', '2', '1', 'ลงคิวงานติดตั้ง', '2021-05-04 00:38:55', 'การตลาด(ลงคิวงาน)', '0');
INSERT INTO `timeline` VALUES ('27', null, 'QdZJar3nEGX29yFlmRp4tt', '5', '1', 'รับงาน', '2021-05-04 00:40:07', 'งานพิมพ์(รับงาน)', '0');
INSERT INTO `timeline` VALUES ('28', null, 'QdZJar3nEGX29yFlmRp4tt', '5', '1', 'ยืนยันการผลิต', '2021-05-04 00:40:09', 'งานพิมพ์(งานผลิตเสร็จแล้ว)', '0');
INSERT INTO `timeline` VALUES ('29', null, 'QdZJar3nEGX29yFlmRp4tt', '6', '1', 'ยืนยันการผลิต', '2021-05-04 00:40:26', 'CNC / Laser(งานผลิตเสร็จแล้ว)', '0');
INSERT INTO `timeline` VALUES ('30', null, 'QdZJar3nEGX29yFlmRp4tt', '7', '1', 'ยืนยันการผลิต', '2021-05-04 00:40:47', 'ผลิตทั่วไป(งานผลิตเสร็จแล้ว)', '0');
INSERT INTO `timeline` VALUES ('31', null, 'QdZJar3nEGX29yFlmRp4tt', '8', '1', 'รับงาน', '2021-05-04 00:41:11', 'ช่างติดตั้ง(รับงาน)', '0');
INSERT INTO `timeline` VALUES ('32', null, 'QdZJar3nEGX29yFlmRp4tt', '8', '1', 'ติดตั้งงานลูกค้า', '2021-05-04 00:41:43', 'ช่างติดตั้ง(ส่งงานลูกค้า)', '0');
INSERT INTO `timeline` VALUES ('33', null, 'CH-65aQi1QVCFyaTkdQk5F', '1', '1', 'บันทึกข้อมูลการรับงาน', '2021-05-04 01:41:10', 'กราฟิก', '0');
INSERT INTO `timeline` VALUES ('34', null, '-rwb3A8KYS0dTuDWZc4DRT', '1', '1', 'บันทึกข้อมูลการรับงาน', '2021-05-04 01:43:38', 'กราฟิก,บัญชี', '0');
INSERT INTO `timeline` VALUES ('35', null, '-rwb3A8KYS0dTuDWZc4DRT', '3', '1', 'สั่งผลิต', '2021-05-04 01:49:21', 'งานพิมพ์,CNC / Laser,ผลิตทั่วไป', '0');
INSERT INTO `timeline` VALUES ('36', null, '-rwb3A8KYS0dTuDWZc4DRT', '5', '1', 'รับงาน', '2021-05-04 01:50:42', 'งานพิมพ์(รับงาน)', '0');
INSERT INTO `timeline` VALUES ('37', null, '-rwb3A8KYS0dTuDWZc4DRT', '5', '1', 'ยืนยันการผลิต', '2021-05-04 01:50:45', 'งานพิมพ์(งานผลิตเสร็จแล้ว)', '0');
INSERT INTO `timeline` VALUES ('38', null, '-rwb3A8KYS0dTuDWZc4DRT', '6', '1', 'รับงาน', '2021-05-04 01:50:54', 'CNC / Laser(รับงาน)', '0');
INSERT INTO `timeline` VALUES ('39', null, '-rwb3A8KYS0dTuDWZc4DRT', '6', '1', 'ยืนยันการผลิต', '2021-05-04 01:50:56', 'CNC / Laser(งานผลิตเสร็จแล้ว)', '0');
INSERT INTO `timeline` VALUES ('40', null, '-rwb3A8KYS0dTuDWZc4DRT', '7', '1', 'รับงาน', '2021-05-04 01:51:01', 'ผลิตทั่วไป(รับงาน)', '0');
INSERT INTO `timeline` VALUES ('41', null, '-rwb3A8KYS0dTuDWZc4DRT', '7', '1', 'ยืนยันการผลิต', '2021-05-04 01:51:02', 'ผลิตทั่วไป(งานผลิตเสร็จแล้ว)', '0');
INSERT INTO `timeline` VALUES ('42', null, '-rwb3A8KYS0dTuDWZc4DRT', '2', '1', 'ลงคิวงานติดตั้ง', '2021-05-04 01:53:10', 'การตลาด(ลงคิวงาน)', '0');
INSERT INTO `timeline` VALUES ('43', null, 'CH-65aQi1QVCFyaTkdQk5F', '1', '1', 'ยกเลิกงาน', '2021-05-04 04:22:12', 'ยกเลิกงาน', '2');
INSERT INTO `timeline` VALUES ('44', null, 'kLcYl1xutvs4w9IwAX7cov', '1', '1', 'ยกเลิกงาน', '2021-05-04 14:44:02', 'ยกเลิกงาน', '2');
INSERT INTO `timeline` VALUES ('45', null, 'QdZJar3nEGX29yFlmRp4tt', '1', '1', 'ยกเลิกงาน', '2021-05-04 14:44:17', 'ยกเลิกงาน', '2');
INSERT INTO `timeline` VALUES ('46', null, '-rwb3A8KYS0dTuDWZc4DRT', '1', '1', 'ยกเลิกงาน', '2021-05-04 14:44:28', 'ยกเลิกงาน', '2');
INSERT INTO `timeline` VALUES ('47', null, 'SWD9qEJmfXcw3oGSIOXkAI', '1', '1', 'บันทึกข้อมูลการรับงาน', '2021-05-04 14:44:30', 'บัญชี', '0');
INSERT INTO `timeline` VALUES ('48', null, 'YPOkJWAFYTfCHxSYsJJXBh', '1', '1', 'ยกเลิกงาน', '2021-05-04 14:44:34', 'ยกเลิกงาน', '2');
INSERT INTO `timeline` VALUES ('49', null, 'Gm26rtixrfo4yRwznzEGus', '1', '1', 'บันทึกข้อมูลการรับงาน', '2021-05-04 14:49:30', 'กราฟิก,บัญชี', '0');
INSERT INTO `timeline` VALUES ('50', null, 'SWD9qEJmfXcw3oGSIOXkAI', '4', '1', 'รับงาน', '2021-05-04 14:49:31', 'กราฟิก / ออกแบบ', '0');
INSERT INTO `timeline` VALUES ('51', null, 'SWD9qEJmfXcw3oGSIOXkAI', '1', '1', 'ยกเลิกงาน', '2021-05-04 14:50:29', 'ยกเลิกงาน', '2');
INSERT INTO `timeline` VALUES ('52', null, 'Gm26rtixrfo4yRwznzEGus', '4', '1', 'รับงาน', '2021-05-04 14:52:49', 'กราฟิก / ออกแบบ', '0');
INSERT INTO `timeline` VALUES ('53', null, '3MEAnf0PnkFKomng3t6LvM', '1', '1', 'บันทึกข้อมูลการรับงาน', '2021-05-04 14:55:03', 'บัญชี', '0');
INSERT INTO `timeline` VALUES ('54', null, '3MEAnf0PnkFKomng3t6LvM', '4', '1', 'รับงาน', '2021-05-04 14:58:57', 'กราฟิก / ออกแบบ', '0');
INSERT INTO `timeline` VALUES ('55', null, 'MIXnBtXuG0APEX5V6EXiWh', '1', '1', 'บันทึกข้อมูลการรับงาน', '2021-05-04 15:03:28', 'บัญชี', '0');
INSERT INTO `timeline` VALUES ('56', null, 'MIXnBtXuG0APEX5V6EXiWh', '4', '1', 'รับงาน', '2021-05-04 17:27:43', 'กราฟิก / ออกแบบ', '0');
INSERT INTO `timeline` VALUES ('57', null, '3MEAnf0PnkFKomng3t6LvM', '3', '1', 'สั่งผลิต', '2021-05-04 17:30:32', 'งานพิมพ์,CNC / Laser,ผลิตทั่วไป', '0');
INSERT INTO `timeline` VALUES ('58', null, '3MEAnf0PnkFKomng3t6LvM', '6', '1', 'รับงาน', '2021-05-04 17:42:21', 'CNC / Laser(รับงาน)', '0');
INSERT INTO `timeline` VALUES ('59', null, '3MEAnf0PnkFKomng3t6LvM', '6', '1', 'ยืนยันการผลิต', '2021-05-04 17:42:48', 'CNC / Laser(งานผลิตเสร็จแล้ว)', '0');
INSERT INTO `timeline` VALUES ('60', null, '3MEAnf0PnkFKomng3t6LvM', '5', '1', 'รับงาน', '2021-05-04 17:43:00', 'งานพิมพ์(รับงาน)', '0');
INSERT INTO `timeline` VALUES ('61', null, '3MEAnf0PnkFKomng3t6LvM', '5', '1', 'ยืนยันการผลิต', '2021-05-04 17:43:16', 'งานพิมพ์(งานผลิตเสร็จแล้ว)', '0');
INSERT INTO `timeline` VALUES ('62', null, '3MEAnf0PnkFKomng3t6LvM', '7', '1', 'รับงาน', '2021-05-04 17:43:26', 'ผลิตทั่วไป(รับงาน)', '0');
INSERT INTO `timeline` VALUES ('63', null, '3MEAnf0PnkFKomng3t6LvM', '7', '1', 'ยืนยันการผลิต', '2021-05-04 17:43:29', 'ผลิตทั่วไป(งานผลิตเสร็จแล้ว)', '0');
INSERT INTO `timeline` VALUES ('64', null, 'DOe_Gy7tX1cPcIeHinjorp', '1', '1', 'บันทึกข้อมูลการรับงาน', '2021-05-04 22:15:41', 'บัญชี', '0');
INSERT INTO `timeline` VALUES ('65', null, 'DOe_Gy7tX1cPcIeHinjorp', '4', '1', 'รับงาน', '2021-05-04 22:16:30', 'กราฟิก / ออกแบบ', '0');
INSERT INTO `timeline` VALUES ('66', null, 'DOe_Gy7tX1cPcIeHinjorp', '3', '1', 'สั่งผลิต', '2021-05-04 22:19:30', 'งานพิมพ์,CNC / Laser', '0');
INSERT INTO `timeline` VALUES ('67', null, 'DOe_Gy7tX1cPcIeHinjorp', '6', '1', 'รับงาน', '2021-05-04 22:19:56', 'CNC / Laser(รับงาน)', '0');
INSERT INTO `timeline` VALUES ('68', null, 'DOe_Gy7tX1cPcIeHinjorp', '6', '1', 'ยืนยันการผลิต', '2021-05-04 22:20:00', 'CNC / Laser(งานผลิตเสร็จแล้ว)', '0');
INSERT INTO `timeline` VALUES ('69', null, 'DOe_Gy7tX1cPcIeHinjorp', '5', '1', 'รับงาน', '2021-05-04 22:20:19', 'งานพิมพ์(รับงาน)', '0');
INSERT INTO `timeline` VALUES ('70', null, 'DOe_Gy7tX1cPcIeHinjorp', '5', '1', 'ยืนยันการผลิต', '2021-05-04 22:20:46', 'งานพิมพ์(งานผลิตเสร็จแล้ว)', '0');
INSERT INTO `timeline` VALUES ('71', null, 'DOe_Gy7tX1cPcIeHinjorp', '2', '1', 'ลงคิวงานติดตั้ง', '2021-05-04 22:22:25', 'การตลาด(ลงคิวงาน)', '0');
INSERT INTO `timeline` VALUES ('72', null, 'DOe_Gy7tX1cPcIeHinjorp', '8', '1', 'รับงาน', '2021-05-04 22:22:39', 'ช่างติดตั้ง(รับงาน)', '0');
INSERT INTO `timeline` VALUES ('73', null, 'DOe_Gy7tX1cPcIeHinjorp', '8', '1', 'ติดตั้งงานลูกค้า', '2021-05-04 22:26:40', 'ช่างติดตั้ง(ส่งงานลูกค้า)', '0');
INSERT INTO `timeline` VALUES ('74', null, 'RctXJWQL2-Dam-l7Fvdjrx', '1', '1', 'บันทึกข้อมูลการรับงาน', '2021-05-04 22:40:34', 'บัญชี', '0');
INSERT INTO `timeline` VALUES ('75', null, 'RctXJWQL2-Dam-l7Fvdjrx', '4', '1', 'รับงาน', '2021-05-04 22:41:17', 'กราฟิก / ออกแบบ', '0');
INSERT INTO `timeline` VALUES ('76', null, 'RctXJWQL2-Dam-l7Fvdjrx', '3', '1', 'สั่งผลิต', '2021-05-04 22:45:38', 'CNC / Laser', '0');
INSERT INTO `timeline` VALUES ('77', null, 'RctXJWQL2-Dam-l7Fvdjrx', '6', '1', 'ส่งแก้ไขงาน', '2021-05-04 22:44:17', 'cnc / laser(ส่งแก้ไข กราฟิก / ออกแบบ)', '0');
INSERT INTO `timeline` VALUES ('78', null, 'RctXJWQL2-Dam-l7Fvdjrx', '7', '1', 'รับงาน', '2021-05-04 22:46:05', 'ผลิตทั่วไป(รับงาน)', '0');
INSERT INTO `timeline` VALUES ('79', null, 'RctXJWQL2-Dam-l7Fvdjrx', '6', '1', 'รับงาน', '2021-05-04 22:46:16', 'CNC / Laser(รับงาน)', '0');
INSERT INTO `timeline` VALUES ('80', null, 'Gm26rtixrfo4yRwznzEGus', '1', '16', 'ยกเลิกงาน', '2021-05-05 08:33:12', 'ยกเลิกงาน', '2');
INSERT INTO `timeline` VALUES ('81', null, '3MEAnf0PnkFKomng3t6LvM', '1', '16', 'ยกเลิกงาน', '2021-05-05 08:33:20', 'ยกเลิกงาน', '2');
INSERT INTO `timeline` VALUES ('82', null, 'MIXnBtXuG0APEX5V6EXiWh', '1', '16', 'ยกเลิกงาน', '2021-05-05 08:33:31', 'ยกเลิกงาน', '2');
INSERT INTO `timeline` VALUES ('83', null, 'DOe_Gy7tX1cPcIeHinjorp', '1', '16', 'ยกเลิกงาน', '2021-05-05 08:33:45', 'ยกเลิกงาน', '2');
INSERT INTO `timeline` VALUES ('84', null, 'RctXJWQL2-Dam-l7Fvdjrx', '1', '16', 'ยกเลิกงาน', '2021-05-05 08:33:51', 'ยกเลิกงาน', '2');
INSERT INTO `timeline` VALUES ('85', null, '8znXEWOhq0XpngMNBDRQAX', '1', '16', 'บันทึกข้อมูลการรับงาน', '2021-05-05 08:45:52', 'บัญชี', '0');
INSERT INTO `timeline` VALUES ('86', null, '8znXEWOhq0XpngMNBDRQAX', '4', '9', 'รับงาน', '2021-05-05 08:51:25', 'กราฟิก / ออกแบบ', '0');

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
INSERT INTO `token` VALUES ('1', 'tlftZ3ffWRyuYHSUCJ-x3YF0glWGHZBL', '1617557092', '0');

-- ----------------------------
-- Table structure for transport
-- ----------------------------
DROP TABLE IF EXISTS `transport`;
CREATE TABLE `transport` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ref` varchar(50) DEFAULT NULL COMMENT 'รหัสอ้างอิง',
  `user_id` int(3) DEFAULT NULL COMMENT 'ผู้รับงาน',
  `status` int(1) DEFAULT '1' COMMENT 'สถานะ 1 ยังไม่รับงาน 2 จัดส่งแล้ว 3  สินค้าถึงลูกค้า',
  `flag` int(1) DEFAULT '0' COMMENT '0 = NoApprove 1 = Approve 2 =  Cancel',
  `create_date` timestamp NULL DEFAULT NULL,
  `confirm_date` timestamp NULL DEFAULT NULL,
  `address` text COMMENT 'ที่อยู่จัดส่ง',
  `tagnumber` varbinary(100) DEFAULT NULL COMMENT 'เลขติดตามสินค้า',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='แผนกจัดส่ง';

-- ----------------------------
-- Records of transport
-- ----------------------------
INSERT INTO `transport` VALUES ('1', 'kLcYl1xutvs4w9IwAX7cov', '1', '3', '0', '2021-05-03 06:50:10', '2021-05-03 06:50:19', 'ที่อยู่ ร้าน dIew factory autoparts (ติดไอยรารีสอร์ต) โทร 080-6961466 61/17 ม.15 ต.คลองสอง อ.คลองหลวง จ.ปทุมธานี 12120', 0x54482D3132333435363539383339);
INSERT INTO `transport` VALUES ('2', 'YPOkJWAFYTfCHxSYsJJXBh', null, '1', '0', null, null, null, null);
INSERT INTO `transport` VALUES ('3', 'QdZJar3nEGX29yFlmRp4tt', null, '1', '0', null, null, null, null);
INSERT INTO `transport` VALUES ('4', '-rwb3A8KYS0dTuDWZc4DRT', null, '1', '0', null, null, null, null);
INSERT INTO `transport` VALUES ('6', '3MEAnf0PnkFKomng3t6LvM', null, '1', '0', null, null, null, null);
INSERT INTO `transport` VALUES ('9', 'RctXJWQL2-Dam-l7Fvdjrx', null, '1', '0', null, null, null, null);

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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of uploads
-- ----------------------------
INSERT INTO `uploads` VALUES ('1', 'PsY4xb_OEKsfjXUlNfXfjX', 'bill_010_original.jpeg', '540546cbdd94944782befe03ec25272b.jpeg', '2021-05-03 13:40:38', null, null, '1');
INSERT INTO `uploads` VALUES ('2', 'bOhQLm1Gl5U9CQJQIR3dG3', '11270506_989072404466200_6086238662844831063_o.jpeg', '2ec695ce4dd8a656d5540e67b59ccca5.jpeg', '2021-05-03 14:00:03', null, null, '1');
INSERT INTO `uploads` VALUES ('3', 'WDmAIL3jIRLode4yyQOTlW', '26.png', '82a6ca9899682b6d6fe381eeb4224dcd.png', '2021-05-03 14:04:48', null, null, '1');
INSERT INTO `uploads` VALUES ('4', 'WDmAIL3jIRLode4yyQOTlW', '3862_list.jpeg', '1f28631efc05fd0c9d5af901a412fe35.jpeg', '2021-05-03 14:04:48', null, null, '1');
INSERT INTO `uploads` VALUES ('5', 'WDmAIL3jIRLode4yyQOTlW', '11270506_989072404466200_6086238662844831063_o.jpeg', '1c607e8dde3a727ee08f87159ccefa58.jpeg', '2021-05-03 14:04:49', null, null, '1');
INSERT INTO `uploads` VALUES ('6', 'SWD9qEJmfXcw3oGSIOXkAI', 'ชาบูอินดี้.jpg', 'bd15d8170e89fa00867964bb8b6cbea5.jpg', '2021-05-04 14:44:30', null, null, '1');
INSERT INTO `uploads` VALUES ('7', 'Gm26rtixrfo4yRwznzEGus', 'ชาบูอินดี้.jpg', '4800bb9d060a84781bd4d831039abe69.jpg', '2021-05-04 14:49:30', null, null, '1');
INSERT INTO `uploads` VALUES ('8', '3MEAnf0PnkFKomng3t6LvM', 'Bombay.jpg', '159e9ec8da951dba17cf29d5fcc38428.jpg', '2021-05-04 14:55:03', null, null, '1');
INSERT INTO `uploads` VALUES ('9', 'MIXnBtXuG0APEX5V6EXiWh', 'chamook.jpg', '62f2d8e609a924510d6f3382f9ea1b06.jpg', '2021-05-04 15:03:28', null, null, '1');
INSERT INTO `uploads` VALUES ('10', 'DOe_Gy7tX1cPcIeHinjorp', '1620138183646.jpg', 'fdfbd30646a1875893293115b8a54bda.jpg', '2021-05-04 22:14:03', null, null, '1');
INSERT INTO `uploads` VALUES ('11', 'RctXJWQL2-Dam-l7Fvdjrx', 'messageImage_1620116043235.jpg', '9d85532a12db0f6153a44544b1b90578.jpg', '2021-05-04 22:39:01', null, null, '1');
INSERT INTO `uploads` VALUES ('12', '386cVutHlZBTVmGHmKHhqS', 'SAFE COVID 7 2.jpg', '136259092812d76ed25752a35265ca55.jpg', '2021-05-04 22:44:57', null, null, '1');

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
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'admin', 'kimniyomclub@gmail.com', '$2y$12$MenOVpHsMKOW0zYIFAD1ruqkamrLlEG1YIkcKOD9/eGmR9ECXzzsO', 'eVObZ98v26jv2RAmbdeUIlaHK4uJ8S-8', '1617557741', null, null, '::1', '1617557092', '1617557092', '0', '1620176854', 'A');
INSERT INTO `user` VALUES ('2', 'demo', 'demo@gmail.com', '$2y$12$ScVrSZM1VaIdB7rwZBAuK.SgNSPj8zvXPIO2n5jR.pHnw4EWjCWJ.', 'plDiCAlz6oFWCndrv4WHPeObSu1Ucf5-', '1617559566', null, null, '::1', '1617559566', '1618997823', '0', '1620112332', 'U');
INSERT INTO `user` VALUES ('6', 'kimniyom', '123@gmail.com', '$2y$12$NL13psXOId80ykwkmNYdte/GXhrd/jXsHNms.WpWO.N6O6fVnAS42', 'b3uR2qjlXICxPVN7h-FDBTWMUON8R7v0', '1618703595', null, null, '::1', '1618703595', '1618703595', '0', '1619066604', 'U');
INSERT INTO `user` VALUES ('8', 'marketing1', 'marketing@natdesigntak.com', '$2y$12$s9nzt0ro08WKmok.HTgWIegzowEBAbE6gSwBGtp173ts28ndZ9ZJ6', 'bQYe0AA-eiJ69oCPWXDonoYYT1vbmXzY', '1620129337', null, null, '49.48.207.49', '1620129337', '1620129374', '0', '1620178066', 'U');
INSERT INTO `user` VALUES ('9', 'Accounts1', 'ac1@natdesigntak.com', '$2y$12$X5TE/UD40FwEmZj3BRjc5uypvXluCVFGXRrW1pFcsLllrPY8NRtp6', 'eKLsvIznGZzAiyFlsn6Qvds00HEQfqbM', '1620129817', null, null, '49.48.207.49', '1620129817', '1620130114', '0', '1620179258', 'U');
INSERT INTO `user` VALUES ('10', 'Accounts2', 'ac2@natdesigntak.com', '$2y$12$QblQzpX/Sk81fo1WLjAeMuTVfvPmmvWnbXNwwybO1qKtU.mPtIK.G', '-jfekN7HnwR73tuDEK6TwOnmLdEFvNzJ', '1620129989', null, null, '49.48.207.49', '1620129989', '1620129989', '0', null, 'U');
INSERT INTO `user` VALUES ('11', 'Accounts3', 'ac3@natdesigntak.com', '$2y$12$3YcoXHOgG86PFjNCGVXjyeRFu2mEIKT67Clwfa/nv3fzLwwKnAo4e', 'pkbsihmPGfI4x7FcaMU1KiUv5Ho3wRc6', '1620130146', null, null, '49.48.207.49', '1620130146', '1620130146', '0', null, 'U');
INSERT INTO `user` VALUES ('12', 'Graphic', 'graphic@natdesigntak.com', '$2y$12$N7T0Tt2c7XWS7hyxMdu5UOKKcJQe9S1lVjOpo6GafgRBD0JuDh/Oq', '3qtUEslIie7ne69JE8EVRq-vrRaQX3dl', '1620175500', null, null, '49.48.207.49', '1620175500', '1620175500', '0', '1620178500', 'U');
INSERT INTO `user` VALUES ('13', 'Printing', 'printing@natdesigntak.com', '$2y$12$dFsnaM4YK4hWmigMg7lkLON.F0GDfo8I3NDoU96PnqgsyxCbaNcOS', '4AXQJ3nEQeHgr2NJRbFDPg4bm41pGxNt', '1620175748', null, null, '49.48.207.49', '1620175748', '1620175748', '0', '1620178002', 'U');
INSERT INTO `user` VALUES ('14', 'Cutting', 'cutting@natdesigntak.com', '$2y$12$IIqEX/DEnGZQRsRoYc3cn.mhlCilwYtXxdeeMAfSwAoQpmfbJA6u.', 'UmkEjlfj1zIoE6EJV5fjgY3oFOlXsPjN', '1620175853', null, null, '49.48.207.49', '1620175853', '1620175853', '0', '1620178041', 'U');
INSERT INTO `user` VALUES ('15', 'Production', 'production@natdesigntak.com', '$2y$12$2do7mdU6ZiAhba/YEILfA.IczvN1rrN7h.SyNP0lh4sXqqBBQTgrK', 'wxUxRY0j2gB7G25KIiy_EDgwwjI7Ix1L', '1620175993', null, null, '49.48.207.49', '1620175993', '1620175993', '0', '1620178011', 'U');
INSERT INTO `user` VALUES ('16', 'Manager', 'fern.worra@gmail.com', '$2y$12$TiFEAn9cL3UakE27cnu47ekuE3AQTyWQ53Mx/mR2JDTbMYhIN87de', 'K6gJiIuWqij2QCXAMjDaoyjohdcwm6-9', '1620176182', null, null, '49.48.207.49', '1620176182', '1620176916', '0', '1620179537', 'A');
INSERT INTO `user` VALUES ('17', 'Executive', 'natmawan@hotmail.com', '$2y$12$jIVCoRW81Qnr4rl6.7OI9OglR3ETOPQ69qGcIc032.MTdeDVuZ2MK', '-8BOjhYHFCiHXlkp8OJ3BHzW3fQd5mc4', '1620176380', null, null, '49.48.207.49', '1620176380', '1620176886', '0', '1620176897', 'A');
INSERT INTO `user` VALUES ('18', 'Installation', 'installation@natdesigntak.com', '$2y$12$o4JIXmsaoTZwq.1XXOOYfO7Fx6d0P8VsIg.60gViV5RJrJxnJvAu6', 'gI345KcOtEtapIWkCDk8ZnA0yyiNDi-n', '1620176694', null, null, '49.48.207.49', '1620176694', '1620176694', '0', '1620178032', 'U');
