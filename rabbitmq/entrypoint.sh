#/bin/bash

chown -R rabbitmq:rabbitmq /var/lib/rabbitmq && \
      rabbitmqctl add_user lvluqi lvluqi && /usr/sbin/rabbitmqctl set_user_tags lvluqi monitoring && \
      /usr/bin/supervisord
