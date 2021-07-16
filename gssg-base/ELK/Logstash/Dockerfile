FROM docker.elastic.co/logstash/logstash:6.1.4
# https://www.elastic.co/guide/en/logstash/6.1/docker.html#_image_types 참고

MAINTAINER willrain <willrain@gmail.com>

###############################################################################
# 환경 변수 설정
###############################################################################
#ENV CONFIG_DIR   /usr/share/elasticsearch/config


#VOLUME ${EL_CONFIG_DIR}
#VOLUME ${EL_DATA_DIR}


# 이미지 생성
## docker build -t global-nexus:9003/gssg-logstash:6.1.4 .

# global-nexus push
## docker push global-nexus:9003/gssg-logstash:6.1.4

# global-nexus pull
## docker pull global-nexus:9003/gssg-logstash:6.1.4

# 실행
docker run -it --rm -p 9050:5044 \
  -v /data01/docker/ssg-global-docker/docker-configs/elk/logstash/config/:/usr/share/logstash/config/ \
  -v /data01/docker/ssg-global-docker/docker-configs/elk/logstash/pipeline/:/usr/share/logstash/pipeline/  \
  --name gssg-logstash global-nexus:9003/gssg-logstash:6.1.4
## docker run -d -it --rm -p 9050:5044 -v /data01/docker/ssg-global-docker/docker-configs/elk/logstash/config/:/usr/share/logstash/config/ --name gssg-logstash global-nexus:9003/gssg-logstash:6.1.4
## docker run -d -it --rm -v /data01/docker/ssg-global-docker/docker-volumes/elk/logstash/pipeline/:/usr/share/logstash/pipeline/ --name gssg-logstash global-nexus:9003/gssg-logstash:6.1.4

## docker exec -it gssg-logstash bash



####################################################################
# filebeat 연동
# 로그 파일이 쌓이는 서버에 설치
# https://www.elastic.co/downloads/beats/filebeat 참조
#
# $ tar -zxvf filebeat-6.1.4-linux-x86_64.tar.gz
# $ mv filebeat-6.1.4-linux-x86_64 /data01/sw/
#
# filebeat.yml 수정
#     paths:
#       - /data01/logs/mageLog/logstash/output_2018608.log
#  output.logstash:
#     hosts: ["202.8.174.167:9050"]
# 실행
# $ sudo ./filebeat -e -c filebeat.yml -d "publish"
