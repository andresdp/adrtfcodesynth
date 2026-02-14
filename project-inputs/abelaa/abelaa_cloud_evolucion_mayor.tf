

# ======================================================
# Archivo fusionado: pcmt-villagereach-org\cloudpcmt-villagereach-org.tf
# Piezas Terraform en carpeta: 7
# Tiene arquitectura (EC2/Docker/Serverless): False
# ======================================================



# ======================================================
# Archivo original: main.tf
# Carpeta: C:\Users\asus\cloned_repos\Abelaa\pcmt\deploy\terraform\pcmt-villagereach-org
# ======================================================

######################################################################
# Copyright (c) 2020, VillageReach
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
    key    = "pcmt-villagereach-org.tf"
    region = "eu-west-1"
  }
}

provider "aws" {
  region = var.aws-region
}


# ======================================================
# Archivo original: network.tf
# Carpeta: C:\Users\asus\cloned_repos\Abelaa\pcmt\deploy\terraform\pcmt-villagereach-org
# ======================================================

resource "aws_route53_zone" "main" {
  name = var.hosted-zone-domain-name

  tags = {
    BillTo = "${var.tag-bill-to}"
  }
}


# ======================================================
# Archivo original: outputs.tf
# Carpeta: C:\Users\asus\cloned_repos\Abelaa\pcmt\deploy\terraform\pcmt-villagereach-org
# ======================================================

output "main-hosted-zone-id" {
  value       = aws_route53_zone.main.zone_id
  description = "Id of the main hosted zone"
}


# ======================================================
# Archivo original: terraform.tfvars
# Carpeta: C:\Users\asus\cloned_repos\Abelaa\pcmt\deploy\terraform\pcmt-villagereach-org
# ======================================================

aws-region              = "eu-west-1"
tag-bill-to             = "PCMT"
hosted-zone-domain-name = "pcmt.villagereach.org"


# ======================================================
# Archivo original: variables.tf
# Carpeta: C:\Users\asus\cloned_repos\Abelaa\pcmt\deploy\terraform\pcmt-villagereach-org
# ======================================================

variable "aws-region" {
  type        = string
  description = "AWS Region to use"
}

variable "tag-bill-to" {
  type        = string
  description = "Which project to bill the provisioned resources"
  default     = "PCMT"
}

variable "hosted-zone-domain-name" {
  type        = string
  description = "AWS Route53 Hosted Zone Domain Name"
}



# ======================================================
# Archivo fusionado: chai-network-useast\cloudchai-network-useast.tf
# Piezas Terraform en carpeta: 8
# Tiene arquitectura (EC2/Docker/Serverless): False
# ======================================================



# ======================================================
# Archivo original: main.tf
# Carpeta: C:\Users\asus\cloned_repos\Abelaa\pcmt\deploy\terraform\chai-network-useast
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
      version = "~> 2.70"
    }
  }
  
  backend "s3" {
    bucket  = "chai-pcmt-terraform-states"
    key     = "chai-network-useast.tf"
    region  = "us-east-1"
    profile = "chai"
  }
}

provider "aws" {
  region  = var.aws-region
  profile = "chai"
}

module "chai-network-useast" {
  source = "../modules/pcmt-network"

  aws-region  = var.aws-region
  tag-type    = var.tag-type
  tag-bill-to = var.tag-bill-to
}



# ======================================================
# Archivo original: outputs.tf
# Carpeta: C:\Users\asus\cloned_repos\Abelaa\pcmt\deploy\terraform\chai-network-useast
# ======================================================

######################################################################
# Copyright (c) 2019, VillageReach
# Licensed under the Non-Profit Open Software License version 3.0.
# SPDX-License-Identifier: NPOSL-3.0
######################################################################

output "vpc-subnet-id" {
  value       = module.chai-network-useast.vpc-subnet-id
  description = "Id of the first subnet of the VPC"
}

output "security-group-id" {
  value       = module.chai-network-useast.security-group-id
  description = "Id of the security group"
}


# ======================================================
# Archivo original: terraform.tfvars
# Carpeta: C:\Users\asus\cloned_repos\Abelaa\pcmt\deploy\terraform\chai-network-useast
# ======================================================

aws-region = "us-east-1"

tag-type    = "infrastructure"
tag-bill-to = "PCMT"



# ======================================================
# Archivo original: variables.tf
# Carpeta: C:\Users\asus\cloned_repos\Abelaa\pcmt\deploy\terraform\chai-network-useast
# ======================================================

variable "aws-region" {
  type        = string
  description = "AWS Region to use"
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



# ======================================================
# Archivo fusionado: gfpvan-network-useast\cloudgfpvan-network-useast.tf
# Piezas Terraform en carpeta: 8
# Tiene arquitectura (EC2/Docker/Serverless): False
# ======================================================



# ======================================================
# Archivo original: main.tf
# Carpeta: C:\Users\asus\cloned_repos\Abelaa\pcmt\deploy\terraform\gfpvan-network-useast
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
      version = "~> 2.70"
    }
  }
  
  backend "s3" {
    bucket  = "vr-gfpvan-terraform-states"
    key     = "gfpvan-network-useast.tf"
    region  = "us-east-2"
    profile = "villagereach-gfpvan"
  }
}

provider "aws" {
  region  = var.aws-region
  profile = "villagereach-gfpvan"
}

module "gfpvan-network-useast" {
  source = "../modules/pcmt-network"

  aws-region  = var.aws-region
  tag-type    = var.tag-type
  tag-bill-to = var.tag-bill-to
}



# ======================================================
# Archivo original: outputs.tf
# Carpeta: C:\Users\asus\cloned_repos\Abelaa\pcmt\deploy\terraform\gfpvan-network-useast
# ======================================================

