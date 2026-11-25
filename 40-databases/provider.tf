terraform{
    required_providers{
        aws={
            source="hashicorp/aws"
            version="6.70.0"
        }
    }

    backend "s3" {
      bucket = "tfvars-demo-dev"
      key = "database.tfvars"
      encrypt = true
      use_lockfile = true
      region = "us-east-1"
    }
}

provider "aws" {
  region = "us-east-1"
}
