#/bin/bash

chown -R rabbitmq:rabbitmq /var/lib/rabbitmq && \ 
      /usr/bin/supervisord && \
      rabbitmqctl add_user lvluqi lvluqi && /usr/sbin/rabbitmqctl set_user_tags lvluqi administrator
