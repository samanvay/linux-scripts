#try changing the order of branches in the next command to see the diff
git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr)%Creset' --abbrev-commit --date=relative master..branch-X

git checkout -b newLocalBranch remoteName/remoteBranch