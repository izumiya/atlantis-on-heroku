#!/bin/sh

if [ -z "$PORT" ] ; then
    sed -i "s/listen 80;/listen ${PORT};/" /etc/nginx/sites-enabled/default
fi

exec "$@"