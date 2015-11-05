sysbench --test=oltp --oltp-table-size=${SYSBENCH_TABLE_SIZE} --mysql-db=${MYSQL_DATABASE} --mysql-user=${MYSQL_USER} --mysql-password=${MYSQL_PASSWORD} prepare
