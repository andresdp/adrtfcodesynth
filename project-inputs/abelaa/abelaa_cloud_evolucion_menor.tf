# ======================================================
# Archivo fusionado (MENOR, con arquitectura): covid-dev\cloudcovid-dev.tf
# Piezas Terraform en carpeta: 14
# ======================================================



# ======================================================
# Archivo original: main.tf
# Carpeta: C:\Users\asus\cloned_repos\Abelaa\pcmt\deploy\terraform\covid-dev
# ======================================================

######################################################################
# Copyright (c) 2019, VillageReach
# Licensed under the Non-Profit Open Software License version 3.0.
# SPDX-License-Identifier: NPOSL-3.0
######################################################################

terraform {
  required_version = "~> 0.12.29"
  
  required_providers {
    aws = {
      version = "~> 3.1.0"
    }
  }

  backend "s3" {
    bucket = "pcmt-terraform-states"
    key    = "pcmt-covid-dev.tf"
    region = "eu-west-1"
  }
}

provider "aws" {
  region = var.aws-region
}

data "terraform_remote_state" "pcmt-network" {
  backend = "s3"
  config = {
    bucket = "pcmt-terraform-states"
    key    = "pcmt-network-useast.tf"
    region = "eu-west-1"
  }
}

data "terraform_remote_state" "pcmt-hosted-zone" {
  backend = "s3"
  config = {
    bucket = "pcmt-terraform-states"
    key    = "pcmt-productcatalog-io.tf"
    region = "eu-west-1"
  }
}

module "covid-dev" {
  source = "../modules/pcmt"
  providers = {
    aws.compute = aws
    aws.network = aws
  }

  aws-region        = var.aws-region
  ec2-key-pair      = var.ec2-key-pair
  tag-name          = var.tag-name
  tag-type          = var.tag-type
  tag-bill-to       = var.tag-bill-to
  root-volume-size  = var.root-volume-size
  instance-type     = var.instance-type
  app-deploy-group  = var.app-deploy-group
  domain-name       = var.domain-name
  subnet-id         = data.terraform_remote_state.pcmt-network.outputs.vpc-subnet-id
  security-group-id = data.terraform_remote_state.pcmt-network.outputs.security-group-id
  route53-zone-id   = data.terraform_remote_state.pcmt-hosted-zone.outputs.main-hosted-zone-id
}



# ======================================================
# Archivo original: terraform.tfvars
# Carpeta: C:\Users\asus\cloned_repos\Abelaa\pcmt\deploy\terraform\covid-dev
# ======================================================

aws-region    = "us-east-2"
instance-type = "t3a.small"

tag-name    = "covid-dev"
tag-type    = "demo"
tag-bill-to = "PCMT"

domain-name = "covid-dev.productcatalog.io"



# ======================================================
# Archivo original: variables.tf
# Carpeta: C:\Users\asus\cloned_repos\Abelaa\pcmt\deploy\terraform\covid-dev
# ======================================================

variable "aws-region" {
  type        = string
  description = "AWS Region to use"
}

variable "tag-name" {
  type        = string
  description = "Name of the environment"
}

variable "tag-type" {
  type        = string
  description = "Type of deployment, dev, staging, producting, buildinf, etc"
}

variable "tag-bill-to" {
  type        = string
  description = "Which project to bill the provisioned resources"
  default     = "PCMT"
}

variable "root-volume-size" {
  type        = number
  description = "Size in GB of root volume"
  default     = "20"
}

variable "instance-type" {
  type        = string
  description = "Size in GB of root volume"
  default     = "t3a.small"
}

variable "app-deploy-group" {
  type        = string
  description = "Tags ec2 app instance for use by Ansible Playbooks."
  default     = "docker-hosts"
}

variable "ec2-key-pair" {
  type        = string
  description = "Name of EC2 key-pair for instance"
  default     = "pcmt-ec2"
}

variable "domain-name" {
  type        = string
  description = "AWS Route53 Domain Name"
}

