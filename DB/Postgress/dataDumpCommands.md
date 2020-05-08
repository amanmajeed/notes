### Steps to backup and restore DB

* Steps to backup/dump DB
    * Command : `pg_dump -U postgres -W -F t <DBName> > <FileName>.tar`
    * -U : user
    * -W : Ask for password
    * -F : File type 
    * -t : tar

* Restore
    * Command : `psql -U username --set ON_ERROR_STOP=on -f backupfile`

* Restore - 2
    * Command : `pg_restore --dbname=dvdrental_tpl dvdrental.tar`
