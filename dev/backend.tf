terraform {
  backend "s3" {
    bucket       = "test-c9ef9c"
    # Directory-based state files: separate state per environment directory
    # Dev: atlantis-terraform-aws/dev/terraform.tfstate
    # Prod: atlantis-terraform-aws/prod/terraform.tfstate
    key          = "atlantis-terraform-aws/dev/terraform.tfstate"
    region       = "ap-southeast-2"
    use_lockfile = true
    encrypt      = true
  }
}
