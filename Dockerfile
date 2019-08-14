FROM runatlantis/atlantis
RUN wget -q -O /etc/apk/keys/sgerrand.rsa.pub https://raw.githubusercontent.com/sgerrand/alpine-pkg-git-crypt/master/sgerrand.rsa.pub \
    && wget https://github.com/sgerrand/alpine-pkg-git-crypt/releases/download/0.6.0-r1/git-crypt-0.6.0-r1.apk \
    && apk add git-crypt-0.6.0-r1.apk \
    && rm -f git-crypt-0.6.0-r1.apk && rm -rf /var/cache/apk/*
RUN { \
    echo '#!/bin/sh'; \
    echo 'atlantis server --port=$PORT'; \
    } > /usr/local/bin/atlantis-server \
    && chmod +x /usr/local/bin/atlantis-server
COPY repos.yaml /repos.yaml
CMD ["atlantis-server"]