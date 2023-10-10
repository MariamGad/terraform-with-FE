resource "flexibleengine_vpc_subnet_v1" "public_subnet" {
    name       = "${var.NAME}-pub-subnet"
    cidr       = var.PUB_CIDR
    gateway_ip = var.PUB_GATEWAY
    vpc_id     = flexibleengine_vpc_v1.vpc01.id
}