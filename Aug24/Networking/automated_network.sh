#!/bin/bash
set -x 

# This script creates a vpc with necessary subnets if they don't already exist
VPC_NAME='my-vpc'
SUBNET_NAMES=('web-1' 'web-2' 'web-3')
SUBNET_RANGES=('10.4.0.0/16' '10.5.0.0/16' '10.6.0.0/16')
SUBNET_REGIONS=('us-central1' 'us-east1' 'us-west1')

if gcloud compute networks describe "$VPC_NAME" > /dev/null 2>&1; then
    echo "VPC $VPC_NAME already exists"
else
    echo "Creating VPC $VPC_NAME"
    gcloud compute networks create "$VPC_NAME" \
        --subnet-mode=custom \
        --bgp-routing-mode=regional
fi

for index in {0..2}; do
    # verify if the subnet already exists
    if gcloud compute networks subnets describe "${SUBNET_NAMES[$index]}" --region "${SUBNET_REGIONS[$index]}" > /dev/null 2>&1; then
        echo "Subnet ${SUBNET_NAMES[$index]} already exists"
    else 
        echo "Creating Subnet ${SUBNET_NAMES[$index]}"
        gcloud compute networks subnets create "${SUBNET_NAMES[$index]}" \
            --network="$VPC_NAME" \
            --range="${SUBNET_RANGES[$index]}" \
            --region="${SUBNET_REGIONS[$index]}"
    fi
done
