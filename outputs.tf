output "master_public_ip" {
  value = google_compute_instance.gcpvm["master"].network_interface.0.access_config.0.nat_ip
}

output "master_private_ip" {
  value = google_compute_instance.gcpvm["master"].network_interface.0.network_ip
}

output "replica_public_ip" {
  value = google_compute_instance.gcpvm["replica"].network_interface.0.access_config.0.nat_ip
}

output "replica_private_ip" {
  value = google_compute_instance.gcpvm["replica"].network_interface.0.network_ip
}