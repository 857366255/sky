/*
Navicat MySQL Data Transfer

Source Server         : 127.0.0.1
Source Server Version : 50717
Source Host           : localhost:3306
Source Database       : skyadmin

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2018-03-23 15:36:26
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for s_configurationpage
-- ----------------------------
DROP TABLE IF EXISTS `s_configurationpage`;
CREATE TABLE `s_configurationpage` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '唯一标识符',
  `name` varchar(255) DEFAULT NULL COMMENT '名称',
  `table_en` varchar(255) DEFAULT NULL COMMENT '表名称en',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8 COMMENT='配置页面';

-- ----------------------------
-- Records of s_configurationpage
-- ----------------------------
INSERT INTO `s_configurationpage` VALUES ('30', '字段', 's_field');
INSERT INTO `s_configurationpage` VALUES ('31', '配置页面', 's_configurationpage');

-- ----------------------------
-- Table structure for s_field
-- ----------------------------
DROP TABLE IF EXISTS `s_field`;
CREATE TABLE `s_field` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '唯一标识符',
  `configurationpage_id` int(11) DEFAULT NULL COMMENT '配置页面id',
  `table_en` varchar(255) DEFAULT NULL COMMENT '表名称en',
  `field_en` varchar(255) DEFAULT NULL COMMENT '字段名称en',
  `name` varchar(255) DEFAULT NULL COMMENT '名称',
  `isshowlist` tinyint(1) DEFAULT NULL COMMENT '是否显示列表',
  `listsorting` int(11) DEFAULT NULL COMMENT '列表排序号',
  `isedit` tinyint(1) DEFAULT NULL COMMENT '是否编辑',
  `editsorting` int(11) DEFAULT NULL COMMENT '编辑排序号',
  `inputtype` varchar(255) DEFAULT NULL COMMENT '输入框类型',
  `isquery` tinyint(1) DEFAULT NULL COMMENT '是否查询',
  `querytype` varchar(255) DEFAULT NULL COMMENT '查询类型',
  `querysorting` int(11) DEFAULT NULL COMMENT '查询排序号',
  PRIMARY KEY (`id`),
  KEY `fk_sfield_cnfigurationpageid` (`configurationpage_id`),
  CONSTRAINT `fk_sfield_cnfigurationpageid` FOREIGN KEY (`configurationpage_id`) REFERENCES `s_configurationpage` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=83 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of s_field
-- ----------------------------
INSERT INTO `s_field` VALUES ('67', '30', 's_field', 'id', '唯一标识符', '1', '1', '1', '1', 'text', '1', null, '1');
INSERT INTO `s_field` VALUES ('68', '30', 's_field', 'configurationpage_id', '配置页面id', '1', '2', '1', '2', 'text', '1', null, '2');
INSERT INTO `s_field` VALUES ('69', '30', 's_field', 'table_en', '表名称en', '1', '3', '1', '3', 'text', '1', null, '3');
INSERT INTO `s_field` VALUES ('70', '30', 's_field', 'field_en', '字段名称en', '1', '4', '1', '4', 'text', '1', null, '4');
INSERT INTO `s_field` VALUES ('71', '30', 's_field', 'name', '名称', '1', '5', '1', '5', 'text', '1', null, '5');
INSERT INTO `s_field` VALUES ('72', '30', 's_field', 'isshowlist', '是否显示列表', '1', '6', '1', '6', 'text', '1', null, '6');
INSERT INTO `s_field` VALUES ('73', '30', 's_field', 'listsorting', '列表排序号', '1', '7', '1', '7', 'text', '1', null, '7');
INSERT INTO `s_field` VALUES ('74', '30', 's_field', 'isedit', '是否编辑', '1', '8', '1', '8', 'text', '1', null, '8');
INSERT INTO `s_field` VALUES ('75', '30', 's_field', 'editsorting', '编辑排序号', '1', '9', '1', '9', 'text', '1', null, '9');
INSERT INTO `s_field` VALUES ('76', '30', 's_field', 'inputtype', '输入框类型', '1', '10', '1', '10', 'text', '1', null, '10');
INSERT INTO `s_field` VALUES ('77', '30', 's_field', 'isquery', '是否查询', '1', '11', '1', '11', 'text', '1', null, '11');
INSERT INTO `s_field` VALUES ('78', '30', 's_field', 'querytype', '查询类型', '1', '12', '1', '12', 'text', '1', null, '12');
INSERT INTO `s_field` VALUES ('79', '30', 's_field', 'querysorting', '查询排序号', '1', '13', '1', '13', 'text', '1', null, '13');
INSERT INTO `s_field` VALUES ('80', '31', 's_configurationpage', 'id', '唯一标识符', '1', '1', '1', '1', 'text', '1', null, '1');
INSERT INTO `s_field` VALUES ('81', '31', 's_configurationpage', 'name', '名称', '1', '2', '1', '2', 'text', '1', null, '2');
INSERT INTO `s_field` VALUES ('82', '31', 's_configurationpage', 'table_en', '表名称en', '1', '3', '1', '3', 'text', '1', null, '3');
