#!/usr/bin/env bash

# Part 8
# https://docs.docker.com/get-started/workshop/09_image_best/

docker image history getting-started

docker image history --no-trunc getting-started

# Modified the Dockerfile with Node.js packages

docker build -t getting-started .

# Make changes to src/static/index.html Title

# will build faster since it can use [unchanged] cached layers
docker build -t getting-started .
