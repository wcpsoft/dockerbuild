#!/bin/sh
read -p "输入需要启动PHP版本:" phpverison
declare -i phpverison
if [[ "$phpverison" -eq "56" || "$phpverison" -eq "70" || "$phpverison" -eq "71" ]]; then
    cd php$phpverison
    docker-compose down
    cd ../mysql
    docker-compose down
    cd ../mongodb
    docker-compose down
    cd ../redis
    docker-compose down
else
    echo "对不起，没有找到你需要启动的PHP版本目录"
fi
