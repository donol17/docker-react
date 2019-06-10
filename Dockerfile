#Base image and specifying build phase
FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

#The production phase
FROM nginx
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html
