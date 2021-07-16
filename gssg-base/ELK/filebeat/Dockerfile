FROM docker.elastic.co/beats/filebeat:6.1.4
# https://www.elastic.co/guide/en/beats/filebeat/6.1/index.html 참고

MAINTAINER willrain <willrain@gmail.com>

###############################################################################
# 환경 변수 설정
###############################################################################
ENV CONFIG_DIR   /usr/share/filebeat

###############################################################################
# scom 계정 생성 및 소유권 변경
###############################################################################
USER root

RUN set -x \
    && groupadd -g 1001 scom \
    && useradd -g 1001 -u 1001 -d /usr/share/filebeat -s /bin/bash scom \
    && mkdir -p /data01/logs \
    && chown -R scom:scom /usr/share/filebeat /data01/logs

###############################################################################
# scom 계정으로 실행
###############################################################################
USER scom





# 이미지 생성
## docker build -t global-nexus:9003/gssg-filebeat:6.1.4 .

# global-nexus push
## docker push global-nexus:9003/gssg-filebeat:6.1.4

# global-nexus pull
## docker pull global-nexus:9003/gssg-filebeat:6.1.4

# 실행
## docker run -d -it --rm -v /data01/docker/ssg-global-docker/docker-configs/elk/filebeat/config/filebeat.yml:/usr/share/filebeat/filebeat.yml --name gssg-filebeat global-nexus:9003/gssg-filebeat:6.1.4
# docker run -it --rm \
  -e "TZ=Asia/Seoul" \
  -v /data01/docker/ssg-global-docker/docker-configs/elk/filebeat/config/filebeat.yml:/usr/share/filebeat/filebeat.yml \
  -v /data01/logs/:/data01/logs/ \
  --name gssg-filebeat global-nexus:9003/gssg-filebeat:6.1.4


#  ./filebeat -e -c filebeat.yml -d "publish"


## docker exec -it gssg-filebeat bash
