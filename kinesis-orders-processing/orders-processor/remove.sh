#!/bin/bash

if [[ $1 == 'aws' ]]
then
  if [[ -z $2 ]]
  then
    aws cloudformation delete-stack --stack-name kinesis-orders-stack
  else
    aws cloudformation delete-stack --stack-name $2
  fi


elif [[ $1 == 'local' ]]
then
  if [[ -z $2 ]]
  then
    aws --endpoint-url=http://localhost:4566 cloudformation delete-stack --stack-name kinesis-orders-stack
  else
    aws --endpoint-url=http://localhost:4566 cloudformation delete-stack --stack-name $2
  fi

else
    echo "choose either local or aws"
fi

