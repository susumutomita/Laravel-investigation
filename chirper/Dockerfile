# ベースとしてPHP-FPMを使用
FROM php:8.3-fpm

# 必要なパッケージをインストール
RUN apt-get update && apt-get install -y \
    nginx \
    libzip-dev \
    zip \
    unzip \
    mariadb-client \
    && docker-php-ext-install pdo_mysql zip

# Composerをインストール
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Nginx設定ファイルのコピー
COPY ./docker/nginx/default.conf /etc/nginx/conf.d/default.conf

# Laravelアプリケーションのコピー
COPY . /var/www

# Nginxの起動スクリプト
COPY ./docker/nginx/start.sh /usr/local/bin/start.sh
RUN chmod +x /usr/local/bin/start.sh

# 作業ディレクトリを設定
WORKDIR /var/www

# 権限設定
RUN chown -R www-data:www-data /var/www
RUN chmod -R 755 /var/www

# ポートを公開
EXPOSE 80

# NginxとPHP-FPMを同時に起動するエントリーポイント
CMD ["sh", "/usr/local/bin/start.sh"]
