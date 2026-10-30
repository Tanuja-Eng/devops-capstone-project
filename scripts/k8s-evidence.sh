#!/bin/bash
# Generates kube-images (task 30), kube-deploy-accounts (task 31)
# Run inside the lab terminal AFTER: make cluster / make build / make push / kubectl apply -f deploy/
docker images accounts:1.0 | tee kube-images
{
  echo "\$ kubectl get all -l app=accounts"
  kubectl get all -l app=accounts
} | tee kube-deploy-accounts
