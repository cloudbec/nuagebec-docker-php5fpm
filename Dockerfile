FROM nuagebec/ubuntu:14.04
MAINTAINER David Tremblay <david@nuagebec.ca>

#install php5fpm
RUN apt-get update && \
    apt-get install -y php5-fpm php5-mysql php5-gd supervisor && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

ADD supervisor_php5fpm.conf /etc/supervisor/conf.d/php5fpm.conf 
ADD www.conf /etc/php5/fpm/pool.d/www.conf


RUN mkdir -p /var/www/html && chown www-data:www-data /var/www/html

RUN echo "<?php phpinfo();" > /var/www/html/index.php

EXPOSE 9000

CMD ["/data/run.sh"]

