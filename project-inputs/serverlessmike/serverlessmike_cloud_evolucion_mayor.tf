

# ======================================================
# Archivo fusionado: providers\aws\management\config\cloudconfig.tf
# Piezas Terraform en carpeta: 2
# Tiene arquitectura (EC2/Docker/Serverless): False
# ======================================================



# ======================================================
# Archivo original: cd_override.tf
# Carpeta: C:\Users\asus\cloned_repos\serverlessmike\terraform\providers\aws\management\config
# ======================================================

terraform {
  backend "s3" {
    bucket   = "management-cloudops-tf-state"
    key      = "infrastructure/terraform.tfstate"
    region   = "eu-west-1"
    role_arn = "arn:aws:iam::224889443659:role/cd"
  }
}

provider "aws" {
  region  = "eu-west-1"
  version = "= 1.46.0"

  // only allow terraform to run in this account it
  allowed_account_ids = ["224889443659"]

  assume_role {
    role_arn = "arn:aws:iam::224889443659:role/cd"
  }
}




# ======================================================
# Archivo fusionado: modules\ebs\test\cloudtest.tf
# Piezas Terraform en carpeta: 3
# Tiene arquitectura (EC2/Docker/Serverless): False
# ======================================================



# ======================================================
# Archivo original: test.tf
# Carpeta: C:\Users\asus\cloned_repos\serverlessmike\terraform\modules\ebs\test
# ======================================================

terraform {
  region = "eu-west-1"
}

provider "aws" {
  region  = "eu-west-1"
  version = "= 1.29.0"

  allowed_account_ids = ["092941714243"]
}

module "ebs" {
  source       = ".."
  product      = "test"
  environment  = "dev"
  owner        = ["myname"]
  drives       = ["D"]
  volume_sizes = ["10"]
  instance_id  = "my_instance_ID"
}




# ======================================================
# Archivo fusionado: modules\stateful-ec2\test\cloudtest.tf
# Piezas Terraform en carpeta: 3
# Tiene arquitectura (EC2/Docker/Serverless): False
# ======================================================



# ======================================================
# Archivo original: test.tf
# Carpeta: C:\Users\asus\cloned_repos\serverlessmike\terraform\modules\stateful-ec2\test
# ======================================================

terraform {
  region = "eu-west-1"
}

provider "aws" {
  region  = "eu-west-1"
  version = "2.1.0"

  allowed_account_ids = ["092941714243"]
}

module "testy" {
  source                = ".."
  products              = ["test"]
  environment           = "dev"
  private_subnet_ids    = "subnet-05e9c53ea415bf726,subnet-0f581621958a7dc9c"
  public_subnet_ids     = "subnet-05e9c53ea415bf726,subnet-0f581621958a7dc9c"
  is_public             = ["true"]
  ami_versions          = ["SQL_2019_Standard-2019.12.16"]
  owners                = ["myname"]
  instance_types        = ["t3.micro"]
  min_size              = ["1"]
  des_size              = ["1"]
  max_size              = ["1"]
  key_names             = ["mykey"]
  customisation_scripts = ["mksql.ps1"]
  backup_intervals      = ["24"]
  backups_retained      = ["2"]
  backup_start_times    = ["02:00"]
  allow_1433_in         = ["test"]
  allow_1434_in         = ["test"]
  allow_rdp_in          = ["test"]
  allow_ssh_in          = ["test"]
}




# ======================================================
# Archivo fusionado: modules\windows-ec2\test\cloudtest.tf
# Piezas Terraform en carpeta: 3
# Tiene arquitectura (EC2/Docker/Serverless): True
# ======================================================



# ======================================================
# Archivo original: test.tf
# Carpeta: C:\Users\asus\cloned_repos\serverlessmike\terraform\modules\windows-ec2\test
# ======================================================

# This is a standalone test script for creating a new Windows Server EC2 instance

terraform {
  region = "eu-west-1"
}

provider "aws" {
  region  = "eu-west-1"
  version = "2.1.0"

  allowed_account_ids = ["092941714243"]
}

module "testy" {
  source = ".."

  # These parameters are specific to the environment
  environment        = "dev"
  private_subnet_ids = "subnet-08086aeb16daf04cc,subnet-08086aeb16daf04cc"
  public_subnet_ids  = "subnet-08086aeb16daf04cc,subnet-08086aeb16daf04cc"
  zone_id            = "Z1BXW5KGHX4KB6"
  topic_arn          = "arn:aws:sns:eu-west-1:092941714243:ri-dev-windows-events"

  # These parameters are specific to the product
  product              = "temp"
  ami_version          = "Base-2020.01.15"
  owner                = "My Name"
  instance_type        = "t3.medium"
  customisation_script = "temp.ps1"
  tcp_in               = ["22", "53", "3389"]
  udp_in               = ["53"]
  tcp_out              = ["22", "53", "443", "1521"]
  udp_out              = ["53"]
  d_volume             = "10"
}




# ======================================================
# Archivo fusionado: modules\wqf\test\cloudtest.tf
# Piezas Terraform en carpeta: 3
# Tiene arquitectura (EC2/Docker/Serverless): False
# ======================================================



# ======================================================
# Archivo original: main.tf
# Carpeta: C:\Users\asus\cloned_repos\serverlessmike\terraform\modules\wqf\test
# ======================================================

terraform {
  region = "eu-west-1"
}

provider "aws" {
  region  = "eu-west-1"
  version = "= 1.29.0"
}

module "testy" {
  source      = ".."
  vpc_id      = "vpc-083fc6a8e774c869d"
  environment = "dev"
}




# ======================================================
# Archivo fusionado: modules\audit\cloudaudit.tf
# Piezas Terraform en carpeta: 5
# Tiene arquitectura (EC2/Docker/Serverless): False
# ======================================================



# ======================================================
# Archivo original: main.tf
# Carpeta: C:\Users\asus\cloned_repos\serverlessmike\terraform\modules\audit
# ======================================================

# This tf creates a bucket for the audit
# The audit will eventually be run every morning by every account
# It will drop *describe-service* style JSON objects into the bucket 

resource "aws_s3_bucket" "audit" {
  bucket = "ri-aws-audit"

  tags = {
    terraform      = "true"
    repo           = "cloudops-terraform"
    environment    = "${var.environment}"
    tf-module      = "audit"
    product        = "audit"
    Name           = "ri-aws-audit"
    cost_centre    = "81183"
    security_class = "public"
  }

  lifecycle_rule {
    id      = "log"
    enabled = true

    prefix = "audit/"

    tags {
      "rule"      = "log"
      "autoclean" = "true"
    }

    transition {
      days          = 31
      storage_class = "STANDARD_IA"
    }

    expiration {
      days = 366
    }
  }

  policy = <<POLICY
{
    "Version": "2012-10-17",
    "Statement": [
        {
          "Sid": "AllowPutObject",
            "Effect": "Allow",
            "Principal": "*",
            "Action": "s3:PutObject*",
            "Resource": "arn:aws:s3:::ri-aws-audit/audit/*",
            "Condition": {
                "StringEquals": {
                    "aws:PrincipalOrgID": "o-c4oji0v6wu"
                }
            }
        },
        {
          "Sid":"AllowCloudOpsAccess",
          "Effect":"Allow",
          "Principal": {"AWS": ["arn:aws:iam::092941714243:root", "arn:aws:iam::224889443659:root", "arn:aws:iam::558469419837:root", "arn:aws:iam::795357751823:root"]},
          "Action": "s3:*",
          "Resource":["arn:aws:s3:::ri-aws-audit/*"]
        }
     ]
}
POLICY
}



# ======================================================
# Archivo original: outputs.tf
# Carpeta: C:\Users\asus\cloned_repos\serverlessmike\terraform\modules\audit
# ======================================================

output "audit_bucket_id" {
  value = "${aws_s3_bucket.audit.id}"
}

output "audit_bucket_arn" {
  value = "${aws_s3_bucket.audit.arn}"
}



# ======================================================
# Archivo original: variables.tf
# Carpeta: C:\Users\asus\cloned_repos\serverlessmike\terraform\modules\audit
# ======================================================

variable "environment" {}




# ======================================================
# Archivo fusionado: providers\aws\management\cloudmanagement.tf
# Piezas Terraform en carpeta: 5
# Tiene arquitectura (EC2/Docker/Serverless): False
# ======================================================



# ======================================================
# Archivo original: main.tf
# Carpeta: C:\Users\asus\cloned_repos\serverlessmike\terraform\providers\aws\management
# ======================================================

terraform {
  backend "s3" {
    bucket = "management-cloudops-tf-state"
    key    = "infrastructure/terraform.tfstate"
    region = "eu-west-1"
  }
}

provider "aws" {
  region  = "eu-west-1"
  version = "= 1.57.0"

  allowed_account_ids = ["224889443659"]
}

module "management" {
  source = "../../../modules/management"
}



# ======================================================
# Archivo original: outputs.tf
# Carpeta: C:\Users\asus\cloned_repos\serverlessmike\terraform\providers\aws\management
# ======================================================

output "prod_vpc_peer_connection_id" {
  value = "${module.management.management_to_prod_vpc_peering_connection_id}"
}

output "env_route53_name_servers" {
  value = "${module.management.route53_name_servers}"
}




# ======================================================
# Archivo fusionado: modules\active_directory_security_group\cloudactive_directory_security_group.tf
# Piezas Terraform en carpeta: 6
# Tiene arquitectura (EC2/Docker/Serverless): False
# ======================================================



# ======================================================
# Archivo original: main.tf
# Carpeta: C:\Users\asus\cloned_repos\serverlessmike\terraform\modules\active_directory_security_group
# ======================================================

resource "aws_security_group" "active_directory_sg" {
  name   = "active-directory-sg-${var.environment}"
  vpc_id = "${var.vpc_id}"

  ingress {
    from_port   = 636
    to_port     = 636
    protocol    = "tcp"
    cidr_blocks = ["${var.ingress_cidr_blocks}"]
  }

  ingress {
    from_port   = 137
    to_port     = 137
    protocol    = "tcp"
    cidr_blocks = ["${var.ingress_cidr_blocks}"]
  }

  ingress {
    from_port   = 137
    to_port     = 137
    protocol    = "udp"
    cidr_blocks = ["${var.ingress_cidr_blocks}"]
  }

  ingress {
    from_port   = 139
    to_port     = 139
    protocol    = "tcp"
    cidr_blocks = ["${var.ingress_cidr_blocks}"]
  }

  ingress {
    from_port   = 88
    to_port     = 88
    protocol    = "tcp"
    cidr_blocks = ["${var.ingress_cidr_blocks}"]
  }

  ingress {
    from_port   = 88
    to_port     = 88
    protocol    = "udp"
    cidr_blocks = ["${var.ingress_cidr_blocks}"]
  }

  ingress {
    from_port   = 464
    to_port     = 464
    protocol    = "tcp"
    cidr_blocks = ["${var.ingress_cidr_blocks}"]
  }

  ingress {
    from_port   = 464
    to_port     = 464
    protocol    = "udp"
    cidr_blocks = ["${var.ingress_cidr_blocks}"]
  }

  ingress {
    from_port   = 445
    to_port     = 445
    protocol    = "tcp"
    cidr_blocks = ["${var.ingress_cidr_blocks}"]
  }

  ingress {
    from_port   = 445
    to_port     = 445
    protocol    = "udp"
    cidr_blocks = ["${var.ingress_cidr_blocks}"]
  }

  ingress {
    from_port   = 389
    to_port     = 389
    protocol    = "tcp"
    cidr_blocks = ["${var.ingress_cidr_blocks}"]
  }

  ingress {
    from_port   = 3268
    to_port     = 3269
    protocol    = "tcp"
    cidr_blocks = ["${var.ingress_cidr_blocks}"]
  }

  ingress {
    from_port   = 9389
    to_port     = 9389
    protocol    = "tcp"
    cidr_blocks = ["${var.ingress_cidr_blocks}"]
  }

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["10.229.11.96/32"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}



# ======================================================
# Archivo original: outputs.tf
# Carpeta: C:\Users\asus\cloned_repos\serverlessmike\terraform\modules\active_directory_security_group
# ======================================================

output "sg_name" {
  value = "${aws_security_group.active_directory_sg.name}"
}

output "sg_id" {
  value = "${aws_security_group.active_directory_sg.id}"
}



# ======================================================
# Archivo original: variables.tf
# Carpeta: C:\Users\asus\cloned_repos\serverlessmike\terraform\modules\active_directory_security_group
# ======================================================

variable "vpc_id" {}

variable "ingress_cidr_blocks" {
  type = "list"
}

variable "environment" {}




# ======================================================
# Archivo fusionado: modules\add-iam-account\cloudadd-iam-account.tf
# Piezas Terraform en carpeta: 6
# Tiene arquitectura (EC2/Docker/Serverless): False
# ======================================================



# ======================================================
# Archivo original: main.tf
# Carpeta: C:\Users\asus\cloned_repos\serverlessmike\terraform\modules\add-iam-account
# ======================================================

// Policy variables temporary disabled for hashicorp bug 8621

variable "policy1" {
  default = "arn:aws:iam::aws:policy/ReadOnlyAccess"
}

variable "policy2" {
  default = "arn:aws:iam::aws:policy/AdministratorAccess"
}

// Operation users

resource "aws_iam_user" "servicedesk" {
  name = "servicedesk"
}

resource "aws_iam_policy_attachment" "servicedesk" {
  name       = "servicedesk"
  users      = ["${aws_iam_user.servicedesk.name}"]
  policy_arn = "${var.policy1}"
}

resource "aws_iam_user" "systeam" {
  name = "systeam"
}

resource "aws_iam_policy_attachment" "systeam" {
  name       = "systeam"
  users      = ["${aws_iam_user.systeam.name}"]
  policy_arn = "${var.policy2}"
}




# ======================================================
# Archivo fusionado: modules\object-store\cloudobject-store.tf
# Piezas Terraform en carpeta: 6
# Tiene arquitectura (EC2/Docker/Serverless): True
# ======================================================



# ======================================================
# Archivo original: s3.tf
# Carpeta: C:\Users\asus\cloned_repos\serverlessmike\terraform\modules\object-store
# ======================================================

# Build a bucket to hold scripts, backups etc.

resource "aws_s3_bucket" "bucky" {
  bucket = "ri-enterprise"

  tags {
    environment = "${var.environment}"
    owner       = "mikec"
    terraform   = "true"
    repo        = "cloudops-terraform"
  }

  acl = "private"

  versioning {
    enabled = true
  }

  lifecycle_rule {
    enabled = true

    noncurrent_version_transition {
      days          = 30
      storage_class = "STANDARD_IA"
    }

    noncurrent_version_transition {
      days          = 60
      storage_class = "GLACIER"
    }
  }
}

resource "aws_s3_bucket_policy" "product_lambda_artifacts_policy" {
  bucket = "${aws_s3_bucket.bucky.id}"
  policy = "${data.aws_iam_policy_document.bucky_polly.json}"
}

data "aws_iam_policy_document" "bucky_polly" {
  statement {
    effect = "Allow"

    actions = [
      "s3:*",
    ]

    principals = {
      type        = "AWS"
      identifiers = ["${formatlist("arn:aws:iam::%s:root", compact(var.all_enterprise_account_ids))}"]
    }

    resources = [
      "${aws_s3_bucket.bucky.arn}/*",
      "${aws_s3_bucket.bucky.arn}",
    ]
  }
}



# ======================================================
# Archivo original: variables.tf
# Carpeta: C:\Users\asus\cloned_repos\serverlessmike\terraform\modules\object-store
# ======================================================

variable "all_enterprise_account_ids" {
  description = "List of all accounts"
  type        = "list"
}

variable "environment" {
  description = "Environment in which to build"
  type        = "string"
}




# ======================================================
# Archivo fusionado: modules\lambdas\lambda_role\cloudlambda_role.tf
# Piezas Terraform en carpeta: 7
# Tiene arquitectura (EC2/Docker/Serverless): True
# ======================================================



# ======================================================
# Archivo original: main.tf
# Carpeta: C:\Users\asus\cloned_repos\serverlessmike\terraform\modules\lambdas\lambda_role
# ======================================================

resource "aws_iam_role" "styleman_lambda_role" {
  name = "styleman_lambda_role-${var.environment}"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

resource "aws_iam_role_policy" "styleman_lambda_role_policy" {
  name   = "styleman_lambda_role-${var.environment}"
  role   = "${aws_iam_role.styleman_lambda_role.id}"
  policy = "${data.aws_iam_policy_document.styleman_lambda_policy_document.json}"
}

data "aws_iam_policy_document" "styleman_lambda_policy_document" {
  statement {
    actions = [
      "logs:CreateLogGroup",
      "logs:CreateLogStream",
      "logs:PutLogEvents",
      "ec2:CreateNetworkInterface",
      "ec2:DescribeNetworkInterfaces",
      "ec2:DeleteNetworkInterface",
      "ec2:Describe*",
      "ec2:CreateSnapshot",
      "ec2:DeleteSnapshot",
      "ec2:CreateImage",
      "ec2:CreateTags",
      "ec2:DeleteTags",
      "ec2:CopyImage",
      "ec2:DeregisterImage",
      "sns:Publish",
      "cloudwatch:*",
      "ce:GetCostAndUsage",
      "events:EnableRule",
      "s3:Get*",
      "s3:List*",
      "s3:Put*",
    ]

    resources = ["*"]
  }
}

resource "aws_iam_policy" "styleman_lambda_common_policy" {
  name   = "styleman_lambda_common_policy-${var.environment}"
  policy = "${data.aws_iam_policy_document.styleman_lambda_policy_document.json}"
}



# ======================================================
# Archivo original: outputs.tf
# Carpeta: C:\Users\asus\cloned_repos\serverlessmike\terraform\modules\lambdas\lambda_role
# ======================================================

output "styleman_lambda_role_arn" {
  value = "${aws_iam_role.styleman_lambda_role.arn}"
}



# ======================================================
# Archivo original: variables.tf
# Carpeta: C:\Users\asus\cloned_repos\serverlessmike\terraform\modules\lambdas\lambda_role
# ======================================================

variable "region" {}

variable "environment" {}




# ======================================================
# Archivo fusionado: providers\aws\dev\clouddev.tf
# Piezas Terraform en carpeta: 7
# Tiene arquitectura (EC2/Docker/Serverless): True
# ======================================================



# ======================================================
# Archivo original: main.tf
# Carpeta: C:\Users\asus\cloned_repos\serverlessmike\terraform\providers\aws\dev
# ======================================================

terraform {
  backend "s3" {
    bucket = "dev-cloudops-tf-state"
    key    = "infrastructure/terraform.tfstate"
    region = "eu-west-1"
  }
}

provider "aws" {
  region  = "eu-west-1"
  version = "= 1.46.0"

  allowed_account_ids = ["092941714243"]
}

module "cloudops" {
  source = "../../../modules/cloudops"

  environment     = "dev"
  private_subnets = ["10.200.184.0/24", "10.200.185.0/24", "10.200.186.0/24"]
  public_subnets  = ["10.200.187.0/24", "10.200.188.0/24", "10.200.189.0/24"]
  vpc_cidr        = "10.200.184.0/21"
  vpc_tgw_subnets = ["10.200.190.16/28", "10.200.190.32/28", "10.200.190.48/28"]
}

module "BuildBucket" {
  environment                = "dev"
  source                     = "../../../modules/object-store"
  all_enterprise_account_ids = ["092941714243", "558469419837", "795357751823"]
}



# ======================================================
# Archivo original: outputs.tf
# Carpeta: C:\Users\asus\cloned_repos\serverlessmike\terraform\providers\aws\dev
# ======================================================

output "env_vpc_id" {
  value = "${module.cloudops.vpc_id}"
}

output "env_route53_name_servers" {
  value = "${module.cloudops.route53_name_servers}"
}



# ======================================================
# Archivo original: policy.tf
# Carpeta: C:\Users\asus\cloned_repos\serverlessmike\terraform\providers\aws\dev
# ======================================================

data "aws_iam_policy_document" "instance_profile_policy" {
  statement {
    sid = "AllowStylemanS3"

    actions = [
      "s3:*",
    ]

    effect = "Allow"

    resources = [
      "arn:aws:s3:::rmni-dev-oracle-patches",
      "arn:aws:s3:::rmni-dev-oracle-patches/*",
    ]
  }

  statement {
    sid = "AllowStylemanEC2"

    actions = [
      "ec2:Describe*",
    ]

    effect = "Allow"

    resources = [
      "*",
    ]
  }
}




# ======================================================
# Archivo fusionado: modules\cwevents\cloudcwevents.tf
# Piezas Terraform en carpeta: 9
# Tiene arquitectura (EC2/Docker/Serverless): True
# ======================================================



# ======================================================
# Archivo original: main.tf
# Carpeta: C:\Users\asus\cloned_repos\serverlessmike\terraform\modules\cwevents
# ======================================================

// CHANGING STATE EVENT

resource "aws_cloudwatch_event_rule" "changestate" {
  name        = "changestate"
  description = "Capture each EC2 changing state"

  event_pattern = <<PATTERN
{
  "source": [
    "aws.ec2"
  ],
  "detail-type": [
    "EC2 Instance State-change Notification"
  ]
}
PATTERN
}

resource "aws_cloudwatch_event_target" "changestate" {
  rule      = "${aws_cloudwatch_event_rule.changestate.name}"
  target_id = "SendToSNS"
  arn       = "${aws_sns_topic.cwevents.arn}"
}

resource "aws_sns_topic" "cwevents" {
  name = "cwevents"
}

// CW ELB

variable "wmselbname" {
  default = ""
}

resource "aws_cloudwatch_metric_alarm" "metric-elb" {
  alarm_name          = "metric-elb"
  alarm_description   = "alarm attached to the ELB"
  metric_name         = "HealthyHostCount"
  comparison_operator = "LessThanOrEqualToThreshold"
  threshold           = "0"
  statistic           = "Minimum"
  evaluation_periods  = "1"
  period              = "300"
  namespace           = "AWS/ELB"

  dimensions = {
    "LoadBalancerName" = "${var.wmselbname}"
  }

  actions_enabled           = "true"
  alarm_actions             = ["${aws_sns_topic.cwevents.arn}"]
  ok_actions                = []
  insufficient_data_actions = []
}

resource "aws_cloudwatch_metric_alarm" "metric-elb2" {
  alarm_name          = "metric-elb2"
  alarm_description   = "alarm attached to the ELB"
  metric_name         = "HTTPCode_Backend_5XX"
  comparison_operator = "GreaterThanThreshold"
  threshold           = "10"
  statistic           = "Sum"
  evaluation_periods  = "1"
  period              = "300"
  namespace           = "AWS/ELB"

  dimensions = {
    "LoadBalancerName" = "${var.wmselbname}"
  }

  actions_enabled           = "true"
  alarm_actions             = ["${aws_sns_topic.cwevents.arn}"]
  ok_actions                = []
  insufficient_data_actions = []
}

resource "aws_cloudwatch_metric_alarm" "metric-elb3" {
  alarm_name          = "metric-elb3"
  alarm_description   = "alarm attached to the ELB"
  metric_name         = "HTTPCode_Backend_4XX"
  comparison_operator = "GreaterThanThreshold"
  threshold           = "10"
  statistic           = "Sum"
  evaluation_periods  = "1"
  period              = "300"
  namespace           = "AWS/ELB"

  dimensions = {
    "LoadBalancerName" = "${var.wmselbname}"
  }

  actions_enabled           = "true"
  alarm_actions             = ["${aws_sns_topic.cwevents.arn}"]
  ok_actions                = []
  insufficient_data_actions = []
}

resource "aws_cloudwatch_metric_alarm" "metric-elb4" {
  alarm_name          = "metric-elb4"
  alarm_description   = "alarm attached to the ELB"
  metric_name         = "HTTPCode_ELB_4XX"
  comparison_operator = "GreaterThanThreshold"
  threshold           = "10"
  statistic           = "Sum"
  evaluation_periods  = "1"
  period              = "300"
  namespace           = "AWS/ELB"

  dimensions = {
    "LoadBalancerName" = "${var.wmselbname}"
  }

  actions_enabled           = "true"
  alarm_actions             = ["${aws_sns_topic.cwevents.arn}"]
  ok_actions                = []
  insufficient_data_actions = []
}

resource "aws_cloudwatch_metric_alarm" "metric-elb5" {
  alarm_name          = "metric-elb5"
  alarm_description   = "alarm attached to the ELB"
  metric_name         = "HTTPCode_ELB_5XX"
  comparison_operator = "GreaterThanThreshold"
  threshold           = "10"
  statistic           = "Sum"
  evaluation_periods  = "1"
  period              = "300"
  namespace           = "AWS/ELB"

  dimensions = {
    "LoadBalancerName" = "${var.wmselbname}"
  }

  actions_enabled           = "true"
  alarm_actions             = ["${aws_sns_topic.cwevents.arn}"]
  ok_actions                = []
  insufficient_data_actions = []
}




# ======================================================
# Archivo fusionado: modules\ebs\cloudebs.tf
# Piezas Terraform en carpeta: 11
# Tiene arquitectura (EC2/Docker/Serverless): True
# ======================================================



# ======================================================
# Archivo original: data.tf
# Carpeta: C:\Users\asus\cloned_repos\serverlessmike\terraform\modules\ebs
# ======================================================

data "aws_instance" "mine" {
  instance_id = "${var.instance_id}"
}



# ======================================================
# Archivo original: main.tf
# Carpeta: C:\Users\asus\cloned_repos\serverlessmike\terraform\modules\ebs
# ======================================================

# Add new volume(s) and attach to a named instance

resource "aws_ebs_volume" "new_volumes" {
  count             = "${length(var.drives)}"
  availability_zone = "${data.aws_instance.mine.availability_zone}"
  size              = "${element(var.volume_sizes,count.index)}"

  tags = {
    Name        = "${var.product}-${element(var.drives,count.index)}-drive"
    drive       = "${element(var.drives,count.index)}"
    environment = "${var.environment}"
    owner       = "${var.owner}"
    product     = "${var.product}"
    terraform   = "true"
    repo        = "cloudops-terraform"
  }
}

resource "aws_volume_attachment" "temp_att" {
  count       = "${length(var.drives)}"
  device_name = "${element(var.devices,count.index)}"
  volume_id   = "${element(aws_ebs_volume.new_volumes.*.id,count.index)}"
  instance_id = "${var.instance_id}"
}



# ======================================================
# Archivo original: variables.tf
# Carpeta: C:\Users\asus\cloned_repos\serverlessmike\terraform\modules\ebs
# ======================================================

variable "drives" {
  type        = "list"
  description = "List of drives names"
}

variable "devices" {
  type        = "list"
  description = "List of device names"
  default     = ["xvdf", "xvdg", "xvdh", "xvdi", "xvdj", "xdvk", "xvdl", "xvdm", "xvdn", "xvdo"]
}

variable "product" {
  description = "Name of the product"
}

variable "volume_sizes" {
  description = "List of volume sizes in GB"
  type        = "list"
}

variable "environment" {
  description = "environment in which to build (dev,staging,prod)"
}

variable "owner" {
  description = "Name of the owner of the volumes"
}

variable "instance_id" {
  description = "ID of the pre-existing instance to attach to"
}




# ======================================================
# Archivo fusionado: modules\profiles\cloudprofiles.tf
# Piezas Terraform en carpeta: 12
# Tiene arquitectura (EC2/Docker/Serverless): True
# ======================================================



# ======================================================
# Archivo original: main.tf
# Carpeta: C:\Users\asus\cloned_repos\serverlessmike\terraform\modules\profiles
# ======================================================

// S3 policies

resource "aws_iam_role_policy" "s3_policy" {
  name = "s3_policy"
  role = "${aws_iam_role.s3_role.id}"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "s3:Get*",
        "s3:List*"
      ],
      "Resource": "*"
    }
  ]
}

