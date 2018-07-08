#!/bin/bash

MYSQL_ROOT_PASSWORD="Qwerty.123"
MYSQL_DEMO_DB_NAME="demodb"
MYSQL_DEMO_DB_USER="demodbuser"
MYSQL_DEMO_DB_PSWD="demodbpass"
MYSQL_DB_AREA="localhost"
PHP_VERSION="7.2"

apt-get update &> /dev/null
	# installing ops components
apt-get install -yq htop mc vim curl wget python-software-properties iptraf &> /dev/null

	#configure time zone 
echo "tzdata tzdata/Areas select Europe" > /tmp/timezone
echo "tzdata tzdata/Zones/Europe select Moscow" >> /tmp/timezone
debconf-set-selections /tmp/timezone &> /dev/null
rm /etc/timezone
rm /etc/localtime
dpkg-reconfigure -f noninteractive tzdata &> /dev/null

	#configure locales 
sed -i '/^#.* ru_RU.UTF-8 /s/^#//' /etc/locale.gen
locale-gen &> /dev/null

	#install and configure mysql 
echo "mysql-server mysql-server/root_password password $MYSQL_ROOT_PASSWORD" | sudo debconf-set-selections
echo "mysql-server mysql-server/root_password_again password $MYSQL_ROOT_PASSWORD" | sudo debconf-set-selections
apt-get install -y mysql-server &> /dev/null

mysql -u root -p$MYSQL_ROOT_PASSWORD -e "CREATE DATABASE $MYSQL_DEMO_DB_NAME DEFAULT CHARACTER SET utf8 DEFAULT COLLATE utf8_general_ci;" &> /dev/null
mysql -u root -p$MYSQL_ROOT_PASSWORD -e "CREATE USER $MYSQL_DEMO_DB_USER@$MYSQL_DB_AREA IDENTIFIED BY '$MYSQL_DEMO_DB_PSWD' ;" &> /dev/null
mysql -u root -p$MYSQL_ROOT_PASSWORD -e "GRANT ALL PRIVILEGES ON $MYSQL_DEMO_DB_NAME.* TO $MYSQL_DEMO_DB_USER@$MYSQL_DB_AREA ;" &> /dev/null

	# install and configure web server
apt-get install -y apache2 &> /dev/null
chown -R www-data. /var/www
usermod -a -G www-data ubuntu

	#install php 7.2 
add-apt-repository -y ppa:ondrej/php &> /dev/null
apt-get update &> /dev/null
	#l will be installed:
	#	ibargon2-0 
	#	libsodium23 
	#	libssl1.1 
	#	php-common 
	#	php 7.2 
	#	php 7.2-cli 
	#	php 7.2-common 
	#	php 7.2-fpm 
	#	php 7.2-json
	#	php 7.2-opcache
	#	php 7.2-readline
apt-get install -yq php$PHP_VERSION  &> /dev/null

	#install aditional php packages
apt-get install -yq php-pear php$PHP_VERSION-curl php$PHP_VERSION-dev php$PHP_VERSION-gd php$PHP_VERSION-mbstring php$PHP_VERSION-zip php$PHP_VERSION-mysql php$PHP_VERSION-xml &> /dev/null
 