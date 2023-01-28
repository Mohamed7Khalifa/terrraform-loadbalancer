module "vpc" {
  source = "./vpc"
}

module "lb" {
  source = "./lb"
}

module "private_machines" {
  source = "./private_machines"
}
