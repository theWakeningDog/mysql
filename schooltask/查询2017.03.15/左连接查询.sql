#药品  类别 仓库  左连接
SELECT
	*
FROM
	drug drug
LEFT JOIN sort sort ON drug.sort = sort.id
LEFT JOIN warehouse wh ON drug.warehouse = wh.id

#分组获取统计数量  一定要分组，才能正确显示
SELECT
	w.*, COUNT(d.id)
FROM
	warehouse w
LEFT JOIN drug d ON w.id = d.warehouse
GROUP BY
	w.id;