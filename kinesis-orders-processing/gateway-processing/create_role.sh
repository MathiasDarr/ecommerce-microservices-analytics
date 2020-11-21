#!/bin/bash

aws --endpoint-url=http://localhost:4566 iam create-role --role-name super-role \
    --assume-role-policy-document file://$PWD/iam_policy.json