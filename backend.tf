terraform {
  backend "s3" {
    bucket         = "talent-academy-pascal-lab-tfstates"
    key            = "talent-academy/tf-module-lab-demo/terraform.tfstates"
    region         = "eu-west-1"
    dynamodb_table = "terraform-lock"
  }
}
