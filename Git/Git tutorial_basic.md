# Basic tutorial for Git and GitHub
## Managing local and online directories and branches
### Check the Git configuration

```
$ git config --global user.name
$ git config --global user.email
$ git config --global init.default branch main
```
## Initialize the local directory as a Git repository.
```sh
$ git init
```
The flag `-b main` is not necessary as the default init is main

## Stage and commit all the files in your project.
```
$ git add.                             # Track all the files
$ git rm --cached Tut_livesript.mlx    # Remove "Tut_livesript.mlx" from track
$ git status                           # get the statuts of the current files
$ git restore --staged                 # to undo
```
On branch main, to get the changes to be committed: use `git restore --staged <file>` to unstage. To untracked files use `git add <file>` to include in what will be committed)

## Commit

Commit is used to write the stage of the current work. There are 3 levels in git: 1.
The working directory which is where we are currently working. 2. Staging and 3.
Commit which is a saved version of the work.
```
$ git commit -m "Commit name"
```

## Change text on last commit without sending a new commit
- Discard changes in working directory: 
```
$ git restore <file>..." to discard changes in working directory
$ git commit -m "First comit"
```

- make changes in last commit
```
$ git commit -m "test update" --amend
$ git log          # To visualise the previous commit 
$ git log -p
``` 

## Change previous commit content
- load previous commit: 
```
$ git log                    # to visualise previous commit 
$ git checkout <commit-id>   # to load previous commit 
$ git switch -               # to go back to current state
```

- change a previous commit



## Creat new branch
Remember to always commit changes in a branch before switching branch
```
$ git branch MapTutorial
$ git branch
$ git commit -m "save changes"
$ git switch MapTutorial
```

## Merge branches
```
$ git switch main # go back on main branch
$ git merge -m "Merge map tutorial to main"
```

## Create a repository for your project on GitHub, use:
```
$ gh repo create
```
Can difine `--source` flag and pass a visibility argument (`--public`, `--private`, or `--
internal`). For example, `gh repo create --source=. --public`. Specify a remote with the `--remote` flag. To push your commits, pass the `--push` flag.

## Push an existing GitHub repository from the command line
```
$ git remote add origin https://github.com/RemyDenechere/matlabtuto.git
$ git branch -m main
$ git push -u origin main
```

## Merge branches after finishing working on a branch
```
$ git switch maptutorial
$ git commit -m "commit"
$ git switch main
$ git merge maptutorial # merging maptutorial to main
$ git push -u origin main
$ git branch -d maptutorial # localy remove the branch maptutorial
$ git push origin --delete maptutorial
```

## Tag and release a version:
###  Create a local tag
```
$ git tag
$ git tag 2.0.
$ git tag -a v1.0.0 -m 'Message'
```
After creating a locol tag with the current changes we can push with the associated tag:
```
$ git push -u origin main --tags
```
or to change tag when pushing:
```
$ git push -u origin main -v 2.0.
$ git push -u origin main -v 3.0.
```

# Error:
```
$ git push -u origin maptutorial Enumerating objects: 26, done. Counting objects:
100% (26/26), done. Delta compression using up to 12 threads Compressing objects:
100% (22/22), done. error: RPC failed; HTTP 408 curl 22 The requested URL returned
error: 408 send-pack: unexpected disconnect while reading sideband packet Writing
objects: 100% (23/23), 303.91 MiB | 12.67 MiB/s, done. Total 23 (delta 8), reused 0
(delta 0), pack-reused 0 fatal: the remote end hung up unexpectedly Everything up-to-
date
```
This is due to git/https buffer settings a solution: Run the following command to increase the buffer to 500MB after navigating to the repository:


```
$ git config http.postBuffer 524288000
```


