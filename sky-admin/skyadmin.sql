/*
Navicat MySQL Data Transfer

Source Server         : 127.0.0.1
Source Server Version : 50717
Source Host           : localhost:3306
Source Database       : skyadmin

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2018-03-15 15:23:43
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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of s_configurationpage
-- ----------------------------
INSERT INTO `s_configurationpage` VALUES ('1', '1', '1');
INSERT INTO `s_configurationpage` VALUES ('2', '2', '2');
INSERT INTO `s_configurationpage` VALUES ('3', '3', '3');
INSERT INTO `s_configurationpage` VALUES ('4', '4', '4');
INSERT INTO `s_configurationpage` VALUES ('5', '5', '5');
INSERT INTO `s_configurationpage` VALUES ('6', '6', '6');
INSERT INTO `s_configurationpage` VALUES ('7', '7', '7');
INSERT INTO `s_configurationpage` VALUES ('8', '8', '8');
INSERT INTO `s_configurationpage` VALUES ('9', '9', '9');
INSERT INTO `s_configurationpage` VALUES ('10', '10', '10');
INSERT INTO `s_configurationpage` VALUES ('11', '11', '11');
INSERT INTO `s_configurationpage` VALUES ('12', '12', '12');
INSERT INTO `s_configurationpage` VALUES ('13', '13', '13');
INSERT INTO `s_configurationpage` VALUES ('14', '14', '14');
INSERT INTO `s_configurationpage` VALUES ('15', '15', '15');
