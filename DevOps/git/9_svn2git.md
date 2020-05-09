### Migrate from SVN to Git

* Tips
    * Run this on the SVN server first.
    * After all the steps are done, do a push to the Git server.
    

* Checkout the repository
    ```bash
    svn checkout <path>
    ```

* Fetch the list of user ID's
    * On power shell
        ```
        svn.exe log --quiet | ? { $_ -notlike '-*' } | % { "{0} = {0} <{0}>" -f ($_ -split ' \| ')[1] } | Select-Object -Unique | Out-File 'authors-transform.txt'
        ```
    * On bash
        ```bash
        svn log --quiet | awk -F"|" '{print $2" = "}' | sort -u
        ```

* Manually change the files for owner/email as per below format
`SVN ID = Name <Email@domain>`

* Get the revision number of the first commit
    ```bash
    svn log | tail
    ```

* Clone from SVN to git-local
    ```
    git svn clone --no-minimize-url -r<FromAbove>:HEAD --authors-file "authors-transform.txt" <SVNURL> <GIT-PROJECT-NAME>
    ```
    * Use --no-metadata next time ?
    * Use --ignore-paths=".*.jar$" to ignore jar files
    * User --ignore-paths='(file2|file1)' to ignore multiple files

* Add and push to remote
    ```bash
    git remote add origin <GIT-URL>
    git push -u origin --all
    ## To pish to seperate branch - git push origin <branchName>
    ```

* Sync (Expecting the list of user ID not to change)
    ```bash
    git config svn.authorsfile <FULL-PATH>/authors-transform.txt
    git svn fetch --username=<SVN-USER>
    git svn rebase --username=<SVN-USER>
    git push origin master
    ```

* [Also refer](https://docs.microsoft.com/en-us/azure/devops/learn/git/centralized-to-git)