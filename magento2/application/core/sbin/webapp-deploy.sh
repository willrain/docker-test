#!/bin/bash
#
# 1. 소스 파일 다운로드
# 2. 소스 파일 압축 (불 필요한 파일 제거)
# 3. magento2-core-webapp docker images 생성

DOCKER_PRJ_HOME=/data01/docker/ssg-global-docker/magento2/application/magento2-core

PRJECT_NM=magento2-2.1.8

WEBAPP_ROOT=${DOCKER_PRJ_HOME}/webapp
SRC_DIR=${WEBAPP_ROOT}/src
TMP_DIR=${WEBAPP_ROOT}/tmp

mkdir -p ${WEBAPP_ROOT}
mkdir -p ${SRC_DIR}
mkdir -p ${TMP_DIR}

echo "
#--------------------------------------------------------------------------
# 1. 소스 파일 다운로드
#--------------------------------------------------------------------------"
cd ${TMP_DIR}
rm -rf ${TMP_DIR}/*
git clone git@gitlab.ssgadm.com:global/${PRJECT_NM}.git

echo "
#--------------------------------------------------------------------------
# 1-1. 파일 / 디렉토리 퍼미션 변경
#--------------------------------------------------------------------------"
find . -type f -exec chmod -c 644 {} \; > /dev/null 2>&1
find . -type d -exec chmod -c 755 {} \; > /dev/null 2>&1


echo "
#--------------------------------------------------------------------------
# 2. 소스 파일 압축 (불 필요한 파일 제거)
#--------------------------------------------------------------------------"
cd ${TMP_DIR}/${PRJECT_NM}
rm -rf .git .gitignore .htaccess.sample .php_cs .travis.yml .user.ini
cp ${WEBAPP_ROOT}/exclude.lst ./
tar -zcf ${PRJECT_NM}.tar.gz --exclude-from=exclude.lst --ignore-failed-read .
mv ${PRJECT_NM}.tar.gz ${SRC_DIR}/${PRJECT_NM}.tar.gz
cd ${TMP_DIR} && rm -rf ${TMP_DIR}/*

echo "
#--------------------------------------------------------------------------
# 3. magento2-core-webapp docker images 생성
#--------------------------------------------------------------------------"
cd ${WEBAPP_ROOT}
#docker rmi global-nexus:9003/magento2-core-webapp
docker build --force-rm=true -t global-nexus:9003/magento2-core-webapp .

echo "
#--------------------------------------------------------------------------
# 4. magento2-core-webapp docker images push
#--------------------------------------------------------------------------"
docker push global-nexus:9003/magento2-core-webapp

echo "
#--------------------------------------------------------------------------
# 5. 임시 파일 삭제
#--------------------------------------------------------------------------"
rm -rf ${SRC_DIR}/${PRJECT_NM}.tar.gz

#cd ${DOCKER_PRJ_HOME}
#docker-compose pull
#docker-compose build
#docker-compose up

