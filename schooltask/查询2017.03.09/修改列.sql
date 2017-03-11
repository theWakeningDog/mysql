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

ALTER TABLE drug add `name` VARCHAR(255);