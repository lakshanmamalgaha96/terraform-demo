#!/bin/bash

# Load environment variables
export $(grep -v '^#' .env | xargs)

# Run Terraform with the loaded variable
terraform init
terraform apply -var "project_id=$PROJECT_ID" -auto-approve
