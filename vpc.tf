resource "flexibleengine_vpc_v1" "vpc01" {
    cidr = var.VPC_CIDR
    name = "${var.NAME}-vpc" 
}