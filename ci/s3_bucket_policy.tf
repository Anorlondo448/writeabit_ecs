###
#
# S3 Bucket Policy for artifact
#
resource "aws_s3_bucket_policy" "artifact" {
  bucket = "${aws_s3_bucket.artifact.id}"

  policy = "${data.aws_iam_policy_document.s3-bucket-policy-artifact.json}"
}
