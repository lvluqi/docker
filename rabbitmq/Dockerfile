
#rabbitmq
FROM registry.cn-hangzhou.aliyuncs.com/dstack/centos:latest

ENV RABBITMQ_VERSION 3.5.7
ENV RABBITMQ_CENTOS_VERSION 3.5.7-1

RUN yum -y install erlang logrotate && \
            rpm --import https://www.rabbitmq.com/rabbitmq-signing-key-public.asc && \
            rpm -ivh https://www.rabbitmq.com/releases/rabbitmq-server/v$RABBITMQ_VERSION/rabbitmq-server-${RABBITMQ_CENTOS_VERSION}.noarch.rpm && \
            yum -y install wget && wget https://www.rabbitmq.com/community-plugins/v3.5.x/rabbitmq_delayed_message_exchange-0.0.1-rmq3.5.x-9bf265e4.ez \
            -P /usr/lib/rabbitmq/lib/rabbitmq_server-RABBITMQ_VERSION/plugins/ && \
            ln -s /usr/bin/rabbitmq/bin/rabbitmq-env /usr/sbin/rabbitmq-env && \
            #service rabbitmq-server  start && \
            rabbitmq-plugins enable rabbitmq_delayed_message_exchange && rabbitmq-plugins enable rabbitmq_management
            #rabbitmqctl add_user lvluqi lvluqi &&  rabbitmqctl set_user_tag lvluqi administrator
            #service rabbitmq-server stop

#rabbitmq-env.conf
COPY rabbitmq-env.conf /etc/rabbitmq/rabbitmq-env.conf

VOLUME ["/var/lib/rabbitmq"]
RUN ln -sf /var/lib/rabbitmq/.erlang.cookie /root/
RUN ln -sf /usr/lib/rabbitmq/lib/rabbitmq_server-$RABBITMQ_VERSION/plugins /plugins

#Start RabbitMq
COPY docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh
RUN ln -s /usr/local/bin/docker-entrypoint.sh /entrypoint.sh
#ENTRYPOINT ["entrypoint.sh"]

EXPOSE 15672 25672 4369 5672

CMD /entrypoint.sh rabbitmq-server
