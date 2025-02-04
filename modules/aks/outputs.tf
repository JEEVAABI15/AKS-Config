output "aks_name" {
  value = azurerm_kubernetes_cluster.aks.name
}

# Output for AKS kubeconfig (to be used for kubectl)
output "kubeconfig" {
  value = azurerm_kubernetes_cluster.aks.kube_config_raw
}
