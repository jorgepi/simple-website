# Welcome Page 

This is a Github repo code for building and deploying a simple welcome page website over a nginx docker container. From this repo we will be able to deploy a local environment with docker-compose as well as a scalable environment hosted in AWS with Terraform.

## Pre-Requisites
- Terraform >= 0.11
- Docker
- Docker Compose

## Deploying a local environment

* Build and run:
```# docker-compose up```
* Stop the app:
```# docker-compose stop```
* Start the app:
```# docker-compose start```
* Destroy the app:
```# docker-compose down```

## Deploying on AWS

First thing first we need to load AWS credentials:

```
# export AWS_ACCESS_KEY_ID="XXX"
# export AWS_SECRET_ACCESS_KEY="XXX"
```

Then we will need to make a copy of the example.tfvars file (call it terraform.tfvars)

```# cp example.tfvars terraform.tfvars```

and update the values:

```
aws_region = "eu-west-1"
aws_zones = ["eu-west-1a", "eu-west-1b", "eu-west-1c"]
vpc_name = "my-vpc"
vpc_cidr = "10.0.0.0/16"
private_subnets = "false"

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
```
**IMPORTANT:** The values **asg_desired**, **asg_max** and **asg_min** will set the AWS auto scaling groups. Increase the values if you want to serve this page to a larger audience.

Finally we run terraform to provision the resources:

```
# terraform init
# terraform apply
```
