/*
Navicat MySQL Data Transfer

Source Server         : 127.0.0.1
Source Server Version : 50717
Source Host           : localhost:3306
Source Database       : sky

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2018-03-01 16:06:36
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for permission
-- ----------------------------
DROP TABLE IF EXISTS `permission`;
CREATE TABLE `permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(30) NOT NULL,
  `roleid` int(11) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of permission
-- ----------------------------
INSERT INTO `permission` VALUES ('1', '/readName', '1', '查看名单');
INSERT INTO `permission` VALUES ('2', '/readData', '2', '查看数据');

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role` varchar(20) NOT NULL,
  `description` varchar(120) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('1', '管理员', '管理员');
INSERT INTO `role` VALUES ('2', '普通用户', '普通用户');

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
INSERT INTO `s_configuration_page` VALUES ('s_field', '字段设置', 's_field', 'coding');
INSERT INTO `s_configuration_page` VALUES ('s_menu', '菜单栏', 's_menu', 'coding');

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

-- ----------------------------
-- Table structure for s_field
-- ----------------------------
DROP TABLE IF EXISTS `s_field`;
CREATE TABLE `s_field` (
  `coding` varchar(255) NOT NULL COMMENT '唯一标识符',
  `configuration_page_coding` varchar(255) DEFAULT NULL COMMENT '配置页面编码',
  `table_en` varchar(255) DEFAULT NULL COMMENT '数据库表名',
  `field_en` varchar(255) DEFAULT NULL COMMENT '数据库字段名称',
  `name` varchar(255) DEFAULT NULL COMMENT '名称',
  `is_show_list` tinyint(1) DEFAULT NULL COMMENT '是否显示列表',
  `sorting_list` int(11) DEFAULT NULL COMMENT '列表排序号',
  `is_query` tinyint(1) DEFAULT NULL COMMENT '是否查询',
  `query_type` varchar(255) DEFAULT NULL COMMENT '查询条件类型',
  `sorting_query` int(11) DEFAULT NULL COMMENT '查询字段排序号',
  `is_show_edit` tinyint(1) DEFAULT NULL COMMENT '是否编辑',
  `is_edit` tinyint(1) DEFAULT NULL COMMENT '是否编辑',
  `sorting_edit` int(1) DEFAULT NULL COMMENT '编辑排序',
  `input_coding` varchar(255) DEFAULT NULL COMMENT '输入框类型',
  `selectbox_coding` varchar(255) DEFAULT NULL COMMENT '下拉框编码',
  PRIMARY KEY (`coding`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of s_field
-- ----------------------------
INSERT INTO `s_field` VALUES ('s_field-coding', 's_field', 's_field', 'coding', '唯一标识符', '1', '1', '1', null, '1', '1', '1', '1', null, null);
INSERT INTO `s_field` VALUES ('s_field-configuration_page_coding', 's_field', 's_field', 'configuration_page_coding', '配置页面编码', '1', '2', '1', null, '2', '1', '1', '2', null, null);
INSERT INTO `s_field` VALUES ('s_field-field_en', 's_field', 's_field', 'field_en', '数据库字段名称', '1', '4', '1', null, '4', '1', '1', '4', null, null);
INSERT INTO `s_field` VALUES ('s_field-input_coding', 's_field', 's_field', 'input_coding', '输入框类型', '1', '14', '1', null, '14', '1', '1', '14', null, null);
INSERT INTO `s_field` VALUES ('s_field-is_edit', 's_field', 's_field', 'is_edit', '是否编辑', '1', '12', '1', null, '12', '1', '1', '12', null, null);
INSERT INTO `s_field` VALUES ('s_field-is_query', 's_field', 's_field', 'is_query', '是否查询', '1', '8', '1', null, '8', '1', '1', '8', null, null);
INSERT INTO `s_field` VALUES ('s_field-is_show_edit', 's_field', 's_field', 'is_show_edit', '是否编辑', '1', '11', '1', null, '11', '1', '1', '11', null, null);
INSERT INTO `s_field` VALUES ('s_field-is_show_list', 's_field', 's_field', 'is_show_list', '是否显示列表', '1', '6', '1', null, '6', '0', '1', '6', null, null);
INSERT INTO `s_field` VALUES ('s_field-name', 's_field', 's_field', 'name', '名称', '1', '5', '1', null, '5', '1', '1', '5', null, null);
INSERT INTO `s_field` VALUES ('s_field-query_type', 's_field', 's_field', 'query_type', '查询条件类型', '1', '9', '1', null, '9', '1', '1', '9', null, null);
INSERT INTO `s_field` VALUES ('s_field-selectbox_coding', 's_field', 's_field', 'selectbox_coding', '下拉框编码', '1', '15', '1', null, '15', '1', '1', '15', null, null);
INSERT INTO `s_field` VALUES ('s_field-sorting_edit', 's_field', 's_field', 'sorting_edit', '编辑排序', '1', '13', '1', null, '13', '1', '1', '13', null, null);
INSERT INTO `s_field` VALUES ('s_field-sorting_list', 's_field', 's_field', 'sorting_list', '列表排序号', '1', '7', '1', null, '7', '1', '1', '7', null, null);
INSERT INTO `s_field` VALUES ('s_field-sorting_query', 's_field', 's_field', 'sorting_query', '查询字段排序号', '1', '10', '1', null, '10', '1', '1', '10', null, null);
INSERT INTO `s_field` VALUES ('s_field-table_en', 's_field', 's_field', 'table_en', '数据库表名', '1', '3', '1', null, '3', '1', '1', '3', null, null);
INSERT INTO `s_field` VALUES ('s_menu-coding', 's_menu', 's_menu', 'coding', '唯一标识符', '1', '1', '1', '123', '1', '1', '10', '1', '', null);
INSERT INTO `s_field` VALUES ('s_menu-configuration_page_coding', 's_menu', 's_menu', 'configuration_page_coding', '配置页面编码', '1', '7', '1', null, '7', '1', '1', '7', null, null);
INSERT INTO `s_field` VALUES ('s_menu-icon', 's_menu', 's_menu', 'icon', '图标', '1', '3', '1', null, '3', '0', '1', '3', null, null);
INSERT INTO `s_field` VALUES ('s_menu-is_enablement', 's_menu', 's_menu', 'is_enablement', '是否启用', '1', '5', '1', null, '5', '1', '1', '5', null, null);
INSERT INTO `s_field` VALUES ('s_menu-name', 's_menu', 's_menu', 'name', '名称', '1', '2', '1', null, '2', '0', '1', '2', '', null);
INSERT INTO `s_field` VALUES ('s_menu-open_style', 's_menu', 's_menu', 'open_style', '打开页面样式', '1', '9', '1', null, '9', '1', '1', '9', null, null);
INSERT INTO `s_field` VALUES ('s_menu-sorting', 's_menu', 's_menu', 'sorting', '排序号', '1', '4', '1', null, '4', '1', '0', '4', null, null);
INSERT INTO `s_field` VALUES ('s_menu-superior_coding', 's_menu', 's_menu', 'superior_coding', '上级编码', '1', '6', '1', null, '6', '1', '1', '6', null, null);
INSERT INTO `s_field` VALUES ('s_menu-url', 's_menu', 's_menu', 'url', '链接', '1', '8', '1', null, '8', '1', '1', '8', null, null);

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
  `url` varchar(255) DEFAULT NULL COMMENT '链接',
  `open_style` varchar(255) DEFAULT NULL COMMENT '打开页面样式',
  PRIMARY KEY (`coding`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of s_menu
-- ----------------------------

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
INSERT INTO `s_selectbox` VALUES ('s_configuration_page-coding', '配置页面', 's_configuration_page', 'coding', 'select', null);
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
INSERT INTO `s_selectbox_show_field` VALUES ('s_configuration_page-coding', 's_configuration_page-coding', '编码', 's_configuration_page', 'coding', '1', '1');
INSERT INTO `s_selectbox_show_field` VALUES ('s_configuration_page-name', 's_configuration_page-coding', '名称', 's_configuration_page', 'name', '2', '1');
INSERT INTO `s_selectbox_show_field` VALUES ('s_custom_selectbox-name', 's_custom_selectbox-value', '是否启用实现内容', 's_custom_selectbox', 'name', '1', '1');
INSERT INTO `s_selectbox_show_field` VALUES ('s_menu-coding', 's_menu-coding', '唯一标识符', 's_menu', 'coding', '2', '1');
INSERT INTO `s_selectbox_show_field` VALUES ('s_menu-icon', 's_menu-coding', '图标', 's_menu', 'icon', '2', '1');
INSERT INTO `s_selectbox_show_field` VALUES ('s_menu-name', 's_menu-coding', '名称', 's_menu', 'name', '1', '1');

-- ----------------------------
-- Table structure for t-s
-- ----------------------------
DROP TABLE IF EXISTS `t-s`;
CREATE TABLE `t-s` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t-s
-- ----------------------------

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', '123', '123');
INSERT INTO `user` VALUES ('2', '1234', '1234');

-- ----------------------------
-- Table structure for user_role
-- ----------------------------
DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL,
  `roleid` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of user_role
-- ----------------------------
INSERT INTO `user_role` VALUES ('1', '1', '1');
INSERT INTO `user_role` VALUES ('2', '2', '2');

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
