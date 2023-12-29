# This is a standard kms that frees any cloudtrail/trails from vulnerabilities.
# Docs: https://dev.to/aws-builders/encrypt-cloudtrail-logs-with-multi-region-key-with-terraform-1hln

resource "aws_kms_alias" "a" {
  name          = "alias/${var.cloudtrail_name}"
  target_key_id = aws_kms_key.kms.key_id
}

resource "aws_kms_key" "kms" {
  description             = "KMS key for cloudtrail: ${var.cloudtrail_name}"
  deletion_window_in_days = var.kms_deletion_window_in_days
  enable_key_rotation     = var.kms_enable_key_rotation
  policy                  = join("", data.aws_iam_policy_document.kms.*.json)
  tags                    = var.tags
}