EOF
}

resource "aws_iam_role" "s3_role" {
  name = "s3_role"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

// CW policies

resource "aws_iam_role_policy" "cw_policy" {
  name = "cw_policy"
  role = "${aws_iam_role.cw_role.id}"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "autoscaling:Describe*",
        "cloudwatch:*",
        "logs:*",
        "sns:*"
      ],
      "Effect": "Allow",
      "Resource": "*"
    }
  ]
}
EOF
}

resource "aws_iam_role" "cw_role" {
  name = "cw_role"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

// SNAPSHOT ROLE

resource "aws_iam_role_policy" "snap1_policy" {
  name = "snap1_policy"
  role = "${aws_iam_role.snap_role1.id}"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "ec2:Describe*",
        "ec2:RebootInstances",
        "ec2:StopInstances",
        "ec2:TerminateInstances",
        "ec2:CreateSnapshot",
        "ec2:CreateImage",
        "ec2:CreateTags",
        "ec2:DeleteSnapshot",
        "ec2:DeregisterImage"
      ],
      "Resource": "*"
    }
  ]
}
EOF
}

resource "aws_iam_role" "snap_role1" {
  name = "snap_role1"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

########### TO KEEP ##########
#{
#  "Version": "2012-10-17",
#  "Statement": [
#    {
#      "Sid": "",
#      "Effect": "Allow",
#      "Principal": {
#        "Service": "automation.amazonaws.com"
#      },
#      "Action": "sts:AssumeRole"
#    }
#  ]
#}
#EOF
#}
##############################

// ATTACHING

resource "aws_iam_instance_profile" "s3_profile" {
  name = "s3_profile"
  role = "${aws_iam_role.s3_role.name}"
}

resource "aws_iam_instance_profile" "cw_profile" {
  name = "cw_profile"
  role = "${aws_iam_role.cw_role.name}"
}

resource "aws_iam_instance_profile" "snap1_profile" {
  name = "snap1_profile"
  role = "${aws_iam_role.snap_role1.name}"
}

// OUTPUT

output "ec2_profile_s3" {
  value = "${aws_iam_instance_profile.s3_profile.id}"
}

output "ec2_profile_cw" {
  value = "${aws_iam_instance_profile.cw_profile.id}"
}

output "ec2_profile_snap1" {
  value = "${aws_iam_instance_profile.snap1_profile.id}"
}




# ======================================================
# Archivo fusionado: modules\wqf\cloudwqf.tf
# Piezas Terraform en carpeta: 12
# Tiene arquitectura (EC2/Docker/Serverless): True
# ======================================================



# ======================================================
# Archivo original: data.tf
# Carpeta: C:\Users\asus\cloned_repos\serverlessmike\terraform\modules\wqf
# ======================================================

data "aws_availability_zones" "available" {
  state = "available"
}

data "aws_region" "current" {}

data "aws_subnet_ids" "privates" {
  vpc_id = "${var.vpc_id}"

  filter {
    name   = "availabilityZone"
    values = ["${data.aws_availability_zones.available.names[0]}"]
  }

  filter {
    name   = "tag:private"
    values = ["true"]
  }
}

data "aws_ami" "wqf" {
  most_recent = true

  filter {
    name   = "name"
    values = ["aws-dms-wqf*"]
  }
}



# ======================================================
# Archivo original: outputs.tf
# Carpeta: C:\Users\asus\cloned_repos\serverlessmike\terraform\modules\wqf
# ======================================================

output "instance_id" {
  value       = "${aws_instance.wqf_inst.id}"
  description = "The ID of the instance"
}

output "instance_ip" {
  value       = "${aws_instance.wqf_inst.private_ip}"
  description = "The private IP address assigned to the instance"
}



# ======================================================
# Archivo original: sg.tf
# Carpeta: C:\Users\asus\cloned_repos\serverlessmike\terraform\modules\wqf
# ======================================================

resource "aws_security_group" "allow_rdp_ping" {
  name        = "allow_rdp_ping"
  description = "Allow rdp inbound traffic"
  vpc_id      = "${var.vpc_id}"

  ingress {
    from_port   = 3389
    to_port     = 3389
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/8"]
  }

  ingress {
    from_port   = -1
    to_port     = -1
    protocol    = "icmp"
    cidr_blocks = ["10.0.0.0/8"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["10.0.0.0/8"]
  }
}



# ======================================================
# Archivo original: variables.tf
# Carpeta: C:\Users\asus\cloned_repos\serverlessmike\terraform\modules\wqf
# ======================================================

variable "environment" {
  description = "Environment in which to build"
  type        = "string"
}

variable "vpc_id" {
  description = "VPC in which to launch"
  type        = "string"
}



# ======================================================
# Archivo original: wqf.tf
# Carpeta: C:\Users\asus\cloned_repos\serverlessmike\terraform\modules\wqf
# ======================================================

resource "aws_instance" "wqf_inst" {
  ami               = "${data.aws_ami.wqf.id}"
  availability_zone = "${data.aws_availability_zones.available.names[0]}"
  instance_type     = "m5a.4xlarge"
  key_name          = "wqf"

  get_password_data      = "true"
  monitoring             = "true"
  vpc_security_group_ids = ["${aws_security_group.allow_rdp_ping.id}"]

  subnet_id                   = "${data.aws_subnet_ids.privates.ids[0]}"
  associate_public_ip_address = "false"

  tags {
    Name        = "wqf-${var.environment}"
    product     = "wqf"
    terraform   = true
    repo        = "cloudops-terraform"
    environment = "${var.environment}"
    owner       = "DBAs"
  }

  ebs_block_device {
    device_name           = "xvdb"
    snapshot_id           = ""
    volume_type           = "gp2"
    volume_size           = 100
    delete_on_termination = true
  }

  volume_tags {
    product     = "wqf"
    terraform   = true
    repo        = "cloudops-terraform"
    environment = "${var.environment}"
    owner       = "DBAs"
  }
}




# ======================================================
# Archivo fusionado: modules\ec2-iam-role\cloudec2-iam-role.tf
# Piezas Terraform en carpeta: 13
# Tiene arquitectura (EC2/Docker/Serverless): True
# ======================================================



# ======================================================
# Archivo original: main.tf
# Carpeta: C:\Users\asus\cloned_repos\serverlessmike\terraform\modules\ec2-iam-role
# ======================================================

resource "aws_iam_instance_profile" "this" {
  name = "${var.name}-${var.environment}"
  role = "${aws_iam_role.this.name}"
  path = "${var.path}"

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_iam_role" "this" {
  name                  = "${var.name}-${var.environment}"
  path                  = "${var.path}"
  description           = "${var.description}"
  force_detach_policies = "${var.force_detach_policies}"
  assume_role_policy    = "${data.aws_iam_policy_document.this.json}"

  lifecycle {
    create_before_destroy = true
  }
}

data "aws_iam_policy_document" "this" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }
  }
}

resource "aws_iam_role_policy" "this" {
  name   = "${var.name}"
  role   = "${aws_iam_role.this.name}"
  policy = "${var.policy}"

  lifecycle {
    create_before_destroy = true
  }
}



# ======================================================
# Archivo original: output.tf
# Carpeta: C:\Users\asus\cloned_repos\serverlessmike\terraform\modules\ec2-iam-role
# ======================================================

output "arn" {
  description = "The ARN of IAM Role"
  value       = "${aws_iam_role.this.arn}"
}

output "unique_id" {
  description = "The ARN Unique ID of IAM Role"
  value       = "${aws_iam_role.this.unique_id}"
}

output "profile_name" {
  description = "The Instance profile Name"
  value       = "${aws_iam_instance_profile.this.name}"
}



# ======================================================
# Archivo original: variables.tf
# Carpeta: C:\Users\asus\cloned_repos\serverlessmike\terraform\modules\ec2-iam-role
# ======================================================

variable "name" {
  description = "The name of the IAM Role."
}

variable "path" {
  description = "The path to the IAM Role."
  default     = "/"
}

variable "description" {
  description = "The description of the IAM Role."
  default     = "This IAM Role generated by Terraform."
}

variable "force_detach_policies" {
  description = "Forcibly detach the policy of the role."
  default     = false
}

variable "policy" {
  description = "Attach the policy to the IAM Role."
  type        = "string"
}

variable "environment" {}




# ======================================================
# Archivo fusionado: modules\lambdas\backup_ami\cloudbackup_ami.tf
# Piezas Terraform en carpeta: 19
# Tiene arquitectura (EC2/Docker/Serverless): True
# ======================================================



# ======================================================
# Archivo original: main.tf
# Carpeta: C:\Users\asus\cloned_repos\serverlessmike\terraform\modules\lambdas\backup_ami
# ======================================================

data "aws_caller_identity" "current" {}

data "archive_file" "lambda_snapshot_backup_zip" {
  type        = "zip"
  source_dir  = "${path.module}/source"
  output_path = "${path.module}/lambda_snapshot_backup.zip"
}

resource "aws_lambda_function" "backup_ami" {
  function_name    = "backup_ami"
  filename         = "${path.module}/lambda_snapshot_backup.zip"
  source_code_hash = "${data.archive_file.lambda_snapshot_backup_zip.output_base64sha256}"
  description      = "Styleman Web and CID AMI daily backup"
  handler          = "lambda-snapshot-backup.lambda_handler"
  memory_size      = "256"
  timeout          = "60"
  role             = "${var.lambda_role}"
  runtime          = "python3.7"

  environment = {
    variables = {
      REGION                = "${var.region}"
      TOPIC_ARN             = "${var.sns_topic_arn}"
      LOG_LEVEL             = "INFO"
      RETENTION_DAYS        = "${var.retention_days}"
      WS_BACKUP_TAG_KEY1    = "${var.ws_backup_tag1_key}"
      WS_BACKUP_TAG_VALUE1  = "${var.ws_backup_tag1_value}"
      WS_BACKUP_TAG_KEY2    = "${var.ws_backup_tag2_key}"
      WS_BACKUP_TAG_VALUE2  = "${var.ws_backup_tag2_value}"
      CID_BACKUP_TAG_KEY1   = "${var.cid_backup_tag1_key}"
      CID_BACKUP_TAG_VALUE1 = "${var.cid_backup_tag1_value}"
      CID_BACKUP_TAG_KEY2   = "${var.cid_backup_tag2_key}"
      CID_BACKUP_TAG_VALUE2 = "${var.cid_backup_tag2_value}"
    }
  }
}

resource "aws_lambda_permission" "with_sns" {
  statement_id  = "AllowExecutionFromSNS"
  action        = "lambda:InvokeFunction"
  function_name = "${aws_lambda_function.backup_ami.function_name}"
  principal     = "sns.amazonaws.com"
  source_arn    = "${var.sns_topic_arn}"
}

resource "aws_cloudwatch_event_rule" "backup_ami_schedule" {
  name                = "backup_ami_schedule"
  description         = "Periodically invokes backup_ami"
  schedule_expression = "cron(0 2 * * ? *)"
  is_enabled          = true
  depends_on          = ["aws_lambda_function.backup_ami"]
}

resource "aws_cloudwatch_event_target" "backup_ami" {
  rule = "${aws_cloudwatch_event_rule.backup_ami_schedule.name}"
  arn  = "${aws_lambda_function.backup_ami.arn}"
}

resource "aws_lambda_permission" "allow_cloudwatch_to_call_backup_ami" {
  statement_id  = "AllowExecutionFromCloudWatch"
  action        = "lambda:InvokeFunction"
  function_name = "${aws_lambda_function.backup_ami.function_name}"
  principal     = "events.amazonaws.com"
  source_arn    = "${aws_cloudwatch_event_rule.backup_ami_schedule.arn}"
}



# ======================================================
# Archivo original: variables.tf
# Carpeta: C:\Users\asus\cloned_repos\serverlessmike\terraform\modules\lambdas\backup_ami
# ======================================================

variable "region" {}

variable "lambda_role" {}

variable "sns_topic_arn" {}

variable "retention_days" {}

variable "ws_backup_tag1_key" {}

variable "ws_backup_tag2_key" {}

variable "ws_backup_tag1_value" {}

variable "ws_backup_tag2_value" {}

variable "cid_backup_tag1_key" {}

variable "cid_backup_tag2_key" {}

variable "cid_backup_tag1_value" {}

variable "cid_backup_tag2_value" {}




# ======================================================
# Archivo fusionado: modules\mobileiron\connector\cloudconnector.tf
# Piezas Terraform en carpeta: 21
# Tiene arquitectura (EC2/Docker/Serverless): True
# ======================================================



# ======================================================
# Archivo original: asg.tf
# Carpeta: C:\Users\asus\cloned_repos\serverlessmike\terraform\modules\mobileiron\connector
# ======================================================

resource "aws_launch_configuration" "connector" {
  image_id        = "${var.connector_ami}"
  instance_type   = "t3.large"
  key_name        = "${var.ssh_key_name}"
  security_groups = ["${var.security_groups}"]

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_autoscaling_group" "connector" {
  name                 = "${var.product_name}-asg"
  vpc_zone_identifier  = ["${var.private_subnets}"]
  min_size             = 1
  max_size             = 1
  desired_capacity     = 1
  health_check_type    = "EC2"
  launch_configuration = "${aws_launch_configuration.connector.name}"

  tags = ["${concat(
      list(map("key", "Name", "value", "${var.project_name_tag}-${var.product_name}", "propagate_at_launch", true)),
      var.tags,
      local.tags_asg_format
   )}"]
}



