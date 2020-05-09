# Save work in progress and reset to HEAD
## WIP is all added, uncommited files
git stash save [comment]
## Save is optional

#Restore stash
git stash apply [stashRef]

#List the stashes
git stash list

#Drop the last stash
git stash drop [stashRef]

#List all files in repo
git ls-files

#To stash unadded and uncommited files
git stash -u 

#apply + drop can be done in one go 
git stash pop

#To view the changes in a stash
git stash show [stashRef]

#To stop all stashes
git stash clear

#Move all changes from master to branch using stash
git stash -u
git stash branch [newBranch]