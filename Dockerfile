FROM node:10.6 AS my-simple-angular-builder
WORKDIR /app

COPY package*.json ./
RUN npm i

COPY . .
RUN npm run build -- --prod

FROM nginx:1.15-alpine
COPY --from=my-simple-angular-builder /app/dist/angular-app /usr/share/nginx/html