# ======================================================
# Archivo original: outputs.tf
# Carpeta: C:\Users\asus\cloned_repos\serverlessmike\terraform\modules\mobileiron\connector
# ======================================================

output "connector_instance_dns" {
  value       = "${aws_route53_record.connector.fqdn}"
  description = "Connector DNS record"
}



# ======================================================
# Archivo original: route_53.tf
# Carpeta: C:\Users\asus\cloned_repos\serverlessmike\terraform\modules\mobileiron\connector
# ======================================================

data "aws_instances" "connector_ip" {
  instance_tags {
    Name = "${var.project_name_tag}-${var.product_name}"
  }

  instance_state_names = ["running", "pending"]
  depends_on           = ["aws_autoscaling_group.connector"]
}

resource "aws_route53_record" "connector" {
  zone_id = "${var.r53_zone_id}"
  name    = "${var.product_name}"
  type    = "A"
  ttl     = "60"
  records = ["${data.aws_instances.connector_ip.private_ips}"]
}



# ======================================================
# Archivo original: variables.tf
# Carpeta: C:\Users\asus\cloned_repos\serverlessmike\terraform\modules\mobileiron\connector
# ======================================================

// Global Variables
variable "environment" {
  description = "Envrionemnt to be deployed"
}

variable "vpc_id" {
  description = "VPC ID"
}

variable "project_name" {
  description = "Name of the project"
  default     = "Device Modernisation"
}

variable "project_name_tag" {
  description = "Tag friendly project name"
  default     = "device-modernisation"
}

variable "product_name" {
  description = "Product name"
  default     = "connector"
}

variable "ssh_key_name" {
  description = "SSH Keypair name"
}

variable "private_subnets" {
  description = "private subnets for ECS cluster nodes"
  type        = "list"
}

variable "public_subnets" {
  description = "public subnets for ECS cluster nodes"
  type        = "list"
}

// asg.tf variables
variable "ami_account_id" {
  description = "Mobile Iron AWS Account ID that owns the Sentry AMI"
  default     = "795357751823"
}

variable "tags_as_map" {
  description = "A map of tags and values in the same format as other resources accept. This will be converted into the non-standard format that the aws_autoscaling_group requires."
  type        = "map"
  default     = {}
}

locals {
  tags_asg_format = ["${null_resource.tags_as_list_of_maps.*.triggers}"]
}

resource "null_resource" "tags_as_list_of_maps" {
  count = "${length(keys(var.tags_as_map))}"

  triggers = "${map(
    "key", "${element(keys(var.tags_as_map), count.index)}",
    "value", "${element(values(var.tags_as_map), count.index)}",
    "propagate_at_launch", "true"
  )}"
}

variable "tags" {
  description = "A list of tag blocks. Each element should have keys named key, value, and propagate_at_launch."
  default     = []
}

variable "security_groups" {
  description = "List of security group IDs to be attached to the launch configuration"
  type        = "list"
}

variable "connector_ami" {
  description = "Connector AMI shared by MobileIron"
  default     = "ami-c8d9d222"
}

// route_53.tf variables

variable "r53_zone_id" {
  description = "Route53 zone for LB record. Must end as with ."
}




# ======================================================
# Archivo fusionado: modules\vpn\cloudvpn.tf
# Piezas Terraform en carpeta: 21
# Tiene arquitectura (EC2/Docker/Serverless): False
# ======================================================



# ======================================================
# Archivo original: main.tf
# Carpeta: C:\Users\asus\cloned_repos\serverlessmike\terraform\modules\vpn
# ======================================================

module "vpn_gateway" {
  source = "git::https://github.com/terraform-aws-modules/terraform-aws-vpn-gateway.git?ref=5c74b0bf908e152460118253af6b901ade66f340"

  vpc_id              = "${var.vpc_id}"
  vpn_gateway_id      = "${var.vpn_vgw_id}"
  customer_gateway_id = "${aws_customer_gateway.main.id}"

  vpc_subnet_route_table_ids = ["${var.private_route_table_ids}"]

  tags = {
    name         = "${var.environment}-${var.project_name}-vpn"
    repo         = "cloudops-terraform"
    environment  = "${var.environment}"
    terraform    = "true"
    tf_module    = "vpn"
    project_name = "${var.project_name}"
  }
}

resource "aws_customer_gateway" "main" {
  bgp_asn    = 65000
  ip_address = "${var.cgw_ip}"
  type       = "ipsec.1"

  tags = {
    name         = "${var.environment}-${var.project_name}-cgw"
    repo         = "cloudops-terraform"
    environment  = "${var.environment}"
    terraform    = "true"
    tf_module    = "vpn"
    project_name = "${var.project_name}"
  }
}

//resource "aws_vpn_gateway" "vpn_gateway" {
//  vpc_id = "${var.vpc_id}"
//
//  tags = {
//    name         = "${var.environment}-${var.project_name}-vpn_gateway"
//    repo         = "cloudops-terraform"
//    environment  = "${var.environment}"
//    terraform    = "true"
//    tf_module    = "vpn"
//    project_name = "${var.project_name}"
//  }
//}
//
//resource "aws_route" "vpn_route" {
//  count = "${length(var.private_route_table_ids)}"
//
//  route_table_id         = "${element(var.private_route_table_ids, count.index)}"
//  gateway_id             = "${aws_vpn_gateway.vpn_gateway.id}"
//  destination_cidr_block = "10.0.0.0/8"
//}




# ======================================================
# Archivo original: outputs.tf
# Carpeta: C:\Users\asus\cloned_repos\serverlessmike\terraform\modules\vpn
# ======================================================

output "vpn_connection_id" {
  description = "A list with the VPN Connection ID if `create_vpn_connection = true`, or empty otherwise"
  value       = "${module.vpn_gateway.vpn_connection_id}"
}

output "vpn_connection_tunnel1_address" {
  description = "A list with the the public IP address of the first VPN tunnel if `create_vpn_connection = true`, or empty otherwise"
  value       = "${module.vpn_gateway.vpn_connection_tunnel1_address}"
}

output "vpn_connection_tunnel1_cgw_inside_address" {
  description = "A list with the the RFC 6890 link-local address of the first VPN tunnel (Customer Gateway Side) if `create_vpn_connection = true`, or empty otherwise"
  value       = "${module.vpn_gateway.vpn_connection_tunnel1_vgw_inside_address}"
}

output "vpn_connection_tunnel1_vgw_inside_address" {
  description = "A list with the the RFC 6890 link-local address of the first VPN tunnel (VPN Gateway Side) if `create_vpn_connection = true`, or empty otherwise"
  value       = "${module.vpn_gateway.vpn_connection_tunnel1_vgw_inside_address}"
}

output "vpn_connection_tunnel2_address" {
  description = "A list with the the public IP address of the second VPN tunnel if `create_vpn_connection = true`, or empty otherwise"
  value       = "${module.vpn_gateway.vpn_connection_tunnel2_address}"
}

output "vpn_connection_tunnel2_cgw_inside_address" {
  description = "A list with the the RFC 6890 link-local address of the second VPN tunnel (Customer Gateway Side) if `create_vpn_connection = true`, or empty otherwise"
  value       = "${module.vpn_gateway.vpn_connection_tunnel2_cgw_inside_address}"
}

output "vpn_connection_tunnel2_vgw_inside_address" {
  description = "A list with the the RFC 6890 link-local address of the second VPN tunnel (VPN Gateway Side) if `create_vpn_connection = true`, or empty otherwise"
  value       = "${module.vpn_gateway.vpn_connection_tunnel2_vgw_inside_address}"
}

output "customer_gate_id" {
  value = "${aws_customer_gateway.main.id}"
}

output "customer_gate_bgp_asn" {
  value = "${aws_customer_gateway.main.bgp_asn}"
}

output "customer_gate_ip_address" {
  value = "${aws_customer_gateway.main.ip_address}"
}

output "customer_gate_ip_type" {
  value = "${aws_customer_gateway.main.type}"
}



# ======================================================
# Archivo original: variables.tf
# Carpeta: C:\Users\asus\cloned_repos\serverlessmike\terraform\modules\vpn
# ======================================================

// Global Variables
variable "environment" {
  description = "Envrionemnt to be deployed"
}

variable "project_name" {
  description = "Name of the project"
  default     = "cloudops"
}

// Variables for main.tf
variable "cgw_ip" {
  description = "Customer Gateway IP Address"
}

variable "vpc_id" {
  description = "VPC ID"
}

variable "private_route_table_ids" {
  type = "list"
}

variable "vpn_vgw_id" {
  description = "VPN Gateway ID"
}




# ======================================================
# Archivo fusionado: modules\styleman\cloudstyleman.tf
# Piezas Terraform en carpeta: 24
# Tiene arquitectura (EC2/Docker/Serverless): True
# ======================================================



# ======================================================
# Archivo original: main.tf
# Carpeta: C:\Users\asus\cloned_repos\serverlessmike\terraform\modules\styleman
# ======================================================

// CW Events
module "cwevents" {
  source = "../cwevents"

  wmselbname = "${var.wms_elb_name}"
}

// Instance Profiles
module "profiles" {
  source = "../profiles"
}

resource "aws_kms_key" "styleman" {}

resource "aws_kms_alias" "styleman" {
  name          = "alias/styleman"
  target_key_id = "${aws_kms_key.styleman.key_id}"
}



# ======================================================
# Archivo original: monitoring.tf
# Carpeta: C:\Users\asus\cloned_repos\serverlessmike\terraform\modules\styleman
# ======================================================

resource "aws_sns_topic" "minor_alerts" {
  name = "${var.project_name}-minor-alerts"
}

resource "aws_sns_topic" "major_alerts" {
  name = "${var.project_name}-major-alerts"
}

// allow both lambdas to listen on both
resource "aws_lambda_permission" "allow_sns_minor_to_call_slack" {
  statement_id  = "AllowExecutionFromSNSMinorToSlackAlerts"
  action        = "lambda:InvokeFunction"
  function_name = "${module.slack_alerts.function_name}"
  principal     = "sns.amazonaws.com"
  source_arn    = "${aws_sns_topic.minor_alerts.arn}"
}

resource "aws_lambda_permission" "allow_sns_major_to_call_slack" {
  statement_id  = "AllowExecutionFromSNSMajorToSlackAlerts"
  action        = "lambda:InvokeFunction"
  function_name = "${module.slack_alerts.function_name}"
  principal     = "sns.amazonaws.com"
  source_arn    = "${aws_sns_topic.major_alerts.arn}"
}

resource "aws_sns_topic_subscription" "minor_slack" {
  topic_arn = "${aws_sns_topic.minor_alerts.arn}"
  protocol  = "lambda"
  endpoint  = "${module.slack_alerts.lambda_arn}"
}

resource "aws_sns_topic_subscription" "major_slack" {
  topic_arn = "${aws_sns_topic.major_alerts.arn}"
  protocol  = "lambda"
  endpoint  = "${module.slack_alerts.lambda_arn}"
}

// lambda to send slack alerts
module "slack_alerts" {
  source = "git::ssh://git@github.com/river-island/shared-lambdas.git//terraform/modules/slack_notifications?ref=73c0445e9e67b202982bcdd8745a7c64a9570b08"

  project_name    = "${var.project_name}"
  environment     = "${var.environment}"
  vpc_id          = "${var.vpc_id}"
  private_subnets = "${var.private_subnets}"

  sns_to_slack_channel_mapping = {
    "${var.project_name}-minor-alerts" = "#mon-styleman-${var.environment}"
    "${var.project_name}-major-alerts" = "#mon-styleman-${var.environment}"
  }

  kms_key_alias_arn           = "${aws_kms_key.styleman.arn}"
  encrypted_slack_webhook_url = "${var.sns_encrypted_slack_webhook_url}"

  slack_lambda_version = "0.0.90"
}

resource "aws_cloudwatch_metric_alarm" "vpn_in" {
  alarm_name          = "vpn-data-in"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "1"
  metric_name         = "TunnelDataIn"
  namespace           = "AWS/VPN"
  period              = "300"
  statistic           = "Maximum"
  threshold           = "256.0"
  alarm_description   = "VPN is processing data in. Potential Direct Connect failover."
  alarm_actions       = ["${aws_sns_topic.major_alerts.arn}"]

  dimensions {
    VpnId = "${var.vpn_connection_id}"
  }
}

resource "aws_cloudwatch_metric_alarm" "vpn_out" {
  alarm_name          = "vpn-data-out"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "1"
  metric_name         = "TunnelDataOut"
  namespace           = "AWS/VPN"
  period              = "300"
  statistic           = "Maximum"
  threshold           = "256.0"
  alarm_description   = "VPN is processing data out. Potential Direct Connect failover."
  alarm_actions       = ["${aws_sns_topic.major_alerts.arn}"]

  dimensions {
    VpnId = "${var.vpn_connection_id}"
  }
}

resource "aws_cloudwatch_metric_alarm" "vpn_state" {
  alarm_name          = "vpn-offline"
  comparison_operator = "LessThanThreshold"
  evaluation_periods  = "1"
  metric_name         = "TunnelState"
  namespace           = "AWS/VPN"
  period              = "300"
  statistic           = "Maximum"
  threshold           = "1"
  alarm_description   = "VPN is offline."
  alarm_actions       = ["${aws_sns_topic.major_alerts.arn}"]

  dimensions {
    VpnId = "${var.vpn_connection_id}"
  }
}



# ======================================================
# Archivo original: outputs.tf
# Carpeta: C:\Users\asus\cloned_repos\serverlessmike\terraform\modules\styleman
# ======================================================

output "aws_kms_key_styleman" {
  value = "${aws_kms_key.styleman.arn}"
}

output "minor_alerts_sns" {
  value = "${aws_sns_topic.minor_alerts.arn}"
}



# ======================================================
# Archivo original: variables.tf
# Carpeta: C:\Users\asus\cloned_repos\serverlessmike\terraform\modules\styleman
# ======================================================

variable "project_name" {}

variable "environment" {}

variable "vpc_id" {}

variable "private_subnets" {
  type = "list"
}

variable "sns_encrypted_slack_webhook_url" {}

variable "vpn_connection_id" {}

variable "policy" {
  description = "(Required) The policy document. This is a JSON formatted string"
}

variable "wms_elb_name" {}




# ======================================================
# Archivo fusionado: modules\management\cloudmanagement.tf
# Piezas Terraform en carpeta: 25
# Tiene arquitectura (EC2/Docker/Serverless): True
# ======================================================



# ======================================================
# Archivo original: concourse4.tf
# Carpeta: C:\Users\asus\cloned_repos\serverlessmike\terraform\modules\management
# ======================================================

data "aws_region" "current" {}

module "concourse4" {
  source                       = "git::ssh://git@github.com/river-island/core-infrastructure-terraform.git//modules/concourse4?ref=0b19d6800d2201be6d1ddb36c4d360eef98f28e8"
  project_name                 = "${var.project_name}"
  project_domain               = "io"
  environment                  = "${var.environment}"
  vpc_id                       = "${module.vpc.vpc_id}"
  public_subnets               = "${module.vpc.public_subnets}"
  private_subnets              = "${module.vpc.private_subnets}"
  vpc_subnet                   = "${var.vpc_cidr}"
  ec2_key_pair                 = "${aws_key_pair.default.key_name}"
  postgres_multi_az            = "false"
  postgres_skip_final_snapshot = "false"
  kms_key_arn                  = "${aws_kms_key.cloudops_concourse_ci.arn}"
  encrypted_keys               = "${var.encrypted_keys}"

  // allow the instance to assume the cd roles in project accounts
  additional_ecs_instance_role_policy = "${file("${path.module}/iam_policies/ecs_instance.json")}"

  // encrypted with kms
  config_basic_auth_encrypted_password = "AQICAHhrVtu+qJzl/lryOxp/tlDSpRVOTPrIA1sX4oLI3mBmRwE0kRdKrtybVMLQXd+xrbkjAAAAfjB8BgkqhkiG9w0BBwagbzBtAgEAMGgGCSqGSIb3DQEHATAeBglghkgBZQMEAS4wEQQMm3FNY0+VpxktIYykAgEQgDuGKuzNFsh4CdwXEJFCuiOVcmBpYtkgmZHR9SVajSHbs0yb40AtkxEydRqTBBWm6CzxvJtSKkDMCeAT+Q=="
  config_postgres_encrypted_password   = "AQICAHhrVtu+qJzl/lryOxp/tlDSpRVOTPrIA1sX4oLI3mBmRwFzWgSOQFo3/D0H7nY6jDrhAAAAfjB8BgkqhkiG9w0BBwagbzBtAgEAMGgGCSqGSIb3DQEHATAeBglghkgBZQMEAS4wEQQMB6rTm5vJCrx+p/ZvAgEQgDu+fhuIp2eOt/oqL5EfIZt1hHU7QXnZYFlBuIGSN2PqMLLNhm/hfBeWZN8MDdBs+6t8wEb77U8Yo1HHPA=="
  config_github_auth_client_secret     = "AQICAHhrVtu+qJzl/lryOxp/tlDSpRVOTPrIA1sX4oLI3mBmRwHPP0PjSeUvGMYqu1FK5b7zAAAAhzCBhAYJKoZIhvcNAQcGoHcwdQIBADBwBgkqhkiG9w0BBwEwHgYJYIZIAWUDBAEuMBEEDHD2UlFjOSAfmI+UPQIBEIBDnyLXY2311Hw3SOnKzOvApYZDwLpJXVG5aCUIVQWh/r/OcunYrLRtE+AVkf2B/jL25mbAOn5/Mw1tKRJFw861dDOL2g=="
  config_github_auth_client_id         = "013f3c2c9d75d52aa3c4"
  config_external_url                  = "https://concourse4.${var.environment}.${var.project_name}.ri-tech.io"

  config_github_auth_team = "River-Island:cloudops-write"

  # the encrypted values are encrypted with kms.
  web_additional_env_vars = <<EOF
{
  "name": "AWS_REGION",
  "value": "${data.aws_region.current.name}"
},
{
  "name": "CONCOURSE_AWS_SECRETSMANAGER_PIPELINE_SECRET_TEMPLATE",
  "value": "/concourse/{{.Team}}/{{.Pipeline}}/{{.Secret}}"
},
{
  "name": "CONCOURSE_AWS_SECRETSMANAGER_TEAM_SECRET_TEMPLATE",
  "value": "/concourse/{{.Team}}/{{.Secret}}"
}
EOF
}



# ======================================================
# Archivo original: ecr.tf
# Carpeta: C:\Users\asus\cloned_repos\serverlessmike\terraform\modules\management
# ======================================================

module "ecr" {
  source = "git::ssh://git@github.com/river-island/core-infrastructure-terraform.git///modules/ecr_repositories?ref=145556b7c9bd08c73c27b6d55e4b127b1840b43f"

  repository_names    = ["cloudops-ci", "cloudops-zabbix"]
  allowed_account_ids = ["092941714243", "224889443659", "795357751823", "558469419837"]
}



# ======================================================
# Archivo original: keys.tf
# Carpeta: C:\Users\asus\cloned_repos\serverlessmike\terraform\modules\management
# ======================================================

resource "aws_key_pair" "default" {
  key_name   = "${var.project_name}-${var.environment}-default"
  public_key = "${file("${path.root}/${var.aws_ssh_key_file}.pub")}"
}

resource "aws_kms_key" "cloudops_concourse_ci" {}

resource "aws_kms_alias" "cloudops_concourse_ci" {
  name          = "alias/cloudops_concourse_ci"
  target_key_id = "${aws_kms_key.cloudops_concourse_ci.key_id}"
}

output "aws_kms_key_cloudops_concourse_ci" {
  value = "${aws_kms_key.cloudops_concourse_ci.arn}"
}



# ======================================================
# Archivo original: main.tf
# Carpeta: C:\Users\asus\cloned_repos\serverlessmike\terraform\modules\management
# ======================================================

// Create A VPC with multi AZ private and public subnets
module "vpc" {
  // Use the comminity VPC module with a pinned revision number
  source          = "git::https://github.com/terraform-aws-modules/terraform-aws-vpc.git?ref=f7a874cb2c74815d301608c3fe6eadf02cc57be5"
  name            = "${var.project_name}-${var.module_instance_id}"
  cidr            = "${var.vpc_cidr}"
  private_subnets = "${var.private_subnets}"
  public_subnets  = "${var.public_subnets}"
  azs             = ["eu-west-1a", "eu-west-1b", "eu-west-1c"]

  // enable nat gateway
  enable_nat_gateway = "true"

