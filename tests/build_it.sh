#!/bin/bash
set -x

: ${NODE_VERSION?"NODE_VERSION has not been set."}

docker build --build-arg "NODE_VERSION=${NODE_VERSION}" -t "koenlav/meteord:node-${NODE_VERSION}-base" ../base && \
  docker tag "koenlav/meteord:node-${NODE_VERSION}-base" koenlav/meteord:base
docker build --build-arg "NODE_VERSION=${NODE_VERSION}" -t "koenlav/meteord:node-${NODE_VERSION}-onbuild" ../onbuild && \
  docker tag "koenlav/meteord:node-${NODE_VERSION}-onbuild" koenlav/meteord:onbuild
docker build --build-arg "NODE_VERSION=${NODE_VERSION}" -t "koenlav/meteord:node-${NODE_VERSION}-devbuild" ../devbuild && \
 docker tag "koenlav/meteord:node-${NODE_VERSION}-devbuild" koenlav/meteord:devbuild
docker build --build-arg "NODE_VERSION=${NODE_VERSION}" -t "koenlav/meteord:node-${NODE_VERSION}-binbuild" ../binbuild && \
 docker tag "koenlav/meteord:node-${NODE_VERSION}-binbuild" koenlav/meteord:binbuild
