/*
Navicat MySQL Data Transfer

Source Server         : abc
Source Server Version : 50528
Source Host           : localhost:3306
Source Database       : schooltask

Target Server Type    : MYSQL
Target Server Version : 50528
File Encoding         : 65001

Date: 2017-03-12 00:07:46
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for article
-- ----------------------------
DROP TABLE IF EXISTS `article`;
CREATE TABLE `article` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `student_no` varchar(20) NOT NULL,
  `title` varchar(100) NOT NULL,
  `content` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_stu_no` (`student_no`),
  CONSTRAINT `fk_stu_no` FOREIGN KEY (`student_no`) REFERENCES `students` (`no`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of article
-- ----------------------------
INSERT INTO `article` VALUES ('1', '2013061201', 'test_title', 'test_content');
INSERT INTO `article` VALUES ('2', '2013061201', 'test_title_2', 'test_content_2');
INSERT INTO `article` VALUES ('3', '2013061201', 'test_title_3', 'test_content_3');
INSERT INTO `article` VALUES ('4', '2013061201', 'test_title_4', 'test_content_4');

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
  `sortId` varchar(128) DEFAULT NULL,
  `warehouseId` varchar(128) DEFAULT NULL,
  `commonName` varchar(50) DEFAULT NULL COMMENT '通用名',
  `createTime` datetime DEFAULT NULL COMMENT '进货日期',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`),
  KEY `fk_sortId` (`sortId`),
  KEY `fk_warehouseId` (`warehouseId`),
  CONSTRAINT `fk_sortId` FOREIGN KEY (`sortId`) REFERENCES `sort` (`id`),
  CONSTRAINT `fk_warehouseId` FOREIGN KEY (`warehouseId`) REFERENCES `warehouse` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='药品';

-- ----------------------------
-- Records of drug
-- ----------------------------
INSERT INTO `drug` VALUES ('019fef87-0640-11e7-8d59-0021cc62c2f3', 'PCblymd', '丙硫氧嘧啶片', '深圳市中联', '瓶', '200', '100.00', '150.00', '2020-12-11', '254de094-0641-11e7-8d59-0021cc62c2f3', '0941d77d-0643-11e7-8d59-0021cc62c2f3', '丙硫氧嘧啶片', '2017-03-11 00:00:00', null);
INSERT INTO `drug` VALUES ('8eeb67b5-065d-11e7-8d59-0021cc62c2f3', 'OTCffdsp', '复方丹参片', '广州白云山制药', '瓶', '100', '50.00', '120.00', '2019-11-11', '33e8cd1b-065e-11e7-8d59-0021cc62c2f3', 'f5987c76-0642-11e7-8d59-0021cc62c2f3', '复方丹参片', '2017-03-11 00:00:00', null);

-- ----------------------------
-- Table structure for login_user
-- ----------------------------
DROP TABLE IF EXISTS `login_user`;
CREATE TABLE `login_user` (
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
-- Records of login_user
-- ----------------------------

-- ----------------------------
-- Table structure for procurementorder
-- ----------------------------
DROP TABLE IF EXISTS `procurementorder`;
CREATE TABLE `procurementorder` (
  `id` varchar(20) NOT NULL,
  `supplierId` varchar(128) DEFAULT NULL,
  `procurerId` varchar(128) DEFAULT NULL,
  `drugId` varchar(128) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `createTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_supplierId` (`supplierId`),
  KEY `fk_procurerId` (`procurerId`),
  KEY `fk_drugId` (`drugId`),
  CONSTRAINT `fk_drugId` FOREIGN KEY (`drugId`) REFERENCES `drug` (`id`),
  CONSTRAINT `fk_procurerId` FOREIGN KEY (`procurerId`) REFERENCES `procurer` (`id`),
  CONSTRAINT `fk_supplierId` FOREIGN KEY (`supplierId`) REFERENCES `supplier` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of procurementorder
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
-- Table structure for students
-- ----------------------------
DROP TABLE IF EXISTS `students`;
CREATE TABLE `students` (
  `no` varchar(20) NOT NULL COMMENT '学号',
  `name` varchar(50) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `grade` double(11,2) DEFAULT NULL COMMENT '学生成绩',
  PRIMARY KEY (`no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of students
-- ----------------------------
INSERT INTO `students` VALUES ('2013061201', '张雨晨', '23', '86.90');
INSERT INTO `students` VALUES ('2013061202', '张洁羽', '23', '89.90');
INSERT INTO `students` VALUES ('2013061203', '张洁羽', '23', '89.90');
INSERT INTO `students` VALUES ('2013061205', '张洁羽', '23', '89.90');
INSERT INTO `students` VALUES ('2013061206', '张洁羽', '23', '89.90');
INSERT INTO `students` VALUES ('2013061207', '张雨萌', '23', '222.00');

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
