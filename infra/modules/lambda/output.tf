output "game_lambda_function_arn" {
  value = aws_lambda_function.game_lambda_function.arn
}

output "game_lambda_function_name" {
  value = aws_lambda_function.game_lambda_function.function_name
}