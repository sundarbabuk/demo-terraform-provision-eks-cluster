# Terraform state will be stored in S3
terraform {
  backend "s3" {
    bucket = "terraform-state-eks-demo-us-east-2"
    key    = "terraform-eks.tfstate"
    region = "us-east-2"
  }
}