 FROM ubuntu:16.04 
MAINTAINER "info@karthikellur.com"
RUN apt-get update
RUN apt-get install -y openjdk-8-jdk
ENV JAVA_HOME /usr
ADD apache-tomcat-8.5.38.tar.gz /root
COPY target/karthik.war /root/apache-tomcat-8.5.38/webapps
ENTRYPOINT /root/apache-tomcat-8.5.38/bin/startup.sh && bash

