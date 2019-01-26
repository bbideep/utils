#!/bin/bash

# ****** Note: I ran this on Amazon EC2 - 4.14.88-88.73.amzn2.x86_64 ******

JENKINS_HOST=<jenkins_admin_username>:<password>@<JENKINS_IP>:<JENKINSPORT>

curl -sSL "http://$JENKINS_HOST/pluginManager/api/xml?depth=1&xpath=/*/*/shortName|/*/*/version&wrapper=plugins" | perl -pe 's/.*?<shortName>([\w-]+).*?<version>([^<]+)()(<\/\w+>)+/\1 \2\n/g'|sed 's/ /:/'
