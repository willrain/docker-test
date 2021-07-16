#
# https://github.com/subicura/Dockerfiles/tree/master/php7.0-fpm
#
#FROM global-nexus:9003/gssg-alpine AS magento2-gssg-webapp
FROM global-nexus:9003/magento2-core-webapp AS magento2-gssg-webapp
MAINTAINER willrain <willrain@gmail.com>

USER root

COPY bin/start                          /usr/local/bin/
COPY bin/init_webapp.sh                 /data01/webroot/bin/
COPY config                             /data01/webroot/config/
ADD  src/ssg-global-magento2.tar.gz     /data01/webroot/www/

RUN set -x \
    && chmod +x /data01/webroot/bin/init_webapp.sh /usr/local/bin/start \
    && cd /data01/webroot/www \
    && find . -type f -exec chmod -c 644 {} \; > /dev/null 2>&1 \
    && find . -type d -exec chmod -c 755 {} \; > /dev/null 2>&1 \
    && chown -R scom:scom \
        /usr/local/bin/start \
        /data01/webroot/bin/init_webapp.sh \
        /data01/webroot/www \
        /data01/webroot/config


#    && mkdir -p /data01/webroot/{bin,logs} \
#    && mkdir -p /data01/webroot/magento2-src/{app,core} \
#    && mkdir -p /data01/webroot/logs/rsync \
#    && chmod +x /data01/webroot/bin/*.sh \
#    && rm -rf /var/tmp/*

# TODO rsync 설치

USER scom

###################################################################################################
# default
# WORKDIR /data01/webroot/www
# ENTRYPOINT ["docker-phpfpm-entrypoint"]
# CMD ["--zone=prod"]
###################################################################################################

CMD ["--build=Y"]


# 이미지 생성
## docker build --force-rm=true -t global-nexus:9003/magento2-gssg-webapp -t global-nexus:9003/magento2-gssg-webapp:$(date +'%y%m%d%H%M%S') .
## docker build --force-rm=true -t global-nexus:9003/magento2-gssg-webapp .

# global-nexus push
## docker push global-nexus:9003/magento2-gssg-webapp

# global-nexus pull
## docker pull global-nexus:9003/magento2-gssg-webapp

# 실행
## docker run -d -it --rm --name magento2-gssg-webapp global-nexus:9003/magento2-gssg-webapp
## docker network create global-web-front
## docker run -d -it --rm \
##    --name magento2-gssg-webapp \
##    --network global-web-front \
##    -v magento2-webapp:/data01/webroot/ssg-global-webapp \
##    --env-file env.list \
##    global-nexus:9003/magento2-gssg-webapp local

## docker exec -it magento2-gssg-webapp bash


# docker run -it --rm --name magento2-gssg-webapp global-nexus:9003/magento2-gssg-webapp bash