FROM centos:6.8

WORKDIR /etc/yum.repos.d/
RUN rm -rf * && \
       wget http://mirrors.aliyun.com/Centos-6.repo && \
       wget http://mirrors.aliyun.com/epel-6.repo  && \
       yum -y install supervisor
