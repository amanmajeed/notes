## How to monitor linux servers

### Monitoring RAM
* [Reference Link](https://www.linuxatemyram.com/play.html)
* Check total memory
    ```bash
    free -h
    cat /proc/meminfo
    htop
    vmsat -s
    ```

* Find memory of all process
    ```bash
    ps -o pid,user,%mem,cmd ax | sort -b -k3 -r
    ps -eo pid,cmd,%mem,%cpu --sort=-%mem
    ```

* Find mem of single process
    ```
    pmap 917 | tail -n 1
    ```

### Monitoring Space
```
df
```

### Monitoring CPU
```
htop
```