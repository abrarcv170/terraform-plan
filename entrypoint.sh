#!/bin/sh

if [ -z "$AWS_ACCESS_KEY_ID" ]; then
  echo "AWS_ACCESS_KEY_ID is not set. Quitting."
  exit 1
fi

if [ -z "$AWS_SECRET_ACCESS_KEY" ]; then
  echo "AWS_SECRET_ACCESS_KEY is not set. Quitting."
  exit 1
fi

# Default to us-east-1 if AWS_REGION not set.
if [ -z "$AWS_REGION" ]; then
  echo "NO REGION FOUND, Quitting."
  exit 1
fi

terraform init
export AWS_ACCESS_KEY_ID=${AWS_ACCESS_KEY_ID}
export AWS_SECRET_ACCESS_KEY=${AWS_SECRET_ACCESS_KEY}
export AWS_REGION=${AWS_REGION}
ls
terraform plan  -out=myplan  -detailed-exitcode
if [ $? -eq 2 ]
then
 echo "YOU ARE READY TO APPLY"
 #terraform  apply myplan
 unset AWS_ACCESS_KEY_ID
 unset AWS_SECRET_ACCESS_KEY
 unset AWS_REGION
 exit 0
else
 echo "REVIEW  YOUR CODE OR THIS CODE WILL NOT BRING ANY  CHANGES TO YOUR INFRASTRUCTURE"
 unset AWS_ACCESS_KEY_ID
 unset AWS_SECRET_ACCESS_KEY
 unset AWS_REGION
 exit 1
fi
