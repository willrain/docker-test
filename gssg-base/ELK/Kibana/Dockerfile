#FROM docker.elastic.co/kibana/kibana:6.1.4
FROM docker.elastic.co/kibana/kibana:5.6.9
# https://www.elastic.co/guide/en/kibana/6.2/_pulling_the_image.html


MAINTAINER willrain <willrain@gmail.com>


###############################################################################
# 환경 변수 설정
###############################################################################
ENV KIBANA_CONFIG_DIR   /usr/share/kibana/config


###############################################################################
# config 파일 복사
###############################################################################
COPY config/kibana.yml   ${KIBANA_CONFIG_DIR}/kibana.yml




# 이미지 생성
## docker build -t global-nexus:9003/gssg-kibana:5.6.9 .
## docker build -t global-nexus:9003/gssg-kibana:6.1.4 .

# global-nexus push
## docker push global-nexus:9003/gssg-kibana:6.1.4

# global-nexus pull
## docker pull global-nexus:9003/gssg-kibana:6.1.4

# 실행
## docker run -d -it --rm --name gssg-kibana -p 9040:5601 global-nexus:9003/gssg-kibana:5.6.9
## docker run -d -it --rm --name gssg-kibana -p 9040:5601 global-nexus:9003/gssg-kibana:6.1.4

## docker exec -it gssg-kibana bash
