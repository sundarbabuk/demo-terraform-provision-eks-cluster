# Terraform state will be stored in S3
terraform {
  backend "s3" {
    bucket = "terraform-eks-state-sk"
    key    = "terraform-eks.tfstate"
    region = "us-east-1"
  }
}