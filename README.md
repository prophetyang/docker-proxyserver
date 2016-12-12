# To build a Squid proxy server docker image.

## Start/Stop proxy server
```
shell# service squid start
shell# service squid stop
```

## Use basic authentication
### Squid password file: /etc/squid/squid.passwd

### Add squid user
```
shell# htpasswd /etc/squid/squid.passwd user1
New password:
Re-type new password:
Adding password for user user1
```

### Verify squid user
```
shell#  /usr/lib64/squid/ncsa_auth /etc/squid/squid.passwd
user1 1234
OK
````

### Enable basic authentication (uncomment the following lines and restart Squid service)
```
auth_param basic program /usr/lib64/squid/ncsa_auth /etc/squid/squid.passwd
acl proxy_users proxy_auth REQUIRED
http_access allow proxy_users
```