  // This sets the search domain in DHCP options
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags {
    "Name"         = "${var.environment}-${var.project_name}-${var.module_instance_id}"
    "terraform"    = "true"
    "environment"  = "${var.environment}"
    "project_name" = "${var.project_name}"
  }
}



# ======================================================
# Archivo original: route_53.tf
# Carpeta: C:\Users\asus\cloned_repos\serverlessmike\terraform\modules\management
# ======================================================

resource "aws_route53_zone" "environment" {
  #Environment subdomain truncated to keep it under the DNS character limit
  name = "${var.environment}.${var.project_name}.ri-tech.io"

  tags {
    "terraform"    = "true"
    "environment"  = "${var.environment}"
    "project_name" = "${var.project_name}"
  }
}

output "route53_name_servers" {
  value = "${aws_route53_zone.environment.name_servers}"
}



# ======================================================
# Archivo original: ssl.tf
# Carpeta: C:\Users\asus\cloned_repos\serverlessmike\terraform\modules\management
# ======================================================

# module "ssl_cloudops" {
#   source = "./letsencrypt_ssl"
#   domain_names = [""]
#   email_address = "ben.prudence@river-island.com"
# }




# ======================================================
# Archivo original: variables.tf
# Carpeta: C:\Users\asus\cloned_repos\serverlessmike\terraform\modules\management
# ======================================================

variable "project_name" {
  type        = "string"
  description = "name of our project"
  default     = "cloudops"
}

variable "environment" {
  type        = "string"
  description = "environment"
  default     = "management"
}

variable "module_instance_id" {
  type        = "string"
  description = "Use this to create unique resource names"
  default     = "0"
}

variable "private_subnets" {
  type        = "list"
  description = "private subnet cidrs"
  default     = ["10.202.168.0/24", "10.202.169.0/24", "10.202.170.0/24"]
}

variable "public_subnets" {
  type        = "list"
  description = "public subnet cidrs"
  default     = ["10.202.171.0/24", "10.202.172.0/24", "10.202.173.0/24"]
}

variable "vpc_cidr" {
  type        = "string"
  description = "describe your variable"
  default     = "10.202.168.0/21"
}

variable "aws_ssh_key_file" {
  type        = "string"
  description = "name of the ssh key file stored in the aws account folder"
  default     = "default"
}

// Transit Peering
# variable "dev_transit_vpc_account_id" {
#   type        = "string"
#   description = "the id of the account that the transit vpc sits in"
#   default     = "556748783639"
# }

# variable "dev_transit_vpc_id" {
#   type        = "string"
#   description = "the id of the transit vpc that has the direct connect connection attached"
#   default     = "vpc-2ee35b4a"
# }

# variable "dev_transit_vpc_subnet_cidr" {
#   type        = "string"
#   description = "CIDR of vpc subnet to route to"
#   default     = "10.201.0.0/16"
# }

// vpc_peering - prod transit
variable "prod_transit_vpc_account_id" {
  type        = "string"
  description = "the id of the account that the transit vpc sits in"
  default     = "376076567968"
}

variable "prod_transit_vpc_id" {
  type        = "string"
  description = "the id of the transit vpc that has the direct connect connection attached"
  default     = "vpc-2efefe4a"
}

variable "prod_transit_vpc_subnet_cidr" {
  type        = "string"
  description = "CIDR of vpc subnet to route to"
  default     = "10.202.0.0/22"
}



# ======================================================
# Archivo original: variables_concourse.tf
# Carpeta: C:\Users\asus\cloned_repos\serverlessmike\terraform\modules\management
# ======================================================

variable "web_additional_env_vars" {
  type        = "string"
  description = "environment variable json statements for the web ecs task"
  default     = ""
}

variable "encrypted_keys" {
  type        = "map"
  description = "concourse ci encrypted keys"

  default = {
    // kms encrypted authorized_worker_keys
    authorized_worker_keys = "AQICAHhrVtu+qJzl/lryOxp/tlDSpRVOTPrIA1sX4oLI3mBmRwEtfftGj+SuC/L9l1rprfYBAAACBTCCAgEGCSqGSIb3DQEHBqCCAfIwggHuAgEAMIIB5wYJKoZIhvcNAQcBMB4GCWCGSAFlAwQBLjARBAw4jerb7bLzdP+ENygCARCAggG4GcACK9uQqkPO+eZmooZM18/gN0UcVFU8amcWkB+I/PbaJIg8VcCCeD6IgHJuwiPgUFiOnwCN0SpEsSdC1iSmt67+OdiQXPCaKHc1tIty1t96+W0twdveVi8+40RA+4eMUAOHv7UYnBiRpTW/vbXDOEkoDkqv+/XiMz4hMxBEFK7nMjNtY9UajhVHC3ltmpU3uo+eAJL8VOg3I0LJV/9eTj7wydiX3FUGEYrax9sFjYnckr3zmIhmMG0ms4bPePpxqXqnr5SMP/oPxxWj9A08c6WkOVbeHEdW/bPAy6q48g21IBhMBZnkOD4OgJ5+6nUWR/D6v2AS2rqhEiucD8nJWaRKNBDUhAtZbsv140s+WeoN1UzjBJAKMMZ4ozTvPbXszvGd0pSbagDGls+cP3ZJ/kh+Uhwp34/kezfSqgmp+dZeIcLXbwShdfuBqFhm8lMZk2bfPBmlhSqgD38fb38BR63ow6HKfrAEzKGWDoTQRA/QfT2oAmJbymSb2nyQCpjJ7+sZvm37QMw86WXu/2FCrMihjQWTaEABQD4jYCtMHzUm00pAcFGeMYZ9pLy3FINyWn9Jzc5Egwc="

    // kms encrypted session_signing_key
    session_signing_key = "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"

    // kms encrypted session_signing_key.pub
    session_signing_key_pub = "AQICAHhrVtu+qJzl/lryOxp/tlDSpRVOTPrIA1sX4oLI3mBmRwEGgJoAZ76vzoCtTcx+mMNIAAACBTCCAgEGCSqGSIb3DQEHBqCCAfIwggHuAgEAMIIB5wYJKoZIhvcNAQcBMB4GCWCGSAFlAwQBLjARBAxRbAXn88jeHHydVmsCARCAggG4qmAhE2vUbW3l1O2/NlahrNgT8lKHEpzjwAkVbv6D5hysJ26WT8BsF4bdyy2v9HRYsBqiRAlqAETKLT19hAZ4KbYXKXWnHLh+j1JhO2KEBbwQvZ9rdO1uAYvQYZJGEu2mBvm4amLQ+esp4FSY5m9pc17vHZVw7VKBr2RfhYrA4+0SUgS2c5ZJYiDSquUstSWCTXHQsRwQbv2Af7bfdXZRjdyG3DaueW+CuqC5CkVkWKc40spNkh2Tm+WxsDB2QHGxip1eeMGR3y+BdPUb8jYIB9rJNHOkR4kNsfvjDrfgQOKdcOOLjurpoMRsvDCBUWasVKqnz50Pe/k3v1HWfGFvNH8bHwqmnVQ8gApAU5NN44BVv9TSbAGvkAW8ypta4nkUYRGEh1Tf2gu8xxJhNMC0TaVMYSahTMwpzifIQ7y71phFuKb0ii/Y0jeL7sexmNIL1cIVZUvfIsJ2fMTLm+6K4z3Zig3KTgudn/grhStf79LbEd+j3kik4VdzZt/q7oXU9HvAkPEYccHpv+2VbyS4NUvH3dXpiX/BEnTG+T0Jnl8OisI8GaHj9wAEU08gd5M2Jklkl2zpnfE="

    // kms encrypted tsa_host_key
    tsa_host_key = "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"

    // kms encrypted tsa_host_key.pub
    tsa_host_key_pub = "AQICAHhrVtu+qJzl/lryOxp/tlDSpRVOTPrIA1sX4oLI3mBmRwGLsU/0agOkt/J1My5kyvz4AAACBTCCAgEGCSqGSIb3DQEHBqCCAfIwggHuAgEAMIIB5wYJKoZIhvcNAQcBMB4GCWCGSAFlAwQBLjARBAySQ+eX51JgQ6VpPA4CARCAggG4/3YFbGLAnun1rgxuCg01lXCzUtLqbGLTRoxJHRiUg053Rnrd6Ys6L7+GBVFHwzQOF9Zdg/Hu37g6eTDQMkHX9zomOz2B5IsW6iVY6Ag0vdygykbTurUMZbpj9VBN3S0XmTBX8sgnpY9r17q3dCEKwiC5bi8aKhUQrLyO+g28iz4vLmMntLCDbzt0bZ0by8va6Az/RNUTxn0EIuIsAW6X26xve91shoOnKDp2tnCI5gpJYFcDhLZz/PmANg97uZepxhSfnMtBkO8ouL6UdpU+bAzbVg9XC+SYyp4ZHUredSmoceOAUaz9b7dblfk4ZCsaXsB+qFoYUa7CL2WhKjflo/A8S262RZRrEVvKGWQ3CT04vv1HaL8WarsGXOq8Vzs93Zrph5Dglvd9GJntZYnh2xBdZDwev1LwUZy4+8o1jm2e3v7smtk+HTnZNO1XqGjIpOlKdiex7k+qpwOav9reTxJH7doCEt6P2FZtD2p2P3mtswhgm0Qy1Sw1TQQhd7c+YioolIcK2YETegIqp2GbABcn1C3KeVYi4hyV8IhzxoqgZEE4VABQMsrXTQf18I9jh3lbbRHhmYo="

    // kms encrypted worker_key
    worker_key = "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"

    // kms encrypted worker_key.pub
    worker_key_pub = "AQICAHhrVtu+qJzl/lryOxp/tlDSpRVOTPrIA1sX4oLI3mBmRwFZ9TQd/Jr+mJmRgDZmht+YAAACBTCCAgEGCSqGSIb3DQEHBqCCAfIwggHuAgEAMIIB5wYJKoZIhvcNAQcBMB4GCWCGSAFlAwQBLjARBAxC3FT/ZOtPKZa9ehkCARCAggG4bN+elGPWiQgDoNNKXRsN9sPUM2ZFcD6kFBcx1Bfue7TBiOJi7Nu7JNv9CgK1YXaIVoq07QJ2yE+wQnrkmuLEDJ+EuCTPYqPyVQNiTAwLMFzU+HG894z7abDhG6Ty814HTiSMTkjtmwJ6YkR2+s3fKqoP1vt9sKqUKypVLKdUu9j90EL0EiyebklMHKZ1LFtaQxD2+ZffJmVwnPx7umxfyzApLwT/VG5rKElhLiYtwYp3+WTPD6gzORSE/ezpBn8AoG8P8D9CucZT0PfZOXY6MdOrtXwHvLsVw61vlAmpTg0wyCa+KEsxqQxyIjyfmTl02e5rFe98KQUPP7BIun8lc/3QLr3E4M0NMRWwfHpdU+/mvBrsZyKw8bk5o9FT+7OtscUcuKX9igfawcNb/vEfChrJ1FI+aDlDItaqHYmgru1ZJD6i/KY34hJ3rJ5716+K5yP75Ve7ZqW6TU20vftctkHR6VBfuc8l724x6606EAOTlRYKz83e25oMGTq97L5NbG9gqNmylPV7k/8pNCq7/GLahkblqJ1b/eOXOLAfcTWbjGw/j8nK2OXb+BC1ItS191BOY+YwEeQ="
  }
}



# ======================================================
# Archivo original: vpc_peering.tf
# Carpeta: C:\Users\asus\cloned_repos\serverlessmike\terraform\modules\management
# ======================================================

// VPC peering to the transit VPC
resource "aws_vpc_peering_connection" "transit_vpc" {
  peer_owner_id = "${var.prod_transit_vpc_account_id}"
  peer_vpc_id   = "${var.prod_transit_vpc_id}"
  vpc_id        = "${module.vpc.vpc_id}"

  tags {
    "Name"         = "${var.project_name}-${var.environment}"
    "terraform"    = "true"
    "environment"  = "${var.environment}"
    "project_name" = "${var.project_name}"
  }
}

resource "aws_route" "transit_vpc" {
  route_table_id            = "${element(module.vpc.private_route_table_ids, count.index)}"
  destination_cidr_block    = "${var.prod_transit_vpc_subnet_cidr}"
  vpc_peering_connection_id = "${aws_vpc_peering_connection.transit_vpc.id}"
  count                     = "${length(var.private_subnets)}"
}

output "management_to_prod_vpc_peering_connection_id" {
  value = "${aws_vpc_peering_connection.transit_vpc.id}"
}




# ======================================================
# Archivo fusionado: modules\mobileiron\cloudmobileiron.tf
# Piezas Terraform en carpeta: 27
# Tiene arquitectura (EC2/Docker/Serverless): False
# ======================================================



# ======================================================
# Archivo original: connector.tf
# Carpeta: C:\Users\asus\cloned_repos\serverlessmike\terraform\modules\mobileiron
# ======================================================

module "connector" {
  source = "./connector"

  environment     = "${var.environment}"
  ssh_key_name    = "${var.ssh_key_name}"
  vpc_id          = "${var.vpc_id}"
  public_subnets  = "${var.private_subnets}"
  private_subnets = "${var.public_subnets}"
  r53_zone_id     = "${var.r53_zone_id}"

  connector_ami = "${var.connector_ami}"

  tags_as_map = {
    repo        = "cloudops-terraform"
    environment = "${var.environment}"
    terraform   = "true"
    tf_module   = "mobileiron/connector"
  }

  security_groups = ["${aws_security_group.allow_ssh.id}", "${aws_security_group.connector.id}"]
}



# ======================================================
# Archivo original: outputs.tf
# Carpeta: C:\Users\asus\cloned_repos\serverlessmike\terraform\modules\mobileiron
# ======================================================

// sentry module

output "sentry_dns" {
  value       = "${module.sentry.sentry_lb_dns}"
  description = "Sentry LB DNS record"
}

// connector module

output "connector_dns" {
  value       = "${module.connector.connector_instance_dns}"
  description = "Connector DNS record"
}



# ======================================================
# Archivo original: security_groups.tf
# Carpeta: C:\Users\asus\cloned_repos\serverlessmike\terraform\modules\mobileiron
# ======================================================

// SSH secuirty Group
resource "aws_security_group" "allow_ssh" {
  name        = "${var.project_name_tag}-allow-ssh"
  description = "Allow ssh traffic"
  vpc_id      = "${var.vpc_id}"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/8"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    name         = "${var.project_name_tag}-allow-ssh"
    repo         = "cloudops-terraform"
    environment  = "prod"
    terraform    = "true"
    tf_module    = "mobileiron"
    project_name = "${var.project_name}"
  }
}

// Sentry security group
resource "aws_security_group" "sentry" {
  name        = "${var.project_name_tag}-sentry"
  description = "Allow sentry traffic"
  vpc_id      = "${var.vpc_id}"

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 8443
    to_port     = 8443
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/8"]
  }

  ingress {
    from_port   = "-1"
    to_port     = "-1"
    protocol    = "icmp"
    cidr_blocks = ["10.0.0.0/8"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    name         = "${var.project_name_tag}-sentry"
    repo         = "cloudops-terraform"
    environment  = "prod"
    terraform    = "true"
    tf_module    = "mobileiron"
    project_name = "${var.project_name}"
  }
}

// Connector security group
resource "aws_security_group" "connector" {
  name        = "${var.project_name_tag}-connector"
  description = "Allow connector traffic"
  vpc_id      = "${var.vpc_id}"

  ingress {
    from_port   = "-1"
    to_port     = "-1"
    protocol    = "icmp"
    cidr_blocks = ["10.0.0.0/8"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    name         = "${var.project_name_tag}-connector"
    repo         = "cloudops-terraform"
    environment  = "prod"
    terraform    = "true"
    tf_module    = "mobileiron"
    project_name = "${var.project_name}"
  }
}



# ======================================================
# Archivo original: sentry.tf
# Carpeta: C:\Users\asus\cloned_repos\serverlessmike\terraform\modules\mobileiron
# ======================================================

module "sentry" {
  source = "./sentry"

  environment     = "${var.environment}"
  ssh_key_name    = "${var.ssh_key_name}"
  vpc_id          = "${var.vpc_id}"
  public_subnets  = "${var.private_subnets}"
  private_subnets = "${var.public_subnets}"
  r53_zone_id     = "${var.r53_zone_id}"

  ami_account_id = "${var.ami_account_id}"
  sentry_version = "${var.sentry_version}"

  tags_as_map = {
    repo        = "cloudops-terraform"
    environment = "${var.environment}"
    terraform   = "true"
    tf_module   = "mobileiron/sentry"
  }

  security_groups = ["${aws_security_group.allow_ssh.id}", "${aws_security_group.sentry.id}"]
}



# ======================================================
# Archivo original: variables.tf
# Carpeta: C:\Users\asus\cloned_repos\serverlessmike\terraform\modules\mobileiron
# ======================================================

// Global Variables
variable "environment" {
  description = "Envrionemnt to be deployed"
}

variable "vpc_id" {
  description = "VPC ID"
}

variable "project_name" {
  description = "Name of the project"
  default     = "Device Modernisation"
}

variable "project_name_tag" {
  description = "Tag friendly project name"
  default     = "device-modernisation"
}

variable "ssh_key_name" {
  description = "SSH Keypair name"
}

variable "private_subnets" {
  description = "private subnets for ECS cluster nodes"
  type        = "list"
}

variable "public_subnets" {
  description = "public subnets for ECS cluster nodes"
  type        = "list"
}

// sentry.tf variables
variable "ami_account_id" {
  description = "Mobile Iron AWS Account ID that owns the Sentry AMI"
  default     = "795357751823"
}

variable "sentry_version" {
  description = "Mobile Iron Sentry Version"
}

variable "tags_as_map" {
  description = "A map of tags and values in the same format as other resources accept. This will be converted into the non-standard format that the aws_autoscaling_group requires."
  type        = "map"
  default     = {}
}

locals {
  tags_asg_format = ["${null_resource.tags_as_list_of_maps.*.triggers}"]
}

resource "null_resource" "tags_as_list_of_maps" {
  count = "${length(keys(var.tags_as_map))}"

  triggers = "${map(
    "key", "${element(keys(var.tags_as_map), count.index)}",
    "value", "${element(values(var.tags_as_map), count.index)}",
    "propagate_at_launch", "true"
  )}"
}

variable "tags" {
  description = "A list of tag blocks. Each element should have keys named key, value, and propagate_at_launch."
  default     = []
}

variable "r53_zone_id" {
  description = "Route53 zone for LB record. Must end as with ."
}

// connector.tf Variables
variable "connector_ami" {
  description = "Connector AMI shared by MobileIron"
  default     = "ami-c8d9d222"
}




# ======================================================
# Archivo fusionado: providers\aws\prod\cloudprod.tf
# Piezas Terraform en carpeta: 28
# Tiene arquitectura (EC2/Docker/Serverless): True
# ======================================================



# ======================================================
# Archivo original: main.tf
# Carpeta: C:\Users\asus\cloned_repos\serverlessmike\terraform\providers\aws\prod
# ======================================================

terraform {
  backend "s3" {
    bucket = "prod-cloudops-tf-state"
    key    = "infrastructure/terraform.tfstate"
    region = "eu-west-1"
  }
}

provider "aws" {
  region  = "eu-west-1"
  version = "2.1.0"

  allowed_account_ids = ["795357751823"]
}

module "cloudops" {
  source = "../../../modules/cloudops"

  environment     = "prod"
  private_subnets = ["10.202.176.0/24", "10.202.177.0/24", "10.202.178.0/24"]
  public_subnets  = ["10.202.179.0/24", "10.202.180.0/24", "10.202.181.0/24"]
  vpc_cidr        = "10.202.176.0/21"
  vpc_tgw_subnets = ["10.202.182.16/28", "10.202.182.32/28", "10.202.182.48/28"]

  enable_vpn                         = true
  propagate_private_route_tables_vgw = true
}

resource "aws_route" "styleman" {
  route_table_id            = "rtb-05d64016955af832a"
  destination_cidr_block    = "10.202.96.0/22"
  vpc_peering_connection_id = "pcx-0899d6cd26f74f491"

}
module "vpn" {
  source = "../../../modules/vpn"

  environment             = "prod"
  cgw_ip                  = "193.105.212.250"
  vpc_id                  = "${module.cloudops.vpc_id}"
  vpn_vgw_id              = "${module.cloudops.vpn_gw_id}"
  private_route_table_ids = "${module.cloudops.private_route_table_ids}"
}

module "mobileiron" {
  source = "../../../modules/mobileiron"

