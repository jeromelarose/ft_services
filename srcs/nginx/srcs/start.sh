openrc
touch /run/openrc/softlevel
#service nginx start
service sshd start
/usr/sbin/nginx -g 'daemon off;' 
