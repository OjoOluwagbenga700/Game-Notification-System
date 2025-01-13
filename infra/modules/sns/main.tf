resource "aws_sns_topic" "gameday_sns_topic" {
  name = "gameday_sns_topic"
}


resource "aws_sns_topic_subscription" "gameday_sub" {
  topic_arn = aws_sns_topic.gameday_sns_topic.arn
  protocol  = "email"
  endpoint  = "ojosamuel700@gmail.com"
}