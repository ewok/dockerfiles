FROM adoptopenjdk/openjdk8:centos-slim

ENV JMXTERM_UBERJAR_URL https://github.com/jiaqi/jmxterm/releases/download/v1.0.2/jmxterm-1.0.2-uber.jar

RUN curl -Lks "$JMXTERM_UBERJAR_URL" > jmxterm.jar

ENTRYPOINT ["java", "-jar", "jmxterm.jar"]

