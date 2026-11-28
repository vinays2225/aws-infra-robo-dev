resource "aws_ssm_parameter" "" {
  
  name      = "/${var.project}/${var.environment}/certfrontend_alb_certificate_arn"
  type      = "String"
  value     = aws_acm_certificate.main.arn
  overwrite = true
}