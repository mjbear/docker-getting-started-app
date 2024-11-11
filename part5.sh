#!/usr/bin/env bash

# Part 5
# If you have SELinux, put it in permissive mode
docker run -it --mount type=bind,src="$(pwd)",target=/src ubuntu bash

# within the container, change to src and touch myfile.txt
# on the host OS (not container), list the files in the project directory

# stop the interactive container with Ctrl+D

docker ps

docker run -dp 127.0.0.1:3000:3000 \
    -w /app --mount type=bind,src="$(pwd)",target=/app \
    node:18-alpine \
    sh -c "yarn install && yarn run dev"

# docker logs <container_id>
# docker logs -f <container_id>

# with the docker logs still following,
#  change and save the src/static/js/app.js file
#  watch the web server restart in the logs
#  see changes in the web page

# build new container
docker build -t getting-started .

docker images
# docker image ls

# Other Storage Types
# https://docs.docker.com/engine/storage/
#
# 1. volume (persistent, covered in Part 4)
# 2. bind mounts (persistent, covered above)
# 3. tmpfs (temporary, Linux)
# 4. named pipe (temporary, Windows)
