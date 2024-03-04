FROM php:8.1-fpm

# 安装 PHP 扩展
RUN apt-get update && apt-get install -y \
    libzip-dev \
    libpng-dev \
    libonig-dev \
    libxml2-dev \
    procps \
    unzip \
    && docker-php-ext-install zip gd bcmath pcntl pdo_mysql

# 下载并安装 Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# 设置 Composer 使用中国镜像
RUN composer config -g repo.packagist composer https://mirrors.aliyun.com/composer/

# 其他配置和指令
