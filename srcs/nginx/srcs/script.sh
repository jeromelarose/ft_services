adduser jelarose -D
echo "jelarose:pass" | chpasswd
rm /etc/nginx/conf.d/default.conf
cp /home/default.conf /etc/nginx/conf.d/default.conf
cp /home/index.html /var/www
mkdir -p /run/nginx
mkdir -p /run/sshd
chmod -R 777 /var/www/
