# Find large files
sudo find / -xdev -type f -size +100M

#set hostname
sudo hostnamectl set-hostname <given-hostname>

# find current shell process
ps  -ef | grep $$ | grep -v grep
