#!/bin/bash

OLDDIR=$(pwd)

. /etc/sysconfig/jenkins

cd $JENKINS_HOME/jobs
mkdir php-template
cd php-template
wget --no-check-certificate https://raw.github.com/sebastianbergmann/php-jenkins-template/master/config.xml
cd ..
chown -R jenkins:jenkins php-template/

cd $OLDDIR

wget http://localhost:8080/jnlpJars/jenkins-cli.jar -O /tmp/jenkins-cli.jar
java -jar /tmp/jenkins-cli.jar -s http://localhost:8080 safe-restart
rm /tmp/jenkins-cli.jar

