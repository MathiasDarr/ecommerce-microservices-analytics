#!/bin/bash

if [[ $1 == 'aws' ]]
then
  aws cloudformation describe-stack-events --stack-name $1
elif [[ $1 == 'local' ]]
then
  aws --endpoint-url=http://localhost:4566 cloudformation describe-stack-events --stack-name kinesis-orders-stack
else
    echo "choose either local or aws"
fi
