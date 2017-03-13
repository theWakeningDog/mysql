ALTER TABLE procurement_order CHANGE procurementer procurerId VARCHAR(128);

ALTER TABLE procurement_order CHANGE supplier supplierId varchar(128);

ALTER table procurement_order CHANGE drugNo drugId VARCHAR(128);

ALTER TABLE procurement_order DROP COLUMN drugName;

ALTER TABLE procurement_order DROP COLUMN drugOrigin;

ALTER TABLE procurement_order DROP COLUMN drugUnit;

ALTER TABLE procurement_order DROP COLUMN drugNumber;

alter table procurement_order drop COLUMN drugPurchase;

alter table procurement_order drop COLUMN drugTotalPurchase;

ALTER TABLE procurement_order DROP COLUMN drugTotalPrice;

ALTER TABLE procurement_order DROP COLUMN warehouse;

#drug新增名字
ALTER TABLE drug add `name` VARCHAR(255);

#sort新增父类别
ALTER TABLE sort add pid VARCHAR(128);

#修改drug中warehouseId的属性
ALTER TABLE drug CHANGE warehouseId warehouseId VARCHAR(128)

#给所有的表添加 createTime 字段
ALTER TABLE login_user ADD createTime datetime;
ALTER TABLE procurement_order ADD createTime datetime;
ALTER table procurer add createTime datetime;
alter table sort add createTime datetime;
alter table supplier add createTime datetime;
alter table warehouse add createTime datetime;

ALTER TABLE drug CHANGE sortId sort VARCHAR(128)

ALTER TABLE drug change warehouseId warehouse varchar(128)

ALTER TABLE procurement_order CHANGE drugId drug VARCHAR(128)

alter table procurement_order CHANGE supplierId supplier VARCHAR(128)

ALTER TABLE procurement_order CHANGE procurerId procurer VARCHAR(128)