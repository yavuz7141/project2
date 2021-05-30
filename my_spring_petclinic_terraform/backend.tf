terraform {
  backend "s3" {
    bucket = "terraform-state-files-ay"
    key    = "tfstate/spring_petclinic.tfstate"
    region = "us-east-1"
  }
}