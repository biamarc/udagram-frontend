#
# Install udagram app and serve it by nginx container
#
# Use NodeJS base image
FROM node:10 AS compile-image

# Create app directory
WORKDIR /usr/src/app

# Install app dependencies by copying
# package.json and package-lock.json
COPY package*.json ./
COPY www/ ./

# Install dependencies
RUN npm install

# second image is nginx
FROM nginx:alpine

# copy from compile-image the content where store app to the nginx html directory
COPY --from=compile-image /usr/src/app /usr/share/nginx/html
