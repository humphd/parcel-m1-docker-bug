FROM node:16.18.1-bullseye

WORKDIR /app
COPY . .

RUN npm i
RUN npm run build
