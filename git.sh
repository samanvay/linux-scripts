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

#openchs_repos = openchs-client openchs-server infra rules-config openchs-reporting lbp-arogyadoot ashwini calcutta-kids tt-ncd-screening sewa-rural jss unicef-moha kalap auth
#define _git_multiple
#	@for repo in $(openchs_repos) ; do \
#		echo $$repo ; \
#		git --git-dir=/Users/vsingh/Projects/samanvay/openchs/$$repo/.git --work-tree=/Users/vsingh/Projects/samanvay/openchs/$$repo $1 ; \
#	done
#endef
#
#openchs_status_all:
#	$(call _git_multiple,status -s)
#
#openchs_overwrite_from_repo:
#	$(call _git_multiple,checkout .)
#
#openchs_switch_to_master:
#	$(call _git_multiple,checkout master)
#
#openchs_pull_all:
#	$(call _git_multiple,pull)
#
#openchs_commit_stat:
#	@for repo in $(openchs_repos) ; do \
#		echo $$repo ; \
#		git --git-dir=/Users/vsingh/Projects/samanvay/openchs/$$repo/.git --work-tree=/Users/vsingh/Projects/samanvay/openchs/$$repo shortlog -s master@{$(from)}...master@{$(to)} ; \
#	done
