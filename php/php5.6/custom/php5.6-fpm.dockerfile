FROM daocloud.io/wcpsoft/php:5.6fpm
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
      docker-php-ext-install -j$(nproc) iconv gd mcrypt \
        curl mbstring xml json dom zip imap xmlreader \
        xmlrpc xmlwriter mssql mysql mysqli opcache pcntl \
        pdo pdo_mysql phar posix  \
        readline sockets session soap hash simplexml bcmath bz2 \
        calendar && \
        pecl install redis-3.1.6 && \
        pecl install xdebug-2.5.0 && \
        pecl install xhprof-0.9.4 && \
        pecl install mongo-1.6.16 && \
        pecl install imagick-3.4.3 && \
        pecl install rar && \
      docker-php-ext-enable iconv gd mcrypt \
        curl mbstring xml json dom zip imap xmlreader \
        xmlrpc xmlwriter mssql mysql mysqli opcache pcntl \
        pdo pdo_mysql phar posix  \
        readline sockets session soap hash simplexml bcmath bz2 \
        calendar redis xdebug xhprof mongo imagick rar