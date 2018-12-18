#!/bin/bash
PIPELINE_VERSION=0.1.4
kubectl create -f https://storage.googleapis.com/ml-pipeline/release/$PIPELINE_VERSION/bootstrapper.yaml

kubectl get job
echo "Waiting until number of successful runs is 1 ..."

while [ $(kubectl get job | tail -1 | awk '{print $3}') -lt 1 ]
do 
echo "waiting"
sleep 1
done

kubectl get job
