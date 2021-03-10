$IMAGE_FAMILY=gcloud compute images list --filter='name:centos-7' --format="value(FAMILY)"
$IMAGE_PROJECT=gcloud compute images list --filter='name:centos-7' --format="value(PROJECT)"
Write-Output "FAMILY = $IMAGE_FAMILY and PROJECT = $IMAGE_PROJECT"
gcloud compute instances create 'qt-centos' --image-family="$IMAGE_FAMILY" --image-project="$IMAGE_PROJECT"  --machine-type 'f1-micro' --boot-disk-auto-delete --zone='us-central1-b'
gcloud compute instances list --filter="name:qt-centos"
$EXTERNAL_IP=gcloud compute instances list --filter="name:qt-centos" --format="value(EXTERNAL_IP)"
Write-Output "ssh -i ~/.ssh/id_rsa qtkha@$EXTERNAL_IP"
gcloud compute instances delete 'qt-centos'