# centos8-gollum

This is a centos 8 based container that allows you to run local gollum wikis. 

You may need to add firewall rules for the ports that you want to listen on:

```
# firewall-cmd --permanent --add-port=8080/tcp`
# firewall-cmd --reload

