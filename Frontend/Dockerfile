FROM nginx:alpine
RUN rm -rf /usr/share/nginx/html/*
COPY ./source/nginx.conf /etc/nginx/conf.d/default.conf
COPY ./source /usr/share/nginx/html/ 
EXPOSE 80