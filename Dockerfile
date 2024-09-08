FROM node:18.16.0

# create folder /app
WORKDIR /app

# copy root project kita semua file. lalu copas ke /app
ADD . /app

RUN npm install
CMD npm start
EXPOSE 3000


