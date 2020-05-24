## About sed command
Used for replace of text

* Replace all occurance of `xyz` with `abc` in file `file.lst`
    ```bash
    sed -i 's/xyz/abc/g' file.lst
    ```
* Comment the next n lines of a file, after finding a string
    ```bash
    cat file.lst
    [Hey]
    x=1
    y=2
    z=3

    [What]
    x=1
    y=2
    z=3

    #Replace the file with [Hey and the next three lines
    sed -i '/[Hey/,+3 s/^/#/' file.lst

    cat file.lst
    #[Hey]
    #x=1
    #y=2
    #z=3

    [What]
    x=1
    y=2
    z=3
    ```

* Create a backup file
    ```
    sed -i.bak 's/xyz/abc/g' file.lst
    # Will create file.lst.bak
    ```