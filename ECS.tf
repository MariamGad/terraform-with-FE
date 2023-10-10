resource "flexibleengine_networking_secgroup_v2" "secgroup01" {
    name        = "${var.NAME}-secgroup"
}

resource "flexibleengine_networking_secgroup_rule_v2" "ssh_secgroup_rule" {
    direction         = "ingress"
    ethertype         = "IPv4"
    protocol          = "tcp"
    port_range_min    = 22
    port_range_max    = 22
    remote_ip_prefix  = "0.0.0.0/0"
    security_group_id = flexibleengine_networking_secgroup_v2.secgroup01.id
}

resource "flexibleengine_compute_keypair_v2" "keypair01" {
    name = "${var.NAME}-keypair"
}

resource "flexibleengine_compute_instance_v2" "instance01" {
    name            = "${var.NAME}_instance"
    image_id        = var.IMAGE_ID
    flavor_id       = var.FLAVOR_ID
    key_pair        = "Mariam-keypair"
    security_groups = [flexibleengine_networking_secgroup_v2.secgroup01.id]

    network {
        uuid = flexibleengine_vpc_subnet_v1.public_subnet.id
    }

}

resource "flexibleengine_vpc_eip" "eip_1" {
    publicip {
        type = "5_bgp"
    }
    bandwidth {
        name = "${var.NAME}_EIP"
        size = 8
        share_type = "PER"
        charge_mode = "traffic"
    }
}

resource "flexibleengine_compute_floatingip_associate_v2" "fip_1" {
    floating_ip = flexibleengine_vpc_eip.eip_1.publicip.0.ip_address
    instance_id = flexibleengine_compute_instance_v2.instance01.id
}