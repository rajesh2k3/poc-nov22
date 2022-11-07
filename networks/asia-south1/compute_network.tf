resource "google_compute_network" "tfer--default" {
  auto_create_subnetworks         = "true"
  delete_default_routes_on_create = "false"
  description                     = "Default network for the project"
  enable_ula_internal_ipv6        = "false"
  mtu                             = "0"
  name                            = "default"
  project                         = "poc-project-367814"
  routing_mode                    = "REGIONAL"
}

resource "google_compute_network" "tfer--raj-nw" {
  auto_create_subnetworks         = "false"
  delete_default_routes_on_create = "false"
  description                     = "raj-nw"
  enable_ula_internal_ipv6        = "false"
  mtu                             = "1500"
  name                            = "raj-nw"
  project                         = "poc-project-367814"
  routing_mode                    = "REGIONAL"
}
