FROM node:18-alpine as builder

WORKDIR /app

COPY package.json .

RUN npm install

COPY . . 

RUN npm run build


#phase 2
FROM nginx

COPY --from=builder /app/.next /usr/share/nginx/html


