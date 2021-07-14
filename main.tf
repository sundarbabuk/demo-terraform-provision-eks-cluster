# Terraform state will be stored in S3
terraform {
  backend "s3" {
    bucket = "terraform-state-eks-demo"
    key    = "terraform-eks.tfstate"
    region = "us-east-1"
  }
}