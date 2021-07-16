#!/bin/bash
#
#

SLEEP_SECOND=5

function src2web() {
    rsync -az --stats /data01/webroot/magento2-src/app/ssg-global-magento2/ /data01/webroot/ssg-global-webapp \
        --exclude=.git* \
        --exclude=data \
        --exclude=doc > /dev/null 2>&1
}


until [ ${SECONDS} -gt 50 ]; do
    echo [PID:$$ - $(date +"%Y-%m-%d %H:%M:%S")] >> /data01/webroot/logs/rsync/magento_rsync.log
    src2web
    sleep ${SLEEP_SECOND}
done
