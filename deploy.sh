#!/bin/bash
##
##
ENVIRONMENT=$1
if [ $ENVIRONMENT = "QA" ];then
	sshpass -p "tomcat" scp target/tomcatkart.war tomcat@172.17.0.3:/home/tomcat/Distros/apache-tomcat-8.5.38/webapps
	sshpass -p "tomcat" ssh tomcat@172.17.0.3 "JAVA_HOME=/home/tomcat/Distros/jdk1.8.0_151" "/home/tomcat/Distros/apache-tomcat-8.5.38/bin/startup.sh"

elif  [ $ENVIRONMENT = "SIT" ];then
	sshpass -p "tomcat" scp target/tomcatkart.war tomcat@172.17.0.4:/home/tomcat/Distros/apache-tomcat-8.5.38/webapps
	sshpass -p "tomcat" ssh tomcat@172.17.0.4 "JAVA_HOME=/home/tomcat/Distros/jdk1.8.0_151" "/home/tomcat/Distros/apache-tomcat-8.5.38/bin/startup.sh"
echo "deployment has been done!"
fi

