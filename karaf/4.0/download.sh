#!/bin/sh

mirror=$(curl --stderr /dev/null https://www.apache.org/dyn/closer.cgi\?as_json\=1 | jq -r '.preferred')
url="${mirror}karaf/${KARAF_VERSION}/apache-karaf-${KARAF_VERSION}.tar.gz"
curl -s -o "/tmp/apache-karaf.tar.gz" "${url}"
