#/bin/bash

chown -R elasticsearch:elasticsearch /var/lib/elasticsearch && \
      /usr/bin/supervisord
