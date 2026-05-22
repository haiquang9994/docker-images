FROM php:8.1-fpm

# timezone
ENV TZ=Asia/Ho_Chi_Minh

RUN apt-get update && apt-get install -y \
    tzdata \
    libzip-dev \
    libpng-dev \
    libjpeg-dev \
    libfreetype6-dev \
    libonig-dev \
    libxml2-dev \
    libcurl4-openssl-dev \
    libicu-dev \
    libssl-dev \
    pkg-config \
    && ln -snf /usr/share/zoneinfo/$TZ /etc/localtime \
    && echo $TZ > /etc/timezone \
    git unzip \
    && rm -rf /var/lib/apt/lists/*

# PHP timezone
RUN echo "date.timezone=${TZ}" > /usr/local/etc/php/conf.d/timezone.ini

RUN docker-php-ext-configure gd \
    --with-freetype \
    --with-jpeg \
    && docker-php-ext-install -j$(nproc) \
    mbstring \
    pdo_mysql \
    mysqli \
    zip \
    exif \
    pcntl \
    bcmath \
    intl \
    soap \
    gd

RUN pecl install redis mongodb \
    && docker-php-ext-enable redis mongodb

COPY --from=composer:2 /usr/bin/composer /usr/bin/composer

WORKDIR /var/www/html
