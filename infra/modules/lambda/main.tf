data "archive_file" "game_zip" {
  type        = "zip"
  source_dir = "src"
  output_path = "game.zip"
}

resource "aws_lambda_function" "game_lambda_function"  {
  filename      = data.archive_file.game_zip.output_path
  function_name = var.function_name
  role          = var.lambda_role_arn
  handler       = "game.lambda_handler"
  source_code_hash = filebase64sha256(data.archive_file.game_zip.output_path)
  runtime = "python3.8"
  environment {
    variables = {
      "NBA_API_KEY" = var.nba_api_key
      "SNS_TOPIC_ARN" = var.sns_topic_arn
    }
  }
}
  