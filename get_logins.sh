#!/bin/bash


#Count of each user login
echo "Table with all users login numbers"
cat /var/log/auth.log* | zgrep 'of user' | awk '{print $NF}' | sort |  uniq -c | grep '\.' | sort -h

#Count number of failed login
echo Number of failed logins is
zgrep "authentication failure" /var/log/auth.log* | awk '/sudo:auth/ || /su:auth/ || /gdm-password:auth/|| /login:auth/' | awk  '{print $NF}' | sort | uniq -c


#Count number of login with sudo
sudo_att=$(cat /var/log/auth.log* | zgrep 'sudo:session' | wc -l)
echo "Number of sudo attempts is" "$sudo_att"



