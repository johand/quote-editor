#!/bin/sh

docker-compose -f docker-compose.test.yml run --rm app bin/rails test:system
docker container rm -f selenium-hub
