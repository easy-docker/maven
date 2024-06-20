FROM maven:3.8-openjdk-8

LABEL maintainer="Ghostry <ghostry.green@gmail.com>"

ADD start.sh /start.sh
ADD pom.xml /data/pom.xml

RUN chmod +x /start.sh \
    && cd /data \
    && mvn clean package clean \
    && echo 'export LC_ALL=C.UTF-8;export LANG=C.UTF-8;umask 000;' >> /root/.bashrc

WORKDIR /data

VOLUME ["/data"]

CMD ["/start.sh"]
