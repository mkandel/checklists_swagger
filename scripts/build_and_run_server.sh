#!/bin/bash

./scripts/copy_post_code_gen.sh

go run cmd/checklists_swagger-server/main.go --port=8080 --host=0.0.0.0
