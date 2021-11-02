FROM nginx

RUN mkdir /etc/nginx/private /etc/nginx/certs
COPY static-site/nginx.conf /etc/nginx/nginx.conf
ADD text-files /var/www/html
EXPOSE 80