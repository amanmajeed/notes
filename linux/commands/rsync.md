## About rsync command

* Syntax : `rsync <param> <src> <dst>`

* About rsync Flags
    * `-v` : verbose
    * `-a` : archive mode, preserves time and permission
    * `-c` : compare using checksum. will take longer to run
    * `--dry-run` : No change, just show the action it will perform
    * `--delete` : Delete from destination, if not present in source
    * `--include-from=<configFile>` : Copy files mentioned in a config file, with wild-cards

* e.g. Copy from source to dest 
    ```bash
    rsync -a <scr> <dst>
    ```

* e.g. Copy from scource to dest, delete from dest if the file does not exist in scource
    ```bash
    rsync -a --delete <scr> <dst>
    ```

* e.g. Run in parallel
    ```bash
    cd <src>
    ls -d * | xargs -n1 -P4 -I% rsync -Pa % <dst>
    ```

* e.g. Copy based on a list of files `--include-from=<configFile>`
    * Create a config file like
        ```
        + folder1\
        + folder1\file1
        - *
        ```
    * Syntax 
        ```bash
        rsync -a --include-from=<configFile> <src> <dst>
        # Where <src> has folder1
        ```
    * Only file1 in folder1 will be copied.
    * Excen if file2 exists in folder1, it will be ignored.
    * We can also change file1 to *.txt, etc with wildcards.