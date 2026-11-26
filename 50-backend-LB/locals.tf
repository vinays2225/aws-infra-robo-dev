locals {
  common_name="${var.project}-${var.environment}"
  zone_id = data.aws_route53_zone.route53_rec.zone_id
 subnet_private_id = split(",",data.aws_ssm_parameter.subnet_private_id.value)
 backend_alb_sg_id = data.aws_ssm_parameter.backend_alb_sg_id.value
  common_tags = {
    Project=var.project
    Environment=var.environment
    Terraform="True"
  }
}