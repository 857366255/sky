/*
Navicat MySQL Data Transfer

Source Server         : 127.0.0.1
Source Server Version : 50717
Source Host           : localhost:3306
Source Database       : skyproduction

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2018-03-31 16:40:30
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for t_bom
-- ----------------------------
DROP TABLE IF EXISTS `t_bom`;
CREATE TABLE `t_bom` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '唯一标识符',
  `suppliesid` int(11) DEFAULT NULL COMMENT '产品(半成品)id',
  `suppliesnumber` int(11) DEFAULT NULL COMMENT '产品(半成品)数量',
  PRIMARY KEY (`id`),
  KEY `fk_bom_suppliesid` (`suppliesid`),
  CONSTRAINT `fk_bom_suppliesid` FOREIGN KEY (`suppliesid`) REFERENCES `t_supplies` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='BOM';

-- ----------------------------
-- Records of t_bom
-- ----------------------------
INSERT INTO `t_bom` VALUES ('1', '3', '10');
INSERT INTO `t_bom` VALUES ('3', '1', '10');
INSERT INTO `t_bom` VALUES ('4', '2', '20');

-- ----------------------------
-- Table structure for t_bomdetail
-- ----------------------------
DROP TABLE IF EXISTS `t_bomdetail`;
CREATE TABLE `t_bomdetail` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '唯一标识符',
  `bomid` int(11) DEFAULT NULL COMMENT 'BomId',
  `suppliesid` int(11) DEFAULT NULL COMMENT '材料id',
  `suppliesnumber` int(11) DEFAULT NULL COMMENT '材料数量',
  PRIMARY KEY (`id`),
  KEY `fk_bomdetail_bomid` (`bomid`),
  KEY `fk_bomdetail_suppliesid` (`suppliesid`),
  CONSTRAINT `fk_bomdetail_bomid` FOREIGN KEY (`bomid`) REFERENCES `t_bom` (`id`),
  CONSTRAINT `fk_bomdetail_suppliesid` FOREIGN KEY (`suppliesid`) REFERENCES `t_supplies` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COMMENT='Bom明细';

-- ----------------------------
-- Records of t_bomdetail
-- ----------------------------
INSERT INTO `t_bomdetail` VALUES ('9', null, null, '0');
INSERT INTO `t_bomdetail` VALUES ('10', '3', '1', '1');
INSERT INTO `t_bomdetail` VALUES ('11', '3', null, '0');
INSERT INTO `t_bomdetail` VALUES ('12', '4', null, '0');
INSERT INTO `t_bomdetail` VALUES ('13', '4', '2', '0');

-- ----------------------------
-- Table structure for t_devicecapacitydetail
-- ----------------------------
DROP TABLE IF EXISTS `t_devicecapacitydetail`;
CREATE TABLE `t_devicecapacitydetail` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '唯一标识符',
  `devucetypeid` int(11) DEFAULT NULL COMMENT '设备类型id',
  `sectionid` int(11) DEFAULT NULL COMMENT '工段id',
  `processid` int(11) DEFAULT NULL COMMENT '工序id',
  `capacity` float DEFAULT NULL COMMENT '产能',
  PRIMARY KEY (`id`),
  KEY `fk_dad_devucetypeid` (`devucetypeid`),
  KEY `fk_dad_sectionid` (`sectionid`),
  KEY `fk_dad_` (`processid`),
  CONSTRAINT `fk_dad_` FOREIGN KEY (`processid`) REFERENCES `t_process` (`id`),
  CONSTRAINT `fk_dad_devucetypeid` FOREIGN KEY (`devucetypeid`) REFERENCES `t_devicetype` (`id`),
  CONSTRAINT `fk_dad_sectionid` FOREIGN KEY (`sectionid`) REFERENCES `t_section` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='设备产能明细';

-- ----------------------------
-- Records of t_devicecapacitydetail
-- ----------------------------
INSERT INTO `t_devicecapacitydetail` VALUES ('1', '2', '4', '1', '0');

-- ----------------------------
-- Table structure for t_devicetype
-- ----------------------------
DROP TABLE IF EXISTS `t_devicetype`;
CREATE TABLE `t_devicetype` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '唯一标识符',
  `name` varchar(255) DEFAULT NULL COMMENT '名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='设备类型';

-- ----------------------------
-- Records of t_devicetype
-- ----------------------------
INSERT INTO `t_devicetype` VALUES ('1', 'asd');
INSERT INTO `t_devicetype` VALUES ('2', '在');
INSERT INTO `t_devicetype` VALUES ('3', '阿斯顿');
INSERT INTO `t_devicetype` VALUES ('4', '啊发生');

-- ----------------------------
-- Table structure for t_personnel
-- ----------------------------
DROP TABLE IF EXISTS `t_personnel`;
CREATE TABLE `t_personnel` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '唯一标识符',
  `name` varchar(255) DEFAULT NULL COMMENT '名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='人员';

-- ----------------------------
-- Records of t_personnel
-- ----------------------------

-- ----------------------------
-- Table structure for t_process
-- ----------------------------
DROP TABLE IF EXISTS `t_process`;
CREATE TABLE `t_process` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '唯一标识符',
  `name` varchar(255) DEFAULT NULL COMMENT '名称',
  `sectionid` int(11) DEFAULT NULL COMMENT '工段id',
  PRIMARY KEY (`id`),
  KEY `fk_process_sectionid` (`sectionid`),
  CONSTRAINT `fk_process_sectionid` FOREIGN KEY (`sectionid`) REFERENCES `t_section` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='工序';

-- ----------------------------
-- Records of t_process
-- ----------------------------
INSERT INTO `t_process` VALUES ('1', '123123', '3');

-- ----------------------------
-- Table structure for t_processflow
-- ----------------------------
DROP TABLE IF EXISTS `t_processflow`;
CREATE TABLE `t_processflow` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '唯一标识符',
  `suppliesid` int(11) DEFAULT NULL COMMENT '产品(半成品)id',
  `fromtype` varchar(255) DEFAULT NULL COMMENT '(从)类型',
  `fromid` int(11) DEFAULT NULL COMMENT '(从)id',
  `totype` varchar(255) DEFAULT NULL COMMENT '(到)类型',
  `toid` int(11) DEFAULT NULL COMMENT '(到)id',
  PRIMARY KEY (`id`),
  KEY `fk_processflow_suppliesid` (`suppliesid`),
  CONSTRAINT `fk_processflow_suppliesid` FOREIGN KEY (`suppliesid`) REFERENCES `t_supplies` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='工艺流程';

-- ----------------------------
-- Records of t_processflow
-- ----------------------------

-- ----------------------------
-- Table structure for t_production
-- ----------------------------
DROP TABLE IF EXISTS `t_production`;
CREATE TABLE `t_production` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '唯一标识符',
  `suppliesid` int(11) DEFAULT NULL COMMENT '物资id',
  `suppliesnumber` float DEFAULT NULL COMMENT '数量',
  `deliverydate` date DEFAULT NULL COMMENT '交货日期',
  PRIMARY KEY (`id`),
  KEY `fk_product_suppliesid` (`suppliesid`),
  CONSTRAINT `fk_product_suppliesid` FOREIGN KEY (`suppliesid`) REFERENCES `t_supplies` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='生产单';

-- ----------------------------
-- Records of t_production
-- ----------------------------

-- ----------------------------
-- Table structure for t_schedule
-- ----------------------------
DROP TABLE IF EXISTS `t_schedule`;
CREATE TABLE `t_schedule` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '唯一标识符',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='日程安排';

-- ----------------------------
-- Records of t_schedule
-- ----------------------------

-- ----------------------------
-- Table structure for t_section
-- ----------------------------
DROP TABLE IF EXISTS `t_section`;
CREATE TABLE `t_section` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '唯一标识符',
  `name` varchar(255) DEFAULT NULL COMMENT '名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='工段';

-- ----------------------------
-- Records of t_section
-- ----------------------------
INSERT INTO `t_section` VALUES ('3', 'zxc');
INSERT INTO `t_section` VALUES ('4', 'das');
INSERT INTO `t_section` VALUES ('5', 'dfdgd');

-- ----------------------------
-- Table structure for t_supplies
-- ----------------------------
DROP TABLE IF EXISTS `t_supplies`;
CREATE TABLE `t_supplies` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '唯一标识符',
  `name` varchar(255) DEFAULT NULL COMMENT '名称',
  `type` varchar(255) DEFAULT NULL COMMENT '类型',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='物资';

-- ----------------------------
-- Records of t_supplies
-- ----------------------------
INSERT INTO `t_supplies` VALUES ('1', '阿斯顿', '产品');
INSERT INTO `t_supplies` VALUES ('2', '爱的', '材料');
INSERT INTO `t_supplies` VALUES ('3', '发顺丰', '半成品');

-- ----------------------------
-- Table structure for t_suppliesprocess
-- ----------------------------
DROP TABLE IF EXISTS `t_suppliesprocess`;
CREATE TABLE `t_suppliesprocess` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '唯一标识符',
  `suppliesid` int(11) DEFAULT NULL COMMENT '产品(半成品)id',
  `sectionid` int(11) DEFAULT NULL COMMENT '工段id',
  `processid` int(11) DEFAULT NULL COMMENT '工艺id',
  PRIMARY KEY (`id`),
  KEY `fk_sp_sectionid` (`sectionid`) USING BTREE,
  KEY `fk_sp_processid` (`processid`) USING BTREE,
  KEY `fk_sp_suppliesid` (`suppliesid`) USING BTREE,
  CONSTRAINT `fk_sp_processid` FOREIGN KEY (`processid`) REFERENCES `t_process` (`id`),
  CONSTRAINT `fk_sp_sectionid` FOREIGN KEY (`sectionid`) REFERENCES `t_section` (`id`),
  CONSTRAINT `fk_sp_suppliesid` FOREIGN KEY (`suppliesid`) REFERENCES `t_supplies` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='产品工艺';

-- ----------------------------
-- Records of t_suppliesprocess
-- ----------------------------
INSERT INTO `t_suppliesprocess` VALUES ('1', '3', '4', '1');
