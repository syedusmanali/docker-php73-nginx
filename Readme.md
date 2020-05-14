# Docker PHP 7.3 with Nginx and MySQL 5.7

## Running the container from docker-compose.yaml
To run your PHP codebase simply download this repo in your codebase folder
by 
```
git clone https://github.com/syedusmanali/dockerphp7.3nginx.git
```
then run

```
cd [basepath]/dockerphp7.3nginx
docker-compose up
```
access at http://localhost

#### Code Binding
- By default, a bind of your codebase folder in the container under /var/www/codebase will be created
- Any changes made outside of the container in your codebase will be reflected in the container codebase in real time

#### Default Configurations
- By default, docker-compose.yml brings up MySQL 5.7 container as well which can be adjusted or removed
- Mysql database can be accessed by the MySQL container name as the host name at port 3306
- To modify the Nginx configuration during run time adjust the nginx/nginx.conf file

## Creating and running container image php7.3nginx from dockerfile
This image only contains PHP 7.3 and Nginx
#### Creating image
```
cd [basepath]/dockerphp7.3nginx/dockerfile
docker build -t myimagename .
```
#### Adjusting PHP and Nginx configurations during build time
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