  environment     = "prod"
  ssh_key_name    = "cloudops-prod-default"
  vpc_id          = "${module.cloudops.vpc_id}"
  public_subnets  = "${module.cloudops.private_subnet_ids}"
  private_subnets = "${module.cloudops.public_subnet_ids}"
  r53_zone_id     = "${module.cloudops.route53_zone_id}"

  ami_account_id = "795357751823" // Mobile Iron AWS AMI Account ID
  sentry_version = "9.4.0.4"      // Sentry version for AMI
  connector_ami  = "ami-c8d9d222" //Connector AMI from Mobile Iron

  tags_as_map = {
    repo        = "cloudops-terraform"
    environment = "prod"
    terraform   = true
    tf_module   = "mobileiron"
  }
}

# Add in audit (actually just the bucket for now)

module "audit" {
  source = "../../../modules/audit"

  environment = "prod"
}

module "StatefulWinEC2" {
  source = "../../../modules/stateful-ec2"

  # These parameters are specific to the environment
  environment        = "prod"
  private_subnet_ids = "${join(",",module.cloudops.private_subnet_ids)}"
  public_subnet_ids  = "${join(",",module.cloudops.public_subnet_ids)}"

  # The following are product-specific
  is_public             = ["false", "false", "false", "false"]
  products              = ["cid", "mksql", "newcid", "maxs"]
  ami_versions          = ["Base-2020.02.12", "SQL_2019_Standard-2019.12.16", "SQL_2019_Standard-2019.12.16", "SQL_2017_Standard-2019.12.16"]
  owners                = ["MOBA", "DBAs", "MOBA", "DBAs"]
  instance_types        = ["m5.xlarge", "m5.xlarge", "m5.xlarge", "m5.xlarge"]
  min_size              = ["1", "0", "1", "1"]
  des_size              = ["1", "0", "1", "1"]
  max_size              = ["1", "1", "1", "1"]
  customisation_scripts = ["cid.ps1", "mksql.ps1", "cid2.ps1", "maxs.ps1"]
  backup_intervals      = ["12", "12", "12", "24"]
  backups_retained      = ["14", "14", "14", "2"]
  backup_start_times    = ["02:00", "02:00", "02:00", "02:00"]
  allow_1433_in         = ["cid", "mksql", "newcid", "maxs"]
  allow_1434_in         = ["cid", "mksql", "newcid", "maxs"]
  allow_rdp_in          = ["cid", "mksql", "newcid", "maxs"]
  allow_ssh_in          = ["cid", "mksql", "newcid", "maxs"]
}



# ======================================================
# Archivo original: outputs.tf
# Carpeta: C:\Users\asus\cloned_repos\serverlessmike\terraform\providers\aws\prod
# ======================================================

output "env_vpc_id" {
  value = "${module.cloudops.vpc_id}"
}

output "env_route53_name_servers" {
  value = "${module.cloudops.route53_name_servers}"
}

output "env_sentry_fqdn" {
  value = "${module.mobileiron.sentry_dns}"
}

output "env_connector_fqdn" {
  value = "${module.mobileiron.connector_dns}"
}



# ======================================================
# Archivo original: policy.tf
# Carpeta: C:\Users\asus\cloned_repos\serverlessmike\terraform\providers\aws\prod
# ======================================================

data "aws_iam_policy_document" "instance_profile_policy" {
  statement {
    sid = "AllowStylemanS3"

    actions = [
      "s3:*",
    ]

    effect = "Allow"

    resources = [
      "arn:aws:s3:::rmni-dev-oracle-patches",
      "arn:aws:s3:::rmni-dev-oracle-patches/*",
    ]
  }

  statement {
    sid = "AllowStylemanEC2"

    actions = [
      "ec2:Describe*",
    ]

    effect = "Allow"

    resources = [
      "*",
    ]
  }
}



# ======================================================
# Archivo original: rimini.tf
# Carpeta: C:\Users\asus\cloned_repos\serverlessmike\terraform\providers\aws\prod
# ======================================================

module "file_server" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "1.19.0"

  name                        = "file_server"
  instance_count              = 1
  ami                         = "ami-0a3a4d653d15fd64c"
  instance_type               = "c4.xlarge"
  key_name                    = "${module.cloudops.key_name}"
  vpc_security_group_ids      = ["${module.file_server_sg.this_security_group_id}"]
  subnet_id                   = "${element(module.cloudops.public_subnet_ids, 0)}"
  associate_public_ip_address = "true"
  private_ip                  = "10.202.179.178"

  ebs_block_device = [
    {
      device_name           = "xvdb"
      snapshot_id           = ""
      volume_type           = "gp2"
      volume_size           = 4000
      delete_on_termination = true
    },
  ]

  tags = {
    Terraform   = "true"
    Environment = "prod"
  }
}

module "file_server_sg" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "2.17.0"

  name        = "file_server_security_group"
  description = "Security group for file server access"
  vpc_id      = "${module.cloudops.vpc_id}"

  ingress_with_cidr_blocks = [
    {
      rule        = "all-all"
      cidr_blocks = "10.0.0.0/8,193.105.212.250/32,63.32.42.222/32,52.212.191.233/32,63.35.129.51/32"
    },
  ]

  egress_with_cidr_blocks = [
    {
      from_port   = 0
      to_port     = 0
      protocol    = -1
      cidr_blocks = "0.0.0.0/0"
    },
  ]
}

module "file_downloaders" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "1.19.0"

  name                        = "file_downloader"
  instance_count              = 2
  ami                         = "ami-0469cbc09a3830a6d"
  instance_type               = "t2.medium"
  key_name                    = "${module.cloudops.key_name}"
  vpc_security_group_ids      = ["${module.file_server_sg.this_security_group_id}"]
  subnet_id                   = "${element(module.cloudops.public_subnet_ids, 0)}"
  iam_instance_profile        = "${module.iam_role.profile_name}"
  associate_public_ip_address = "true"

  tags = {
    Terraform   = "true"
    Environment = "prod"
  }
}

# iam role and policy
module "iam_role" {
  source = "../../../modules/ec2-iam-role"

  name        = "rimini_iam_role_policy"
  policy      = "${data.aws_iam_policy_document.instance_profile_policy.json}"
  environment = "prod"
}

module "s3_bucket" {
  source  = "cloudposse/s3-bucket/aws"
  version = "0.3.0"

  name                   = "oracle-patches"
  namespace              = "rmni"
  stage                  = "prod"
  user_enabled           = "false"
  allowed_bucket_actions = ["s3:*"]
}



# ======================================================
# Archivo original: variables.tf
# Carpeta: C:\Users\asus\cloned_repos\serverlessmike\terraform\providers\aws\prod
# ======================================================

// vpc_peering - prod transit
variable "prod_transit_vpc_account_id" {
  type        = "string"
  description = "the id of the account that the transit vpc sits in"
  default     = "376076567968"
}

variable "prod_transit_vpc_id" {
  type        = "string"
  description = "the id of the transit vpc that has the direct connect connection attached"
  default     = "vpc-2efefe4a"
}

variable "prod_transit_vpc_subnet_cidr" {
  type        = "string"
  description = "CIDR of vpc subnet to route to"
  default     = "10.202.0.0/22"
}

variable "project_name" {
  type        = "string"
  description = "name of our project"
  default     = "cloudops"
}

variable "environment" {
  type        = "string"
  description = "environment"
  default     = "prod"
}

variable "private_subnets" {
  type        = "list"
  description = "private subnet cidrs"
  default     = ["10.202.177.0/24", "10.202.178.0/24", "10.202.179.0/24"]
}



# ======================================================
# Archivo original: vpc_peering.tf
# Carpeta: C:\Users\asus\cloned_repos\serverlessmike\terraform\providers\aws\prod
# ======================================================

// VPC peering to the transit VPC
resource "aws_vpc_peering_connection" "transit_vpc" {
  peer_owner_id = "${var.prod_transit_vpc_account_id}"
  peer_vpc_id   = "${var.prod_transit_vpc_id}"
  vpc_id        = "${module.cloudops.vpc_id}"

  tags {
    "Name"         = "${var.project_name}-${var.environment}"
    "terraform"    = "true"
    "environment"  = "${var.environment}"
    "project_name" = "${var.project_name}"
  }
}

resource "aws_route" "transit_vpc" {
  route_table_id            = "${element(module.cloudops.private_route_table_ids, count.index)}"
  destination_cidr_block    = "${var.prod_transit_vpc_subnet_cidr}"
  vpc_peering_connection_id = "${aws_vpc_peering_connection.transit_vpc.id}"
  count                     = "${length(var.private_subnets)}"
}

output "management_to_prod_vpc_peering_connection_id" {
  value = "${aws_vpc_peering_connection.transit_vpc.id}"
}




# ======================================================
# Archivo fusionado: modules\mobileiron\sentry\cloudsentry.tf
# Piezas Terraform en carpeta: 30
# Tiene arquitectura (EC2/Docker/Serverless): True
# ======================================================



# ======================================================
# Archivo original: asg.tf
# Carpeta: C:\Users\asus\cloned_repos\serverlessmike\terraform\modules\mobileiron\sentry
# ======================================================

data "aws_ami" "sentry" {
  most_recent = false

  filter {
    name   = "name"
    values = ["RI Sentry ${var.sentry_version} AWS"]
  }

  owners = ["${var.ami_account_id}"]
}

resource "aws_launch_configuration" "sentry" {
  image_id        = "${data.aws_ami.sentry.id}"
  instance_type   = "t3.large"
  key_name        = "${var.ssh_key_name}"
  security_groups = ["${var.security_groups}"]

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_autoscaling_group" "sentry" {
  name                 = "${var.product_name}-asg"
  vpc_zone_identifier  = ["${var.private_subnets}"]
  min_size             = 1
  max_size             = 3
  desired_capacity     = 2
  health_check_type    = "EC2"
  launch_configuration = "${aws_launch_configuration.sentry.name}"
  target_group_arns    = ["${aws_lb_target_group.default.arn}", "${aws_lb_target_group.mgmt.arn}"]

  tags = ["${concat(
      list(map("key", "Name", "value", "${var.project_name_tag}-${var.product_name}", "propagate_at_launch", true)),
      var.tags,
      local.tags_asg_format
   )}"]
}



# ======================================================
# Archivo original: cloudwatch.tf
# Carpeta: C:\Users\asus\cloned_repos\serverlessmike\terraform\modules\mobileiron\sentry
# ======================================================

resource "aws_cloudwatch_metric_alarm" "Sentry-UnhealthyHost" {
  alarm_name          = "${var.product_name}-UnhealthyHost"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "1"
  metric_name         = "UnHealthyHostCount"
  namespace           = "AWS/NetworkELB"
  period              = "300"
  statistic           = "Maximum"
  threshold           = "1.0"
  alarm_description   = "Unhealthy target has been identified in the ${aws_lb_target_group.default.name}"

  dimensions {
    TargetGroup  = "${aws_lb_target_group.default.arn_suffix}"
    LoadBalancer = "${aws_lb.default.arn_suffix}"
  }
}



# ======================================================
# Archivo original: outputs.tf
# Carpeta: C:\Users\asus\cloned_repos\serverlessmike\terraform\modules\mobileiron\sentry
# ======================================================

output "sentry_lb_dns" {
  value       = "${aws_route53_record.sentry.fqdn}"
  description = "Sentry LB DNS record"
}



# ======================================================
# Archivo original: route_53.tf
# Carpeta: C:\Users\asus\cloned_repos\serverlessmike\terraform\modules\mobileiron\sentry
# ======================================================

resource "aws_route53_record" "sentry" {
  zone_id = "${var.r53_zone_id}"
  name    = "${var.product_name}"
  type    = "CNAME"
  ttl     = "60"
  records = ["${aws_lb.default.dns_name}"]
}



# ======================================================
# Archivo original: sentry_lb.tf
# Carpeta: C:\Users\asus\cloned_repos\serverlessmike\terraform\modules\mobileiron\sentry
# ======================================================

resource "aws_lb" "default" {
  name               = "${var.project_name_tag}-${var.product_name}-nlb"
  internal           = false
  load_balancer_type = "network"
  subnets            = ["${var.public_subnets}"]

  tags = {
    Name         = "${var.project_name_tag}-${var.product_name}-nlb"
    repo         = "cloudops-terraform"
    environment  = "${var.environment}"
    terraform    = "true"
    tf_module    = "mobileiron/sentry"
    project_name = "${var.project_name}"
  }
}

resource "aws_lb_listener" "ssl_listener" {
  load_balancer_arn = "${aws_lb.default.arn}"
  port              = "443"
  protocol          = "TCP"

  default_action {
    target_group_arn = "${aws_lb_target_group.default.arn}"
    type             = "forward"
  }
}

resource "aws_lb_target_group" "default" {
  name                 = "${var.product_name}-tg"
  port                 = 443
  protocol             = "TCP"
  deregistration_delay = 20
  vpc_id               = "${var.vpc_id}"
  target_type          = "instance"

  health_check {
    interval            = 30
    unhealthy_threshold = 3
    healthy_threshold   = 3
    protocol            = "TCP"
    port                = "traffic-port"
  }

  lifecycle {
    create_before_destroy = true
  }

  tags = {
    Name         = "${var.product_name}-tg"
    repo         = "cloudops-terraform"
    environment  = "${var.environment}"
    terraform    = "true"
    tf_module    = "mobileiron/sentry"
    project_name = "${var.project_name}"
  }
}

resource "aws_lb_listener" "mgmt" {
  load_balancer_arn = "${aws_lb.default.arn}"
  port              = "8443"
  protocol          = "TCP"

  default_action {
    target_group_arn = "${aws_lb_target_group.mgmt.arn}"
    type             = "forward"
  }
}

resource "aws_lb_target_group" "mgmt" {
  name                 = "${var.product_name}-mgmt-tg"
  port                 = 8443
  protocol             = "TCP"
  deregistration_delay = 20
  vpc_id               = "${var.vpc_id}"
  target_type          = "instance"

  health_check {
    interval            = 30
    unhealthy_threshold = 3
    healthy_threshold   = 3
    protocol            = "TCP"
    port                = "traffic-port"
  }

  lifecycle {
    create_before_destroy = true
  }

  tags = {
    Name         = "${var.product_name}-mgmt-tg"
    repo         = "cloudops-terraform"
    environment  = "${var.environment}"
    terraform    = "true"
    tf_module    = "mobileiron/sentry"
    project_name = "${var.project_name}"
  }
}



# ======================================================
# Archivo original: variables.tf
# Carpeta: C:\Users\asus\cloned_repos\serverlessmike\terraform\modules\mobileiron\sentry
# ======================================================

// Global Variables
variable "environment" {
  description = "Envrionemnt to be deployed"
}

variable "vpc_id" {
  description = "VPC ID"
}

variable "project_name" {
  description = "Name of the project"
  default     = "Device Modernisation"
}

variable "project_name_tag" {
  description = "Tag friendly project name"
  default     = "device-modernisation"
}

variable "product_name" {
  description = "Product name"
  default     = "sentry"
}

variable "ssh_key_name" {
  description = "SSH Keypair name"
}

variable "private_subnets" {
  description = "private subnets for ECS cluster nodes"
  type        = "list"
}

variable "public_subnets" {
  description = "public subnets for ECS cluster nodes"
  type        = "list"
}

// asg.tf variables
variable "ami_account_id" {
  description = "Mobile Iron AWS Account ID that owns the Sentry AMI"
  default     = "795357751823"
}

variable "sentry_version" {
  description = "Mobile Iron Sentry Version"
}

variable "tags_as_map" {
  description = "A map of tags and values in the same format as other resources accept. This will be converted into the non-standard format that the aws_autoscaling_group requires."
  type        = "map"
  default     = {}
}

locals {
  tags_asg_format = ["${null_resource.tags_as_list_of_maps.*.triggers}"]
}

resource "null_resource" "tags_as_list_of_maps" {
  count = "${length(keys(var.tags_as_map))}"

  triggers = "${map(
    "key", "${element(keys(var.tags_as_map), count.index)}",
    "value", "${element(values(var.tags_as_map), count.index)}",
    "propagate_at_launch", "true"
  )}"
}

variable "tags" {
  description = "A list of tag blocks. Each element should have keys named key, value, and propagate_at_launch."
  default     = []
}

variable "security_groups" {
  description = "List of security group IDs to be attached to the launch configuration"
  type        = "list"
}

// route_53.tf variables

variable "r53_zone_id" {
  description = "Route53 zone for LB record. Must end as with ."
}




# ======================================================
# Archivo fusionado: modules\styleman-launch-config\cloudstyleman-launch-config.tf
# Piezas Terraform en carpeta: 30
# Tiene arquitectura (EC2/Docker/Serverless): True
# ======================================================



# ======================================================
# Archivo original: main.tf
# Carpeta: C:\Users\asus\cloned_repos\serverlessmike\terraform\modules\styleman-launch-config
# ======================================================

# elastic load balancer

module "elb" {
  source  = "terraform-aws-modules/elb/aws"
  version = "1.4.1"

  name                        = "${var.project_name}-${var.environment}-elb"
  subnets                     = ["${var.private_subnets}"]
  security_groups             = ["${var.elb_sg}"]
  internal                    = "true"
  cross_zone_load_balancing   = "${var.cross_zone_load_balancing}"
  idle_timeout                = "${var.idle_timeout}"
  connection_draining         = "${var.connection_draining}"
  connection_draining_timeout = "${var.connection_draining_timeout}"

  listener     = ["${var.listener}"]
  access_logs  = ["${var.access_logs}"]
  health_check = ["${var.health_check}"]

  tags = {
    repo        = "cloudops-terraform"
    environment = "staging"
    terraform   = true
  }
}

# autoscaling
module "asg" {
  source  = "terraform-aws-modules/autoscaling/aws"
  version = "2.9.1"

  name                        = "${var.project_name}-${var.environment}-asg"
  lc_name                     = "${var.project_name}-${var.environment}-lc"
  image_id                    = "${var.ami_id}"
  instance_type               = "${var.instance_type}"
  iam_instance_profile        = "${var.iam_role_profile_name}"
  key_name                    = "${var.key_name}"
  security_groups             = ["${var.asg_sg}"]
  associate_public_ip_address = "false"
  enable_monitoring           = "true"

  asg_name             = "styleman-${var.environment}-asg"
  vpc_zone_identifier  = ["${var.private_subnets}"]
  min_size             = "${var.min_size}"
  max_size             = "${var.max_size}"
  desired_capacity     = "${var.desired_capacity}"
  min_elb_capacity     = "${var.min_elb_capacity}"
  load_balancers       = ["${module.elb.this_elb_id}"]
  health_check_type    = "${var.health_check_type}"
  termination_policies = "${var.termination_policies}"

  tags_as_map = {
    repo        = "cloudops-terraform"
    environment = "${var.environment}"
    terraform   = "true"
    retention   = 60
    backup      = "True"
  }
}



# ======================================================
# Archivo original: outputs.tf
# Carpeta: C:\Users\asus\cloned_repos\serverlessmike\terraform\modules\styleman-launch-config
# ======================================================

output "elb_name" {
  value = "${module.elb.this_elb_name}"
}

output "elb_id" {
  value = "${module.elb.this_elb_id}"
}

output "elb_arn" {
  value = "${module.elb.this_elb_arn}"
}

output "elb_dns_name" {
  value = "${module.elb.this_elb_dns_name}"
}



# ======================================================
# Archivo original: variables.tf
# Carpeta: C:\Users\asus\cloned_repos\serverlessmike\terraform\modules\styleman-launch-config
# ======================================================

variable "key_name" {}

variable "environment" {}

variable "private_subnets" {
  type = "list"
}

variable "cross_zone_load_balancing" {
  description = "Enable cross-zone load balancing"
  default     = true
}

variable "idle_timeout" {
  description = "The time in seconds that the connection is allowed to be idle"
  default     = 60
}

variable "connection_draining" {
  description = "Boolean to enable connection draining"
  default     = true
}

variable "connection_draining_timeout" {
  description = "The time in seconds to allow for connections to drain"
  default     = 300
}

variable "listener" {
  description = "A list of listener blocks"
  type        = "list"
}

//# autoscaling
//# asg
variable "max_size" {
  default     = 1
  description = "The maximum size of the auto scale group"
}

variable "min_size" {
  default     = 1
  description = "The minimum size of the auto scale group"
}

variable "desired_capacity" {
  default     = 1
  description = "The number of Amazon EC2 instances that should be running in the group"
}

variable "min_elb_capacity" {
  default     = 1
  description = "Setting this causes Terraform to wait for this number of instances to show up healthy in the ELB only on creation. Updates will not wait on ELB instance number changes"
}

