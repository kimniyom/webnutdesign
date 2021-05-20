/*
Navicat MySQL Data Transfer

Source Server         : 122.154.239.66
Source Server Version : 50640
Source Host           : 127.0.0.1:3333
Source Database       : nutdesign_db

Target Server Type    : MYSQL
Target Server Version : 50640
File Encoding         : 65001

Date: 2021-05-20 09:26:37
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
) ENGINE=InnoDB AUTO_INCREMENT=107 DEFAULT CHARSET=utf8 COMMENT='ตารางแผนกบัญชี';

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
INSERT INTO `account` VALUES ('28', null, 'kUH617ueCSMo-_c7ONrmLW', null, null, '9', null, '2', '0', '2021-05-08 10:18:00', '2021-05-10 14:22:12', '<p>ใบเสนอราคา QT2021050033 <a href=\"https://doc-api.flowaccount.com/quotation/share/html/th/m0o5f4bkleyhzokyo6yhoq?DoCopies=1&amp;DoOriginal=1&amp;InvoiceCopy=0&amp;IsIncludePaymentDetail=0&amp;TaxInvoiceCopy=0\">https://doc-api.flowaccount.com/quotation/share/ht...</a></p><p><a href=\"https://doc-api.flowaccount.com/quotation/share/html/th/m0o5f4bkleyhzokyo6yhoq?DoCopies=1&amp;DoOriginal=1&amp;InvoiceCopy=0&amp;IsIncludePaymentDetail=0&amp;TaxInvoiceCopy=0\"></a>ตรวจสอบแล้ว</p>', null);
INSERT INTO `account` VALUES ('29', null, 'KpZoS2n0XXjgWrCvn1MOKS', null, null, '9', null, '1', '0', '2021-05-08 15:26:30', '2021-05-08 15:26:30', '<p>ตรวจสอบแล้ว</p>', null);
INSERT INTO `account` VALUES ('30', null, 'rJAJa1zr9t8YihRUh5yKM6', null, null, '9', null, '1', '0', '2021-05-08 15:23:42', '2021-05-08 15:23:42', '<p>ตรวจสอบแล้ว ลูกค้าโอนชำระเงินแล้ว</p><p><a href=\"/nutdesign/web/uploads/9/9967273492-lineoachat210508152305.jpg\">9967273492-lineoachat210508152305.jpg</a><br></p>', null);
INSERT INTO `account` VALUES ('31', null, 'X77vrRC85W3ppSbUrwoP43', null, null, '9', null, '1', '0', '2021-05-08 15:33:34', '2021-05-08 15:33:34', '<p>ตรวจสอบแล้ว ลูกค้าโอนชำระเงินแล้ว</p><p><a href=\"/nutdesign/web/uploads/9/51d4383bb4-lineoachat210508153245.jpg\">51d4383bb4-lineoachat210508153245.jpg</a><br></p>', null);
INSERT INTO `account` VALUES ('32', null, 'm0KhYK9RmwgVOGo-0MmlhG', null, null, '9', null, '1', '0', '2021-05-08 15:24:49', '2021-05-08 15:24:49', '<p>ตรวจสอบแล้ว</p>', null);
INSERT INTO `account` VALUES ('33', null, 'WQGXPhm9vwlsfnZA11AWaY', null, null, '9', null, '1', '0', '2021-05-08 15:34:28', '2021-05-08 15:34:28', '<p>ตรวจสอบแล้ว</p>', null);
INSERT INTO `account` VALUES ('34', null, 'ASSAjitIb9LjfuW4kfBfqk', null, null, '9', null, '1', '0', '2021-05-10 10:44:13', '2021-05-10 10:44:13', '<p>ใบเสนอราคา QT2021050033 <a href=\"https://doc-api.flowaccount.com/quotation/share/html/th/m0o5f4bkleyhzokyo6yhoq\">https://doc-api.flowaccount.com/quotation/share/ht...</a></p><p><a href=\"https://doc-api.flowaccount.com/quotation/share/html/th/m0o5f4bkleyhzokyo6yhoq\"></a>ตรวจสอบแล้ว ลูกค้าโอนชำระเงินแล้ว</p><p><a href=\"/nutdesign/web/uploads/9/f9e23f5c92-lineoachat210510104348.jpg\">f9e23f5c92-lineoachat210510104348.jpg</a></p>', null);
INSERT INTO `account` VALUES ('35', null, 'ceO-2fQclNvEJwDd4S7jIy', null, null, '9', null, '1', '0', '2021-05-10 10:41:50', '2021-05-10 10:41:50', '<p>ตรวจสอบแล้ว ลูกค้าโอนชำระเงินแล้ว</p><p><a href=\"/nutdesign/web/uploads/9/0f7fcf11e8-lineoachat210510083612.jpg\">0f7fcf11e8-lineoachat210510083612.jpg</a><br></p>', null);
INSERT INTO `account` VALUES ('36', null, '5UMnCH7Tp8ts2NPVTq8b7I', null, null, '9', null, '1', '0', '2021-05-10 10:39:08', '2021-05-10 10:39:08', '<p>ใบเสนอราคา QT2021050039 <a href=\"https://doc-api.flowaccount.com/quotation/share/html/th/dya5vsplewupoeacavwbq\">https://doc-api.flowaccount.com/quotation/share/ht...</a><br></p><p>ใบเสนอราคา QT2021050040 <span></span><a href=\"https://doc-api.flowaccount.com/quotation/share/html/th/lxydx4wxyksveznqltayiw\">https://doc-api.flowaccount.com/quotation/share/ht...</a><br>ตรวจสอบแล้ว ลูกค้าชำระเงินแล้ว<br><a href=\"/nutdesign/web/uploads/9/2eba55f8bf-lineoachat210510095422.jpg\">2eba55f8bf-lineoachat210510095422.jpg</a></p><p><a href=\"/nutdesign/web/uploads/9/2eba55f8bf-lineoachat210510095422.jpg\"></a><a href=\"/nutdesign/web/uploads/9/2330468b77-lineoachat210510095417.jpg\">2330468b77-lineoachat210510095417.jpg</a></p>', null);
INSERT INTO `account` VALUES ('37', null, 'u7i2Oit-QdjVBf26oA2LM5', null, null, '9', null, '1', '0', '2021-05-11 08:57:40', '2021-05-11 08:57:40', '<p>ตรวจสอบแล้ว </p>', null);
INSERT INTO `account` VALUES ('38', null, 'Nm8YXtbe5__ByiIayzf8KA', null, null, '9', null, '1', '0', '2021-05-11 08:59:20', '2021-05-11 08:59:20', '<p>ใบเสนอราคา QT2021050043 <a href=\"https://doc-api.flowaccount.com/quotation/share/html/th/wryhhgbeauae3wjtepimyg\">https://doc-api.flowaccount.com/quotation/share/ht...</a></p><p><a href=\"https://doc-api.flowaccount.com/quotation/share/html/th/wryhhgbeauae3wjtepimyg\"></a>ใบเสนอราคา QT2021050042 <a href=\"https://doc-api.flowaccount.com/quotation/share/html/th/kglc5y5b50udpob6f0pva\">https://doc-api.flowaccount.com/quotation/share/ht...</a></p><p><a href=\"https://doc-api.flowaccount.com/quotation/share/html/th/kglc5y5b50udpob6f0pva\"></a>ตรวจสอบแล้ว</p>', null);
INSERT INTO `account` VALUES ('39', null, '0a4gSaSnJl_Hz8SJsWjb2G', null, null, '9', null, '1', '0', '2021-05-11 14:21:10', '2021-05-11 14:21:10', '<p>ใบเสนอราคา QT2021050022  <span></span><a href=\"https://doc-api.flowaccount.com/quotation/share/html/th/pbld1uoyo0wqog1snz2c1q\">https://doc-api.flowaccount.com/quotation/share/ht...</a></p><p><a href=\"https://doc-api.flowaccount.com/quotation/share/html/th/pbld1uoyo0wqog1snz2c1q\"></a>ตรวจสอบแล้ว </p>', null);
INSERT INTO `account` VALUES ('40', null, '7qdguXaqdFQZJR_asF_UfQ', null, null, '9', null, '1', '0', '2021-05-11 08:27:03', '2021-05-11 08:27:03', '<p>ตรวจสอบแล้ว ลูกค้าโอนเงินแล้ว</p><p><a href=\"/nutdesign/web/uploads/9/ae7c05b913-lineoachat210511082648.jpg\">ae7c05b913-lineoachat210511082648.jpg</a><br></p>', null);
INSERT INTO `account` VALUES ('41', null, 'XMXoW-yaSzIWCiUTtjiXFW', null, null, '9', null, '1', '0', '2021-05-11 08:28:11', '2021-05-11 08:28:11', '<p>ตรวจสอบแล้ว ลูกค้าโอนเงินแล้ว</p><p><a href=\"/nutdesign/web/uploads/9/7a74cd601e-lineoachat210511082752.jpg\">7a74cd601e-lineoachat210511082752.jpg</a><br></p>', null);
INSERT INTO `account` VALUES ('42', null, '_HTbSTzcnu_8YXRiOHbn-W', null, null, '9', null, '1', '0', '2021-05-11 08:59:55', '2021-05-11 08:59:55', '<p>ตรวจสอบแล้ว ลูกค้าชำระเงินสดแล้ว </p>', null);
INSERT INTO `account` VALUES ('43', null, 'QSLbWxE12CQGIwWMDl9pGb', null, null, '9', null, '1', '0', '2021-05-11 14:26:03', '2021-05-11 14:26:03', '<p>ใบเสนอราคา  QT2021050051 <a href=\"https://doc-api.flowaccount.com/quotation/share/html/th/7oz2tosieekrcg0qw6wp9q\">https://doc-api.flowaccount.com/quotation/share/ht...</a></p><p><a href=\"https://doc-api.flowaccount.com/quotation/share/html/th/7oz2tosieekrcg0qw6wp9q\"></a>ตรวจสอบแล้ว ลูกค้าโอนชำระเงินแล้ว</p><p><a href=\"/nutdesign/web/uploads/9/fbd0fa6ad3-lineoachat210511142550.jpg\">fbd0fa6ad3-lineoachat210511142550.jpg</a></p>', null);
INSERT INTO `account` VALUES ('44', null, 'n3TfnfxsKFdQQFeDT5AEVI', null, null, '9', null, '1', '0', '2021-05-11 14:45:38', '2021-05-11 14:45:38', '<p>ใบเสนอราคาเหล่า 300 ดวง QT2021050052 <a href=\"https://doc-api.flowaccount.com/quotation/share/html/th/hfdzafloiewgnj9uwtedng\" target=\"_blank\" rel=\"noopener\">https://doc-api.flowaccount.com/quotation/share/html/th/hfdzafloiewgnj9uwtedng</a></p><p><a href=\"https://doc-api.flowaccount.com/quotation/share/html/th/hfdzafloiewgnj9uwtedng\" target=\"_blank\" rel=\"noopener\"></a><br>ใบเสนอราคามมท 300 ดวง QT2021050053 <a href=\"https://doc-api.flowaccount.com/quotation/share/html/th/s51rxhfzeecjrc4gbunqcq\" target=\"_blank\" rel=\"noopener\">https://doc-api.flowaccount.com/quotation/share/html/th/s51rxhfzeecjrc4gbunqcq</a></p><p><a href=\"https://doc-api.flowaccount.com/quotation/share/html/th/s51rxhfzeecjrc4gbunqcq\" target=\"_blank\" rel=\"noopener\"></a>ตรวจสอบแล้ว</p>', null);
INSERT INTO `account` VALUES ('45', null, '9lLpBEMv3URV9CIKowTvtp', null, null, '9', null, '1', '0', '2021-05-11 14:16:39', '2021-05-11 14:16:39', '<p>ตรวจสอบแล้ว</p>', null);
INSERT INTO `account` VALUES ('46', null, 'EHtNT9tpNc1i28UkoTlfXb', null, null, '9', null, '1', '0', '2021-05-11 14:45:59', '2021-05-11 14:45:59', '<p>ตรวจสอบแล้ว</p>', null);
INSERT INTO `account` VALUES ('47', null, 'd3EZeq2qOc1sfftpV5q19D', null, null, '9', null, '1', '0', '2021-05-12 17:04:36', '2021-05-12 17:04:36', '<p>ใบเสนอราคาQT2021050054 <a href=\"https://doc-api.flowaccount.com/quotation/share/html/th/4cvooei8iuujosf38cqg6w\">https://doc-api.flowaccount.com/quotation/share/ht...</a></p><p><a href=\"https://doc-api.flowaccount.com/quotation/share/html/th/4cvooei8iuujosf38cqg6w\"></a>ตรวจสอบแล้ว</p>', null);
INSERT INTO `account` VALUES ('48', null, 'fU8hZ0tJOvyyp9j-LVPCge', null, null, '1', null, '1', '0', '2021-05-12 09:04:49', '2021-05-12 09:04:49', '<p>-</p>', null);
INSERT INTO `account` VALUES ('49', null, '7hyySzNtI_VR84GW8lXTdk', null, null, '1', null, '1', '0', '2021-05-12 09:05:02', '2021-05-12 09:05:02', '<p>-</p>', null);
INSERT INTO `account` VALUES ('50', null, 'hrmv4WPvcupLaEF9BnJnT0', null, null, '1', null, '1', '0', '2021-05-12 09:05:12', '2021-05-12 09:05:12', '<p>-</p>', null);
INSERT INTO `account` VALUES ('51', null, 'CAcAJCWeZd-mKozrUigR0Q', null, null, '1', null, '1', '0', '2021-05-12 09:05:19', '2021-05-12 09:05:19', '<p>-</p>', null);
INSERT INTO `account` VALUES ('52', null, 'fucZblB3_4Zu2jE0a0Vnj9', null, null, '1', null, '1', '0', '2021-05-12 09:05:28', '2021-05-12 09:05:28', '<p>-</p>', null);
INSERT INTO `account` VALUES ('53', null, 'pXsuTV4mAr0AU6D8F36gso', null, null, '9', null, '1', '0', '2021-05-12 17:09:29', '2021-05-12 17:09:29', '<p>ตรวจสอบแล้ว</p>', null);
INSERT INTO `account` VALUES ('54', null, 'FFpCWYn5MhCGVnFFK0aK-Q', null, null, '9', null, '1', '0', '2021-05-12 17:07:01', '2021-05-12 17:07:01', '<p>ใบเสนอราคา QT2021050059 <a href=\"https://doc-api.flowaccount.com/quotation/share/html/th/corvhhzakkabo529pcsona\">https://doc-api.flowaccount.com/quotation/share/ht...</a></p><p>ตรวจสอบแล้ว</p>', null);
INSERT INTO `account` VALUES ('55', null, 'hOUdPv_zaMEEKvcHnpsMx0', null, null, '1', null, '1', '0', '2021-05-12 13:42:07', '2021-05-12 13:42:07', '<p>ใบเสนอราคาคลิกหหหหหหหหหหหหหหหหหหหหหหหหหหหห</p>', null);
INSERT INTO `account` VALUES ('56', null, '64qt3ErfzChbImDohEIYRL', null, null, '9', null, '1', '0', '2021-05-12 17:11:04', '2021-05-12 17:11:04', '<p>ตรวจสอบแล้ว ลูกค้าชำระเงินแล้ว</p><p><a href=\"/nutdesign/web/uploads/9/e95d21664a-lineoachat210512171038.jpg\">e95d21664a-lineoachat210512171038.jpg</a><br></p>', null);
INSERT INTO `account` VALUES ('57', null, 'WET_Nb0rGmQ93JUN9lqlaq', null, null, '9', null, '1', '0', '2021-05-12 17:05:59', '2021-05-12 17:05:59', '<p>ตรวจสอบแล้ว</p>', null);
INSERT INTO `account` VALUES ('58', null, 'h3ukp0KanLnl5n9e0AFke3', null, null, null, null, '0', '0', null, null, null, null);
INSERT INTO `account` VALUES ('59', null, 'dpLUbWwhqiNKCkrSJPsYl-', null, null, null, null, '2', '0', null, '2021-05-12 18:37:19', null, null);
INSERT INTO `account` VALUES ('60', null, '8_Zx2LZQiqPFUQ9TD0pywB', null, null, '1', null, '1', '0', '2021-05-12 19:39:20', '2021-05-12 19:39:20', '<p>ไำพะำไพเ</p>', null);
INSERT INTO `account` VALUES ('61', null, 'QjfhOfXg181A4woB_CJZbh', null, null, '9', null, '1', '0', '2021-05-13 15:15:09', '2021-05-13 15:15:09', '<p>ตรวจสอบแล้ว ลูกค้าชำระเงินสดแล้ว</p>', null);
INSERT INTO `account` VALUES ('62', null, 'Bfx-3DB0DnffvI4hi8s4Dd', null, null, '9', null, '1', '0', '2021-05-14 15:16:42', '2021-05-14 15:16:42', '<p>ตรวจสอบแล้ว</p>', null);
INSERT INTO `account` VALUES ('63', null, 'R0s6646_Wy1RQU0tH3feJI', null, null, '9', null, '1', '0', '2021-05-14 15:17:01', '2021-05-14 15:17:01', '<p>ตรวจสอบแล้ว</p>', null);
INSERT INTO `account` VALUES ('64', null, '29jO6OBZ-DcyKJAPbAkR-D', null, null, '9', null, '1', '0', '2021-05-14 15:17:19', '2021-05-14 15:17:19', '<p>ตรวจสอบแล้ว</p>', null);
INSERT INTO `account` VALUES ('65', null, 'G8sXWOx_pijFawJSiWCj_3', null, null, '9', null, '1', '0', '2021-05-14 15:17:34', '2021-05-14 15:17:34', '<p>ตรวจสอบแล้ว</p>', null);
INSERT INTO `account` VALUES ('66', null, 'TVdH76RDCnBbBTqcwtkBsH', null, null, '9', null, '1', '0', '2021-05-14 15:17:58', '2021-05-14 15:17:58', '<p>ตรวจสอบแล้ว</p>', null);
INSERT INTO `account` VALUES ('67', null, 'r9qfUVpdCecyGahZ972F0E', null, null, '9', null, '1', '0', '2021-05-14 15:18:12', '2021-05-14 15:18:12', '<p>ตรวจสอบแล้ว</p>', null);
INSERT INTO `account` VALUES ('68', null, 'lsLUi5-eonboPFpOQUTsmY', null, null, '9', null, '1', '0', '2021-05-14 15:18:45', '2021-05-14 15:18:45', '<p>ตรวจสอบแล้ว</p>', null);
INSERT INTO `account` VALUES ('69', null, 'Rnvn3RJB8g2hBgiIsUQSJI', null, null, '9', null, '1', '0', '2021-05-14 15:19:04', '2021-05-14 15:19:04', '<p>ตรวจสอบแล้ว</p>', null);
INSERT INTO `account` VALUES ('70', null, '8nYloAlOIVHu6Rhi9MtZN1', null, null, '9', null, '1', '0', '2021-05-15 14:11:10', '2021-05-15 14:11:10', '<p>ตรวจสอบแล้ว</p>', null);
INSERT INTO `account` VALUES ('71', null, 'ZJefNzuDnS-HvShoWa7gUZ', null, null, '9', null, '1', '0', '2021-05-19 08:39:43', '2021-05-19 08:39:43', '<p>ตรวจสอบแล้ว</p>', null);
INSERT INTO `account` VALUES ('72', null, 'NMU8hYni2hQJzcGWzEnwYe', null, null, '9', null, '1', '0', '2021-05-14 15:19:57', '2021-05-14 15:19:57', '<p>ตรวจสอบแล้ว</p>', null);
INSERT INTO `account` VALUES ('73', null, '6fB4CAg1KJL5Ald2p5xlJC', null, null, '9', null, '1', '0', '2021-05-15 14:10:24', '2021-05-15 14:10:24', '<p>ตรวจสอบแล้ว</p>', null);
INSERT INTO `account` VALUES ('74', null, '9uku3p4nk2HhVJkGP-6oOo', null, null, '9', null, '1', '0', '2021-05-15 14:09:47', '2021-05-15 14:09:47', '<p>ตรวจสอบแล้ว</p>', null);
INSERT INTO `account` VALUES ('75', null, 'd2cddmWbQ5q52QXxRCq3e-', null, null, '9', null, '1', '0', '2021-05-15 14:10:55', '2021-05-15 14:10:55', '<p>ตรวจสอบแล้ว</p>', null);
INSERT INTO `account` VALUES ('76', null, '6NvGa1WfdZon2FTKOANHYI', null, null, '9', null, '1', '0', '2021-05-15 14:09:26', '2021-05-15 14:09:26', '<p>ตรวจสอบแล้ว</p>', null);
INSERT INTO `account` VALUES ('77', null, 'SwHKFAotfowJHYH20O2iDH', null, null, '9', null, '1', '0', '2021-05-15 14:11:40', '2021-05-15 14:11:40', '<p>ตรวจสอบแล้ว</p>', null);
INSERT INTO `account` VALUES ('78', null, 'bJQg87V6EFNI-IYOZZXBsJ', null, null, '9', null, '1', '0', '2021-05-19 08:39:59', '2021-05-19 08:39:59', '<p>ตรวจสอบแล้ว</p>', null);
INSERT INTO `account` VALUES ('79', null, 'pdci6GgdMe4wBztYRnGZsv', null, null, null, null, '0', '0', null, null, null, null);
INSERT INTO `account` VALUES ('80', null, 'X-H0wokcbyYMpPWupr--Ae', null, null, '9', null, '1', '0', '2021-05-18 09:01:34', '2021-05-18 09:01:34', '<p>ตรวจสอบแล้ว</p>', null);
INSERT INTO `account` VALUES ('81', null, 'c3eU7ywfowEQmyw0IjMhaQ', null, null, '9', null, '1', '0', '2021-05-18 09:01:53', '2021-05-18 09:01:53', '<p>ตรวจสอบแล้ว</p>', null);
INSERT INTO `account` VALUES ('82', null, 'K4aHqribfirH195o76wdkU', null, null, '9', null, '1', '0', '2021-05-18 09:02:09', '2021-05-18 09:02:09', '<p>ตรวจสอบแล้ว</p>', null);
INSERT INTO `account` VALUES ('83', null, 'UauniDVW1pUZeShneZdjjz', null, null, '9', null, '1', '0', '2021-05-19 08:42:52', '2021-05-19 08:42:52', '<p>ตรวจสอบแล้ว</p>', null);
INSERT INTO `account` VALUES ('84', null, 'PC16PlJVg_7Xd5YmGGg0mi', null, null, '9', null, '1', '0', '2021-05-18 09:02:38', '2021-05-18 09:02:38', '<p>ตรวจสอบแล้ว</p>', null);
INSERT INTO `account` VALUES ('85', null, 'MZj6PndvG7ZpAROePYv3hw', null, null, null, null, '0', '0', null, null, null, null);
INSERT INTO `account` VALUES ('86', null, 'CPzscmmVggSVGf8cyBCB0N', null, null, '9', null, '1', '0', '2021-05-19 08:43:16', '2021-05-19 08:43:16', '<p>ตรวจสอบแล้ว</p>', null);
INSERT INTO `account` VALUES ('87', null, 'NwLzGmWHZCNiBoHvWJ_JVY', null, null, '9', null, '1', '0', '2021-05-18 11:38:34', '2021-05-18 11:38:34', '<p>ตรวจสอบแล้ว ลูกค้าโอนเงินแล้ว</p>', null);
INSERT INTO `account` VALUES ('88', null, 'rvm9thaM0Tz5d_Npq8IjB5', null, null, '9', null, '1', '0', '2021-05-19 08:43:37', '2021-05-19 08:43:37', '<p>ตรวจสอบแล้ว</p>', null);
INSERT INTO `account` VALUES ('89', null, 'YUWuIUIZ-FXoTHzsyEsSsg', null, null, '9', null, '1', '0', '2021-05-19 08:40:58', '2021-05-19 08:40:58', '<p>ตรวจสอบแล้ว</p>', null);
INSERT INTO `account` VALUES ('90', null, 'CmvKcG5eHTn7HD4IIoeoMh', null, null, '9', null, '1', '0', '2021-05-19 08:41:20', '2021-05-19 08:41:20', '<p>ตรวจสอบแล้ว</p>', null);
INSERT INTO `account` VALUES ('91', null, 'sE4Bo7KJAI-VymDWuR5SoJ', null, null, '9', null, '1', '0', '2021-05-19 08:41:39', '2021-05-19 08:41:39', '<p>ตรวจสอบแล้ว</p>', null);
INSERT INTO `account` VALUES ('92', null, '3qfWzNL0gNGXQjOCaR6YTi', null, null, null, null, '0', '0', null, null, null, null);
INSERT INTO `account` VALUES ('93', null, 'BWTbhpypiSF6YctPzCo1OC', null, null, '9', null, '1', '0', '2021-05-19 10:05:46', '2021-05-19 10:05:46', '<p>ตรวจสอบแล้ว ลูกค้าโอนชำระเงินแล้ว</p>', null);
INSERT INTO `account` VALUES ('94', null, 'w1lMYIjg7gsJNtxW24Usm-', null, null, '9', null, '1', '0', '2021-05-19 08:35:00', '2021-05-19 08:35:00', '<p>ตรวจสอบแล้ว</p>', null);
INSERT INTO `account` VALUES ('95', null, 'xNHFTf7NDm1W2Et-Vjss19', null, null, '9', null, '1', '0', '2021-05-19 08:42:20', '2021-05-19 08:42:20', '<p>ตรวจสอบแล้ว ลูกค้าโอนชำระเงินแล้ว</p>', null);
INSERT INTO `account` VALUES ('96', null, 'Zi7JvolZ3MkKlhUMSa6EbW', null, null, '9', null, '1', '0', '2021-05-19 10:06:06', '2021-05-19 10:06:06', '<p>ตรวจสอบแล้ว ลูกค้าโอนชำระเงินแล้ว</p>', null);
INSERT INTO `account` VALUES ('97', null, '1aqIWI1ypdhbJz1BHYOvP6', null, null, '9', null, '1', '0', '2021-05-19 13:54:10', '2021-05-19 13:54:10', '<p>ตรวจสอบแล้ว ส่งใบแจ้งหนี้พร้อมส่งของ</p>', null);
INSERT INTO `account` VALUES ('98', null, 'rpcABKqsHGmiTPpt1Zwrh4', null, null, '9', null, '1', '0', '2021-05-19 10:19:47', '2021-05-19 10:19:47', '<p>ตรวจสอบแล้ว ลูกค้าโอนชำระเงินแล้ว</p>', null);
INSERT INTO `account` VALUES ('99', null, '5TjzbuWalTuAJcTsc1dubh', null, null, '9', null, '1', '0', '2021-05-19 13:48:15', '2021-05-19 13:48:15', '<p>ตรวจสอบแล้ว ลูกค้าโอนเงินแล้ว</p>', null);
INSERT INTO `account` VALUES ('100', null, 'tS0XNs30MdcLuxutSWM4G0', null, null, '9', null, '1', '0', '2021-05-20 08:46:17', '2021-05-20 08:46:17', '<p>ตรวจสอบแล้ว</p>', null);
INSERT INTO `account` VALUES ('101', null, 'o-ySwjoOAuPPCkM5vP0HwB', null, null, null, null, '0', '0', null, null, null, null);
INSERT INTO `account` VALUES ('102', null, '5ldsZsOZWHoCYCyWUmNZbZ', null, null, null, null, '0', '0', null, null, null, null);
INSERT INTO `account` VALUES ('103', null, 'N84zvp2EMGIVn0hjgkMIey', null, null, null, null, '0', '0', null, null, null, null);
INSERT INTO `account` VALUES ('104', null, 'VWMAqlr859luWO-W7JzA77', null, null, '9', null, '1', '0', '2021-05-19 16:21:06', '2021-05-19 16:21:06', '<p>ตรวจสอบแล้ว ลูกค้าโอนเงินแล้ว</p>', null);
INSERT INTO `account` VALUES ('105', null, 'KAvzVlHCKjukxp6RzWn_Bs', null, null, '9', null, '1', '0', '2021-05-19 16:21:45', '2021-05-19 16:21:45', '<p>ตรวจสอบแล้ว ลูกค้าโอนเงินแล้ว<br></p>', null);
INSERT INTO `account` VALUES ('106', null, 'd54MvCz6fsOTye6WQpOq8v', null, null, null, null, '0', '0', null, null, null, null);

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
  `comment` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8 COMMENT='งานผลิตทั่วไป';

-- ----------------------------
-- Records of branchfacture
-- ----------------------------
INSERT INTO `branchfacture` VALUES ('1', 'W_Dy_0CqF2px9NwnokjDCE', '16', '4', '0', '2021-05-05 10:22:18', '2021-05-05 10:22:21', null);
INSERT INTO `branchfacture` VALUES ('2', '76hIJ7ACiXmWpNWvGLspUW', '15', '4', '0', '2021-05-05 13:16:40', '2021-05-05 13:17:15', null);
INSERT INTO `branchfacture` VALUES ('3', 'Yf5vTaeciRsnZN5M-I9sLI', '16', '4', '0', '2021-05-05 17:24:17', '2021-05-05 17:24:19', null);
INSERT INTO `branchfacture` VALUES ('4', 'HQcTSNCNtgc3SWwo5aAeAE', '16', '4', '0', '2021-05-05 17:24:23', '2021-05-05 17:24:25', null);
INSERT INTO `branchfacture` VALUES ('5', '80WMVrjv2tuVl5n9cC_CKy', '16', '4', '0', '2021-05-05 17:23:39', '2021-05-05 17:23:41', null);
INSERT INTO `branchfacture` VALUES ('6', '_TDDyi2XV9OSkAs_phSlcX', '16', '4', '0', '2021-05-05 17:30:29', '2021-05-05 17:30:35', null);
INSERT INTO `branchfacture` VALUES ('8', '1-deFHIsDp8UH_1LfynQ33', '8', '4', '0', '2021-05-07 16:14:09', '2021-05-07 16:14:12', null);
INSERT INTO `branchfacture` VALUES ('9', 'l7bbwQI9C4UqeU9f7nnwZB', '8', '4', '0', '2021-05-06 17:28:11', '2021-05-06 17:28:14', null);
INSERT INTO `branchfacture` VALUES ('10', 'BdSi1aloNqzKqs1dRzh_Mb', '15', '4', '0', '2021-05-12 11:03:00', '2021-05-12 11:04:09', '');
INSERT INTO `branchfacture` VALUES ('11', 'ZJpRfgA-Sg1-iQ0c_lFTPA', '8', '4', '0', '2021-05-07 16:14:16', '2021-05-07 16:14:18', null);
INSERT INTO `branchfacture` VALUES ('12', '-D3HjJnBYj_bngAK3ut3Nc', '15', '4', '0', '2021-05-12 11:01:37', '2021-05-12 11:03:53', '');
INSERT INTO `branchfacture` VALUES ('13', 'JK9-EvGZcUUQ_i7KnFAycm', '8', '4', '0', '2021-05-08 11:54:45', '2021-05-08 11:54:47', null);
INSERT INTO `branchfacture` VALUES ('14', '6sPLpN7SmjvQLLKoafR940', '16', '4', '0', '2021-05-11 11:04:24', '2021-05-11 11:04:26', null);
INSERT INTO `branchfacture` VALUES ('15', 'ASSAjitIb9LjfuW4kfBfqk', '15', '4', '0', '2021-05-12 11:18:42', '2021-05-12 11:18:46', '');
INSERT INTO `branchfacture` VALUES ('16', 'Qe-0jK3dcpTUbSEu8NCm_D', null, '1', '0', null, null, null);
INSERT INTO `branchfacture` VALUES ('17', 'QSLbWxE12CQGIwWMDl9pGb', null, '1', '0', null, null, null);
INSERT INTO `branchfacture` VALUES ('18', 'Nm8YXtbe5__ByiIayzf8KA', '15', '4', '0', '2021-05-12 11:19:20', '2021-05-12 11:19:24', '');
INSERT INTO `branchfacture` VALUES ('19', 'LTJBdwfKR1fPJgSt96JA-c', '15', '4', '0', '2021-05-12 11:16:49', '2021-05-12 11:17:00', '');
INSERT INTO `branchfacture` VALUES ('20', '9lLpBEMv3URV9CIKowTvtp', '15', '4', '0', '2021-05-12 11:20:24', '2021-05-12 11:20:28', '');
INSERT INTO `branchfacture` VALUES ('21', 'n3TfnfxsKFdQQFeDT5AEVI', null, '1', '0', null, null, null);
INSERT INTO `branchfacture` VALUES ('22', 'ZevKuy2Fnz8Bmpa1RsXKSI', '15', '4', '0', '2021-05-12 11:17:56', '2021-05-12 11:18:02', '');
INSERT INTO `branchfacture` VALUES ('23', 'lER6-HE2lJwDeTY21TlJ6s', '15', '4', '0', '2021-05-12 11:17:26', '2021-05-12 11:17:37', '');
INSERT INTO `branchfacture` VALUES ('24', 'fU8hZ0tJOvyyp9j-LVPCge', '15', '4', '0', '2021-05-12 11:19:58', '2021-05-12 11:20:02', '');
INSERT INTO `branchfacture` VALUES ('25', '7hyySzNtI_VR84GW8lXTdk', '15', '4', '0', '2021-05-12 11:20:14', '2021-05-12 11:20:19', '');
INSERT INTO `branchfacture` VALUES ('26', 'hrmv4WPvcupLaEF9BnJnT0', '15', '4', '0', '2021-05-12 11:18:22', '2021-05-12 11:18:32', '');
INSERT INTO `branchfacture` VALUES ('27', 'CAcAJCWeZd-mKozrUigR0Q', '15', '4', '0', '2021-05-12 11:20:44', '2021-05-12 11:20:48', '');
INSERT INTO `branchfacture` VALUES ('28', 'fucZblB3_4Zu2jE0a0Vnj9', '15', '4', '0', '2021-05-12 11:20:58', '2021-05-12 11:21:01', '');
INSERT INTO `branchfacture` VALUES ('29', 'hOUdPv_zaMEEKvcHnpsMx0', '1', '4', '0', '2021-05-12 13:37:52', '2021-05-12 13:37:55', '');
INSERT INTO `branchfacture` VALUES ('30', 'WET_Nb0rGmQ93JUN9lqlaq', '1', '4', '0', '2021-05-12 14:31:24', '2021-05-12 14:31:33', 'จะส่งแล้วนะครับ');
INSERT INTO `branchfacture` VALUES ('31', '8_Zx2LZQiqPFUQ9TD0pywB', '1', '4', '0', '2021-05-12 18:43:11', '2021-05-12 18:43:19', '');
INSERT INTO `branchfacture` VALUES ('32', 'cRO9HGZyoNvFVnlA-59Xt2', null, '1', '0', null, null, null);
INSERT INTO `branchfacture` VALUES ('33', 'Bfx-3DB0DnffvI4hi8s4Dd', '15', '2', '0', '2021-05-14 14:59:55', null, null);
INSERT INTO `branchfacture` VALUES ('34', '8nYloAlOIVHu6Rhi9MtZN1', '15', '4', '0', '2021-05-14 15:01:17', '2021-05-14 15:01:21', '');
INSERT INTO `branchfacture` VALUES ('35', 'Rnvn3RJB8g2hBgiIsUQSJI', null, '1', '0', null, null, null);
INSERT INTO `branchfacture` VALUES ('36', '9uku3p4nk2HhVJkGP-6oOo', '15', '4', '0', '2021-05-15 10:21:36', '2021-05-15 10:21:41', '');
INSERT INTO `branchfacture` VALUES ('37', 'd2cddmWbQ5q52QXxRCq3e-', '15', '4', '0', '2021-05-15 10:21:53', '2021-05-15 10:21:57', '');
INSERT INTO `branchfacture` VALUES ('38', 'pdci6GgdMe4wBztYRnGZsv', '15', '4', '0', '2021-05-19 15:06:16', '2021-05-19 15:06:19', '');
INSERT INTO `branchfacture` VALUES ('39', '1aqIWI1ypdhbJz1BHYOvP6', null, '1', '0', null, null, null);
INSERT INTO `branchfacture` VALUES ('40', '5TjzbuWalTuAJcTsc1dubh', null, '1', '0', null, null, null);

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
  `comment` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8 COMMENT='งาน laser';

-- ----------------------------
-- Records of branchlaser
-- ----------------------------
INSERT INTO `branchlaser` VALUES ('1', 'H5O9zgJoDb6GiMH_xX4mPE', '17', '4', '0', '2021-05-05 11:47:08', '2021-05-05 11:47:11', null);
INSERT INTO `branchlaser` VALUES ('2', '76hIJ7ACiXmWpNWvGLspUW', '14', '4', '0', '2021-05-07 13:02:56', '2021-05-07 13:02:59', null);
INSERT INTO `branchlaser` VALUES ('3', 'Yf5vTaeciRsnZN5M-I9sLI', '16', '4', '0', '2021-05-05 17:24:42', '2021-05-05 17:24:45', null);
INSERT INTO `branchlaser` VALUES ('4', 'HQcTSNCNtgc3SWwo5aAeAE', '16', '4', '0', '2021-05-05 17:24:48', '2021-05-05 17:24:50', null);
INSERT INTO `branchlaser` VALUES ('5', '80WMVrjv2tuVl5n9cC_CKy', '16', '4', '0', '2021-05-05 17:23:32', '2021-05-05 17:23:34', null);
INSERT INTO `branchlaser` VALUES ('6', 'l7bbwQI9C4UqeU9f7nnwZB', '8', '4', '0', '2021-05-06 17:28:20', '2021-05-06 17:28:22', null);
INSERT INTO `branchlaser` VALUES ('7', 'BdSi1aloNqzKqs1dRzh_Mb', '8', '4', '0', '2021-05-07 09:28:11', '2021-05-07 09:28:14', null);
INSERT INTO `branchlaser` VALUES ('8', 'ZJpRfgA-Sg1-iQ0c_lFTPA', '8', '4', '0', '2021-05-07 10:57:05', '2021-05-07 10:57:07', null);
INSERT INTO `branchlaser` VALUES ('9', 'WQGXPhm9vwlsfnZA11AWaY', null, '1', '0', null, null, null);
INSERT INTO `branchlaser` VALUES ('10', '6sPLpN7SmjvQLLKoafR940', null, '1', '0', null, null, null);
INSERT INTO `branchlaser` VALUES ('11', 'ASSAjitIb9LjfuW4kfBfqk', '1', '2', '0', '2021-05-11 15:42:07', null, null);
INSERT INTO `branchlaser` VALUES ('12', 'rJAJa1zr9t8YihRUh5yKM6', null, '1', '0', null, null, null);
INSERT INTO `branchlaser` VALUES ('13', 'ceO-2fQclNvEJwDd4S7jIy', null, '1', '0', null, null, null);
INSERT INTO `branchlaser` VALUES ('14', 'Qe-0jK3dcpTUbSEu8NCm_D', null, '1', '0', null, null, null);
INSERT INTO `branchlaser` VALUES ('15', 'QSLbWxE12CQGIwWMDl9pGb', null, '1', '0', null, null, null);
INSERT INTO `branchlaser` VALUES ('16', 'Nm8YXtbe5__ByiIayzf8KA', null, '1', '0', null, null, null);
INSERT INTO `branchlaser` VALUES ('17', 'LTJBdwfKR1fPJgSt96JA-c', null, '1', '0', null, null, null);
INSERT INTO `branchlaser` VALUES ('18', '9lLpBEMv3URV9CIKowTvtp', null, '1', '0', null, null, null);
INSERT INTO `branchlaser` VALUES ('19', 'XMXoW-yaSzIWCiUTtjiXFW', null, '1', '0', null, null, null);
INSERT INTO `branchlaser` VALUES ('20', 'u7i2Oit-QdjVBf26oA2LM5', '1', '4', '0', '2021-05-11 15:41:49', '2021-05-11 15:41:53', '');
INSERT INTO `branchlaser` VALUES ('21', '_kn8kDdx84Qpsh3jCEO0cP', null, '1', '0', null, null, null);
INSERT INTO `branchlaser` VALUES ('22', 'EHtNT9tpNc1i28UkoTlfXb', null, '1', '0', null, null, null);
INSERT INTO `branchlaser` VALUES ('23', '0a4gSaSnJl_Hz8SJsWjb2G', null, '1', '0', null, null, null);
INSERT INTO `branchlaser` VALUES ('24', 'hOUdPv_zaMEEKvcHnpsMx0', '1', '4', '0', '2021-05-12 13:37:39', '2021-05-12 13:37:42', '');
INSERT INTO `branchlaser` VALUES ('25', 'WET_Nb0rGmQ93JUN9lqlaq', '1', '2', '0', '2021-05-12 14:31:17', null, null);
INSERT INTO `branchlaser` VALUES ('26', '8_Zx2LZQiqPFUQ9TD0pywB', '1', '4', '0', '2021-05-12 19:36:39', '2021-05-12 19:36:42', '');
INSERT INTO `branchlaser` VALUES ('27', 'ETPpDvNmIFEB4j4Tgi32oj', '1', '4', '0', '2021-05-12 19:37:30', '2021-05-12 19:37:33', '');
INSERT INTO `branchlaser` VALUES ('28', 'cRO9HGZyoNvFVnlA-59Xt2', null, '1', '0', null, null, null);
INSERT INTO `branchlaser` VALUES ('29', 'ZJefNzuDnS-HvShoWa7gUZ', null, '1', '0', null, null, null);
INSERT INTO `branchlaser` VALUES ('30', '9uku3p4nk2HhVJkGP-6oOo', null, '1', '0', null, null, null);
INSERT INTO `branchlaser` VALUES ('31', 'bJQg87V6EFNI-IYOZZXBsJ', null, '1', '0', null, null, null);
INSERT INTO `branchlaser` VALUES ('32', '1aqIWI1ypdhbJz1BHYOvP6', null, '1', '0', null, null, null);

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='การตลาด';

-- ----------------------------
-- Records of branchmarketing
-- ----------------------------
INSERT INTO `branchmarketing` VALUES ('1', 'dpLUbWwhqiNKCkrSJPsYl-', null, '1', '0', null, null);
INSERT INTO `branchmarketing` VALUES ('2', 'PC16PlJVg_7Xd5YmGGg0mi', null, '1', '0', null, null);
INSERT INTO `branchmarketing` VALUES ('3', 'rvm9thaM0Tz5d_Npq8IjB5', null, '1', '0', null, null);

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
  `comment` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8 COMMENT='งานพิมพ์';

-- ----------------------------
-- Records of branchprint
-- ----------------------------
INSERT INTO `branchprint` VALUES ('1', 'W_Dy_0CqF2px9NwnokjDCE', '16', '4', '0', '2021-05-05 10:21:34', '2021-05-05 10:21:48', null);
INSERT INTO `branchprint` VALUES ('2', '76hIJ7ACiXmWpNWvGLspUW', '13', '4', '0', '2021-05-05 14:09:03', '2021-05-11 08:38:31', '');
INSERT INTO `branchprint` VALUES ('3', 'LpFjgcw2rQ7R8maXPwoNE6', '13', '4', '0', '2021-05-05 13:34:59', '2021-05-05 13:35:05', null);
INSERT INTO `branchprint` VALUES ('4', 'Yf5vTaeciRsnZN5M-I9sLI', '13', '4', '0', '2021-05-05 13:35:08', '2021-05-05 13:37:28', null);
INSERT INTO `branchprint` VALUES ('5', 'aqoqo21ctwWwK8PhqFKfqs', '16', '4', '0', '2021-05-05 13:51:30', '2021-05-05 13:51:54', null);
INSERT INTO `branchprint` VALUES ('6', '_TDDyi2XV9OSkAs_phSlcX', '16', '4', '0', '2021-05-05 17:30:25', '2021-05-05 17:30:33', null);
INSERT INTO `branchprint` VALUES ('8', 'Pel7uZlkWv70QlEM7N_lKb', '16', '4', '0', '2021-05-06 14:30:31', '2021-05-06 15:06:18', null);
INSERT INTO `branchprint` VALUES ('11', '1-deFHIsDp8UH_1LfynQ33', '8', '4', '0', '2021-05-08 11:54:59', '2021-05-08 11:55:01', null);
INSERT INTO `branchprint` VALUES ('12', 'l7bbwQI9C4UqeU9f7nnwZB', '8', '4', '0', '2021-05-06 17:30:47', '2021-05-06 17:30:50', null);
INSERT INTO `branchprint` VALUES ('13', '-D3HjJnBYj_bngAK3ut3Nc', '13', '4', '0', '2021-05-10 20:15:46', '2021-05-10 20:15:51', null);
INSERT INTO `branchprint` VALUES ('14', 'JK9-EvGZcUUQ_i7KnFAycm', '8', '4', '0', '2021-05-08 11:55:04', '2021-05-08 11:55:07', null);
INSERT INTO `branchprint` VALUES ('15', 'DyGy_kfng8CV9Jnd-DKGxK', '13', '4', '0', '2021-05-10 20:06:35', '2021-05-10 20:06:49', null);
INSERT INTO `branchprint` VALUES ('16', 'kLtTSk2dfLXj3wJUeKAQdV', '8', '4', '0', '2021-05-08 11:55:13', '2021-05-08 11:55:15', null);
INSERT INTO `branchprint` VALUES ('17', 'uy0t1Xm7NfCoTw2rD1zKU9', '8', '4', '0', '2021-05-08 11:55:54', '2021-05-08 11:55:56', null);
INSERT INTO `branchprint` VALUES ('18', 'MFzzD00Me92O7h2Jy0vzHu', '13', '4', '0', '2021-05-10 20:13:47', '2021-05-11 09:49:38', '');
INSERT INTO `branchprint` VALUES ('19', '2hhEmcmI5HiRzfrZUDbcpd', '13', '4', '0', '2021-05-10 20:12:45', '2021-05-10 20:12:52', null);
INSERT INTO `branchprint` VALUES ('20', 'KpZoS2n0XXjgWrCvn1MOKS', '13', '4', '0', '2021-05-10 20:13:13', '2021-05-10 20:13:16', null);
INSERT INTO `branchprint` VALUES ('21', 'X77vrRC85W3ppSbUrwoP43', '13', '4', '0', '2021-05-10 20:11:57', '2021-05-10 20:12:13', null);
INSERT INTO `branchprint` VALUES ('22', 'm0KhYK9RmwgVOGo-0MmlhG', '13', '4', '0', '2021-05-10 20:13:59', '2021-05-11 08:38:57', '');
INSERT INTO `branchprint` VALUES ('23', 'WQGXPhm9vwlsfnZA11AWaY', '13', '4', '0', '2021-05-11 17:43:29', '2021-05-11 17:43:33', 'ส่งเตยแล้วครับ');
INSERT INTO `branchprint` VALUES ('24', '6sPLpN7SmjvQLLKoafR940', '13', '4', '0', '2021-05-11 17:40:45', '2021-05-11 17:44:23', 'ส่งเตยแล้วครับ');
INSERT INTO `branchprint` VALUES ('25', 'ASSAjitIb9LjfuW4kfBfqk', '13', '4', '0', '2021-05-11 17:43:39', '2021-05-11 17:43:42', 'ส่งเตยแล้วครับ');
INSERT INTO `branchprint` VALUES ('26', 'ceO-2fQclNvEJwDd4S7jIy', '13', '4', '0', '2021-05-11 17:43:47', '2021-05-11 17:43:51', 'ส่งเตยแล้วครับ');
INSERT INTO `branchprint` VALUES ('27', 'Qe-0jK3dcpTUbSEu8NCm_D', '1', '4', '0', '2021-05-11 17:39:37', '2021-05-11 17:39:42', 'Jubjub');
INSERT INTO `branchprint` VALUES ('28', 'QSLbWxE12CQGIwWMDl9pGb', null, '1', '0', null, null, null);
INSERT INTO `branchprint` VALUES ('29', 'Nm8YXtbe5__ByiIayzf8KA', '13', '4', '0', '2021-05-11 17:43:58', '2021-05-11 17:44:01', 'ส่งเตยแล้วครับ');
INSERT INTO `branchprint` VALUES ('30', 'LTJBdwfKR1fPJgSt96JA-c', '1', '4', '0', '2021-05-11 17:45:16', '2021-05-11 17:45:25', '');
INSERT INTO `branchprint` VALUES ('31', '9lLpBEMv3URV9CIKowTvtp', '1', '4', '0', '2021-05-11 17:38:25', '2021-05-11 17:38:37', 'Jubjub');
INSERT INTO `branchprint` VALUES ('32', 'XMXoW-yaSzIWCiUTtjiXFW', '13', '4', '0', '2021-05-12 10:44:55', '2021-05-12 10:45:37', 'ส่งพี่โต้งติดตัวอักษรแล้วครับ');
INSERT INTO `branchprint` VALUES ('33', 'lqPKHuXygVGDIpYsyI9kt7', '1', '4', '0', '2021-05-11 17:39:06', '2021-05-11 17:39:10', 'Jubjub');
INSERT INTO `branchprint` VALUES ('34', 'n3TfnfxsKFdQQFeDT5AEVI', '13', '4', '0', '2021-05-12 09:07:00', '2021-05-12 09:25:17', 'ส่งพี่ตั๊กตัดแล้วครับ');
INSERT INTO `branchprint` VALUES ('35', '_kn8kDdx84Qpsh3jCEO0cP', '13', '4', '0', '2021-05-11 17:42:56', '2021-05-11 17:43:05', 'ส่งเตยแล้วครับ');
INSERT INTO `branchprint` VALUES ('36', 'ZevKuy2Fnz8Bmpa1RsXKSI', '1', '4', '0', '2021-05-11 17:38:04', '2021-05-11 17:38:09', '');
INSERT INTO `branchprint` VALUES ('37', 'lER6-HE2lJwDeTY21TlJ6s', '13', '4', '0', '2021-05-11 17:42:26', '2021-05-11 17:42:29', '');
INSERT INTO `branchprint` VALUES ('38', '7qdguXaqdFQZJR_asF_UfQ', '13', '4', '0', '2021-05-11 17:45:09', '2021-05-11 17:45:13', 'ส่งเตยแล้วครับ');
INSERT INTO `branchprint` VALUES ('39', 'EHtNT9tpNc1i28UkoTlfXb', '13', '4', '0', '2021-05-12 10:05:30', '2021-05-12 10:05:48', '');
INSERT INTO `branchprint` VALUES ('40', '0a4gSaSnJl_Hz8SJsWjb2G', '1', '4', '0', '2021-05-11 17:39:55', '2021-05-11 17:40:07', '');
INSERT INTO `branchprint` VALUES ('41', 'hOUdPv_zaMEEKvcHnpsMx0', '1', '4', '0', '2021-05-12 13:37:19', '2021-05-12 13:37:25', '6456');
INSERT INTO `branchprint` VALUES ('42', 'WET_Nb0rGmQ93JUN9lqlaq', '1', '4', '0', '2021-05-12 14:30:57', '2021-05-12 14:31:06', 'เสร็จแล้วจุ๊บๆ');
INSERT INTO `branchprint` VALUES ('43', '8_Zx2LZQiqPFUQ9TD0pywB', '1', '4', '0', '2021-05-12 18:44:14', '2021-05-12 18:44:27', '');
INSERT INTO `branchprint` VALUES ('44', 'ETPpDvNmIFEB4j4Tgi32oj', '1', '4', '0', '2021-05-12 18:57:48', '2021-05-12 18:57:56', '');
INSERT INTO `branchprint` VALUES ('45', 'cRO9HGZyoNvFVnlA-59Xt2', null, '1', '0', null, null, null);
INSERT INTO `branchprint` VALUES ('46', '29jO6OBZ-DcyKJAPbAkR-D', '13', '4', '0', '2021-05-14 14:48:27', '2021-05-14 14:48:32', '');
INSERT INTO `branchprint` VALUES ('47', 'Bfx-3DB0DnffvI4hi8s4Dd', '13', '4', '0', '2021-05-14 11:54:54', '2021-05-14 11:55:30', 'ปริ้นเสร็จเเล้วตอนนี้ กำลังพับขอบตอกไก่อยู่ครับ');
INSERT INTO `branchprint` VALUES ('48', 'ZJefNzuDnS-HvShoWa7gUZ', '13', '4', '0', '2021-05-14 16:04:36', '2021-05-14 16:04:40', '');
INSERT INTO `branchprint` VALUES ('49', 'R0s6646_Wy1RQU0tH3feJI', null, '1', '0', null, null, null);
INSERT INTO `branchprint` VALUES ('50', 'Rnvn3RJB8g2hBgiIsUQSJI', null, '1', '0', null, null, null);
INSERT INTO `branchprint` VALUES ('51', '6fB4CAg1KJL5Ald2p5xlJC', '1', '4', '0', '2021-05-14 16:20:30', '2021-05-14 16:20:33', '');
INSERT INTO `branchprint` VALUES ('52', '1ePJlxC9Iy1cvLIJvG6kav', '1', '4', '0', '2021-05-14 16:34:26', '2021-05-14 16:34:30', '');
INSERT INTO `branchprint` VALUES ('53', 'pdci6GgdMe4wBztYRnGZsv', '13', '4', '0', '2021-05-17 17:11:29', '2021-05-17 17:11:40', '');
INSERT INTO `branchprint` VALUES ('54', 'bJQg87V6EFNI-IYOZZXBsJ', '13', '4', '0', '2021-05-17 17:11:56', '2021-05-17 17:25:09', '');
INSERT INTO `branchprint` VALUES ('55', 'YUWuIUIZ-FXoTHzsyEsSsg', '13', '4', '0', '2021-05-18 08:18:13', '2021-05-18 08:18:40', 'เสร็จแล้วครับ');
INSERT INTO `branchprint` VALUES ('56', '3qfWzNL0gNGXQjOCaR6YTi', '13', '4', '0', '2021-05-18 12:03:16', '2021-05-18 12:03:51', 'ปริ้นเสร็จแล้วรอแห้งจะตัดส่งช่างครับ');
INSERT INTO `branchprint` VALUES ('57', 'CPzscmmVggSVGf8cyBCB0N', '13', '4', '0', '2021-05-18 14:56:18', '2021-05-18 14:58:46', 'เสร็จแล้วครับ');
INSERT INTO `branchprint` VALUES ('58', '5TjzbuWalTuAJcTsc1dubh', null, '1', '0', null, null, null);

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
  `comment` varchar(255) DEFAULT NULL,
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
  `lineid` varchar(255) DEFAULT NULL,
  `channel_etc` varchar(255) DEFAULT NULL COMMENT 'อื่น ๆ ระบุ เช่น line Id',
  `address` varchar(255) DEFAULT NULL COMMENT 'ที่อยู่',
  `typework` int(11) DEFAULT NULL COMMENT 'ประเภทงาน',
  `detail` longtext COMMENT 'รายละเอียดงาน',
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
  `fast` int(1) DEFAULT '0' COMMENT '0 ทั่วไป 1 ด่วนสำคัญ',
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
  `level` int(1) DEFAULT '1' COMMENT 'ระดับงาน 5 = ด่วนมาก',
  `payment` int(1) DEFAULT '1' COMMENT '1 = ยังไม่ชำระเงิน 2 วางมัดจำ 3 ชำระเงินแล้ว',
  `typecustomer` int(1) DEFAULT NULL COMMENT 'ประเภทลูกค้า',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=113 DEFAULT CHARSET=utf8 COMMENT='เก็บรายละเอียดลูกค้า / รับงาน';

-- ----------------------------
-- Records of customer
-- ----------------------------
INSERT INTO `customer` VALUES ('1', 'ป้ายไวนิลน้ำแข็ง', 'Fam', '0931758306', '1', null, 'Fam', 'จัดส่ง... รถตู้แม่สอด\r\n\r\nคุณศุทธวีร์ ที่อยุ่ 364 หมู่ที่6 ต.แม่ตาว อ.แม่สอด จ.ตาก 63110 \r\n0931758306', null, '<p>ป้ายไวนิล พิมพ์ 2 ด้าน ตอกไก่ 4 มุม<br>ขนาด 58x112 ซม. จำนวน 1 ชิ้นๆ ละ 350.-<br><br>ค่าส่ง 100.-<br><br>รวมยอดชำระ 450.-<br><br>---------------------------------------------------------<br><br>ข้อความว่า..<br><br>ร้านน้ำแข็ง<br>สะอาด<br>จำหน่าย<br>น้ำแข็งหลอด-บด<br>ปลีก/ส่ง รับส่งทุกงาน<br>ติดต่องาน0878472765<br> 0931758306</p>', null, '2021-05-06', '09:00:00', '4', null, '2021-05-05 09:05:20', '16', 'W_Dy_0CqF2px9NwnokjDCE', '1', '0', '0', '1', '0', '1', '0', null, null, '2', '0', '2', '0', '1', '8', '2021-05-12 17:03:13', '', '1', '1', null);
INSERT INTO `customer` VALUES ('2', '​ไวนิลในหลวงร.10 ', 'thanyaสวนป่าแม่ละเมา', '098-8262052', '1', null, 'thanyaสวนป่าแม่ละเมา', 'รับหน้าร้าน ', null, '<p>ไวนิลในหลวงร.10<br>ขนาด 100x150 cm. 1 ชิ้นๆละ 240 บาท</p>', null, '2021-05-05', '13:00:00', '4', null, '2021-05-05 09:32:04', '8', 'LpFjgcw2rQ7R8maXPwoNE6', '0', '0', '1', '1', '1', '1', '0', null, null, '2', '0', '0', '0', '1', '8', '2021-05-12 17:12:58', '', '1', '1', null);
INSERT INTO `customer` VALUES ('3', '​พลาสวูด ', 'Rungradit', '081-9868456', '1', null, 'Rungradit', 'จัดส่ง\r\nนายรุ่งรดิศ  วีระกุล\r\nธนาคารกรุงไทย  สาขาเมืองทองธานี ชั้น 3 เลขที่ 321 ถนนบอนด์สตรีท  ตำบลบางพูด อำเภอปากเกร็ด จังหวัดนนทบุรี 11120\r\nโทร.081-9868456', null, '<p>พลาสวูด กว้าง 50 ซม. ยาว 80 ซม. 1 ชิ้นๆละ 750.-<br>ค่าจัดส่ง 150.-<br><br>ยอดรวม 900.-</p>', null, '2021-05-07', '09:30:00', '4', null, '2021-05-05 09:41:16', '8', '80WMVrjv2tuVl5n9cC_CKy', '1', '0', '1', '1', '0', '1', '0', null, null, '0', '2', '2', '0', '1', '8', '2021-05-12 17:13:04', '', '1', '1', null);
INSERT INTO `customer` VALUES ('4', '​ภาพพิมพ์ยูวี', 'Bombay', '0904528488', '1', null, 'Bombay', 'จัดส่ง ส่งรถตู้\r\nพงษ์สิทธิ์ มาขอด ที่อยู่ 633 หมู่ 1 ต.ท่าสายลวด อ.แม่สอด จ.ตาก 63110\r\nโทร.0904528488', null, '<p>ภาพพิมพ์ยูวีขนาด 60x80 ซม. 1ชิ้นๆละ 890.-<br>ค่าจัดรถตู้100.-<br><br>*งานนำภาพมารวมกันใน 1 ชิ้นงาน<br>*ข้อความว่า Happy birthday dear<br>ขอให้มีความสุขมากๆ นะจ้า คิดสิ่งใดขอให้สมปรารถนา ทำอะไรก็ให้ประสบแต่ความสำเร็จ (08/05/64) Love so much<br><br>ยอดชำระรวม 990.-</p>', null, '2021-05-05', '13:00:00', '4', null, '2021-05-05 09:46:17', '8', 'Yf5vTaeciRsnZN5M-I9sLI', '1', '0', '1', '1', '0', '1', '0', null, null, '2', '2', '2', '0', '1', '8', '2021-05-12 17:13:07', '', '1', '1', null);
INSERT INTO `customer` VALUES ('5', 'พวงกุญแจอะคริลิคใส ', 'Pu.. 0939496646', '0939496646', '1', null, 'Pu.. 0939496646', 'คุณปู\r\nRoyal king suite\r\n159 หมู่ 7 ซอยนวมินทร 4 ตำบล บางบ่อ อำเภอบางบ่อ สมุทรปราการ 10560\r\n0939496646', null, '<p>พวงกุญแจอะคริลิคใส 5 มิล พิมพ์ยูวี 4 สี 1 ด้าน<br>ขนาด 4x8 ซม. พร้อมเจสะรูใส่ห่วง พร้อมจัดส่งฟรี <br>จำนวน 160 ชิ้นๆละ 40.- = 6,400.- <br>* ราคาไม่รวมภาษีมูลค่าเพิ่ม * </p>', null, '2021-05-07', '11:00:00', '4', null, '2021-05-05 09:58:15', '8', '76hIJ7ACiXmWpNWvGLspUW', '1', '0', '0', '1', '1', '1', '0', null, null, '2', '2', '2', '0', '1', '8', '2021-05-12 17:13:11', '', '1', '1', null);
INSERT INTO `customer` VALUES ('6', '​สติ๊กเกอร์ PVC', 'OEL', '061-7967260', '1', null, 'OEL', 'รับงานหน้าร้าน ', null, '<p>สติ๊กเกอร์ PVC ขนาด 80X65 ซม. ราคา 450 บาท</p><p>ค่าบริการออกแบบ ราคา 300 บาท</p><p>ค่าบริการ 750 บาท (ลูกค้าชำระเงินสดตอนรับงาน)</p>', null, '2021-05-06', '10:15:00', '4', null, '2021-05-05 10:20:16', '8', 'KINCuRWXK3PMUAOwfw0IA5', '0', '0', '0', '1', '1', '1', '0', null, null, '1', '0', '0', '0', '1', null, '2021-05-12 17:13:20', '', '1', '1', null);
INSERT INTO `customer` VALUES ('7', '​สติ๊กเกอร์ไดคัท', 'chamook :)', '0918829905', '1', null, 'chamook :)', 'รับงานหน้าร้าน ', null, '<p>สติ๊กเกอร์ไดคัท 1 ตรม. 650.- แล้ว รับงานพรุ่งนี้ช่วงบ่าย<br><br>*ตั้งขนาดไว้ที่ กว้าง 5 ซม.เป็นหลัก ความสูงให้จัดสรรให้</p>', null, '2021-05-05', '10:40:00', '4', null, '2021-05-05 10:35:05', '8', '_TDDyi2XV9OSkAs_phSlcX', '0', '0', '1', '1', '0', '1', '0', null, null, '2', '0', '2', '0', '1', '8', '2021-05-12 17:13:28', '', '1', '1', null);
INSERT INTO `customer` VALUES ('8', 'ทดสอบส่งงานโดยณัฐพล', 'ทดสอบส่งงานโดยณัฐพล', '', '1', null, 'nammawan', 'ไปติดตั้งร้านกาแฟ soon cafe ริมน้ำ', null, '<p>เพื่อจะทดสอบว่าคนๆเดียวสามารถรับงาน / ส่งงาน ไปยังแผนกอื่นๆ ได้โดยไม่ต้องผ่านฝ่ายใดๆ</p>', null, '2021-05-05', '10:36:00', '4', null, '2021-05-05 10:40:28', '1', 'H5O9zgJoDb6GiMH_xX4mPE', '0', '1', '0', '1', '1', '1', '0', null, null, '0', '2', '0', '2', '1', '1', '2021-05-12 17:13:32', '', '1', '1', null);
INSERT INTO `customer` VALUES ('9', 'สติ๊กเกอร์ไดคัท ', 'fa', '0928166996', '1', null, 'fa', 'รับงานหน้าร้าน ', null, '<p>สติ๊กเกอร์ขนาด 10x5 ซม. จำนวน 1 ตรม. ลูกค้ารับงานหน้าร้าน 500.-<br>*โปรลดเหลือ 400.- </p>', null, '2021-05-05', '11:15:00', '3, 4', null, '2021-05-05 11:12:37', '8', 'aqoqo21ctwWwK8PhqFKfqs', '0', '0', '1', '1', '0', '1', '0', null, null, '2', '0', '0', '0', '1', '8', '2021-05-12 17:13:40', '', '1', '1', null);
INSERT INTO `customer` VALUES ('10', 'สติ๊กเกอร์ใส', 'OEL', '0617967260', '1', null, 'OEL', 'รับงานหน้าร้าน ', null, '<p>พิมพ์สติ๊กเกอร์ใส ขนาด 60x40cm = 2 ชิ้นๆละ 300.- = 600.-<br>(แบบที่ลูกค้าส่งมา) </p>', null, '2021-05-06', '13:00:00', '4', null, '2021-05-05 11:18:15', '8', '1-deFHIsDp8UH_1LfynQ33', '0', '0', '1', '1', '1', '1', '0', null, null, '2', '0', '2', '0', '1', '8', '2021-05-12 17:13:48', '', '1', '1', null);
INSERT INTO `customer` VALUES ('11', 'คอมโพสิตขาว ', 'Eubeib กาแฟ (Soon คาเฟ่)', '0850536709', '1', null, 'Eubeib กาแฟ (Soon คาเฟ่)', 'งานติดตั้ง', null, '<p>คอมโพสิตขาว 10 มิล ตีกล่อง 80x80x20 cm. + ตัวอักษรพลาสวูดทำสีเทา = 3,500.- </p>', null, '2021-05-07', '09:00:00', '3, 4', null, '2021-05-05 13:13:31', '8', 'l7bbwQI9C4UqeU9f7nnwZB', '0', '1', '1', '1', '1', '1', '0', null, null, '2', '2', '2', '0', '1', '8', '2021-05-12 17:13:55', '', '1', '1', null);
INSERT INTO `customer` VALUES ('12', 'ฉากกั้นอะคริลิคขนาด 110x60 cm. ', 'ปอนด์ ', '081-9795951', '1', null, 'ปอนด์ ', 'นายปอล มามะกะมูละ\r\n15/5 ตำบลขุนโขลน อำเภอพระพุทธบาท จังหวัดสระบุรี\r\n18120\r\n081-9795951', null, '<p>ฉากกั้นอะคริลิคขนาด 110x60 ด้านข้างซ้ายขวาฝั่งละ 30 cm. 3 ชิ้นๆละ 1,580.-<br><br>ค่าจัดส่ง 500.- (เกินนี้ทางร้านดูแลให้ค่ะ)<br><br>ยอดชำระทั้งสิ้น 5,240.-</p>', null, '2021-05-05', '15:00:00', '3, 4', null, '2021-05-05 14:21:57', '8', 'HQcTSNCNtgc3SWwo5aAeAE', '1', '0', '1', '1', '0', '1', '0', null, null, '0', '2', '2', '0', '1', '1', '2021-05-12 17:14:02', '', '1', '1', null);
INSERT INTO `customer` VALUES ('13', 'สติ๊กเกอร์ซีทรูติดกระจก + ฉากกั้นเคาน์เตอร์โฟมบอร์ด 4 มิล', 'พี่เจี๊ยบ อบตโป่งแดง', '0925565364', '1', null, 'พี่เจี๊ยบ อบตโป่งแดง', 'ติดตั้งงาน อบต.โป่งแดง (กองสวัสดิการสังคม)', null, '<p>1. ติดกระจกห้องกองสวัสดิการสังคม</p><p>สติ๊กเกอร์ซีทรู พร้อมติดตั้ง จำนวน 10 บาน</p><p>2. ฉากกั้นเคาน์เตอร์โฟมบอร์ด 4 มิล </p><p>ขนาด 150X75 ซม. จำนวน 1 ชิ้น</p><p>ขนาด 150X75 +75 ซม. จำนวน 1 ชิ้น </p><p>**แถมริ้วทองมิลเลอร์ ปิดขอบบนไปด้วย **</p><p>งานติดตั้งที่ อบต.โป่งแดง</p><p>.</p><p>อ้างอิงใบเสนอราคา QT2021050012</p>', null, '2021-05-07', '10:32:00', '3, 4', null, '2021-05-05 14:40:27', '8', 'ZevKuy2Fnz8Bmpa1RsXKSI', '0', '1', '1', '1', '1', '1', '0', null, null, '2', '0', '2', '1', '1', null, '2021-05-12 17:14:11', '', '1', '1', null);
INSERT INTO `customer` VALUES ('14', 'สแตนดี้ฟิวส์ ', 'Cue_cue', '0819734867', '1', null, 'Cue_cue', 'ลูกค้ารับเองหน้าร้าน', null, '<p>สแตนดี้ : ฟิวเจอร์บอร์ดพิมพ์ยูวี พร้อมขาตั้ง</p><p>ขนาดรวม 70X150 ซม. จำนวน 1 ชิ้น</p><p>.</p><p>อ้างอิงใบเสนอราคา QT2021050020</p>', null, '2021-05-07', '10:00:00', '3, 4', null, '2021-05-05 16:20:06', '8', 'lER6-HE2lJwDeTY21TlJ6s', '0', '0', '1', '1', '1', '1', '0', null, null, '2', '0', '2', '0', '1', '8', '2021-05-12 17:14:19', '', '1', '1', null);
INSERT INTO `customer` VALUES ('15', 'ไวนิลพับขอบตอกไก่ 4 ด้าน ', 'AON', '0612850218', '1', null, 'AON', 'ลูกค้ารับงานหน้าร้าน ขอรับงาน 06/05 ก่อนเวลา 12.00 น. ', null, '<p>ไวนิลขนาด 220x77 ซม. 1 ป้ายๆละ 245.-<br>พับขอบเจาะรู 4 ด้าน</p>', null, '2021-05-05', '11:30:00', '3, 4', null, '2021-05-05 17:18:21', '8', 'Pel7uZlkWv70QlEM7N_lKb', '0', '0', '1', '1', '0', '1', '0', null, null, '2', '0', '1', '0', '1', '8', '2021-05-12 17:14:27', '', '1', '1', null);
INSERT INTO `customer` VALUES ('16', '​บล็อคพ่นสี', 'yai', '0851003160', '1', null, 'yai', 'ร้านทำทุกอย่างดอทคอม  \r\nK เข้ม 0851003160\r\n\r\nเลขตึก  162/532  บางแคคอนโดทาวน  \r\nห้อง 168 อาคารพาณิชย์  ก่อนถึงศาลพระภูมิ  \r\nถ.เพชรเกษม   แขวงบางแคเหนือ เขตบางแค  กรุงเทพน  10160', null, '<p>บล็อคพ่นสี ขนาด 45x16 ซม. 1 ชิ้นๆละ 350.- รวมส่ง J&amp;T<br>*ข้อมูลอยู่ในเมล์</p>', null, '2021-05-07', '11:00:00', '3, 4', null, '2021-05-05 17:21:16', '8', 'ZJpRfgA-Sg1-iQ0c_lFTPA', '1', '0', '0', '1', '0', '1', '0', null, null, '0', '2', '2', '0', '1', '8', '2021-05-12 17:14:30', '', '1', '1', null);
INSERT INTO `customer` VALUES ('17', 'Banner Stand ', 'ประภัสสร เกษตรตาก', '055 511 009', '1', null, 'ประภัสสร เกษตรตาก', 'สำนักงานเกษตรจังหวัดตาก', null, '<p>Banner Stand ขนาด 60x160 ซม. <span class=\"redactor-invisible-space\"> จำนวน 5 ป้าย</span></p><p><span class=\"redactor-invisible-space\">** ลูกค้ามีไฟล์งานให้ แต่ต้องปรับขนาดให้ได้ 60X160 ซม. **</span></p><p><span class=\"redactor-invisible-space\">.</span></p><p><span class=\"redactor-invisible-space\">อ้างอิง QT2021040102<span class=\"redactor-invisible-space\"></span></span></p>', null, '2021-05-07', '13:00:00', '3, 4', null, '2021-05-05 17:31:01', '8', '-D3HjJnBYj_bngAK3ut3Nc', '0', '0', '1', '1', '1', '1', '0', null, null, '2', '0', '2', '0', '1', null, '2021-05-12 17:14:37', '', '1', '1', null);
INSERT INTO `customer` VALUES ('18', 'บล็อคพ่นสี', 'Fon', '0942969749', '1', null, 'Fon', 'น.ส.สายฝน แก้วคำภา\r\nที่อยู่ 70 หมู่11 ต.นาชุมแสง อ.ภูเวียง จ.ขอนแก่น 40150  \r\nเบอร์ 094-2969749', null, '<p>บล็อคพ่นสี ขนาด 40x20 cm. 1 ชิ้นๆละ 200.-<br>ค่าจัดส่งแฟลช 80.-<br><br>ยอดชำระรวม 280.-</p>', null, '2021-05-07', '09:00:00', '3, 4', null, '2021-05-06 08:48:37', '8', 'BdSi1aloNqzKqs1dRzh_Mb', '1', '0', '0', '1', '0', '1', '0', null, null, '0', '2', '2', '0', '1', '8', '2021-05-12 17:14:44', '', '1', '1', null);
INSERT INTO `customer` VALUES ('19', '​ป้ายชื่อติดอก', 'Nalina', '0872664433', '1', null, 'Nalina', 'จัดส่ง\r\nคุณนลินา จันทะฟอง\r\n2/44 หมู่ 1 ต.ทับปุด อ.ทับปุด จ.พังงา 82180\r\nโทร 087 2664433', null, '<p>ป้ายชื่อติดอก 2 ชิ้นๆละ 200.- = 400.-<br>ค่าจัดส่ง 100.-<br><br>ยอดชำระรวม 500.-<br><br>ป้ายที่1<br>นลินา จันทะฟอง<br>ประธานสภาเทศบาล<br><br>ป้ายที่2<br>ณัฐวุฒิ พุมฤทธิ์<br>รองประธานสภาเทศบาล</p>', null, '2021-05-08', '10:00:00', '3, 4', null, '2021-05-06 11:01:43', '8', '72IH6IoMq2GVAY6g6j9cWI', '1', '0', '0', '1', '0', '1', '0', null, null, '0', '0', '0', '0', '1', '8', '2021-05-12 17:14:47', '', '1', '1', null);
INSERT INTO `customer` VALUES ('20', '​X-Stand ', 'X-Stand พิซซ่าแม่สอด', '063-9054880', '1', null, 'X-Stand พิซซ่าแม่สอด', 'จัดส่งรถตู้แม่สอด\r\n\r\nชื่อ  Bao\r\n612/1ถ.อินทรคีรี  ต.แม่สอด  อ.แม่สอด  จ.ตาก63110(ร้านผลไม้หน้าวัดชุมพล)\r\nโทร.063-9054880 / 095-3316844', null, '<p>X-Stand 60x160 ซม. จำนวน 2 ชิ้นๆละ 1,100.-</p><p>รวมเป็นเงิน 2,200.-<br><br>ค่าจัดส่ง 150.-<br><br>รวมยอดชำระ 2,350.-</p>6 พ.ค. 2021 16.36 น.<span class=\"text-dark ml-2\">', null, '2021-05-07', '13:00:00', '3, 4', null, '2021-05-06 17:01:37', '8', 'JK9-EvGZcUUQ_i7KnFAycm', '1', '0', '1', '1', '0', '1', '0', null, null, '2', '0', '2', '0', '1', '8', '2021-05-12 17:14:50', '', '1', '1', null);
INSERT INTO `customer` VALUES ('21', 'ไวนิลพับขอบตอกไก่ 4 ด้าน ', 'ตากขาวละออ', '0000000000', '1', null, 'ตากขาวละออ', 'รับงานหน้าร้าน', null, '<p>ไวนิลไวนิลขนาด 220 x 150 cm<br>พับขอบตอกไก่ 4 ด้าน </p>', null, '2021-05-07', '16:00:00', '3, 4', null, '2021-05-06 17:06:16', '8', 'kLtTSk2dfLXj3wJUeKAQdV', '0', '0', '1', '1', '1', '1', '0', null, null, '2', '0', '0', '0', '1', '8', '2021-05-12 17:14:54', '', '1', '1', null);
INSERT INTO `customer` VALUES ('22', '​ป้ายคอมโพสิตทองเมทัลลิก', 'Vera Cafe’ & Gallery', '0837487373', '1', null, 'Vera Cafe’ & Gallery', 'ส่งปณ.\r\n\r\nคุณกิติศักดิ์ จันทร์ถาวร\r\n315 ถ.กีฬากลาง ต.ในเมือง อ.เมือง จ.นครราชสีมา 30000\r\n0837487373', null, '<p>ป้ายคอมโพสิตทองเมทัลลิก ขนาด 35x15 ซม. 1 ชิ้นๆละ 235.-<br>ค่าจัดส่ง 100.-<br><br>ยอดชำระรวม 335.-<br><br>* ป้ายทางออก EXIT ตามแบบ</p>', null, '2021-05-07', '13:00:00', '3, 4', null, '2021-05-07 08:54:02', '8', 'DyGy_kfng8CV9Jnd-DKGxK', '1', '0', '1', '1', '0', '1', '0', null, null, '2', '0', '0', '0', '1', '8', '2021-05-12 17:15:00', '', '1', '1', null);
INSERT INTO `customer` VALUES ('23', 'ภาพพิมพ์ยูวี', 'SIN', '0991055553', '1', null, 'SIN', 'รับงานหน้าร้าน ', null, '<p>ภาพพิมพ์ยูวี ขนาด 30x40 ซม. 1 ชิ้นๆละ 250.- (ราคาส่ง)<br>ข้อความ Happy Birthday</p>', null, '2021-05-08', '12:00:00', '3, 4', null, '2021-05-07 09:00:31', '8', 'uy0t1Xm7NfCoTw2rD1zKU9', '0', '0', '0', '1', '0', '1', '0', null, null, '2', '0', '0', '0', '1', '8', '2021-05-12 17:15:07', '', '1', '1', null);
INSERT INTO `customer` VALUES ('24', ' ป้ายชื่อติดอก', 'Nalina', '0872664433', '1', null, 'Nalina', 'จัดส่งปณ. \r\nคุณนลินา จันทะฟอง\r\n2/44 หมู่ 1 ต.ทับปุด อ.ทับปุด จ.พังงา 82180\r\nโทร 087 2664433', null, '<p>งานเพิ่ม ป้ายชื่อติดอก 2 ชิ้นๆละ 200.- <br>ยอดชำระรวม 400.-<br><br>ป้ายที่1<br>การุณ ชูสังข์<br>รองนายกเทศมนตรี<br><br>ป้ายที่2<br>อนันต์ ชูพุฒ<br>รองนายกเทศมนตรี</p>', null, '2021-05-08', '13:00:00', '3, 4', null, '2021-05-07 13:06:46', '8', '_kn8kDdx84Qpsh3jCEO0cP', '1', '0', '1', '1', '0', '1', '0', null, null, '2', '1', '0', '0', '1', '8', '2021-05-12 17:15:10', '', '1', '1', null);
INSERT INTO `customer` VALUES ('25', '​ฟิว 3 มิล พิมพ์ยูวี', 'พี่ขาว cat', '0885998536', '1', null, 'พี่ขาว cat', 'งานลูกค้าพี่ณัฐ *หน้าร้าน*', null, '<p>ฟิว 3 มิล พิมพ์ยูวี  80x40 ซม. แผ่นละ 160.-<br>- พื้นเหลือง 14 ชิ้น = 160x14 = 2,240.-<br>- พื้นขาว 13 ชิ้น = 160x13 = 2,080.-<br><br>ใบเสนอราคา QT2021050023 <a href=\"https://doc-api.flowaccount.com/quotation/share/html/th/nrv9w4f0usq3x5pyjwcyq\" target=\"_blank\" rel=\"noopener\">https://doc-api.flowaccount.com/quotation/share/html/th/nrv9w4f0usq3x5pyjwcyq</a></p>', null, '2021-05-10', '10:30:00', '3, 4', null, '2021-05-07 15:51:26', '8', 'MFzzD00Me92O7h2Jy0vzHu', '0', '0', '0', '1', '1', '1', '0', null, null, '2', '0', '0', '0', '1', null, '2021-05-12 17:15:13', '', '1', '1', null);
INSERT INTO `customer` VALUES ('26', 'ภาพพิมพ์ยูวี', 'SA  Bl', '099-4543972​', '1', null, 'SA  Bl', 'จัดส่ง คุณสาวิตรี​ บาง​หลวง\r\nสำนักงาน​ส​กท.พิจิตร​ 52  ม.2  ต.ทุ่ง​น้อย​ อ.โพทะเล​ จ.พิจิตร​66130\r\nโทรศัพท์​099-4543972​', null, '<p>ภาพพิมพ์ยูวี ขนาด 20x30 ซม. 2 ชิ้นๆละ 260.- (ราคาลด10%จาก290.-)<br>ค่าจัดส่ง 200.-<br><br>ยอดชำระทั้งสิ้น 720.-</p>', null, '2021-05-08', '14:00:00', '3, 4', null, '2021-05-07 16:24:13', '8', '2hhEmcmI5HiRzfrZUDbcpd', '1', '0', '1', '1', '0', '1', '0', null, null, '2', '0', '0', '0', '1', '8', '2021-05-12 17:15:19', '', '1', '1', null);
INSERT INTO `customer` VALUES ('27', 'สติ๊กเกอร์ติดรถ', 'fat boy ', '-', '4', null, 'ลูกค้าพี่ณัฐ ', 'ลูกค้าพี่ณัฐ ', null, '<p>สติ๊กเกอร์ติดรถ (สีแดง) </p><p>*** เพิ่มเติมสอบถามพี่ณัฐค่ะ ***</p>', null, '2021-05-10', '10:00:00', '3, 4', null, '2021-05-07 16:55:11', '8', 'lqPKHuXygVGDIpYsyI9kt7', '0', '1', '1', '1', '0', '1', '0', null, null, '2', '0', '0', '2', '1', '8', '2021-05-12 17:15:26', '', '1', '1', null);
INSERT INTO `customer` VALUES ('28', 'คอมโพสิตขาวพิมพ์ยูวี ติดตัวอักษรอะคริลิค', 'จัดซื้อPDK', '082-5239080', '1', null, 'จัดซื้อPDK', '29/1 หมู่11 ต.คลองห้า อ.คลองหลวง จ.ปทุมธานี', null, '<p>คอมโพสิตขาวพิมพ์ยูวี ติดตัวอักษรอะคริลิค สีตามแบบ + หมุดปิดหัว 6 ตัว/ชุด<br>ป้ายขนาด 240x50 ซม. = 3,000.- <br>ค่าจัดส่ง 800.- </p><p><br></p>', null, '2021-05-10', '11:00:00', '3, 4', null, '2021-05-07 17:11:07', '8', 'kUH617ueCSMo-_c7ONrmLW', '1', '0', '0', '2', '0', '1', '0', '99', 'ลงงานซ้ำ', '0', '0', '0', '0', '0', null, null, null, '1', '1', null);
INSERT INTO `customer` VALUES ('29', '​ภาพพิมพ์ยูวี', 'SIN', '0620363521', '1', null, 'SIN', '* รับงานหน้าร้าน ', null, '<p>ภาพพิมพ์ยูวี ขนาด 40x50 ซม. 1 ชิ้นๆละ 450.- (ราคาส่ง)<br><br>รายละเอียดงาน<br>-ขนาด 40x50<br>-เพลงแค่เธอเข้ามาของ tilly bird (ใช้คิวอาร์โค้ด joox)<br>-ข้อความไม่มี</p>', null, '2021-05-10', '11:30:00', '3, 4', null, '2021-05-08 09:06:31', '8', 'KpZoS2n0XXjgWrCvn1MOKS', '0', '0', '0', '1', '0', '1', '0', null, null, '2', '0', '0', '0', '1', '8', '2021-05-12 17:15:32', '', '1', '1', null);
INSERT INTO `customer` VALUES ('30', 'บล็อคพ่นสี', 'yai', ' 0851003160', '1', null, 'yai', 'ร้านทำทุกอย่างดอทคอม  \r\nK เข้ม 0851003160\r\n\r\nเลขตึก  162/532  บางแคคอนโดทาวน  \r\nห้อง 168 อาคารพาณิชย์  ก่อนถึงศาลพระภูมิ  \r\nถ.เพชรเกษม   แขวงบางแคเหนือ เขตบางแค  กรุงเทพน  10160', null, '<p>บล็อคพ่นสี ขนาด A4 1 ชิ้นๆละ 320.- รวมส่ง</p><p>*ข้อมูลอยู่ในเมล์</p>8 พ.ค. 2021 9.08 น.<span class=\"text-dark ml-2\">', null, '2021-05-10', '10:00:00', '3, 4', null, '2021-05-08 09:08:49', '8', 'rJAJa1zr9t8YihRUh5yKM6', '1', '0', '0', '1', '0', '1', '0', null, null, '0', '1', '0', '0', '1', '8', '2021-05-12 17:15:35', '', '1', '1', null);
INSERT INTO `customer` VALUES ('31', 'สติ๊กเกอร์ฝ้า', 'kanjanun', '0882933687', '1', null, 'kanjanun', '* รับงานหน้าร้าน ', null, '<p>เพิ่มงานสติ๊กเกอร์ฝ้า 1 ชิ้น *แก้ไขที่อยู่ </p>', null, '2021-05-10', '10:00:00', '3, 4', null, '2021-05-08 10:10:11', '8', 'X77vrRC85W3ppSbUrwoP43', '0', '0', '0', '1', '1', '1', '0', null, null, '2', '0', '0', '0', '1', '8', '2021-05-12 17:15:41', '', '1', '1', null);
INSERT INTO `customer` VALUES ('32', 'ภาพพิมพ์ยูวี', 'พี่บัญชา นายกโบ๊ท', '-', '4', null, '-', '* รับงานหน้าร้าน ', null, '<p>ภาพพิมพ์ยูวี 40x60 ซม.<br>*เปลี่ยนพื้นหลังเป็นสีน้ำเงิน<br><br>*งานฟรีพี่เฟิร์นไม่คิดเงิน</p>', null, '2021-05-10', '10:10:00', '3, 4', null, '2021-05-08 10:11:42', '8', 'm0KhYK9RmwgVOGo-0MmlhG', '0', '0', '0', '1', '0', '1', '0', null, null, '2', '0', '0', '0', '1', '8', '2021-05-12 17:15:47', '', '1', '1', null);
INSERT INTO `customer` VALUES ('33', 'ป้ายอะคริลิคสีขาว', 'Alis Passapan', '083-335 8899', '1', null, 'Alis Passapan', 'รอที่อยู่จัดส่ง *แก้ไขอีกครั้ง ', null, '<p>ป้ายอะคริลิคสีขาวขนาด 45x30 ซม. 1 ชิ้นๆละ 850.- รวมจัดส่ง<br>น็อตลอย 2 ตัวๆละ 40.-<br><br>ยอดชำระทั้ง 930.-</p>', null, '2021-05-10', '11:00:00', '3, 4', null, '2021-05-08 13:54:40', '8', 'WQGXPhm9vwlsfnZA11AWaY', '1', '0', '0', '1', '0', '1', '0', null, null, '2', '1', '0', '0', '1', '8', '2021-05-12 17:15:54', '', '1', '1', null);
INSERT INTO `customer` VALUES ('34', '1.คอมโพสิตขาวพิมพ์ยูวี + 2.ไวนิล', 'จัดซื้อPDK', '082-5239080', '1', null, 'จัดซื้อPDK', 'ฟอร์คอนเฮ้าส์ หจก.สำนักงานใหญ่ 29/2 หมู่11 ต.คลองห้า อ.คลองหลวง จ.ปทุมธานี 12120', null, '<p>1.คอมโพสิตขาวพิมพ์ยูวี ติดตัวอักษรอะคริลิค สีตามแบบ + หมุดปิดหัว 4 ตัว/ชุด รูขนาด 8 มม.<br>ป้ายขนาด 120x50 ซม. = 2,000.-</p><p>2.ไวนิลขนาด 350x100 ซม. 1 ชิ้นๆละ 560.-<br>พับขอบ เจาะ 6 รู (บน-ล่างอย่างละ 3)</p><p>ค่าจัดส่ง 500.-<br><br>ยอดรวม 3,060.- Vatนอก</p>', null, '2021-05-11', '12:00:00', '3, 4', null, '2021-05-08 17:15:43', '8', 'ASSAjitIb9LjfuW4kfBfqk', '1', '0', '0', '1', '1', '1', '0', null, null, '2', '1', '2', '0', '1', '8', '2021-05-12 17:16:01', '', '1', '1', null);
INSERT INTO `customer` VALUES ('35', 'คอมโพสิตพิมพ์ยูวี + ป้ายอะคริลิคพิมพ์ยูวี', 'BEST Risa', '098-3945694', '1', null, 'BEST Risa', 'จัดส่งปณ.\r\nคุณจุฑามาศ คงศรี\r\nร้านชำนาญพันธ์ไม้ 399/2  หมู่ที่ 1 ต.เสาธง อ.ร่อนพิบูลย์  จ.นครศรีธรรมราช 80350\r\nTel.098-3945694', null, '<p>1. คอมโพสิตพิมพ์ยูวี ขนาด 60x40 ซม. 1 ชิ้นๆละ 590.- (แนวนอน)<br><br>2. ป้ายอะคริลิคพิมพ์ยูวี ขนาด 60x40 cm. 1 ชิ้นๆละ 790.-<br><br>3. ค่าจัดส่งฟรี<br><br>ยอดชำระรวม 1,380.-</p>', null, '2021-05-11', '12:00:00', '3, 4', null, '2021-05-08 17:18:26', '8', 'ceO-2fQclNvEJwDd4S7jIy', '1', '0', '0', '1', '0', '1', '0', null, null, '2', '1', '0', '0', '1', null, '2021-05-12 17:16:08', '', '1', '1', null);
INSERT INTO `customer` VALUES ('36', '​ป้ายไวนิล', 'BURITWUTTHIKON', '0890481377', '1', null, 'BURITWUTTHIKON', 'โรงพยาบาลส่งเสริมสุขภาพตำบลแม่สอง\r\nที่อยุ่ 567 ม.2 ต.แม่สอง อ.ท่าสองยาง จ.ตาก 63150\r\n\r\n0994002474706', null, '<p>ป้ายไวนิลรณรงค์ขนาด 300x150 ซม. (แนวนอน) 6 ชิ้นๆละ 720.- = 4,320.-<br>ป้ายไวนิลโคงการขนาด 300x150 ซม. (แนวนอน) 1 ชิ้นๆละ 720.- = 720.-<br>ค่าจัดส่งทางดูแลให้ฟรีค่ะ<br><br>ยอดชำระรวม 5,392.80 บาท (ราคานี้รวมภาษีมูลค่าเพิ่มแล้วค่ะ)<br><br>* แยกใบเสนอราคา</p>', null, '2021-05-12', '10:00:00', '3, 4', null, '2021-05-10 10:19:01', '8', '5UMnCH7Tp8ts2NPVTq8b7I', '1', '0', '1', '1', '1', '1', '0', null, null, '0', '0', '0', '0', '1', null, '2021-05-12 17:16:14', '', '1', '1', null);
INSERT INTO `customer` VALUES ('37', 'ฉากกั้นอะคริลิค', 'เอซีป้าย ', '095-6641157', '1', null, 'เอซีป้าย ', 'เอซีป้าย \r\n438 ม.3 ถ.จรดลสวรรค์ ต.ท่าบ่อ อ.ท่าบ่อ \r\nจ.หนองคาย 43110\r\nโทร.095-6641157\r\n', null, '<p>ฉากกั้นอะคริลิค </p><p>*เพิ่มเติมสอบถามพี่ณัฐ</p>', null, '2021-05-11', '11:00:00', '3, 4', null, '2021-05-10 13:33:26', '8', 'u7i2Oit-QdjVBf26oA2LM5', '1', '0', '1', '1', '0', '1', '0', null, null, '0', '2', '0', '0', '1', '8', '2021-05-12 17:16:22', '', '1', '1', null);
INSERT INTO `customer` VALUES ('38', '​ป้ายอะคริลิคขาวพิมพ์ยูวี', 'PHCHR พาสุข', '0000000000', '1', null, 'PHCHR พาสุข', '* รับงานหน้าร้าน ', null, '<p>ป้ายอะคริลิคขาวพิมพ์ยูวี ขนาด 80x30 cm 2ชิ้นๆละ 850.-</p>', null, '2021-05-12', '10:00:00', '3, 4', null, '2021-05-10 14:39:03', '8', 'Nm8YXtbe5__ByiIayzf8KA', '0', '0', '0', '1', '1', '1', '0', null, null, '2', '1', '2', '0', '1', '8', '2021-05-12 17:16:28', '', '1', '1', null);
INSERT INTO `customer` VALUES ('39', 'ฉากกั้นอะคริลิค', 'แซนมินา', '0000000000', '4', null, 'แซนนามิ ', '*ลูกค้าพี่ณัฐ ', null, '<p>ฉากกั้นอะคริลิค 3 mm. <br>* ข้อมูลเพิ่มเติมสอบถามพี่ณํฐ </p><p><br></p>', null, '2021-05-11', '14:00:00', '3, 4', null, '2021-05-10 15:14:14', '8', '0a4gSaSnJl_Hz8SJsWjb2G', '1', '0', '1', '1', '0', '1', '0', null, null, '2', '1', '0', '0', '1', '8', '2021-05-12 17:16:34', '', '1', '1', null);
INSERT INTO `customer` VALUES ('40', 'สติ๊กเกอร์ไดคัท ', 'เก-ตุ-วะ-ดี', '0813791627', '1', null, 'เก-ตุ-วะ-ดี', '* รับงานหน้าร้าน ', null, '<p>สติ๊กเกอร์ไดคัท 1 แผ่น 80.- </p>', null, '2021-05-10', '17:00:00', '3, 4', null, '2021-05-10 15:52:20', '8', '7qdguXaqdFQZJR_asF_UfQ', '0', '0', '1', '1', '0', '1', '0', null, null, '2', '0', '0', '0', '1', '8', '2021-05-12 17:16:45', '', '1', '1', null);
INSERT INTO `customer` VALUES ('41', '​ป้ายพลาสวูดพิมพ์ยูวี', 'Keky', '0839289428', '1', null, 'Keky', 'ส่งปณ.\r\nร้านวิชาญการเกษตร\r\nกาญจนา วงษ์ศรีแก้ว 76หมู่10 บ้านโสกผักหวาน ตำบลดู่ลาด อำเภอทรายมูล จังหวัดยโสธร 35170\r\nโทร. 083-9289428', null, '<p>ป้ายพลาสวูดพิมพ์ยูวี พิมพ์ยูวี + ติดอักษรนูน 1 ด้าน ขนาด 50x15 ซม. 1 ชิ้นๆละ 690.-<br>ค่าจัดส่ง 150.-<br><br>-------------- ยอดชำระทั้งสิ้น 840 บาทค่ะ -----------------</p>', null, '2021-05-12', '11:00:00', '3, 4', null, '2021-05-10 15:58:31', '8', 'XMXoW-yaSzIWCiUTtjiXFW', '1', '0', '0', '1', '0', '1', '0', null, null, '2', '1', '0', '0', '1', null, '2021-05-12 17:16:52', '', '1', '1', null);
INSERT INTO `customer` VALUES ('42', 'ไวนิล', 'Rin มะม่วงขนส่ง', '0652690509', '1', null, 'Rin มะม่วงขนส่ง', '* ลูกค้ารับงานหน้าร้าน ', null, '<p>ไวนิลขนาด 200x150 ซม. 1 ผืนๆละ 480.-</p><p>พับขอบเจาะรู 6 รู </p><p>*ลูกค้าต้องการตรีมงานสี ม่วง + ส้ม </p><p>*ข้อมูลคล้ายแบบตัวอย่างที่ส่งมา</p>', null, '2021-05-11', '16:00:00', '3, 4', null, '2021-05-10 16:46:58', '8', '_HTbSTzcnu_8YXRiOHbn-W', '0', '0', '1', '1', '0', '1', '0', null, null, '0', '0', '0', '0', '1', null, '2021-05-12 17:16:58', '', '1', '1', null);
INSERT INTO `customer` VALUES ('43', '​อะคริลิคพิมพ์ยูวี', 'Don Aladin50', '0000000000', '1', null, 'Don Aladin50', '* รับงานหน้าร้าน ', null, '<p>อะคริลิคพิมพ์ยูวี ขนาด 40x22 ซม. 1ชิ้นๆละ 1,000.-<br><br>ยอดชำระทั้งสิ้น 1,070 บาท<br>(ราคานี้รวมภาษีมูลค่าเพิ่มแล้ว)<br><br>*ป้ายสอดเปลี่ยนชื่อเปลี่ยนรูป<br>* หัวข้อ สถานีไฟฟ้าแรงสูงตาก 2</p>', null, '2021-05-13', '10:00:00', '3, 4', null, '2021-05-11 09:57:54', '8', 'QSLbWxE12CQGIwWMDl9pGb', '0', '0', '0', '1', '1', '1', '0', null, null, '1', '1', '1', '0', '1', null, '2021-05-12 17:17:05', '', '1', '3', null);
INSERT INTO `customer` VALUES ('44', 'ผ้าคลุมโต๊ะ', 'ณัฐดีไซน์', '0654944505', '3', null, '-', 'ส่งออฟฟิต', null, '<p>ไวนิลคลุมโต๊ะรับงาน</p>', null, '2021-05-12', '10:26:00', '3', null, '2021-05-11 10:28:15', '16', '6sPLpN7SmjvQLLKoafR940', '0', '1', '0', '1', '0', '1', '0', null, null, '2', '1', '2', '2', '1', '8', '2021-05-12 17:17:35', '', '1', '3', null);
INSERT INTO `customer` VALUES ('45', '​สติ๊กเกอร์ไดคัท', 'Champ กาชาด', '0000000000', '1', null, 'Champ กาชาด', 'รับงานหน้าร้าน ', null, '<p>สติ๊กเกอร์ไดคัท ขนาด 3.5x5 cm<br>- เหล่า 300 ดวง<br>- มมท 300 ดวง</p>', null, '2021-05-12', '10:00:00', '3, 4', null, '2021-05-11 11:11:09', '8', 'n3TfnfxsKFdQQFeDT5AEVI', '0', '0', '1', '1', '1', '1', '0', null, null, '2', '0', '1', '0', '1', null, '2021-05-12 17:17:42', '', '4', '1', null);
INSERT INTO `customer` VALUES ('46', 'ป้ายเครื่องดื่ม', 'ณัฐดีไซน์', '0654944505', '3', null, '-', 'ส่งมอบงานออฟฟิต', null, '<p><img src=\"data:image/png;base64,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', null, '2021-05-11', '11:17:00', '3', null, '2021-05-11 11:21:02', '16', 'LTJBdwfKR1fPJgSt96JA-c', '0', '1', '0', '1', '0', '1', '0', null, null, '2', '1', '2', '2', '1', '16', '2021-05-12 17:17:51', '', '3', '3', null);
INSERT INTO `customer` VALUES ('47', 'ป้ายเครื่องดื่ม 2', 'ณัฐดีไซน์', '0654944505', '3', null, '-', '', null, '', null, '2021-05-11', '11:26:00', '3', null, '2021-05-11 11:28:12', '16', 'Qe-0jK3dcpTUbSEu8NCm_D', '0', '1', '0', '1', '0', '1', '0', null, null, '2', '1', '1', '2', '1', '16', '2021-05-12 17:17:56', '', '3', '3', null);
INSERT INTO `customer` VALUES ('48', 'ไวนิลและอื่นๆ ', 'รักจัง coffee mart ', '0000000000', '4', null, 'ลูกค้าพี่ณัฐ ', 'รับงานหน้าร้าน ', null, '<p>1. ไวนิล 300x80 ซม. 1 ชิ้นๆละ 380.-<br>2. ฟิล 5 มิล 80x60 ซม. 1 ชิ้นๆละ 300.- <br>3. ฟิล 5 มิล 40x60 ซม. 1 ชิ้นๆละ 150.-<br>4. ธงญี่ปุ่นพร้อมขา 50x180 ซม. 2 ชุดๆละ 1,000.-  <br> </p>', null, '2021-05-11', '15:00:00', '4', null, '2021-05-11 13:12:13', '8', '9lLpBEMv3URV9CIKowTvtp', '0', '0', '1', '1', '1', '1', '0', null, null, '2', '1', '2', '0', '1', '1', '2021-05-12 17:18:03', '', '5', '1', null);
INSERT INTO `customer` VALUES ('49', 'ป้ายบ้านเลขที่คอมโพสิตสีทอง (งานเคลม) ', 'แก้วเนรมิตรป้ายสวย', '0935646282', '1', null, 'แก้วเนรมิตรป้ายสวย', 'ร้านเนรมิตรป้ายสวย 136/4  ม.10 ต.พังโคน อ.พังโคน จ.สกลนคร47160. โทร. 0935646282', null, '<p>ป้ายบ้านเลขที่ คอมโพสิตสีทองขนาด 60x30 cm. 1 ชิ้น</p><p>ข้อมูลงาน<br><br>136/4 นายอนนท์ ภูชะธง<br>(เลขอยู่ข้างบน / ชื่ออยู่ข้างล่าง)<span class=\"redactor-invisible-space\"></span></p>', null, '2021-05-11', '13:39:00', '3, 4', null, '2021-05-11 13:45:26', '8', 'EHtNT9tpNc1i28UkoTlfXb', '1', '0', '1', '1', '0', '1', '0', null, null, '2', '1', '0', '0', '1', null, '2021-05-12 17:18:09', '', '4', '3', null);
INSERT INTO `customer` VALUES ('50', 'ส่งซัพผลิต', 'ณัฐดีไซน์', '0654944505', '3', null, '-', '', null, '', null, '2021-05-12', '15:57:00', '3', null, '2021-05-11 15:59:15', '1', 'jGzP_OORkZdjjEm2vxpLmd', '1', '1', '0', '1', '0', '1', '1', null, null, '0', '0', '0', '2', '1', '1', '2021-05-12 18:10:20', '', '4', '2', null);
INSERT INTO `customer` VALUES ('51', 'ป้ายแผนที่ท่องเที่ยว + สแตนดี้ ', 'อ้อม วัฒนธรรม', '081-8742557', '1', null, 'อ้อม วัฒนธรรม', 'งานหน่วยงานและติดตั้ง ', null, '<p>งบวัดอัมพวัน<br>1. ป้ายแผนที่ท่องเที่ยว ข้อฒุลชุมชน ขนาดกว้าง 150 ซม. (**ออกแบบให้ด้วย**)<br>2. สแตนดี้ รูปบวน ขนาด สูงจากพื้น 160 ซม . ผังดิน 20 ซม.<br>3. ตกแต่งสถานที่ (บริเวรณในรูปที่ลูกค้าส่งมา)<br>.<br>เสนอราคาสำนักงานวัฒนธรรม</p>', null, '2021-05-14', '10:00:00', '3, 4', null, '2021-05-11 16:24:47', '8', 'd3EZeq2qOc1sfftpV5q19D', '0', '0', '1', '1', '1', '1', '0', null, null, '0', '0', '0', '0', '1', null, '2021-05-12 17:18:16', '', '5', '1', null);
INSERT INTO `customer` VALUES ('52', 'ติดตั้งงาน ', 'ศึกษาธิการ ', '0886969154', '1', null, 'กาน ศึกษาธิการ ', 'ศึกษาธิการ  0886969154 คุณกาน', null, '<p>ติดตั้งงาน </p>', null, '2021-05-12', '09:00:00', '3, 4', null, '2021-05-12 08:56:55', '8', 'fU8hZ0tJOvyyp9j-LVPCge', '0', '1', '1', '1', '1', '1', '0', null, null, '0', '0', '2', '0', '1', null, '2021-05-12 17:18:24', '', '5', '1', null);
INSERT INTO `customer` VALUES ('53', 'ติดตั้งงาน ', 'เทคโน ', '0000000000', '4', null, 'ลูกค้าพี่ณัฐ ', '-', null, '<p>เพิ่มเติมสอบถามพี่ณัฐ </p>', null, '2021-05-12', '10:00:00', '3, 4', null, '2021-05-12 08:58:26', '8', '7hyySzNtI_VR84GW8lXTdk', '0', '1', '1', '1', '1', '1', '0', null, null, '0', '0', '2', '2', '1', null, '2021-05-12 17:18:35', '', '5', '1', null);
INSERT INTO `customer` VALUES ('54', 'ติดตั้งงาน ', 'อบต.โปร่งแดง ', '0925565364', '1', null, 'พี่เจี๊ยบ อบตโป่งแดง', 'อบต.โป่งแดง', null, '<p>ติดตั้งงาน </p><p>1. โฟมบอร์ดเคาเตอร์ </p><p>2.สติ๊กเกอร์ซีทรู </p>', null, '2021-05-12', '11:00:00', '4', null, '2021-05-12 08:59:24', '8', 'hrmv4WPvcupLaEF9BnJnT0', '0', '1', '1', '1', '1', '1', '0', null, null, '0', '0', '2', '2', '1', null, '2021-05-12 17:18:43', '', '5', '1', null);
INSERT INTO `customer` VALUES ('55', 'ติดตั้งงาน ', 'พักกาย ', '0000000000', '4', null, 'ลูกค้าพี่ณัฐ ', 'พักกาย ', null, '<p>เพิ่มเติมสอบถามพี่ณัฐ </p>', null, '2021-05-12', '13:00:00', '3, 4', null, '2021-05-12 09:02:10', '8', 'CAcAJCWeZd-mKozrUigR0Q', '0', '1', '1', '1', '0', '1', '0', null, null, '0', '0', '2', '1', '1', null, '2021-05-12 17:19:33', '', '5', '1', null);
INSERT INTO `customer` VALUES ('56', 'ติดตั้งงาน ', 'ทรัคไทร์ ', '0643529952', '1', null, 'May ทรัคไทร์', 'ทรัคไทร์\r\n', null, '<p>ติดตั้งงานป้าย </p>', null, '2021-05-12', '14:00:00', '3, 4', null, '2021-05-12 09:03:12', '8', 'fucZblB3_4Zu2jE0a0Vnj9', '0', '1', '1', '1', '1', '1', '0', null, null, '0', '0', '2', '1', '1', null, '2021-05-12 17:19:48', '', '5', '1', null);
INSERT INTO `customer` VALUES ('57', 'ไวนิล', 'Chaiwat', '0934096636', '1', null, 'Chaiwat', 'รับงานหน้าร้าน ', null, '<p>ป้ายไวนิลขนาด 584x94 ซม. 1 ผืนๆละ 840.-<br>ป้ายไวนิลขนาด 200x100 ซม. 2 ผืนๆละ 320.-<br><br>ยอดชำระรวม 1,480.-<br>*ยังไม่ชำระเงิน<br><br>*พับขอบตอกไก่</p>', null, '2021-05-13', '10:00:00', '3, 4', null, '2021-05-12 10:27:59', '8', 'pXsuTV4mAr0AU6D8F36gso', '0', '0', '1', '1', '0', '1', '0', null, null, '0', '0', '0', '0', '1', null, '2021-05-12 17:19:58', '', '4', '1', null);
INSERT INTO `customer` VALUES ('58', 'ป้ายกล่องไฟ', 'สวนป่าแม่ละเมา', '08882919335', '1', null, 'สวนป่าแม่ละเมา', 'รับงานหน้าร้าน ', null, '<p>ป้ายกล่องไฟ ขนาด 120x80 ซม. พิมพ์ 2 ด้าน ราคา 11,000.-<span></span></p>', null, '2021-05-12', '14:00:00', '3, 4', null, '2021-05-12 10:58:04', '8', 'FFpCWYn5MhCGVnFFK0aK-Q', '0', '0', '1', '1', '1', '1', '0', null, null, '0', '0', '0', '0', '1', null, '2021-05-12 17:20:06', '', '3', '3', null);
INSERT INTO `customer` VALUES ('59', 'ทดสอบรับงานพร้อมโปรแกรมเมอร์', 'ทดสอบรับงานพร้อมโปรแกรมเมอร์', '', '2', null, '-', '', null, '<p>ทดสอบรับงานพร้อมโปรแกรมเมอร์</p>', null, '2021-05-12', '13:30:00', '3, 4', null, '2021-05-12 13:32:12', '1', 'hOUdPv_zaMEEKvcHnpsMx0', '1', '1', '0', '1', '1', '1', '0', null, null, '2', '2', '2', '0', '1', null, '2021-05-12 17:20:14', '', '3', '1', null);
INSERT INTO `customer` VALUES ('60', 'ไวนิลธงญี่ปุ่น', 'Keky', '0839289428', '1', null, 'Keky', 'ร้านวิชาญการเกษตร\r\nกาญจนา วงษ์ศรีแก้ว 76หมู่10 บ้านโสกผักหวาน ตำบลดู่ลาด อำเภอทรายมูล จังหวัดยโสธร 35170\r\n\r\n0839289428', null, '<p>ไวนิลธงญี่ปุ่น ขนาด 55x116 ซม. (หน้า-หลัง) 1 ชิ้นๆละ 200.-</p>', null, '2021-05-14', '14:00:00', '3, 4', null, '2021-05-12 14:04:25', '8', '64qt3ErfzChbImDohEIYRL', '1', '0', '1', '1', '0', '1', '0', null, null, '0', '0', '0', '0', '1', null, '2021-05-12 17:20:23', '', '3', '3', null);
INSERT INTO `customer` VALUES ('61', 'ทดสอบส่งงานคนเดียว', 'ทดสอบส่งงานคนเดียว', '', '1', null, 'line nat :  xxxx', 'ห้างหุ้นส่วนจำกัด ณัฐดีไซน์ แอนด์ มีเดีย\r\nเลขที่ประจำตัวผู้เสียภาษี 0633559000658\r\nที่อยู่ 285 หมู่ 9 บ้านรักษ์ร่วมใจ ต.น้ำรึม อ.เมืองตาก จ.ตาก 63000\r\nโทร. 0862149586', null, '', null, '2021-05-12', '14:21:00', '3, 4', null, '2021-05-12 14:24:31', '1', 'WET_Nb0rGmQ93JUN9lqlaq', '1', '0', '0', '1', '1', '1', '0', null, null, '2', '1', '2', '0', '1', '1', '2021-05-12 17:20:30', '', '5', '2', null);
INSERT INTO `customer` VALUES ('62', 'ทดสอบสั่งงานผ่านแทบเลท gc', 'Nat', '0862149586', '2', null, '-', '', null, '<p>สั่งงานในแทบลทchrome</p>', null, '2021-05-12', '18:33:00', '3, 4', null, '2021-05-12 18:34:44', '1', 'dpLUbWwhqiNKCkrSJPsYl-', '1', '1', '0', '2', '1', '1', '0', '3', '', '0', '0', '0', '0', '0', null, null, null, '3', '1', null);
INSERT INTO `customer` VALUES ('63', 'ทดสอบ auto refresh', 'srfgasdfg', 'sdf', '2', null, '-', '', null, '<p>ทดสอบ auto refresh</p>', null, '2021-05-12', '18:37:00', '3, 4', null, '2021-05-12 18:38:10', '1', '8_Zx2LZQiqPFUQ9TD0pywB', '1', '1', '0', '1', '1', '1', '0', null, null, '2', '2', '2', '0', '1', '1', '2021-05-12 19:39:24', '', '3', '1', null);
INSERT INTO `customer` VALUES ('64', 'ทดสอบ auto refresh app w full screen brower', 'za', '', '2', null, '-', 'ฟห', null, '<p>ทดสอบ auto refresh app w full screen brower</p>', null, '2021-05-12', '18:50:00', '3', null, '2021-05-12 18:50:46', '1', 'ETPpDvNmIFEB4j4Tgi32oj', '1', '0', '0', '1', '1', '1', '0', null, null, '2', '2', '0', '0', '1', '1', '2021-05-13 13:13:05', '', '1', '2', null);
INSERT INTO `customer` VALUES ('65', 'ทดสอบแอพใหม่', 'sdf', '', '2', null, '-', 'หกกด', null, '<p>ทดสอบแอพใหม่</p>', null, '2021-05-12', '19:34:00', '3', null, '2021-05-12 19:35:02', '1', 'cRO9HGZyoNvFVnlA-59Xt2', '1', '0', '0', '1', '1', '1', '0', null, null, '1', '1', '1', '0', '1', '1', '2021-05-13 13:13:14', '', '1', '1', null);
INSERT INTO `customer` VALUES ('66', 'ฟิวพิมพ์ยูวี', 'พี่นุช เรือนจำตาก', '0869381981', '1', null, 'พี่นุช เรือนจำตาก', 'รับงานหน้าร้าน วันนี้ 14.30 น. ', null, '<p>ฟิวพิมพ์ยูวี ขนาด 80x120 ซม. 1 ชิ้นๆละ 670.-<br>*ราคารวมภาษีมูลค่าเพิ่มแล้ว<br><br>รับ 14.00 น.</p>', null, '2021-05-13', '14:30:00', '3, 4', null, '2021-05-13 09:00:25', '8', 'QjfhOfXg181A4woB_CJZbh', '0', '0', '1', '1', '1', '1', '0', null, null, '0', '0', '0', '0', '1', null, '2021-05-13 15:15:13', '', '5', '3', null);
INSERT INTO `customer` VALUES ('67', 'ไวนิล', 'Chaiwat', '0621730834​', '1', null, 'Chaiwat', 'รับงานหน้าร้าน ', null, '<p>เพิ่มงาน<br>ไวนิล ขนาด 100x50 ซม. 1 ผืนๆละ 80.-<br><br>ข้อความ ที่นี่เร็วๆนี้</p>', null, '2021-05-14', '11:00:00', '3, 4', null, '2021-05-13 11:46:23', '8', 'Bfx-3DB0DnffvI4hi8s4Dd', '0', '0', '1', '1', '0', '1', '0', null, null, '2', '0', '1', '0', '1', null, '2021-05-14 15:16:45', '', '3', '1', null);
INSERT INTO `customer` VALUES ('68', 'ไวนิลและอื่นๆ ', 'จ๊ะจ๋า', '0000000000', '3', null, '-', 'ลูกค้าพี่ณัฐ ', null, '<p>ลูกค้าพี่ณัฐ </p>', null, '2021-05-13', '17:00:00', '3, 4', null, '2021-05-13 13:09:25', '8', 'R0s6646_Wy1RQU0tH3feJI', '0', '0', '1', '1', '1', '1', '0', null, null, '1', '0', '0', '0', '1', null, '2021-05-14 15:17:04', '', '5', '1', null);
INSERT INTO `customer` VALUES ('69', 'พลาสวูดพิมพ์ยูวี ', 'ยูเท็กซ์ไทล์ (ลูกค้าพี่ณัฐ)', '0000000000', '3', null, '-', 'ลูกค้าพี่ณัฐ ', null, '<p>ลูกค้าพี่ณัฐ </p>', null, '2021-05-13', '13:10:00', '3, 4', null, '2021-05-13 13:11:49', '8', '29jO6OBZ-DcyKJAPbAkR-D', '1', '0', '1', '1', '1', '1', '0', null, null, '2', '0', '0', '0', '1', null, '2021-05-14 15:17:22', '', '4', '1', null);
INSERT INTO `customer` VALUES ('70', '​คอมโพสิตทองพิมพ์ยูวี ', 'บริษัท ลอยัลแพค จำกัด (สำนักงานใหญ่)', '0000000000', '4', null, 'ลูกค้าพี่ณัฐ ', 'บริษัท ลอยัลแพค จำกัด (สำนักงานใหญ่)\r\n120 ซอยเสรีไทย 58 ถนนเสรีไทย แขวงมีนบุรี เขตมีนบุรี กรุงเทพมหานคร 10510', null, '<p>คอมโพสิตทอง พิมพ์ยูวี 1 ชิ้น <br><br>*ลูกค้าพี่ณัฐ <br><br></p>', null, '2021-05-14', '14:00:00', '3, 4', null, '2021-05-13 16:44:52', '8', 'G8sXWOx_pijFawJSiWCj_3', '1', '0', '1', '1', '1', '1', '0', null, null, '0', '0', '0', '0', '1', null, '2021-05-14 15:17:37', '', '5', '1', null);
INSERT INTO `customer` VALUES ('71', 'พลาสวูดตัดตัวอักษร', 'ตาล', '0000000000', '1', null, 'ตาล', 'ติดตั้งงาน', null, '<p>พลาสวูดตัดตัวอักษร พร้อมติดตั้ง 3,500.-<br><br>ข้อความ<br><br>เพลินพานิช<br>จำหน่าย เบียร์วุ้น เหล้า บุหรี่ เครื่องดื่มอื่นๆ<br>ราคา ปลีก-ส่ง</p><p><br></p>', null, '2021-05-15', '16:51:00', '3, 4', null, '2021-05-13 16:54:48', '8', 'TVdH76RDCnBbBTqcwtkBsH', '0', '1', '1', '1', '0', '1', '0', null, null, '0', '0', '0', '0', '1', null, '2021-05-14 15:18:02', '', '5', '1', null);
INSERT INTO `customer` VALUES ('72', 'ฉากกั้นอะคริลิค', 'เทรดิชั่น โบรคเกอร์ส', '0000000000', '4', null, 'ลูกค้าพี่ณัฐ ', 'บริษัท เทรดิชั่น โบรคเกอร์ส (ประเทศไทย) จำกัด\r\n191/79 อาคารซีทีโฮ ทาวเวอร์ ชั้น12 \r\nถนนรัชดาภิเษกตัดใหม่ แขวงคลองเตย \r\nเขตคลองเตย กรุงเทพฯ 10110\r\n\r\nเลขประจำตัวผู้เสียภาษี 0105554047431 \r\nสำนักงานใหญ่ ', null, '<p>ฉากกั้น V 5 = 9 ชุด</p>', null, '2021-05-14', '14:00:00', '3, 4', null, '2021-05-14 08:38:01', '8', 'r9qfUVpdCecyGahZ972F0E', '1', '0', '1', '1', '1', '1', '0', null, null, '0', '0', '0', '0', '1', null, '2021-05-14 15:18:15', '', '4', '1', null);
INSERT INTO `customer` VALUES ('73', 'ไวนิล', 'M', '055-587112', '1', null, 'M', 'องค์การบริหารส่วนตำบลแม่สลิด\r\nที่อยู่ ตำบลแม่สลิด อำเภอบ้านตาก จังหวัดตาก\r\nโทรศัพท์ 055-587112', null, '<p><span style=\"background-color: rgb(192, 80, 77);\"></span>ไวนิลขนาด 250x120 ซม. 1 ผืนๆละ 480.-<br>พับขอบเจาะตาไก่<br><br><em><strong><span><span style=\"background-color: rgb(247, 150, 70);\"></span>*ลูกค้ารับงานหน้าร้านวันจันทร์ 17/05/64</span></strong><br></em><br>*ใบส่งของ ยังไม่ต้องลงวันที่<br>แนบเอกสารตอนส่ง<br>1.ใบทะเบียนพาณิชย์<br>2.สำเนาบัตรประชาชนเจ้าข้องร้าน <br>3.หนังสือรับรองการขึ้นทะเบียนผู้ประกอบการ SME</p>', null, '2021-05-15', '17:00:00', '3, 4', null, '2021-05-14 10:31:42', '8', 'lsLUi5-eonboPFpOQUTsmY', '0', '0', '1', '1', '1', '1', '0', null, null, '0', '0', '0', '0', '1', null, '2021-05-14 15:18:48', '', '3', '1', null);
INSERT INTO `customer` VALUES ('74', 'ธงญี่ปุ่นพิมพ์ 2 ด้าน', 'T o e y', '0970257297', '1', null, 'T o e y', 'รับงานหน้าร้าน ', null, '<p>ธงญี่ปุ่นพิมพ์ 2 ด้าน ขนาด 50x150 ซม. 1 ผืนๆละ 300.-<br><br>แก้ไขงาน<br>* สาขาตาก<br>* เบอร์โทร (รอลูกค้าแจ้ง) <br>* แบบในเน็ตลูกค้าไม่มีไฟล์งาน (บริษัท ZTO EXPRASS)</p>', null, '2021-05-14', '16:30:00', '3, 4', null, '2021-05-14 11:40:20', '8', 'Rnvn3RJB8g2hBgiIsUQSJI', '0', '0', '1', '1', '0', '1', '0', null, null, '1', '0', '1', '0', '1', null, '2021-05-14 15:19:08', '', '2', '3', null);
INSERT INTO `customer` VALUES ('75', 'พิมพ์สติ๊กเกอร์PP', 'เมธา SKF เอสเค', '0955915142', '1', null, 'เมธา SKF เอสเค', 'รับงานหน้าร้าน ', null, '<p>พิมพ์สติ๊กเกอร์PP 2 แผ่นๆละ 80.-</p><p>- คิวอาโค้ท 5 ชิ้น = 1 แผ่น<br>- เบอร์ 5 ชิ้น = 1 แผ่น</p>', null, '2021-05-14', '17:00:00', '3, 4', null, '2021-05-14 11:44:20', '8', '8nYloAlOIVHu6Rhi9MtZN1', '0', '0', '1', '1', '0', '1', '0', null, null, '0', '0', '2', '0', '1', '8', '2021-05-15 14:11:13', '', '5', '1', null);
INSERT INTO `customer` VALUES ('76', 'อะคริลิคดำพิมพ์ยูวี ', 'บังคับคดี', '0000000000', '4', null, 'ลูกค้าพี่ณัฐ ', '-', null, '<p>งานลูกค้าพี่ณัฐ </p>', null, '2021-05-14', '11:48:00', '3, 4', null, '2021-05-14 11:51:27', '8', 'ZJefNzuDnS-HvShoWa7gUZ', '0', '0', '1', '1', '0', '1', '0', null, null, '2', '1', '0', '0', '1', null, '2021-05-19 08:39:46', '', '5', '1', null);
INSERT INTO `customer` VALUES ('77', 'อะคริลิคพิมพ์ยูวี', 'เคลมงานการไฟฟ้า ', '0861851903', '1', null, 'Don Aladin50', 'รับงานหน้าร้าน ', null, '<p>งานเคลม </p>', null, '2021-05-15', '16:30:00', '3, 4', null, '2021-05-14 13:46:26', '8', 'NMU8hYni2hQJzcGWzEnwYe', '0', '0', '1', '1', '0', '1', '0', null, null, '0', '0', '0', '0', '1', null, '2021-05-14 15:20:01', '', '2', '3', null);
INSERT INTO `customer` VALUES ('78', 'ทดสอบเวลาแท็บเล็ทใหม่', 'ณัฐ', '0862149586', '2', null, '-', '', null, '<p>ทดสอบการแสดงผลในแท็บเล็ตใหม่</p>', null, '2021-05-14', '16:12:00', '3, 4', null, '2021-05-14 16:13:46', '1', '6fB4CAg1KJL5Ald2p5xlJC', '1', '1', '0', '1', '1', '1', '0', null, null, '2', '0', '0', '0', '1', null, '2021-05-15 14:10:29', '', '5', '3', null);
INSERT INTO `customer` VALUES ('79', 'บล็อกพ่นสี', 'Tae ', '0634216566', '1', null, 'Tae ', 'ธีรวัฒน์ จตุอุทัยศรี 0634216566\r\n23/77 ม.7 ต.จันทนิมิต อ.เมือง จ.จันทบุรี 22000', null, '<p>บล็อกพ่นสีขนาด 30x8.5 ซม. (เป็นพื้นที่พ่นสี) 1 ชิ้นๆละ 250.- รวมจัดส่ง<br>ข้อความว่า TRJ</p>', null, '2021-05-17', '14:30:00', '3, 4', null, '2021-05-14 16:19:18', '8', '9uku3p4nk2HhVJkGP-6oOo', '1', '0', '0', '1', '1', '1', '0', null, null, '0', '1', '2', '0', '1', null, '2021-05-15 14:09:51', '', '3', '3', null);
INSERT INTO `customer` VALUES ('80', 'ทดสอบเวลา 2', 'ณัฐ2', '565465', '2', null, '-', '', null, '', null, '2021-05-14', '16:20:00', '3', null, '2021-05-14 16:21:12', '1', '1ePJlxC9Iy1cvLIJvG6kav', '1', '0', '0', '1', '1', '1', '0', null, null, '2', '0', '0', '0', '1', null, '2021-05-15 14:10:34', '', '1', '2', null);
INSERT INTO `customer` VALUES ('81', 'พิมพ์สติ๊กเกอร์PP', 'เคลมงาน เมธา SKF เอสเค', '0955915142', '1', null, 'เมธา SKF เอสเค', 'รับงานหน้าร้าน ', null, '<p>พิมพ์สติ๊กเกอร์PP แผ่นละ 80.-</p><p>- คิวอาโค้ท 5 ชิ้น เบอร์ 5 ชิ้นรวมกัน 1 แผ่น</p>', null, '2021-05-15', '13:00:00', '3, 4', null, '2021-05-14 17:17:59', '8', 'd2cddmWbQ5q52QXxRCq3e-', '0', '0', '0', '1', '0', '1', '0', null, null, '0', '0', '2', '0', '1', null, '2021-05-15 14:10:58', '', '3', '3', null);
INSERT INTO `customer` VALUES ('82', 'บล็อคพ่นสี', 'yai', '0851003160', '1', null, 'yai', '**** จัดส่งในนาม ****\r\n\r\nร้านทำทุกอย่างดอทคอม  \r\nK เข้ม 0851003160\r\n\r\nผู้รับ\r\nนายไกรวิชญ์ เบ้าธรรม\r\n157 ม.2 บ.หนองตูม\r\nต.ผาสามยอด อ.เอราวัณ จ.เลย 42220\r\n093-1057924\r\n', null, '<p>บล็อคพ่นสีขนาด 30x28 ซม. 1 ชิ้นๆละ 340.- รวมจัดส่ค่ะ</p>', null, '2021-05-15', '11:00:00', '3, 4', null, '2021-05-15 09:30:40', '8', '6NvGa1WfdZon2FTKOANHYI', '1', '0', '0', '1', '1', '1', '0', null, null, '0', '0', '0', '0', '1', null, '2021-05-15 14:09:34', '', '3', '3', null);
INSERT INTO `customer` VALUES ('83', 'สติ๊กเกอร์ไดคัท', 'เก-ตุ-วะ-ดี', '0813791627', '1', null, 'เก-ตุ-วะ-ดี', 'รับงานหน้าร้านเย็นนี้ 16.00 น . ', null, '<p>สติ๊กเกอร์ไดคัท ขนาด 3 ซม. จำนวน 1 แผ่น ยอดชำระ 80.-</p>', null, '2021-05-15', '16:00:00', '3, 4', null, '2021-05-15 10:20:14', '8', 'SwHKFAotfowJHYH20O2iDH', '0', '0', '1', '1', '0', '1', '0', null, null, '0', '0', '0', '0', '1', null, '2021-05-15 14:11:43', '', '5', '1', null);
INSERT INTO `customer` VALUES ('84', 'พลาสวูดพิมพ์ยูวี ', 'ชลประทาน', '0857323449', '1', null, 'ชลประทาน', 'ติดตั้งงาน ', null, '<p>พลาสวูด 3 มิล พิมพ์ยูวีสีส้ม พร้อมติดตั้ง จำนวน 1 ชุดๆละ 2,300.-<br>*รบกวนชำระเงินสดค่ะ</p>', null, '2021-05-19', '10:26:00', '3, 4', null, '2021-05-15 10:28:11', '8', 'bJQg87V6EFNI-IYOZZXBsJ', '0', '1', '1', '1', '0', '1', '0', null, null, '2', '1', '0', '0', '1', null, '2021-05-19 08:40:02', '', '3', '1', null);
INSERT INTO `customer` VALUES ('85', 'ฟิวพิมพ์ยูวี + ด้ามพลาสวูด', 'kumnunyao', '0000000000', '1', null, 'ลูกค้าพี่ณัฐ ', 'รับงานวันนี้ ', null, '<p>ฟิวพิมพ์ยูวี 40 ซม. + ด้ามพลาสวูด จำนวน 10 ป้าย </p><p><br></p>', null, '2021-05-15', '14:14:00', '3, 4', null, '2021-05-15 14:16:18', '8', 'pdci6GgdMe4wBztYRnGZsv', '0', '0', '1', '0', '0', '1', '0', null, null, '2', '0', '2', '0', '0', null, null, null, '5', '1', null);
INSERT INTO `customer` VALUES ('86', 'ไวนิล', 'เคลมงาน BURITWUTTHIKON', '0890481377', '1', null, ' BURITWUTTHIKON', 'จัดส่งปณ.\r\nโรงพยาบาลส่งเสริมสุขภาพตำบลแม่สอง\r\n567 ม.2 ต.แม่สอง อ.ท่าสองยาง จ.ตาก 63150\r\nโทร. 0890481377', null, '<p>ป้ายไวนิลรณรงค์ขนาด 300x150 ซม. (แนวนอน) 5 ชิ้น</p>', null, '2021-05-17', '10:30:00', '3, 4', null, '2021-05-15 14:37:43', '8', 'X-H0wokcbyYMpPWupr--Ae', '1', '0', '0', '1', '0', '1', '0', null, null, '0', '0', '0', '0', '1', null, '2021-05-18 09:01:37', '', '3', '3', null);
INSERT INTO `customer` VALUES ('87', 'นิทรรศการกาดต้าตง', 'พี่หนุ่ยวัฒนธรรม', '0818742571', '1', null, 'ลูกค้าพี่ณัฐ ', '', null, '<p>นิทรรศการกาดต้าตง </p><p>*ข้อมูลเพิ่มเติมสอบถามพี่ณัฐ</p>', null, '2021-05-17', '10:30:00', '3, 4', null, '2021-05-15 15:24:37', '8', 'c3eU7ywfowEQmyw0IjMhaQ', '0', '1', '1', '1', '1', '1', '0', null, null, '0', '0', '0', '0', '1', null, '2021-05-18 09:01:57', '', '4', '1', null);
INSERT INTO `customer` VALUES ('88', 'ป้ายชื่อไม้ตั้งโต๊ะ ', 'sasilove', '0000000000', '1', null, 'sasilove', 'รอลูกค้าแจ้ง ', null, '<p>ป้ายชื่อไม้ตั้งโต๊ะ 1,200.-</p><p>ค่าจัดส่ง 100.-</p><p>รวมยอดชำระ 1,300.-</p><p><a fragment=\"16765221cf1\" href=\"https://chat.line.biz/Uf09f66ebd2022fc14d87c675b86a0fd2/chat/Ufc40f54f52ac21052ab78f936cf32f2e#\" class=\"text-info mr-2\"></a></p><h5><span class=\"text-muted ml-1\"></span></h5><p><a fragment=\"2ad4b7975c\" href=\"https://chat.line.biz/Uf09f66ebd2022fc14d87c675b86a0fd2/chat/Ufc40f54f52ac21052ab78f936cf32f2e#\"></a></p><p>ป้ายชื่อตั้งโต๊ะ 1 ชิ้น<br>สุจิตรา ลุนาวัน<br>ผู้อำนวยการโรงเรียนบ้านโนนไทย</p>', null, '2021-05-15', '16:55:00', '4', null, '2021-05-15 16:59:25', '8', 'K4aHqribfirH195o76wdkU', '1', '0', '0', '1', '1', '1', '0', null, null, '0', '0', '0', '0', '1', null, '2021-05-18 09:02:14', '', '3', '3', null);
INSERT INTO `customer` VALUES ('89', 'ป้ายชื่อต้นไม้ ', 'ลูกค้าพี่ณัฐ', '0000000000', '4', null, 'ลูกค้าพี่ณัฐ ', 'สอบถามพี่ณัฐ ', null, '<p>ป้ายชื่อต้นไม้ 2 ชิ้น + ขาเสาเหล็ก </p><p>*เพิ่มเติมสอบถามพี่ณัฐค่ะ </p>', null, '2021-05-17', '08:42:00', '3, 4', null, '2021-05-17 08:44:31', '8', 'UauniDVW1pUZeShneZdjjz', '1', '0', '1', '1', '0', '1', '0', null, null, '0', '0', '0', '0', '1', null, '2021-05-19 08:42:57', '', '5', '1', null);
INSERT INTO `customer` VALUES ('90', 'อะคริลิคใส 5 มิล ', 'ช่างไนท์ (ลูกค้าพี่ณัฐ) ', '0920374992', '4', null, 'ลูกค้าพี่ณัฐ ', 'จัดส่งรถแดงไปลงที่ บขส.กำแพงเพชร ', null, '<p>อะคริลิคใส 5 มิล *เพิ่มเติมสอบถามพี่ณัฐค่ะ </p>', null, '2021-05-17', '10:00:00', '3, 4', null, '2021-05-17 08:46:44', '8', 'PC16PlJVg_7Xd5YmGGg0mi', '1', '0', '1', '1', '0', '1', '0', null, null, '0', '0', '0', '0', '1', null, '2021-05-18 09:02:41', '', '5', '1', null);
INSERT INTO `customer` VALUES ('91', 'พลาสวูดขาวทำสีดำ พร้อมติดตั้ง ', 'Arm ชุติมา', '088-2934329', '1', null, 'Arm ชุติมา', 'งานติดตั้งที่โกดังชุติมา สามแยกแม่สอด ', null, '<p>พลาสวูดขาว 20 มิล ทำสีดำ 9,842.-<br>-- ค่าติดตั้งตัวอักษรเหมารวม 3,500.-</p>', null, '2021-05-22', '09:30:00', '3, 4', null, '2021-05-17 10:02:57', '8', 'MZj6PndvG7ZpAROePYv3hw', '0', '1', '1', '0', '1', '1', '0', null, null, '0', '0', '0', '0', '0', null, null, null, '3', '1', null);
INSERT INTO `customer` VALUES ('92', 'ที่ทำการกลุ่มออมทรัพย์เพื่อการผลิตบ้านลานยาง', 'ไอติม พช เมืองตาก', '0895607026', '1', null, 'ไอติม พช เมืองตาก', 'ที่ทำการอำเภอเมืองตาก\r\nส่วนงาน : พัฒนาชุมชนอำเภอเมืองตาก ', null, '<p>1. ป้ายที่ทำการฯ<br>อะคริลิคน้ำเงินพิมพ์ยูวีตัวอักษรขาว ขนาด 60X30 ซม.<br><br>ที่ทำการกลุ่มออมทรัพย์เพื่อการผลิตบ้านลานยาง<br>หมู่ที่ 10 ตำบลวังประจบ อำเภอเมืองตาก จังหวัดตาก<br><br>สนับสนุนโดย สำนักงานพัฒนาชุมชนอำเภอเมืองตาก<br><br>ใส่โลโก้ พช กับโลโก้กลุ่มออมทรัพย์จ้า</p><p>-----------------------</p><p>2. ป้ายไวนิลโครงการ 300X100 ซม. จำนวน 1 ป้าย<br>พับขอบตอกตาไก่<br><br>โครงการพัฒนาศักยภาพกลุ่มออมทรัพย์เพื่อการผลิตสู่มาตรฐาน SMART Saving Group<br>วันที่ 25 พฤษภาคม 2564<br>ณ บ้านลานยาง หมู่ที่ 10 ตำบลวังประจบ อำเภอเมืองตาก จังหวัดตาก<span class=\"redactor-invisible-space\"></span></p><p>ใส่โลโก้ พช กับโลโก้กลุ่มออมทรัพย์จ้า<span class=\"redactor-invisible-space\"></span></p><p>-------------------------------------</p><p>3. ป้ายไวนิลโครงการสัมมาชีพชุมชน จำนวน 2 ป้าย</p><p>ป้ายไวนิลพับขอบตอกตาไก่ <br><br>1.บ้านสันติสุข หมู่ที่ 8 ตำบลน้ำรึม อำเภอเมืองตาก จังหวัดตาก<br>2.บ้านลานสาง หมู่ที่ี 11 ตำบลแม่ท้อ อำเภอเมืองตาก จังหวัดตาก</p><p>------------------------------------</p>', null, '2021-05-17', '15:00:00', '3, 4', null, '2021-05-17 10:42:20', '8', 'CPzscmmVggSVGf8cyBCB0N', '0', '0', '1', '1', '1', '1', '0', null, null, '2', '0', '0', '0', '1', null, '2021-05-19 08:43:19', '', '2', '1', null);
INSERT INTO `customer` VALUES ('93', 'นามบัตร ', 'บังเอิญ ', '0932654498', '1', null, 'บังเอิญ ', 'บังเอิญ ', null, '<p>งานนามบัตร 200 ใบๆละ 3.50.- = 700.-<br>- ห้างหุ้นส่วนจำกัด 100 ใบ<br>- ใบเสียภาษี 100 ใบ<br><br>ค่าจัดส่ง 100.-<br><br>-------------- ยอดชำระทั้งสิ้น 800 บาทค่ะ -----------------</p>', null, '2021-05-31', '11:00:00', '3, 4', null, '2021-05-17 11:36:29', '8', 'NwLzGmWHZCNiBoHvWJ_JVY', '1', '0', '0', '1', '0', '1', '1', null, null, '0', '0', '0', '0', '1', null, '2021-05-18 11:38:51', '', '4', '3', null);
INSERT INTO `customer` VALUES ('94', 'อักษรพลาสวูดติดอะคริลิค', 'โต้งดีไซน์', '0000000000', '4', null, 'ลูกค้าพี่ณัฐ ', '-', null, '<p>อักษรพลาสวูดติดอะคริลิค : โต้งดีไซน์</p>', null, '2021-05-17', '13:52:00', '3, 4', null, '2021-05-17 13:53:29', '8', 'rvm9thaM0Tz5d_Npq8IjB5', '0', '0', '1', '1', '0', '1', '0', null, null, '0', '0', '0', '0', '1', null, '2021-05-19 08:43:41', '', '3', '1', null);
INSERT INTO `customer` VALUES ('95', 'ไวนิลพร้อมโครงเหล็ก', 'Myname Beer', '0000000000', '4', null, 'ลูกค้าพี่ณัฐ ', 'ติดตั้งงานวัดไผ่ล้อม', null, '<p>ป้ายไวนิลพร้อมโครงเหล็ก ขนาด 600x120 cm. 4,320.-</p>', null, '2021-05-17', '09:30:00', '3, 4', null, '2021-05-17 15:03:19', '8', 'YUWuIUIZ-FXoTHzsyEsSsg', '0', '1', '1', '1', '0', '1', '0', null, null, '2', '0', '0', '0', '1', null, '2021-05-19 08:41:02', '', '4', '1', null);
INSERT INTO `customer` VALUES ('96', 'ออกแบบ (พี่ณัฐ)', 'พี่เจี๊ยบ สสจ.ตาก', '0000000000', '4', null, 'ลูกค้าพี่ณัฐ ', '-', null, '<p>* เพิ่มเติมสอบถามพี่ณัฐค่ะ </p>', null, '2021-05-19', '09:00:00', '3, 4', null, '2021-05-17 16:00:54', '8', 'CmvKcG5eHTn7HD4IIoeoMh', '0', '0', '0', '1', '0', '1', '0', null, null, '0', '0', '0', '0', '1', null, '2021-05-19 08:41:23', '', '3', '1', null);
INSERT INTO `customer` VALUES ('97', 'โล่ห์รางวัล 2 ชิ้น', 'หัสต์กมล พช.จว.ตาก', '0953060945 พี่ีน้อง', '1', null, 'หัสต์กมล พช.จว.ตาก', 'สำนักงานพัฒนาชุมชนจังหวัดตาก (พี่น้อง)\r\nศาลากลางจังหวัดตาก ชั้น 2', null, '<p>โลห์รางวัล 2 ชิ้น </p><p>รายละเอียดข้อความ รบกวนดูที่ไลน์ลูกค้าค่ะ</p><p><br></p>', null, '2021-05-21', '09:00:00', '3, 4', null, '2021-05-18 08:45:17', '8', 'sE4Bo7KJAI-VymDWuR5SoJ', '0', '0', '1', '1', '0', '1', '0', null, null, '0', '0', '0', '0', '1', null, '2021-05-19 08:41:42', '', '4', '1', null);
INSERT INTO `customer` VALUES ('98', 'ติดตั้งงาน ', 'Yu ยู้แอนด์ยู คลินิก', '0000000000', '1', null, 'Yu ยู้แอนด์ยู คลินิก', '-', null, '<p>ติดตั้งงาน </p>', null, '2021-05-18', '09:26:00', '3, 4', null, '2021-05-18 09:32:44', '8', '3qfWzNL0gNGXQjOCaR6YTi', '0', '1', '1', '0', '0', '1', '0', null, null, '2', '0', '0', '0', '0', null, null, null, '5', '1', null);
INSERT INTO `customer` VALUES ('99', 'สติ๊กเกอร์ไดคัท ', 'ANNA', '094-4975513', '1', null, 'ANNA', 'คุณลลิตา สอนสะอาด\r\n1719 ซอยลาดกระบัง 13/2 ถนนลาดกระบัง\r\nแขวงลาดกระบัง เขตลาดกระบัง จังหวัดกรุงเทพ10520\r\nโทร. 094-4975513', null, '<p>สติ๊กเกอร์ไดคัท ขนาด 35x67 ซม. 2ชิ้นๆละ 170.-<br>จัดส่งฟรี<br><br><br>-------------- ยอดชำระทั้งสิ้น 340 บาทค่ะ -----------------</p>', null, '2021-05-21', '10:30:00', '3, 4', null, '2021-05-18 11:51:05', '8', 'BWTbhpypiSF6YctPzCo1OC', '1', '0', '0', '1', '0', '1', '0', null, null, '0', '0', '0', '0', '1', null, '2021-05-19 10:05:49', '', '3', '3', null);
INSERT INTO `customer` VALUES ('100', 'ภาพพิมพ์ยูวี', 'FON Kunna', '0000000000', '3', null, '-', '-', null, '<p>ภาพพิมพ์ยูวี ขนาด 80x60 ซม. 2 ชิ้นๆละ 850 ลด 10 % เหลือ 765*2 = 1,530.-</p>', null, '2021-05-19', '10:00:00', '3, 4', null, '2021-05-18 13:47:23', '8', 'w1lMYIjg7gsJNtxW24Usm-', '0', '0', '1', '1', '0', '1', '0', null, null, '0', '0', '0', '0', '1', null, '2021-05-19 08:35:09', '', '5', '1', null);
INSERT INTO `customer` VALUES ('101', '​แผนผังองค์กรพลาสวูดพิมพ์ยูวี', 'KORFAI', ' 0815622242  ', '1', null, 'KORFAI', 'คุณณพิชญา หนูเกื้อ (กอฝ้าย) 0815622242  ที่อยู่ 69/2 หมู่ที่ 12 ต.บางปลา อ.บางพลี จ.สมุทรปราการ 10540', null, '<p>แผนผังองค์กร<br>พลาสวูดพิมพ์ยูวี ขนาด 120x60 ซม. พร้อมกรอบอะคิลิค 29 ท่าน<br><br>จำนวน 1 ชุดๆละ 3,200.-<br><br>ค่าขนส่ง 400.-</p>', null, '2021-05-20', '10:30:00', '3, 4', null, '2021-05-18 14:27:54', '8', 'xNHFTf7NDm1W2Et-Vjss19', '1', '0', '0', '1', '1', '1', '0', null, null, '0', '0', '0', '0', '1', null, '2021-05-19 08:42:24', '', '3', '3', null);
INSERT INTO `customer` VALUES ('102', 'นามบัตร ', 'PyMMy456', '096-262-6654', '1', null, 'PyMMy456', 'คุณพิมพ์รำไพ พันธุ์จิรพัฒน์\r\n14/15 ม.2 ต.บางกระเบา\r\nอ.นครชัยศรี จ.นครปฐม\r\n73120\r\n\r\nโทร 096-262-6654', null, '<p>นามบัตร 200 ใบ 1 ด้าน ใบละ 2.-<br>ค่าจัดส่ง 80.-<br><br>-------------- ยอดชำระทั้งสิ้น 480 บาทค่ะ -----------------<br></p>', null, '2021-05-18', '10:30:00', '3, 4', null, '2021-05-18 16:16:56', '8', 'Zi7JvolZ3MkKlhUMSa6EbW', '1', '0', '0', '1', '1', '1', '0', null, null, '0', '0', '0', '0', '1', null, '2021-05-19 10:06:12', '', '3', '3', null);
INSERT INTO `customer` VALUES ('103', 'ฉากกั้นอะคริลิค', 'Gee Waraphant', '0841152224', '1', null, 'Gee Waraphant', 'วราพันธ์ ดวงคำ\r\nบริษัท ที.เอ.ที ประเทศไทย จำกัด    \r\n        85 ถนน บางบอน 5 แขวง บางบอนเหนือ เขตบางบอน\r\n         จ. กรุงเทพมหานคร 10150\r\n        โทร 02-892-5950-8\r\nหรือเบอร์ 0841152224', null, '<p>ฉากกั้น<br>152x60 : 1 ชิ้น<br>71x60 : 1 ชิ้น<br>150x60 : 2 ชิ้น</p>', null, '2021-05-25', '08:48:00', '3, 4', null, '2021-05-19 08:50:10', '8', '1aqIWI1ypdhbJz1BHYOvP6', '1', '0', '0', '1', '1', '1', '0', null, null, '0', '1', '1', '0', '1', null, '2021-05-19 13:54:23', '', '3', '1', null);
INSERT INTO `customer` VALUES ('104', 'ตัด​แผ่นพลาสวูด', 'Kittanu', '0818993297', '1', null, 'Kittanu', 'กฤตนุ ศุภสามเสน\r\n858/36\r\nCondo Notting Hill Jatujak\r\nซอยพหลโยธิน 18\r\nแขวงจอมพล เขตจตุจักร\r\nกรุงเทพฯ 10900\r\nโทร 0818993297', null, '<p>แผ่นพลาสวูด 3mm ขนาด 30×40cm 1 ชิ้นๆละ 150.-<br>ค่าจัดส่ง 80.-<br><br>ยอดชำระรวม 230.-</p>', null, '2021-05-19', '13:00:00', '3, 4', null, '2021-05-19 09:27:07', '8', 'rpcABKqsHGmiTPpt1Zwrh4', '1', '0', '0', '1', '0', '1', '0', null, null, '0', '0', '0', '0', '1', null, '2021-05-19 10:19:51', '', '3', '3', null);
INSERT INTO `customer` VALUES ('105', 'ภาพพิมพ์ยูวี', 'อภิชา', '0849748780', '1', null, 'อภิชา', 'จัดส่งปณ.\r\n\r\nผู้รับ อภิชา ทิฐธรรมงามดี\r\nที่อยู่ รอจ่ายไปรษณีย์สาขามหาวิทยาลัยเชียงใหม่ 50200 เบอร์0849748780', null, '<p>ภาพพลาสวูดพิมพ์ยูวี ขนาด 30x40 ซม. 1 ชิ้นๆละ 390.- โปรจัดส่งฟรี<br>ใส่เพลง ขอจันทร์ <iframe width=\"500\" height=\"281\" src=\"//www.youtube.com/embed/OYrR2lSdFOM\" frameborder=\"0\" allowfullscreen=\"\"></iframe><br><br>-------------- ยอดชำระทั้งสิ้น 390 บาทค่ะ -----------------<br></p>', null, '2021-05-19', '10:00:00', '3, 4', null, '2021-05-19 10:20:30', '8', '5TjzbuWalTuAJcTsc1dubh', '1', '0', '1', '1', '0', '1', '0', null, null, '1', '0', '1', '0', '1', null, '2021-05-19 13:48:18', '', '5', '3', null);
INSERT INTO `customer` VALUES ('106', 'ตรายางธรรมดา ', 'ผู้กองแอ๊ค รพ.ค่าย', '', '1', null, 'ผู้กองแอ๊ค รพ.ค่าย', 'รับหน้าร้าน ', null, '<p>ตรายางธรรมดาไม่ต้องหมึกในตัว 2 ชิ้น (คนละแบบ)<br>ขนาดอักษร TH Sarabun PSK ขนาด 16 ไม่มีกรอบ</p>', null, '2021-05-19', '10:32:00', '3, 4', null, '2021-05-19 10:33:01', '8', 'tS0XNs30MdcLuxutSWM4G0', '0', '0', '1', '1', '0', '1', '0', null, null, '0', '0', '0', '0', '1', null, '2021-05-20 08:46:21', '', '5', '1', null);
INSERT INTO `customer` VALUES ('107', 'ไวนิล', 'PEKKIIZ\' พช.เมืองตาก', '', '1', null, 'PEKKIIZ\' พช.เมืองตาก', 'รับงานหน้าร้าน 25/05/64', null, '<p>ไวนิลขนาด 300x100 ซม. 1 ชิ้นๆละ 450.-<br><br>ชื่อโครงการ<br>โครงการส่งเสริมและพัฒนาหมู่บ้านกองทุนแม่ของแผ่นดิน<br>กิจกรรมย่อยที่ 1 ประชุมเชิงปฏิบัติการคณะกรรมการหมู่บ้านต้นกล้ากองทุนแม่ของแผ่นดิน<br><br>ศาลาเอนกประสงค์บ้านหนองเสือ หมู่ 8 ตำบลวังประจบ อำเภอเมืองตาก จังหวัดตาก<br><br>- โลโก้ พช.<br>- โลโก้กองทุนแม่ของแผ่นดิน</p>', null, '2021-05-25', '10:00:00', '3, 4', null, '2021-05-19 14:11:22', '8', 'o-ySwjoOAuPPCkM5vP0HwB', '0', '0', '0', '0', '1', '1', '0', null, null, '0', '0', '0', '0', '0', null, null, null, '3', '1', null);
INSERT INTO `customer` VALUES ('108', 'ป้ายไวนิล : คณะกรรมการพัฒนาสตรีตำบลตลุกกลางทุ่ง', 'พี่อ้อย พช.เมืองตาก', '0658717924', '1', null, 'พี่อ้อย พช.เมืองตาก', 'ที่ทำการอำเภอเมืองตาก\r\nห้อง : สำนักงานพัฒนาชุนชนอำเภอเมืองตาก (ติดต่อพี่อ้อย)', null, '<p>ป้ายไวนิล พับขอบตอกตาไก่ ขนาด 300X100 ซม. จำนวน 1 ผืน </p><p>โครงการประชุมเชิงปฏิบัติการพัฒนาศักยภาพสตรีตำบลตลุกกลางทุ่งและยกระดับอาชีพผลิตภัณฑ์ จักสานจากไม้ไผ่ในรูปแบบใหม่</p><p>อ้างอิงใบเสนอราคา  QT2021050091 <span class=\"redactor-invisible-space\"></span><br></p>', null, '2021-05-21', '13:00:00', '3, 4', null, '2021-05-19 14:19:05', '8', '5ldsZsOZWHoCYCyWUmNZbZ', '0', '0', '1', '0', '1', '1', '0', null, null, '0', '0', '0', '0', '0', null, null, null, '3', '1', null);
INSERT INTO `customer` VALUES ('109', 'ไวนิล', 'พี่อ้อย พช.เมืองตาก', '0658717924', '1', null, 'พี่อ้อย พช.เมืองตาก', 'รับงานหน้าร้านค่ะ ', null, '<p>ไวนิลโครงการ 300x100 ซม.1ชิ้นๆละ 450.-<br>โครงการสตรี<br>โครงการประชุมเชิงปฏิบัติการพัฒนาศักยภาพสตรีตำบลตลุกกลางทุ่งและยกระดับอาชีพผลิตภัณฑ์ จักสานจากไม้ไผ่ในรูปแบบใหม่<br><br>โดย คณะกรรมการพัฒนาสตรีตำบลตลุกกลางทุ่ง<br><br>ไม่ต้องใส่วันที่จ้า</p>', null, '2021-05-25', '10:00:00', '3, 4', null, '2021-05-19 14:25:48', '8', 'N84zvp2EMGIVn0hjgkMIey', '0', '0', '0', '0', '1', '1', '0', null, null, '0', '0', '0', '0', '0', null, null, null, '3', '1', null);
INSERT INTO `customer` VALUES ('110', 'ไวนิล', 'แอ็ปเปิ้ล โป่งแดง', '', '1', null, 'แอ็ปเปิ้ล โป่งแดง', 'รับงานหน้าร้าน *เบอร์โทรรอลูกค้าแจ้ง ', null, '<p>ป้ายไวนิลขนาด 100x100 ซม. 2 ป้ายๆละ 160.- (พับขอบเจาะรู4มุม)<br><br>ข้อความว่า<br>ที่ทิ้งขยะ เฉพาะหอพัก บ้านเอ็ก <br>ขยะต้องใส่ ถุงดำ เท่านั้น ขอบคุณครับ<br><br><br>-------------- ยอดชำระทั้งสิ้น 320 บาทค่ะ -----------------</p>', null, '2021-05-21', '14:53:00', '3, 4', null, '2021-05-19 14:57:49', '8', 'VWMAqlr859luWO-W7JzA77', '0', '0', '0', '1', '0', '1', '0', null, null, '0', '0', '0', '0', '1', null, '2021-05-19 16:21:11', '', '3', '3', null);
INSERT INTO `customer` VALUES ('111', '​ป้ายชื่อติดอกโรมาร์ก', 'แจ๊ค แม่กุ ออโต้ดีไซ', '0931979588', '1', null, 'แจ๊ค แม่กุ ออโต้ดีไซ', 'จัดส่งรถตู้\r\nร้านออโต้ดีไซน์ 1/23 หมู่ 7 ตำบลแม่กุอำเภอแม่สอด จังหวัดตาก\r\n0946016291', null, '<p>ป้ายชื่อติดอกโรมาร์ก 2 ชิ้นๆละ 150.- พร้อมจัดส่งรถตู้ฟรีค่ะ</p><p>ยอดชำระ 300.- </p>', null, '2021-05-20', '12:00:00', '3, 4', null, '2021-05-19 15:49:06', '8', 'KAvzVlHCKjukxp6RzWn_Bs', '1', '0', '0', '1', '0', '1', '0', null, null, '0', '0', '0', '0', '1', null, '2021-05-19 16:21:49', '', '3', '3', null);
INSERT INTO `customer` VALUES ('112', 'ไวนิล', 'ตากขาวละออ', '', '1', null, 'ตากขาวละออ', 'รับงานหน้าร้านวันศุกร์ 21/05/64 ', null, '<p>ไวนิล 300x200 ซม. 1 ผืนๆละ 960.-<br>แจ้งรับงานวันศุกร์ 21/05/64</p><p><br></p><p>พับขอบ ไม่ตอกตาไก่<br></p>', null, '2021-05-19', '11:00:00', '3, 4', null, '2021-05-19 16:00:47', '8', 'd54MvCz6fsOTye6WQpOq8v', '1', '0', '0', '0', '1', '1', '0', null, null, '0', '0', '0', '0', '0', null, null, null, '3', '1', null);

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
  `seq` int(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COMMENT='ตารางแผนก';

-- ----------------------------
-- Records of department
-- ----------------------------
INSERT INTO `department` VALUES ('1', 'รับงาน / คุยงาน', '1', null, 'chatbubble-ellipses-outline', 'customer/index', 'ion', '0', '1');
INSERT INTO `department` VALUES ('2', 'การตลาด / ลูกค้าสัมพันธ์', '0', null, 'fa fa-tags', null, 'fa', '1', null);
INSERT INTO `department` VALUES ('3', 'กราฟิก', '1', null, 'color-palette-outline', 'graphic/index', 'ion', '1', '3');
INSERT INTO `department` VALUES ('4', 'บัญชี', '1', null, 'receipt-outline', 'account/index', 'ion', '1', '2');
INSERT INTO `department` VALUES ('5', 'งานพิมพ์', '1', null, 'print-outline', 'branchprint/index', 'ion', '1', '5');
INSERT INTO `department` VALUES ('6', 'CNC / Laser', '1', null, 'magnet-outline', 'branchlaser/index', 'ion', '1', '4');
INSERT INTO `department` VALUES ('7', 'ผลิตทั่วไป', '1', null, 'construct-outline', 'branchfacture/index', 'ion', '1', '6');
INSERT INTO `department` VALUES ('8', 'ช่าง / ติดตั้ง', '1', null, 'build-outline', 'setup/index', 'ion', '1', '8');
INSERT INTO `department` VALUES ('9', 'จัดส่ง', '1', null, 'car-sport-outline', 'transport/index', 'ion', '0', '9');
INSERT INTO `department` VALUES ('10', 'ลงคิวงาน', '0', null, 'calendar-outline', 'queue/index', 'ion', '0', '7');
INSERT INTO `department` VALUES ('11', 'ดูงานทั้งหมด', '1', null, 'lnr lnr-enter', 'customer/all', 'lnr', '0', '11');
INSERT INTO `department` VALUES ('12', 'ส่งมอบงาน', '0', null, 'thumbs-up-outline', 'customer/approve', 'ion', '0', '10');
INSERT INTO `department` VALUES ('13', 'รับเองหน้าร้าน', '1', null, 'storefront-outline', 'customer/approve', 'ion', '1', '10');
INSERT INTO `department` VALUES ('14', 'Dashboard', '1', null, 'lnr lnr-home', 'dashboard/index', 'ion', '1', '0');

-- ----------------------------
-- Table structure for graphic
-- ----------------------------
DROP TABLE IF EXISTS `graphic`;
CREATE TABLE `graphic` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ref` varchar(50) DEFAULT '' COMMENT 'ref อ้างอิงลูกค้า',
  `customer_id` int(11) DEFAULT NULL COMMENT 'รหัสลูกค้า',
  `detail` longtext COMMENT 'รายละเอียดข้อมูลใบสั่งงาน',
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
) ENGINE=InnoDB AUTO_INCREMENT=114 DEFAULT CHARSET=utf8 COMMENT='ตารางแผนกกราฟิก';

-- ----------------------------
-- Records of graphic
-- ----------------------------
INSERT INTO `graphic` VALUES ('1', 'W_Dy_0CqF2px9NwnokjDCE', null, '<p>แจ้งพี่บอล<br>งานนี้ ปริ้นหน้า หลังนะคะ</p>', '', 'Jui9furXhUea_bjFFpfD5d', '16', null, '1', '1', '2021-05-05 10:20:39', '2021-05-11 11:10:38', '2', '5,7');
INSERT INTO `graphic` VALUES ('2', 'LpFjgcw2rQ7R8maXPwoNE6', null, '', '', '_4pm_wBq9hAayEOYwsBfqr', '16', null, '1', '1', '2021-05-05 13:24:11', '2021-05-11 10:24:37', '2', '5');
INSERT INTO `graphic` VALUES ('3', '80WMVrjv2tuVl5n9cC_CKy', null, '<p>*ส่งงานแล้ว</p>', '', 'jnjd49kFPDQP1gbfWA9adv', '16', null, '1', '1', '2021-05-05 17:23:24', '2021-05-11 10:23:21', '2', '6,7');
INSERT INTO `graphic` VALUES ('4', 'Yf5vTaeciRsnZN5M-I9sLI', null, '', '', '848IEWwrS5lTv6gO7XYIbb', '16', null, '1', '1', '2021-05-05 13:25:01', '2021-05-11 10:23:36', '2', '5,6,7');
INSERT INTO `graphic` VALUES ('5', '76hIJ7ACiXmWpNWvGLspUW', null, '', '', 'wnoDBqA7RZJkW9p92a24Te', '16', null, '1', '1', '2021-05-05 13:15:16', '2021-05-11 09:07:23', '2', '5,6,7');
INSERT INTO `graphic` VALUES ('6', 'H5O9zgJoDb6GiMH_xX4mPE', null, '<p>กราฟิกจะแจ้งรายละเอียดการทำงาน วิธีการทำงาน </p><p>วิธีการพิมพ์ และขั้นการทำงานอื่นๆ ที่จะทำให้งานรวดเร็ว</p>', '', 'cEnh-T_l1ednftHVIUwM-O', '1', null, '1', '1', '2021-05-05 10:48:42', '2021-05-11 13:55:09', '2', '6');
INSERT INTO `graphic` VALUES ('7', 'aqoqo21ctwWwK8PhqFKfqs', null, '', '', 'Rz13XLpHt21PoZvblIKa-c', '16', null, '1', '1', '2021-05-05 13:50:58', '2021-05-11 10:24:31', '2', '5');
INSERT INTO `graphic` VALUES ('8', 'l7bbwQI9C4UqeU9f7nnwZB', null, '<p>งานผลิตเสร็จแล้วเหรือทำสีและเข้าติดตั้ง </p>', '', 'NI4ah55wf34HJx5sNQWr_l', '8', null, '1', '1', '2021-05-06 17:27:51', '2021-05-11 10:25:03', '2', '5,6,7');
INSERT INTO `graphic` VALUES ('9', 'KINCuRWXK3PMUAOwfw0IA5', null, '', '', 'RCHxsjKbSuCyb7jucQ2sEj', '16', null, '3', '0', '2021-05-06 15:11:32', '2021-05-06 15:11:43', '1', '5');
INSERT INTO `graphic` VALUES ('10', '1-deFHIsDp8UH_1LfynQ33', null, '<p>พี่บอลส่งงานพิมพ์แล้ว </p>', '', 'SYjgv4VQPveIcY6_LLyUGX', '8', null, '1', '1', '2021-05-06 17:26:18', '2021-05-11 10:24:47', '2', '5,7');
INSERT INTO `graphic` VALUES ('11', 'HQcTSNCNtgc3SWwo5aAeAE', null, '<p>พี่ณัฐสั่งผลิตงานให้ </p>', '', 'DAYwsktXyQOl9xXG5FAG4r', '16', null, '1', '1', '2021-05-05 14:27:26', '2021-05-11 10:25:18', '2', '6,7');
INSERT INTO `graphic` VALUES ('12', 'ZevKuy2Fnz8Bmpa1RsXKSI', null, '', '', '3KRz5HATSrB6Ehzrgywr-9', '12', null, '1', '1', '2021-05-11 16:50:08', '2021-05-11 16:50:12', '2', '5, 7');
INSERT INTO `graphic` VALUES ('13', '_TDDyi2XV9OSkAs_phSlcX', null, '<p>*ลูกค้ารับงานหน้าร้านแล้ว</p>', '', 'ja9Vn7zlRoivxfXXQNoa1N', '16', null, '1', '1', '2021-05-05 17:30:13', '2021-05-11 10:23:50', '2', '5,7');
INSERT INTO `graphic` VALUES ('14', 'lER6-HE2lJwDeTY21TlJ6s', null, '', '', '7vG403C-QA77OJrLGU9rIo', '12', null, '1', '1', '2021-05-11 16:51:23', '2021-05-11 16:51:27', '2', '5, 7');
INSERT INTO `graphic` VALUES ('15', 'Pel7uZlkWv70QlEM7N_lKb', null, '<p>แจ้งพี่บอล..งานไวนิลขนาด 220x77 ซม. 1 ป้ายๆละ 245.-<br>พับขอบเจาะรู 4 ด้าน </p><p>X:\\G ขิม\\0.งาน\\110.Aon\\ไวนิลกุ้งทอด 220x77 cm.tif<span class=\"redactor-invisible-space\"></span></p>', '', 'lTZS-5f9A_OKhhXinASgM8', '16', null, '1', '1', '2021-05-06 12:05:39', '2021-05-11 10:27:51', '2', '5');
INSERT INTO `graphic` VALUES ('16', 'ZJpRfgA-Sg1-iQ0c_lFTPA', null, '<p>งานเสร็จแล้วค่ะ</p>', '', '6nuLTNUQlsnWiuwcJ28DPl', '8', null, '1', '1', '2021-05-07 10:56:59', '2021-05-11 10:22:35', '2', '6,7');
INSERT INTO `graphic` VALUES ('17', '-D3HjJnBYj_bngAK3ut3Nc', null, '', '', 'A8y4HlaN5EdzqlLqIim0NA', '12', null, '1', '1', '2021-05-08 08:36:13', '2021-05-11 11:12:26', '2', '5,7');
INSERT INTO `graphic` VALUES ('18', 'BdSi1aloNqzKqs1dRzh_Mb', null, '<p>บล็อคพ่นสี ขนาด 40x20 cm. 1 ชิ้นๆละ 200.-</p>', '', '8pV0hYksEndTiEiLIC4L3r', '8', null, '1', '1', '2021-05-07 09:28:04', '2021-05-11 11:12:16', '2', '6,7');
INSERT INTO `graphic` VALUES ('19', '72IH6IoMq2GVAY6g6j9cWI', null, '<p>แจ้งพี่บอลผลิตงาน..ป้ายชื่อติดอก 2 ชิ้นๆละ 200.- = 400.-<br>ค่าจัดส่ง 100.-</p><p>X:\\G ขิม\\0.งาน\\113.ป้ายชื่อติดอก Nalina.AI<span class=\"redactor-invisible-space\"><br></span></p>', '', '_JvVy7xAi3IjtWAhHhz2P-', '12', null, '1', '1', '2021-05-06 15:16:33', '2021-05-11 11:12:03', '1', '');
INSERT INTO `graphic` VALUES ('20', 'JK9-EvGZcUUQ_i7KnFAycm', null, '', '', '2K7-sJDJGN34d7hihlnzIx', '12', null, '1', '1', '2021-05-08 08:37:02', '2021-05-11 10:28:01', '2', '5,7');
INSERT INTO `graphic` VALUES ('21', 'kLtTSk2dfLXj3wJUeKAQdV', null, '', '', 'yj-r3uTXspb5hrFWw7-_u1', '12', null, '1', '1', '2021-05-08 08:39:24', '2021-05-11 10:28:12', '2', '5');
INSERT INTO `graphic` VALUES ('22', 'DyGy_kfng8CV9Jnd-DKGxK', null, '', '', '-O8mSx2jc49Nl7Gdf7idwX', '12', null, '1', '1', '2021-05-08 08:38:32', '2021-05-11 10:28:27', '2', '5');
INSERT INTO `graphic` VALUES ('23', 'uy0t1Xm7NfCoTw2rD1zKU9', null, '<p>งานเสร็จแล้ว</p>', '', 'yvp_VnJvgYzInoOiOE78HY', '8', null, '1', '1', '2021-05-08 11:55:48', '2021-05-11 11:11:54', '2', '5');
INSERT INTO `graphic` VALUES ('24', '_kn8kDdx84Qpsh3jCEO0cP', null, '', '', 'RjdVAgxvj7n2iETi2PjKFT', '12', null, '1', '1', '2021-05-11 16:49:05', '2021-05-11 16:49:10', '2', '5, 6');
INSERT INTO `graphic` VALUES ('25', 'MFzzD00Me92O7h2Jy0vzHu', null, '', '', 'Ezk4vbqN5jZ75Vfl79YYbP', '12', null, '1', '1', '2021-05-10 09:08:25', '2021-05-11 11:11:40', '2', '5');
INSERT INTO `graphic` VALUES ('26', '2hhEmcmI5HiRzfrZUDbcpd', null, '', '', 'qez_5vuxzwsud_DU0mitpo', '12', null, '1', '1', '2021-05-10 09:09:23', '2021-05-11 11:11:47', '2', '5');
INSERT INTO `graphic` VALUES ('27', 'lqPKHuXygVGDIpYsyI9kt7', null, '', '', 'AQdMr97VrRJq_kqzlT1Opw', '1', null, '1', '1', '2021-05-11 15:40:29', '2021-05-12 13:38:44', '2', '5');
INSERT INTO `graphic` VALUES ('28', 'kUH617ueCSMo-_c7ONrmLW', null, null, '', '', null, null, '2', '0', null, '2021-05-10 14:22:13', '1', null);
INSERT INTO `graphic` VALUES ('29', 'KpZoS2n0XXjgWrCvn1MOKS', null, '', '', 'czIIkreKLe3w0NM4KtHJMD', '12', null, '1', '1', '2021-05-10 09:15:17', '2021-05-11 08:38:19', '2', '5');
INSERT INTO `graphic` VALUES ('30', 'rJAJa1zr9t8YihRUh5yKM6', null, '<p>ตัดสร็จส่งออฟฟิศ</p>', '', 'H8LtyY_C-uIFQCmPhM3m0F', '12', null, '1', '1', '2021-05-11 10:43:13', '2021-05-11 10:43:38', '2', '6');
INSERT INTO `graphic` VALUES ('31', 'X77vrRC85W3ppSbUrwoP43', null, '', '', 'oPBlqSvsqixDsyEAPz37yf', '12', null, '1', '1', '2021-05-10 09:16:53', '2021-05-11 11:11:24', '2', '5');
INSERT INTO `graphic` VALUES ('32', 'm0KhYK9RmwgVOGo-0MmlhG', null, '', '', 'VdwWAzzP1x-hbjZl4ST7Ib', '12', null, '1', '1', '2021-05-10 09:18:00', '2021-05-11 10:41:31', '2', '5');
INSERT INTO `graphic` VALUES ('33', 'WQGXPhm9vwlsfnZA11AWaY', null, '', '', 'o1b6stU4iPgWnByHIzxaEh', '12', null, '1', '1', '2021-05-11 10:25:58', '2021-05-11 11:11:12', '2', '5, 6');
INSERT INTO `graphic` VALUES ('34', 'ASSAjitIb9LjfuW4kfBfqk', null, '', '', 'otOI2MW78Z5In0QmZfCBrU', '12', null, '1', '0', '2021-05-11 10:40:37', '2021-05-11 10:40:37', '2', '5, 6, 7');
INSERT INTO `graphic` VALUES ('35', 'ceO-2fQclNvEJwDd4S7jIy', null, '', '', 'TNFp18zKU_qWjRTDm6DePI', '12', null, '1', '1', '2021-05-11 11:12:07', '2021-05-11 16:57:11', '2', '5, 6');
INSERT INTO `graphic` VALUES ('36', '5UMnCH7Tp8ts2NPVTq8b7I', null, null, '', '', null, null, '0', '0', null, null, '1', null);
INSERT INTO `graphic` VALUES ('37', 'u7i2Oit-QdjVBf26oA2LM5', null, '', '', 'B_L-rdnornUvja-kzCTlLI', '1', null, '1', '1', '2021-05-11 15:40:57', '2021-05-11 15:41:16', '2', '6');
INSERT INTO `graphic` VALUES ('38', 'Nm8YXtbe5__ByiIayzf8KA', null, '', '', '_Ff_5zqZT9-xB6RkAKM_ke', '12', null, '1', '1', '2021-05-11 11:35:33', '2021-05-11 11:35:56', '2', '5, 6, 7');
INSERT INTO `graphic` VALUES ('39', '0a4gSaSnJl_Hz8SJsWjb2G', null, '', '', '9TlDEaH3Rzr96_hQWJW-kH', '1', null, '1', '0', '2021-05-11 17:09:15', '2021-05-11 17:09:15', '2', '5, 6');
INSERT INTO `graphic` VALUES ('40', '7qdguXaqdFQZJR_asF_UfQ', null, '', '', 'fSaOu79Agjuy7fK7P_wHke', '12', null, '1', '0', '2021-05-11 16:53:38', '2021-05-11 16:53:38', '2', '5');
INSERT INTO `graphic` VALUES ('41', 'XMXoW-yaSzIWCiUTtjiXFW', null, '', '', 'IFqbV1TzEuGdX-8SiobHX1', '12', null, '1', '1', '2021-05-11 15:33:39', '2021-05-11 16:46:35', '2', '5, 6');
INSERT INTO `graphic` VALUES ('42', '_HTbSTzcnu_8YXRiOHbn-W', null, null, '', '', null, null, '0', '0', null, null, '1', null);
INSERT INTO `graphic` VALUES ('43', 'QSLbWxE12CQGIwWMDl9pGb', null, '', '', 'O8aW0azi71n6tuo4rTvXv0', '12', null, '1', '0', '2021-05-11 11:32:54', '2021-05-11 11:32:54', '2', '5, 6, 7');
INSERT INTO `graphic` VALUES ('44', '6sPLpN7SmjvQLLKoafR940', null, '', '', 'uIfJaunRWsNUkl73TQyoAm', '12', null, '1', '1', '2021-05-11 10:34:50', '2021-05-11 10:39:27', '2', '5, 6, 7');
INSERT INTO `graphic` VALUES ('45', 'n3TfnfxsKFdQQFeDT5AEVI', null, '<p>ไดคัทมือ</p>', '', 'HVCT52oNYgST08A_2V6zh4', '12', null, '1', '1', '2021-05-11 16:48:12', '2021-05-11 16:50:14', '2', '5, 7');
INSERT INTO `graphic` VALUES ('46', 'LTJBdwfKR1fPJgSt96JA-c', null, '', '', '3X_i08Q7tDCxnASXR8YS89', '16', null, '1', '1', '2021-05-11 13:55:26', '2021-05-11 13:55:33', '2', '5, 6, 7');
INSERT INTO `graphic` VALUES ('47', 'Qe-0jK3dcpTUbSEu8NCm_D', null, '', '', 'wXFmfCpcyHiojZzEes6acm', '16', null, '1', '1', '2021-05-11 11:29:47', '2021-05-11 13:55:16', '2', '5, 6, 7');
INSERT INTO `graphic` VALUES ('48', 'EHtNT9tpNc1i28UkoTlfXb', null, '', '', '6YiFlQW9ynsZZd3b-G6iB6', '17', null, '1', '1', '2021-05-11 17:05:14', '2021-05-11 17:05:19', '2', '5, 6');
INSERT INTO `graphic` VALUES ('49', '9lLpBEMv3URV9CIKowTvtp', null, '', '', 'vKaOjzH7Ld01phmoLtY7DQ', '1', null, '1', '1', '2021-05-11 15:31:09', '2021-05-11 15:37:37', '2', '5, 6, 7');
INSERT INTO `graphic` VALUES ('50', 'jGzP_OORkZdjjEm2vxpLmd', null, '', '', 'T07Aja2Nl0KTTIuiYwLkux', '1', null, '1', '1', '2021-05-11 15:59:54', '2021-05-12 14:16:01', '4', null);
INSERT INTO `graphic` VALUES ('51', 'd3EZeq2qOc1sfftpV5q19D', null, null, '', '', null, null, '0', '0', null, null, '1', null);
INSERT INTO `graphic` VALUES ('52', 'fU8hZ0tJOvyyp9j-LVPCge', null, '<p>งานผลิตเสร็จแล้ว ลงคิวติดตั้ง</p>\r\n', '', 'q_d0HIRbdCDWahyEVKw7zI', '1', null, '1', '0', '2021-05-12 09:07:29', '2021-05-12 09:07:29', '2', '7');
INSERT INTO `graphic` VALUES ('53', '7hyySzNtI_VR84GW8lXTdk', null, '<p>ผลิตเสร็จแล้วลงคิวติดตั้ง</p>\r\n', '', 'BmW1ujX4PD5Hn-OEdJr4Aw', '1', null, '1', '1', '2021-05-12 09:10:28', '2021-05-12 13:57:28', '2', '7');
INSERT INTO `graphic` VALUES ('54', 'CAcAJCWeZd-mKozrUigR0Q', null, '<p>งานช่างติดต่อพี่ณัฐ</p>\r\n', '', 'Bd3yhDjbs7XU0YpNLsM6jx', '1', null, '1', '0', '2021-05-12 09:11:56', '2021-05-12 09:11:56', '2', '7');
INSERT INTO `graphic` VALUES ('55', 'fucZblB3_4Zu2jE0a0Vnj9', null, '<p>งานผลิตเสร็จแล้วลวคิวติดตั้ง</p>\r\n', '', 'n8dIegmGxDT1wiHsFGTdsB', '1', null, '1', '0', '2021-05-12 09:13:22', '2021-05-12 09:13:23', '2', '7');
INSERT INTO `graphic` VALUES ('56', 'hrmv4WPvcupLaEF9BnJnT0', null, '<p>ผลิตเสร็จแล้วลงคิวติดตั้ง</p>\r\n', '', 'z8BMBmaFeKdM81q8uN5xrZ', '1', null, '1', '0', '2021-05-12 09:11:09', '2021-05-12 09:11:09', '2', '7');
INSERT INTO `graphic` VALUES ('57', 'pXsuTV4mAr0AU6D8F36gso', null, null, '', '', null, null, '0', '0', null, null, '1', null);
INSERT INTO `graphic` VALUES ('58', 'FFpCWYn5MhCGVnFFK0aK-Q', null, null, '', '', null, null, '0', '0', null, null, '1', null);
INSERT INTO `graphic` VALUES ('59', 'hOUdPv_zaMEEKvcHnpsMx0', null, '<p>ฟหดฟำไพเฟหกด</p>\r\n\r\n<p>&nbsp;</p>\r\n', '', '9ytxaP4RM9pXtIyJv8eH_M', '1', null, '1', '1', '2021-05-12 13:36:11', '2021-05-12 13:36:58', '2', '5, 6, 7');
INSERT INTO `graphic` VALUES ('60', '64qt3ErfzChbImDohEIYRL', null, null, '', '', null, null, '0', '0', null, null, '1', null);
INSERT INTO `graphic` VALUES ('61', 'WET_Nb0rGmQ93JUN9lqlaq', null, '<p>คำสั่งจากกราฟิก ให้ทำดังนี้</p>\r\n\r\n<p>&nbsp;1. ตัดอะคริลิคขาวพิมพ์ยูวี&nbsp;</p>\r\n\r\n<p>2. พิมพ์ยูวี</p>\r\n\r\n<p>3. พับฐาน + แพ็ค ส่ง</p>\r\n', '', 'FyaZkaP25W7zZhAgVI3KOS', '1', null, '1', '0', '2021-05-12 14:28:38', '2021-05-12 14:28:38', '2', '5, 6, 7');
INSERT INTO `graphic` VALUES ('62', 'h3ukp0KanLnl5n9e0AFke3', null, null, '', '', null, null, '0', '0', null, null, '1', null);
INSERT INTO `graphic` VALUES ('63', 'dpLUbWwhqiNKCkrSJPsYl-', null, '', '', 'm-w4AnRWUuCw-ybbWVHqi7', '1', null, '2', '1', '2021-05-12 18:35:40', '2021-05-12 18:37:19', '3', null);
INSERT INTO `graphic` VALUES ('64', '8_Zx2LZQiqPFUQ9TD0pywB', null, '<p>Mmmnbjke</p>\r\n\r\n<p>ถ่ายภาพจากแท็ปเลต</p>\r\n', '', 'bl3CWqPYZs1pNYCWQmQA_n', '1', null, '1', '1', '2021-05-12 18:41:47', '2021-05-12 18:41:58', '2', '5, 6, 7');
INSERT INTO `graphic` VALUES ('65', 'ETPpDvNmIFEB4j4Tgi32oj', null, '<p>ทดสอบว่าปุ่มจะเปลี่ยนสีหรือไม่</p>\r\n', '', 'GETht1rqAu7n3kQn6kns-3', '1', null, '1', '1', '2021-05-12 18:54:07', '2021-05-12 18:56:31', '2', '5, 6');
INSERT INTO `graphic` VALUES ('66', 'cRO9HGZyoNvFVnlA-59Xt2', null, '<p>ทดสอบแอพใหม่</p>\r\n', '', 'MFdEQ4T6v4huUmlyAMn9Oi', '1', null, '1', '0', '2021-05-12 19:40:01', '2021-05-12 19:40:01', '2', '5, 6, 7');
INSERT INTO `graphic` VALUES ('67', 'QjfhOfXg181A4woB_CJZbh', null, null, '', '', null, null, '0', '0', null, null, '1', null);
INSERT INTO `graphic` VALUES ('68', 'Bfx-3DB0DnffvI4hi8s4Dd', null, '<p>พับขอบเจาะตาไก่</p>\r\n', '', 'Dvs6O9fbFcqKxg4A5QiLGb', '1', null, '1', '1', '2021-05-14 10:00:27', '2021-05-14 11:02:18', '2', '5, 7');
INSERT INTO `graphic` VALUES ('69', 'R0s6646_Wy1RQU0tH3feJI', null, '', '', 'rHIZJP1dmxWyBCZ_7d2gl9', '1', null, '1', '1', '2021-05-14 14:56:10', '2021-05-14 14:56:14', '2', '5');
INSERT INTO `graphic` VALUES ('70', '29jO6OBZ-DcyKJAPbAkR-D', null, '', '', 'U9RluUop448TSm-aPhU80j', '1', null, '1', '1', '2021-05-14 09:04:58', '2021-05-14 09:05:12', '2', '5');
INSERT INTO `graphic` VALUES ('71', 'G8sXWOx_pijFawJSiWCj_3', null, null, '', '', null, null, '0', '0', null, null, '1', null);
INSERT INTO `graphic` VALUES ('72', 'TVdH76RDCnBbBTqcwtkBsH', null, null, '', '', null, null, '0', '0', null, null, '1', null);
INSERT INTO `graphic` VALUES ('73', 'r9qfUVpdCecyGahZ972F0E', null, null, '', '', null, null, '0', '0', null, null, '1', null);
INSERT INTO `graphic` VALUES ('74', 'lsLUi5-eonboPFpOQUTsmY', null, null, '', '', null, null, '0', '0', null, null, '1', null);
INSERT INTO `graphic` VALUES ('75', 'Rnvn3RJB8g2hBgiIsUQSJI', null, '', '', 'tRdndxneLx7YrWUjEzviI3', '1', null, '1', '1', '2021-05-14 14:57:19', '2021-05-14 15:20:28', '2', '5, 7');
INSERT INTO `graphic` VALUES ('76', '8nYloAlOIVHu6Rhi9MtZN1', null, '', '', 'A7vkLWUZWzLWR-tYbtDTsm', '1', null, '1', '1', '2021-05-14 14:53:52', '2021-05-14 14:54:04', '2', '7');
INSERT INTO `graphic` VALUES ('77', 'ZJefNzuDnS-HvShoWa7gUZ', null, '', '', '2cd17ZfeVYxjicF0smEgua', '1', null, '1', '1', '2021-05-14 14:54:45', '2021-05-14 14:54:50', '2', '5, 6');
INSERT INTO `graphic` VALUES ('78', 'NMU8hYni2hQJzcGWzEnwYe', null, null, '', '', null, null, '0', '0', null, null, '1', null);
INSERT INTO `graphic` VALUES ('79', '6fB4CAg1KJL5Ald2p5xlJC', null, '', '', '1qnsmQs6DRC8IClIGrUsJt', '1', null, '1', '1', '2021-05-14 16:14:32', '2021-05-14 16:14:41', '2', '5');
INSERT INTO `graphic` VALUES ('80', '9uku3p4nk2HhVJkGP-6oOo', null, '<p><img alt=\"image\" src=\"https://chat-content.line-scdn.net/bot/Uf09f66ebd2022fc14d87c675b86a0fd2/sAtgBPfhVC3mT5hFRFCgKY9shunZ2ZgWxkWlWF3LxPeLkejD_Zp7Tmv-3pjkl-ljWWIsdlsj4i_xwyHt4pY_55Zas3jisTLlsAGO1zykgTAxqQ2X3i1b2kt24Z9V14mW\" /></p>\r\n', '', 'C_ErxYSyp7XXM4vK6qIaMc', '16', null, '1', '1', '2021-05-15 06:31:23', '2021-05-15 06:34:40', '2', '6, 7');
INSERT INTO `graphic` VALUES ('81', '1ePJlxC9Iy1cvLIJvG6kav', null, '', '', 'zgwIQSPisFGXlgdZpEIe-v', '1', null, '1', '0', '2021-05-14 16:21:29', '2021-05-14 16:21:29', '2', '5');
INSERT INTO `graphic` VALUES ('82', 'd2cddmWbQ5q52QXxRCq3e-', null, '', '', 'kx2tg9Gd6XpNEDp8N-ovJk', '1', null, '1', '1', '2021-05-15 10:20:04', '2021-05-15 10:20:08', '2', '7');
INSERT INTO `graphic` VALUES ('83', '6NvGa1WfdZon2FTKOANHYI', null, null, '', '', null, null, '0', '0', null, null, '1', null);
INSERT INTO `graphic` VALUES ('84', 'SwHKFAotfowJHYH20O2iDH', null, null, '', '', null, null, '0', '0', null, null, '1', null);
INSERT INTO `graphic` VALUES ('85', 'bJQg87V6EFNI-IYOZZXBsJ', null, '', '', '1H4lapdwujcmGq_GozTG8T', '1', null, '1', '1', '2021-05-17 13:55:28', '2021-05-17 13:55:32', '2', '5, 6');
INSERT INTO `graphic` VALUES ('86', 'pdci6GgdMe4wBztYRnGZsv', null, '', '', 'c9N55osIC_CIUSmwRvpxA8', '1', null, '1', '1', '2021-05-17 13:54:24', '2021-05-17 13:54:28', '2', '5, 7');
INSERT INTO `graphic` VALUES ('87', 'X-H0wokcbyYMpPWupr--Ae', null, null, '', '', null, null, '0', '0', null, null, '1', null);
INSERT INTO `graphic` VALUES ('88', 'c3eU7ywfowEQmyw0IjMhaQ', null, null, '', '', null, null, '0', '0', null, null, '1', null);
INSERT INTO `graphic` VALUES ('89', 'UauniDVW1pUZeShneZdjjz', null, null, '', '', null, null, '0', '0', null, null, '1', null);
INSERT INTO `graphic` VALUES ('90', 'PC16PlJVg_7Xd5YmGGg0mi', null, '', '', 'LcUH3wswn_uiGkQRuqFF68', '17', null, '1', '1', '2021-05-17 21:05:12', '2021-05-17 21:05:15', '3', null);
INSERT INTO `graphic` VALUES ('91', 'MZj6PndvG7ZpAROePYv3hw', null, null, '', '', null, null, '0', '0', null, null, '1', null);
INSERT INTO `graphic` VALUES ('92', 'CPzscmmVggSVGf8cyBCB0N', null, '', '', 'sgz9PW-2ZjBG_BcyKy8D2O', '1', null, '1', '1', '2021-05-18 11:59:08', '2021-05-18 11:59:12', '2', '5');
INSERT INTO `graphic` VALUES ('93', 'NwLzGmWHZCNiBoHvWJ_JVY', null, '', '', 'YHH6NrRYgUXjK1AygnbaR4', '1', null, '1', '1', '2021-05-17 17:25:59', '2021-05-17 17:26:03', '4', null);
INSERT INTO `graphic` VALUES ('94', 'rvm9thaM0Tz5d_Npq8IjB5', null, '', '', 'd0JdApS4LY9Kiv7SuinF2A', '17', null, '1', '1', '2021-05-17 21:05:26', '2021-05-17 21:05:29', '3', null);
INSERT INTO `graphic` VALUES ('95', 'YUWuIUIZ-FXoTHzsyEsSsg', null, '', '', '0UIl80L2lQckGoSwjVa97B', '1', null, '1', '1', '2021-05-17 15:30:19', '2021-05-17 15:30:23', '2', '5');
INSERT INTO `graphic` VALUES ('96', 'CmvKcG5eHTn7HD4IIoeoMh', null, null, '', '', null, null, '0', '0', null, null, '1', null);
INSERT INTO `graphic` VALUES ('97', 'sE4Bo7KJAI-VymDWuR5SoJ', null, null, '', '', null, null, '0', '0', null, null, '1', null);
INSERT INTO `graphic` VALUES ('98', 'K4aHqribfirH195o76wdkU', null, null, '', '', null, null, '0', '0', null, null, '1', null);
INSERT INTO `graphic` VALUES ('99', '3qfWzNL0gNGXQjOCaR6YTi', null, '', '', 'smsAUtAppXgyB1MUq4CJb2', '1', null, '1', '1', '2021-05-18 11:58:15', '2021-05-18 11:58:18', '2', '5');
INSERT INTO `graphic` VALUES ('100', 'BWTbhpypiSF6YctPzCo1OC', null, null, '', '', null, null, '0', '0', null, null, '1', null);
INSERT INTO `graphic` VALUES ('101', 'w1lMYIjg7gsJNtxW24Usm-', null, null, '', '', null, null, '0', '0', null, null, '1', null);
INSERT INTO `graphic` VALUES ('102', 'xNHFTf7NDm1W2Et-Vjss19', null, null, '', '', null, null, '0', '0', null, null, '1', null);
INSERT INTO `graphic` VALUES ('103', 'Zi7JvolZ3MkKlhUMSa6EbW', null, null, '', '', null, null, '0', '0', null, null, '1', null);
INSERT INTO `graphic` VALUES ('104', '1aqIWI1ypdhbJz1BHYOvP6', null, '', '', 'VGDJHNajZ9BinScLlFOb4y', '17', null, '1', '1', '2021-05-19 09:21:06', '2021-05-19 09:30:10', '2', '6, 7');
INSERT INTO `graphic` VALUES ('105', 'rpcABKqsHGmiTPpt1Zwrh4', null, null, '', '', null, null, '0', '0', null, null, '1', null);
INSERT INTO `graphic` VALUES ('106', '5TjzbuWalTuAJcTsc1dubh', null, '', '', 'Dyc_ZxmgoF5OQCYwqL2q_7', '1', null, '1', '1', '2021-05-19 11:13:14', '2021-05-19 11:13:17', '2', '5, 7');
INSERT INTO `graphic` VALUES ('107', 'tS0XNs30MdcLuxutSWM4G0', null, null, '', '', null, null, '0', '0', null, null, '1', null);
INSERT INTO `graphic` VALUES ('108', 'o-ySwjoOAuPPCkM5vP0HwB', null, null, '', '', null, null, '0', '0', null, null, '1', null);
INSERT INTO `graphic` VALUES ('109', '5ldsZsOZWHoCYCyWUmNZbZ', null, null, '', '', null, null, '0', '0', null, null, '1', null);
INSERT INTO `graphic` VALUES ('110', 'N84zvp2EMGIVn0hjgkMIey', null, null, '', '', null, null, '0', '0', null, null, '1', null);
INSERT INTO `graphic` VALUES ('111', 'VWMAqlr859luWO-W7JzA77', null, null, '', '', null, null, '0', '0', null, null, '1', null);
INSERT INTO `graphic` VALUES ('112', 'KAvzVlHCKjukxp6RzWn_Bs', null, null, '', '', null, null, '0', '0', null, null, '1', null);
INSERT INTO `graphic` VALUES ('113', 'd54MvCz6fsOTye6WQpOq8v', null, null, '', '', null, null, '0', '0', null, null, '1', null);

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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='ตารางเก็บประวัติส่งกลับมาแก้ไข';

-- ----------------------------
-- Records of graphic_log
-- ----------------------------
INSERT INTO `graphic_log` VALUES ('1', 'Pel7uZlkWv70QlEM7N_lKb', '1', '', null, '2021-05-06 11:52:18', '0', 'งานพิมพ์ส่งแก้ไข');
INSERT INTO `graphic_log` VALUES ('2', 'Pel7uZlkWv70QlEM7N_lKb', '1', '', null, '2021-05-06 11:59:16', '0', 'ผลิตทั่วไป ส่งแก้ไข');
INSERT INTO `graphic_log` VALUES ('3', '1-deFHIsDp8UH_1LfynQ33', '1', '', null, '2021-05-06 15:10:20', '0', 'งานพิมพ์ส่งแก้ไข');
INSERT INTO `graphic_log` VALUES ('4', 'KINCuRWXK3PMUAOwfw0IA5', '1', '', null, '2021-05-06 15:11:43', '1', 'งานพิมพ์ส่งแก้ไข');

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
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COMMENT='สิทธิ์การใช้งาน';

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
INSERT INTO `privilege` VALUES ('20', '24', '0', '0', '0', '0', '0');

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
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COMMENT='ตารางคิวงานติดตั้ง ส่งมาเมื่อกราฟฟิกบันทึกข้อมูล';

-- ----------------------------
-- Records of queue
-- ----------------------------
INSERT INTO `queue` VALUES ('1', 'H5O9zgJoDb6GiMH_xX4mPE', '8', '2021-05-06', '11:08:00', '2', '1', '2021-05-06 11:09:19', '8', '-', 'Qk4boKdBrLvLAoSgYXW-R-');
INSERT INTO `queue` VALUES ('2', '6sPLpN7SmjvQLLKoafR940', '16', '2021-05-11', '11:04:00', '2', '1', '2021-05-11 11:05:05', '16', '', 'E5GhoCGENCzu0Vn3PxFXXX');
INSERT INTO `queue` VALUES ('3', 'Qe-0jK3dcpTUbSEu8NCm_D', '16', '2021-05-11', '15:43:00', '2', '1', '2021-05-11 15:50:43', '16', '', 'bxmdQR6V-rE38JmkzRgIg8');
INSERT INTO `queue` VALUES ('4', 'LTJBdwfKR1fPJgSt96JA-c', '1', '2021-05-11', '15:30:00', '2', '1', '2021-05-11 15:50:36', '16', '', 'AhWQH8y_2mVLO1VqhwPeyf');
INSERT INTO `queue` VALUES ('9', 'lqPKHuXygVGDIpYsyI9kt7', '16', '2021-05-11', '15:43:00', '2', '1', '2021-05-11 15:50:51', '16', '', 'rT9ya6m_UIO57Sf2TXt3K1');
INSERT INTO `queue` VALUES ('10', 'jGzP_OORkZdjjEm2vxpLmd', '1', '2021-05-12', '16:01:00', '2', '1', '2021-05-12 08:48:45', '1', '', '-jIMYbHbkRI5U6A9qlkgG_');
INSERT INTO `queue` VALUES ('11', 'ZevKuy2Fnz8Bmpa1RsXKSI', '8', '2021-05-12', '08:48:00', '1', '1', '2021-05-12 08:49:00', '8', '', 'JvqsYPhSr3wOE2SQ0jhmcp');
INSERT INTO `queue` VALUES ('12', '7hyySzNtI_VR84GW8lXTdk', '17', '2021-05-12', '11:10:00', '2', '1', '2021-05-12 17:14:43', '2', '', 'pQz66921ypu0BMI6_BSI4-');
INSERT INTO `queue` VALUES ('13', 'hrmv4WPvcupLaEF9BnJnT0', '17', '2021-05-12', '09:18:00', '2', '1', '2021-05-12 17:14:37', '1', '', 'wN5nrFPq7FLwGBtayBWQzp');
INSERT INTO `queue` VALUES ('14', 'CAcAJCWeZd-mKozrUigR0Q', '1', '2021-05-12', '13:00:00', '1', '1', '2021-05-12 09:42:00', '1', '', '8SST7lqZKKkVeGW8l3b3ZQ');
INSERT INTO `queue` VALUES ('15', 'fucZblB3_4Zu2jE0a0Vnj9', '1', '2021-05-12', '14:00:00', '1', '1', '2021-05-12 09:42:02', '1', '', 'Jj48kzhEYaGj0zmTbtmlVn');
INSERT INTO `queue` VALUES ('16', 'hOUdPv_zaMEEKvcHnpsMx0', null, null, null, '0', '0', null, null, null, null);
INSERT INTO `queue` VALUES ('17', 'WET_Nb0rGmQ93JUN9lqlaq', null, null, null, '0', '0', null, null, null, null);
INSERT INTO `queue` VALUES ('19', '8_Zx2LZQiqPFUQ9TD0pywB', '1', '2021-05-17', '09:02:00', '0', '1', '2021-05-13 09:03:02', null, '', null);
INSERT INTO `queue` VALUES ('20', '6fB4CAg1KJL5Ald2p5xlJC', null, null, null, '0', '0', null, null, null, null);
INSERT INTO `queue` VALUES ('21', 'bJQg87V6EFNI-IYOZZXBsJ', '8', '2021-05-18', '09:30:00', '0', '1', '2021-05-18 15:31:44', null, '', null);
INSERT INTO `queue` VALUES ('22', 'YUWuIUIZ-FXoTHzsyEsSsg', '8', '2021-05-18', '15:00:00', '0', '1', '2021-05-18 15:33:31', null, '', null);
INSERT INTO `queue` VALUES ('23', '3qfWzNL0gNGXQjOCaR6YTi', '8', '2021-05-18', '15:00:00', '0', '1', '2021-05-18 15:32:49', null, '', null);

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
) ENGINE=InnoDB AUTO_INCREMENT=89 DEFAULT CHARSET=utf8 COMMENT='สิทธิ์การเข้าถึงแผนก';

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
INSERT INTO `rule` VALUES ('19', '2', '2', '1');
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
INSERT INTO `rule` VALUES ('78', '12', '8', '1');
INSERT INTO `rule` VALUES ('79', '8', '8', '1');
INSERT INTO `rule` VALUES ('80', '12', '10', '1');
INSERT INTO `rule` VALUES ('81', '12', '9', '1');
INSERT INTO `rule` VALUES ('82', '12', '11', '1');
INSERT INTO `rule` VALUES ('83', '12', '16', '1');
INSERT INTO `rule` VALUES ('84', '12', '17', '1');
INSERT INTO `rule` VALUES ('85', '8', '2', '1');
INSERT INTO `rule` VALUES ('86', '8', '18', '1');
INSERT INTO `rule` VALUES ('87', '3', '2', '1');
INSERT INTO `rule` VALUES ('88', '13', '1', '1');

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
) ENGINE=InnoDB AUTO_INCREMENT=767 DEFAULT CHARSET=utf8 COMMENT='ตารางเก็บประวัติการทำงาน';

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
INSERT INTO `timeline` VALUES ('177', null, 'MFzzD00Me92O7h2Jy0vzHu', '3', '12', 'สั่งผลิต', '2021-05-10 09:08:25', 'งานพิมพ์', '0');
INSERT INTO `timeline` VALUES ('178', null, '2hhEmcmI5HiRzfrZUDbcpd', '3', '12', 'สั่งผลิต', '2021-05-10 09:09:23', 'งานพิมพ์', '0');
INSERT INTO `timeline` VALUES ('179', null, 'KpZoS2n0XXjgWrCvn1MOKS', '3', '12', 'สั่งผลิต', '2021-05-10 09:15:17', 'งานพิมพ์', '0');
INSERT INTO `timeline` VALUES ('180', null, 'X77vrRC85W3ppSbUrwoP43', '3', '12', 'สั่งผลิต', '2021-05-10 09:16:53', 'งานพิมพ์', '0');
INSERT INTO `timeline` VALUES ('181', null, 'm0KhYK9RmwgVOGo-0MmlhG', '3', '12', 'สั่งผลิต', '2021-05-10 09:18:00', 'งานพิมพ์', '0');
INSERT INTO `timeline` VALUES ('182', null, '5UMnCH7Tp8ts2NPVTq8b7I', '1', '8', 'บันทึกข้อมูลการรับงาน', '2021-05-10 10:19:01', 'กราฟิก,บัญชี', '0');
INSERT INTO `timeline` VALUES ('183', null, '5UMnCH7Tp8ts2NPVTq8b7I', '4', '9', 'รับงาน', '2021-05-10 10:39:08', 'กราฟิก / ออกแบบ', '0');
INSERT INTO `timeline` VALUES ('184', null, 'ceO-2fQclNvEJwDd4S7jIy', '4', '9', 'รับงาน', '2021-05-10 10:41:50', 'กราฟิก / ออกแบบ', '0');
INSERT INTO `timeline` VALUES ('185', null, 'ASSAjitIb9LjfuW4kfBfqk', '4', '9', 'รับงาน', '2021-05-10 10:44:13', 'กราฟิก / ออกแบบ', '0');
INSERT INTO `timeline` VALUES ('186', null, 'u7i2Oit-QdjVBf26oA2LM5', '1', '8', 'บันทึกข้อมูลการรับงาน', '2021-05-10 13:33:26', 'กราฟิก,บัญชี', '0');
INSERT INTO `timeline` VALUES ('187', null, 'kUH617ueCSMo-_c7ONrmLW', '1', '8', 'ยกเลิกงาน', '2021-05-10 14:22:13', 'ยกเลิกงาน', '2');
INSERT INTO `timeline` VALUES ('188', null, 'Nm8YXtbe5__ByiIayzf8KA', '1', '8', 'บันทึกข้อมูลการรับงาน', '2021-05-10 14:39:03', 'กราฟิก,บัญชี', '0');
INSERT INTO `timeline` VALUES ('190', null, '0a4gSaSnJl_Hz8SJsWjb2G', '1', '8', 'บันทึกข้อมูลการรับงาน', '2021-05-10 15:19:42', 'กราฟิก,บัญชี', '0');
INSERT INTO `timeline` VALUES ('191', null, '7qdguXaqdFQZJR_asF_UfQ', '1', '8', 'บันทึกข้อมูลการรับงาน', '2021-05-10 15:52:20', 'กราฟิก,บัญชี', '0');
INSERT INTO `timeline` VALUES ('192', null, 'XMXoW-yaSzIWCiUTtjiXFW', '1', '8', 'บันทึกข้อมูลการรับงาน', '2021-05-10 15:58:31', 'กราฟิก,บัญชี', '0');
INSERT INTO `timeline` VALUES ('194', null, '_HTbSTzcnu_8YXRiOHbn-W', '1', '8', 'บันทึกข้อมูลการรับงาน', '2021-05-10 16:47:57', 'กราฟิก,บัญชี', '0');
INSERT INTO `timeline` VALUES ('195', null, 'DyGy_kfng8CV9Jnd-DKGxK', '5', '13', 'รับงาน', '2021-05-10 20:06:35', 'งานพิมพ์(รับงาน)', '0');
INSERT INTO `timeline` VALUES ('196', null, 'DyGy_kfng8CV9Jnd-DKGxK', '5', '13', 'ยืนยันการผลิต', '2021-05-10 20:06:49', 'งานพิมพ์(งานผลิตเสร็จแล้ว)', '0');
INSERT INTO `timeline` VALUES ('197', null, 'X77vrRC85W3ppSbUrwoP43', '5', '13', 'รับงาน', '2021-05-10 20:11:57', 'งานพิมพ์(รับงาน)', '0');
INSERT INTO `timeline` VALUES ('198', null, 'X77vrRC85W3ppSbUrwoP43', '5', '13', 'ยืนยันการผลิต', '2021-05-10 20:12:13', 'งานพิมพ์(งานผลิตเสร็จแล้ว)', '0');
INSERT INTO `timeline` VALUES ('199', null, '2hhEmcmI5HiRzfrZUDbcpd', '5', '13', 'รับงาน', '2021-05-10 20:12:45', 'งานพิมพ์(รับงาน)', '0');
INSERT INTO `timeline` VALUES ('200', null, '2hhEmcmI5HiRzfrZUDbcpd', '5', '13', 'ยืนยันการผลิต', '2021-05-10 20:12:52', 'งานพิมพ์(งานผลิตเสร็จแล้ว)', '0');
INSERT INTO `timeline` VALUES ('201', null, 'KpZoS2n0XXjgWrCvn1MOKS', '5', '13', 'รับงาน', '2021-05-10 20:13:13', 'งานพิมพ์(รับงาน)', '0');
INSERT INTO `timeline` VALUES ('202', null, 'KpZoS2n0XXjgWrCvn1MOKS', '5', '13', 'ยืนยันการผลิต', '2021-05-10 20:13:16', 'งานพิมพ์(งานผลิตเสร็จแล้ว)', '0');
INSERT INTO `timeline` VALUES ('203', null, 'MFzzD00Me92O7h2Jy0vzHu', '5', '13', 'รับงาน', '2021-05-10 20:13:47', 'งานพิมพ์(รับงาน)', '0');
INSERT INTO `timeline` VALUES ('204', null, 'm0KhYK9RmwgVOGo-0MmlhG', '5', '13', 'รับงาน', '2021-05-10 20:13:59', 'งานพิมพ์(รับงาน)', '0');
INSERT INTO `timeline` VALUES ('205', null, '-D3HjJnBYj_bngAK3ut3Nc', '5', '13', 'รับงาน', '2021-05-10 20:15:46', 'งานพิมพ์(รับงาน)', '0');
INSERT INTO `timeline` VALUES ('206', null, '-D3HjJnBYj_bngAK3ut3Nc', '5', '13', 'ยืนยันการผลิต', '2021-05-10 20:15:51', 'งานพิมพ์(งานผลิตเสร็จแล้ว)', '0');
INSERT INTO `timeline` VALUES ('207', null, '7qdguXaqdFQZJR_asF_UfQ', '4', '9', 'รับงาน', '2021-05-11 08:27:03', 'กราฟิก / ออกแบบ', '0');
INSERT INTO `timeline` VALUES ('208', null, 'XMXoW-yaSzIWCiUTtjiXFW', '4', '9', 'รับงาน', '2021-05-11 08:28:11', 'กราฟิก / ออกแบบ', '0');
INSERT INTO `timeline` VALUES ('209', null, '76hIJ7ACiXmWpNWvGLspUW', '5', '13', 'ยืนยันการผลิต', '2021-05-11 08:38:31', 'งานพิมพ์(งานผลิตเสร็จแล้ว)', '0');
INSERT INTO `timeline` VALUES ('210', null, 'm0KhYK9RmwgVOGo-0MmlhG', '5', '13', 'ยืนยันการผลิต', '2021-05-11 08:38:57', 'งานพิมพ์(งานผลิตเสร็จแล้ว)', '0');
INSERT INTO `timeline` VALUES ('211', null, 'u7i2Oit-QdjVBf26oA2LM5', '4', '9', 'รับงาน', '2021-05-11 08:57:40', 'กราฟิก / ออกแบบ', '0');
INSERT INTO `timeline` VALUES ('212', null, 'Nm8YXtbe5__ByiIayzf8KA', '4', '9', 'รับงาน', '2021-05-11 08:59:20', 'กราฟิก / ออกแบบ', '0');
INSERT INTO `timeline` VALUES ('213', null, '_HTbSTzcnu_8YXRiOHbn-W', '4', '9', 'รับงาน', '2021-05-11 08:59:55', 'กราฟิก / ออกแบบ', '0');
INSERT INTO `timeline` VALUES ('214', null, 'MFzzD00Me92O7h2Jy0vzHu', '5', '13', 'ยืนยันการผลิต', '2021-05-11 09:49:38', 'งานพิมพ์(งานผลิตเสร็จแล้ว)', '0');
INSERT INTO `timeline` VALUES ('215', null, 'QSLbWxE12CQGIwWMDl9pGb', '1', '8', 'บันทึกข้อมูลการรับงาน', '2021-05-11 09:57:54', 'กราฟิก,บัญชี', '0');
INSERT INTO `timeline` VALUES ('216', null, 'WQGXPhm9vwlsfnZA11AWaY', '3', '12', 'สั่งผลิต', '2021-05-11 10:25:58', 'งานพิมพ์,CNC / Laser', '0');
INSERT INTO `timeline` VALUES ('217', null, '6sPLpN7SmjvQLLKoafR940', '1', '16', 'บันทึกข้อมูลการรับงาน', '2021-05-11 10:28:15', 'กราฟิก', '0');
INSERT INTO `timeline` VALUES ('218', null, '6sPLpN7SmjvQLLKoafR940', '3', '12', 'สั่งผลิต', '2021-05-11 10:34:50', 'งานพิมพ์,CNC / Laser,ผลิตทั่วไป', '0');
INSERT INTO `timeline` VALUES ('219', null, 'ASSAjitIb9LjfuW4kfBfqk', '3', '12', 'สั่งผลิต', '2021-05-11 10:40:37', 'งานพิมพ์,CNC / Laser,ผลิตทั่วไป', '0');
INSERT INTO `timeline` VALUES ('220', null, 'rJAJa1zr9t8YihRUh5yKM6', '3', '12', 'สั่งผลิต', '2021-05-11 10:43:13', 'CNC / Laser', '0');
INSERT INTO `timeline` VALUES ('221', null, '6sPLpN7SmjvQLLKoafR940', '7', '16', 'รับงาน', '2021-05-11 11:04:24', 'ผลิตทั่วไป(รับงาน)', '0');
INSERT INTO `timeline` VALUES ('222', null, '6sPLpN7SmjvQLLKoafR940', '7', '16', 'ยืนยันการผลิต', '2021-05-11 11:04:26', 'ผลิตทั่วไป(งานผลิตเสร็จแล้ว)', '0');
INSERT INTO `timeline` VALUES ('223', null, '6sPLpN7SmjvQLLKoafR940', '2', '16', 'ลงคิวงานติดตั้ง', '2021-05-11 11:04:52', 'การตลาด(ลงคิวงาน)', '0');
INSERT INTO `timeline` VALUES ('224', null, '6sPLpN7SmjvQLLKoafR940', '8', '16', 'รับงาน', '2021-05-11 11:05:01', 'ช่างติดตั้ง(รับงาน)', '0');
INSERT INTO `timeline` VALUES ('225', null, '6sPLpN7SmjvQLLKoafR940', '8', '16', 'ติดตั้งงานลูกค้า', '2021-05-11 11:05:05', 'ช่างติดตั้ง(ส่งงานลูกค้า)', '0');
INSERT INTO `timeline` VALUES ('226', null, 'n3TfnfxsKFdQQFeDT5AEVI', '1', '8', 'บันทึกข้อมูลการรับงาน', '2021-05-11 11:11:09', 'กราฟิก,บัญชี', '0');
INSERT INTO `timeline` VALUES ('227', null, 'ceO-2fQclNvEJwDd4S7jIy', '3', '12', 'สั่งผลิต', '2021-05-11 11:12:07', 'งานพิมพ์,CNC / Laser', '0');
INSERT INTO `timeline` VALUES ('228', null, 'LTJBdwfKR1fPJgSt96JA-c', '1', '16', 'บันทึกข้อมูลการรับงาน', '2021-05-11 11:21:02', 'กราฟิก', '0');
INSERT INTO `timeline` VALUES ('229', null, 'Qe-0jK3dcpTUbSEu8NCm_D', '1', '16', 'บันทึกข้อมูลการรับงาน', '2021-05-11 11:28:12', 'กราฟิก', '0');
INSERT INTO `timeline` VALUES ('230', null, 'Qe-0jK3dcpTUbSEu8NCm_D', '3', '16', 'สั่งผลิต', '2021-05-11 11:29:47', 'งานพิมพ์,CNC / Laser,ผลิตทั่วไป', '0');
INSERT INTO `timeline` VALUES ('231', null, 'QSLbWxE12CQGIwWMDl9pGb', '3', '12', 'สั่งผลิต', '2021-05-11 11:32:54', 'งานพิมพ์,CNC / Laser,ผลิตทั่วไป', '0');
INSERT INTO `timeline` VALUES ('232', null, 'Nm8YXtbe5__ByiIayzf8KA', '3', '12', 'สั่งผลิต', '2021-05-11 11:35:33', 'งานพิมพ์,CNC / Laser,ผลิตทั่วไป', '0');
INSERT INTO `timeline` VALUES ('233', null, '9lLpBEMv3URV9CIKowTvtp', '1', '8', 'บันทึกข้อมูลการรับงาน', '2021-05-11 13:12:13', 'บัญชี', '0');
INSERT INTO `timeline` VALUES ('234', null, 'EHtNT9tpNc1i28UkoTlfXb', '1', '8', 'บันทึกข้อมูลการรับงาน', '2021-05-11 13:45:26', 'กราฟิก,บัญชี', '0');
INSERT INTO `timeline` VALUES ('235', null, 'LTJBdwfKR1fPJgSt96JA-c', '3', '16', 'สั่งผลิต', '2021-05-11 13:55:26', 'งานพิมพ์,CNC / Laser,ผลิตทั่วไป', '0');
INSERT INTO `timeline` VALUES ('236', null, '9lLpBEMv3URV9CIKowTvtp', '4', '9', 'รับงาน', '2021-05-11 14:16:39', 'กราฟิก / ออกแบบ', '0');
INSERT INTO `timeline` VALUES ('237', null, '0a4gSaSnJl_Hz8SJsWjb2G', '4', '9', 'รับงาน', '2021-05-11 14:21:10', 'กราฟิก / ออกแบบ', '0');
INSERT INTO `timeline` VALUES ('238', null, 'QSLbWxE12CQGIwWMDl9pGb', '4', '9', 'รับงาน', '2021-05-11 14:26:03', 'กราฟิก / ออกแบบ', '0');
INSERT INTO `timeline` VALUES ('239', null, 'n3TfnfxsKFdQQFeDT5AEVI', '4', '9', 'รับงาน', '2021-05-11 14:45:38', 'กราฟิก / ออกแบบ', '0');
INSERT INTO `timeline` VALUES ('240', null, 'EHtNT9tpNc1i28UkoTlfXb', '4', '9', 'รับงาน', '2021-05-11 14:45:59', 'กราฟิก / ออกแบบ', '0');
INSERT INTO `timeline` VALUES ('241', null, 'H5O9zgJoDb6GiMH_xX4mPE', '12', '1', 'ส่งมอบงานลูกค้า', '2021-05-11 15:21:55', 'ส่งมอบงานลูกค้า', '0');
INSERT INTO `timeline` VALUES ('242', null, 'HQcTSNCNtgc3SWwo5aAeAE', '12', '1', 'ส่งมอบงานลูกค้า', '2021-05-11 15:22:53', 'ส่งมอบงานลูกค้า', '0');
INSERT INTO `timeline` VALUES ('243', null, 'W_Dy_0CqF2px9NwnokjDCE', '12', '8', 'ส่งมอบงานลูกค้า', '2021-05-11 15:25:58', 'ส่งมอบงานลูกค้า', '0');
INSERT INTO `timeline` VALUES ('244', null, 'LpFjgcw2rQ7R8maXPwoNE6', '12', '8', 'ส่งมอบงานลูกค้า', '2021-05-11 15:26:01', 'ส่งมอบงานลูกค้า', '0');
INSERT INTO `timeline` VALUES ('245', null, '80WMVrjv2tuVl5n9cC_CKy', '12', '8', 'ส่งมอบงานลูกค้า', '2021-05-11 15:26:04', 'ส่งมอบงานลูกค้า', '0');
INSERT INTO `timeline` VALUES ('246', null, 'Yf5vTaeciRsnZN5M-I9sLI', '12', '8', 'ส่งมอบงานลูกค้า', '2021-05-11 15:26:06', 'ส่งมอบงานลูกค้า', '0');
INSERT INTO `timeline` VALUES ('247', null, '76hIJ7ACiXmWpNWvGLspUW', '12', '8', 'ส่งมอบงานลูกค้า', '2021-05-11 15:26:11', 'ส่งมอบงานลูกค้า', '0');
INSERT INTO `timeline` VALUES ('248', null, '_TDDyi2XV9OSkAs_phSlcX', '12', '8', 'ส่งมอบงานลูกค้า', '2021-05-11 15:26:15', 'ส่งมอบงานลูกค้า', '0');
INSERT INTO `timeline` VALUES ('249', null, 'aqoqo21ctwWwK8PhqFKfqs', '12', '8', 'ส่งมอบงานลูกค้า', '2021-05-11 15:26:18', 'ส่งมอบงานลูกค้า', '0');
INSERT INTO `timeline` VALUES ('250', null, '1-deFHIsDp8UH_1LfynQ33', '12', '8', 'ส่งมอบงานลูกค้า', '2021-05-11 15:26:21', 'ส่งมอบงานลูกค้า', '0');
INSERT INTO `timeline` VALUES ('251', null, 'l7bbwQI9C4UqeU9f7nnwZB', '12', '8', 'ส่งมอบงานลูกค้า', '2021-05-11 15:26:24', 'ส่งมอบงานลูกค้า', '0');
INSERT INTO `timeline` VALUES ('252', null, 'ZJpRfgA-Sg1-iQ0c_lFTPA', '12', '8', 'ส่งมอบงานลูกค้า', '2021-05-11 15:27:36', 'ส่งมอบงานลูกค้า', '0');
INSERT INTO `timeline` VALUES ('253', null, 'Pel7uZlkWv70QlEM7N_lKb', '12', '8', 'ส่งมอบงานลูกค้า', '2021-05-11 15:27:52', 'ส่งมอบงานลูกค้า', '0');
INSERT INTO `timeline` VALUES ('254', null, 'BdSi1aloNqzKqs1dRzh_Mb', '12', '8', 'ส่งมอบงานลูกค้า', '2021-05-11 15:27:57', 'ส่งมอบงานลูกค้า', '0');
INSERT INTO `timeline` VALUES ('255', null, 'JK9-EvGZcUUQ_i7KnFAycm', '12', '8', 'ส่งมอบงานลูกค้า', '2021-05-11 15:28:02', 'ส่งมอบงานลูกค้า', '0');
INSERT INTO `timeline` VALUES ('256', null, 'kLtTSk2dfLXj3wJUeKAQdV', '12', '8', 'ส่งมอบงานลูกค้า', '2021-05-11 15:28:05', 'ส่งมอบงานลูกค้า', '0');
INSERT INTO `timeline` VALUES ('257', null, 'DyGy_kfng8CV9Jnd-DKGxK', '12', '8', 'ส่งมอบงานลูกค้า', '2021-05-11 15:28:09', 'ส่งมอบงานลูกค้า', '0');
INSERT INTO `timeline` VALUES ('258', null, 'uy0t1Xm7NfCoTw2rD1zKU9', '12', '8', 'ส่งมอบงานลูกค้า', '2021-05-11 15:28:12', 'ส่งมอบงานลูกค้า', '0');
INSERT INTO `timeline` VALUES ('259', null, '2hhEmcmI5HiRzfrZUDbcpd', '12', '8', 'ส่งมอบงานลูกค้า', '2021-05-11 15:28:19', 'ส่งมอบงานลูกค้า', '0');
INSERT INTO `timeline` VALUES ('260', null, 'lqPKHuXygVGDIpYsyI9kt7', '12', '8', 'ส่งมอบงานลูกค้า', '2021-05-11 15:28:22', 'ส่งมอบงานลูกค้า', '0');
INSERT INTO `timeline` VALUES ('261', null, 'rJAJa1zr9t8YihRUh5yKM6', '12', '8', 'ส่งมอบงานลูกค้า', '2021-05-11 15:28:25', 'ส่งมอบงานลูกค้า', '0');
INSERT INTO `timeline` VALUES ('262', null, 'X77vrRC85W3ppSbUrwoP43', '12', '8', 'ส่งมอบงานลูกค้า', '2021-05-11 15:28:37', 'ส่งมอบงานลูกค้า', '0');
INSERT INTO `timeline` VALUES ('263', null, 'm0KhYK9RmwgVOGo-0MmlhG', '12', '8', 'ส่งมอบงานลูกค้า', '2021-05-11 15:28:39', 'ส่งมอบงานลูกค้า', '0');
INSERT INTO `timeline` VALUES ('264', null, '7qdguXaqdFQZJR_asF_UfQ', '12', '8', 'ส่งมอบงานลูกค้า', '2021-05-11 15:28:57', 'ส่งมอบงานลูกค้า', '0');
INSERT INTO `timeline` VALUES ('265', null, '6sPLpN7SmjvQLLKoafR940', '12', '8', 'ส่งมอบงานลูกค้า', '2021-05-11 15:29:05', 'ส่งมอบงานลูกค้า', '0');
INSERT INTO `timeline` VALUES ('266', null, 'LTJBdwfKR1fPJgSt96JA-c', '2', '1', 'ลงคิวงานติดตั้ง', '2021-05-11 15:30:26', 'การตลาด(ลงคิวงาน)', '0');
INSERT INTO `timeline` VALUES ('267', null, '9lLpBEMv3URV9CIKowTvtp', '3', '1', 'สั่งผลิต', '2021-05-11 15:31:09', 'งานพิมพ์,CNC / Laser,ผลิตทั่วไป', '0');
INSERT INTO `timeline` VALUES ('268', null, 'KpZoS2n0XXjgWrCvn1MOKS', '12', '8', 'ส่งมอบงานลูกค้า', '2021-05-11 15:33:34', 'ส่งมอบงานลูกค้า', '0');
INSERT INTO `timeline` VALUES ('269', null, 'XMXoW-yaSzIWCiUTtjiXFW', '3', '12', 'สั่งผลิต', '2021-05-11 15:33:39', 'งานพิมพ์,CNC / Laser', '0');
INSERT INTO `timeline` VALUES ('270', null, 'lqPKHuXygVGDIpYsyI9kt7', '3', '1', 'สั่งผลิต', '2021-05-11 15:40:29', 'งานพิมพ์', '0');
INSERT INTO `timeline` VALUES ('271', null, 'u7i2Oit-QdjVBf26oA2LM5', '3', '1', 'สั่งผลิต', '2021-05-11 15:40:57', 'CNC / Laser', '0');
INSERT INTO `timeline` VALUES ('272', null, 'Qe-0jK3dcpTUbSEu8NCm_D', '12', '16', 'ส่งมอบงานลูกค้า', '2021-05-11 15:41:00', 'ส่งมอบงานลูกค้า', '0');
INSERT INTO `timeline` VALUES ('273', null, 'LTJBdwfKR1fPJgSt96JA-c', '12', '16', 'ส่งมอบงานลูกค้า', '2021-05-11 15:41:15', 'ส่งมอบงานลูกค้า', '0');
INSERT INTO `timeline` VALUES ('274', null, 'u7i2Oit-QdjVBf26oA2LM5', '6', '1', 'รับงาน', '2021-05-11 15:41:49', 'CNC / Laser(รับงาน)', '0');
INSERT INTO `timeline` VALUES ('275', null, 'u7i2Oit-QdjVBf26oA2LM5', '6', '1', 'ส่งแก้ไขงาน', '2021-05-11 15:41:53', 'cnc / laser(ส่งแก้ไข กราฟิก / ออกแบบ)', '0');
INSERT INTO `timeline` VALUES ('276', null, 'ASSAjitIb9LjfuW4kfBfqk', '6', '1', 'รับงาน', '2021-05-11 15:42:07', 'CNC / Laser(รับงาน)', '0');
INSERT INTO `timeline` VALUES ('277', null, 'Qe-0jK3dcpTUbSEu8NCm_D', '2', '16', 'ลงคิวงานติดตั้ง', '2021-05-11 15:43:38', 'การตลาด(ลงคิวงาน)', '0');
INSERT INTO `timeline` VALUES ('278', null, 'lqPKHuXygVGDIpYsyI9kt7', '2', '16', 'ลงคิวงานติดตั้ง', '2021-05-11 15:43:44', 'การตลาด(ลงคิวงาน)', '0');
INSERT INTO `timeline` VALUES ('279', null, 'LTJBdwfKR1fPJgSt96JA-c', '8', '16', 'รับงาน', '2021-05-11 15:50:30', 'ช่างติดตั้ง(รับงาน)', '0');
INSERT INTO `timeline` VALUES ('280', null, 'LTJBdwfKR1fPJgSt96JA-c', '8', '16', 'ติดตั้งงานลูกค้า', '2021-05-11 15:50:36', 'ช่างติดตั้ง(ส่งงานลูกค้า)', '0');
INSERT INTO `timeline` VALUES ('281', null, 'Qe-0jK3dcpTUbSEu8NCm_D', '8', '16', 'รับงาน', '2021-05-11 15:50:40', 'ช่างติดตั้ง(รับงาน)', '0');
INSERT INTO `timeline` VALUES ('282', null, 'Qe-0jK3dcpTUbSEu8NCm_D', '8', '16', 'ติดตั้งงานลูกค้า', '2021-05-11 15:50:43', 'ช่างติดตั้ง(ส่งงานลูกค้า)', '0');
INSERT INTO `timeline` VALUES ('283', null, 'lqPKHuXygVGDIpYsyI9kt7', '8', '16', 'รับงาน', '2021-05-11 15:50:48', 'ช่างติดตั้ง(รับงาน)', '0');
INSERT INTO `timeline` VALUES ('284', null, 'lqPKHuXygVGDIpYsyI9kt7', '8', '16', 'ติดตั้งงานลูกค้า', '2021-05-11 15:50:51', 'ช่างติดตั้ง(ส่งงานลูกค้า)', '0');
INSERT INTO `timeline` VALUES ('285', null, 'jGzP_OORkZdjjEm2vxpLmd', '1', '1', 'บันทึกข้อมูลการรับงาน', '2021-05-11 15:59:15', 'กราฟิก', '0');
INSERT INTO `timeline` VALUES ('286', null, 'jGzP_OORkZdjjEm2vxpLmd', '3', '1', 'ส่งผลิตนอกร้าน / บัญชี(ตามงาน)', '2021-05-11 15:59:54', 'กราฟิก / ออกปบบ', '0');
INSERT INTO `timeline` VALUES ('287', null, 'jGzP_OORkZdjjEm2vxpLmd', '2', '1', 'ลงคิวงานติดตั้ง', '2021-05-11 16:01:55', 'การตลาด(ลงคิวงาน)', '0');
INSERT INTO `timeline` VALUES ('288', null, 'jGzP_OORkZdjjEm2vxpLmd', '8', '1', 'รับงาน', '2021-05-11 16:02:10', 'ช่างติดตั้ง(รับงาน)', '0');
INSERT INTO `timeline` VALUES ('289', null, 'jGzP_OORkZdjjEm2vxpLmd', '12', '1', 'ส่งมอบงานลูกค้า', '2021-05-11 16:02:32', 'ส่งมอบงานลูกค้า', '0');
INSERT INTO `timeline` VALUES ('290', null, 'd3EZeq2qOc1sfftpV5q19D', '4', '9', 'รับงาน', '2021-05-12 17:04:36', 'กราฟิก / ออกแบบ', '0');
INSERT INTO `timeline` VALUES ('291', null, 'u7i2Oit-QdjVBf26oA2LM5', '12', '8', 'ส่งมอบงานลูกค้า', '2021-05-11 16:26:16', 'ส่งมอบงานลูกค้า', '0');
INSERT INTO `timeline` VALUES ('292', null, '0a4gSaSnJl_Hz8SJsWjb2G', '12', '8', 'ส่งมอบงานลูกค้า', '2021-05-11 16:26:52', 'ส่งมอบงานลูกค้า', '0');
INSERT INTO `timeline` VALUES ('293', null, 'WQGXPhm9vwlsfnZA11AWaY', '12', '8', 'ส่งมอบงานลูกค้า', '2021-05-11 16:28:12', 'ส่งมอบงานลูกค้า', '0');
INSERT INTO `timeline` VALUES ('294', null, 'ASSAjitIb9LjfuW4kfBfqk', '12', '8', 'ส่งมอบงานลูกค้า', '2021-05-11 16:28:16', 'ส่งมอบงานลูกค้า', '0');
INSERT INTO `timeline` VALUES ('295', null, 'ZJpRfgA-Sg1-iQ0c_lFTPA', '9', '8', 'ลงบันทึกเลขจัดส่ง', '2021-05-11 16:38:12', 'จัดส่ง(รับเข้าระบบ)', '0');
INSERT INTO `timeline` VALUES ('296', null, 'rJAJa1zr9t8YihRUh5yKM6', '9', '8', 'ลงบันทึกเลขจัดส่ง', '2021-05-11 16:38:37', 'จัดส่ง(รับเข้าระบบ)', '0');
INSERT INTO `timeline` VALUES ('297', null, 'BdSi1aloNqzKqs1dRzh_Mb', '9', '8', 'ลงบันทึกเลขจัดส่ง', '2021-05-11 16:39:59', 'จัดส่ง(รับเข้าระบบ)', '0');
INSERT INTO `timeline` VALUES ('298', null, '2hhEmcmI5HiRzfrZUDbcpd', '9', '8', 'ลงบันทึกเลขจัดส่ง', '2021-05-11 16:41:59', 'จัดส่ง(รับเข้าระบบ)', '0');
INSERT INTO `timeline` VALUES ('299', null, 'DyGy_kfng8CV9Jnd-DKGxK', '9', '8', 'ลงบันทึกเลขจัดส่ง', '2021-05-11 16:43:18', 'จัดส่ง(รับเข้าระบบ)', '0');
INSERT INTO `timeline` VALUES ('300', null, 'WQGXPhm9vwlsfnZA11AWaY', '9', '8', 'ลงบันทึกเลขจัดส่ง', '2021-05-11 16:44:56', 'จัดส่ง(รับเข้าระบบ)', '0');
INSERT INTO `timeline` VALUES ('301', null, 'ASSAjitIb9LjfuW4kfBfqk', '9', '8', 'ลงบันทึกเลขจัดส่ง', '2021-05-11 16:46:56', 'จัดส่ง(รับเข้าระบบ)', '0');
INSERT INTO `timeline` VALUES ('302', null, 'n3TfnfxsKFdQQFeDT5AEVI', '3', '12', 'สั่งผลิต', '2021-05-11 16:48:12', 'งานพิมพ์,ผลิตทั่วไป', '0');
INSERT INTO `timeline` VALUES ('303', null, '_kn8kDdx84Qpsh3jCEO0cP', '3', '12', 'สั่งผลิต', '2021-05-11 16:49:05', 'งานพิมพ์,CNC / Laser', '0');
INSERT INTO `timeline` VALUES ('304', null, 'ZevKuy2Fnz8Bmpa1RsXKSI', '3', '12', 'สั่งผลิต', '2021-05-11 16:50:08', 'งานพิมพ์,ผลิตทั่วไป', '0');
INSERT INTO `timeline` VALUES ('305', null, 'lER6-HE2lJwDeTY21TlJ6s', '3', '12', 'สั่งผลิต', '2021-05-11 16:51:23', 'งานพิมพ์,ผลิตทั่วไป', '0');
INSERT INTO `timeline` VALUES ('306', null, '7qdguXaqdFQZJR_asF_UfQ', '3', '12', 'สั่งผลิต', '2021-05-11 16:53:38', 'งานพิมพ์', '0');
INSERT INTO `timeline` VALUES ('307', null, 'EHtNT9tpNc1i28UkoTlfXb', '3', '17', 'สั่งผลิต', '2021-05-11 17:05:14', 'งานพิมพ์,CNC / Laser', '0');
INSERT INTO `timeline` VALUES ('308', null, '0a4gSaSnJl_Hz8SJsWjb2G', '3', '1', 'สั่งผลิต', '2021-05-11 17:09:15', 'งานพิมพ์,CNC / Laser', '0');
INSERT INTO `timeline` VALUES ('309', null, 'ZevKuy2Fnz8Bmpa1RsXKSI', '5', '1', 'รับงาน', '2021-05-11 17:38:04', 'งานพิมพ์(รับงาน)', '0');
INSERT INTO `timeline` VALUES ('310', null, 'ZevKuy2Fnz8Bmpa1RsXKSI', '5', '1', 'ยืนยันการผลิต', '2021-05-11 17:38:09', 'งานพิมพ์(งานผลิตเสร็จแล้ว)', '0');
INSERT INTO `timeline` VALUES ('311', null, '9lLpBEMv3URV9CIKowTvtp', '5', '1', 'รับงาน', '2021-05-11 17:38:25', 'งานพิมพ์(รับงาน)', '0');
INSERT INTO `timeline` VALUES ('312', null, '9lLpBEMv3URV9CIKowTvtp', '5', '1', 'ยืนยันการผลิต', '2021-05-11 17:38:37', 'งานพิมพ์(งานผลิตเสร็จแล้ว)', '0');
INSERT INTO `timeline` VALUES ('313', null, 'lqPKHuXygVGDIpYsyI9kt7', '5', '1', 'รับงาน', '2021-05-11 17:39:06', 'งานพิมพ์(รับงาน)', '0');
INSERT INTO `timeline` VALUES ('314', null, 'lqPKHuXygVGDIpYsyI9kt7', '5', '1', 'ยืนยันการผลิต', '2021-05-11 17:39:10', 'งานพิมพ์(งานผลิตเสร็จแล้ว)', '0');
INSERT INTO `timeline` VALUES ('315', null, 'Qe-0jK3dcpTUbSEu8NCm_D', '5', '1', 'รับงาน', '2021-05-11 17:39:37', 'งานพิมพ์(รับงาน)', '0');
INSERT INTO `timeline` VALUES ('316', null, 'Qe-0jK3dcpTUbSEu8NCm_D', '5', '1', 'ยืนยันการผลิต', '2021-05-11 17:39:42', 'งานพิมพ์(งานผลิตเสร็จแล้ว)', '0');
INSERT INTO `timeline` VALUES ('317', null, 'Qe-0jK3dcpTUbSEu8NCm_D', '5', '1', 'ยืนยันการผลิต', '2021-05-11 17:39:42', 'งานพิมพ์(งานผลิตเสร็จแล้ว)', '0');
INSERT INTO `timeline` VALUES ('318', null, '0a4gSaSnJl_Hz8SJsWjb2G', '5', '1', 'รับงาน', '2021-05-11 17:39:55', 'งานพิมพ์(รับงาน)', '0');
INSERT INTO `timeline` VALUES ('319', null, '0a4gSaSnJl_Hz8SJsWjb2G', '5', '1', 'ยืนยันการผลิต', '2021-05-11 17:40:07', 'งานพิมพ์(งานผลิตเสร็จแล้ว)', '0');
INSERT INTO `timeline` VALUES ('320', null, '6sPLpN7SmjvQLLKoafR940', '5', '1', 'รับงาน', '2021-05-11 17:40:45', 'งานพิมพ์(รับงาน)', '0');
INSERT INTO `timeline` VALUES ('321', null, 'lER6-HE2lJwDeTY21TlJ6s', '5', '13', 'รับงาน', '2021-05-11 17:42:26', 'งานพิมพ์(รับงาน)', '0');
INSERT INTO `timeline` VALUES ('322', null, 'lER6-HE2lJwDeTY21TlJ6s', '5', '13', 'ยืนยันการผลิต', '2021-05-11 17:42:29', 'งานพิมพ์(งานผลิตเสร็จแล้ว)', '0');
INSERT INTO `timeline` VALUES ('323', null, '_kn8kDdx84Qpsh3jCEO0cP', '5', '13', 'รับงาน', '2021-05-11 17:42:56', 'งานพิมพ์(รับงาน)', '0');
INSERT INTO `timeline` VALUES ('324', null, '_kn8kDdx84Qpsh3jCEO0cP', '5', '13', 'ยืนยันการผลิต', '2021-05-11 17:43:06', 'งานพิมพ์(งานผลิตเสร็จแล้ว)', '0');
INSERT INTO `timeline` VALUES ('325', null, 'WQGXPhm9vwlsfnZA11AWaY', '5', '13', 'รับงาน', '2021-05-11 17:43:29', 'งานพิมพ์(รับงาน)', '0');
INSERT INTO `timeline` VALUES ('326', null, 'WQGXPhm9vwlsfnZA11AWaY', '5', '13', 'ยืนยันการผลิต', '2021-05-11 17:43:33', 'งานพิมพ์(งานผลิตเสร็จแล้ว)', '0');
INSERT INTO `timeline` VALUES ('327', null, 'ASSAjitIb9LjfuW4kfBfqk', '5', '13', 'รับงาน', '2021-05-11 17:43:39', 'งานพิมพ์(รับงาน)', '0');
INSERT INTO `timeline` VALUES ('328', null, 'ASSAjitIb9LjfuW4kfBfqk', '5', '13', 'ยืนยันการผลิต', '2021-05-11 17:43:42', 'งานพิมพ์(งานผลิตเสร็จแล้ว)', '0');
INSERT INTO `timeline` VALUES ('329', null, 'ceO-2fQclNvEJwDd4S7jIy', '5', '13', 'รับงาน', '2021-05-11 17:43:47', 'งานพิมพ์(รับงาน)', '0');
INSERT INTO `timeline` VALUES ('330', null, 'ceO-2fQclNvEJwDd4S7jIy', '5', '13', 'ยืนยันการผลิต', '2021-05-11 17:43:51', 'งานพิมพ์(งานผลิตเสร็จแล้ว)', '0');
INSERT INTO `timeline` VALUES ('331', null, 'Nm8YXtbe5__ByiIayzf8KA', '5', '13', 'รับงาน', '2021-05-11 17:43:58', 'งานพิมพ์(รับงาน)', '0');
INSERT INTO `timeline` VALUES ('332', null, 'Nm8YXtbe5__ByiIayzf8KA', '5', '13', 'ยืนยันการผลิต', '2021-05-11 17:44:01', 'งานพิมพ์(งานผลิตเสร็จแล้ว)', '0');
INSERT INTO `timeline` VALUES ('333', null, '6sPLpN7SmjvQLLKoafR940', '5', '13', 'ยืนยันการผลิต', '2021-05-11 17:44:23', 'งานพิมพ์(งานผลิตเสร็จแล้ว)', '0');
INSERT INTO `timeline` VALUES ('334', null, '7qdguXaqdFQZJR_asF_UfQ', '5', '13', 'รับงาน', '2021-05-11 17:45:09', 'งานพิมพ์(รับงาน)', '0');
INSERT INTO `timeline` VALUES ('335', null, '7qdguXaqdFQZJR_asF_UfQ', '5', '13', 'ยืนยันการผลิต', '2021-05-11 17:45:13', 'งานพิมพ์(งานผลิตเสร็จแล้ว)', '0');
INSERT INTO `timeline` VALUES ('336', null, 'LTJBdwfKR1fPJgSt96JA-c', '5', '1', 'รับงาน', '2021-05-11 17:45:16', 'งานพิมพ์(รับงาน)', '0');
INSERT INTO `timeline` VALUES ('337', null, 'LTJBdwfKR1fPJgSt96JA-c', '5', '1', 'ยืนยันการผลิต', '2021-05-11 17:45:25', 'งานพิมพ์(งานผลิตเสร็จแล้ว)', '0');
INSERT INTO `timeline` VALUES ('338', null, 'LTJBdwfKR1fPJgSt96JA-c', '5', '1', 'ยืนยันการผลิต', '2021-05-11 17:45:25', 'งานพิมพ์(งานผลิตเสร็จแล้ว)', '0');
INSERT INTO `timeline` VALUES ('339', null, 'ZevKuy2Fnz8Bmpa1RsXKSI', '2', '8', 'ลงคิวงานติดตั้ง', '2021-05-12 08:48:15', 'การตลาด(ลงคิวงาน)', '0');
INSERT INTO `timeline` VALUES ('340', null, 'jGzP_OORkZdjjEm2vxpLmd', '8', '8', 'ติดตั้งงานลูกค้า', '2021-05-12 08:48:46', 'ช่างติดตั้ง(ส่งงานลูกค้า)', '0');
INSERT INTO `timeline` VALUES ('341', null, 'ZevKuy2Fnz8Bmpa1RsXKSI', '8', '8', 'รับงาน', '2021-05-12 08:49:00', 'ช่างติดตั้ง(รับงาน)', '0');
INSERT INTO `timeline` VALUES ('342', null, 'fU8hZ0tJOvyyp9j-LVPCge', '1', '8', 'บันทึกข้อมูลการรับงาน', '2021-05-12 08:56:55', 'กราฟิก,บัญชี', '0');
INSERT INTO `timeline` VALUES ('343', null, '7hyySzNtI_VR84GW8lXTdk', '1', '8', 'บันทึกข้อมูลการรับงาน', '2021-05-12 08:58:26', 'กราฟิก,บัญชี', '0');
INSERT INTO `timeline` VALUES ('344', null, 'hrmv4WPvcupLaEF9BnJnT0', '1', '8', 'บันทึกข้อมูลการรับงาน', '2021-05-12 08:59:24', 'บัญชี', '0');
INSERT INTO `timeline` VALUES ('345', null, 'lER6-HE2lJwDeTY21TlJ6s', '12', '8', 'ส่งมอบงานลูกค้า', '2021-05-12 09:00:57', 'ส่งมอบงานลูกค้า', '0');
INSERT INTO `timeline` VALUES ('346', null, 'CAcAJCWeZd-mKozrUigR0Q', '1', '8', 'บันทึกข้อมูลการรับงาน', '2021-05-12 09:02:10', 'กราฟิก,บัญชี', '0');
INSERT INTO `timeline` VALUES ('347', null, 'fucZblB3_4Zu2jE0a0Vnj9', '1', '8', 'บันทึกข้อมูลการรับงาน', '2021-05-12 09:03:12', 'กราฟิก,บัญชี', '0');
INSERT INTO `timeline` VALUES ('348', null, 'fU8hZ0tJOvyyp9j-LVPCge', '4', '1', 'รับงาน', '2021-05-12 09:04:49', 'กราฟิก / ออกแบบ', '0');
INSERT INTO `timeline` VALUES ('349', null, '7hyySzNtI_VR84GW8lXTdk', '4', '1', 'รับงาน', '2021-05-12 09:05:02', 'กราฟิก / ออกแบบ', '0');
INSERT INTO `timeline` VALUES ('350', null, 'hrmv4WPvcupLaEF9BnJnT0', '4', '1', 'รับงาน', '2021-05-12 09:05:12', 'กราฟิก / ออกแบบ', '0');
INSERT INTO `timeline` VALUES ('351', null, 'CAcAJCWeZd-mKozrUigR0Q', '4', '1', 'รับงาน', '2021-05-12 09:05:19', 'กราฟิก / ออกแบบ', '0');
INSERT INTO `timeline` VALUES ('352', null, 'fucZblB3_4Zu2jE0a0Vnj9', '4', '1', 'รับงาน', '2021-05-12 09:05:29', 'กราฟิก / ออกแบบ', '0');
INSERT INTO `timeline` VALUES ('353', null, 'n3TfnfxsKFdQQFeDT5AEVI', '5', '13', 'รับงาน', '2021-05-12 09:07:00', 'งานพิมพ์(รับงาน)', '0');
INSERT INTO `timeline` VALUES ('354', null, 'fU8hZ0tJOvyyp9j-LVPCge', '3', '1', 'สั่งผลิต', '2021-05-12 09:07:29', 'ผลิตทั่วไป', '0');
INSERT INTO `timeline` VALUES ('355', null, '7hyySzNtI_VR84GW8lXTdk', '3', '1', 'สั่งผลิต', '2021-05-12 09:10:28', 'ผลิตทั่วไป', '0');
INSERT INTO `timeline` VALUES ('356', null, '7hyySzNtI_VR84GW8lXTdk', '2', '17', 'ลงคิวงานติดตั้ง', '2021-05-12 09:11:03', 'การตลาด(ลงคิวงาน)', '0');
INSERT INTO `timeline` VALUES ('357', null, 'hrmv4WPvcupLaEF9BnJnT0', '3', '1', 'สั่งผลิต', '2021-05-12 09:11:09', 'ผลิตทั่วไป', '0');
INSERT INTO `timeline` VALUES ('358', null, '7hyySzNtI_VR84GW8lXTdk', '8', '2', 'รับงาน', '2021-05-12 09:11:25', 'ช่างติดตั้ง(รับงาน)', '0');
INSERT INTO `timeline` VALUES ('359', null, 'CAcAJCWeZd-mKozrUigR0Q', '3', '1', 'สั่งผลิต', '2021-05-12 09:11:56', 'ผลิตทั่วไป', '0');
INSERT INTO `timeline` VALUES ('360', null, 'fucZblB3_4Zu2jE0a0Vnj9', '3', '1', 'สั่งผลิต', '2021-05-12 09:13:22', 'ผลิตทั่วไป', '0');
INSERT INTO `timeline` VALUES ('361', null, 'hrmv4WPvcupLaEF9BnJnT0', '2', '17', 'ลงคิวงานติดตั้ง', '2021-05-12 09:18:10', 'การตลาด(ลงคิวงาน)', '0');
INSERT INTO `timeline` VALUES ('362', null, 'CAcAJCWeZd-mKozrUigR0Q', '2', '1', 'ลงคิวงานติดตั้ง', '2021-05-12 09:19:33', 'การตลาด(ลงคิวงาน)', '0');
INSERT INTO `timeline` VALUES ('363', null, 'fucZblB3_4Zu2jE0a0Vnj9', '2', '1', 'ลงคิวงานติดตั้ง', '2021-05-12 09:19:57', 'การตลาด(ลงคิวงาน)', '0');
INSERT INTO `timeline` VALUES ('364', null, 'n3TfnfxsKFdQQFeDT5AEVI', '5', '13', 'ยืนยันการผลิต', '2021-05-12 09:25:17', 'งานพิมพ์(งานผลิตเสร็จแล้ว)', '0');
INSERT INTO `timeline` VALUES ('365', null, 'hrmv4WPvcupLaEF9BnJnT0', '8', '1', 'รับงาน', '2021-05-12 09:41:58', 'ช่างติดตั้ง(รับงาน)', '0');
INSERT INTO `timeline` VALUES ('366', null, 'CAcAJCWeZd-mKozrUigR0Q', '8', '1', 'รับงาน', '2021-05-12 09:42:00', 'ช่างติดตั้ง(รับงาน)', '0');
INSERT INTO `timeline` VALUES ('367', null, 'fucZblB3_4Zu2jE0a0Vnj9', '8', '1', 'รับงาน', '2021-05-12 09:42:02', 'ช่างติดตั้ง(รับงาน)', '0');
INSERT INTO `timeline` VALUES ('368', null, 'EHtNT9tpNc1i28UkoTlfXb', '5', '13', 'รับงาน', '2021-05-12 10:05:30', 'งานพิมพ์(รับงาน)', '0');
INSERT INTO `timeline` VALUES ('369', null, 'EHtNT9tpNc1i28UkoTlfXb', '5', '13', 'ยืนยันการผลิต', '2021-05-12 10:05:48', 'งานพิมพ์(งานผลิตเสร็จแล้ว)', '0');
INSERT INTO `timeline` VALUES ('370', null, '_kn8kDdx84Qpsh3jCEO0cP', '12', '8', 'ส่งมอบงานลูกค้า', '2021-05-12 10:20:20', 'ส่งมอบงานลูกค้า', '0');
INSERT INTO `timeline` VALUES ('371', null, '72IH6IoMq2GVAY6g6j9cWI', '12', '8', 'ส่งมอบงานลูกค้า', '2021-05-12 10:20:26', 'ส่งมอบงานลูกค้า', '0');
INSERT INTO `timeline` VALUES ('372', null, 'Nm8YXtbe5__ByiIayzf8KA', '12', '8', 'ส่งมอบงานลูกค้า', '2021-05-12 10:20:31', 'ส่งมอบงานลูกค้า', '0');
INSERT INTO `timeline` VALUES ('373', null, 'pXsuTV4mAr0AU6D8F36gso', '4', '9', 'รับงาน', '2021-05-12 17:09:29', 'กราฟิก / ออกแบบ', '0');
INSERT INTO `timeline` VALUES ('374', null, 'XMXoW-yaSzIWCiUTtjiXFW', '5', '13', 'รับงาน', '2021-05-12 10:44:55', 'งานพิมพ์(รับงาน)', '0');
INSERT INTO `timeline` VALUES ('375', null, 'XMXoW-yaSzIWCiUTtjiXFW', '5', '13', 'ยืนยันการผลิต', '2021-05-12 10:45:37', 'งานพิมพ์(งานผลิตเสร็จแล้ว)', '0');
INSERT INTO `timeline` VALUES ('376', null, 'FFpCWYn5MhCGVnFFK0aK-Q', '4', '9', 'รับงาน', '2021-05-12 17:07:01', 'กราฟิก / ออกแบบ', '0');
INSERT INTO `timeline` VALUES ('377', null, '-D3HjJnBYj_bngAK3ut3Nc', '7', '15', 'รับงาน', '2021-05-12 11:01:37', 'ผลิตทั่วไป(รับงาน)', '0');
INSERT INTO `timeline` VALUES ('378', null, '', '7', '15', 'รับงาน', '2021-05-12 11:02:09', 'ผลิตทั่วไป(รับงาน)', '0');
INSERT INTO `timeline` VALUES ('379', null, '', '7', '15', 'รับงาน', '2021-05-12 11:02:17', 'ผลิตทั่วไป(รับงาน)', '0');
INSERT INTO `timeline` VALUES ('380', null, 'BdSi1aloNqzKqs1dRzh_Mb', '7', '15', 'รับงาน', '2021-05-12 11:03:00', 'ผลิตทั่วไป(รับงาน)', '0');
INSERT INTO `timeline` VALUES ('381', null, '-D3HjJnBYj_bngAK3ut3Nc', '6', '15', 'ยืนยันการผลิต', '2021-05-12 11:03:53', 'ผลิตทั่วไป(งานผลิตเสร็จแล้ว)', '0');
INSERT INTO `timeline` VALUES ('382', null, 'BdSi1aloNqzKqs1dRzh_Mb', '6', '15', 'ยืนยันการผลิต', '2021-05-12 11:04:09', 'ผลิตทั่วไป(งานผลิตเสร็จแล้ว)', '0');
INSERT INTO `timeline` VALUES ('383', null, 'LTJBdwfKR1fPJgSt96JA-c', '7', '15', 'รับงาน', '2021-05-12 11:16:49', 'ผลิตทั่วไป(รับงาน)', '0');
INSERT INTO `timeline` VALUES ('384', null, 'LTJBdwfKR1fPJgSt96JA-c', '6', '15', 'ยืนยันการผลิต', '2021-05-12 11:17:00', 'ผลิตทั่วไป(งานผลิตเสร็จแล้ว)', '0');
INSERT INTO `timeline` VALUES ('385', null, 'lER6-HE2lJwDeTY21TlJ6s', '7', '15', 'รับงาน', '2021-05-12 11:17:26', 'ผลิตทั่วไป(รับงาน)', '0');
INSERT INTO `timeline` VALUES ('386', null, 'lER6-HE2lJwDeTY21TlJ6s', '6', '15', 'ยืนยันการผลิต', '2021-05-12 11:17:37', 'ผลิตทั่วไป(งานผลิตเสร็จแล้ว)', '0');
INSERT INTO `timeline` VALUES ('387', null, 'ZevKuy2Fnz8Bmpa1RsXKSI', '7', '15', 'รับงาน', '2021-05-12 11:17:56', 'ผลิตทั่วไป(รับงาน)', '0');
INSERT INTO `timeline` VALUES ('388', null, 'ZevKuy2Fnz8Bmpa1RsXKSI', '6', '15', 'ยืนยันการผลิต', '2021-05-12 11:18:02', 'ผลิตทั่วไป(งานผลิตเสร็จแล้ว)', '0');
INSERT INTO `timeline` VALUES ('389', null, 'hrmv4WPvcupLaEF9BnJnT0', '7', '15', 'รับงาน', '2021-05-12 11:18:22', 'ผลิตทั่วไป(รับงาน)', '0');
INSERT INTO `timeline` VALUES ('390', null, 'hrmv4WPvcupLaEF9BnJnT0', '6', '15', 'ยืนยันการผลิต', '2021-05-12 11:18:32', 'ผลิตทั่วไป(งานผลิตเสร็จแล้ว)', '0');
INSERT INTO `timeline` VALUES ('391', null, 'ASSAjitIb9LjfuW4kfBfqk', '7', '15', 'รับงาน', '2021-05-12 11:18:42', 'ผลิตทั่วไป(รับงาน)', '0');
INSERT INTO `timeline` VALUES ('392', null, 'ASSAjitIb9LjfuW4kfBfqk', '6', '15', 'ยืนยันการผลิต', '2021-05-12 11:18:46', 'ผลิตทั่วไป(งานผลิตเสร็จแล้ว)', '0');
INSERT INTO `timeline` VALUES ('393', null, 'Nm8YXtbe5__ByiIayzf8KA', '7', '15', 'รับงาน', '2021-05-12 11:19:20', 'ผลิตทั่วไป(รับงาน)', '0');
INSERT INTO `timeline` VALUES ('394', null, 'Nm8YXtbe5__ByiIayzf8KA', '6', '15', 'ยืนยันการผลิต', '2021-05-12 11:19:24', 'ผลิตทั่วไป(งานผลิตเสร็จแล้ว)', '0');
INSERT INTO `timeline` VALUES ('395', null, 'fU8hZ0tJOvyyp9j-LVPCge', '7', '15', 'รับงาน', '2021-05-12 11:19:58', 'ผลิตทั่วไป(รับงาน)', '0');
INSERT INTO `timeline` VALUES ('396', null, 'fU8hZ0tJOvyyp9j-LVPCge', '6', '15', 'ยืนยันการผลิต', '2021-05-12 11:20:02', 'ผลิตทั่วไป(งานผลิตเสร็จแล้ว)', '0');
INSERT INTO `timeline` VALUES ('397', null, '7hyySzNtI_VR84GW8lXTdk', '7', '15', 'รับงาน', '2021-05-12 11:20:14', 'ผลิตทั่วไป(รับงาน)', '0');
INSERT INTO `timeline` VALUES ('398', null, '7hyySzNtI_VR84GW8lXTdk', '6', '15', 'ยืนยันการผลิต', '2021-05-12 11:20:19', 'ผลิตทั่วไป(งานผลิตเสร็จแล้ว)', '0');
INSERT INTO `timeline` VALUES ('399', null, '9lLpBEMv3URV9CIKowTvtp', '7', '15', 'รับงาน', '2021-05-12 11:20:24', 'ผลิตทั่วไป(รับงาน)', '0');
INSERT INTO `timeline` VALUES ('400', null, '9lLpBEMv3URV9CIKowTvtp', '6', '15', 'ยืนยันการผลิต', '2021-05-12 11:20:28', 'ผลิตทั่วไป(งานผลิตเสร็จแล้ว)', '0');
INSERT INTO `timeline` VALUES ('401', null, 'CAcAJCWeZd-mKozrUigR0Q', '7', '15', 'รับงาน', '2021-05-12 11:20:44', 'ผลิตทั่วไป(รับงาน)', '0');
INSERT INTO `timeline` VALUES ('402', null, 'CAcAJCWeZd-mKozrUigR0Q', '6', '15', 'ยืนยันการผลิต', '2021-05-12 11:20:48', 'ผลิตทั่วไป(งานผลิตเสร็จแล้ว)', '0');
INSERT INTO `timeline` VALUES ('403', null, 'fucZblB3_4Zu2jE0a0Vnj9', '7', '15', 'รับงาน', '2021-05-12 11:20:58', 'ผลิตทั่วไป(รับงาน)', '0');
INSERT INTO `timeline` VALUES ('404', null, 'fucZblB3_4Zu2jE0a0Vnj9', '6', '15', 'ยืนยันการผลิต', '2021-05-12 11:21:01', 'ผลิตทั่วไป(งานผลิตเสร็จแล้ว)', '0');
INSERT INTO `timeline` VALUES ('405', null, 'ZJpRfgA-Sg1-iQ0c_lFTPA', '9', '8', 'ลูกค้าได้รับสินค้าแล้ว', '2021-05-12 11:28:14', 'จัดส่ง(ยืนยันการจัดส่ง)', '0');
INSERT INTO `timeline` VALUES ('406', null, 'BdSi1aloNqzKqs1dRzh_Mb', '9', '8', 'ลูกค้าได้รับสินค้าแล้ว', '2021-05-12 11:28:17', 'จัดส่ง(ยืนยันการจัดส่ง)', '0');
INSERT INTO `timeline` VALUES ('407', null, 'DyGy_kfng8CV9Jnd-DKGxK', '9', '8', 'ลูกค้าได้รับสินค้าแล้ว', '2021-05-12 11:28:19', 'จัดส่ง(ยืนยันการจัดส่ง)', '0');
INSERT INTO `timeline` VALUES ('408', null, '2hhEmcmI5HiRzfrZUDbcpd', '9', '8', 'ลูกค้าได้รับสินค้าแล้ว', '2021-05-12 11:28:21', 'จัดส่ง(ยืนยันการจัดส่ง)', '0');
INSERT INTO `timeline` VALUES ('409', null, 'rJAJa1zr9t8YihRUh5yKM6', '9', '8', 'ลูกค้าได้รับสินค้าแล้ว', '2021-05-12 11:28:23', 'จัดส่ง(ยืนยันการจัดส่ง)', '0');
INSERT INTO `timeline` VALUES ('410', null, 'WQGXPhm9vwlsfnZA11AWaY', '9', '8', 'ลูกค้าได้รับสินค้าแล้ว', '2021-05-12 11:28:26', 'จัดส่ง(ยืนยันการจัดส่ง)', '0');
INSERT INTO `timeline` VALUES ('411', null, 'ASSAjitIb9LjfuW4kfBfqk', '9', '8', 'ลูกค้าได้รับสินค้าแล้ว', '2021-05-12 11:28:28', 'จัดส่ง(ยืนยันการจัดส่ง)', '0');
INSERT INTO `timeline` VALUES ('412', null, 'hOUdPv_zaMEEKvcHnpsMx0', '1', '1', 'บันทึกข้อมูลการรับงาน', '2021-05-12 13:32:12', 'กราฟิก,บัญชี', '0');
INSERT INTO `timeline` VALUES ('413', null, 'hOUdPv_zaMEEKvcHnpsMx0', '3', '1', 'สั่งผลิต', '2021-05-12 13:36:11', 'งานพิมพ์,CNC / Laser,ผลิตทั่วไป', '0');
INSERT INTO `timeline` VALUES ('414', null, 'hOUdPv_zaMEEKvcHnpsMx0', '5', '1', 'รับงาน', '2021-05-12 13:37:19', 'งานพิมพ์(รับงาน)', '0');
INSERT INTO `timeline` VALUES ('415', null, 'hOUdPv_zaMEEKvcHnpsMx0', '5', '1', 'ยืนยันการผลิต', '2021-05-12 13:37:25', 'งานพิมพ์(งานผลิตเสร็จแล้ว)', '0');
INSERT INTO `timeline` VALUES ('416', null, 'hOUdPv_zaMEEKvcHnpsMx0', '6', '1', 'รับงาน', '2021-05-12 13:37:39', 'CNC / Laser(รับงาน)', '0');
INSERT INTO `timeline` VALUES ('417', null, 'hOUdPv_zaMEEKvcHnpsMx0', '6', '1', 'ส่งแก้ไขงาน', '2021-05-12 13:37:42', 'cnc / laser(ส่งแก้ไข กราฟิก / ออกแบบ)', '0');
INSERT INTO `timeline` VALUES ('418', null, 'hOUdPv_zaMEEKvcHnpsMx0', '7', '1', 'รับงาน', '2021-05-12 13:37:52', 'ผลิตทั่วไป(รับงาน)', '0');
INSERT INTO `timeline` VALUES ('419', null, 'hOUdPv_zaMEEKvcHnpsMx0', '6', '1', 'ยืนยันการผลิต', '2021-05-12 13:37:55', 'ผลิตทั่วไป(งานผลิตเสร็จแล้ว)', '0');
INSERT INTO `timeline` VALUES ('420', null, 'W_Dy_0CqF2px9NwnokjDCE', '4', '1', 'งาน Approve', '2021-05-12 13:41:28', 'งาน Approve', '0');
INSERT INTO `timeline` VALUES ('421', null, 'hOUdPv_zaMEEKvcHnpsMx0', '4', '1', 'รับงาน', '2021-05-12 13:42:07', 'กราฟิก / ออกแบบ', '0');
INSERT INTO `timeline` VALUES ('422', null, 'hOUdPv_zaMEEKvcHnpsMx0', '4', '1', 'งาน Approve', '2021-05-12 13:42:24', 'งาน Approve', '0');
INSERT INTO `timeline` VALUES ('423', null, '9lLpBEMv3URV9CIKowTvtp', '12', '1', 'ส่งมอบงานลูกค้า', '2021-05-12 13:54:22', 'ส่งมอบงานลูกค้า', '0');
INSERT INTO `timeline` VALUES ('424', null, 'LpFjgcw2rQ7R8maXPwoNE6', '4', '9', 'งาน Approve', '2021-05-12 13:54:58', 'งาน Approve', '0');
INSERT INTO `timeline` VALUES ('425', null, '80WMVrjv2tuVl5n9cC_CKy', '4', '9', 'งาน Approve', '2021-05-12 13:55:11', 'งาน Approve', '0');
INSERT INTO `timeline` VALUES ('426', null, 'Yf5vTaeciRsnZN5M-I9sLI', '4', '9', 'งาน Approve', '2021-05-12 13:55:23', 'งาน Approve', '0');
INSERT INTO `timeline` VALUES ('427', null, '76hIJ7ACiXmWpNWvGLspUW', '4', '9', 'งาน Approve', '2021-05-12 13:55:32', 'งาน Approve', '0');
INSERT INTO `timeline` VALUES ('428', null, 'KINCuRWXK3PMUAOwfw0IA5', '4', '9', 'งาน Approve', '2021-05-12 13:55:37', 'งาน Approve', '0');
INSERT INTO `timeline` VALUES ('429', null, '_TDDyi2XV9OSkAs_phSlcX', '4', '9', 'งาน Approve', '2021-05-12 14:04:00', 'งาน Approve', '0');
INSERT INTO `timeline` VALUES ('430', null, 'H5O9zgJoDb6GiMH_xX4mPE', '4', '9', 'งาน Approve', '2021-05-12 14:04:06', 'งาน Approve', '0');
INSERT INTO `timeline` VALUES ('431', null, 'aqoqo21ctwWwK8PhqFKfqs', '4', '9', 'งาน Approve', '2021-05-12 14:04:14', 'งาน Approve', '0');
INSERT INTO `timeline` VALUES ('432', null, '1-deFHIsDp8UH_1LfynQ33', '4', '9', 'งาน Approve', '2021-05-12 14:04:17', 'งาน Approve', '0');
INSERT INTO `timeline` VALUES ('433', null, 'l7bbwQI9C4UqeU9f7nnwZB', '4', '9', 'งาน Approve', '2021-05-12 14:04:20', 'งาน Approve', '0');
INSERT INTO `timeline` VALUES ('434', null, 'HQcTSNCNtgc3SWwo5aAeAE', '4', '9', 'งาน Approve', '2021-05-12 14:04:25', 'งาน Approve', '0');
INSERT INTO `timeline` VALUES ('435', null, '64qt3ErfzChbImDohEIYRL', '4', '9', 'รับงาน', '2021-05-12 17:11:04', 'กราฟิก / ออกแบบ', '0');
INSERT INTO `timeline` VALUES ('436', null, 'ZevKuy2Fnz8Bmpa1RsXKSI', '4', '9', 'งาน Approve', '2021-05-12 14:04:28', 'งาน Approve', '0');
INSERT INTO `timeline` VALUES ('437', null, 'lER6-HE2lJwDeTY21TlJ6s', '4', '9', 'งาน Approve', '2021-05-12 14:04:31', 'งาน Approve', '0');
INSERT INTO `timeline` VALUES ('438', null, 'Pel7uZlkWv70QlEM7N_lKb', '4', '9', 'งาน Approve', '2021-05-12 14:04:35', 'งาน Approve', '0');
INSERT INTO `timeline` VALUES ('439', null, 'ZJpRfgA-Sg1-iQ0c_lFTPA', '4', '9', 'งาน Approve', '2021-05-12 14:04:47', 'งาน Approve', '0');
INSERT INTO `timeline` VALUES ('440', null, '-D3HjJnBYj_bngAK3ut3Nc', '4', '9', 'งาน Approve', '2021-05-12 14:04:58', 'งาน Approve', '0');
INSERT INTO `timeline` VALUES ('441', null, 'BdSi1aloNqzKqs1dRzh_Mb', '4', '9', 'งาน Approve', '2021-05-12 14:05:01', 'งาน Approve', '0');
INSERT INTO `timeline` VALUES ('442', null, '72IH6IoMq2GVAY6g6j9cWI', '4', '9', 'งาน Approve', '2021-05-12 14:05:05', 'งาน Approve', '0');
INSERT INTO `timeline` VALUES ('443', null, 'JK9-EvGZcUUQ_i7KnFAycm', '4', '9', 'งาน Approve', '2021-05-12 14:05:08', 'งาน Approve', '0');
INSERT INTO `timeline` VALUES ('444', null, 'kLtTSk2dfLXj3wJUeKAQdV', '4', '9', 'งาน Approve', '2021-05-12 14:05:11', 'งาน Approve', '0');
INSERT INTO `timeline` VALUES ('445', null, 'DyGy_kfng8CV9Jnd-DKGxK', '4', '9', 'งาน Approve', '2021-05-12 14:05:14', 'งาน Approve', '0');
INSERT INTO `timeline` VALUES ('446', null, 'uy0t1Xm7NfCoTw2rD1zKU9', '4', '9', 'งาน Approve', '2021-05-12 14:05:17', 'งาน Approve', '0');
INSERT INTO `timeline` VALUES ('447', null, '_kn8kDdx84Qpsh3jCEO0cP', '4', '9', 'งาน Approve', '2021-05-12 14:05:21', 'งาน Approve', '0');
INSERT INTO `timeline` VALUES ('448', null, 'MFzzD00Me92O7h2Jy0vzHu', '4', '9', 'งาน Approve', '2021-05-12 14:05:24', 'งาน Approve', '0');
INSERT INTO `timeline` VALUES ('449', null, '2hhEmcmI5HiRzfrZUDbcpd', '4', '9', 'งาน Approve', '2021-05-12 14:05:27', 'งาน Approve', '0');
INSERT INTO `timeline` VALUES ('450', null, 'lqPKHuXygVGDIpYsyI9kt7', '4', '9', 'งาน Approve', '2021-05-12 14:05:31', 'งาน Approve', '0');
INSERT INTO `timeline` VALUES ('451', null, 'KpZoS2n0XXjgWrCvn1MOKS', '4', '9', 'งาน Approve', '2021-05-12 14:05:34', 'งาน Approve', '0');
INSERT INTO `timeline` VALUES ('452', null, 'rJAJa1zr9t8YihRUh5yKM6', '4', '9', 'งาน Approve', '2021-05-12 14:05:37', 'งาน Approve', '0');
INSERT INTO `timeline` VALUES ('453', null, 'X77vrRC85W3ppSbUrwoP43', '4', '9', 'งาน Approve', '2021-05-12 14:05:40', 'งาน Approve', '0');
INSERT INTO `timeline` VALUES ('454', null, 'm0KhYK9RmwgVOGo-0MmlhG', '4', '9', 'งาน Approve', '2021-05-12 14:05:43', 'งาน Approve', '0');
INSERT INTO `timeline` VALUES ('455', null, 'WQGXPhm9vwlsfnZA11AWaY', '4', '9', 'งาน Approve', '2021-05-12 14:05:46', 'งาน Approve', '0');
INSERT INTO `timeline` VALUES ('456', null, 'ASSAjitIb9LjfuW4kfBfqk', '4', '9', 'งาน Approve', '2021-05-12 14:05:50', 'งาน Approve', '0');
INSERT INTO `timeline` VALUES ('457', null, 'ceO-2fQclNvEJwDd4S7jIy', '4', '9', 'งาน Approve', '2021-05-12 14:05:53', 'งาน Approve', '0');
INSERT INTO `timeline` VALUES ('458', null, '5UMnCH7Tp8ts2NPVTq8b7I', '4', '9', 'งาน Approve', '2021-05-12 14:05:57', 'งาน Approve', '0');
INSERT INTO `timeline` VALUES ('459', null, 'u7i2Oit-QdjVBf26oA2LM5', '4', '9', 'งาน Approve', '2021-05-12 14:06:01', 'งาน Approve', '0');
INSERT INTO `timeline` VALUES ('460', null, 'Nm8YXtbe5__ByiIayzf8KA', '4', '9', 'งาน Approve', '2021-05-12 14:06:16', 'งาน Approve', '0');
INSERT INTO `timeline` VALUES ('461', null, '0a4gSaSnJl_Hz8SJsWjb2G', '4', '9', 'งาน Approve', '2021-05-12 14:06:20', 'งาน Approve', '0');
INSERT INTO `timeline` VALUES ('462', null, '7qdguXaqdFQZJR_asF_UfQ', '4', '9', 'งาน Approve', '2021-05-12 14:06:23', 'งาน Approve', '0');
INSERT INTO `timeline` VALUES ('463', null, 'XMXoW-yaSzIWCiUTtjiXFW', '4', '9', 'งาน Approve', '2021-05-12 14:06:27', 'งาน Approve', '0');
INSERT INTO `timeline` VALUES ('464', null, '_HTbSTzcnu_8YXRiOHbn-W', '4', '9', 'งาน Approve', '2021-05-12 14:06:31', 'งาน Approve', '0');
INSERT INTO `timeline` VALUES ('465', null, 'QSLbWxE12CQGIwWMDl9pGb', '4', '9', 'งาน Approve', '2021-05-12 14:06:35', 'งาน Approve', '0');
INSERT INTO `timeline` VALUES ('466', null, '6sPLpN7SmjvQLLKoafR940', '4', '9', 'งาน Approve', '2021-05-12 14:06:39', 'งาน Approve', '0');
INSERT INTO `timeline` VALUES ('467', null, 'n3TfnfxsKFdQQFeDT5AEVI', '4', '9', 'งาน Approve', '2021-05-12 14:06:43', 'งาน Approve', '0');
INSERT INTO `timeline` VALUES ('468', null, 'LTJBdwfKR1fPJgSt96JA-c', '4', '9', 'งาน Approve', '2021-05-12 14:06:47', 'งาน Approve', '0');
INSERT INTO `timeline` VALUES ('469', null, 'Qe-0jK3dcpTUbSEu8NCm_D', '4', '9', 'งาน Approve', '2021-05-12 14:06:57', 'งาน Approve', '0');
INSERT INTO `timeline` VALUES ('470', null, '9lLpBEMv3URV9CIKowTvtp', '4', '9', 'งาน Approve', '2021-05-12 14:07:00', 'งาน Approve', '0');
INSERT INTO `timeline` VALUES ('471', null, 'EHtNT9tpNc1i28UkoTlfXb', '4', '9', 'งาน Approve', '2021-05-12 14:07:03', 'งาน Approve', '0');
INSERT INTO `timeline` VALUES ('472', null, 'd3EZeq2qOc1sfftpV5q19D', '4', '9', 'รับงาน', '2021-05-12 17:04:36', 'กราฟิก / ออกแบบ', '0');
INSERT INTO `timeline` VALUES ('473', null, 'fU8hZ0tJOvyyp9j-LVPCge', '4', '9', 'งาน Approve', '2021-05-12 14:07:09', 'งาน Approve', '0');
INSERT INTO `timeline` VALUES ('474', null, '7hyySzNtI_VR84GW8lXTdk', '4', '9', 'งาน Approve', '2021-05-12 14:07:12', 'งาน Approve', '0');
INSERT INTO `timeline` VALUES ('475', null, 'hrmv4WPvcupLaEF9BnJnT0', '4', '9', 'งาน Approve', '2021-05-12 14:07:15', 'งาน Approve', '0');
INSERT INTO `timeline` VALUES ('476', null, 'CAcAJCWeZd-mKozrUigR0Q', '4', '9', 'งาน Approve', '2021-05-12 14:07:18', 'งาน Approve', '0');
INSERT INTO `timeline` VALUES ('477', null, 'fucZblB3_4Zu2jE0a0Vnj9', '4', '9', 'งาน Approve', '2021-05-12 14:07:22', 'งาน Approve', '0');
INSERT INTO `timeline` VALUES ('478', null, 'pXsuTV4mAr0AU6D8F36gso', '4', '9', 'รับงาน', '2021-05-12 17:09:29', 'กราฟิก / ออกแบบ', '0');
INSERT INTO `timeline` VALUES ('479', null, 'FFpCWYn5MhCGVnFFK0aK-Q', '4', '9', 'รับงาน', '2021-05-12 17:07:01', 'กราฟิก / ออกแบบ', '0');
INSERT INTO `timeline` VALUES ('480', null, '64qt3ErfzChbImDohEIYRL', '4', '9', 'รับงาน', '2021-05-12 17:11:04', 'กราฟิก / ออกแบบ', '0');
INSERT INTO `timeline` VALUES ('481', null, 'WET_Nb0rGmQ93JUN9lqlaq', '4', '9', 'รับงาน', '2021-05-12 17:05:59', 'กราฟิก / ออกแบบ', '0');
INSERT INTO `timeline` VALUES ('482', null, 'WET_Nb0rGmQ93JUN9lqlaq', '4', '9', 'รับงาน', '2021-05-12 17:05:59', 'กราฟิก / ออกแบบ', '0');
INSERT INTO `timeline` VALUES ('483', null, 'WET_Nb0rGmQ93JUN9lqlaq', '4', '9', 'รับงาน', '2021-05-12 17:05:59', 'กราฟิก / ออกแบบ', '0');
INSERT INTO `timeline` VALUES ('484', null, 'WET_Nb0rGmQ93JUN9lqlaq', '4', '9', 'รับงาน', '2021-05-12 17:05:59', 'กราฟิก / ออกแบบ', '0');
INSERT INTO `timeline` VALUES ('485', null, 'WET_Nb0rGmQ93JUN9lqlaq', '4', '9', 'รับงาน', '2021-05-12 17:05:59', 'กราฟิก / ออกแบบ', '0');
INSERT INTO `timeline` VALUES ('486', null, 'WET_Nb0rGmQ93JUN9lqlaq', '4', '9', 'รับงาน', '2021-05-12 17:05:59', 'กราฟิก / ออกแบบ', '0');
INSERT INTO `timeline` VALUES ('487', null, 'WET_Nb0rGmQ93JUN9lqlaq', '4', '9', 'รับงาน', '2021-05-12 17:05:59', 'กราฟิก / ออกแบบ', '0');
INSERT INTO `timeline` VALUES ('488', null, 'WET_Nb0rGmQ93JUN9lqlaq', '4', '9', 'รับงาน', '2021-05-12 17:05:59', 'กราฟิก / ออกแบบ', '0');
INSERT INTO `timeline` VALUES ('489', null, 'WET_Nb0rGmQ93JUN9lqlaq', '4', '9', 'รับงาน', '2021-05-12 17:05:59', 'กราฟิก / ออกแบบ', '0');
INSERT INTO `timeline` VALUES ('490', null, 'jGzP_OORkZdjjEm2vxpLmd', '9', '1', 'ลงบันทึกเลขจัดส่ง', '2021-05-12 14:39:35', 'จัดส่ง(รับเข้าระบบ)', '0');
INSERT INTO `timeline` VALUES ('491', null, 'jGzP_OORkZdjjEm2vxpLmd', '4', '1', 'งาน Approve', '2021-05-12 14:40:05', 'งาน Approve', '0');
INSERT INTO `timeline` VALUES ('492', null, '72IH6IoMq2GVAY6g6j9cWI', '9', '8', 'ลงบันทึกเลขจัดส่ง', '2021-05-12 16:42:42', 'จัดส่ง(รับเข้าระบบ)', '0');
INSERT INTO `timeline` VALUES ('493', null, '_kn8kDdx84Qpsh3jCEO0cP', '9', '8', 'ลงบันทึกเลขจัดส่ง', '2021-05-12 16:42:50', 'จัดส่ง(รับเข้าระบบ)', '0');
INSERT INTO `timeline` VALUES ('494', null, 'W_Dy_0CqF2px9NwnokjDCE', '4', '9', 'งาน Approve', '2021-05-12 17:03:13', 'งาน Approve', '0');
INSERT INTO `timeline` VALUES ('495', null, 'LpFjgcw2rQ7R8maXPwoNE6', '4', '9', 'งาน Approve', '2021-05-12 17:12:59', 'งาน Approve', '0');
INSERT INTO `timeline` VALUES ('496', null, '80WMVrjv2tuVl5n9cC_CKy', '4', '9', 'งาน Approve', '2021-05-12 17:13:04', 'งาน Approve', '0');
INSERT INTO `timeline` VALUES ('497', null, 'Yf5vTaeciRsnZN5M-I9sLI', '4', '9', 'งาน Approve', '2021-05-12 17:13:07', 'งาน Approve', '0');
INSERT INTO `timeline` VALUES ('498', null, '76hIJ7ACiXmWpNWvGLspUW', '4', '9', 'งาน Approve', '2021-05-12 17:13:11', 'งาน Approve', '0');
INSERT INTO `timeline` VALUES ('499', null, 'KINCuRWXK3PMUAOwfw0IA5', '4', '9', 'งาน Approve', '2021-05-12 17:13:20', 'งาน Approve', '0');
INSERT INTO `timeline` VALUES ('500', null, '_TDDyi2XV9OSkAs_phSlcX', '4', '9', 'งาน Approve', '2021-05-12 17:13:28', 'งาน Approve', '0');
INSERT INTO `timeline` VALUES ('501', null, 'H5O9zgJoDb6GiMH_xX4mPE', '4', '9', 'งาน Approve', '2021-05-12 17:13:32', 'งาน Approve', '0');
INSERT INTO `timeline` VALUES ('502', null, 'aqoqo21ctwWwK8PhqFKfqs', '4', '9', 'งาน Approve', '2021-05-12 17:13:40', 'งาน Approve', '0');
INSERT INTO `timeline` VALUES ('503', null, '1-deFHIsDp8UH_1LfynQ33', '4', '9', 'งาน Approve', '2021-05-12 17:13:48', 'งาน Approve', '0');
INSERT INTO `timeline` VALUES ('504', null, 'l7bbwQI9C4UqeU9f7nnwZB', '4', '9', 'งาน Approve', '2021-05-12 17:13:55', 'งาน Approve', '0');
INSERT INTO `timeline` VALUES ('505', null, 'HQcTSNCNtgc3SWwo5aAeAE', '4', '9', 'งาน Approve', '2021-05-12 17:14:02', 'งาน Approve', '0');
INSERT INTO `timeline` VALUES ('506', null, 'ZevKuy2Fnz8Bmpa1RsXKSI', '4', '9', 'งาน Approve', '2021-05-12 17:14:11', 'งาน Approve', '0');
INSERT INTO `timeline` VALUES ('507', null, 'lER6-HE2lJwDeTY21TlJ6s', '4', '9', 'งาน Approve', '2021-05-12 17:14:19', 'งาน Approve', '0');
INSERT INTO `timeline` VALUES ('508', null, 'Pel7uZlkWv70QlEM7N_lKb', '4', '9', 'งาน Approve', '2021-05-12 17:14:27', 'งาน Approve', '0');
INSERT INTO `timeline` VALUES ('509', null, 'ZJpRfgA-Sg1-iQ0c_lFTPA', '4', '9', 'งาน Approve', '2021-05-12 17:14:30', 'งาน Approve', '0');
INSERT INTO `timeline` VALUES ('510', null, 'hrmv4WPvcupLaEF9BnJnT0', '8', '8', 'ติดตั้งงานลูกค้า', '2021-05-12 17:14:37', 'ช่างติดตั้ง(ส่งงานลูกค้า)', '0');
INSERT INTO `timeline` VALUES ('511', null, '-D3HjJnBYj_bngAK3ut3Nc', '4', '9', 'งาน Approve', '2021-05-12 17:14:37', 'งาน Approve', '0');
INSERT INTO `timeline` VALUES ('512', null, '7hyySzNtI_VR84GW8lXTdk', '8', '8', 'ติดตั้งงานลูกค้า', '2021-05-12 17:14:43', 'ช่างติดตั้ง(ส่งงานลูกค้า)', '0');
INSERT INTO `timeline` VALUES ('513', null, 'BdSi1aloNqzKqs1dRzh_Mb', '4', '9', 'งาน Approve', '2021-05-12 17:14:44', 'งาน Approve', '0');
INSERT INTO `timeline` VALUES ('514', null, '72IH6IoMq2GVAY6g6j9cWI', '4', '9', 'งาน Approve', '2021-05-12 17:14:47', 'งาน Approve', '0');
INSERT INTO `timeline` VALUES ('515', null, 'JK9-EvGZcUUQ_i7KnFAycm', '4', '9', 'งาน Approve', '2021-05-12 17:14:51', 'งาน Approve', '0');
INSERT INTO `timeline` VALUES ('516', null, 'kLtTSk2dfLXj3wJUeKAQdV', '4', '9', 'งาน Approve', '2021-05-12 17:14:54', 'งาน Approve', '0');
INSERT INTO `timeline` VALUES ('517', null, 'DyGy_kfng8CV9Jnd-DKGxK', '4', '9', 'งาน Approve', '2021-05-12 17:15:00', 'งาน Approve', '0');
INSERT INTO `timeline` VALUES ('518', null, 'uy0t1Xm7NfCoTw2rD1zKU9', '4', '9', 'งาน Approve', '2021-05-12 17:15:07', 'งาน Approve', '0');
INSERT INTO `timeline` VALUES ('519', null, '_kn8kDdx84Qpsh3jCEO0cP', '4', '9', 'งาน Approve', '2021-05-12 17:15:10', 'งาน Approve', '0');
INSERT INTO `timeline` VALUES ('520', null, 'MFzzD00Me92O7h2Jy0vzHu', '4', '9', 'งาน Approve', '2021-05-12 17:15:13', 'งาน Approve', '0');
INSERT INTO `timeline` VALUES ('521', null, '2hhEmcmI5HiRzfrZUDbcpd', '4', '9', 'งาน Approve', '2021-05-12 17:15:20', 'งาน Approve', '0');
INSERT INTO `timeline` VALUES ('522', null, 'lqPKHuXygVGDIpYsyI9kt7', '4', '9', 'งาน Approve', '2021-05-12 17:15:26', 'งาน Approve', '0');
INSERT INTO `timeline` VALUES ('523', null, 'KpZoS2n0XXjgWrCvn1MOKS', '4', '9', 'งาน Approve', '2021-05-12 17:15:32', 'งาน Approve', '0');
INSERT INTO `timeline` VALUES ('524', null, 'rJAJa1zr9t8YihRUh5yKM6', '4', '9', 'งาน Approve', '2021-05-12 17:15:35', 'งาน Approve', '0');
INSERT INTO `timeline` VALUES ('525', null, 'X77vrRC85W3ppSbUrwoP43', '4', '9', 'งาน Approve', '2021-05-12 17:15:41', 'งาน Approve', '0');
INSERT INTO `timeline` VALUES ('526', null, 'm0KhYK9RmwgVOGo-0MmlhG', '4', '9', 'งาน Approve', '2021-05-12 17:15:47', 'งาน Approve', '0');
INSERT INTO `timeline` VALUES ('527', null, 'WQGXPhm9vwlsfnZA11AWaY', '4', '9', 'งาน Approve', '2021-05-12 17:15:54', 'งาน Approve', '0');
INSERT INTO `timeline` VALUES ('528', null, 'ASSAjitIb9LjfuW4kfBfqk', '4', '9', 'งาน Approve', '2021-05-12 17:16:01', 'งาน Approve', '0');
INSERT INTO `timeline` VALUES ('529', null, 'ceO-2fQclNvEJwDd4S7jIy', '4', '9', 'งาน Approve', '2021-05-12 17:16:08', 'งาน Approve', '0');
INSERT INTO `timeline` VALUES ('530', null, '5UMnCH7Tp8ts2NPVTq8b7I', '4', '9', 'งาน Approve', '2021-05-12 17:16:14', 'งาน Approve', '0');
INSERT INTO `timeline` VALUES ('531', null, 'u7i2Oit-QdjVBf26oA2LM5', '4', '9', 'งาน Approve', '2021-05-12 17:16:22', 'งาน Approve', '0');
INSERT INTO `timeline` VALUES ('532', null, 'Nm8YXtbe5__ByiIayzf8KA', '4', '9', 'งาน Approve', '2021-05-12 17:16:28', 'งาน Approve', '0');
INSERT INTO `timeline` VALUES ('533', null, '0a4gSaSnJl_Hz8SJsWjb2G', '4', '9', 'งาน Approve', '2021-05-12 17:16:34', 'งาน Approve', '0');
INSERT INTO `timeline` VALUES ('534', null, '7qdguXaqdFQZJR_asF_UfQ', '4', '9', 'งาน Approve', '2021-05-12 17:16:45', 'งาน Approve', '0');
INSERT INTO `timeline` VALUES ('535', null, 'XMXoW-yaSzIWCiUTtjiXFW', '4', '9', 'งาน Approve', '2021-05-12 17:16:52', 'งาน Approve', '0');
INSERT INTO `timeline` VALUES ('536', null, '_HTbSTzcnu_8YXRiOHbn-W', '4', '9', 'งาน Approve', '2021-05-12 17:16:58', 'งาน Approve', '0');
INSERT INTO `timeline` VALUES ('537', null, 'QSLbWxE12CQGIwWMDl9pGb', '4', '9', 'งาน Approve', '2021-05-12 17:17:05', 'งาน Approve', '0');
INSERT INTO `timeline` VALUES ('538', null, '6sPLpN7SmjvQLLKoafR940', '4', '9', 'งาน Approve', '2021-05-12 17:17:35', 'งาน Approve', '0');
INSERT INTO `timeline` VALUES ('539', null, 'n3TfnfxsKFdQQFeDT5AEVI', '4', '9', 'งาน Approve', '2021-05-12 17:17:42', 'งาน Approve', '0');
INSERT INTO `timeline` VALUES ('540', null, 'LTJBdwfKR1fPJgSt96JA-c', '4', '9', 'งาน Approve', '2021-05-12 17:17:51', 'งาน Approve', '0');
INSERT INTO `timeline` VALUES ('541', null, 'Qe-0jK3dcpTUbSEu8NCm_D', '4', '9', 'งาน Approve', '2021-05-12 17:17:56', 'งาน Approve', '0');
INSERT INTO `timeline` VALUES ('542', null, '9lLpBEMv3URV9CIKowTvtp', '4', '9', 'งาน Approve', '2021-05-12 17:18:03', 'งาน Approve', '0');
INSERT INTO `timeline` VALUES ('543', null, 'EHtNT9tpNc1i28UkoTlfXb', '4', '9', 'งาน Approve', '2021-05-12 17:18:09', 'งาน Approve', '0');
INSERT INTO `timeline` VALUES ('544', null, 'd3EZeq2qOc1sfftpV5q19D', '4', '9', 'งาน Approve', '2021-05-12 17:18:16', 'งาน Approve', '0');
INSERT INTO `timeline` VALUES ('545', null, 'fU8hZ0tJOvyyp9j-LVPCge', '4', '9', 'งาน Approve', '2021-05-12 17:18:24', 'งาน Approve', '0');
INSERT INTO `timeline` VALUES ('546', null, '7hyySzNtI_VR84GW8lXTdk', '4', '9', 'งาน Approve', '2021-05-12 17:18:35', 'งาน Approve', '0');
INSERT INTO `timeline` VALUES ('547', null, 'hrmv4WPvcupLaEF9BnJnT0', '4', '9', 'งาน Approve', '2021-05-12 17:18:43', 'งาน Approve', '0');
INSERT INTO `timeline` VALUES ('548', null, 'CAcAJCWeZd-mKozrUigR0Q', '4', '9', 'งาน Approve', '2021-05-12 17:19:33', 'งาน Approve', '0');
INSERT INTO `timeline` VALUES ('549', null, 'fucZblB3_4Zu2jE0a0Vnj9', '4', '9', 'งาน Approve', '2021-05-12 17:19:48', 'งาน Approve', '0');
INSERT INTO `timeline` VALUES ('550', null, 'pXsuTV4mAr0AU6D8F36gso', '4', '9', 'งาน Approve', '2021-05-12 17:19:58', 'งาน Approve', '0');
INSERT INTO `timeline` VALUES ('551', null, 'FFpCWYn5MhCGVnFFK0aK-Q', '4', '9', 'งาน Approve', '2021-05-12 17:20:06', 'งาน Approve', '0');
INSERT INTO `timeline` VALUES ('552', null, 'hOUdPv_zaMEEKvcHnpsMx0', '4', '9', 'งาน Approve', '2021-05-12 17:20:14', 'งาน Approve', '0');
INSERT INTO `timeline` VALUES ('553', null, '64qt3ErfzChbImDohEIYRL', '4', '9', 'งาน Approve', '2021-05-12 17:20:23', 'งาน Approve', '0');
INSERT INTO `timeline` VALUES ('554', null, 'WET_Nb0rGmQ93JUN9lqlaq', '4', '9', 'งาน Approve', '2021-05-12 17:20:30', 'งาน Approve', '0');
INSERT INTO `timeline` VALUES ('555', null, 'jGzP_OORkZdjjEm2vxpLmd', '4', '1', 'งาน Approve', '2021-05-12 18:10:14', 'งาน Approve', '0');
INSERT INTO `timeline` VALUES ('556', null, 'jGzP_OORkZdjjEm2vxpLmd', '4', '1', 'งาน Approve', '2021-05-12 18:10:20', 'งาน Approve', '0');
INSERT INTO `timeline` VALUES ('557', null, 'h3ukp0KanLnl5n9e0AFke3', '1', '1', 'บันทึกข้อมูลการรับงาน', '2021-05-12 18:31:52', 'กราฟิก,บัญชี', '0');
INSERT INTO `timeline` VALUES ('558', null, 'h3ukp0KanLnl5n9e0AFke3', '1', '1', 'บันทึกข้อมูลการรับงาน', '2021-05-12 18:32:22', 'บัญชี', '0');
INSERT INTO `timeline` VALUES ('559', null, 'dpLUbWwhqiNKCkrSJPsYl-', '1', '1', 'บันทึกข้อมูลการรับงาน', '2021-05-12 18:34:44', 'กราฟิก,บัญชี', '0');
INSERT INTO `timeline` VALUES ('560', null, 'dpLUbWwhqiNKCkrSJPsYl-', '3', '1', 'การตลาด / บัญชี(ตามงาน)', '2021-05-12 18:35:40', 'กราฟิก / ออกปบบ', '0');
INSERT INTO `timeline` VALUES ('561', null, 'dpLUbWwhqiNKCkrSJPsYl-', '1', '1', 'ยกเลิกงาน', '2021-05-12 18:37:19', 'ยกเลิกงาน', '2');
INSERT INTO `timeline` VALUES ('562', null, '8_Zx2LZQiqPFUQ9TD0pywB', '1', '1', 'บันทึกข้อมูลการรับงาน', '2021-05-12 18:38:10', 'กราฟิก,บัญชี', '0');
INSERT INTO `timeline` VALUES ('563', null, '8_Zx2LZQiqPFUQ9TD0pywB', '3', '1', 'สั่งผลิต', '2021-05-12 18:41:47', 'งานพิมพ์,CNC / Laser,ผลิตทั่วไป', '0');
INSERT INTO `timeline` VALUES ('564', null, '8_Zx2LZQiqPFUQ9TD0pywB', '7', '1', 'รับงาน', '2021-05-12 18:43:11', 'ผลิตทั่วไป(รับงาน)', '0');
INSERT INTO `timeline` VALUES ('565', null, '8_Zx2LZQiqPFUQ9TD0pywB', '6', '1', 'ยืนยันการผลิต', '2021-05-12 18:43:19', 'ผลิตทั่วไป(งานผลิตเสร็จแล้ว)', '0');
INSERT INTO `timeline` VALUES ('566', null, '8_Zx2LZQiqPFUQ9TD0pywB', '5', '1', 'รับงาน', '2021-05-12 18:44:14', 'งานพิมพ์(รับงาน)', '0');
INSERT INTO `timeline` VALUES ('567', null, '8_Zx2LZQiqPFUQ9TD0pywB', '5', '1', 'ยืนยันการผลิต', '2021-05-12 18:44:27', 'งานพิมพ์(งานผลิตเสร็จแล้ว)', '0');
INSERT INTO `timeline` VALUES ('568', null, 'ETPpDvNmIFEB4j4Tgi32oj', '1', '1', 'บันทึกข้อมูลการรับงาน', '2021-05-12 18:50:46', 'กราฟิก', '0');
INSERT INTO `timeline` VALUES ('569', null, 'ETPpDvNmIFEB4j4Tgi32oj', '3', '1', 'สั่งผลิต', '2021-05-12 18:54:07', 'งานพิมพ์,CNC / Laser', '0');
INSERT INTO `timeline` VALUES ('570', null, 'ETPpDvNmIFEB4j4Tgi32oj', '5', '1', 'รับงาน', '2021-05-12 18:57:48', 'งานพิมพ์(รับงาน)', '0');
INSERT INTO `timeline` VALUES ('571', null, 'ETPpDvNmIFEB4j4Tgi32oj', '5', '1', 'ยืนยันการผลิต', '2021-05-12 18:57:56', 'งานพิมพ์(งานผลิตเสร็จแล้ว)', '0');
INSERT INTO `timeline` VALUES ('572', null, 'cRO9HGZyoNvFVnlA-59Xt2', '1', '1', 'บันทึกข้อมูลการรับงาน', '2021-05-12 19:35:02', 'กราฟิก', '0');
INSERT INTO `timeline` VALUES ('573', null, '8_Zx2LZQiqPFUQ9TD0pywB', '6', '1', 'รับงาน', '2021-05-12 19:36:39', 'CNC / Laser(รับงาน)', '0');
INSERT INTO `timeline` VALUES ('574', null, '8_Zx2LZQiqPFUQ9TD0pywB', '6', '1', 'ส่งแก้ไขงาน', '2021-05-12 19:36:42', 'cnc / laser(ส่งแก้ไข กราฟิก / ออกแบบ)', '0');
INSERT INTO `timeline` VALUES ('575', null, 'ETPpDvNmIFEB4j4Tgi32oj', '6', '1', 'รับงาน', '2021-05-12 19:37:30', 'CNC / Laser(รับงาน)', '0');
INSERT INTO `timeline` VALUES ('576', null, 'ETPpDvNmIFEB4j4Tgi32oj', '6', '1', 'ส่งแก้ไขงาน', '2021-05-12 19:37:33', 'cnc / laser(ส่งแก้ไข กราฟิก / ออกแบบ)', '0');
INSERT INTO `timeline` VALUES ('577', null, '8_Zx2LZQiqPFUQ9TD0pywB', '9', '1', 'ลงบันทึกเลขจัดส่ง', '2021-05-12 19:38:10', 'จัดส่ง(รับเข้าระบบ)', '0');
INSERT INTO `timeline` VALUES ('578', null, 'ETPpDvNmIFEB4j4Tgi32oj', '9', '1', 'ลงบันทึกเลขจัดส่ง', '2021-05-12 19:38:45', 'จัดส่ง(รับเข้าระบบ)', '0');
INSERT INTO `timeline` VALUES ('579', null, 'ETPpDvNmIFEB4j4Tgi32oj', '12', '1', 'ส่งมอบงานลูกค้า', '2021-05-12 19:39:08', 'ส่งมอบงานลูกค้า', '0');
INSERT INTO `timeline` VALUES ('580', null, '8_Zx2LZQiqPFUQ9TD0pywB', '12', '1', 'ส่งมอบงานลูกค้า', '2021-05-12 19:39:10', 'ส่งมอบงานลูกค้า', '0');
INSERT INTO `timeline` VALUES ('581', null, 'cRO9HGZyoNvFVnlA-59Xt2', '12', '1', 'ส่งมอบงานลูกค้า', '2021-05-12 19:39:13', 'ส่งมอบงานลูกค้า', '0');
INSERT INTO `timeline` VALUES ('582', null, '8_Zx2LZQiqPFUQ9TD0pywB', '4', '1', 'รับงาน', '2021-05-12 19:39:20', 'กราฟิก / ออกแบบ', '0');
INSERT INTO `timeline` VALUES ('583', null, '8_Zx2LZQiqPFUQ9TD0pywB', '4', '1', 'งาน Approve', '2021-05-12 19:39:24', 'งาน Approve', '0');
INSERT INTO `timeline` VALUES ('584', null, 'cRO9HGZyoNvFVnlA-59Xt2', '3', '1', 'สั่งผลิต', '2021-05-12 19:40:01', 'งานพิมพ์,CNC / Laser,ผลิตทั่วไป', '0');
INSERT INTO `timeline` VALUES ('585', null, 'QjfhOfXg181A4woB_CJZbh', '1', '8', 'บันทึกข้อมูลการรับงาน', '2021-05-13 09:00:25', 'กราฟิก,บัญชี', '0');
INSERT INTO `timeline` VALUES ('586', null, '8_Zx2LZQiqPFUQ9TD0pywB', '2', '1', 'ลงคิวงานติดตั้ง', '2021-05-13 09:03:02', 'การตลาด(ลงคิวงาน)', '0');
INSERT INTO `timeline` VALUES ('587', null, 'Bfx-3DB0DnffvI4hi8s4Dd', '1', '8', 'บันทึกข้อมูลการรับงาน', '2021-05-13 11:46:23', 'กราฟิก,บัญชี', '0');
INSERT INTO `timeline` VALUES ('588', null, 'R0s6646_Wy1RQU0tH3feJI', '1', '8', 'บันทึกข้อมูลการรับงาน', '2021-05-13 13:09:25', 'กราฟิก,บัญชี', '0');
INSERT INTO `timeline` VALUES ('589', null, '29jO6OBZ-DcyKJAPbAkR-D', '1', '8', 'บันทึกข้อมูลการรับงาน', '2021-05-13 13:11:49', 'กราฟิก,บัญชี', '0');
INSERT INTO `timeline` VALUES ('590', null, 'ETPpDvNmIFEB4j4Tgi32oj', '4', '9', 'งาน Approve', '2021-05-13 13:13:05', 'งาน Approve', '0');
INSERT INTO `timeline` VALUES ('591', null, 'cRO9HGZyoNvFVnlA-59Xt2', '4', '9', 'งาน Approve', '2021-05-13 13:13:14', 'งาน Approve', '0');
INSERT INTO `timeline` VALUES ('592', null, 'QjfhOfXg181A4woB_CJZbh', '4', '9', 'รับงาน', '2021-05-13 15:15:09', 'กราฟิก / ออกแบบ', '0');
INSERT INTO `timeline` VALUES ('593', null, 'QjfhOfXg181A4woB_CJZbh', '4', '9', 'งาน Approve', '2021-05-13 15:15:13', 'งาน Approve', '0');
INSERT INTO `timeline` VALUES ('594', null, 'G8sXWOx_pijFawJSiWCj_3', '1', '8', 'บันทึกข้อมูลการรับงาน', '2021-05-13 16:44:52', 'กราฟิก,บัญชี', '0');
INSERT INTO `timeline` VALUES ('595', null, 'TVdH76RDCnBbBTqcwtkBsH', '1', '8', 'บันทึกข้อมูลการรับงาน', '2021-05-13 16:54:48', 'กราฟิก,บัญชี', '0');
INSERT INTO `timeline` VALUES ('596', null, 'r9qfUVpdCecyGahZ972F0E', '1', '8', 'บันทึกข้อมูลการรับงาน', '2021-05-14 08:38:01', 'กราฟิก,บัญชี', '0');
INSERT INTO `timeline` VALUES ('597', null, '29jO6OBZ-DcyKJAPbAkR-D', '3', '1', 'สั่งผลิต', '2021-05-14 09:04:58', 'งานพิมพ์', '0');
INSERT INTO `timeline` VALUES ('598', null, 'Bfx-3DB0DnffvI4hi8s4Dd', '3', '1', 'สั่งผลิต', '2021-05-14 10:00:27', 'งานพิมพ์,ผลิตทั่วไป', '0');
INSERT INTO `timeline` VALUES ('599', null, 'lsLUi5-eonboPFpOQUTsmY', '1', '8', 'บันทึกข้อมูลการรับงาน', '2021-05-14 10:31:42', 'กราฟิก,บัญชี', '0');
INSERT INTO `timeline` VALUES ('600', null, 'Rnvn3RJB8g2hBgiIsUQSJI', '1', '8', 'บันทึกข้อมูลการรับงาน', '2021-05-14 11:40:20', 'กราฟิก,บัญชี', '0');
INSERT INTO `timeline` VALUES ('601', null, '8nYloAlOIVHu6Rhi9MtZN1', '1', '8', 'บันทึกข้อมูลการรับงาน', '2021-05-14 11:44:20', 'กราฟิก,บัญชี', '0');
INSERT INTO `timeline` VALUES ('602', null, 'ZJefNzuDnS-HvShoWa7gUZ', '1', '8', 'บันทึกข้อมูลการรับงาน', '2021-05-14 11:51:27', 'กราฟิก,บัญชี', '0');
INSERT INTO `timeline` VALUES ('603', null, 'Bfx-3DB0DnffvI4hi8s4Dd', '5', '13', 'รับงาน', '2021-05-14 11:54:54', 'งานพิมพ์(รับงาน)', '0');
INSERT INTO `timeline` VALUES ('604', null, 'Bfx-3DB0DnffvI4hi8s4Dd', '5', '13', 'ยืนยันการผลิต', '2021-05-14 11:55:30', 'งานพิมพ์(งานผลิตเสร็จแล้ว)', '0');
INSERT INTO `timeline` VALUES ('605', null, 'NMU8hYni2hQJzcGWzEnwYe', '1', '8', 'บันทึกข้อมูลการรับงาน', '2021-05-14 13:46:26', 'กราฟิก,บัญชี', '0');
INSERT INTO `timeline` VALUES ('606', null, '29jO6OBZ-DcyKJAPbAkR-D', '5', '13', 'รับงาน', '2021-05-14 14:48:27', 'งานพิมพ์(รับงาน)', '0');
INSERT INTO `timeline` VALUES ('607', null, '29jO6OBZ-DcyKJAPbAkR-D', '5', '13', 'ยืนยันการผลิต', '2021-05-14 14:48:32', 'งานพิมพ์(งานผลิตเสร็จแล้ว)', '0');
INSERT INTO `timeline` VALUES ('608', null, '8nYloAlOIVHu6Rhi9MtZN1', '3', '1', 'สั่งผลิต', '2021-05-14 14:53:52', 'ผลิตทั่วไป', '0');
INSERT INTO `timeline` VALUES ('609', null, 'ZJefNzuDnS-HvShoWa7gUZ', '3', '1', 'สั่งผลิต', '2021-05-14 14:54:45', 'งานพิมพ์,CNC / Laser', '0');
INSERT INTO `timeline` VALUES ('610', null, 'R0s6646_Wy1RQU0tH3feJI', '3', '1', 'สั่งผลิต', '2021-05-14 14:56:10', 'งานพิมพ์', '0');
INSERT INTO `timeline` VALUES ('611', null, 'Rnvn3RJB8g2hBgiIsUQSJI', '3', '1', 'สั่งผลิต', '2021-05-14 14:57:19', 'งานพิมพ์,ผลิตทั่วไป', '0');
INSERT INTO `timeline` VALUES ('612', null, 'Bfx-3DB0DnffvI4hi8s4Dd', '7', '15', 'รับงาน', '2021-05-14 14:59:55', 'ผลิตทั่วไป(รับงาน)', '0');
INSERT INTO `timeline` VALUES ('613', null, '8nYloAlOIVHu6Rhi9MtZN1', '7', '15', 'รับงาน', '2021-05-14 15:01:17', 'ผลิตทั่วไป(รับงาน)', '0');
INSERT INTO `timeline` VALUES ('614', null, '8nYloAlOIVHu6Rhi9MtZN1', '6', '15', 'ยืนยันการผลิต', '2021-05-14 15:01:21', 'ผลิตทั่วไป(งานผลิตเสร็จแล้ว)', '0');
INSERT INTO `timeline` VALUES ('615', null, 'Bfx-3DB0DnffvI4hi8s4Dd', '4', '9', 'รับงาน', '2021-05-14 15:16:42', 'กราฟิก / ออกแบบ', '0');
INSERT INTO `timeline` VALUES ('616', null, 'Bfx-3DB0DnffvI4hi8s4Dd', '4', '9', 'งาน Approve', '2021-05-14 15:16:45', 'งาน Approve', '0');
INSERT INTO `timeline` VALUES ('617', null, 'R0s6646_Wy1RQU0tH3feJI', '4', '9', 'รับงาน', '2021-05-14 15:17:01', 'กราฟิก / ออกแบบ', '0');
INSERT INTO `timeline` VALUES ('618', null, 'R0s6646_Wy1RQU0tH3feJI', '4', '9', 'งาน Approve', '2021-05-14 15:17:04', 'งาน Approve', '0');
INSERT INTO `timeline` VALUES ('619', null, '29jO6OBZ-DcyKJAPbAkR-D', '4', '9', 'รับงาน', '2021-05-14 15:17:19', 'กราฟิก / ออกแบบ', '0');
INSERT INTO `timeline` VALUES ('620', null, '29jO6OBZ-DcyKJAPbAkR-D', '4', '9', 'งาน Approve', '2021-05-14 15:17:22', 'งาน Approve', '0');
INSERT INTO `timeline` VALUES ('621', null, 'G8sXWOx_pijFawJSiWCj_3', '4', '9', 'รับงาน', '2021-05-14 15:17:34', 'กราฟิก / ออกแบบ', '0');
INSERT INTO `timeline` VALUES ('622', null, 'G8sXWOx_pijFawJSiWCj_3', '4', '9', 'งาน Approve', '2021-05-14 15:17:37', 'งาน Approve', '0');
INSERT INTO `timeline` VALUES ('623', null, 'TVdH76RDCnBbBTqcwtkBsH', '4', '9', 'รับงาน', '2021-05-14 15:17:58', 'กราฟิก / ออกแบบ', '0');
INSERT INTO `timeline` VALUES ('624', null, 'TVdH76RDCnBbBTqcwtkBsH', '4', '9', 'งาน Approve', '2021-05-14 15:18:02', 'งาน Approve', '0');
INSERT INTO `timeline` VALUES ('625', null, 'r9qfUVpdCecyGahZ972F0E', '4', '9', 'รับงาน', '2021-05-14 15:18:12', 'กราฟิก / ออกแบบ', '0');
INSERT INTO `timeline` VALUES ('626', null, 'r9qfUVpdCecyGahZ972F0E', '4', '9', 'งาน Approve', '2021-05-14 15:18:15', 'งาน Approve', '0');
INSERT INTO `timeline` VALUES ('627', null, 'lsLUi5-eonboPFpOQUTsmY', '4', '9', 'รับงาน', '2021-05-14 15:18:45', 'กราฟิก / ออกแบบ', '0');
INSERT INTO `timeline` VALUES ('628', null, 'lsLUi5-eonboPFpOQUTsmY', '4', '9', 'งาน Approve', '2021-05-14 15:18:48', 'งาน Approve', '0');
INSERT INTO `timeline` VALUES ('629', null, 'Rnvn3RJB8g2hBgiIsUQSJI', '4', '9', 'รับงาน', '2021-05-14 15:19:04', 'กราฟิก / ออกแบบ', '0');
INSERT INTO `timeline` VALUES ('630', null, 'Rnvn3RJB8g2hBgiIsUQSJI', '4', '9', 'งาน Approve', '2021-05-14 15:19:08', 'งาน Approve', '0');
INSERT INTO `timeline` VALUES ('631', null, 'NMU8hYni2hQJzcGWzEnwYe', '4', '9', 'รับงาน', '2021-05-14 15:19:57', 'กราฟิก / ออกแบบ', '0');
INSERT INTO `timeline` VALUES ('632', null, 'NMU8hYni2hQJzcGWzEnwYe', '4', '9', 'งาน Approve', '2021-05-14 15:20:01', 'งาน Approve', '0');
INSERT INTO `timeline` VALUES ('633', null, 'ZJefNzuDnS-HvShoWa7gUZ', '5', '13', 'รับงาน', '2021-05-14 16:04:36', 'งานพิมพ์(รับงาน)', '0');
INSERT INTO `timeline` VALUES ('634', null, 'ZJefNzuDnS-HvShoWa7gUZ', '5', '13', 'ยืนยันการผลิต', '2021-05-14 16:04:40', 'งานพิมพ์(งานผลิตเสร็จแล้ว)', '0');
INSERT INTO `timeline` VALUES ('635', null, '6fB4CAg1KJL5Ald2p5xlJC', '1', '1', 'บันทึกข้อมูลการรับงาน', '2021-05-14 16:13:46', 'กราฟิก,บัญชี', '0');
INSERT INTO `timeline` VALUES ('636', null, '6fB4CAg1KJL5Ald2p5xlJC', '3', '1', 'สั่งผลิต', '2021-05-14 16:14:32', 'งานพิมพ์', '0');
INSERT INTO `timeline` VALUES ('637', null, '9uku3p4nk2HhVJkGP-6oOo', '1', '8', 'บันทึกข้อมูลการรับงาน', '2021-05-14 16:19:18', 'กราฟิก,บัญชี', '0');
INSERT INTO `timeline` VALUES ('638', null, '6fB4CAg1KJL5Ald2p5xlJC', '5', '1', 'รับงาน', '2021-05-14 16:20:30', 'งานพิมพ์(รับงาน)', '0');
INSERT INTO `timeline` VALUES ('639', null, '6fB4CAg1KJL5Ald2p5xlJC', '5', '1', 'ยืนยันการผลิต', '2021-05-14 16:20:33', 'งานพิมพ์(งานผลิตเสร็จแล้ว)', '0');
INSERT INTO `timeline` VALUES ('640', null, '1ePJlxC9Iy1cvLIJvG6kav', '1', '1', 'บันทึกข้อมูลการรับงาน', '2021-05-14 16:21:12', 'กราฟิก', '0');
INSERT INTO `timeline` VALUES ('641', null, '1ePJlxC9Iy1cvLIJvG6kav', '3', '1', 'สั่งผลิต', '2021-05-14 16:21:29', 'งานพิมพ์', '0');
INSERT INTO `timeline` VALUES ('642', null, '1ePJlxC9Iy1cvLIJvG6kav', '5', '1', 'รับงาน', '2021-05-14 16:34:27', 'งานพิมพ์(รับงาน)', '0');
INSERT INTO `timeline` VALUES ('643', null, '1ePJlxC9Iy1cvLIJvG6kav', '5', '1', 'ยืนยันการผลิต', '2021-05-14 16:34:30', 'งานพิมพ์(งานผลิตเสร็จแล้ว)', '0');
INSERT INTO `timeline` VALUES ('644', null, 'd2cddmWbQ5q52QXxRCq3e-', '1', '8', 'บันทึกข้อมูลการรับงาน', '2021-05-14 17:17:59', 'กราฟิก,บัญชี', '0');
INSERT INTO `timeline` VALUES ('645', null, '9uku3p4nk2HhVJkGP-6oOo', '3', '16', 'สั่งผลิต', '2021-05-15 06:31:23', 'CNC / Laser,ผลิตทั่วไป', '0');
INSERT INTO `timeline` VALUES ('646', null, '6NvGa1WfdZon2FTKOANHYI', '1', '8', 'บันทึกข้อมูลการรับงาน', '2021-05-15 09:30:40', 'กราฟิก,บัญชี', '0');
INSERT INTO `timeline` VALUES ('647', null, 'd2cddmWbQ5q52QXxRCq3e-', '3', '1', 'สั่งผลิต', '2021-05-15 10:20:04', 'ผลิตทั่วไป', '0');
INSERT INTO `timeline` VALUES ('648', null, 'SwHKFAotfowJHYH20O2iDH', '1', '8', 'บันทึกข้อมูลการรับงาน', '2021-05-15 10:20:14', 'กราฟิก,บัญชี', '0');
INSERT INTO `timeline` VALUES ('649', null, '9uku3p4nk2HhVJkGP-6oOo', '7', '15', 'รับงาน', '2021-05-15 10:21:36', 'ผลิตทั่วไป(รับงาน)', '0');
INSERT INTO `timeline` VALUES ('650', null, '9uku3p4nk2HhVJkGP-6oOo', '6', '15', 'ยืนยันการผลิต', '2021-05-15 10:21:41', 'ผลิตทั่วไป(งานผลิตเสร็จแล้ว)', '0');
INSERT INTO `timeline` VALUES ('651', null, 'd2cddmWbQ5q52QXxRCq3e-', '7', '15', 'รับงาน', '2021-05-15 10:21:53', 'ผลิตทั่วไป(รับงาน)', '0');
INSERT INTO `timeline` VALUES ('652', null, 'd2cddmWbQ5q52QXxRCq3e-', '6', '15', 'ยืนยันการผลิต', '2021-05-15 10:21:57', 'ผลิตทั่วไป(งานผลิตเสร็จแล้ว)', '0');
INSERT INTO `timeline` VALUES ('653', null, 'bJQg87V6EFNI-IYOZZXBsJ', '1', '8', 'บันทึกข้อมูลการรับงาน', '2021-05-15 10:28:11', 'กราฟิก,บัญชี', '0');
INSERT INTO `timeline` VALUES ('654', null, '8nYloAlOIVHu6Rhi9MtZN1', '12', '8', 'ส่งมอบงานลูกค้า', '2021-05-15 11:53:58', 'ส่งมอบงานลูกค้า', '0');
INSERT INTO `timeline` VALUES ('655', null, '6NvGa1WfdZon2FTKOANHYI', '4', '9', 'รับงาน', '2021-05-15 14:09:26', 'กราฟิก / ออกแบบ', '0');
INSERT INTO `timeline` VALUES ('656', null, '6NvGa1WfdZon2FTKOANHYI', '4', '9', 'งาน Approve', '2021-05-15 14:09:34', 'งาน Approve', '0');
INSERT INTO `timeline` VALUES ('657', null, '9uku3p4nk2HhVJkGP-6oOo', '4', '9', 'รับงาน', '2021-05-15 14:09:47', 'กราฟิก / ออกแบบ', '0');
INSERT INTO `timeline` VALUES ('658', null, '9uku3p4nk2HhVJkGP-6oOo', '4', '9', 'งาน Approve', '2021-05-15 14:09:51', 'งาน Approve', '0');
INSERT INTO `timeline` VALUES ('659', null, '6fB4CAg1KJL5Ald2p5xlJC', '4', '9', 'รับงาน', '2021-05-15 14:10:24', 'กราฟิก / ออกแบบ', '0');
INSERT INTO `timeline` VALUES ('660', null, '6fB4CAg1KJL5Ald2p5xlJC', '4', '9', 'งาน Approve', '2021-05-15 14:10:29', 'งาน Approve', '0');
INSERT INTO `timeline` VALUES ('661', null, '1ePJlxC9Iy1cvLIJvG6kav', '4', '9', 'งาน Approve', '2021-05-15 14:10:34', 'งาน Approve', '0');
INSERT INTO `timeline` VALUES ('662', null, 'd2cddmWbQ5q52QXxRCq3e-', '4', '9', 'รับงาน', '2021-05-15 14:10:55', 'กราฟิก / ออกแบบ', '0');
INSERT INTO `timeline` VALUES ('663', null, 'd2cddmWbQ5q52QXxRCq3e-', '4', '9', 'งาน Approve', '2021-05-15 14:10:58', 'งาน Approve', '0');
INSERT INTO `timeline` VALUES ('664', null, '8nYloAlOIVHu6Rhi9MtZN1', '4', '9', 'รับงาน', '2021-05-15 14:11:10', 'กราฟิก / ออกแบบ', '0');
INSERT INTO `timeline` VALUES ('665', null, '8nYloAlOIVHu6Rhi9MtZN1', '4', '9', 'งาน Approve', '2021-05-15 14:11:13', 'งาน Approve', '0');
INSERT INTO `timeline` VALUES ('666', null, 'SwHKFAotfowJHYH20O2iDH', '4', '9', 'รับงาน', '2021-05-15 14:11:40', 'กราฟิก / ออกแบบ', '0');
INSERT INTO `timeline` VALUES ('667', null, 'SwHKFAotfowJHYH20O2iDH', '4', '9', 'งาน Approve', '2021-05-15 14:11:43', 'งาน Approve', '0');
INSERT INTO `timeline` VALUES ('668', null, 'pdci6GgdMe4wBztYRnGZsv', '1', '8', 'บันทึกข้อมูลการรับงาน', '2021-05-15 14:16:18', 'กราฟิก,บัญชี', '0');
INSERT INTO `timeline` VALUES ('669', null, 'X-H0wokcbyYMpPWupr--Ae', '1', '8', 'บันทึกข้อมูลการรับงาน', '2021-05-15 14:37:43', 'กราฟิก,บัญชี', '0');
INSERT INTO `timeline` VALUES ('670', null, 'c3eU7ywfowEQmyw0IjMhaQ', '1', '8', 'บันทึกข้อมูลการรับงาน', '2021-05-15 15:24:37', 'กราฟิก,บัญชี', '0');
INSERT INTO `timeline` VALUES ('671', null, 'K4aHqribfirH195o76wdkU', '1', '8', 'บันทึกข้อมูลการรับงาน', '2021-05-15 16:59:25', 'บัญชี', '0');
INSERT INTO `timeline` VALUES ('672', null, 'UauniDVW1pUZeShneZdjjz', '1', '8', 'บันทึกข้อมูลการรับงาน', '2021-05-17 08:44:31', 'กราฟิก,บัญชี', '0');
INSERT INTO `timeline` VALUES ('673', null, 'PC16PlJVg_7Xd5YmGGg0mi', '1', '8', 'บันทึกข้อมูลการรับงาน', '2021-05-17 08:46:44', 'กราฟิก,บัญชี', '0');
INSERT INTO `timeline` VALUES ('674', null, 'MZj6PndvG7ZpAROePYv3hw', '1', '8', 'บันทึกข้อมูลการรับงาน', '2021-05-17 10:02:57', 'กราฟิก,บัญชี', '0');
INSERT INTO `timeline` VALUES ('675', null, 'CPzscmmVggSVGf8cyBCB0N', '1', '8', 'บันทึกข้อมูลการรับงาน', '2021-05-17 10:42:20', 'กราฟิก,บัญชี', '0');
INSERT INTO `timeline` VALUES ('676', null, 'NwLzGmWHZCNiBoHvWJ_JVY', '1', '8', 'บันทึกข้อมูลการรับงาน', '2021-05-17 11:36:29', 'กราฟิก,บัญชี', '0');
INSERT INTO `timeline` VALUES ('677', null, 'rvm9thaM0Tz5d_Npq8IjB5', '1', '8', 'บันทึกข้อมูลการรับงาน', '2021-05-17 13:53:29', 'กราฟิก,บัญชี', '0');
INSERT INTO `timeline` VALUES ('678', null, 'pdci6GgdMe4wBztYRnGZsv', '3', '1', 'สั่งผลิต', '2021-05-17 13:54:24', 'งานพิมพ์,ผลิตทั่วไป', '0');
INSERT INTO `timeline` VALUES ('679', null, 'bJQg87V6EFNI-IYOZZXBsJ', '3', '1', 'สั่งผลิต', '2021-05-17 13:55:28', 'งานพิมพ์,CNC / Laser', '0');
INSERT INTO `timeline` VALUES ('680', null, 'YUWuIUIZ-FXoTHzsyEsSsg', '1', '8', 'บันทึกข้อมูลการรับงาน', '2021-05-17 15:03:19', 'กราฟิก,บัญชี', '0');
INSERT INTO `timeline` VALUES ('681', null, 'YUWuIUIZ-FXoTHzsyEsSsg', '3', '1', 'สั่งผลิต', '2021-05-17 15:30:19', 'งานพิมพ์', '0');
INSERT INTO `timeline` VALUES ('682', null, 'CmvKcG5eHTn7HD4IIoeoMh', '1', '8', 'บันทึกข้อมูลการรับงาน', '2021-05-17 16:00:54', 'กราฟิก,บัญชี', '0');
INSERT INTO `timeline` VALUES ('683', null, 'pdci6GgdMe4wBztYRnGZsv', '5', '13', 'รับงาน', '2021-05-17 17:11:29', 'งานพิมพ์(รับงาน)', '0');
INSERT INTO `timeline` VALUES ('684', null, 'pdci6GgdMe4wBztYRnGZsv', '5', '13', 'ยืนยันการผลิต', '2021-05-17 17:11:40', 'งานพิมพ์(งานผลิตเสร็จแล้ว)', '0');
INSERT INTO `timeline` VALUES ('685', null, 'bJQg87V6EFNI-IYOZZXBsJ', '5', '13', 'รับงาน', '2021-05-17 17:11:56', 'งานพิมพ์(รับงาน)', '0');
INSERT INTO `timeline` VALUES ('686', null, 'bJQg87V6EFNI-IYOZZXBsJ', '5', '13', 'ยืนยันการผลิต', '2021-05-17 17:25:09', 'งานพิมพ์(งานผลิตเสร็จแล้ว)', '0');
INSERT INTO `timeline` VALUES ('687', null, 'NwLzGmWHZCNiBoHvWJ_JVY', '3', '1', 'ส่งผลิตนอกร้าน / บัญชี(ตามงาน)', '2021-05-17 17:25:59', 'กราฟิก / ออกปบบ', '0');
INSERT INTO `timeline` VALUES ('688', null, 'PC16PlJVg_7Xd5YmGGg0mi', '3', '17', 'การตลาด / บัญชี(ตามงาน)', '2021-05-17 21:05:12', 'กราฟิก / ออกปบบ', '0');
INSERT INTO `timeline` VALUES ('689', null, 'rvm9thaM0Tz5d_Npq8IjB5', '3', '17', 'การตลาด / บัญชี(ตามงาน)', '2021-05-17 21:05:26', 'กราฟิก / ออกปบบ', '0');
INSERT INTO `timeline` VALUES ('690', null, 'YUWuIUIZ-FXoTHzsyEsSsg', '5', '13', 'รับงาน', '2021-05-18 08:18:13', 'งานพิมพ์(รับงาน)', '0');
INSERT INTO `timeline` VALUES ('691', null, 'YUWuIUIZ-FXoTHzsyEsSsg', '5', '13', 'ยืนยันการผลิต', '2021-05-18 08:18:40', 'งานพิมพ์(งานผลิตเสร็จแล้ว)', '0');
INSERT INTO `timeline` VALUES ('692', null, 'sE4Bo7KJAI-VymDWuR5SoJ', '1', '8', 'บันทึกข้อมูลการรับงาน', '2021-05-18 08:45:17', 'กราฟิก,บัญชี', '0');
INSERT INTO `timeline` VALUES ('693', null, 'X-H0wokcbyYMpPWupr--Ae', '4', '9', 'รับงาน', '2021-05-18 09:01:34', 'กราฟิก / ออกแบบ', '0');
INSERT INTO `timeline` VALUES ('694', null, 'X-H0wokcbyYMpPWupr--Ae', '4', '9', 'งาน Approve', '2021-05-18 09:01:37', 'งาน Approve', '0');
INSERT INTO `timeline` VALUES ('695', null, 'c3eU7ywfowEQmyw0IjMhaQ', '4', '9', 'รับงาน', '2021-05-18 09:01:53', 'กราฟิก / ออกแบบ', '0');
INSERT INTO `timeline` VALUES ('696', null, 'c3eU7ywfowEQmyw0IjMhaQ', '4', '9', 'งาน Approve', '2021-05-18 09:01:57', 'งาน Approve', '0');
INSERT INTO `timeline` VALUES ('697', null, 'K4aHqribfirH195o76wdkU', '4', '9', 'รับงาน', '2021-05-18 09:02:09', 'กราฟิก / ออกแบบ', '0');
INSERT INTO `timeline` VALUES ('698', null, 'K4aHqribfirH195o76wdkU', '4', '9', 'งาน Approve', '2021-05-18 09:02:14', 'งาน Approve', '0');
INSERT INTO `timeline` VALUES ('699', null, 'PC16PlJVg_7Xd5YmGGg0mi', '4', '9', 'รับงาน', '2021-05-18 09:02:38', 'กราฟิก / ออกแบบ', '0');
INSERT INTO `timeline` VALUES ('700', null, 'PC16PlJVg_7Xd5YmGGg0mi', '4', '9', 'งาน Approve', '2021-05-18 09:02:41', 'งาน Approve', '0');
INSERT INTO `timeline` VALUES ('701', null, '3qfWzNL0gNGXQjOCaR6YTi', '1', '8', 'บันทึกข้อมูลการรับงาน', '2021-05-18 09:32:44', 'กราฟิก,บัญชี', '0');
INSERT INTO `timeline` VALUES ('702', null, 'NwLzGmWHZCNiBoHvWJ_JVY', '4', '9', 'รับงาน', '2021-05-18 11:38:34', 'กราฟิก / ออกแบบ', '0');
INSERT INTO `timeline` VALUES ('703', null, 'NwLzGmWHZCNiBoHvWJ_JVY', '4', '9', 'งาน Approve', '2021-05-18 11:38:51', 'งาน Approve', '0');
INSERT INTO `timeline` VALUES ('704', null, 'BWTbhpypiSF6YctPzCo1OC', '1', '8', 'บันทึกข้อมูลการรับงาน', '2021-05-18 11:51:05', 'กราฟิก,บัญชี', '0');
INSERT INTO `timeline` VALUES ('705', null, '3qfWzNL0gNGXQjOCaR6YTi', '3', '1', 'สั่งผลิต', '2021-05-18 11:58:15', 'งานพิมพ์', '0');
INSERT INTO `timeline` VALUES ('706', null, 'CPzscmmVggSVGf8cyBCB0N', '3', '1', 'สั่งผลิต', '2021-05-18 11:59:08', 'งานพิมพ์', '0');
INSERT INTO `timeline` VALUES ('707', null, '3qfWzNL0gNGXQjOCaR6YTi', '5', '13', 'รับงาน', '2021-05-18 12:03:16', 'งานพิมพ์(รับงาน)', '0');
INSERT INTO `timeline` VALUES ('708', null, '3qfWzNL0gNGXQjOCaR6YTi', '5', '13', 'ยืนยันการผลิต', '2021-05-18 12:03:51', 'งานพิมพ์(งานผลิตเสร็จแล้ว)', '0');
INSERT INTO `timeline` VALUES ('709', null, 'w1lMYIjg7gsJNtxW24Usm-', '1', '8', 'บันทึกข้อมูลการรับงาน', '2021-05-18 13:47:23', 'กราฟิก,บัญชี', '0');
INSERT INTO `timeline` VALUES ('710', null, 'xNHFTf7NDm1W2Et-Vjss19', '1', '8', 'บันทึกข้อมูลการรับงาน', '2021-05-18 14:27:54', 'กราฟิก,บัญชี', '0');
INSERT INTO `timeline` VALUES ('711', null, 'CPzscmmVggSVGf8cyBCB0N', '5', '13', 'รับงาน', '2021-05-18 14:56:18', 'งานพิมพ์(รับงาน)', '0');
INSERT INTO `timeline` VALUES ('712', null, 'CPzscmmVggSVGf8cyBCB0N', '5', '13', 'ยืนยันการผลิต', '2021-05-18 14:58:46', 'งานพิมพ์(งานผลิตเสร็จแล้ว)', '0');
INSERT INTO `timeline` VALUES ('713', null, 'bJQg87V6EFNI-IYOZZXBsJ', '2', '8', 'ลงคิวงานติดตั้ง', '2021-05-18 15:31:44', 'การตลาด(ลงคิวงาน)', '0');
INSERT INTO `timeline` VALUES ('714', null, '3qfWzNL0gNGXQjOCaR6YTi', '2', '8', 'ลงคิวงานติดตั้ง', '2021-05-18 15:32:49', 'การตลาด(ลงคิวงาน)', '0');
INSERT INTO `timeline` VALUES ('715', null, 'YUWuIUIZ-FXoTHzsyEsSsg', '2', '8', 'ลงคิวงานติดตั้ง', '2021-05-18 15:33:31', 'การตลาด(ลงคิวงาน)', '0');
INSERT INTO `timeline` VALUES ('716', null, 'Zi7JvolZ3MkKlhUMSa6EbW', '1', '8', 'บันทึกข้อมูลการรับงาน', '2021-05-18 16:16:56', 'กราฟิก,บัญชี', '0');
INSERT INTO `timeline` VALUES ('717', null, 'w1lMYIjg7gsJNtxW24Usm-', '4', '9', 'รับงาน', '2021-05-19 08:35:00', 'กราฟิก / ออกแบบ', '0');
INSERT INTO `timeline` VALUES ('718', null, 'w1lMYIjg7gsJNtxW24Usm-', '4', '9', 'งาน Approve', '2021-05-19 08:35:09', 'งาน Approve', '0');
INSERT INTO `timeline` VALUES ('719', null, 'ZJefNzuDnS-HvShoWa7gUZ', '4', '9', 'รับงาน', '2021-05-19 08:39:43', 'กราฟิก / ออกแบบ', '0');
INSERT INTO `timeline` VALUES ('720', null, 'ZJefNzuDnS-HvShoWa7gUZ', '4', '9', 'งาน Approve', '2021-05-19 08:39:46', 'งาน Approve', '0');
INSERT INTO `timeline` VALUES ('721', null, 'bJQg87V6EFNI-IYOZZXBsJ', '4', '9', 'รับงาน', '2021-05-19 08:39:59', 'กราฟิก / ออกแบบ', '0');
INSERT INTO `timeline` VALUES ('722', null, 'bJQg87V6EFNI-IYOZZXBsJ', '4', '9', 'งาน Approve', '2021-05-19 08:40:02', 'งาน Approve', '0');
INSERT INTO `timeline` VALUES ('723', null, 'YUWuIUIZ-FXoTHzsyEsSsg', '4', '9', 'รับงาน', '2021-05-19 08:40:58', 'กราฟิก / ออกแบบ', '0');
INSERT INTO `timeline` VALUES ('724', null, 'YUWuIUIZ-FXoTHzsyEsSsg', '4', '9', 'งาน Approve', '2021-05-19 08:41:03', 'งาน Approve', '0');
INSERT INTO `timeline` VALUES ('725', null, 'CmvKcG5eHTn7HD4IIoeoMh', '4', '9', 'รับงาน', '2021-05-19 08:41:20', 'กราฟิก / ออกแบบ', '0');
INSERT INTO `timeline` VALUES ('726', null, 'CmvKcG5eHTn7HD4IIoeoMh', '4', '9', 'งาน Approve', '2021-05-19 08:41:23', 'งาน Approve', '0');
INSERT INTO `timeline` VALUES ('727', null, 'sE4Bo7KJAI-VymDWuR5SoJ', '4', '9', 'รับงาน', '2021-05-19 08:41:39', 'กราฟิก / ออกแบบ', '0');
INSERT INTO `timeline` VALUES ('728', null, 'sE4Bo7KJAI-VymDWuR5SoJ', '4', '9', 'งาน Approve', '2021-05-19 08:41:43', 'งาน Approve', '0');
INSERT INTO `timeline` VALUES ('729', null, 'xNHFTf7NDm1W2Et-Vjss19', '4', '9', 'รับงาน', '2021-05-19 08:42:20', 'กราฟิก / ออกแบบ', '0');
INSERT INTO `timeline` VALUES ('730', null, 'xNHFTf7NDm1W2Et-Vjss19', '4', '9', 'งาน Approve', '2021-05-19 08:42:24', 'งาน Approve', '0');
INSERT INTO `timeline` VALUES ('731', null, 'UauniDVW1pUZeShneZdjjz', '4', '9', 'รับงาน', '2021-05-19 08:42:52', 'กราฟิก / ออกแบบ', '0');
INSERT INTO `timeline` VALUES ('732', null, 'UauniDVW1pUZeShneZdjjz', '4', '9', 'งาน Approve', '2021-05-19 08:42:57', 'งาน Approve', '0');
INSERT INTO `timeline` VALUES ('733', null, 'CPzscmmVggSVGf8cyBCB0N', '4', '9', 'รับงาน', '2021-05-19 08:43:16', 'กราฟิก / ออกแบบ', '0');
INSERT INTO `timeline` VALUES ('734', null, 'CPzscmmVggSVGf8cyBCB0N', '4', '9', 'งาน Approve', '2021-05-19 08:43:19', 'งาน Approve', '0');
INSERT INTO `timeline` VALUES ('735', null, 'rvm9thaM0Tz5d_Npq8IjB5', '4', '9', 'รับงาน', '2021-05-19 08:43:38', 'กราฟิก / ออกแบบ', '0');
INSERT INTO `timeline` VALUES ('736', null, 'rvm9thaM0Tz5d_Npq8IjB5', '4', '9', 'งาน Approve', '2021-05-19 08:43:41', 'งาน Approve', '0');
INSERT INTO `timeline` VALUES ('737', null, '1aqIWI1ypdhbJz1BHYOvP6', '1', '8', 'บันทึกข้อมูลการรับงาน', '2021-05-19 08:50:10', 'กราฟิก,บัญชี', '0');
INSERT INTO `timeline` VALUES ('738', null, '1aqIWI1ypdhbJz1BHYOvP6', '3', '17', 'สั่งผลิต', '2021-05-19 09:21:06', 'CNC / Laser,ผลิตทั่วไป', '0');
INSERT INTO `timeline` VALUES ('739', null, 'rpcABKqsHGmiTPpt1Zwrh4', '1', '8', 'บันทึกข้อมูลการรับงาน', '2021-05-19 09:27:07', 'กราฟิก,บัญชี', '0');
INSERT INTO `timeline` VALUES ('740', null, 'BWTbhpypiSF6YctPzCo1OC', '4', '9', 'รับงาน', '2021-05-19 10:05:46', 'กราฟิก / ออกแบบ', '0');
INSERT INTO `timeline` VALUES ('741', null, 'BWTbhpypiSF6YctPzCo1OC', '4', '9', 'งาน Approve', '2021-05-19 10:05:49', 'งาน Approve', '0');
INSERT INTO `timeline` VALUES ('742', null, 'Zi7JvolZ3MkKlhUMSa6EbW', '4', '9', 'รับงาน', '2021-05-19 10:06:06', 'กราฟิก / ออกแบบ', '0');
INSERT INTO `timeline` VALUES ('743', null, 'Zi7JvolZ3MkKlhUMSa6EbW', '4', '9', 'งาน Approve', '2021-05-19 10:06:12', 'งาน Approve', '0');
INSERT INTO `timeline` VALUES ('744', null, 'rpcABKqsHGmiTPpt1Zwrh4', '4', '9', 'รับงาน', '2021-05-19 10:19:47', 'กราฟิก / ออกแบบ', '0');
INSERT INTO `timeline` VALUES ('745', null, 'rpcABKqsHGmiTPpt1Zwrh4', '4', '9', 'งาน Approve', '2021-05-19 10:19:51', 'งาน Approve', '0');
INSERT INTO `timeline` VALUES ('746', null, '5TjzbuWalTuAJcTsc1dubh', '1', '8', 'บันทึกข้อมูลการรับงาน', '2021-05-19 10:20:30', 'กราฟิก,บัญชี', '0');
INSERT INTO `timeline` VALUES ('747', null, 'tS0XNs30MdcLuxutSWM4G0', '1', '8', 'บันทึกข้อมูลการรับงาน', '2021-05-19 10:33:01', 'กราฟิก,บัญชี', '0');
INSERT INTO `timeline` VALUES ('748', null, '5TjzbuWalTuAJcTsc1dubh', '3', '1', 'สั่งผลิต', '2021-05-19 11:13:14', 'งานพิมพ์,ผลิตทั่วไป', '0');
INSERT INTO `timeline` VALUES ('749', null, '5TjzbuWalTuAJcTsc1dubh', '4', '9', 'รับงาน', '2021-05-19 13:48:15', 'กราฟิก / ออกแบบ', '0');
INSERT INTO `timeline` VALUES ('750', null, '5TjzbuWalTuAJcTsc1dubh', '4', '9', 'งาน Approve', '2021-05-19 13:48:18', 'งาน Approve', '0');
INSERT INTO `timeline` VALUES ('751', null, '1aqIWI1ypdhbJz1BHYOvP6', '4', '9', 'รับงาน', '2021-05-19 13:54:10', 'กราฟิก / ออกแบบ', '0');
INSERT INTO `timeline` VALUES ('752', null, '1aqIWI1ypdhbJz1BHYOvP6', '4', '9', 'งาน Approve', '2021-05-19 13:54:23', 'งาน Approve', '0');
INSERT INTO `timeline` VALUES ('753', null, 'o-ySwjoOAuPPCkM5vP0HwB', '1', '8', 'บันทึกข้อมูลการรับงาน', '2021-05-19 14:11:22', 'กราฟิก,บัญชี', '0');
INSERT INTO `timeline` VALUES ('754', null, '5ldsZsOZWHoCYCyWUmNZbZ', '1', '8', 'บันทึกข้อมูลการรับงาน', '2021-05-19 14:19:05', 'กราฟิก,บัญชี', '0');
INSERT INTO `timeline` VALUES ('755', null, 'N84zvp2EMGIVn0hjgkMIey', '1', '8', 'บันทึกข้อมูลการรับงาน', '2021-05-19 14:25:48', 'กราฟิก,บัญชี', '0');
INSERT INTO `timeline` VALUES ('756', null, 'VWMAqlr859luWO-W7JzA77', '1', '8', 'บันทึกข้อมูลการรับงาน', '2021-05-19 14:57:49', 'กราฟิก,บัญชี', '0');
INSERT INTO `timeline` VALUES ('757', null, 'pdci6GgdMe4wBztYRnGZsv', '7', '15', 'รับงาน', '2021-05-19 15:06:16', 'ผลิตทั่วไป(รับงาน)', '0');
INSERT INTO `timeline` VALUES ('758', null, 'pdci6GgdMe4wBztYRnGZsv', '6', '15', 'ยืนยันการผลิต', '2021-05-19 15:06:19', 'ผลิตทั่วไป(งานผลิตเสร็จแล้ว)', '0');
INSERT INTO `timeline` VALUES ('759', null, 'KAvzVlHCKjukxp6RzWn_Bs', '1', '8', 'บันทึกข้อมูลการรับงาน', '2021-05-19 15:49:06', 'กราฟิก,บัญชี', '0');
INSERT INTO `timeline` VALUES ('760', null, 'd54MvCz6fsOTye6WQpOq8v', '1', '8', 'บันทึกข้อมูลการรับงาน', '2021-05-19 16:00:47', 'กราฟิก,บัญชี', '0');
INSERT INTO `timeline` VALUES ('761', null, 'VWMAqlr859luWO-W7JzA77', '4', '9', 'รับงาน', '2021-05-19 16:21:06', 'กราฟิก / ออกแบบ', '0');
INSERT INTO `timeline` VALUES ('762', null, 'VWMAqlr859luWO-W7JzA77', '4', '9', 'งาน Approve', '2021-05-19 16:21:11', 'งาน Approve', '0');
INSERT INTO `timeline` VALUES ('763', null, 'KAvzVlHCKjukxp6RzWn_Bs', '4', '9', 'รับงาน', '2021-05-19 16:21:45', 'กราฟิก / ออกแบบ', '0');
INSERT INTO `timeline` VALUES ('764', null, 'KAvzVlHCKjukxp6RzWn_Bs', '4', '9', 'งาน Approve', '2021-05-19 16:21:49', 'งาน Approve', '0');
INSERT INTO `timeline` VALUES ('765', null, 'tS0XNs30MdcLuxutSWM4G0', '4', '9', 'รับงาน', '2021-05-20 08:46:17', 'กราฟิก / ออกแบบ', '0');
INSERT INTO `timeline` VALUES ('766', null, 'tS0XNs30MdcLuxutSWM4G0', '4', '9', 'งาน Approve', '2021-05-20 08:46:21', 'งาน Approve', '0');

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
  `link` text COMMENT 'ลิงค์ส่งงาน',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8 COMMENT='แผนกจัดส่ง';

-- ----------------------------
-- Records of transport
-- ----------------------------
INSERT INTO `transport` VALUES ('3', 'W_Dy_0CqF2px9NwnokjDCE', '15', '3', '0', '2021-05-05 13:18:06', '2021-05-07 09:28:50', 'จัดส่ง... รถตู้แม่สอด\r\n\r\nคุณศุทธวีร์ ที่อยุ่ 364 หมู่ที่6 ต.แม่ตาว อ.แม่สอด จ.ตาก 63110 \r\n0931758306', 0xE0B980E0B89AE0B8ADE0B8A3E0B98CE0B8A3E0B896, null);
INSERT INTO `transport` VALUES ('5', '76hIJ7ACiXmWpNWvGLspUW', '8', '3', '0', '2021-05-08 11:54:01', '2021-05-08 11:54:13', 'คุณปู\r\nRoyal king suite\r\n159 หมู่ 7 ซอยนวมินทร 4 ตำบล บางบ่อ อำเภอบางบ่อ สมุทรปราการ 10560\r\n0939496646', 0xE0B980E0B8A5E0B882E0B89EE0B8B1E0B8AAE0B894E0B8B820454632383134303436363654482068747470733A2F2F747261636B2E746861696C616E64706F73742E636F2E74682F64617368626F6172642F3F747261636B4E756D6265723D4546323831, null);
INSERT INTO `transport` VALUES ('6', 'Yf5vTaeciRsnZN5M-I9sLI', '16', '3', '0', '2021-05-05 17:27:08', '2021-05-07 09:28:56', 'จัดส่ง ส่งรถตู้\r\nพงษ์สิทธิ์ มาขอด ที่อยู่ 633 หมู่ 1 ต.ท่าสายลวด อ.แม่สอด จ.ตาก 63110\r\nโทร.0904528488', 0xE0B8A3E0B896E0B895E0B8B9E0B989, null);
INSERT INTO `transport` VALUES ('7', 'HQcTSNCNtgc3SWwo5aAeAE', '17', '3', '0', '2021-05-05 20:17:02', '2021-05-07 09:28:59', 'นายปอล มามะกะมูละ\r\n15/5 ตำบลขุนโขลน อำเภอพระพุทธบาท จังหวัดสระบุรี\r\n18120\r\n081-9795951', 0x454632383134303436393754482C45463238313430343734355448, null);
INSERT INTO `transport` VALUES ('9', '80WMVrjv2tuVl5n9cC_CKy', '8', '3', '0', '2021-05-06 09:48:52', '2021-05-07 09:28:53', 'จัดส่ง\r\nนายรุ่งรดิศ  วีระกุล\r\nธนาคารกรุงไทย  สาขาเมืองทองธานี ชั้น 3 เลขที่ 321 ถนนบอนด์สตรีท  ตำบลบางพูด อำเภอปากเกร็ด จังหวัดนนทบุรี 11120\r\nโทร.081-9868456', 0xE0B981E0B888E0B989E0B887E0B980E0B8A5E0B882E0B89EE0B8B1E0B8AAE0B894E0B8B8E0B884E0B988E0B8B020454632383134303435393554482068747470733A2F2F747261636B2E746861696C616E64706F73742E636F2E74682F64617368626F61, null);
INSERT INTO `transport` VALUES ('11', '72IH6IoMq2GVAY6g6j9cWI', '8', '2', '0', '2021-05-12 16:42:42', null, 'จัดส่ง\r\nคุณนลินา จันทะฟอง\r\n2/44 หมู่ 1 ต.ทับปุด อ.ทับปุด จ.พังงา 82180\r\nโทร 087 2664433', 0xE0B980E0B8A5E0B882E0B89EE0B8B1E0B8AAE0B894E0B8B8E0B882E0B899E0B8AAE0B988E0B887204A265420383230393935383438383533, 'เลขพัสดุขนส่ง J&T 820995848853');
INSERT INTO `transport` VALUES ('12', 'BdSi1aloNqzKqs1dRzh_Mb', '8', '3', '0', '2021-05-11 16:39:59', '2021-05-12 11:28:17', 'น.ส.สายฝน แก้วคำภา\r\nที่อยู่ 70 หมู่11 ต.นาชุมแสง อ.ภูเวียง จ.ขอนแก่น 40150  \r\nเบอร์ 094-2969749', 0x68747470733A2F2F747261636B2E746861696C616E64706F73742E636F2E74682F64617368626F6172642F3F747261636B4E756D6265723D45463238313430343736385448, null);
INSERT INTO `transport` VALUES ('13', 'ZJpRfgA-Sg1-iQ0c_lFTPA', '8', '3', '0', '2021-05-11 16:38:12', '2021-05-12 11:28:14', 'ร้านทำทุกอย่างดอทคอม  \r\nK เข้ม 0851003160\r\n\r\nเลขตึก  162/532  บางแคคอนโดทาวน  \r\nห้อง 168 อาคารพาณิชย์  ก่อนถึงศาลพระภูมิ  \r\nถ.เพชรเกษม   แขวงบางแคเหนือ เขตบางแค  กรุงเทพน  10160', 0x68747470733A2F2F747261636B2E746861696C616E64706F73742E636F2E74682F64617368626F6172642F3F747261636B4E756D6265723D45463238313430343831315448, null);
INSERT INTO `transport` VALUES ('14', 'JK9-EvGZcUUQ_i7KnFAycm', '8', '3', '0', '2021-05-08 11:54:29', '2021-05-08 11:54:33', 'จัดส่งรถตู้แม่สอด\r\n\r\nชื่อ  Bao\r\n612/1ถ.อินทรคีรี  ต.แม่สอด  อ.แม่สอด  จ.ตาก63110(ร้านผลไม้หน้าวัดชุมพล)\r\nโทร.063-9054880 / 095-3316844', 0xE0B8AAE0B988E0B887E0B8A3E0B896E0B895E0B8B9E0B989E0B981E0B8A1E0B988E0B8AAE0B8ADE0B894, null);
INSERT INTO `transport` VALUES ('15', 'DyGy_kfng8CV9Jnd-DKGxK', '8', '3', '0', '2021-05-11 16:43:18', '2021-05-12 11:28:19', 'ส่งปณ.\r\n\r\nคุณกิติศักดิ์ จันทร์ถาวร\r\n315 ถ.กีฬากลาง ต.ในเมือง อ.เมือง จ.นครราชสีมา 30000\r\n0837487373', 0x68747470733A2F2F747261636B2E746861696C616E64706F73742E636F2E74682F64617368626F6172642F3F747261636B4E756D6265723D45463238313430343637305448, null);
INSERT INTO `transport` VALUES ('16', '2hhEmcmI5HiRzfrZUDbcpd', '8', '3', '0', '2021-05-11 16:41:59', '2021-05-12 11:28:21', 'จัดส่ง คุณสาวิตรี​ บาง​หลวง\r\nสำนักงาน​ส​กท.พิจิตร​ 52  ม.2  ต.ทุ่ง​น้อย​ อ.โพทะเล​ จ.พิจิตร​66130\r\nโทรศัพท์​099-4543972​', 0x206B6574682E6D652F6433313435363763, null);
INSERT INTO `transport` VALUES ('17', 'WQGXPhm9vwlsfnZA11AWaY', '8', '3', '0', '2021-05-11 16:44:56', '2021-05-12 11:28:26', 'รอที่อยู่จัดส่ง *แก้ไขอีกครั้ง ', 0x68747470733A2F2F747261636B2E746861696C616E64706F73742E636F2E74682F64617368626F6172642F3F747261636B4E756D6265723D45463238313430343934345448, null);
INSERT INTO `transport` VALUES ('18', 'ASSAjitIb9LjfuW4kfBfqk', '8', '3', '0', '2021-05-11 16:46:56', '2021-05-12 11:28:28', 'ฟอร์คอนเฮ้าส์ หจก.สำนักงานใหญ่ 29/2 หมู่11 ต.คลองห้า อ.คลองหลวง จ.ปทุมธานี 12120', 0x68747470733A2F2F747261636B2E746861696C616E64706F73742E636F2E74682F64617368626F6172642F3F747261636B4E756D6265723D45463238313430343836305448, null);
INSERT INTO `transport` VALUES ('19', 'rJAJa1zr9t8YihRUh5yKM6', '8', '3', '0', '2021-05-11 16:38:37', '2021-05-12 11:28:23', 'ร้านทำทุกอย่างดอทคอม  \r\nK เข้ม 0851003160\r\n\r\nเลขตึก  162/532  บางแคคอนโดทาวน  \r\nห้อง 168 อาคารพาณิชย์  ก่อนถึงศาลพระภูมิ  \r\nถ.เพชรเกษม   แขวงบางแคเหนือ เขตบางแค  กรุงเทพน  10160', 0x68747470733A2F2F747261636B2E746861696C616E64706F73742E636F2E74682F64617368626F6172642F3F747261636B4E756D6265723D45463238313430343831315448, null);
INSERT INTO `transport` VALUES ('20', 'ceO-2fQclNvEJwDd4S7jIy', null, '1', '0', null, null, null, null, null);
INSERT INTO `transport` VALUES ('21', 'XMXoW-yaSzIWCiUTtjiXFW', null, '1', '0', null, null, null, null, null);
INSERT INTO `transport` VALUES ('22', 'u7i2Oit-QdjVBf26oA2LM5', null, '1', '0', null, null, null, null, null);
INSERT INTO `transport` VALUES ('23', 'jGzP_OORkZdjjEm2vxpLmd', '1', '2', '0', '2021-05-12 14:39:35', null, '', 0xE0B89FE0B8ABE0B881E0B894E0B8ABE0B881E0B894, 'ฟหกดกหด');
INSERT INTO `transport` VALUES ('24', '_kn8kDdx84Qpsh3jCEO0cP', '8', '2', '0', '2021-05-12 16:42:50', null, 'จัดส่งปณ. \r\nคุณนลินา จันทะฟอง\r\n2/44 หมู่ 1 ต.ทับปุด อ.ทับปุด จ.พังงา 82180\r\nโทร 087 2664433', 0xE0B980E0B8A5E0B882E0B89EE0B8B1E0B8AAE0B894E0B8B8E0B882E0B899E0B8AAE0B988E0B887204A265420383230393935383438383533, 'เลขพัสดุขนส่ง J&T 820995848853');
INSERT INTO `transport` VALUES ('25', 'EHtNT9tpNc1i28UkoTlfXb', null, '1', '0', null, null, null, null, null);
INSERT INTO `transport` VALUES ('27', '0a4gSaSnJl_Hz8SJsWjb2G', null, '1', '0', null, null, null, null, null);
INSERT INTO `transport` VALUES ('28', 'fU8hZ0tJOvyyp9j-LVPCge', null, '1', '0', null, null, null, null, null);
INSERT INTO `transport` VALUES ('29', 'fucZblB3_4Zu2jE0a0Vnj9', null, '1', '0', null, null, null, null, null);
INSERT INTO `transport` VALUES ('30', 'hOUdPv_zaMEEKvcHnpsMx0', null, '1', '0', null, null, null, null, null);
INSERT INTO `transport` VALUES ('31', 'dpLUbWwhqiNKCkrSJPsYl-', null, '1', '0', null, null, null, null, null);
INSERT INTO `transport` VALUES ('32', '8_Zx2LZQiqPFUQ9TD0pywB', '1', '2', '0', '2021-05-12 19:38:10', null, '', 0xE0B8ABE0B881E0B881, 'หกดฟ');
INSERT INTO `transport` VALUES ('33', 'ETPpDvNmIFEB4j4Tgi32oj', '1', '2', '0', '2021-05-12 19:38:45', null, 'ฟห', 0xE0B986E0B881E0B986, 'ไำฟหกด');
INSERT INTO `transport` VALUES ('34', 'cRO9HGZyoNvFVnlA-59Xt2', null, '1', '0', null, null, null, null, null);
INSERT INTO `transport` VALUES ('35', '29jO6OBZ-DcyKJAPbAkR-D', null, '1', '0', null, null, null, null, null);
INSERT INTO `transport` VALUES ('36', '6fB4CAg1KJL5Ald2p5xlJC', null, '1', '0', null, null, null, null, null);
INSERT INTO `transport` VALUES ('37', '1ePJlxC9Iy1cvLIJvG6kav', null, '1', '0', null, null, null, null, null);
INSERT INTO `transport` VALUES ('38', '9uku3p4nk2HhVJkGP-6oOo', null, '1', '0', null, null, null, null, null);
INSERT INTO `transport` VALUES ('39', 'NwLzGmWHZCNiBoHvWJ_JVY', null, '1', '0', null, null, null, null, null);
INSERT INTO `transport` VALUES ('40', 'PC16PlJVg_7Xd5YmGGg0mi', null, '1', '0', null, null, null, null, null);
INSERT INTO `transport` VALUES ('41', '1aqIWI1ypdhbJz1BHYOvP6', null, '1', '0', null, null, null, null, null);
INSERT INTO `transport` VALUES ('42', '5TjzbuWalTuAJcTsc1dubh', null, '1', '0', null, null, null, null, null);

-- ----------------------------
-- Table structure for typecustomer
-- ----------------------------
DROP TABLE IF EXISTS `typecustomer`;
CREATE TABLE `typecustomer` (
  `id` int(3) NOT NULL AUTO_INCREMENT,
  `typename` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of typecustomer
-- ----------------------------
INSERT INTO `typecustomer` VALUES ('1', 'สำนักงาน');
INSERT INTO `typecustomer` VALUES ('2', 'บริษัท');
INSERT INTO `typecustomer` VALUES ('3', 'หน่วยงานภาครัฐ');
INSERT INTO `typecustomer` VALUES ('4', 'ลูกค้าทั่วไป');

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
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8;

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
INSERT INTO `uploads` VALUES ('12', 'Ezk4vbqN5jZ75Vfl79YYbP', '1123.jpg', '727c2a666a613df73f3cc6f634e97dab.jpg', '2021-05-10 09:08:19', null, null, '1');
INSERT INTO `uploads` VALUES ('13', 'qez_5vuxzwsud_DU0mitpo', '123456.jpg', '92ed429e3995e1af0d508c812b573b01.jpg', '2021-05-10 09:09:21', null, null, '1');
INSERT INTO `uploads` VALUES ('14', 'czIIkreKLe3w0NM4KtHJMD', '31264.jpg', '7ac784f1ce6598739d4f448f36e63de5.jpg', '2021-05-10 09:15:16', null, null, '1');
INSERT INTO `uploads` VALUES ('15', 'oPBlqSvsqixDsyEAPz37yf', '1620454827352.jpg', '3fabc590bf7affeb79f48ca15f71528e.jpg', '2021-05-10 09:16:52', null, null, '1');
INSERT INTO `uploads` VALUES ('16', 'VdwWAzzP1x-hbjZl4ST7Ib', '147852.jpg', 'dabfcb6fdac3dc9ab7964e0e3632bbbc.jpg', '2021-05-10 09:17:56', null, null, '1');
INSERT INTO `uploads` VALUES ('17', 'o1b6stU4iPgWnByHIzxaEh', 'r4OT_g_2FS56OYrbajeZ1tMMrl3WUoJwDFhHWQ2wOS9UDUJZ7QPEuBKPyJ9NwyB_8n7SY9TqgBuO61yiiCPzG5ug51ztzTIUf_TCOfXPCw2q5qrf0dXZwa1sLXqz-7Gm.jpg', 'e09ae42c9a571b5002a286326bee4c1f.jpg', '2021-05-11 10:25:58', null, null, '1');
INSERT INTO `uploads` VALUES ('18', 'uIfJaunRWsNUkl73TQyoAm', 'Ju-rgtbcUpfci806TSDRZRPAvWyQ8yaB4k2eiHZDNmK9nnc8n5Nm9jFd5g9XBWqHjMQDmsfGsDXb77QG5w8jcsmMwRo0_F5TFYEGN9n-D2D2AFsAq5g-pbSecMOntn5D.jpg', 'df3da14b17ae9ad132c4d21fdf4ad99c.jpg', '2021-05-11 10:34:22', null, null, '1');
INSERT INTO `uploads` VALUES ('19', 'uIfJaunRWsNUkl73TQyoAm', 'oQNMXeaR6tI6eeflMJrjxzrHsTcU1WE5IWWZQREh4YSKpCUdsEEnnKCLk6qot-CHV0cKQf1kQbAWp7FwohijD619B3Q3GQenkeLGw13wEZJBmsCgY2SGo9hHwCO8wki4.jpg', '6ad00e6355012bd8df084654d5264094.jpg', '2021-05-11 10:34:25', null, null, '1');
INSERT INTO `uploads` VALUES ('20', 'otOI2MW78Z5In0QmZfCBrU', 'Ju-rgtbcUpfci806TSDRZRPAvWyQ8yaB4k2eiHZDNmK9nnc8n5Nm9jFd5g9XBWqHjMQDmsfGsDXb77QG5w8jcsmMwRo0_F5TFYEGN9n-D2D2AFsAq5g-pbSecMOntn5D.jpg', '24da678d772bf6fb990dd34947e46ce4.jpg', '2021-05-11 10:40:27', null, null, '1');
INSERT INTO `uploads` VALUES ('21', 'otOI2MW78Z5In0QmZfCBrU', 'oQNMXeaR6tI6eeflMJrjxzrHsTcU1WE5IWWZQREh4YSKpCUdsEEnnKCLk6qot-CHV0cKQf1kQbAWp7FwohijD619B3Q3GQenkeLGw13wEZJBmsCgY2SGo9hHwCO8wki4.jpg', 'fa380e51d17bab285d8df162debf02b3.jpg', '2021-05-11 10:40:29', null, null, '1');
INSERT INTO `uploads` VALUES ('22', 'H8LtyY_C-uIFQCmPhM3m0F', '1620704528146.jpg', '34873f4f9978b86674a34a476e1acb0e.jpg', '2021-05-11 10:42:52', null, null, '1');
INSERT INTO `uploads` VALUES ('23', 'TNFp18zKU_qWjRTDm6DePI', '3pI2_RjLJqnmsCd9qh5PTDkeV0Q9fkDNxRFUwFn6plqm5-OJsQCB2NOSMg2MGbnOp2IhYlwbkjYWJd5-bQcjRptQhRKReZbvU2SW1fneXgLO2Z-T_EatEjLqMJcRIBA_.jpg', 'a3bb736e2933675baf081fa1955f85c9.jpg', '2021-05-11 11:12:07', null, null, '1');
INSERT INTO `uploads` VALUES ('24', '2zUcNDivENAlgV76IvvItm', '3pI2_RjLJqnmsCd9qh5PTDkeV0Q9fkDNxRFUwFn6plqm5-OJsQCB2NOSMg2MGbnOp2IhYlwbkjYWJd5-bQcjRptQhRKReZbvU2SW1fneXgLO2Z-T_EatEjLqMJcRIBA_.jpg', '444352e271f908b17ad31f689da980df.jpg', '2021-05-11 11:12:40', null, null, '1');
INSERT INTO `uploads` VALUES ('25', 'Qe-0jK3dcpTUbSEu8NCm_D', '1620707233366.jpg', '8566aeb77aea7e7d7d5aa74c560201f1.jpg', '2021-05-11 11:28:12', null, null, '1');
INSERT INTO `uploads` VALUES ('26', 'O8aW0azi71n6tuo4rTvXv0', 'line_oa_chat_210511_113211.jpg', '79b890528c77b9a295e7753431da4bae.jpg', '2021-05-11 11:32:47', null, null, '1');
INSERT INTO `uploads` VALUES ('27', '_Ff_5zqZT9-xB6RkAKM_ke', 'line_oa_chat_210511_113517.jpg', '0ab5c81565d23553c51a049f67438da7.jpg', '2021-05-11 11:35:33', null, null, '1');
INSERT INTO `uploads` VALUES ('28', 'IFqbV1TzEuGdX-8SiobHX1', 'QVEw3pDMFE045JF4rmJfSCdM33gXSTSy6ktOU3W6kWEfECct54Q-Wq0vUs04eftaiUOmLZLmGuyMlKbcp-FxlQ_fxDCbZQQt5l0CTGA_ydirKnrzSMCBG-mBh0a-leKt.jpg', 'e28de56fbb3b680e5ef72976ebdc882a.jpg', '2021-05-11 15:33:32', null, null, '1');
INSERT INTO `uploads` VALUES ('29', 'HVCT52oNYgST08A_2V6zh4', '1620726328182.jpg', '2b460c02a770cb085ae9148de88a1719.jpg', '2021-05-11 16:47:53', null, null, '1');
INSERT INTO `uploads` VALUES ('30', 'RjdVAgxvj7n2iETi2PjKFT', '123.jpg', '32d93fb141e750c60c24dfeb4baef2a9.jpg', '2021-05-11 16:48:56', null, null, '1');
INSERT INTO `uploads` VALUES ('31', 'RjdVAgxvj7n2iETi2PjKFT', '456.jpg', 'baaa664eab99a01be909ff5cc3fcebfd.jpg', '2021-05-11 16:48:58', null, null, '1');
INSERT INTO `uploads` VALUES ('32', '3KRz5HATSrB6Ehzrgywr-9', '1111111.jpg', 'e01cd3810206f215bf1ed4970799630d.jpg', '2021-05-11 16:50:00', null, null, '1');
INSERT INTO `uploads` VALUES ('33', '3KRz5HATSrB6Ehzrgywr-9', 'kkkk.jpg', '49571b50ca229f242cbd38b590efca01.jpg', '2021-05-11 16:50:02', null, null, '1');
INSERT INTO `uploads` VALUES ('34', '7vG403C-QA77OJrLGU9rIo', '123456789.jpg', '1fddcd1ad14f5ebabccdc95b332a13ef.jpg', '2021-05-11 16:51:11', null, null, '1');
INSERT INTO `uploads` VALUES ('35', 'fSaOu79Agjuy7fK7P_wHke', '147852.jpg', '238de3f5c250740e9bbf77affd3b5e80.jpg', '2021-05-11 16:53:37', null, null, '1');
INSERT INTO `uploads` VALUES ('36', '9ytxaP4RM9pXtIyJv8eH_M', '1619154127038.jpg', '83ce78a7ec1ac1503a0b9ca14caee808.jpg', '2021-05-12 13:36:11', null, null, '1');
INSERT INTO `uploads` VALUES ('37', 'dpLUbWwhqiNKCkrSJPsYl-', '1620819249214-1845931880.jpg', '6bf299f8dc4c32db64fe2c760d91ae8c.jpg', '2021-05-12 18:34:44', null, null, '1');
INSERT INTO `uploads` VALUES ('38', 'bl3CWqPYZs1pNYCWQmQA_n', '1620819652741-1089915089.jpg', '24e2e8907cad54d72d19f3a4cebb5d91.jpg', '2021-05-12 18:41:47', null, null, '1');
INSERT INTO `uploads` VALUES ('39', 'Dvs6O9fbFcqKxg4A5QiLGb', '1.jpg', 'd8950843f1abbff0c7ad6775f1e1ca81.jpg', '2021-05-14 10:00:09', null, null, '1');
INSERT INTO `uploads` VALUES ('40', 'Dvs6O9fbFcqKxg4A5QiLGb', '2.jpg', '470b59b86ddda3bf7888b2ca1ff6afc0.jpg', '2021-05-14 10:00:10', null, null, '1');
INSERT INTO `uploads` VALUES ('41', 'Dvs6O9fbFcqKxg4A5QiLGb', '3.jpg', 'a6e054cc0f2a5c28f2a5f03c9497ee5c.jpg', '2021-05-14 10:00:11', null, null, '1');
INSERT INTO `uploads` VALUES ('42', 'ZJefNzuDnS-HvShoWa7gUZ', 'ALดำพิมพ์ยูวี.jpg', '3078c4f8220bbfef4508be46eaa55e57.jpg', '2021-05-14 11:51:27', null, null, '1');
INSERT INTO `uploads` VALUES ('43', 'A7vkLWUZWzLWR-tYbtDTsm', '1.jpg', '7062252f9661fdd8ea80be063dd123f6.jpg', '2021-05-14 14:53:52', null, null, '1');
INSERT INTO `uploads` VALUES ('44', 'tRdndxneLx7YrWUjEzviI3', '2.jpg', '4550004de50c978bbf497ced35c92f44.jpg', '2021-05-14 14:57:14', null, null, '1');
INSERT INTO `uploads` VALUES ('45', 'c3eU7ywfowEQmyw0IjMhaQ', 'นิทรรศการกาดต้าตง  พี่หนุ่ยวัฒนธรรม.jpg', '73554b09f0f81985ff525ba91b058aa6.jpg', '2021-05-15 15:24:37', null, null, '1');
INSERT INTO `uploads` VALUES ('46', 'rvm9thaM0Tz5d_Npq8IjB5', 'อักษรพลาสวูดติดอะคริลิค.jpg', 'e850ac7c67e655dfc7d7de0520d0472e.jpg', '2021-05-17 13:53:29', null, null, '1');
INSERT INTO `uploads` VALUES ('47', 'c9N55osIC_CIUSmwRvpxA8', '11.jpg', 'e9cfe1b4fe9bbfc440552c22a6b79ca9.jpg', '2021-05-17 13:54:16', null, null, '1');
INSERT INTO `uploads` VALUES ('48', 'c9N55osIC_CIUSmwRvpxA8', '22.jpg', '225f525cdf2b03a59e50281fb4620b69.jpg', '2021-05-17 13:54:17', null, null, '1');
INSERT INTO `uploads` VALUES ('49', 'c9N55osIC_CIUSmwRvpxA8', '33.jpg', 'f520ff578df333a2bd28a781b91a3639.jpg', '2021-05-17 13:54:18', null, null, '1');
INSERT INTO `uploads` VALUES ('50', 'c9N55osIC_CIUSmwRvpxA8', '44.jpg', '52594bd8f9591ec641a028b7e58b41b9.jpg', '2021-05-17 13:54:20', null, null, '1');
INSERT INTO `uploads` VALUES ('51', '1H4lapdwujcmGq_GozTG8T', '777.jpg', '01d6ddd76ecc5625095509d083e36b72.jpg', '2021-05-17 13:55:19', null, null, '1');
INSERT INTO `uploads` VALUES ('52', 'YUWuIUIZ-FXoTHzsyEsSsg', 'งานวัดไผล้อม.jpg', '391a4e91238aee5eebdfd1851f541203.jpg', '2021-05-17 15:03:19', null, null, '1');
INSERT INTO `uploads` VALUES ('53', '3qfWzNL0gNGXQjOCaR6YTi', 'Yu ยู้แอนด์ยู คลินิก 1.jpg', '5ad982745f9d69a40cd1a77a06d6af01.jpg', '2021-05-18 09:32:44', null, null, '1');
INSERT INTO `uploads` VALUES ('54', 'smsAUtAppXgyB1MUq4CJb2', 'S__6242317.jpg', '1a66e655fb02d9aa355c53a7fe7a0ae8.jpg', '2021-05-18 11:57:55', null, null, '1');
INSERT INTO `uploads` VALUES ('55', 'sgz9PW-2ZjBG_BcyKy8D2O', '1.jpg', '668f46eabf7153e823b59cfc171ae477.jpg', '2021-05-18 11:59:00', null, null, '1');
INSERT INTO `uploads` VALUES ('56', 'sgz9PW-2ZjBG_BcyKy8D2O', '2.jpg', '276d11c9d9133d859bfcd89bedcd4ea4.jpg', '2021-05-18 11:59:02', null, null, '1');
INSERT INTO `uploads` VALUES ('57', 'sgz9PW-2ZjBG_BcyKy8D2O', '3.jpg', '8ec4a89a40730d181e4bf9bf388d1ac2.jpg', '2021-05-18 11:59:02', null, null, '1');
INSERT INTO `uploads` VALUES ('58', 'VGDJHNajZ9BinScLlFOb4y', '1.jpg', 'e9824fa62f4b180d61604bfd392e3ab4.jpg', '2021-05-19 09:21:06', null, null, '1');
INSERT INTO `uploads` VALUES ('59', 'Dyc_ZxmgoF5OQCYwqL2q_7', '12345.jpg', '3d5caf8318e9a7fdefeca252d56ff1f0.jpg', '2021-05-19 11:12:50', null, null, '1');

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
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'admin', 'kimniyomclub@gmail.com', '$2y$12$MenOVpHsMKOW0zYIFAD1ruqkamrLlEG1YIkcKOD9/eGmR9ECXzzsO', 'eVObZ98v26jv2RAmbdeUIlaHK4uJ8S-8', '1617557741', null, null, '::1', '1617557092', '1617557092', '0', '1621387699', 'A');
INSERT INTO `user` VALUES ('2', 'demo', 'demo@gmail.com', '$2y$12$.RUfnRDvHlClPXSb.7NqFe9.8IAMooWjk63zJqOjLzPib.fpjNmEu', 'plDiCAlz6oFWCndrv4WHPeObSu1Ucf5-', '1617559566', null, null, '::1', '1617559566', '1620785219', '0', '1620892243', 'U');
INSERT INTO `user` VALUES ('6', 'kimniyom', '123@gmail.com', '$2y$12$NL13psXOId80ykwkmNYdte/GXhrd/jXsHNms.WpWO.N6O6fVnAS42', 'b3uR2qjlXICxPVN7h-FDBTWMUON8R7v0', '1618703595', null, null, '::1', '1618703595', '1618703595', '0', '1619066604', 'U');
INSERT INTO `user` VALUES ('8', 'marketing1', 'marketing@natdesigntak.com', '$2y$12$s9nzt0ro08WKmok.HTgWIegzowEBAbE6gSwBGtp173ts28ndZ9ZJ6', 'bQYe0AA-eiJ69oCPWXDonoYYT1vbmXzY', '1620129337', null, null, '49.48.207.49', '1620129337', '1620129374', '0', '1621475167', 'U');
INSERT INTO `user` VALUES ('9', 'Accounts1', 'ac1@natdesigntak.com', '$2y$12$X5TE/UD40FwEmZj3BRjc5uypvXluCVFGXRrW1pFcsLllrPY8NRtp6', 'eKLsvIznGZzAiyFlsn6Qvds00HEQfqbM', '1620129817', null, null, '49.48.207.49', '1620129817', '1620130114', '0', '1621474159', 'U');
INSERT INTO `user` VALUES ('10', 'Accounts2', 'ac2@natdesigntak.com', '$2y$12$QblQzpX/Sk81fo1WLjAeMuTVfvPmmvWnbXNwwybO1qKtU.mPtIK.G', '-jfekN7HnwR73tuDEK6TwOnmLdEFvNzJ', '1620129989', null, null, '49.48.207.49', '1620129989', '1620129989', '0', null, 'U');
INSERT INTO `user` VALUES ('11', 'Accounts3', 'ac3@natdesigntak.com', '$2y$12$3YcoXHOgG86PFjNCGVXjyeRFu2mEIKT67Clwfa/nv3fzLwwKnAo4e', 'pkbsihmPGfI4x7FcaMU1KiUv5Ho3wRc6', '1620130146', null, null, '49.48.207.49', '1620130146', '1620130146', '0', null, 'U');
INSERT INTO `user` VALUES ('12', 'Graphic', 'graphic@natdesigntak.com', '$2y$12$N7T0Tt2c7XWS7hyxMdu5UOKKcJQe9S1lVjOpo6GafgRBD0JuDh/Oq', '3qtUEslIie7ne69JE8EVRq-vrRaQX3dl', '1620175500', null, null, '49.48.207.49', '1620175500', '1620175500', '0', '1621301738', 'U');
INSERT INTO `user` VALUES ('13', 'Printing', 'printing@natdesigntak.com', '$2y$12$dFsnaM4YK4hWmigMg7lkLON.F0GDfo8I3NDoU96PnqgsyxCbaNcOS', '4AXQJ3nEQeHgr2NJRbFDPg4bm41pGxNt', '1620175748', null, null, '49.48.207.49', '1620175748', '1620175748', '0', '1621390487', 'U');
INSERT INTO `user` VALUES ('14', 'Cutting', 'cutting@natdesigntak.com', '$2y$12$IIqEX/DEnGZQRsRoYc3cn.mhlCilwYtXxdeeMAfSwAoQpmfbJA6u.', 'UmkEjlfj1zIoE6EJV5fjgY3oFOlXsPjN', '1620175853', null, null, '49.48.207.49', '1620175853', '1620175853', '0', '1620367342', 'U');
INSERT INTO `user` VALUES ('15', 'Production', 'production@natdesigntak.com', '$2y$12$2do7mdU6ZiAhba/YEILfA.IczvN1rrN7h.SyNP0lh4sXqqBBQTgrK', 'wxUxRY0j2gB7G25KIiy_EDgwwjI7Ix1L', '1620175993', null, null, '49.48.207.49', '1620175993', '1620175993', '0', '1621411561', 'U');
INSERT INTO `user` VALUES ('16', 'Manager', 'fern.worra@gmail.com', '$2y$12$TiFEAn9cL3UakE27cnu47ekuE3AQTyWQ53Mx/mR2JDTbMYhIN87de', 'K6gJiIuWqij2QCXAMjDaoyjohdcwm6-9', '1620176182', null, null, '49.48.207.49', '1620176182', '1620176916', '0', '1621035022', 'A');
INSERT INTO `user` VALUES ('17', 'nat', 'natmawan@gmail.com', '$2y$12$p4WPDbPmH.zqJS3jYlne3ei/W9mDR6q4Tdgt/VCh4bG5zyIW9MYmG', '-8BOjhYHFCiHXlkp8OJ3BHzW3fQd5mc4', '1620176380', null, null, '49.48.207.49', '1620176380', '1620892179', '0', '1621328998', 'A');
INSERT INTO `user` VALUES ('18', 'setup', 'installation@natdesigntak.com', '$2y$12$CAozNljF1iBVDxqw2FGtXuyU4VGQjxZwWqaUGiRrgMTXcYc3oCcou', 'gI345KcOtEtapIWkCDk8ZnA0yyiNDi-n', '1620176694', null, null, '49.48.207.49', '1620176694', '1620804953', '0', '1620807021', 'U');
