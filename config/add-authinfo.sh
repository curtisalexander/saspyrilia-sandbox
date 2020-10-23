#!/usr/bin/env bash

echo "oda user ${ODA_USER} password ${ODA_PASSWORD}" > /home/${NB_USER}/.authinfo
chmod 600 /home/${NB_USER}/.authinfo