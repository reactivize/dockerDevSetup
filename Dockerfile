FROM node:latest

EXPOSE 3000
EXPOSE 5858
WORKDIR /app9

RUN cd /app9; npm install
CMD npm start
