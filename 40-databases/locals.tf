locals{
    common_name = "${var.project}-${var.environment}"
    domain_name="yanvisol.online"
    zone_id = data.aws_route53_zone.route53_rec.zone_id
    ami = data.aws_ami.joindevops.id
    account_id = data.aws_caller_identity.current.account_id

  subnet_database_id = split(",",data.aws_ssm_parameter.subnet_database_id.value)[0]
  mongodb_sg_id = data.aws_ssm_parameter.mongodb_sg_id.value
  redis_sg_id = data.aws_ssm_parameter.redis_sg_id.value
  mysql_sg_id = data.aws_ssm_parameter.mysql_sg_id.value
  rabbitmq_sg_id = data.aws_ssm_parameter.rabbitmq_sg_id.value

    common_tags ={
        Project = var.project
        Environment = var.environment
        Terraforn ="true"
        Name = local.common_name
    }
}