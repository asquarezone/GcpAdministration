#!/bin/bash
# Create a vpc
gcloud compute networks create 'ntier' --description 'ntier basic architecture' --subnet-mode='custom'

# Create subnet-1
gcloud compute networks subnets create 'subnet-1' --network='ntier' --range='192.168.0.0/24' --description 'ntier in central us' --region='us-central1'

# Create subnet-2
gcloud compute networks subnets create 'subnet-2' --network='ntier' --range='192.168.1.0/24' --description 'ntier in east us' --region='us-east1'

# Create a firewall rule to open 22,80 ports from any where to vm instances with tag 'web'
gcloud compute firewall-rules create 'web-firewall' --network='ntier' --source-ranges='0.0.0.0/0' --direction='INGRESS' --action='ALLOW' --rules='tcp:22,tcp:80' --target-tags='web' --priority='2000'

# Create a firewall rule to allow to open 22, 8080 ports from tag web to tag app
gcloud compute firewall-rules create 'app-firewall' --network='ntier' --direction='INGRESS' --action='ALLOW' --rules='tcp:22,tcp:8080' --source-tags='web' --target-tags='app' --priority='2000'

# Create a firewall rule to allow to open 22, 3306 ports from tag app to tag db
gcloud compute firewall-rules create 'db-firewall' --network='ntier'  --direction='INGRESS' --action='ALLOW' --rules='tcp:22,tcp:3306' --source-tags='app' --target-tags='db' --priority='2000'