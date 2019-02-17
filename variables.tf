# Tags

variable tags {
  description = "Different tag values which should be assigned to AWS resources created via Terraform)"
  type        = "map"
}

# AWS Regions / Zones

variable aws_region {
  type        = "string"
  description = "AWS region which should be used"
}

variable aws_zones {
  type        = "list"
  description = "AWS AZs (Availability zones) where subnets should be created"
}

# Private subnets

variable private_subnets {
  description = "Create both private and public subnets"
  type        = "string"
  default     = "false"
}

# Resource naming

variable vpc_name {
  description = "Name of the VPC"
  type        = "string"
}

# Network details (Change this only if you know what you are doing or if you think you are lucky)

variable vpc_cidr {
  type        = "string"
  description = "CIDR of the VPC"
}

variable ssh_key {
  description = "ssh key to access to the server"
  type        = "string"
}

variable app_port {
  description = "application port"
  type        = "string"
}

variable app_protocol {
  description = "application protocol"
  type        = "string"
}

variable lt_prefix {
  description = "launch template prefix"
  type        = "string"
}

variable ami_id {
  description = "ami id for the launch template"
  type        = "string"
}

variable instance_type {
  description = "instance type for the launch template"
  type        = "string"
}

variable asg_desired {
  description = "auto scaling group desired value"
  type        = "string"
}

variable asg_max {
  description = "auto scaling group max value"
  type        = "string"
}

variable asg_min {
  description = "auto scaling group min value"
  type        = "string"
}
