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

### Size
* Get the size of the database
    ```sql
    -- For single database called <DBName>
    SELECT pg_size_pretty (pg_database_size ('<DBName>'));
    
    --- For all databases
    SELECT pg_database.datname, pg_size_pretty(pg_database_size(pg_database.datname)) AS size 
    FROM pg_database;
    ```
* Get size of a table
    ```sql
    -- In bytes
    select pg_relation_size('<TableName>');
    -- In human readable format
    SELECT pg_size_pretty (pg_relation_size('<TableName>'));
    ```
* Get size of a table and its index
    ```sql
    SELECT pg_size_pretty (pg_total_relation_size ('<TableName>'));
    ```
* Get the size of all tables
    ```sql
    SELECT
     relname AS "relation",
     pg_size_pretty (pg_total_relation_size (C.oid)) AS "total_size"
    FROM pg_class C
        LEFT JOIN pg_namespace N 
        ON (N.oid = C .relnamespace)
    WHERE nspname NOT IN ('pg_catalog','information_schema')
    AND C .relkind <> 'i'
    AND nspname !~ '^pg_toast'
    ORDER BY pg_total_relation_size (C .oid) DESC
    ```