variable "health_check_type" {
  default     = "EC2"
  description = "Controls how health checking is done. Values are - EC2 and ELB"
}

variable "termination_policies" {
  description = "A list of policies to decide how the instances in the auto scale group should be terminated. The allowed values are OldestInstance, NewestInstance, OldestLaunchConfiguration, ClosestToNextInstanceHour, Default"
  type        = "list"
  default     = ["OldestLaunchConfiguration"]
}

variable "access_logs" {
  description = "An access logs block"
  type        = "list"
  default     = []
}

variable "health_check" {
  description = "A health check block"
  type        = "list"
}

variable "ami_id" {}

variable "instance_type" {}

variable "iam_role_profile_name" {}

variable "elb_sg" {
  type = "list"
}

variable "asg_sg" {
  type = "list"
}

variable "project_name" {}




# ======================================================
# Archivo fusionado: modules\uc4-launch-config\clouduc4-launch-config.tf
# Piezas Terraform en carpeta: 30
# Tiene arquitectura (EC2/Docker/Serverless): True
# ======================================================



# ======================================================
# Archivo original: main.tf
# Carpeta: C:\Users\asus\cloned_repos\serverlessmike\terraform\modules\uc4-launch-config
# ======================================================

module "elb" {
  source  = "terraform-aws-modules/elb/aws"
  version = "1.4.1"

  name                        = "${var.project_name}-${var.environment}-elb"
  subnets                     = ["${var.private_subnets}"]
  security_groups             = ["${var.elb_sg}"]
  internal                    = "true"
  cross_zone_load_balancing   = "${var.cross_zone_load_balancing}"
  idle_timeout                = "${var.idle_timeout}"
  connection_draining         = "${var.connection_draining}"
  connection_draining_timeout = "${var.connection_draining_timeout}"

  listener     = ["${var.listener}"]
  access_logs  = ["${var.access_logs}"]
  health_check = ["${var.health_check}"]

  tags = {
    repo        = "cloudops-terraform"
    environment = "staging"
    terraform   = true
  }
}

# autoscaling
module "asg" {
  source  = "terraform-aws-modules/autoscaling/aws"
  version = "2.9.1"

  name                        = "${var.project_name}-${var.environment}-asg"
  lc_name                     = "${var.project_name}-${var.environment}-lc"
  image_id                    = "${var.ami_id_uc4}"
  instance_type               = "${var.instance_type}"
  iam_instance_profile        = "${var.iam_role_profile_name}"
  key_name                    = "${var.key_name}"
  security_groups             = ["${var.asg_sg}"]
  associate_public_ip_address = "false"
  enable_monitoring           = "true"

  asg_name             = "uc4-${var.environment}-asg"
  vpc_zone_identifier  = ["${var.private_subnets}"]
  min_size             = "${var.min_size}"
  max_size             = "${var.max_size}"
  desired_capacity     = "${var.desired_capacity}"
  min_elb_capacity     = "${var.min_elb_capacity}"
  load_balancers       = ["${module.elb.this_elb_id}"]
  health_check_type    = "${var.health_check_type}"
  termination_policies = "${var.termination_policies}"

  tags_as_map = {
    repo        = "cloudops-terraform"
    environment = "${var.environment}"
    terraform   = "true"
    retention   = 60
    backup      = "True"
  }
}



# ======================================================
# Archivo original: outputs.tf
# Carpeta: C:\Users\asus\cloned_repos\serverlessmike\terraform\modules\uc4-launch-config
# ======================================================

output "elb_name" {
  value = "${module.elb.this_elb_name}"
}

output "elb_id" {
  value = "${module.elb.this_elb_id}"
}

output "elb_arn" {
  value = "${module.elb.this_elb_arn}"
}

output "elb_dns_name" {
  value = "${module.elb.this_elb_dns_name}"
}



# ======================================================
# Archivo original: variables.tf
# Carpeta: C:\Users\asus\cloned_repos\serverlessmike\terraform\modules\uc4-launch-config
# ======================================================

variable "key_name" {}

variable "environment" {}

variable "private_subnets" {
  type = "list"
}

variable "cross_zone_load_balancing" {
  description = "Enable cross-zone load balancing"
  default     = true
}

variable "idle_timeout" {
  description = "The time in seconds that the connection is allowed to be idle"
  default     = 60
}

variable "connection_draining" {
  description = "Boolean to enable connection draining"
  default     = true
}

variable "connection_draining_timeout" {
  description = "The time in seconds to allow for connections to drain"
  default     = 300
}

variable "listener" {
  description = "A list of listener blocks"
  type        = "list"
}

//# autoscaling
//# asg
variable "max_size" {
  default     = 1
  description = "The maximum size of the auto scale group"
}

variable "min_size" {
  default     = 1
  description = "The minimum size of the auto scale group"
}

variable "desired_capacity" {
  default     = 1
  description = "The number of Amazon EC2 instances that should be running in the group"
}

variable "min_elb_capacity" {
  default     = 1
  description = "Setting this causes Terraform to wait for this number of instances to show up healthy in the ELB only on creation. Updates will not wait on ELB instance number changes"
}

variable "health_check_type" {
  default     = "EC2"
  description = "Controls how health checking is done. Values are - EC2 and ELB"
}

variable "termination_policies" {
  description = "A list of policies to decide how the instances in the auto scale group should be terminated. The allowed values are OldestInstance, NewestInstance, OldestLaunchConfiguration, ClosestToNextInstanceHour, Default"
  type        = "list"
  default     = ["OldestLaunchConfiguration"]
}

variable "access_logs" {
  description = "An access logs block"
  type        = "list"
  default     = []
}

variable "health_check" {
  description = "A health check block"
  type        = "list"
}

variable "ami_id_uc4" {}

variable "instance_type" {}

variable "iam_role_profile_name" {}

variable "elb_sg" {
  type = "list"
}

variable "asg_sg" {
  type = "list"
}

variable "project_name" {}




# ======================================================
# Archivo fusionado: providers\aws\staging\cloudstaging.tf
# Piezas Terraform en carpeta: 30
# Tiene arquitectura (EC2/Docker/Serverless): True
# ======================================================



# ======================================================
# Archivo original: automic-ec2.tf
# Carpeta: C:\Users\asus\cloned_repos\serverlessmike\terraform\providers\aws\staging
# ======================================================

resource "aws_instance" "automic_instance" {
  ami                    = "ami-03f7c013c9789ba73"
  instance_type          = "t3.xlarge"
  subnet_id              = "subnet-0af23cae65c1356f0"
  private_ip             = "10.200.196.130"
  key_name               = "uc4-app-staging-server"
  vpc_security_group_ids = ["sg-04f4fa2be7a545680"]

  user_data = <<-EOF
              #!/bin/bash
              sudo sed -i "/^[^#]*PasswordAuthentication[[:space:]]no/c\PasswordAuthentication yes" /etc/ssh/sshd_config
              sudo service sshd restart
              EOF

  tags = {
    Name = "automic_app_server"
  }
}

resource "aws_eip" "automic_eip" {
  instance = "${aws_instance.automic_instance.id}"
}

resource "aws_route53_record" "automic" {
  zone_id = "${var.zone_id}"
  name    = "automic"
  type    = "A"
  ttl     = "300"
  records = ["10.200.196.130"]
}



# ======================================================
# Archivo original: automic-rds.tf
# Carpeta: C:\Users\asus\cloned_repos\serverlessmike\terraform\providers\aws\staging
# ======================================================

resource "aws_rds_cluster_instance" "staging-automic-1" {
  count                        = 2
  identifier                   = "staging-automic-${count.index}"
  cluster_identifier           = "${aws_rds_cluster.staging-automic.id}"
  instance_class               = "db.r4.large"
  engine                       = "aurora-postgresql"
  engine_version               = "10.7"
  db_subnet_group_name         = "automic-subnet-group"
  db_parameter_group_name      = "automic-db-pg"
  preferred_maintenance_window = "mon:19:00-mon:20:00"
  auto_minor_version_upgrade   = false
}

resource "aws_rds_cluster" "staging-automic" {
  cluster_identifier              = "staging-automic"
  availability_zones              = ["eu-west-1a", "eu-west-1b", "eu-west-1c"]
  database_name                   = ""
  master_username                 = "postgres"
  master_password                 = "p05tGr35!"
  backup_retention_period         = 7
  preferred_backup_window         = "18:00-19:00"
  preferred_maintenance_window    = "mon:19:00-mon:20:00"
  port                            = "5432"
  engine                          = "aurora-postgresql"
  engine_version                  = "10.7"
  vpc_security_group_ids          = ["${aws_security_group.automic-security-group.id}"]
  db_subnet_group_name            = "automic-subnet-group"
  db_cluster_parameter_group_name = "aurora-cluster-pg"
}

resource "aws_db_subnet_group" "automic-subnet-group" {
  name       = "automic-subnet-group"
  subnet_ids = ["subnet-0588bd6801b9784ba", "subnet-05cb6eb6e8db5d82d", "subnet-0697442c6ba2dff81"]

  tags = {
    Name = "automic-subnet-group"
  }
}

resource "aws_db_parameter_group" "automic-db-pg" {
  name   = "automic-db-pg"
  family = "aurora-postgresql10"

  parameter {
    name  = "shared_preload_libraries"
    value = "pg_stat_statements"
  }

  parameter {
    name  = "log_lock_waits"
    value = "on"
  }

  parameter {
    name  = "idle_in_transaction_session_timeout"
    value = "300000"
  }

  parameter {
    name  = "pg_stat_statements.track_utility"
    value = "on"
  }

  parameter {
    name  = "random_page_cost"
    value = "1.0"
  }
}

resource "aws_rds_cluster_parameter_group" "automic-cluster-pg" {
  name        = "aurora-cluster-pg"
  family      = "aurora-postgresql10"
  description = "RDS default cluster parameter group"

  parameter {
    name  = "autovacuum_vacuum_cost_delay"
    value = "0"
  }

  parameter {
    name  = "vacuum_cost_limit"
    value = "10000"
  }

  parameter {
    name  = "autovacuum_vacuum_scale_factor"
    value = "0.01"
  }

  parameter {
    name  = "autovacuum_naptime"
    value = "60"
  }

  parameter {
    name  = "client_encoding"
    value = "LATIN1"
  }
}

resource "aws_db_option_group" "automic-og" {
  name                     = "automic-option-group"
  option_group_description = "Automic Option Group"
  engine_name              = "aurora-postgresql"
  major_engine_version     = 10
}

