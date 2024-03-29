#!/bin/sh
set -e
echo "Starting Web Server"

# Apache gets grumpy about PID files pre-existing
rm -f /usr/local/apache2/logs/httpd.pid

if [ $FAIL -eq 1 ]
then 
    exit 1
fi
exec httpd -DFOREGROUND "$@"
