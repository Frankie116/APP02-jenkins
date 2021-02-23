----------------------------------------------------------------------------------------------

## Project: APP01-mongodb

Purpose: This project creates a remote mongodb server that can be accessed on:
##  https: //mongodb.[my-domain]:27017

Terraform is used to create a loadbalanced fargate infrastructure.

A previously created docker image is pulled from either docker hub or AWS ECR.

The docker image is used by aws fargate to spin up redundant containers hosted in multiple AZs.

Library: https://github.com/Frankie116/my-library.git

Author:  Frank Effrim-Botchey

----------------------------------------------------------------------------------------------

Next feature release:

This project will be part of a jenkins/aws pipeline which monitors changes in this repo.

The following will be performed when changes are detected in the repo code.

  [1] Jenkins/codepipeline will use this repo to build a new docker image.
  
  [2] The new image will be pushed to either Docker Hub or AWS ECR.
  
  [3] Jenkins/codepipeline will direct Terraform to build the aws cloud infrastructure.
  
  [4] AWS ECS will pull the docker image from Docker Hub/ECR and run the app inside docker containers hosted on load balanced infrastucture which is publicly accessible in the aws cloud.
