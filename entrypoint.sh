#!/bin/sh

if [ -n "$USERNAME" ]; then
	htpasswd -bc /opt/nginx/conf/htpasswd $USERNAME $PASSWORD	
	echo "add new user!"
	addgroup webdavusers -g $GID
	adduser webdavuser -u $UID -G webdavusers -D
	exit 0
fi

echo "username not found"
exit 1