######################################################################
# Copyright (c) 2019, VillageReach
# Licensed under the Non-Profit Open Software License version 3.0.
# SPDX-License-Identifier: NPOSL-3.0
######################################################################

output "vpc-subnet-id" {
  value       = module.gfpvan-network-useast.vpc-subnet-id
  description = "Id of the first subnet of the VPC"
}

output "security-group-id" {
  value       = module.gfpvan-network-useast.security-group-id
  description = "Id of the security group"
}


# ======================================================
# Archivo original: terraform.tfvars
# Carpeta: C:\Users\asus\cloned_repos\Abelaa\pcmt\deploy\terraform\gfpvan-network-useast
# ======================================================

aws-region = "us-east-2"

tag-type    = "infrastructure"
tag-bill-to = "PCMT"



# ======================================================
# Archivo original: variables.tf
# Carpeta: C:\Users\asus\cloned_repos\Abelaa\pcmt\deploy\terraform\gfpvan-network-useast
# ======================================================

variable "aws-region" {
  type        = string
  description = "AWS Region to use"
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



# ======================================================
# Archivo fusionado: modules\pcmt-network\cloudpcmt-network.tf
# Piezas Terraform en carpeta: 8
# Tiene arquitectura (EC2/Docker/Serverless): False
# ======================================================



# ======================================================
# Archivo original: main.tf
# Carpeta: C:\Users\asus\cloned_repos\Abelaa\pcmt\deploy\terraform\modules\pcmt-network
# ======================================================

terraform {
  required_version = ">= 0.12.0"

  required_providers {
    aws = {
      version = ">= 2.57"
    }
  }
}



# ======================================================
# Archivo original: network.tf
# Carpeta: C:\Users\asus\cloned_repos\Abelaa\pcmt\deploy\terraform\modules\pcmt-network
# ======================================================

######################################################################
# Copyright (c) 2019, VillageReach
# Licensed under the Non-Profit Open Software License version 3.0.
# SPDX-License-Identifier: NPOSL-3.0
######################################################################

module "vpc" {
  source = "terraform-aws-modules/vpc/aws"
  version = ">= 2.44"

  name = "pcmt"
  cidr = "10.0.0.0/16"

  azs            = ["${var.aws-region}a", "${var.aws-region}b"]
  public_subnets = ["10.0.1.0/24", "10.0.2.0/24"]

  enable_nat_gateway = false
  enable_vpn_gateway = false

  tags = {
    BillTo = "${var.tag-bill-to}"
    Type   = "${var.tag-type}"
  }
}

resource "aws_security_group" "pcmt-web" {
  name        = "pcmt-web"
  description = "Allow http https ssh inbound, all outbound traffic"
  vpc_id      = module.vpc.vpc_id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = "80"
    to_port     = "80"
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = "443"
    to_port     = "443"
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 65535
    protocol    = "udp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name   = "pcmt-web"
    BillTo = "${var.tag-bill-to}"
    Type   = "${var.tag-type}"
  }
}


# ======================================================
# Archivo original: outputs.tf
# Carpeta: C:\Users\asus\cloned_repos\Abelaa\pcmt\deploy\terraform\modules\pcmt-network
# ======================================================

######################################################################
# Copyright (c) 2019, VillageReach
# Licensed under the Non-Profit Open Software License version 3.0.
# SPDX-License-Identifier: NPOSL-3.0
######################################################################

output "vpc-subnet-id" {
  value       = module.vpc.public_subnets[0]
  description = "Id of the first subnet of the VPC"
}

output "security-group-id" {
  value       = aws_security_group.pcmt-web.id
  description = "Id of the security group"
}


# ======================================================
# Archivo original: variables.tf
# Carpeta: C:\Users\asus\cloned_repos\Abelaa\pcmt\deploy\terraform\modules\pcmt-network
# ======================================================

variable "aws-region" {
  type        = string
  description = "AWS Region to use"
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



# ======================================================
# Archivo fusionado: pcmt-network-dev\cloudpcmt-network-dev.tf
# Piezas Terraform en carpeta: 8
# Tiene arquitectura (EC2/Docker/Serverless): False
# ======================================================



# ======================================================
# Archivo original: main.tf
# Carpeta: C:\Users\asus\cloned_repos\Abelaa\pcmt\deploy\terraform\pcmt-network-dev
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
      version = "~> 2.70"
    }
  }
  
  backend "s3" {
    bucket = "pcmt-terraform-states"
    key    = "pcmt-network-dev.tf"
    region = "eu-west-1"
  }
}

provider "aws" {
  region = var.aws-region
}

module "pcmt-network-dev" {
  source = "../modules/pcmt-network"

  aws-region  = var.aws-region
  tag-type    = var.tag-type
  tag-bill-to = var.tag-bill-to
}



# ======================================================
# Archivo original: outputs.tf
# Carpeta: C:\Users\asus\cloned_repos\Abelaa\pcmt\deploy\terraform\pcmt-network-dev
# ======================================================

######################################################################
# Copyright (c) 2019, VillageReach
# Licensed under the Non-Profit Open Software License version 3.0.
# SPDX-License-Identifier: NPOSL-3.0
######################################################################

output "vpc-subnet-id" {
  value       = module.pcmt-network-dev.vpc-subnet-id
  description = "Id of the first subnet of the VPC"
}

output "security-group-id" {
  value       = module.pcmt-network-dev.security-group-id
  description = "Id of the security group"
}


# ======================================================
# Archivo original: terraform.tfvars
# Carpeta: C:\Users\asus\cloned_repos\Abelaa\pcmt\deploy\terraform\pcmt-network-dev
# ======================================================

aws-region = "eu-west-1"

tag-type    = "test"
tag-bill-to = "PCMT"


# ======================================================
# Archivo original: variables.tf
# Carpeta: C:\Users\asus\cloned_repos\Abelaa\pcmt\deploy\terraform\pcmt-network-dev
# ======================================================

