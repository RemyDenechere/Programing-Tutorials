# Understanding tracking files 
Rémy Denéchère 
06/06/2025

---

# Understanding the git status command 
When running the command `git status` git will return all the files in 3 categories: 
- “Changes to be committed” : This are staged changes, i.e., changed that have been add with the command `git add .` and that are ready to be commited. 
- “Changes not staged for commit”: This files are tracked and modified, which mean that git is tracking this files but their changes have not been added
- “Untracked files”: means it's not yet tracked. 

Note that if you add files in the `.gitignore` files  git will ignore this files when you will use the `git add .` command, 
exept is the files are already tracked meaning that the files you want to ignore are in the “Changes to be committed” 
or in the “Changes not staged for commit” categories when you run `git status` command.  

# what is a tracked file 
A tracked file is a file that Git knows about. For a file to be tracked it’s been:
1. dded to the repository with git add, and
2. Committed at least once; or is staged to be committed.
Tracked files are monitored by Git for changes.
If you edit a tracked file, Git will notice and show it in git status as "modified".

# How to untrack a file: 
If you have a tracked file that you want to untrack it will depend on whether or not the file have been commited already: 
First to test if a file has been commited run: 
```
git log -- Path/to/file
```
you will get the list of commit where the file has been located: 
```
commit 3f5a1b...
Author: ...
Date: ...
    Add input file
```
## If the file has been commited and pushed previously
### git filter-branch 
The classic way to remove a file that has been commited and pushed is `git filter-branch `.
The example bellow removes all .mat files from the following folder: "output/Matlab_Average/"
```
git filter-branch -f --tree-filter 'rm -f output/Matlab_Average/*.mat' HEAD
```
You can also run got filter-branch to a limitted number of commits, this is usefull when you start having a lot of commits
in your branch: 
```
git filter-branch --tree-filter 'rm -f output/Matlab_Average/*.mat' COMMIT1^..COMMIT2
```

### git filter-repo
filter-branch is slow, there is a faster option: `git filter-repo`
to pip install we first need to make a python environement: 
```
python -m venv git-filter
```
Install:
```
pip install git-filter-repo
```
Then run the git-filter repo for a path or specific files: 
```
git filter-repo --path exps/OM4.single_column.COBALT/INPUT/ --invert-paths --force
```
Note that the `--invert-paths` flag allows to remove this path from all commits. 


## The file has not been commited yet
1. First you need to to unstaged a file use the command: 
```
git reset path/to/file
```
You can confirm that files are now in the “Untracked files” category with:
```
git status
```
2. Then you can untrack the file:
```
git rm --cached path/to/file
```
3. Then you need to commit your changes

### exemple: Untrack all .nc files you've added but haven’t committed
```
git reset '*.nc'               # Unstage them
git rm --cached '*.nc'         # Remove from tracking
echo '*.nc' >> .gitignore      # Prevent re-adding
```
Then commit: 
```
git commit -m "Remove .nc files from tracking"
```

