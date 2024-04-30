# commands to push code to git without cloning the repository
```
git init
```
 git add .
```
  git status
```
git commit -m "terraform loadbalanc
  ```
git checkout -b terralb
```
  git branch
  # command to check push file size in human readable format 
  git ls-tree -r --name-only HEAD | xargs -I {} git cat-file -s HEAD:{} | awk '{total += $1} END {mb = total / 1024 / 1024; printf "%.2f MB\n", mb}'
   ```
git remote add origin https://github.com/Jayantikri/terraform.git
  ```
git push origin terralb
```
git log (to check logs)
```
git reset commit id  (to reset commits)
```
du -sh * (to check file size individually)