variable "aws-region" {
  type        = string
  description = "AWS Region to use"
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



# ======================================================
# Archivo fusionado: pcmt-network-useast\cloudpcmt-network-useast.tf
# Piezas Terraform en carpeta: 8
# Tiene arquitectura (EC2/Docker/Serverless): False
# ======================================================



# ======================================================
# Archivo original: main.tf
# Carpeta: C:\Users\asus\cloned_repos\Abelaa\pcmt\deploy\terraform\pcmt-network-useast
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
      version = "~> 2.70"
    }
  }
  
  backend "s3" {
    bucket = "pcmt-terraform-states"
    key    = "pcmt-network-useast.tf"
    region = "eu-west-1"
  }
}

provider "aws" {
  region = var.aws-region
}

module "pcmt-network-useast" {
  source = "../modules/pcmt-network"

  aws-region  = var.aws-region
  tag-type    = var.tag-type
  tag-bill-to = var.tag-bill-to
}



# ======================================================
# Archivo original: outputs.tf
# Carpeta: C:\Users\asus\cloned_repos\Abelaa\pcmt\deploy\terraform\pcmt-network-useast
# ======================================================

######################################################################
# Copyright (c) 2019, VillageReach
# Licensed under the Non-Profit Open Software License version 3.0.
# SPDX-License-Identifier: NPOSL-3.0
######################################################################

output "vpc-subnet-id" {
  value       = module.pcmt-network-useast.vpc-subnet-id
  description = "Id of the first subnet of the VPC"
}

output "security-group-id" {
  value       = module.pcmt-network-useast.security-group-id
  description = "Id of the security group"
}


# ======================================================
# Archivo original: terraform.tfvars
# Carpeta: C:\Users\asus\cloned_repos\Abelaa\pcmt\deploy\terraform\pcmt-network-useast
# ======================================================

aws-region = "us-east-2"

tag-type    = "infrastructure"
tag-bill-to = "PCMT"



# ======================================================
# Archivo original: variables.tf
# Carpeta: C:\Users\asus\cloned_repos\Abelaa\pcmt\deploy\terraform\pcmt-network-useast
# ======================================================

variable "aws-region" {
  type        = string
  description = "AWS Region to use"
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



# ======================================================
# Archivo fusionado: beta\cloudbeta.tf
# Piezas Terraform en carpeta: 11
# Tiene arquitectura (EC2/Docker/Serverless): False
# ======================================================



# ======================================================
# Archivo original: main.tf
# Carpeta: C:\Users\asus\cloned_repos\Abelaa\pcmt\deploy\terraform\beta
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
    key    = "pcmt-beta.tf"
    region = "eu-west-1"
  }
}

provider "aws" {
  region = var.aws-region
}

data "terraform_remote_state" "pcmt-network-dev" {
  backend = "s3"
  config = {
    bucket = "pcmt-terraform-states"
    key    = "pcmt-network-dev.tf"
    region = "eu-west-1"
  }
}

data "terraform_remote_state" "pcmt-hosted-zone" {
  backend = "s3"
  config = {
    bucket = "pcmt-terraform-states"
    key    = "pcmt-villagereach-org.tf"
    region = "eu-west-1"
  }
}

# s3 bucket to serve http redirect
resource "aws_s3_bucket" "redirect" {
  bucket = var.domain-name
  acl    = "public-read"

  tags = {
    Name   = "${var.tag-name}"
    BillTo = "${var.tag-bill-to}"
    Type   = "${var.tag-type}"
  }

  versioning {
    enabled = false
  }

  website {
    redirect_all_requests_to = "https://demo.productcatalog.io"
  }
}

#route 53 to s3 bucket
resource "aws_route53_record" "main" {
  zone_id = data.terraform_remote_state.pcmt-hosted-zone.outputs.main-hosted-zone-id
  name    = var.domain-name
  type    = "A"

  alias {
    name                   = aws_s3_bucket.redirect.website_domain
    zone_id                = aws_s3_bucket.redirect.hosted_zone_id
    evaluate_target_health = false
  }
}


# ======================================================
# Archivo original: terraform.tfvars
# Carpeta: C:\Users\asus\cloned_repos\Abelaa\pcmt\deploy\terraform\beta
# ======================================================

aws-region = "eu-west-1"

tag-name    = "pcmt-beta"
tag-type    = "demo"
tag-bill-to = "PCMT"

domain-name = "beta.pcmt.villagereach.org"



# ======================================================
# Archivo original: variables.tf
# Carpeta: C:\Users\asus\cloned_repos\Abelaa\pcmt\deploy\terraform\beta
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

variable "domain-name" {
  type        = string
  description = "AWS Route53 Domain Name"
}



# ======================================================
# Archivo fusionado: productcatalog-io\cloudproductcatalog-io.tf
# Piezas Terraform en carpeta: 11
# Tiene arquitectura (EC2/Docker/Serverless): False
# ======================================================



# ======================================================
# Archivo original: main.tf
# Carpeta: C:\Users\asus\cloned_repos\Abelaa\pcmt\deploy\terraform\productcatalog-io
# ======================================================

######################################################################
# Copyright (c) 2020, VillageReach
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
    key    = "pcmt-productcatalog-io.tf"
    region = "eu-west-1"
  }
}

provider "aws" {
  region = var.aws-region
}


# ======================================================
# Archivo original: network.tf
# Carpeta: C:\Users\asus\cloned_repos\Abelaa\pcmt\deploy\terraform\productcatalog-io
# ======================================================

resource "aws_route53_zone" "main" {
  name = var.hosted-zone-domain-name

  tags = {
    BillTo = "${var.tag-bill-to}"
  }
}

