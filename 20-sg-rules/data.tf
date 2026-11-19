data "aws_ssm_parameter" "mangodb" {
  name  = "/${var.project}/${var.environment}/mangodb_sg_id"
}

data "aws_ssm_parameter" "redis" {
  name  = "/${var.project}/${var.environment}/redis_sg_id"
}

data "aws_ssm_parameter" "mysql" {
  name  = "/${var.project}/${var.environment}/mysql_sg_id"
}

data "aws_ssm_parameter" "rabbitmq" {
  name  = "/${var.project}/${var.environment}/rabbitmq_sg_id"
}

data "aws_ssm_parameter" "catalogue" {
  name  = "/${var.project}/${var.environment}/catalogue_sg_id"
}

data "aws_ssm_parameter" "user" {
  name  = "/${var.project}/${var.environment}/user_sg_id"
}

data "aws_ssm_parameter" "cart" {
  name  = "/${var.project}/${var.environment}/cart_sg_id"
}

data "aws_ssm_parameter" "shipping" {
  name  = "/${var.project}/${var.environment}/shipping_sg_id"
}

data "aws_ssm_parameter" "payment" {
  name  = "/${var.project}/${var.environment}/payment_sg_id"
}

data "aws_ssm_parameter" "forntend" {
  name  = "/${var.project}/${var.environment}/frontend_sg_id"
}

data "aws_ssm_parameter" "backend_alb" {
  name  = "/${var.project}/${var.environment}/backend_alb_sg_id"
}

data "aws_ssm_parameter" "forntend_alb" {
  name  = "/${var.project}/${var.environment}/frontend_alb_sg_id"
}

data "aws_ssm_parameter" "bastion" {
  name  = "/${var.project}/${var.environment}/bastion_sg_id"
}

data "aws_ssm_parameter" "vpn" {
  name  = "/${var.project}/${var.environment}/vpn_sg_id"
}