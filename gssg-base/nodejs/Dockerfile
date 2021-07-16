FROM node:carbon
MAINTAINER willrain <willrain@gmail.com>

# https://hub.docker.com/_/node/
#

# 앱 디렉토리 생성
WORKDIR /data01/nodejs/app

# 앱 의존성 설치
COPY src/package.json .

RUN npm install

# 앱 소스 추가
COPY src .

EXPOSE 8080
CMD [ "npm", "start" ]


# 이미지 생성
## docker build -t global-nexus:9003/gssg-nodejs .

# global-nexus push
## docker push global-nexus:9003/gssg-nodejs

# global-nexus pull
## docker pull global-nexus:9003/gssg-nodejs

# 실행
## docker run -d -it --rm --name gssg-nodejs -p 9004:8080 global-nexus:9003/gssg-nodejs

## docker exec -it gssg-nodejs bash