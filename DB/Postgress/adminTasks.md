## Administrative tasks
* Create DB 
`createdb -h localhost -p 5432 -U postgres testdb`

* Default port : 5432
* Connect : `psql -h host -d database -U user -W`

### Information Schema
* Get the list of tables, columns in a schema in order of table, column-no
```sql
select table_name, column_name, ordinal_position 
from information_schema.columns
where table_schema='public' 
order by 1, 3, 2;
```

