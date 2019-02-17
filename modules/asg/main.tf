resource "aws_key_pair" "welcome-page" {
  key_name   = "welcome-page-key"
  public_key = "${var.ssh_key}"
}

resource "aws_security_group" "welcome-page" {
  name        = "welcome-page-sg"
  description = "http access to the welcome page - port 80"

  vpc_id = "${var.vpc_id}"

  ingress {
    from_port   = "${var.app_port}"
    to_port     = "${var.app_port}"
    protocol    = "${var.app_protocol}"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

data "template_file" "user_data" {
  template = "${file("${path.module}/welcome-page-userdata.conf")}"
}

resource "aws_launch_template" "welcome-page" {
  name_prefix            = "${var.lt_prefix}"
  image_id               = "${var.ami_id}"
  instance_type          = "${var.instance_type}"
  key_name               = "${aws_key_pair.welcome-page.key_name}"
  vpc_security_group_ids = ["${aws_security_group.welcome-page.id}"]
  user_data              = "${base64encode(data.template_file.user_data.rendered)}"
  vpc_security_group_ids = ["${aws_security_group.welcome-page.id}"]
  user_data              = "${base64encode(data.template_file.user_data.rendered)}"

  lifecycle {
    create_before_destroy = true
  }

  tag_specifications {
    resource_type = "instance"

    tags = {
      Name = "welcome-page"
    }
  }
}

resource "aws_elb" "welcome-page" {
  name            = "welcome-page-elb"
  security_groups = ["${aws_security_group.welcome-page.id}"]
  subnets         = ["${var.subnet_ids}"]

  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    interval            = 30
    target              = "HTTP:${var.app_port}/"
  }

  listener {
    lb_port           = "${var.app_port}"
    lb_protocol       = "http"
    instance_port     = "${var.app_port}"
    instance_protocol = "http"
  }
}

resource "aws_autoscaling_group" "welcome-page" {
  availability_zones  = "${var.aws_zones}"
  desired_capacity    = "${var.asg_desired}"
  max_size            = "${var.asg_max}"
  min_size            = "${var.asg_min}"
  vpc_zone_identifier = ["${var.subnet_ids}"]
  load_balancers      = ["${aws_elb.welcome-page.name}"]

  launch_template {
    id      = "${aws_launch_template.welcome-page.id}"
    version = "$$Latest"
  }

  tag {
    key                 = "Name"
    value               = "Welcome-Page"
    propagate_at_launch = true
  }
}
