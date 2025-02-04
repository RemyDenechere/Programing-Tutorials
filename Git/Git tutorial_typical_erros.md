# Git tools 
Rémy Denéchère 
remy.denechere@gmail.com

---

## Clone all branches of a directory 

First, clone a remote Git repository and cd into it:
```
$ git clone <url>
```

Visualise the local and remote branch: 
```
$ git branch -a
```

Get into the upstream branch with chekout. To work on that branch, create a local tracking branch, which is done automatically by checkout: 
```
$ git checkout origin/<branch_name>
$ git checkout <branch_name>  
```

## Rewrite branch
When you have tracked large files that cannot be pushed to github removing these files or adding then in .gitignore is not sufficient. They have to be remove files from a folder: 

> ``Exemple of error: ``
> *$ git push -u origin 4P2Meso_forcing_COBALT_BATS
> remote: error: File output/Matlab_Average/Annual_Means_FOSI.mat is 167.83 MB; this exceeds > GitHub's file size limit of 100.00 MB
> ``error``: failed to push some refs to 'github.com:RemyDenechere/FEISTY-fortran.git'*

To solve it run: 
```
 git filter-branch -f --tree-filter 'rm -f output/Matlab_Average/*.mat' HEAD
```

## Undo last commit 
In the case where the big files or any other unwanted file has been commited but not pushed you can remove the last commit, and keep or don't keep the changes:
1) Delete the most recent commit, keeping the work you've done:
```
git reset --soft HEAD~1
```

2) Delete the most recent commit, destroying the work you've done:
```
git reset --hard HEAD~1
```
