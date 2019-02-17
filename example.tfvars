aws_region = "eu-west-1"
aws_zones = ["eu-west-1a", "eu-west-1b", "eu-west-1c"]
vpc_name = "my-vpc"
vpc_cidr = "10.0.0.0/16"
private_subnets = "false"

## Tags
tags = {
  Name = "my-vpc"
}

ssh_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABA.....QDXloDDe0KqhDva5uGxg0Vrir8YGkHsUuo57gmEZ6"
app_port = "80"
app_protocol = "tcp"
lt_prefix = "welcome-page-"
ami_id = "ami-0cdf1816f4d8d634e"
instance_type = "t2.medium"
asg_desired = "1"
asg_max = "3"
asg_min = "1"
