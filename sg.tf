resource "aws_security_group" "web-traffic" {
    name = "ssh security group"
    description = "enable enable ssh connection on port 22"

    dynamic "ingress" {
        description = "ssh access"
        iterator = port
        for_each = var.ingressrules
        content {
        from_port = 22
        to_port = 22
        protocol = "TCP"
        cidr_blocks = ["0.0.0.0/0"]
        }
    }

    dynamic "egress" {
        iterator = port
        for_each = var.egressrules
        content {
        from_port = port.value
        to_port = port.value
        protocol = "TCP"
        cidr_blocks = ["0.0.0.0/0"]
        }
    }
}

