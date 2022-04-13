data "aws_region" "current" {}
data "aws_caller_identity" "current" {}

resource "aws_cloudformation_stack" "dependency_monitoring" {
  name = "Dependency-Monitoring-Lab"
  capabilities = ["CAPABILITY_NAMED_IAM"]

  parameters = {
    AvailabilityZone = "${data.aws_region.current.name}a"
    BucketName = "wa-lab-${var.last_name}-${var.date_time}"
    NotificationEmail = var.email_address
  }

  template_body = file("src/dependency_monitoring.yaml")
}

resource "aws_cloudwatch_metric_alarm" "foobar" {
  alarm_name                = "WA-Lab-Dependency-Alarm"
  comparison_operator       = "LessThanThreshold"
  evaluation_periods        = "1"
  metric_name               = "Invocations"
  namespace                 = "AWS/Lambda"
  period                    = "60"
  statistic                 = "Sum"
  threshold                 = "1"
  treat_missing_data        = "breaching"
  alarm_actions = ["arn:aws:sns:${data.aws_region.current.name}:${data.aws_caller_identity.current.account_id}:WA-Lab-Dependency-Notification"]
}