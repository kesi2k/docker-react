FROM node:alpine
WORKDIR '/app'
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build

#build in /app/build

FROM nginx
# Expose command is specifically for AWS elasticbeanstalk
Expose 80
COPY --from=0 /app/build /usr/share/nginx/html