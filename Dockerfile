FROM nginx

RUN mkdir /etc/nginx/private /etc/nginx/certs
COPY static-site/index.html /etc/nginx/html/
COPY static-site/index.css /etc/nginx/html/
COPY static-site/nginx.conf /etc/nginx/nginx.conf

EXPOSE 80