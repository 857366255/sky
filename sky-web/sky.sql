/*
Navicat MySQL Data Transfer

Source Server         : MySQL
Source Server Version : 50158
Source Host           : localhost:3306
Source Database       : sky

Target Server Type    : MYSQL
Target Server Version : 50158
File Encoding         : 65001

Date: 2018-01-28 22:45:20
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for s_field
-- ----------------------------
DROP TABLE IF EXISTS `s_field`;
CREATE TABLE `s_field` (
  `coding` varchar(255) DEFAULT NULL COMMENT '唯一标识符',
  `configuration_page_coding` varchar(255) DEFAULT NULL COMMENT '配置页面编码',
  `table_en` varchar(255) DEFAULT NULL COMMENT '数据库表名',
  `field_en` varchar(255) DEFAULT NULL COMMENT '数据库字段名称',
  `name` varchar(255) DEFAULT NULL COMMENT '名称',
  `is_show_list` tinyint(1) DEFAULT NULL COMMENT '是否显示列表',
  `sorting_list` int(11) DEFAULT NULL COMMENT '列表排序号',
  `is_query` tinyint(1) DEFAULT NULL COMMENT '是否查询',
  `query_type` varchar(255) DEFAULT NULL COMMENT '查询条件类型',
  `sorting_query` int(11) DEFAULT NULL COMMENT '查询字段排序号',
  `is_edit` tinyint(1) DEFAULT NULL COMMENT '是否编辑',
  `edit_sorting` int(1) DEFAULT NULL COMMENT '编辑排序'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of s_field
-- ----------------------------
INSERT INTO `s_field` VALUES ('1', '1', 's_menu', 'coding', '唯一标识符', '1', '1', '1', '等于', null, null, null);
INSERT INTO `s_field` VALUES ('2', '1', 's_menu', 'name', '名称', '1', '2', '1', '等于', null, null, null);
INSERT INTO `s_field` VALUES ('3', '1', 's_menu', 'icon', '图标', '1', '3', '1', '等于', null, null, null);
INSERT INTO `s_field` VALUES ('4', '1', 's_menu', 'sorting', '排序号', '1', '4', '1', '等于', null, null, null);
INSERT INTO `s_field` VALUES ('5', '1', 's_menu', 'is_enablement', '是否启用', '1', '5', '0', '等于', null, null, null);
INSERT INTO `s_field` VALUES ('6', '1', 's_menu', 'superior_coding', '上级编码', '1', '6', '1', '等于', null, null, null);
INSERT INTO `s_field` VALUES ('7', '1', 's_menu', 'configuration_page_coding', '配置页面编码', '1', '7', '0', '等于', null, null, null);
INSERT INTO `s_field` VALUES ('8', '1', 's_menu', 'display_style', '显示样式', '1', '8', '0', '等于', null, null, null);
INSERT INTO `s_field` VALUES ('9', '1', 's_menu', 'url', '链接', '1', '9', '0', '等于', null, null, null);

-- ----------------------------
-- Table structure for s_menu
-- ----------------------------
DROP TABLE IF EXISTS `s_menu`;
CREATE TABLE `s_menu` (
  `coding` varchar(255) NOT NULL COMMENT '唯一标识符',
  `name` varchar(255) DEFAULT NULL COMMENT '名称',
  `icon` varchar(255) DEFAULT NULL COMMENT '图标',
  `sorting` int(11) DEFAULT NULL COMMENT '排序号',
  `is_enablement` tinyint(1) DEFAULT NULL COMMENT '是否启用',
  `superior_coding` varchar(255) DEFAULT NULL COMMENT '上级编码',
  `configuration_page_coding` varchar(255) DEFAULT NULL COMMENT '配置页面编码',
  `display_style` varchar(255) DEFAULT NULL COMMENT '显示样式',
  `url` varchar(255) DEFAULT NULL COMMENT '链接',
  PRIMARY KEY (`coding`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of s_menu
-- ----------------------------
INSERT INTO `s_menu` VALUES ('1', '1', '1', '1', null, '1', '1', '1', '1');
INSERT INTO `s_menu` VALUES ('2', '2', '2', '2', null, '2', '2', '2', '2');
INSERT INTO `s_menu` VALUES ('3', '3', '3', '3', null, '3', '3', '3', '3');
INSERT INTO `s_menu` VALUES ('4', '4', '4', '4', null, '4', '4', '4', '4');
INSERT INTO `s_menu` VALUES ('5', '5', '5', '5', null, '5', '5', '5', '5');

-- ----------------------------
-- Procedure structure for get_database_field
-- ----------------------------
DROP PROCEDURE IF EXISTS `get_database_field`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_database_field`()
BEGIN
   DECLARE stmt VARCHAR(6553);
   #查询当前的 use-->database
   SET @dbName=(SELECT DATABASE());
     BEGIN
       SET @sqlstr=CONCAT('SELECT * FROM information_schema.columns t WHERE t.`table_schema`=','''',@dbName,'''');
      END;
   PREPARE stmt FROM @sqlstr;
   EXECUTE stmt;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for get_database_fk_field
-- ----------------------------
DROP PROCEDURE IF EXISTS `get_database_fk_field`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_database_fk_field`()
BEGIN
   DECLARE stmt VARCHAR(6553);
   #查询当前的 use-->database
   SET @dbName=(SELECT DATABASE());
     BEGIN
       SET @sqlstr=CONCAT('SELECT * FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE t WHERE t.constraint_name!="PRIMARY" and t.`table_schema`=','''',@dbName,'''');
      END;
   PREPARE stmt FROM @sqlstr;
   EXECUTE stmt;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for get_database_table
-- ----------------------------
DROP PROCEDURE IF EXISTS `get_database_table`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_database_table`()
BEGIN
   DECLARE stmt VARCHAR(6553);
   #查询当前的 use-->database
   SET @dbName=(SELECT DATABASE());
     BEGIN
       SET @sqlstr=CONCAT('SELECT * FROM information_schema.tables t WHERE  t.`table_schema`=','''',@dbName,'''');
      END;
   PREPARE stmt FROM @sqlstr;
   EXECUTE stmt;
END
;;
DELIMITER ;
