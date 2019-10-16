#!/bin/bash

for i in `cat multi-deploy-IPs.txt`
	do
#
	echo "Deploying war file into $i QA server.."
	sleep 3
	sshpass -p "tomcat" scp target/tomcatkart.war tomcat@$i:/home/tomcat/Distros/apache-tomcat-8.5.38/webapps
#
	echo "Starting tomcat server in $i QA server.."
	sshpass -p "tomcat" ssh tomcat@$i "JAVA_HOME=/home/tomcat/Distros/jdk1.8.0_151" "/home/tomcat/Distros/apache-tomcat-8.5.38/bin/startup.sh"
#
	done
	echo "Deployment is succussful!"
