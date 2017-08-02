# Pull base image from stock node image.
FROM node

# Maintainer
MAINTAINER Hung Truong <hungtruongquoc@gmail.com>

# Add the current working folder as a mapped folder at /usr/src/app
ADD . /usr/src/app

# Set the current working directory to the new mapped folder.
WORKDIR /usr/src/app

# Copy all files from our directory to the docker image file system
COPY . .

# Run NPM install
RUN npm install && npm cache clean

# Install the express generator which gives you also scaffolding tools.
RUN npm install hapi --save

# Expose the node.js port to the Docker host.
EXPOSE 3000

# This is the stock express binary to start the app.
CMD [ "node", "index.js" ]