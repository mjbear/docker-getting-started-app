#!/usr/bin/env bash

# Part 1
# https://docs.docker.com/get-started/workshop/02_our_app/

docker build -t getting-started .

echo -e ''

# start the Node.js web app container
#  -d = detach/background
#  -p = publish (port map)
# docker run -d -p 127.0.0.1:3000:3000 getting-started
docker run -dp 127.0.0.1:3000:3000 getting-started

echo -e '\nOpen http://localhost:3000 in your browser'

docker ps
