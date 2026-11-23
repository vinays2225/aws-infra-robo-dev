locals {
  common_tags = {
    Project     = var.project
    Environment = var.environment
    Terraform   = "true"
    Name        = "${var.project}-${var.environment}-bastion"
  }

  ami              = data.aws_ami.joindevops.id
  public_subnet_id = split(",", data.aws_ssm_parameter.public_subnet.value)[0]
  sg_bastion_id    = data.aws_ssm_parameter.sg_bastion.value
}