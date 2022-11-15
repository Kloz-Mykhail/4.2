FROM node:18.7

WORKDIR /app

COPY package.json .

RUN npm install\
        && npm install typescript -g

COPY . .

EXPOSE 3000

RUN npm run build