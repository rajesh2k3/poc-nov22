resource "google_compute_network" "ng-network" {
  auto_create_subnetworks         = "true"
  delete_default_routes_on_create = "false"
  description                     = "Network for the project"
  enable_ula_internal_ipv6        = "false"
  mtu                             = "1500"
  name                            = "ng-network"
  project                         = "poc-project-367814"
  routing_mode                    = "REGIONAL"
}

resource "google_compute_network" "raj-nw" {
  auto_create_subnetworks         = "false"
  delete_default_routes_on_create = "false"
  description                     = "raj-nw"
  enable_ula_internal_ipv6        = "false"
  mtu                             = "1500"
  name                            = "raj-nw"
  project                         = "poc-project-367814"
  routing_mode                    = "REGIONAL"
}
