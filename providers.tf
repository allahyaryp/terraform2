terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.37.0"
    }
    linode = {
      source = "linode/linode"
      version = "2.14.0"
    }
  }
}

