#/bin/bash

chown -R mysql:mysql /var/lib/mysql && \
      /usr/bin/supervisord
