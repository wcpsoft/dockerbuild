#!/bin/sh
declare -x qycloudworkspace="/Users/ruixiangzhang/workspace/qycloud"
declare -x orgworkspace="/Users/ruixiangzhang/workspace/qycloud"
read -p "是否需要更改IP:" isModifyIp
declare -x isModifyIp
if [ "$isModifyIp" == "y" ]; then
    read -p "当前启业云源码目录[$qycloudworkspace]是否需要修改:" isModifyqycloudworkspace
    declare -x isModifyqycloudworkspace
    read -p "当前组织架构源码目录[$orgworkspace]是否需要修改:" isModifyorgworkspace
    declare -x isModifyorgworkspace
    if [ "$qycloudworkspace" == "y" ]; then
        read -p "当前组织架构源码目录:" qycloudworkspace
        declare -x qycloudworkspace
    fi
    if [ "$orgworkspace" == "y" ]; then
        read -p "当前组织架构源码目录:" orgworkspace
        declare -x orgworkspace
    fi
    read -p "输入当前ip:" newIp
    declare -x newIp
    read -p "输入旧ip:" oldIp
    declare -x oldIp
    grep $oldIp -rl "$qycloudworkspace/config/development" | xargs sed -i "s/$oldIp/$newIp/g"
    grep $oldIp -rl "$orgworkspace/config" | xargs sed -i "s/$oldIp/$newIp/g"
    grep $oldIp -rl "../" | xargs sed -i "s/$oldIp/$newIp/g"
    grep $oldIp -rl "/Users/ruixiangzhang/dockerdata/nginx-conf" | xargs sed -i "s/$oldIp/$newIp/g"
fi
read -p "输入需要启动PHP版本:" phpverison
declare -i phpverison
if [[ "$phpverison" -eq "56" || "$phpverison" -eq "70" || "$phpverison" -eq "71" ]]; then
    cd mysql
    docker-compose up -d
    cd ../mongodb
    docker-compose up -d
    cd ../redis
    docker-compose up -d
    cd ../php$phpverison
    docker-compose up -d
else
    echo "对不起，没有找到你需要启动的PHP版本目录"
fi
