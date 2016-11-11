#!/bin/bash

elbendpoint='https://internal-myapp-consul-elb-1234567890.us-east-1.elb.amazonaws.com/v1'

# Login to Consul and use the session to lock and write a key-value of a leader IP

RESP=`curl -k -X PUT -d '{"Name": "mycluster"}' "${elbendpoint}/session/create"`

SESSID=`echo $RESP | awk -F':"' '{print $NF}' |awk -F'\"' '{print $1}'`

curl -k -X PUT -d "{\"myclusterip\":\"`hostname -i`\"}" "${elbendpoint}/kv/mycluster?acquire=$SESSID&token=Pz5gnFNwmG7dIoefqYWwfA=="


# Command to relese the session
curl -k -X PUT "${elbendpoint}/kv/mycluster?release=$SESSID&token=Pz5gnFNwmG7dIoefqYWwfA=="


# The below commands are used to read the 'mycluster' state and find the IP value.
# [Note: IP is used here to maintain the leader IP state in Consul]

RESP=`curl -k "${elbendpoint}/kv/mycluster?raw"`

LEADERIP=`echo $RESP | awk -F':' '{print $NF}' | sed -e 's/^[[:space:]]*//' -e 's/[[:space:]]*$//' | awk -F'\"' '{print $2}'`
