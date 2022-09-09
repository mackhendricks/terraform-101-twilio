# required
variable "access_key" {}
variable "secret_key" {}
variable "name" {}

variable "vpc_id" {
   default="vpc-7f20a816"
}

variable "num_of_servers" {
	default=1
}

variable "region" {
  default = "us-east-2"
}
variable "size" {
  default = "8"
}
variable "ami" {
  default = "ami-b2795cd7"
}
variable "instance_type" {
  default = "t2.micro"
}
variable "sshkey" {
  default = "jump"
}
