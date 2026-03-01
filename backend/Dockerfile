FROM node:20-alpine

USER root
WORKDIR /opt/application

COPY ./sources/package.json ./
RUN npm install --production

COPY ./sources ./
EXPOSE 5001

CMD [ "node", "server.js" ]
