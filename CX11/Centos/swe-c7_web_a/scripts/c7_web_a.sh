#!/bin/bash
MYSQL_ROOT_PASSWORD="Qwerty.123"
MYSQL_DEMO_DB_NAME="demodb"
MYSQL_DEMO_DB_USER="demodbuser"
MYSQL_DEMO_DB_PSWD="demodbpass"
MYSQL_DB_AREA="localhost"
PHP_VERSION="56w"

#############################[ base system ]####################################
yum update &> /dev/null
yum install -y mc htop git net-tools.x86_64 bind-utils iptables-services ntp vimepel-release iftop atop lsof wget bzip2 traceroute gdisk &> /dev/null
setenforce 0 &> /dev/null
sed -i 's/SELINUX=enforcing/SELINUX=disabled/g' /etc/sysconfig/selinux

systemctl stop firewalld &> /dev/null
systemctl disable firewalld &> /dev/null
systemctl enable iptables &> /dev/null

export IPT="/usr/sbin/iptables"
$IPT -F
$IPT -F -t nat
$IPT -F -t mangle
$IPT -X
$IPT -t nat -X
$IPT -t mangle -X
iptables -I INPUT -p tcp --dport 80 -j ACCEPT
service iptables save &> /dev/null

/usr/sbin/ntpdate pool.ntp.org &> /dev/null
systemctl start ntpd &> /dev/null
systemctl enable ntpd &> /dev/null

timedatectl set-timezone Europe/Moscow
localectl set-locale LANG=en_GB.utf8

#############################[ web server ]####################################

yum install -y httpd &> /dev/null
systemctl enable httpd &> /dev/null
systemctl start httpd &> /dev/null

rm -rf /var/www/*
mkdir -p /etc/httpd/sites-avialable
mkdir -p /etc/httpd/sites-enable
sed -i 's/DocumentRoot/#DocumentRoot/g' /etc/httpd/conf/httpd.conf
echo 'DocumentRoot "/var/www"' >> /etc/httpd/conf/httpd.conf
echo "IncludeOptional sites-enable/*.conf" >> /etc/httpd/conf/httpd.conf
mkdir -p /var/www/demo

#################################### [PHP] ####################################

rpm -Uvh https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm  &> /dev/null
rpm -Uvh https://mirror.webtatic.com/yum/el7/webtatic-release.rpm  &> /dev/null
yum install -y php"$PHP_VERSION"  php"$PHP_VERSION"-common php"$PHP_VERSION"-mysql php"$PHP_VERSION"-mbstring php"$PHP_VERSION"-mcrypt php"$PHP_VERSION"-devel php"$PHP_VERSION"-xml php"$PHP_VERSION"-gd  php"$PHP_VERSION"-intl php"$PHP_VERSION"-pear  &> /dev/null

#################################### [ MYSQL SERVER ] ####################################
yum install -y mariadb mariadb-server &> /dev/null
systemctl enable mariadb.service &> /dev/null
systemctl start mariadb &> /dev/null
mysqladmin -u root password "$MYSQL_ROOT_PASSWORD"

mysql -u root -p$MYSQL_ROOT_PASSWORD -e "CREATE DATABASE $MYSQL_DEMO_DB_NAME DEFAULT CHARACTER SET utf8 DEFAULT COLLATE utf8_general_ci;" &> /dev/null
mysql -u root -p$MYSQL_ROOT_PASSWORD -e "CREATE USER $MYSQL_DEMO_DB_USER@$MYSQL_DB_AREA IDENTIFIED BY '$MYSQL_DEMO_DB_PSWD' ;" &> /dev/null
mysql -u root -p$MYSQL_ROOT_PASSWORD -e "GRANT ALL PRIVILEGES ON $MYSQL_DEMO_DB_NAME.* TO $MYSQL_DEMO_DB_USER@$MYSQL_DB_AREA ;" &> /dev/null


