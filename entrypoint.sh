#!/bin/sh

if [ -n "$USERNAME" ]; then
	htpasswd -bc /opt/nginx/conf/htpasswd $USERNAME $PASSWORD	
	echo "add new user!"
	addgroup -g $GID davuser
	adduser davuser -u $UID -G davuser -D
	exit 0
fi

echo "environment variables not found"
exit 1
