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