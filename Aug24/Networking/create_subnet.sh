#!/bin/bash
VPC_NAME=$1
SUBNET_NAME=$2
IP_RANGE=$3
REGION=$4

if gcloud compute networks subnets describe "${SUBNET_NAME}" --region "${REGION}" > /dev/null 2>&1; then
    echo "Subnet ${SUBNET_NAME} already exists"
else 
    echo "Creating Subnet ${SUBNET_NAME}"
    gcloud compute networks subnets create "${SUBNET_NAME}" \
        --network="$VPC_NAME" \
        --range="${IP_RANGE}" \
        --region="${REGION}"
fi