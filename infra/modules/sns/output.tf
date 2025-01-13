output "sns_topic_arn" {
  value = aws_sns_topic.gameday_sns_topic.arn
}

output "sns_topic_name" {
  value = aws_sns_topic.gameday_sns_topic.name
}


output "subscription_name" {
  value = aws_sns_topic_subscription.gameday_sub.arn
}