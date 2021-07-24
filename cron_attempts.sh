#!/bin/bash
#On Ubuntu systems we have to change a ssh verbosity level to catch all attempts in the auth.log - LogLevel VERBOSE from INFO
#set -x
set -euo pipefail 

failed=$(cat /var/log/auth.log | grep "sshd" | grep "Failed" | wc -l)
accepted=$(cat /var/log/auth.log | grep "sshd" | grep "Accepted" | wc -l)
echo `date` " Number of failed ssh logins to date -" ${failed}
echo `date` " Number of accepted ssh logins to date -" ${accepted}
