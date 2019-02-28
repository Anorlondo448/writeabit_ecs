###
#
# S3 Bucket for artfact
#
resource "aws_s3_bucket" "artifact" {
  bucket = "${var.app-name}-artifact"
  acl    = "private"
}
