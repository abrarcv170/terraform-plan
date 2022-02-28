# Terraform-plan-Action 
#### Terraform is a popular infrastructure as code tool which help us to store our infrastructue as human-readable configuration files that we can version, reuse, and share.This action   will perform basic terraform plan operation and  return  the code changes will bring any infrastructure changes or not.
#### The main objective of the action is not limited to just terraform plan operation, as we know terraform is a powerfull tool,let me give an example if someone  added the code for a static website to github at that time we can host a static site in AWS with the  help of terraform,so we can modify  this action based on our constraints,also this action  originated from the thought of  versioning terraform configurations.

## How to use
1. create a AWS IAM user  with  programatic access 
2. configure the following github repo secrets **AWS_ACCESS_KEY**,**AWS_SECRET_ACCESS_KEY**,**AWS_REGION**
3. create wokflow file in the path _.github/workflows/_ eg: _.github/workflows/main.yml_
```
name: terraform plan

on:
  push:
    branches:
  #replace with your branch name  
      - master
  #you can specify filename if required 
  #  paths:
  #   - ec2.tf

jobs:
  planning:
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@v2
    - uses: abrarcv170/terraform-plan@main
      with:
        args: --acl public-read  --follow-symlinks --delete --exclude '.git/*' --exclude '.github/*'
      env:
        AWS_ACCESS_KEY_ID: ${{ secrets.AWS_ACCESS_KEY }}
        AWS_SECRET_ACCESS_KEY: ${{ secrets.AWS_SECRET_ACCESS_KEY }}
        AWS_REGION: ${{ secrets.AWS_REGION }}
```
