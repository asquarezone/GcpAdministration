output "publicip" {
    value = google_compute_instance.debian1.network_interface[0].access_config[0].nat_ip
}