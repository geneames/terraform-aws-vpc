module "vpc" {
  source     = "git::https://github.com/geneames/terraform-aws-vpc.git?ref=tags/0.11.14"
  namespace  = "${var.namespace}"
  stage      = "${var.stage}"
  name       = "${var.name}"
  cidr_block = "${var.cidr_block}"
}

module "dynamic_subnets" {
  source              = "git::https://github.com/geneames/terraform-aws-dynamic-subnets.git?ref=tags/0.11.14"
  namespace           = "${var.namespace}"
  stage               = "${var.stage}"
  name                = "${var.name}"
  region              = "${var.region}"
  availability_zones  = "${var.availability_zones}"
  vpc_id              = "${module.vpc.vpc_id}"
  igw_id              = "${module.vpc.igw_id}"
  cidr_block          = "${var.cidr_block}"
  nat_gateway_enabled = "false"
}
