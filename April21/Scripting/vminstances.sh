#!/bin/bash
# fetch all the zones where your vm instances are running
for zone in $(gcloud compute instances list --format="value(zone)"  --filter="status = RUNNING")
do
    echo "current zone is $zone"
    # Lets iterate through all the instances in the zone
    for instance in $(gcloud compute instances list --zones=$zone --format="value(name)"  --filter="status = RUNNING")
    do
      echo "stopping the vm instance $instance"
      gcloud compute instances stop $instance --zone="$zone"
    done
done