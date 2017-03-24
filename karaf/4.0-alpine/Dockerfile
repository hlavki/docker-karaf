FROM openjdk:8-jdk-alpine
MAINTAINER Michal Hlavac <miso@hlavki.eu>

ENV KARAF_USER karaf
ENV KARAF_UID 8181
ENV KARAF_VERSION 4.0.8
ENV JAVA_MAX_MEM 256m

RUN apk add --update bash tar && rm -rf /var/cache/apk/*

RUN addgroup -S -g $KARAF_UID $KARAF_USER; \
    adduser -S -u $KARAF_UID -g $KARAF_USER $KARAF_USER

RUN wget http://www-eu.apache.org/dist/karaf/${KARAF_VERSION}/apache-karaf-${KARAF_VERSION}.tar.gz; \
    mkdir -p /opt/karaf; \
    tar --strip-components=1 -C /opt/karaf -xzf apache-karaf-${KARAF_VERSION}.tar.gz; \
    rm apache-karaf-${KARAF_VERSION}.tar.gz

RUN sed -i 's/log4j\.rootLogger=INFO,\ out,\ osgi\:\*/log4j\.rootLogger=INFO,\ out,\ stdout,\ osgi\:\*/' /opt/karaf/etc/org.ops4j.pax.logging.cfg

# Add default maven repository
RUN echo org.ops4j.pax.url.mvn.defaultRepositories = file:///opt/maven/repository@id=local.app@snapshots  >> /opt/karaf/etc/org.ops4j.pax.url.mvn.cfg

# Prepare data directory
RUN mkdir -p /opt/karaf/data /opt/karaf/data/log \
    && chown -R $KARAF_USER.$KARAF_USER /opt/karaf

EXPOSE 1099 8101 44444

USER $KARAF_USER

CMD ["/opt/karaf/bin/karaf", "daemon"]
