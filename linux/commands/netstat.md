## About netstat command

* Install : 
    ```bash
    yum install -y net-tools
    ```

* Check if a port is listening 
    ```bash
    netstat -an | grep <Port>
    `
* Show active listen connections, with program name (no established) : 
    ```bash
    netstat -antp
    ```

* Show active listen+established connections
    ```bash
    netstat -ant
    ```