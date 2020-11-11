#!/bin/bash

if [[ $1 == 'aws' ]]
then
    aws cloudformation deploy --template template.yaml --stack-name kinesis-stack --capabilities CAPABILITY_IAM
elif [[ $1 == 'local' ]]
then
  aws --endpoint-url=http://localhost:4566 cloudformation deploy --template template.yaml --stack-name kinesis-stack --capabilities CAPABILITY_IAM
else
    echo "choose either local or aws"
fi

