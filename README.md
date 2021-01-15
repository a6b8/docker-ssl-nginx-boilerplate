Based on [wmnnd/nginx-certbot](https://github.com/wmnnd/nginx-certbot)

# Setup a Nginx Server with SSL
This is the fastest way to setup a webserver with a https connection by using lets encrypt.

1. Setup your Nameserver
Point a ```A``` oder ```CNAME``` Record to your Server IP

2. clone repository
```
git clone https://github.com/a6b8/docker-ssl-nginx-boilerplate.git
```

3. change directory
```
cd docker-ssl-nginx-boilerplate
```

4. Run bash script
```
./index.sh
```

5. Follow the prompt (domain & email are required
