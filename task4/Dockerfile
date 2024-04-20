FROM nginx:1.25.5-alpine

COPY ./nginx/nginx.conf /etc/nginx/nginx.conf
RUN mkdir /etc/nginx/ssl
COPY ./nginx/ssl /etc/nginx/ssl
COPY ./www/html /var/www/html
