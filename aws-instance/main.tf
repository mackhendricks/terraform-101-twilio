provider "aws" {
  access_key = "${var.access_key}"
  secret_key = "${var.secret_key}"
  region     = "${var.region}"
}

resource "aws_instance" "webhook" {
  ami = "${var.ami}"
  count= var.num_of_servers
  instance_type = "${var.instance_type}"
  key_name = "${var.sshkey}"
  tags = {
    Name = "${var.name}"
    env = "test"
  }
  vpc_security_group_ids = [
    "${aws_security_group.webhook_security_group.id}"
  ]

  root_block_device {
    volume_size = "${var.size}"
  }

  provisioner "local-exec" {
    command = "apt-get install -y nginx"
  }
}


resource "aws_security_group" "webhook_security_group" {
  name = "webhook_security_group"
  description = "webhook security group"
  vpc_id= var.vpc_id
  tags = {
    Name = "${var.name}"
    env = "test"
  }

  ingress {
    from_port         = 22
    to_port           = 22
    protocol          = "tcp"
    cidr_blocks       = ["0.0.0.0/0"]
    ipv6_cidr_blocks  = ["::/0"]
  }
  ingress {
    from_port         = 80
    to_port           = 80
    protocol          = "tcp"
    cidr_blocks       = ["0.0.0.0/0"]
    ipv6_cidr_blocks  = ["::/0"]
  }
  egress {
    from_port         = 0
    to_port           = 0
    protocol          = "-1"
    cidr_blocks       = ["0.0.0.0/0"]
    ipv6_cidr_blocks  = ["::/0"]
  }
}
