#!/bin/bash
#
#
# See how we were called.

#set -x

ZONE=$1
IS_BUILD=$2
BUILD_VER=$(date +"%Y%m%d%H%M")
WEB_ROOT=/data01/webroot/www

echo "
#---------------------------------------------------------------------------
# app/etc/env.php 복사
# ZONE = ${ZONE}
#---------------------------------------------------------------------------"
cp -R /data01/webroot/config/app/etc/env-${ZONE}.php /data01/webroot/www/app/etc/env.php

echo "
#---------------------------------------------------------------------------
# 마젠토 빌드 ?
#---------------------------------------------------------------------------"
cd ${WEB_ROOT}

build() {
    echo -e "# Start Magento Build .... \n"
    cd ${WEB_ROOT}

    echo ${BUILD_VER} > app/etc/deploy-info.txt

    echo -e "# setup:upgrade "
    php bin/magento setup:upgrade

    echo -e "# clean static file "
    rm -rf pub/static/* var/view_preprocessed/ var/di/ var/generation/

    echo -e "# di_compile"
    php bin/magento setup:di:compile

    echo -e "# deploy:mode:set production "
    #php bin/magento deploy:mode:set production

    echo -e "# setup:static-content:deploy"
    php bin/magento setup:static-content:deploy en_US
    php bin/magento setup:static-content:deploy ko_KR
    php bin/magento setup:static-content:deploy zh_Hans_CN
    php bin/magento setup:static-content:deploy ja_JP

    echo -e "# cache:flush"
    php bin/magento cache:flush

    #php bin/magento indexer:reindex
    #php bin/magento cache:flush
    #php bin/magento maintenance:disable

    echo -e "# End Magento Build in Prod.... \n"
}

if [ ${IS_BUILD} == "Y" ]; then
    build
else
    echo -e "# WARN Magento Build was ignore."
fi



# Start running check
#/usr/local/bin/running-check.sh
