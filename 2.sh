#!/bin/bash

# git clone https://github.com/GoogleCloudPlatform/terraform-google-lb-http.git
cd terraform-google-lb-http/examples/multi-backend-multi-mig-bucket-https-lb

terraform init

PROJECT_ID=$(gcloud config get-value project)

terraform plan -out=tfplan -var "project=$PROJECT_ID"

terraform apply tfplan

EXTERNAL_IP=$(terraform output | grep load-balancer-ip | cut -d = -f2 | xargs echo -n)

echo https://${EXTERNAL_IP}