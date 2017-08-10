#/bin/bash
#set -e

chown -R mongod:mongod /var/lib/mongo/  && \
      /usr/bin/supervisord
