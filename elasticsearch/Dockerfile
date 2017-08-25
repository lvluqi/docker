#elasticsearch

FROM registry.cn-hangzhou.aliyuncs.com/dstack/centos:latest

#elasticsearch rpm package
RUN rpm -ivh ftp://biguser:www%2Ejb51%2Enet@big.jb51.net:8021/201704/tools/jdk-linux-x64.rpm

#Java Env
RUN echo "JAVA_HOME=/usr/java/jdk1.8.0_131" >> /etc/profile
RUN echo "CLASS_PATH=$JAVA_HOME/lib:$JAVA_HOME/jre/lib">> /etc/profile
RUN echo "PATH=$PATH:$JAVA_HOME/bin">> /etc/profile
RUN echo "export JAVA_HOME">> /etc/profile
RUN source /etc/profile

#Install Elasticsearch Package
RUN rpm --import https://packages.elastic.co/GPG-KEY-elasticsearch
RUN rpm -ivh https://download.elastic.co/elasticsearch/release/org/elasticsearch/distribution/rpm/elasticsearch/2.4.1/elasticsearch-2.4.1.rpm

#Elasticsearch Configure File
COPY elasticsearch.yml /etc/elasticsearch/elasticsearch.yml
RUN chown root.elasticsearch /etc/elasticsearch/elasticsearch.yml

#Install Plugh
WORKDIR /usr/share/elasticsearch
RUN ./bin/plugin install lmenezes/elasticsearch-kopf
ADD ik.zip ./plugins/
COPY search-guard-2.tar.gz ./plugins
COPY search-guard-ssl.tar.gz ./plugins
#RUN ./bin/plugin install com.floragunn/search-guard-2/2.4.1.12
#RUN ./bin/plugin install com.floragunn/search-guard-ssl/2.4.1.21
RUN yum -y install git

ENV PATH /usr/share/elasticsearch/bin:$PATH

RUN echo "ES_HEAP_SIZE=4g" /etc/sysconfig/elasticsearch

RUN mkdir /opt/backups/jingsocial/ -p

#VOLUME
VOLUME ["/var/lib/elasticsearch"]

#EXPOSE
EXPOSE 9200 9300

#Start elasticsearch
COPY docker-entryporint.sh /usr/local/bin/
RUN ln -s /usr/local/bin/docker-entrypoint.sh /entrypoint.sh
CMD /entryporint.sh elasticsearch