resource "aws_route53_record" "main" {
  zone_id = aws_route53_zone.main.id
  name    = var.hosted-zone-domain-name
  type    = "A"
  ttl     = 300
  records = ["35.185.44.232"]
}

resource "aws_route53_record" "www" {
  zone_id = aws_route53_zone.main.id
  name    = "www"
  type    = "CNAME"
  ttl     = 300
  records = ["pcmt.gitlab.io."]
}

resource "aws_route53_record" "main-verify" {
  zone_id = aws_route53_zone.main.id
  name    = "_gitlab-pages-verification-code.productcatalog.io"
  type    = "TXT"
  ttl     = 300
  records = ["gitlab-pages-verification-code=34a73686aba7e04b65ee5bf6893634a2"]
}

resource "aws_route53_record" "www-verify" {
  zone_id = aws_route53_zone.main.id
  name    = "_gitlab-pages-verification-code.www.productcatalog.io"
  type    = "TXT"
  ttl     = 300
  records = ["gitlab-pages-verification-code=5fe6181a4855a9d0275e8d949d702e6b"]
}


# ======================================================
# Archivo original: outputs.tf
# Carpeta: C:\Users\asus\cloned_repos\Abelaa\pcmt\deploy\terraform\productcatalog-io
# ======================================================

output "main-hosted-zone-id" {
  value       = aws_route53_zone.main.zone_id
  description = "Id of the main hosted zone"
}


# ======================================================
# Archivo original: terraform.tfvars
# Carpeta: C:\Users\asus\cloned_repos\Abelaa\pcmt\deploy\terraform\productcatalog-io
# ======================================================

aws-region              = "us-east-1"
tag-bill-to             = "PCMT"
hosted-zone-domain-name = "productcatalog.io"


# ======================================================
# Archivo original: variables.tf
# Carpeta: C:\Users\asus\cloned_repos\Abelaa\pcmt\deploy\terraform\productcatalog-io
# ======================================================

variable "aws-region" {
  type        = string
  description = "AWS Region to use"
}

variable "tag-bill-to" {
  type        = string
  description = "Which project to bill the provisioned resources"
  default     = "PCMT"
}

variable "hosted-zone-domain-name" {
  type        = string
  description = "AWS Route53 Hosted Zone Domain Name"
}



# ======================================================
# Archivo fusionado: covid-dev\cloudcovid-dev.tf
# Piezas Terraform en carpeta: 14
# Tiene arquitectura (EC2/Docker/Serverless): True
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



# ======================================================
# Archivo fusionado: demo\clouddemo.tf
# Piezas Terraform en carpeta: 14
# Tiene arquitectura (EC2/Docker/Serverless): True
# ======================================================



# ======================================================
# Archivo original: main.tf
# Carpeta: C:\Users\asus\cloned_repos\Abelaa\pcmt\deploy\terraform\demo
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
    key    = "pcmt-demo.tf"
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

module "demo" {
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
# Carpeta: C:\Users\asus\cloned_repos\Abelaa\pcmt\deploy\terraform\demo
# ======================================================

aws-region    = "us-east-2"
instance-type = "t3a.small"

tag-name    = "demo"
tag-type    = "demo"
tag-bill-to = "PCMT"

domain-name = "demo.productcatalog.io"



# ======================================================
# Archivo original: variables.tf
# Carpeta: C:\Users\asus\cloned_repos\Abelaa\pcmt\deploy\terraform\demo
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



# ======================================================
# Archivo fusionado: ethiopia-demo\cloudethiopia-demo.tf
# Piezas Terraform en carpeta: 14
# Tiene arquitectura (EC2/Docker/Serverless): True
# ======================================================



# ======================================================
# Archivo original: main.tf
# Carpeta: C:\Users\asus\cloned_repos\Abelaa\pcmt\deploy\terraform\ethiopia-demo
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
    key    = "pcmt-ethiopia-demo.tf"
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

module "ethiopia-demo" {
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
# Carpeta: C:\Users\asus\cloned_repos\Abelaa\pcmt\deploy\terraform\ethiopia-demo
# ======================================================

aws-region    = "us-east-2"
instance-type = "t3a.small"

tag-name    = "ethiopia-demo"
tag-type    = "demo"
tag-bill-to = "PCMT"

domain-name = "ethiopia-demo.productcatalog.io"



# ======================================================
# Archivo original: variables.tf
# Carpeta: C:\Users\asus\cloned_repos\Abelaa\pcmt\deploy\terraform\ethiopia-demo
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



# ======================================================
# Archivo fusionado: malawi\cloudmalawi.tf
# Piezas Terraform en carpeta: 14
# Tiene arquitectura (EC2/Docker/Serverless): True
# ======================================================



# ======================================================
# Archivo original: main.tf
# Carpeta: C:\Users\asus\cloned_repos\Abelaa\pcmt\deploy\terraform\malawi
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
    profile = "villagereach"
    bucket  = "pcmt-terraform-states"
    key     = "pcmt-malawi.tf"
    region  = "eu-west-1"
  }
}

provider "aws" {
  alias   = "villagereach"
  profile = "villagereach"
  region  = var.aws-region
}

data "terraform_remote_state" "pcmt-network" {
  backend = "s3"
  config = {
    profile = "villagereach"
    bucket  = "pcmt-terraform-states"
    key     = "pcmt-network-useast.tf"
    region  = "eu-west-1"
  }
}

data "terraform_remote_state" "pcmt-hosted-zone" {
  backend = "s3"
  config = {
    profile = "villagereach"
    bucket  = "pcmt-terraform-states"
    key     = "pcmt-productcatalog-io.tf"
    region  = "eu-west-1"
  }
}

