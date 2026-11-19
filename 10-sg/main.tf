module "sg" {
 count = length(var.sg_names)
  source = "git::https://github.com/vinays2225/aws-sg-terraform.git?ref=main"
  project=var.project
  environment=var.environment
  sg_name= replace(var.sg_names[count.index],"_","-" )
  vpc_id = data.aws_ssm_parameter.vpc_id
}