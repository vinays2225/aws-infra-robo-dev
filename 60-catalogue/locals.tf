locals {
  common_name="${var.project}-${var.environment}"
  ami = data.aws_ami.joindevops.value
  private_subnet = split("'",data.aws_ssm_parameter.subnet_private_id.value)
  catalogue_sgid = data.aws_ssm_parameter.catalogue_sg_id.value
  vpc_id = data.aws_ssm_parameter.vpc_id.value
  backend_arn = data.aws_ssm_parameter.backend_arn.value

  common_tags = {
    Project = var.project
    Environment = var.environment
    Terraform = "true"
  }
}