#elasticsearch

FROM registry.cn-hangzhou.aliyuncs.com/dstack/centos:latest

#elasticsearch rpm package
RUN rpm -ivh ftp://biguser:www%2Ejb51%2Enet@big.jb51.net:8021/201704/tools/jdk-linux-x64.rpm

ENV ES_DIR /usr/share/elasticsearch
ENV ES_CONFIG_DIR /etc/elasticsearch
ENV ES_WORKDIR /usr/share/elasticsearch/plugins

#Install Elasticsearch Package
RUN rpm --import https://packages.elastic.co/GPG-KEY-elasticsearch
RUN rpm -ivh https://download.elastic.co/elasticsearch/release/org/elasticsearch/distribution/rpm/elasticsearch/2.4.1/elasticsearch-2.4.1.rpm

#Elasticsearch Configure File
COPY elasticsearch.yml /etc/elasticsearch/elasticsearch.yml
RUN chown root.elasticsearch /etc/elasticsearch/elasticsearch.yml

#Install Plugh
WORKDIR /usr/share/elasticsearch/
RUN ./bin/plugin install lmenezes/elasticsearch-kopf && ./bin/plugin install -b com.floragunn/search-guard-ssl/2.4.1.21 &&  ./bin/plugin install -b com.floragunn/search-guard-2/2.4.1.12
RUN git clone https://github.com/floragunncom/search-guard-ssl.git && cd search-guard-ssl && git checkout es-2.4.1
ADD ik.tar.gz ./plugins/

RUN yum -y install git

ENV PATH /usr/share/elasticsearch/bin:$PATH

RUN echo "ES_HEAP_SIZE=4g" /etc/sysconfig/elasticsearch
        
RUN mkdir /opt/backups/jingsocial/ -p && mkdir /docker-init.d/
ADD config.tar.gz /docker-init.d/
ADD sg.tar.gz /usr/share/elasticsearch/plugins/search-guard-2/sgconfig/

#VOLUME
VOLUME ["/var/lib/elasticsearch"]

#EXPOSE
EXPOSE 9200 9300

#Start elasticsearch
COPY docker-entrypoint.sh /usr/local/bin/
RUN ln -s /usr/local/bin/docker-entrypoint.sh /entrypoint.sh
CMD /entryporint.sh elasticsearch
