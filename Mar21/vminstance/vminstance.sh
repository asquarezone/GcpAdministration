#!/bin/bash
export IMAGE_NAME=$(gcloud compute images list --filter='name:ubuntu-2004' --format="value(NAME)")
export IMAGE_FAMILY=$(gcloud compute images list --filter='name:ubuntu-2004' --format="value(FAMILY)")
export IMAGE_PROJECT=$(gcloud compute images list --filter='name:ubuntu-2004' --format="value(PROJECT)")
echo "The image found is $IMAGE_NAME"
gcloud compute instances create 'qt-fromcli' --image-family=ubuntu-2004-lts --image-project="ubuntu-os-cloud"  --machine-type 'f1-micro' --boot-disk-auto-delete --zone='us-central1-b'