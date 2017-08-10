#mysql

FROM registry.cn-hangzhou.aliyuncs.com/dstack/elasticsearch:latest
#ENV mysql_root_password=DevStageRedis2C3pQ5rpldkl98
#ENV mysqldb_name=3mjingsocial
#ENV mysqldb_user=3mjingsocial
#ENV mysqldb_password=3mH4eva5pedE2shes

#Install Mysql
RUN rpm -ivh http://dev.mysql.com/get/mysql-community-release-el6-5.noarch.rpm
RUN yum -y install mysql-server --enablerepo=mysql56-community
RUN yum -y install MySQL-python

#Configure Mysql
COPY Live-Mysql-Db-Init.sql /root/

#Modify Mysql configure file
COPY my.cnf /etc/my.cnf

#EXPOSE
EXPOSE 3306

#Start Supervisor
COPY supervisord.conf /etc/supervisord.conf
COPY entrypoint.sh /etc/
CMD /etc/entrypoint.sh
