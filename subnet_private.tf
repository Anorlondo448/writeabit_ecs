###
#
# Subnet(Private)
#
resource "aws_subnet" "private-1a" {
  vpc_id            = "${aws_vpc.ecs.id}"
  cidr_block        = "10.100.11.0/24"
  availability_zone = "us-east-1a"

  tags {
    Name = "${var.app-name}-private-1a"
  }
}

resource "aws_subnet" "private-1b" {
  vpc_id            = "${aws_vpc.ecs.id}"
  cidr_block        = "10.100.12.0/24"
  availability_zone = "us-east-1b"

  tags {
    Name = "${var.app-name}-private-1b"
  }
}

resource "aws_subnet" "private-1c" {
  vpc_id            = "${aws_vpc.ecs.id}"
  cidr_block        = "10.100.13.0/24"
  availability_zone = "us-east-1c"

  tags {
    Name = "${var.app-name}-private-1c"
  }
}
