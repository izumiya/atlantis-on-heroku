#!/bin/sh

if [ ! -z "$PORT" ] ; then
    sed -i "s/listen 80;/listen ${PORT};/" /etc/nginx/sites-enabled/default
    sed -i "s/127.0.0.1:80/127.0.0.1:${PORT}/" /etc/supervisor/conf.d/oauth2_proxy.conf
fi

exec "$@"