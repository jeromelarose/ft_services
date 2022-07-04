addgroup -S www-data && adduser -S www-data -G www-data
cp /home/www.conf /etc/php7/php-fpm.d/www.conf
sed -i "s/define('DB_NAME', null);/define('DB_NAME', '${WORDPRESS_DB_NAME}');/" /home/wp-config.php
sed -i "s/define('DB_USER', null);/define('DB_USER', '${WORDPRESS_DB_USER}');/" /home/wp-config.php
sed -i "s/define('DB_PASSWORD', null);/define('DB_PASSWORD', '${WORDPRESS_DB_PASSWORD}');/" /home/wp-config.php
sed -i "s/define('DB_HOST', null);/define('DB_HOST', '${WORDPRESS_DB_HOST}');/" /home/wp-config.php
cp /home/wp-config.php /wordpress
cp -r /wordpress/* /var/www/html
mkdir -p /run/php-fpm7
php -S 0.0.0.0:5050 -t /var/www/html
