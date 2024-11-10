#!/usr/bin/env bash

# Part 4
docker run --rm alpine touch greeting.txt
docker run --rm alpine stat greeting.txt
echo -e '\nWill return a stat error that the file does not exist\n'

docker volume create todo-db

cid=$(docker ps | awk '/3000\/tcp/{print $1}')
docker rm -f ${cid}

cid=$(docker run -dp 127.0.0.1:3000:3000 --mount \
    type=volume,src=todo-db,target=/etc/todos getting-started)

docker rm -rf ${cid}

echo -e '\nNow remove an item from the Todo list\n'

cid=$(docker run -dp 127.0.0.1:3000:3000 --mount \
    type=volume,src=todo-db,target=/etc/todos getting-started)

docker rm -rf ${cid}

docker volume inspect todo-db
