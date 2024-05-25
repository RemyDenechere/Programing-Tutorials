---
title: "Tuturial config git and github"
output: pdf_document
---

# Tuturial config git and github
--- 

## Git configuration
### Global level
#### Basic configuration
```
git config --global user.name "Rémy Denéchère"
git config --global user.email "remy.denechere@gmail.com"
git config --global init.default branch main 
```

#### Define colors for the output: 
```
git config --global color.ui true
git config --global color.branch.current blue
git config --global color.branch.local green
```

## Creat a Personal access token 
GitHub requers "Personal access token" for identification from git instead of using username and passwords. To configure the personal access token: 
1. Go on github website under `settings/Developer settings/Personal access token/Generate a personal access token` 
2. Set up expiration date
3. Note: "my-token"
4. Select: repro, workflow, write:packages, and delete:packages. 
5. Generate token

After generating the token, copy it in a file on your machine: 
```
cd ~
nano git-token
```
copy and past your token. 


