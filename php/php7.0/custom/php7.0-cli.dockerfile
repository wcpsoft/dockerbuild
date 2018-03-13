FROM daocloud.io/wcpsoft/php:7.0cli
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
        calendar redis xdebug mongodb imagick rar yaf && \
      echo "yaf.environ=development" >> /usr/local/etc/php/conf.d/docker-php-ext-yaf.ini && \
      echo "yaf.use_namespace=ON" >> /usr/local/etc/php/conf.d/docker-php-ext-yaf.ini && \
      echo "yaf.use_spl_autoload=ON" >> /usr/local/etc/php/conf.d/docker-php-ext-yaf.ini && \
      echo "yaf.lowcase_path=OFF" >> /usr/local/etc/php/conf.d/docker-php-ext-yaf.ini && \
      php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" && \
      php -r "if (hash_file('SHA384', 'composer-setup.php') === '544e09ee996cdf60ece3804abc52599c22b1f40f4323403c44d44fdfdd586475ca9813a858088ffbc1f233e9b180f061') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;" && \
      php composer-setup.php --install-dir=/usr/local/bin --filename=composer && \
      php -r "unlink('composer-setup.php');"