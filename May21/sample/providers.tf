provider "google" {
    project = var.projectid 
    region = var.region
    zone = var.zone
    credentials = file("./credentials.json")
  
}