resource "aws_security_group" "automic-security-group" {
  name        = "automic-sg"
  description = "automic-security-group"
  vpc_id      = "vpc-0be3658f035bdf311"

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["10.0.0.0/8"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}



# ======================================================
# Archivo original: main.tf
# Carpeta: C:\Users\asus\cloned_repos\serverlessmike\terraform\providers\aws\staging
# ======================================================

terraform {
  backend "s3" {
    bucket = "staging-cloudops-tf-state"
    key    = "infrastructure/terraform.tfstate"
    region = "eu-west-1"
  }
}

provider "aws" {
  region  = "eu-west-1"
  version = "= 2.1.0"

  allowed_account_ids = ["558469419837"]
}

module "cloudops" {
  source = "../../../modules/cloudops"

  environment     = "staging"
  private_subnets = ["10.200.192.0/24", "10.200.193.0/24", "10.200.194.0/24"]
  public_subnets  = ["10.200.195.0/24", "10.200.196.0/24", "10.200.197.0/24"]
  vpc_cidr        = "10.200.192.0/21"
  vpc_tgw_subnets = ["10.200.198.16/28", "10.200.198.32/28", "10.200.198.48/28"]

  enable_vpn                         = true
  propagate_private_route_tables_vgw = true
}

module "vpn" {
  source = "../../../modules/vpn"

  environment             = "staging"
  cgw_ip                  = "193.105.212.250"
  vpc_id                  = "${module.cloudops.vpc_id}"
  vpn_vgw_id              = "${module.cloudops.vpn_gw_id}"
  private_route_table_ids = "${module.cloudops.private_route_table_ids}"
}



# ======================================================
# Archivo original: outputs.tf
# Carpeta: C:\Users\asus\cloned_repos\serverlessmike\terraform\providers\aws\staging
# ======================================================

output "vpc_env_id" {
  value = "${module.cloudops.vpc_id}"
}

output "env_route53_name_servers" {
  value = "${module.cloudops.route53_name_servers}"
}



# ======================================================
# Archivo original: security_groups.tf
# Carpeta: C:\Users\asus\cloned_repos\serverlessmike\terraform\providers\aws\staging
# ======================================================

resource "aws_security_group" "uc4_app_sg" {
  name   = "uc4-app-sg-${var.environment}"
  vpc_id = "${module.cloudops.vpc_id}"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/8"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/8"]
  }

  ingress {
    from_port   = 8443
    to_port     = 8443
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/8"]
  }

  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/8"]
  }

  ingress {
    from_port   = 2271
    to_port     = 2271
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/8"]
  }

  ingress {
    from_port   = 2277
    to_port     = 2277
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/8"]
  }

  ingress {
    from_port   = 2278
    to_port     = 2278
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/8"]
  }

  ingress {
    from_port   = 2217
    to_port     = 2217
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/8"]
  }

  ingress {
    from_port   = 2225
    to_port     = 2225
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/8"]
  }

  ingress {
    from_port   = 2220
    to_port     = 2220
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/8"]
  }

  ingress {
    from_port   = 2219
    to_port     = 2219
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/8"]
  }

  ingress {
    from_port   = 2276
    to_port     = 2276
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/8"]
  }

  ingress {
    from_port   = 2275
    to_port     = 2275
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/8"]
  }

  ingress {
    from_port   = 2227
    to_port     = 2227
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/8"]
  }

  ingress {
    from_port   = 2230
    to_port     = 2230
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/8"]
  }

  ingress {
    from_port   = 2274
    to_port     = 2274
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/8"]
  }

  ingress {
    from_port   = 2224
    to_port     = 2224
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/8"]
  }

  ingress {
    from_port   = 2229
    to_port     = 2229
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/8"]
  }

  ingress {
    from_port   = 2221
    to_port     = 2221
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/8"]
  }

  ingress {
    from_port   = 2272
    to_port     = 2272
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/8"]
  }

  ingress {
    from_port   = 2226
    to_port     = 2226
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/8"]
  }

  ingress {
    from_port   = 2218
    to_port     = 2218
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/8"]
  }

  ingress {
    from_port   = 2228
    to_port     = 2228
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/8"]
  }

  ingress {
    from_port   = 2223
    to_port     = 2223
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/8"]
  }

  ingress {
    from_port   = 2273
    to_port     = 2273
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/8"]
  }

  ingress {
    from_port   = 2222
    to_port     = 2222
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/8"]
  }

  ingress {
    from_port   = 2279
    to_port     = 2279
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/8"]
  }

  ingress {
    from_port   = 8871
    to_port     = 8871
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/8"]
  }

  ingress {
    from_port   = 8088
    to_port     = 8088
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/8"]
  }

  ingress {
    from_port   = 10050
    to_port     = 10050
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/8"]
  }

  ingress {
    from_port   = 10051
    to_port     = 10051
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/8"]
  }

  ingress {
    from_port   = 8088
    to_port     = 8088
    protocol    = "tcp"
    cidr_blocks = ["199.91.137.8/29"]
  }

  ingress {
    from_port   = 8088
    to_port     = 8088
    protocol    = "tcp"
    cidr_blocks = ["199.91.137.22/32"]
  }

  ingress {
    from_port   = 8088
    to_port     = 8088
    protocol    = "tcp"
    cidr_blocks = ["37.98.232.8/29"]
  }

  ingress {
    from_port   = 8088
    to_port     = 8088
    protocol    = "tcp"
    cidr_blocks = ["37.98.232.22/32"]
  }

  ingress {
    from_port   = -1
    to_port     = -1
    protocol    = "icmp"
    cidr_blocks = ["10.0.0.0/8"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags {
    "Name"        = "uc4_app_sg"
    "Service"     = "uc4"
    "Terraform"   = "yes"
    "environment" = "${var.environment}"
    "name"        = "uc4-staging"
    "CostCenter"  = "81139"
  }
}



# ======================================================
# Archivo original: variables.tf
# Carpeta: C:\Users\asus\cloned_repos\serverlessmike\terraform\providers\aws\staging
# ======================================================

variable "zone_id" {
  default = "Z2JQU8EVU3KVBR"
}

variable "retention_days" {
  default = 60
}

variable "environment" {
  default = "staging"
}

variable "project_name" {
  default = "styleman"
}

variable "project_name_cid" {
  default = "cid"
}

variable "project_name_uc4" {
  default = "uc4"
}

// EC2 //

variable "ami_id" {
  default = "ami-0cf80031683a84076"
}

variable "ami_id_cid" {
  default = "ami-0cf80031683a84076"
}

variable "ami_id_uc4" {
  default = "ami-0b341cefa14ccca70"
}

variable "ec2size" {
  default = "m4.xlarge"
}

variable "intip" {
  default = "10.202.96.5"
}

variable "pubkey" {
  default = "ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAlZM7lgVUiOlsZbbeB2JRGrFNnZsbLGAdCk0scj3VY8kxf1ch2HUXlVNQbW8sG8Yw57inJMBKEXzKoJ0y3zvulUZmB+SLuWbzQrEw/k2iMCzuxxBBiMgxm7QvxW1ULvx00xwv15U/7uRinL2dum19ccwz2BMrNNk/arNjIzNfZu1Uo+MRhJfDorkbwM/ohAYXsUFqCgdArWAfJppQwfkkunQ81cvATGD557jnCjbhhegx6Xm92tWpQuz+b2KkyOgS1vSF39Kj5ulnpG0qRZDkU/xtOdGhr0Kbssfj2cRtAhTUhAj1UYtcI3Dsqx5LnXYBqVdue0mn4qDesqsTG4TeKw== terraform@rlansible"
}

// monitoring

variable "sns_encrypted_slack_webhook_url" {
  description = "Encrypted slack webhook url"
  default     = "AQICAHgmjMRhXDrD2MVLexJFi1xhi1QO7B6RADBhTkcB3wPtAAEYCnDzZ2A/V+18Lym9f7w6AAAApzCBpAYJKoZIhvcNAQcGoIGWMIGTAgEAMIGNBgkqhkiG9w0BBwEwHgYJYIZIAWUDBAEuMBEEDGbPdV7ihtae2/EMFgIBEIBgwEYiosTJ2+xLW5LiakY4GU/K+appY/OrShv/8zPTq0o2IDNiukcV0Gw8UT9wC+xO2X+mE4QQgyTDKG28j2OMFPoFQNj09uKfg3TbJhsUhvZsZEQNQ9m8KPSZ3Pln5CTc"
}




# ======================================================
# Archivo fusionado: modules\cloudops\cloudcloudops.tf
# Piezas Terraform en carpeta: 34
# Tiene arquitectura (EC2/Docker/Serverless): True
# ======================================================



# ======================================================
# Archivo original: key_pair.tf
# Carpeta: C:\Users\asus\cloned_repos\serverlessmike\terraform\modules\cloudops
# ======================================================

resource "aws_key_pair" "default" {
  key_name   = "${var.project_name}-${var.environment}-default"
  public_key = "${file("${path.root}/default.pub")}"
}



# ======================================================
# Archivo original: outputs.tf
# Carpeta: C:\Users\asus\cloned_repos\serverlessmike\terraform\modules\cloudops
# ======================================================

// vpc.tf outputs
output "vpc_id" {
  value = "${module.vpc.vpc_id}"
}

output "vpc_cidr_block" {
  value = "${module.vpc.vpc_cidr_block}"
}

output "private_route_table_ids" {
  value = ["${module.vpc.private_route_table_ids}"]
}

// route_53.tf outputs
output "route53_name_servers" {
  value = "${aws_route53_zone.environment.name_servers}"
}

output "private_subnet_ids" {
  value = "${module.vpc.private_subnets}"
}

output "public_subnet_ids" {
  value = "${module.vpc.public_subnets}"
}

output "nat_public_ips" {
  value = "${module.vpc.nat_public_ips}"
}

output "route53_zone_id" {
  value = "${aws_route53_zone.environment.zone_id}"
}

output "key_name" {
  value = "${aws_key_pair.default.key_name}"
}

output "vpn_gw_id" {
  value = "${module.vpc.vgw_id}"
}

output "win_event_topic" {
  value = "${aws_sns_topic.windows_events.arn}"
}



# ======================================================
# Archivo original: publish_costs.tf
# Carpeta: C:\Users\asus\cloned_repos\serverlessmike\terraform\modules\cloudops
# ======================================================

// Publish AWS costs to CloudWatch
module "publish_costs_to_cw" {
  source = "git::ssh://git@github.com/river-island/shared-lambdas.git//terraform/modules/lambda_publish_aws_costs_to_cw?ref=ee54d9b97a80e8e65b2d25b8b1fc99005e7fe401"
}



# ======================================================
# Archivo original: route_53.tf
# Carpeta: C:\Users\asus\cloned_repos\serverlessmike\terraform\modules\cloudops
# ======================================================

resource "aws_route53_zone" "environment" {
  #Environment subdomain truncated to keep it under the DNS character limit
  name = "${var.environment}.${var.project_name}.ri-tech.io"

  tags {
    "terraform"    = "true"
    "environment"  = "${var.environment}"
    "project_name" = "${var.project_name}"
  }
}



# ======================================================
# Archivo original: run_audit.tf
# Carpeta: C:\Users\asus\cloned_repos\serverlessmike\terraform\modules\cloudops
# ======================================================

// Audit AWS infrastructure nightly, dumping the results as objects into a bucket

module "run_nightly_audit" {
  source = "git::ssh://git@github.com/river-island/shared-lambdas.git//terraform/modules/lambda_audit_aws?ref=c385545abc18c96e03680cc82ae7b0e20a4ada03"
}



# ======================================================
# Archivo original: variables.tf
# Carpeta: C:\Users\asus\cloned_repos\serverlessmike\terraform\modules\cloudops
# ======================================================

variable "project_name" {
  type        = "string"
  description = "name of our project"
  default     = "cloudops"
}

variable "environment" {
  type        = "string"
  description = "environment"
}

variable "module_instance_id" {
  type        = "string"
  description = "Use this to create unique resource names"
  default     = "0"
}

variable "private_subnets" {
  type        = "list"
  description = "private subnet cidrs"
}

variable "public_subnets" {
  type        = "list"
  description = "public subnet cidrs"
}

variable "vpc_cidr" {
  type        = "string"
  description = "describe your variable"
}

variable "enable_vpn" {
  description = "True/False value for enabling VPN gateway to VPC"
  default     = false
}

variable "propagate_private_route_tables_vgw" {
  description = "True/False value for propagating private route tables with vgw routes"
  default     = true
}

variable "vpc_tgw_subnets" {
  type        = "list"
  description = "Subnets for transit gateway connectivity"
}



# ======================================================
# Archivo original: vpc.tf
# Carpeta: C:\Users\asus\cloned_repos\serverlessmike\terraform\modules\cloudops
# ======================================================

// Create A VPC with multi AZ private and public subnets

data "aws_availability_zones" "default" {}

module "vpc" {
  // Use the comminity VPC module with a pinned revision number
  source          = "git::https://github.com/terraform-aws-modules/terraform-aws-vpc.git?ref=f7a874cb2c74815d301608c3fe6eadf02cc57be5"
  name            = "${var.project_name}-${var.module_instance_id}"
  cidr            = "${var.vpc_cidr}"
  private_subnets = "${var.private_subnets}"
  public_subnets  = "${var.public_subnets}"
  azs             = ["eu-west-1a", "eu-west-1b", "eu-west-1c"]

  // enable nat gateway
  enable_nat_gateway = "true"

  // This sets the search domain in DHCP options
  enable_dns_support   = true
  enable_dns_hostnames = true
  enable_s3_endpoint   = true

  enable_vpn_gateway                 = "${var.enable_vpn}"
  propagate_private_route_tables_vgw = "${var.propagate_private_route_tables_vgw}"

  tags {
    Name         = "${var.environment}-${var.project_name}-${var.module_instance_id}"
    repo         = "cloudops-terraform"
    environment  = "${var.environment}"
    terraform    = "true"
    tf_module    = "cloudops"
    project_name = "${var.project_name}"
  }

  public_subnet_tags {
    "type" = "public"
  }

  private_subnet_tags {
    "type" = "private"
  }
}

// dhcp options for Windows 
resource "aws_vpc_dhcp_options" "windoze_dhcp" {
  domain_name          = "hq.river-island.com"
  domain_name_servers  = ["10.150.130.16", "10.229.11.13"]
  ntp_servers          = ["127.0.0.1"]
  netbios_name_servers = ["127.0.0.1"]
  netbios_node_type    = 2

  tags {
    Name         = "windoze_dhcp"
    Name         = "${var.environment}-${var.project_name}-${var.module_instance_id}"
    repo         = "cloudops-terraform"
    environment  = "${var.environment}"
    terraform    = "true"
    tf_module    = "cloudops"
    project_name = "${var.project_name}"
  }
}

resource "aws_vpc_dhcp_options_association" "dhcp_association" {
  vpc_id          = "${module.vpc.vpc_id}"
  dhcp_options_id = "${aws_vpc_dhcp_options.windoze_dhcp.id}"
}

resource "aws_subnet" "tgw" {
  count             = "${length(data.aws_availability_zones.default.names)}"
  availability_zone = "${data.aws_availability_zones.default.names[count.index]}"
  vpc_id            = "${module.vpc.vpc_id}"
  cidr_block        = "${element(var.vpc_tgw_subnets, count.index)}"

  tags {
    "Name" = "Network-${substr(data.aws_availability_zones.default.names[count.index],-1,-1)}"
  }
}

resource "aws_route_table" "tgw" {
  vpc_id = "${module.vpc.vpc_id}"
}

resource "aws_main_route_table_association" "tgw" {
  vpc_id         = "${module.vpc.vpc_id}"
  route_table_id = "${aws_route_table.tgw.id}"
}

resource "aws_sns_topic" "windows_events" {
  name = "ri-${var.environment}-windows-events"
}




# ======================================================
# Archivo fusionado: modules\stateful-ec2\cloudstateful-ec2.tf
# Piezas Terraform en carpeta: 53
# Tiene arquitectura (EC2/Docker/Serverless): True
# ======================================================



# ======================================================
# Archivo original: asg.tf
# Carpeta: C:\Users\asus\cloned_repos\serverlessmike\terraform\modules\stateful-ec2
# ======================================================

# Creates Windows Server 2019 instances in auto-scaling groups
# based on Amazon's images
# The instances are based on a template and each ASG is given its own customisable security group
# As an instance boots it is able to customise its config using a script it collects from a bucket (if required)

resource "aws_launch_template" "stateful_templates" {
  count = "${length(var.products)}"
  name  = "lt_${element(var.products,count.index)}_${var.environment}"

  monitoring {
    enabled = true
  }

  instance_type          = "${element(var.instance_types,count.index)}"
  description            = "Template for creating stateful Windows Server instances"
  image_id               = "${element(data.aws_ami.win2019.*.id,count.index)}"
  key_name               = "${element(aws_key_pair.default.*.key_name,count.index)}"
  vpc_security_group_ids = ["${element(aws_security_group.win_ec2.*.id,count.index)}"]

  tags = {
    Name        = "${element(var.products,count.index)}_${var.environment}"
    owner       = "${element(var.owners,count.index)}"
    type        = "stateful"
    repo        = "cloudops-terraform"
    product     = "${element(var.products,count.index)}"
    terraform   = true
    environment = "${var.environment}"
  }

  placement {
    availability_zone = "${data.aws_availability_zones.available.names[0]}"
  }

  user_data = "${base64encode(data.template_file.userdata.rendered)}"

  iam_instance_profile {
    name = "${aws_iam_instance_profile.win_profile.name}"
  }

  tag_specifications {
    resource_type = "volume"

    tags = {
      Name        = "${element(var.products,count.index)}-C-drive"
      drive       = "C"
      owner       = "${element(var.owners,count.index)}"
      type        = "OS"
      repo        = "cloudops-terraform"
      product     = "${element(var.products,count.index)}"
      terraform   = true
      environment = "${var.environment}"
    }
  }
}

resource "aws_autoscaling_group" "win2019_servers" {
  count               = "${length(var.products)}"
  name                = "${element(var.products,count.index)}_${var.environment}"
  min_size            = "${element(var.min_size,count.index)}"
  desired_capacity    = "${element(var.des_size,count.index)}"
  max_size            = "${element(var.max_size,count.index)}"
  health_check_type   = "EC2"
  vpc_zone_identifier = ["${split(",",element(var.is_public,count.index) ? var.public_subnet_ids : var.private_subnet_ids)}"]
  enabled_metrics     = ["GroupDesiredCapacity", "GroupInServiceCapacity", "GroupMinSize", "GroupMaxSize", "GroupInServiceInstances", "GroupTotalCapacity", "GroupTotalInstances"]

  tags = [
    {
      key                 = "Name"
      value               = "${element(var.products,count.index)}-${var.environment}"
      propagate_at_launch = true
    },
    {
      key                 = "product"
      value               = "${element(var.products,count.index)}"
      propagate_at_launch = true
    },
    {
      key                 = "environment"
      value               = "${var.environment}"
      propagate_at_launch = true
    },
    {
      key                 = "terraform"
      value               = true
      propagate_at_launch = true
    },
    {
      key                 = "repo"
      value               = "cloudops-terraform"
      propagate_at_launch = true
    },
    {
      key                 = "type"
      value               = "stateful"
      propagate_at_launch = true
    },
    {
      key                 = "owner"
      value               = "${element(var.owners,count.index)}"
      propagate_at_launch = true
    },
    {
      key                 = "custom"
      value               = "${element(var.customisation_scripts,count.index)}"
      propagate_at_launch = true
    },
  ]

  launch_template {
    id      = "${element(aws_launch_template.stateful_templates.*.id,count.index)}"
    version = "$Latest"
  }
}

resource "aws_security_group" "win_ec2" {
  count       = "${length(var.products)}"
  name        = "${element(var.products,count.index)}"
  description = "Default security group for Windows stateful EC2 instances"
  vpc_id      = "${data.aws_subnet.selected.vpc_id}"

  tags {
    owner       = "${element(var.owners,count.index)}"
    terraform   = "true"
    repo        = "cloudops-terraform"
    environment = "${var.environment}"
    product     = "${element(var.products,count.index)}"
  }
}

# Upload the customisation script to a bucket
resource "aws_s3_bucket_object" "object" {
  count  = "${length(var.products)}"
  bucket = "ri-enterprise"
  key    = "${var.environment}/${element(var.customisation_scripts,count.index)}"
  source = "${path.module}/scripts/${var.environment}/${element(var.customisation_scripts,count.index)}"
  etag   = "${filemd5("${path.module}/scripts/${var.environment}/${element(var.customisation_scripts,count.index)}")}"

  tags {
    owner       = "${element(var.owners,count.index)}"
    terraform   = "true"
    repo        = "cloudops-terraform"
    type        = "Powershell"
    environment = "${var.environment}"
    product     = "${element(var.products,count.index)}"
  }
}



# ======================================================
# Archivo original: data.tf
# Carpeta: C:\Users\asus\cloned_repos\serverlessmike\terraform\modules\stateful-ec2
# ======================================================

# Data Sources used by the other terraform scripts

data "aws_availability_zones" "available" {
  state = "available"
}

# Get a list of Windows Server 2019 AMIs

data "aws_ami" "win2019" {
  # The next line is a little misleading as the owner is actually 801119661308,
  # but the image owner alias is "amazon".
  count = "${length(var.ami_versions)}"

  owners = ["amazon"]

  filter {
    name   = "name"
    values = ["Windows_Server-2019-English-Full-${element(var.ami_versions,count.index)}"]
  }
}

# To get a list of possible versions -
# $ aws ec2 describe-images --owners 'amazon' | awk '/"Name": "Windows_Server-2019-English-Full-Base/ {print substr($0,60,10)}'|sort -n

data "template_file" "userdata" {
  template = "${file("${path.module}/userdata.tpl")}"
}

# Get the VPC ID
data "aws_subnet" "selected" {
  id = "${element(split(",",var.private_subnet_ids),0)}"
}



# ======================================================
# Archivo original: dlm.tf
# Carpeta: C:\Users\asus\cloned_repos\serverlessmike\terraform\modules\stateful-ec2
# ======================================================

# Create a "Data Lifecycle Manager Policy"
# Note that every instance has a policy, even in development

resource "aws_iam_role" "dlm_lifecycle_role" {
  name = "dlm_lifecycle_role"

  tags = {
    owner       = "cloudops"
    type        = "RIManaged"
    repo        = "cloudops-terraform"
    product     = "all-stateful"
    terraform   = true
    environment = "${var.environment}"
  }

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "dlm.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

resource "aws_iam_role_policy" "dlm_lifecycle" {
  name = "dlm_lifecycle_policy"
  role = "${aws_iam_role.dlm_lifecycle_role.id}"

  policy = <<EOF
{
   "Version": "2012-10-17",
   "Statement": [
      {
         "Effect": "Allow",
         "Action": [
            "ec2:CreateSnapshot",
            "ec2:CreateSnapshots",
            "ec2:DeleteSnapshot",
            "ec2:DescribeInstances",
            "ec2:DescribeVolumes",
            "ec2:DescribeSnapshots"
         ],
         "Resource": "*"
      },
      {
         "Effect": "Allow",
         "Action": [
            "ec2:CreateTags"
         ],
         "Resource": "arn:aws:ec2:*::snapshot/*"
      }
   ]
}
EOF
}

resource "aws_dlm_lifecycle_policy" "dlm" {
  count              = "${length(var.products)}"
  description        = "${element(var.products,count.index)} DLM lifecycle policy ${var.environment}"
  execution_role_arn = "${aws_iam_role.dlm_lifecycle_role.arn}"
  state              = "ENABLED"

  policy_details {
    resource_types = ["VOLUME"]

    schedule {
      name = "${element(var.products,count.index)} ${var.environment}"

      create_rule {
        interval      = "${element(var.backup_intervals,count.index)}"
        interval_unit = "HOURS"
        times         = ["${element(var.backup_start_times,count.index)}"]
      }

      retain_rule {
        count = "${element(var.backups_retained,count.index)}"
      }

      copy_tags = true
    }

    target_tags = {
      product = "${element(var.products,count.index)}"
    }
  }
}



# ======================================================
# Archivo original: iam.tf
# Carpeta: C:\Users\asus\cloned_repos\serverlessmike\terraform\modules\stateful-ec2
# ======================================================

# This terraform allows us to assign a limited set of allowed actions to the instances

resource "aws_iam_instance_profile" "win_profile" {
  name = "win_profile"
  role = "${aws_iam_role.win_role.name}"
}

resource "aws_iam_role" "win_role" {
  name = "stateful_ec2_role"
  path = "/"

  assume_role_policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Action": "sts:AssumeRole",
            "Principal": {
               "Service": "ec2.amazonaws.com"
            },
            "Effect": "Allow",
            "Sid": ""
        }
    ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "enterprise_roles_attachments" {
  role       = "${aws_iam_role.win_role.name}"
  policy_arn = "${aws_iam_policy.enterprise_ec2_policy.arn}"
}

resource "aws_iam_policy" "enterprise_ec2_policy" {
  name   = "Allow_AWS_Access_to_EC2s"
  path   = "/"
  policy = "${data.aws_iam_policy_document.enterprise_ec2_policy.json}"
}

data "aws_iam_policy_document" "enterprise_ec2_policy" {
  statement {
    sid = "ListObjectsInBucket"

    actions = [
      "s3:ListBucket",
    ]

    resources = [
      "arn:aws:s3:::ri-enterprise",
    ]
  }

  statement {
    sid = "AllowObjectActions"

    actions = [
      "s3:*Object",
    ]

    resources = [
      "arn:aws:s3:::ri-enterprise/*",
    ]
  }

  statement {
    sid = "AllowCloudWatching"

    actions = [
      "cloudwatch:*",
    ]

    resources = [
      "*",
    ]
  }

  statement {
    sid = "AllowSnapshotting"

    actions = [
      "ec2:DescribeInstances",
      "ec2:DescribeSnapshots",
      "ec2:DescribeVolumes",
      "ec2:DescribeAvailabilityZones",
      "ec2:DescribeTags",
      "ec2:CreateVolume",
      "ec2:CreateTags",
      "ec2:AttachVolume",
      "ec2:DetachVolume",
    ]

    resources = [
      "*",
    ]
  }
}



# ======================================================
# Archivo original: keys.tf
# Carpeta: C:\Users\asus\cloned_repos\serverlessmike\terraform\modules\stateful-ec2
# ======================================================

# Produces a key pair per environment for each product

resource "aws_key_pair" "default" {
  count      = "${length(var.products)}"
  key_name   = "${element(var.products,count.index)}_${var.environment}"
  public_key = "${file("${path.root}/keys/${element(var.products,count.index)}_${var.environment}.pub")}"
}



# ======================================================
# Archivo original: outputs.tf
# Carpeta: C:\Users\asus\cloned_repos\serverlessmike\terraform\modules\stateful-ec2
# ======================================================

output "stateful_asg_ids" {
  value       = "${aws_autoscaling_group.win2019_servers.*.id}"
  description = "The autoscaling group ids"
}

output "stateful_asg_arns" {
  value       = "${aws_autoscaling_group.win2019_servers.*.arn}"
  description = "The ARNs for the autoscaling groups"
}



# ======================================================
# Archivo original: security_rules.tf
# Carpeta: C:\Users\asus\cloned_repos\serverlessmike\terraform\modules\stateful-ec2
# ======================================================

# Every instance gets its own (minimal) security group
# Add rules to the security group by adding the product to the appropriate list

data "aws_security_groups" "allow_1433" {
  depends_on = ["aws_security_group.win_ec2"]

  filter {
    name   = "group-name"
    values = ["${var.allow_1433_in}"]
  }
}

resource "aws_security_group_rule" "sql_server_ingress" {
  count             = "${length(var.allow_1433_in)}"
  type              = "ingress"
  from_port         = "1433"
  to_port           = "1433"
  protocol          = "tcp"
  cidr_blocks       = ["10.0.0.0/8"]
  security_group_id = "${element(data.aws_security_groups.allow_1433.ids,count.index)}"
}

data "aws_security_groups" "allow_1434" {
  depends_on = ["aws_security_group.win_ec2"]

  filter {
    name   = "group-name"
    values = ["${var.allow_1434_in}"]
  }
}

resource "aws_security_group_rule" "sql_server_admin_ingress" {
  count             = "${length(var.allow_1434_in)}"
  type              = "ingress"
  from_port         = "1434"
  to_port           = "1434"
  protocol          = "tcp"
  cidr_blocks       = ["10.0.0.0/8"]
  security_group_id = "${element(data.aws_security_groups.allow_1434.ids,count.index)}"
}

resource "aws_security_group_rule" "allow_all_outbound" {
  count             = "${length(var.products)}"
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = "${element(aws_security_group.win_ec2.*.id,count.index)}"
}

resource "aws_security_group_rule" "allow_ping_in" {
  count             = "${length(var.products)}"
  type              = "ingress"
  from_port         = -1
  to_port           = -1
  protocol          = "icmp"
  cidr_blocks       = ["10.0.0.0/8"]
  security_group_id = "${element(aws_security_group.win_ec2.*.id,count.index)}"
}

data "aws_security_groups" "allow_rdp" {
  depends_on = ["aws_security_group.win_ec2"]

  filter {
    name   = "group-name"
    values = ["${var.allow_rdp_in}"]
  }
}

resource "aws_security_group_rule" "allow_rdp_inbound" {
  # RDP
  count             = "${length(var.products)}"
  type              = "ingress"
  from_port         = 3389
  to_port           = 3389
  protocol          = "tcp"
  cidr_blocks       = ["10.0.0.0/8"]
  security_group_id = "${element(data.aws_security_groups.allow_rdp.ids,count.index)}"
}

data "aws_security_groups" "allow_ssh" {
  depends_on = ["aws_security_group.win_ec2"]

  filter {
    name   = "group-name"
    values = ["${var.allow_ssh_in}"]
  }
}

resource "aws_security_group_rule" "allow_ssh_inbound" {
  # RDP
  count             = "${length(var.products)}"
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["10.0.0.0/8"]
  security_group_id = "${element(data.aws_security_groups.allow_ssh.ids,count.index)}"
}



# ======================================================
# Archivo original: variables.tf
# Carpeta: C:\Users\asus\cloned_repos\serverlessmike\terraform\modules\stateful-ec2
# ======================================================

variable "environment" {
  description = "Environment in which to build"
  type        = "string"
}

variable "private_subnet_ids" {
  description = "Private subnet IDs"
  type        = "string"
}

variable "public_subnet_ids" {
  description = "Public subnet IDs"
  type        = "string"
}

variable "is_public" {
  description = "List of booleans to show if the servers are publicly accessible"
  type        = "list"
}

variable "products" {
  description = "Names of products"
  type        = "list"
}

variable "ami_versions" {
  description = "Version of Windows Server 2019 required by each product"
  type        = "list"
}

variable "owners" {
  description = "Owners of each server being started"
  type        = "list"
}

variable "instance_types" {
  description = "instance type to be started"
  type        = "list"
}

variable "min_size" {
  description = "The minimum size of the auto scale group"
  type        = "list"
}

variable "des_size" {
  description = "The number of instances that should be ruinning in the auto scale group"
  type        = "list"
}

variable "max_size" {
  description = "The maximum size of the auto scale group"
  type        = "list"
}

variable "customisation_scripts" {
  description = "Names of the customisation scripts to run"
  type        = "list"
}

variable "backup_intervals" {
  description = "Number of hours between backups"
  type        = "list"
}

variable "backups_retained" {
  description = "Number of backups of a volume to keep"
  type        = "list"
}

variable "backup_start_times" {
  description = "Start time in hh:mm format for backups"
  type        = "list"
}

variable "allow_1433_in" {
  type        = "list"
  description = "List of products that allow 1433 TCP (SQL Server) inbound"
}

variable "allow_1434_in" {
  type        = "list"
  description = "List of products that allow 1434 TCP (SQL Server) inbound"
}

variable "allow_rdp_in" {
  type        = "list"
  description = "List of products that allow RDP inbound"
}

variable "allow_ssh_in" {
  type        = "list"
  description = "List of products that allow SSH inbound"
}




# ======================================================
# Archivo fusionado: modules\windows-ec2\cloudwindows-ec2.tf
# Piezas Terraform en carpeta: 64
# Tiene arquitectura (EC2/Docker/Serverless): True
# ======================================================



# ======================================================
# Archivo original: asg.tf
# Carpeta: C:\Users\asus\cloned_repos\serverlessmike\terraform\modules\windows-ec2
# ======================================================

# Creates Windows Server instances in auto-scaling groups
# based on Amazon's images
# The instances are based on a template and each ASG is given its own customisable security group
# As an instance boots it is able to customise its config using a script it collects from a bucket (if required)

resource "aws_launch_template" "win_templates" {
  name = "${var.product}_${var.environment}"

  monitoring {
    enabled = true
  }

  instance_type          = "${var.instance_type}"
  description            = "Template for ${var.product}"
  image_id               = "${data.aws_ami.windows_server.id}"
  key_name               = "${aws_key_pair.defaults.key_name}"
  vpc_security_group_ids = ["${aws_security_group.win_default_sg.id}"]

  tags = {
    Name        = "${var.product}_${var.environment}"
    owner       = "${var.owner}"
    type        = "stateful"
    repo        = "cloudops-terraform"
    product     = "${var.product}"
    terraform   = true
    environment = "${var.environment}"
  }

  placement {
    availability_zone = "${data.aws_availability_zones.available.names[0]}"
  }

  user_data = "${base64encode(data.template_file.user_data.rendered)}"

  iam_instance_profile {
    name = "${aws_iam_instance_profile.win_ec2_profile.name}"
  }

  tag_specifications {
    resource_type = "volume"

    tags = {
      Name        = "${var.product}-C-drive"
      drive       = "C"
      owner       = "${var.owner}"
      type        = "OS"
      repo        = "cloudops-terraform"
      product     = "${var.product}"
      terraform   = true
      environment = "${var.environment}"
    }
  }
}

resource "aws_autoscaling_group" "win_servers" {
  name                = "${var.product}"
  min_size            = "${var.min_size}"
  desired_capacity    = "${var.des_size}"
  max_size            = "${var.max_size}"
  health_check_type   = "EC2"
  vpc_zone_identifier = ["${split(",",var.is_public ? var.public_subnet_ids : var.private_subnet_ids)}"]
  target_group_arns   = ["${aws_lb_target_group.secure_shell.arn}", "${aws_lb_target_group.rdp.arn}"]
  enabled_metrics     = ["GroupDesiredCapacity", "GroupInServiceCapacity", "GroupMinSize", "GroupMaxSize", "GroupInServiceInstances", "GroupTotalCapacity", "GroupTotalInstances"]

  tags = [
    {
      key                 = "Name"
      value               = "${var.product}-${var.environment}"
      propagate_at_launch = true
    },
    {
      key                 = "product"
      value               = "${var.product}"
      propagate_at_launch = true
    },
    {
      key                 = "environment"
      value               = "${var.environment}"
      propagate_at_launch = true
    },
    {
      key                 = "terraform"
      value               = true
      propagate_at_launch = true
    },
    {
      key                 = "repo"
      value               = "cloudops-terraform"
      propagate_at_launch = true
    },
    {
      key                 = "type"
      value               = "stateful"
      propagate_at_launch = true
    },
    {
      key                 = "owner"
      value               = "${var.owner}"
      propagate_at_launch = true
    },
    {
      key                 = "custom"
      value               = "${var.customisation_script}"
      propagate_at_launch = true
    },
  ]

  launch_template {
    id      = "${aws_launch_template.win_templates.id}"
    version = "$Latest"
  }
}

resource "aws_security_group" "win_default_sg" {
  name        = "${var.product}_${var.environment}"
  description = "Default security group for ${var.product}"
  vpc_id      = "${data.aws_subnet.mine.vpc_id}"

  tags {
    owner       = "${var.owner}"
    terraform   = "true"
    repo        = "cloudops-terraform"
    environment = "${var.environment}"
    product     = "${var.product}"
  }
}

# Upload the customisation script to a bucket
resource "aws_s3_bucket_object" "ec2_object" {
  bucket = "ri-enterprise"
  key    = "${var.environment}/${var.customisation_script}"
  source = "${path.root}/scripts/${var.customisation_script}"
  etag   = "${filemd5("${path.root}/scripts/${var.customisation_script}")}"

  tags {
    owner       = "${var.owner}"
    terraform   = "true"
    repo        = "cloudops-terraform"
    type        = "Powershell"
    environment = "${var.environment}"
    product     = "${var.product}"
  }
}

resource "aws_autoscaling_notification" "scaling_event" {
  group_names = ["${aws_autoscaling_group.win_servers.name}"]

  notifications = [
    "autoscaling:EC2_INSTANCE_LAUNCH",
    "autoscaling:EC2_INSTANCE_TERMINATE",
    "autoscaling:EC2_INSTANCE_LAUNCH_ERROR",
    "autoscaling:EC2_INSTANCE_TERMINATE_ERROR",
  ]

  topic_arn = "${var.topic_arn}"
}



# ======================================================
# Archivo original: data.tf
# Carpeta: C:\Users\asus\cloned_repos\serverlessmike\terraform\modules\windows-ec2
# ======================================================

# Data Sources used by the other terraform scripts

data "aws_availability_zones" "available" {
  state = "available"
}

# Get a list of Windows Server 2016 or 2019 AMIs

data "aws_ami" "windows_server" {
  # The next line is a little misleading as the owner is actually 801119661308,
  # but the image owner alias is "amazon".
  owners = ["amazon"]

  filter {
    name   = "name"
    values = ["Windows_Server-${var.os_version}-English-Full-${var.ami_version}"]
  }
}

# To get a list of possible 2019 versions -
# $ aws ec2 describe-images --owners 'amazon' | awk '/"Name": "Windows_Server-2019-English-Full-/ {print substr($0,55)}'|sort -n

# Get the user data file details

data "template_file" "user_data" {
  template = "${file("${path.module}/userdata.tpl")}"
}

# Get the VPC ID

data "aws_subnet" "mine" {
  id = "${element(split(",",var.private_subnet_ids),0)}"
}



# ======================================================
# Archivo original: dlm.tf
# Carpeta: C:\Users\asus\cloned_repos\serverlessmike\terraform\modules\windows-ec2
# ======================================================

# Create a "Data Lifecycle Manager Policy"
# Note that backups are optional, in order to turn them off just set backups_retained to zero

resource "aws_iam_role" "dlm_role" {
  count = "${var.backups_retained > 0 ? 1 : 0}"
  name  = "dlm_role"

  tags = {
    owner       = "cloudops"
    type        = "RIManaged"
    repo        = "cloudops-terraform"
    product     = "all-stateful"
    terraform   = true
    environment = "${var.environment}"
  }

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "dlm.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

resource "aws_iam_role_policy" "dlm_policy" {
  count = "${var.backups_retained > 0 ? 1 : 0}"
  name  = "dlm_policy"
  role  = "${aws_iam_role.dlm_role.id}"

  policy = <<EOF
{
   "Version": "2012-10-17",
   "Statement": [
      {
         "Effect": "Allow",
         "Action": [
            "ec2:CreateSnapshot",
            "ec2:CreateSnapshots",
            "ec2:DeleteSnapshot",
            "ec2:DescribeInstances",
            "ec2:DescribeVolumes",
            "ec2:DescribeSnapshots"
         ],
         "Resource": "*"
      },
      {
         "Effect": "Allow",
         "Action": [
            "ec2:CreateTags"
         ],
         "Resource": "arn:aws:ec2:*::snapshot/*"
      }
   ]
}
EOF
}

resource "aws_dlm_lifecycle_policy" "dlm_lf_policy" {
  count              = "${var.backups_retained > 0 ? 1 : 0}"
  description        = "${var.product} DLM lifecycle policy in ${var.environment}"
  execution_role_arn = "${aws_iam_role.dlm_role.arn}"
  state              = "ENABLED"

  policy_details {
    resource_types = ["VOLUME"]

    schedule {
      name = "${var.product}_${var.environment}"

      create_rule {
        interval      = "${var.backup_interval}"
        interval_unit = "HOURS"
        times         = ["${var.backup_start_time}"]
      }

      retain_rule {
        count = "${var.backups_retained}"
      }

      copy_tags = true
    }

    target_tags = {
      product = "${var.product}"
    }
  }
}



# ======================================================
# Archivo original: ebs.tf
# Carpeta: C:\Users\asus\cloned_repos\serverlessmike\terraform\modules\windows-ec2
# ======================================================

locals {
  volume_sizes  = ["${compact(list(var.d_volume,var.e_volume,var.f_volume))}"]
  drive_letters = ["D", "E", "F"]
}

resource "aws_ebs_volume" "win_drives" {
  count             = "${length(local.volume_sizes)}"
  availability_zone = "${data.aws_availability_zones.available.names[0]}"

  size = "${element(local.volume_sizes,count.index)}"

  tags = {
    environment = "${var.environment}"
    drive       = "${element(local.drive_letters,count.index)}"
    terraform   = true
    product     = "${var.product}"
    owner       = "${var.owner}"
    repo        = "cloudops-terraform"
    Name        = "${var.product}-${element(local.drive_letters,count.index)}-drive"
  }
}



# ======================================================
# Archivo original: iam.tf
# Carpeta: C:\Users\asus\cloned_repos\serverlessmike\terraform\modules\windows-ec2
# ======================================================

# This terraform allows us to assign a limited set of allowed actions to the instances

resource "aws_iam_instance_profile" "win_ec2_profile" {
  name = "win_ec2_profile_${var.product}"
  role = "${aws_iam_role.win_ec2_role.name}"
}

resource "aws_iam_role" "win_ec2_role" {
  name = "win_ec2_role_${var.product}"
  path = "/"

  assume_role_policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Action": "sts:AssumeRole",
            "Principal": {
               "Service": "ec2.amazonaws.com"
            },
            "Effect": "Allow",
            "Sid": ""
        }
    ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "enterprise_role_attachment" {
  role       = "${aws_iam_role.win_ec2_role.name}"
  policy_arn = "${aws_iam_policy.enterprise_ec2_policy.arn}"
}

resource "aws_iam_policy" "enterprise_ec2_policy" {
  name   = "Allow_Access_to_EC2s_${var.product}"
  path   = "/"
  policy = "${data.aws_iam_policy_document.enterprise_ec2_policy_doc.json}"
}

data "aws_iam_policy_document" "enterprise_ec2_policy_doc" {
  statement {
    sid = "ListObjectsInBucket"

    actions = [
      "s3:ListBucket",
    ]

    resources = [
      "arn:aws:s3:::ri-enterprise",
    ]
  }

  statement {
    sid = "AllowObjectActions"

    actions = [
      "s3:*Object",
    ]

    resources = [
      "arn:aws:s3:::ri-enterprise/*",
    ]
  }

  statement {
    sid = "AllowCloudWatching"

    actions = [
      "cloudwatch:*",
    ]

    resources = [
      "*",
    ]
  }

  statement {
    sid = "AllowSnapshotting"

    actions = [
      "ec2:DescribeInstances",
      "ec2:DescribeSnapshots",
      "ec2:DescribeVolumes",
      "ec2:DescribeAvailabilityZones",
      "ec2:DescribeTags",
      "ec2:CreateVolume",
      "ec2:CreateTags",
      "ec2:AttachVolume",
      "ec2:DetachVolume",
    ]

    resources = [
      "*",
    ]
  }
}



# ======================================================
# Archivo original: keys.tf
# Carpeta: C:\Users\asus\cloned_repos\serverlessmike\terraform\modules\windows-ec2
# ======================================================

# Produces a key pair per environment for each product

resource "aws_key_pair" "defaults" {
  key_name   = "${var.product}_${var.environment}"
  public_key = "${file("${path.root}/keys/${var.product}_${var.environment}.pub")}"
}



# ======================================================
# Archivo original: lb.tf
# Carpeta: C:\Users\asus\cloned_repos\serverlessmike\terraform\modules\windows-ec2
# ======================================================

# Create a new load balancer
resource "aws_lb" "win" {
  name               = "${var.product}${count.index}"
  load_balancer_type = "network"
  internal           = true
  subnets            = ["${split(",",var.private_subnet_ids)}"]

  tags {
    Name        = "${var.product}${count.index}"
    product     = "${var.product}"
    environment = "${var.environment}"
    terraform   = true
    repo        = "cloudops-terraform"
  }
}

resource "aws_lb_target_group" "secure_shell" {
  name     = "${var.product}-ssh"
  port     = "22"
  protocol = "TCP"
  vpc_id   = "${data.aws_subnet.mine.vpc_id}"
}

resource "aws_lb_listener" "secure_shell" {
  load_balancer_arn = "${aws_lb.win.arn}"
  port              = "22"
  protocol          = "TCP"

  default_action {
    type             = "forward"
    target_group_arn = "${aws_lb_target_group.secure_shell.arn}"
  }
}

resource "aws_lb_target_group" "rdp" {
  name     = "${var.product}-rdp"
  port     = "3389"
  protocol = "TCP"
  vpc_id   = "${data.aws_subnet.mine.vpc_id}"
}

resource "aws_lb_listener" "rdp" {
  load_balancer_arn = "${aws_lb.win.arn}"
  port              = "3389"
  protocol          = "TCP"

  default_action {
    type             = "forward"
    target_group_arn = "${aws_lb_target_group.rdp.arn}"
  }
}

resource "aws_route53_record" "lb_a_record" {
  zone_id = "${var.zone_id}"
  name    = "${var.product}"
  type    = "A"

  alias {
    name                   = "${aws_lb.win.dns_name}"
    zone_id                = "${aws_lb.win.zone_id}"
    evaluate_target_health = true
  }
}



# ======================================================
# Archivo original: security_rules.tf
# Carpeta: C:\Users\asus\cloned_repos\serverlessmike\terraform\modules\windows-ec2
# ======================================================

# Add TCP, UDP and ping rules into the security group

resource "aws_security_group_rule" "all_tcp_ports_inbound" {
  count             = "${length(var.tcp_in)}"
  type              = "ingress"
  from_port         = "${element(var.tcp_in,count.index)}"
  to_port           = "${element(var.tcp_in,count.index)}"
  protocol          = "tcp"
  cidr_blocks       = ["10.0.0.0/8", "193.105.212.250/32", "80.168.1.186/32", "63.32.42.222/32", "52.212.191.233/32", "63.35.129.51/32"]
  security_group_id = "${aws_security_group.win_default_sg.id}"
}

resource "aws_security_group_rule" "all_udp_ports_inbound" {
  count             = "${length(var.udp_in)}"
  type              = "ingress"
  from_port         = "${length(var.udp_in) > 0 ? element(var.udp_in,count.index) : "0"}"
  to_port           = "${length(var.udp_in) > 0 ? element(var.udp_in,count.index) : "0"}"
  protocol          = "udp"
  cidr_blocks       = ["10.0.0.0/8", "193.105.212.250/32", "80.168.1.186/32", "63.32.42.222/32", "52.212.191.233/32", "63.35.129.51/32"]
  security_group_id = "${aws_security_group.win_default_sg.id}"
}

resource "aws_security_group_rule" "all_tcp_ports_outbound" {
  count             = "${length(var.tcp_out)}"
  type              = "egress"
  from_port         = "${element(var.tcp_out,count.index)}"
  to_port           = "${element(var.tcp_out,count.index)}"
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = "${aws_security_group.win_default_sg.id}"
}

resource "aws_security_group_rule" "all_udp_ports_outbound" {
  count             = "${length(var.udp_out)}"
  type              = "egress"
  from_port         = "${length(var.udp_out) > 0 ? element(var.udp_out,count.index) : "0"}"
  to_port           = "${length(var.udp_out) > 0 ? element(var.udp_out,count.index) : "0"}"
  protocol          = "udp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = "${aws_security_group.win_default_sg.id}"
}

resource "aws_security_group_rule" "allow_pings_inbound" {
  type              = "ingress"
  from_port         = -1
  to_port           = -1
  protocol          = "icmp"
  cidr_blocks       = ["10.0.0.0/8"]
  security_group_id = "${aws_security_group.win_default_sg.id}"
}

resource "aws_security_group_rule" "allow_pings_outbound" {
  type              = "egress"
  from_port         = -1
  to_port           = -1
  protocol          = "icmp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = "${aws_security_group.win_default_sg.id}"
}



# ======================================================
# Archivo original: variables.tf
# Carpeta: C:\Users\asus\cloned_repos\serverlessmike\terraform\modules\windows-ec2
# ======================================================

variable "environment" {
  description = "Environment in which to build"
  type        = "string"
}

variable "private_subnet_ids" {
  description = "Private subnet IDs"
  type        = "string"
}

variable "public_subnet_ids" {
  description = "Public subnet IDs"
  type        = "string"
}

variable "is_public" {
  description = "boolean to show if the server is publicly accessible"
  type        = "string"
  default     = false
}

variable "product" {
  description = "Names of product"
  type        = "string"
}

variable "ami_version" {
  description = "Version of Windows Server required"
  type        = "string"
}

variable "os_version" {
  description = "Version of Windows Server required (2016 or 2019)"
  default     = "2019"
  type        = "string"
}

variable "owner" {
  description = "Owner of server being started"
  type        = "string"
}

variable "instance_type" {
  description = "instance type to be started"
  type        = "string"
}

variable "min_size" {
  description = "The minimum size of the auto scale group"
  type        = "string"
  default     = "1"
}

variable "des_size" {
  description = "The number of instances that should be running in the auto scale group"
  type        = "string"
  default     = "1"
}

variable "max_size" {
  description = "The maximum size of the auto scale group"
  default     = "1"
  type        = "string"
}

variable "customisation_script" {
  description = "Names of the customisation scripts to run"
  type        = "string"
}

variable "backup_interval" {
  description = "Number of hours between backups"
  type        = "string"
  default     = "24"
}

variable "backups_retained" {
  description = "Number of backups of a volume to keep"
  type        = "string"
  default     = "0"
}

variable "backup_start_time" {
  description = "Start time in hh:mm format for backups"
  type        = "string"
  default     = "00:00"
}

variable "tcp_in" {
  description = "List of TCPs port to open inbound"
  type        = "list"
  default     = []
}

variable "udp_in" {
  description = "List of UDPs port to open inbound"
  type        = "list"
  default     = []
}

variable "tcp_out" {
  description = "List of TCPs port to open outbound"
  type        = "list"
  default     = []
}

variable "udp_out" {
  description = "List of UDPs port to open outbound"
  type        = "list"
  default     = []
}

variable "d_volume" {
  description = "Unformatted size in GB of D volume"
  type        = "string"
  default     = ""
}

variable "e_volume" {
  description = "Unformatted size in GB of E volume"
  type        = "string"
  default     = ""
}

variable "f_volume" {
  description = "Unformatted size in GB of F volume"
  type        = "string"
  default     = ""
}

variable "zone_id" {
  description = "Route 53 zone in which to build"
  type        = "string"
}

variable "topic_arn" {
  description = "Topic to send Windows events to"
  type        = "string"
}


