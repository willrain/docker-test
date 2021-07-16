FROM global-nexus:9003/gssg-phpfpm

MAINTAINER willrain <willrain@gmail.com>

USER root

RUN set -ex; \
	pecl channel-update pecl.php.net \
	    && pecl install xdebug \
	    && docker-php-ext-enable xdebug \
	    && sed -i -e 's/^zend_extension/\;zend_extension/g' /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini; \
	\
	# geoip
	pecl install geoip-1.1.1 \
		&& echo "extension=geoip.so" > /usr/local/etc/php/conf.d/ext-geoip.ini \
		&& rm -rf /var/lib/apt/lists/*

	#printf '* *\t* * *\tapp\t%s/usr/local/bin/php /var/www/html/update/cron.php\n#' >> /etc/crontab; \
	#printf '* *\t* * *\tapp\t%s/usr/local/bin/php /var/www/html/bin/magento cron:run\n#' >> /etc/crontab; \
	#printf '* *\t* * *\tapp\t%s/usr/local/bin/php /var/www/html/bin/magento setup:cron:run\n#' >> /etc/crontab


COPY conf/GeoIP/GeoIP.dat   /usr/share/GeoIP/
COPY conf/php-fpm.d/*.conf  /usr/local/etc/php-fpm.d/
COPY conf/php.ini           /usr/local/etc/php/
COPY conf/php-fpm.conf      /usr/local/etc/
# COPY bin/start            /usr/local/bin/

RUN mkdir -p /data01/logs/phpLog \
    && chown -R scom:scom \
        /data01/logs \
        /usr/local/etc/php \
        /usr/local/etc/php-fpm.conf \
        /usr/local/etc/php-fpm.d \
    && chmod 644 /usr/share/GeoIP/GeoIP.dat

        #/usr/local/bin/start \
    #&& chmod +x /usr/local/bin/start

USER scom

###################################################################################################
# default
# WORKDIR /home/scom
# ENTRYPOINT ["docker-phpfpm-entrypoint"]
# CMD ["--zone=prod"]
###################################################################################################


# 이미지 생성
## docker build -t global-nexus:9003/magento2-phpfpm .

# global-nexus push
## docker push global-nexus:9003/magento2-phpfpm

# global-nexus pull
## docker pull global-nexus:9003/magento2-phpfpm

# 실행
## docker run -d -it --rm --name magento2-phpfpm global-nexus:9003/magento2-phpfpm --zone=prod
## docker run -d -it --rm \
##    --name magento2-phpfpm \
##    --network global-web-front \
##    -v magento2-web-socket:/sock \
##    -v magento2-webapp:/data01/webroot/www \
##    --env-file env.list \
##    global-nexus:9003/magento2-phpfpm


## docker exec -it magento2-phpfpm bash

