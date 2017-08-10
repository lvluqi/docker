#/bin/bash

chown -R redis:redis /var/lib/redis/ && \
    /usr/bin/supervisord
