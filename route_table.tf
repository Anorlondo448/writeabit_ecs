###
#
# Route Table
#
resource "aws_route_table" "main" {
  vpc_id = "${aws_vpc.ecs.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.ecs.id}"
  }

  tags {
    Name = "${var.app-name}"
  }
}

resource "aws_main_route_table_association" "main" {
  vpc_id         = "${aws_vpc.ecs.id}"
  route_table_id = "${aws_route_table.main.id}"
}

resource "aws_route_table_association" "public-1a" {
  subnet_id      = "${aws_subnet.public-1a.id}"
  route_table_id = "${aws_route_table.main.id}"
}

resource "aws_route_table_association" "public-1b" {
  subnet_id      = "${aws_subnet.public-1b.id}"
  route_table_id = "${aws_route_table.main.id}"
}

resource "aws_route_table_association" "public-1c" {
  subnet_id      = "${aws_subnet.public-1c.id}"
  route_table_id = "${aws_route_table.main.id}"
}
