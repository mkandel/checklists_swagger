#!/usr/bin/env bash

docker run -t -i --name build_temp -v `pwd`:/go/src/github.com/mkandel/checklists golang:1.8.3-alpine3.6 go install github.com/mkandel/checklists/cmd/checklists-server
docker cp build_temp:/go/bin/checklists-server ./docker/checklists-server
docker rm build_temp
docker build -t checklists ./docker/
