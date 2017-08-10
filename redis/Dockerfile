#redis

FROM registry.cn-hangzhou.aliyuncs.com/dstack/elasticsearch:latest

#Install Redis
RUN yum -y install redis

#Modify Redis configure file
COPY redis.conf /etc/redis.conf

#VOLUME
VOLUME ["/var/lib/redis"]
#EXPOSE
EXPOSE 6379

#Start Supervisor
COPY supervisord.conf /etc/supervisord.conf
COPY entrypoint.sh /etc/
CMD /etc/entrypoint.sh
