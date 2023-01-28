terraform {
  backend "s3" {
    bucket = var.bucket
    key    = "terraform.tfstate"
    region = var.region-US-East
  }
}