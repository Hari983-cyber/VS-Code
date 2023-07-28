terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.0.0"
    }
  }
}

provider "aws" {
  # Configuration options
  region = "us-east-1"
}





#provider tf file with S3 bucket

terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.5.0"
    }
  }
  backend "s3" {
    bucket = "assignment-c42"
    key    = "terraform.tfstate"
    region = "us-east-1"
    dynamodb_table = "c42"
  }
}
provider "aws" {
  # Configuration options
  region = "us-east-1"
}
