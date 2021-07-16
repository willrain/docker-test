FROM alpine

RUN set -x \
    && apk --update add bash git \
    && addgroup -g 1001 scom \
    && adduser -D -G scom -u 1001 -h /home/scom -s /bin/bash scom \
    && mkdir -p /data01/logs \
    && mkdir -p /data01/webroot \
    && chown -R scom:scom /data01


# 이미지 생성
## docker build -t global-nexus:9003/gssg-alpine .

# global-nexus push
## docker push global-nexus:9003/gssg-alpine

# global-nexus pull
## docker pull global-nexus:9003/gssg-alpine

# 실행
## docker run -d -it --rm --name gssg-alpine -v /data01/logs:/data01/logs global-nexus:9003/gssg-alpine
## docker exec -it gssg-alpine bash

