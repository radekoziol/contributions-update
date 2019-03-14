# contributions-update

Bash script for updating email and name of every commit you made.
Came out as a solution for problem when not every commit was recorded on github page. 

_script.sh_ clones all your repositories with every branch, then applies _script2.sh_ 
[(based on this article)](https://help.github.com/en/articles/changing-author-info"") to change author info and push changes. 

## parameters

_script.sh_ 
```
USERNAME
PASSWORD
ACCESS_TOKEN    // generate on /settings/tokens with at least repo scope
TYPE            // private,public,all,owner 
```

_script2.sh_ 
```
USERNAME
PASSWORD
OLD_EMAIL
CORRECT_NAME  
CORRECT_EMAIL  
