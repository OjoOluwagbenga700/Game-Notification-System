#Creates IAM role for both Lambda and event scheduler
module "iam_Role" {
  source                    = "./infra/modules/iam_Role"
  region                    = var.region
  sns_topic_name            = module.sns.sns_topic_name
  game_lambda_function_name = module.lambda.game_lambda_function_name

}

 #Creates SNS topic and Subscription
module "sns" {
  source = "./infra/modules/sns"
}

# creates Lambda function 
module "lambda" {
  source          = "./infra/modules/lambda"
  function_name   = var.function_name
  lambda_role_arn = module.iam_Role.lambda_role_arn
  nba_api_key     = var.nba_api_key
  sns_topic_arn   = module.sns.sns_topic_arn
}

# Creates EventBridge Scheduler
module "eventbridge" {
  source                   = "./infra/modules/eventbridge"
  game_lambda_function_arn = module.lambda.game_lambda_function_arn
  scheduler_role_arn       = module.iam_Role.scheduler_role_arn

}