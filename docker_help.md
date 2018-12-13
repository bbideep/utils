### How to change default /var/lib/docker location to another path like /opt/newpath ?

1) Stop docker:  
```systemctl stop docker```

2) Copy 'docker' directory to new location /opt/newpath. Create /opt/newpath if required. [This step is required if you want to copy existing images and files]:   
```cp -R /var/lib/docker /opt/newpath/```

3) Backup current /var/lib/docker to /var/lib/docker.orig:    
```mv /var/lib/docker /var/lib/docker.orig```

4) Either change /lib/systemd/system/docker.service file as:   
```ExecStart=<current value>``` to ```ExecStart=<current value> -g /opt/newpath/docker```   
or modify the OPTIONS in /etc/sysconfig/docker file as:   
```OPTIONS="<current options>"``` to ```OPTIONS="<current options> -g /opt/newpath/docker"```    
I prefer modifying /etc/sysconfig/docker as this is a better place to customize!

5) Start docker:  
```systemctl start docker```

6) Verify that no new /var/lib/docker directory has been created. If a new one gets created, re-check your settings and repeat the required steps!
