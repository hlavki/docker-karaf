# [Karaf Docker](https://hub.docker.com/r/hlavki/karaf/) image

# Supported tags and respective `Dockerfile` links

 - `4.0.10`, `4.0` ([4.0/Dockerfile](https://github.com/hlavki/docker-karaf/blob/master/karaf/4.0/Dockerfile))
 - `4.0.10-alpine`, `4.0-alpine` ([4.0-alpine/Dockerfile](https://github.com/hlavki/docker-karaf/blob/master/karaf/4.0-alpine/Dockerfile))
 - `4.1.4`, `4.1`, `4`, `latest` ([4.1/Dockerfile](https://github.com/hlavki/docker-karaf/blob/master/karaf/4.1/Dockerfile))
 - `4.1.4-alpine`, `4.1-alpine`, `4-alpine` ([4.1-alpine/Dockerfile](https://github.com/hlavki/docker-karaf/blob/master/karaf/4.1-alpine/Dockerfile))

# What is Karaf

Apache Karaf is a modern and polymorphic container powered by OSGi. Karaf can be used standalone as a container, supporting a wide range of applications and technologies. It also supports the "run anywhere" (on any machine with Java, cloud, docker images, …​) using the embedded mode. It’s a lightweight, powerful, and enterprise ready platform. With this flexibility, Karaf is the perfect solution for microservices, systems integration, big data, and much more.

# Start a `Karaf` server instance

You can run container simply by

```bash
docker run --name some-karaf -d \
    -p 1099:1099 \
    -p 8101:8101 \
    -p 44444:44444 hlavki/karaf
```

The `docker exec` command allows you to run commands inside a Docker container. The following command line will give you a bash shell inside your `karaf` container:

```bash
docker exec -it some-karaf /opt/karaf/bin/client
```

The Karaf container log is available through Docker's container log:
```bash
docker logs -f some-karaf
```

# Environment variables

When you start the `karaf` image, you can adjust the configuration of the Karaf instance by passing one or more environment variables on the `docker run` command line.

 - **`JAVA_MIN_MEM`** - Minimum memory for the JVM
 - **`JAVA_MAX_MEM`** - Maximum memory for the JVM
 - **`JAVA_PERM_MEM`** - Minimum perm memory for the JVM
 - **`JAVA_MAX_PERM_MEM`** - Maximum perm memory for the JVM
 - **`EXTRA_JAVA_OPTS`** - Additional JVM options
 - **`KARAF_DATA`** - Karaf data folder
 - **`KARAF_OPTS`** - Additional available Karaf options
 - **`KARAF_DEBUG`** - Enable debug mode
 - **`KARAF_REDIRECT`** - Enable/set the std/err redirection when using bin/start
 - **`KARAF_NOROOT`** - Prevent execution as root if set to true

# Development

### 1. Hot deployment
You can map `/deploy` directory from host to container running:
```bash
docker run --name some-karaf -d \
    -p 1099:1099 \
    -p 8101:8101 \
    -p 44444:44444 \
    -v /host/path/deploy:/opt/karaf/deploy hlavki/karaf
```

### 2. Mapping local maven repository
You can map local maven repository instead of hot deployment. This image adds `/opt/maven/repository` directory to `org.ops4j.pax.url.mvn.defaultRepositories` so you can also redeploy bundles with snapshot version without restart. To run docker with this setup run:
```bash
docker run --name some-karaf -d \
    -p 1099:1099 \
    -p 8101:8101 \
    -p 44444:44444 \
    -v ~/.m2/repository:/opt/maven/repository hlavki/karaf
```

# Where to store data
Karaf docker image doesn't create volume from `data` directory. So it means it's stored in container. It's automatically removed If you remove container. But if you need to have `data` folder persistent, you can create volume or named volume.

```bash
docker run --name some-karaf -v /opt/karaf/data -d hlavki/karaf
```

