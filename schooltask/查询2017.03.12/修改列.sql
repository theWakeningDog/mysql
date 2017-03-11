ALTER TABLE procurementorder CHANGE procurementer procurerId VARCHAR(128);

ALTER TABLE procurementorder CHANGE supplier supplierId varchar(128);

ALTER table procurementorder CHANGE drugNo drugId VARCHAR(128);

ALTER TABLE procurementorder DROP COLUMN drugName;

ALTER TABLE procurementorder DROP COLUMN drugOrigin;

ALTER TABLE procurementorder DROP COLUMN drugUnit;

ALTER TABLE procurementorder DROP COLUMN drugNumber;

alter table procurementorder drop COLUMN drugPurchase;

alter table procurementorder drop COLUMN drugTotalPurchase;

ALTER TABLE procurementorder DROP COLUMN drugTotalPrice;

ALTER TABLE procurementorder DROP COLUMN warehouse;

#drug新增名字
ALTER TABLE drug add `name` VARCHAR(255);

#sort新增父类别
ALTER TABLE sort add pid VARCHAR(128);

#修改drug中warehouseId的属性
ALTER TABLE drug CHANGE warehouseId warehouseId VARCHAR(128)

#给所有的表添加 createTime 字段
ALTER TABLE login_user ADD createTime datetime;
ALTER TABLE procurementorder ADD createTime datetime;
ALTER table procurer add createTime datetime;
alter table sort add createTime datetime;
alter table supplier add createTime datetime;
alter table warehouse add createTime datetime;