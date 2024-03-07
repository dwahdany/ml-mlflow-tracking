#!/bin/bash
python_version=3.10
special_tag='latest'
tag=py-$python_version
image=registry.gitlab.cc-asp.fraunhofer.de/ml/docker/mlflow-tracking
docker buildx build -t $image:$tag .
docker push $image:$tag
# check if special_tag is not none
if [[ "$special_tag" != "" ]]; then
    docker tag $image:$tag $image:$special_tag
    docker push $image:$special_tag
fi