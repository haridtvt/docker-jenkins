FROM nginx:alpine
RUN rm -rf /usr/share/nginx/html/*
COPY ./sources/nginx.conf /etc/nginx/conf.d/default.conf
COPY ./sources /usr/share/nginx/html/ 
EXPOSE 80