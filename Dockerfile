FROM alpine:latest

RUN apk --update add nginx

COPY 2048 /var/www/html
COPY nginx.conf /etc/nginx/nginx.conf

RUN chgrp -R 0 /var/log/nginx \
 && chmod -R g=u /var/log/nginx \
 && chgrp -R 0 /var/lib/nginx \
 && chmod -R g=u /var/lib/nginx \
 && chgrp -R 0 /run/nginx \
 && chmod -R g=u /run/nginx

EXPOSE 8080

CMD ["nginx", "-g", "daemon off;"]
