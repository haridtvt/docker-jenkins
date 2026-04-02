FROM nginx:alpine
RUN rm -rf /etc/nginx/conf.d/*

RUN rm -rf /usr/share/nginx/html/*
COPY ./sources/default.conf.template /etc/nginx/templates/default.conf.template
COPY ./sources /usr/share/nginx/html/

EXPOSE 80