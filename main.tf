module "vpc" {
  source = "./modules/vpc"

  aws_region      = "${var.aws_region}"
  aws_zones       = "${var.aws_zones}"
  vpc_name        = "${var.vpc_name}"
  vpc_cidr        = "${var.vpc_cidr}"
  private_subnets = "${var.private_subnets}"

  ## Tags
  tags = "${var.tags}"
}

module "asg" {
  source = "./modules/asg"

  ssh_key       = "${var.ssh_key}"
  vpc_id        = "${module.vpc.vpc_id}"
  app_port      = "${var.app_port}"
  app_protocol  = "${var.app_protocol}"
  lt_prefix     = "${var.lt_prefix}"
  ami_id        = "${var.ami_id}"
  instance_type = "${var.instance_type}"
  subnet_ids    = "${module.vpc.subnet_ids}"
  aws_zones     = "${var.aws_zones}"
  asg_desired   = "${var.asg_desired}"
  asg_max       = "${var.asg_max}"
  asg_min       = "${var.asg_min}"
}
