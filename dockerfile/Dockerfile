FROM ubuntu:18.04

#installing packages like php7.3 ngnix curl sendmail and other common extensions for php 7.3
RUN apt-get update
RUN apt-get install -y software-properties-common
RUN add-apt-repository ppa:ondrej/php -y
RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y php7.3-fpm nginx curl sendmail
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y php7.3-common php7.3-mysql php7.3-curl php7.3-json php7.3-mbstring php7.3-xml php7.3-zip php7.3-gd php7.3-soap php7.3-ssh2

#copying custom php .ini files
ADD php-fpm/custom_php.ini /etc/php/7.3/fpm/
RUN ln -s /etc/php/7.3/fpm/custom_php.ini /etc/php/7.3/fpm/conf.d/20-custom_php.ini
ADD php-cli/custom_php.ini /etc/php/7.3/cli/
RUN ln -s /etc/php/7.3/cli/custom_php.ini /etc/php/7.3/cli/conf.d/20-custom_php.ini

#cleaning php junk created by php7.3-ssh2
RUN rm -r /etc/php/5.6 /etc/php/7.0 /etc/php/7.1 /etc/php/7.2 /etc/php/7.4

#copying default nginx conf
RUN rm /etc/nginx/sites-enabled/default
ADD defaultNginx/nginx.conf /etc/nginx/sites-available/
RUN ln -s /etc/nginx/sites-available/nginx.conf /etc/nginx/sites-enabled/

#Adding docker entrypoint
ADD entrypoint.sh /opt/
RUN chmod 755 /opt/entrypoint.sh

CMD ["/bin/bash","/opt/entrypoint.sh"]
