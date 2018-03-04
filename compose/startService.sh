#!/bin/sh
cd mysql
docker-compose up -d
cd ../mongodb
docker-compose up -d
cd ../redis
docker-compose up -d
cd ../php56
docker-compose up -d