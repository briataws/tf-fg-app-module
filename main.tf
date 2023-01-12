#
# Module: fg-hello-world-app
#

provider "aws" {
  region = var.region
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 3.19"
    }
    random = {
      source  = "hashicorp/random"
      version = ">= 3.4.3"
    }
    template = {
      source  = "hashicorp/template"
      version = ">= 2.2.0"
    }
  }
  required_version = ">= 1.2.0"
}