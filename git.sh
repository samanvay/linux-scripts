#try changing the order of branches in the next command to see the diff
git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr)%Creset' --abbrev-commit --date=relative master..branch-X

git checkout -b newLocalBranch remoteName/remoteBranch

# UseCase: Create a branch from a commit and push to remote
git checkout -b nhsrc-feb-release  50b5aedf993a5c515ecf6af12612432ac93bdad1
git push -u origin nhsrc-feb-release


#Useful during pull requests
git checkout -b new-branch-name origin/tracking-branch-name
git branch --unset-upstream
git push -u origin xss-bug-fixes # push to new remote branch

#tag
git tag -a v3.17.4
git push origin v3.17.4
## latest remote branch
for branch in `git branch -r | grep -v HEAD`;do echo -e `git show --format="%ci %cr" $branch | head -n 1` \\t$branch; done | sort -r

#pull another branch without switching
git fetch origin master:master
