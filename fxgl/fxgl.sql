/*
Navicat MySQL Data Transfer

Source Server         : maozx
Source Server Version : 50528
Source Host           : 127.0.0.1:3306
Source Database       : fxgl

Target Server Type    : MYSQL
Target Server Version : 50528
File Encoding         : 65001

Date: 2017-05-13 09:31:25
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for cp_goods
-- ----------------------------
DROP TABLE IF EXISTS `cp_goods`;
CREATE TABLE `cp_goods` (
  `GOODS_ID` varchar(100) NOT NULL,
  `TITLE` varchar(255) DEFAULT NULL COMMENT '商品标题',
  `BIANMA` varchar(30) DEFAULT NULL COMMENT '商品编码',
  `SPTYPE_ID` varchar(100) DEFAULT NULL COMMENT '商品类别',
  `SPBRAND_ID` varchar(100) DEFAULT NULL COMMENT '品牌',
  `SPUNIT_ID` varchar(100) DEFAULT NULL COMMENT '计量单位',
  `DESCRIPTION` varchar(5000) DEFAULT NULL COMMENT '商品描述',
  `SHORTDESC` varchar(500) DEFAULT NULL COMMENT '简述',
  `USERNAME` varchar(100) DEFAULT NULL COMMENT '用户名',
  `ZCOUNT` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cp_goods
-- ----------------------------
INSERT INTO `cp_goods` VALUES ('31cd9715f3d24059ae429110cbcdaf73', '车管家系统', '1001', '', '', '', '<p>车管家系统</p>', '车管家系统', 'a0', '1000');
INSERT INTO `cp_goods` VALUES ('5d1a7a1bb97a4a80baf431bc5c0e8fc6', 'VPS定位系统', '1002', '', '', '', '<p>VPS定位系统</p>', 'VPS定位系统', 'a0', '2000');
INSERT INTO `cp_goods` VALUES ('af3d95602013466ba4f25d9e00f01477', '烟台车管家系列', '1002', '', '', '', '<p>车管家系列</p>', '车管家系列', 'a1', '100');

-- ----------------------------
-- Table structure for cp_spbrand
-- ----------------------------
DROP TABLE IF EXISTS `cp_spbrand`;
CREATE TABLE `cp_spbrand` (
  `SPBRAND_ID` varchar(100) NOT NULL,
  `NAME` varchar(50) DEFAULT NULL COMMENT '品牌管理',
  `BZ` varchar(1000) DEFAULT NULL COMMENT '备注',
  `USERNAME` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`SPBRAND_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cp_spbrand
-- ----------------------------
INSERT INTO `cp_spbrand` VALUES ('df15a75381614125a6b780fe8a386d30', '方硕总部仓库', '', 'a0');

-- ----------------------------
-- Table structure for cp_sptype
-- ----------------------------
DROP TABLE IF EXISTS `cp_sptype`;
CREATE TABLE `cp_sptype` (
  `SPTYPE_ID` varchar(100) NOT NULL,
  `NAME` varchar(50) DEFAULT NULL COMMENT '商品类别',
  `BZ` varchar(1000) DEFAULT NULL COMMENT '备注',
  `USERNAME` varchar(100) DEFAULT NULL COMMENT '用户名',
  PRIMARY KEY (`SPTYPE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cp_sptype
-- ----------------------------

-- ----------------------------
-- Table structure for cp_spunit
-- ----------------------------
DROP TABLE IF EXISTS `cp_spunit`;
CREATE TABLE `cp_spunit` (
  `SPUNIT_ID` varchar(100) NOT NULL,
  `NAME` varchar(50) DEFAULT NULL COMMENT '计量单位',
  `BZ` varchar(1000) DEFAULT NULL COMMENT '备注',
  `USERNAME` varchar(100) DEFAULT NULL COMMENT '用户名',
  PRIMARY KEY (`SPUNIT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cp_spunit
-- ----------------------------

-- ----------------------------
-- Table structure for erp_intoku
-- ----------------------------
DROP TABLE IF EXISTS `erp_intoku`;
CREATE TABLE `erp_intoku` (
  `INTOKU_ID` varchar(100) NOT NULL,
  `GOODS_ID` varchar(100) DEFAULT NULL COMMENT '商品ID',
  `INCOUNT` int(11) NOT NULL COMMENT '数量',
  `PRICE` double(11,2) DEFAULT NULL COMMENT '单价',
  `ZPRICE` double(11,2) DEFAULT NULL COMMENT '总价',
  `INTIME` varchar(32) DEFAULT NULL COMMENT '入库时间',
  `BZ` varchar(255) DEFAULT NULL COMMENT '备注',
  `USERNAME` varchar(100) DEFAULT NULL COMMENT '用户名',
  `GOODS_NAME` varchar(100) DEFAULT NULL,
  `stock` varchar(100) DEFAULT NULL COMMENT '库存状态',
  PRIMARY KEY (`INTOKU_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of erp_intoku
-- ----------------------------
INSERT INTO `erp_intoku` VALUES ('07d6197ddb114189b0f0d041e6ef367f', '31cd9715f3d24059ae429110cbcdaf73', '1000', '10.00', '10000.00', '2017-05-12 13:11:55', '进货车管家系统1000个', 'a0', '车管家系统', null);
INSERT INTO `erp_intoku` VALUES ('443f8086434c49f2a71df82512511c83', '5d1a7a1bb97a4a80baf431bc5c0e8fc6', '1000', '10.00', '10000.00', '2017-05-12 13:12:36', '进货VPS定位系统1000个', 'a0', 'VPS定位系统', null);
INSERT INTO `erp_intoku` VALUES ('626ae399f0f94028913fcebb8272e8b6', '31cd9715f3d24059ae429110cbcdaf73', '1000', '1.00', '1000.00', '2017-05-12 17:00:07', '总公司进货1000个', 'a0', '车管家系统', null);
INSERT INTO `erp_intoku` VALUES ('dc826ace0bcd4eb7ba222162e0c5fb25', 'af3d95602013466ba4f25d9e00f01477', '100', '2.00', '200.00', '2017-05-12 17:07:03', '烟台进货200个', 'a1', '烟台车管家系列', null);
INSERT INTO `erp_intoku` VALUES ('edd0ab78f277477a9674f881a1213b39', '5d1a7a1bb97a4a80baf431bc5c0e8fc6', '1000', '1.00', '1000.00', '2017-05-12 17:03:12', '入库1000个', 'a0', 'VPS定位系统', null);

-- ----------------------------
-- Table structure for erp_outku
-- ----------------------------
DROP TABLE IF EXISTS `erp_outku`;
CREATE TABLE `erp_outku` (
  `OUTKU_ID` varchar(100) NOT NULL,
  `GOODS_ID` varchar(100) DEFAULT NULL COMMENT '商品ID',
  `INCOUNT` int(11) NOT NULL COMMENT '数量',
  `PRICE` double(11,2) DEFAULT NULL COMMENT '单价',
  `ZPRICE` double(11,2) DEFAULT NULL COMMENT '总价',
  `OUTTIME` varchar(32) DEFAULT NULL COMMENT '出库时间',
  `GOODS_NAME` varchar(255) DEFAULT NULL COMMENT '商品名称',
  `USERNAME` varchar(100) DEFAULT NULL COMMENT '用户名',
  `BZ` text,
  PRIMARY KEY (`OUTKU_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of erp_outku
-- ----------------------------
INSERT INTO `erp_outku` VALUES ('4990e4306d57463e9c027f12033fcbf1', '31cd9715f3d24059ae429110cbcdaf73', '1000', '2.00', '2000.00', '2017-05-12 17:02:48', '车管家系统', 'a0', '出库1000个');

-- ----------------------------
-- Table structure for sys_fhbutton
-- ----------------------------
DROP TABLE IF EXISTS `sys_fhbutton`;
CREATE TABLE `sys_fhbutton` (
  `FHBUTTON_ID` varchar(100) NOT NULL,
  `NAME` varchar(30) DEFAULT NULL COMMENT '名称',
  `QX_NAME` varchar(50) DEFAULT NULL COMMENT '权限标识',
  `BZ` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`FHBUTTON_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_fhbutton
-- ----------------------------
INSERT INTO `sys_fhbutton` VALUES ('3542adfbda73410c976e185ffe50ad06', '导出EXCEL', 'toExcel', '导出EXCEL');
INSERT INTO `sys_fhbutton` VALUES ('46992ea280ba4b72b29dedb0d4bc0106', '发邮件', 'email', '发送电子邮件');
INSERT INTO `sys_fhbutton` VALUES ('4efa162fce8340f0bd2dcd3b11d327ec', '导入EXCEL', 'FromExcel', '导入EXCEL到系统用户');
INSERT INTO `sys_fhbutton` VALUES ('cc51b694d5344d28a9aa13c84b7166cd', '发短信', 'sms', '发送短信');
INSERT INTO `sys_fhbutton` VALUES ('da7fd386de0b49ce809984f5919022b8', '站内信', 'FHSMS', '发送站内信');

-- ----------------------------
-- Table structure for sys_fhlog
-- ----------------------------
DROP TABLE IF EXISTS `sys_fhlog`;
CREATE TABLE `sys_fhlog` (
  `FHLOG_ID` varchar(100) NOT NULL,
  `USERNAME` varchar(100) DEFAULT NULL COMMENT '用户名',
  `CZTIME` varchar(32) DEFAULT NULL COMMENT '操作时间',
  `CONTENT` varchar(255) DEFAULT NULL COMMENT '事件',
  PRIMARY KEY (`FHLOG_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_fhlog
-- ----------------------------
INSERT INTO `sys_fhlog` VALUES ('0008300ff0b84193aebd85a696637481', 'admin', '2017-05-04 11:08:41', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('0068fd6dbe364613a2dc7541c7e055d8', 'admin', '2017-05-02 22:48:44', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('008a3dfa87b545d08bdc56c7be3d8f48', 'a1', '2017-05-04 13:00:19', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('00c253a3fda44127bf84eaf568df60fe', 'admin', '2017-05-02 13:42:09', '删除菜单ID37');
INSERT INTO `sys_fhlog` VALUES ('0118d5e0580c48619a6a9c09c699f89c', 'admin', '2017-05-02 13:06:19', '修改菜单统计管理');
INSERT INTO `sys_fhlog` VALUES ('02679850cbf64db79b4ade3aa56c4843', 'admin', '2017-05-02 15:02:42', '退出');
INSERT INTO `sys_fhlog` VALUES ('02ded52f481a4203837238d36dcace06', 'admin', '2017-05-08 09:35:27', '修改add_qx权限，角色ID为:1');
INSERT INTO `sys_fhlog` VALUES ('031779f94a934c28a4f6a2e45072c0df', 'admin', '2017-05-08 09:35:56', '修改add_qx权限，角色ID为:3264c8e83d0248bb9e3ea6195b4c0216');
INSERT INTO `sys_fhlog` VALUES ('0358a500d6d640e7b20b039e9d6bb966', 'admin', '2017-05-02 13:33:45', '修改系统用户：a');
INSERT INTO `sys_fhlog` VALUES ('0369d18c3a564ba39f1d8c876935e549', 'a0', '2017-03-06 01:19:13', '退出');
INSERT INTO `sys_fhlog` VALUES ('04de5752f6854387a4f356f1d316387b', 'admin', '2017-05-02 10:53:26', '修改角色菜单权限，角色ID为:1');
INSERT INTO `sys_fhlog` VALUES ('053ad6cf8ece43ffb2a6bbc921f61234', 'a0', '2017-03-06 01:19:06', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('05e6f6e490b4414ea50c3737fe104465', 'admin', '2017-05-02 13:17:31', '修改角色:分公司');
INSERT INTO `sys_fhlog` VALUES ('05ed82f492fa437492d34137475d4e0c', 'admin', '2017-05-01 11:35:25', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('068de15bb96d490ea8ceca9a46a460e4', 'admin', '2017-05-03 17:15:18', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('069715a00ea44e48b27ca47cb524d05e', 'admin', '2017-05-02 12:40:48', '删除菜单ID8');
INSERT INTO `sys_fhlog` VALUES ('06eae8bd946d42e79dff8dd1735e2c32', 'a1', '2017-05-02 23:36:38', '退出');
INSERT INTO `sys_fhlog` VALUES ('07282aad58704fb2bcdcfff0a14f1baa', 'admin', '2017-05-01 11:21:34', '修改add_qx权限，角色ID为:3');
INSERT INTO `sys_fhlog` VALUES ('0780b79a7c444b74826928363a976fb4', 'a1', '2017-04-28 23:56:21', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('07bd1080a9af46209a8f34c77a4f674b', 'admin', '2017-05-02 10:34:14', '修改角色菜单权限，角色ID为:1');
INSERT INTO `sys_fhlog` VALUES ('07cde2df986e4fb5a7aa9354efb89cc1', 'admin', '2017-05-02 12:43:19', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('07e1b0a29e56417a882e3716c8bb2489', 'admin', '2017-05-02 17:41:16', '新增菜单商品列表');
INSERT INTO `sys_fhlog` VALUES ('084b5a7bc58f4084af88c7888e762200', 'admin', '2017-05-02 10:58:45', '修改菜单系统管理');
INSERT INTO `sys_fhlog` VALUES ('09b0b7be2df741bd91cbfcc9a4df140b', 'admin', '2017-05-02 12:39:36', '删除菜单ID52');
INSERT INTO `sys_fhlog` VALUES ('0a1857c201384c8baf20d7cbf390d789', 'admin', '2017-05-04 10:59:49', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('0a76673f1e7c44da97ca113b1dd0ec78', 'a1', '2017-05-02 10:29:17', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('0acce06b2eaf45d69a6c73323515f5ba', 'admin', '2017-04-28 23:44:39', '新增菜单客户管理');
INSERT INTO `sys_fhlog` VALUES ('0b50c8938b8349ce83a7244b0b926a86', 'a0', '2017-05-02 18:14:53', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('0b8c5c8d87d54b0dae0ad1fe4012b954', 'admin', '2017-05-02 18:12:07', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('0cee4cf7089f4d61a401b3ba206cf65a', 'admin', '2017-05-02 12:38:04', '修改菜单信息管理');
INSERT INTO `sys_fhlog` VALUES ('0cf8e6d95a1249cf899750313d855eff', 'admin', '2017-05-02 13:31:56', '修改系统用户：a2');
INSERT INTO `sys_fhlog` VALUES ('0e615af2d6ce4a319065c7dc368fa604', 'admin', '2017-05-02 12:20:26', '新增按钮权限pd{guid=1493698826276, BUTTON_ID=3542adfbda73410c976e185ffe50ad06, RB_ID=0ad63395e0ce44fc92ee986f6bd59014, ROLE_ID=3}');
INSERT INTO `sys_fhlog` VALUES ('0ed240ff1e554dc68b43815d85cebfe5', 'admin', '2017-05-02 13:22:16', '修改cha_qx权限，角色ID为:68f8e4a39efe47c7bb869e9d15ab925d');
INSERT INTO `sys_fhlog` VALUES ('0f335e162de1431a83396a35a3e9db0e', 'admin', '2017-05-02 13:06:57', '退出');
INSERT INTO `sys_fhlog` VALUES ('109e09c291f34637a8f0b1564516d760', 'a0', '2017-05-03 09:36:30', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('1102307d68a54688b13b41718e6b033f', 'admin', '2017-05-08 09:37:01', '修改add_qx权限，角色ID为:68f8e4a39efe47c7bb869e9d15ab925d');
INSERT INTO `sys_fhlog` VALUES ('112483f9aac84d3abf432ec8d216c124', 'a0', '2017-05-02 10:27:11', '退出');
INSERT INTO `sys_fhlog` VALUES ('1187ca2a71374038bf5b6f143cf63775', 'admin', '2017-04-30 23:14:12', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('125219021fde4fc7a8694da3f1e17296', 'admin', '2017-05-02 12:52:49', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('130e655b52c2466f88c0db4ab1b9b5f4', 'admin', '2017-05-02 10:53:10', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('134dfef3aaaf45cebc6909cfb783d6f5', 'admin', '2017-05-02 17:35:20', '修改菜单商品管理');
INSERT INTO `sys_fhlog` VALUES ('139493bd7f69484dbd160a9519f95228', 'admin', '2017-05-02 13:34:48', '退出');
INSERT INTO `sys_fhlog` VALUES ('13e500c8621d47a08be69b28090ca75c', 'admin', '2017-05-02 13:26:16', '修改系统用户：a');
INSERT INTO `sys_fhlog` VALUES ('149890e8a50c4f808ae22267e34cadc7', 'a0', '2017-04-29 09:15:51', '退出');
INSERT INTO `sys_fhlog` VALUES ('14ab5182c2734413ad6f05f8057b8019', 'admin', '2017-05-02 13:12:50', '退出');
INSERT INTO `sys_fhlog` VALUES ('158acb23b1ac4a20a30c6304971b8f8d', 'admin', '2017-04-28 23:54:11', '退出');
INSERT INTO `sys_fhlog` VALUES ('15f39b4ca775444386f38f9a54495aa4', 'admin', '2017-05-02 12:58:06', '退出');
INSERT INTO `sys_fhlog` VALUES ('169808da30984782be272ba78e844c9f', 'a4', '2017-05-01 01:42:11', '新注册');
INSERT INTO `sys_fhlog` VALUES ('173a57099d984960b27ef07765883de6', 'a0', '2017-05-02 11:15:15', '退出');
INSERT INTO `sys_fhlog` VALUES ('17f0864e28dc49188409e211d48efd1b', 'admin', '2017-05-08 09:35:36', '修改del_qx权限，角色ID为:1');
INSERT INTO `sys_fhlog` VALUES ('17f80f5807e142feb0c13717cb6bb007', 'admin', '2017-05-02 11:13:51', '修改角色菜单权限，角色ID为:3');
INSERT INTO `sys_fhlog` VALUES ('184ac437aeca4f3e953ece2631d54a5a', 'admin', '2017-05-02 10:58:29', '修改菜单库存管理');
INSERT INTO `sys_fhlog` VALUES ('1a619d549fdb4306af84f3d68e4146c0', 'admin', '2017-05-05 17:19:59', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('1a7e777dd083491a9d2306cd1d2df5e7', 'admin', '2017-05-02 11:07:31', '修改菜单用户管理');
INSERT INTO `sys_fhlog` VALUES ('1adcb6688f314dd4ac0b39a416d7b6eb', 'admin', '2017-05-02 11:08:17', '修改菜单系统工具');
INSERT INTO `sys_fhlog` VALUES ('1ae2750acfda40069933a0573fa61a40', 'a1', '2017-04-29 09:19:39', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('1b09d48c77144ecba7688e3801d40fe2', 'admin', '2017-04-28 23:53:46', '修改菜单商品入库');
INSERT INTO `sys_fhlog` VALUES ('1bcf65c0f9cd46f9b1846af134cf14e9', 'admin', '2017-05-03 17:17:39', '新增菜单库存统计');
INSERT INTO `sys_fhlog` VALUES ('1d258bda2890455a8542e9daabfdfcb3', 'admin', '2017-05-08 16:08:50', '新增菜单系统用户');
INSERT INTO `sys_fhlog` VALUES ('1d749d95e017439f9787c3209567e63d', 'admin', '2017-05-02 17:39:48', '删除菜单ID71');
INSERT INTO `sys_fhlog` VALUES ('1edab12e123c4f1a87dfe5a31d7587a3', 'admin', '2017-05-02 13:36:49', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('1f3988592a9d4e67b318c20ac5b79df6', 'a0', '2017-05-03 09:35:36', '退出');
INSERT INTO `sys_fhlog` VALUES ('1f4b9dd6dc2a461d9d9988f6dacd21ea', 'admin', '2017-05-02 13:18:44', '修改add_qx权限，角色ID为:3');
INSERT INTO `sys_fhlog` VALUES ('206327ca9ab54b5c9a9fa3cd04f80b68', 'admin', '2017-05-08 16:07:31', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('20d3d71ff88c40dfb1d6cab3cbe54f36', 'admin', '2017-05-01 00:41:55', '退出');
INSERT INTO `sys_fhlog` VALUES ('20eef4ffdbbb44aca7c75e045efef29e', 'admin', '2017-05-08 09:37:12', '修改edit_qx权限，角色ID为:68f8e4a39efe47c7bb869e9d15ab925d');
INSERT INTO `sys_fhlog` VALUES ('2111ba83be924df5b8388da0300a4dd3', 'admin', '2017-04-29 11:07:34', '退出');
INSERT INTO `sys_fhlog` VALUES ('2158c0a03f634dafbd367ca9cf305712', 'admin', '2017-05-04 14:48:41', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('21a7375a70244ad08d8040445bce39a7', 'admin', '2017-05-03 09:28:13', '退出');
INSERT INTO `sys_fhlog` VALUES ('2206b26e17fa454d8af83bb8aa8af934', 'admin', '2017-05-02 15:02:52', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('226bf1f3b79c493fb7470b941aa56d2c', 'admin', '2017-05-01 00:58:58', '退出');
INSERT INTO `sys_fhlog` VALUES ('22b3958a8e784844914d458c1057fe25', 'a1', '2017-05-02 10:28:33', '退出');
INSERT INTO `sys_fhlog` VALUES ('230a1385006d400eaccbedf30bc2ee0c', 'admin', '2017-05-01 11:23:34', '修改cha_qx权限，角色ID为:3');
INSERT INTO `sys_fhlog` VALUES ('239beb76b5ff4f5b93cbaec2dc9a582b', 'a0', '2017-03-05 22:15:04', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('245aa20ab87a4c2aa338d8959ba85a0f', 'admin', '2017-05-05 17:08:38', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('24a7892fcfe54ada9f76955642481935', 'admin', '2017-05-02 12:46:20', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('2548f4afcb424d02ad213276e27ea126', 'a3', '2017-04-29 12:35:06', '新注册');
INSERT INTO `sys_fhlog` VALUES ('277c8ffe13fb45f88e3a746439470b2d', 'a0', '2017-05-02 18:15:14', '退出');
INSERT INTO `sys_fhlog` VALUES ('27c0756475a74b2c99d8d5e7b6f8fe6f', 'admin', '2017-05-08 16:11:35', '修改cha_qx权限，角色ID为:3264c8e83d0248bb9e3ea6195b4c0216');
INSERT INTO `sys_fhlog` VALUES ('2820793e6f554fb688137f418e824808', 'a1', '2017-05-02 10:27:42', '退出');
INSERT INTO `sys_fhlog` VALUES ('28db2affe783404b9af4911a45785cfc', 'admin', '2017-05-02 13:04:26', '删除菜单ID57');
INSERT INTO `sys_fhlog` VALUES ('2972f75b17264590b62e841857da4785', 'admin', '2017-04-29 11:04:34', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('29bb7d9aa3264caa840497a14fd8d7ca', 'admin', '2017-05-02 15:45:31', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('2b5a807f239849a4bd1b582bf7165c55', 'admin', '2017-05-01 13:56:15', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('2db9a14c7dc1486c8e9250dfbd68b028', 'admin', '2017-05-02 10:28:16', '退出');
INSERT INTO `sys_fhlog` VALUES ('2df708ed8f7747f982989677828768cd', 'admin', '2017-05-02 12:46:56', '修改菜单数据库管理');
INSERT INTO `sys_fhlog` VALUES ('2e274311600649da97839c167344d714', 'admin', '2017-05-01 13:56:20', '退出');
INSERT INTO `sys_fhlog` VALUES ('2f2d991fd085489388bba72e9eda0fe7', 'admin', '2017-05-01 13:56:03', '退出');
INSERT INTO `sys_fhlog` VALUES ('2fb5434137e04dedb618e0e6d4b36c75', 'a0', '2017-04-28 23:55:35', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('303c371dfee14b8cab14597e5f654bae', 'a1', '2017-03-05 22:15:16', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('303c4d8b315d4684a1ea29249ff95854', 'admin', '2017-05-03 17:20:56', '退出');
INSERT INTO `sys_fhlog` VALUES ('30679750a7a1467b9b4ee33e8b2f8aa4', 'admin', '2017-05-02 10:53:22', '修改角色菜单权限，角色ID为:1');
INSERT INTO `sys_fhlog` VALUES ('3084527b41c44870860661afd01fd0c4', 'admin', '2017-05-02 13:42:37', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('30f400cd0e4841849dd81b036fa9d481', 'admin', '2017-05-02 12:39:39', '删除菜单ID51');
INSERT INTO `sys_fhlog` VALUES ('31c147e5c0a54b348c9d1a173c82fabe', 'admin', '2017-05-02 13:30:15', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('31d9e57d7add49b4b9637722dacf09f4', 'a1', '2017-05-02 10:59:43', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('32502eea9fd24c1d939c50f15071541a', 'admin', '2017-05-02 11:14:48', '退出');
INSERT INTO `sys_fhlog` VALUES ('32a471e490ca432a91ae7fd5b190918a', 'admin', '2017-05-02 13:28:15', '修改菜单公司管理');
INSERT INTO `sys_fhlog` VALUES ('32d99bf9aec14006a4037ab3752c39ee', 'admin', '2017-04-30 23:33:15', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('339890da76394e28b6bdfad338db0939', 'admin', '2017-05-02 17:31:15', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('3427955406574c21bb8b163c310ea1cc', 'admin', '2017-05-04 14:39:21', '退出');
INSERT INTO `sys_fhlog` VALUES ('34d795b849254e9d89fdecaa8670d642', 'admin', '2017-05-02 12:09:48', '导出用户信息到EXCEL');
INSERT INTO `sys_fhlog` VALUES ('3528f199153f448cbcbaae7cc58f3ec0', 'admin', '2017-05-08 09:36:06', '修改del_qx权限，角色ID为:3264c8e83d0248bb9e3ea6195b4c0216');
INSERT INTO `sys_fhlog` VALUES ('35af07040d6a4a598ae602cd7aad560f', 'admin', '2017-05-03 15:48:10', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('35d9fa9e8b3642878184534915d225fc', 'admin', '2017-05-02 10:58:00', '修改角色菜单权限，角色ID为:68f8e4a39efe47c7bb869e9d15ab925d');
INSERT INTO `sys_fhlog` VALUES ('361b4c460fc249d28233dcc799d07da6', 'admin', '2017-05-04 12:59:59', '退出');
INSERT INTO `sys_fhlog` VALUES ('37008ef403834db7856d799aa1ecb811', 'a0', '2017-04-29 00:13:19', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('378a7f2075ff4a50b1ab4f53ba4ac2e7', 'admin', '2017-05-02 10:25:39', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('37bcf4d3c415481eb366d3d3a1f6779b', 'a0', '2017-05-02 13:48:07', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('385c3719cf7642cdbee68aa3a4f430d8', 'a1', '2017-05-02 10:51:32', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('38677fccc2064239b3c61d726c7cd235', 'admin', '2017-05-02 13:22:08', '修改del_qx权限，角色ID为:68f8e4a39efe47c7bb869e9d15ab925d');
INSERT INTO `sys_fhlog` VALUES ('38d381e842da4408a57e010d9af1fbc4', 'admin', '2017-05-08 16:09:51', '删除菜单ID41');
INSERT INTO `sys_fhlog` VALUES ('38f04b1b6bf8481aada25b95909042ec', 'admin', '2017-05-02 18:13:08', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('39357f375f914b72b7b3a35ca3175108', 'a1', '2017-04-29 13:10:40', '退出');
INSERT INTO `sys_fhlog` VALUES ('39c125ddde214ef0bc5746a5bcddd4c5', 'admin', '2017-05-02 13:11:00', '退出');
INSERT INTO `sys_fhlog` VALUES ('3a6816018cfe468ca0475f97ae73276e', 'admin', '2017-05-02 10:59:04', '退出');
INSERT INTO `sys_fhlog` VALUES ('3bd2363d79e849f4bfeb16f73277e768', 'a0', '2017-05-02 14:43:26', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('3be9651cf1de4f948828f0e320aa16b4', 'admin', '2017-05-02 10:34:27', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('3db8631a79324a7ea2e7b485aede1404', 'a1', '2017-05-02 10:57:18', '退出');
INSERT INTO `sys_fhlog` VALUES ('3dc754e8a6304a15bf449cb6a0edbd93', 'a0', '2017-05-02 11:15:02', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('3e19e524a3204ecca74bd0d8feab7eab', 'admin', '2017-05-02 23:47:18', '退出');
INSERT INTO `sys_fhlog` VALUES ('3e58f7c9080c409cbedb5f56e71dc2f9', 'admin', '2017-05-02 10:51:06', '修改角色菜单权限，角色ID为:3');
INSERT INTO `sys_fhlog` VALUES ('3e7a65a5e3264fe2bc6cd50fe765f437', 'admin', '2017-05-02 11:14:16', '退出');
INSERT INTO `sys_fhlog` VALUES ('3f724f55b15c49caa3d500fefde2079e', 'a1', '2017-05-02 10:27:21', '登录系统密码或用户名错误');
INSERT INTO `sys_fhlog` VALUES ('3fe5aa98a799488d9931d3e2c1425707', 'a0', '2017-05-02 10:27:05', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('3fe7d05260bb428cb272fa661deb508d', 'a1', '2017-05-02 23:16:07', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('401e185bf22a4f3589696f77a4e47bae', 'admin', '2017-05-02 11:07:12', '修改菜单系统管理');
INSERT INTO `sys_fhlog` VALUES ('4085b544164345d7a7fa0985fb545680', 'admin', '2017-05-02 10:54:16', '修改角色菜单权限，角色ID为:3');
INSERT INTO `sys_fhlog` VALUES ('410eee760f7a4d39a0ef29e749192532', 'admin', '2017-05-02 18:11:58', '退出');
INSERT INTO `sys_fhlog` VALUES ('425fccaa11104bb9bbd95324638518d5', 'admin', '2017-05-02 18:12:56', '修改角色菜单权限，角色ID为:68f8e4a39efe47c7bb869e9d15ab925d');
INSERT INTO `sys_fhlog` VALUES ('42ec0aa661c0472a9b19342bcbc85a77', 'a1', '2017-05-02 12:51:23', '退出');
INSERT INTO `sys_fhlog` VALUES ('4333ff18f48647d685403a7a17474d70', 'admin', '2017-05-03 17:18:05', '新增菜单客户统计');
INSERT INTO `sys_fhlog` VALUES ('43e206be69b347f4ad67f3281c3cecae', 'a0', '2017-05-02 10:32:47', '退出');
INSERT INTO `sys_fhlog` VALUES ('43e8112a18aa424289b60745cd06d64b', 'a', '2017-05-02 13:11:40', '退出');
INSERT INTO `sys_fhlog` VALUES ('4794e01f15b7456c9c2111b2ecf7ad46', 'admin', '2017-05-02 10:27:53', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('47b014f443814c95ba779e24dd9fad6b', 'admin', '2017-04-29 11:05:29', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('485ab26379f4406c955bea99f0f848d0', 'admin', '2017-04-28 23:32:56', '修改菜单商品库存');
INSERT INTO `sys_fhlog` VALUES ('48cc9735c9a44f048c5c8695c72eef72', 'a1', '2017-05-02 14:43:45', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('4a26a181e70445c688699ffed50e4256', 'admin', '2017-05-02 14:58:47', '导出用户信息到EXCEL');
INSERT INTO `sys_fhlog` VALUES ('4b29d3c91250430299416ec5be0c78ac', 'admin', '2017-05-03 17:06:29', '新增菜单客户资料');
INSERT INTO `sys_fhlog` VALUES ('4b2ccec42fee4ab999d8dfb82f57f0f0', 'a0', '2017-05-02 10:30:06', '退出');
INSERT INTO `sys_fhlog` VALUES ('4b70ad5150db4726b270ec40a229f2d4', 'admin', '2017-05-02 12:47:38', '退出');
INSERT INTO `sys_fhlog` VALUES ('4c857b135e3a4586924255ecfbafc15f', 'a0', '2017-05-02 12:58:26', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('4d1ab63fcf704ba3a3bca73a74d657a6', 'a1', '2017-05-02 12:07:24', '退出');
INSERT INTO `sys_fhlog` VALUES ('4db97c4e1fb24c09b7927a2b0829ab72', 'admin', '2017-05-08 09:36:29', '修改cha_qx权限，角色ID为:3264c8e83d0248bb9e3ea6195b4c0216');
INSERT INTO `sys_fhlog` VALUES ('4e17963c7011460e93949f577b4de299', 'admin', '2017-05-01 00:33:32', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('4e484e7851924c60a8d8e89c90b96bb3', 'a0', '2017-05-02 14:43:36', '退出');
INSERT INTO `sys_fhlog` VALUES ('4e5d1dca52ed4671b92327f08cb3b179', 'admin', '2017-05-02 18:08:33', '删除菜单ID69');
INSERT INTO `sys_fhlog` VALUES ('4eb36c0fb9f44ae88049b08dcb21c73a', 'admin', '2017-05-08 16:11:05', '修改del_qx权限，角色ID为:3264c8e83d0248bb9e3ea6195b4c0216');
INSERT INTO `sys_fhlog` VALUES ('4f0c21b1c1e74019b05994e812c7d595', 'admin', '2017-04-28 23:22:37', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('4fa26fd302114814bf7c1c0474d6a055', 'admin', '2017-05-08 09:37:07', '修改del_qx权限，角色ID为:68f8e4a39efe47c7bb869e9d15ab925d');
INSERT INTO `sys_fhlog` VALUES ('4fd13290656d454f931cbc142dec3460', 'a0', '2017-05-02 10:54:55', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('5018800d32034323bdee7547944f9f03', 'admin', '2017-05-01 11:25:43', '删除菜单ID85');
INSERT INTO `sys_fhlog` VALUES ('501d507930df49fa882b910b34ed14a9', 'admin', '2017-05-03 17:06:45', '新增菜单新增客户');
INSERT INTO `sys_fhlog` VALUES ('508b9c3962794da88317f0e0f7e7a367', 'a1', '2017-05-02 10:32:23', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('51c2c2f3b67d488eaff5732fa95a7a59', 'admin', '2017-04-28 23:45:28', '修改菜单库存管理');
INSERT INTO `sys_fhlog` VALUES ('528caf6575f344e8bdc2c5c0f21f3ce0', 'admin', '2017-05-02 13:31:47', '修改系统用户：a1');
INSERT INTO `sys_fhlog` VALUES ('546df179d721485b881f77265aaef712', 'admin', '2017-05-02 13:12:09', '修改add_qx权限，角色ID为:3264c8e83d0248bb9e3ea6195b4c0216');
INSERT INTO `sys_fhlog` VALUES ('55ea740a72da441985730af973839569', 'admin', '2017-05-02 14:29:30', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('577c57b4f47e4e4d8860dfd0fe1c6e02', 'admin', '2017-05-08 16:10:00', '删除菜单ID40');
INSERT INTO `sys_fhlog` VALUES ('5862f8630cc7453cb247a782b29a663b', 'admin', '2017-05-02 10:32:56', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('587ced70515b42708095a8ab11addc9a', 'admin', '2017-05-02 13:24:04', '新增系统用户：a');
INSERT INTO `sys_fhlog` VALUES ('58dbd150da654581b8a47ebf4e5674e7', 'admin', '2017-05-01 10:00:11', '退出');
INSERT INTO `sys_fhlog` VALUES ('5928086bad31423d9f7cc025a3f88873', 'admin', '2017-05-02 11:09:09', '修改菜单客户管理');
INSERT INTO `sys_fhlog` VALUES ('5a8a797600c546b1b97c006f13ba2937', 'admin', '2017-05-02 12:38:16', '退出');
INSERT INTO `sys_fhlog` VALUES ('5bfe999e25fe41858ba77172ec4eeb9b', 'admin', '2017-05-02 23:15:58', '退出');
INSERT INTO `sys_fhlog` VALUES ('5cabdff8de3e416484a26bac641a1d7c', 'admin', '2017-05-02 10:54:45', '退出');
INSERT INTO `sys_fhlog` VALUES ('5cc008ba3ba14f35b43e3498bc77a4cd', 'admin', '2017-05-03 17:16:50', '修改菜单系统用户');
INSERT INTO `sys_fhlog` VALUES ('5defb8cabead4bd686006b4ed28f78b7', 'admin', '2017-05-04 14:38:20', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('5e221e66ddc34a9da152b2b5e09f052b', 'admin', '2017-05-03 10:16:57', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('5f64a4189dcd4943841cc702210eed5b', 'a2', '2017-04-28 23:56:58', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('5fe5b682633a4c4dbd450f464a5ef09a', 'admin', '2017-05-02 13:09:01', '修改角色菜单权限，角色ID为:1');
INSERT INTO `sys_fhlog` VALUES ('5ff6ab6be05e4202a774cc0810a911fa', 'admin', '2017-05-02 18:10:19', '新增菜单统计分析');
INSERT INTO `sys_fhlog` VALUES ('6062e9b9a14e43d0b69d3857b2df6899', 'admin', '2017-05-02 13:22:22', '修改角色菜单权限，角色ID为:68f8e4a39efe47c7bb869e9d15ab925d');
INSERT INTO `sys_fhlog` VALUES ('60747ae48de04d1d891947e48927ad22', 'admin', '2017-05-02 10:28:05', '修改add_qx权限，角色ID为:3264c8e83d0248bb9e3ea6195b4c0216');
INSERT INTO `sys_fhlog` VALUES ('60f575170b2347cca2e5adff93f598b8', 'admin', '2017-05-02 14:53:54', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('6175b3f232bc4867879f11383d01abdc', 'a0', '2017-04-29 09:11:23', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('619f2cae4657406b9fa3f5100c3c9b83', 'admin', '2017-05-03 17:04:49', '修改菜单新增销售订单');
INSERT INTO `sys_fhlog` VALUES ('6246ff3c018f4159a0336eb19df4c77b', 'a1', '2017-04-29 10:26:34', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('62c2f162d8874904b624e17bddb3fdc9', 'a0', '2017-05-02 10:47:19', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('62e087f112ff4e6abf938edf7bf35592', 'admin', '2017-04-29 00:06:55', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('62f2f6d941e24caf8e47ac7fa0e9c9e7', 'admin', '2017-05-03 17:06:57', '修改角色菜单权限，角色ID为:68f8e4a39efe47c7bb869e9d15ab925d');
INSERT INTO `sys_fhlog` VALUES ('62fa2d83a5954cb79ee31b2f9e5ccf94', 'admin', '2017-05-02 17:31:02', '退出');
INSERT INTO `sys_fhlog` VALUES ('6398cf99e1684fd9912acd3b54c19efb', 'admin', '2017-05-03 17:21:08', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('63d6bf6f568849428a395ba33f7e701e', 'admin', '2017-05-04 11:04:02', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('640e7ee00f104d04abb294b712707931', 'admin', '2017-05-02 17:39:43', '删除菜单ID70');
INSERT INTO `sys_fhlog` VALUES ('6413b1f23a8f471bb2b66360b6accfb7', 'admin', '2017-05-02 13:05:37', '修改菜单数据库管理');
INSERT INTO `sys_fhlog` VALUES ('64b432d9a6af43dcb68acb471b791dd2', 'admin', '2017-05-08 09:37:18', '修改cha_qx权限，角色ID为:68f8e4a39efe47c7bb869e9d15ab925d');
INSERT INTO `sys_fhlog` VALUES ('65909aaf7ce54102ab445573d3cfcb29', 'admin', '2017-05-02 12:09:45', '导出用户信息到EXCEL');
INSERT INTO `sys_fhlog` VALUES ('6618c5c3052c4523ba64828451148df7', 'admin', '2017-05-02 12:52:39', '退出');
INSERT INTO `sys_fhlog` VALUES ('66e3c967c1b448ca82bd1be0e54ec351', 'admin', '2017-05-02 12:42:38', '删除菜单ID3');
INSERT INTO `sys_fhlog` VALUES ('6764b774f0614bd38f9c143161de9e89', 'a0', '2017-05-02 13:48:56', '退出');
INSERT INTO `sys_fhlog` VALUES ('688295889bc54958af5907a97c4d305b', 'admin', '2017-05-03 17:04:29', '修改菜单销售管理');
INSERT INTO `sys_fhlog` VALUES ('68eb350c291b456da1e48665a17f230c', 'admin', '2017-05-02 13:30:04', '退出');
INSERT INTO `sys_fhlog` VALUES ('693c6e515ec9497c8c6beb5fbfbaa74a', 'admin', '2017-05-03 08:35:01', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('69f357b7f62d4f0ab18a17455426381e', 'a3', '2017-04-29 12:37:28', '退出');
INSERT INTO `sys_fhlog` VALUES ('6a04dd4568874bd082d76b761d538d46', 'a', '2017-05-02 13:11:08', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('6ab33bd72ac0480881e119232f31e80a', 'admin', '2017-05-02 13:07:10', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('6ae1bde1b2354255bdae5b2c8f900be4', 'admin', '2017-05-08 16:12:30', '修改del_qx权限，角色ID为:68f8e4a39efe47c7bb869e9d15ab925d');
INSERT INTO `sys_fhlog` VALUES ('6c77c91dcebc42319c0d8d83ecda1ea1', 'admin', '2017-05-02 12:20:25', '删除按钮权限{guid=1493698825473, BUTTON_ID=3542adfbda73410c976e185ffe50ad06, ROLE_ID=3}');
INSERT INTO `sys_fhlog` VALUES ('6d920075a8aa4effa354b5bd953219f6', 'admin', '2017-04-29 11:06:55', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('6dc93f4b2dd345ddb3666df220283269', 'admin', '2017-05-02 18:16:18', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('6ddbed77ac054bf685be8c174c288cb8', 'a0', '2017-05-02 10:32:39', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('6e353ae82ecc4ab0a0c44ed1ff3f6925', 'admin', '2017-05-02 11:07:50', '修改菜单系统工具');
INSERT INTO `sys_fhlog` VALUES ('6f89702d9fd4479898784b12b981a835', 'admin', '2017-05-03 17:19:52', '删除菜单ID83');
INSERT INTO `sys_fhlog` VALUES ('6fbe5000d13b466e9953c47e4c531e2a', 'admin', '2017-05-02 13:47:55', '退出');
INSERT INTO `sys_fhlog` VALUES ('716688d7585540ff85ef7a44294c49e7', 'a0', '2017-05-03 09:34:44', '新增菜单调拨申请');
INSERT INTO `sys_fhlog` VALUES ('71e2aa5104d34804b3e385bccfcefc1e', 'admin', '2017-05-02 13:12:24', '修改edit_qx权限，角色ID为:3264c8e83d0248bb9e3ea6195b4c0216');
INSERT INTO `sys_fhlog` VALUES ('73a25412d6b1476a83806f6cd2b63b74', 'admin', '2017-05-02 12:39:46', '删除菜单ID7');
INSERT INTO `sys_fhlog` VALUES ('74ba153e34fc416c96047118964bc808', 'admin', '2017-05-01 00:01:44', '修改系统用户：admin');
INSERT INTO `sys_fhlog` VALUES ('77aec19486ba41bd92de953f427f14ab', 'admin', '2017-05-08 16:11:21', '修改edit_qx权限，角色ID为:3264c8e83d0248bb9e3ea6195b4c0216');
INSERT INTO `sys_fhlog` VALUES ('77dee2dd528a41cca8c342209c6f639e', 'a1', '2017-05-02 10:28:25', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('77f161dc884645b283270c4798edcab8', 'admin', '2017-05-02 23:36:48', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('788212b2f65147f7a085e311b639e24b', 'admin', '2017-05-01 00:59:31', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('78e3bf9aadf44894b03fd92f81f3a2cf', 'a2', '2017-04-29 00:04:59', '退出');
INSERT INTO `sys_fhlog` VALUES ('78e8fd9749274459b4312e74eabc608a', 'admin', '2017-05-03 17:18:57', '删除菜单ID88');
INSERT INTO `sys_fhlog` VALUES ('7900b97feade46ecbdbe96daf4c4d8cb', 'admin', '2017-05-02 13:42:27', '退出');
INSERT INTO `sys_fhlog` VALUES ('790836fa9f5049549549c0017dde4af4', 'admin', '2017-05-02 12:45:47', '修改菜单库存管理');
INSERT INTO `sys_fhlog` VALUES ('7932fb667e75422bbff34a40510481ad', 'admin', '2017-05-03 17:05:32', '新增菜单销售记录');
INSERT INTO `sys_fhlog` VALUES ('7947d43e671044fdafa7608c3f5b83d7', 'admin', '2017-05-02 13:22:03', '修改add_qx权限，角色ID为:68f8e4a39efe47c7bb869e9d15ab925d');
INSERT INTO `sys_fhlog` VALUES ('7a0de46fdab24f07a25b562a95dab039', 'admin', '2017-05-02 10:58:51', '修改菜单库存管理');
INSERT INTO `sys_fhlog` VALUES ('7a0f6c15b632407e92833a428af75534', 'admin', '2017-04-29 09:16:04', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('7a1360fb431e42eeab818be50a7716c2', 'admin', '2017-04-29 09:10:24', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('7a874652812444e99dabe8867f66a6b7', 'a0', '2017-05-03 09:28:25', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('7b595eb982794c9da3fecfeacabf417c', 'admin', '2017-05-02 12:52:33', '修改角色菜单权限，角色ID为:1');
INSERT INTO `sys_fhlog` VALUES ('7bdd551b4167417ea1eaea2095069264', 'admin', '2017-05-02 11:07:04', '修改菜单系统管理');
INSERT INTO `sys_fhlog` VALUES ('7d782194f1bb42c5abfae4f15c61665d', 'admin', '2017-05-03 17:19:56', '删除菜单ID82');
INSERT INTO `sys_fhlog` VALUES ('7df33c94025b44f7901c68b4ff8af7e7', 'admin', '2017-05-03 17:05:09', '新增菜单销售订单信息维护');
INSERT INTO `sys_fhlog` VALUES ('7e46a23c41354d509ee7f45550819b2e', 'admin', '2017-05-02 17:41:44', '修改菜单客户管理');
INSERT INTO `sys_fhlog` VALUES ('7f51a7b7fb744cde90a6aec3f970ef3d', 'a', '2017-05-02 13:16:07', '退出');
INSERT INTO `sys_fhlog` VALUES ('7f6c6ad02bdf4df6b4bfc5db33dc0470', 'admin', '2017-05-08 16:12:19', '修改edit_qx权限，角色ID为:68f8e4a39efe47c7bb869e9d15ab925d');
INSERT INTO `sys_fhlog` VALUES ('7fea401721fc4b889ffe3b8273eda14f', 'a1', '2017-05-04 14:47:36', '退出');
INSERT INTO `sys_fhlog` VALUES ('802fe406ce1845d886c386460fa3fb23', 'admin', '2017-04-28 23:46:05', '修改菜单客户管理');
INSERT INTO `sys_fhlog` VALUES ('8117a3172b724f548cdd773480ca162e', 'a1', '2017-05-02 10:55:33', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('819f9b8ff21d4637af337a9e86a99079', 'admin', '2017-05-02 13:09:21', '修改角色菜单权限，角色ID为:3264c8e83d0248bb9e3ea6195b4c0216');
INSERT INTO `sys_fhlog` VALUES ('822b3e4255324a7a9f5db0eea931a25b', 'a', '2017-05-02 13:14:22', '新增角色:总公司1');
INSERT INTO `sys_fhlog` VALUES ('83c9834149614289bd59bf51db24f608', 'admin', '2017-05-03 09:08:30', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('84a0c3b0799146bebd301b29d73d13fb', 'admin', '2017-05-04 10:48:25', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('84a3ee8d74024c0199c58296e82a794e', 'admin', '2017-05-02 10:34:00', '修改角色菜单权限，角色ID为:1');
INSERT INTO `sys_fhlog` VALUES ('85595d394a8b4dfb8f1117d7fb6cb571', 'a1', '2017-05-02 10:29:17', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('857439550dc04aa3a6e12d7cadadf580', 'a0', '2017-05-03 09:35:46', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('85aaefcbc6cc446f8f1b50baf1746d58', 'admin', '2017-04-29 10:05:48', '退出');
INSERT INTO `sys_fhlog` VALUES ('85d5e0182d85461a852185a4c2da3421', 'admin1', '2017-05-01 12:57:49', '登录系统密码或用户名错误');
INSERT INTO `sys_fhlog` VALUES ('85e600c7c8734fd185b222b33b49fa14', 'admin', '2017-05-02 13:05:20', '修改菜单数据备份');
INSERT INTO `sys_fhlog` VALUES ('86065365ad624a668380bbebd5a05cdb', 'a0', '2017-05-02 10:29:50', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('86111adb2b0b43e0b59ded0f6ab7e15d', 'admin', '2017-05-02 18:08:59', '修改菜单商品管理');
INSERT INTO `sys_fhlog` VALUES ('86244f6977ad40c2a66e2b42f1a21c1f', 'admin', '2017-05-02 10:51:23', '退出');
INSERT INTO `sys_fhlog` VALUES ('862920b297c642db8d7f74c9b7695191', 'admin', '2017-05-03 17:17:00', '修改菜单统计分析');
INSERT INTO `sys_fhlog` VALUES ('86ad3f4dd89f4a67893a66276cbb9eac', 'admin', '2017-05-03 17:20:25', '修改菜单销售管理');
INSERT INTO `sys_fhlog` VALUES ('86fda318390e4156b95ce0b395d4291e', 'admin', '2017-05-02 10:32:14', '退出');
INSERT INTO `sys_fhlog` VALUES ('874ca9a4c5684a9aa3e78cc4c5133178', 'admin', '2017-05-02 17:34:02', '新增菜单采购管理');
INSERT INTO `sys_fhlog` VALUES ('88a4312a688f4495a701f8fe0f7c166a', 'admin', '2017-04-28 23:34:37', '修改菜单客户管理');
INSERT INTO `sys_fhlog` VALUES ('89281397a2c041bf83a9566568f05252', 'admin', '2017-05-02 13:11:50', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('89b779c3212d41449ec113dfa841d873', 'a1', '2017-03-06 00:45:20', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('8b1c7d9208944e4fbf49e5f37b0d5e0f', 'admin', '2017-05-01 13:01:33', '退出');
INSERT INTO `sys_fhlog` VALUES ('8c436f00c43d4b1cbc80ec0f14f8fed3', 'a1', '2017-04-29 12:29:14', '退出');
INSERT INTO `sys_fhlog` VALUES ('8c453c3e3762452bb4e42f7ffd9250df', 'admin', '2017-05-02 10:28:13', '修改add_qx权限，角色ID为:68f8e4a39efe47c7bb869e9d15ab925d');
INSERT INTO `sys_fhlog` VALUES ('8c7ff74ea2474c6bbd901f1e085d478d', 'a0', '2017-05-09 00:25:08', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('8e5ee00b6d0b4c19a16154aca7ab9ad8', 'admin', '2017-05-01 11:23:57', '修改cha_qx权限，角色ID为:3264c8e83d0248bb9e3ea6195b4c0216');
INSERT INTO `sys_fhlog` VALUES ('8e970ff9d35b4b80a5a225007a68c4f8', 'admin', '2017-05-02 17:39:53', '删除菜单ID72');
INSERT INTO `sys_fhlog` VALUES ('8f2dc74eccd542b3884a802fbf61ec48', 'a1', '2017-05-02 10:29:38', '退出');
INSERT INTO `sys_fhlog` VALUES ('8f86144fd6944529b594bfbad0661342', 'admin', '2017-05-08 16:10:35', '修改角色菜单权限，角色ID为:68f8e4a39efe47c7bb869e9d15ab925d');
INSERT INTO `sys_fhlog` VALUES ('8f8968e6a837412b93835cd36fcb8d14', 'admin', '2017-05-02 13:42:24', '修改菜单权限管理');
INSERT INTO `sys_fhlog` VALUES ('90747d5a7a4943f2b6d2ce06b116f4d3', 'admin', '2017-05-02 13:31:37', '修改系统用户：a');
INSERT INTO `sys_fhlog` VALUES ('9137877dcb0847fe9fb9a52fa7cf78f7', 'admin', '2017-05-02 11:11:13', '新增菜单销售管理');
INSERT INTO `sys_fhlog` VALUES ('92083c685c924e8699c9be055e271506', 'admin', '2017-05-03 17:07:24', '修改角色菜单权限，角色ID为:1');
INSERT INTO `sys_fhlog` VALUES ('92768845558b4b8e938bbcaddbd18e73', 'admin', '2017-05-03 17:16:30', '修改菜单用户管理');
INSERT INTO `sys_fhlog` VALUES ('936279fa9fd14633b29507c12291a1d5', 'a3', '2017-04-29 12:35:21', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('9409fd555b0843799b4f882d78d1e0e2', 'admin', '2017-05-02 12:58:03', '修改角色菜单权限，角色ID为:3264c8e83d0248bb9e3ea6195b4c0216');
INSERT INTO `sys_fhlog` VALUES ('9442958fc46746f7b953df93fafb974d', 'a1', '2017-04-29 12:25:50', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('94b8b41ab72144e7a78ee24fd05923f2', 'a1', '2017-05-01 13:01:44', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('96b533392d2a4c309f89ecb889d10312', 'a1', '2017-05-02 10:32:30', '退出');
INSERT INTO `sys_fhlog` VALUES ('97abefe2472542de9b051b94c017b23b', 'admin', '2017-05-08 09:36:53', '修改cha_qx权限，角色ID为:3264c8e83d0248bb9e3ea6195b4c0216');
INSERT INTO `sys_fhlog` VALUES ('980996cb3a73434f8a9812478afc9d52', 'admin', '2017-05-01 09:49:46', '退出');
INSERT INTO `sys_fhlog` VALUES ('98b16b7107d14324a55ad73a292991bd', 'admin', '2017-05-04 14:44:51', '退出');
INSERT INTO `sys_fhlog` VALUES ('98b51c1a81f44430b2466ddf75ece1d6', 'a1', '2017-04-29 09:21:39', '退出');
INSERT INTO `sys_fhlog` VALUES ('98d6bd1a8c324df9895dce91ccc9253b', 'admin', '2017-05-02 12:51:52', '修改菜单库存管理');
INSERT INTO `sys_fhlog` VALUES ('998868ad0a534235af1cae59b42e188b', 'admin', '2017-05-08 16:09:10', '修改菜单系统用户');
INSERT INTO `sys_fhlog` VALUES ('99dd610e9fef439a88d560d0c4ce3338', 'admin', '2017-05-02 17:26:33', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('99fd9ad7e8f3480ca6e0808ee28052bc', 'a0', '2017-05-02 10:59:14', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('9a2159c66cb44d33b9f848026cf276ba', 'a0', '2017-03-05 22:15:08', '退出');
INSERT INTO `sys_fhlog` VALUES ('9a38c5742f2d483e8d1acc797ca0a18c', 'admin', '2017-05-01 09:55:56', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('9ad0219f97ee4ec5a28df85b28bfe98b', 'admin', '2017-05-02 13:25:01', '修改菜单用户管理');
INSERT INTO `sys_fhlog` VALUES ('9ae049da311d49489dce52f3f0f9f9ba', 'admin', '2017-05-02 10:57:48', '修改cha_qx权限，角色ID为:3');
INSERT INTO `sys_fhlog` VALUES ('9b6e4148d430480c975dae9bb2dc7dc7', 'admin', '2017-05-02 12:41:28', '删除菜单ID20');
INSERT INTO `sys_fhlog` VALUES ('9ba972de069b4e04a26ff21132b1589e', 'a', '2017-05-02 13:13:04', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('9c035bf5c4b84954a53fc8c29bfa0544', 'admin', '2017-05-02 13:03:25', '退出');
INSERT INTO `sys_fhlog` VALUES ('9c36a1f1549e491189f5193e9dcc41f8', 'admin', '2017-03-05 22:14:53', '退出');
INSERT INTO `sys_fhlog` VALUES ('9cdbaa378e694b56acaebecaeb99d363', 'admin', '2017-05-02 13:30:01', '修改菜单公司管理');
INSERT INTO `sys_fhlog` VALUES ('9ea7970a45ed4ebf89a476e045cbf03f', 'admin', '2017-03-06 01:18:57', '退出');
INSERT INTO `sys_fhlog` VALUES ('9ef08432358644ff888ebee71d7e13cc', 'admin', '2017-05-02 13:03:39', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('9fede3bfcfe04fa1a2b0e6a1a750c223', 'admin', '2017-05-01 01:05:38', '退出');
INSERT INTO `sys_fhlog` VALUES ('a041287536774264b116b9d2a4b67703', 'admin', '2017-05-02 13:03:20', '修改角色菜单权限，角色ID为:1');
INSERT INTO `sys_fhlog` VALUES ('a07d90849a6d435c84231ead8ab5078c', 'admin', '2017-05-02 13:10:49', '新增系统用户：a');
INSERT INTO `sys_fhlog` VALUES ('a0f26f8fdcd848fa8289a826f5e8c2a0', 'admin', '2017-04-29 00:11:39', '退出');
INSERT INTO `sys_fhlog` VALUES ('a1305df0dc4841949dfc7d43fa054f5a', 'admin', '2017-05-02 13:20:40', '批量删除user');
INSERT INTO `sys_fhlog` VALUES ('a1767a2f16bb4afc984091dad4edef7e', 'admin', '2017-05-02 10:32:08', '修改角色菜单权限，角色ID为:3264c8e83d0248bb9e3ea6195b4c0216');
INSERT INTO `sys_fhlog` VALUES ('a18b49edfaf943cd879cbbc57ab7020d', 'admin', '2017-05-04 12:59:29', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('a1c826ed999f411b9f4c27b102d7dc64', 'admin', '2017-04-29 09:19:22', '退出');
INSERT INTO `sys_fhlog` VALUES ('a1fc2c1a39b44f8ea3eb71cd88a7340f', 'admin', '2017-05-02 10:51:12', '修改角色菜单权限，角色ID为:3264c8e83d0248bb9e3ea6195b4c0216');
INSERT INTO `sys_fhlog` VALUES ('a2a09f3c449447c39f3f34072668223a', 'admin', '2017-05-02 11:05:34', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('a2c6470187474e5db9b2f2aed8aca07a', 'a0', '2017-05-02 10:55:23', '退出');
INSERT INTO `sys_fhlog` VALUES ('a2f1dd07cb8b43198f568488d615569b', 'a1', '2017-05-02 10:52:06', '退出');
INSERT INTO `sys_fhlog` VALUES ('a38b2a303146471088b02e4d9f8685cb', 'admin', '2017-05-02 12:38:29', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('a457136d420e4ef98cfa928fb9b6e0ad', 'admin', '2017-05-02 17:34:49', '新增菜单原料采购');
INSERT INTO `sys_fhlog` VALUES ('a46462d35dd34088bb7277430d8119a7', 'admin', '2017-05-01 11:29:53', '退出');
INSERT INTO `sys_fhlog` VALUES ('a4dbbba624bf4763968f7bf102912b06', 'a0', '2017-05-02 13:00:14', '退出');
INSERT INTO `sys_fhlog` VALUES ('a548c87f51264dde8ee63fb9cd381d2b', 'admin', '2017-05-08 16:12:55', '退出');
INSERT INTO `sys_fhlog` VALUES ('a57226a3e3824d729ac54002936745f7', 'admin', '2017-05-08 09:37:22', '退出');
INSERT INTO `sys_fhlog` VALUES ('a63d1214edbc4be0821b61eaddc7745f', 'admin', '2017-05-02 13:21:36', '删除角色ID为:3');
INSERT INTO `sys_fhlog` VALUES ('a6a8c977a82845af96899f9bbad787af', 'admin', '2017-05-02 13:33:49', '删除系统用户：{tm=1493703229571, USER_ID=44f24fc37f7f4566b843a24383817204}');
INSERT INTO `sys_fhlog` VALUES ('a6ecb505fd664c2e9830a2128a3e513b', 'admin', '2017-04-28 23:45:10', '修改菜单客户管理');
INSERT INTO `sys_fhlog` VALUES ('a71f61df5fdb43e6ba44574c33706d28', 'admin', '2017-05-02 10:54:22', '修改角色菜单权限，角色ID为:3264c8e83d0248bb9e3ea6195b4c0216');
INSERT INTO `sys_fhlog` VALUES ('a71fc4d03850403b91f1e43c9251b25f', 'admin', '2017-05-02 10:58:55', '修改菜单库存管理');
INSERT INTO `sys_fhlog` VALUES ('a78a7f7c008b41fc8eeb8fcb7b72f8da', 'admin', '2017-05-03 17:36:23', '删除角色ID为:8d59e5b5fc474343958bd4ccc91a351c');
INSERT INTO `sys_fhlog` VALUES ('a84a6f3e636a41c49e892734af23d015', 'a0', '2017-05-03 09:46:13', '退出');
INSERT INTO `sys_fhlog` VALUES ('a857e8398f204342bbdb55d5c2ec7b24', 'admin', '2017-04-29 09:21:51', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('a8da0d4e912041a68d46d7c4b7a1e02e', 'a1', '2017-05-04 13:00:35', '退出');
INSERT INTO `sys_fhlog` VALUES ('aa05ef2689ee4256903a72f4dbd94da6', 'admin', '2017-05-02 13:19:02', '修改cha_qx权限，角色ID为:3');
INSERT INTO `sys_fhlog` VALUES ('aa8b578259c34912879c8f06302ac003', 'a1', '2017-05-02 13:02:04', '退出');
INSERT INTO `sys_fhlog` VALUES ('ac0a6db130a94597a2854f43a2f66d56', 'a1', '2017-05-02 12:47:51', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('ac2699d4cb3148dca1187e91dbd18ecb', 'admin', '2017-05-02 10:32:12', '修改角色菜单权限，角色ID为:68f8e4a39efe47c7bb869e9d15ab925d');
INSERT INTO `sys_fhlog` VALUES ('ac52a67748394ef69bd10f41829ccb47', 'admin', '2017-05-02 11:14:11', '修改角色菜单权限，角色ID为:68f8e4a39efe47c7bb869e9d15ab925d');
INSERT INTO `sys_fhlog` VALUES ('acb27a373c9e43a5a467ea3f486b239a', 'admin', '2017-05-03 10:15:09', '退出');
INSERT INTO `sys_fhlog` VALUES ('acea9b40104041b7a24695aa1c4e860e', 'a', '2017-05-02 13:15:10', '修改角色:分公司');
INSERT INTO `sys_fhlog` VALUES ('ad2ba067c94e41f4ae4970002827c2fe', 'a1', '2017-04-29 10:55:41', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('ad2f34f28ad4410b9e9e9531ec7ea195', 'admin', '2017-05-05 16:48:09', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('ae03678c863f4cffa31c968d5f4aab83', 'admin', '2017-05-02 13:44:40', '修改角色菜单权限，角色ID为:68f8e4a39efe47c7bb869e9d15ab925d');
INSERT INTO `sys_fhlog` VALUES ('ae4288b228bd4a31868033a27e51509b', 'admin', '2017-05-02 10:57:27', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('ae8a0acc480d4f3a92c8d7705c20350a', 'admin', '2017-05-01 13:56:32', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('ae8d69154d2d4a48b10bb5e086e442ba', 'admin', '2017-05-03 17:07:14', '修改角色菜单权限，角色ID为:68f8e4a39efe47c7bb869e9d15ab925d');
INSERT INTO `sys_fhlog` VALUES ('af495282189b4dab84529252cfa32805', 'a0', '2017-05-02 13:35:01', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('af4953fdfef74ff7a8e1d69b6d9ca4c6', 'admin', '2017-05-02 13:34:32', '新增系统用户：a0');
INSERT INTO `sys_fhlog` VALUES ('b028ce06749744ab90161e3c4146a161', 'a0', '2017-05-03 09:36:15', '修改角色菜单权限，角色ID为:3264c8e83d0248bb9e3ea6195b4c0216');
INSERT INTO `sys_fhlog` VALUES ('b08c6a188a534e16b23a78d0f37af677', 'admin1', '2017-04-29 11:08:54', '登录系统密码或用户名错误');
INSERT INTO `sys_fhlog` VALUES ('b12338ff38b949cca5e59021bc62fd0d', 'admin', '2017-05-02 14:43:15', '退出');
INSERT INTO `sys_fhlog` VALUES ('b191c65fb08c435f859514857f72bc66', 'a1', '2017-05-01 11:30:03', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('b19930cf9834449a9a7ab93058b407ba', 'admin', '2017-05-02 10:50:02', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('b342a737d2a84885abd24f71582caef9', 'admin', '2017-05-02 10:54:41', '修改角色菜单权限，角色ID为:68f8e4a39efe47c7bb869e9d15ab925d');
INSERT INTO `sys_fhlog` VALUES ('b3633e9023a0414894735aee3abde232', 'a1', '2017-05-02 14:53:24', '退出');
INSERT INTO `sys_fhlog` VALUES ('b4ac9d79555c4139896e7f46e7f15efc', 'a0', '2017-05-02 13:36:40', '退出');
INSERT INTO `sys_fhlog` VALUES ('b5252124310f4053aa79b005e16ebcd4', 'admin', '2017-05-02 11:08:11', '修改菜单数据库管理');
INSERT INTO `sys_fhlog` VALUES ('b53315e4b9d546b299a43ef37c51709f', 'admin', '2017-05-02 18:07:59', '修改菜单客户管理');
INSERT INTO `sys_fhlog` VALUES ('b554405550e1446b9ed2173d8c19910a', 'admin', '2017-05-02 12:42:57', '退出');
INSERT INTO `sys_fhlog` VALUES ('b717a9e5bd5f4d9e93a18db59030f488', 'admin', '2017-05-02 18:08:22', '删除菜单ID84');
INSERT INTO `sys_fhlog` VALUES ('b7e5e55c19494c51845b91854c0aa9ec', 'admin', '2017-05-02 13:22:12', '修改edit_qx权限，角色ID为:68f8e4a39efe47c7bb869e9d15ab925d');
INSERT INTO `sys_fhlog` VALUES ('b85e3ff4971e43beb5cb28262b40b522', 'admin', '2017-05-02 13:02:21', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('b899ead585fe4ed7b7fe8e9c2867cab8', 'admin', '2017-05-02 18:12:43', '修改角色菜单权限，角色ID为:1');
INSERT INTO `sys_fhlog` VALUES ('b89b4058832a48b1acc106dd5d0325e8', 'admin', '2017-05-02 18:13:00', '退出');
INSERT INTO `sys_fhlog` VALUES ('b923c49559614a4a93aaeeeaf670e42f', 'admin', '2017-04-30 23:09:08', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('b9e062ec0e7f4c7aa5d5e5f1e170b199', 'admin', '2017-05-02 14:38:54', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('bbecf78f037f406aa21aae25056fcc00', 'admin', '2017-05-02 12:47:07', '删除菜单ID85');
INSERT INTO `sys_fhlog` VALUES ('bc507bf816874e8c905718a89d093f80', 'admin', '2017-05-02 10:26:50', '退出');
INSERT INTO `sys_fhlog` VALUES ('bc51c7e47fb84a9c92bbedf9499d2c1f', 'admin', '2017-05-02 11:10:01', '修改菜单商品管理');
INSERT INTO `sys_fhlog` VALUES ('bc9e81c800db4575974226fa2d40ab22', 'admin', '2017-05-03 17:32:22', '新增角色:注册用户');
INSERT INTO `sys_fhlog` VALUES ('bd32b0123dd848c8a2514251d92eb092', 'admin', '2017-05-01 12:58:02', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('be0269f6b4e4438baba4fd76595ab272', 'a0', '2017-04-28 23:55:58', '退出');
INSERT INTO `sys_fhlog` VALUES ('be8a09f35e774625bf5114176bb6de86', 'admin', '2017-05-02 18:11:54', '新增菜单销售分析');
INSERT INTO `sys_fhlog` VALUES ('bea25afabfb34a07861f56c9cb621d6c', 'admin', '2017-05-03 10:10:16', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('bf3df78c645f4f5eaa4b6d550d10d380', 'admin', '2017-05-08 09:34:34', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('bfc91d1a645a4120b74ca6c7aa00e9c1', 'admin', '2017-05-03 17:06:06', '新增菜单客户管理');
INSERT INTO `sys_fhlog` VALUES ('c049c093cd344d20a72feb51474d0795', 'admin', '2017-05-02 10:51:18', '修改角色菜单权限，角色ID为:68f8e4a39efe47c7bb869e9d15ab925d');
INSERT INTO `sys_fhlog` VALUES ('c17fb52dd07e4fa29a30e06663b910b6', 'a0', '2017-05-04 13:00:07', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('c18e5503365040b9ba58e90e5da0b136', 'a1', '2017-05-02 11:05:22', '退出');
INSERT INTO `sys_fhlog` VALUES ('c31ce98331a84af9b61c172665ffd30c', 'admin', '2017-05-03 01:06:00', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('c3b5326b1abf439fab9136fe13ee69b9', 'admin', '2017-05-02 13:12:31', '修改cha_qx权限，角色ID为:3264c8e83d0248bb9e3ea6195b4c0216');
INSERT INTO `sys_fhlog` VALUES ('c416b7ad35e9432aaf59eaed229eddf5', 'admin', '2017-04-29 11:04:11', '退出');
INSERT INTO `sys_fhlog` VALUES ('c4300209a86843abbcf782bc42cfc44b', 'admin', '2017-05-04 11:03:36', '退出');
INSERT INTO `sys_fhlog` VALUES ('c4b15de79d724ab5a8fcd62ec6b45c60', 'a1', '2017-05-02 10:48:15', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('c51b7ce15202406388374ac0e86f8082', 'admin', '2017-05-02 13:27:29', '修改系统用户：a2');
INSERT INTO `sys_fhlog` VALUES ('c54ca0e2d6ba402b881e23601dc8bde6', 'admin', '2017-05-02 18:12:49', '修改角色菜单权限，角色ID为:3264c8e83d0248bb9e3ea6195b4c0216');
INSERT INTO `sys_fhlog` VALUES ('c57478a03f7a460f9eb087c088c10eaa', 'a1', '2017-05-02 18:15:22', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('c597cea68aca41e4b508a4357181510a', 'admin', '2017-05-04 10:49:42', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('c5b8efc976e042f4a182ecc0738fde38', 'admin', '2017-05-02 15:13:27', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('c5ca8f9cda434ea98a2a264404a4f80c', 'a1', '2017-05-02 18:16:09', '退出');
INSERT INTO `sys_fhlog` VALUES ('c6074bab0e9b49c89a145d4e44647452', 'admin', '2017-05-01 11:20:48', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('c625c4ae93504a6384835db7619a18b9', 'admin', '2017-05-02 12:51:33', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('c698f93be4c34eaea127650d496c4183', 'admin', '2017-05-02 13:03:02', '修改菜单系统管理');
INSERT INTO `sys_fhlog` VALUES ('c7602f76022e482a98bd3424af2be1b9', 'admin', '2017-05-08 09:36:16', '修改edit_qx权限，角色ID为:3264c8e83d0248bb9e3ea6195b4c0216');
INSERT INTO `sys_fhlog` VALUES ('c78460c9c9854fd8a65dc326bae0ba39', 'admin', '2017-05-02 13:12:17', '修改del_qx权限，角色ID为:3264c8e83d0248bb9e3ea6195b4c0216');
INSERT INTO `sys_fhlog` VALUES ('c83b3d78a92445dc9d7e5cc737820a54', 'a1', '2017-03-06 00:03:57', '退出');
INSERT INTO `sys_fhlog` VALUES ('ca1423dd2a344ca2b72422e33ce17165', 'admin', '2017-05-04 14:40:22', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('ca27a66859354fb7aff7f031b680310b', 'admin', '2017-05-01 01:29:49', '退出');
INSERT INTO `sys_fhlog` VALUES ('ca920b6a5df14ed18b0446b78af1a3f9', 'admin', '2017-05-02 11:09:40', '修改菜单信息管理');
INSERT INTO `sys_fhlog` VALUES ('ca9c5fd6e77847e9964c9243da590be8', 'admin', '2017-05-01 13:02:22', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('cb85425482a74647a8481286250458e4', 'admin', '2017-04-29 09:11:09', '退出');
INSERT INTO `sys_fhlog` VALUES ('cb8da39cab044b5e941d29fd7b0c5586', 'admin', '2017-05-03 17:20:06', '修改菜单调拨申请');
INSERT INTO `sys_fhlog` VALUES ('cc78feb87d6e4d16a40cc6de35f0c935', 'a0', '2017-05-03 09:36:19', '退出');
INSERT INTO `sys_fhlog` VALUES ('cd3c4d3bc4864fec8c65ff6a5dc70dd7', 'admin', '2017-05-04 23:00:23', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('cd9677f350cf441ea3c6572407aecce8', 'admin', '2017-05-02 11:12:56', '修改菜单销售管理');
INSERT INTO `sys_fhlog` VALUES ('cda19a3d62544793ba8a1858dfca681b', 'admin', '2017-05-02 12:46:08', '退出');
INSERT INTO `sys_fhlog` VALUES ('cddda6b3f7e644f9973e93941fc51a01', 'admin', '2017-05-02 12:37:58', '修改菜单数据库管理');
INSERT INTO `sys_fhlog` VALUES ('ce07388367ec482bb8be1fcc1eadcaaa', 'admin', '2017-04-29 11:10:30', '退出');
INSERT INTO `sys_fhlog` VALUES ('cec41fd3423146579a590698398128c2', 'admin', '2017-05-02 13:32:42', '新增系统用户：a3');
INSERT INTO `sys_fhlog` VALUES ('cec6b48365b54d95830a8d43befa4ea5', 'admin', '2017-05-01 09:48:21', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('cf1f085041144b22ac76c790ffdb1f03', 'a1', '2017-03-06 01:09:10', '退出');
INSERT INTO `sys_fhlog` VALUES ('cf3bf262cdd1430986cc133d8835f41c', 'admin', '2017-05-02 13:16:23', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('d094d358634e4a11a15aac800f2b270e', 'a0', '2017-05-02 10:52:29', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('d09f1b36fd2f4dccab90a93c292c8881', 'admin', '2017-05-08 16:12:39', '修改add_qx权限，角色ID为:68f8e4a39efe47c7bb869e9d15ab925d');
INSERT INTO `sys_fhlog` VALUES ('d0e1a9d64ae84c22af492ebe75f4b30e', 'admin', '2017-05-02 23:44:56', '退出');
INSERT INTO `sys_fhlog` VALUES ('d0f78e77d52e4ee8b494ab592a856587', 'admin', '2017-05-02 13:42:17', '删除菜单ID36');
INSERT INTO `sys_fhlog` VALUES ('d2ad2a96da804229944404e45ee839f9', 'admin', '2017-05-03 17:19:25', '修改菜单商品列表');
INSERT INTO `sys_fhlog` VALUES ('d30e4c25958e49da96c88c260a278ddc', 'admin', '2017-05-02 18:07:52', '新增菜单客户管理');
INSERT INTO `sys_fhlog` VALUES ('d3cbefe3586f452daf28b7dfb8dae75e', 'admin', '2017-05-08 16:11:55', '修改cha_qx权限，角色ID为:68f8e4a39efe47c7bb869e9d15ab925d');
INSERT INTO `sys_fhlog` VALUES ('d3f7cbcb51a845a9af916a45d9682d4a', 'admin', '2017-05-02 11:13:33', '修改角色菜单权限，角色ID为:1');
INSERT INTO `sys_fhlog` VALUES ('d53383388fdd4072b1136c12c0d0c76f', 'admin', '2017-05-03 17:07:45', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('d56607be52614b329cae686a6728ddf5', 'admin', '2017-05-02 15:02:32', '删除菜单ID54');
INSERT INTO `sys_fhlog` VALUES ('d5d5b18de4df4c038149f111596fca59', 'admin', '2017-05-02 14:58:53', '导出用户信息到EXCEL');
INSERT INTO `sys_fhlog` VALUES ('d66c73b0f5814a65b3988baf168fcd7e', 'admin', '2017-05-02 10:54:27', '修改角色菜单权限，角色ID为:3264c8e83d0248bb9e3ea6195b4c0216');
INSERT INTO `sys_fhlog` VALUES ('d6fcc4113fae4e59bab0c295c3d89cbd', 'admin', '2017-04-29 11:03:24', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('d76bfe3952154f678804ac5b528559a9', 'admin1', '2017-05-01 12:57:49', '登录系统密码或用户名错误');
INSERT INTO `sys_fhlog` VALUES ('d791301f609c4d60b90888f6e1164ca8', 'a1', '2017-05-01 13:02:08', '退出');
INSERT INTO `sys_fhlog` VALUES ('d7b1e799b9264cff895ee256267d8000', 'admin', '2017-04-29 11:08:59', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('d81eb0fc92494bbba71ad47dfe3cc363', 'admin', '2017-05-02 13:04:21', '删除菜单ID56');
INSERT INTO `sys_fhlog` VALUES ('d8348eaa11d24dcba90d3157ceea4db2', 'admin', '2017-05-02 10:47:06', '退出');
INSERT INTO `sys_fhlog` VALUES ('d8398a53bc96474b8db8a98aa911582d', 'admin', '2017-05-02 10:53:35', '修改角色菜单权限，角色ID为:1');
INSERT INTO `sys_fhlog` VALUES ('d9abbd8c7ef3464db83745e963cb4f29', 'admin', '2017-05-02 12:40:05', '删除菜单ID6');
INSERT INTO `sys_fhlog` VALUES ('da0c2b9e241d4a15abd42aae23ec9ca8', 'admin', '2017-05-08 16:10:52', '修改add_qx权限，角色ID为:3264c8e83d0248bb9e3ea6195b4c0216');
INSERT INTO `sys_fhlog` VALUES ('da9b4eb867764c2f8f21dd92e54111db', 'admin', '2017-05-02 13:12:00', '修改角色菜单权限，角色ID为:3264c8e83d0248bb9e3ea6195b4c0216');
INSERT INTO `sys_fhlog` VALUES ('dc0038196604478ebe7d16782a6f39a8', 'a1', '2017-05-02 11:15:24', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('dc0277dd87e344de8f1b7919dd0fbddc', 'admin', '2017-05-02 17:38:44', '修改菜单客户管理');
INSERT INTO `sys_fhlog` VALUES ('dc8fa8d01deb466ba6431690fd2cd3e9', 'a2', '2017-05-02 13:49:13', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('dcc9dfa52e7545d5b463850c9b4c5f50', 'admin', '2017-05-02 10:57:57', '修改角色菜单权限，角色ID为:3264c8e83d0248bb9e3ea6195b4c0216');
INSERT INTO `sys_fhlog` VALUES ('dcdfa254efb542b18bf8e27a335c2c6f', 'admin', '2017-05-02 14:42:15', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('dd441698394446bda4f529e5d58cf441', 'admin', '2017-05-03 17:18:53', '修改菜单商品库存');
INSERT INTO `sys_fhlog` VALUES ('dde5e49302204f79ab2ba8e0aa61b593', 'admin', '2017-05-02 13:17:16', '修改角色:下部');
INSERT INTO `sys_fhlog` VALUES ('de45e448d19e44748ed3a647e090752b', 'admin', '2017-05-03 09:06:25', '退出');
INSERT INTO `sys_fhlog` VALUES ('de7edf2085d34575bbc45f959b305781', 'admin', '2017-05-02 11:14:25', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('dfb40589c08249358af41b095fd1d854', 'a1', '2017-05-01 11:35:12', '退出');
INSERT INTO `sys_fhlog` VALUES ('dfe87d6e9bf44b3cb01b0e4561235be0', 'a1', '2017-05-02 13:00:29', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('e01361d205b74d62bc6d13bc28ca8005', 'admin', '2017-05-02 10:54:11', '修改角色菜单权限，角色ID为:3');
INSERT INTO `sys_fhlog` VALUES ('e0274ec030ef4c42b5fd2a432b298a76', 'admin', '2017-05-02 17:39:08', '修改菜单销售管理');
INSERT INTO `sys_fhlog` VALUES ('e0cbadae151643ddb0bfba1491846c80', 'admin', '2017-05-03 14:41:27', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('e263da44fee24e8f9523c5795848ac7d', 'admin', '2017-05-01 00:53:53', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('e383a751714743d1b54251f7bc1c16d7', 'admin', '2017-05-01 15:29:23', '退出');
INSERT INTO `sys_fhlog` VALUES ('e4824c8c854f4e6793637cc64a3f151c', 'admin', '2017-05-02 10:30:19', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('e483c0c2cbc8478aac13b069dcbfb55c', 'a0', '2017-05-04 13:00:11', '退出');
INSERT INTO `sys_fhlog` VALUES ('e49f7308244f465193d029ca2c2c79f7', 'a1', '2017-04-29 10:59:36', '退出');
INSERT INTO `sys_fhlog` VALUES ('e4e561e9767c4081830d6cb03e00990a', 'admin', '2017-03-06 00:06:01', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('e5e82a69b49345bc9a7f629d04a9dff7', 'admin', '2017-05-02 18:14:44', '退出');
INSERT INTO `sys_fhlog` VALUES ('e5e89f61fb7f4284b81332aa5aad2c8e', 'admin', '2017-05-02 12:46:38', '修改菜单库存管理');
INSERT INTO `sys_fhlog` VALUES ('e604be4fa1424ffa9a605169ac8337bb', 'admin', '2017-05-02 10:34:16', '退出');
INSERT INTO `sys_fhlog` VALUES ('e673b05087f74435bf06c44f763d0e2e', 'admin', '2017-05-08 16:10:24', '修改角色菜单权限，角色ID为:3264c8e83d0248bb9e3ea6195b4c0216');
INSERT INTO `sys_fhlog` VALUES ('e67b5feb0c48439ab98fc89c3f0b9f03', 'a1', '2017-05-02 10:27:29', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('e721fca611e143dbbcc82f8f43715c01', 'a1', '2017-05-04 14:45:00', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('e7ba9dee91e5484cba21c2f78ab02f36', 'admin', '2017-05-02 11:14:00', '修改角色菜单权限，角色ID为:3264c8e83d0248bb9e3ea6195b4c0216');
INSERT INTO `sys_fhlog` VALUES ('e89889c2a8eb4353b377993a81afa303', 'admin', '2017-05-02 12:47:26', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('e9033e801aeb4b3dbfb9986a936f9752', 'admin', '2017-03-06 01:09:16', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('e958e199912b45ea80c46c6c114ed46a', 'admin', '2017-05-02 11:09:54', '修改菜单库存管理');
INSERT INTO `sys_fhlog` VALUES ('e9cf0bf7d43f46738f4b4bf8c3154f2c', 'admin', '2017-05-02 17:28:28', '修改菜单系统管理');
INSERT INTO `sys_fhlog` VALUES ('eaf9cf28487b48c4a4f021c7703ad7b3', 'admin', '2017-05-08 09:35:13', '修改角色菜单权限，角色ID为:3264c8e83d0248bb9e3ea6195b4c0216');
INSERT INTO `sys_fhlog` VALUES ('ebf9b74cc14b45aaa03061d68bff6ad9', 'a0', '2017-05-02 10:47:46', '退出');
INSERT INTO `sys_fhlog` VALUES ('ee883e0fc08244dc828e320460e62f88', 'admin', '2017-05-02 23:45:11', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('ee89510412fa4e3790f2b99535fb5deb', 'admin', '2017-05-02 13:21:53', '修改角色:分公司');
INSERT INTO `sys_fhlog` VALUES ('ef6e6ff6bedb4657b10982f1acd79f42', 'admin', '2017-05-02 13:18:58', '修改edit_qx权限，角色ID为:3');
INSERT INTO `sys_fhlog` VALUES ('ef7353b5783744dfab891cc9ce8b4d3f', 'admin', '2017-05-03 17:17:47', '修改菜单销售分析');
INSERT INTO `sys_fhlog` VALUES ('f04ef519c46440fe930c5de650f3accd', 'a', '2017-05-02 13:14:28', '删除角色ID为:5b84ab0f166842ae9c02842b7f191558');
INSERT INTO `sys_fhlog` VALUES ('f079f9309a80494c9d1c4e8d551cc352', 'admin', '2017-05-02 12:47:13', '退出');
INSERT INTO `sys_fhlog` VALUES ('f0b64e1e1def4a9286707c57f1cc3f41', 'admin', '2017-05-02 13:12:47', '修改角色:总公司');
INSERT INTO `sys_fhlog` VALUES ('f0e6cc59f05941f9b30f2eacab70db34', 'a1', '2017-04-29 10:40:14', '退出');
INSERT INTO `sys_fhlog` VALUES ('f21923b6d4d84c06be62e192007faa72', 'admin', '2017-05-02 12:39:49', '删除菜单ID50');
INSERT INTO `sys_fhlog` VALUES ('f2492859b1d2416fb33b729e5483e596', 'a0', '2017-05-02 10:52:56', '退出');
INSERT INTO `sys_fhlog` VALUES ('f31021483c2742389fc3324fe72ae6f9', 'admin', '2017-05-02 10:54:35', '修改角色菜单权限，角色ID为:68f8e4a39efe47c7bb869e9d15ab925d');
INSERT INTO `sys_fhlog` VALUES ('f3cd2b05498c44198a9ed40a34309abd', 'admin', '2017-05-02 12:40:57', '删除菜单ID9');
INSERT INTO `sys_fhlog` VALUES ('f5100c786e8044958a0ba8b71faafd54', 'admin', '2017-05-02 10:53:54', '修改角色菜单权限，角色ID为:1');
INSERT INTO `sys_fhlog` VALUES ('f55e426a34404c5dbe134898cad11613', 'admin', '2017-05-02 18:08:19', '删除菜单ID87');
INSERT INTO `sys_fhlog` VALUES ('f5e469798fde442fbdf36421269159b5', 'admin', '2017-05-02 11:11:20', '修改菜单销售管理');
INSERT INTO `sys_fhlog` VALUES ('f5f34d93b013410eb2ef8e75b379bbe7', 'admin', '2017-05-02 12:41:32', '删除菜单ID43');
INSERT INTO `sys_fhlog` VALUES ('f605d322b41c428a9c9bb104ad7908db', 'a1', '2017-05-02 10:49:53', '退出');
INSERT INTO `sys_fhlog` VALUES ('f60d8cca498e4f5e8f715a1c1bcae3a5', 'admin', '2017-05-02 12:07:38', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('f641fc59cbc940d4beebb4f6b550fef0', 'admin', '2017-05-08 11:14:44', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('f677a87880ec49f8aeabe047658c3c66', 'admin', '2017-05-02 13:20:19', '批量删除user');
INSERT INTO `sys_fhlog` VALUES ('f90ea33c6b254cf09987ab56f61515a1', 'admin', '2017-05-02 13:26:55', '修改系统用户：a1');
INSERT INTO `sys_fhlog` VALUES ('f932e71229b74159bf63774ed13c786f', 'admin', '2017-05-03 17:06:53', '修改角色菜单权限，角色ID为:3264c8e83d0248bb9e3ea6195b4c0216');
INSERT INTO `sys_fhlog` VALUES ('f9a7c1bd27d54947a76cd8c7ac08a22f', 'a0', '2017-05-02 10:59:32', '退出');
INSERT INTO `sys_fhlog` VALUES ('f9d50e1e1b3946baafd58ba84484c35a', 'admin', '2017-05-01 01:29:45', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('fafce6604a8a4ecc9200498cf2251d01', 'admin', '2017-05-02 13:04:17', '删除菜单ID58');
INSERT INTO `sys_fhlog` VALUES ('fb1be8d99c47470eb2ca181ddd35fdd4', 'admin', '2017-05-02 15:02:24', '删除菜单ID55');
INSERT INTO `sys_fhlog` VALUES ('fb8778392e0a4fae89eea4ceed2bc716', 'a1', '2017-04-29 13:09:49', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('fd2d6aacfee54c02be533104cd636da4', 'a1', '2017-03-06 01:19:22', '登录系统');
INSERT INTO `sys_fhlog` VALUES ('fe426c51c82d4184aea1f7f2939b1b22', 'admin', '2017-05-02 12:37:51', '修改菜单系统工具');
INSERT INTO `sys_fhlog` VALUES ('feaca735cb26445ba07737ca6e9e83b4', 'admin', '2017-05-02 13:06:54', '修改菜单系统用户');
INSERT INTO `sys_fhlog` VALUES ('ff38c8ad3f144ef7b9b8f1b119c079f1', 'admin', '2017-05-02 13:41:41', '修改菜单权限管理');
INSERT INTO `sys_fhlog` VALUES ('ff9a97b513ba4fc1aacf6f3be8c1911a', 'admin', '2017-05-02 13:18:52', '修改del_qx权限，角色ID为:3');

-- ----------------------------
-- Table structure for sys_loginimg
-- ----------------------------
DROP TABLE IF EXISTS `sys_loginimg`;
CREATE TABLE `sys_loginimg` (
  `LOGINIMG_ID` varchar(100) NOT NULL,
  `NAME` varchar(30) DEFAULT NULL COMMENT '文件名',
  `FILEPATH` varchar(100) DEFAULT NULL COMMENT '路径',
  `TYPE` int(2) NOT NULL COMMENT '状态',
  `FORDER` int(3) NOT NULL COMMENT '排序',
  PRIMARY KEY (`LOGINIMG_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_loginimg
-- ----------------------------
INSERT INTO `sys_loginimg` VALUES ('680a4ecf09234b9ebccc88a13875df39', '1', '2017050112584577292.jpg', '1', '1');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `MENU_ID` int(11) NOT NULL,
  `MENU_NAME` varchar(255) DEFAULT NULL,
  `MENU_URL` varchar(255) DEFAULT NULL,
  `PARENT_ID` varchar(100) DEFAULT NULL,
  `MENU_ORDER` varchar(100) DEFAULT NULL,
  `MENU_ICON` varchar(60) DEFAULT NULL,
  `MENU_TYPE` varchar(10) DEFAULT NULL,
  `MENU_STATE` int(1) DEFAULT NULL,
  PRIMARY KEY (`MENU_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES ('1', '系统管理', '#', '0', '1', 'menu-icon fa fa-cogs blue', '2', '1');
INSERT INTO `sys_menu` VALUES ('2', '权限管理', 'role.do', '1', '1', 'menu-icon fa fa-circle green', '1', '1');
INSERT INTO `sys_menu` VALUES ('38', '菜单管理', 'menu/listAllMenu.do', '1', '2', 'menu-icon fa fa-circle green', '1', '1');
INSERT INTO `sys_menu` VALUES ('39', '按钮管理', 'fhbutton/list.do', '1', '4', 'menu-icon fa fa-circle green', '1', '1');
INSERT INTO `sys_menu` VALUES ('73', '商品管理', '#', '0', '2', 'menu-icon fa fa-inbox blue', '2', '1');
INSERT INTO `sys_menu` VALUES ('74', '商品列表', 'goods/list.do', '73', '1', 'menu-icon fa fa-circle green', '1', '1');
INSERT INTO `sys_menu` VALUES ('75', '商品类别', 'goodstype/list.do', '73', '2', 'menu-icon fa fa-circle green', '1', '1');
INSERT INTO `sys_menu` VALUES ('76', '商品仓库', 'goodsware/list.do', '73', '3', 'menu-icon fa fa-circle green', '1', '1');
INSERT INTO `sys_menu` VALUES ('77', '计量单位', 'goodsunit/list.do', '73', '4', 'menu-icon fa fa-circle green', '1', '1');
INSERT INTO `sys_menu` VALUES ('78', '库存管理', '#', '0', '3', 'menu-icon fa fa-home blue', '2', '1');
INSERT INTO `sys_menu` VALUES ('79', '商品库存', 'stock/list.do', '78', '1', 'menu-icon fa fa-circle green', '1', '1');
INSERT INTO `sys_menu` VALUES ('80', '商品入库', 'stockin/list.do', '78', '2', 'menu-icon fa fa-circle green', '1', '1');
INSERT INTO `sys_menu` VALUES ('81', '商品出库', 'stockout/list.do', '78', '3', 'menu-icon fa fa-circle green', '1', '1');
INSERT INTO `sys_menu` VALUES ('85', '销售管理', '#', '0', '5', 'menu-icon fa fa-comments-o blue', '2', '1');
INSERT INTO `sys_menu` VALUES ('86', '销售订单', 'sale/list.do', '85', '1', 'menu-icon fa fa-circle green', '1', '1');
INSERT INTO `sys_menu` VALUES ('89', '综合统计', '#', '0', '7', 'menu-icon fa fa-bar-chart-o blue', '2', '1');
INSERT INTO `sys_menu` VALUES ('90', '销售统计', 'user/statsaleList.do', '89', '2', 'menu-icon fa fa-circle green', '1', '1');
INSERT INTO `sys_menu` VALUES ('91', '库存盘点', 'stock/kucunchar.do', '78', '4', 'menu-icon fa fa-circle green', '1', '1');
INSERT INTO `sys_menu` VALUES ('92', '新增销售订单', 'sale/goAdd.do', '85', '2', 'menu-icon fa fa-circle green', '1', '1');
INSERT INTO `sys_menu` VALUES ('93', '销售记录', 'sale/salesReport.do', '85', '3', 'menu-icon fa fa-circle green', '1', '1');
INSERT INTO `sys_menu` VALUES ('94', '财务管理', '#', '0', '6', 'menu-icon fa fa-barcode blue', '2', '1');
INSERT INTO `sys_menu` VALUES ('95', '收款管理', '#', '94', '1', 'menu-icon fa fa-circle green', '1', '1');
INSERT INTO `sys_menu` VALUES ('96', '对账管理', '#', '94', '2', 'menu-icon fa fa-circle green', '1', '1');
INSERT INTO `sys_menu` VALUES ('97', '库存统计', 'user/statstockList.do', '89', '1', 'menu-icon fa fa-circle green', '1', '1');
INSERT INTO `sys_menu` VALUES ('98', '财务统计', '#', '89', '3', 'menu-icon fa fa-circle green', '1', '1');
INSERT INTO `sys_menu` VALUES ('99', '系统用户', 'user/listUsers.do', '1', '3', 'menu-icon fa fa-circle green', '1', '1');
INSERT INTO `sys_menu` VALUES ('100', '销售情况', 'sale/salechar.do', '85', '4', 'menu-icon fa fa-circle green', '1', '1');
INSERT INTO `sys_menu` VALUES ('101', '分销管理', '#', '0', '4', 'menu-icon fa fa-users blue', '2', '1');
INSERT INTO `sys_menu` VALUES ('102', '分销管理', 'allot/list.do', '101', '1', 'menu-icon fa fa-circle green', '1', '1');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `ROLE_ID` varchar(100) NOT NULL,
  `ROLE_NAME` varchar(100) DEFAULT NULL,
  `RIGHTS` varchar(255) DEFAULT NULL,
  `PARENT_ID` varchar(100) DEFAULT NULL,
  `ADD_QX` varchar(255) DEFAULT NULL,
  `DEL_QX` varchar(255) DEFAULT NULL,
  `EDIT_QX` varchar(255) DEFAULT NULL,
  `CHA_QX` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ROLE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1', '系统管理组', '1900977813459929910110419156998', '1', '633327213231700511912250834950', '633327213231700511912250834950', '1', '1');
INSERT INTO `sys_role` VALUES ('2', '备用组(TEST)', '', '1', '0', '0', '0', '1');
INSERT INTO `sys_role` VALUES ('3264c8e83d0248bb9e3ea6195b4c0216', '方硕总部', '10140706714943421019838989991942', '1', '10140706714943421019838989991942', '10140706714943421019838989991942', '10140706714943421019838989991942', '10140706714943421019838989991942');
INSERT INTO `sys_role` VALUES ('68f8e4a39efe47c7bb869e9d15ab925d', '代理商', '9029655529684792222292392280064', '1', '9029655529684792222292392280064', '9029655529684792222292392280064', '1423751928315415813312173047808', '9029655529684792222292392280064');

-- ----------------------------
-- Table structure for sys_role_fhbutton
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_fhbutton`;
CREATE TABLE `sys_role_fhbutton` (
  `RB_ID` varchar(100) NOT NULL,
  `ROLE_ID` varchar(100) DEFAULT NULL,
  `BUTTON_ID` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`RB_ID`),
  KEY `角色表外键` (`ROLE_ID`) USING BTREE,
  KEY `fbutton` (`BUTTON_ID`),
  CONSTRAINT `fbutton` FOREIGN KEY (`BUTTON_ID`) REFERENCES `sys_fhbutton` (`FHBUTTON_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `frole` FOREIGN KEY (`ROLE_ID`) REFERENCES `sys_role` (`ROLE_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_role_fhbutton
-- ----------------------------
INSERT INTO `sys_role_fhbutton` VALUES ('4ee1e2bc03a64ef1bc578fcf2e2ea2c1', '68f8e4a39efe47c7bb869e9d15ab925d', '3542adfbda73410c976e185ffe50ad06');
INSERT INTO `sys_role_fhbutton` VALUES ('5669c8754b4d4e368365ed5065f9fc10', '3264c8e83d0248bb9e3ea6195b4c0216', '3542adfbda73410c976e185ffe50ad06');
INSERT INTO `sys_role_fhbutton` VALUES ('74203935bfa34ce3b9b80e81f2a2bcfe', '68f8e4a39efe47c7bb869e9d15ab925d', '4efa162fce8340f0bd2dcd3b11d327ec');
INSERT INTO `sys_role_fhbutton` VALUES ('8231c216fb514b4188e4162e629c6237', '3264c8e83d0248bb9e3ea6195b4c0216', '4efa162fce8340f0bd2dcd3b11d327ec');
INSERT INTO `sys_role_fhbutton` VALUES ('8f8b3c5bfdfa4c6da19fce7396279180', '68f8e4a39efe47c7bb869e9d15ab925d', 'cc51b694d5344d28a9aa13c84b7166cd');
INSERT INTO `sys_role_fhbutton` VALUES ('d51dc41918b040a78a021c9a43caf8d5', '68f8e4a39efe47c7bb869e9d15ab925d', 'da7fd386de0b49ce809984f5919022b8');
INSERT INTO `sys_role_fhbutton` VALUES ('d9a9a5a2d79446449cd26c17f061e1d0', '3264c8e83d0248bb9e3ea6195b4c0216', 'da7fd386de0b49ce809984f5919022b8');
INSERT INTO `sys_role_fhbutton` VALUES ('e2033c3cdb8d48a1865e16e085f103b7', '3264c8e83d0248bb9e3ea6195b4c0216', '46992ea280ba4b72b29dedb0d4bc0106');
INSERT INTO `sys_role_fhbutton` VALUES ('f0329033d0914faf8ea6e9ff252cc5e6', '68f8e4a39efe47c7bb869e9d15ab925d', '46992ea280ba4b72b29dedb0d4bc0106');
INSERT INTO `sys_role_fhbutton` VALUES ('fbc51895f2184d63bd1409320a7a7a2a', '3264c8e83d0248bb9e3ea6195b4c0216', 'cc51b694d5344d28a9aa13c84b7166cd');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `USER_ID` varchar(100) NOT NULL,
  `USERNAME` varchar(255) DEFAULT NULL,
  `PASSWORD` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `RIGHTS` varchar(255) DEFAULT NULL,
  `ROLE_ID` varchar(100) DEFAULT NULL,
  `LAST_LOGIN` varchar(255) DEFAULT NULL,
  `IP` varchar(100) DEFAULT NULL,
  `STATUS` varchar(32) DEFAULT NULL,
  `BZ` varchar(255) DEFAULT NULL,
  `SKIN` varchar(100) DEFAULT NULL,
  `EMAIL` varchar(32) DEFAULT NULL,
  `NUMBER` varchar(100) DEFAULT NULL,
  `PHONE` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', 'admin', 'de41b7fb99201d8334c23c014db35ecd92df81bc', '管理员', '1133671055321055258374707980945218933803269864762743594642571294', '1', '2017-05-12 23:04:23', '0:0:0:0:0:0:0:1', '0', 'admin', 'default', '111@main.com', '001', '18788888888');
INSERT INTO `sys_user` VALUES ('2dfcb326a76846eba2a8e8e5a490f75c', 'a3', '349736ffaeb037eea4d95ebcbd7ad28e3709968b', '济南分公司', '', '68f8e4a39efe47c7bb869e9d15ab925d', '', '', '0', '济南分公司', 'default', '4@qq.com', '1003', '12345678900');
INSERT INTO `sys_user` VALUES ('3013a92f317040fda37d3fc386d802fd', 'a0', '203e2ccc573d3bfd4b2492926f441614b97d9f9d', '总公司', '', '3264c8e83d0248bb9e3ea6195b4c0216', '2017-05-12 22:57:17', '0:0:0:0:0:0:0:1', '0', '总公司', 'default', '0@qq.com', '1000', '12345678900');
INSERT INTO `sys_user` VALUES ('598614e228cb49e5ae50c21b1c2f40e1', 'zong', '367e85b36d0068dcf73090d4ec3bfa53fc904978', '总部', '', '3264c8e83d0248bb9e3ea6195b4c0216', '', '', '0', '1', 'default', '9@qq.com', '1', '12345678900');
INSERT INTO `sys_user` VALUES ('aba226eceabc404d8960be0ee3626fcd', 'a2', '2a68de09b5b0087d43654e9657dcf6a87408b349', '青岛分公司', '', '68f8e4a39efe47c7bb869e9d15ab925d', '2017-05-11 23:56:10', '0:0:0:0:0:0:0:1', '0', '青岛分公司', 'default', '3@qq.com', '1002', '18888888888');
INSERT INTO `sys_user` VALUES ('df658542223d4da9b700852fd9adaddf', 'a1', 'dd3a0c82292435953504c94365feb2551ebb2920', '烟台分公司', '', '68f8e4a39efe47c7bb869e9d15ab925d', '2017-05-12 22:19:43', '0:0:0:0:0:0:0:1', '0', '烟台分公司', 'default', '2@qq.com', '1001', '18765555555');

-- ----------------------------
-- Table structure for sys_userphoto
-- ----------------------------
DROP TABLE IF EXISTS `sys_userphoto`;
CREATE TABLE `sys_userphoto` (
  `USERPHOTO_ID` varchar(100) NOT NULL,
  `USERNAME` varchar(30) DEFAULT NULL COMMENT '用户名',
  `PHOTO0` varchar(255) DEFAULT NULL COMMENT '原图',
  `PHOTO1` varchar(100) DEFAULT NULL COMMENT '头像1',
  `PHOTO2` varchar(100) DEFAULT NULL COMMENT '头像2',
  `PHOTO3` varchar(100) DEFAULT NULL COMMENT '头像3',
  PRIMARY KEY (`USERPHOTO_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_userphoto
-- ----------------------------
