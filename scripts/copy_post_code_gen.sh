#!/bin/bash

if [ -f post_code_gen/configure_checklists_swagger.go ]; then
    cp post_code_gen/configure_checklists_swagger.go restapi/
fi

if [ -f post_code_gen/initialiser.go ]; then
    cp post_code_gen/initialiser.go restapi/
fi
