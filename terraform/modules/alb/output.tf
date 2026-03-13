output "tg_arn" {
  description = "ALB target group arn"
  value       = aws_lb_target_group.alb_tg.arn
}