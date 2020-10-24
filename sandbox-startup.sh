#!/usr/bin/env bash

NB_USER="jovyan"
NB_GROUP="users"
NB_UID="1000"
NB_GID="100"

docker run --rm \
           --name saspyrilia-sandbox \
           --user root \
           --mount "type=bind,src=${PWD},dst=/home/${NB_USER}/work" \
           -p 8888:8888 \
           -e ODA_USER \
           -e ODA_PASSWORD \
           -e NB_USER=${NB_USER} \
           -e NB_UID=${NB_UID} \
           -e NB_GID=${NB_GID} \
           -e NB_GROUP=${NB_GROUP} \
           -e CHOWN_HOME=yes \
           -e CHOWN_HOME_OPTS="-R" \
           saspyrilia-sandbox \
           start.sh jupyter lab  