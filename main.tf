#
# DO NOT DELETE THESE LINES!
#
# Your AMI ID is:
#
#     ami-30628649
#
# Your subnet ID is:
#
#     subnet-96ce63f1
#
# Your security group ID is:
#
#     sg-4069a238
#
# Your Identity is:
#
#     RiverIsland-training-terrier
#

variable "aws_access_key" {
}

variable "aws_secret_key" {
}

variable "aws_region" {
  type    = "string"
  default = "eu-west-1"
}

provider "aws" {
  access_key = "${var.aws_access_key}"
  secret_key = "${var.aws_secret_key}"
  region     = "${var.aws_region}"
}

resource "aws_instance" "web" {
  count                  = "2" 
  ami                    = "ami-30628649"
  instance_type          = "t2.micro"
  subnet_id              = "subnet-96ce63f1"
  vpc_security_group_ids = ["sg-4069a238"]

  tags {
    " identity" = "RiverIsland-training-terrier"
    "name"      = "Tom"
    "hat"       = "hat"
    "count"     = "${count.index}"
  }
}


terraform {
  backend "atlas" {
   name = "tomrobson/training"
  }
}

output "public_ip" {
  value = ["${aws_instance.web.*.public_ip}"]
}
output "public_dns" {
  value = ["${aws_instance.web.*.public_dns}"]
}


