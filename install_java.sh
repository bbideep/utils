#!/bin/bash

JDKURL=https://download.oracle.com/otn-pub/java/jdk/11.0.1+13/90cf5d8f270a4347a95050320eef3fb7/jdk-11.0.1_linux-x64_bin.tar.gz
FILENAME=`echo $JDKURL |awk -F"/" '{print $NF}'`
#******WARNING****** : The belowname might change if Oracle changes the naming convention inside the downloaded tar.gz.
#                      Ideally, this would be the java directory name after tar.gz extraction
JAVA_BASE=`echo $FILENAME |awk -F'_' '{print $1}'`

curl -j -k -L -H "Cookie: oraclelicense=accept-securebackup-cookie" $JDKURL > $FILENAME

mkdir -p /opt/java

tar -C /opt/java -xzvf $FILENAME

echo "export PATH=$PATH:/opt/java/$JAVA_BASE/bin" >> /etc/profile
echo "export JAVA_HOME=/opt/java/$JAVA_BASE" >> /etc/profile
source /etc/profile