module "malawi" {
  source = "../modules/pcmt"
  providers = {
    aws.compute = aws.villagereach
    aws.network = aws.villagereach
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
# Carpeta: C:\Users\asus\cloned_repos\Abelaa\pcmt\deploy\terraform\malawi
# ======================================================

aws-region   = "us-east-2"

tag-name    = "pcmt-malawi"
tag-type    = "production"
tag-bill-to = "PCMT-Malawi"

domain-name = "malawi.productcatalog.io"



# ======================================================
# Archivo original: variables.tf
# Carpeta: C:\Users\asus\cloned_repos\Abelaa\pcmt\deploy\terraform\malawi
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



# ======================================================
# Archivo fusionado: rwanda-demo\cloudrwanda-demo.tf
# Piezas Terraform en carpeta: 14
# Tiene arquitectura (EC2/Docker/Serverless): True
# ======================================================



# ======================================================
# Archivo original: main.tf
# Carpeta: C:\Users\asus\cloned_repos\Abelaa\pcmt\deploy\terraform\rwanda-demo
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
    key    = "pcmt-rwanda-demo.tf"
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

module "rwanda-demo" {
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
# Carpeta: C:\Users\asus\cloned_repos\Abelaa\pcmt\deploy\terraform\rwanda-demo
# ======================================================

aws-region    = "us-east-2"
instance-type = "t3a.small"

tag-name    = "rwanda-demo"
tag-type    = "demo"
tag-bill-to = "PCMT"

domain-name = "rwanda-demo.productcatalog.io"



# ======================================================
# Archivo original: variables.tf
# Carpeta: C:\Users\asus\cloned_repos\Abelaa\pcmt\deploy\terraform\rwanda-demo
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



# ======================================================
# Archivo fusionado: showcase\cloudshowcase.tf
# Piezas Terraform en carpeta: 14
# Tiene arquitectura (EC2/Docker/Serverless): True
# ======================================================



# ======================================================
# Archivo original: main.tf
# Carpeta: C:\Users\asus\cloned_repos\Abelaa\pcmt\deploy\terraform\showcase
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
    key    = "pcmt-showcase.tf"
    region = "eu-west-1"
  }
}

provider "aws" {
  region = var.aws-region
}

data "terraform_remote_state" "pcmt-network-dev" {
  backend = "s3"
  config = {
    bucket = "pcmt-terraform-states"
    key    = "pcmt-network-dev.tf"
    region = "eu-west-1"
  }
}

data "terraform_remote_state" "pcmt-hosted-zone" {
  backend = "s3"
  config = {
    bucket = "pcmt-terraform-states"
    key    = "pcmt-villagereach-org.tf"
    region = "eu-west-1"
  }
}

module "showcase" {
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
  subnet-id         = data.terraform_remote_state.pcmt-network-dev.outputs.vpc-subnet-id
  security-group-id = data.terraform_remote_state.pcmt-network-dev.outputs.security-group-id
  route53-zone-id   = data.terraform_remote_state.pcmt-hosted-zone.outputs.main-hosted-zone-id
}



# ======================================================
# Archivo original: terraform.tfvars
# Carpeta: C:\Users\asus\cloned_repos\Abelaa\pcmt\deploy\terraform\showcase
# ======================================================

aws-region = "eu-west-1"

tag-name    = "pcmt-showcase"
tag-type    = "staging"
tag-bill-to = "PCMT"

domain-name = "showcase.pcmt.villagereach.org"



# ======================================================
# Archivo original: variables.tf
# Carpeta: C:\Users\asus\cloned_repos\Abelaa\pcmt\deploy\terraform\showcase
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



# ======================================================
# Archivo fusionado: test\cloudtest.tf
# Piezas Terraform en carpeta: 14
# Tiene arquitectura (EC2/Docker/Serverless): True
# ======================================================



# ======================================================
# Archivo original: main.tf
# Carpeta: C:\Users\asus\cloned_repos\Abelaa\pcmt\deploy\terraform\test
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
    key    = "pcmt-test.tf"
    region = "eu-west-1"
  }
}

provider "aws" {
  region = var.aws-region
}

data "terraform_remote_state" "pcmt-network-dev" {
  backend = "s3"
  config = {
    bucket = "pcmt-terraform-states"
    key    = "pcmt-network-dev.tf"
    region = "eu-west-1"
  }
}

data "terraform_remote_state" "pcmt-hosted-zone" {
  backend = "s3"
  config = {
    bucket = "pcmt-terraform-states"
    key    = "pcmt-villagereach-org.tf"
    region = "eu-west-1"
  }
}

module "test" {
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
  subnet-id         = data.terraform_remote_state.pcmt-network-dev.outputs.vpc-subnet-id
  security-group-id = data.terraform_remote_state.pcmt-network-dev.outputs.security-group-id
  route53-zone-id   = data.terraform_remote_state.pcmt-hosted-zone.outputs.main-hosted-zone-id
}



# ======================================================
# Archivo original: terraform.tfvars
# Carpeta: C:\Users\asus\cloned_repos\Abelaa\pcmt\deploy\terraform\test
# ======================================================

aws-region = "eu-west-1"

tag-name    = "pcmt-test"
tag-type    = "staging"
tag-bill-to = "PCMT"

domain-name = "test.pcmt.villagereach.org"



# ======================================================
# Archivo original: variables.tf
# Carpeta: C:\Users\asus\cloned_repos\Abelaa\pcmt\deploy\terraform\test
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



# ======================================================
# Archivo fusionado: undp-demo\cloudundp-demo.tf
# Piezas Terraform en carpeta: 14
# Tiene arquitectura (EC2/Docker/Serverless): True
# ======================================================



# ======================================================
# Archivo original: main.tf
# Carpeta: C:\Users\asus\cloned_repos\Abelaa\pcmt\deploy\terraform\undp-demo
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
    key    = "pcmt-undp-demo.tf"
    region = "eu-west-1"
  }
}

provider "aws" {
  region = var.aws-region
}

