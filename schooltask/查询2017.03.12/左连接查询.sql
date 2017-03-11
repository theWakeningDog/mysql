#药品  类别 仓库  左连接
SELECT
	*
FROM
	drug drug
LEFT JOIN sort sort ON drug.sortId = sort.id
LEFT JOIN warehouse wh ON drug.warehouseId = wh.id