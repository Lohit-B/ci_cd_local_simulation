terraform {
  backend "s3" {
    bucket                      = "terraform-state"
    key                         = "simulation_ci_cd.tfstate"
    region                      = "us-east-1"
    access_key                  = "test"
    secret_key                  = "test"
    skip_credentials_validation = true
    skip_metadata_api_check     = true
    skip_requesting_account_id  = true
    endpoint                    = "http://localhost:4566"  # LocalStack endpoint for S3
  }
}

provider "aws" {
  region                      = "us-east-1"
  access_key                  = "test"
  secret_key                  = "test"
  skip_credentials_validation = true
  skip_requesting_account_id  = true

  endpoints {
    s3  = "http://localhost:4566"
  }
}

resource "aws_ecr_repository" "ci_cd_simulation_ecr" {
  name                 = var.ecr_repository_name 
  image_tag_mutability = "MUTABLE"
  image_scanning_configuration {
    scan_on_push = true
  }
}

output "ecr_repository_uri" {
  value = aws_ecr_repository.ci_cd_simulation_ecr.repository_url
}

