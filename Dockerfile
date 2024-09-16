FROM php:8.2-fpm-alpine

RUN apk --no-cache add nginx bash

COPY ./nginx.conf /etc/nginx/nginx.conf

COPY . /var/www/html

EXPOSE 80

RUN chown -R www-data:www-data /var/www/html \
    && chmod -R 755 /var/www/html

COPY ./startscript.sh /start.sh
RUN chmod +x /start.sh

CMD ["/start.sh"]


