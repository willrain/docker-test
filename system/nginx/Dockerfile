FROM global-nexus:9003/gssg-nginx
MAINTAINER willrain <willrain@gmail.com>

#ENV PHP_HOST magento2-phpfpm
#ENV PHP_PORT 9000
#ENV APP_MAGE_MODE default

COPY bin/start                          /usr/local/bin/
COPY bin/docker-nginx-entrypoint        /usr/local/bin/
COPY conf/nginx.conf                    /etc/nginx/
COPY conf/default.conf                  /etc/nginx/conf.d/

RUN set -x \
    && chmod +x /usr/local/bin/start /usr/local/bin/docker-nginx-entrypoint \
    && mkdir /sock \
    && chown -R scom:scom /sock

VOLUME /scok


ENTRYPOINT ["docker-nginx-entrypoint"]
#CMD ["--zone=prod"]

# 이미지 생성
## docker build -t global-nexus:9003/magento2-nginx .

# global-nexus push
## docker push global-nexus:9003/magento2-nginx

# global-nexus pull
## docker pull global-nexus:9003/magento2-nginx

# 실행
## docker network create global-web-front
## docker run -d -it --rm \
##    --name magento2-nginx \
##    --network global-web-front \
##    -p 443:443 \
##    -v /data01/sw/nginx/ssl:/data01/sw/nginx/ssl \
##    -v magento2-web-socket:/sock \
##    -v magento2-webapp:/data01/webroot/www \
##    --env-file env.list \
##    global-nexus:9003/magento2-nginx

## docker run -it --rm --env-file env.list --name magento2-nginx --network global-web-front -p 443:443 global-nexus:9003/magento2-nginx bash

## docker exec -it magento2-nginx bash