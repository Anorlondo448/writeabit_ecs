###
#
# Variables
#

# Account ID
data "aws_caller_identity" "current" {}

# Region
data "aws_region" "current" {}

# tag
variable "app-name" {
  type    = "string"
  default = "writeabit"
}
