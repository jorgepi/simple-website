variable ssh_key {
  description = "ssh key to access to the server"
  type        = "string"
}

variable vpc_id {
  description = "vpc id for the asg"
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

variable subnet_ids {
  description = "subnet ids"
  type        = "list"
}

variable aws_zones {
  description = "aws zones"
  type        = "list"
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
