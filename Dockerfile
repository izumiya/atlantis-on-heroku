# The izumiya/atlantis-base is created by docker-base/Dockerfile.
FROM izumiya/atlantis-base:latest

RUN apk add --update supervisor && rm -rf /tmp/* /var/cache/apk/*
COPY docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh

# supervisord
COPY supervisord.conf /etc/
# nginx
COPY nginx/configs /etc/nginx
COPY nginx/supervisor.conf /etc/supervisor/conf.d/nginx.conf
# atlantis
COPY atlantis/repos.yaml /etc/atlantis/repos.yaml
COPY atlantis/supervisor.conf /etc/supervisor/conf.d/atlantis.conf
# oauth2_proxy
COPY oauth2_proxy/supervisor.conf /etc/supervisor/conf.d/oauth2_proxy.conf

EXPOSE 80
ENTRYPOINT [ "docker-entrypoint.sh" ]
CMD [ "supervisord", "--nodaemon", "--configuration", "/etc/supervisord.conf" ]
