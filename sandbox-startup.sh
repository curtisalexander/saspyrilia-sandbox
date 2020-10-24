#!/usr/bin/env bash

docker run --rm -p 8888:8888 -v "$PWD":/home/jovyan/work -e ODA_USER -e ODA_PASSWORD saspyrilia-sandbox start.sh jupyter lab
