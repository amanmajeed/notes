#List the branches
git branch -a

#Create a new branch
git branch mynewbranch

#Switch branch
git checkout mynewbranch

#Create + Switch branch
git checkout -b mynewbranch

#Rename a branch
git branch -m [oldBranch] [newBranch]

#Delete a branch
git branch -d [branchName]

#Find the difference between branches
git diff master [newBranch]

#Merge
##Fast-Forward
git checkout master
git merge [branchName]
## Possible when no change happens in master when changes are done in branch.
## Merge also does commit
## This will show the individual commits in the branch as individual commits in master

#NO Fast-Forward
## This will show the history in the master branch as being branched out
git merge [branchName] --no-ff
