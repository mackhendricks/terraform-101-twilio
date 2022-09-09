output "ip" {
  value = "${aws_instance.webhook.*.public_ip}"
}
