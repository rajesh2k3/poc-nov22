output "google_container_cluster_nginx-cluster_self_link" {
  value = "${google_container_cluster.nginx-cluster.self_link}"
}

output "google_container_node_pool_nginx-cluster_node-pool_id" {
  value = "${google_container_node_pool.nginx-cluster_node-pool.id}"
}
