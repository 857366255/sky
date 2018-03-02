/*
Navicat MySQL Data Transfer

Source Server         : 127.0.0.1
Source Server Version : 50717
Source Host           : localhost:3306
Source Database       : fitness

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2018-03-02 16:38:28
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for t_card
-- ----------------------------
DROP TABLE IF EXISTS `t_card`;
CREATE TABLE `t_card` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '唯一标识符',
  `card_type_id` int(11) DEFAULT NULL COMMENT '卡类型id',
  `vip_id` int(11) DEFAULT NULL COMMENT '会员id',
  `card_number` varchar(255) DEFAULT NULL COMMENT '卡号',
  `opened_date` date DEFAULT NULL COMMENT '开卡日期',
  PRIMARY KEY (`id`),
  KEY `fk_tc_tct_card_type_id` (`card_type_id`),
  KEY `fk_tc_tm_vip_id` (`vip_id`),
  CONSTRAINT `fk_tc_tct_card_type_id` FOREIGN KEY (`card_type_id`) REFERENCES `t_card_type` (`id`),
  CONSTRAINT `fk_tc_tm_vip_id` FOREIGN KEY (`vip_id`) REFERENCES `t_vip` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='卡';

-- ----------------------------
-- Records of t_card
-- ----------------------------

-- ----------------------------
-- Table structure for t_card_type
-- ----------------------------
DROP TABLE IF EXISTS `t_card_type`;
CREATE TABLE `t_card_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '唯一标识符',
  `name` varchar(255) DEFAULT NULL COMMENT '名称',
  `month` varchar(255) DEFAULT NULL COMMENT '几月',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='卡类型';

-- ----------------------------
-- Records of t_card_type
-- ----------------------------

-- ----------------------------
-- Table structure for t_people
-- ----------------------------
DROP TABLE IF EXISTS `t_people`;
CREATE TABLE `t_people` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '唯一标识符',
  `name` varchar(255) DEFAULT NULL COMMENT '名称',
  `phone` varchar(255) DEFAULT NULL COMMENT '电话',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_people
-- ----------------------------

-- ----------------------------
-- Table structure for t_permission
-- ----------------------------
DROP TABLE IF EXISTS `t_permission`;
CREATE TABLE `t_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '唯一标识符',
  `url` varchar(255) DEFAULT NULL COMMENT 'url',
  `role_id` int(11) DEFAULT NULL COMMENT '角色id',
  `name` varchar(255) DEFAULT NULL COMMENT '名称',
  PRIMARY KEY (`id`),
  KEY `fk_tp_tr_role_id` (`role_id`),
  CONSTRAINT `fk_tp_tr_role_id` FOREIGN KEY (`role_id`) REFERENCES `t_role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='权限';

-- ----------------------------
-- Records of t_permission
-- ----------------------------

-- ----------------------------
-- Table structure for t_role
-- ----------------------------
DROP TABLE IF EXISTS `t_role`;
CREATE TABLE `t_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '唯一标识符',
  `name` varchar(255) DEFAULT NULL COMMENT '名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色';

-- ----------------------------
-- Records of t_role
-- ----------------------------

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '唯一标识符',
  `username` varchar(255) DEFAULT NULL COMMENT '账号',
  `password` varchar(255) DEFAULT NULL COMMENT '密码',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='账号';

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('1', '1', '1');

-- ----------------------------
-- Table structure for t_user_role
-- ----------------------------
DROP TABLE IF EXISTS `t_user_role`;
CREATE TABLE `t_user_role` (
  `user_id` int(11) DEFAULT NULL COMMENT '用户id',
  `role_id` int(11) DEFAULT NULL COMMENT '角色id',
  KEY `fk_tur_tu_user_id` (`user_id`),
  KEY `fk_tur_tr_role_id` (`role_id`),
  CONSTRAINT `fk_tur_tr_role_id` FOREIGN KEY (`role_id`) REFERENCES `t_role` (`id`),
  CONSTRAINT `fk_tur_tu_user_id` FOREIGN KEY (`user_id`) REFERENCES `t_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户与角色关系';

-- ----------------------------
-- Records of t_user_role
-- ----------------------------

-- ----------------------------
-- Table structure for t_vip
-- ----------------------------
DROP TABLE IF EXISTS `t_vip`;
CREATE TABLE `t_vip` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '唯一标识符',
  `name` varchar(255) DEFAULT NULL COMMENT '名称',
  `phone_number` int(11) DEFAULT NULL COMMENT '手机号码',
  `user_id` int(11) DEFAULT NULL COMMENT '账号id',
  PRIMARY KEY (`id`),
  KEY `fk_tm_tu_user_id` (`user_id`),
  CONSTRAINT `fk_tm_tu_user_id` FOREIGN KEY (`user_id`) REFERENCES `t_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='会员';

-- ----------------------------
-- Records of t_vip
-- ----------------------------

-- ----------------------------
-- Table structure for t_vip_fitness_res
-- ----------------------------
DROP TABLE IF EXISTS `t_vip_fitness_res`;
CREATE TABLE `t_vip_fitness_res` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '唯一标识符',
  `vip_id` int(11) DEFAULT NULL COMMENT '会员id',
  `start_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '开始时间',
  `end_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '结束时间',
  PRIMARY KEY (`id`),
  KEY `fk_tvfr_tv_vip_id` (`vip_id`),
  CONSTRAINT `fk_tvfr_tv_vip_id` FOREIGN KEY (`vip_id`) REFERENCES `t_vip` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='会员健身记录';

-- ----------------------------
-- Records of t_vip_fitness_res
-- ----------------------------
