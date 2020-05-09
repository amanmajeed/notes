#Stages of git
* Working Area - Where you keep changing files
* Staging Area - Files on which git add is performed
* Git repository (local) - Files on which commit is performed

#Create user
git config --global user.name "me"
git config --global user.email "me@gmail.com"

#Check the user 
git config --global --list

#Initialize a folder
git init [folderName]?

#Get status
git status

#Undo a change made to a file
git restore [fileName]

#Add (new and modified) files to staging area
git add [fileName]	#Stage spesific file
git add -A #stages all changes
git add .  #stages new files and modifications, without deletions
git add -u #stages modifications and deletions, without new files

#Commit the files to staging area
git commit -m "comment"

#Shortcut for add and commit
## Works only for modified files.
git commit -am "comment"

#To undo, move file from staging back to working directory
git reset HEAD [fileName]

#To undo file changes in working directory
git checkout -- [fileName]

#To undo commit file
git rm [fileName]
##Needs to be commited

#Get history
git log
git log --oneline --graph --decorate --color

#If a file is manually deleted, then 
git commit -u [fileName]

#To move a file
git mv [src] [dst]
##Needs to be commited

#Ignore files from being add
##Add the file patterns to file ".gitignore"

#Create an alias for a long command
##Alais name hist
git config --global alias.hist "log --oneline --graph --decorate"

#Differences
##Working Dir vs Staged
git diff 

#Log of what is done
git reflog

#Undo
git reset HEAD^
## Give ^^ to go back by 2

#Redo
git reset [commitID]

#Change the last commit comment 
git commit --amend


