#!/bin/bash

OPCUA_SAMPLER_IMAGE_NAME=intersystemsdc/irisdemo-demo-oee:opcua-sampler-test

docker run \
    --name opcua_sampler_test --init --rm \
    -v $PWD/data:/app/data \
    -p 4840:4840 \
    $OPCUA_SAMPLER_IMAGE_NAME