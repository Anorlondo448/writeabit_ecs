###
#
# IAM Policy for S3
#
data "aws_iam_policy_document" "s3-bucket-policy-artifact" {
  statement {
    sid       = "DenyUnEncryptedObjectsUpload"
    effect    = "Deny"
    actions   = ["s3:PutObject"]
    resources = ["${aws_s3_bucket.artifact.arn}/*"]

    principals {
      identifiers = ["*"]
      type        = "AWS"
    }

    condition {
      test     = "StringNotEquals"
      values   = ["aws:kms"]
      variable = "s3:x-amz-server-side-encryption"
    }
  }

  statement {
    sid       = "DenyInsecureConnections"
    effect    = "Deny"
    actions   = ["s3:*"]
    resources = ["${aws_s3_bucket.artifact.arn}/*"]

    principals {
      identifiers = ["*"]
      type        = "AWS"
    }

    condition {
      test     = "Bool"
      values   = ["false"]
      variable = "aws:SecureTransport"
    }
  }
}
