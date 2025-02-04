# Rewrite branch
When you have tracked large files that cannot be pushed to github removing these files or adding then in .gitignore is not sufficient. They have to be remove files from a folder: 

> ``Exemple of error: ``
> *$ git push -u origin 4P2Meso_forcing_COBALT_BATS
> remote: error: File output/Matlab_Average/Annual_Means_FOSI.mat is 167.83 MB; this exceeds > GitHub's file size limit of 100.00 MB
> ``error``: failed to push some refs to 'github.com:RemyDenechere/FEISTY-fortran.git'*

To solve it run: 
```
 git filter-branch --tree-filter 'rm -f output/Matlab_Average/*.mat' HEAD
```

## Some command to revert changes.

- This will unstage all files you might have staged with git add:
```
  git reset
```

- This will revert all local uncommitted changes (should be executed in repo root):
```
  git checkout .
```

- You can also revert uncommitted changes only to particular file or directory:
```
  git checkout [some_dir|file.txt]
```

- Yet another way to revert all uncommitted changes (longer to type, but works from any subdirectory):
```
  git reset --hard HEAD
```

- This will remove all local untracked files, so only git tracked files remain:
```
  git clean -fdx
```

## rebase branch 


## Get size of git folders
On linux and git: 
```
ls -l *
```

## Push a single comit 

`$ git push <remote name> <commit hash>:<remote branch name>`

Example:
```
$ git push origin 623b46e3c70cf2e0014252de3a7a3795fb54ab7e:main
```