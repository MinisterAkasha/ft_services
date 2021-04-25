# mysql_install_db
openrc
touch /run/openrc/softlevel
/etc/init.d/mariadb setup
/etc/init.d/mariadb start

mysql -u root --skip-password -e "CREATE DATABASE wordpress DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;"
mysql -u root --skip-password -e "CREATE USER 'root'@'%' IDENTIFIED BY '';"
mysql -u root --skip-password -e "grant all privileges on wordpress.* to 'root'@'%' WITH GRANT OPTION;"
mysql -u root --skip-password -e "update mysql.user set plugin='' where user='root;"
mysql -u root --skip-password -e "FLUSH PRIVILEGES;"

mysql -u root wordpress < mnt/wordpress.sql

/etc/init.d/mariadb stop

sed -i "s|.*bind-address\s*=.*|bind-address=0.0.0.0|g" /etc/my.cnf.d/mariadb-server.cnf
sed -i "s|.*skip-networking.*|skip-networking=false|g" /etc/my.cnf.d/mariadb-server.cnf

mysqld -u root --datadir=/var/lib/mysql/