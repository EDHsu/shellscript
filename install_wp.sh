#!/bin/sh

### Install lamp stack on ubuntu 14.04
echo "$(tput setaf 1)Install LAMP stack on Ubuntu 14.04...$(tput sgr0)"

# Update the repositories
sudo apt-get update

# Install apache2
sudo apt-get -y install apache2

# Install mysql server in a non-interactive mode. default root password will be "root"
echo "mysql-server mysql-server/root_password password root" | sudo debconf-set-selections
echo "mysql-server mysql-server/root_password_again password root" | sudo debconf-set-selections
sudo apt-get install -y mysql-server
sudo apt-get install -y php5-mysql

#sudo mysql_secure_installation

# Install php5
sudo apt-get install -y php5 libapache2-mod-php5 php5-mcrypt

# Create a new "dir.conf" under root dictionary
cd
touch dir.conf

# Edit new "dir.conf"
cat > dir.conf <<EOF
<IfModule mod_dir.c>
    DirectoryIndex index.php index.html index.cgi index.pl index.xhtml index.htm
</IfModule>
EOF

# Delete original "dir.conf" in /etc/apache2/mods-available/
sudo rm /etc/apache2/mods-available/dir.conf

# Copy new "dir.conf" to /etc/apache2/mods-available/
sudo cp dir.conf /etc/apache2/mods-available/
rm dir.conf

# Restart apache2
sudo service apache2 restart

# Install php modules
sudo apt-get install php5-cli

# Test php processing on web server
touch info.php

# Edit new "info.php"
cat > info.php <<EOF
<?php
phpinfo();
?>
EOF

# Copy
sudo cp info.php /var/www/html/
rm info.php


### Create a mysql database and dbuser for wordpress
echo "$(tput setaf 1)Create a MySQL Database and User for WordPress$(tput sgr0)"

# Setup first
root_user=root
root_ps=root

wp_db_name=wp
wp_db_host=localhost
wp_db_user=wpuser
wp_db_user_host=wpuser@localhost
wp_db_user_ps=demo

# Create database of wordpress, user and password
mysql --user="$root_user" --password="$root_ps" --execute="CREATE DATABASE $wp_db_name;"
mysql --user="$root_user" --password="$root_ps" --execute="CREATE USER $wp_db_user_host IDENTIFIED BY '$wp_db_user_ps';"

# Fix that by granting our user account access to our database with this command
mysql --user="$root_user" --password="$root_ps" --execute="GRANT ALL PRIVILEGES ON $wp_db_name.* TO $wp_db_user_host;"

# Now the user has access to the database. We need to flush the privileges so that the current instance of MySQL knows about the recent privilege changes we've made
mysql --user="$root_user" --password="$root_ps" --execute="FLUSH PRIVILEGES;"


### Download Wordpress
echo "$(tput setaf 1)Download Wordpress...$(tput sgr0)"

cd
wget http://wordpress.org/latest.tar.gz
tar xzvf latest.tar.gz

sudo apt-get update
sudo apt-get install -y php5-gd libssh2-php

### Configure wordpress
echo "$(tput setaf 1)Configure wordpress...$(tput sgr0)"
cd ~/wordpress
cp wp-config-sample.php wp-config.php

# Setting WP Config database user and password
sed -i "/DB_HOST/s/'[^']*'/'$wp_db_host'/2" wp-config.php
sed -i "/DB_NAME/s/'[^']*'/'$wp_db_name'/2" wp-config.php
sed -i "/DB_USER/s/'[^']*'/'$wp_db_user'/2" wp-config.php
sed -i "/DB_PASSWORD/s/'[^']*'/'$wp_db_user_ps'/2" wp-config.php

cd

# Copy Files to the Document Root
sudo rsync -avP ~/wordpress/ /var/www/html/
cd /var/www/html

sudo chown -R root:www-data *
sudo mkdir /var/www/html/wp-content/uploads

sudo chown -R :www-data /var/www/html/wp-content/uploads

# Connect wordpress homepage via lynx
sudo apt-get install lynx
lynx localhost
