#!/bin/sh

if [ $# -lt 1 ];then
  echo "USAGE ./downloadjdk.sh <URL of the JDK like http://download.oracle.com/otn-pub/java/jdk/7u79-b15/jdk-7u79-linux-x64.tar.gz>"
  exit 1
fi

#JDKURL like http://download.oracle.com/otn-pub/java/jdk/7u79-b15/jdk-7u79-linux-x64.tar.gz
#https://download.oracle.com/otn-pub/java/jdk/11.0.1+13/90cf5d8f270a4347a95050320eef3fb7/jdk-11.0.1_linux-x64_bin.tar.gz
JDKURL=$1
FILENAME=`echo $JDKURL |awk -F"/" '{print $NF}'`

curl -v -j -k -L -H "Cookie: oraclelicense=accept-securebackup-cookie" $JDKURL > $FILENAME
