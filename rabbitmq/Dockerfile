
#rabbitmq
FROM registry.cn-hangzhou.aliyuncs.com/dstack/elasticsearch:latest

RUN yum -y install erlang logrotate && \
            rpm --import https://www.rabbitmq.com/rabbitmq-signing-key-public.asc && \
            rpm -ivh https://www.rabbitmq.com/releases/rabbitmq-server/v3.5.7/rabbitmq-server-3.5.7-1.noarch.rpm && \
            yum -y install wget && wget https://www.rabbitmq.com/community-plugins/v3.5.x/rabbitmq_delayed_message_exchange-0.0.1-rmq3.5.x-9bf265e4.ez \
            -P /usr/lib/rabbitmq/lib/rabbitmq_server-3.5.7/plugins/ && \
            ln -s /usr/bin/rabbitmq/bin/rabbitmq-env /usr/sbin/rabbitmq-env && \
            service rabbitmq-server  start && \
            rabbitmq-plugins enable rabbitmq_delayed_message_exchange && rabbitmq-plugins enable rabbitmq_management && \
            /usr/sbin/rabbitmqctl add_user lvluqi lvluqi && /usr/sbin/rabbitmqctl set_user_tags lvluqi monitoring && service rabbitmq-server stop

#rabbitmq-env.conf
COPY rabbitmq-env.conf /etc/rabbitmq/rabbitmq-env.conf

#Delete guest user
#RUN rabbitmqctl delete_user guest

VOLUME ["/var/lib/rabbitmq"]

#EXPOSE
EXPOSE 15672 25672 4369 5672

#Start RabbitMq
COPY supervisord.conf /etc/supervisord.conf
COPY entrypoint.sh /etc/
CMD /etc/entrypoint.sh
