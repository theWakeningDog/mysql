#药品
create table if not exists drug (
	id varchar(128) primary key,
	no varchar(20) not null comment '药品编号',
	origin varchar(255) comment '产地',
	unit varchar(30) comment '单位',
	number int(11) comment '数量',
	purchase double(10, 2) comment '进价',
	retail double(10, 2) comment '零售价',
	period date comment '有效期',
	sortId varchar(50) comment '药品类别',
	warehouseId varchar(30) comment '仓库',
	commonName varchar(50) comment '通用名',
	createTime date comment '进货日期',
	mark varchar(255) comment '备注'
)

#药品类别
create table if not exists sort(
	id varchar(20) primary key not null,
	name varchar(50) not null comment '类别名称',
	mark varchar(255) comment '备注'
)


#仓库
create table if not exists warehouse(
	id varchar(20) primary key,
	name varchar(20) not null comment '仓库名称',
	mark varchar(255) comment '备注'
)


#登陆
create table if not exists login_user(
	id varchar(20) primary key,
	name varchar(20) not null comment '登陆名',
	password varchar(20) not null comment '密码',
	age int(11),
	tel varchar(15),
	email varchar(15),
	mark varchar(255) comment '备注'
)

#供应商
create table if not exists supplier(
	id varchar(20) primary key,
	name varchar(50) not null,
	mark varchar(255)
)

#采购员
create table if not exists procurementer(
	id varchar(20) primary key,
	name varchar(50) not null,
	age int(11),
	tel varchar(15),
	email varchar(15),
	mark varchar(255) comment '备注'
)


#采购单
create table if not exists procurementOrder(
	id varchar(20) primary key,
	supplier varchar(20) not null comment '供应商',
	procurementer varchar(20) not null comment '采购员',
	drugNo varchar(20) not null comment '药品编号',
	drugName varchar(50) not null comment '药品名称',
	drugOrigin varchar(50) comment '药品产地',
	drugUnit varchar(20) comment '药品单位',
	drugNumber int comment '药品数量',
	drugPurchase double(10, 2) comment '药品进价',
	drugTotalPurchase double(10, 2) comment '一项药品总价格',
	drugTotalPrice double(10, 2) comment '购买药品总价',
	warehouse varchar(20) comment '仓库',
	mark varchar(255) comment '备注'
)

#任务
CREATE TABLE
IF NOT EXISTS task (
	id VARCHAR (128) PRIMARY KEY,
	NAME VARCHAR (100),
	supplier VARCHAR (128) COMMENT '供应商（采购时有）',
	customer VARCHAR (128) COMMENT '客户（销售时有）',
	type VARCHAR (100) COMMENT '任务类型：采购、销售',
	LEVEL VARCHAR (100) COMMENT '紧急程度',
	executor VARCHAR (128) COMMENT '负责人',
	createUser VARCHAR (128) COMMENT '创建人',
	attachment text COMMENT '附件',
	description text COMMENT '描述',
	createTime datetime COMMENT '创建时间',
	startTime datetime COMMENT '开始时间',
	endTime datetime COMMENT '结束时间'
)

#客户
CREATE TABLE
IF NOT EXISTS `customer` (
	`id` VARCHAR (128) NOT NULL PRIMARY KEY COMMENT 'UUID',
	`name` VARCHAR (255) DEFAULT NULL COMMENT '客户名称',
	`level` VARCHAR (255) DEFAULT NULL COMMENT '客户级别',
	`type` VARCHAR (255) DEFAULT NULL COMMENT '客户类型',
	`customer_manager` VARCHAR (255) DEFAULT NULL COMMENT '客户经理',
	`service_manager` VARCHAR (255) DEFAULT NULL COMMENT '服务经理',
	`remark` text DEFAULT NULL COMMENT '备注',
	`createTime` datetime DEFAULT NULL COMMENT '创建时间',
	`createUser` VARCHAR (255) DEFAULT NULL COMMENT '创建者',
	`isDelete` INT (11) DEFAULT NULL COMMENT '逻辑删除',
	`linkman` VARCHAR (128) DEFAULT NULL COMMENT '联系人',
	`address` text DEFAULT NULL COMMENT '地址'
) ENGINE = INNODB DEFAULT CHARSET = utf8 COMMENT = '客户表';

#客户联系人 tinyint（1）表示boolean类型  默认值可以是  default false 或default 0
CREATE TABLE
IF NOT EXISTS `linkman` (
	`id` VARCHAR (128) NOT NULL PRIMARY KEY,
	`customer` INT (11) DEFAULT NULL COMMENT '所属客户',
	`name` VARCHAR (255) DEFAULT NULL,
	`sex` VARCHAR (255) DEFAULT NULL,
	`isMain` TINYINT(1) DEFAULT FALSE comment '是否是主要联系人，1：是；0：否',
	`remark` text DEFAULT NULL,
	`phone` VARCHAR (255) DEFAULT NULL,
	`email` VARCHAR (255) DEFAULT NULL,
	`createTime` datetime DEFAULT NULL,
	`createUser` VARCHAR (255) DEFAULT NULL,
	`isDelete` TINYINT(1) DEFAULT '0' COMMENT '逻辑删除。是否已删除 1：是；0：否',
	`enabled` TINYINT(1) DEFAULT '1' COMMENT '是否启用。1：是；0：否'

) ENGINE = INNODB DEFAULT CHARSET = utf8 COMMENT = '客户联系人信息';

