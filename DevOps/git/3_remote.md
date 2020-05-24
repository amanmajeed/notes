#Generate ssh key for yourself
ssh-keygen -t rsa -C "aman_majeed@infosys.com"

#Login to github/gitlab 
##Settings -> SSH Keys -> Add the above key

#Test the connection
ssh -T git@[Server]

#Create a new repository
git clone <GITURL>
cd test
touch README.md
git add README.md
git commit -m "add README"
git push -u origin master

#Push an existing folder
cd existing_folder
git init
git remote add origin <GITURL>
git add .
git commit -m "Initial commit"
git push -u origin master

#Push an existing Git repository
cd existing_repo
git remote rename origin old-origin
git remote add origin <GITURL>
git push -u origin --all
git push -u origin --tags

#Can also do - 
git remote set-url origin <GITURL>
git push -u origin --all

#Push
git push origin master
git push <remoteName> <branchName>

#Update the local references, but not the files
## This will lead to allowing local git to know if there is a change done on remote, which is not yet known to local.
git fetch origin master

#If you want to push a local branch to remote (Which does not exist in remote)
git push --set-upstream origin <branchName>

#Remove the branches which are no longer present on remote 
git remote prune origin