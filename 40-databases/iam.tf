resource "aws_iam_role" "mysql" {
  name = "${var.project}-${var.environment}-mysql"

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })

  tags = merge(local.common_tags,{Name="${var.project}-${var.environment}-mysql"})
}

resource "aws_iam_policy" "mysql_policy" {
  name        = "${var.project}-${var.environment}-mysql"
  description = "Allows listing all parameter store"
  policy      = templatefile("${path.module}/mysql_policy.json.tftpl", {
    account_id = local.account_id
    project=var.project
    environment = var.environment
  })
  tags = merge(local.common_tags,{Name="${var.project}-${var.environment}-mysql"})
}

resource "aws_iam_role_policy_attachment" "mysql_attach" {
  role       = aws_iam_role.mysql.name
  policy_arn = aws_iam_policy.mysql_policy.arn
}

resource "aws_iam_instance_profile" "mysql_profile" {
  name = "${var.project}-${var.environment}-mysql"
  role = aws_iam_role.mysql.name
}


resource "aws_iam_role" "rabbitmq" {
  name = "${var.project}-${var.environment}-rabbitmq"

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })

  tags = merge(local.common_tags,{Name="${var.project}-${var.environment}-rabbitmq"})
}

resource "aws_iam_policy" "rabbitmq_policy" {
  name        = "${var.project}-${var.environment}-rabbitmq"
  description = "Allows listing all parameter store"
  policy      = templatefile("${path.module}/rabbitmq_policy.json.tftpl", {
    account_id = local.account_id
    project=var.project
    environment = var.environment
  })
  tags = merge(local.common_tags,{Name="${var.project}-${var.environment}-rabbitmq"})
}

resource "aws_iam_role_policy_attachment" "rabbitmql_attach" {
  role       = aws_iam_role.rabbitmq.name
  policy_arn = aws_iam_policy.rabbitmq_policy.arn
}

resource "aws_iam_instance_profile" "rabbitq_profile" {
  name = "${var.project}-${var.environment}-rabbitmq"
  role = aws_iam_role.rabbitmq.name
}