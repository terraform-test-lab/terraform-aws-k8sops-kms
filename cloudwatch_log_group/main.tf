# This is a standard kms that frees any cloud watch log group from vulnerabilities.
# Docs: https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/encrypt-log-data-kms.html

resource "aws_kms_key" "kms" {
  description             = "KMS key for log-group: ${var.log_group_name}"
  deletion_window_in_days = var.kms_deletion_window_in_days
  enable_key_rotation     = var.kms_enable_key_rotation
  policy                  = join("", data.aws_iam_policy_document.kms.*.json)
  tags                    = var.tags
}
