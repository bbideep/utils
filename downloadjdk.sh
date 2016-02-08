#!/bin/sh

if [ $# -lt 1 ];then
  echo "USAGE ./downloadjdk.sh <URL of the JDK like http://download.oracle.com/otn-pub/java/jdk/7u79-b15/jdk-7u79-linux-x64.tar.gz>"
  exit 1
fi

#JDKURL like http://download.oracle.com/otn-pub/java/jdk/7u79-b15/jdk-7u79-linux-x64.tar.gz
JDKURL=$1
FILENAME=`echo $JDKURL |awk -F"/" '{print $NF}'`

curl -v -j -k -L -H "Cookie: oraclelicense=accept-securebackup-cookie" $JDKURL > $FILENAME
