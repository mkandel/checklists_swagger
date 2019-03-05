#!/bin/bash -l

shopt -s expand_aliases
. ~/.bash_profile
set -e

rm -rf swagger.json
json-refs resolve -f --filter relative ./spec/root.yml >> swagger.json
rm -rf restapi/
rm -rf models/
rm -rf cmd/
swagger generate server -A checklists -f swagger.json --model-package=models

./scripts/copy_post_code_gen.sh

rm -rf client/
swagger generate client -f swagger.json -A checklists
#go get -u -f ./...
