FROM nginx

RUN mkdir /etc/nginx/private /etc/nginx/certs
COPY static-site/nginx.conf /etc/nginx/nginx.conf
#VOLUME ["/app"]
EXPOSE 80