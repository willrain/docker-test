FROM nginx:1.13.8-alpine
# https://github.com/docker-library/docs/tree/master/nginx 참고

MAINTAINER willrain <willrain@gmail.com>

ENV WEB_ROOT /data01/webroot/www
ENV APP_ENV prod

COPY bin/start /usr/local/bin/start
COPY conf/nginx.conf /etc/nginx/
COPY conf/default.conf /etc/nginx/conf.d/

RUN set -x \
    && apk --update add bash \
    && addgroup -g 1001 scom \
    && adduser -D -G scom -u 1001 -h /home/scom -s /bin/bash scom \
    && mkdir -p ${WEB_ROOT} \
    && mkdir -p /data01/logs/nginx \
    && touch /var/run/nginx.pid \
    && chown -R scom:scom ${WEB_ROOT} /data01/logs/nginx /var/cache/nginx/ /var/run/nginx.pid \
    && chmod +x /usr/local/bin/start

#USER scom

VOLUME ${WEB_ROOT}
WORKDIR ${WEB_ROOT}

CMD ["/usr/local/bin/start"]

# 이미지 생성
## docker build -t global-nexus:9003/gssg-nginx .

# global-nexus push
## docker push global-nexus:9003/gssg-nginx

# global-nexus pull
## docker pull global-nexus:9003/gssg-nginx

# 실행
## docker run -d -it --rm --name gssg-nginx -p 80:80 -v default-webapp:/data01/webroot/www global-nexus:9003/gssg-nginx

## docker exec -it gssg-nginx bash



