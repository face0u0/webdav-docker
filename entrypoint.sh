#!/bin/sh

if [ -n "$USERNAME" ]; then
	htpasswd -bc /opt/nginx/conf/htpasswd $USERNAME $PASSWORD	
	echo "add new user!"
	exit 0
fi

echo "username not found"
exit 1