data "terraform_remote_state" "pcmt-network-dev" {
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

module "undp-demo" {
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
  subnet-id         = data.terraform_remote_state.pcmt-network-dev.outputs.vpc-subnet-id
  security-group-id = data.terraform_remote_state.pcmt-network-dev.outputs.security-group-id
  route53-zone-id   = data.terraform_remote_state.pcmt-hosted-zone.outputs.main-hosted-zone-id
}



# ======================================================
# Archivo original: terraform.tfvars
# Carpeta: C:\Users\asus\cloned_repos\Abelaa\pcmt\deploy\terraform\undp-demo
# ======================================================

aws-region = "us-east-2"

tag-name    = "pcmt-undp-demo"
tag-type    = "demo"
tag-bill-to = "PCMT"

instance-type    = "t3a.medium"
root-volume-size = "40"

domain-name = "undp-demo.productcatalog.io"



# ======================================================
# Archivo original: variables.tf
# Carpeta: C:\Users\asus\cloned_repos\Abelaa\pcmt\deploy\terraform\undp-demo
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



# ======================================================
# Archivo fusionado: zambia-demo\cloudzambia-demo.tf
# Piezas Terraform en carpeta: 14
# Tiene arquitectura (EC2/Docker/Serverless): True
# ======================================================



# ======================================================
# Archivo original: main.tf
# Carpeta: C:\Users\asus\cloned_repos\Abelaa\pcmt\deploy\terraform\zambia-demo
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
    key    = "pcmt-zambia-demo.tf"
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

module "zambia-demo" {
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
# Carpeta: C:\Users\asus\cloned_repos\Abelaa\pcmt\deploy\terraform\zambia-demo
# ======================================================

aws-region    = "us-east-2"
instance-type = "t3a.small"

tag-name    = "zambia-demo"
tag-type    = "demo"
tag-bill-to = "PCMT"

domain-name = "zambia-demo.productcatalog.io"



# ======================================================
# Archivo original: variables.tf
# Carpeta: C:\Users\asus\cloned_repos\Abelaa\pcmt\deploy\terraform\zambia-demo
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



# ======================================================
# Archivo fusionado: cameroon-covid\cloudcameroon-covid.tf
# Piezas Terraform en carpeta: 15
# Tiene arquitectura (EC2/Docker/Serverless): True
# ======================================================



# ======================================================
# Archivo original: main.tf
# Carpeta: C:\Users\asus\cloned_repos\Abelaa\pcmt\deploy\terraform\cameroon-covid
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
    profile = "chai"
    bucket  = "chai-pcmt-terraform-states"
    key     = "pcmt-cameroon-covid.tf"
    region  = "us-east-1"
  }
}

provider "aws" {
  alias   = "villagereach"
  profile = "villagereach"
  region  = var.aws-region
}

provider "aws" {
  alias   = "chai"
  profile = "chai"
  region  = var.aws-region
}

data "terraform_remote_state" "pcmt-network" {
  backend = "s3"
  config = {
    profile = "chai"
    bucket  = "chai-pcmt-terraform-states"
    key     = "chai-network-useast.tf"
    region  = "us-east-1"
  }
}

data "terraform_remote_state" "pcmt-hosted-zone" {
  backend = "s3"
  config = {
    profile = "villagereach"
    bucket  = "pcmt-terraform-states"
    key     = "pcmt-productcatalog-io.tf"
    region  = "eu-west-1"
  }
}

module "cameroon-covid" {
  source = "../modules/pcmt"
  providers = {
    aws.compute = aws.chai
    aws.network = aws.villagereach
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
# Carpeta: C:\Users\asus\cloned_repos\Abelaa\pcmt\deploy\terraform\cameroon-covid
# ======================================================

ec2-key-pair = "PcmtCovidRefKeyPair"
aws-region   = "us-east-1"

tag-name    = "cameroon-covid-pcmt"
tag-type    = "production"
tag-bill-to = "cameroon"

domain-name = "cameroon-covid.productcatalog.io"



# ======================================================
# Archivo original: variables.tf
# Carpeta: C:\Users\asus\cloned_repos\Abelaa\pcmt\deploy\terraform\cameroon-covid
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



# ======================================================
# Archivo fusionado: covid-ref\cloudcovid-ref.tf
# Piezas Terraform en carpeta: 15
# Tiene arquitectura (EC2/Docker/Serverless): True
# ======================================================



# ======================================================
# Archivo original: main.tf
# Carpeta: C:\Users\asus\cloned_repos\Abelaa\pcmt\deploy\terraform\covid-ref
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
    profile = "chai"
    bucket  = "chai-pcmt-terraform-states"
    key     = "pcmt-covid-ref.tf"
    region  = "us-east-1"
  }
}

provider "aws" {
  alias   = "villagereach"
  profile = "villagereach"
  region  = var.aws-region
}

provider "aws" {
  alias   = "chai"
  profile = "chai"
  region  = var.aws-region
}

data "terraform_remote_state" "pcmt-network" {
  backend = "s3"
  config = {
    profile = "chai"
    bucket  = "chai-pcmt-terraform-states"
    key     = "chai-network-useast.tf"
    region  = "us-east-1"
  }
}

data "terraform_remote_state" "pcmt-hosted-zone" {
  backend = "s3"
  config = {
    profile = "villagereach"
    bucket  = "pcmt-terraform-states"
    key     = "pcmt-productcatalog-io.tf"
    region  = "eu-west-1"
  }
}

