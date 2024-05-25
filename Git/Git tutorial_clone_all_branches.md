# Clone all branches of a directory 

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
