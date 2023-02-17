FROM ubuntu

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get install -y \
    nginx \
    php8.1-fpm

CMD /etc/init.d/php8.1-fpm start -F && nginx -g "daemon off;"

COPY index.php /var/www/html/
COPY default.conf /etc/nginx/sites-enabled/default

EXPOSE 80
