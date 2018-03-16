#!/bin/bash

curl -k -O /tmp/chef.rpm https://<CORP BINARY REPO LIKE ARTIFACTORY LOCATION>/chef-13.8.5-1.el7.x86_64.rpm
rpm -Uvh /tmp/chef.rpm
