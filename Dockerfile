FROM node:lts as builder

WORKDIR /usr/app/src

COPY package*.json ./

RUN npm install

COPY ./ ./

RUN npm run build


FROM nginx
EXPOSE 80
COPY --from=builder /usr/app/src/build /usr/share/nginx/html