module "covid-ref" {
  source = "../modules/pcmt"
  providers = {
    aws.compute = aws.chai
    aws.network = aws.villagereach
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
# Carpeta: C:\Users\asus\cloned_repos\Abelaa\pcmt\deploy\terraform\covid-ref
# ======================================================

ec2-key-pair = "PcmtCovidRefKeyPair"
aws-region   = "us-east-1"

tag-name    = "covid-ref"
tag-type    = "staging"
tag-bill-to = "PCMT"

domain-name = "covid-ref.productcatalog.io"



# ======================================================
# Archivo original: variables.tf
# Carpeta: C:\Users\asus\cloned_repos\Abelaa\pcmt\deploy\terraform\covid-ref
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



# ======================================================
# Archivo fusionado: gfpvan\cloudgfpvan.tf
# Piezas Terraform en carpeta: 15
# Tiene arquitectura (EC2/Docker/Serverless): True
# ======================================================



# ======================================================
# Archivo original: main.tf
# Carpeta: C:\Users\asus\cloned_repos\Abelaa\pcmt\deploy\terraform\gfpvan
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
    profile = "villagereach-gfpvan"
    bucket  = "vr-gfpvan-terraform-states"
    key     = "pcmt-gfpvan.tf"
    region  = "us-east-2"
  }
}

provider "aws" {
  alias   = "villagereach"
  profile = "villagereach"
  region  = var.aws-region
}

provider "aws" {
  alias   = "gfpvan"
  profile = "villagereach-gfpvan"
  region  = var.aws-region
}

data "terraform_remote_state" "pcmt-network" {
  backend = "s3"
  config = {
    profile = "villagereach-gfpvan"
    bucket  = "vr-gfpvan-terraform-states"
    key     = "gfpvan-network-useast.tf"
    region  = "us-east-2"
  }
}

data "terraform_remote_state" "pcmt-hosted-zone" {
  backend = "s3"
  config = {
    profile = "villagereach"
    bucket  = "pcmt-terraform-states"
    key     = "pcmt-productcatalog-io.tf"
    region  = "eu-west-1"
  }
}

module "gfpvan" {
  source = "../modules/pcmt"
  providers = {
    aws.compute = aws.gfpvan
    aws.network = aws.villagereach
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
# Carpeta: C:\Users\asus\cloned_repos\Abelaa\pcmt\deploy\terraform\gfpvan
# ======================================================

ec2-key-pair  = "pcmt-gfpvan"
aws-region    = "us-east-2"
instance-type = "t3a.medium"

tag-name    = "gfpvan-prod"
tag-type    = "production"
tag-bill-to = "PCMT"

domain-name = "gfpvan-prod.productcatalog.io"



# ======================================================
# Archivo original: variables.tf
# Carpeta: C:\Users\asus\cloned_repos\Abelaa\pcmt\deploy\terraform\gfpvan
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



# ======================================================
# Archivo fusionado: gfpvan-uat\cloudgfpvan-uat.tf
# Piezas Terraform en carpeta: 15
# Tiene arquitectura (EC2/Docker/Serverless): True
# ======================================================



# ======================================================
# Archivo original: main.tf
# Carpeta: C:\Users\asus\cloned_repos\Abelaa\pcmt\deploy\terraform\gfpvan-uat
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
    profile = "villagereach-gfpvan"
    bucket  = "vr-gfpvan-terraform-states"
    key     = "pcmt-gfpvan-uat.tf"
    region  = "us-east-2"
  }
}

provider "aws" {
  alias   = "villagereach"
  profile = "villagereach"
  region  = var.aws-region
}

provider "aws" {
  alias   = "gfpvan"
  profile = "villagereach-gfpvan"
  region  = var.aws-region
}

data "terraform_remote_state" "pcmt-network" {
  backend = "s3"
  config = {
    profile = "villagereach-gfpvan"
    bucket  = "vr-gfpvan-terraform-states"
    key     = "gfpvan-network-useast.tf"
    region  = "us-east-2"
  }
}

data "terraform_remote_state" "pcmt-hosted-zone" {
  backend = "s3"
  config = {
    profile = "villagereach"
    bucket  = "pcmt-terraform-states"
    key     = "pcmt-productcatalog-io.tf"
    region  = "eu-west-1"
  }
}

module "gfpvan-uat" {
  source = "../modules/pcmt"
  providers = {
    aws.compute = aws.gfpvan
    aws.network = aws.villagereach
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
# Carpeta: C:\Users\asus\cloned_repos\Abelaa\pcmt\deploy\terraform\gfpvan-uat
# ======================================================

ec2-key-pair = "pcmt-gfpvan"
aws-region   = "us-east-2"

tag-name    = "gfpvan-uat"
tag-type    = "staging"
tag-bill-to = "PCMT"

domain-name = "gfpvan-uat.productcatalog.io"



# ======================================================
# Archivo original: variables.tf
# Carpeta: C:\Users\asus\cloned_repos\Abelaa\pcmt\deploy\terraform\gfpvan-uat
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



# ======================================================
# Archivo fusionado: zimbabwe-covid\cloudzimbabwe-covid.tf
# Piezas Terraform en carpeta: 15
# Tiene arquitectura (EC2/Docker/Serverless): True
# ======================================================



# ======================================================
# Archivo original: main.tf
# Carpeta: C:\Users\asus\cloned_repos\Abelaa\pcmt\deploy\terraform\zimbabwe-covid
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
    profile = "chai"
    bucket  = "chai-pcmt-terraform-states"
    key     = "pcmt-zimbabwe-covid.tf"
    region  = "us-east-1"
  }
}

provider "aws" {
  alias   = "villagereach"
  profile = "villagereach"
  region  = var.aws-region
}

provider "aws" {
  alias   = "chai"
  profile = "chai"
  region  = var.aws-region
}

data "terraform_remote_state" "pcmt-network" {
  backend = "s3"
  config = {
    profile = "chai"
    bucket  = "chai-pcmt-terraform-states"
    key     = "chai-network-useast.tf"
    region  = "us-east-1"
  }
}

