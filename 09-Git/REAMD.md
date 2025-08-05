## 安装和配置
git init  #initialize a new git repository

git clone <url> #clone and create a local copy of a remote repository

git config --global <settings_name> <value> #configure global git settings

git config --lobal <settings_name> <value>  #configure local git settings for a specific repo



git config --list #show a summary of your git configuration settings

git config --global core.editor "<editor_command>" #set a custom text editor for git messages

git config --global alias.<shortcut> <command>

git config --global color.ui auto #enable automatic colorization of git output

git config --global credential.helper 'cache --timeout=<seconds>'

git config --global core.whitespace <options> #configure git to detect specific types of whitespace errors

git config --global core.whitespace <options> #configure git to detect specific types of whitespace errors

git config --global fetch.prune ture #automatically prune remote-tracking branches when fetching updates

git config --global diff.tool <tool> #set a custom diff tool for git

git config --global merge.tool <tool> #set a custom merge tool for git

git difftool #compare changes using a custom diff tool

git mergetool #resovle merge conflicts with a custom merge tool

# 文件操作
git status #show working tree status

git add <file(s)> #add files to the staging area

git rm <file(s)> #remove from working tree and staging area

git update-index --assume-unchanged <file> #assume a tracked file is unchnaged

git update-index --noassume-unchanged <file> #restore normal behavior of tracking changes

git diff <commit_id1>..<commit_id2> #show diferences between two commits

git rm --cached <file_name> #unstage a file, but keep in the working directory

# 分支和合并
git branch #list all branches

git branch <branch_name> #create a new branch

git checkout <branch_name> #switch to a specific branch

git merge <branch_name> #merge a branch into the current branch

git branch -d <branch_name> #delete a specific branch

git branch -r #list all remote branches

git branch -vv #list branches with additional information

git checkout -b <branch_name> <remote_name>/<remote_branch> #create a new branch based on a remote branch

git merge --abort #cancel merge in case of conflicts

git rebase <branch_name> #rebase the current branch onto another branch

git rebase --abort #cancel an ongoing rebase operation

git rebase -i # interactive rebase for edit, squash, re-order or drop commits

git rebase -i <remote_name>/<remote_branch> #rebase commits in the current branch onto a remote branch interactively


# 远程仓库
git remote #list remote repositories

git remote add <name> <url> #add a remote repository

git ferch <remote_name> #fetch from a remote repository

git pull <remote_name> <remote_branch> #pull changes from a remote branch

git push <remote_name> <local_branch> #push changes to a remote repository

git remote rm <remote_name> # remove a remote repository

git remote show <remote_name> #display information about a specific remote repository


--------------- Advanced -------------------
git remote update #fetch updates from all remote repositories

git push --force <remote_name> <local_branch> #force-push changes to a remote repository, overwriting remote history

git push --tags <remote_name> #push all tags to a remote repository

git remote rename <old_name> <new_name> #rename a remote repository

git remote set-url <name> <new_url> #change the url of a remote repository

git remote prune <remote_name> #remove stale reote-traching branches

git branch -r --merged #list all remote branches that have been merged into the current branch

git branch -r --no-merged #list all remote branches not yet merged into the current branch

git fetch -p #fetch updates from a remote  repository andprune obsolete remote-tracking branches

git branch --track <branch_name> <remote_name>/<remote_branch> #track a remote branch and set up the local branch to automatically sync with it

git branch -u <remote_name>/<remote_branch> #set an existing local branch to track a remote branch

git push -u <remote_name> <local_branch> #push a branch to a remote repository and set it to track the remote branch

git branch --unset-upstream <branch_name> #remove the tracking association between a local and a remote branch

# 提交历史
git log #show commit history

git log --oneline #display a condensed commit history

git log --graph #show branching commit history

git log --author=<author_name> #filter commit history by author

git log --since=<date> #show commit history since specific date

git log --until=<date> #show commit history until specific date

# 标签
git tag #list all tags

git tag <tag_name> -m "tag message" #create a new tag at a specific commit

git tag -a <tag_name> -m "tag message" #create an annotated tag with a message

git tag -d <tag_name> #delete a specific tag

git push <remote_name> --delete <tag_name>  #delete a specific remote tag

git show <tag_name> #show information about a specific tag

# 储藏

# cherry-picking
git check-pick <commit_id> #apply a specific commit from one branch to another

# 提交管理
git commit --amend #modify the latest commit

git revert <commit_id> #create a new commit that undoes changes from a previous commit

git reset --hard <commit_id> #discard chages and move HEAD to a specific commit

git reset --soft <commit_id> #move HEAD to a specific commit, but preserve staged changes

git reflog #show a record of all changes made to the local repository head

# 技巧
git add -p #interactively choose parts (hunks) of files to stage

git log -p <file_name> #show the commit history and associated patches for a specific file

git log --pretty=format:"%h - %an, %ar : %s" #customiza the format of git log output

git log --grep="<text>" #find text in commit messages (uneful for locating specific changes)

git diff --stat #quickly view the changes in the working directory since the last commit

git log --online --decorate --graph #display the branch history with decoration to see where branch have split or merged

git stash save -u #stash changes in the working tree, including untracked files

git commit --aloow-empty -m "empty commit message"

git config --global core.pager 'less -RFX' #set the git output pager to quit when the output is less than one screen, and not clear the screen after displaying

git config --global help.autocorrect 1 #use git's auto-correct feature to fix mistyped commands

git config --get-regexp alias #list aliases for git commands

git merge --no-commit --no-ff <branch_name> #perform a dry run of merging without actually merging branches

git ls-tree --name-only -r -t HEAD #Show a tree-like representation of the repo's structure