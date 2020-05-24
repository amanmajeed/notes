#Fetch and check out the branch for this merge request
git fetch origin
git checkout -b newBranch origin/newBranch

#Review the changes locally

#Merge the branch and fix any conflicts that come up
git checkout master
git merge --no-ff newBranch

#Push the result of the merge to GitLab
git push origin master