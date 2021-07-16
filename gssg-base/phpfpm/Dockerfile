FROM php:7.0.26-fpm
MAINTAINER willrain <willrain@gmail.com>

RUN set -ex; \
	apt-get update; \
	apt-get install -y --no-install-recommends \
        cron \
        git \
        libfreetype6-dev \
        libicu-dev \
        libjpeg62-turbo-dev \
        libmcrypt-dev \
        libpng12-dev \
        libxslt1-dev \
        mysql-client \
        vim \
        zip \
        libgeoip-dev \
	;\
	docker-php-ext-configure \
        gd \
        --with-freetype-dir=/usr/include/ \
        --with-jpeg-dir=/usr/include/ \
        --with-png-dir=/usr \
	;\
	docker-php-ext-install \
        gd \
        opcache \
        bcmath \
        intl \
        mbstring \
        mcrypt \
        pdo_mysql \
        soap \
        xsl \
        zip \
	;\
	curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer; \
	mkdir /home/scom; \
    groupadd -g 1001 scom && useradd -g 1001 -u 1001 -d /home/scom -s /bin/bash scom

# set recommended PHP.ini settings
# see https://secure.php.net/manual/en/opcache.installation.php
RUN { \
		echo 'opcache.memory_consumption=128'; \
		echo 'opcache.interned_strings_buffer=8'; \
		echo 'opcache.max_accelerated_files=4000'; \
		echo 'opcache.revalidate_freq=2'; \
		echo 'opcache.fast_shutdown=1'; \
		echo 'opcache.enable_cli=1'; \
	} > /usr/local/etc/php/conf.d/opcache-recommended.ini


COPY conf/php.ini                       /usr/local/etc/php/
COPY conf/php-fpm.conf                  /usr/local/etc/
COPY bin/start                          /usr/local/bin/
COPY bin/docker-phpfpm-entrypoint       /usr/local/bin/


RUN mkdir /sock \
    && chown -R scom:scom \
        /usr/local/bin/start \
        /usr/local/bin/docker-phpfpm-entrypoint \
        /usr/local/etc/php/php.ini \
        /usr/local/etc/php/conf.d \
        /usr/local/etc/php-fpm.conf \
        /sock \
    && chmod +x /usr/local/bin/start \
    && chmod +x /usr/local/bin/docker-phpfpm-entrypoint

USER scom
WORKDIR /home/scom

ENTRYPOINT ["docker-phpfpm-entrypoint"]

CMD ["--zone=prod"]


# 이미지 생성
## docker build -t global-nexus:9003/gssg-phpfpm .

# global-nexus push
## docker push global-nexus:9003/gssg-phpfpm

# global-nexus pull
## docker pull global-nexus:9003/gssg-phpfpm

# 실행
## docker run -d -it --rm --name gssg-phpfpm global-nexus:9003/gssg-phpfpm --zone=prod
## docker exec -it gssg-phpfpm bash

