/*
Navicat MySQL Data Transfer

Source Server         : 122.154.239.66
Source Server Version : 50640
Source Host           : 127.0.0.1:3333
Source Database       : nutdesign_db

Target Server Type    : MYSQL
Target Server Version : 50640
File Encoding         : 65001

Date: 2021-05-09 13:44:45
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
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8 COMMENT='ตารางแผนกบัญชี';

-- ----------------------------
-- Records of account
-- ----------------------------
INSERT INTO `account` VALUES ('1', null, 'W_Dy_0CqF2px9NwnokjDCE', null, null, '9', null, '1', '0', '2021-05-05 09:15:50', '2021-05-05 09:15:50', '<p><a href=\"/nutdesign/web/uploads/9/8429147be8-lineoachat210505091304.jpg\">8429147be8-lineoachat210505091304.jpg</a></p><p>ไม่ต้องทำใบเสนอราคา ยอดเสนอราคาถูกต้อง</p><p><a href=\"/nutdesign/web/uploads/9/8429147be8-lineoachat210505091304.jpg\"></a>ตรวจสอบแล้ว ลูกค้าชำระเงินแล้ว</p>', null);
INSERT INTO `account` VALUES ('2', null, 'LpFjgcw2rQ7R8maXPwoNE6', null, null, '9', null, '1', '0', '2021-05-05 09:58:44', '2021-05-05 09:58:44', '<p><a href=\"https://doc-api.flowaccount.com/quotation/share/html/th/gwibw79hieya8bm9le3cw\">ใบเสนอราคา QT2021050015  https://doc-api.flowaccount.com/quotation/share/html/th/gwibw79hieya8bm9le3cw</a></p><p>ตรวจสอบแล้ว </p><p><a href=\"https://doc-api.flowaccount.com/quotation/share/html/th/gwibw79hieya8bm9le3cw\"></a></p>', null);
INSERT INTO `account` VALUES ('3', null, '80WMVrjv2tuVl5n9cC_CKy', null, null, '9', null, '1', '0', '2021-05-05 10:01:40', '2021-05-05 10:01:40', '<p><a href=\"/nutdesign/web/uploads/9/a32d7ca0bd-lineoachat210505100015.jpg\">a32d7ca0bd-lineoachat210505100015.jpg</a></p><p>ไม่ต้องทำใบเสนอราคา ยอดเสนอราคาถูกต้อง</p><p>ตรวจสอบแล้ว ลูกค้าโอนเงินชำระแล้ว</p>', null);
INSERT INTO `account` VALUES ('4', null, 'Yf5vTaeciRsnZN5M-I9sLI', null, null, '9', null, '1', '0', '2021-05-05 10:04:04', '2021-05-05 10:04:04', '<p><a href=\"/nutdesign/web/uploads/9/2e1dc318a6-lineoachat210505100259.jpg\">2e1dc318a6-lineoachat210505100259.jpg</a></p><p>ไม่ต้องทำใบเสนอราคา ยอดเสนอราคาถูกต้อง</p><p>ตรวจสอบแล้ว ลูกค้าโอนชำระเงินแล้ว</p>', null);
INSERT INTO `account` VALUES ('5', null, '76hIJ7ACiXmWpNWvGLspUW', null, null, '9', null, '1', '0', '2021-05-05 10:08:17', '2021-05-05 10:08:17', '<p>ใบเสนอราคา QT2021050017 <a href=\"https://doc-api.flowaccount.com/quotation/share/html/th/y1jpqjxre0qkuyjtu5ow2w\">https://doc-api.flowaccount.com/quotation/share/html/th/y1jpqjxre0qkuyjtu5ow2w</a></p><p>ยอดเสนอราคาถูกต้อง ตรวจสอบแล้ว</p><p>ลูกค้าโอนชำระเงินมัดจำแล้ว <a href=\"/nutdesign/web/uploads/9/bed60d5b62-lineoachat210505082712.jpg\">bed60d5b62-lineoachat210505082712.jpg</a><span style=\"background-color: initial;\"></span></p>', null);
INSERT INTO `account` VALUES ('6', null, 'KINCuRWXK3PMUAOwfw0IA5', null, null, '9', null, '1', '0', '2021-05-05 13:29:42', '2021-05-05 13:29:42', '<p>ใบเสนอราคา QT2021050018 <span></span><a href=\"https://doc-api.flowaccount.com/quotation/share/html/th/luvta1pujegcbkv2lfwd2a\">https://doc-api.flowaccount.com/quotation/share/ht...</a></p><p>ตรวจสอบแล้ว ยอดเสนอราคาถูกต้อง</p>', null);
INSERT INTO `account` VALUES ('7', null, '_TDDyi2XV9OSkAs_phSlcX', null, null, '9', null, '1', '0', '2021-05-05 16:12:19', '2021-05-05 16:12:19', '<p>ตรวจสอบแล้ว ลูกค้ารับงานหน้าร้านชำระเงินสดแล้ว</p>', null);
INSERT INTO `account` VALUES ('8', null, 'H5O9zgJoDb6GiMH_xX4mPE', null, null, '1', null, '1', '0', '2021-05-05 10:42:05', '2021-05-05 10:42:05', '<p>กรุณาทำใบเสนอราคา</p>', null);
INSERT INTO `account` VALUES ('9', null, 'aqoqo21ctwWwK8PhqFKfqs', null, null, '16', null, '1', '0', '2021-05-06 11:03:59', '2021-05-06 11:03:59', '<p>ตรวจสอบแล้ว ลูกค้ารับงานชำระสดหน้าร้านแล้ว</p>', null);
INSERT INTO `account` VALUES ('10', null, '1-deFHIsDp8UH_1LfynQ33', null, null, '9', null, '1', '0', '2021-05-05 13:30:24', '2021-05-05 13:30:24', '<p>ใบเสนอราคา QT2021050018 <a href=\"https://doc-api.flowaccount.com/quotation/share/html/th/luvta1pujegcbkv2lfwd2a\">https://doc-api.flowaccount.com/quotation/share/ht...</a></p><p><a href=\"https://doc-api.flowaccount.com/quotation/share/html/th/luvta1pujegcbkv2lfwd2a\"></a>ตรวจสอบแล้ว ยอดเสนอราคาถูกต้อง</p>', null);
INSERT INTO `account` VALUES ('11', null, 'l7bbwQI9C4UqeU9f7nnwZB', null, null, '9', null, '1', '0', '2021-05-05 14:15:39', '2021-05-05 14:15:39', '<p>ใบเสนอราคา QT2021050011 <span></span><a href=\"https://doc-api.flowaccount.com/quotation/share/html/th/2nsj1mvgakqicuaop62pw\">https://doc-api.flowaccount.com/quotation/share/ht...</a></p><p><a href=\"https://doc-api.flowaccount.com/quotation/share/html/th/2nsj1mvgakqicuaop62pw\"></a>ตรวจสอบแล้ว ยอดเสนอราคาถูกต้อง</p>', null);
INSERT INTO `account` VALUES ('12', null, 'HQcTSNCNtgc3SWwo5aAeAE', null, null, '9', null, '1', '0', '2021-05-05 15:55:52', '2021-05-05 15:55:52', '<p>ตรวจสอบแล้ว ยอดเสนอราคาถูกต้องค่ะ</p><p>ลูกค้าโอนเงินแล้ว <a href=\"/nutdesign/web/uploads/9/fa0220566b-lineoachat210505155519.jpg\">fa0220566b-lineoachat210505155519.jpg</a></p>', null);
INSERT INTO `account` VALUES ('13', null, 'ZevKuy2Fnz8Bmpa1RsXKSI', null, null, '9', null, '1', '0', '2021-05-05 16:07:51', '2021-05-05 16:07:51', '<p>ใบเสนอราคา QT2021050003 <a href=\"https://doc-api.flowaccount.com/quotation/share/html/th/rxvlohw7eyb3dzppcul8w\">https://doc-api.flowaccount.com/quotation/share/ht...</a></p><p><a href=\"https://doc-api.flowaccount.com/quotation/share/html/th/rxvlohw7eyb3dzppcul8w\"></a>ใบส่งของ/แจ้งหนี้  BL2021050014 <span></span><a href=\"https://doc-api.flowaccount.com/billingnote/share/html/th/slw0rawlo0ul9a48nkdiq?DoCopies=0&amp;DoOriginal=1&amp;InvoiceCopy=0&amp;IsIncludePaymentDetail=0&amp;TaxInvoiceCopy=0\">https://doc-api.flowaccount.com/billingnote/share/...</a></p><p><a href=\"https://doc-api.flowaccount.com/billingnote/share/html/th/slw0rawlo0ul9a48nkdiq?DoCopies=0&amp;DoOriginal=1&amp;InvoiceCopy=0&amp;IsIncludePaymentDetail=0&amp;TaxInvoiceCopy=0\"></a>ตรวจสอบแล้ว วางบิลแล้ว</p>', null);
INSERT INTO `account` VALUES ('14', null, 'lER6-HE2lJwDeTY21TlJ6s', null, null, '9', null, '1', '0', '2021-05-05 17:09:38', '2021-05-05 17:09:38', '<p>ใบเสนอราคา QT2021050020 <a href=\"https://doc-api.flowaccount.com/quotation/share/html/th/8bzmhxbknesplmx0bkjura\">https://doc-api.flowaccount.com/quotation/share/ht...</a></p><p>ตรวจสอบแล้ว </p>', null);
INSERT INTO `account` VALUES ('15', null, 'Pel7uZlkWv70QlEM7N_lKb', null, null, '9', null, '1', '0', '2021-05-05 17:32:11', '2021-05-05 17:32:11', '<p>ตรวจสอบแล้ว</p>', null);
INSERT INTO `account` VALUES ('16', null, 'ZJpRfgA-Sg1-iQ0c_lFTPA', null, null, '16', null, '1', '0', '2021-05-06 11:07:30', '2021-05-06 11:07:30', '<p>-</p>', null);
INSERT INTO `account` VALUES ('17', null, '-D3HjJnBYj_bngAK3ut3Nc', null, null, '9', null, '1', '0', '2021-05-06 13:50:01', '2021-05-06 13:50:01', '<p>ใบเสนอราคา QT2021040102 <a href=\"https://doc-api.flowaccount.com/quotation/share/html/th/nbvnctidke614zjmhtlca\">https://doc-api.flowaccount.com/quotation/share/ht...</a></p><p><a href=\"https://doc-api.flowaccount.com/quotation/share/html/th/nbvnctidke614zjmhtlca\"></a>ตรวจสอบแล้ว </p>', null);
INSERT INTO `account` VALUES ('18', null, 'BdSi1aloNqzKqs1dRzh_Mb', null, null, '9', null, '1', '0', '2021-05-06 13:48:04', '2021-05-06 13:48:04', '<p>ตรวจสอบแล้ว ลูกค้าโอนชำระเงินแล้ว<a href=\"/nutdesign/web/uploads/9/7a2196c2a9-lineoachat210506134727.jpg\">7a2196c2a9-lineoachat210506134727.jpg</a></p>', null);
INSERT INTO `account` VALUES ('19', null, '72IH6IoMq2GVAY6g6j9cWI', null, null, '9', null, '1', '0', '2021-05-06 13:54:54', '2021-05-06 13:54:54', '<p>ตรวจสอบแล้ว ลูกค้าโอนชำระเงินแล้ว</p><p><a href=\"/nutdesign/web/uploads/9/8c81772ad6-lineoachat210506135421.jpg\">8c81772ad6-lineoachat210506135421.jpg</a><br></p>', null);
INSERT INTO `account` VALUES ('20', null, 'JK9-EvGZcUUQ_i7KnFAycm', null, null, '9', null, '1', '0', '2021-05-07 13:50:33', '2021-05-07 13:50:33', '<p>ตรวจสอบแล้ว ลูกค้าโอนชำระเงินแล้ว</p><p><a href=\"/nutdesign/web/uploads/9/4cc4c601a6-lineoachat210507134955.jpg\">4cc4c601a6-lineoachat210507134955.jpg</a><br></p>', null);
INSERT INTO `account` VALUES ('21', null, 'kLtTSk2dfLXj3wJUeKAQdV', null, null, '9', null, '1', '0', '2021-05-07 14:00:06', '2021-05-07 14:00:06', '<p>ใบเสนอราคา QT2021050026  <a href=\"https://doc-api.flowaccount.com/quotation/share/html/th/oldkhrs1leavzxoqm5f3qq\">https://doc-api.flowaccount.com/quotation/share/ht...</a></p><p><a href=\"https://doc-api.flowaccount.com/quotation/share/html/th/oldkhrs1leavzxoqm5f3qq\"></a>ตรวจสอบแล้ว</p>', null);
INSERT INTO `account` VALUES ('22', null, 'DyGy_kfng8CV9Jnd-DKGxK', null, null, '9', null, '1', '0', '2021-05-07 14:05:04', '2021-05-07 14:05:04', '<p>ตรวจสอบแล้ว ลูกค้าโอนชำระเงินแล้ว</p><p><a href=\"/nutdesign/web/uploads/9/74750cd7f0-lineoachat210507140432.jpg\">74750cd7f0-lineoachat210507140432.jpg</a><br></p>', null);
INSERT INTO `account` VALUES ('23', null, 'uy0t1Xm7NfCoTw2rD1zKU9', null, null, '9', null, '1', '0', '2021-05-07 14:08:13', '2021-05-07 14:08:13', '<p>ตรวจสอบแล้ว </p>', null);
INSERT INTO `account` VALUES ('24', null, '_kn8kDdx84Qpsh3jCEO0cP', null, null, '9', null, '1', '0', '2021-05-07 14:07:33', '2021-05-07 14:07:33', '<p>ตรวจสอบแล้ว ลูกค้าโอนชำระเงินแล้ว</p><p><a href=\"/nutdesign/web/uploads/9/137683c281-lineoachat210507140716.jpg\">137683c281-lineoachat210507140716.jpg</a><br></p>', null);
INSERT INTO `account` VALUES ('25', null, 'MFzzD00Me92O7h2Jy0vzHu', null, null, '9', null, '1', '0', '2021-05-07 16:33:49', '2021-05-07 16:33:49', '<p>ใบเสนอราคา QT2021050023 <a href=\"https://doc-api.flowaccount.com/quotation/share/html/th/nrv9w4f0usq3x5pyjwcyq\">https://doc-api.flowaccount.com/quotation/share/ht...</a></p><p><a href=\"https://doc-api.flowaccount.com/quotation/share/html/th/nrv9w4f0usq3x5pyjwcyq\"></a>ตรวจสอบแล้ว ลูกค้าโอนชำระเงินแล้ว</p><p><a href=\"/nutdesign/web/uploads/9/f82aee12a7-lineoachat210507155835.jpg\">f82aee12a7-lineoachat210507155835.jpg</a></p>', null);
INSERT INTO `account` VALUES ('26', null, '2hhEmcmI5HiRzfrZUDbcpd', null, null, '9', null, '1', '0', '2021-05-07 16:36:14', '2021-05-07 16:36:14', '<p>ตรวจสอบแล้ว ลูกค้าโอนชำระเงินแล้ว</p><p><a href=\"/nutdesign/web/uploads/9/8e50083107-lineoachat210507163536.jpg\">8e50083107-lineoachat210507163536.jpg</a><br></p>', null);
INSERT INTO `account` VALUES ('27', null, 'lqPKHuXygVGDIpYsyI9kt7', null, null, '9', null, '1', '0', '2021-05-08 15:35:45', '2021-05-08 15:35:45', '<p>ตรวจสอบแล้ว</p>', null);
INSERT INTO `account` VALUES ('28', null, 'kUH617ueCSMo-_c7ONrmLW', null, null, '9', null, '1', '0', '2021-05-08 10:18:00', '2021-05-08 10:18:00', '<p>ใบเสนอราคา QT2021050033 <a href=\"https://doc-api.flowaccount.com/quotation/share/html/th/m0o5f4bkleyhzokyo6yhoq?DoCopies=1&amp;DoOriginal=1&amp;InvoiceCopy=0&amp;IsIncludePaymentDetail=0&amp;TaxInvoiceCopy=0\">https://doc-api.flowaccount.com/quotation/share/ht...</a></p><p><a href=\"https://doc-api.flowaccount.com/quotation/share/html/th/m0o5f4bkleyhzokyo6yhoq?DoCopies=1&amp;DoOriginal=1&amp;InvoiceCopy=0&amp;IsIncludePaymentDetail=0&amp;TaxInvoiceCopy=0\"></a>ตรวจสอบแล้ว</p>', null);
INSERT INTO `account` VALUES ('29', null, 'KpZoS2n0XXjgWrCvn1MOKS', null, null, '9', null, '1', '0', '2021-05-08 15:26:30', '2021-05-08 15:26:30', '<p>ตรวจสอบแล้ว</p>', null);
INSERT INTO `account` VALUES ('30', null, 'rJAJa1zr9t8YihRUh5yKM6', null, null, '9', null, '1', '0', '2021-05-08 15:23:42', '2021-05-08 15:23:42', '<p>ตรวจสอบแล้ว ลูกค้าโอนชำระเงินแล้ว</p><p><a href=\"/nutdesign/web/uploads/9/9967273492-lineoachat210508152305.jpg\">9967273492-lineoachat210508152305.jpg</a><br></p>', null);
INSERT INTO `account` VALUES ('31', null, 'X77vrRC85W3ppSbUrwoP43', null, null, '9', null, '1', '0', '2021-05-08 15:33:34', '2021-05-08 15:33:34', '<p>ตรวจสอบแล้ว ลูกค้าโอนชำระเงินแล้ว</p><p><a href=\"/nutdesign/web/uploads/9/51d4383bb4-lineoachat210508153245.jpg\">51d4383bb4-lineoachat210508153245.jpg</a><br></p>', null);
INSERT INTO `account` VALUES ('32', null, 'm0KhYK9RmwgVOGo-0MmlhG', null, null, '9', null, '1', '0', '2021-05-08 15:24:49', '2021-05-08 15:24:49', '<p>ตรวจสอบแล้ว</p>', null);
INSERT INTO `account` VALUES ('33', null, 'WQGXPhm9vwlsfnZA11AWaY', null, null, '9', null, '1', '0', '2021-05-08 15:34:28', '2021-05-08 15:34:28', '<p>ตรวจสอบแล้ว</p>', null);
INSERT INTO `account` VALUES ('34', null, 'ASSAjitIb9LjfuW4kfBfqk', null, null, null, null, '0', '0', null, null, null, null);
INSERT INTO `account` VALUES ('35', null, 'ceO-2fQclNvEJwDd4S7jIy', null, null, null, null, '0', '0', null, null, null, null);

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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COMMENT='งานผลิตทั่วไป';

-- ----------------------------
-- Records of branchfacture
-- ----------------------------
INSERT INTO `branchfacture` VALUES ('1', 'W_Dy_0CqF2px9NwnokjDCE', '16', '4', '0', '2021-05-05 10:22:18', '2021-05-05 10:22:21');
INSERT INTO `branchfacture` VALUES ('2', '76hIJ7ACiXmWpNWvGLspUW', '15', '4', '0', '2021-05-05 13:16:40', '2021-05-05 13:17:15');
INSERT INTO `branchfacture` VALUES ('3', 'Yf5vTaeciRsnZN5M-I9sLI', '16', '4', '0', '2021-05-05 17:24:17', '2021-05-05 17:24:19');
INSERT INTO `branchfacture` VALUES ('4', 'HQcTSNCNtgc3SWwo5aAeAE', '16', '4', '0', '2021-05-05 17:24:23', '2021-05-05 17:24:25');
INSERT INTO `branchfacture` VALUES ('5', '80WMVrjv2tuVl5n9cC_CKy', '16', '4', '0', '2021-05-05 17:23:39', '2021-05-05 17:23:41');
INSERT INTO `branchfacture` VALUES ('6', '_TDDyi2XV9OSkAs_phSlcX', '16', '4', '0', '2021-05-05 17:30:29', '2021-05-05 17:30:35');
INSERT INTO `branchfacture` VALUES ('8', '1-deFHIsDp8UH_1LfynQ33', '8', '4', '0', '2021-05-07 16:14:09', '2021-05-07 16:14:12');
INSERT INTO `branchfacture` VALUES ('9', 'l7bbwQI9C4UqeU9f7nnwZB', '8', '4', '0', '2021-05-06 17:28:11', '2021-05-06 17:28:14');
INSERT INTO `branchfacture` VALUES ('10', 'BdSi1aloNqzKqs1dRzh_Mb', null, '1', '0', null, null);
INSERT INTO `branchfacture` VALUES ('11', 'ZJpRfgA-Sg1-iQ0c_lFTPA', '8', '4', '0', '2021-05-07 16:14:16', '2021-05-07 16:14:18');
INSERT INTO `branchfacture` VALUES ('12', '-D3HjJnBYj_bngAK3ut3Nc', null, '1', '0', null, null);
INSERT INTO `branchfacture` VALUES ('13', 'JK9-EvGZcUUQ_i7KnFAycm', '8', '4', '0', '2021-05-08 11:54:45', '2021-05-08 11:54:47');

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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='งาน laser';

-- ----------------------------
-- Records of branchlaser
-- ----------------------------
INSERT INTO `branchlaser` VALUES ('1', 'H5O9zgJoDb6GiMH_xX4mPE', '17', '4', '0', '2021-05-05 11:47:08', '2021-05-05 11:47:11');
INSERT INTO `branchlaser` VALUES ('2', '76hIJ7ACiXmWpNWvGLspUW', '14', '4', '0', '2021-05-07 13:02:56', '2021-05-07 13:02:59');
INSERT INTO `branchlaser` VALUES ('3', 'Yf5vTaeciRsnZN5M-I9sLI', '16', '4', '0', '2021-05-05 17:24:42', '2021-05-05 17:24:45');
INSERT INTO `branchlaser` VALUES ('4', 'HQcTSNCNtgc3SWwo5aAeAE', '16', '4', '0', '2021-05-05 17:24:48', '2021-05-05 17:24:50');
INSERT INTO `branchlaser` VALUES ('5', '80WMVrjv2tuVl5n9cC_CKy', '16', '4', '0', '2021-05-05 17:23:32', '2021-05-05 17:23:34');
INSERT INTO `branchlaser` VALUES ('6', 'l7bbwQI9C4UqeU9f7nnwZB', '8', '4', '0', '2021-05-06 17:28:20', '2021-05-06 17:28:22');
INSERT INTO `branchlaser` VALUES ('7', 'BdSi1aloNqzKqs1dRzh_Mb', '8', '4', '0', '2021-05-07 09:28:11', '2021-05-07 09:28:14');
INSERT INTO `branchlaser` VALUES ('8', 'ZJpRfgA-Sg1-iQ0c_lFTPA', '8', '4', '0', '2021-05-07 10:57:05', '2021-05-07 10:57:07');

-- ----------------------------
-- Table structure for `branchmarketing`
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
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COMMENT='งานพิมพ์';

-- ----------------------------
-- Records of branchprint
-- ----------------------------
INSERT INTO `branchprint` VALUES ('1', 'W_Dy_0CqF2px9NwnokjDCE', '16', '4', '0', '2021-05-05 10:21:34', '2021-05-05 10:21:48');
INSERT INTO `branchprint` VALUES ('2', '76hIJ7ACiXmWpNWvGLspUW', '16', '2', '0', '2021-05-05 14:09:03', null);
INSERT INTO `branchprint` VALUES ('3', 'LpFjgcw2rQ7R8maXPwoNE6', '13', '4', '0', '2021-05-05 13:34:59', '2021-05-05 13:35:05');
INSERT INTO `branchprint` VALUES ('4', 'Yf5vTaeciRsnZN5M-I9sLI', '13', '4', '0', '2021-05-05 13:35:08', '2021-05-05 13:37:28');
INSERT INTO `branchprint` VALUES ('5', 'aqoqo21ctwWwK8PhqFKfqs', '16', '4', '0', '2021-05-05 13:51:30', '2021-05-05 13:51:54');
INSERT INTO `branchprint` VALUES ('6', '_TDDyi2XV9OSkAs_phSlcX', '16', '4', '0', '2021-05-05 17:30:25', '2021-05-05 17:30:33');
INSERT INTO `branchprint` VALUES ('8', 'Pel7uZlkWv70QlEM7N_lKb', '16', '4', '0', '2021-05-06 14:30:31', '2021-05-06 15:06:18');
INSERT INTO `branchprint` VALUES ('11', '1-deFHIsDp8UH_1LfynQ33', '8', '4', '0', '2021-05-08 11:54:59', '2021-05-08 11:55:01');
INSERT INTO `branchprint` VALUES ('12', 'l7bbwQI9C4UqeU9f7nnwZB', '8', '4', '0', '2021-05-06 17:30:47', '2021-05-06 17:30:50');
INSERT INTO `branchprint` VALUES ('13', '-D3HjJnBYj_bngAK3ut3Nc', null, '1', '0', null, null);
INSERT INTO `branchprint` VALUES ('14', 'JK9-EvGZcUUQ_i7KnFAycm', '8', '4', '0', '2021-05-08 11:55:04', '2021-05-08 11:55:07');
INSERT INTO `branchprint` VALUES ('15', 'DyGy_kfng8CV9Jnd-DKGxK', null, '1', '0', null, null);
INSERT INTO `branchprint` VALUES ('16', 'kLtTSk2dfLXj3wJUeKAQdV', '8', '4', '0', '2021-05-08 11:55:13', '2021-05-08 11:55:15');
INSERT INTO `branchprint` VALUES ('17', 'uy0t1Xm7NfCoTw2rD1zKU9', '8', '4', '0', '2021-05-08 11:55:54', '2021-05-08 11:55:56');

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
  `technician_status` int(1) DEFAULT '0' COMMENT 'แผนกช่าง 0 ไม่ผลิต 1 = รับงาน 2 ติดตั้งเสร็จ',
  `approve` int(1) DEFAULT '0' COMMENT '0 = ยังไม่ส่งมอบงานลูกค้า 1 = ส่งมอบงานลูกค้า',
  `userapprove` int(11) DEFAULT NULL COMMENT 'พนักงานส่งมอบงาน',
  `confirmdate` timestamp NULL DEFAULT NULL COMMENT 'วันที่ยืนยัน',
  `comment` varchar(255) DEFAULT NULL COMMENT 'comment',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8 COMMENT='เก็บรายละเอียดลูกค้า / รับงาน';

-- ----------------------------
-- Records of customer
-- ----------------------------
INSERT INTO `customer` VALUES ('1', 'ป้ายไวนิลน้ำแข็ง', 'Fam', '0931758306', '1', 'Fam', 'จัดส่ง... รถตู้แม่สอด\r\n\r\nคุณศุทธวีร์ ที่อยุ่ 364 หมู่ที่6 ต.แม่ตาว อ.แม่สอด จ.ตาก 63110 \r\n0931758306', null, '<p>ป้ายไวนิล พิมพ์ 2 ด้าน ตอกไก่ 4 มุม<br>ขนาด 58x112 ซม. จำนวน 1 ชิ้นๆ ละ 350.-<br><br>ค่าส่ง 100.-<br><br>รวมยอดชำระ 450.-<br><br>---------------------------------------------------------<br><br>ข้อความว่า..<br><br>ร้านน้ำแข็ง<br>สะอาด<br>จำหน่าย<br>น้ำแข็งหลอด-บด<br>ปลีก/ส่ง รับส่งทุกงาน<br>ติดต่องาน0878472765<br> 0931758306</p>', null, '2021-05-06', '09:00:00', '4', null, '2021-05-05 09:05:20', '16', 'W_Dy_0CqF2px9NwnokjDCE', '1', '0', '0', '0', '0', '1', '0', null, null, '2', '0', '2', '0', '0', null, null, null);
INSERT INTO `customer` VALUES ('2', '​ไวนิลในหลวงร.10 ', 'thanyaสวนป่าแม่ละเมา', '098-8262052', '1', 'thanyaสวนป่าแม่ละเมา', 'รับหน้าร้าน ', null, '<p>ไวนิลในหลวงร.10<br>ขนาด 100x150 cm. 1 ชิ้นๆละ 240 บาท</p>', null, '2021-05-05', '13:00:00', '4', null, '2021-05-05 09:32:04', '8', 'LpFjgcw2rQ7R8maXPwoNE6', '0', '0', '1', '0', '1', '1', '0', null, null, '2', '0', '0', '0', '0', null, null, null);
INSERT INTO `customer` VALUES ('3', '​พลาสวูด ', 'Rungradit', '081-9868456', '1', 'Rungradit', 'จัดส่ง\r\nนายรุ่งรดิศ  วีระกุล\r\nธนาคารกรุงไทย  สาขาเมืองทองธานี ชั้น 3 เลขที่ 321 ถนนบอนด์สตรีท  ตำบลบางพูด อำเภอปากเกร็ด จังหวัดนนทบุรี 11120\r\nโทร.081-9868456', null, '<p>พลาสวูด กว้าง 50 ซม. ยาว 80 ซม. 1 ชิ้นๆละ 750.-<br>ค่าจัดส่ง 150.-<br><br>ยอดรวม 900.-</p>', null, '2021-05-07', '09:30:00', '4', null, '2021-05-05 09:41:16', '8', '80WMVrjv2tuVl5n9cC_CKy', '1', '0', '1', '0', '0', '1', '0', null, null, '0', '2', '2', '0', '0', null, null, null);
INSERT INTO `customer` VALUES ('4', '​ภาพพิมพ์ยูวี', 'Bombay', '0904528488', '1', 'Bombay', 'จัดส่ง ส่งรถตู้\r\nพงษ์สิทธิ์ มาขอด ที่อยู่ 633 หมู่ 1 ต.ท่าสายลวด อ.แม่สอด จ.ตาก 63110\r\nโทร.0904528488', null, '<p>ภาพพิมพ์ยูวีขนาด 60x80 ซม. 1ชิ้นๆละ 890.-<br>ค่าจัดรถตู้100.-<br><br>*งานนำภาพมารวมกันใน 1 ชิ้นงาน<br>*ข้อความว่า Happy birthday dear<br>ขอให้มีความสุขมากๆ นะจ้า คิดสิ่งใดขอให้สมปรารถนา ทำอะไรก็ให้ประสบแต่ความสำเร็จ (08/05/64) Love so much<br><br>ยอดชำระรวม 990.-</p>', null, '2021-05-05', '13:00:00', '4', null, '2021-05-05 09:46:17', '8', 'Yf5vTaeciRsnZN5M-I9sLI', '1', '0', '1', '0', '0', '1', '0', null, null, '2', '2', '2', '0', '0', null, null, null);
INSERT INTO `customer` VALUES ('5', 'พวงกุญแจอะคริลิคใส ', 'Pu.. 0939496646', '0939496646', '1', 'Pu.. 0939496646', 'คุณปู\r\nRoyal king suite\r\n159 หมู่ 7 ซอยนวมินทร 4 ตำบล บางบ่อ อำเภอบางบ่อ สมุทรปราการ 10560\r\n0939496646', null, '<p>พวงกุญแจอะคริลิคใส 5 มิล พิมพ์ยูวี 4 สี 1 ด้าน<br>ขนาด 4x8 ซม. พร้อมเจสะรูใส่ห่วง พร้อมจัดส่งฟรี <br>จำนวน 160 ชิ้นๆละ 40.- = 6,400.- <br>* ราคาไม่รวมภาษีมูลค่าเพิ่ม * </p>', null, '2021-05-07', '11:00:00', '4', null, '2021-05-05 09:58:15', '8', '76hIJ7ACiXmWpNWvGLspUW', '1', '0', '0', '0', '1', '1', '0', null, null, '1', '2', '2', '0', '0', null, null, null);
INSERT INTO `customer` VALUES ('6', '​สติ๊กเกอร์ PVC', 'OEL', '061-7967260', '1', 'OEL', 'รับงานหน้าร้าน ', null, '<p>สติ๊กเกอร์ PVC ขนาด 80X65 ซม. ราคา 450 บาท</p><p>ค่าบริการออกแบบ ราคา 300 บาท</p><p>ค่าบริการ 750 บาท (ลูกค้าชำระเงินสดตอนรับงาน)</p>', null, '2021-05-06', '10:15:00', '4', null, '2021-05-05 10:20:16', '8', 'KINCuRWXK3PMUAOwfw0IA5', '0', '0', '0', '0', '1', '1', '0', null, null, '1', '0', '0', '0', '0', null, null, null);
INSERT INTO `customer` VALUES ('7', '​สติ๊กเกอร์ไดคัท', 'chamook :)', '0918829905', '1', 'chamook :)', 'รับงานหน้าร้าน ', null, '<p>สติ๊กเกอร์ไดคัท 1 ตรม. 650.- แล้ว รับงานพรุ่งนี้ช่วงบ่าย<br><br>*ตั้งขนาดไว้ที่ กว้าง 5 ซม.เป็นหลัก ความสูงให้จัดสรรให้</p>', null, '2021-05-05', '10:40:00', '4', null, '2021-05-05 10:35:05', '8', '_TDDyi2XV9OSkAs_phSlcX', '0', '0', '1', '0', '0', '1', '0', null, null, '2', '0', '2', '0', '0', null, null, null);
INSERT INTO `customer` VALUES ('8', 'ทดสอบส่งงานโดยณัฐพล', 'ทดสอบส่งงานโดยณัฐพล', '', '1', 'nammawan', 'ไปติดตั้งร้านกาแฟ soon cafe ริมน้ำ', null, '<p>เพื่อจะทดสอบว่าคนๆเดียวสามารถรับงาน / ส่งงาน ไปยังแผนกอื่นๆ ได้โดยไม่ต้องผ่านฝ่ายใดๆ</p>', null, '2021-05-05', '10:36:00', '4', null, '2021-05-05 10:40:28', '1', 'H5O9zgJoDb6GiMH_xX4mPE', '0', '1', '0', '0', '1', '1', '0', null, null, '0', '2', '0', '2', '0', null, null, null);
INSERT INTO `customer` VALUES ('9', 'สติ๊กเกอร์ไดคัท ', 'fa', '0928166996', '1', 'fa', 'รับงานหน้าร้าน ', null, '<p>สติ๊กเกอร์ขนาด 10x5 ซม. จำนวน 1 ตรม. ลูกค้ารับงานหน้าร้าน 500.-<br>*โปรลดเหลือ 400.- </p>', null, '2021-05-05', '11:15:00', '3, 4', null, '2021-05-05 11:12:37', '8', 'aqoqo21ctwWwK8PhqFKfqs', '0', '0', '1', '0', '0', '1', '0', null, null, '2', '0', '0', '0', '0', null, null, null);
INSERT INTO `customer` VALUES ('10', 'สติ๊กเกอร์ใส', 'OEL', '0617967260', '1', 'OEL', 'รับงานหน้าร้าน ', null, '<p>พิมพ์สติ๊กเกอร์ใส ขนาด 60x40cm = 2 ชิ้นๆละ 300.- = 600.-<br>(แบบที่ลูกค้าส่งมา) </p>', null, '2021-05-06', '13:00:00', '4', null, '2021-05-05 11:18:15', '8', '1-deFHIsDp8UH_1LfynQ33', '0', '0', '1', '0', '1', '1', '0', null, null, '2', '0', '2', '0', '0', null, null, null);
INSERT INTO `customer` VALUES ('11', 'คอมโพสิตขาว ', 'Eubeib กาแฟ (Soon คาเฟ่)', '0850536709', '1', 'Eubeib กาแฟ (Soon คาเฟ่)', 'งานติดตั้ง', null, '<p>คอมโพสิตขาว 10 มิล ตีกล่อง 80x80x20 cm. + ตัวอักษรพลาสวูดทำสีเทา = 3,500.- </p>', null, '2021-05-07', '09:00:00', '3, 4', null, '2021-05-05 13:13:31', '8', 'l7bbwQI9C4UqeU9f7nnwZB', '0', '1', '1', '0', '1', '1', '0', null, null, '2', '2', '2', '0', '0', null, null, null);
INSERT INTO `customer` VALUES ('12', 'ฉากกั้นอะคริลิคขนาด 110x60 cm. ', 'ปอนด์ ', '081-9795951', '1', 'ปอนด์ ', 'นายปอล มามะกะมูละ\r\n15/5 ตำบลขุนโขลน อำเภอพระพุทธบาท จังหวัดสระบุรี\r\n18120\r\n081-9795951', null, '<p>ฉากกั้นอะคริลิคขนาด 110x60 ด้านข้างซ้ายขวาฝั่งละ 30 cm. 3 ชิ้นๆละ 1,580.-<br><br>ค่าจัดส่ง 500.- (เกินนี้ทางร้านดูแลให้ค่ะ)<br><br>ยอดชำระทั้งสิ้น 5,240.-</p>', null, '2021-05-05', '15:00:00', '3, 4', null, '2021-05-05 14:21:57', '8', 'HQcTSNCNtgc3SWwo5aAeAE', '1', '0', '1', '0', '0', '1', '0', null, null, '0', '2', '2', '0', '0', null, null, null);
INSERT INTO `customer` VALUES ('13', 'สติ๊กเกอร์ซีทรูติดกระจก + ฉากกั้นเคาน์เตอร์โฟมบอร์ด 4 มิล', 'พี่เจี๊ยบ อบตโป่งแดง', '0925565364', '1', 'พี่เจี๊ยบ อบตโป่งแดง', 'ติดตั้งงาน อบต.โป่งแดง (กองสวัสดิการสังคม)', null, '<p>1. ติดกระจกห้องกองสวัสดิการสังคม</p><p>สติ๊กเกอร์ซีทรู พร้อมติดตั้ง จำนวน 10 บาน</p><p>2. ฉากกั้นเคาน์เตอร์โฟมบอร์ด 4 มิล </p><p>ขนาด 150X75 ซม. จำนวน 1 ชิ้น</p><p>ขนาด 150X75 +75 ซม. จำนวน 1 ชิ้น </p><p>**แถมริ้วทองมิลเลอร์ ปิดขอบบนไปด้วย **</p><p>งานติดตั้งที่ อบต.โป่งแดง</p><p>.</p><p>อ้างอิงใบเสนอราคา QT2021050012</p>', null, '2021-05-07', '10:32:00', '3, 4', null, '2021-05-05 14:40:27', '8', 'ZevKuy2Fnz8Bmpa1RsXKSI', '0', '1', '1', '0', '1', '1', '0', null, null, '0', '0', '0', '0', '0', null, null, null);
INSERT INTO `customer` VALUES ('14', 'สแตนดี้ฟิวส์ ', 'Cue_cue', '0819734867', '1', 'Cue_cue', 'ลูกค้ารับเองหน้าร้าน', null, '<p>สแตนดี้ : ฟิวเจอร์บอร์ดพิมพ์ยูวี พร้อมขาตั้ง</p><p>ขนาดรวม 70X150 ซม. จำนวน 1 ชิ้น</p><p>.</p><p>อ้างอิงใบเสนอราคา QT2021050020</p>', null, '2021-05-07', '10:00:00', '3, 4', null, '2021-05-05 16:20:06', '8', 'lER6-HE2lJwDeTY21TlJ6s', '0', '0', '1', '0', '1', '1', '0', null, null, '0', '0', '0', '0', '0', null, null, null);
INSERT INTO `customer` VALUES ('15', 'ไวนิลพับขอบตอกไก่ 4 ด้าน ', 'AON', '0612850218', '1', 'AON', 'ลูกค้ารับงานหน้าร้าน ขอรับงาน 06/05 ก่อนเวลา 12.00 น. ', null, '<p>ไวนิลขนาด 220x77 ซม. 1 ป้ายๆละ 245.-<br>พับขอบเจาะรู 4 ด้าน</p>', null, '2021-05-05', '11:30:00', '3, 4', null, '2021-05-05 17:18:21', '8', 'Pel7uZlkWv70QlEM7N_lKb', '0', '0', '1', '0', '0', '1', '0', null, null, '2', '0', '1', '0', '0', null, null, null);
INSERT INTO `customer` VALUES ('16', '​บล็อคพ่นสี', 'yai', '0851003160', '1', 'yai', 'ร้านทำทุกอย่างดอทคอม  \r\nK เข้ม 0851003160\r\n\r\nเลขตึก  162/532  บางแคคอนโดทาวน  \r\nห้อง 168 อาคารพาณิชย์  ก่อนถึงศาลพระภูมิ  \r\nถ.เพชรเกษม   แขวงบางแคเหนือ เขตบางแค  กรุงเทพน  10160', null, '<p>บล็อคพ่นสี ขนาด 45x16 ซม. 1 ชิ้นๆละ 350.- รวมส่ง J&amp;T<br>*ข้อมูลอยู่ในเมล์</p>', null, '2021-05-07', '11:00:00', '3, 4', null, '2021-05-05 17:21:16', '8', 'ZJpRfgA-Sg1-iQ0c_lFTPA', '1', '0', '0', '0', '0', '1', '0', null, null, '0', '2', '2', '0', '0', null, null, null);
INSERT INTO `customer` VALUES ('17', 'Banner Stand ', 'ประภัสสร เกษตรตาก', '055 511 009', '1', 'ประภัสสร เกษตรตาก', 'สำนักงานเกษตรจังหวัดตาก', null, '<p>Banner Stand ขนาด 60x160 ซม. <span class=\"redactor-invisible-space\"> จำนวน 5 ป้าย</span></p><p><span class=\"redactor-invisible-space\">** ลูกค้ามีไฟล์งานให้ แต่ต้องปรับขนาดให้ได้ 60X160 ซม. **</span></p><p><span class=\"redactor-invisible-space\">.</span></p><p><span class=\"redactor-invisible-space\">อ้างอิง QT2021040102<span class=\"redactor-invisible-space\"></span></span></p>', null, '2021-05-07', '13:00:00', '3, 4', null, '2021-05-05 17:31:01', '8', '-D3HjJnBYj_bngAK3ut3Nc', '0', '0', '1', '0', '1', '1', '0', null, null, '1', '0', '1', '0', '0', null, null, null);
INSERT INTO `customer` VALUES ('18', 'บล็อคพ่นสี', 'Fon', '0942969749', '1', 'Fon', 'น.ส.สายฝน แก้วคำภา\r\nที่อยู่ 70 หมู่11 ต.นาชุมแสง อ.ภูเวียง จ.ขอนแก่น 40150  \r\nเบอร์ 094-2969749', null, '<p>บล็อคพ่นสี ขนาด 40x20 cm. 1 ชิ้นๆละ 200.-<br>ค่าจัดส่งแฟลช 80.-<br><br>ยอดชำระรวม 280.-</p>', null, '2021-05-07', '09:00:00', '3, 4', null, '2021-05-06 08:48:37', '8', 'BdSi1aloNqzKqs1dRzh_Mb', '1', '0', '0', '0', '0', '1', '0', null, null, '0', '2', '1', '0', '0', null, null, null);
INSERT INTO `customer` VALUES ('19', '​ป้ายชื่อติดอก', 'Nalina', '0872664433', '1', 'Nalina', 'จัดส่ง\r\nคุณนลินา จันทะฟอง\r\n2/44 หมู่ 1 ต.ทับปุด อ.ทับปุด จ.พังงา 82180\r\nโทร 087 2664433', null, '<p>ป้ายชื่อติดอก 2 ชิ้นๆละ 200.- = 400.-<br>ค่าจัดส่ง 100.-<br><br>ยอดชำระรวม 500.-<br><br>ป้ายที่1<br>นลินา จันทะฟอง<br>ประธานสภาเทศบาล<br><br>ป้ายที่2<br>ณัฐวุฒิ พุมฤทธิ์<br>รองประธานสภาเทศบาล</p>', null, '2021-05-08', '10:00:00', '3, 4', null, '2021-05-06 11:01:43', '8', '72IH6IoMq2GVAY6g6j9cWI', '1', '0', '0', '0', '0', '1', '0', null, null, '0', '0', '0', '0', '0', null, null, null);
INSERT INTO `customer` VALUES ('20', '​X-Stand ', 'X-Stand พิซซ่าแม่สอด', '063-9054880', '1', 'X-Stand พิซซ่าแม่สอด', 'จัดส่งรถตู้แม่สอด\r\n\r\nชื่อ  Bao\r\n612/1ถ.อินทรคีรี  ต.แม่สอด  อ.แม่สอด  จ.ตาก63110(ร้านผลไม้หน้าวัดชุมพล)\r\nโทร.063-9054880 / 095-3316844', null, '<p>X-Stand 60x160 ซม. จำนวน 2 ชิ้นๆละ 1,100.-</p><p>รวมเป็นเงิน 2,200.-<br><br>ค่าจัดส่ง 150.-<br><br>รวมยอดชำระ 2,350.-</p>6 พ.ค. 2021 16.36 น.<span class=\"text-dark ml-2\">', null, '2021-05-07', '13:00:00', '3, 4', null, '2021-05-06 17:01:37', '8', 'JK9-EvGZcUUQ_i7KnFAycm', '1', '0', '1', '0', '0', '1', '0', null, null, '2', '0', '2', '0', '0', null, null, null);
INSERT INTO `customer` VALUES ('21', 'ไวนิลพับขอบตอกไก่ 4 ด้าน ', 'ตากขาวละออ', '0000000000', '1', 'ตากขาวละออ', 'รับงานหน้าร้าน', null, '<p>ไวนิลไวนิลขนาด 220 x 150 cm<br>พับขอบตอกไก่ 4 ด้าน </p>', null, '2021-05-07', '16:00:00', '3, 4', null, '2021-05-06 17:06:16', '8', 'kLtTSk2dfLXj3wJUeKAQdV', '0', '0', '1', '0', '1', '1', '0', null, null, '2', '0', '0', '0', '0', null, null, null);
INSERT INTO `customer` VALUES ('22', '​ป้ายคอมโพสิตทองเมทัลลิก', 'Vera Cafe’ & Gallery', '0837487373', '1', 'Vera Cafe’ & Gallery', 'ส่งปณ.\r\n\r\nคุณกิติศักดิ์ จันทร์ถาวร\r\n315 ถ.กีฬากลาง ต.ในเมือง อ.เมือง จ.นครราชสีมา 30000\r\n0837487373', null, '<p>ป้ายคอมโพสิตทองเมทัลลิก ขนาด 35x15 ซม. 1 ชิ้นๆละ 235.-<br>ค่าจัดส่ง 100.-<br><br>ยอดชำระรวม 335.-<br><br>* ป้ายทางออก EXIT ตามแบบ</p>', null, '2021-05-07', '13:00:00', '3, 4', null, '2021-05-07 08:54:02', '8', 'DyGy_kfng8CV9Jnd-DKGxK', '1', '0', '1', '0', '0', '1', '0', null, null, '1', '0', '0', '0', '0', null, null, null);
INSERT INTO `customer` VALUES ('23', 'ภาพพิมพ์ยูวี', 'SIN', '0991055553', '1', 'SIN', 'รับงานหน้าร้าน ', null, '<p>ภาพพิมพ์ยูวี ขนาด 30x40 ซม. 1 ชิ้นๆละ 250.- (ราคาส่ง)<br>ข้อความ Happy Birthday</p>', null, '2021-05-08', '12:00:00', '3, 4', null, '2021-05-07 09:00:31', '8', 'uy0t1Xm7NfCoTw2rD1zKU9', '0', '0', '0', '0', '0', '1', '0', null, null, '2', '0', '0', '0', '0', null, null, null);
INSERT INTO `customer` VALUES ('24', ' ป้ายชื่อติดอก', 'Nalina', '0872664433', '1', 'Nalina', 'จัดส่งปณ. \r\nคุณนลินา จันทะฟอง\r\n2/44 หมู่ 1 ต.ทับปุด อ.ทับปุด จ.พังงา 82180\r\nโทร 087 2664433', null, '<p>งานเพิ่ม ป้ายชื่อติดอก 2 ชิ้นๆละ 200.- <br>ยอดชำระรวม 400.-<br><br>ป้ายที่1<br>การุณ ชูสังข์<br>รองนายกเทศมนตรี<br><br>ป้ายที่2<br>อนันต์ ชูพุฒ<br>รองนายกเทศมนตรี</p>', null, '2021-05-08', '13:00:00', '3, 4', null, '2021-05-07 13:06:46', '8', '_kn8kDdx84Qpsh3jCEO0cP', '1', '0', '1', '0', '0', '1', '0', null, null, '0', '0', '0', '0', '0', null, null, null);
INSERT INTO `customer` VALUES ('25', '​ฟิว 3 มิล พิมพ์ยูวี', 'พี่ขาว cat', '0885998536', '1', 'พี่ขาว cat', 'งานลูกค้าพี่ณัฐ *หน้าร้าน*', null, '<p>ฟิว 3 มิล พิมพ์ยูวี  80x40 ซม. แผ่นละ 160.-<br>- พื้นเหลือง 14 ชิ้น = 160x14 = 2,240.-<br>- พื้นขาว 13 ชิ้น = 160x13 = 2,080.-<br><br>ใบเสนอราคา QT2021050023 <a href=\"https://doc-api.flowaccount.com/quotation/share/html/th/nrv9w4f0usq3x5pyjwcyq\" target=\"_blank\" rel=\"noopener\">https://doc-api.flowaccount.com/quotation/share/html/th/nrv9w4f0usq3x5pyjwcyq</a></p>', null, '2021-05-10', '10:30:00', '3, 4', null, '2021-05-07 15:51:26', '8', 'MFzzD00Me92O7h2Jy0vzHu', '0', '0', '0', '0', '1', '1', '0', null, null, '0', '0', '0', '0', '0', null, null, null);
INSERT INTO `customer` VALUES ('26', 'ภาพพิมพ์ยูวี', 'SA  Bl', '099-4543972​', '1', 'SA  Bl', 'จัดส่ง คุณสาวิตรี​ บาง​หลวง\r\nสำนักงาน​ส​กท.พิจิตร​ 52  ม.2  ต.ทุ่ง​น้อย​ อ.โพทะเล​ จ.พิจิตร​66130\r\nโทรศัพท์​099-4543972​', null, '<p>ภาพพิมพ์ยูวี ขนาด 20x30 ซม. 2 ชิ้นๆละ 260.- (ราคาลด10%จาก290.-)<br>ค่าจัดส่ง 200.-<br><br>ยอดชำระทั้งสิ้น 720.-</p>', null, '2021-05-08', '14:00:00', '3, 4', null, '2021-05-07 16:24:13', '8', '2hhEmcmI5HiRzfrZUDbcpd', '1', '0', '1', '0', '0', '1', '0', null, null, '0', '0', '0', '0', '0', null, null, null);
INSERT INTO `customer` VALUES ('27', 'สติ๊กเกอร์ติดรถ', 'fat boy ', '-', '4', 'ลูกค้าพี่ณัฐ ', 'ลูกค้าพี่ณัฐ ', null, '<p>สติ๊กเกอร์ติดรถ (สีแดง) </p><p>*** เพิ่มเติมสอบถามพี่ณัฐค่ะ ***</p>', null, '2021-05-10', '10:00:00', '3, 4', null, '2021-05-07 16:55:11', '8', 'lqPKHuXygVGDIpYsyI9kt7', '0', '1', '1', '0', '0', '1', '0', null, null, '0', '0', '0', '0', '0', null, null, null);
INSERT INTO `customer` VALUES ('28', 'คอมโพสิตขาวพิมพ์ยูวี ติดตัวอักษรอะคริลิค', 'จัดซื้อPDK', '082-5239080', '1', 'จัดซื้อPDK', '29/1 หมู่11 ต.คลองห้า อ.คลองหลวง จ.ปทุมธานี', null, '<p>คอมโพสิตขาวพิมพ์ยูวี ติดตัวอักษรอะคริลิค สีตามแบบ + หมุดปิดหัว 6 ตัว/ชุด<br>ป้ายขนาด 240x50 ซม. = 3,000.- <br>ค่าจัดส่ง 800.- </p><p><br></p>', null, '2021-05-10', '11:00:00', '3, 4', null, '2021-05-07 17:11:07', '8', 'kUH617ueCSMo-_c7ONrmLW', '1', '0', '0', '0', '0', '1', '0', null, null, '0', '0', '0', '0', '0', null, null, null);
INSERT INTO `customer` VALUES ('29', '​ภาพพิมพ์ยูวี', 'SIN', '0620363521', '1', 'SIN', '* รับงานหน้าร้าน ', null, '<p>ภาพพิมพ์ยูวี ขนาด 40x50 ซม. 1 ชิ้นๆละ 450.- (ราคาส่ง)<br><br>รายละเอียดงาน<br>-ขนาด 40x50<br>-เพลงแค่เธอเข้ามาของ tilly bird (ใช้คิวอาร์โค้ด joox)<br>-ข้อความไม่มี</p>', null, '2021-05-10', '11:30:00', '3, 4', null, '2021-05-08 09:06:31', '8', 'KpZoS2n0XXjgWrCvn1MOKS', '0', '0', '0', '0', '0', '1', '0', null, null, '0', '0', '0', '0', '0', null, null, null);
INSERT INTO `customer` VALUES ('30', 'บล็อคพ่นสี', 'yai', ' 0851003160', '1', 'yai', 'ร้านทำทุกอย่างดอทคอม  \r\nK เข้ม 0851003160\r\n\r\nเลขตึก  162/532  บางแคคอนโดทาวน  \r\nห้อง 168 อาคารพาณิชย์  ก่อนถึงศาลพระภูมิ  \r\nถ.เพชรเกษม   แขวงบางแคเหนือ เขตบางแค  กรุงเทพน  10160', null, '<p>บล็อคพ่นสี ขนาด A4 1 ชิ้นๆละ 320.- รวมส่ง</p><p>*ข้อมูลอยู่ในเมล์</p>8 พ.ค. 2021 9.08 น.<span class=\"text-dark ml-2\">', null, '2021-05-10', '10:00:00', '3, 4', null, '2021-05-08 09:08:49', '8', 'rJAJa1zr9t8YihRUh5yKM6', '1', '0', '0', '0', '0', '1', '0', null, null, '0', '0', '0', '0', '0', null, null, null);
INSERT INTO `customer` VALUES ('31', 'สติ๊กเกอร์ฝ้า', 'kanjanun', '0882933687', '1', 'kanjanun', '* รับงานหน้าร้าน ', null, '<p>เพิ่มงานสติ๊กเกอร์ฝ้า 1 ชิ้น *แก้ไขที่อยู่ </p>', null, '2021-05-10', '10:00:00', '3, 4', null, '2021-05-08 10:10:11', '8', 'X77vrRC85W3ppSbUrwoP43', '0', '0', '0', '0', '1', '1', '0', null, null, '0', '0', '0', '0', '0', null, null, null);
INSERT INTO `customer` VALUES ('32', 'ภาพพิมพ์ยูวี', 'พี่บัญชา นายกโบ๊ท', '-', '4', '-', '* รับงานหน้าร้าน ', null, '<p>ภาพพิมพ์ยูวี 40x60 ซม.<br>*เปลี่ยนพื้นหลังเป็นสีน้ำเงิน<br><br>*งานฟรีพี่เฟิร์นไม่คิดเงิน</p>', null, '2021-05-10', '10:10:00', '3, 4', null, '2021-05-08 10:11:42', '8', 'm0KhYK9RmwgVOGo-0MmlhG', '0', '0', '0', '0', '0', '1', '0', null, null, '0', '0', '0', '0', '0', null, null, null);
INSERT INTO `customer` VALUES ('33', 'ป้ายอะคริลิคสีขาว', 'Alis Passapan', '083-335 8899', '1', 'Alis Passapan', 'รอที่อยู่จัดส่ง *แก้ไขอีกครั้ง ', null, '<p>ป้ายอะคริลิคสีขาวขนาด 45x30 ซม. 1 ชิ้นๆละ 850.- รวมจัดส่ง<br>น็อตลอย 2 ตัวๆละ 40.-<br><br>ยอดชำระทั้ง 930.-</p>', null, '2021-05-10', '11:00:00', '3, 4', null, '2021-05-08 13:54:40', '8', 'WQGXPhm9vwlsfnZA11AWaY', '1', '0', '0', '0', '0', '1', '0', null, null, '0', '0', '0', '0', '0', null, null, null);
INSERT INTO `customer` VALUES ('34', '1.คอมโพสิตขาวพิมพ์ยูวี + 2.ไวนิล', 'จัดซื้อPDK', '082-5239080', '1', 'จัดซื้อPDK', 'ฟอร์คอนเฮ้าส์ หจก.สำนักงานใหญ่ 29/2 หมู่11 ต.คลองห้า อ.คลองหลวง จ.ปทุมธานี 12120', null, '<p>1.คอมโพสิตขาวพิมพ์ยูวี ติดตัวอักษรอะคริลิค สีตามแบบ + หมุดปิดหัว 4 ตัว/ชุด รูขนาด 8 มม.<br>ป้ายขนาด 120x50 ซม. = 2,000.-</p><p>2.ไวนิลขนาด 350x100 ซม. 1 ชิ้นๆละ 560.-<br>พับขอบ เจาะ 6 รู (บน-ล่างอย่างละ 3)</p><p>ค่าจัดส่ง 500.-<br><br>ยอดรวม 3,060.- Vatนอก</p>', null, '2021-05-11', '12:00:00', '3, 4', null, '2021-05-08 17:15:43', '8', 'ASSAjitIb9LjfuW4kfBfqk', '1', '0', '0', '0', '1', '1', '0', null, null, '0', '0', '0', '0', '0', null, null, null);
INSERT INTO `customer` VALUES ('35', 'คอมโพสิตพิมพ์ยูวี + ป้ายอะคริลิคพิมพ์ยูวี', 'BEST Risa', '098-3945694', '1', 'BEST Risa', 'จัดส่งปณ.\r\nคุณจุฑามาศ คงศรี\r\nร้านชำนาญพันธ์ไม้ 399/2  หมู่ที่ 1 ต.เสาธง อ.ร่อนพิบูลย์  จ.นครศรีธรรมราช 80350\r\nTel.098-3945694', null, '<p>1. คอมโพสิตพิมพ์ยูวี ขนาด 60x40 ซม. 1 ชิ้นๆละ 590.- (แนวนอน)<br><br>2. ป้ายอะคริลิคพิมพ์ยูวี ขนาด 60x40 cm. 1 ชิ้นๆละ 790.-<br><br>3. ค่าจัดส่งฟรี<br><br>ยอดชำระรวม 1,380.-</p>', null, '2021-05-11', '12:00:00', '3, 4', null, '2021-05-08 17:18:26', '8', 'ceO-2fQclNvEJwDd4S7jIy', '1', '0', '0', '0', '0', '1', '0', null, null, '0', '0', '0', '0', '0', null, null, null);

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
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8 COMMENT='ตารางแผนกกราฟิก';

-- ----------------------------
-- Records of graphic
-- ----------------------------
INSERT INTO `graphic` VALUES ('1', 'W_Dy_0CqF2px9NwnokjDCE', null, '<p>แจ้งพี่บอล<br>งานนี้ ปริ้นหน้า หลังนะคะ</p>', '', 'Jui9furXhUea_bjFFpfD5d', '16', null, '1', '0', '2021-05-05 10:20:39', '2021-05-05 10:20:39', '2', '5,7');
INSERT INTO `graphic` VALUES ('2', 'LpFjgcw2rQ7R8maXPwoNE6', null, '', '', '_4pm_wBq9hAayEOYwsBfqr', '16', null, '1', '0', '2021-05-05 13:24:11', '2021-05-05 13:24:11', '2', '5');
INSERT INTO `graphic` VALUES ('3', '80WMVrjv2tuVl5n9cC_CKy', null, '<p>*ส่งงานแล้ว</p>', '', 'jnjd49kFPDQP1gbfWA9adv', '16', null, '1', '0', '2021-05-05 17:23:24', '2021-05-05 17:23:25', '2', '6,7');
INSERT INTO `graphic` VALUES ('4', 'Yf5vTaeciRsnZN5M-I9sLI', null, '', '', '848IEWwrS5lTv6gO7XYIbb', '16', null, '1', '0', '2021-05-05 13:25:01', '2021-05-05 13:25:01', '2', '5,6,7');
INSERT INTO `graphic` VALUES ('5', '76hIJ7ACiXmWpNWvGLspUW', null, '', '', 'wnoDBqA7RZJkW9p92a24Te', '16', null, '1', '0', '2021-05-05 13:15:16', '2021-05-05 13:15:16', '2', '5,6,7');
INSERT INTO `graphic` VALUES ('6', 'H5O9zgJoDb6GiMH_xX4mPE', null, '<p>กราฟิกจะแจ้งรายละเอียดการทำงาน วิธีการทำงาน </p><p>วิธีการพิมพ์ และขั้นการทำงานอื่นๆ ที่จะทำให้งานรวดเร็ว</p>', '', 'cEnh-T_l1ednftHVIUwM-O', '1', null, '1', '0', '2021-05-05 10:48:42', '2021-05-05 10:48:42', '2', '6');
INSERT INTO `graphic` VALUES ('7', 'aqoqo21ctwWwK8PhqFKfqs', null, '', '', 'Rz13XLpHt21PoZvblIKa-c', '16', null, '1', '0', '2021-05-05 13:50:58', '2021-05-05 13:50:58', '2', '5');
INSERT INTO `graphic` VALUES ('8', 'l7bbwQI9C4UqeU9f7nnwZB', null, '<p>งานผลิตเสร็จแล้วเหรือทำสีและเข้าติดตั้ง </p>', '', 'NI4ah55wf34HJx5sNQWr_l', '8', null, '1', '0', '2021-05-06 17:27:51', '2021-05-06 17:27:51', '2', '5,6,7');
INSERT INTO `graphic` VALUES ('9', 'KINCuRWXK3PMUAOwfw0IA5', null, '', '', 'RCHxsjKbSuCyb7jucQ2sEj', '16', null, '3', '0', '2021-05-06 15:11:32', '2021-05-06 15:11:43', '1', '5');
INSERT INTO `graphic` VALUES ('10', '1-deFHIsDp8UH_1LfynQ33', null, '<p>พี่บอลส่งงานพิมพ์แล้ว </p>', '', 'SYjgv4VQPveIcY6_LLyUGX', '8', null, '1', '0', '2021-05-06 17:26:18', '2021-05-06 17:26:18', '2', '5,7');
INSERT INTO `graphic` VALUES ('11', 'HQcTSNCNtgc3SWwo5aAeAE', null, '<p>พี่ณัฐสั่งผลิตงานให้ </p>', '', 'DAYwsktXyQOl9xXG5FAG4r', '16', null, '1', '0', '2021-05-05 14:27:26', '2021-05-05 14:27:26', '2', '6,7');
INSERT INTO `graphic` VALUES ('12', 'ZevKuy2Fnz8Bmpa1RsXKSI', null, null, '', '', null, null, '0', '0', null, null, '1', null);
INSERT INTO `graphic` VALUES ('13', '_TDDyi2XV9OSkAs_phSlcX', null, '<p>*ลูกค้ารับงานหน้าร้านแล้ว</p>', '', 'ja9Vn7zlRoivxfXXQNoa1N', '16', null, '1', '0', '2021-05-05 17:30:13', '2021-05-05 17:30:14', '2', '5,7');
INSERT INTO `graphic` VALUES ('14', 'lER6-HE2lJwDeTY21TlJ6s', null, null, '', '', null, null, '0', '0', null, null, '1', null);
INSERT INTO `graphic` VALUES ('15', 'Pel7uZlkWv70QlEM7N_lKb', null, '<p>แจ้งพี่บอล..งานไวนิลขนาด 220x77 ซม. 1 ป้ายๆละ 245.-<br>พับขอบเจาะรู 4 ด้าน </p><p>X:\\G ขิม\\0.งาน\\110.Aon\\ไวนิลกุ้งทอด 220x77 cm.tif<span class=\"redactor-invisible-space\"></span></p>', '', 'lTZS-5f9A_OKhhXinASgM8', '16', null, '1', '0', '2021-05-06 12:05:39', '2021-05-06 12:05:40', '2', '5');
INSERT INTO `graphic` VALUES ('16', 'ZJpRfgA-Sg1-iQ0c_lFTPA', null, '<p>งานเสร็จแล้วค่ะ</p>', '', '6nuLTNUQlsnWiuwcJ28DPl', '8', null, '1', '0', '2021-05-07 10:56:59', '2021-05-07 10:56:59', '2', '6,7');
INSERT INTO `graphic` VALUES ('17', '-D3HjJnBYj_bngAK3ut3Nc', null, '', '', 'A8y4HlaN5EdzqlLqIim0NA', '12', null, '1', '0', '2021-05-08 08:36:13', '2021-05-08 08:36:14', '2', '5,7');
INSERT INTO `graphic` VALUES ('18', 'BdSi1aloNqzKqs1dRzh_Mb', null, '<p>บล็อคพ่นสี ขนาด 40x20 cm. 1 ชิ้นๆละ 200.-</p>', '', '8pV0hYksEndTiEiLIC4L3r', '8', null, '1', '0', '2021-05-07 09:28:04', '2021-05-07 09:28:04', '2', '6,7');
INSERT INTO `graphic` VALUES ('19', '72IH6IoMq2GVAY6g6j9cWI', null, '<p>แจ้งพี่บอลผลิตงาน..ป้ายชื่อติดอก 2 ชิ้นๆละ 200.- = 400.-<br>ค่าจัดส่ง 100.-</p><p>X:\\G ขิม\\0.งาน\\113.ป้ายชื่อติดอก Nalina.AI<span class=\"redactor-invisible-space\"><br></span></p>', '', '_JvVy7xAi3IjtWAhHhz2P-', '12', null, '1', '0', '2021-05-06 15:16:33', '2021-05-06 15:16:34', '1', '');
INSERT INTO `graphic` VALUES ('20', 'JK9-EvGZcUUQ_i7KnFAycm', null, '', '', '2K7-sJDJGN34d7hihlnzIx', '12', null, '1', '0', '2021-05-08 08:37:02', '2021-05-08 08:37:02', '2', '5,7');
INSERT INTO `graphic` VALUES ('21', 'kLtTSk2dfLXj3wJUeKAQdV', null, '', '', 'yj-r3uTXspb5hrFWw7-_u1', '12', null, '1', '0', '2021-05-08 08:39:24', '2021-05-08 08:39:25', '2', '5');
INSERT INTO `graphic` VALUES ('22', 'DyGy_kfng8CV9Jnd-DKGxK', null, '', '', '-O8mSx2jc49Nl7Gdf7idwX', '12', null, '1', '0', '2021-05-08 08:38:32', '2021-05-08 08:38:32', '2', '5');
INSERT INTO `graphic` VALUES ('23', 'uy0t1Xm7NfCoTw2rD1zKU9', null, '<p>งานเสร็จแล้ว</p>', '', 'yvp_VnJvgYzInoOiOE78HY', '8', null, '1', '0', '2021-05-08 11:55:48', '2021-05-08 11:55:48', '2', '5');
INSERT INTO `graphic` VALUES ('24', '_kn8kDdx84Qpsh3jCEO0cP', null, null, '', '', null, null, '0', '0', null, null, '1', null);
INSERT INTO `graphic` VALUES ('25', 'MFzzD00Me92O7h2Jy0vzHu', null, null, '', '', null, null, '0', '0', null, null, '1', null);
INSERT INTO `graphic` VALUES ('26', '2hhEmcmI5HiRzfrZUDbcpd', null, null, '', '', null, null, '0', '0', null, null, '1', null);
INSERT INTO `graphic` VALUES ('27', 'lqPKHuXygVGDIpYsyI9kt7', null, null, '', '', null, null, '0', '0', null, null, '1', null);
INSERT INTO `graphic` VALUES ('28', 'kUH617ueCSMo-_c7ONrmLW', null, null, '', '', null, null, '0', '0', null, null, '1', null);
INSERT INTO `graphic` VALUES ('29', 'KpZoS2n0XXjgWrCvn1MOKS', null, null, '', '', null, null, '0', '0', null, null, '1', null);
INSERT INTO `graphic` VALUES ('30', 'rJAJa1zr9t8YihRUh5yKM6', null, null, '', '', null, null, '0', '0', null, null, '1', null);
INSERT INTO `graphic` VALUES ('31', 'X77vrRC85W3ppSbUrwoP43', null, null, '', '', null, null, '0', '0', null, null, '1', null);
INSERT INTO `graphic` VALUES ('32', 'm0KhYK9RmwgVOGo-0MmlhG', null, null, '', '', null, null, '0', '0', null, null, '1', null);
INSERT INTO `graphic` VALUES ('33', 'WQGXPhm9vwlsfnZA11AWaY', null, null, '', '', null, null, '0', '0', null, null, '1', null);
INSERT INTO `graphic` VALUES ('34', 'ASSAjitIb9LjfuW4kfBfqk', null, null, '', '', null, null, '0', '0', null, null, '1', null);
INSERT INTO `graphic` VALUES ('35', 'ceO-2fQclNvEJwDd4S7jIy', null, null, '', '', null, null, '0', '0', null, null, '1', null);

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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='ตารางเก็บประวัติส่งกลับมาแก้ไข';

-- ----------------------------
-- Records of graphic_log
-- ----------------------------
INSERT INTO `graphic_log` VALUES ('1', 'Pel7uZlkWv70QlEM7N_lKb', '1', '', null, '2021-05-06 11:52:18', '0', 'งานพิมพ์ส่งแก้ไข');
INSERT INTO `graphic_log` VALUES ('2', 'Pel7uZlkWv70QlEM7N_lKb', '1', '', null, '2021-05-06 11:59:16', '0', 'ผลิตทั่วไป ส่งแก้ไข');
INSERT INTO `graphic_log` VALUES ('3', '1-deFHIsDp8UH_1LfynQ33', '1', '', null, '2021-05-06 15:10:20', '0', 'งานพิมพ์ส่งแก้ไข');
INSERT INTO `graphic_log` VALUES ('4', 'KINCuRWXK3PMUAOwfw0IA5', '1', '', null, '2021-05-06 15:11:43', '1', 'งานพิมพ์ส่งแก้ไข');

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
-- Table structure for `queue`
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='ตารางคิวงานติดตั้ง ส่งมาเมื่อกราฟฟิกบันทึกข้อมูล';

-- ----------------------------
-- Records of queue
-- ----------------------------
INSERT INTO `queue` VALUES ('1', 'H5O9zgJoDb6GiMH_xX4mPE', '8', '2021-05-06', '11:08:00', '2', '1', '2021-05-06 11:09:19', '8', '-', 'Qk4boKdBrLvLAoSgYXW-R-');

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
) ENGINE=InnoDB AUTO_INCREMENT=78 DEFAULT CHARSET=utf8 COMMENT='สิทธิ์การเข้าถึงแผนก';

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
INSERT INTO `rule` VALUES ('71', '8', '8', '1');
INSERT INTO `rule` VALUES ('72', '7', '8', '1');
INSERT INTO `rule` VALUES ('73', '5', '8', '1');
INSERT INTO `rule` VALUES ('74', '6', '8', '1');
INSERT INTO `rule` VALUES ('76', '3', '8', '1');

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
) ENGINE=InnoDB AUTO_INCREMENT=177 DEFAULT CHARSET=utf8 COMMENT='ตารางเก็บประวัติการทำงาน';

-- ----------------------------
-- Records of timeline
-- ----------------------------
INSERT INTO `timeline` VALUES ('1', null, 'W_Dy_0CqF2px9NwnokjDCE', '1', '16', 'บันทึกข้อมูลการรับงาน', '2021-05-05 09:05:20', 'บัญชี', '0');
INSERT INTO `timeline` VALUES ('2', null, 'W_Dy_0CqF2px9NwnokjDCE', '4', '9', 'รับงาน', '2021-05-05 09:15:50', 'กราฟิก / ออกแบบ', '0');
INSERT INTO `timeline` VALUES ('6', null, 'LpFjgcw2rQ7R8maXPwoNE6', '1', '8', 'บันทึกข้อมูลการรับงาน', '2021-05-05 09:48:54', 'บัญชี', '0');
INSERT INTO `timeline` VALUES ('7', null, '80WMVrjv2tuVl5n9cC_CKy', '1', '8', 'บันทึกข้อมูลการรับงาน', '2021-05-05 09:49:08', 'บัญชี', '0');
INSERT INTO `timeline` VALUES ('8', null, 'Yf5vTaeciRsnZN5M-I9sLI', '1', '8', 'บันทึกข้อมูลการรับงาน', '2021-05-05 09:49:20', 'บัญชี', '0');
INSERT INTO `timeline` VALUES ('9', null, '76hIJ7ACiXmWpNWvGLspUW', '1', '8', 'บันทึกข้อมูลการรับงาน', '2021-05-05 09:58:15', 'บัญชี', '0');
INSERT INTO `timeline` VALUES ('10', null, 'LpFjgcw2rQ7R8maXPwoNE6', '4', '9', 'รับงาน', '2021-05-05 09:58:44', 'กราฟิก / ออกแบบ', '0');
INSERT INTO `timeline` VALUES ('11', null, '80WMVrjv2tuVl5n9cC_CKy', '4', '9', 'รับงาน', '2021-05-05 10:01:40', 'กราฟิก / ออกแบบ', '0');
INSERT INTO `timeline` VALUES ('12', null, 'Yf5vTaeciRsnZN5M-I9sLI', '4', '9', 'รับงาน', '2021-05-05 10:04:04', 'กราฟิก / ออกแบบ', '0');
INSERT INTO `timeline` VALUES ('13', null, '76hIJ7ACiXmWpNWvGLspUW', '4', '9', 'รับงาน', '2021-05-05 10:08:17', 'กราฟิก / ออกแบบ', '0');
INSERT INTO `timeline` VALUES ('14', null, 'W_Dy_0CqF2px9NwnokjDCE', '3', '16', 'สั่งผลิต', '2021-05-05 10:20:39', 'งานพิมพ์,ผลิตทั่วไป', '0');
INSERT INTO `timeline` VALUES ('15', null, 'KINCuRWXK3PMUAOwfw0IA5', '1', '8', 'บันทึกข้อมูลการรับงาน', '2021-05-05 10:20:16', 'บัญชี', '0');
INSERT INTO `timeline` VALUES ('16', null, 'W_Dy_0CqF2px9NwnokjDCE', '5', '16', 'รับงาน', '2021-05-05 10:21:34', 'งานพิมพ์(รับงาน)', '0');
INSERT INTO `timeline` VALUES ('17', null, 'W_Dy_0CqF2px9NwnokjDCE', '5', '16', 'ยืนยันการผลิต', '2021-05-05 10:21:48', 'งานพิมพ์(งานผลิตเสร็จแล้ว)', '0');
INSERT INTO `timeline` VALUES ('18', null, 'W_Dy_0CqF2px9NwnokjDCE', '7', '16', 'รับงาน', '2021-05-05 10:22:18', 'ผลิตทั่วไป(รับงาน)', '0');
INSERT INTO `timeline` VALUES ('19', null, 'W_Dy_0CqF2px9NwnokjDCE', '7', '16', 'ยืนยันการผลิต', '2021-05-05 10:22:21', 'ผลิตทั่วไป(งานผลิตเสร็จแล้ว)', '0');
INSERT INTO `timeline` VALUES ('20', null, '_TDDyi2XV9OSkAs_phSlcX', '1', '8', 'บันทึกข้อมูลการรับงาน', '2021-05-05 10:35:05', 'บัญชี', '0');
INSERT INTO `timeline` VALUES ('22', null, 'H5O9zgJoDb6GiMH_xX4mPE', '1', '1', 'บันทึกข้อมูลการรับงาน', '2021-05-05 10:41:07', 'บัญชี', '0');
INSERT INTO `timeline` VALUES ('23', null, 'H5O9zgJoDb6GiMH_xX4mPE', '4', '1', 'รับงาน', '2021-05-05 10:42:05', 'กราฟิก / ออกแบบ', '0');
INSERT INTO `timeline` VALUES ('24', null, 'H5O9zgJoDb6GiMH_xX4mPE', '3', '1', 'สั่งผลิต', '2021-05-05 10:48:42', 'CNC / Laser', '0');
INSERT INTO `timeline` VALUES ('25', null, 'LpFjgcw2rQ7R8maXPwoNE6', '3', '16', 'สั่งผลิต', '2021-05-05 13:24:11', 'งานพิมพ์', '0');
INSERT INTO `timeline` VALUES ('27', null, '1-deFHIsDp8UH_1LfynQ33', '1', '8', 'บันทึกข้อมูลการรับงาน', '2021-05-05 11:18:15', 'บัญชี', '0');
INSERT INTO `timeline` VALUES ('28', null, 'H5O9zgJoDb6GiMH_xX4mPE', '6', '17', 'รับงาน', '2021-05-05 11:47:08', 'CNC / Laser(รับงาน)', '0');
INSERT INTO `timeline` VALUES ('29', null, 'H5O9zgJoDb6GiMH_xX4mPE', '6', '17', 'ยืนยันการผลิต', '2021-05-05 11:47:11', 'CNC / Laser(งานผลิตเสร็จแล้ว)', '0');
INSERT INTO `timeline` VALUES ('30', null, '80WMVrjv2tuVl5n9cC_CKy', '3', '16', 'สั่งผลิต', '2021-05-05 17:23:24', 'CNC / Laser,ผลิตทั่วไป', '0');
INSERT INTO `timeline` VALUES ('32', null, '76hIJ7ACiXmWpNWvGLspUW', '3', '16', 'สั่งผลิต', '2021-05-05 13:15:16', 'งานพิมพ์,CNC / Laser,ผลิตทั่วไป', '0');
INSERT INTO `timeline` VALUES ('33', null, '76hIJ7ACiXmWpNWvGLspUW', '7', '15', 'รับงาน', '2021-05-05 13:16:40', 'ผลิตทั่วไป(รับงาน)', '0');
INSERT INTO `timeline` VALUES ('34', null, '76hIJ7ACiXmWpNWvGLspUW', '7', '15', 'ยืนยันการผลิต', '2021-05-05 13:17:15', 'ผลิตทั่วไป(งานผลิตเสร็จแล้ว)', '0');
INSERT INTO `timeline` VALUES ('35', null, 'W_Dy_0CqF2px9NwnokjDCE', '9', '15', 'ลงบันทึกเลขจัดส่ง', '2021-05-05 13:18:06', 'จัดส่ง(รับเข้าระบบ)', '0');
INSERT INTO `timeline` VALUES ('36', null, 'Yf5vTaeciRsnZN5M-I9sLI', '3', '16', 'สั่งผลิต', '2021-05-05 13:25:01', 'งานพิมพ์,CNC / Laser,ผลิตทั่วไป', '0');
INSERT INTO `timeline` VALUES ('37', null, 'KINCuRWXK3PMUAOwfw0IA5', '4', '9', 'รับงาน', '2021-05-05 13:29:42', 'กราฟิก / ออกแบบ', '0');
INSERT INTO `timeline` VALUES ('38', null, '1-deFHIsDp8UH_1LfynQ33', '4', '9', 'รับงาน', '2021-05-05 13:30:24', 'กราฟิก / ออกแบบ', '0');
INSERT INTO `timeline` VALUES ('39', null, 'LpFjgcw2rQ7R8maXPwoNE6', '5', '13', 'รับงาน', '2021-05-05 13:34:59', 'งานพิมพ์(รับงาน)', '0');
INSERT INTO `timeline` VALUES ('40', null, 'LpFjgcw2rQ7R8maXPwoNE6', '5', '13', 'ยืนยันการผลิต', '2021-05-05 13:35:05', 'งานพิมพ์(งานผลิตเสร็จแล้ว)', '0');
INSERT INTO `timeline` VALUES ('41', null, 'Yf5vTaeciRsnZN5M-I9sLI', '5', '13', 'รับงาน', '2021-05-05 13:35:08', 'งานพิมพ์(รับงาน)', '0');
INSERT INTO `timeline` VALUES ('42', null, 'Yf5vTaeciRsnZN5M-I9sLI', '5', '13', 'ยืนยันการผลิต', '2021-05-05 13:37:28', 'งานพิมพ์(งานผลิตเสร็จแล้ว)', '0');
INSERT INTO `timeline` VALUES ('46', null, '76hIJ7ACiXmWpNWvGLspUW', '5', '16', 'รับงาน', '2021-05-05 14:09:03', 'งานพิมพ์(รับงาน)', '0');
INSERT INTO `timeline` VALUES ('48', null, 'HQcTSNCNtgc3SWwo5aAeAE', '1', '8', 'บันทึกข้อมูลการรับงาน', '2021-05-05 14:21:57', 'กราฟิก,บัญชี', '0');
INSERT INTO `timeline` VALUES ('49', null, 'HQcTSNCNtgc3SWwo5aAeAE', '3', '16', 'สั่งผลิต', '2021-05-05 14:27:26', 'CNC / Laser,ผลิตทั่วไป', '0');
INSERT INTO `timeline` VALUES ('51', null, 'KINCuRWXK3PMUAOwfw0IA5', '3', '16', 'สั่งผลิต', '2021-05-06 15:11:32', 'งานพิมพ์', '0');
INSERT INTO `timeline` VALUES ('52', null, 'HQcTSNCNtgc3SWwo5aAeAE', '4', '9', 'รับงาน', '2021-05-05 15:55:52', 'กราฟิก / ออกแบบ', '0');
INSERT INTO `timeline` VALUES ('55', null, '_TDDyi2XV9OSkAs_phSlcX', '4', '9', 'รับงาน', '2021-05-05 16:12:19', 'กราฟิก / ออกแบบ', '0');
INSERT INTO `timeline` VALUES ('56', null, 'lER6-HE2lJwDeTY21TlJ6s', '1', '8', 'บันทึกข้อมูลการรับงาน', '2021-05-05 16:20:06', 'กราฟิก,บัญชี', '0');
INSERT INTO `timeline` VALUES ('57', null, 'lER6-HE2lJwDeTY21TlJ6s', '4', '9', 'รับงาน', '2021-05-05 17:09:38', 'กราฟิก / ออกแบบ', '0');
INSERT INTO `timeline` VALUES ('58', null, 'Pel7uZlkWv70QlEM7N_lKb', '1', '8', 'บันทึกข้อมูลการรับงาน', '2021-05-05 17:18:21', 'กราฟิก,บัญชี', '0');
INSERT INTO `timeline` VALUES ('59', null, 'ZJpRfgA-Sg1-iQ0c_lFTPA', '1', '8', 'บันทึกข้อมูลการรับงาน', '2021-05-05 17:21:16', 'กราฟิก,บัญชี', '0');
INSERT INTO `timeline` VALUES ('60', null, '80WMVrjv2tuVl5n9cC_CKy', '6', '16', 'รับงาน', '2021-05-05 17:23:32', 'CNC / Laser(รับงาน)', '0');
INSERT INTO `timeline` VALUES ('61', null, '80WMVrjv2tuVl5n9cC_CKy', '6', '16', 'ยืนยันการผลิต', '2021-05-05 17:23:34', 'CNC / Laser(งานผลิตเสร็จแล้ว)', '0');
INSERT INTO `timeline` VALUES ('62', null, '80WMVrjv2tuVl5n9cC_CKy', '7', '16', 'รับงาน', '2021-05-05 17:23:39', 'ผลิตทั่วไป(รับงาน)', '0');
INSERT INTO `timeline` VALUES ('63', null, '80WMVrjv2tuVl5n9cC_CKy', '7', '16', 'ยืนยันการผลิต', '2021-05-05 17:23:41', 'ผลิตทั่วไป(งานผลิตเสร็จแล้ว)', '0');
INSERT INTO `timeline` VALUES ('64', null, 'Yf5vTaeciRsnZN5M-I9sLI', '7', '16', 'รับงาน', '2021-05-05 17:24:17', 'ผลิตทั่วไป(รับงาน)', '0');
INSERT INTO `timeline` VALUES ('65', null, 'Yf5vTaeciRsnZN5M-I9sLI', '7', '16', 'ยืนยันการผลิต', '2021-05-05 17:24:19', 'ผลิตทั่วไป(งานผลิตเสร็จแล้ว)', '0');
INSERT INTO `timeline` VALUES ('66', null, 'HQcTSNCNtgc3SWwo5aAeAE', '7', '16', 'รับงาน', '2021-05-05 17:24:23', 'ผลิตทั่วไป(รับงาน)', '0');
INSERT INTO `timeline` VALUES ('67', null, 'HQcTSNCNtgc3SWwo5aAeAE', '7', '16', 'ยืนยันการผลิต', '2021-05-05 17:24:25', 'ผลิตทั่วไป(งานผลิตเสร็จแล้ว)', '0');
INSERT INTO `timeline` VALUES ('68', null, 'Yf5vTaeciRsnZN5M-I9sLI', '6', '16', 'รับงาน', '2021-05-05 17:24:42', 'CNC / Laser(รับงาน)', '0');
INSERT INTO `timeline` VALUES ('69', null, 'Yf5vTaeciRsnZN5M-I9sLI', '6', '16', 'ยืนยันการผลิต', '2021-05-05 17:24:45', 'CNC / Laser(งานผลิตเสร็จแล้ว)', '0');
INSERT INTO `timeline` VALUES ('70', null, 'HQcTSNCNtgc3SWwo5aAeAE', '6', '16', 'รับงาน', '2021-05-05 17:24:48', 'CNC / Laser(รับงาน)', '0');
INSERT INTO `timeline` VALUES ('71', null, 'HQcTSNCNtgc3SWwo5aAeAE', '6', '16', 'ยืนยันการผลิต', '2021-05-05 17:24:50', 'CNC / Laser(งานผลิตเสร็จแล้ว)', '0');
INSERT INTO `timeline` VALUES ('72', null, 'Yf5vTaeciRsnZN5M-I9sLI', '9', '16', 'ลงบันทึกเลขจัดส่ง', '2021-05-05 17:27:08', 'จัดส่ง(รับเข้าระบบ)', '0');
INSERT INTO `timeline` VALUES ('73', null, '_TDDyi2XV9OSkAs_phSlcX', '3', '16', 'สั่งผลิต', '2021-05-05 17:30:13', 'งานพิมพ์,ผลิตทั่วไป', '0');
INSERT INTO `timeline` VALUES ('74', null, '_TDDyi2XV9OSkAs_phSlcX', '5', '16', 'รับงาน', '2021-05-05 17:30:25', 'งานพิมพ์(รับงาน)', '0');
INSERT INTO `timeline` VALUES ('75', null, '_TDDyi2XV9OSkAs_phSlcX', '7', '16', 'รับงาน', '2021-05-05 17:30:29', 'ผลิตทั่วไป(รับงาน)', '0');
INSERT INTO `timeline` VALUES ('76', null, '_TDDyi2XV9OSkAs_phSlcX', '5', '16', 'ยืนยันการผลิต', '2021-05-05 17:30:33', 'งานพิมพ์(งานผลิตเสร็จแล้ว)', '0');
INSERT INTO `timeline` VALUES ('77', null, '_TDDyi2XV9OSkAs_phSlcX', '7', '16', 'ยืนยันการผลิต', '2021-05-05 17:30:35', 'ผลิตทั่วไป(งานผลิตเสร็จแล้ว)', '0');
INSERT INTO `timeline` VALUES ('78', null, '-D3HjJnBYj_bngAK3ut3Nc', '1', '8', 'บันทึกข้อมูลการรับงาน', '2021-05-05 17:31:01', 'กราฟิก,บัญชี', '0');
INSERT INTO `timeline` VALUES ('79', null, 'Pel7uZlkWv70QlEM7N_lKb', '4', '9', 'รับงาน', '2021-05-05 17:32:11', 'กราฟิก / ออกแบบ', '0');
INSERT INTO `timeline` VALUES ('80', null, 'HQcTSNCNtgc3SWwo5aAeAE', '9', '17', 'ลงบันทึกเลขจัดส่ง', '2021-05-05 20:17:02', 'จัดส่ง(รับเข้าระบบ)', '0');
INSERT INTO `timeline` VALUES ('81', null, 'BdSi1aloNqzKqs1dRzh_Mb', '1', '8', 'บันทึกข้อมูลการรับงาน', '2021-05-06 08:48:37', 'กราฟิก,บัญชี', '0');
INSERT INTO `timeline` VALUES ('82', null, '80WMVrjv2tuVl5n9cC_CKy', '9', '8', 'ลงบันทึกเลขจัดส่ง', '2021-05-06 09:48:52', 'จัดส่ง(รับเข้าระบบ)', '0');
INSERT INTO `timeline` VALUES ('83', null, '72IH6IoMq2GVAY6g6j9cWI', '1', '8', 'บันทึกข้อมูลการรับงาน', '2021-05-06 11:01:43', 'กราฟิก,บัญชี', '0');
INSERT INTO `timeline` VALUES ('84', null, 'aqoqo21ctwWwK8PhqFKfqs', '1', '16', 'บันทึกข้อมูลการรับงาน', '2021-05-06 11:04:42', 'กราฟิก,บัญชี', '0');
INSERT INTO `timeline` VALUES ('85', null, 'ZJpRfgA-Sg1-iQ0c_lFTPA', '4', '16', 'รับงาน', '2021-05-06 11:07:30', 'กราฟิก / ออกแบบ', '0');
INSERT INTO `timeline` VALUES ('86', null, 'H5O9zgJoDb6GiMH_xX4mPE', '2', '8', 'ลงคิวงานติดตั้ง', '2021-05-06 11:09:02', 'การตลาด(ลงคิวงาน)', '0');
INSERT INTO `timeline` VALUES ('87', null, 'H5O9zgJoDb6GiMH_xX4mPE', '8', '8', 'รับงาน', '2021-05-06 11:09:14', 'ช่างติดตั้ง(รับงาน)', '0');
INSERT INTO `timeline` VALUES ('88', null, 'H5O9zgJoDb6GiMH_xX4mPE', '8', '8', 'ติดตั้งงานลูกค้า', '2021-05-06 11:09:19', 'ช่างติดตั้ง(ส่งงานลูกค้า)', '0');
INSERT INTO `timeline` VALUES ('89', null, 'Pel7uZlkWv70QlEM7N_lKb', '3', '16', 'สั่งผลิต', '2021-05-06 12:05:39', 'งานพิมพ์', '0');
INSERT INTO `timeline` VALUES ('90', null, 'Pel7uZlkWv70QlEM7N_lKb', '5', '16', 'ส่งแก้ไขงาน', '2021-05-06 11:52:18', 'งานพิมพ์(ส่งแก้ไข กราฟิก / ออกแบบ)', '0');
INSERT INTO `timeline` VALUES ('91', null, '1-deFHIsDp8UH_1LfynQ33', '3', '8', 'สั่งผลิต', '2021-05-06 17:26:18', 'งานพิมพ์,ผลิตทั่วไป', '0');
INSERT INTO `timeline` VALUES ('92', null, 'Pel7uZlkWv70QlEM7N_lKb', '6', '16', 'ส่งแก้ไขงาน', '2021-05-06 11:59:16', 'ผลิตทั่วไป(ส่งแก้ไข กราฟิก / ออกแบบ)', '0');
INSERT INTO `timeline` VALUES ('93', null, 'ZevKuy2Fnz8Bmpa1RsXKSI', '1', '8', 'บันทึกข้อมูลการรับงาน', '2021-05-06 13:21:31', 'กราฟิก,บัญชี', '0');
INSERT INTO `timeline` VALUES ('94', null, 'BdSi1aloNqzKqs1dRzh_Mb', '4', '9', 'รับงาน', '2021-05-06 13:48:04', 'กราฟิก / ออกแบบ', '0');
INSERT INTO `timeline` VALUES ('95', null, '-D3HjJnBYj_bngAK3ut3Nc', '4', '9', 'รับงาน', '2021-05-06 13:50:01', 'กราฟิก / ออกแบบ', '0');
INSERT INTO `timeline` VALUES ('96', null, '72IH6IoMq2GVAY6g6j9cWI', '4', '9', 'รับงาน', '2021-05-06 13:54:54', 'กราฟิก / ออกแบบ', '0');
INSERT INTO `timeline` VALUES ('97', null, 'Pel7uZlkWv70QlEM7N_lKb', '5', '13', 'รับงาน', '2021-05-06 14:30:31', 'งานพิมพ์(รับงาน)', '0');
INSERT INTO `timeline` VALUES ('98', null, 'Pel7uZlkWv70QlEM7N_lKb', '5', '16', 'ยืนยันการผลิต', '2021-05-06 15:06:18', 'งานพิมพ์(งานผลิตเสร็จแล้ว)', '0');
INSERT INTO `timeline` VALUES ('99', null, '1-deFHIsDp8UH_1LfynQ33', '5', '16', 'ส่งแก้ไขงาน', '2021-05-06 15:10:20', 'งานพิมพ์(ส่งแก้ไข กราฟิก / ออกแบบ)', '0');
INSERT INTO `timeline` VALUES ('100', null, 'KINCuRWXK3PMUAOwfw0IA5', '5', '16', 'ส่งแก้ไขงาน', '2021-05-06 15:11:43', 'งานพิมพ์(ส่งแก้ไข กราฟิก / ออกแบบ)', '0');
INSERT INTO `timeline` VALUES ('101', null, 'BdSi1aloNqzKqs1dRzh_Mb', '3', '8', 'สั่งผลิต', '2021-05-07 09:28:04', 'CNC / Laser,ผลิตทั่วไป', '0');
INSERT INTO `timeline` VALUES ('102', null, '72IH6IoMq2GVAY6g6j9cWI', '3', '12', 'กราฟิก / ออกแบบ', '2021-05-06 15:16:33', 'กราฟิก(รับงาน)', '0');
INSERT INTO `timeline` VALUES ('103', null, 'JK9-EvGZcUUQ_i7KnFAycm', '1', '8', 'บันทึกข้อมูลการรับงาน', '2021-05-06 17:01:37', 'กราฟิก,บัญชี', '0');
INSERT INTO `timeline` VALUES ('104', null, 'kLtTSk2dfLXj3wJUeKAQdV', '1', '8', 'บันทึกข้อมูลการรับงาน', '2021-05-06 17:06:16', 'กราฟิก,บัญชี', '0');
INSERT INTO `timeline` VALUES ('112', null, 'l7bbwQI9C4UqeU9f7nnwZB', '1', '8', 'บันทึกข้อมูลการรับงาน', '2021-05-06 17:30:16', 'กราฟิก,บัญชี', '0');
INSERT INTO `timeline` VALUES ('113', null, 'l7bbwQI9C4UqeU9f7nnwZB', '5', '8', 'รับงาน', '2021-05-06 17:30:47', 'งานพิมพ์(รับงาน)', '0');
INSERT INTO `timeline` VALUES ('114', null, 'l7bbwQI9C4UqeU9f7nnwZB', '5', '8', 'ยืนยันการผลิต', '2021-05-06 17:30:50', 'งานพิมพ์(งานผลิตเสร็จแล้ว)', '0');
INSERT INTO `timeline` VALUES ('115', null, 'DyGy_kfng8CV9Jnd-DKGxK', '1', '8', 'บันทึกข้อมูลการรับงาน', '2021-05-07 08:54:02', 'กราฟิก,บัญชี', '0');
INSERT INTO `timeline` VALUES ('116', null, 'uy0t1Xm7NfCoTw2rD1zKU9', '1', '8', 'บันทึกข้อมูลการรับงาน', '2021-05-07 09:00:31', 'กราฟิก,บัญชี', '0');
INSERT INTO `timeline` VALUES ('117', null, 'BdSi1aloNqzKqs1dRzh_Mb', '6', '8', 'รับงาน', '2021-05-07 09:28:12', 'CNC / Laser(รับงาน)', '0');
INSERT INTO `timeline` VALUES ('118', null, 'BdSi1aloNqzKqs1dRzh_Mb', '6', '8', 'ยืนยันการผลิต', '2021-05-07 09:28:14', 'CNC / Laser(งานผลิตเสร็จแล้ว)', '0');
INSERT INTO `timeline` VALUES ('119', null, 'W_Dy_0CqF2px9NwnokjDCE', '9', '8', 'ลูกค้าได้รับสินค้าแล้ว', '2021-05-07 09:28:50', 'จัดส่ง(ยืนยันการจัดส่ง)', '0');
INSERT INTO `timeline` VALUES ('120', null, '80WMVrjv2tuVl5n9cC_CKy', '9', '8', 'ลูกค้าได้รับสินค้าแล้ว', '2021-05-07 09:28:53', 'จัดส่ง(ยืนยันการจัดส่ง)', '0');
INSERT INTO `timeline` VALUES ('121', null, 'Yf5vTaeciRsnZN5M-I9sLI', '9', '8', 'ลูกค้าได้รับสินค้าแล้ว', '2021-05-07 09:28:56', 'จัดส่ง(ยืนยันการจัดส่ง)', '0');
INSERT INTO `timeline` VALUES ('122', null, 'HQcTSNCNtgc3SWwo5aAeAE', '9', '8', 'ลูกค้าได้รับสินค้าแล้ว', '2021-05-07 09:28:59', 'จัดส่ง(ยืนยันการจัดส่ง)', '0');
INSERT INTO `timeline` VALUES ('123', null, 'ZJpRfgA-Sg1-iQ0c_lFTPA', '3', '8', 'สั่งผลิต', '2021-05-07 10:56:59', 'CNC / Laser,ผลิตทั่วไป', '0');
INSERT INTO `timeline` VALUES ('124', null, 'ZJpRfgA-Sg1-iQ0c_lFTPA', '6', '8', 'รับงาน', '2021-05-07 10:57:05', 'CNC / Laser(รับงาน)', '0');
INSERT INTO `timeline` VALUES ('125', null, 'ZJpRfgA-Sg1-iQ0c_lFTPA', '6', '8', 'ยืนยันการผลิต', '2021-05-07 10:57:07', 'CNC / Laser(งานผลิตเสร็จแล้ว)', '0');
INSERT INTO `timeline` VALUES ('126', null, '76hIJ7ACiXmWpNWvGLspUW', '6', '14', 'รับงาน', '2021-05-07 13:02:56', 'CNC / Laser(รับงาน)', '0');
INSERT INTO `timeline` VALUES ('127', null, '76hIJ7ACiXmWpNWvGLspUW', '6', '14', 'ยืนยันการผลิต', '2021-05-07 13:02:59', 'CNC / Laser(งานผลิตเสร็จแล้ว)', '0');
INSERT INTO `timeline` VALUES ('128', null, '_kn8kDdx84Qpsh3jCEO0cP', '1', '8', 'บันทึกข้อมูลการรับงาน', '2021-05-07 13:06:46', 'กราฟิก,บัญชี', '0');
INSERT INTO `timeline` VALUES ('129', null, 'JK9-EvGZcUUQ_i7KnFAycm', '4', '9', 'รับงาน', '2021-05-07 13:50:33', 'กราฟิก / ออกแบบ', '0');
INSERT INTO `timeline` VALUES ('130', null, 'kLtTSk2dfLXj3wJUeKAQdV', '4', '9', 'รับงาน', '2021-05-07 14:00:06', 'กราฟิก / ออกแบบ', '0');
INSERT INTO `timeline` VALUES ('131', null, 'DyGy_kfng8CV9Jnd-DKGxK', '4', '9', 'รับงาน', '2021-05-07 14:05:04', 'กราฟิก / ออกแบบ', '0');
INSERT INTO `timeline` VALUES ('132', null, '_kn8kDdx84Qpsh3jCEO0cP', '4', '9', 'รับงาน', '2021-05-07 14:07:33', 'กราฟิก / ออกแบบ', '0');
INSERT INTO `timeline` VALUES ('133', null, 'uy0t1Xm7NfCoTw2rD1zKU9', '4', '9', 'รับงาน', '2021-05-07 14:08:13', 'กราฟิก / ออกแบบ', '0');
INSERT INTO `timeline` VALUES ('134', null, 'MFzzD00Me92O7h2Jy0vzHu', '1', '8', 'บันทึกข้อมูลการรับงาน', '2021-05-07 15:51:26', 'กราฟิก,บัญชี', '0');
INSERT INTO `timeline` VALUES ('135', null, '1-deFHIsDp8UH_1LfynQ33', '7', '8', 'รับงาน', '2021-05-07 16:14:09', 'ผลิตทั่วไป(รับงาน)', '0');
INSERT INTO `timeline` VALUES ('136', null, '1-deFHIsDp8UH_1LfynQ33', '7', '8', 'ยืนยันการผลิต', '2021-05-07 16:14:12', 'ผลิตทั่วไป(งานผลิตเสร็จแล้ว)', '0');
INSERT INTO `timeline` VALUES ('137', null, 'ZJpRfgA-Sg1-iQ0c_lFTPA', '7', '8', 'รับงาน', '2021-05-07 16:14:16', 'ผลิตทั่วไป(รับงาน)', '0');
INSERT INTO `timeline` VALUES ('138', null, 'ZJpRfgA-Sg1-iQ0c_lFTPA', '7', '8', 'ยืนยันการผลิต', '2021-05-07 16:14:18', 'ผลิตทั่วไป(งานผลิตเสร็จแล้ว)', '0');
INSERT INTO `timeline` VALUES ('139', null, '2hhEmcmI5HiRzfrZUDbcpd', '1', '8', 'บันทึกข้อมูลการรับงาน', '2021-05-07 16:24:13', 'กราฟิก,บัญชี', '0');
INSERT INTO `timeline` VALUES ('140', null, 'MFzzD00Me92O7h2Jy0vzHu', '4', '9', 'รับงาน', '2021-05-07 16:33:49', 'กราฟิก / ออกแบบ', '0');
INSERT INTO `timeline` VALUES ('141', null, '2hhEmcmI5HiRzfrZUDbcpd', '4', '9', 'รับงาน', '2021-05-07 16:36:14', 'กราฟิก / ออกแบบ', '0');
INSERT INTO `timeline` VALUES ('142', null, 'lqPKHuXygVGDIpYsyI9kt7', '1', '8', 'บันทึกข้อมูลการรับงาน', '2021-05-07 16:55:11', 'กราฟิก,บัญชี', '0');
INSERT INTO `timeline` VALUES ('143', null, 'kUH617ueCSMo-_c7ONrmLW', '1', '8', 'บันทึกข้อมูลการรับงาน', '2021-05-07 17:11:07', 'กราฟิก,บัญชี', '0');
INSERT INTO `timeline` VALUES ('144', null, '-D3HjJnBYj_bngAK3ut3Nc', '3', '12', 'สั่งผลิต', '2021-05-08 08:36:13', 'งานพิมพ์,ผลิตทั่วไป', '0');
INSERT INTO `timeline` VALUES ('145', null, 'JK9-EvGZcUUQ_i7KnFAycm', '3', '12', 'สั่งผลิต', '2021-05-08 08:37:02', 'งานพิมพ์,ผลิตทั่วไป', '0');
INSERT INTO `timeline` VALUES ('146', null, 'DyGy_kfng8CV9Jnd-DKGxK', '3', '12', 'สั่งผลิต', '2021-05-08 08:38:32', 'งานพิมพ์', '0');
INSERT INTO `timeline` VALUES ('147', null, 'kLtTSk2dfLXj3wJUeKAQdV', '3', '12', 'สั่งผลิต', '2021-05-08 08:39:24', 'งานพิมพ์', '0');
INSERT INTO `timeline` VALUES ('148', null, 'KpZoS2n0XXjgWrCvn1MOKS', '1', '8', 'บันทึกข้อมูลการรับงาน', '2021-05-08 09:06:31', 'กราฟิก,บัญชี', '0');
INSERT INTO `timeline` VALUES ('149', null, 'rJAJa1zr9t8YihRUh5yKM6', '1', '8', 'บันทึกข้อมูลการรับงาน', '2021-05-08 09:08:49', 'กราฟิก,บัญชี', '0');
INSERT INTO `timeline` VALUES ('150', null, 'X77vrRC85W3ppSbUrwoP43', '1', '8', 'บันทึกข้อมูลการรับงาน', '2021-05-08 10:10:11', 'กราฟิก,บัญชี', '0');
INSERT INTO `timeline` VALUES ('151', null, 'm0KhYK9RmwgVOGo-0MmlhG', '1', '8', 'บันทึกข้อมูลการรับงาน', '2021-05-08 10:11:42', 'กราฟิก,บัญชี', '0');
INSERT INTO `timeline` VALUES ('152', null, 'kUH617ueCSMo-_c7ONrmLW', '4', '9', 'รับงาน', '2021-05-08 10:18:00', 'กราฟิก / ออกแบบ', '0');
INSERT INTO `timeline` VALUES ('153', null, '76hIJ7ACiXmWpNWvGLspUW', '9', '8', 'ลงบันทึกเลขจัดส่ง', '2021-05-08 11:54:01', 'จัดส่ง(รับเข้าระบบ)', '0');
INSERT INTO `timeline` VALUES ('154', null, '76hIJ7ACiXmWpNWvGLspUW', '9', '8', 'ลูกค้าได้รับสินค้าแล้ว', '2021-05-08 11:54:13', 'จัดส่ง(ยืนยันการจัดส่ง)', '0');
INSERT INTO `timeline` VALUES ('155', null, 'JK9-EvGZcUUQ_i7KnFAycm', '9', '8', 'ลงบันทึกเลขจัดส่ง', '2021-05-08 11:54:29', 'จัดส่ง(รับเข้าระบบ)', '0');
INSERT INTO `timeline` VALUES ('156', null, 'JK9-EvGZcUUQ_i7KnFAycm', '9', '8', 'ลูกค้าได้รับสินค้าแล้ว', '2021-05-08 11:54:33', 'จัดส่ง(ยืนยันการจัดส่ง)', '0');
INSERT INTO `timeline` VALUES ('157', null, 'JK9-EvGZcUUQ_i7KnFAycm', '7', '8', 'รับงาน', '2021-05-08 11:54:45', 'ผลิตทั่วไป(รับงาน)', '0');
INSERT INTO `timeline` VALUES ('158', null, 'JK9-EvGZcUUQ_i7KnFAycm', '7', '8', 'ยืนยันการผลิต', '2021-05-08 11:54:47', 'ผลิตทั่วไป(งานผลิตเสร็จแล้ว)', '0');
INSERT INTO `timeline` VALUES ('159', null, '1-deFHIsDp8UH_1LfynQ33', '5', '8', 'รับงาน', '2021-05-08 11:54:59', 'งานพิมพ์(รับงาน)', '0');
INSERT INTO `timeline` VALUES ('160', null, '1-deFHIsDp8UH_1LfynQ33', '5', '8', 'ยืนยันการผลิต', '2021-05-08 11:55:01', 'งานพิมพ์(งานผลิตเสร็จแล้ว)', '0');
INSERT INTO `timeline` VALUES ('161', null, 'JK9-EvGZcUUQ_i7KnFAycm', '5', '8', 'รับงาน', '2021-05-08 11:55:04', 'งานพิมพ์(รับงาน)', '0');
INSERT INTO `timeline` VALUES ('162', null, 'JK9-EvGZcUUQ_i7KnFAycm', '5', '8', 'ยืนยันการผลิต', '2021-05-08 11:55:07', 'งานพิมพ์(งานผลิตเสร็จแล้ว)', '0');
INSERT INTO `timeline` VALUES ('163', null, 'kLtTSk2dfLXj3wJUeKAQdV', '5', '8', 'รับงาน', '2021-05-08 11:55:13', 'งานพิมพ์(รับงาน)', '0');
INSERT INTO `timeline` VALUES ('164', null, 'kLtTSk2dfLXj3wJUeKAQdV', '5', '8', 'ยืนยันการผลิต', '2021-05-08 11:55:15', 'งานพิมพ์(งานผลิตเสร็จแล้ว)', '0');
INSERT INTO `timeline` VALUES ('165', null, 'uy0t1Xm7NfCoTw2rD1zKU9', '3', '8', 'สั่งผลิต', '2021-05-08 11:55:48', 'งานพิมพ์', '0');
INSERT INTO `timeline` VALUES ('166', null, 'uy0t1Xm7NfCoTw2rD1zKU9', '5', '8', 'รับงาน', '2021-05-08 11:55:55', 'งานพิมพ์(รับงาน)', '0');
INSERT INTO `timeline` VALUES ('167', null, 'uy0t1Xm7NfCoTw2rD1zKU9', '5', '8', 'ยืนยันการผลิต', '2021-05-08 11:55:56', 'งานพิมพ์(งานผลิตเสร็จแล้ว)', '0');
INSERT INTO `timeline` VALUES ('168', null, 'WQGXPhm9vwlsfnZA11AWaY', '1', '8', 'บันทึกข้อมูลการรับงาน', '2021-05-08 13:54:40', 'กราฟิก,บัญชี', '0');
INSERT INTO `timeline` VALUES ('169', null, 'rJAJa1zr9t8YihRUh5yKM6', '4', '9', 'รับงาน', '2021-05-08 15:23:42', 'กราฟิก / ออกแบบ', '0');
INSERT INTO `timeline` VALUES ('170', null, 'm0KhYK9RmwgVOGo-0MmlhG', '4', '9', 'รับงาน', '2021-05-08 15:24:50', 'กราฟิก / ออกแบบ', '0');
INSERT INTO `timeline` VALUES ('171', null, 'KpZoS2n0XXjgWrCvn1MOKS', '4', '9', 'รับงาน', '2021-05-08 15:26:30', 'กราฟิก / ออกแบบ', '0');
INSERT INTO `timeline` VALUES ('172', null, 'X77vrRC85W3ppSbUrwoP43', '4', '9', 'รับงาน', '2021-05-08 15:33:34', 'กราฟิก / ออกแบบ', '0');
INSERT INTO `timeline` VALUES ('173', null, 'WQGXPhm9vwlsfnZA11AWaY', '4', '9', 'รับงาน', '2021-05-08 15:34:28', 'กราฟิก / ออกแบบ', '0');
INSERT INTO `timeline` VALUES ('174', null, 'lqPKHuXygVGDIpYsyI9kt7', '4', '9', 'รับงาน', '2021-05-08 15:35:45', 'กราฟิก / ออกแบบ', '0');
INSERT INTO `timeline` VALUES ('175', null, 'ASSAjitIb9LjfuW4kfBfqk', '1', '8', 'บันทึกข้อมูลการรับงาน', '2021-05-08 17:15:43', 'กราฟิก,บัญชี', '0');
INSERT INTO `timeline` VALUES ('176', null, 'ceO-2fQclNvEJwDd4S7jIy', '1', '8', 'บันทึกข้อมูลการรับงาน', '2021-05-08 17:18:26', 'กราฟิก,บัญชี', '0');

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
-- Table structure for `transport`
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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COMMENT='แผนกจัดส่ง';

-- ----------------------------
-- Records of transport
-- ----------------------------
INSERT INTO `transport` VALUES ('3', 'W_Dy_0CqF2px9NwnokjDCE', '15', '3', '0', '2021-05-05 13:18:06', '2021-05-07 09:28:50', 'จัดส่ง... รถตู้แม่สอด\r\n\r\nคุณศุทธวีร์ ที่อยุ่ 364 หมู่ที่6 ต.แม่ตาว อ.แม่สอด จ.ตาก 63110 \r\n0931758306', 0xE0B980E0B89AE0B8ADE0B8A3E0B98CE0B8A3E0B896);
INSERT INTO `transport` VALUES ('5', '76hIJ7ACiXmWpNWvGLspUW', '8', '3', '0', '2021-05-08 11:54:01', '2021-05-08 11:54:13', 'คุณปู\r\nRoyal king suite\r\n159 หมู่ 7 ซอยนวมินทร 4 ตำบล บางบ่อ อำเภอบางบ่อ สมุทรปราการ 10560\r\n0939496646', 0xE0B980E0B8A5E0B882E0B89EE0B8B1E0B8AAE0B894E0B8B820454632383134303436363654482068747470733A2F2F747261636B2E746861696C616E64706F73742E636F2E74682F64617368626F6172642F3F747261636B4E756D6265723D4546323831);
INSERT INTO `transport` VALUES ('6', 'Yf5vTaeciRsnZN5M-I9sLI', '16', '3', '0', '2021-05-05 17:27:08', '2021-05-07 09:28:56', 'จัดส่ง ส่งรถตู้\r\nพงษ์สิทธิ์ มาขอด ที่อยู่ 633 หมู่ 1 ต.ท่าสายลวด อ.แม่สอด จ.ตาก 63110\r\nโทร.0904528488', 0xE0B8A3E0B896E0B895E0B8B9E0B989);
INSERT INTO `transport` VALUES ('7', 'HQcTSNCNtgc3SWwo5aAeAE', '17', '3', '0', '2021-05-05 20:17:02', '2021-05-07 09:28:59', 'นายปอล มามะกะมูละ\r\n15/5 ตำบลขุนโขลน อำเภอพระพุทธบาท จังหวัดสระบุรี\r\n18120\r\n081-9795951', 0x454632383134303436393754482C45463238313430343734355448);
INSERT INTO `transport` VALUES ('9', '80WMVrjv2tuVl5n9cC_CKy', '8', '3', '0', '2021-05-06 09:48:52', '2021-05-07 09:28:53', 'จัดส่ง\r\nนายรุ่งรดิศ  วีระกุล\r\nธนาคารกรุงไทย  สาขาเมืองทองธานี ชั้น 3 เลขที่ 321 ถนนบอนด์สตรีท  ตำบลบางพูด อำเภอปากเกร็ด จังหวัดนนทบุรี 11120\r\nโทร.081-9868456', 0xE0B981E0B888E0B989E0B887E0B980E0B8A5E0B882E0B89EE0B8B1E0B8AAE0B894E0B8B8E0B884E0B988E0B8B020454632383134303435393554482068747470733A2F2F747261636B2E746861696C616E64706F73742E636F2E74682F64617368626F61);
INSERT INTO `transport` VALUES ('11', '72IH6IoMq2GVAY6g6j9cWI', null, '1', '0', null, null, null, null);
INSERT INTO `transport` VALUES ('12', 'BdSi1aloNqzKqs1dRzh_Mb', null, '1', '0', null, null, null, null);
INSERT INTO `transport` VALUES ('13', 'ZJpRfgA-Sg1-iQ0c_lFTPA', null, '1', '0', null, null, null, null);
INSERT INTO `transport` VALUES ('14', 'JK9-EvGZcUUQ_i7KnFAycm', '8', '3', '0', '2021-05-08 11:54:29', '2021-05-08 11:54:33', 'จัดส่งรถตู้แม่สอด\r\n\r\nชื่อ  Bao\r\n612/1ถ.อินทรคีรี  ต.แม่สอด  อ.แม่สอด  จ.ตาก63110(ร้านผลไม้หน้าวัดชุมพล)\r\nโทร.063-9054880 / 095-3316844', 0xE0B8AAE0B988E0B887E0B8A3E0B896E0B895E0B8B9E0B989E0B981E0B8A1E0B988E0B8AAE0B8ADE0B894);
INSERT INTO `transport` VALUES ('15', 'DyGy_kfng8CV9Jnd-DKGxK', null, '1', '0', null, null, null, null);

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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of uploads
-- ----------------------------
INSERT INTO `uploads` VALUES ('1', 'H5O9zgJoDb6GiMH_xX4mPE', 'a20e2b29286e56baa4c5572eeaadbcfb.png', '281e972f7b336d4bdf83e190f7b97216.png', '2021-05-05 10:38:19', null, null, '1');
INSERT INTO `uploads` VALUES ('2', 'cEnh-T_l1ednftHVIUwM-O', 'messageImage_1619153898386.jpg', '3981a9e1074afd36ee51b16318615e29.jpg', '2021-05-05 10:43:16', null, null, '1');
INSERT INTO `uploads` VALUES ('3', 'DAYwsktXyQOl9xXG5FAG4r', '1.ปอนด์.jpg', '675bab84d53fcefacb26a5c18045cccb.jpg', '2021-05-05 14:27:26', null, null, '1');
INSERT INTO `uploads` VALUES ('4', 'lTZS-5f9A_OKhhXinASgM8', '8Cfip2bzd395znaA2_mPV6jLR135bbmi9ux8cHL9AFmVo0wyk4XTWVKxmo9jQmxr60qqcmWNRzC9nRt5LTfvFlSjlSvDz5XEu2pI3miIlhM-oTsz6CrfVLZ--uaiNwbc.jpg', '933ecdee66b03f0073b6ff59fb38c060.jpg', '2021-05-06 11:30:33', null, null, '1');
INSERT INTO `uploads` VALUES ('5', '8pV0hYksEndTiEiLIC4L3r', '6.jpg', '7e976b32ff36528c318372487f74c380.jpg', '2021-05-06 15:13:37', null, null, '1');
INSERT INTO `uploads` VALUES ('6', '_JvVy7xAi3IjtWAhHhz2P-', 'ป้ายชื่อติดอก.jpg', '9dffbdb150b4e56d1e30058dea053c01.jpg', '2021-05-06 15:16:25', null, null, '1');
INSERT INTO `uploads` VALUES ('7', 'f07A9U4cuBEneMkZ4a8A5Q', '999.jpg', 'ddbafd6a7341f18abcf22d0d1ef29256.jpg', '2021-05-08 08:34:48', null, null, '1');
INSERT INTO `uploads` VALUES ('8', 'A8y4HlaN5EdzqlLqIim0NA', '999.jpg', '9195a95f912976e8d5a570dbd37a948b.jpg', '2021-05-08 08:36:09', null, null, '1');
INSERT INTO `uploads` VALUES ('9', '2K7-sJDJGN34d7hihlnzIx', '9999.jpg', '4c2657cec53378fb8e90d9f57a7abbd1.jpg', '2021-05-08 08:37:00', null, null, '1');
INSERT INTO `uploads` VALUES ('10', '-O8mSx2jc49Nl7Gdf7idwX', '666.jpg', '2145c719a85fd0bc0d1a0ba480500bbf.jpg', '2021-05-08 08:38:14', null, null, '1');
INSERT INTO `uploads` VALUES ('11', 'yj-r3uTXspb5hrFWw7-_u1', '333.jpg', 'ca8d35b4b09ee77e19be4ef4cc2eddf9.jpg', '2021-05-08 08:39:23', null, null, '1');

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
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'admin', 'kimniyomclub@gmail.com', '$2y$12$MenOVpHsMKOW0zYIFAD1ruqkamrLlEG1YIkcKOD9/eGmR9ECXzzsO', 'eVObZ98v26jv2RAmbdeUIlaHK4uJ8S-8', '1617557741', null, null, '::1', '1617557092', '1617557092', '0', '1620219223', 'A');
INSERT INTO `user` VALUES ('2', 'demo', 'demo@gmail.com', '$2y$12$ScVrSZM1VaIdB7rwZBAuK.SgNSPj8zvXPIO2n5jR.pHnw4EWjCWJ.', 'plDiCAlz6oFWCndrv4WHPeObSu1Ucf5-', '1617559566', null, null, '::1', '1617559566', '1618997823', '0', '1620112332', 'U');
INSERT INTO `user` VALUES ('6', 'kimniyom', '123@gmail.com', '$2y$12$NL13psXOId80ykwkmNYdte/GXhrd/jXsHNms.WpWO.N6O6fVnAS42', 'b3uR2qjlXICxPVN7h-FDBTWMUON8R7v0', '1618703595', null, null, '::1', '1618703595', '1618703595', '0', '1619066604', 'U');
INSERT INTO `user` VALUES ('8', 'marketing1', 'marketing@natdesigntak.com', '$2y$12$s9nzt0ro08WKmok.HTgWIegzowEBAbE6gSwBGtp173ts28ndZ9ZJ6', 'bQYe0AA-eiJ69oCPWXDonoYYT1vbmXzY', '1620129337', null, null, '49.48.207.49', '1620129337', '1620129374', '0', '1620455519', 'U');
INSERT INTO `user` VALUES ('9', 'Accounts1', 'ac1@natdesigntak.com', '$2y$12$X5TE/UD40FwEmZj3BRjc5uypvXluCVFGXRrW1pFcsLllrPY8NRtp6', 'eKLsvIznGZzAiyFlsn6Qvds00HEQfqbM', '1620129817', null, null, '49.48.207.49', '1620129817', '1620130114', '0', '1620437131', 'U');
INSERT INTO `user` VALUES ('10', 'Accounts2', 'ac2@natdesigntak.com', '$2y$12$QblQzpX/Sk81fo1WLjAeMuTVfvPmmvWnbXNwwybO1qKtU.mPtIK.G', '-jfekN7HnwR73tuDEK6TwOnmLdEFvNzJ', '1620129989', null, null, '49.48.207.49', '1620129989', '1620129989', '0', null, 'U');
INSERT INTO `user` VALUES ('11', 'Accounts3', 'ac3@natdesigntak.com', '$2y$12$3YcoXHOgG86PFjNCGVXjyeRFu2mEIKT67Clwfa/nv3fzLwwKnAo4e', 'pkbsihmPGfI4x7FcaMU1KiUv5Ho3wRc6', '1620130146', null, null, '49.48.207.49', '1620130146', '1620130146', '0', null, 'U');
INSERT INTO `user` VALUES ('12', 'Graphic', 'graphic@natdesigntak.com', '$2y$12$N7T0Tt2c7XWS7hyxMdu5UOKKcJQe9S1lVjOpo6GafgRBD0JuDh/Oq', '3qtUEslIie7ne69JE8EVRq-vrRaQX3dl', '1620175500', null, null, '49.48.207.49', '1620175500', '1620175500', '0', '1620437600', 'U');
INSERT INTO `user` VALUES ('13', 'Printing', 'printing@natdesigntak.com', '$2y$12$dFsnaM4YK4hWmigMg7lkLON.F0GDfo8I3NDoU96PnqgsyxCbaNcOS', '4AXQJ3nEQeHgr2NJRbFDPg4bm41pGxNt', '1620175748', null, null, '49.48.207.49', '1620175748', '1620175748', '0', '1620293564', 'U');
INSERT INTO `user` VALUES ('14', 'Cutting', 'cutting@natdesigntak.com', '$2y$12$IIqEX/DEnGZQRsRoYc3cn.mhlCilwYtXxdeeMAfSwAoQpmfbJA6u.', 'UmkEjlfj1zIoE6EJV5fjgY3oFOlXsPjN', '1620175853', null, null, '49.48.207.49', '1620175853', '1620175853', '0', '1620367342', 'U');
INSERT INTO `user` VALUES ('15', 'Production', 'production@natdesigntak.com', '$2y$12$2do7mdU6ZiAhba/YEILfA.IczvN1rrN7h.SyNP0lh4sXqqBBQTgrK', 'wxUxRY0j2gB7G25KIiy_EDgwwjI7Ix1L', '1620175993', null, null, '49.48.207.49', '1620175993', '1620175993', '0', '1620277340', 'U');
INSERT INTO `user` VALUES ('16', 'Manager', 'fern.worra@gmail.com', '$2y$12$TiFEAn9cL3UakE27cnu47ekuE3AQTyWQ53Mx/mR2JDTbMYhIN87de', 'K6gJiIuWqij2QCXAMjDaoyjohdcwm6-9', '1620176182', null, null, '49.48.207.49', '1620176182', '1620176916', '0', '1620297164', 'A');
INSERT INTO `user` VALUES ('17', 'Executive', 'natmawan@gmail.com', '$2y$12$Q.0JhtSi/utLRfAoRNeLNeMOzw5pEAptnCEG34HTGdUQLpjz5jV3y', '-8BOjhYHFCiHXlkp8OJ3BHzW3fQd5mc4', '1620176380', null, null, '49.48.207.49', '1620176380', '1620185767', '0', '1620379644', 'A');
INSERT INTO `user` VALUES ('18', 'Installation', 'installation@natdesigntak.com', '$2y$12$o4JIXmsaoTZwq.1XXOOYfO7Fx6d0P8VsIg.60gViV5RJrJxnJvAu6', 'gI345KcOtEtapIWkCDk8ZnA0yyiNDi-n', '1620176694', null, null, '49.48.207.49', '1620176694', '1620176694', '0', '1620178032', 'U');
