#!/bin/bash
aws cloudformation describe-stack-events --stack-name kinesis-stack
#aws --endpoint-url=http://localhost:4566 cloudformation describe-stack-events --stack-name kinesis-stack