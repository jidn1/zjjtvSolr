/*
Navicat MySQL Data Transfer

Source Server         : lims102
Source Server Version : 50022
Source Host           : localhost:3306
Source Database       : limsec

Target Server Type    : MYSQL
Target Server Version : 50022
File Encoding         : 65001

Date: 2017-09-07 08:20:20
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for commission_order
-- ----------------------------
DROP TABLE IF EXISTS `commission_order`;
CREATE TABLE `commission_order` (
  `COMMISSION_UUID` varchar(100) NOT NULL,
  `COMMISSION_CODE` varchar(100) default NULL,
  `ORDER_TIME` datetime default NULL,
  `COMMISSION_DATE` datetime default NULL,
  `INTENDED_DATE` datetime default NULL,
  `SUBMISSION_DATE` datetime default NULL,
  `RETRIEVE_DATE` datetime default NULL,
  `ENTRUSTED_UNIT` varchar(225) default NULL,
  `CONTACTS_PERSON` varchar(100) default NULL,
  `CONTACTS_ADDRESS` varchar(225) default NULL,
  `CONTACTS_PHONE` varchar(100) default NULL,
  `CERTIFICATE_NAME` varchar(100) default NULL,
  `CERTIFICATE_ADDRESS` varchar(225) default NULL,
  `INVOICE_HEADER` varchar(100) default NULL,
  `DELIVERY_PLATFORM` varchar(225) default NULL,
  `REMARK` varchar(225) default NULL,
  `COMMISSION_TYPE` varchar(100) default NULL,
  `TOTAL_FEE` decimal(10,2) default NULL,
  `SPARE_1` varchar(100) default NULL,
  `SPARE_2` varchar(100) default NULL,
  `SPARE_3` varchar(100) default NULL,
  `SPARE_4` varchar(100) default NULL,
  PRIMARY KEY  (`COMMISSION_UUID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of commission_order
-- ----------------------------

-- ----------------------------
-- Table structure for commission_order_item
-- ----------------------------
DROP TABLE IF EXISTS `commission_order_item`;
CREATE TABLE `commission_order_item` (
  `COMMISSION_ITEM_UUID` varchar(100) NOT NULL,
  `COMMISSION_UUID` varchar(100) default NULL,
  `EQUIPMENT_UUID` varchar(100) default NULL,
  `SPARE_1` varchar(100) default NULL,
  `SPARE_2` varchar(100) default NULL,
  `SPAER_3` varchar(100) default NULL,
  `SPARE_4` varchar(100) default NULL,
  PRIMARY KEY  (`COMMISSION_ITEM_UUID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of commission_order_item
-- ----------------------------

-- ----------------------------
-- Table structure for company
-- ----------------------------
DROP TABLE IF EXISTS `company`;
CREATE TABLE `company` (
  `COMPANY_UUID` varchar(100) NOT NULL,
  `COMPANY_NAME` varchar(225) default NULL,
  `COMPANY_CODE` varchar(225) default NULL,
  `COMPANY_ADDRESS` varchar(500) default NULL,
  `COMPANY_ZIP_CODE` varchar(100) default NULL,
  `COMPANY_OPEN_BANK` varchar(225) default NULL,
  `COMPANY_CARD_NUMBER` varchar(100) default NULL,
  `CERTIFICATE_NAME` varchar(200) default NULL,
  `CERTIFICATE_ADDRESS` varchar(200) default NULL,
  `INVOICE_HEAD` varchar(200) default NULL,
  `SPARE_1` varchar(100) default NULL,
  `SPARE_2` varchar(100) default NULL,
  `SPARE_3` varchar(100) default NULL,
  PRIMARY KEY  (`COMPANY_UUID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of company
-- ----------------------------
INSERT INTO `company` VALUES ('04c6fdca-92e6-40e9-93a0-514202983c04', '远航科峰', 'EC0001', '北京市海淀区上地六街研华大厦6层', '100085', '北京银行', '623811458546987564', null, null, null, null, null, null);

-- ----------------------------
-- Table structure for data_dictionary
-- ----------------------------
DROP TABLE IF EXISTS `data_dictionary`;
CREATE TABLE `data_dictionary` (
  `id` int(11) NOT NULL auto_increment,
  `DICTIONARY_NAME` varchar(200) default NULL,
  `DICTIONARY_VALUE` varchar(100) default NULL,
  `DICTIONARY_STATUS` varchar(20) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of data_dictionary
-- ----------------------------
INSERT INTO `data_dictionary` VALUES ('1', '器具计划自动生成开关 ', '7', 'Y');
INSERT INTO `data_dictionary` VALUES ('2', '器具计划自动生成周期 ', '30', 'N');
INSERT INTO `data_dictionary` VALUES ('3', '器具到期提醒天数 ', '7', 'N');
INSERT INTO `data_dictionary` VALUES ('4', '计划到期提醒天数 ', '7', 'N');
INSERT INTO `data_dictionary` VALUES ('5', '近7天订单提醒天数 ', '7', 'N');
INSERT INTO `data_dictionary` VALUES ('6', '器具型号/规格字段合并', '', 'N');

-- ----------------------------
-- Table structure for department
-- ----------------------------
DROP TABLE IF EXISTS `department`;
CREATE TABLE `department` (
  `DEPARTMENT_UUID` varchar(100) NOT NULL,
  `DEPARTMENT_CODE` varchar(100) default NULL,
  `DEPARTMENT_NAME` varchar(100) default NULL,
  `DEPARTMENT_COMPANY_UUID` varchar(100) default NULL,
  `DEPARTMENT_PARENT` varchar(100) default NULL,
  `DEPARTMENT_NUMBER` int(11) default NULL,
  `SPARE_1` varchar(100) default NULL,
  `SPARE_2` varchar(255) default NULL,
  `SPARE_3` varchar(255) default NULL,
  PRIMARY KEY  (`DEPARTMENT_UUID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of department
-- ----------------------------
INSERT INTO `department` VALUES ('1e41aa3b-0d49-42d4-afd6-cde3f2df1e20', 'YUANH202', '销售部', '04c6fdca-92e6-40e9-93a0-514202983c04', '56321cf0-68cc-4c32-a9cd-98cabc36bc7c', '2', null, null, null);
INSERT INTO `department` VALUES ('2b92d22a-a7f6-4e5f-9f84-871644adc8c9', 'YUANH102', '研发二部', '04c6fdca-92e6-40e9-93a0-514202983c04', 'c22cadc1-8b67-4365-b143-9ecc789c0021', '2', null, null, null);
INSERT INTO `department` VALUES ('56321cf0-68cc-4c32-a9cd-98cabc36bc7c', 'YUANH2', '市场部', '04c6fdca-92e6-40e9-93a0-514202983c04', '0', '0', null, null, null);
INSERT INTO `department` VALUES ('8d172b25-8fa6-49d0-91be-0e921c5ab97e', 'YUANH101', '研发一部', '04c6fdca-92e6-40e9-93a0-514202983c04', 'c22cadc1-8b67-4365-b143-9ecc789c0021', '1', null, null, null);
INSERT INTO `department` VALUES ('b7b3b1b7-7867-4a61-a6dc-40f1518b9bf7', 'YUANH2021', '销售一组', '04c6fdca-92e6-40e9-93a0-514202983c04', '1e41aa3b-0d49-42d4-afd6-cde3f2df1e20', '1', null, null, null);
INSERT INTO `department` VALUES ('c22cadc1-8b67-4365-b143-9ecc789c0021', 'YUANH1', '产品研发', '04c6fdca-92e6-40e9-93a0-514202983c04', '0', '0', null, null, null);
INSERT INTO `department` VALUES ('cf5388a4-cd32-43e5-9a2b-fe6abcd4ac2a', 'YUANH201', '市场一部', '04c6fdca-92e6-40e9-93a0-514202983c04', '56321cf0-68cc-4c32-a9cd-98cabc36bc7c', '1', null, null, null);

-- ----------------------------
-- Table structure for enum_custom
-- ----------------------------
DROP TABLE IF EXISTS `enum_custom`;
CREATE TABLE `enum_custom` (
  `enumid` int(11) NOT NULL auto_increment,
  `enumValue` varchar(100) default NULL,
  `fieldid` int(11) default NULL,
  `userId` varchar(100) default NULL,
  PRIMARY KEY  (`enumid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of enum_custom
-- ----------------------------
INSERT INTO `enum_custom` VALUES ('1', '吉德宁', '1', '2d681150-80f8-45af-90d6-88889c97da80');
INSERT INTO `enum_custom` VALUES ('2', '刘新', '1', '2d681150-80f8-45af-90d6-88889c97da80');
INSERT INTO `enum_custom` VALUES ('3', '吉德宁', '9', '2d681150-80f8-45af-90d6-88889c97da80');
INSERT INTO `enum_custom` VALUES ('4', 'SDF', '2', '2d681150-80f8-45af-90d6-88889c97da80');

-- ----------------------------
-- Table structure for equipment
-- ----------------------------
DROP TABLE IF EXISTS `equipment`;
CREATE TABLE `equipment` (
  `EQUIPMENT_UUID` varchar(100) NOT NULL,
  `EQUIPMENT_NAME` varchar(100) default NULL,
  `EQUIPMENT_MODEL` varchar(100) default NULL,
  `EQUIPMENT_SPECIFICATION` varchar(100) default NULL,
  `SERIAL_NUMBER` varchar(100) default NULL,
  `EQUIPMENT_STATUS` varchar(20) default NULL,
  `ACCURACY_LEVEL` varchar(225) default NULL,
  `ABC_CLASSIFICATION` varchar(20) default NULL,
  `ABC_NUMBER` varchar(100) default NULL,
  `COLOR_APPENDIX` varchar(225) default NULL,
  `EQUIPMENT_PERSON` varchar(100) default NULL,
  `EQUIPMENT_VERIFIED` varchar(100) default NULL,
  `MANUFACTURER` varchar(100) default NULL,
  `MEASURING_RANGE` varchar(100) default NULL,
  `UNCERTAINTY` varchar(100) default NULL,
  `FILE_NUMBER` varchar(100) default NULL,
  `CUSTOMER_NUMBER` varchar(100) default NULL,
  `PRODUCTION_DATE` datetime default NULL,
  `MEASUREMENT_CATEGORY` varchar(100) default NULL,
  `EQUIPMENT_COUNT` int(11) default NULL,
  `BASIC_REMARK` varchar(100) default NULL,
  `CHECK_REMARK` varchar(100) default NULL,
  `EQUIPMENT_CREATER` varchar(100) default NULL,
  `CREATER_DATE` datetime default NULL,
  `VERIFICATION_INSTITUTION` varchar(100) default NULL,
  `VERIFICATION_DATE` datetime default NULL,
  `VERIFICATION_CYCLE` int(11) default NULL,
  `VALID_DATE` datetime default NULL,
  `VERIFICATION_RESULT` varchar(20) default NULL,
  `INSPECTION_TYPE` varchar(100) default NULL,
  `CALIBRATION_FEE` decimal(7,2) default NULL,
  `BUDGET_FEE` decimal(7,2) default NULL,
  `CERTIFICATE_NUMBER` varchar(100) default NULL,
  `FIRST_INSPECTION_DATE` datetime default NULL,
  `VERIFICATION_UNIT` varchar(100) default NULL,
  `COMPLETION_DATE` datetime default NULL,
  `PURCHASE_DATE` datetime default NULL,
  `PURCHASE_PRICE` decimal(7,2) default NULL,
  `STORAGE_REMARK` varchar(100) default NULL,
  `SUBORDINATE_SECTOR` varchar(100) default NULL,
  `EQUIPMENT_USER` varchar(100) default NULL,
  `RECEIVE_DATE` datetime default NULL,
  `ENABLE_DATE` datetime default NULL,
  `EQUIPMENT_USEUNIT` varchar(100) default NULL,
  `RECEIVE_STATE` varchar(20) default NULL,
  `PLAN_NUMBER` varchar(100) default NULL,
  `ORDER_NUMBER` varchar(100) default NULL,
  `PLAN_STATE` varchar(20) default NULL,
  `ORDER_STATE` varchar(20) default NULL,
  `SPARE_1` varchar(100) default NULL,
  `SPARE_2` varchar(100) default NULL,
  `SPARE_3` varchar(100) default NULL,
  `SPARE_4` varchar(100) default NULL,
  `SPARE_5` varchar(100) default NULL,
  `SPARE_6` varchar(100) default NULL,
  `ALTER_FIELD_1` varchar(100) default NULL,
  `ALTER_FIELD_2` varchar(100) default NULL,
  `ALTER_FIELD_3` varchar(100) default NULL,
  `ALTER_FIELD_4` varchar(100) default NULL,
  PRIMARY KEY  (`EQUIPMENT_UUID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of equipment
-- ----------------------------
INSERT INTO `equipment` VALUES ('12b9c1fe-f54d-4f78-b774-88ee37b19f97', '显示器', 'LSD-003', 'Lenovo-0201', 'XSQ-1001', 'EQUIPMENT_STATUS_5', '', 'A', 'TL001', null, '周瑜', '诸葛亮', '北京朝阳三元桥', '', '', 'SD-10013', 'ECL0001', '2017-07-20 00:00:00', '测试类别', '212', '显示器基本信息备注', '校检备注', null, null, '中检集团', '2017-07-20 00:00:00', '0', '2017-07-05 00:00:00', 'EQUIP_TEST_RESULT1', '一般', '23.30', '125.00', 'JL000003', '2017-07-20 00:00:00', '中检远航', '2017-07-20 00:00:00', '2017-06-01 00:00:00', '58.00', null, '研发一部', '黄盖', '2017-04-01 00:00:00', '2017-07-01 00:00:00', '研发二部', '已接收', null, null, null, null, '本厂编号', '2017-07-31', null, null, null, null, null, null, null, null);
INSERT INTO `equipment` VALUES ('276d71a0-91a0-4407-9422-70b151a875a7', '螺丝卡尺', 'LSD-002', null, 'SKC-10101', 'EQUIPMENT_STATUS_1', '', 'A', 'TL001', null, null, '', '江苏', '', '', 'SD-10012', 'ECL0001', '2017-07-20 00:00:00', '测试类别', '0', null, null, null, null, '中检集团', '2017-07-20 00:00:00', '0', '2017-07-05 00:00:00', '', '加急', '0.00', '0.00', 'JL000002', '2017-07-20 00:00:00', '中检远航', '2017-07-20 00:00:00', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `equipment` VALUES ('5601f50b-9a79-462d-967c-f5af3691fc49', '手机屏幕', 'LSD-007', '', 'SJ-0029321', 'EQUIPMENT_STATUS_10', '', 'A', 'TL001', null, '关羽', '刘备', '北京海淀上地五街', '', '', 'SD-10017', 'ECL0001', '2015-01-01 00:00:00', '测试类别', '256', '手机屏幕基本信息备注', '校检备注', null, null, '中检集团', '2017-06-01 00:00:00', '1', '2017-07-05 00:00:00', 'EQUIP_TEST_RESULT1', '一般', '23.30', '125.00', 'JL000007', '2016-07-01 00:00:00', '中检远航', '2017-06-30 00:00:00', '2017-07-11 00:00:00', '143.00', null, '研发一部', '张飞', '2017-07-01 00:00:00', '2017-07-31 00:00:00', '研发二部', '已接收', null, null, null, null, '本厂编号', null, null, null, null, null, null, null, null, null);
INSERT INTO `equipment` VALUES ('57dada3a-2761-45c1-b5c2-a56df4884d76', '螺丝钉', 'LSD-008', 'Lenovo-0201', 'LSD-1021432', 'EQUIPMENT_STATUS_5', '', '', 'TL001', 'D:\\ecColorAppendix//limsEC表结构文档.docx', '周瑜', '诸葛亮', '湖南长沙', '', '', 'SD-10018', 'ECL0001', '2013-07-01 00:00:00', '测试类别', '256', '螺丝钉基本信息备注', '校检备注', null, null, '中检集团', '2017-03-01 00:00:00', '2', '2019-07-01 00:00:00', 'EQUIP_TEST_RESULT1', '一般', '100.00', '125.00', 'JL000008', '2015-08-14 00:00:00', '中检远航', '2017-07-14 00:00:00', '2017-07-04 00:00:00', '143.00', null, '快送检一部', '黄盖', '2017-07-13 00:00:00', '2017-07-31 00:00:00', '研发二部', '已接收', null, null, null, null, '本厂编号', null, null, null, null, null, null, null, null, null);
INSERT INTO `equipment` VALUES ('7b4a06a7-9dba-4583-8ce6-9a6308809f39', '铁轨检测仪', 'LSD-006', null, 'TG00101', 'EQUIPMENT_STATUS_6', '', 'A', 'TL001', null, null, '', '沈阳大连', '', '', 'SD-10016', 'ECL0001', '2017-07-20 00:00:00', '测试类别', '0', null, null, null, null, '中检集团', '2017-07-20 00:00:00', '0', '2017-07-05 00:00:00', '', '一般', '0.00', '0.00', 'JL000006', '2017-07-20 00:00:00', '中检远航', '2017-07-20 00:00:00', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `equipment` VALUES ('986f9501-dc8a-4f11-a7dd-15fbd43dc654', '餐巾纸', 'LSD-001', null, 'CJZ-10021', 'EQUIPMENT_STATUS_1', '', 'A', 'TL001', null, null, '', '江西南昌', '', '', 'SD-10011', 'ECL0001', '2017-07-20 00:00:00', '测试类别', '0', null, null, null, null, '中检集团', '2017-07-20 00:00:00', '0', '2017-07-05 00:00:00', '', '加急', '0.00', '0.00', 'JL000001', '2017-07-20 00:00:00', '中检远航', '2017-07-20 00:00:00', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `equipment` VALUES ('ae802b1a-6920-49e0-99c5-aac071096f67', '航天发动机', 'LSD-005', null, 'HT-10102', 'EQUIPMENT_STATUS_2', '', 'A', 'TL001', null, null, '', '北京朝阳', '', '', 'SD-10015', 'ECL0001', '2017-07-20 00:00:00', '测试类别', '0', null, null, null, null, '中检集团', '2017-07-20 00:00:00', '0', '2017-07-20 00:00:00', '', '一般', '0.00', '0.00', 'JL000005', '2017-07-20 00:00:00', '中检远航', '2017-07-20 00:00:00', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for field_custom
-- ----------------------------
DROP TABLE IF EXISTS `field_custom`;
CREATE TABLE `field_custom` (
  `ID` int(11) NOT NULL auto_increment,
  `FIELD_NAME` varchar(50) default NULL,
  `FIELD_TYPE` varchar(50) default NULL,
  `FIELD_DESCRIBE` varchar(255) default NULL,
  `USER_ID` varchar(100) default NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of field_custom
-- ----------------------------
INSERT INTO `field_custom` VALUES ('2', 'spare_2', 'enum', '负责人', '2d681150-80f8-45af-90d6-88889c97da80');
INSERT INTO `field_custom` VALUES ('3', 'spare_1', 'varchar', '本厂编号', '2d681150-80f8-45af-90d6-88889c97da80');

-- ----------------------------
-- Table structure for inspection_plan
-- ----------------------------
DROP TABLE IF EXISTS `inspection_plan`;
CREATE TABLE `inspection_plan` (
  `PLAN_UUID` varchar(100) NOT NULL,
  `PLAN_NUMBER` varchar(100) default NULL,
  `COMPILING_DATE` datetime default NULL,
  `PLAN_NAME` varchar(100) default NULL,
  `PLAN_DEPARTMENT` varchar(100) default NULL,
  `STAR_TIME` datetime default NULL,
  `END_TIME` datetime default NULL,
  `PLAN_NEXT_CHECK_TIME` datetime default NULL,
  `PLAN_PERSON` varchar(100) default NULL,
  `PLAN_ECPLAIN` varchar(225) default NULL,
  `PLAN_STATUS` varchar(100) default NULL,
  `TOTAL_FEE` decimal(7,2) default NULL,
  `EXECUTOR` varchar(100) default NULL,
  `SPARE_1` varchar(100) default NULL,
  `SPARE_2` varchar(100) default NULL,
  `SPARE_3` varchar(100) default NULL,
  `SPARE_4` varchar(100) default NULL,
  PRIMARY KEY  (`PLAN_UUID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of inspection_plan
-- ----------------------------

-- ----------------------------
-- Table structure for inspection_plan_item
-- ----------------------------
DROP TABLE IF EXISTS `inspection_plan_item`;
CREATE TABLE `inspection_plan_item` (
  `PLAN_ITEM_UUID` varchar(100) NOT NULL,
  `PLAN_UUID` varchar(100) default NULL,
  `EQUIPMENT_UUID` varchar(100) default NULL,
  `SPARE_1` varchar(100) default NULL,
  `SPARE_2` varchar(100) default NULL,
  `SPARE_3` varchar(100) default NULL,
  `SPARE_4` varchar(100) default NULL,
  PRIMARY KEY  (`PLAN_ITEM_UUID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of inspection_plan_item
-- ----------------------------

-- ----------------------------
-- Table structure for logo
-- ----------------------------
DROP TABLE IF EXISTS `logo`;
CREATE TABLE `logo` (
  `id` int(11) NOT NULL auto_increment,
  `path` varchar(200) default NULL,
  `userId` varchar(100) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of logo
-- ----------------------------
INSERT INTO `logo` VALUES ('1', 'D:\\images\\ec\\Logo//zhongjian.png', '2d681150-80f8-45af-90d6-88889c97da80');
INSERT INTO `logo` VALUES ('2', 'D:\\images\\ec\\Logo//logo.png', '98ff7ead-40c2-42c6-8ad1-4f119fd38f3c');
INSERT INTO `logo` VALUES ('3', null, '4afa421d-0415-4a03-9da4-c768eb57ad09');
INSERT INTO `logo` VALUES ('4', null, '643f01d3-de6d-400f-8891-762c93d0282e');
INSERT INTO `logo` VALUES ('5', null, '574fa74d-ff6b-4c69-bce3-bac0d0e0a256');

-- ----------------------------
-- Table structure for permission
-- ----------------------------
DROP TABLE IF EXISTS `permission`;
CREATE TABLE `permission` (
  `PERMISSION_UUID` varchar(100) NOT NULL,
  `PERMISSION_NAME` varchar(100) default NULL,
  `BUTTON_VALUE` varchar(100) default NULL,
  `SPARE_1` varchar(100) default NULL,
  `SPARE_2` varchar(100) default NULL,
  `SPARE_3` varchar(100) default NULL,
  PRIMARY KEY  (`PERMISSION_UUID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of permission
-- ----------------------------

-- ----------------------------
-- Table structure for person
-- ----------------------------
DROP TABLE IF EXISTS `person`;
CREATE TABLE `person` (
  `PERSON_UUID` varchar(100) NOT NULL,
  `PERSON_NAME` varchar(100) default NULL,
  `PERSON_EMAIL` varchar(225) default NULL,
  `PERSON_ADDRESS` varchar(225) default NULL,
  `PERSON_FAX` varchar(100) default NULL,
  `IF_PRIMARY_CONTACT` varchar(20) default NULL,
  `PERSON_PHONE` varchar(100) default NULL,
  `PERSON_TELEPHONE` varchar(100) default NULL,
  `REMARK` varchar(100) default NULL,
  `DEPARTMENT_CODE` varchar(100) default NULL,
  `COMPANY_CODE` varchar(225) default NULL,
  `SPARE_1` varchar(100) default NULL,
  `SPARE_2` varchar(100) default NULL,
  `SPARE_3` varchar(100) default NULL,
  `SPARE_4` varchar(100) default NULL,
  PRIMARY KEY  (`PERSON_UUID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of person
-- ----------------------------

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `ROLE_ID` int(11) NOT NULL auto_increment,
  `ROLE_NAME` varchar(100) default NULL,
  `ROLE_PERMISSION` varchar(100) default NULL,
  PRIMARY KEY  (`ROLE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('1', '超级管理员', 'ROLE_PERMISSION_0');
INSERT INTO `role` VALUES ('2', '器具管理员', 'ROLE_PERMISSION_1');
INSERT INTO `role` VALUES ('3', '计划管理员', 'ROLE_PERMISSION_2');
INSERT INTO `role` VALUES ('4', '计划执行员', 'ROLE_PERMISSION_3');
INSERT INTO `role` VALUES ('5', '订单确认人', 'ROLE_PERMISSION_4');
INSERT INTO `role` VALUES ('6', '器具负责人', 'ROLE_PERMISSION_5');

-- ----------------------------
-- Table structure for role_person_relationship
-- ----------------------------
DROP TABLE IF EXISTS `role_person_relationship`;
CREATE TABLE `role_person_relationship` (
  `ID` int(11) NOT NULL auto_increment,
  `ROLE_ID` int(11) default NULL,
  `USER_UUID` varchar(100) default NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role_person_relationship
-- ----------------------------
INSERT INTO `role_person_relationship` VALUES ('1', '1', '2d681150-80f8-45af-90d6-88889c97da80');

-- ----------------------------
-- Table structure for security_permission
-- ----------------------------
DROP TABLE IF EXISTS `security_permission`;
CREATE TABLE `security_permission` (
  `PERMISSION_ID` varchar(60) NOT NULL,
  `DESCRIPTION` varchar(255) default NULL,
  `DYNAMIC_ACCESS` varchar(255) default NULL,
  `LAST_UPDATED_STAMP` datetime default NULL,
  `LAST_UPDATED_TX_STAMP` datetime default NULL,
  `CREATED_STAMP` datetime default NULL,
  `CREATED_TX_STAMP` datetime default NULL,
  `MODEL_ID` varchar(60) default NULL,
  `RANK` decimal(20,0) default NULL,
  PRIMARY KEY  (`PERMISSION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of security_permission
-- ----------------------------
INSERT INTO `security_permission` VALUES ('NOTICE0_1', '查询', null, '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', 'NOTICE0', '2');
INSERT INTO `security_permission` VALUES ('NOTICE0_ADMIN', '全部', null, '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', 'NOTICE0', '1');
INSERT INTO `security_permission` VALUES ('ORDERLEVEL0', '立项申报', null, '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', 'ORDERLEVEL0', '1');
INSERT INTO `security_permission` VALUES ('ORDERLEVEL0_0_1', '查询', null, '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', 'ORDERLEVEL0_0', '2');
INSERT INTO `security_permission` VALUES ('ORDERLEVEL0_0_ADMIN', '全部', null, '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', 'ORDERLEVEL0_0', '1');
INSERT INTO `security_permission` VALUES ('ORDERLEVEL0_1_1', '查询', null, '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', 'ORDERLEVEL0_1', '2');
INSERT INTO `security_permission` VALUES ('ORDERLEVEL0_1_ADMIN', '全部', null, '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', 'ORDERLEVEL0_1', '1');
INSERT INTO `security_permission` VALUES ('ORDERLEVEL0_2_1', '查询', null, '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', 'ORDERLEVEL0_2', '2');
INSERT INTO `security_permission` VALUES ('ORDERLEVEL0_2_ADMIN', '全部', null, '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', 'ORDERLEVEL0_2', '1');
INSERT INTO `security_permission` VALUES ('ORDERLEVEL1', '论证阶段', null, '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', 'ORDERLEVEL1', '2');
INSERT INTO `security_permission` VALUES ('ORDERLEVEL1_0_1', '查询', null, '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', 'ORDERLEVEL1_0', '2');
INSERT INTO `security_permission` VALUES ('ORDERLEVEL1_0_ADMIN', '全部', null, '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', 'ORDERLEVEL1_0', '1');
INSERT INTO `security_permission` VALUES ('ORDERLEVEL1_1_1', '查询', null, '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', 'ORDERLEVEL1_1', '2');
INSERT INTO `security_permission` VALUES ('ORDERLEVEL1_1_ADMIN', '全部', null, '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', 'ORDERLEVEL1_1', '1');
INSERT INTO `security_permission` VALUES ('ORDERLEVEL1_2_1', '查询', null, '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', 'ORDERLEVEL1_2', '2');
INSERT INTO `security_permission` VALUES ('ORDERLEVEL1_2_ADMIN', '全部', null, '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', 'ORDERLEVEL1_2', '1');
INSERT INTO `security_permission` VALUES ('ORDERLEVEL1_3_1', '查询', null, '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', 'ORDERLEVEL1_3', '2');
INSERT INTO `security_permission` VALUES ('ORDERLEVEL1_3_ADMIN', '全部', null, '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', 'ORDERLEVEL1_3', '1');
INSERT INTO `security_permission` VALUES ('ORDERLEVEL1_4_1', '查询', null, '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', 'ORDERLEVEL1_4', '2');
INSERT INTO `security_permission` VALUES ('ORDERLEVEL1_4_ADMIN', '全部', null, '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', 'ORDERLEVEL1_4', '1');
INSERT INTO `security_permission` VALUES ('ORDERLEVEL2', '立项评审', null, '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', 'ORDERLEVEL2', '3');
INSERT INTO `security_permission` VALUES ('ORDERLEVEL2_0_1', '查询', null, '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', 'ORDERLEVEL2_0', '2');
INSERT INTO `security_permission` VALUES ('ORDERLEVEL2_0_ADMIN', '全部', null, '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', 'ORDERLEVEL2_0', '1');
INSERT INTO `security_permission` VALUES ('ORDERLEVEL2_1_1', '查询', null, '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', 'ORDERLEVEL2_1', '2');
INSERT INTO `security_permission` VALUES ('ORDERLEVEL2_1_ADMIN', '全部', null, '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', 'ORDERLEVEL2_1', '1');
INSERT INTO `security_permission` VALUES ('ORDERLEVEL2_2_1', '查询', null, '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', 'ORDERLEVEL2_2', '2');
INSERT INTO `security_permission` VALUES ('ORDERLEVEL2_2_ADMIN', '全部', null, '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', 'ORDERLEVEL2_2', '1');
INSERT INTO `security_permission` VALUES ('ORDERLEVEL2_3_1', '查询', null, '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', 'ORDERLEVEL2_3', '2');
INSERT INTO `security_permission` VALUES ('ORDERLEVEL2_3_ADMIN', '全部', null, '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', 'ORDERLEVEL2_3', '1');
INSERT INTO `security_permission` VALUES ('ORDERLEVEL3', '任务下发', null, '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', 'ORDERLEVEL3', '4');
INSERT INTO `security_permission` VALUES ('ORDERLEVEL3_0_1', '查询', null, '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', 'ORDERLEVEL3_0', '2');
INSERT INTO `security_permission` VALUES ('ORDERLEVEL3_0_ADMIN', '全部', null, '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', 'ORDERLEVEL3_0', '1');
INSERT INTO `security_permission` VALUES ('ORDERLEVEL3_1_1', '查询', null, '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', 'ORDERLEVEL3_1', '2');
INSERT INTO `security_permission` VALUES ('ORDERLEVEL3_1_ADMIN', '全部', null, '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', 'ORDERLEVEL3_1', '1');
INSERT INTO `security_permission` VALUES ('ORDERLEVEL4', '形成计划', null, '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', 'ORDERLEVEL4', '5');
INSERT INTO `security_permission` VALUES ('ORDERLEVEL4_0_1', '查询', null, '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', 'ORDERLEVEL4_0', '2');
INSERT INTO `security_permission` VALUES ('ORDERLEVEL4_0_ADMIN', '全部', null, '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', 'ORDERLEVEL4_0', '1');
INSERT INTO `security_permission` VALUES ('ORDERLEVEL4_1_1', '查询', null, '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', 'ORDERLEVEL4_1', '2');
INSERT INTO `security_permission` VALUES ('ORDERLEVEL4_1_ADMIN', '全部', null, '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', 'ORDERLEVEL4_1', '1');
INSERT INTO `security_permission` VALUES ('ORDERLEVEL5', '标准起草', null, '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', 'ORDERLEVEL5', '6');
INSERT INTO `security_permission` VALUES ('ORDERLEVEL5_0_1', '查询', null, '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', 'ORDERLEVEL5_0', '2');
INSERT INTO `security_permission` VALUES ('ORDERLEVEL5_0_ADMIN', '全部', null, '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', 'ORDERLEVEL5_0', '1');
INSERT INTO `security_permission` VALUES ('ORDERLEVEL5_1_1', '查询', null, '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', 'ORDERLEVEL5_1', '2');
INSERT INTO `security_permission` VALUES ('ORDERLEVEL5_1_ADMIN', '全部', null, '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', 'ORDERLEVEL5_1', '1');
INSERT INTO `security_permission` VALUES ('ORDERLEVEL5_2_1', '查询', null, '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', 'ORDERLEVEL5_2', '2');
INSERT INTO `security_permission` VALUES ('ORDERLEVEL5_2_ADMIN', '全部', null, '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', 'ORDERLEVEL5_2', '1');
INSERT INTO `security_permission` VALUES ('ORDERLEVEL5_3_1', '查询', null, '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', 'ORDERLEVEL5_3', '2');
INSERT INTO `security_permission` VALUES ('ORDERLEVEL5_3_ADMIN', '全部', null, '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', 'ORDERLEVEL5_3', '1');
INSERT INTO `security_permission` VALUES ('ORDERLEVEL5_4_1', '查询', null, '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', 'ORDERLEVEL5_4', '2');
INSERT INTO `security_permission` VALUES ('ORDERLEVEL5_4_ADMIN', '全部', null, '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', 'ORDERLEVEL5_4', '1');
INSERT INTO `security_permission` VALUES ('ORDERLEVEL5_5_1', '查询', null, '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', 'ORDERLEVEL5_5', '2');
INSERT INTO `security_permission` VALUES ('ORDERLEVEL5_5_ADMIN', '全部', null, '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', 'ORDERLEVEL5_5', '1');
INSERT INTO `security_permission` VALUES ('ORDERLEVEL6', '征求意见', null, '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', 'ORDERLEVEL6', '7');
INSERT INTO `security_permission` VALUES ('ORDERLEVEL6_0_1', '查询', null, '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', 'ORDERLEVEL6_0', '2');
INSERT INTO `security_permission` VALUES ('ORDERLEVEL6_0_ADMIN', '全部', null, '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', 'ORDERLEVEL6_0', '1');
INSERT INTO `security_permission` VALUES ('ORDERLEVEL6_11_1', '查询', null, '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', 'ORDERLEVEL6_11', '2');
INSERT INTO `security_permission` VALUES ('ORDERLEVEL6_11_ADMIN', '全部', null, '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', 'ORDERLEVEL6_11', '1');
INSERT INTO `security_permission` VALUES ('ORDERLEVEL6_12_1', '查询', null, '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', 'ORDERLEVEL6_12', '2');
INSERT INTO `security_permission` VALUES ('ORDERLEVEL6_12_ADMIN', '全部', null, '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', 'ORDERLEVEL6_12', '1');
INSERT INTO `security_permission` VALUES ('ORDERLEVEL6_13_1', '查询', null, '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', 'ORDERLEVEL6_13', '2');
INSERT INTO `security_permission` VALUES ('ORDERLEVEL6_13_ADMIN', '全部', null, '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', 'ORDERLEVEL6_13', '1');
INSERT INTO `security_permission` VALUES ('ORDERLEVEL6_2_1', '查询', null, '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', 'ORDERLEVEL6_2', '2');
INSERT INTO `security_permission` VALUES ('ORDERLEVEL6_2_ADMIN', '全部', null, '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', 'ORDERLEVEL6_2', '1');
INSERT INTO `security_permission` VALUES ('ORDERLEVEL6_3_1', '查询', null, '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', 'ORDERLEVEL6_3', '2');
INSERT INTO `security_permission` VALUES ('ORDERLEVEL6_3_ADMIN', '全部', null, '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', 'ORDERLEVEL6_3', '1');
INSERT INTO `security_permission` VALUES ('ORDERLEVEL6_4_1', '查询', null, '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', 'ORDERLEVEL6_4', '2');
INSERT INTO `security_permission` VALUES ('ORDERLEVEL6_4_ADMIN', '全部', null, '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', 'ORDERLEVEL6_4', '1');
INSERT INTO `security_permission` VALUES ('ORDERLEVEL6_5_1', '查询', null, '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', 'ORDERLEVEL6_5', '2');
INSERT INTO `security_permission` VALUES ('ORDERLEVEL6_5_ADMIN', '全部', null, '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', 'ORDERLEVEL6_5', '1');
INSERT INTO `security_permission` VALUES ('ORDERLEVEL7', '修改送审', null, '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', 'ORDERLEVEL7', '8');
INSERT INTO `security_permission` VALUES ('ORDERLEVEL7_02_1', '查询', null, '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', 'ORDERLEVEL7_02', '2');
INSERT INTO `security_permission` VALUES ('ORDERLEVEL7_02_ADMIN', '全部', null, '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', 'ORDERLEVEL7_02', '1');
INSERT INTO `security_permission` VALUES ('ORDERLEVEL7_03_1', '查询', null, '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', 'ORDERLEVEL7_03', '2');
INSERT INTO `security_permission` VALUES ('ORDERLEVEL7_03_ADMIN', '全部', null, '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', 'ORDERLEVEL7_03', '1');
INSERT INTO `security_permission` VALUES ('ORDERLEVEL7_0_1', '查询', null, '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', 'ORDERLEVEL7_0', '2');
INSERT INTO `security_permission` VALUES ('ORDERLEVEL7_0_ADMIN', '全部', null, '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', 'ORDERLEVEL7_0', '1');
INSERT INTO `security_permission` VALUES ('ORDERLEVEL7_1_1', '查询', null, '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', 'ORDERLEVEL7_1', '2');
INSERT INTO `security_permission` VALUES ('ORDERLEVEL7_1_ADMIN', '全部', null, '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', 'ORDERLEVEL7_1', '1');
INSERT INTO `security_permission` VALUES ('ORDERLEVEL7_2_1', '查询', null, '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', 'ORDERLEVEL7_2', '2');
INSERT INTO `security_permission` VALUES ('ORDERLEVEL7_2_ADMIN', '全部', null, '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', 'ORDERLEVEL7_2', '1');
INSERT INTO `security_permission` VALUES ('ORDERLEVEL7_3_1', '查询', null, '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', 'ORDERLEVEL7_3', '2');
INSERT INTO `security_permission` VALUES ('ORDERLEVEL7_3_ADMIN', '全部', null, '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', 'ORDERLEVEL7_3', '1');
INSERT INTO `security_permission` VALUES ('ORDERLEVEL7_4_1', '查询', null, '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', 'ORDERLEVEL7_4', '2');
INSERT INTO `security_permission` VALUES ('ORDERLEVEL7_4_ADMIN', '全部', null, '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', 'ORDERLEVEL7_4', '1');
INSERT INTO `security_permission` VALUES ('ORDERLEVEL7_5_1', '查询', null, '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', 'ORDERLEVEL7_5', '2');
INSERT INTO `security_permission` VALUES ('ORDERLEVEL7_5_ADMIN', '全部', null, '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', 'ORDERLEVEL7_51', '1');
INSERT INTO `security_permission` VALUES ('ORDERLEVEL7_6_1', '查询', null, '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', 'ORDERLEVEL7_6', '2');
INSERT INTO `security_permission` VALUES ('ORDERLEVEL7_6_ADMIN', '全部', null, '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', 'ORDERLEVEL7_6', '1');
INSERT INTO `security_permission` VALUES ('ORDERLEVEL7_7_1', '查询', null, '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', 'ORDERLEVEL7_7', '2');
INSERT INTO `security_permission` VALUES ('ORDERLEVEL7_7_ADMIN', '全部', null, '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', 'ORDERLEVEL7_7', '1');
INSERT INTO `security_permission` VALUES ('ORDERLEVEL7_8_1', '查询', null, '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', 'ORDERLEVEL7_8', '2');
INSERT INTO `security_permission` VALUES ('ORDERLEVEL7_8_ADMIN', '全部', null, '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', 'ORDERLEVEL7_8', '1');
INSERT INTO `security_permission` VALUES ('ORDERLEVEL8', '报批发布', null, '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', 'ORDERLEVEL8', '9');
INSERT INTO `security_permission` VALUES ('ORDERLEVEL8_0_1', '查询', null, '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', 'ORDERLEVEL8_0', '2');
INSERT INTO `security_permission` VALUES ('ORDERLEVEL8_0_ADMIN', '全部', null, '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', 'ORDERLEVEL8_0', '1');
INSERT INTO `security_permission` VALUES ('ORDERLEVEL8_1_1', '查询', null, '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', 'ORDERLEVEL8_1', '2');
INSERT INTO `security_permission` VALUES ('ORDERLEVEL8_1_ADMIN', '全部', null, '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', 'ORDERLEVEL8_1', '1');
INSERT INTO `security_permission` VALUES ('ORDERLEVEL8_2_1', '查询', null, '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', 'ORDERLEVEL8_2', '2');
INSERT INTO `security_permission` VALUES ('ORDERLEVEL8_2_ADMIN', '全部', null, '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', 'ORDERLEVEL8_2', '1');
INSERT INTO `security_permission` VALUES ('ORDERLEVEL8_3_1', '查询', null, '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', 'ORDERLEVEL8_3', '2');
INSERT INTO `security_permission` VALUES ('ORDERLEVEL8_3_ADMIN', '全部', null, '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', 'ORDERLEVEL8_3', '1');
INSERT INTO `security_permission` VALUES ('ORDERLEVEL8_4_1', '查询', null, '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', 'ORDERLEVEL8_4', '2');
INSERT INTO `security_permission` VALUES ('ORDERLEVEL8_4_ADMIN', '全部', null, '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', 'ORDERLEVEL8_4', '1');
INSERT INTO `security_permission` VALUES ('ORDERLEVEL8_5_1', '查询', null, '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', 'ORDERLEVEL8_5', '2');
INSERT INTO `security_permission` VALUES ('ORDERLEVEL8_5_ADMIN', '全部', null, '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', 'ORDERLEVEL8_5', '1');
INSERT INTO `security_permission` VALUES ('ORDERLEVEL8_6_1', '查询', null, '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', 'ORDERLEVEL8_6', '2');
INSERT INTO `security_permission` VALUES ('ORDERLEVEL8_6_ADMIN', '全部', null, '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', 'ORDERLEVEL8_6', '1');
INSERT INTO `security_permission` VALUES ('ORDERLEVEL8_7_1', '查询', null, '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', 'ORDERLEVEL8_1', '2');
INSERT INTO `security_permission` VALUES ('ORDERLEVEL8_7_ADMIN', '全部', null, '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', 'ORDERLEVEL8_1', '1');
INSERT INTO `security_permission` VALUES ('ORDERLEVEL8_8_1', '查询', null, '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', 'ORDERLEVEL8_1', '2');
INSERT INTO `security_permission` VALUES ('ORDERLEVEL8_8_ADMIN', '全部', null, '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', 'ORDERLEVEL8_1', '1');
INSERT INTO `security_permission` VALUES ('ORDERLEVEL8_91_1', '查询', null, '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', 'ORDERLEVEL8_10', '2');
INSERT INTO `security_permission` VALUES ('ORDERLEVEL8_91_ADMIN', '全部', null, '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', 'ORDERLEVEL8_10', '1');
INSERT INTO `security_permission` VALUES ('ORDERLEVEL8_9_1', '查询', null, '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', 'ORDERLEVEL8_9', '2');
INSERT INTO `security_permission` VALUES ('ORDERLEVEL8_9_ADMIN', '全部', null, '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', 'ORDERLEVEL8_9', '1');
INSERT INTO `security_permission` VALUES ('ORDERLEVEL_ADMIN', '业务', null, '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', 'ORDERLEVEL_ADMIN', '1');
INSERT INTO `security_permission` VALUES ('ORDERLEVEL_PRINT', '打印', null, '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', 'ORDERLEVEL_PRINT', '11');
INSERT INTO `security_permission` VALUES ('ORDERLEVEL_PRINT_1', '查看', null, '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', 'ORDERLEVEL_PRINT', '2');
INSERT INTO `security_permission` VALUES ('ORDERLEVEL_PRINT_ADMIN', '全部', null, '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', 'ORDERLEVEL_PRINT', '1');
INSERT INTO `security_permission` VALUES ('ORDERLEVEL_REVIEW', '复核', null, '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', 'ORDERLEVEL_REVIEW', '10');
INSERT INTO `security_permission` VALUES ('ORDERLEVEL_REVIEW_1', '查看', null, '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', 'ORDERLEVEL_REVIEW', '2');
INSERT INTO `security_permission` VALUES ('ORDERLEVEL_REVIEW_ADMIN', '全部', null, '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', 'ORDERLEVEL_REVIEW', '1');
INSERT INTO `security_permission` VALUES ('ORDERLEVEL_SEARCH_ADMIN', '业务查询', null, '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', 'ORDERLEVEL_SEARCH_ADMIN', '1');
INSERT INTO `security_permission` VALUES ('RESOURCE_ADMIN', '资源', null, '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', 'RESOURCE_ADMIN', '1');
INSERT INTO `security_permission` VALUES ('RESOURCE_ARCHIVE', '标准归档', null, '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', 'RESOURCE_ARCHIVE', '3');
INSERT INTO `security_permission` VALUES ('RESOURCE_ARCHIVE0_1', '查询', null, '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', 'RESOURCE_ARCHIVE0', '2');
INSERT INTO `security_permission` VALUES ('RESOURCE_ARCHIVE0_ADMIN', '全部', null, '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', 'RESOURCE_ARCHIVE0', '1');
INSERT INTO `security_permission` VALUES ('RESOURCE_REVIEW', '复核', null, '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', 'RESOURCE_REVIEW', '2');
INSERT INTO `security_permission` VALUES ('RESOURCE_REVIEW0_1', '查询', null, '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', 'RESOURCE_REVIEW0', '2');
INSERT INTO `security_permission` VALUES ('RESOURCE_REVIEW0_ADMIN', '全部', null, '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', 'RESOURCE_REVIEW0', '1');
INSERT INTO `security_permission` VALUES ('RESOURCE_STANDARD', '标准', null, '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', 'RESOURCE_STANDARD', '1');
INSERT INTO `security_permission` VALUES ('RESOURCE_STANDARD0_1', '查询', null, '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', 'RESOURCE_REVIEW0', '2');
INSERT INTO `security_permission` VALUES ('RESOURCE_STANDARD0_ADMIN', '全部', null, '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', 'RESOURCE_STANDARD0', '1');
INSERT INTO `security_permission` VALUES ('RESOURCE_STANDARD1_1', '查询', null, '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', 'RESOURCE_REVIEW1', '2');
INSERT INTO `security_permission` VALUES ('RESOURCE_STANDARD1_ADMIN', '全部', null, '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', 'RESOURCE_STANDARD1', '1');
INSERT INTO `security_permission` VALUES ('RESOURCE_STATISTICS', '标准统计', null, '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', 'RESOURCE_STATISTICS', '6');
INSERT INTO `security_permission` VALUES ('RESOURCE_STATISTICS0_1', '查询', null, '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', 'RESOURCE_STATISTICS0', '2');
INSERT INTO `security_permission` VALUES ('RESOURCE_STATISTICS0_ADMIN', '全部', null, '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', 'RESOURCE_STATISTICS0', '1');
INSERT INTO `security_permission` VALUES ('RESOURCE_STATISTICS1_1', '查询', null, '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', 'RESOURCE_STATISTICS1', '2');
INSERT INTO `security_permission` VALUES ('RESOURCE_STATISTICS1_ADMIN', '全部', null, '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', 'RESOURCE_STATISTICS1', '1');
INSERT INTO `security_permission` VALUES ('RESOURCE_SYSTEM', '标准体系管理', null, '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', 'RESOURCE_SYSTEM', '4');
INSERT INTO `security_permission` VALUES ('RESOURCE_SYSTEM0_1', '查询', null, '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', 'RESOURCE_SYSTEM0', '2');
INSERT INTO `security_permission` VALUES ('RESOURCE_SYSTEM0_ADMIN', '全部', null, '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', 'RESOURCE_SYSTEM0', '1');
INSERT INTO `security_permission` VALUES ('RESOURCE_SYSTEM1_1', '查询', null, '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', 'RESOURCE_SYSTEM1', '2');
INSERT INTO `security_permission` VALUES ('RESOURCE_SYSTEM1_ADMIN', '全部', null, '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', 'RESOURCE_SYSTEM1', '1');
INSERT INTO `security_permission` VALUES ('RESOURCE_TEMPLATE', '模版', null, '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', 'RESOURCE_TEMPLATE', '5');
INSERT INTO `security_permission` VALUES ('RESOURCE_TEMPLATE0_1', '查询', null, '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', 'RESOURCE_TEMPLATE0', '2');
INSERT INTO `security_permission` VALUES ('RESOURCE_TEMPLATE0_ADMIN', '全部', null, '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', 'RESOURCE_TEMPLATE0', '1');
INSERT INTO `security_permission` VALUES ('SETTINGS_ADMIN', '设置', null, '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', 'SETTINGS_ADMIN', '1');
INSERT INTO `security_permission` VALUES ('SETTINGS_NOTICE_ADMIN', '公告管理', null, '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', 'NOTICE_ADMIN', '2');
INSERT INTO `security_permission` VALUES ('SETTINGS_SYSTEM_ADMIN', '系统管理', null, '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', 'SYSTEM_ADMIN', '1');
INSERT INTO `security_permission` VALUES ('SYSTEM_ENUMERATION0_1', '查询', null, '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', 'SYSTEM_ENUMERATION0', '2');
INSERT INTO `security_permission` VALUES ('SYSTEM_ENUMERATION0_ADMIN', '全部', null, '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', 'SYSTEM_ENUMERATION0', '1');
INSERT INTO `security_permission` VALUES ('SYSTEM_ORGANIZATION0_1', '查询', null, '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', 'SYSTEM_ORGANIZATION0', '2');
INSERT INTO `security_permission` VALUES ('SYSTEM_ORGANIZATION0_ADMIN', '全部', null, '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', 'SYSTEM_ORGANIZATION0', '1');
INSERT INTO `security_permission` VALUES ('SYSTEM_SECURITY0_1', '查询', null, '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', 'SYSTEM_SECURITY0', '2');
INSERT INTO `security_permission` VALUES ('SYSTEM_SECURITY0_ADMIN', '全部', null, '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', 'SYSTEM_SECURITY0', '1');
INSERT INTO `security_permission` VALUES ('SYSTEM_USERLOGIN0_1', '查询', null, '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', 'SYSTEM_USERLOGIN0', '2');
INSERT INTO `security_permission` VALUES ('SYSTEM_USERLOGIN0_ADMIN', '全部', null, '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', '2016-08-29 11:26:09', 'SYSTEM_USERLOGIN0', '1');

-- ----------------------------
-- Table structure for userlogin
-- ----------------------------
DROP TABLE IF EXISTS `userlogin`;
CREATE TABLE `userlogin` (
  `USER_UUID` varchar(100) NOT NULL,
  `LOGIN_USER` varchar(100) default NULL,
  `LOGIN_PASSWORD` varchar(100) default NULL,
  `USER_NAME` varchar(100) default NULL,
  `USER_EMAIL` varchar(225) default NULL,
  `USER_ADDRESS` varchar(225) default NULL,
  `USER_FAX` varchar(100) default NULL,
  `USER_PHONE` varchar(100) default NULL,
  `USER_TELEPHONE` varchar(100) default NULL,
  `REMARK` varchar(100) default NULL,
  `DEPARTMENT_UUID` varchar(100) default NULL,
  `COMPANY_UUID` varchar(225) default NULL,
  `USER_LEVEL` varchar(200) default NULL,
  `STATE` varchar(20) default NULL,
  `SPARE_1` varchar(100) default NULL,
  `SPARE_2` varchar(100) default NULL,
  `SPARE_3` varchar(100) default NULL,
  `SPARE_4` varchar(100) default NULL,
  PRIMARY KEY  (`USER_UUID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of userlogin
-- ----------------------------
INSERT INTO `userlogin` VALUES ('2d681150-80f8-45af-90d6-88889c97da80', 'snpadmin', '96E79218965EB72C92A549DD5A330112', '远航', 'zjyh@yuanh.net', '北京市海淀区上地六街研华大厦6层', null, '15800000000', null, null, null, '04c6fdca-92e6-40e9-93a0-514202983c04', 'ROLE_PERMISSION_0', '1', null, null, null, null);
INSERT INTO `userlogin` VALUES ('574fa74d-ff6b-4c69-bce3-bac0d0e0a256', 'jidening', '96E79218965EB72C92A549DD5A330112', '吉德宁', '', '', '', '', '', '', '2b92d22a-a7f6-4e5f-9f84-871644adc8c9', '04c6fdca-92e6-40e9-93a0-514202983c04', 'ROLE_PERMISSION_4', '1', null, null, null, null);
INSERT INTO `userlogin` VALUES ('643f01d3-de6d-400f-8891-762c93d0282e', 'liuxin', '96E79218965EB72C92A549DD5A330112', '刘新', '', '', '', '', '', '', '2b92d22a-a7f6-4e5f-9f84-871644adc8c9', '04c6fdca-92e6-40e9-93a0-514202983c04', 'ROLE_PERMISSION_0, ROLE_PERMISSION_2', '1', null, null, null, null);

-- ----------------------------
-- View structure for view_role_course
-- ----------------------------
DROP VIEW IF EXISTS `view_role_course`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_role_course` AS (select `role`.`ROLE_ID` AS `主键`,`role`.`ROLE_NAME` AS `角色名称`,`role`.`ROLE_PERMISSION` AS `角色权限` from `role`) ;

-- ----------------------------
-- Function structure for getChildLst
-- ----------------------------
DROP FUNCTION IF EXISTS `getChildLst`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `getChildLst`(rootId VARCHAR(100)) RETURNS varchar(1000)
BEGIN
       DECLARE sTemp VARCHAR(1000);
       DECLARE sTempChd VARCHAR(1000);
    
      SET sTemp = '$';
      SET sTempChd =rootId;
    
      WHILE sTempChd is not null DO
         SET sTemp = concat(sTemp,',',sTempChd);
         SELECT group_concat(DEPARTMENT_UUID) INTO sTempChd FROM department where FIND_IN_SET(DEPARTMENT_PARENT,sTempChd)>0;
       END WHILE;
       RETURN sTemp;
     END
;;
DELIMITER ;
