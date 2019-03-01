###
#
# IAM Policy for CodePipeline
#
data "aws_iam_policy_document" "codepipeline-policy" {
  statement {
    effect = "Allow"

    resources = [
      "${aws_s3_bucket.artifact.arn}",
      "${aws_s3_bucket.artifact.arn}/*",
    ]

    actions = [
      "s3:GetObject",
      "s3:GetObjectVersion",
      "s3:GetBcuketVersioning",
      "s3:List*",
      "s3:PutObject",
    ]
  }

  statement {
    effect    = "Allow"
    resources = ["*"]

    actions = [
      "codebuild:BatchGetBuilds",
      "codebuild:StartBuild",
    ]
  }

  statement {
    effect    = "Allow"
    resources = ["*"]

    actions = [
      "ecs:DescribeServices",
      "ecs:DescribeTaskDefinition",
      "ecs:DescribeTasks",
      "ecs:ListTasks",
      "ecs:RegisterTaskDefinition",
      "ecs:UpdateService",
    ]
  }

  statement {
    effect    = "Allow"
    resources = ["*"]

    actions = [
      "iam:PassRole",
    ]

    condition {
      test     = "StringEquals"
      variable = "iam:PassedToService"
      values   = ["ecs-tasks.amazonaws.com"]
    }
  }

  statement {
    effect    = "Allow"
    resources = ["*"]

    actions = [
      "ecr:DescribeImages",
    ]
  }
}

resource "aws_iam_policy" "codepipeline" {
  name        = "${var.app-name}-codepipeline"
  path        = "/service-role/"
  description = "Policy userd in trust relationship with CodePipeline"
  policy      = "${data.aws_iam_policy_document.codepipeline-policy.json}"
}
