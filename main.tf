resource "aws_cloudwatch_metric_alarm" "rds_dev" {
  count                     = length(var.rds_alarms)
  alarm_name                = format("%s_%s", var.rds_dev, lookup(element(var.rds_alarms, count.index), "metric_name"))
  comparison_operator       = lookup(element(var.rds_alarms, count.index), "comparison_operator")
  evaluation_periods        = lookup(element(var.rds_alarms, count.index), "evaluation_periods")
  metric_name               = lookup(element(var.rds_alarms, count.index), "metric_name")
  namespace                 = lookup(element(var.rds_alarms, count.index), "namespace")
  period                    = lookup(element(var.rds_alarms, count.index), "period")
  statistic                 = lookup(element(var.rds_alarms, count.index), "statistic")
  threshold                 = lookup(element(var.rds_alarms, count.index), "threshold")
  alarm_description         = lookup(element(var.rds_alarms, count.index), "alarm_description")
  alarm_actions             = [data.aws_sns_topic.this.arn]
  insufficient_data_actions = []

  dimensions = contains(keys(element(var.rds_alarms, count.index)), "dimensions") ? merge(lookup(element(var.rds_alarms, count.index), "dimensions"), {DBInstanceIdentifier = var.rds_dev}) : {DBInstanceIdentifier = var.rds_dev}
}

resource "aws_cloudwatch_metric_alarm" "rds_sqlserver" {
  count                     = length(var.rds_alarms)
  alarm_name                = format("%s_%s", var.rds_sqlserver, lookup(element(var.rds_alarms, count.index), "metric_name"))
  comparison_operator       = lookup(element(var.rds_alarms, count.index), "comparison_operator")
  evaluation_periods        = lookup(element(var.rds_alarms, count.index), "evaluation_periods")
  metric_name               = lookup(element(var.rds_alarms, count.index), "metric_name")
  namespace                 = lookup(element(var.rds_alarms, count.index), "namespace")
  period                    = lookup(element(var.rds_alarms, count.index), "period")
  statistic                 = lookup(element(var.rds_alarms, count.index), "statistic")
  threshold                 = lookup(element(var.rds_alarms, count.index), "threshold")
  alarm_description         = lookup(element(var.rds_alarms, count.index), "alarm_description")
  alarm_actions             = [data.aws_sns_topic.this.arn]
  insufficient_data_actions = []

   dimensions = contains(keys(element(var.rds_alarms, count.index)), "dimensions") ? merge(lookup(element(var.rds_alarms, count.index), "dimensions"), {DBInstanceIdentifier = var.rds_sqlserver}) : {DBInstanceIdentifier = var.rds_sqlserver}
}