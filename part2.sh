#!/usr/bin/env bash

# Part 2
# https://docs.docker.com/get-started/workshop/03_updating_app/

cid=$(docker ps | awk '/:3000/{print $1}')
docker stop ${cid}
docker rm ${cid}
# alternatively
# docker rm -f ${cid}

docker ps -a
# docker ps --all

new_cid=$(docker run -dp 127.0.0.1:3000:3000 getting-started)

echo -e '\nRefresh your browser at http://localhost:3000'
