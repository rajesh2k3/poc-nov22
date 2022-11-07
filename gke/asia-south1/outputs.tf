output "google_container_cluster_tfer--nginx-cluster_self_link" {
  value = "${google_container_cluster.tfer--nginx-cluster.self_link}"
}

output "google_container_node_pool_tfer--nginx-cluster_default-pool_id" {
  value = "${google_container_node_pool.tfer--nginx-cluster_default-pool.id}"
}
