/*
Navicat MySQL Data Transfer

Source Server         : 127.0.0.1
Source Server Version : 50717
Source Host           : localhost:3306
Source Database       : skyproduction

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2018-03-26 16:57:24
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='BOM';

-- ----------------------------
-- Records of t_bom
-- ----------------------------

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Bom明细';

-- ----------------------------
-- Records of t_bomdetail
-- ----------------------------

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='设备产能明细';

-- ----------------------------
-- Records of t_devicecapacitydetail
-- ----------------------------

-- ----------------------------
-- Table structure for t_devicetype
-- ----------------------------
DROP TABLE IF EXISTS `t_devicetype`;
CREATE TABLE `t_devicetype` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '唯一标识符',
  `name` varchar(255) DEFAULT NULL COMMENT '名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='设备类型';

-- ----------------------------
-- Records of t_devicetype
-- ----------------------------

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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='工序';

-- ----------------------------
-- Records of t_process
-- ----------------------------

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='工段';

-- ----------------------------
-- Records of t_section
-- ----------------------------

-- ----------------------------
-- Table structure for t_suppliersprocess
-- ----------------------------
DROP TABLE IF EXISTS `t_suppliersprocess`;
CREATE TABLE `t_suppliersprocess` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '唯一标识符',
  `suppliersid` int(11) DEFAULT NULL COMMENT '产品(半成品)id',
  `sectionid` int(11) DEFAULT NULL COMMENT '工段id',
  `processid` int(11) DEFAULT NULL COMMENT '工艺id',
  PRIMARY KEY (`id`),
  KEY `fk_sp_sectionid` (`sectionid`),
  KEY `fk_sp_processid` (`processid`),
  KEY `fk_sp_suppliersid` (`suppliersid`),
  CONSTRAINT `fk_sp_processid` FOREIGN KEY (`processid`) REFERENCES `t_process` (`id`),
  CONSTRAINT `fk_sp_sectionid` FOREIGN KEY (`sectionid`) REFERENCES `t_section` (`id`),
  CONSTRAINT `fk_sp_suppliersid` FOREIGN KEY (`suppliersid`) REFERENCES `t_supplies` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='产品工艺';

-- ----------------------------
-- Records of t_suppliersprocess
-- ----------------------------

-- ----------------------------
-- Table structure for t_supplies
-- ----------------------------
DROP TABLE IF EXISTS `t_supplies`;
CREATE TABLE `t_supplies` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '唯一标识符',
  `name` varchar(255) DEFAULT NULL COMMENT '名称',
  `type` varchar(255) DEFAULT NULL COMMENT '类型',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='物资';

-- ----------------------------
-- Records of t_supplies
-- ----------------------------
