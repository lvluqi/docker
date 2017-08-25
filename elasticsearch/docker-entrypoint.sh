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
	for path in \
		/usr/share/elasticsearch/data \
		/usr/share/elasticsearch/logs \
	; do
		chown -R elasticsearch:elasticsearch "$path"
	done
	
	set -- gosu elasticsearch "$@"
	#exec gosu elasticsearch "$BASH_SOURCE" "$@"
fi

cd $ES_WORKDIR && git clone https://github.com/floragunncom/search-guard-ssl.git && cd search-guard-ssl && git checkout es-2.4.1

chmod a+x $ES_WORKDIR/search-guard-ssl/example-pki-scripts/* && sed -i 's/changeit/a4Frs9dtgx92119De/g' $ES_WORKDIR/search-guard-ssl/example-pki-scripts/example.sh

./example.sh chdir chdir=$ES_WORKDIR/search-guard-ssl/example-pki-scripts

cp $ES_WORKDIR/search-guard-ssl/example-pki-scripts/node-0-keystore.jks $ES_CONFIG_DIR && cp $ES_WORKDIR/search-guard-ssl/example-pki-scripts/truststore.jks $ES_CONFIG_DIR

cp $ES_WORKDIR/search-guard-ssl/example-pki-scripts/node-0-keystore.jks $ES_WORKDIR/plugins/search-guard-2/sgconfig && cp $ES_WORKDIR/search-guard-ssl/example-pki-scripts/truststore.jks $ES_WORKDIR/plugins/search-guard-2/sgconfig

mv $ES_WORKDIR/plugins/search-guard-2/sgconfig/node-0-keystore.jks $ES_WORKDIR/plugins/search-guard-2/sgconfig/keystore.jks

exec "$@"
