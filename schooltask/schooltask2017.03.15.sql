/*
Navicat MySQL Data Transfer

Source Server         : abc
Source Server Version : 50528
Source Host           : localhost:3306
Source Database       : schooltask

Target Server Type    : MYSQL
Target Server Version : 50528
File Encoding         : 65001

Date: 2017-03-15 09:55:16
*/

SET FOREIGN_KEY_CHECKS=0;

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
  CONSTRAINT `fk_warehouse` FOREIGN KEY (`warehouse`) REFERENCES `warehouse` (`id`),
  CONSTRAINT `fk_sort` FOREIGN KEY (`sort`) REFERENCES `sort` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='药品';

-- ----------------------------
-- Records of drug
-- ----------------------------
INSERT INTO `drug` VALUES ('019fef87-0640-11e7-8d59-0021cc62c2f3', 'PCblymd', '丙硫氧嘧啶片', '深圳市中联', '瓶', '200', '100.00', '150.00', '2020-12-11', '254de094-0641-11e7-8d59-0021cc62c2f3', '0941d77d-0643-11e7-8d59-0021cc62c2f3', '丙硫氧嘧啶片', '2017-03-11 00:00:00', null);
INSERT INTO `drug` VALUES ('3a94bdfe-091f-11e7-8d59-0021cc62c2f3', 'OTCffdqy', '复方大青叶', '广州白云山制药', '盒', '500', '3.00', '4.00', '2019-11-15', '6f9454e8-0642-11e7-8d59-0021cc62c2f3', 'f5987c76-0642-11e7-8d59-0021cc62c2f3', '大青叶', '2016-11-15 09:34:10', null);
INSERT INTO `drug` VALUES ('8eeb67b5-065d-11e7-8d59-0021cc62c2f3', 'OTCffdsp', '复方丹参片', '广州白云山制药', '瓶', '100', '50.00', '120.00', '2019-11-11', '33e8cd1b-065e-11e7-8d59-0021cc62c2f3', 'f5987c76-0642-11e7-8d59-0021cc62c2f3', '复方丹参片', '2017-03-11 00:00:00', null);

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
  PRIMARY KEY (`id`),
  KEY `fk_supplier` (`supplier`),
  KEY `fk_procurer` (`procurer`),
  KEY `fk_drug` (`drug`),
  CONSTRAINT `fk_drug` FOREIGN KEY (`drug`) REFERENCES `drug` (`id`),
  CONSTRAINT `fk_procurer` FOREIGN KEY (`procurer`) REFERENCES `procurer` (`id`),
  CONSTRAINT `fk_supplier` FOREIGN KEY (`supplier`) REFERENCES `supplier` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
  `id` varchar(20) NOT NULL,
  `name` varchar(50) NOT NULL,
  `remark` varchar(255) DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of supplier
-- ----------------------------

-- ----------------------------
-- Table structure for uer
-- ----------------------------
DROP TABLE IF EXISTS `uer`;
CREATE TABLE `uer` (
  `id` varchar(20) NOT NULL,
  `name` varchar(20) NOT NULL COMMENT '登陆名',
  `password` varchar(20) NOT NULL COMMENT '密码',
  `age` int(11) DEFAULT NULL,
  `tel` varchar(15) DEFAULT NULL,
  `email` varchar(15) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `createTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of uer
-- ----------------------------

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
