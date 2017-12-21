FROM openjdk:8
MAINTAINER Michal Hlavac <miso@hlavki.eu>

ENV KARAF_USER karaf
ENV KARAF_UID 8181
ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64
ENV KARAF_VERSION 4.0.10
ENV JAVA_MAX_MEM 256m
ENV KARAF_EXEC exec

RUN groupadd -r $KARAF_USER --gid=$KARAF_UID && useradd -rm -g $KARAF_USER --uid=$KARAF_UID $KARAF_USER

COPY download.sh /tmp/download.sh

RUN apt-get update && apt-get install -y --no-install-recommends jq && rm -rf /var/lib/apt/lists/* \
    && chmod a+x /tmp/download.sh && sync && /tmp/download.sh && rm /tmp/download.sh \
    && mkdir -p /opt/karaf \
    && tar --strip-components=1 -C /opt/karaf -xzf /tmp/apache-karaf.tar.gz \
    && rm /tmp/apache-karaf.tar.gz \
    && mkdir -p /opt/karaf/data /opt/karaf/data/log \
    && chown -R $KARAF_USER.$KARAF_USER /opt/karaf \
    && chmod 700 /opt/karaf/data \
    && sed -i 's/log4j\.rootLogger=INFO,\ out,\ osgi\:\*/log4j\.rootLogger=INFO,\ out,\ stdout,\ osgi\:\*/' /opt/karaf/etc/org.ops4j.pax.logging.cfg \
    && echo org.ops4j.pax.url.mvn.defaultRepositories = file:///opt/maven/repository@id=local.app@snapshots  >> /opt/karaf/etc/org.ops4j.pax.url.mvn.cfg

EXPOSE 1099 8101 44444

USER $KARAF_USER

CMD ["/opt/karaf/bin/karaf", "server"]
