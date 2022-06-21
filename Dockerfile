FROM node:16-alpine as react-build
WORKDIR /app
COPY . .
RUN npm install
RUN npm start 