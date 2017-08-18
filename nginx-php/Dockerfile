
FROM registry.cn-hangzhou.aliyuncs.com/dstack/centos:latest
#init
COPY remi.repo /etc/yum.repos.d/remi.repo
COPY RPM-GPG-KEY-remi /etc/pki/rpm-gpg/RPM-GPG-KEY-remi

#Nginx
RUN yum -y install nginx
COPY default.conf /etc/nginx/conf.d/default.conf
COPY php.conf /etc/nginx/default.d/php.conf
COPY index.php /usr/share/nginx/html/index.php
RUN mkdir /etc/nginx/sites-available

#PHP55
RUN yum -y install php php-zts php-fpm php-xml php-pdo php-mbstring php-gd php-pecl-imagick php-pecl-mongo php-pecl-redis php-bcmath php-mcrypt php-soap php-devel php-mysqlnd php-amqp php-pecl-yaf php-pear

#Install PHP-plu Mongodb
RUN yum -y install gcc gcc-c++ openssl openssl-devel
RUN pecl channel-update pecl.php.net
RUN pecl install mongodb

#Backup php-fpm Configure
COPY php.ini /etc/php.ini
RUN cp /etc/php-fpm.d/www.conf /etc/php-fpm.d/www.conf.backup

#PHP and PHP-mongodb configure
COPY www.conf /etc/php-fpm.d/www.conf
COPY mongodb.ini /etc/php.d/mongodb.ini

#Install ffmpeg
RUN rpm -ivh http://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm
RUN rpm -ivh http://download1.rpmfusion.org/free/el/updates/6/i386/rpmfusion-free-release-6-1.noarch.rpm
RUN yum -y install ffmpeg xorg-x11-fonts-75dpi xorg-x11-fonts-Type1 wqy-zenhei-fonts

#wxhtmlpdf
COPY wkhtmltox-0.12.2.1_linux-centos6-amd64.rpm /tmp/
RUN rpm -ivh /tmp/wkhtmltox-0.12.2.1_linux-centos6-amd64.rpm
RUN rm -f /tmp/wkhtmltox-0.12.2.1_linux-centos6-amd64.rpm

#VOLUME
VOLUME ["/usr/share/nginx/html"]
#EXPOSE
EXPOSE 80

#Start Nginx and Php-fpm
#RUN yum -y install supervisor
COPY entrypoint.sh /etc/
COPY supervisord.conf /etc/supervisord.conf
CMD /etc/entrypoint.sh
