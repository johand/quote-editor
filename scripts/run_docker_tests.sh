#!/bin/sh

docker-compose -f docker-compose.test.yml run --rm app bin/rails test:all
docker container rm -f selenium-hub
