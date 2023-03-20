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

module "compute_alpha" {
  source = "./modules/compute"

  aws_instance_type        = local.aws_instance_type
  aws_instance_create      = local.aws_instance_create
  aws_instance_filter_tags = local.aws_instance_filter_tags
  aws_instance_tags        = local.aws_instance_tags
  aws_ami_owners           = local.aws_ami_owners

  # exposed info from network module
  subnet_id                = module.network.private_subnets[0]
  subnet_cidr              = module.network.private_subnets_cidr_blocks[0]

  # ensure that this compute module depends from network module resources first
  depends_on = [
    module.network
  ]
}

module "compute_beta" {
  source = "./modules/compute"

  aws_instance_type        = local.aws_instance_type
  aws_instance_create      = local.aws_instance_create
  aws_instance_filter_tags = local.aws_instance_filter_tags
  aws_instance_tags        = local.aws_instance_tags
  aws_ami_owners           = local.aws_ami_owners

  # exposed info from network module
  subnet_id                = module.network.private_subnets[0]
  subnet_cidr              = module.network.private_subnets_cidr_blocks[0]

  # ensure that this compute module depends from network module resources first
  depends_on = [
    module.network
  ]
}

module "compute_lucas_arruda" {
  source = "./modules/compute"

  aws_instance_type        = local.aws_instance_type
  aws_instance_create      = local.aws_instance_create
  aws_instance_filter_tags = local.aws_instance_filter_tags
  aws_instance_tags        = local.aws_instance_tags
  aws_ami_owners           = local.aws_ami_owners

  # exposed info from network module
  subnet_id                = module.network.private_subnets[0]
  subnet_cidr              = module.network.private_subnets_cidr_blocks[0]

  # ensure that this compute module depends from network module resources first
  depends_on = [
    module.network
  ]
}