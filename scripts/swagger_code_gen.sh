#!/bin/bash

set swagger='docker run --rm -it -e GOPATH=/Users/marc/src/go/playing_with_go:/Users/marc/go:/go -v /Users/marc:/Users/marc -w /Users/marc/Documents/src/go/playing_with_go/src/github.com/mkandel/checklists_swagger/spec quay.io/goswagger/swagger'
set -e

rm -rf swagger.json
json-refs resolve -f --filter relative ./spec/root.yml >> swagger.json
rm -rf restapi/
rm -rf models/
swagger generate server -A checklists -f swagger.json --model-package=models

./scripts/copy_post_code_gen.sh

rm -rf client/
swagger generate client -f swagger.json -A checklists
