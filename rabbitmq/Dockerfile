
#rabbitmq
FROM registry.cn-hangzhou.aliyuncs.com/dstack/centos:latest

RUN yum -y install erlang logrotate && \
            rpm --import https://www.rabbitmq.com/rabbitmq-signing-key-public.asc && \
            rpm -ivh https://www.rabbitmq.com/releases/rabbitmq-server/v3.5.7/rabbitmq-server-3.5.7-1.noarch.rpm && \
            yum -y install wget && wget https://www.rabbitmq.com/community-plugins/v3.5.x/rabbitmq_delayed_message_exchange-0.0.1-rmq3.5.x-9bf265e4.ez \
            -P /usr/lib/rabbitmq/lib/rabbitmq_server-3.5.7/plugins/ && \
            ln -s /usr/bin/rabbitmq/bin/rabbitmq-env /usr/sbin/rabbitmq-env && \
            #service rabbitmq-server  start && \
            rabbitmq-plugins enable rabbitmq_delayed_message_exchange && rabbitmq-plugins enable rabbitmq_management
            #rabbitmqctl add_user lvluqi lvluqi &&  rabbitmqctl set_user_tag lvluqi administrator
            #service rabbitmq-server stop

#rabbitmq-env.conf
COPY rabbitmq-env.conf /etc/rabbitmq/rabbitmq-env.conf

#Delete guest user
#RUN rabbitmqctl delete_user guest

VOLUME ["/var/lib/rabbitmq"]

#Start RabbitMq
COPY docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh
RUN ln -s /usr/local/bin/docker-entrypoint.sh /entrypoint.sh
#ENTRYPOINT ["entrypoint.sh"]

EXPOSE 15672 25672 4369 5672

CMD /entrypoint.sh rabbitmq-server
