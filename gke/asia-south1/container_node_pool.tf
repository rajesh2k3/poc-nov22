resource "google_container_node_pool" "tfer--nginx-cluster_default-pool" {
  cluster            = "${google_container_cluster.tfer--nginx-cluster.name}"
  initial_node_count = "3"
  location           = "asia-south1-a"

  management {
    auto_repair  = "true"
    auto_upgrade = "true"
  }

  max_pods_per_node = "110"
  name              = "default-pool"

  node_config {
    disk_size_gb    = "100"
    disk_type       = "pd-standard"
    image_type      = "COS_CONTAINERD"
    local_ssd_count = "0"
    machine_type    = "e2-medium"

    metadata = {
      disable-legacy-endpoints = "true"
    }

    oauth_scopes    = ["https://www.googleapis.com/auth/devstorage.read_only", "https://www.googleapis.com/auth/logging.write", "https://www.googleapis.com/auth/monitoring", "https://www.googleapis.com/auth/service.management.readonly", "https://www.googleapis.com/auth/servicecontrol", "https://www.googleapis.com/auth/trace.append"]
    preemptible     = "false"
    service_account = "default"

    shielded_instance_config {
      enable_integrity_monitoring = "true"
      enable_secure_boot          = "false"
    }

    spot = "false"
  }

  node_count     = "3"
  node_locations = ["asia-south1-a"]
  project        = "poc-project-367814"

  upgrade_settings {
    max_surge       = "1"
    max_unavailable = "0"
  }

  version = "1.23.8-gke.1900"
}
