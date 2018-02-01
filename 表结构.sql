/*
Navicat MySQL Data Transfer

Source Server         : 127.0.0.1
Source Server Version : 50717
Source Host           : localhost:3306
Source Database       : sky

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2018-02-01 10:58:45
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for s_configuration_page
-- ----------------------------
DROP TABLE IF EXISTS `s_configuration_page`;
CREATE TABLE `s_configuration_page` (
  `coding` varchar(255) NOT NULL COMMENT '唯一标识符',
  `name` varchar(255) DEFAULT NULL COMMENT '名称',
  `table_en` varchar(255) DEFAULT NULL COMMENT '数据库表名',
  `pk_field_en` varchar(255) DEFAULT NULL COMMENT '数据库表主键字段',
  PRIMARY KEY (`coding`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='配置页面';

-- ----------------------------
-- Records of s_configuration_page
-- ----------------------------
INSERT INTO `s_configuration_page` VALUES ('s_menu', '菜单栏配置', 's_menu', 'coding');

-- ----------------------------
-- Table structure for s_custom_selectbox
-- ----------------------------
DROP TABLE IF EXISTS `s_custom_selectbox`;
CREATE TABLE `s_custom_selectbox` (
  `coding` varchar(255) NOT NULL COMMENT '唯一标识符',
  `name` varchar(255) DEFAULT NULL COMMENT '显示内容',
  `value_string` varchar(255) DEFAULT NULL COMMENT '值 字符串',
  `value_integer` int(11) DEFAULT NULL COMMENT '值 数字',
  `value_boolean` tinyint(1) DEFAULT NULL COMMENT '值 判断',
  `groups` varchar(255) DEFAULT NULL COMMENT '组',
  PRIMARY KEY (`coding`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='自定义下拉框选择内容';

-- ----------------------------
-- Records of s_custom_selectbox
-- ----------------------------
INSERT INTO `s_custom_selectbox` VALUES ('1', '启用', '1', null, '1', 'is_enable');
INSERT INTO `s_custom_selectbox` VALUES ('2', '停止', '0', null, '0', 'is_enable');

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
  `sorting_edit` int(1) DEFAULT NULL COMMENT '编辑排序',
  `input_type` varchar(255) DEFAULT NULL COMMENT '输入框类型',
  `selectbox_coding` varchar(255) DEFAULT NULL COMMENT '下拉框编码'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of s_field
-- ----------------------------
INSERT INTO `s_field` VALUES ('s_menu-coding', 's_menu', 's_menu', 'coding', '唯一标识符', '1', '1', '1', '等于', '1', '1', '1', null, null);
INSERT INTO `s_field` VALUES ('s_menu-configuration_page_coding', 's_menu', 's_menu', 'configuration_page_coding', '配置页面编码', '1', '7', '0', '等于', '7', '1', '7', null, null);
INSERT INTO `s_field` VALUES ('s_menu-display_url', 's_menu', 's_menu', 'url', 'URL', '1', '8', '0', '等于', '8', '1', '8', null, null);
INSERT INTO `s_field` VALUES ('s_menu-name', 's_menu', 's_menu', 'name', '名称', '1', '2', '1', '等于', '2', '1', '2', null, null);
INSERT INTO `s_field` VALUES ('s_menu-icon', 's_menu', 's_menu', 'icon', '图标', '1', '3', '1', '等于', '3', '1', '3', null, '');
INSERT INTO `s_field` VALUES ('s_menu-sorting', 's_menu', 's_menu', 'sorting', '排序号', '1', '4', '1', '等于', '4', '1', '4', null, null);
INSERT INTO `s_field` VALUES ('s_menu-is_enablement', 's_menu', 's_menu', 'is_enablement', '是否启用', '1', '5', '0', '等于', '5', '1', '5', 'radio', 's_custom_selectbox-value');
INSERT INTO `s_field` VALUES ('s_menu-superior_coding', 's_menu', 's_menu', 'superior_coding', '上级编码', '1', '6', '1', '等于', '6', '1', '6', 'select', 's_menu-coding');
INSERT INTO `s_field` VALUES ('s_menu-display_style', 's_menu', 's_menu', 'display_style', '显示样式', '1', '8', '0', '等于', '8', '1', '8', null, null);

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
INSERT INTO `s_menu` VALUES ('MenuBarSettings', '菜单栏设置', null, '1', '1', 'PageConfigurationManagement', 's_menu', null, 's_menu');
INSERT INTO `s_menu` VALUES ('PageConfigurationManagement', '页面配置管理', null, '9999', '1', null, null, null, null);

-- ----------------------------
-- Table structure for s_selectbox
-- ----------------------------
DROP TABLE IF EXISTS `s_selectbox`;
CREATE TABLE `s_selectbox` (
  `coding` varchar(255) NOT NULL COMMENT '唯一标识符',
  `name` varchar(255) DEFAULT NULL COMMENT '名称',
  `table_en` varchar(255) DEFAULT NULL COMMENT '数据库表名',
  `value_field_en` varchar(255) DEFAULT NULL COMMENT '数据库表字段',
  `type` varchar(255) DEFAULT NULL COMMENT '类型',
  `custom_selectbox_group` varchar(255) DEFAULT NULL COMMENT '自定义下拉框分组',
  PRIMARY KEY (`coding`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of s_selectbox
-- ----------------------------
INSERT INTO `s_selectbox` VALUES ('s_custom_selectbox-value', '是否启用', 's_custom_selectbox', 'value', 'radio', 'is_enable');
INSERT INTO `s_selectbox` VALUES ('s_menu-coding', '菜单栏上级编号', 's_menu', 'coding', 'select', null);

-- ----------------------------
-- Table structure for s_selectbox_show_field
-- ----------------------------
DROP TABLE IF EXISTS `s_selectbox_show_field`;
CREATE TABLE `s_selectbox_show_field` (
  `coding` varchar(255) NOT NULL COMMENT '唯一标识符',
  `selectbox_coding` varchar(255) DEFAULT NULL COMMENT '选择框编码',
  `name` varchar(255) DEFAULT NULL COMMENT '名称',
  `table_en` varchar(255) DEFAULT NULL COMMENT '数据库表名',
  `field_en` varchar(255) DEFAULT NULL COMMENT '数据库表字段',
  `sorting` int(11) DEFAULT NULL COMMENT '排序号',
  `is_show` tinyint(1) DEFAULT NULL COMMENT '是否显示',
  PRIMARY KEY (`coding`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='下拉框 需要显示的字段';

-- ----------------------------
-- Records of s_selectbox_show_field
-- ----------------------------
INSERT INTO `s_selectbox_show_field` VALUES ('s_custom_selectbox-name', 's_custom_selectbox-value', '是否启用实现内容', 's_custom_selectbox', 'name', '1', '1');
INSERT INTO `s_selectbox_show_field` VALUES ('s_menu-coding', 's_menu-coding', '唯一标识符', 's_menu', 'coding', '2', '1');
INSERT INTO `s_selectbox_show_field` VALUES ('s_menu-icon', 's_menu-coding', '图标', 's_menu', 'icon', '2', '1');
INSERT INTO `s_selectbox_show_field` VALUES ('s_menu-name', 's_menu-coding', '名称', 's_menu', 'name', '1', '1');

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
