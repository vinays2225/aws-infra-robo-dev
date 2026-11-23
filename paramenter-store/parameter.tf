resource "aws_ssm_parameter" "mysql" {
  name  = "/${var.project}/${var.environment}/mysql_root_password"
  type  = "SecureString"
  value = "Roboshop@1"
  overwrite = true
  tags = local.common_tags
}

resource "aws_ssm_parameter" "rabbitmq_user" {
  name  = "/${var.project}/${var.environment}/rabbitmq_user"
  type  = "SecureString"
  value = "roboshop"
  overwrite = true
  tags = local.common_tags
}

resource "aws_ssm_parameter" "rabbitmq_passwd" {
  name  = "/${var.project}/${var.environment}/rabbitmq_password"
  type  = "SecureString"
  value = "roboshop123"
  overwrite = true
  tags = local.common_tags
}