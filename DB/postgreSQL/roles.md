### About Users, Roles and Schemas 

* "Role" is an Account
* Role+Login-Right = "User"
* Role which containts other roles is called "Group"

* To create role with login access
    ```sql
    CREATE ROLE <roleName> LOGIN;
    ```