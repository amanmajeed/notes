### Steps to backup and restore DB

* Steps to backup/dump DB
    * -U : user
    * -W : Ask for password
    * -F : File type 
    * -t : tar
    * Command : 
    ```bash
    pg_dump -U postgres -W -F t <DBName> > <FileName>.tar
    ```

* Restore
    ```bash
    psql -U username --set ON_ERROR_STOP=on -f backupfile
    ```

* Restore - 2
    ```bash
    pg_restore --dbname=dvdrental_tpl dvdrental.tar
    ```

### Export to CSV
* Export a table called persons with header
    * HEADER is to include header in the csv
    * DELIMITER ',' is to have comma seperated delimiter
    ```
    COPY persons TO '/fulPath/file.csv' DELIMITER ',' CSV HEADER;
    ```
* Export selected columns from a table called persons
    ```sql
    COPY persons(first_name,last_name,email) TO '/fulPath/file.csv' DELIMITER ',' CSV HEADER;
    ```
* Export based on a query
    ```sql
    COPY (select * from table) TO '/fulPath/file.csv' DELIMITER ',' CSV HEADER;
    ```
* Use `COPY` while running on server
* Use `\copy` while running on client, the rest of the commands remaining the same