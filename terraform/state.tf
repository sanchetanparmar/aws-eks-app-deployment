terraform {
  backend "s3" {
    bucket       = "sp-terrafrom-state-locak300525"
    key          = "backend/terraform.tfstate"
    region       = "eu-north-1"
    encrypt      = true  
    use_lockfile = true
  }
}