#!/bin/bash

# Nginxをバックグラウンドで起動
service nginx start

# PHP-FPMをフォアグラウンドで実行
php-fpm
