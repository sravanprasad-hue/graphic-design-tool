terraform {
  backend "s3" {
    bucket       = "graphic-design-tool-tfstate-720881263346"
    key          = "graphic-design-tool/terraform.tfstate"
    region       = "us-east-2"
    encrypt      = true
    use_lockfile = true
  }
}
