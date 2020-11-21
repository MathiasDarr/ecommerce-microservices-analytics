#!/bin/bash

aws --endpoint-url=http://localhost:4566 firehose create-delivery-stream  \
  --cli-input-json file://$PWD/firehose_skeleton.json