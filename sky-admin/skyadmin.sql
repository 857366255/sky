/*
Navicat MySQL Data Transfer

Source Server         : 127.0.0.1
Source Server Version : 50717
Source Host           : localhost:3306
Source Database       : skyadmin

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2018-03-20 17:07:07
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
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COMMENT='配置页面';

-- ----------------------------
-- Records of s_configurationpage
-- ----------------------------
INSERT INTO `s_configurationpage` VALUES ('1', '2', 's_configurationpage');
INSERT INTO `s_configurationpage` VALUES ('2', 'asd', 's_configurationpage');
INSERT INTO `s_configurationpage` VALUES ('3', '3', 's_configurationpage');
INSERT INTO `s_configurationpage` VALUES ('4', '4', 's_configurationpage');
INSERT INTO `s_configurationpage` VALUES ('6', '6', 's_configurationpage');
INSERT INTO `s_configurationpage` VALUES ('7', '7', 's_field');
INSERT INTO `s_configurationpage` VALUES ('8', '8', 's_configurationpage');
INSERT INTO `s_configurationpage` VALUES ('9', '9', 's_configurationpage');
INSERT INTO `s_configurationpage` VALUES ('10', '10', '10');
INSERT INTO `s_configurationpage` VALUES ('11', '11', '11');
INSERT INTO `s_configurationpage` VALUES ('12', '12', '12');
INSERT INTO `s_configurationpage` VALUES ('13', '13', '13');
INSERT INTO `s_configurationpage` VALUES ('14', '14', '14');
INSERT INTO `s_configurationpage` VALUES ('15', '15', '15');
INSERT INTO `s_configurationpage` VALUES ('16', '打', '1');
INSERT INTO `s_configurationpage` VALUES ('17', 'SAD', '3');
INSERT INTO `s_configurationpage` VALUES ('18', '阿斯顿', '1');
INSERT INTO `s_configurationpage` VALUES ('19', '为', '1');
INSERT INTO `s_configurationpage` VALUES ('20', '2', 's_configurationpage');
INSERT INTO `s_configurationpage` VALUES ('21', '3', 's_configurationpage');
INSERT INTO `s_configurationpage` VALUES ('22', '配置页面', 's_configurationpage');
INSERT INTO `s_configurationpage` VALUES ('23', '3', 's_configurationpage');

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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of s_field
-- ----------------------------
INSERT INTO `s_field` VALUES ('1', '1', '1a', '1a', '1a', '1', '1', '1', '1', '1a', '1', '1a', '1');
INSERT INTO `s_field` VALUES ('2', '2', '2a', '2a', '2a', '2', '2', '2', '2', '2a', '2', '2a', '2');
INSERT INTO `s_field` VALUES ('3', '3', '3a', '3a', '3a', '3', '3', '3', '3', '3a', '3', '3a', '3');
INSERT INTO `s_field` VALUES ('4', '4', '4a', '4a', '4a', '4', '4', '4', '4', '4a', '4', '4a', '4');
INSERT INTO `s_field` VALUES ('5', '5', '5a', '5a', '5a', '5', '5', '5', '5', '5a', '5', '5a', '5');
INSERT INTO `s_field` VALUES ('6', '6', '6a', '6a', '6a', '6', '6', '6', '6', '6a', '6', '6a', '6');
INSERT INTO `s_field` VALUES ('7', '7', '7a', '7a', '7a', '7', '7', '7', '7', '7a', '7', '7a', '7');
INSERT INTO `s_field` VALUES ('8', '8', '8a', '8a', '8a', '8', '8', '8', '8', '8a', '8', '8a', '8');
INSERT INTO `s_field` VALUES ('9', '9', '9a', '9a', '9a', '9', '9', '9', '9', '9a', '9', '9a', '9');
INSERT INTO `s_field` VALUES ('10', '10', '10a', '10a', '10a', '10', '10', '10', '10', '10a', '10', '10a', '10');
INSERT INTO `s_field` VALUES ('11', '11', '11a', '11a', '11a', '11', '11', '11', '11', '11a', '11', '11a', '11');
