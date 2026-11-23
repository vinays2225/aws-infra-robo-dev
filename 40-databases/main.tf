resource "aws_instance" "mongodb" {
  ami           = local.ami
  instance_type = "t3.micro"
  subnet_id     = local.subnet_database_id
  vpc_security_group_ids = [local.mongodb_sg_id]
  tags =merge( local.common_tags,
  {
    Name="${var.project}-${var.environment}-mongodb"
    })
}

resource "terraform_data" "monogodb" {

  triggers_replace = [
    aws_instance.mongodb.id
  ]
  
  connection {
    host = aws_instance.mongodb.private_ip
    user = "ec2-user"
    password = "DevOps321"
    type = "ssh"
    port = 22
  }

provisioner "remote-exec" {
    inline = [ 
      "echo '**************** remove old bootstrap file****************'",
      "rm /tmp/bootstrap.sh"  
    ]
  }

# Copies local file to the remote EC2 instance
  provisioner "file" {
    source      = "${path.module}/bootstrap.sh"
    destination = "/tmp/bootstrap.sh"
  }

  provisioner "remote-exec" {
    inline = [ 
      "chmod +x /tmp/bootstrap.sh",
      "sudo sh /tmp/bootstrap.sh mysql ${var.environment}"  
    ]
  }
}


resource "aws_instance" "redis" {
  ami           = local.ami
  instance_type = "t3.micro"
  subnet_id     = local.subnet_database_id
  vpc_security_group_ids = [local.redis_sg_id]
  tags = merge( local.common_tags,
  {
    Name="${var.project}-${var.environment}-redis"
    })
}

resource "terraform_data" "redis" {

  triggers_replace = [
    aws_instance.redis.id
  ]
  
  connection {
    host = aws_instance.redis.private_ip
    user = "ec2-user"
    password = "DevOps321"
    type = "ssh"
    port = 22
  }

 
provisioner "remote-exec" {
    inline = [ 
      "echo '**************** remove old bootstrap file****************'",
      "rm /tmp/bootstrap.sh"  
    ]
  }
# Copies local file to the remote EC2 instance
  provisioner "file" {
    source      = "${path.module}/bootstrap.sh"
    destination = "/tmp/bootstrap.sh"
  }

  provisioner "remote-exec" {
    inline = [ 
      "chmod +x /tmp/bootstrap.sh",
      "sudo sh /tmp/bootstrap.sh redis ${var.environment}"  
    ]
  }
}


resource "aws_instance" "mysql" {
  ami           = local.ami
  instance_type = "t3.micro"
  subnet_id     = local.subnet_database_id
  vpc_security_group_ids = [local.mysql_sg_id]
  iam_instance_profile = aws_iam_instance_profile.mysql_profile.name
  tags = merge( local.common_tags,
  {
    Name="${var.project}-${var.environment}-mysql"
    })
}

resource "terraform_data" "mysql" {

  triggers_replace = [
    aws_instance.mysql.id
  ]
  
  connection {
    host = aws_instance.mysql.private_ip
    user = "ec2-user"
    password = "DevOps321"
    type = "ssh"
    port = 22
  }

 
provisioner "remote-exec" {
    inline = [ 
      "echo '**************** remove old bootstrap file****************'",
      "rm /tmp/bootstrap.sh"  
    ]
  }
# Copies local file to the remote EC2 instance
  provisioner "file" {
    source      = "${path.module}/bootstrap.sh"
    destination = "/tmp/bootstrap.sh"
  }

  provisioner "remote-exec" {
    inline = [ 
      "chmod +x /tmp/bootstrap.sh",
      "sudo sh /tmp/bootstrap.sh mysql ${var.environment}"  
    ]
  }
}

resource "aws_instance" "rabbitmq" {
  ami           = local.ami
  instance_type = "t3.micro"
  subnet_id     = local.subnet_database_id
  vpc_security_group_ids = [local.rabbitmq_sg_id]
  iam_instance_profile = aws_iam_instance_profile.rabbitq_profile.name
  tags = merge( local.common_tags,
  {
    Name="${var.project}-${var.environment}-rabbitmq"
    })
}

resource "terraform_data" "rabbitmq" {

  triggers_replace = [
    aws_instance.rabbitmq.id
  ]
  
  connection {
    host = aws_instance.rabbitmq.private_ip
    user = "ec2-user"
    password = "DevOps321"
    type = "ssh"
    port = 22
  }

 

# Copies local file to the remote EC2 instance
  provisioner "file" {
    source      = "${path.module}/bootstrap.sh"
    destination = "/tmp/bootstrap.sh"
  }

  provisioner "remote-exec" {
    inline = [ 
      "chmod +x /tmp/bootstrap.sh",
      "sudo sh /tmp/bootstrap.sh rabbitmq ${var.environment}"  
    ]
  }
}

