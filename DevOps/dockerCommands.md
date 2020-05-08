## Docker Commands

### 1. Docker Pull
* `docker pull tomcat:jre8`

### 2. Manage images
* List the images : `docker images`
* Command to remove image : `docker rmi <ImageName>`

### 3. Run
* Runs a command creating a new container
* Command : `docker run -d -p 80:8080 -v /usr:/aman -e param=value tomcat:jre8`
* Command : `docker run -d -e param=value tomcat:jre8`
* Command : `docker run -d -H unix:///opt/docker.sock tomcat:jre8`
* -d : Detached mode
* -p : port mapping external:internal
* -v : Map volumes external:internal
* -e : Export and pass a parameter=value combo to the container
* -H : ?
* -m : Limit Memory. e.g. ` docker run -m 10m tomcat:jre8`  

### 4. exec
* Runs a command in an exsisting container
* Command : `docker exec -it <ContainerID> <Command>`
* -it : Link the STDOUT and STDIN from host to container
* -u : Run as user. 
    * e.g. To run as root `docker exec -u 0 <ContainerID> bash`
* -w : Run command in a particular directory. 
    * e.g. `docker exec -w /bin/ <ContainerID> bash`
* -e : Export and pass a parameter=value combo to the container
    * e.g. `docker exec -e UID='myuser' 74f86665f0fd printenv UID`

### 5. How to manage containers
* Command to start a stopped container : `docker start <ContainerName>`
* Command to stop a container : `docker stop <ContainerName>`
* Command to restart a container : `docker restart <ContainerName>`
* Command to remove container : `docker rm <ContainerName>`
* Command to kill a running container : `docker kill <ContainerName>`
* Rename container : `docker rename <ContaineName>`

### 6. Order of run & exec & start
* Order of these commads will be
* Run ➔ exec ➔ stop ➔ start ➔ exec ➔ ..Repeat..

### 7. See container details (ps)
* Command to list the running processes
* Command : `docker ps -a`
* -a : Show runnign and stopped containers
* --no-trunc : Dont trucate output 
    * e.g. `docker ps --no-trunc`
* -s : Show size on disk

### 8. Misc
* View utilization stats of containers : `docker stats` 
* Container has same network as host : `docker --new=host`
* Automatically remove the container when it exits : `docker --rm`

### 9. Filter & Format 
* TBU
