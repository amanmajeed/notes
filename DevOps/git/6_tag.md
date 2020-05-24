#Create a simple tag
git tag [myTag]

#List the tags
git tag --list

#Show the details of tag
git show [myTag]

#Delete tag
git tag --delete [mytag]

#To create a annotated tag
git tag -a [myTag]

#Compare tags
git diff [myTag1] [myTag2]

#Tag a revision number
git tag -a [mytag1] [commitID]