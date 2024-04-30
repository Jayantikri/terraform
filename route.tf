#Creating Route Table
resource "aws_route_table" "myroute" {
    vpc_id = "${aws_vpc.myvpc.id}"
route {
        cidr_block = "0.0.0.0/0"
        gateway_id = "${aws_internet_gateway.mygateway.id}"
    }
tags = {
        Name = "myroute"
    }
}
resource "aws_route_table_association" "rt1" {
    subnet_id = "${aws_subnet.mysubnet1.id}"
    route_table_id = "${aws_route_table.myroute.id}"
}
resource "aws_route_table_association" "rt2" {
    subnet_id = "${aws_subnet.mysubnet2.id}"
    route_table_id = "${aws_route_table.myroute.id}"
}
