### How to change default /var/lib/docker location to another path like /opt/newpath ?

1) Stop docker:  
```systemctl stop docker```

2) Either change /lib/systemd/system/docker.service file as:   
```ExecStart=<current value>``` to ```ExecStart=<current value> -g /opt/newpath```   
or modify the OPTIONS in /etc/sysconfig/docker file as:   
```OPTIONS=<current options>``` to ```OPTIONS="<current options> -g /opt/newpath```

3) Start docker:  
```systemctl start docker```
