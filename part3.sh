#!/usr/bin/env bash

# Part 3
echo -e 'Register for Docker Hub account and create new repo\n'

# docker push USERNAME/getting-started:tagname
docker push USERNAME/getting-started

echo -e '\nThe docker push command will fail.\n'

docker login -u USERNAME

docker tag getting-started USERNAME/getting-started

docker push USERNAME/getting-started

echo -e '\nBrowse and log into https://labs.play-with-docker.com/\n'

echo -e '\nRun a new container instance from the Play with Docker CLI\n'
echo -e 'docker run -dp 0.0.0.0:3000:3000 USERNAME/getting-started'
