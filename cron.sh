#!/usr/bin/env bash
# UBUNTU
# https://www.digitalocean.com/community/tutorials/how-to-use-cron-to-automate-tasks-on-a-vps
10 * * * *   /usr/bin/php /var/www/html/ijmewp/submission/tools/runScheduledTasks.php > /var/www/html/ijmewp/submission/scheduledTask.log 2>&1

# CentOS 7
vi /etc/crontab