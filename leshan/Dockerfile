FROM openjdk:17-alpine as base
LABEL maintainer="Thus0"

# STAGE1 : build base image
RUN mkdir -p /opt/leshan
RUN adduser -S -h /opt/leshan -s /sbin/nologin leshan
WORKDIR /opt/leshan


ENV BASE_URL https://ci.eclipse.org/leshan/job/leshan/lastSuccessfulBuild/artifact/
ADD $BASE_URL/leshan-server-demo.jar /opt/leshan/

# STAGE2 : build default server image
FROM base as server
EXPOSE 5683 5684 8080
ADD $BASE_URL/leshan-server-demo.jar /opt/leshan/
CMD ["java", "-jar", "./leshan-server-demo.jar"]

# STAGE2 : build bootstrap server image
FROM base as bootstrap
EXPOSE 5783 5784 8081
ADD $BASE_URL/leshan-bsserver-demo.jar /opt/leshan/
CMD ["java", "-jar", "./leshan-bsserver-demo.jar"]

# STAGE2 : build client image
FROM base as client
ADD $BASE_URL/leshan-client-demo.jar /opt/leshan/
CMD ["java", "-jar", "./leshan-client-demo.jar"]


