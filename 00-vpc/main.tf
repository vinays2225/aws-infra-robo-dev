module "main" {
  #source = "../../terraform-vpc"
  source      = "git::https://github.com/vinays2225/terraform-vpc.git?ref=main"
  project     = var.project
  environment = var.environment
}