data "terraform_remote_state" "pcmt-hosted-zone" {
  backend = "s3"
  config = {
    profile = "villagereach"
    bucket  = "pcmt-terraform-states"
    key     = "pcmt-productcatalog-io.tf"
    region  = "eu-west-1"
  }
}

module "zimbabwe-covid" {
  source = "../modules/pcmt"
  providers = {
    aws.compute = aws.chai
    aws.network = aws.villagereach
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
# Carpeta: C:\Users\asus\cloned_repos\Abelaa\pcmt\deploy\terraform\zimbabwe-covid
# ======================================================

ec2-key-pair = "PcmtCovidRefKeyPair"
aws-region   = "us-east-1"

tag-name    = "zimbabwe-covid-pcmt"
tag-type    = "production"
tag-bill-to = "zimbabwe"

domain-name = "zimbabwe-covid.productcatalog.io"



# ======================================================
# Archivo original: variables.tf
# Carpeta: C:\Users\asus\cloned_repos\Abelaa\pcmt\deploy\terraform\zimbabwe-covid
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



# ======================================================
# Archivo fusionado: modules\pcmt\cloudpcmt.tf
# Piezas Terraform en carpeta: 27
# Tiene arquitectura (EC2/Docker/Serverless): True
# ======================================================



# ======================================================
# Archivo original: compute.tf
# Carpeta: C:\Users\asus\cloned_repos\Abelaa\pcmt\deploy\terraform\modules\pcmt
# ======================================================

######################################################################
# Copyright (c) 2019, VillageReach
# Licensed under the Non-Profit Open Software License version 3.0.
# SPDX-License-Identifier: NPOSL-3.0
######################################################################

resource "aws_instance" "app" {
  provider               = aws.compute
  ami                    = data.aws_ami.ubuntu-latest.id
  instance_type          = var.instance-type
  key_name               = var.ec2-key-pair
  subnet_id              = var.subnet-id
  vpc_security_group_ids = ["${var.security-group-id}"]

  root_block_device {
    volume_type           = "gp2"
    volume_size           = var.root-volume-size
    delete_on_termination = "true"
  }

  tags = {
    Name        = "${var.tag-name}"
    BillTo      = "${var.tag-bill-to}"
    Type        = "${var.tag-type}"
    DeployGroup = "${var.app-deploy-group}"
  }

  volume_tags = {
    BillTo = "${var.tag-bill-to}"
    Type   = "${var.tag-type}"
  }

  lifecycle {
    ignore_changes = [
      ami,
    ]
  }
}

data "aws_ami" "ubuntu-latest" {
  provider    = aws.compute
  most_recent = true
  owners      = ["099720109477"]

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-bionic-*"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }
}

resource "null_resource" "deploy-docker" {
  depends_on = [aws_instance.app]
  triggers = {
    build_number = "${timestamp()}"
  }

  connection {
    user = "ubuntu"
    host = aws_instance.app.public_ip
  }

  provisioner "remote-exec" {
    inline = ["ls"]

    connection {
      type = "ssh"
      user = "ubuntu"
    }
  }

  provisioner "local-exec" {
    command = "../script/pcmt-ansible.sh ${aws_instance.app.public_ip} ${var.domain-name}"
  }
}


# ======================================================
# Archivo original: main.tf
# Carpeta: C:\Users\asus\cloned_repos\Abelaa\pcmt\deploy\terraform\modules\pcmt
# ======================================================

terraform {
  required_version = ">= 0.12.0"

  required_providers {
    aws = {
      version = ">= 3.1"
    }
  }
}

provider "aws" {
  alias = "compute"
}

provider "aws" {
  alias = "network"
}



# ======================================================
# Archivo original: network.tf
# Carpeta: C:\Users\asus\cloned_repos\Abelaa\pcmt\deploy\terraform\modules\pcmt
# ======================================================

######################################################################
# Copyright (c) 2019, VillageReach
# Licensed under the Non-Profit Open Software License version 3.0.
# SPDX-License-Identifier: NPOSL-3.0
######################################################################

resource "aws_route53_record" "main" {
  provider = aws.network
  zone_id  = var.route53-zone-id
  name     = var.domain-name
  type     = "A"
  ttl      = 300
  records  = ["${aws_instance.app.public_ip}"]
}


# ======================================================
# Archivo original: storage.tf
# Carpeta: C:\Users\asus\cloned_repos\Abelaa\pcmt\deploy\terraform\modules\pcmt
# ======================================================

resource "aws_s3_bucket" "backup" {
  provider = aws.compute
  bucket   = var.domain-name
  acl      = "private"

  tags = {
    Name   = "${var.tag-name}"
    BillTo = "${var.tag-bill-to}"
    Type   = "${var.tag-type}"
  }

  versioning {
    enabled = true
  }

  lifecycle_rule {
    enabled = true
    noncurrent_version_transition {
      days          = var.backup-days-till-glacier
      storage_class = "GLACIER"
    }

    noncurrent_version_expiration {
      days = var.backup-days-till-expire
    }
  }
}


# ======================================================
# Archivo original: variables.tf
# Carpeta: C:\Users\asus\cloned_repos\Abelaa\pcmt\deploy\terraform\modules\pcmt
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

variable "subnet-id" {
  type        = string
  description = "ID of subnet to launch EC2 into"
}

variable "route53-zone-id" {
  type        = string
  description = "ID of zone to insert record into"
}

variable "security-group-id" {
  type        = string
  description = "ID of security group to use for instance"
}

variable "backup-days-till-glacier" {
  type        = number
  description = "Days until backups are moved to glacier"
  default     = 15
}

variable "backup-days-till-expire" {
  type        = number
  description = "Days until backups expire - are deleted"
  default     = 30
}

variable "route53-provider" {
  type        = string
  description = "AWS provider to use for the DNS entry, only needed when >1 aws provider is in use"
  default     = "default"
}

