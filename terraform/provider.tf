terraform {
  required_version = ">=  1.9.0"
}

provider "aws" {
    region = var.aws_region
    default_tags {
        tags = {  
          environment = "2bcloud"
          owner = "sanjay"
        }
    }
}