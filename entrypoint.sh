#/bin/bash

chown -R nginx:nginx /usr/share/nginx/html && \
       /usr/bin/supervisord
