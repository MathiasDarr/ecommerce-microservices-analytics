#!/bin/bash

BUCKET="dakobed-serverless-apis"

sam package \
  --template-file template.yaml \
  --s3-bucket $BUCKET \
  --output-template-file package.yaml

if [[ $1 == 'aws' ]]
then
    aws cloudformation deploy \
      --template-file package.yaml \
      --stack-name kinesis-orders-stack \
      --capabilities CAPABILITY_IAM

#    aws cloudformation deploy --template template.yaml --stack-name kinesis-stack --capabilities CAPABILITY_IAM

elif [[ $1 == 'local' ]]
then
    aws cloudformation --endpoint-url=http://localhost:4566 deploy  \
      --template-file package.yaml \
      --stack-name $2\
      --capabilities CAPABILITY_IAM

else
    echo "choose either local or aws"
fi

