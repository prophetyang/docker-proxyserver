# To build a Squid proxy server docker image.

## Start/Stop proxy server
```
shell# service squid start
shell# service squid stop
```

## Update default Docker network ACL rule if necessary
```
acl docker_net src 172.17.0.0/16
```

## Use basic authentication
#### 1. Disable docker_net ACL rule (comment out the following line)
```
# http_access allow docker_net
```

#### 2. Enable basic authentication (uncomment the following lines)
```
auth_param basic program /usr/lib64/squid/ncsa_auth /etc/squid/squid.passwd
auth_param basic children 5
auth_param basic realm Squid proxy-caching web server
auth_param basic credentialsttl 2 hours
auth_param basic casesensitive off
acl proxy_users proxy_auth REQUIRED
http_access allow proxy_users
```

#### 3. Restart SQUID service
```
shell# service squid restart
```

## Add squid user
#### Use htpasswd to generate account/password
```
shell# htpasswd /etc/squid/squid.passwd user1
New password:
Re-type new password:
Adding password for user user1
```

## Verify squid user
```
shell#  /usr/lib64/squid/ncsa_auth /etc/squid/squid.passwd
user1 1234
OK
````

