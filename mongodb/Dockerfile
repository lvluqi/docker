#mysql

FROM registry.cn-hangzhou.aliyuncs.com/dstack/centos:latest
#ENV MONGODB_ROOT_USER root
#ENV mongodb_root_password g5drb4pdf2thWs
#ENV mongodb_db_name 3mjingsocial
##ENV mongodb_user 3mjingsocial
#ENV mongodb_password 3m3B4Xq7eUgEjm76

#Install Mongodb
COPY mongodb-org-3.2.repo /etc/yum.repos.d/mongodb-org-3.2.repo
RUN yum -y install mongodb-org && yum -y install pymongo

RUN mkdir /docker-entrypoint-initdb.d/
COPY mongo_db_collection_create.js /docker-entrypoint-initdb.d/
COPY mongo_root_user_create.js /docker-entrypoint-initdb.d/
COPY mongo_user_create.js /docker-entrypoint-initdb.d/

#RUN echo "mongodb hard nofile 64000" >> /etc/security/limits.conf
#RUN echo "mongodb soft nofile 64000" >> /etc/security/limits.conf
#RUN echo "mongodb hard hard nproc 33000" >> /etc/security/limits.conf
#RUN echo "mongodb soft hard nproc 33000" >> /etc/security/limits.conf

#mongodb configure file
COPY mongod.conf /etc/mongod.conf

#vloume
VOLUME ["/var/lib/mongo"]

#EXPOSE
EXPOSE 27017

COPY docker-entrypoint.sh /usr/local/bin
RUN ln -s /usr/local/bin/docker-entrypoint.sh /entrypoint.sh
CMD /entrypoint.sh mongod
#CMD ["/usr/bin/supervisord"]
