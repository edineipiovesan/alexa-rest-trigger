terraform {
  backend "s3" {
    bucket         = "edn.tf-state"
    key            = "terraform/state/rest_trigger-deploy"
    dynamodb_table = "edn.tf-lock"
    region         = "us-east-1"
  }
}