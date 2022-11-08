resource "google_container_cluster" "nginx-cluster" {
  addons_config {
    gce_persistent_disk_csi_driver_config {
      enabled = "true"
    }

    network_policy_config {
      disabled = "true"
    }
  }

  cluster_autoscaling {
    enabled = "false"
  }

  cluster_ipv4_cidr = "10.88.0.0/14"

  database_encryption {
    state = "DECRYPTED"
  }

  default_max_pods_per_node   = "110"
  enable_binary_authorization = "false"
  enable_intranode_visibility = "false"
  enable_kubernetes_alpha     = "false"
  enable_legacy_abac          = "false"
  enable_shielded_nodes       = "true"
  enable_tpu                  = "false"
  initial_node_count          = "0"

  ip_allocation_policy {
    cluster_ipv4_cidr_block  = "10.88.0.0/14"
    services_ipv4_cidr_block = "10.92.0.0/20"
  }

  location = "asia-south1-a"

  logging_config {
    enable_components = ["SYSTEM_COMPONENTS", "WORKLOADS"]
  }

  logging_service = "logging.googleapis.com/kubernetes"

  master_auth {
    client_certificate_config {
      issue_client_certificate = "false"
    }
  }

  monitoring_config {
    enable_components = ["SYSTEM_COMPONENTS"]
  }

  monitoring_service = "monitoring.googleapis.com/kubernetes"
  name               = "nginx-cluster"
  network            = "projects/poc-project-367814/global/networks/ng-network"

  network_policy {
    enabled  = "false"
    provider = "PROVIDER_UNSPECIFIED"
  }

  networking_mode = "VPC_NATIVE"
  node_version    = "1.23.8-gke.1900"

  notification_config {
    pubsub {
      enabled = "false"
    }
  }

  project = "poc-project-367814"

  release_channel {
    channel = "REGULAR"
  }

  service_external_ips_config {
    enabled = "false"
  }

  subnetwork = "projects/poc-project-367814/regions/asia-south1/subnetworks/ng-subnet"
}
