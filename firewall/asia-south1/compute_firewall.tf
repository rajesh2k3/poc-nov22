resource "google_compute_firewall" "tfer--default-allow-icmp" {
  allow {
    protocol = "icmp"
  }

  description   = "Allow ICMP from anywhere"
  direction     = "INGRESS"
  disabled      = "false"
  name          = "default-allow-icmp"
  network       = "${data.terraform_remote_state.networks.outputs.google_compute_network_tfer--default_self_link}"
  priority      = "65534"
  project       = "poc-project-367814"
  source_ranges = ["0.0.0.0/0"]
}

resource "google_compute_firewall" "tfer--default-allow-internal" {
  allow {
    ports    = ["0-65535"]
    protocol = "tcp"
  }

  allow {
    ports    = ["0-65535"]
    protocol = "udp"
  }

  allow {
    protocol = "icmp"
  }

  description   = "Allow internal traffic on the default network"
  direction     = "INGRESS"
  disabled      = "false"
  name          = "default-allow-internal"
  network       = "${data.terraform_remote_state.networks.outputs.google_compute_network_tfer--default_self_link}"
  priority      = "65534"
  project       = "poc-project-367814"
  source_ranges = ["10.128.0.0/9"]
}

resource "google_compute_firewall" "tfer--default-allow-rdp" {
  allow {
    ports    = ["3389"]
    protocol = "tcp"
  }

  description   = "Allow RDP from anywhere"
  direction     = "INGRESS"
  disabled      = "false"
  name          = "default-allow-rdp"
  network       = "${data.terraform_remote_state.networks.outputs.google_compute_network_tfer--default_self_link}"
  priority      = "65534"
  project       = "poc-project-367814"
  source_ranges = ["0.0.0.0/0"]
}

resource "google_compute_firewall" "tfer--default-allow-ssh" {
  allow {
    ports    = ["22"]
    protocol = "tcp"
  }

  description   = "Allow SSH from anywhere"
  direction     = "INGRESS"
  disabled      = "false"
  name          = "default-allow-ssh"
  network       = "${data.terraform_remote_state.networks.outputs.google_compute_network_tfer--default_self_link}"
  priority      = "65534"
  project       = "poc-project-367814"
  source_ranges = ["0.0.0.0/0"]
}

resource "google_compute_firewall" "tfer--gke-nginx-cluster-a6ffdb25-all" {
  allow {
    protocol = "ah"
  }

  allow {
    protocol = "esp"
  }

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "sctp"
  }

  allow {
    protocol = "tcp"
  }

  allow {
    protocol = "udp"
  }

  direction     = "INGRESS"
  disabled      = "false"
  name          = "gke-nginx-cluster-a6ffdb25-all"
  network       = "${data.terraform_remote_state.networks.outputs.google_compute_network_tfer--default_self_link}"
  priority      = "1000"
  project       = "poc-project-367814"
  source_ranges = ["10.88.0.0/14"]
  target_tags   = ["gke-nginx-cluster-a6ffdb25-node"]
}

resource "google_compute_firewall" "tfer--gke-nginx-cluster-a6ffdb25-exkubelet" {
  deny {
    ports    = ["10255"]
    protocol = "tcp"
  }

  direction     = "INGRESS"
  disabled      = "false"
  name          = "gke-nginx-cluster-a6ffdb25-exkubelet"
  network       = "${data.terraform_remote_state.networks.outputs.google_compute_network_tfer--default_self_link}"
  priority      = "1000"
  project       = "poc-project-367814"
  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["gke-nginx-cluster-a6ffdb25-node"]
}

resource "google_compute_firewall" "tfer--gke-nginx-cluster-a6ffdb25-inkubelet" {
  allow {
    ports    = ["10255"]
    protocol = "tcp"
  }

  direction     = "INGRESS"
  disabled      = "false"
  name          = "gke-nginx-cluster-a6ffdb25-inkubelet"
  network       = "${data.terraform_remote_state.networks.outputs.google_compute_network_tfer--default_self_link}"
  priority      = "999"
  project       = "poc-project-367814"
  source_ranges = ["10.88.0.0/14"]
  source_tags   = ["gke-nginx-cluster-a6ffdb25-node"]
  target_tags   = ["gke-nginx-cluster-a6ffdb25-node"]
}

resource "google_compute_firewall" "tfer--gke-nginx-cluster-a6ffdb25-vms" {
  allow {
    ports    = ["1-65535"]
    protocol = "tcp"
  }

  allow {
    ports    = ["1-65535"]
    protocol = "udp"
  }

  allow {
    protocol = "icmp"
  }

  direction     = "INGRESS"
  disabled      = "false"
  name          = "gke-nginx-cluster-a6ffdb25-vms"
  network       = "${data.terraform_remote_state.networks.outputs.google_compute_network_tfer--default_self_link}"
  priority      = "1000"
  project       = "poc-project-367814"
  source_ranges = ["10.128.0.0/9"]
  target_tags   = ["gke-nginx-cluster-a6ffdb25-node"]
}

resource "google_compute_firewall" "tfer--k8s-939c541cc59b92e6-node-http-hc" {
  allow {
    ports    = ["10256"]
    protocol = "tcp"
  }

  description   = "{\"kubernetes.io/cluster-id\":\"939c541cc59b92e6\"}"
  direction     = "INGRESS"
  disabled      = "false"
  name          = "k8s-939c541cc59b92e6-node-http-hc"
  network       = "${data.terraform_remote_state.networks.outputs.google_compute_network_tfer--default_self_link}"
  priority      = "1000"
  project       = "poc-project-367814"
  source_ranges = ["130.211.0.0/22", "209.85.152.0/22", "209.85.204.0/22", "35.191.0.0/16"]
  target_tags   = ["gke-nginx-cluster-a6ffdb25-node"]
}

resource "google_compute_firewall" "tfer--k8s-fw-ac0e08bc95fc54028bbe5dbc0e58c7c5" {
  allow {
    ports    = ["443", "80"]
    protocol = "tcp"
  }

  description   = "{\"kubernetes.io/service-name\":\"nginx-ns/nginx-app-nginx-svc\", \"kubernetes.io/service-ip\":\"34.100.139.240\"}"
  direction     = "INGRESS"
  disabled      = "false"
  name          = "k8s-fw-ac0e08bc95fc54028bbe5dbc0e58c7c5"
  network       = "${data.terraform_remote_state.networks.outputs.google_compute_network_tfer--default_self_link}"
  priority      = "1000"
  project       = "poc-project-367814"
  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["gke-nginx-cluster-a6ffdb25-node"]
}

resource "google_compute_firewall" "tfer--raj-fw" {
  allow {
    protocol = "all"
  }

  description   = "raj-fw"
  direction     = "INGRESS"
  disabled      = "false"
  name          = "raj-fw"
  network       = "${data.terraform_remote_state.networks.outputs.google_compute_network_tfer--raj-nw_self_link}"
  priority      = "1000"
  project       = "poc-project-367814"
  source_ranges = ["192.170.2.0/24"]
  target_tags   = ["fw-tags"]
}
