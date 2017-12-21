FROM openjdk:8-alpine
MAINTAINER Michal Hlavac <miso@hlavki.eu>

ENV KARAF_USER karaf
ENV KARAF_UID 8181
ENV KARAF_VERSION 4.1.4
ENV JAVA_MAX_MEM 256m
ENV KARAF_EXEC exec

COPY download.sh /tmp/download.sh

RUN addgroup -S -g $KARAF_UID $KARAF_USER; \
    adduser -S -u $KARAF_UID -g $KARAF_USER $KARAF_USER

RUN apk add --update bash tar jq curl && rm -rf /var/cache/apk/* \
    && chmod a+x /tmp/download.sh && sync && /tmp/download.sh && rm /tmp/download.sh \
    && mkdir -p /opt/karaf \
    && tar --strip-components=1 -C /opt/karaf -xzf /tmp/apache-karaf.tar.gz \
    && rm /tmp/apache-karaf.tar.gz \
    && mkdir -p /opt/karaf/data /opt/karaf/data/log \
    && chown -R $KARAF_USER.$KARAF_USER /opt/karaf \
    && echo org.ops4j.pax.url.mvn.defaultRepositories = file:///opt/maven/repository@id=local.app@snapshots  >> /opt/karaf/etc/org.ops4j.pax.url.mvn.cfg

EXPOSE 1099 8101 44444

USER $KARAF_USER

CMD ["/opt/karaf/bin/karaf", "run"]
