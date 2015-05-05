#!/bin/sh

trap "shut_down" HUP INT QUIT KILL TERM

shut_down(){  
ziproxy -p /tmp/ziproxy.pid -k

}

if [ -z "$PASSWORD" ];
then
	PASSWORD=$(pwgen -1)
fi

echo "user:$PASSWORD" > /etc/ziproxy/http.passwd

echo "User: user, password: $PASSWORD"

ziproxy -p /tmp/ziproxy.pid -d > /dev/null

echo "[hit enter key to exit] or run 'docker stop <container>'"
read _

shut_down

echo "exited $0"

