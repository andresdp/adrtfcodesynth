# ======================================================
# Archivo fusionado (MENOR, con arquitectura): modules\windows-ec2\test\cloudtest.tf
# Piezas Terraform en carpeta: 3
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


