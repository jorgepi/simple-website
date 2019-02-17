terraform {
  required_version = ">= 0.11.0"

  backend "s3" {
    bucket  = "web.state.terraform"
    region  = "eu-west-1"
    key     = "web/core.tfstate"
    encrypt = true
  }
}
