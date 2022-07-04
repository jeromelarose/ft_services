CREATE USER "jelarose"@"%" IDENTIFIED BY "pass";
GRANT ALL PRIVILEGES ON wordpress.* TO "jelarose"@"%";
GRANT ALL PRIVILEGES ON phpmyadmin.* TO "jelarose"@"%";
DROP DATABASE test;
FLUSH PRIVILEGES;
