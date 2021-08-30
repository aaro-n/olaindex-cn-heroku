#!/bin/bash
apt update && apt dist-upgrade
apt -y install apache2 php php-bcmath php-curl php-xml php-sqlite3 git composer
cd /var/www/html
git clone --depth 1 https://gitee.com/LXY1226/OLAINDEX
mv OLAINDEX/* OLAINDEX/.* ./
rm -rf OLAINDEX .git
cp database/database.sample.sqlite database/database.sqlite
composer install -vvv
chown -R www-data:www-data .
chmod -R 0777 storage
php artisan od:install
