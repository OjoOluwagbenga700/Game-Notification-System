data "aws_caller_identity" "current" {}

resource "aws_iam_role" "lambda_role" {
  name = "lambda_sns_cloudwatch_role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "lambda.amazonaws.com"
        }
      }
    ]
  })
}

resource "aws_iam_policy" "lambda_sns_policy" {
  name        = "lambda_sns_policy"
  description = "Policy for Lambda to access sns"
  policy = jsonencode({
   Version = "2012-10-17",
   Statement = [
    {
      Effect = "Allow",
      Action = "sns:Publish",
      Resource = "arn:aws:sns:${var.region}:${data.aws_caller_identity.current.account_id}:${var.sns_topic_name}"
    }
  ]
})
}

resource "aws_iam_policy" "lambda_cloudwatch_policy" {
  name        = "lambda_cloudwatch_policy"
  description = "Policy for Lambda to access CloudWatch Logs"
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "logs:CreateLogGroup",
          "logs:CreateLogStream",
          "logs:PutLogEvents"
        ]
        Resource = "arn:aws:logs:${var.region}:${data.aws_caller_identity.current.account_id}:*"
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "attach_sns_policy" {
  role       = aws_iam_role.lambda_role.name
  policy_arn = aws_iam_policy.lambda_sns_policy.arn
}

resource "aws_iam_role_policy_attachment" "attach_cloudwatch_policy" {
  role       = aws_iam_role.lambda_role.name
  policy_arn = aws_iam_policy.lambda_cloudwatch_policy.arn
}



resource "aws_iam_role" "scheduler" {
  name = "cron-scheduler-role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Service = ["scheduler.amazonaws.com"]
        }
        Action = "sts:AssumeRole"
      }
    ]
  })
}
resource "aws_iam_policy" "scheduler" {
  name        = "scheduler-policy"
  description = "Policy for scheduler to access Lambda"
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "lambda:InvokeFunction"
        ]
        Resource = [
          "arn:aws:lambda:${var.region}:${data.aws_caller_identity.current.account_id}:function:${var.game_lambda_function_name}"
        ]
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "scheduler" {
  role       = aws_iam_role.scheduler.name
  policy_arn = aws_iam_policy.scheduler.arn
}
