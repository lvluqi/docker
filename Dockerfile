FROM centos:6.8

WORKDIR /etc/yum.repos.d/
RUN yum -y install wget && \
       rm -rf * && \
       wget http://mirrors.aliyun.com/repo/Centos-6.repo && \
       wget http://mirrors.aliyun.com/repo/epel-6.repo
WORKDIR /root

RUN rm -rf *
