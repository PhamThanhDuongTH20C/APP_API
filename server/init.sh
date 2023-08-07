#!/bin/bash

SCRIPTPATH="$( cd "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"
echo "Use path: $SCRIPTPATH/"
cd $SCRIPTPATH

case "$(uname -s)" in
    Linux*)  windows=0;mac=0;;
    Darwin*) windows=0;mac=1;;
    CYGWIN*) windows=1;mac=0;;
    MINGW*)  windows=1;mac=0;;
    *)       windows=0;mac=0
esac

git fetch --all --prune
git submodule update --init --recursive

if [ ! -e $SCRIPTPATH/laradock ]; then
    git submodule init
    git submodule add https://github.com/Laradock/laradock.git "laradock"
fi

cd $SCRIPTPATH/test-api
if [ ! -e .env ]; then
    cp -p .env.example .env
fi

cd $SCRIPTPATH/laradock
rm -rf .env
cp -p ../.env .env

docker-compose down
docker-compose up --remove-orphans -d redis mariadb nginx

if [ $? -eq 0 ]; then
    docker-compose exec workspace bash -c "cd /var/www/;composer init_dev;npm install"
fi
