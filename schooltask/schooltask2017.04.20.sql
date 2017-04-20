/*
Navicat MySQL Data Transfer

Source Server         : abc
Source Server Version : 50528
Source Host           : localhost:3306
Source Database       : schooltask

Target Server Type    : MYSQL
Target Server Version : 50528
File Encoding         : 65001

Date: 2017-04-20 12:31:55
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for customer
-- ----------------------------
DROP TABLE IF EXISTS `customer`;
CREATE TABLE `customer` (
  `id` varchar(128) NOT NULL COMMENT 'UUID',
  `name` varchar(255) NOT NULL COMMENT '客户名称',
  `phone` varchar(128) DEFAULT NULL,
  `level` varchar(255) DEFAULT NULL COMMENT '客户级别(舍弃)',
  `type` varchar(255) DEFAULT NULL COMMENT '客户类型',
  `address` text COMMENT '地址',
  `longitude` decimal(18,0) DEFAULT NULL COMMENT '经度',
  `latitude` decimal(18,0) DEFAULT NULL COMMENT '纬度',
  `createUser` varchar(255) DEFAULT NULL COMMENT '创建者',
  `isDelete` int(11) DEFAULT NULL COMMENT '逻辑删除',
  `createTime` datetime DEFAULT NULL COMMENT '创建时间',
  `remark` text COMMENT '备注',
  PRIMARY KEY (`id`),
  KEY `fk_createUser` (`createUser`),
  KEY `fk_serviceManager` (`phone`),
  CONSTRAINT `fk_createUser` FOREIGN KEY (`createUser`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='顾客';

-- ----------------------------
-- Records of customer
-- ----------------------------
INSERT INTO `customer` VALUES ('884c3128-0ca1-11e7-8d59-0021cc62c2f3', '张钧', '15538762398', '一级客户', '销售商', '山东潍坊', null, null, 'c8ab7c2d-0c87-11e7-8d59-0021cc62c2f3', '0', '2017-03-19 20:44:34', '');

-- ----------------------------
-- Table structure for drug
-- ----------------------------
DROP TABLE IF EXISTS `drug`;
CREATE TABLE `drug` (
  `id` varchar(128) NOT NULL,
  `no` varchar(20) NOT NULL COMMENT '药品编号',
  `name` varchar(255) DEFAULT NULL,
  `origin` varchar(255) DEFAULT NULL COMMENT '产地',
  `unit` varchar(30) DEFAULT NULL COMMENT '单位',
  `number` int(11) DEFAULT NULL COMMENT '数量',
  `purchase` double(10,2) DEFAULT NULL COMMENT '进价',
  `retail` double(10,2) DEFAULT NULL COMMENT '零售价',
  `period` date DEFAULT NULL COMMENT '有效期',
  `sort` varchar(128) DEFAULT NULL,
  `warehouse` varchar(128) DEFAULT NULL,
  `commonName` varchar(50) DEFAULT NULL COMMENT '通用名',
  `createTime` datetime DEFAULT NULL COMMENT '进货日期',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`),
  KEY `fk_sort` (`sort`),
  KEY `fk_warehouse` (`warehouse`),
  CONSTRAINT `fk_sort` FOREIGN KEY (`sort`) REFERENCES `sort` (`id`),
  CONSTRAINT `fk_warehouse` FOREIGN KEY (`warehouse`) REFERENCES `warehouse` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='药品';

-- ----------------------------
-- Records of drug
-- ----------------------------
INSERT INTO `drug` VALUES ('019fef87-0640-11e7-8d59-0021cc62c2f3', 'PCblymd', '丙硫氧嘧啶片', '深圳市中联', '瓶', '200', '100.00', '150.00', '2020-12-11', '254de094-0641-11e7-8d59-0021cc62c2f3', '0941d77d-0643-11e7-8d59-0021cc62c2f3', '丙硫氧嘧啶片', '2017-03-11 00:00:00', null);
INSERT INTO `drug` VALUES ('3a94bdfe-091f-11e7-8d59-0021cc62c2f3', 'OTCffdqy', '复方大青叶', '广州白云山制药', '盒', '500', '3.00', '4.00', '2019-11-15', '6f9454e8-0642-11e7-8d59-0021cc62c2f3', 'f5987c76-0642-11e7-8d59-0021cc62c2f3', '大青叶', '2016-11-15 09:34:10', null);
INSERT INTO `drug` VALUES ('8eeb67b5-065d-11e7-8d59-0021cc62c2f3', 'OTCffdsp', '复方丹参片', '广州白云山制药', '瓶', '100', '50.00', '120.00', '2019-11-11', '33e8cd1b-065e-11e7-8d59-0021cc62c2f3', 'f5987c76-0642-11e7-8d59-0021cc62c2f3', '复方丹参片', '2017-03-11 00:00:00', null);

-- ----------------------------
-- Table structure for linkman
-- ----------------------------
DROP TABLE IF EXISTS `linkman`;
CREATE TABLE `linkman` (
  `id` varchar(128) NOT NULL,
  `customer` varchar(128) DEFAULT NULL COMMENT '所属客户',
  `name` varchar(255) DEFAULT NULL,
  `sex` varchar(255) DEFAULT NULL,
  `isMain` tinyint(1) DEFAULT '0' COMMENT '是否是主要联系人，1：是；0：否',
  `remark` text,
  `phone` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  `createUser` varchar(255) DEFAULT NULL,
  `isDelete` tinyint(1) DEFAULT '0' COMMENT '逻辑删除。是否已删除 1：是；0：否',
  `enabled` tinyint(1) DEFAULT '1' COMMENT '是否启用。1：是；0：否',
  PRIMARY KEY (`id`),
  KEY `fk_customer` (`customer`),
  KEY `fk2_createUser` (`createUser`),
  CONSTRAINT `fk2_createUser` FOREIGN KEY (`createUser`) REFERENCES `user` (`id`),
  CONSTRAINT `fk_customer` FOREIGN KEY (`customer`) REFERENCES `customer` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='客户联系人';

-- ----------------------------
-- Records of linkman
-- ----------------------------

-- ----------------------------
-- Table structure for procurement_order
-- ----------------------------
DROP TABLE IF EXISTS `procurement_order`;
CREATE TABLE `procurement_order` (
  `id` varchar(20) NOT NULL,
  `supplier` varchar(128) DEFAULT NULL,
  `procurer` varchar(128) DEFAULT NULL,
  `drug` varchar(128) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `createTime` datetime DEFAULT NULL,
  `isDelete` tinyint(4) DEFAULT '0' COMMENT '是否删除 1：删除',
  PRIMARY KEY (`id`),
  KEY `fk_supplier` (`supplier`),
  KEY `fk_procurer` (`procurer`),
  KEY `fk_drug` (`drug`),
  CONSTRAINT `fk_drug` FOREIGN KEY (`drug`) REFERENCES `drug` (`id`),
  CONSTRAINT `fk_procurer` FOREIGN KEY (`procurer`) REFERENCES `procurer` (`id`),
  CONSTRAINT `fk_supplier` FOREIGN KEY (`supplier`) REFERENCES `supplier` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='采购单';

-- ----------------------------
-- Records of procurement_order
-- ----------------------------

-- ----------------------------
-- Table structure for procurer
-- ----------------------------
DROP TABLE IF EXISTS `procurer`;
CREATE TABLE `procurer` (
  `id` varchar(20) NOT NULL,
  `name` varchar(50) NOT NULL,
  `age` int(11) DEFAULT NULL,
  `tel` varchar(15) DEFAULT NULL,
  `email` varchar(15) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `createTime` datetime DEFAULT NULL,
  `isDelete` tinyint(4) DEFAULT '0' COMMENT '是否删除 1：删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of procurer
-- ----------------------------

-- ----------------------------
-- Table structure for sort
-- ----------------------------
DROP TABLE IF EXISTS `sort`;
CREATE TABLE `sort` (
  `id` varchar(128) NOT NULL,
  `name` varchar(50) NOT NULL COMMENT '类别名称',
  `pid` varchar(128) DEFAULT NULL COMMENT '父目录',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `createTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='药品分类';

-- ----------------------------
-- Records of sort
-- ----------------------------
INSERT INTO `sort` VALUES ('0b0ed756-0642-11e7-8d59-0021cc62c2f3', '戒毒药品', '', '戒毒药品', '2017-03-11 21:56:38');
INSERT INTO `sort` VALUES ('11283353-0642-11e7-8d59-0021cc62c2f3', '放射性药品', '', '放射性药品', '2017-03-11 21:56:43');
INSERT INTO `sort` VALUES ('254de094-0641-11e7-8d59-0021cc62c2f3', '处方药', '', '需要医生给病人拿药', '2017-03-11 21:56:46');
INSERT INTO `sort` VALUES ('33e8cd1b-065e-11e7-8d59-0021cc62c2f3', '中药', '', null, '2017-03-11 21:56:48');
INSERT INTO `sort` VALUES ('6f9454e8-0642-11e7-8d59-0021cc62c2f3', '感冒药', 'abaeedea-0641-11e7-8d59-0021cc62c2f3', '治疗感冒', '2017-03-11 21:56:52');
INSERT INTO `sort` VALUES ('abaeedea-0641-11e7-8d59-0021cc62c2f3', '非处方药', '', '自己可以拿的药', '2017-03-11 21:56:56');
INSERT INTO `sort` VALUES ('c7349822-0641-11e7-8d59-0021cc62c2f3', '麻醉药品', '', '麻醉药品', '2017-03-11 21:56:59');

-- ----------------------------
-- Table structure for supplier
-- ----------------------------
DROP TABLE IF EXISTS `supplier`;
CREATE TABLE `supplier` (
  `id` varchar(128) NOT NULL,
  `name` varchar(50) NOT NULL,
  `level` varchar(50) DEFAULT NULL,
  `address` text,
  `remark` text,
  `createTime` datetime DEFAULT NULL,
  `isDelete` tinyint(4) DEFAULT '0' COMMENT '是否删除 1：删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='供应商';

-- ----------------------------
-- Records of supplier
-- ----------------------------
INSERT INTO `supplier` VALUES ('d98a4a55-0c9c-11e7-8d59-0021cc62c2f3', '云南制药厂', '一级制药厂', '云南省', '制药厂', '2017-03-19 20:31:35', '0');

-- ----------------------------
-- Table structure for task
-- ----------------------------
DROP TABLE IF EXISTS `task`;
CREATE TABLE `task` (
  `id` varchar(128) NOT NULL,
  `NAME` varchar(100) DEFAULT NULL,
  `supplier` varchar(128) DEFAULT NULL COMMENT '供应商（舍弃）',
  `customer` varchar(128) DEFAULT NULL COMMENT '客户',
  `state` varchar(255) DEFAULT NULL COMMENT '任务状态',
  `type` varchar(128) DEFAULT NULL,
  `LEVEL` varchar(100) DEFAULT NULL COMMENT '紧急程度',
  `executor` varchar(128) DEFAULT NULL COMMENT '负责人',
  `createUser` varchar(128) DEFAULT NULL COMMENT '创建人',
  `attachment` text COMMENT '附件',
  `description` text COMMENT '描述',
  `createTime` datetime DEFAULT NULL COMMENT '创建时间',
  `startTime` datetime DEFAULT NULL COMMENT '开始时间',
  `endTime` datetime DEFAULT NULL COMMENT '结束时间',
  `isDelete` tinyint(4) DEFAULT '0' COMMENT '是否删除 1： 删除',
  PRIMARY KEY (`id`),
  KEY `fk3_supplier` (`supplier`),
  KEY `fk3_customer` (`customer`),
  KEY `fk3_executor` (`executor`),
  KEY `fk3_createUser` (`createUser`),
  CONSTRAINT `fk3_createUser` FOREIGN KEY (`createUser`) REFERENCES `user` (`id`),
  CONSTRAINT `fk3_customer` FOREIGN KEY (`customer`) REFERENCES `customer` (`id`),
  CONSTRAINT `fk3_executor` FOREIGN KEY (`executor`) REFERENCES `user` (`id`),
  CONSTRAINT `fk3_supplier` FOREIGN KEY (`supplier`) REFERENCES `supplier` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务';

-- ----------------------------
-- Records of task
-- ----------------------------
INSERT INTO `task` VALUES ('523511dc-0ca3-11e7-8d59-0021cc62c2f3', '销售大青叶', null, '884c3128-0ca1-11e7-8d59-0021cc62c2f3', null, '销售', '一般', 'c8ab7c2d-0c87-11e7-8d59-0021cc62c2f3', '2dff7521-151c-11e7-af11-0021cc62c2f3', null, '销售药品销售药品', '2017-03-19 20:55:56', '2017-03-07 20:55:59', '2017-03-19 20:56:03', '0');
INSERT INTO `task` VALUES ('baf1d52e-0c9c-11e7-8d59-0021cc62c2f3', '购买阿莫西林', 'd98a4a55-0c9c-11e7-8d59-0021cc62c2f3', null, null, '购买', '紧急', 'c8ab7c2d-0c87-11e7-8d59-0021cc62c2f3', 'c8ab7c2d-0c87-11e7-8d59-0021cc62c2f3', null, '购买药品', '2017-03-19 20:36:36', '2017-03-15 20:36:41', '2017-03-19 20:36:49', '0');

-- ----------------------------
-- Table structure for task_copy
-- ----------------------------
DROP TABLE IF EXISTS `task_copy`;
CREATE TABLE `task_copy` (
  `id` varchar(128) NOT NULL,
  `NAME` varchar(100) DEFAULT NULL,
  `supplier` varchar(128) DEFAULT NULL COMMENT '供应商（采购时有）',
  `customer` varchar(128) DEFAULT NULL COMMENT '客户（销售时有）',
  `state` varchar(255) DEFAULT NULL COMMENT '任务状态',
  `type` varchar(128) DEFAULT NULL,
  `LEVEL` varchar(100) DEFAULT NULL COMMENT '紧急程度',
  `executor` varchar(128) DEFAULT NULL COMMENT '负责人',
  `createUser` varchar(128) DEFAULT NULL COMMENT '创建人',
  `attachment` text COMMENT '附件',
  `description` text COMMENT '描述',
  `createTime` datetime DEFAULT NULL COMMENT '创建时间',
  `startTime` datetime DEFAULT NULL COMMENT '开始时间',
  `endTime` datetime DEFAULT NULL COMMENT '结束时间',
  `isDelete` tinyint(4) DEFAULT '0' COMMENT '是否删除 1： 删除',
  PRIMARY KEY (`id`),
  KEY `fk3_supplier` (`supplier`),
  KEY `fk3_customer` (`customer`),
  KEY `fk3_executor` (`executor`),
  KEY `fk3_createUser` (`createUser`),
  CONSTRAINT `task_copy_ibfk_1` FOREIGN KEY (`createUser`) REFERENCES `user` (`id`),
  CONSTRAINT `task_copy_ibfk_2` FOREIGN KEY (`customer`) REFERENCES `customer` (`id`),
  CONSTRAINT `task_copy_ibfk_3` FOREIGN KEY (`executor`) REFERENCES `user` (`id`),
  CONSTRAINT `task_copy_ibfk_4` FOREIGN KEY (`supplier`) REFERENCES `supplier` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务';

-- ----------------------------
-- Records of task_copy
-- ----------------------------
INSERT INTO `task_copy` VALUES ('523511dc-0ca3-11e7-8d59-0021cc62c2f3', '销售大青叶', null, '884c3128-0ca1-11e7-8d59-0021cc62c2f3', null, '销售', '一般', 'c8ab7c2d-0c87-11e7-8d59-0021cc62c2f3', '2dff7521-151c-11e7-af11-0021cc62c2f3', null, '销售药品', '2017-03-19 20:55:56', '2017-03-07 20:55:59', '2017-03-19 20:56:03', '0');
INSERT INTO `task_copy` VALUES ('baf1d52e-0c9c-11e7-8d59-0021cc62c2f3', '购买阿莫西林', 'd98a4a55-0c9c-11e7-8d59-0021cc62c2f3', null, null, '购买', '紧急', 'c8ab7c2d-0c87-11e7-8d59-0021cc62c2f3', 'c8ab7c2d-0c87-11e7-8d59-0021cc62c2f3', null, '购买药品', '2017-03-19 20:36:36', '2017-03-15 20:36:41', '2017-03-19 20:36:49', '0');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` varchar(128) NOT NULL,
  `name` varchar(20) NOT NULL COMMENT '登陆名',
  `password` varchar(20) NOT NULL COMMENT '密码',
  `age` int(11) DEFAULT NULL,
  `tel` varchar(15) DEFAULT NULL,
  `email` varchar(15) DEFAULT NULL,
  `longitude` decimal(18,0) DEFAULT NULL COMMENT '经度',
  `latitude` decimal(18,0) DEFAULT NULL COMMENT '纬度',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `createTime` datetime DEFAULT NULL,
  `isDelete` tinyint(4) DEFAULT '0' COMMENT '是否删除 1： 删除',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户';

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('2dff7521-151c-11e7-af11-0021cc62c2f3', '张艺璇', '222222', '12', null, null, null, null, null, null, '0');
INSERT INTO `user` VALUES ('c8ab7c2d-0c87-11e7-8d59-0021cc62c2f3', '张云逸', '123456', '18', '18353525476', '78936@qq.com', null, null, null, '2017-03-20 08:39:14', '0');

-- ----------------------------
-- Table structure for warehouse
-- ----------------------------
DROP TABLE IF EXISTS `warehouse`;
CREATE TABLE `warehouse` (
  `id` varchar(128) NOT NULL,
  `name` varchar(20) NOT NULL COMMENT '仓库名称',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `createTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='仓库';

-- ----------------------------
-- Records of warehouse
-- ----------------------------
INSERT INTO `warehouse` VALUES ('0941d77d-0643-11e7-8d59-0021cc62c2f3', '冷藏库', '', '2017-03-11 21:56:23');
INSERT INTO `warehouse` VALUES ('f5987c76-0642-11e7-8d59-0021cc62c2f3', '常温库', '', '2017-03-11 21:56:27');

-- ----------------------------
-- Procedure structure for wk
-- ----------------------------
DROP PROCEDURE IF EXISTS `wk`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `wk`()
BEGIN
DECLARE i int;
set i = 1;
WHILE i < 3 DO
update students SET grade=CONCAT("20130612",LPAD(i+"",2,"0"));
set i = i + 1;
END WHILE;
END
;;
DELIMITER ;
SET FOREIGN_KEY_CHECKS=1;
