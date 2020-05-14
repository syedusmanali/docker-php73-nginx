# Docker PHP7.3 with Nginx

This image only contains php 7.3 and ngnix
#### Creating image
```
cd [basepath]/dockerfile
docker build -t myimagename .
```
#### Adjusting php and nginx configurations during build time
- During build time custom PHP configurations can be provided from dockerfile/php-cli or dockerfile/php-fpm.
- Nginx configuration can be adjusted during the build time from dockerfile/defaultnginx/nginx.conf

#### Running Container
```
docker run -p 80:80 myimagename
```
access at http://localhost

#### Running Container with bind mount on a specific http port
```
docker run --name mycontainername --mount type=bind,source=~/mycodebase,target=/var/www/codebase -p 8080:80 myimagename
```
access at http://localhost:8080

