## Shortcuts on postgress - psql

### Display
* Enable expanded display : `\x`
* Turn on timing : `\timing`

### Generic
* Execute the last command : `\g`
* Show the command history : `\s`
* Run sql from a file : `\i <fileName>`
* Open editor to write command : `\e`
* Exit : `\q`

### List details of database
* List all databases : `\l`
* List all objects : `\d`
* List all schemas : `\dn`
* List all tables : `\dt`
* List all sequences : `\ds`
* List all functions : `\df`
* List all views : `\dv`
* List all user/role : `\du`

### Tables
* Describe a table : `\d <tableName>`

### Version
* Find the version
    ```sql  
    SELECT version();
    ```