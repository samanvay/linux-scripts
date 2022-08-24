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
