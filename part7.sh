#!/usr/bin/env bash

# Part 7
# https://docs.docker.com/get-started/workshop/08_using_compose/

# create Docker `compose.yaml`

# stop all instances of the app and mysql containers
# docker rm -f <ids>

# at least on my system this is not valid
# docker compose up -d
# but this is
docker-compose up -d

docker ps

docker-compose logs -f

# filter logs
docker-compose logs -f app

# for some reason I had to bounce the app container
# docker-compose restart

# docker compose down
docker compose down --volumes

# https://docs.docker.com/compose/
# https://docs.docker.com/reference/compose-file/
# https://docs.docker.com/reference/cli/docker/compose/
