#!/bin/bash

imageName=${IMAGE_NAME}
tagName=${TAG_NAME}
AWS_ACCOUNT_ID=${AWS_ACCOUNT_ID}

aws ecr get-login-password --region ap-northeast-2 | docker login --username AWS --password-stdin ${AWS_ACCOUNT_ID}.dkr.ecr.ap-northeast-2.amazonaws.com

aws ecr describe-repositories --repository-names ${imageName} || aws ecr create-repository --repository-name ${imageName}

docker build -t ${imageName}:${tagName} .

docker tag ${imageName}:${tagName} ${AWS_ACCOUNT_ID}.dkr.ecr.ap-northeast-2.amazonaws.com/${imageName}:${tagName}

docker push ${AWS_ACCOUNT_ID}.dkr.ecr.ap-northeast-2.amazonaws.com/${imageName}:${tagName}