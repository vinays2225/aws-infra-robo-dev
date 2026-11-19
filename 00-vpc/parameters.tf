resource "aws_ssm_parameter" "vpc_id" {
  name        = "/${var.project}/${var.environment}/vpc_id"
  description = "VPC id"
  type        = "String"
  value       = module.main.vpc_id
}

resource "aws_ssm_parameter" "public_subnet_ids" {
  name        = "/${var.project}/${var.environment}/subnet_public_id"
  description = "subnet public id"
  type        = "StringList"
  value       = join(",",module.main.subnet_public_id)
}

resource "aws_ssm_parameter" "private_subnet_ids" {
  name        = "/${var.project}/${var.environment}/subnet_private_id"
  description = "subnet private id"
  type        = "StringList"
  value       = join(",",module.main.subnet_private_id)
}

resource "aws_ssm_parameter" "database_subnet_ids" {
  name        = "/${var.project}/${var.environment}/subnet_database_id"
  description = "subnet database id"
  type        = "StringList"
  value       = join(",",module.main.subnet_database_id)
}