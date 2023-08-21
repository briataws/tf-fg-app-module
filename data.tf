#
# Module: fg-hello-world-app:data
#

#
# Data Lookups
#

# AWS VPC Data Lookup
data "aws_vpc" "selected" {
  filter {
    name   = "tag:Name"
    values = [var.vpc_name]
  }
}

# AWS Subnet IDs Data Lookup
data "aws_subnets" "private" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.selected.id]
  }

  tags = {
    Name = "*-vpc-private-*"
  }
}

data "aws_subnet" "private" {
  count = length(data.aws_subnets.private.ids)
  id    = data.aws_subnets.private.ids[count.index]
}

# ECS execution role Lookup
data "aws_iam_role" "ecs_execution_role" {
  name = "ecs_task_execution_role"
}

# ECS cluster Lookup
data "aws_ecs_cluster" "fargate" {
  cluster_name = "${var.environment}-ecs-cluster"
}

# Route53 Lookup
# Feature Enhancement Need to Create Public / Private Route53 Module ugh

data "aws_service_discovery_dns_namespace" "terraform" {
  name = var.aws_service_discovery_namespace
  type = "DNS_PRIVATE"
}


data "aws_availability_zones" "available" {
  state = "available"
}

data "aws_subnets" "filtered_private" {
  for_each = toset(data.aws_availability_zones.available.zone_ids)

  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.selected.id]
  }

  filter {
    name   = "availability-zone-id"
    values = ["${each.value}"]
  }
}
