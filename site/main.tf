provider "aws" {
  region = "${var.aws["region"]}"
  profile = "${var.aws["profile"]}"
}
terraform {
    required_version = ">= 0.8.2"
}
module "es" {
  source = "../es"
  name = "${var.name}"
  aws = "${var.aws}"
  es_config = "${var.es_config}"
}