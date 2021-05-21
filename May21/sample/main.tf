resource "google_compute_instance" "debian1" {
    name = "debian1"
    machine_type = "f1-micro"
    zone = var.zone
    network_interface {
      network = "default"

      access_config {
        
      }
    }

    boot_disk {
      initialize_params {
        image = "debian-cloud/debian-9"
      }
    }
  
}
