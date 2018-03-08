FROM centos:7.1.1503
# https://hub.docker.com/_/centos/ 참고

MAINTAINER willrain <willrain@gmail.com>

LABEL "author"="Yoon SeungHwan"
LABEL version="7.1.1503"
LABEL description="This text illustrates \
https://hub.docker.com/_/centos/ 참고"

ENV username=admin database=db1 tableprefix=pr2_

RUN set -x \
    && yum swap -y fakesystemd systemd \
    && yum install -y systemd-devel \
    && yum -y update \
    && yum install -y sudo cronie \
    && groupadd -g 1001 scom \
    && useradd -g 1001 -u 1001 -d /home/scom -s /bin/bash scom \
    && chmod +w /etc/sudoers \
    && echo 'scom ALL=NOPASSWD: ALL' >> /etc/sudoers \
    && chmod -w /etc/sudoers

COPY bin/docker-centos-entrypoint /usr/local/bin/
COPY bin/running-check.sh /usr/local/bin/
# ADD bin/running-check.sh /usr/local/bin/

RUN touch /var/run/crond.pid \
    && touch /var/log/running.log \
    && chown -R scom:scom \
        /usr/local/bin/docker-centos-entrypoint \
        /usr/local/bin/running-check.sh \
        /var/log/running.log \
    && chmod +x /usr/local/bin/docker-centos-entrypoint /usr/local/bin/running-check.sh

EXPOSE 5000

USER scom

ENTRYPOINT ["docker-centos-entrypoint"]

CMD ["--arg1", "--arg2"]


# 이미지 생성
## docker build -t global-nexus:9003/gssg-centos .

# global-nexus push
## docker push global-nexus:9003/gssg-centos

# global-nexus pull
## docker pull global-nexus:9003/gssg-centos

# 실행
## docker run -d -it --rm --name gssg-centos global-nexus:9003/gssg-centos

## docker exec -it gssg-centos bash



