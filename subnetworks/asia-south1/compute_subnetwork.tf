resource "google_compute_subnetwork" "ng-subnet" {
  ip_cidr_range              = "10.160.0.0/20"
  name                       = "ng-subnet"
  network                    = "${data.terraform_remote_state.networks.outputs.google_compute_network_ng-subnet_self_link}"
  private_ip_google_access   = "true"
  private_ipv6_google_access = "DISABLE_GOOGLE_ACCESS"
  project                    = "poc-project-367814"
  purpose                    = "PRIVATE"
  region                     = "asia-south1"

  secondary_ip_range {
    ip_cidr_range = "10.88.0.0/14"
    range_name    = "gke-nginx-cluster-pods-a6ffdb25"
  }

  secondary_ip_range {
    ip_cidr_range = "10.92.0.0/20"
    range_name    = "gke-nginx-cluster-services-a6ffdb25"
  }

  stack_type = "IPV4_ONLY"
}

resource "google_compute_subnetwork" "raj-subnet" {
  description                = "raj-subnet"
  ip_cidr_range              = "10.0.2.0/24"
  name                       = "raj-subnet"
  network                    = "${data.terraform_remote_state.networks.outputs.google_compute_network_raj-nw_self_link}"
  private_ip_google_access   = "false"
  private_ipv6_google_access = "DISABLE_GOOGLE_ACCESS"
  project                    = "poc-project-367814"
  purpose                    = "PRIVATE"
  region                     = "asia-south1"
  stack_type                 = "IPV4_ONLY"
}
