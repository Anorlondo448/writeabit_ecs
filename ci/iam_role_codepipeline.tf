###
#
# IAM Role for CodePipeline
#
data "aws_iam_policy_document" "codepipeline-assume-role" {
  statement {
    effect  = "Allow"
    actions = ["sts:AssumeRole"]

    principals {
      identifiers = ["codepipeline.amazonaws.com"]
      type        = "Service"
    }
  }
}

resource "aws_iam_role" "codepipeline" {
  name               = "${var.app-name}-codepipeline"
  path               = "/service-role/"
  assume_role_policy = "${data.aws_iam_policy_document.codepipeline-assume-role.json}"
}

resource "aws_iam_role_policy_attachment" "codepipeline" {
  role       = "${aws_iam_role.codepipeline.name}"
  policy_arn = "${aws_iam_policy.codepipeline.arn}"
}
