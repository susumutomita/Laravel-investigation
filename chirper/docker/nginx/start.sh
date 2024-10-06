#!/bin/bash

# MySQLが起動するまで待機
until mysql -h "mysql" -u "root" -p"secret" -e 'select 1'; do
  >&2 echo "MySQLがまだ起動していません。再試行中..."
  sleep 3
done

# # # マイグレーションとシーディングを実行
php artisan migrate --force
php artisan db:seed --force

# Nginxをバックグラウンドで起動
service nginx start

# PHP-FPMをフォアグラウンドで実行
php-fpm
