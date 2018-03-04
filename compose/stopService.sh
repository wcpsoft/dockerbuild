#!/bin/sh
cd php56
docker-compose down
cd ../mysql
docker-compose down
cd ../mongodb
docker-compose down
cd ../redis
docker-compose down