#!/bin/sh

if [ -n "$USERNAME" ]; then
	htpasswd -bc /opt/nginx/conf/htpasswd $USERNAME $PASSWORD	
	echo "add new user!"
	addgroup -g 1001 davuser
	adduser davuser -u 1001 -G davuser -D
	exit 0
fi

echo "username not found"
exit 1
