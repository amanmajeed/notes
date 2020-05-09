# Git to Git migration

* Git-A to Git-B 
    ```
    git remote set-url origin <GITURL>
    git push origin master
    ```

* Git-A to Git-A+B
    ```
    git remote add plugin <path or URL>
    git subtree add --prefix=vendor/plugins/demo plugin master
    ```

* [Reference](https://medium.com/@porteneuve/mastering-git-subtrees-943d29a798ec)