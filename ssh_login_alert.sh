#!/bin/bash

for i in "${USERID[@]}"
do
URL="https://api.telegram.org/bot1929705654:AAFi7GSnznHX92SmiKjdo4oS8GOYUxiEzPI/sendMessage"
DATE="$(date "+%d %b %Y %H:%M")"

if [ -n "$SSH_CLIENT" ]; then
        CLIENT_IP=$(echo $SSH_CLIENT | awk '{print $1}')

        SRV_HOSTNAME=$(hostname -f)
        SRV_IP=$(hostname -I | awk '{print $1}')

        IPINFO="https://ipinfo.io/${CLIENT_IP}"

        TEXT="Connection from *${CLIENT_IP}* as ${USER} on *${SRV_HOSTNAME}* (*${SRV_IP}*)
        Date: ${DATE}"

        curl -s -d "chat_id=193470719&text=${TEXT}&disable_web_page_preview=true&parse_mode=markdown" $URL > /dev/null
fi
done