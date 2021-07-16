FROM global-nexus:9003/gssg-alpine

# copy crontabs for root user
# COPY config/cronjobs /etc/crontabs/root
COPY config/cronjobs /etc/crontabs/scom

RUN set -x \
    && mkdir -p /data01/logs/cronjob \
    && chown -R scom:scom /data01/logs/cronjob

#USER scom
#WORKDIR /data01/logs/cronjob

# start crond with log level 8 in foreground, output to stderr
ENTRYPOINT ["crond"]
CMD ["-f", "-d", "8"]

# 이미지 생성
## docker build -t global-nexus:9003/gssg-cron .

# 실행
## docker run -d -it --rm --name gssg-cron -v /data01/logs/cronjob:/data01/logs/cronjob global-nexus:9003/gssg-cron

## docker exec -it gssg-cron bash


# TODO
## scom 계정으로 실행 되어야 함. [완료]
## 다른 네트워크에 있는 파일을 실행 시킬 수 있는가 ?