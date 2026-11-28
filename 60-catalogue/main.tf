resource "aws_instance" "main" {
  instance_type = "t3.micro"
  ami = local.ami
  vpc_security_group_ids = [local.catalogue_sgid]
  subnet_id = local.private_subnet[0] 

  tags = merge(local.common_tags,
  {
    Name="${local.common_name}-catalogue"
  })
}

resource "terraform_data" "main" {

    triggers_replace = [
        aws_instance.main.id
    ]
    
    connection {
      host = aws_instance.main.private_ip
      user = "ec2-user"
      password = "DevOps321"
      port = 22
      type = "ssh"
    }
    
    provisioner "file" {
      source = "${path.module}/bootstrap.sh"
      destination = "/tmp/bootstrap.sh"
    }

    provisioner "remote-exec" {
      inline = [ 
        "chmod +x /tmp/bootstrap.sh",
        "sudo sh /tmp/bootstrap.sh catalogue ${var.var.environment}"
       ]
    }
}

resource "aws_ec2_instance_state" "main" {
  instance_id = aws_instance.main.id
  state       = "stopped"

  depends_on = [ terraform_data.main ]
}

resource "aws_ami_from_instance" "main" {
  name               = "${local.common_name}-catalogue-${var.app_version}-${aws_instance.main.id}"
  source_instance_id = aws_ec2_instance_state.main.id

  depends_on = [ aws_ec2_instance_state.main ]

  tags = merge(local.common_tags,
  {
    Name="${local.common_name}-catalogue"
  })
}

resource "aws_lb_target_group" "main" {
  name        = "${local.common_name}-catalogue"
  port        = 8080
  protocol    = "HTTP"
  vpc_id      = local.vpc_id
  deregistration_delay = 10

  health_check {
    enabled = true
    healthy_threshold = 2
    interval = 10
    matcher = "200-299"
    path = "/health"
    port = 8080
    protocol = "HTTP"
    timeout = 5
    unhealthy_threshold = 2
  }
}


resource "aws_launch_template" "main" {
  name = "${local.common_name}-catalogue"
  image_id = aws_ami_from_instance.main.id
  instance_initiated_shutdown_behavior = "terminate"
  instance_type = "t3.micro"
  vpc_security_group_ids = [local.catalogue_sgid]
  update_default_version = true

  tag_specifications {
    resource_type = "instance"

    tags = merge(local.common_tags,
    {
        Name="${local.common_name}-catalogue"
    })
  }

    tag_specifications {
    resource_type = "volume"

    tags = merge(local.common_tags,
    {
        Name="${local.common_name}-catalogue"
    })
  }
}

resource "aws_autoscaling_group" "main" {
  availability_zones        = ["us-east-1a"]
  name                      = "${local.common_name}-catalogue"
  max_size                  = 5
  min_size                  = 1
  health_check_grace_period = 120
  health_check_type         = "ELB"
  force_delete              = true
  desired_capacity          = 2

  launch_template {
    id = aws_launch_template.main.id
    version = "$Latest"
  }

  vpc_zone_identifier = local.private_subnet
  target_group_arns = [aws_lb_target_group.main.arn]


  instance_refresh {
    strategy = "Rolling"
    preferences {
      min_healthy_percentage = 50
    }
    triggers = ["launch_template"]
  }


  dynamic "tag" {
   for_each = merge(
      local.common_tags,
      {
        Name = "${local.common_name}-catalogue"
      }
    )
    content {
      key                 = tag.key
      value               = tag.value
      propagate_at_launch = true
    } 
  }

  timeouts {
    delete = "15m"
  }

}


resource "aws_autoscaling_policy" "main" {
  autoscaling_group_name = aws_autoscaling_group.main.name
  name                   = "${local.common_name}-catalogue"
  policy_type            = "TargetTrackingScaling"

    target_tracking_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ASGAverageCPUUtilization"
    }
    target_value = 75.0 # Maintain ~75% average CPU
  }
   
}


resource "aws_lb_listener_rule" "main" {
  listener_arn = local.backend_arn
  priority     = 20

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.main.arn
  }

  condition {
    host_header {
      values = ["catalogue.backend-alb-${var.environment}.${var.domain_name}"]
    }
  }
}

resource "terraform_data" "calatogue-delete-instance" {
  
  triggers_replace = [
    aws_instance.main.id
  ]

    provisioner "local-exec" {
      command = "aws ec2 terminate-instances --instance-ids ${aws_instance.main.id}"
    }

    depends_on = [ aws_autoscaling_policy.main ]

}


