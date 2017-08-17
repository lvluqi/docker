#mysql

FROM registry.cn-hangzhou.aliyuncs.com/dstack/elasticsearch:latest
#ENV MONGODB_ROOT_USER root
#ENV mongodb_root_password g5drb4pdf2thWs
#ENV mongodb_db_name 3mjingsocial
##ENV mongodb_user 3mjingsocial
#ENV mongodb_password 3m3B4Xq7eUgEjm76

#Install Mongodb
COPY mongodb-org-3.2.repo /etc/yum.repos.d/mongodb-org-3.2.repo
RUN yum -y install mongodb-org && yum -y install pymongo

#RUN echo "mongodb hard nofile 64000" >> /etc/security/limits.conf
#RUN echo "mongodb soft nofile 64000" >> /etc/security/limits.conf
#RUN echo "mongodb hard hard nproc 33000" >> /etc/security/limits.conf
#RUN echo "mongodb soft hard nproc 33000" >> /etc/security/limits.conf

#mongodb configure file
COPY mongod.conf /etc/mongod.conf

#mongodb start
#RUN /etc/init.d/mongod restart

#ADD user
COPY mongo_root_user_create.js /root/
COPY mongo_db_collection_create.js /root/
COPY mongo_user_create.js /root/

#vloume
VOLUME ["/var/lib/mongo"]

#EXPOSE
EXPOSE 27017

#Start Supervisor
#COPY supervisord.conf /etc/supervisord.conf
COPY entrypoint.sh /etc/
CMD /etc/entrypoint.sh
#CMD ["/usr/bin/supervisord"]
