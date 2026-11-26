data "aws_ssm_parameter" "backend_alb_sg_id" {
  name = "/${var.project}/${var.environment}/backend_alb_sg_id"
}

data "aws_ssm_parameter" "subnet_private_id" {
  name = "/${var.project}/${var.environment}/subnet_private_id"
}

data "aws_route53_zone" "route53_rec" {
  name         = var.domain_name
  private_zone = false
}