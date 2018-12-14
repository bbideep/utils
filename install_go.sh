#!/bin/bash

VERSION=1.10.6   
OS=linux   
ARCH=amd64   
GOPATH=/opt/go   

wget https://dl.google.com/go/go$VERSION.$OS-$ARCH.tar.gz   

tar -C /usr/local -xzf go$VERSION.$OS-$ARCH.tar.gz   

echo "export PATH=$PATH:/usr/local/go/bin" >> /etc/profile   
#echo "export GOPATH=$GOPATH" >> /etc/profile   

#Set GOPATH to a location like ```/opt/go```. All projects will be under GOPATH like ```/opt/go/src/project1```
