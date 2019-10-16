pipeline {
	agent any

	stages {
	    stage('Checkout') {
	        steps {
				checkout scm
			}
		}
		stage('Build') {
	        steps {
				sh '/home/tomcat/Distros/apache-maven-3.6.0/bin/mvn install'
	        }
		}
		stage('Deployment') {
			steps {
				sh 'sshpass -p "tomcat" scp target/tomcatkart.war tomcat@172.17.0.3:/home/tomcat/Distros/apache-tomcat-8.5.38/webapps'
				sh 'sshpass -p "tomcat" ssh tomcat@172.17.0.3 "JAVA_HOME=/home/tomcat/Distros/jdk1.8.0_151" "/home/tomcat/Distros/apache-tomcat-8.5.38/bin/startup.sh"'
			}
		}

	}
}
