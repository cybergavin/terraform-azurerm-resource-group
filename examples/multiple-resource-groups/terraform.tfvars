global_tags = {
  Provisioner  = "Terraform"
}
resource_groups = {
  my-linux-rg = {
    location   = "canadacentral",
    tags       = {
      Owner      = "cybergavin",
      CostCenter = "C8888",
      Description = "Linux Infrastructure"} }

  my-windows-rg = {
    location   = "canadacentral",
    tags       = {
      Owner      = "cybergavin",
      CostCenter = "C9999",
      Description = "Windows Infrastructure"} }
}