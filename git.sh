#try changing the order of branches in the next command to see the diff
git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr)%Creset' --abbrev-commit --date=relative master..branch-X

git checkout -b newLocalBranch remoteName/remoteBranch

git branch nhsrc-feb-release 50b5aedf993a5c515ecf6af12612432ac93bdad1
git checkout nhsrc-feb-release
git push -u origin nhsrc-feb-release
