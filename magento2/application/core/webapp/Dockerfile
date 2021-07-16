#
# https://github.com/subicura/Dockerfiles/tree/master/php7.0-fpm
#
# build:
#   docker build --force-rm=true -t global-nexus:9003/magento2-core-webapp -t global-nexus:9003/magento2-core-webapp:$(date +'%y%m%d%H%M%S') .
#
# TODO 마젠토 코어-app 을 만들어 볼까? ==>  app 디렉토리만 업데이트 되면되지 않을까?
#
#FROM global-nexus:9003/gssg-alpine AS magento2-core-webapp
FROM global-nexus:9003/magento2-phpfpm AS magento2-core-webapp
#FROM global-nexus:9003/gssg-centos AS magento2-core-webapp
MAINTAINER willrain <willrain@gmail.com>

USER root

#COPY bin/init_webapp.sh            /var/tmp/init_webapp.sh
COPY bin/start                      /usr/local/bin/
COPY bin/init_webapp.sh             /data01/webroot/bin/
ADD  src/magento2-2.1.8.tar.gz      /data01/webroot/www/

RUN set -x \
    && chmod +x /data01/webroot/bin/init_webapp.sh /usr/local/bin/start \
    && chown -R scom:scom \
        /usr/local/bin/start \
        /data01/webroot/bin/init_webapp.sh \
        /data01/webroot/www \
        /var/tmp


#    && mkdir -p /data01/webroot/{bin,logs} \
#    && mkdir -p /data01/webroot/magento2-src/{app,core} \
#    && mkdir -p /data01/webroot/logs/rsync \
#    && chmod +x /data01/webroot/bin/*.sh \
#    && rm -rf /var/tmp/*

# TODO rsync 설치

USER scom
WORKDIR /data01/webroot/www

###################################################################################################
# default
# ENTRYPOINT ["docker-phpfpm-entrypoint"]
# CMD ["--zone=prod"]
###################################################################################################

# 이미지 생성
## docker build --force-rm=true -t global-nexus:9003/magento2-core-webapp -t global-nexus:9003/magento2-core-webapp:$(date +'%y%m%d%H%M%S') .
## docker build --force-rm=true -t global-nexus:9003/magento2-core-webapp .

# global-nexus push
## docker push global-nexus:9003/magento2-core-webapp

# global-nexus pull
## docker pull global-nexus:9003/magento2-core-webapp

# 실행
## docker network create global-web-front
## docker run -d -it --rm --name magento2-core-webapp global-nexus:9003/magento2-core-webapp --zone=prod
## docker run -d -it --rm \
##    --name magento2-core-webapp \
##    --network global-web-front \
##    -v magento2-webapp:/data01/webroot/ssg-global-webapp \
##    global-nexus:9003/magento2-core-webapp local

## docker exec -it magento2-core-webapp bash


# docker run -it --rm --name magento2-core-webapp global-nexus:9003/magento2-core-webapp bash