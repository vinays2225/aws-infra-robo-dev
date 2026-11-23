data "aws_ami" "joindevops" {
  most_recent = true

  owners = ["973714476881"]

  filter {
    name   = "name"
    values = ["Redhat-9-DevOps-Practice"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

}

data "aws_ssm_parameter" "public_subnet" {
  name = "/${var.project}/${var.environment}/subnet_public_id"
}

data "aws_ssm_parameter" "sg_bastion" {
  name = "/${var.project}/${var.environment}/bastion_sg_id"
}

