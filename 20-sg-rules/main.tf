resource "aws_vpc_security_group_ingress_rule" "mangodb_catalogue" {
  security_group_id = local.mongodb_sg_id
  from_port   = 27017
  ip_protocol = "tcp"
  to_port     = 27017
  referenced_security_group_id= local.catalogue_sg_id
}

resource "aws_vpc_security_group_ingress_rule" "mangodb_user" {
  security_group_id = local.mongodb_sg_id
  from_port   = 27017
  ip_protocol = "tcp"
  to_port     = 27017
  referenced_security_group_id= local.user_sg_id
}

resource "aws_vpc_security_group_ingress_rule" "mangodb_bastion" {
  security_group_id = local.mongodb_sg_id
  from_port   = 22
  ip_protocol = "tcp"
  to_port     = 22
  referenced_security_group_id= local.bastion_sg_id
}

resource "aws_vpc_security_group_ingress_rule" "redis_user" {
  security_group_id = local.redis_sg_id
  from_port   = 6379
  ip_protocol = "tcp"
  to_port     = 6379
  referenced_security_group_id= local.user_sg_id
}

resource "aws_vpc_security_group_ingress_rule" "redis_cart" {
  security_group_id = local.redis_sg_id
  from_port   = 6379
  ip_protocol = "tcp"
  to_port     = 6379
  referenced_security_group_id= local.cart_sg_id
}
resource "aws_vpc_security_group_ingress_rule" "redis_bastion" {
  security_group_id = local.redis_sg_id
  from_port   = 22
  ip_protocol = "tcp"
  to_port     = 22
  referenced_security_group_id= local.bastion_sg_id
}


resource "aws_vpc_security_group_ingress_rule" "mysql_shipping" {
  security_group_id = local.mysql_sg_id
  from_port   = 3306
  ip_protocol = "tcp"
  to_port     = 3306
  referenced_security_group_id= local.shipping_sg_id
}

resource "aws_vpc_security_group_ingress_rule" "mysql_bastion" {
  security_group_id = local.mysql_sg_id
  from_port   = 22
  ip_protocol = "tcp"
  to_port     = 22
  referenced_security_group_id= local.bastion_sg_id
}


resource "aws_vpc_security_group_ingress_rule" "rabbitmq_payment" {
  security_group_id = local.rabbitmq_sg_id
  from_port   = 5672
  ip_protocol = "tcp"
  to_port     = 5672
  referenced_security_group_id= local.payment_sg_id
}

resource "aws_vpc_security_group_ingress_rule" "rabbitmq_bastion" {
  security_group_id = local.rabbitmq_sg_id
  from_port   = 22
  ip_protocol = "tcp"
  to_port     = 22
  referenced_security_group_id= local.bastion_sg_id
}

resource "aws_vpc_security_group_ingress_rule" "catalogue-payment" {
  security_group_id = local.catalogue_sg_id
  from_port   = 8080
  ip_protocol = "tcp"
  to_port     = 8080
  referenced_security_group_id= local.payment_sg_id
}

resource "aws_vpc_security_group_ingress_rule" "catalogue-fornt_alb" {
  security_group_id = local.catalogue_sg_id
  from_port   = 8080
  ip_protocol = "tcp"
  to_port     = 8080
  referenced_security_group_id= local.backend_alb_sg_id
}

resource "aws_vpc_security_group_ingress_rule" "catalogue_bastion" {
  security_group_id = local.rabbitmq_sg_id
  from_port   = 22
  ip_protocol = "tcp"
  to_port     = 22
  referenced_security_group_id= local.bastion_sg_id
}

resource "aws_vpc_security_group_ingress_rule" "cart-payment" {
  security_group_id = local.cart_sg_id
  from_port   = 8080
  ip_protocol = "tcp"
  to_port     = 8080
  referenced_security_group_id= local.payment_sg_id
}

resource "aws_vpc_security_group_ingress_rule" "cart-fornt_alb" {
  security_group_id = local.cart_sg_id
  from_port   = 8080
  ip_protocol = "tcp"
  to_port     = 8080
  referenced_security_group_id= local.backend_alb_sg_id
}
resource "aws_vpc_security_group_ingress_rule" "cart-shipping" {
  security_group_id = local.cart_sg_id
  from_port   = 8080
  ip_protocol = "tcp"
  to_port     = 8080
  referenced_security_group_id= local.shipping_sg_id
}
resource "aws_vpc_security_group_ingress_rule" "cart_bastion" {
  security_group_id = local.cart_sg_id
  from_port   = 22
  ip_protocol = "tcp"
  to_port     = 22
  referenced_security_group_id= local.bastion_sg_id
}


