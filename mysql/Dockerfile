FROM centos
#ENV mysql_root_password=DevStageRedis2C3pQ5rpldkl98
#ENV mysqldb_name=3mjingsocial
#ENV mysqldb_user=3mjingsocial
#ENV mysqldb_password=3mH4eva5pedE2shes

RUN groupadd -r mysql && useradd -r -g mysql mysql

#Install Mysql
RUN rpm -ivh http://dev.mysql.com/get/mysql-community-release-el6-5.noarch.rpm \
        && yum -y install mysql-server --enablerepo=mysql56-community \
        && yum -y install MySQL-python

RUN mkdir /docker-entrypoint-initdb.d

#Configure Mysql
COPY Live-Mysql-Db-Init.sql /docker-entrypoint-initdb.d/

RUN rm -rf /var/lib/mysql && mkdir -p /var/lib/mysql /var/run/mysqld \
      && chown -R mysql:mysql /var/lib/mysql /var/run/mysqld \
      && chmod 777 /var/run/mysqld

#Modify Mysql configure file
COPY my.cnf /etc/my.cnf

VOLUME /var/lib/mysql

#Start Supervisor
COPY docker-entrypoint.sh /usr/local/bin/
RUN ln -s /usr/local/bin/docker-entrypoint.sh /entrypoint.sh
ENTRYPOINT ["docker-entrypoint.sh"]

EXPOSE 3306
CMD ["mysqld"]
