FROM nginx:1.27-alpine-perl
 
COPY ./nginx.conf /etc/nginx/nginx.conf

COPY . /var/www/html

EXPOSE 80

RUN chown -R www-data:www-data /var/www/html \
    && chmod -R 755 /var/www/html

COPY ./startscript.sh /start.sh
RUN chmod +x /start.sh

CMD ["/start.sh"]