resource "aws_vpc_security_group_ingress_rule" "user_bastion" {
  security_group_id = local.user_sg_id
  from_port   = 22
  ip_protocol = "tcp"
  to_port     = 22
  referenced_security_group_id= local.bastion_sg_id
}

resource "aws_vpc_security_group_ingress_rule" "user-payment" {
  security_group_id = local.user_sg_id
  from_port   = 8080
  ip_protocol = "tcp"
  to_port     = 8080
  referenced_security_group_id= local.payment_sg_id
}

resource "aws_vpc_security_group_ingress_rule" "user-fornt_alb" {
  security_group_id = local.user_sg_id
  from_port   = 8080
  ip_protocol = "tcp"
  to_port     = 8080
  referenced_security_group_id= local.backend_alb_sg_id
}


resource "aws_vpc_security_group_ingress_rule" "shipping_bastion" {
  security_group_id = local.shipping_sg_id
  from_port   = 22
  ip_protocol = "tcp"
  to_port     = 22
  referenced_security_group_id= local.bastion_sg_id
}



resource "aws_vpc_security_group_ingress_rule" "shipping-fornt_alb" {
  security_group_id = local.shipping_sg_id
  from_port   = 8080
  ip_protocol = "tcp"
  to_port     = 8080
  referenced_security_group_id= local.backend_alb_sg_id
}

resource "aws_vpc_security_group_ingress_rule" "payment_bastion" {
  security_group_id = local.payment_sg_id
  from_port   = 22
  ip_protocol = "tcp"
  to_port     = 22
  referenced_security_group_id= local.bastion_sg_id
}



resource "aws_vpc_security_group_ingress_rule" "payment-fornt_alb" {
  security_group_id = local.payment_sg_id
  from_port   = 8080
  ip_protocol = "tcp"
  to_port     = 8080
  referenced_security_group_id= local.backend_alb_sg_id
}

resource "aws_vpc_security_group_ingress_rule" "backend_alb_frontend" {
  security_group_id = local.backend_alb_sg_id
  from_port   = 80
  ip_protocol = "tcp"
  to_port     = 80
  referenced_security_group_id= local.frontend_sg_id
}


resource "aws_vpc_security_group_ingress_rule" "backend_alb_vpn" {
  security_group_id = local.backend_alb_sg_id
  from_port   = 80
  ip_protocol = "tcp"
  to_port     = 80
  referenced_security_group_id= local.vpn_sg_id
}
resource "aws_vpc_security_group_ingress_rule" "backend_alb_bastion" {
  security_group_id = local.frontend_sg_id
  from_port   = 22
  ip_protocol = "tcp"
  to_port     = 22
  referenced_security_group_id= local.bastion_sg_id
}

resource "aws_vpc_security_group_ingress_rule" "frontend_bastion" {
  security_group_id = local.frontend_sg_id
  from_port   = 22
  ip_protocol = "tcp"
  to_port     = 22
  referenced_security_group_id= local.bastion_sg_id
}

resource "aws_vpc_security_group_ingress_rule" "frontend_vpn" {
  security_group_id = local.frontend_sg_id
  from_port   = 22
  ip_protocol = "tcp"
  to_port     = 22
  referenced_security_group_id= local.vpn_sg_id
}



resource "aws_vpc_security_group_ingress_rule" "frontend-fornt_alb" {
  security_group_id = local.frontend_sg_id
  from_port   = 80
  ip_protocol = "tcp"
  to_port     = 80
  referenced_security_group_id= local.frontend_alb_sg_id
}

# Frontend ALB

resource "aws_vpc_security_group_ingress_rule" "frontend_alb_public_http" {
  security_group_id = local.frontend_alb_sg_id # destination, where you are creating the rule

  cidr_ipv4   = "0.0.0.0/0"  # source, where is traffic coming from
  from_port   = 80
  ip_protocol = "tcp"
  to_port     = 80
}

resource "aws_vpc_security_group_ingress_rule" "frontend_alb_public_https" {
  security_group_id = local.frontend_alb_sg_id # destination, where you are creating the rule

  cidr_ipv4   = "0.0.0.0/0"  # source, where is traffic coming from
  from_port   = 443
  ip_protocol = "tcp"
  to_port     = 443
}