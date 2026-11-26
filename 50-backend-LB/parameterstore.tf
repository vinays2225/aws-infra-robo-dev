resource "aws_ssm_parameter" "" {
  
  name      = "/${var.project}/${var.environment}/backend_lb_listener_http_arn"
  type      = "String"
  value     = aws_lb_listener.backend-alb-http.arn
  overwrite = true
}