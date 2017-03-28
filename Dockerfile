FROM jsurf/rpi-raspbian:latest

MAINTAINER Hugo Baltz <hugobaltz@gmail.com>

# Pour le apt-get
ENV http_proxy http://10.0.4.2:3128
ENV https_proxy https://10.0.4.2:3128

COPY sources.list /etc/apt/

RUN apt-get update && apt-get install -y apache2 php5 \
  && apt-get -y --purge autoremove && apt-get clean && rm -rf /var/lib/apt/lists/*

COPY 000-default.conf /etc/apache2/sites-available/
COPY apache2.conf /etc/apache2/

RUN a2enmod rewrite

COPY docker-entrypoint.sh /

WORKDIR /var/www

EXPOSE 80

ENTRYPOINT ["/docker-entrypoint.sh"]
