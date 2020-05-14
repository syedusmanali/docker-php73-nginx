#!/bin/bash

service php7.3-fpm start
service nginx start

echo "Access your site at http://localhost"

tail -f /dev/null
