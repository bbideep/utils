#!/bin/bash

GRADLE_VERION=4.10.3

curl -k -L https://services.gradle.org/distributions/gradle-$GRADLE_VERION-all.zip -o gradle-$GRADLE_VERION-all.zip   
mkdir -p /opt/gradle   
unzip -d /opt/gradle gradle-$GRADLE_VERION-all.zip   

echo "export PATH=$PATH:/opt/gradle/gradle-$GRADLE_VERION/bin" >> /etc/profile   
source /etc/profile   
gradle -v   
