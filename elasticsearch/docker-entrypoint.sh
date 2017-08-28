#!/bin/bash

set -e

# Add elasticsearch as command if needed
if [ "${1:0:1}" = '-' ]; then
	set -- elasticsearch "$@"
fi

# Drop root privileges if we are running elasticsearch
# allow the container to be started with `--user`
if [ "$1" = 'elasticsearch' -a "$(id -u)" = '0' ]; then
	# Change the ownership of user-mutable directories to elasticsearch
  [ $? -eq 0 ] && cat >> /etc/profile <<-EOF
JAVA_HOME=/usr/java/jdk1.8.0_131
CLASS_PATH=$JAVA_HOME/lib:$JAVA_HOME/jre/lib
PATH=$PATH:$JAVA_HOME/bin
export JAVA_HOME
EOF
  if [ -d "$ES_DIR/search-guard-ssl" ];then
     cd $ES_DIR && git clone https://github.com/floragunncom/search-guard-ssl.git && cd search-guard-ssl && git checkout es-2.4.1

     chmod a+x $ES_DIR/search-guard-ssl/example-pki-scripts/* && sed -i 's/changeit/a4Frs9dtgx92119De/g' $ES_DIR/search-guard-ssl/example-pki-scripts/example.sh

     cd $ES_DIR/search-guard-ssl/example-pki-scripts && ./example.sh

     cp $ES_DIR/search-guard-ssl/example-pki-scripts/node-0-keystore.jks $ES_CONFIG_DIR && cp $ES_DIR/search-guard-ssl/example-pki-scripts/truststore.jks $ES_CONFIG_DIR

     cp $ES_DIR/search-guard-ssl/example-pki-scripts/node-0-keystore.jks $ES_WORKDIR/search-guard-2/sgconfig && cp $ES_DIR/search-guard-ssl/example-pki-scripts/truststore.jks $ES_WORKDIR/search-guard-2/sgconfig

     mv $ES_WORKDIR/search-guard-2/sgconfig/node-0-keystore.jks $ES_WORKDIR/search-guard-2/sgconfig/keystore.jks
     /etc/init.d/elasticsearch start && \
     chmod +x $ES_WORKDIR/search-guard-2/tools/* && $ES_WORKDIR/search-guard-2/tools/sgadmin.sh -cd $ES_DIR/plugins/search-guard-2/sgconfig/ -ks $ES_DIR/plugins/search-guard-2/sgconfig/keystore.jks -kspass a4Frs9dtgx92119De -ts $ES_DIR/plugins/search-guard-2/sgconfig/truststore.jks -tspass a4Frs9dtgx92119De -nhnv --diagnose -icl -hlocalhost
     [ $? -eq 0 ] && curl -XPOST 'http://admin:V8R4i5HsN85K8EFm@localhost:9200/mmmjingsocial_default_index' -d @/docker-init.d/es.init.standard.mappings.json && \
          curl -XPOST 'http://admin:V8R4i5HsN85K8EFm@localhost:9200/mmmjingsocial_top_keyword_messages' -d @/docker-init.d/es.init.ik_message.mappings.json
     [ $? -eq 0 ] && /etc/init.d/elasticsearch stop && echo "JAVA_OPTS=\"\$JAVA_OPTS -Des.default.path.conf=$ES_CONFIG_DIR\"" >> $ES_DIR/bin/elasticsearch.in.sh && echo "JAVA_OPTS=\"\$JAVA_OPTS -Des.insecure.allow.root=true\"" >> $ES_DIR/bin/elasticsearch.in.sh
     [ $? -eq 0 ] && cd && rm -rf $ES_DIR/search-guard-ssl
  fi
     ln -s /etc/elasticsearch/ $ES_DIR/config && ln -s /var/lib/elasticsearch $ES_DIR/data && ln -s /var/lib/elasticsearch $ES_DIR/logs
	for path in \
		/usr/share/elasticsearch/data \
		/usr/share/elasticsearch/logs \
                /usr/share/elasticsearch/config \
	; do
		chown -R elasticsearch:elasticsearch "$path"
	done
fi
exec "$@"
