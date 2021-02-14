#!/bin/bash
# Create a gcp network
gcloud compute networks create 'my-vpc-from-cli' --description 'this is from cli' --subnet-mode 'custom'
gcloud compute networks subnets create 'web-useast1' --network 'my-vpc-from-cli' --range '10.10.0.0/24' --region 'us-east1'
gcloud compute networks subnets create 'web-uswest1' --network 'my-vpc-from-cli' --range '172.16.0.0/24' --region 'us-west1'
gcloud compute networks subnets create 'web-uscentral1' --network 'my-vpc-from-cli' --range '192.168.0.0/24' --region 'us-central1'