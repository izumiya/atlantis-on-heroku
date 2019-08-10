FROM runatlantis/atlantis
RUN { \
    echo '#!/bin/sh'; \
    echo 'atlantis server --port=$PORT'; \
    } > /usr/local/bin/atlantis-server \
    && chmod +x /usr/local/bin/atlantis-server
COPY repos.yaml /repos.yaml
CMD ["atlantis-server"]