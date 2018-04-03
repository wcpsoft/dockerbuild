FROM daocloud.io/wcpsoft/php:7.1fpm
RUN apk upgrade --update && apk add \
      autoconf file g++ gcc binutils isl openssl-dev \
      pcre-dev zlib-dev linux-headers libxslt-dev libffi-dev \
      libatomic libc-dev musl-dev make re2c libstdc++ \
      libgcc binutils-libs mpc1 mpfr3 gmp libgomp \
      coreutils libcurl curl curl-dev \
      freetype-dev libjpeg-turbo-dev \
      libltdl libmcrypt-dev libpng-dev \
      imap-dev openssl-dev libxml2-dev \
      freetds freetds-dev bzip2 bzip2-dev \
      libedit-dev readline-dev imagemagick6-dev imagemagick6 && \
      export CFLAGS="-I/usr/src/php" && \
      docker-php-ext-install -j$(nproc) iconv gd mcrypt \
        curl mbstring xml json dom zip imap xmlreader \
        xmlrpc xmlwriter mysqli opcache pcntl \
        pdo pdo_mysql phar posix  \
        readline sockets session soap hash simplexml bcmath bz2 \
        calendar && \
        pecl install redis-3.1.6 && \
        pecl install xdebug-2.6.0 && \
        pecl install mongodb-1.4.0 && \
        pecl install imagick-3.4.3 && \
        pecl install rar && \
        pecl install yaf && \
      docker-php-ext-enable iconv gd mcrypt \
        curl mbstring xml json dom zip imap xmlreader \
        xmlrpc xmlwriter mysqli opcache pcntl \
        pdo pdo_mysql phar posix  \
        readline sockets session soap hash simplexml bcmath bz2 \
        calendar redis xdebug  mongodb imagick yaf rar && \
      echo "yaf.environ=development" >> /usr/local/etc/php/conf.d/docker-php-ext-yaf.ini && \
      echo "yaf.use_namespace=ON" >> /usr/local/etc/php/conf.d/docker-php-ext-yaf.ini && \
      echo "yaf.use_spl_autoload=ON" >> /usr/local/etc/php/conf.d/docker-php-ext-yaf.ini && \
      echo "yaf.lowcase_path=OFF" >> /usr/local/etc/php/conf.d/docker-php-ext-yaf.ini && \
      echo "variables_order=GPCS" >> /usr/local/etc/php/php.ini && \
      echo "request_order=GP" >> /usr/local/etc/php/php.ini && \
      echo "post_max_size = 100M" >> /usr/local/etc/php/php.ini && \
      echo "date.timezone = Asia/Shanghai" >> /usr/local/etc/php/php.ini && \
      echo 'default_charset = "UTF-8"' >> /usr/local/etc/php/php.ini && \
      echo "upload_max_filesize = 100M" >> /usr/local/etc/php/php.ini && \
      echo "max_file_uploads = 20" >> /usr/local/etc/php/php.ini
      