locals {
  project_id       = "ci-cd-workshop-358219"
  network          = "default"
  image            = "ubuntu-2004-focal-v20220810"
  ssh_user         = "ansible"

  web_servers = {
    master = {
      machine_type = "e2-micro"
      zone         = "europe-west2-a"
    }
    replica = {
      machine_type = "e2-micro"
      zone         = "europe-west2-c"
    }
  }
}

provider "google" {
  project = local.project_id
  region  = "europe-west2"
}

resource "google_service_account" "terraform" {
  account_id = "terraform-service-account"
}

resource "google_compute_firewall" "web" {
  name    = "web-access"
  network = local.network

  allow {
    protocol = "tcp"
    ports    = ["80"]
  }

    allow {
    protocol = "tcp"
    ports    = ["22"]
  }

      allow {
    protocol = "tcp"
    ports    = ["3306"]
  }


  source_ranges           = ["0.0.0.0/0"]
  target_service_accounts = [google_service_account.terraform.email]
}

resource "google_compute_instance" "gcpvm" {
  for_each = local.web_servers

  name         = each.key
  machine_type = each.value.machine_type
  zone         = each.value.zone

  boot_disk {
    initialize_params {
      image = local.image
    }
  }

  network_interface {
    network = local.network
    access_config {}
  }

  service_account {
    email  = google_service_account.terraform.email
    scopes = ["cloud-platform"]
  }
}