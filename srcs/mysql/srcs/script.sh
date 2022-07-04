#/usr/sbin/nginx -g 'daemon off;' 
#!/bin/ash

openrc
touch /run/openrc/softlevel
/etc/init.d/mariadb setup
/etc/init.d/mariadb start
mysql < /home/scriptbase.sql
mysql < /home/wordpress-mysql.sql
rm /etc/my.cnf.d/mariadb-server.cnf
cp /home/mariadb-server.cnf /etc/my.cnf.d/
rc-service mariadb restart

tail -f 30 /dev/null
