###
#
# Remote State
#
terraform {
  backend "s3" {
    bucket = "anorlondo448-writeabit-for-ecs"
    key = "terraform.tfstate"
    region = "us-east-1"
  }
}

provider "aws" {
  version = "~> 1.60"
  region = "us-east-1"
}