#!/usr/bin/env bash

# Part 6
# https://docs.docker.com/get-started/workshop/07_multi_container/

# Two ways to network a container:
# 1. assign when starting the container
# 2. connect to an existing network

# create an "existing" network
docker network create todo-app

docker network ls

# CPU instruction set issue? Using a different version for now.
#docker run -d \
#    --network todo-app --network-alias mysql \
#    -v todo-mysql-data:/var/lib/mysql \
#    -e MYSQL_ROOT_PASSWORD=secret \
#    -e MYSQL_DATABASE=todos \
#    mysql:8.0

docker run -d \
    --network todo-app --network-alias mysql \
    -v todo-mysql-data:/var/lib/mysql \
    -e MYSQL_ROOT_PASSWORD=secret \
    -e MYSQL_DATABASE=todos \
    mysql:5.7

# docker container logs <mysql-container-id>

# docker exec -it <mysql-container-id> mysql -u root -p

# mysql> SHOW DATABASES;

# Troubleshoot and Learn via https://github.com/nicolaka/netshoot

docker run -it --network todo-app nicolaka/netshoot
# within netshoot...
# dig mysql

# The key being the --network-alias option from earlier

# Be careful using environment (ENV) variables for sensitive data
# https://blog.diogomonica.com//2017/03/27/why-you-shouldnt-use-env-variables-for-secret-data/

docker run -dp 127.0.0.1:3000:3000 \
  -w /app -v "$(pwd):/app" \
  --network todo-app \
  -e MYSQL_HOST=mysql \
  -e MYSQL_USER=root \
  -e MYSQL_PASSWORD=secret \
  -e MYSQL_DB=todos \
  node:18-alpine \
  sh -c "yarn install && yarn run dev"

# docker logs -f <todo-container-id>

# docker exec -it <mysql-container-id> mysql -p todos
# mysql> select * from todo_items;

# Network Types
# https://docs.docker.com/engine/network/
