terraform {
  backend "s3" {
    bucket = "terraform-state-files-ay"
    key    = "tfstate/spring_petclinic1.tfstate"
    region = "us-east-1"
  }
}