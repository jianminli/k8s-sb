FROM adoptopenjdk/openjdk8
WORKDIR /opt
ENV PORT 8080
EXPOSE 8080
RUN /bin/sh -c "apt-get update && apt-get install dos2unix && dos2unix mvnw && chmod +x mvnw && ./mvnw package"
COPY target/*.jar /opt/app.jar
ENTRYPOINT exec java $JAVA_OPTS -jar app.jar
