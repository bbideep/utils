#!/bin/bash

# This script assumes that you have dos2unix and openssl configured on your system.
##### ***** Configure JAVA_HOME and DNAME variables properly before running the script ***** #####

if [ $# -lt 5 ];then
  echo "USAGE ./certutil.sh <REQ|GEN> <CERTALIAS> <CN of the cert> <Key password> <Store password>"
  exit 1
fi

TYPE=$1
JAVA_HOME='/opt/softwares/jdk1.8.0_45'
ALIAS="$2"
CN="$3"
KEYPASS="$4"
STOREPASS="$5"
DNAME="CN=${CN}, OU=Web servers, O=MyCompany, L=NewYork, S=NY, C=US"

if [[ "REQ" == "$TYPE" ]]; then
	${JAVA_HOME}/jre/bin/keytool -genkey -alias ${ALIAS} -sigalg "SHA256withRSA" -keyalg RSA -keysize 2048 -dname $DNAME -keypass ${KEYPASS} -keystore ${ALIAS}id.jks -storepass ${STOREPASS}
	${JAVA_HOME}/jre/bin/keytool -certreq -alias ${ALIAS} -sigalg "SHA256withRSA" -file ${ALIAS}_certreq.pem -keypass ${KEYPASS} -keystore ${ALIAS}id.jks -storepass ${STOREPASS}
	dos2unix *
	echo "Generated files ${ALIAS}id.jks, ${ALIAS}_certreq.pem"
elif [[ "GEN" == "$TYPE" ]]; then
	${JAVA_HOME}/jre/bin/keytool -import -trustcacerts -alias ${ALIAS} -file ${ALIAS}cert.pem -keypass ${KEYPASS} -keystore ${ALIAS}id.jks -storepass ${STOREPASS}
	${JAVA_HOME}/jre/bin/keytool -importkeystore -srckeystore ${ALIAS}id.jks -destkeystore ${ALIAS}id.p12 -deststoretype PKCS12
	openssl pkcs12 -nokeys -in ${ALIAS}id.p12 -out ${ALIAS}id.pem
	openssl pkcs12 -nocerts -nodes -in ${ALIAS}id.p12 -out ${ALIAS}id.key
	openssl x509 -in ${ALIAS}id.pem -out ${ALIAS}id.crt -outform PEM
	dos2unix *
	echo "Generated files ${ALIAS}id.p12, ${ALIAS}id.pem, ${ALIAS}id.key, ${ALIAS}id.crt"
else
	echo "USAGE ./certutil.sh <REQ|GEN> <CERTALIAS> <CN of the cert> <Key password> <Store password>"
	exit 1
fi
