#redis

FROM registry.cn-hangzhou.aliyuncs.com/dstack/elasticsearch:latest 

#Install Redis
RUN yum -y install redis

#Modify Redis configure file
COPY redis.conf /etc/redis.conf

#VOLUME
VOLUME ["/var/lib/redis"]

COPY entrypoint.sh /usr/local/bin
ENTRYPOINT ["entrypoint.sh"]

EXPOSE 6379

CMD ["redis-server"]
