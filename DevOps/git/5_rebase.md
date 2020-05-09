# 

git checkout [featureBranch]
git rebase master
## It will take the changes done on master, after feature-branch was created and set that as base. 
## any changes commit to feature-branch will be applied on top of this base.

# Abort a rebase due to errors (and set the branch back to previous state)
git rebase --abort

# Pull + Rebase
git fetch origin master
git status
git pull --rebase origin master