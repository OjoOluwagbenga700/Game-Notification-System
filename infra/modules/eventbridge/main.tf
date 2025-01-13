resource "aws_scheduler_schedule" "gameday_scheduler" {
  name       = "gameday-schedule"
  group_name = "default"
  

  flexible_time_window {
    mode = "OFF"
  }

  schedule_expression = "cron(0/30 21-23 * * ? *)"
  schedule_expression_timezone = "Africa/Lagos"    
  target {
    arn      = var.game_lambda_function_arn
    role_arn = var.scheduler_role_arn
  }
}
