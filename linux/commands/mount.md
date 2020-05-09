## How to mount a NFS across servers

0. Below used as example
    * Server IP - 192.168.1.1
    * Client IP - 192.168.1.2

1. Run On Server and Client to install required utilities for NFS
    ```bash
    sudo yum install nfs-utils nfs-utils-lib
    sudo systemctl stop nfs-mountd
    sudo systemctl start nfs-mountd
    sudo systemctl status nfs-mountd
    ```

2. On server
    * Create the mount
        ```bash
        ## Directory to share
        mkdir -p /ABC/LOGS
        sudo su - 
        vi /etc/exports
        /ABC/LOGS 192.168.1.2/16(rw,sync)
        ## Giving acces from 192.168.0.0 to 192.168.255.255 by this.
        #Save and exit
        ## If UID does not match, then give no_root_squash
        /ABC/LOGS 192.168.1.2/16(rw,sync,no_root_squash)
        ```

    * Open Firewall on port 111
        ```bash
        ## Below is cheat to open firewall on all ports. (Change if required)
        ## May need to be redone on VM restart.
        sudo iptables -P INPUT ACCEPT
        sudo iptables -P FORWARD ACCEPT
        sudo iptables -P OUTPUT ACCEPT
        sudo iptables -t nat -F
        sudo iptables -t mangle -F
        sudo iptables -F
        sudo iptables -X
        ```

3. On Client
    * Test if connectivity is working
    ```bash
    showmount -e 192.168.1.1
    Export list for 192.168.1.1:
    ```

    * Create a temp mount
    ```bash
    mkdir -p /ABC
    sudo mount -t nfs 192.168.1.1:/ABC/LOGS /ABC
    ```

    * Perm mount - Did not test this.
    ```bash
    vi /etc/fstab
    192.168.1.1:/ABC/LOGS / nfs defaults 0 0
    ```
