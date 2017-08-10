#/bin/bash

chown -R rabbitmq:rabbitmq /var/lib/rabbitmq && \
      /usr/bin/supervisord
