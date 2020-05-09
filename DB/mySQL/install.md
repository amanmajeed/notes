# Steps to install mySQL on RHEL7

* To install
    ```bash
    yum remove mariadb-libs
    rpm -i mysql-community-common-8.0.17-1.el7.x86_64.rpm
    rpm -i mysql-community-libs-8.0.17-1.el7.x86_64.rpm
    rpm -i mysql-community-client-8.0.17-1.el7.x86_64.rpm
    rpm -i mysql-community-server-8.0.17-1.el7.x86_64.rpm
    ```

* To start mysql
    ```bash
    sudo service mysqld start
    ```

* Find default Password
    ```bash
    grep 'temporary password' /var/log/mysqld.log
    ```

* Login
    ```bash
    mysql -u root -p
    ```

* Somethings I did
    ```sql
    ALTER USER 'root'@'localhost' IDENTIFIED BY 'me';
    SHOW VARIABLES LIKE 'validate_password%';
    SHOW DATABASES;
    CREATE DATABASE metabase;
    CREATE USER 'metabase_user' IDENTIFIED BY 'passworD1!';
    GRANT ALL PRIVILEGES ON metabase.* TO 'metabase_user';
    GRANT RELOAD ON *.* TO 'metabase_user';
    FLUSH PRIVILEGES;
    Quit
    ```