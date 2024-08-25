#!/bin/bash
set -x 

# This script creates a vpc if they don't already exist
VPC_NAME=$1

if gcloud compute networks describe "$VPC_NAME" > /dev/null 2>&1; then
    echo "VPC $VPC_NAME already exists"
else
    echo "Creating VPC $VPC_NAME"
    gcloud compute networks create "$VPC_NAME" \
        --subnet-mode=custom \
        --bgp-routing-mode=regional
fi