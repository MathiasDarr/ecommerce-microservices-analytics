#!/bin/bash

BUCKET="dakobed-serverless-apis"

sam package \
  --template-file template.yaml \
  --s3-bucket $BUCKET \
  --output-template-file package.yaml

if [[ $1 == 'aws' ]]
then
    if [[ -z $2 ]]
    then
      aws cloudformation deploy \
      --template-file package.yaml \
      --stack-name kinesis-orders-stack \
      --capabilities CAPABILITY_IAM
      aws --endpoint-url=http://localhost:4566 cloudformation delete-stack --stack-name kinesis-orders-stack
    else
      aws cloudformation deploy \
        --template-file package.yaml \
        --stack-name $2 \
        --capabilities CAPABILITY_IAM
    fi

elif [[ $1 == 'local' ]]
then
    if [[ -z $2 ]]
    then
      aws --endpoint-url=http://localhost:4566 cloudformation deploy \
        --template-file package.yaml \
        --stack-name kinesis-orders-stack \
        --capabilities CAPABILITY_IAM
    else
      aws --endpoint-url=http://localhost:4566 cloudformation deploy \
        --template-file package.yaml \
        --stack-name $2 \
        --capabilities CAPABILITY_IAM
    fi

else
    echo "choose either local or aws"
fi
