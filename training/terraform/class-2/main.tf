locals {
  vpc_name = "ex-${replace(basename(path.cwd), "_", "-")}"
}


module "network" {
  source = "./modules/network"

  name = local.vpc_name
  cidr = local.vpc_cidr

  azs             = ["${local.region}a", "${local.region}b", "${local.region}c"]
  private_subnets = local.private_subnets
  public_subnets  = local.public_subnets

  enable_ipv6 = true

  enable_nat_gateway = false
  single_nat_gateway = true

  public_subnet_tags = {
    Name = "overridden-name-public"
  }

  public_subnet_tags_per_az = {
    "${local.region}a" = {
      "availability-zone" = "${local.region}a"
    }
  }

  tags = local.tags

  vpc_tags = {
    Name = local.vpc_name
  }
}

module "compute" {
  source = "./modules/compute"

  aws_sg_ingress_rule      = local.aws_sg_ingress_rule
  aws_sg_egress_rule       = local.aws_sg_egress_rule
  aws_sg_tags              = local.aws_sg_tags
  aws_instance_type        = local.aws_instance_type
  aws_instance_create      = local.aws_instance_create
  aws_instance_filter_tags = local.aws_instance_filter_tags
  aws_instance_tags        = local.aws_instance_tags
  aws_ami_owners           = local.aws_ami_owners
  aws_vpc_id               = module.network.vpc_id
  aws_vpc_arn              = module.network.vpc_arn
}


