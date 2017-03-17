SELECT
	count(0)
FROM
	base_task t
LEFT JOIN base_customer c ON t.customerId = c.id
LEFT JOIN base_login_user lu ON t.executor = lu.userId
LEFT JOIN base_login_user cu ON t.createUser = cu.userId
WHERE
t. NAME LIKE concat('%', '', '%')
AND json_extract (
	t.attribute,
	'$.testConditions'
) = '呵呵'

SELECT
	*
FROM
	base_task t
LEFT JOIN base_customer c ON t.customerId = c.id
LEFT JOIN base_login_user lu ON t.executor = lu.userId
LEFT JOIN base_login_user cu ON t.createUser = cu.userId
WHERE
json_extract (
	t.attribute,  #字段名称
	'$.testConditions'   #json的key
) <> '呵'   #json的value
