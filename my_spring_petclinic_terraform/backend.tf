terraform {
  backend "s3" {
    bucket = "terraform-state-files-ay"
    key    = "tfstate/train_sch.tfstate"
    region = "us-east-1"
  }
}