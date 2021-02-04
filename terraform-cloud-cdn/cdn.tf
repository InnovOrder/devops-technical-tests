module "cdn" {
  source = "github.com/candidate-project" # Link to the candidate project

  dns_name                     = var.dns_name
  google_dns_managed_zone_name = var.google_dns_managed_zone_name
}
