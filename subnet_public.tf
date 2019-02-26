###
#
# Subnet(Public)
#
resource "aws_subnet" "public-1a" {
  vpc_id            = "${aws_vpc.ecs.id}"
  cidr_block        = "10.100.1.0/24"
  availability_zone = "us-east-1a"

  tags {
    Name = "${var.app-name}-public-1a"
  }
}

resource "aws_subnet" "public-1b" {
  vpc_id            = "${aws_vpc.ecs.id}"
  cidr_block        = "10.100.2.0/24"
  availability_zone = "us-east-1b"

  tags {
    Name = "${var.app-name}-public-1b"
  }
}

resource "aws_subnet" "public-1c" {
  vpc_id            = "${aws_vpc.ecs.id}"
  cidr_block        = "10.100.3.0/24"
  availability_zone = "us-east-1c"

  tags {
    Name = "${var.app-name}-public-1c"
  }
}
