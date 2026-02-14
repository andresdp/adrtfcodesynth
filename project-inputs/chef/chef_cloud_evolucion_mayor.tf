

# ======================================================
# Archivo fusionado: components\automate-cli\pkg\testfiles\cloudtestfiles.tf
# Piezas Terraform en carpeta: 0
# Tiene arquitectura (EC2/Docker/Serverless): True
# ======================================================



# ======================================================
# Archivo original: a2ha_habitat.auto.tfvars
# Carpeta: C:\Users\asus\cloned_repos\chef\automate\components\automate-cli\pkg\testfiles
# ======================================================

hab_sup_http_gateway_auth_token = "M+W20H+Q8Htd8GJdq5ytqL26/S2DRg0zeLmpGL9z3ik="
hab_sup_ring_key = "SYM-SEC-1\nautomate-20230306082218\n\n9rqIxZlOHjCrs7wwrxtJn+V+4KajDdNus/0bDA=" 


# ======================================================
# Archivo original: aws.auto.tfvars
# Carpeta: C:\Users\asus\cloned_repos\chef\automate\components\automate-cli\pkg\testfiles
# ======================================================

# AWS
################################################################################
aws_profile = "default"
aws_region  = "us-west-1"
aws_vpc_id  = "vpc-6fafdtj09"
aws_cidr_block_addr  = "172.31.0.0"
private_custom_subnets = []
public_custom_subnets  = []
aws_tags    = {
        X-Contact = ""
	X-Dept = ""
	X-Project = ""
	X-Customer = ""
	X-Production = ""
}

aws_ssh_key_pair_name = "abc"


 backup_config_s3 = "true"

aws_s3_bucketName = "bucket"

setup_managed_services = false
managed_opensearch_domain_name = " "
managed_opensearch_domain_url = " "
managed_opensearch_username = " "
managed_opensearch_user_password = " "
managed_opensearch_certificate = <<-EOT

EOT
aws_os_snapshot_role_arn = " "
os_snapshot_user_access_key_id = " "
os_snapshot_user_access_key_secret = " "
managed_rds_instance_url = " "
managed_rds_superuser_username = " "
managed_rds_superuser_password = " "
managed_rds_dbuser_username = " "
managed_rds_dbuser_password = " "
managed_rds_certificate = <<-EOT

EOT
aws_ami_id = "ami-061534684251"
lb_access_logs = "false"
automate_lb_certificate_arn = "arn:aws:acm:us-west-1:11275563:certificate/1a0995"
chef_server_lb_certificate_arn = "arn:aws:acm:us-west-1:112563:certificate/1a0a3d6995"

delete_on_termination = "true"

automate_server_instance_type = "t3.medium"

automate_ebs_volume_iops = "100"

automate_ebs_volume_size = "50"

automate_ebs_volume_type = "gp3"

chef_server_instance_type = "t3.medium"

chef_ebs_volume_size = "50"

chef_ebs_volume_type = "gp3"

opensearch_server_instance_type = "m5.large"

opensearch_ebs_volume_iops = "100"

opensearch_ebs_volume_size = "50"

opensearch_ebs_volume_type = "gp3"

postgresql_server_instance_type = "t3.medium"

postgresql_ebs_volume_iops = "100"

postgresql_ebs_volume_size = "50"

postgresql_ebs_volume_type = "gp3"




# Common
################################################################################
automate_config_file = "/hab/a2_deploy_workspace/configs/automate.toml"
automate_instance_count = 1
chef_server_instance_count = 1
opensearch_instance_count = 3

automate_root_ca = <<-EOT

EOT

opensearch_root_ca = <<-EOT

EOT

postgresql_root_ca = <<-EOT

EOT

automate_private_key = <<-EOT

EOT

chef_server_private_key = <<-EOT

EOT

opensearch_admin_key = <<-EOT

EOT

opensearch_private_key = <<-EOT

EOT

postgresql_private_key = <<-EOT

EOT

automate_public_key = <<-EOT

EOT

chef_server_public_key = <<-EOT

EOT

opensearch_public_key = <<-EOT

EOT

opensearch_admin_cert = <<-EOT

EOT

postgresql_public_key = <<-EOT

EOT

automate_custom_certs_enabled = false
chef_server_custom_certs_enabled = false
postgresql_custom_certs_enabled = false
opensearch_custom_certs_enabled = false

opensearch_admin_dn = ""
opensearch_nodes_dn = ""

automate_certs_by_ip = {}
chef_server_certs_by_ip = {}
postgresql_certs_by_ip = {}
opensearch_certs_by_ip = {}

nfs_mount_path = "/mnt/automate_backups"
postgresql_instance_count = 3
postgresql_archive_disk_fs_path = "/mnt/automate_backups/postgresql"

habitat_uid_gid = ""
ssh_user = "ubuntu"
ssh_port = "22"
ssh_key_file = "/home/ubuntu/abc.pem"

tag_project = ""


# ======================================================
# Archivo original: terraform.tfvars
# Carpeta: C:\Users\asus\cloned_repos\chef\automate\components\automate-cli\pkg\testfiles
# ======================================================

backup_config_s3 = "true"
# Existing nodes
################################################################################
existing_automate_private_ips = ["10.1.0.101"]
existing_chef_server_private_ips = ["10.1.0.102"]
existing_opensearch_private_ips = ["10.1.0.103", "10.1.1.104", "10.1.2.104"]
existing_postgresql_private_ips = ["10.1.0.105", "10.1.1.106", "10.1.2.107"]
setup_managed_services = "false"
setup_self_managed_services = "false"
managed_opensearch_domain_name = ""
managed_opensearch_domain_url = ""
managed_opensearch_username = ""
managed_opensearch_user_password = ""
managed_opensearch_certificate  = <<-EOT
EOT
aws_os_snapshot_role_arn = " "
os_snapshot_user_access_key_id = " "
os_snapshot_user_access_key_secret = " "
managed_rds_instance_url = ""
managed_rds_superuser_username = ""
managed_rds_superuser_password = ""
managed_rds_dbuser_username = ""
managed_rds_dbuser_password = ""
managed_rds_certificate  = <<-EOT
EOT
postgresql_root_cert = <<-EOT
EOT
opensearch_root_cert = <<-EOT
EOT
# Common
################################################################################
automate_admin_password = "chefautomate"
automate_config_file = "/hab/a2_deploy_workspace/configs/automate.toml"
automate_fqdn = "A2-9548100b-automate-lb-1013582932.ap-south-1.elb.amazonaws.com" # leave commented out for AWS, othewise must be assigned
automate_instance_count = 1
chef_server_instance_count = 1
opensearch_instance_count = 3
automate_root_ca = <<-EOT
-----START-----
MIIEDzCCAvegAwIBAgIBADANBgkqhkiG9w0BAQUFADBoMQswCQYDVQQGEwJVUzEl
MCMGA1UEChMcU3RhcmZpZWxkIFRlY2hub2xvZ2llcywgSW5jLjEyMDAGA1UECxMp
eruix/U0F47ZEUD0/CwqTRV/p2JdLiXTAAsgGh1o+Re49L2L7ShZ3U0WixeDyLJl
xy16paq8U4Zt3VekyvggQQto8PT7dL5WXXp59fkdheMtlb71cZBDzI0fmgAKhynp
VSJYACPq4xJDKVtHCN2MQWplBqjlIapBtJUhlbl90TSrE9atvNziPTnNvT51cKEY
WQPJIrSPnNVeKtelttQKbfi3QBFGmh95DmK/D5fs4C8fF5Q=
-----END-----
EOT
opensearch_root_ca = <<-EOT
-----START-----
MIIDQjCCAioCCQCY6unlpgYfsTANBgkqhkiG9w0BAQsFADBjMQswCQYDVQQGEwJV
UzETMBEGA1UECAwKV2FzaGluZ3RvbjEQMA4GA1UEBwwHU2VhdHRsZTEaMBgGA1UE
CgwRQ2hlZiBTb2Z0d2FyZSBJbmMxETAPBgNVBAMMCHByb2dyZXNzMB4XDTIyMTEw
DWvLPsLlfQB2MQl4/oeTHxpjmc/7njK+surbRLznGPQmy1gHML0nVzDSey949YNb
CNoh2WWpCTrNQypFSdzNA4RVcnDwpgULH90+zyHGNLBkarddi1WP1fabq7MnM9lw
7VbwQVw4sIOgs0jYff/gNolVypnjgkWJJBoMcqhCOGGKYj4afuP1x0ibxd2XfwOr
K15v3u9n2qgsXcR7Og2xWeTKpKxg8A==
-----END-----
EOT
postgresql_root_ca = <<-EOT
-----START-----
MIIDQjCCAioCCQCY6unlpgYfsTANBgkqhkiG9w0BAQsFADBjMQswCQYDVQQGEwJV
UzETMBEGA1UECAwKV2FzaGluZ3RvbjEQMA4GA1UEBwwHU2VhdHRsZTEaMBgGA1UE
CgwRQ2hlZiBTb2Z0d2FyZSBJbmMxETAPBgNVBAMMCHByb2dyZXNzMB4XDTIyMTEw
DWvLPsLlfQB2MQl4/oeTHxpjmc/7njK+surbRLznGPQmy1gHML0nVzDSey949YNb
CNoh2WWpCTrNQypFSdzNA4RVcnDwpgULH90+zyHGNLBkarddi1WP1fabq7MnM9lw
7VbwQVw4sIOgs0jYff/gNolVypnjgkWJJBoMcqhCOGGKYj4afuP1x0ibxd2XfwOr
K15v3u9n2qgsXcR7Og2xWeTKpKxg8A==
-----END-----
EOT
automate_private_key = <<-EOT
-----START-----
MIIEvwIBADANBgkqhkiG9w0BAQEFAASCBKkwggSlAgEAAoIBAQCzanmNSWM8/rEe
ev2e1SttSsDeb2ujywHhkk1EzT2I2vHJ3YW56MAPgTGbLEjD1UP/BUIbX1EY76No
BOKnt5GgdKukzw2lBadXL/eF0yg8TNdmgRg1BsYZfFLWZyZ5FE2oqqKyOTWi2M5i
PbTvxWvIP4K8K8b1wnxLcFuN5OtJ21q+1MccprdfVOTMXg3d9ne2LDBkIPYshL+2
P3PKJm6ElG3IIcsi6fLFsF6bq96Qxzzn5udfE4Z1bueNL+NBBq7fDTObMp22SM2V
iQdBwzbguMtS1gTOyZjOCFx422LbMEALxjluVvL6znO0BkfTEUi6GjcgtBIlZnJ2
urCQJEZnCKVZwY0T8xc2Si17HDgbYBxgLGsJYWU4TQKBgQDUUr0wMccyAVdcWDSu
INgIogAUUe55Rb+PUZEg4GJfaBYj46W3pquJ1i760DBXWWybrbNP2i/mGhSOxpND
h5icuS3RCp1/M6zyvC7sd2RJOrneD6dpzXwofkxTcXEZJ4QicdpJGJxu/q0JeGd+
1oJBPS3l70y308n9UeYTsMjaYQ==
-----END-----
EOT
chef_server_private_key = <<-EOT
-----START-----
MIIEvwIBADANBgkqhkiG9w0BAQEFAASCBKkwggSlAgEAAoIBAQCzanmNSWM8/rEe
ev2e1SttSsDeb2ujywHhkk1EzT2I2vHJ3YW56MAPgTGbLEjD1UP/BUIbX1EY76No
BOKnt5GgdKukzw2lBadXL/eF0yg8TNdmgRg1BsYZfFLWZyZ5FE2oqqKyOTWi2M5i
PbTvxWvIP4K8K8b1wnxLcFuN5OtJ21q+1MccprdfVOTMXg3d9ne2LDBkIPYshL+2
hgQ0oX3QuVS3cGdvC0yqVYuQwbxsObEYtwG8mO2pgpOUwGqPlrlKoYx6nBqDo4eq
YvXmWYr7l3Q+TOOdmSxVPv0EoE4BnEC/eL0cj4dx4JwG84fNulbYhgqTdQKBgQC1
P3PKJm6ElG3IIcsi6fLFsF6bq96Qxzzn5udfE4Z1bueNL+NBBq7fDTObMp22SM2V
iQdBwzbguMtS1gTOyZjOCFx422LbMEALxjluVvL6znO0BkfTEUi6GjcgtBIlZnJ2
urCQJEZnCKVZwY0T8xc2Si17HDgbYBxgLGsJYWU4TQKBgQDUUr0wMccyAVdcWDSu
INgIogAUUe55Rb+PUZEg4GJfaBYj46W3pquJ1i760DBXWWybrbNP2i/mGhSOxpND
h5icuS3RCp1/M6zyvC7sd2RJOrneD6dpzXwofkxTcXEZJ4QicdpJGJxu/q0JeGd+
1oJBPS3l70y308n9UeYTsMjaYQ==
-----END-----
EOT
opensearch_admin_key = <<-EOT
-----START-----
MIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQDfRrez3MbQzX2x
ShyAeJPIKNZRJzoYDLxmuTFIFnJlGTM1/DxIWokMxN/zY5xCjp0cqBMp4MkNjLk7
qbBF8AQADyhHCKnRA2+qnj3amvnJBIwepSCy/CT1jKTpgKNe8ULpsOA/chjH9xUY
6iWLNZqHF9TB6GNJuAmJk/vQeOBCcVhIwla7LHLDl1AZqtbrVvOebgBlyIZE6KRc
liHRb5t7CinFyHpJA6N7bEkdt4O1nariz0x9VFJAAKlj8m4IGzYuIPDRTJzlafJ7
ZcHRwhISaehzOx06iWo2ME1Ca3IpBiMlVAy+xRulZwKBgBq43BjPxU55ubPdEHBK
dwFhHD8n8m6XvFNM3ypzd3j/E8pECfBrN1CJM8WG5ElW7JvST9OPpG7NxaFrXn0f
M2U1kP/54OuAjJapsgz76TLI59EtWUY+2VQxYYh914jywTNBcRlSTE7kAplddMSt
YP35CayWktERhGKoqbGTTNtn
-----END-----
EOT
opensearch_private_key = <<-EOT
-----START-----
MIIEvwIBADANBgkqhkiG9w0BAQEFAASCBKkwggSlAgEAAoIBAQCzanmNSWM8/rEe
ev2e1SttSsDeb2ujywHhkk1EzT2I2vHJ3YW56MAPgTGbLEjD1UP/BUIbX1EY76No
BOKnt5GgdKukzw2lBadXL/eF0yg8TNdmgRg1BsYZfFLWZyZ5FE2oqqKyOTWi2M5i
PbTvxWvIP4K8K8b1wnxLcFuN5OtJ21q+1MccprdfVOTMXg3d9ne2LDBkIPYshL+2
iQdBwzbguMtS1gTOyZjOCFx422LbMEALxjluVvL6znO0BkfTEUi6GjcgtBIlZnJ2
urCQJEZnCKVZwY0T8xc2Si17HDgbYBxgLGsJYWU4TQKBgQDUUr0wMccyAVdcWDSu
INgIogAUUe55Rb+PUZEg4GJfaBYj46W3pquJ1i760DBXWWybrbNP2i/mGhSOxpND
h5icuS3RCp1/M6zyvC7sd2RJOrneD6dpzXwofkxTcXEZJ4QicdpJGJxu/q0JeGd+
1oJBPS3l70y308n9UeYTsMjaYQ==
-----END-----
EOT
postgresql_private_key = <<-EOT
-----START-----
MIIEvwIBADANBgkqhkiG9w0BAQEFAASCBKkwggSlAgEAAoIBAQCzanmNSWM8/rEe
ev2e1SttSsDeb2ujywHhkk1EzT2I2vHJ3YW56MAPgTGbLEjD1UP/BUIbX1EY76No
bWMZsMyWMwKBgQDeMy65IzxdTaew4IScHoPMXY98F5D6l+uHW5erfYH//kH4o8qO
hgQ0oX3QuVS3cGdvC0yqVYuQwbxsObEYtwG8mO2pgpOUwGqPlrlKoYx6nBqDo4eq
YvXmWYr7l3Q+TOOdmSxVPv0EoE4BnEC/eL0cj4dx4JwG84fNulbYhgqTdQKBgQC1
P3PKJm6ElG3IIcsi6fLFsF6bq96Qxzzn5udfE4Z1bueNL+NBBq7fDTObMp22SM2V
iQdBwzbguMtS1gTOyZjOCFx422LbMEALxjluVvL6znO0BkfTEUi6GjcgtBIlZnJ2
urCQJEZnCKVZwY0T8xc2Si17HDgbYBxgLGsJYWU4TQKBgQDUUr0wMccyAVdcWDSu
INgIogAUUe55Rb+PUZEg4GJfaBYj46W3pquJ1i760DBXWWybrbNP2i/mGhSOxpND
h5icuS3RCp1/M6zyvC7sd2RJOrneD6dpzXwofkxTcXEZJ4QicdpJGJxu/q0JeGd+
1oJBPS3l70y308n9UeYTsMjaYQ==
-----END-----
EOT
automate_public_key = <<-EOT
-----START-----
MIIDajCCAlKgAwIBAgIJAPHEYb1O7wzoMA0GCSqGSIb3DQEBCwUAMGMxCzAJBgNV
BAYTAlVTMRMwEQYDVQQIDApXYXNoaW5ndG9uMRAwDgYDVQQHDAdTZWF0dGxlMRow
GAYDVQQKDBFDaGVmIFNvZnR3YXJlIEluYzERMA8GA1UEAwwIcHJvZ3Jlc3MwHhcN
sma0aIEmqkebKEu1zu90EJc2tPBKyczEkDhYNq3qDIEJnpurw3/UneLMU78N8Q4G
G++oW+G/tdC3O1YpEOez4WFyolr5me6X/4PuFyJKIzEurcnyVt9Nw8OTNfT7FCLz
+/NFCuciSxtut6LzCWptIv38pPoSxodESP7ZbzoKM0Nh/APJNxa7TIo311bkTJz/
OFfsG3Ck7YUEQKhWvwmnRkF6Y22HLGnastXKArUUwhkoPCKX8leob8vtPPEaCNCS
I2/48tM1RZehjlEb8vM=
-----END-----
EOT
chef_server_public_key = <<-EOT
-----START-----
MIIDajCCAlKgAwIBAgIJAPHEYb1O7wzoMA0GCSqGSIb3DQEBCwUAMGMxCzAJBgNV
BAYTAlVTMRMwEQYDVQQIDApXYXNoaW5ndG9uMRAwDgYDVQQHDAdTZWF0dGxlMRow
GAYDVQQKDBFDaGVmIFNvZnR3YXJlIEluYzERMA8GA1UEAwwIcHJvZ3Jlc3MwHhcN
dFNpxiedGkBWqtwJHYNu+kfbHETujMZAb80JYC3Q0MaBKKz1oAQ8yDu6YXHCjgIa
sma0aIEmqkebKEu1zu90EJc2tPBKyczEkDhYNq3qDIEJnpurw3/UneLMU78N8Q4G
G++oW+G/tdC3O1YpEOez4WFyolr5me6X/4PuFyJKIzEurcnyVt9Nw8OTNfT7FCLz
+/NFCuciSxtut6LzCWptIv38pPoSxodESP7ZbzoKM0Nh/APJNxa7TIo311bkTJz/
OFfsG3Ck7YUEQKhWvwmnRkF6Y22HLGnastXKArUUwhkoPCKX8leob8vtPPEaCNCS
I2/48tM1RZehjlEb8vM=
-----END-----
EOT
opensearch_public_key = <<-EOT
-----START-----
MIIDajCCAlKgAwIBAgIJAPHEYb1O7wzoMA0GCSqGSIb3DQEBCwUAMGMxCzAJBgNV
BAYTAlVTMRMwEQYDVQQIDApXYXNoaW5ndG9uMRAwDgYDVQQHDAdTZWF0dGxlMRow
sma0aIEmqkebKEu1zu90EJc2tPBKyczEkDhYNq3qDIEJnpurw3/UneLMU78N8Q4G
G++oW+G/tdC3O1YpEOez4WFyolr5me6X/4PuFyJKIzEurcnyVt9Nw8OTNfT7FCLz
+/NFCuciSxtut6LzCWptIv38pPoSxodESP7ZbzoKM0Nh/APJNxa7TIo311bkTJz/
OFfsG3Ck7YUEQKhWvwmnRkF6Y22HLGnastXKArUUwhkoPCKX8leob8vtPPEaCNCS
I2/48tM1RZehjlEb8vM=
-----END-----
EOT
opensearch_admin_cert = <<-EOT
-----START-----
MIIDazCCAlOgAwIBAgIJAPHEYb1O7wznMA0GCSqGSIb3DQEBCwUAMGMxCzAJBgNV
BAYTAlVTMRMwEQYDVQQIDApXYXNoaW5ndG9uMRAwDgYDVQQHDAdTZWF0dGxlMRow
QUoHCIPqXdbKxPiCVETs+VuLWzrmpShS93VgOzWBEuPMRQJWEVbCMUgc/XLYfdft
6rvtVqBuLgB/7o3KBCF9LoNPPON3sd49Xhn5aL8Hh3vOHuFphPXzhgkdofy499Fp
8eYa8nXTsAV2NwdySnV0zR9BTNO/7G4lFYYKX45REQS1taRFN3yNOMjeD8TuMSFc
z8zNIe7n62slIsQ5jnkaEI32llgrGXWTrx3bogQQubvz9iJacecRJwXuuIigJSVM
1Vz0Nr1NGEP0guArf7Nz
-----END-----
EOT
postgresql_public_key = <<-EOT
-----START-----
MIIDajCCAlKgAwIBAgIJAPHEYb1O7wzoMA0GCSqGSIb3DQEBCwUAMGMxCzAJBgNV
BAYTAlVTMRMwEQYDVQQIDApXYXNoaW5ndG9uMRAwDgYDVQQHDAdTZWF0dGxlMRow
hXIQE/2dUfwC3YZvQlB8NOGoLIAq2MRZZW/efPtsUnf6VMtUUSGGYKaKd0xLJ3YO
l5JX+bjhfauAZqYmaRhkvwPzrWPMhw/wnlkJ4WcNN6OWRwIDAQABoyEwHzAdBgNV
HSUEFjAUBggrBgEFBQcDAgYIKwYBBQUHAwEwDQYJKoZIhvcNAQELBQADggEBALB9
dFNpxiedGkBWqtwJHYNu+kfbHETujMZAb80JYC3Q0MaBKKz1oAQ8yDu6YXHCjgIa
sma0aIEmqkebKEu1zu90EJc2tPBKyczEkDhYNq3qDIEJnpurw3/UneLMU78N8Q4G
G++oW+G/tdC3O1YpEOez4WFyolr5me6X/4PuFyJKIzEurcnyVt9Nw8OTNfT7FCLz
+/NFCuciSxtut6LzCWptIv38pPoSxodESP7ZbzoKM0Nh/APJNxa7TIo311bkTJz/
OFfsG3Ck7YUEQKhWvwmnRkF6Y22HLGnastXKArUUwhkoPCKX8leob8vtPPEaCNCS
I2/48tM1RZehjlEb8vM=
-----END-----
EOT
automate_custom_certs_enabled = true
chef_server_custom_certs_enabled = true
postgresql_custom_certs_enabled = true
opensearch_custom_certs_enabled = true
opensearch_admin_dn = "CN=chefadmin,O=Chef Software Inc,L=Seattle,ST=Washington,C=US"
opensearch_nodes_dn = "CN=chefnode,O=Chef Software Inc,L=Seattle,ST=Washington,C=US"
automate_certs_by_ip = {  "10.1.0.108" = { private_key = <<-EOT
-----START-----
MIIEvwIBADANBgkqhkiG9w0BAQEFAASCBKkwggSlAgEAAoIBAQCzanmNSWM8/rEe
ev2e1SttSsDeb2ujywHhkk1EzT2I2vHJ3YW56MAPgTGbLEjD1UP/BUIbX1EY76No
RMyJRaCbwi6sOhV2JUdi3m3XIM+MNXrIl5XPWzOk9p2hMjIE+VqpwKNBT7gfucxu
2RjhksDH7p7mbFap0jkUZJ+KKS/KVTEmkXpAW+zZVEWsmFoye2YhxPOw7uQRpkpw
bWMZsMyWMwKBgQDeMy65IzxdTaew4IScHoPMXY98F5D6l+uHW5erfYH//kH4o8qO
hgQ0oX3QuVS3cGdvC0yqVYuQwbxsObEYtwG8mO2pgpOUwGqPlrlKoYx6nBqDo4eq
YvXmWYr7l3Q+TOOdmSxVPv0EoE4BnEC/eL0cj4dx4JwG84fNulbYhgqTdQKBgQC1
P3PKJm6ElG3IIcsi6fLFsF6bq96Qxzzn5udfE4Z1bueNL+NBBq7fDTObMp22SM2V
iQdBwzbguMtS1gTOyZjOCFx422LbMEALxjluVvL6znO0BkfTEUi6GjcgtBIlZnJ2
urCQJEZnCKVZwY0T8xc2Si17HDgbYBxgLGsJYWU4TQKBgQDUUr0wMccyAVdcWDSu
INgIogAUUe55Rb+PUZEg4GJfaBYj46W3pquJ1i760DBXWWybrbNP2i/mGhSOxpND
h5icuS3RCp1/M6zyvC7sd2RJOrneD6dpzXwofkxTcXEZJ4QicdpJGJxu/q0JeGd+
1oJBPS3l70y308n9UeYTsMjaYQ==
-----END-----
EOT
 public_key = <<-EOT
-----START-----
MIIDajCCAlKgAwIBAgIJAPHEYb1O7wzoMA0GCSqGSIb3DQEBCwUAMGMxCzAJBgNV
BAYTAlVTMRMwEQYDVQQIDApXYXNoaW5ndG9uMRAwDgYDVQQHDAdTZWF0dGxlMRow
HSUEFjAUBggrBgEFBQcDAgYIKwYBBQUHAwEwDQYJKoZIhvcNAQELBQADggEBALB9
dFNpxiedGkBWqtwJHYNu+kfbHETujMZAb80JYC3Q0MaBKKz1oAQ8yDu6YXHCjgIa
sma0aIEmqkebKEu1zu90EJc2tPBKyczEkDhYNq3qDIEJnpurw3/UneLMU78N8Q4G
G++oW+G/tdC3O1YpEOez4WFyolr5me6X/4PuFyJKIzEurcnyVt9Nw8OTNfT7FCLz
+/NFCuciSxtut6LzCWptIv38pPoSxodESP7ZbzoKM0Nh/APJNxa7TIo311bkTJz/
OFfsG3Ck7YUEQKhWvwmnRkF6Y22HLGnastXKArUUwhkoPCKX8leob8vtPPEaCNCS
I2/48tM1RZehjlEb8vM=
-----END-----
EOT
 }  }
chef_server_certs_by_ip = {  "10.1.0.14" = { private_key = <<-EOT
-----START-----
MIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQC1yT32Ii+EUIAe
FZQbOxzGduI4I6NDicF0VTa22hW++Fdn7lrgq/CirwjlQNKXsImG+9zlQHVIuna3
blXEu7TsLqAb08eAA1PEWhLmasCNUq8SPP8xfndviTFwvNUTneE4WkJ/uQKBgF6V
AUuNLWgBclV6TzYlm10Wo/FHcBSHyl1SOcgkTAdeCKRIm1Jd+T+LIUFcvtPOPMNG
4UAvlM496ruqJnhAAkXuHmdN1KW7zbNw/FW7PnHPQM7RTzkdgHmh3PQHRojZnTN6
ABNejk5jj31GwRc7Qm5JYALhq/GNs8YPsmIATiD7AoGAJQ1N36pQgYy5Jy5I0aIq
p3nGfRWBLYqftL2oyDQGeyRQX9/hF8hh6AwbET/CAPoV+e4EjOI9VeJVjWYZ1raB
CHBWACozIc+2fQQngj5PsH6PwP+sq47BcA8mEorJcYRelKZF1NJp9KSrcaDSo8MJ
w/qTq+SCthUyjrVT50EN34k=
-----END-----
EOT
 public_key = <<-EOT
-----START-----
MIIDajCCAlKgAwIBAgIJAPHEYb1O7wzqMA0GCSqGSIb3DQEBCwUAMGMxCzAJBgNV
BAYTAlVTMRMwEQYDVQQIDApXYXNoaW5ndG9uMRAwDgYDVQQHDAdTZWF0dGxlMRow
QIzkWVvgj5JgtfHpmZ8XPBYLfl5ZcL5AxtM24TCvhwmghQIDAQABoyEwHzAdBgNV
HSUEFjAUBggrBgEFBQcDAgYIKwYBBQUHAwEwDQYJKoZIhvcNAQELBQADggEBAH1a
5ER8bgk1E3600ak0y01E9Li3GbECwshLlx9OH4NesBuFYFuzI5gYd+pKQVnFsRiP
X8CJ0GLWrbfuOk27mIKkKFsuT44WQQMXWb4uf0h7oRENG8ASeiZHw9BmMUCPpufh
6WA1WxtHm4Bq+l3910YMaNZFZi953BUXF6OWfrMYelqlGEDR4UIkFGw5cmHBQJbN
Uw4+ATYf15lE3CQsKDknuRSJYun7M4+Wc8JKArtTPgVJ/la3Y1tpaKf36UL3qkxK
d0XhuTq+G0/vyjRCjAESDkF2Djw2Eb7VFnDPQCfRkKjjgIWjps0/kBVP6T4flQGj
H1gSOzLaGWbedZotMWU=
-----END-----
EOT
 }  }
postgresql_certs_by_ip = {  "10.1.0.101" = { private_key = <<-EOT
-----START-----
MIIEvwIBADANBgkqhkiG9w0BAQEFAASCBKkwggSlAgEAAoIBAQCzanmNSWM8/rEe
ev2e1SttSsDeb2ujywHhkk1EzT2I2vHJ3YW56MAPgTGbLEjD1UP/BUIbX1EY76No
BOKnt5GgdKukzw2lBadXL/eF0yg8TNdmgRg1BsYZfFLWZyZ5FE2oqqKyOTWi2M5i
PbTvxWvIP4K8K8b1wnxLcFuN5OtJ21q+1MccprdfVOTMXg3d9ne2LDBkIPYshL+2
2RjhksDH7p7mbFap0jkUZJ+KKS/KVTEmkXpAW+zZVEWsmFoye2YhxPOw7uQRpkpw
bWMZsMyWMwKBgQDeMy65IzxdTaew4IScHoPMXY98F5D6l+uHW5erfYH//kH4o8qO
hgQ0oX3QuVS3cGdvC0yqVYuQwbxsObEYtwG8mO2pgpOUwGqPlrlKoYx6nBqDo4eq
YvXmWYr7l3Q+TOOdmSxVPv0EoE4BnEC/eL0cj4dx4JwG84fNulbYhgqTdQKBgQC1
P3PKJm6ElG3IIcsi6fLFsF6bq96Qxzzn5udfE4Z1bueNL+NBBq7fDTObMp22SM2V
iQdBwzbguMtS1gTOyZjOCFx422LbMEALxjluVvL6znO0BkfTEUi6GjcgtBIlZnJ2
urCQJEZnCKVZwY0T8xc2Si17HDgbYBxgLGsJYWU4TQKBgQDUUr0wMccyAVdcWDSu
INgIogAUUe55Rb+PUZEg4GJfaBYj46W3pquJ1i760DBXWWybrbNP2i/mGhSOxpND
h5icuS3RCp1/M6zyvC7sd2RJOrneD6dpzXwofkxTcXEZJ4QicdpJGJxu/q0JeGd+
1oJBPS3l70y308n9UeYTsMjaYQ==
-----END-----
EOT
 public_key = <<-EOT
-----START-----
MIIDajCCAlKgAwIBAgIJAPHEYb1O7wzoMA0GCSqGSIb3DQEBCwUAMGMxCzAJBgNV
BAYTAlVTMRMwEQYDVQQIDApXYXNoaW5ndG9uMRAwDgYDVQQHDAdTZWF0dGxlMRow
GAYDVQQKDBFDaGVmIFNvZnR3YXJlIEluYzERMA8GA1UEAwwIcHJvZ3Jlc3MwHhcN
dFNpxiedGkBWqtwJHYNu+kfbHETujMZAb80JYC3Q0MaBKKz1oAQ8yDu6YXHCjgIa
sma0aIEmqkebKEu1zu90EJc2tPBKyczEkDhYNq3qDIEJnpurw3/UneLMU78N8Q4G
G++oW+G/tdC3O1YpEOez4WFyolr5me6X/4PuFyJKIzEurcnyVt9Nw8OTNfT7FCLz
+/NFCuciSxtut6LzCWptIv38pPoSxodESP7ZbzoKM0Nh/APJNxa7TIo311bkTJz/
OFfsG3Ck7YUEQKhWvwmnRkF6Y22HLGnastXKArUUwhkoPCKX8leob8vtPPEaCNCS
I2/48tM1RZehjlEb8vM=
-----END-----
EOT
 }
  "10.1.1.237" = { private_key = <<-EOT
-----START-----
MIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQC9l8i69P2WE00y
PD4zbWX+qEib095Snjrjs4PA6posCPpdRkI5zlc5ApOb5uFc7mJnomMtqJ1TQigQ
94iOC5Gyu+9NOpeLWrRYjMfhX2v3f/yskMhZ+Pdn/wLSZ2VfpAF81c9I8KhQZNpW
IsFffvZQiLUCgYA0C2uf21XaXGb4LHkXvBnD0MbVORNfQkMB03QQxns4ttwxKbLj
MQraLF8BG+RppMe7t8pIiqp7yCVU+cgoBFGNgGpG/8zI6XGEGuA5azffaAYEWfOK
DVK4Lmw+RSU+UBgPekN92UvPDlAuQtMkw78IPTvkOIf6mdhjeD9cPh0hEQKBgDuG
GgO2IQRw6z76GIzsJQbKXnGMjw4cgcx5Lcj7TbE9bvis5oivvi0j6uIH55iHaWpJ
JDY5yNo/zqrBEs4/0uUXiE6bQLV+hoGM4DB/D8rQxtsEjTWWlpe0gCtV/2MoSCiU
MPDvEqUsuMH1TtrZKvYM0TVaYZlko3kJKusze0iBAoGAFAU4vuLP7oXs21lVbQTX
ZQ+R3WD3Rff4Kjvf7HjseyQf/tKD+k3+mRNWvrna+xvw8O6tjhDjwiSS0bMymGHi
qvSDQj0+NynYBvrWqaCKujyC16psh+4rMisRjzHMa66pMq+BXju28beAEteoayG6
VIu99GxBWQY3QzBiFRm2hMU=
-----END-----
EOT
 public_key = <<-EOT
-----START-----
MIIDajCCAlKgAwIBAgIJAPHEYb1O7wzpMA0GCSqGSIb3DQEBCwUAMGMxCzAJBgNV
BAYTAlVTMRMwEQYDVQQIDApXYXNoaW5ndG9uMRAwDgYDVQQHDAdTZWF0dGxlMRow
GAYDVQQKDBFDaGVmIFNvZnR3YXJlIEluYzERMA8GA1UEAwwIcHJvZ3Jlc3MwHhcN
HSUEFjAUBggrBgEFBQcDAgYIKwYBBQUHAwEwDQYJKoZIhvcNAQELBQADggEBAICL
j41rGqCTn3el+jnWWU40/YasNv5VdhFzHr7/t6YZQWb9MWV+22QcdqHoG+zt3zWO
Ha42TtaWNb42PWK107i3naXQR9XC3blfsawMqMYBP6Gt/p/b12WvMR9ZGdYYVhZl
ser9AsWiwAz7hSHEI6ih4hFsUAuyMdBX+y6lGcIaTj3XI/12R7EbXZl6+JKgSY5c
3h/Wv2VET772sWjwqxWHbzC9NEe4GWtw9j1QMOFniz79D0GiCrW1HzHK1ZaXioe7
LhZIOS8c5KyyrC9jrl88w38cU+nFQOXWvsecIm+HYba06v1515J4hPSADqsruiMf
yyGlcPRD4hI+ENvAWU8=
-----END-----
EOT
 }
  "10.1.2.21" = { private_key = <<-EOT
-----START-----
MIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQC1yT32Ii+EUIAe
FZQbOxzGduI4I6NDicF0VTa22hW++Fdn7lrgq/CirwjlQNKXsImG+9zlQHVIuna3
eixWmWYgICUZ/kLYtdtuDiAvRpkj3zy1WeApgPgyuLUSb+woscCPn/FOuUH+I9I3
rAI2VYXU7P9j3T+LzMy5xZqISiPi5AAo81MY9OJoeR+yDnqZRfw5O4nDGsTERG69
ZfXa4S8jc9K+VjvOQdS/Ihj4hLovj5ROcYUltsTQQLbqgi4NL5jynNZegCP1mmOb
6hzksNiElwKBgQCO7xG9GKaoVXAiO+WK0Lybu19xi3H90lVo7jJ1MpAoLAuw2LoY
KM9RFhUht74fGPwTa+SGKp/HumrVltze9sge58hHDZCeo2y91Ui7oJHvGo8obD88
blXEu7TsLqAb08eAA1PEWhLmasCNUq8SPP8xfndviTFwvNUTneE4WkJ/uQKBgF6V
AUuNLWgBclV6TzYlm10Wo/FHcBSHyl1SOcgkTAdeCKRIm1Jd+T+LIUFcvtPOPMNG
4UAvlM496ruqJnhAAkXuHmdN1KW7zbNw/FW7PnHPQM7RTzkdgHmh3PQHRojZnTN6
ABNejk5jj31GwRc7Qm5JYALhq/GNs8YPsmIATiD7AoGAJQ1N36pQgYy5Jy5I0aIq
p3nGfRWBLYqftL2oyDQGeyRQX9/hF8hh6AwbET/CAPoV+e4EjOI9VeJVjWYZ1raB
CHBWACozIc+2fQQngj5PsH6PwP+sq47BcA8mEorJcYRelKZF1NJp9KSrcaDSo8MJ
w/qTq+SCthUyjrVT50EN34k=
-----END-----
EOT
 public_key = <<-EOT
-----START-----
MIIDajCCAlKgAwIBAgIJAPHEYb1O7wzqMA0GCSqGSIb3DQEBCwUAMGMxCzAJBgNV
BAYTAlVTMRMwEQYDVQQIDApXYXNoaW5ndG9uMRAwDgYDVQQHDAdTZWF0dGxlMRow
GAYDVQQKDBFDaGVmIFNvZnR3YXJlIEluYzERMA8GA1UEAwwIcHJvZ3Jlc3MwHhcN
HSUEFjAUBggrBgEFBQcDAgYIKwYBBQUHAwEwDQYJKoZIhvcNAQELBQADggEBAH1a
5ER8bgk1E3600ak0y01E9Li3GbECwshLlx9OH4NesBuFYFuzI5gYd+pKQVnFsRiP
X8CJ0GLWrbfuOk27mIKkKFsuT44WQQMXWb4uf0h7oRENG8ASeiZHw9BmMUCPpufh
6WA1WxtHm4Bq+l3910YMaNZFZi953BUXF6OWfrMYelqlGEDR4UIkFGw5cmHBQJbN
Uw4+ATYf15lE3CQsKDknuRSJYun7M4+Wc8JKArtTPgVJ/la3Y1tpaKf36UL3qkxK
d0XhuTq+G0/vyjRCjAESDkF2Djw2Eb7VFnDPQCfRkKjjgIWjps0/kBVP6T4flQGj
H1gSOzLaGWbedZotMWU=
-----END-----
EOT
 }  }
opensearch_certs_by_ip = {  "10.1.0.221" = { private_key = <<-EOT
-----START-----
MIIEvwIBADANBgkqhkiG9w0BAQEFAASCBKkwggSlAgEAAoIBAQCzanmNSWM8/rEe
ev2e1SttSsDeb2ujywHhkk1EzT2I2vHJ3YW56MAPgTGbLEjD1UP/BUIbX1EY76No
BOKnt5GgdKukzw2lBadXL/eF0yg8TNdmgRg1BsYZfFLWZyZ5FE2oqqKyOTWi2M5i
PbTvxWvIP4K8K8b1wnxLcFuN5OtJ21q+1MccprdfVOTMXg3d9ne2LDBkIPYshL+2
b7NPQ3DPuS6FL6zwlLOJmyi7/AGFchAT/Z1R/ALdhm9CUHw04agsgCrYxFllb958
+2xSd/pUy1RRIYZgpop3TEsndg6Xklf5uOF9q4BmpiZpGGS/A/OtY8yHD/CeWQnh
FTOPHQKHpLehCms3ST5r3FOjnQKBgQDH7TfkMTncu4+3Z4TTFOeaMG5+ZRfHSZMo
RMyJRaCbwi6sOhV2JUdi3m3XIM+MNXrIl5XPWzOk9p2hMjIE+VqpwKNBT7gfucxu
2RjhksDH7p7mbFap0jkUZJ+KKS/KVTEmkXpAW+zZVEWsmFoye2YhxPOw7uQRpkpw
bWMZsMyWMwKBgQDeMy65IzxdTaew4IScHoPMXY98F5D6l+uHW5erfYH//kH4o8qO
hgQ0oX3QuVS3cGdvC0yqVYuQwbxsObEYtwG8mO2pgpOUwGqPlrlKoYx6nBqDo4eq
YvXmWYr7l3Q+TOOdmSxVPv0EoE4BnEC/eL0cj4dx4JwG84fNulbYhgqTdQKBgQC1
P3PKJm6ElG3IIcsi6fLFsF6bq96Qxzzn5udfE4Z1bueNL+NBBq7fDTObMp22SM2V
iQdBwzbguMtS1gTOyZjOCFx422LbMEALxjluVvL6znO0BkfTEUi6GjcgtBIlZnJ2
urCQJEZnCKVZwY0T8xc2Si17HDgbYBxgLGsJYWU4TQKBgQDUUr0wMccyAVdcWDSu
INgIogAUUe55Rb+PUZEg4GJfaBYj46W3pquJ1i760DBXWWybrbNP2i/mGhSOxpND
h5icuS3RCp1/M6zyvC7sd2RJOrneD6dpzXwofkxTcXEZJ4QicdpJGJxu/q0JeGd+
1oJBPS3l70y308n9UeYTsMjaYQ==
-----END-----
EOT
 public_key = <<-EOT
-----START-----
MIIDajCCAlKgAwIBAgIJAPHEYb1O7wzoMA0GCSqGSIb3DQEBCwUAMGMxCzAJBgNV
BAYTAlVTMRMwEQYDVQQIDApXYXNoaW5ndG9uMRAwDgYDVQQHDAdTZWF0dGxlMRow
GAYDVQQKDBFDaGVmIFNvZnR3YXJlIEluYzERMA8GA1UEAwwIcHJvZ3Jlc3MwHhcN
MjIxMTAzMDU0ODMyWhcNMjUxMTAyMDU0ODMyWjBjMQswCQYDVQQGEwJVUzETMBEG
l5JX+bjhfauAZqYmaRhkvwPzrWPMhw/wnlkJ4WcNN6OWRwIDAQABoyEwHzAdBgNV
HSUEFjAUBggrBgEFBQcDAgYIKwYBBQUHAwEwDQYJKoZIhvcNAQELBQADggEBALB9
dFNpxiedGkBWqtwJHYNu+kfbHETujMZAb80JYC3Q0MaBKKz1oAQ8yDu6YXHCjgIa
sma0aIEmqkebKEu1zu90EJc2tPBKyczEkDhYNq3qDIEJnpurw3/UneLMU78N8Q4G
G++oW+G/tdC3O1YpEOez4WFyolr5me6X/4PuFyJKIzEurcnyVt9Nw8OTNfT7FCLz
+/NFCuciSxtut6LzCWptIv38pPoSxodESP7ZbzoKM0Nh/APJNxa7TIo311bkTJz/
OFfsG3Ck7YUEQKhWvwmnRkF6Y22HLGnastXKArUUwhkoPCKX8leob8vtPPEaCNCS
I2/48tM1RZehjlEb8vM=
-----END-----
EOT
 nodes_dn = "CN=chefnode,O=Chef Software Inc,L=Seattle,ST=Washington,C=US" }
  "10.1.1.38" = { private_key = <<-EOT
-----START-----
MIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQC9l8i69P2WE00y
PD4zbWX+qEib095Snjrjs4PA6posCPpdRkI5zlc5ApOb5uFc7mJnomMtqJ1TQigQ
94iOC5Gyu+9NOpeLWrRYjMfhX2v3f/yskMhZ+Pdn/wLSZ2VfpAF81c9I8KhQZNpW
s9Rr0OkN978RQLVie7WCbtPyuIUFBjkORbxJOE8HzjtCv4qjvmKZAXAe2FBPrDzU
XK7NWJdXSrubLRjoCXjt72bfCS8DD0b6n315UG/VKTQL/mProYIlO3MwO4tQBGpi
THDYwQBNneS2TcYqM+N7wudKV1UCgYEAwc9vPAibZzKqu7FXl95ym0LQVGNQhGum
KxPep2QAkQgkgPcJOnvQV4fVv4bWffPQm00bQrjDnM2lX9gVW8+VBdSfNpUnsQh+
+8UCAGXAomX5OyjN3XQmCEfvT6VgXu1sEXRRdtfAxCnk6wPgdblBuEOnTXn7xkk4
IsFffvZQiLUCgYA0C2uf21XaXGb4LHkXvBnD0MbVORNfQkMB03QQxns4ttwxKbLj
MQraLF8BG+RppMe7t8pIiqp7yCVU+cgoBFGNgGpG/8zI6XGEGuA5azffaAYEWfOK
DVK4Lmw+RSU+UBgPekN92UvPDlAuQtMkw78IPTvkOIf6mdhjeD9cPh0hEQKBgDuG
GgO2IQRw6z76GIzsJQbKXnGMjw4cgcx5Lcj7TbE9bvis5oivvi0j6uIH55iHaWpJ
JDY5yNo/zqrBEs4/0uUXiE6bQLV+hoGM4DB/D8rQxtsEjTWWlpe0gCtV/2MoSCiU
MPDvEqUsuMH1TtrZKvYM0TVaYZlko3kJKusze0iBAoGAFAU4vuLP7oXs21lVbQTX
ZQ+R3WD3Rff4Kjvf7HjseyQf/tKD+k3+mRNWvrna+xvw8O6tjhDjwiSS0bMymGHi
qvSDQj0+NynYBvrWqaCKujyC16psh+4rMisRjzHMa66pMq+BXju28beAEteoayG6
VIu99GxBWQY3QzBiFRm2hMU=
-----END-----
EOT
 public_key = <<-EOT
-----START-----
MIIDajCCAlKgAwIBAgIJAPHEYb1O7wzpMA0GCSqGSIb3DQEBCwUAMGMxCzAJBgNV
BAYTAlVTMRMwEQYDVQQIDApXYXNoaW5ndG9uMRAwDgYDVQQHDAdTZWF0dGxlMRow
GAYDVQQKDBFDaGVmIFNvZnR3YXJlIEluYzERMA8GA1UEAwwIcHJvZ3Jlc3MwHhcN
MjIxMTAzMDU0ODMyWhcNMjUxMTAyMDU0ODMyWjBjMQswCQYDVQQGEwJVUzETMBEG
BQY5DkW8SThPB847Qr+Ko75imQFwHthQT6w81FyuzViXV0q7my0Y6Al47e9m3wkv
Aw9G+p99eVBv1Sk0C/5j66GCJTtzMDuLUARqYlebH6D6HTIiyEuuWlPBdBfRfFbr
EuiI52kRrmj/W8ElRO0HeC86GF2lI4TFK2sO1Emp/oTnGQIDAQABoyEwHzAdBgNV
HSUEFjAUBggrBgEFBQcDAgYIKwYBBQUHAwEwDQYJKoZIhvcNAQELBQADggEBAICL
j41rGqCTn3el+jnWWU40/YasNv5VdhFzHr7/t6YZQWb9MWV+22QcdqHoG+zt3zWO
Ha42TtaWNb42PWK107i3naXQR9XC3blfsawMqMYBP6Gt/p/b12WvMR9ZGdYYVhZl
ser9AsWiwAz7hSHEI6ih4hFsUAuyMdBX+y6lGcIaTj3XI/12R7EbXZl6+JKgSY5c
3h/Wv2VET772sWjwqxWHbzC9NEe4GWtw9j1QMOFniz79D0GiCrW1HzHK1ZaXioe7
LhZIOS8c5KyyrC9jrl88w38cU+nFQOXWvsecIm+HYba06v1515J4hPSADqsruiMf
yyGlcPRD4hI+ENvAWU8=
-----END-----
EOT
 nodes_dn = "CN=chefnode,O=Chef Software Inc,L=Seattle,ST=Washington,C=US" }
  "10.1.2.245" = { private_key = <<-EOT
-----START-----
MIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQC1yT32Ii+EUIAe
FZQbOxzGduI4I6NDicF0VTa22hW++Fdn7lrgq/CirwjlQNKXsImG+9zlQHVIuna3
eixWmWYgICUZ/kLYtdtuDiAvRpkj3zy1WeApgPgyuLUSb+woscCPn/FOuUH+I9I3
rAI2VYXU7P9j3T+LzMy5xZqISiPi5AAo81MY9OJoeR+yDnqZRfw5O4nDGsTERG69
E7eSvSu/hlP9B7RNnzJ1py0Vc+BcKm4qjgR+g+kARwY6loMWyYjB0asMW/akbNTU
ls//BuB/lokXniZgJK7PbipptYzUgXjC8YRXA7SBRFKVRAKL6GTXwklSZxCBJCe+
MRkkGxffjK+G5qBeFUyy13KOVA6C8c+r+zRYtuWm/T9XpgIGWvqbxY1JNR11dBbx
T0254P2oDlCSOeNTt2kHJw1WvVScEVr9xOuCizs+JQKBgQDtDgYJ916DWz6hhPYD
0vVg5AINmPBUnB/Kiay8X0r8UlOTtcA04ek1VtMkcKvMojAFO/1Rfhujm0PDlKFS
ZfXa4S8jc9K+VjvOQdS/Ihj4hLovj5ROcYUltsTQQLbqgi4NL5jynNZegCP1mmOb
6hzksNiElwKBgQCO7xG9GKaoVXAiO+WK0Lybu19xi3H90lVo7jJ1MpAoLAuw2LoY
KM9RFhUht74fGPwTa+SGKp/HumrVltze9sge58hHDZCeo2y91Ui7oJHvGo8obD88
blXEu7TsLqAb08eAA1PEWhLmasCNUq8SPP8xfndviTFwvNUTneE4WkJ/uQKBgF6V
AUuNLWgBclV6TzYlm10Wo/FHcBSHyl1SOcgkTAdeCKRIm1Jd+T+LIUFcvtPOPMNG
4UAvlM496ruqJnhAAkXuHmdN1KW7zbNw/FW7PnHPQM7RTzkdgHmh3PQHRojZnTN6
ABNejk5jj31GwRc7Qm5JYALhq/GNs8YPsmIATiD7AoGAJQ1N36pQgYy5Jy5I0aIq
p3nGfRWBLYqftL2oyDQGeyRQX9/hF8hh6AwbET/CAPoV+e4EjOI9VeJVjWYZ1raB
CHBWACozIc+2fQQngj5PsH6PwP+sq47BcA8mEorJcYRelKZF1NJp9KSrcaDSo8MJ
w/qTq+SCthUyjrVT50EN34k=
-----END-----
EOT
 public_key = <<-EOT
-----START-----
MIIDajCCAlKgAwIBAgIJAPHEYb1O7wzqMA0GCSqGSIb3DQEBCwUAMGMxCzAJBgNV
BAYTAlVTMRMwEQYDVQQIDApXYXNoaW5ndG9uMRAwDgYDVQQHDAdTZWF0dGxlMRow
GAYDVQQKDBFDaGVmIFNvZnR3YXJlIEluYzERMA8GA1UEAwwIcHJvZ3Jlc3MwHhcN
MjIxMTAzMDU0ODMzWhcNMjUxMTAyMDU0ODMzWjBjMQswCQYDVQQGEwJVUzETMBEG
A1UECAwKV2FzaGluZ3RvbjEQMA4GA1UEBwwHU2VhdHRsZTEaMBgGA1UECgwRQ2hl
I988tVngKYD4Mri1Em/sKLHAj5/xTrlB/iPSN6wCNlWF1Oz/Y90/i8zMucWaiEoj
4uQAKPNTGPTiaHkfsg56mUX8OTuJwxrExERuvXitLPMmZSRKKcikXicp5yqlFYaA
MdSFR+1VTDNwclVMvpmzoxhOby8r4P5YLfzEVDJ4wK1Qpki7vjtjnZiipvrWmJJM
QIzkWVvgj5JgtfHpmZ8XPBYLfl5ZcL5AxtM24TCvhwmghQIDAQABoyEwHzAdBgNV
HSUEFjAUBggrBgEFBQcDAgYIKwYBBQUHAwEwDQYJKoZIhvcNAQELBQADggEBAH1a
5ER8bgk1E3600ak0y01E9Li3GbECwshLlx9OH4NesBuFYFuzI5gYd+pKQVnFsRiP
X8CJ0GLWrbfuOk27mIKkKFsuT44WQQMXWb4uf0h7oRENG8ASeiZHw9BmMUCPpufh
6WA1WxtHm4Bq+l3910YMaNZFZi953BUXF6OWfrMYelqlGEDR4UIkFGw5cmHBQJbN
Uw4+ATYf15lE3CQsKDknuRSJYun7M4+Wc8JKArtTPgVJ/la3Y1tpaKf36UL3qkxK
d0XhuTq+G0/vyjRCjAESDkF2Djw2Eb7VFnDPQCfRkKjjgIWjps0/kBVP6T4flQGj
H1gSOzLaGWbedZotMWU=
-----END-----
EOT
 nodes_dn = "CN=testnode,O=Chef Software Inc,L=Bangalore,ST=India,C=IN" }  }
nfs_mount_path = "/mnt/automate_backups"
postgresql_instance_count = 3
postgresql_archive_disk_fs_path = "/mnt/automate_backups/postgresql"
habitat_uid_gid = ""
ssh_user = "ec2-user"
ssh_port = "22"
ssh_key_file = "/home/ec2-user/A2HA.pem"
# ObjectStorage
################################################################################
bucket_name = "a2ha-test-bucket"
access_key = "test-access-key"
secret_key = "test-secret-key"
endpoint = "s3.amazonaws.com"
region = "ap-south-1"
location = "s3"
google_service_account_file = "/hab/a2_deploy_workspace/googleServiceAccount.json"




# ======================================================
# Archivo fusionado: components\automate-cluster-ctl\spec\fixtures\cloudfixtures.tf
# Piezas Terraform en carpeta: 0
# Tiene arquitectura (EC2/Docker/Serverless): False
# ======================================================



# ======================================================
# Archivo original: invalid_aib.tfvars
# Carpeta: C:\Users\asus\cloned_repos\chef\automate\components\automate-cluster-ctl\spec\fixtures
# ======================================================

bad content of tfvar file so won't parse




# ======================================================
# Archivo fusionado: terraform\test-environments\scenarios\vars\cloudvars.tf
# Piezas Terraform en carpeta: 0
# Tiene arquitectura (EC2/Docker/Serverless): False
# ======================================================



# ======================================================
# Archivo original: acceptance.tfvars
# Carpeta: C:\Users\asus\cloned_repos\chef\automate\terraform\test-environments\scenarios\vars
# ======================================================

# These are the vars used by a2-acceptance.cd.chef.co instances
environment = "delivered"

dns_suffix = "acceptance"

channel = "acceptance"

chef_environment = "delivered"

www_site_hugo_options = "--buildDrafts --config config.toml,config/acceptance.toml"



# ======================================================
# Archivo original: dev.tfvars
# Carpeta: C:\Users\asus\cloned_repos\chef\automate\terraform\test-environments\scenarios\vars
# ======================================================

# These are the vars used by a2-dev.cd.chef.co instances
environment = "union"

dns_suffix = "dev"

channel = "dev"

chef_environment = "union"

www_site_hugo_options = "--buildDrafts --config config.toml,config/dev.toml"



# ======================================================
# Archivo original: unstable.tfvars
# Carpeta: C:\Users\asus\cloned_repos\chef\automate\terraform\test-environments\scenarios\vars
# ======================================================

# These are the variables used by the deprecated a2-unstable.cd.chef.co environments
environment = "acceptance"
dns_suffix = "unstable"
channel = "unstable"
chef_environment = "acceptance-chef-products-a2-master"



# ======================================================
# Archivo original: userdev.tfvars
# Carpeta: C:\Users\asus\cloned_repos\chef\automate\terraform\test-environments\scenarios\vars
# ======================================================

# These are the variables used by the a2-dev-#.cd.chef.co environments
chef_environment = "dev"
enable_monitoring = "false"




# ======================================================
# Archivo fusionado: terraform\test-license-usage\vars\cloudvars.tf
# Piezas Terraform en carpeta: 0
# Tiene arquitectura (EC2/Docker/Serverless): False
# ======================================================



# ======================================================
# Archivo original: acceptance.tfvars
# Carpeta: C:\Users\asus\cloned_repos\chef\automate\terraform\test-license-usage\vars
# ======================================================

# These are the vars used by a2-acceptance.cd.chef.co instances
environment = "delivered"



# ======================================================
# Archivo original: dev.tfvars
# Carpeta: C:\Users\asus\cloned_repos\chef\automate\terraform\test-license-usage\vars
# ======================================================

# These are the vars used by a2-dev.cd.chef.co instances
environment = "union"



# ======================================================
# Archivo original: unstable.tfvars
# Carpeta: C:\Users\asus\cloned_repos\chef\automate\terraform\test-license-usage\vars
# ======================================================

# These are the variables used by the deprecated a2-unstable.cd.chef.co environments
environment = "acceptance"



# ======================================================
# Archivo original: userdev.tfvars
# Carpeta: C:\Users\asus\cloned_repos\chef\automate\terraform\test-license-usage\vars
# ======================================================

# These are the variables used by the a2-dev-#.cd.chef.co environments
chef_environment = "dev"




# ======================================================
# Archivo fusionado: terraform\a2ha-terraform\destroy\aws\cloudaws.tf
# Piezas Terraform en carpeta: 6
# Tiene arquitectura (EC2/Docker/Serverless): True
# ======================================================



# ======================================================
# Archivo original: main.tf
# Carpeta: C:\Users\asus\cloned_repos\chef\automate\terraform\a2ha-terraform\destroy\aws
# ======================================================

provider "aws" {
  region  = var.aws_region
  profile = var.aws_profile
}

module "aws_metadata" {
  source = "../../modules/aws_metadata"
}

module "aws" {
  ami_filter_name                 = var.ami_filter_name
  ami_filter_owner                = var.ami_filter_owner
  ami_filter_virt_type            = var.ami_filter_virt_type
  aws_vpc_id                      = var.aws_vpc_id
  aws_cidr_block_addr             = var.aws_cidr_block_addr
  automate_ebs_volume_iops        = var.automate_ebs_volume_iops
  automate_ebs_volume_size        = var.automate_ebs_volume_size
  automate_ebs_volume_type        = var.automate_ebs_volume_type
  automate_fqdn                   = var.automate_fqdn
  automate_instance_count         = var.automate_instance_count
  automate_lb_certificate_arn     = var.automate_lb_certificate_arn
  delete_on_termination           = var.delete_on_termination
  automate_server_instance_type   = var.automate_server_instance_type
  aws_ami_id                      = var.aws_ami_id
  aws_ssh_key_file                = var.ssh_key_file
  aws_ssh_key_pair_name           = var.aws_ssh_key_pair_name
  aws_ssh_user                    = var.ssh_user
  aws_ssh_port                    = var.ssh_port
  chef_ebs_volume_iops            = var.automate_ebs_volume_iops
  chef_ebs_volume_size            = var.automate_ebs_volume_size
  chef_ebs_volume_type            = var.automate_ebs_volume_type
  chef_server_instance_count      = var.chef_server_instance_count
  chef_server_instance_type       = var.chef_server_instance_type
  chef_server_lb_certificate_arn  = var.chef_server_lb_certificate_arn
  public_custom_subnets           = var.public_custom_subnets
  private_custom_subnets          = var.private_custom_subnets
  opensearch_ebs_volume_iops      = var.opensearch_ebs_volume_iops
  opensearch_ebs_volume_size      = var.opensearch_ebs_volume_size
  opensearch_ebs_volume_type      = var.opensearch_ebs_volume_type
  opensearch_instance_count       = var.opensearch_instance_count
  opensearch_listen_port          = var.opensearch_listen_port
  opensearch_server_instance_type = var.opensearch_server_instance_type
  pgleaderchk_listen_port         = var.pgleaderchk_listen_port
  postgresql_ebs_volume_iops      = var.postgresql_ebs_volume_iops
  postgresql_ebs_volume_size      = var.postgresql_ebs_volume_size
  postgresql_ebs_volume_type      = var.postgresql_ebs_volume_type
  postgresql_instance_count       = var.postgresql_instance_count
  postgresql_listen_port          = var.postgresql_listen_port
  postgresql_server_instance_type = var.postgresql_server_instance_type
  proxy_listen_port               = var.proxy_listen_port
  setup_managed_services          = var.setup_managed_services
  source                          = "../../modules/aws"
  lb_access_logs                  = var.lb_access_logs
  tags                            = var.aws_tags
  aws_instance_profile_name       = var.backup_config_s3 == "true" ? module.s3[0].instance_profile_name : null
  json_data                       = module.aws_metadata.json_data

  depends_on = [module.aws_metadata]
}

module "efs" {
  source                  = "../../modules/efs"
  count                   = var.backup_config_efs == "true" ? 1 : 0
  automate_private_ips    = module.aws.automate_private_ips
  chef_server_private_ips = module.aws.chef_server_private_ips
  postgresql_private_ips  = module.aws.postgresql_private_ips
  opensearch_private_ips  = module.aws.opensearch_private_ips
  random_id               = module.aws.random_id
  aws_region              = var.aws_region
  aws_ssh_key_file        = var.ssh_key_file
  aws_ssh_key_pair_name   = var.aws_ssh_key_pair_name
  aws_ssh_user            = var.ssh_user
  aws_ssh_port            = var.ssh_port
  tag_name                = var.tag_name
  subnet_id               = module.aws.subnet_id
  mount_id                = module.aws.mount_id

  depends_on = [module.aws]
}

module "s3" {
  source            = "../../modules/s3"
  count             = var.backup_config_s3 == "true" ? 1 : 0
  aws_s3_bucketName = var.aws_s3_bucketName
  random_id         = module.aws.random_id
  tags              = var.tag_name
  destroy_bucket    = var.destroy_bucket
}

module "aws-output" {
  source                  = "../../modules/aws_output"
  automate_private_ips    = module.aws.automate_private_ips
  chef_server_private_ips = module.aws.chef_server_private_ips
  postgresql_private_ips  = module.aws.postgresql_private_ips
  opensearch_private_ips  = module.aws.opensearch_private_ips
  automate_fqdn           = module.aws.automate_fqdn
  automate_frontend_url   = module.aws.automate_frontend_url
  bucket_name             = var.backup_config_s3 == "true" ? module.s3[0].bucket_name : ""
}




# ======================================================
# Archivo fusionado: terraform\a2ha-terraform\modules\aws_metadata\cloudaws_metadata.tf
# Piezas Terraform en carpeta: 6
# Tiene arquitectura (EC2/Docker/Serverless): True
# ======================================================



# ======================================================
# Archivo original: main.tf
# Carpeta: C:\Users\asus\cloned_repos\chef\automate\terraform\a2ha-terraform\modules\aws_metadata
# ======================================================

resource "null_resource" "generateMetadataToken" {
  provisioner "local-exec" {
    command = "echo `curl -X PUT http://169.254.169.254/latest/api/token -H 'X-aws-ec2-metadata-token-ttl-seconds: 21600'` > ${path.module}/metadata_token.txt"
  }
}

data "local_file" "readToken" {
  filename   = "${path.module}/metadata_token.txt"
  depends_on = [null_resource.generateMetadataToken]
}

data "http" "getEc2PrivateIP" {
  url = "http://169.254.169.254/latest/meta-data/local-ipv4"
  request_headers = {
    X-aws-ec2-metadata-token = chomp(data.local_file.readToken.content)
  }
}

data "http" "getBastionRole" {
  url = "http://169.254.169.254/latest/meta-data/iam/info"
  request_headers = {
    X-aws-ec2-metadata-token = chomp(data.local_file.readToken.content)
  }
}



# ======================================================
# Archivo original: output.tf
# Carpeta: C:\Users\asus\cloned_repos\chef\automate\terraform\a2ha-terraform\modules\aws_metadata
# ======================================================

output "json_data" {
  value = "${data.http.getEc2PrivateIP.response_body}/32"
}

output "bastion_role" {
  value = data.http.getBastionRole.status_code
}




# ======================================================
# Archivo fusionado: terraform\test-license-usage\cloudtest-license-usage.tf
# Piezas Terraform en carpeta: 8
# Tiene arquitectura (EC2/Docker/Serverless): False
# ======================================================



# ======================================================
# Archivo original: backend.tf
# Carpeta: C:\Users\asus\cloned_repos\chef\automate\terraform\test-license-usage
# ======================================================

terraform {
  backend "s3" {
    profile = "chef-cd"
    bucket  = "chef-cd-terraform-state"
    region  = "us-west-2"
  }
}



# ======================================================
# Archivo original: common.tf
# Carpeta: C:\Users\asus\cloned_repos\chef\automate\terraform\test-license-usage
# ======================================================

#
# Common Data Source
# Data sources that should be shared across multiple scenario files should be placed here.
#

module "cd_infrastructure" {
  source      = "github.com/chef/es-terraform//modules/cd_common_infrastructure"
  environment = "${var.environment}"
}

provider "aws" {
  region  = "${module.cd_infrastructure.aws_region}"
  profile = "${module.cd_infrastructure.aws_profile}"
}

#
# Pull keys from citadel
#

data "aws_s3_bucket_object" "chef_user_key" {
  bucket = "chef-cd-citadel"
  key    = "cd-infrastructure-chef-user.pem"
}

data "aws_s3_bucket_object" "aws_private_key" {
  bucket = "chef-cd-citadel"
  key    = "cd-infrastructure-aws"
}

# environment specific infra
data "terraform_remote_state" "a2_infrastructure" {
  backend = "s3"

  config {
    bucket  = "chef-cd-terraform-state"
    key     = "a2/${var.environment}.tfstate"
    region  = "us-west-2"
    profile = "chef-cd"
  }
}



# ======================================================
# Archivo original: main.tf
# Carpeta: C:\Users\asus\cloned_repos\chef\automate\terraform\test-license-usage
# ======================================================

resource "null_resource" "chef_automate_license_usage" {
  count = "${length(data.terraform_remote_state.a2_infrastructure.chef_server_performance_test_single_local_inplace_upgrade_fqdn)}"

  triggers = {
    always_do = "${uuid()}"
  }

  connection {
    type = "ssh"
    host = "${element(data.terraform_remote_state.a2_infrastructure.chef_server_performance_test_single_local_inplace_upgrade_fqdn, count.index)}"
    user = "${data.terraform_remote_state.a2_infrastructure.chef_server_performance_test_single_local_inplace_upgrade_ssh_username}"

    private_key = "${data.aws_s3_bucket_object.aws_private_key.body}"
  }

  provisioner "remote-exec" {
    inline = [
      "set -e",
      "sudo chef-automate license usage --result-json license-usage.json",
    ]
  }
}



# ======================================================
# Archivo original: variables.tf
# Carpeta: C:\Users\asus\cloned_repos\chef\automate\terraform\test-license-usage
# ======================================================

#########################################################################
# Default
#########################################################################
variable "environment" {
  type        = "string"
  description = "Environment and associated workflow environment (dev, acceptance, union, rehearsal, or delivered)"
}




# ======================================================
# Archivo fusionado: terraform\a2ha-terraform\modules\system_hardening\cloudsystem_hardening.tf
# Piezas Terraform en carpeta: 11
# Tiene arquitectura (EC2/Docker/Serverless): False
# ======================================================



# ======================================================
# Archivo original: inputs.tf
# Carpeta: C:\Users\asus\cloned_repos\chef\automate\terraform\a2ha-terraform\modules\system_hardening
# ======================================================

variable "instance_count" {
}

variable "private_ips" {
  default = []
}

variable "public_ips" {
  default = []
}

variable "ssh_key_file" {
}

variable "ssh_user" {
  default = "centos"
}

variable "ssh_user_sudo_password" {
}

variable "sudo_cmd" {
  default = "sudo"
}

variable "tmp_path" {
  default = "/hab/var/automate-ha"
}



# ======================================================
# Archivo original: main.tf
# Carpeta: C:\Users\asus\cloned_repos\chef\automate\terraform\a2ha-terraform\modules\system_hardening
# ======================================================

locals {
  hardening_sh = templatefile("${path.module}/templates/hardening.sh.tpl", {
    ssh_user_sudo_password = var.ssh_user_sudo_password,
    ssh_user               = var.ssh_user,
    tmp_path               = var.tmp_path
  })
}

resource "null_resource" "system_hardening" {
  count = var.instance_count

  triggers = {
    template = local.hardening_sh
  }

  connection {
    user        = var.ssh_user
    port        = var.ssh_port
    private_key = file(var.ssh_key_file)
    host        = var.private_ips[count.index]
    script_path = "${var.tmp_path}/tf_inline_script_system_hardening.sh"
  }

  provisioner "file" {
    destination = "${var.tmp_path}/hardening.sh"
    content     = local.hardening_sh
  }

  provisioner "remote-exec" {
    inline = [
      "echo '${var.ssh_user_sudo_password}' | ${var.sudo_cmd} -S bash -ex ${var.tmp_path}/hardening.sh",
    ]
  }
}




# ======================================================
# Archivo original: versions.tf
# Carpeta: C:\Users\asus\cloned_repos\chef\automate\terraform\a2ha-terraform\modules\system_hardening
# ======================================================


terraform {
  required_version = ">= 0.12"
}




# ======================================================
# Archivo fusionado: terraform\a2ha-terraform\modules\airgap_bundle\cloudairgap_bundle.tf
# Piezas Terraform en carpeta: 13
# Tiene arquitectura (EC2/Docker/Serverless): False
# ======================================================



# ======================================================
# Archivo original: inputs.tf
# Carpeta: C:\Users\asus\cloned_repos\chef\automate\terraform\a2ha-terraform\modules\airgap_bundle
# ======================================================

variable "archive_disk_info" {
}

variable "bundle_files" {
  default     = []
  description = "Array of hashs for bundle files, hash should have a source and destination key"
}

variable "instance_count" {
}

variable "private_ips" {
  default = []
}

variable "public_ips" {
  default = []
}

variable "ssh_key_file" {
}

variable "ssh_port" {
}

variable "ssh_user" {
}

variable "tmp_path" {
}



# ======================================================
# Archivo original: main.tf
# Carpeta: C:\Users\asus\cloned_repos\chef\automate\terraform\a2ha-terraform\modules\airgap_bundle
# ======================================================

locals {
  checksum_info = [
    for bundle in var.bundle_files :
    format("%s %s",
      element(split(" ", file("transfer_files/${bundle.source}.md5")), 0),
      bundle.destination
    )
  ]
  rsync_files = [
    for bundle in var.bundle_files :
    format("%s,%s", bundle.source, bundle.destination)
  ]
  airgap_info = templatefile("${path.module}/templates/airgap.info.tpl", {
    archive_disk_info = var.archive_disk_info,
    files             = join(",", local.rsync_files),
    instance_count    = var.instance_count,
    tmp_path          = var.tmp_path,
    checksums         = join("\n", local.checksum_info)
  })
}

resource "null_resource" "rsync" {
  count = var.instance_count

  connection {
    user        = var.ssh_user
    private_key = file(var.ssh_key_file)
    host        = var.private_ips[count.index]
    port        = var.ssh_port
  }

  triggers = {
    template   = local.airgap_info
    always_run = timestamp()
  }

  provisioner "file" {
    destination = "${var.tmp_path}/airgap.info"
    content     = local.airgap_info
  }

  provisioner "local-exec" {
    command = "${path.module}/files/rsync_wrapper.sh -k ${var.ssh_key_file} -u ${var.ssh_user} -s ${var.ssh_port} -i ${var.private_ips[count.index]} -l ${join(",", local.rsync_files)} -p ${path.module}"
  }
}



# ======================================================
# Archivo original: outputs.tf
# Carpeta: C:\Users\asus\cloned_repos\chef\automate\terraform\a2ha-terraform\modules\airgap_bundle
# ======================================================

output "airgap_info" {
  value = "Airgap IDs:${join(",", null_resource.rsync.*.id)}\nAirgap Info: ${local.airgap_info}"
}



# ======================================================
# Archivo original: versions.tf
# Carpeta: C:\Users\asus\cloned_repos\chef\automate\terraform\a2ha-terraform\modules\airgap_bundle
# ======================================================


terraform {
  required_version = ">= 0.12"
}




# ======================================================
# Archivo fusionado: terraform\a2ha-terraform\modules\aws_output\cloudaws_output.tf
# Piezas Terraform en carpeta: 15
# Tiene arquitectura (EC2/Docker/Serverless): False
# ======================================================



# ======================================================
# Archivo original: inputs.tf
# Carpeta: C:\Users\asus\cloned_repos\chef\automate\terraform\a2ha-terraform\modules\aws_output
# ======================================================

variable "automate_fqdn" {
  default = ""
}

variable "automate_frontend_url" {
  default = ""
}

variable "automate_private_ips" {
  default = []
}

variable "aws_os_snapshot_role_arn" {
  default = ""
}

variable "bucket_name" {
  default = ""
}

variable "chef_server_private_ips" {
  default = []
}

variable "opensearch_private_ips" {
  default = []
}

variable "os_snapshot_user_access_key_id" {
  default = ""
}

variable "os_snapshot_user_access_key_secret" {
  default = ""
}

variable "postgresql_private_ips" {
  default = []
}



# ======================================================
# Archivo original: main.tf
# Carpeta: C:\Users\asus\cloned_repos\chef\automate\terraform\a2ha-terraform\modules\aws_output
# ======================================================

locals {
  output_tfvars = templatefile("${path.module}/files/output.tfvars.tpl", {
    automate_private_ips               = join(", ", formatlist("\"%s\"", var.automate_private_ips)),
    chef_server_private_ips            = join(", ", formatlist("\"%s\"", var.chef_server_private_ips)),
    opensearch_private_ips             = join(", ", formatlist("\"%s\"", var.opensearch_private_ips)),
    postgresql_private_ips             = join(", ", formatlist("\"%s\"", var.postgresql_private_ips)),
    aws_os_snapshot_role_arn           = var.aws_os_snapshot_role_arn,
    os_snapshot_user_access_key_id     = var.os_snapshot_user_access_key_id,
    os_snapshot_user_access_key_secret = var.os_snapshot_user_access_key_secret,
    automate_fqdn                      = var.automate_fqdn
    automate_frontend_url              = var.automate_frontend_url
    bucket_name                        = var.bucket_name
  })

  copy_terraform_files_for_destroy = [
    "/hab/a2_deploy_workspace/terraform/reference_architectures/aws/variables.tf",
    "/hab/a2_deploy_workspace/terraform/a2ha_habitat.auto.tfvars",
    "/hab/a2_deploy_workspace/terraform/aws.auto.tfvars",
    "/hab/a2_deploy_workspace/terraform/variables_common.tf"
  ]

  destination_path = "/hab/a2_deploy_workspace/terraform/destroy/aws"

}

#This will create auto.tfvars with using aws's content. Because dusing deployment time we will need some aws info like public and private ips.
resource "local_file" "output" {
  filename = "${path.root}/reference_architectures/deployment/output.auto.tfvars"
  content  = local.output_tfvars
}

#This will convert tfvars to auto.tfvars because after the provisioning cluter, deployment will be started so at that time we will need current tfvars file. So if we convert it into auto.tfvars then we don't need to load this file. It will be automatically loaded.
#For starting deployment process after provisioning, we have to set deployment flag in tfvars and tf_arch file.
resource "null_resource" "output" {
  count = 1

  triggers = {
    always_run = timestamp()
  }

  provisioner "local-exec" {
    command = "mv ${path.root}/terraform.tfvars ${path.root}/aws.auto.tfvars;sed  -i 's/aws/deployment/' ${path.root}/.tf_arch;sed  -i 's/architecture \"aws\"/architecture \"deployment\"/' ${path.root}/../a2ha.rb"
  }

  depends_on = [local_file.output]
}

resource "null_resource" "setup_destroy_directory" {
  for_each = toset(local.copy_terraform_files_for_destroy)

  triggers = {
    always_run = timestamp()
  }

  provisioner "local-exec" {
    command = "cp ${each.value} ${local.destination_path}"
  }

  depends_on = [null_resource.output]

}



# ======================================================
# Archivo original: versions.tf
# Carpeta: C:\Users\asus\cloned_repos\chef\automate\terraform\a2ha-terraform\modules\aws_output
# ======================================================


terraform {
  required_version = ">= 0.12"
}




# ======================================================
# Archivo fusionado: terraform\a2ha-terraform\modules\keystoreopensearch\cloudkeystoreopensearch.tf
# Piezas Terraform en carpeta: 17
# Tiene arquitectura (EC2/Docker/Serverless): False
# ======================================================



# ======================================================
# Archivo original: inputs.tf
# Carpeta: C:\Users\asus\cloned_repos\chef\automate\terraform\a2ha-terraform\modules\keystoreopensearch
# ======================================================

variable "access_key" {
  default = ""
}

variable "backup_config_s3" {
  default = "false"
}

variable "google_service_account_file" {
  default = ""
}

variable "location" {
  default = ""
}

variable "opensearch_instance_count" {
  default = 3
}

variable "opensearch_listen_port" {
  default = 9200
}

variable "opensearch_pkg_ident" {
  default = "chef/automate-ha-opensearch"
}

variable "private_ips" {
  default = []
}

variable "secret_key" {
  default = ""
}

variable "ssh_key_file" {
}

variable "ssh_port" {
  default = 22
}

variable "ssh_user" {
  default = "ubuntu"
}

variable "ssh_user_sudo_password" {
}

variable "sudo_cmd" {
  default = "sudo"
}

variable "tmp_path" {
  default = "/hab/var/automate-ha"
}



# ======================================================
# Archivo original: main.tf
# Carpeta: C:\Users\asus\cloned_repos\chef\automate\terraform\a2ha-terraform\modules\keystoreopensearch
# ======================================================

locals {
  keystore = templatefile("${path.module}/templates/opensearch-keystore.sh.tpl", {
    opensearch_pkg_ident        = var.opensearch_pkg_ident,
    backup_config_s3            = var.backup_config_s3
    access_key                  = var.access_key
    secret_key                  = var.secret_key
    listen_port                 = var.opensearch_listen_port
    tmp_path                    = var.tmp_path
    location                    = var.location
    google_service_account_file = var.google_service_account_file
  })
}



resource "null_resource" "opensearch_keystore" {
  count = var.backup_config_s3 == "true" ? var.opensearch_instance_count : 0

  connection {
    user        = var.ssh_user
    port        = var.ssh_port
    private_key = file(var.ssh_key_file)
    host        = var.private_ips[count.index]
    script_path = "${var.tmp_path}/tf_inline_script_system_opensearch_keystore.sh"
  }

  provisioner "file" {
    destination = "${var.tmp_path}/opensearch-keystore.sh"
    content     = local.keystore
  }

  provisioner "local-exec" {
    command = <<EOT
if [ -f "${var.google_service_account_file}" ]; then
  scp -P ${var.ssh_port} -o StrictHostKeyChecking=no -i ${var.ssh_key_file} ${var.google_service_account_file} ${var.ssh_user}@${var.private_ips[count.index]}:${var.tmp_path}/googleServiceAccount.json
  echo "GCP Service Account File copied"
else
  echo "GCP Service Account File does not exist"
fi
EOT
  }

  provisioner "remote-exec" {
    inline = [
      "chmod 0700 ${var.tmp_path}/opensearch-keystore.sh",
      "sleep ${count.index * 2}",
      "echo '${var.ssh_user_sudo_password}' | ${var.sudo_cmd} -S ${var.tmp_path}/opensearch-keystore.sh",
    ]
  }
}



# ======================================================
# Archivo fusionado: terraform\a2ha-terraform\modules\s3\clouds3.tf
# Piezas Terraform en carpeta: 17
# Tiene arquitectura (EC2/Docker/Serverless): True
# ======================================================



# ======================================================
# Archivo original: inputs.tf
# Carpeta: C:\Users\asus\cloned_repos\chef\automate\terraform\a2ha-terraform\modules\s3
# ======================================================

variable "aws_region" {
  default     = ""
  description = "The name of the selected AWS region / datacenter."
}

variable "aws_s3_bucketName" {
  default = "chef-automate-ha"
}

variable "destroy_bucket" {
  default = false
}

variable "name" {
  default = "chef-automate-ha"
}

variable "random_id" {
}

variable "tags" {
}



# ======================================================
# Archivo original: main.tf
# Carpeta: C:\Users\asus\cloned_repos\chef\automate\terraform\a2ha-terraform\modules\s3
# ======================================================

resource "aws_iam_instance_profile" "backup_instance_profile" {
  name = "${var.name}-${var.random_id}"
  role = aws_iam_role.backup_instance_role.name
}

resource "aws_iam_role" "backup_instance_role" {
  name               = "${var.name}-${var.random_id}"
  assume_role_policy = data.aws_iam_policy_document.backup_instance_role.json
}

data "aws_iam_policy_document" "backup_instance_role" {
  statement {
    effect  = "Allow"
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }
  }
}


resource "aws_iam_role_policy_attachment" "ec2_full_access" {
  role       = aws_iam_role.backup_instance_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2FullAccess"
}

resource "aws_iam_role_policy_attachment" "provisioner_s3_full_access" {
  role       = aws_iam_role.backup_instance_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3FullAccess"
}

resource "aws_iam_role_policy_attachment" "AmazonAPIGatewayAdministrator" {
  role       = aws_iam_role.backup_instance_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonAPIGatewayAdministrator"
}

resource "aws_iam_role_policy_attachment" "AdministratorAccess" {
  role       = aws_iam_role.backup_instance_role.name
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}


locals {
  log_bucket = var.aws_s3_bucketName
}

# Creating s3 bucket using AWS-CLI (hab -> core/aws-cli)
resource "null_resource" "createS3bucket" {
  provisioner "local-exec" {
    command = "chmod 700 ${path.module}/templates/createS3Bucket.sh; ${path.module}/templates/createS3Bucket.sh ${var.aws_s3_bucketName} ${var.aws_region}"
  }
}




# ======================================================
# Archivo original: outputs.tf
# Carpeta: C:\Users\asus\cloned_repos\chef\automate\terraform\a2ha-terraform\modules\s3
# ======================================================

output "instance_profile_name" {
  value = aws_iam_instance_profile.backup_instance_profile.name
}

output "bucket_name" {
  value = local.log_bucket
}



# ======================================================
# Archivo fusionado: terraform\a2ha-terraform\modules\system\cloudsystem.tf
# Piezas Terraform en carpeta: 18
# Tiene arquitectura (EC2/Docker/Serverless): False
# ======================================================



# ======================================================
# Archivo original: inputs.tf
# Carpeta: C:\Users\asus\cloned_repos\chef\automate\terraform\a2ha-terraform\modules\system
# ======================================================

variable "automate_archive_disk_fs_path" {
}

variable "instance_count" {
}

variable "opensearch_archive_disk_fs_path" {
}

variable "postgresql_archive_disk_fs_path" {
}

variable "private_ips" {
  default = []
}

variable "public_ips" {
  default = []
}

variable "ssh_group_name" {
}

variable "ssh_key_file" {
}

variable "ssh_port" {
  default = 22
}

variable "ssh_user" {
  default = "centos"
}

variable "ssh_user_sudo_password" {
}

variable "sudo_cmd" {
  default = "sudo"
}

variable "tmp_path" {
  default = "/hab/var/automate-ha"
}



# ======================================================
# Archivo original: main.tf
# Carpeta: C:\Users\asus\cloned_repos\chef\automate\terraform\a2ha-terraform\modules\system
# ======================================================

locals {
  tunables_sh = templatefile("${path.module}/templates/tunables.sh.tpl", {
    tmp_path = var.tmp_path
  })
  archive_disk_info = templatefile("${path.module}/templates/archive_disk.info.tpl", {
    automate_archive_disk_fs_path   = var.automate_archive_disk_fs_path,
    opensearch_archive_disk_fs_path = var.opensearch_archive_disk_fs_path,
    postgresql_archive_disk_fs_path = var.postgresql_archive_disk_fs_path
  })
}
resource "null_resource" "create_temp_path" {

  count = var.instance_count

  connection {
    user        = var.ssh_user
    port        = var.ssh_port
    private_key = file(var.ssh_key_file)
    host        = var.private_ips[count.index]
  }

  provisioner "remote-exec" {
    inline = [
      "echo tmp_path: ${var.tmp_path}",
      "echo '${var.ssh_user_sudo_password}' | ${var.sudo_cmd} -S mkdir -p ${var.tmp_path}",
      "echo '${var.ssh_user_sudo_password}' | ${var.sudo_cmd} -S chown -R ${var.ssh_user} ${var.tmp_path}"
    ]
  }
}

resource "null_resource" "system_base_provisioning" {
  count = var.instance_count

  triggers = {
    template = local.tunables_sh
  }

  connection {
    user        = var.ssh_user
    port        = var.ssh_port
    private_key = file(var.ssh_key_file)
    host        = var.private_ips[count.index]
    script_path = "${var.tmp_path}/tf_inline_script_system.sh"
  }

  provisioner "file" {
    content     = local.tunables_sh
    destination = "${var.tmp_path}/tunables.sh"
  }

  provisioner "file" {
    content     = local.archive_disk_info
    destination = "${var.tmp_path}/archive_disk.info"
  }

  provisioner "remote-exec" {
    inline = [
      "chmod 0700 ${var.tmp_path}/tunables.sh",
      "echo '${var.ssh_user_sudo_password}' | ${var.sudo_cmd} -S ${var.tmp_path}/tunables.sh",
    ]
  }

  depends_on = [null_resource.create_temp_path]
}




# ======================================================
# Archivo original: outputs.tf
# Carpeta: C:\Users\asus\cloned_repos\chef\automate\terraform\a2ha-terraform\modules\system
# ======================================================

output "archive_disk_info" {
  value = local.archive_disk_info
}




# ======================================================
# Archivo original: versions.tf
# Carpeta: C:\Users\asus\cloned_repos\chef\automate\terraform\a2ha-terraform\modules\system
# ======================================================


terraform {
  required_version = ">= 0.12"
}




# ======================================================
# Archivo fusionado: terraform\a2ha-terraform\modules\postgresqlconfigsync\cloudpostgresqlconfigsync.tf
# Piezas Terraform en carpeta: 22
# Tiene arquitectura (EC2/Docker/Serverless): False
# ======================================================



# ======================================================
# Archivo original: inputs.tf
# Carpeta: C:\Users\asus\cloned_repos\chef\automate\terraform\a2ha-terraform\modules\postgresqlconfigsync
# ======================================================

variable "pgleaderchk_listen_port" {
  default = 6432
}

variable "pgleaderchk_pkg_ident" {
}

variable "pgleaderchk_svc_load_args" {
}

variable "postgresql_certs_by_ip" {
  type    = map(map(string))
  default = {}
}

variable "postgresql_instance_count" {
  default = 3
}

variable "postgresql_listen_port" {
  default = 5432
}

variable "postgresql_pkg_ident" {
}


variable "postgresql_svc_load_args" {
}

variable "private_ips" {
  default = []
}

variable "proxy_listen_port" {
  default = 7432
}

variable "proxy_pkg_ident" {
}

variable "proxy_svc_load_args" {
}

variable "public_ips" {
  default = []
}

variable "ssh_key_file" {
}

variable "ssh_port" {
  default = 22
}

variable "ssh_user" {
  default = "centos"
}

variable "ssh_user_sudo_password" {
}

variable "sudo_cmd" {
  default = "sudo"
}

variable "tmp_path" {
  default = "/hab/var/automate-ha"
}



# ======================================================
# Archivo original: main.tf
# Carpeta: C:\Users\asus\cloned_repos\chef\automate\terraform\a2ha-terraform\modules\postgresqlconfigsync
# ======================================================

locals {
  configsync = templatefile("${path.module}/templates/postgres_configsync.sh.tpl", {
    postgresql_pkg_ident      = var.postgresql_pkg_ident,
    pgleaderchk_pkg_ident     = var.pgleaderchk_pkg_ident,
    pgleaderchk_svc_load_args = var.pgleaderchk_svc_load_args,
    proxy_pkg_ident           = var.proxy_pkg_ident,
    proxy_svc_load_args       = var.proxy_svc_load_args,
    tmp_path                  = var.tmp_path
  })
}

resource "null_resource" "postgresrestart" {
  count = var.postgresql_instance_count

  connection {
    user        = var.ssh_user
    port        = var.ssh_port
    private_key = file(var.ssh_key_file)
    host        = var.private_ips[count.index]
    script_path = "${var.tmp_path}/tf_inline_script_postgres_configsync.sh"
  }

  provisioner "file" {
    destination = "${var.tmp_path}/postgres_configsync.sh"
    content     = local.configsync
  }

  provisioner "remote-exec" {
    inline = [
      "chmod 0700 ${var.tmp_path}/postgres_configsync.sh",
      "echo '${var.ssh_user_sudo_password}' | ${var.sudo_cmd} -S ${var.tmp_path}/postgres_configsync.sh",
    ]
  }
}


# ======================================================
# Archivo original: versions.tf
# Carpeta: C:\Users\asus\cloned_repos\chef\automate\terraform\a2ha-terraform\modules\postgresqlconfigsync
# ======================================================


terraform {
  required_version = ">= 0.12"
}




# ======================================================
# Archivo fusionado: terraform\a2ha-terraform\modules\efs\cloudefs.tf
# Piezas Terraform en carpeta: 23
# Tiene arquitectura (EC2/Docker/Serverless): False
# ======================================================



# ======================================================
# Archivo original: inputs.tf
# Carpeta: C:\Users\asus\cloned_repos\chef\automate\terraform\a2ha-terraform\modules\efs
# ======================================================

variable "automate_private_ips" {
  default = []
}

variable "aws_region" {
  default     = ""
  description = "The name of the selected AWS region / datacenter."
}

variable "aws_ssh_key_file" {
}

variable "aws_ssh_key_pair_name" {
}

variable "aws_ssh_port" {
  default = 22
}

variable "aws_ssh_user" {
  default = "centos"
}

variable "chef_server_private_ips" {
  default = []
}

variable "elasticsearch_public_ips" {
  default = []
}

variable "ip_list" {
  default = []
}

variable "mount_id" {
}

variable "nfs_mount_path" {
  default = "/mnt/automate_backups"
}

variable "opensearch_private_ips" {
  default = []
}

variable "postgresql_private_ips" {
  default = []
}

variable "random_id" {
}

variable "ssh_user_sudo_password" {
  default = ""
}

variable "subnet_id" {
  default = []
}

variable "sudo_cmd" {
  default = "sudo"
}

variable "tag_name" {
}

variable "tmp_path" {
  default = "/var/tmp"
}



# ======================================================
# Archivo original: main.tf
# Carpeta: C:\Users\asus\cloned_repos\chef\automate\terraform\a2ha-terraform\modules\efs
# ======================================================

resource "aws_efs_file_system" "backups" {
  creation_token = "${var.tag_name}_${var.random_id}_efsfs"
  encrypted      = true

}

resource "aws_efs_mount_target" "backups" {
  count           = length(var.subnet_id)
  file_system_id  = aws_efs_file_system.backups.id
  subnet_id       = element(var.subnet_id, count.index)
  security_groups = [var.mount_id]
}

locals {
  mount_nfs = templatefile("${path.module}/files/mount_nfs.tpl", {
    efs_mount_dns = aws_efs_file_system.backups.dns_name,
    efs_region    = var.aws_region,
    mount_path    = var.nfs_mount_path
  })

  ip_list = concat(var.automate_private_ips, var.chef_server_private_ips, var.postgresql_private_ips, var.opensearch_private_ips)

}

resource "null_resource" "mount_efs" {
  count = length(local.ip_list)
  connection {
    host        = local.ip_list[count.index]
    type        = "ssh"
    user        = var.aws_ssh_user
    port        = var.aws_ssh_port
    private_key = file(var.aws_ssh_key_file)
    script_path = "${var.tmp_path}/tf_inline_script_aws.sh"
  }

  provisioner "file" {
    content     = local.mount_nfs
    destination = "${var.tmp_path}/mount_nfs"
  }

  provisioner "remote-exec" {
    inline = [
      "echo '${var.ssh_user_sudo_password}' | ${var.sudo_cmd} -S bash -ex ${var.tmp_path}/mount_nfs",
    ]
  }
}




# ======================================================
# Archivo fusionado: terraform\a2ha-terraform\modules\habitat\cloudhabitat.tf
# Piezas Terraform en carpeta: 25
# Tiene arquitectura (EC2/Docker/Serverless): False
# ======================================================



# ======================================================
# Archivo original: inputs.tf
# Carpeta: C:\Users\asus\cloned_repos\chef\automate\terraform\a2ha-terraform\modules\habitat
# ======================================================

variable "airgap_info" {
}

variable "backend_aib_dest_file" {
}

variable "backend_aib_local_file" {
}

variable "hab_sup_http_gateway_auth_token" {
}

variable "hab_sup_http_gateway_ca_cert" {
}

variable "hab_sup_http_gateway_priv_key" {
}

variable "hab_sup_http_gateway_pub_cert" {
}

variable "hab_sup_ring_key" {
}

variable "hab_sup_run_args" {
}

variable "habitat_uid_gid" {
  default = ""
}

variable "install_hab_sh_args" {
}

variable "instance_count" {
}

variable "peer_ips" {
  default = []
}

variable "private_ips" {
  default = []
}

variable "public_ips" {
  default = []
}

variable "ssh_key_file" {
}

variable "ssh_port" {
  default = 22
}

variable "ssh_user" {
  default = "centos"
}

variable "ssh_user_sudo_password" {
}

variable "sudo_cmd" {
  default = "sudo"
}

variable "tmp_path" {
  default = "/hab/var/automate-ha"
}



# ======================================================
# Archivo original: main.tf
# Carpeta: C:\Users\asus\cloned_repos\chef\automate\terraform\a2ha-terraform\modules\habitat
# ======================================================

locals {
  peer_ip_list = join("\n", var.peer_ips)
  habitat_info = templatefile("${path.module}/templates/habitat.info.tpl", {
    airgap_info    = var.airgap_info,
    instance_count = var.instance_count,
    peers          = local.peer_ip_list
  })
  install_hab = templatefile("${path.module}/templates/install_hab.sh.tpl", {
    aib_file                        = var.backend_aib_dest_file,
    hab_sup_http_gateway_auth_token = var.hab_sup_http_gateway_auth_token,
    hab_sup_http_gateway_ca_cert    = var.hab_sup_http_gateway_ca_cert,
    hab_sup_http_gateway_pub_cert   = var.hab_sup_http_gateway_pub_cert,
    hab_sup_http_gateway_priv_key   = var.hab_sup_http_gateway_priv_key,
    hab_sup_ring_key                = var.hab_sup_ring_key,
    install_hab_sh_args             = var.install_hab_sh_args,
    tmp_path                        = var.tmp_path
    habitat_uid_gid                 = var.habitat_uid_gid
  })
  hab_sup_service = templatefile("${path.module}/templates/hab-sup.service.tpl", {
    hab_sup_run_args = var.hab_sup_run_args,
    tmp_path         = var.tmp_path
  })
}

resource "null_resource" "habitat" {
  count = var.instance_count

  connection {
    user        = var.ssh_user
    port        = var.ssh_port
    private_key = file(var.ssh_key_file)
    host        = var.private_ips[count.index]
    script_path = "${var.tmp_path}/tf_inline_script_system_habitat.sh"
  }

  triggers = {
    template = local.habitat_info
    peer_ips = local.peer_ip_list
  }

  provisioner "file" {
    destination = "${var.tmp_path}/hab-sup.service"
    content     = local.hab_sup_service
  }

  provisioner "file" {
    destination = "${var.tmp_path}/install_hab.sh"
    content     = local.install_hab
  }

  provisioner "file" {
    destination = "${var.tmp_path}/hab_peer_watch"
    content     = local.peer_ip_list
  }

  provisioner "file" {
    destination = "${var.tmp_path}/habitat.info"
    content     = local.habitat_info
  }

  provisioner "remote-exec" {
    inline = [
      "echo \"${var.airgap_info}\"",
      "chmod 0700 ${var.tmp_path}/install_hab.sh",
      "echo '${var.ssh_user_sudo_password}' | ${var.sudo_cmd} -S ${var.tmp_path}/install_hab.sh",
    ]
  }
}



# ======================================================
# Archivo original: outputs.tf
# Carpeta: C:\Users\asus\cloned_repos\chef\automate\terraform\a2ha-terraform\modules\habitat
# ======================================================

output "habitat_info" {
  value = "Habitat IDs: ${join(",", null_resource.habitat.*.id)}\nHabitat Info: ${local.habitat_info}"
}



# ======================================================
# Archivo original: versions.tf
# Carpeta: C:\Users\asus\cloned_repos\chef\automate\terraform\a2ha-terraform\modules\habitat
# ======================================================


terraform {
  required_version = ">= 0.12"
}




# ======================================================
# Archivo fusionado: terraform\a2ha-terraform\modules\elasticsearch\cloudelasticsearch.tf
# Piezas Terraform en carpeta: 26
# Tiene arquitectura (EC2/Docker/Serverless): False
# ======================================================



# ======================================================
# Archivo original: inputs.tf
# Carpeta: C:\Users\asus\cloned_repos\chef\automate\terraform\a2ha-terraform\modules\elasticsearch
# ======================================================

variable "airgap_info" {
}

variable "backend_aib_dest_file" {
}

variable "backend_aib_local_file" {
}

variable "backup_config_efs" {
  default = "false"
}

variable "curator_pkg_ident" {
}

variable "elasticsearch_pkg_ident" {
}

variable "elasticsearch_svc_load_args" {
}

variable "elasticsidecar_pkg_ident" {
}

variable "elasticsidecar_svc_load_args" {
}

variable "habitat_info" {
}

variable "journalbeat_pkg_ident" {
}

variable "kibana_pkg_ident" {
}

variable "metricbeat_pkg_ident" {
}

variable "opensearch_instance_count" {
  default = 3
}

variable "opensearch_listen_port" {
  default = 9200
}

variable "private_ips" {
  default = []
}

variable "public_ips" {
  default = []
}

variable "ssh_key_file" {
}

variable "ssh_user" {
  default = "centos"
}

variable "ssh_user_sudo_password" {
}

variable "sudo_cmd" {
  default = "sudo"
}

variable "tmp_path" {
  default = "/hab/var/automate-ha"
}



# ======================================================
# Archivo original: main.tf
# Carpeta: C:\Users\asus\cloned_repos\chef\automate\terraform\a2ha-terraform\modules\elasticsearch
# ======================================================

locals {
  elasticsearch_user_toml = [
    for n in range(var.opensearch_instance_count) : templatefile("${path.module}/templates/elasticsearch_user.toml.tpl", {
      listen_port     = var.opensearch_listen_port,
      minimum_masters = floor(var.opensearch_instance_count / 2 + 1),
      private_ip      = var.private_ips[n],
      private_ips     = join(", ", formatlist("\"%s\"", var.private_ips)),
      tmp_path        = var.tmp_path
    })
  ]
  elasticsidecar_user_toml = [
    for n in range(var.opensearch_instance_count) : templatefile("${path.module}/templates/elasticsidecar_user.toml.tpl", {
      private_ip = var.private_ips[n]
    })
  ]
  provision = templatefile("${path.module}/templates/provision.sh.tpl", {
    backend_aib_dest_file        = var.backend_aib_dest_file,
    elasticsearch_pkg_ident      = var.elasticsearch_pkg_ident,
    elasticsearch_svc_load_args  = var.elasticsearch_svc_load_args,
    elasticsidecar_pkg_ident     = var.elasticsidecar_pkg_ident,
    elasticsidecar_svc_load_args = var.elasticsidecar_svc_load_args,
    tmp_path                     = var.tmp_path
  })
}

resource "null_resource" "elasticsearch" {
  count = var.opensearch_instance_count

  triggers = {
    es_user_toml_sha = sha1(local.elasticsearch_user_toml[count.index])
    template         = local.provision
  }

  connection {
    user        = var.ssh_user
    port        = var.ssh_port
    private_key = file(var.ssh_key_file)
    host        = var.private_ips[count.index]
    script_path = "${var.tmp_path}/tf_inline_script_system_elasticsearch.sh"
  }

  provisioner "file" {
    destination = "${var.tmp_path}/elasticsearch-user.toml"
    content     = local.elasticsearch_user_toml[count.index]
  }

  provisioner "file" {
    destination = "${var.tmp_path}/es_provision.sh"
    content     = local.provision
  }

  provisioner "file" {
    destination = "${var.tmp_path}/elasticsidecar.toml"
    content     = local.elasticsidecar_user_toml[count.index]
  }

  provisioner "remote-exec" {
    inline = [
      # https://github.com/hashicorp/terraform/issues/17101
      # Until Terraform supports explicit module inter-dependencies, we create an implicit
      # dependency by using outputs from the Habitat and Airgap modules.
      "echo \"Airgap Info: ${var.airgap_info}\nHabitat Info: ${var.habitat_info}\"",
      "chmod 0700 ${var.tmp_path}/es_provision.sh",
      "echo '${var.ssh_user_sudo_password}' | ${var.sudo_cmd} -S ${var.tmp_path}/es_provision.sh",
    ]
  }
}

resource "null_resource" "backup_configuration" {
  count = var.backup_config_efs == "true" ? 1 : 0

  connection {
    user        = var.ssh_user
    port        = var.ssh_port
    private_key = file(var.ssh_key_file)
    host        = var.private_ips[0]
    script_path = "${var.tmp_path}/tf_inline_script_system_elasticsearch.sh"
  }

  provisioner "file" {
    destination = "${var.tmp_path}/efs_backup.sh"
    source      = "${path.module}/templates/efs_backup.sh"
  }

  provisioner "remote-exec" {
    inline = [
      "chmod 0700 ${var.tmp_path}/efs_backup.sh",
      "echo '${var.ssh_user_sudo_password}' | ${var.sudo_cmd} -S ${var.tmp_path}/efs_backup.sh",
    ]
  }

  depends_on = [
    null_resource.elasticsearch
  ]
}


# ======================================================
# Archivo original: versions.tf
# Carpeta: C:\Users\asus\cloned_repos\chef\automate\terraform\a2ha-terraform\modules\elasticsearch
# ======================================================


terraform {
  required_version = ">= 0.12"
}




# ======================================================
# Archivo fusionado: terraform\test-environments\modules\chef_load_instance\cloudchef_load_instance.tf
# Piezas Terraform en carpeta: 30
# Tiene arquitectura (EC2/Docker/Serverless): True
# ======================================================



# ======================================================
# Archivo original: main.tf
# Carpeta: C:\Users\asus\cloned_repos\chef\automate\terraform\test-environments\modules\chef_load_instance
# ======================================================

data "aws_s3_bucket_object" "aws_private_key" {
  bucket = "chef-cd-citadel"
  key    = "cd-infrastructure-aws"
}

data "template_file" "chef_load_toml" {
  count = "${var.instance_count}"

  template = "${file("${path.module}/templates/chef_load.toml.tpl")}"

  vars {
    api_get_requests            = "${join(",", formatlist("\"%s\"",var.api_get_requests))}"
    automate_server_fqdn        = "${var.automate_server_fqdn}"
    automate_server_token       = "${var.automate_server_token}"
    enable_chef_server_load     = "${var.enable_chef_server_load}"
    chef_server_client_name     = "${var.chef_server_client_name}"
    chef_server_fqdn            = "${var.chef_server_fqdn}"
    chef_server_org             = "${var.chef_server_org}"
    run_list                    = "${join(",", formatlist("\"%s\"",var.run_list))}"
    node_name_prefix            = "chef-load-${count.index + 1}"
    num_nodes                   = "${var.chef_load_nodes}"
    num_actions                 = "${var.chef_load_actions}"
    interval                    = "${var.chef_load_interval}"
    ohai_json_path              = "/opt/chef_load_sample_data/example-ohai.json"
    compliance_status_json_path = "/opt/chef_load_sample_data/example-compliance-status.json"
    converge_status_json_path   = "/opt/chef_load_sample_data/example-converge-status.json"
  }
}

data "template_file" "applications_load_gen_toml" {
  count = "${var.instance_count}"

  template = "${file("${path.module}/templates/applications_load_gen.toml.tpl")}"

  vars {
    automate_server_fqdn  = "${var.automate_server_fqdn}"
    automate_server_token = "${var.automate_server_token}"
    num_svcs              = "${var.apps_load_svcs}"
  }
}

data "template_file" "hab_sup_exec_start_conf" {
  count = "${var.instance_count}"

  template = "${file("${path.module}/templates/hab-sup-exec-start.conf.tpl")}"

  vars {
    automate_server_fqdn  = "${var.automate_server_fqdn}"
    automate_server_token = "${var.automate_server_token}"
  }
}

module "chef_load_cd_base" {
  source = "github.com/chef/es-terraform//modules/cd_base"

  instance_count = "${var.instance_count}"
  instance_id    = "${var.instance_id}"
  instance_fqdn  = "${var.instance_fqdn}"
  ssh_username   = "${var.ssh_username}"

  enable_monitoring = "${var.enable_monitoring}"
  chef_environment  = "${var.chef_environment}"
}

resource "null_resource" "habitat_install" {
  count = "${var.instance_count}"

  depends_on = ["module.chef_load_cd_base"]

  triggers = {
    instance_id = "${element(var.instance_id, count.index)}"
  }

  connection {
    type = "ssh"
    host = "${element(var.instance_fqdn, count.index)}"
    user = "${var.ssh_username}"

    private_key = "${data.aws_s3_bucket_object.aws_private_key.body}"
  }

  provisioner "file" {
    destination = "/tmp/limits.conf"

    content = <<EOF
[Service]
LimitNOFILE=infinity
EOF
  }

  provisioner "file" {
    content     = "${element(data.template_file.hab_sup_exec_start_conf.*.rendered, count.index)}"
    destination = "/tmp/hab-sup-exec-start.conf"
  }

  provisioner "remote-exec" {
    inline = [
      "set -e",
      "sudo mkdir -p /etc/systemd/system/hab-supervisor.service.d",
      "sudo chown root:root /tmp/limits.conf",
      "sudo chown root:root /tmp/hab-sup-exec-start.conf",
      "sudo mv /tmp/limits.conf /etc/systemd/system/hab-supervisor.service.d/limits.conf",
      "sudo mv /tmp/hab-sup-exec-start.conf /etc/systemd/system/hab-supervisor.service.d/hab-sup-exec-start.conf",
      "sudo systemctl daemon-reload",
    ]
  }

  provisioner "habitat" {
    service_type = "systemd"
  }
}

resource "null_resource" "chef_load_deploy" {
  count = "${var.instance_count}"

  depends_on = ["null_resource.habitat_install"]

  triggers = {
    always_do = "${uuid()}"
  }

  connection {
    type = "ssh"
    host = "${element(var.instance_fqdn, count.index)}"
    user = "${var.ssh_username}"

    private_key = "${data.aws_s3_bucket_object.aws_private_key.body}"
  }

  provisioner "file" {
    destination = "/tmp/group-node-names"

    content = <<EOF
#!/bin/sh

sed -i "/^node_name_prefix/ s/\".*chef-load-/\"$(date +%F)-chef-load-/" /hab/user/chef-load/config/user.toml
EOF
  }

  provisioner "file" {
    destination = "/tmp/chef-load_logrotate.conf"

    content = <<CONF
"/var/log/chef-load/chef-load.log" {
  daily
  rotate 7
  compress
  copytruncate
}
CONF
  }

  provisioner "file" {
    source      = "${path.module}/files/chef_load_sample_data"
    destination = "/tmp"
  }

  provisioner "file" {
    content     = "${element(data.template_file.chef_load_toml.*.rendered, count.index)}"
    destination = "/tmp/chef-load_user.toml"
  }

  provisioner "file" {
    content     = "${element(data.template_file.applications_load_gen_toml.*.rendered, count.index)}"
    destination = "/tmp/applications-load-gen_user.toml"
  }

  provisioner "file" {
    content     = "${var.chef_server_client_key}"
    destination = "/tmp/chef-server-client-key.txt"
  }

  provisioner "remote-exec" {
    inline = [
      "set -e",
      "sudo rm -f /hab/sup/default/specs/* || true",
      "sudo mv /bin/hab /bin/hab.old",
      "sudo HAB_NONINTERACTIVE=true HAB_LICENSE=accept /bin/hab.old pkg install core/hab/${var.desired_hab_version} --binlink --force && sudo rm /bin/hab.old",
      "sudo hab license accept",
      "sudo HAB_NONINTERACTIVE=true hab pkg install core/hab-sup/${var.desired_hab_version}",
      "sudo systemctl restart hab-supervisor.service",
      "for _ in {1..5}; do if sudo hab sup status; then break; else echo 'waiting' && sleep 5; fi; done",
      "sudo mv /tmp/chef-load_logrotate.conf /etc/logrotate.d/chef-load",
      "sudo chown root:root /etc/logrotate.d/chef-load",
      "sudo rm -rf /opt/chef_load_sample_data",
      "sudo mv /tmp/chef_load_sample_data /opt",
      "sudo mv /tmp/chef-server-client-key.txt /opt",
      "sudo mkdir -p /hab/user/chef-load/config",
      "sudo mkdir -p /hab/user/applications-load-gen/config",
      "sudo mv /tmp/chef-load_user.toml /hab/user/chef-load/config/user.toml",
      "sudo mv /tmp/applications-load-gen_user.toml /hab/user/applications-load-gen/config/user.toml",
      "sudo mv /tmp/group-node-names /etc/cron.hourly/group-node-names",
      "sudo chown root:root /etc/cron.hourly/group-node-names",
      "sudo chmod a+x /etc/cron.hourly/group-node-names",
      "sudo /etc/cron.hourly/group-node-names",
      "sudo mkdir -p /var/log/chef-load",
      "sudo chown hab /var/log/chef-load",
      "sudo HAB_NONINTERACTIVE=true hab svc load -f chef/chef-load --channel ${var.chef_load_channel} --strategy at-once",
      "sudo HAB_NONINTERACTIVE=true hab svc load -f chef/applications-load-gen --channel dev --strategy at-once",
    ]
  }
}



# ======================================================
# Archivo original: variables.tf
# Carpeta: C:\Users\asus\cloned_repos\chef\automate\terraform\test-environments\modules\chef_load_instance
# ======================================================

variable "instance_count" {
  default     = 1
  description = "The number of instances to provision."
}

variable "instance_id" {
  type        = "list"
  description = "The AWS instance ID for the instance. Used to determine when re-provisioning is required."
}

variable "instance_fqdn" {
  type        = "list"
  description = "The FQDN for the instance. Typically an output of the cd_instance module."
}

variable "ssh_username" {
  type        = "string"
  description = "The SSH username for the instance. Typically an output of the cd_instance module."
}

#
# Habitat
#

variable "desired_hab_version" {
  type        = "string"
  default     = "1.5.0"
  description = "desired version of the habitat CLI and supervisor"
}

#
# Chef Baseline
#

variable "enable_email" {
  default     = "true"
  description = "Enable email on this instance."
}

variable "enable_monitoring" {
  default     = "true"
  description = "Enable Sensu monitoring on this instance."
}

variable "chef_environment" {
  default     = "_default"
  description = "The Chef Environment on chef-server.chef.co in which to put the instance."
}

#
# Chef Load
#

variable "chef_load_channel" {
  default     = "unstable"
  description = "The habitat builder channel to use when deploying chef-load."
}

variable "automate_server_fqdn" {
  description = "The A2 FQDN that chef-load will connect to."
}

variable "automate_server_token" {
  description = "The A2 API token chef-load will use when making API requests."
}

variable "enable_chef_server_load" {
  default     = "false"
  description = "Enable Chef Server load."
}

variable "chef_server_client_name" {
  default     = ""
  description = "The A2 Chef Server client name chef-load will use when making API requests."
}

variable "chef_server_client_key" {
  default     = "default_data"
  description = "The A2 Chef Server client key chef-load will use when making API requests."
}

variable "chef_server_fqdn" {
  default     = ""
  description = "The A2 Chef Server FQDN chef-load will use when making API requests."
}

variable "chef_server_org" {
  default     = ""
  description = "The A2 Chef Server organization chef-load will use when making API requests."
}

variable "run_list" {
  type        = "list"
  default     = []
  description = "The run list chef-load will use."
}

variable "api_get_requests" {
  type        = "list"
  default     = []
  description = "Additional Chef Server API GET requests that chef-load will make during each CCR."
}

variable "chef_load_instance_type" {
  default     = "c5.large"
  description = "The EC2 instance type for the chef-load instance."
}

variable "chef_load_interval" {
  default     = "30"
  description = "The interval between each node's Chef Client Run."
}

variable "chef_load_nodes" {
  default     = "10000"
  description = "The number of nodes that chef-load will simulate."
}

variable "chef_load_actions" {
  default     = "1000"
  description = "The number of Chef Actions that chef-load will simulate."
}

variable "apps_load_svcs" {
  default     = "6500"
  description = "The number of services that applications-load-gen will simulate."
}




# ======================================================
# Archivo fusionado: terraform\a2ha-terraform\modules\postgresql\cloudpostgresql.tf
# Piezas Terraform en carpeta: 40
# Tiene arquitectura (EC2/Docker/Serverless): False
# ======================================================



# ======================================================
# Archivo original: inputs.tf
# Carpeta: C:\Users\asus\cloned_repos\chef\automate\terraform\a2ha-terraform\modules\postgresql
# ======================================================

variable "airgap_info" {
}

variable "backend_aib_dest_file" {
}

variable "backend_aib_local_file" {
}

variable "backup_config_efs" {
  default = "false"
}

variable "habitat_info" {
}

variable "journalbeat_pkg_ident" {
}

variable "metricbeat_pkg_ident" {
}

variable "nfs_mount_path" {
  default = "/mnt/automate_backups"
}

variable "opensearch_listen_port" {
  default = 9200
}

variable "opensearch_private_ips" {
  default = []
}

variable "pgleaderchk_listen_port" {
  default = 6432
}

variable "pgleaderchk_pkg_ident" {
}

variable "pgleaderchk_svc_load_args" {
}

variable "postgresql_archive_disk_fs_path" {
}

variable "postgresql_certs_by_ip" {
  type    = map(map(string))
  default = {}
}

variable "postgresql_custom_certs_enabled" {
  default = false
}

variable "postgresql_instance_count" {
  default = 3
}

variable "postgresql_listen_port" {
  default = 5432
}

variable "postgresql_pg_dump_enabled" {
}

variable "postgresql_pkg_ident" {
}

variable "postgresql_private_key" {
}

variable "postgresql_public_key" {
}

variable "postgresql_root_ca" {
}

variable "postgresql_ssl_enable" {
}

variable "postgresql_svc_load_args" {
}

variable "postgresql_wal_archive_enabled" {
}

variable "private_ips" {
  default = []
}

variable "proxy_listen_port" {
  default = 7432
}

variable "proxy_pkg_ident" {
}

variable "proxy_svc_load_args" {
}

variable "public_ips" {
  default = []
}

variable "ssh_key_file" {
}

variable "ssh_port" {
  default = 22
}

variable "ssh_user" {
  default = "centos"
}

variable "ssh_user_sudo_password" {
}

variable "sudo_cmd" {
  default = "sudo"
}

variable "tmp_path" {
  default = "/hab/var/automate-ha"
}



# ======================================================
# Archivo original: main.tf
# Carpeta: C:\Users\asus\cloned_repos\chef\automate\terraform\a2ha-terraform\modules\postgresql
# ======================================================

locals {
  postgresql_user_toml = [
    for n in range(var.postgresql_instance_count) : templatefile("${path.module}/templates/postgresql_user.toml.tpl", {
      listen_port                     = var.postgresql_listen_port,
      postgresql_pg_dump_enabled      = var.postgresql_pg_dump_enabled ? "true" : "false",
      postgresql_pg_dump_fs_path      = "${var.postgresql_archive_disk_fs_path}/pg_dump",
      postgresql_ssl_enable           = var.postgresql_ssl_enable ? "true" : "false",
      postgresql_wal_archive_enabled  = var.postgresql_wal_archive_enabled ? "true" : "false",
      postgresql_wal_archive_fs_path  = "${var.postgresql_archive_disk_fs_path}/archive",
      tmp_path                        = var.tmp_path
      postgresql_custom_certs_enabled = var.postgresql_custom_certs_enabled
      postgresql_root_ca              = trimspace(var.postgresql_root_ca)
      postgresql_public_key           = trimspace(contains(keys(var.postgresql_certs_by_ip), var.private_ips[n]) ? var.postgresql_certs_by_ip[element(var.private_ips, n)].public_key : var.postgresql_public_key)
      postgresql_private_key          = trimspace(contains(keys(var.postgresql_certs_by_ip), var.private_ips[n]) ? var.postgresql_certs_by_ip[element(var.private_ips, n)].private_key : var.postgresql_private_key)
    })
  ]
  pgleaderchk_user_toml = templatefile("${path.module}/templates/pgleaderchk_user.toml.tpl", {
    listen_port = var.pgleaderchk_listen_port,
    tmp_path    = var.tmp_path
  })
  proxy_user_toml = templatefile("${path.module}/templates/proxy_user.toml.tpl", {
    listen_port = var.proxy_listen_port,
    tmp_path    = var.tmp_path
  })
  provision = templatefile("${path.module}/templates/provision.sh.tpl", {
    backend_aib_dest_file     = var.backend_aib_dest_file,
    journalbeat_pkg_ident     = var.journalbeat_pkg_ident,
    metricbeat_pkg_ident      = var.metricbeat_pkg_ident,
    postgresql_pkg_ident      = var.postgresql_pkg_ident,
    postgresql_svc_load_args  = var.postgresql_svc_load_args,
    pgleaderchk_pkg_ident     = var.pgleaderchk_pkg_ident,
    pgleaderchk_svc_load_args = var.pgleaderchk_svc_load_args,
    proxy_pkg_ident           = var.proxy_pkg_ident,
    proxy_svc_load_args       = var.proxy_svc_load_args,
    tmp_path                  = var.tmp_path
  })
  premount = templatefile("${path.module}/templates/pre_mount.tpl", {
    nfs_mount_path = var.nfs_mount_path
  })
}

resource "null_resource" "postgresql" {
  count = var.postgresql_instance_count

  triggers = {
    template       = local.postgresql_user_toml[count.index]
    template_pgl   = local.pgleaderchk_user_toml
    template_puser = local.proxy_user_toml
    template_prov  = local.provision
  }

  connection {
    user        = var.ssh_user
    port        = var.ssh_port
    private_key = file(var.ssh_key_file)
    host        = var.private_ips[count.index]
    script_path = "${var.tmp_path}/tf_inline_script_system_postgresql.sh"
  }

  provisioner "file" {
    destination = "${var.tmp_path}/postgresql-user.toml"
    content     = local.postgresql_user_toml[count.index]
  }

  provisioner "file" {
    destination = "${var.tmp_path}/pgleaderchk-user.toml"
    content     = local.pgleaderchk_user_toml
  }

  provisioner "file" {
    destination = "${var.tmp_path}/proxy-user.toml"
    content     = local.proxy_user_toml
  }

  provisioner "file" {
    destination = "${var.tmp_path}/pg_provision.sh"
    content     = local.provision
  }

  provisioner "file" {
    destination = "${var.tmp_path}/pre_mount.sh"
    content     = local.premount
  }

  provisioner "remote-exec" {
    inline = [
      "chmod 0700 ${var.tmp_path}/pre_mount.sh",
      "echo '${var.ssh_user_sudo_password}' | ${var.sudo_cmd} -S ${var.tmp_path}/pre_mount.sh",
    ]
  }

  provisioner "remote-exec" {
    inline = [
      # https://github.com/hashicorp/terraform/issues/17101
      # Until Terraform supports explicit module inter-dependencies, we create an implicit
      # dependency by using outputs from the Habitat and Airgap modules.
      "echo \"Airgap Info: ${var.airgap_info}\nHabitat Info: ${var.habitat_info}\"",
      "chmod 0700 ${var.tmp_path}/pg_provision.sh",
      "echo '${var.ssh_user_sudo_password}' | ${var.sudo_cmd} -S ${var.tmp_path}/pg_provision.sh",
    ]
  }
}



# ======================================================
# Archivo original: versions.tf
# Carpeta: C:\Users\asus\cloned_repos\chef\automate\terraform\a2ha-terraform\modules\postgresql
# ======================================================


terraform {
  required_version = ">= 0.12"
}




# ======================================================
# Archivo fusionado: terraform\a2ha-terraform\modules\opensearch\cloudopensearch.tf
# Piezas Terraform en carpeta: 45
# Tiene arquitectura (EC2/Docker/Serverless): False
# ======================================================



# ======================================================
# Archivo original: inputs.tf
# Carpeta: C:\Users\asus\cloned_repos\chef\automate\terraform\a2ha-terraform\modules\opensearch
# ======================================================

variable "access_key" {
  default = ""
}

variable "airgap_info" {
}

variable "backend_aib_dest_file" {
}

variable "backend_aib_local_file" {
}

variable "backup_config_efs" {
  default = "false"
}

variable "backup_config_s3" {
  default = "false"
}

variable "curator_pkg_ident" {
}

variable "habitat_info" {
}

variable "journalbeat_pkg_ident" {
  default = "chef/automate-ha-journalbeat"
}

variable "kibana_pkg_ident" {
  default = "chef/automate-ha-kibana"
}

variable "location" {
  default = ""
}

variable "metricbeat_pkg_ident" {
  default = "chef/automate-ha-metricbeat"
}

variable "nfs_mount_path" {
  default = "/mnt/automate_backups"
}

variable "opensearch_admin_cert" {
}

variable "opensearch_admin_dn" {
}

variable "opensearch_admin_key" {
}

variable "opensearch_certs_by_ip" {
  type    = map(map(string))
  default = {}
}

variable "opensearch_base_path" {
  default = "elasticsearch"
}

variable "opensearch_custom_certs_enabled" {
  default = false
}

variable "opensearch_instance_count" {
  default = 1
}

variable "opensearch_listen_port" {
  default = 9200
}

variable "opensearch_nodes_dn" {
}

variable "opensearch_pkg_ident" {
  default = "chef/automate-ha-opensearch"
}

variable "opensearch_private_key" {
}

variable "opensearch_public_key" {
}

variable "opensearch_root_ca" {
}

variable "opensearch_svc_load_args" {
  default = "--topology standalone --strategy none"
}

variable "opensearch_user_password" {
  default = "admin"
}

variable "opensearch_username" {
  default = "admin"
}

variable "opensearchsidecar_pkg_ident" {
}

variable "opensearchsidecar_svc_load_args" {
}

variable "private_ips" {
  default = []
}

variable "public_ips" {
  default = []
}

variable "s3_endpoint" {
  default = ""
}

variable "secret_key" {
  default = ""
}

variable "ssh_key_file" {
}

variable "ssh_port" {
  default = 22
}

variable "ssh_user" {
  default = "ubuntu"
}

variable "ssh_user_sudo_password" {
}

variable "sudo_cmd" {
  default = "sudo"
}

variable "tmp_path" {
  default = "/hab/var/automate-ha"
}



# ======================================================
# Archivo original: main.tf
# Carpeta: C:\Users\asus\cloned_repos\chef\automate\terraform\a2ha-terraform\modules\opensearch
# ======================================================

locals {
  opensearch_user_toml = [
    for n in range(var.opensearch_instance_count) : templatefile("${path.module}/templates/opensearch_user.toml.tpl", {
      listen_port                     = var.opensearch_listen_port,
      minimum_masters                 = floor(var.opensearch_instance_count / 2 + 1),
      node_name                       = var.private_ips[n],
      private_ip                      = var.private_ips[n],
      private_ips                     = join(", ", formatlist("\"%s\"", var.private_ips)),
      nodes_list                      = join(", ", formatlist("\"%s\"", var.private_ips))
      tmp_path                        = var.tmp_path
      backup_config                   = var.backup_config_s3 == "true" ? var.location == "s3" ? "s3" : "gcs" : var.backup_config_efs == "true" ? "efs" : ""
      protocol                        = length(split("://", var.s3_endpoint)) > 1 ? split("://", var.s3_endpoint)[0] : "https"
      endpoint                        = length(split("://", var.s3_endpoint)) > 1 ? split("://", var.s3_endpoint)[1] : length(split("://", var.s3_endpoint)) == 1 ? split("://", var.s3_endpoint)[0] : "s3.amazonaws.com"
      nfs_mount_path                  = var.nfs_mount_path
      opensearch_custom_certs_enabled = var.opensearch_custom_certs_enabled
      opensearch_root_ca              = trimspace(var.opensearch_root_ca)
      opensearch_admin_key            = trimspace(var.opensearch_admin_key)
      opensearch_admin_cert           = trimspace(var.opensearch_admin_cert)
      opensearch_admin_dn             = trimspace(var.opensearch_admin_dn)
      opensearch_public_key           = trimspace(contains(keys(var.opensearch_certs_by_ip), var.private_ips[n]) ? var.opensearch_certs_by_ip[element(var.private_ips, n)].public_key : var.opensearch_public_key)
      opensearch_private_key          = trimspace(contains(keys(var.opensearch_certs_by_ip), var.private_ips[n]) ? var.opensearch_certs_by_ip[element(var.private_ips, n)].private_key : var.opensearch_private_key)
      opensearch_nodes_dn             = trimspace(contains(keys(var.opensearch_certs_by_ip), var.private_ips[n]) ? var.opensearch_certs_by_ip[element(var.private_ips, n)].nodes_dn : var.opensearch_nodes_dn)
      opensearch_base_path            = var.opensearch_base_path
      opensearch_nfs_path             = var.nfs_mount_path == "" ? var.opensearch_base_path : format("%s/%s",var.nfs_mount_path,var.opensearch_base_path)
    })
  ]
  opensearchsidecar_user_toml = [
    for n in range(var.opensearch_instance_count) : templatefile("${path.module}/templates/opensearchsidecar_user.toml.tpl", {
      private_ip = var.private_ips[n]
    })
  ]
  provision = templatefile("${path.module}/templates/provision.sh.tpl", {
    backend_aib_dest_file           = var.backend_aib_dest_file,
    opensearch_pkg_ident            = var.opensearch_pkg_ident,
    opensearch_svc_load_args        = var.opensearch_svc_load_args,
    opensearchsidecar_pkg_ident     = var.opensearchsidecar_pkg_ident,
    opensearchsidecar_svc_load_args = var.opensearchsidecar_svc_load_args,
    tmp_path                        = var.tmp_path
    backup_config_s3                = var.backup_config_s3
    access_key                      = var.access_key
    secret_key                      = var.secret_key
    listen_port                     = var.opensearch_listen_port
    nfs_mount_path                  = var.nfs_mount_path
    opensearch_username             = var.opensearch_username
    opensearch_user_password        = var.opensearch_user_password
    opensearch_base_path            = var.opensearch_base_path
    opensearch_nfs_path             = var.nfs_mount_path == "" ? var.opensearch_base_path : format("%s/%s",var.nfs_mount_path,var.opensearch_base_path)
  })

  efs_backup = templatefile("${path.module}/templates/efs_backup.sh.tpl", {
    nfs_mount_path       = var.nfs_mount_path
    opensearch_base_path = var.opensearch_base_path
    opensearch_nfs_path  = var.nfs_mount_path == "" ? var.opensearch_base_path : format("%s/%s",var.nfs_mount_path,var.opensearch_base_path)
  })
}

resource "null_resource" "opensearch" {
  count = var.opensearch_instance_count

  triggers = {
    es_user_toml_sha = sha1(local.opensearch_user_toml[count.index])
    template         = local.provision
  }

  connection {
    user        = var.ssh_user
    port        = var.ssh_port
    private_key = file(var.ssh_key_file)
    host        = var.private_ips[count.index]
    script_path = "${var.tmp_path}/tf_inline_script_system_opensearch.sh"
  }

  provisioner "file" {
    destination = "${var.tmp_path}/opensearch-user.toml"
    content     = local.opensearch_user_toml[count.index]
  }

  provisioner "file" {
    destination = "${var.tmp_path}/es_provision.sh"
    content     = local.provision
  }

  provisioner "file" {
    destination = "${var.tmp_path}/opensearchsidecar.toml"
    content     = local.opensearchsidecar_user_toml[count.index]
  }

  provisioner "remote-exec" {
    inline = [
      # https://github.com/hashicorp/terraform/issues/17101
      # Until Terraform supports explicit module inter-dependencies, we create an implicit
      # dependency by using outputs from the Habitat and Airgap modules.
      "echo \"Airgap Info: ${var.airgap_info}\nHabitat Info: ${var.habitat_info}\"",
      "chmod 0700 ${var.tmp_path}/es_provision.sh",
      "echo '${var.ssh_user_sudo_password}' | ${var.sudo_cmd} -S ${var.tmp_path}/es_provision.sh",
    ]
  }
}

resource "null_resource" "backup_configuration" {
  count = 0

  connection {
    user        = var.ssh_user
    port        = var.ssh_port
    private_key = file(var.ssh_key_file)
    host        = var.private_ips[0]
    script_path = "${var.tmp_path}/tf_inline_script_system_opensearch.sh"
  }

  provisioner "file" {
    destination = "${var.tmp_path}/efs_backup.sh"
    content     = local.efs_backup
  }

  provisioner "remote-exec" {
    inline = [
      "chmod 0700 ${var.tmp_path}/efs_backup.sh",
      "echo '${var.ssh_user_sudo_password}' | ${var.sudo_cmd} -S ${var.tmp_path}/efs_backup.sh",
    ]
  }

  depends_on = [
    null_resource.opensearch
  ]
}


# ======================================================
# Archivo original: versions.tf
# Carpeta: C:\Users\asus\cloned_repos\chef\automate\terraform\a2ha-terraform\modules\opensearch
# ======================================================


terraform {
  required_version = ">= 0.12"
}




# ======================================================
# Archivo fusionado: terraform\test-environments\modules\chef_automate_install\cloudchef_automate_install.tf
# Piezas Terraform en carpeta: 46
# Tiene arquitectura (EC2/Docker/Serverless): False
# ======================================================



# ======================================================
# Archivo original: main.tf
# Carpeta: C:\Users\asus\cloned_repos\chef\automate\terraform\test-environments\modules\chef_automate_install
# ======================================================

provider "aws" {
  region  = "us-west-2"
  profile = "chef-cd"
}

provider "vault" {
  address   = "https://vault.ps.chef.co"
  namespace = "root"
  version   = "2.24.1"
}

data "vault_generic_secret" "wildcard_chef" {
  path = "secret/a2/testing/wildcard_cert"
}

data "aws_s3_bucket_object" "aws_private_key" {
  bucket = "chef-cd-citadel"
  key    = "cd-infrastructure-aws"
}

data "aws_s3_bucket_object" "internal_license" {
  bucket = "chef-cd-citadel"
  key    = "a2-license"
}

data "template_file" "install_chef_automate_cli" {
  template = "${file("${path.module}/templates/install_chef_automate_cli.sh.tpl")}"

  vars {
    admin_password            = "${var.admin_password}"
    airgapped                 = "${var.airgapped}"
    channel                   = "${var.channel}"
    chef_server_admin_name    = "${var.chef_server_admin_name}"
    chef_server_org           = "${var.chef_server_org}"
    create_admin_token        = "${var.create_admin_token}"
    enable_chef_server        = "${var.enable_chef_server}"
    enable_workflow           = "${var.enable_workflow}"
    hardened_security         = "${var.hardened_security}"
    retention_older_than_days = "${var.enable_cloudwatch_metrics == "true" ? 60 : 10}"
    upgrade                   = "${var.upgrade}"
    workflow_enterprise       = "${var.workflow_enterprise}"
    enable_builder            = "${var.enable_builder}"
  }
}

locals {
  saml_config = <<SAML
[dex.v1.sys.connectors.saml]
  ca_contents = """-----BEGIN CERTIFICATE-----
MIIDnjCCAoagAwIBAgIGAUtB26KcMA0GCSqGSIb3DQEBBQUAMIGPMQswCQYDVQQGEwJVUzETMBEG
A1UECAwKQ2FsaWZvcm5pYTEWMBQGA1UEBwwNU2FuIEZyYW5jaXNjbzENMAsGA1UECgwET2t0YTEU
MBIGA1UECwwLU1NPUHJvdmlkZXIxEDAOBgNVBAMMB2dldGNoZWYxHDAaBgkqhkiG9w0BCQEWDWlu
Zm9Ab2t0YS5jb20wHhcNMTUwMTMxMjExNzA4WhcNNDUwMTMxMjExODA4WjCBjzELMAkGA1UEBhMC
VVMxEzARBgNVBAgMCkNhbGlmb3JuaWExFjAUBgNVBAcMDVNhbiBGcmFuY2lzY28xDTALBgNVBAoM
BE9rdGExFDASBgNVBAsMC1NTT1Byb3ZpZGVyMRAwDgYDVQQDDAdnZXRjaGVmMRwwGgYJKoZIhvcN
AQkBFg1pbmZvQG9rdGEuY29tMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAvaLXQkwf
XxRu8NBruKXftYwVo9+WuH2iw/6cZB1u1sxbXHDlDxGPA5e9kecQNRB/LE/My7byr/gNakAsNIg3
nTINxBe8pwKCGrNghzrCEbBxA0iphk/mYcM7+pkSqNZpRGPBUn8AIgxtihfUz/f56v2YhA15huO8
k8fJoUyjwXu9/BGCkCP16ksJ50r9IHI+qabTq4c1lMOGxZGbZ7tQjbpKdiAPclgaTzSdQ/9lomnR
uCvrnVwciDp60tGuAATdt68Re5X/5uOizlNh6k9snUWH9TQmIdyYn5bNtDa+3STXj0mIMVaAfiqQ
5pyrWRRXXb4Uqx4/9lQM1/Lh/O8yeQIDAQABMA0GCSqGSIb3DQEBBQUAA4IBAQCgSlK+ZlmQsYtz
A30/rbU5ZlW8/FtgcH7FjrSfYmfxi79Wtff3mHYDZjpPQQsncGnf+9BxwOEoBXVOoqwd+OSeWIJa
pSRbDj8Iog7ldXRLo3/+PzRrnjhrP6xj8VwPDFpzdj6Hn/QBhk0qjXd6gV7mrrAJzss3XwHKWPoC
8m2vkhGDLhmQBKCz18cVn+Z4Xhs0s9l9iWG+Ic9NBZu1KwxXI1e7yR2+xZRDPnBggDa410uDkXSb
bDZqKKny7qHKs4bioZ/HtS9NfgFV+pz1GpI50nw6ojItCPhqhgaFwtvf2brq9BHSK/DUmA3vF7/d
XoB1V6vwQXRubclyH8Ei2+1j
-----END CERTIFICATE-----
"""
  sso_url = "https://chef.okta.com/app/chefsoftware_a2localfreshinstallunstable_1/exk1d6ztz4rioEOYA1d8/sso/saml"
  entity_issuer = "https://automate.chef.co/dex/callback"
  email_attr = "email"
  username_attr = "email"
  groups_attr = "groups"
SAML
}

resource "null_resource" "soften_mounts" {
  triggers = {
    always_do = "${uuid()}"
  }

  connection {
    type        = "ssh"
    host        = "${element(var.instance_fqdn, count.index)}"
    user        = "${var.ssh_username}"
    private_key = "${data.aws_s3_bucket_object.aws_private_key.body}"
    script_path = "/home/${var.ssh_username}/run_soften_mounts.sh"
  }

  provisioner "file" {
    destination = "/home/${var.ssh_username}/soften_mounts.sh"

    content = <<EOF
#!/bin/sh
if findmnt -n -o OPTIONS /tmp | grep noexec; then
   echo "/tmp mounted with noexec, remounting"
   mount -o remount,exec /tmp
fi
exit 0
EOF
  }

  provisioner "remote-exec" {
    inline = [
      "${var.hardened_security} && sudo /bin/sh /home/${var.ssh_username}/soften_mounts.sh",
      "exit 0",
    ]
  }
}

resource "null_resource" "chef_automate_cli_deploy" {
  count = "${var.instance_count}"

  depends_on = ["null_resource.soften_mounts"]

  triggers = {
    always_do = "${uuid()}"
  }

  connection {
    type = "ssh"
    host = "${element(var.instance_fqdn, count.index)}"
    user = "${var.ssh_username}"

    private_key = "${data.aws_s3_bucket_object.aws_private_key.body}"
  }

  provisioner "file" {
    destination = "/tmp/chef-automate_journald.conf"

    content = <<EOF
[Journal]
Storage=persistent
SystemMaxUse=${var.journald_system_max_use}
SystemMaxFileSize=1G
RateLimitBurst=0
RateLimitInterval=0
ForwardToSyslog=no
EOF
  }

  provisioner "remote-exec" {
    inline = [
      "set -e",
      "sudo mkdir -p /etc/systemd/journald.conf.d",
      "sudo cp /tmp/chef-automate_journald.conf /etc/systemd/journald.conf.d/chef-automate_journald.conf",
      "sudo systemctl restart systemd-journald",
    ]
  }

  provisioner "file" {
    destination = "/tmp/airgapped-iptables.rules"

    content = <<EOF
*filter

# allow inbound traffic
:INPUT ACCEPT [4312:2537760]
:FORWARD ACCEPT [0:0]

# set DROP policy for all outbound traffic
:OUTPUT DROP [78:6704]

# allow outbound traffic for established connections
# this allows external systems like our CI infrastructure and developers' workstations
# to connect to the instance to provision it, troubleshoot it or perform acceptance testing
# while at the same time rejecting any unauthorized outbound traffic that is initiated by
# the instance
-A OUTPUT -m conntrack --ctstate ESTABLISHED -j ACCEPT

# allow outbound traffic to localhost
-A OUTPUT -o lo -j ACCEPT

# allow outbound traffic for DNS requests
# this is necessary for things like the sssd service to
# resolve Active Directory hostnames
-A OUTPUT -p udp -m udp --dport 53 -j ACCEPT

# allow outbound traffic to NTP servers
-A OUTPUT -p udp -m udp --dport 123 -j ACCEPT

# allow outbound traffic to Active Directory servers for SSH auth
-A OUTPUT -d 172.21.8.50/32 -p tcp -m tcp --dport 636 -j ACCEPT
-A OUTPUT -d 172.21.8.105/32 -p tcp -m tcp --dport 636 -j ACCEPT

# allow outbound traffic to redis servers for sensu monitoring
-A OUTPUT -d 172.21.240.208/32 -p tcp -m tcp --dport 6379 -j ACCEPT
-A OUTPUT -d 172.21.246.42/32 -p tcp -m tcp --dport 6379 -j ACCEPT
COMMIT
EOF
  }

  provisioner "file" {
    destination = "/tmp/iptablesload"

    content = <<EOF
#!/bin/sh
iptables-restore < /etc/airgapped-iptables.rules
exit 0
EOF
  }

  # enable connection tracking early in iptables so the remote-exec that sets OUTPUT policy to DROP
  # won't intermittently lose its SSH connection and cause terraform to wait indefinitely for a response
  provisioner "remote-exec" {
    inline = [
      "set -e",
      "${var.airgapped} && sudo iptables -A OUTPUT -m conntrack --ctstate ESTABLISHED -j ACCEPT",
      "exit 0",
    ]
  }

  provisioner "remote-exec" {
    inline = [
      "set -e",
      "${var.airgapped} && sudo mv /tmp/airgapped-iptables.rules /etc/airgapped-iptables.rules",
      "${var.airgapped} && sudo mv /tmp/iptablesload /etc/network/if-pre-up.d/iptablesload",
      "${var.airgapped} && sudo chmod a+x /etc/network/if-pre-up.d/iptablesload",
      "${var.airgapped} && sudo /etc/network/if-pre-up.d/iptablesload",
      "exit 0",
    ]
  }

  provisioner "file" {
    source      = "../../../inspec/a2-hardened-security"
    destination = "/tmp"
  }

  provisioner "file" {
    destination = "/tmp/install_chef_automate_cli.sh"
    content     = "${data.template_file.install_chef_automate_cli.rendered}"
  }

  provisioner "file" {
    destination = "/tmp/60-chef-automate.conf"

    content = <<EOF
# Kernel parameters required by A2 preflight check
vm.max_map_count=262144
vm.dirty_expire_centisecs=20000
EOF
  }

  provisioner "remote-exec" {
    inline = [
      "set -evx",
      "sudo mv /tmp/60-chef-automate.conf /etc/sysctl.d/60-chef-automate.conf",
      "sudo --login sysctl --system",
    ]
  }

  provisioner "file" {
    destination = "/tmp/chef-automate-config.toml"

    content = <<TOML
[global.v1]
  fqdn = "${var.alb_fqdn == "" ? element(var.instance_fqdn, count.index) : var.alb_fqdn}"

[deployment.v1.svc]
  channel = "${var.channel}"
  deployment_type = "${var.deployment_type}"
  upgrade_strategy = "${var.upgrade == "true" ? "at-once" : "none"}"
  manifest_cache_expiry = "0s"
  products = ${jsonencode(compact(list(
      "automate",
      var.enable_desktop ? "desktop" : "",
      var.enable_chef_server ? "chef-server" : "",
      var.enable_workflow ? "workflow" : "",
      var.enable_builder ? "builder" : "")))}

[gateway.v1.sys.service]
  trial_license_url = "https://licensing-${var.channel}.chef.io/create-trial"

[[load_balancer.v1.sys.frontend_tls]]
  cert = """${data.vault_generic_secret.wildcard_chef.data["crt"]}"""
  key = """${data.vault_generic_secret.wildcard_chef.data["key"]}"""

[license_control.v1.svc]
  license = """${data.aws_s3_bucket_object.internal_license.body}"""
[license_control.v1.sys.telemetry]
  url = "https://telemetry-acceptance.chef.io"

[postgresql.v1.sys.pg]
  max_connections = 128

${var.saml == "true" ? local.saml_config : ""}

[opensearch.v1.sys.runtime]
  heapsize = "${var.enable_cloudwatch_metrics == "true" ? "16g" : "2g"}"
[opensearch.v1.sys.cluster]
  max_shards_per_node = ${var.enable_cloudwatch_metrics == "true" ? "1500" : "1000"}
TOML
  }

  provisioner "remote-exec" {
    inline = [
      "set -evx",
      "sudo chmod +x /tmp/install_chef_automate_cli.sh",
      "sudo bash --login /tmp/install_chef_automate_cli.sh",
    ]
  }
}

data "http" "chef_automate_admin_token" {
  count = "${var.create_admin_token == "true" ? var.instance_count : 0}"

  depends_on = ["null_resource.chef_automate_cli_deploy"]

  url = "https://${element(var.instance_fqdn, count.index)}/admin-token.txt"
}

data "http" "chef_automate_chef_server_admin_key" {
  count = "${var.enable_chef_server == "true" ? var.instance_count : 0}"

  depends_on = ["null_resource.chef_automate_cli_deploy"]

  url = "https://${element(var.instance_fqdn, count.index)}/chef-server-admin-key.txt"
}

resource "null_resource" "chef_automate_metrics_prereqs" {
  count = "${var.enable_cloudwatch_metrics == "true" ? var.instance_count : 0}"

  depends_on = ["null_resource.chef_automate_cli_deploy"]

  triggers = {
    instance_id = "${element(var.instance_id, count.index)}"
  }

  connection {
    type = "ssh"
    host = "${element(var.instance_fqdn, count.index)}"
    user = "${var.ssh_username}"

    private_key = "${data.aws_s3_bucket_object.aws_private_key.body}"
  }

  # Install requirements for the metrics scripts we bring in later.
  provisioner "remote-exec" {
    inline = [
      "set -e",
      "sudo apt-get update",
      "sudo apt install -y python-pip unzip sysstat libswitch-perl libdatetime-perl libunix-syslog-perl libio-all-lwp-perl libdigest-sha-perl",
      "sudo pip install awscli",
      "wget http://aws-cloudwatch.s3.amazonaws.com/downloads/CloudWatchMonitoringScripts-1.2.1.zip",
      "sudo unzip -o -d / CloudWatchMonitoringScripts-1.2.1.zip",
      "wget -O /tmp/jq https://github.com/stedolan/jq/releases/download/jq-1.5/jq-linux64",
      "sudo install /tmp/jq /usr/local/bin/",
    ]
  }
}

resource "null_resource" "chef_automate_metrics" {
  count = "${var.enable_cloudwatch_metrics == "true" ? var.instance_count : 0}"

  depends_on = ["null_resource.chef_automate_metrics_prereqs"]

  triggers = {
    always_do = "${uuid()}"
  }

  connection {
    type = "ssh"
    host = "${element(var.instance_fqdn, count.index)}"
    user = "${var.ssh_username}"

    private_key = "${data.aws_s3_bucket_object.aws_private_key.body}"
  }

  provisioner "file" {
    source      = "${path.module}/files/collect_metrics"
    destination = "/tmp"
  }

  provisioner "remote-exec" {
    inline = [
      "set -e",
      "sed -i 's|--namespace A2_Performance_Test_dev|--namespace ${var.cloudwatch_namespace}|' /tmp/collect_metrics/*",
      "chmod a+x /tmp/collect_metrics/*",
      "sudo rm -rf /opt/collect_metrics",
      "sudo mv /tmp/collect_metrics /opt",
    ]
  }

  provisioner "file" {
    source      = "${path.module}/files/cloudwatch_cron"
    destination = "/tmp/cloudwatch_cron"
  }

  provisioner "remote-exec" {
    inline = [
      "set -e",
      "sudo cp /tmp/cloudwatch_cron /etc/cron.d/cloudwatch",
    ]
  }
}

data "aws_region" "current" {}

data "template_file" "performance_cloudwatch_dashboard" {
  count = "${var.enable_cloudwatch_metrics == "true" ? 1 : 0}"

  template = "${file("${path.module}/templates/performance_cloudwatch_dashboard.tpl")}"

  vars {
    cloudwatch_namespace = "${var.cloudwatch_namespace}"
    aws_region           = "${data.aws_region.current.name}"
  }
}

resource "aws_cloudwatch_dashboard" "performance_cloudwatch_dashboard" {
  count = "${var.enable_cloudwatch_metrics == "true" ? 1 : 0}"

  dashboard_name = "${var.cloudwatch_namespace}"

  dashboard_body = "${data.template_file.performance_cloudwatch_dashboard.rendered}"
}



# ======================================================
# Archivo original: outputs.tf
# Carpeta: C:\Users\asus\cloned_repos\chef\automate\terraform\test-environments\modules\chef_automate_install
# ======================================================

output "chef_automate_admin_token" {
  value       = "${element(concat(data.http.chef_automate_admin_token.*.body, list("")), 0)}"
  description = "An A2 admin API token."
}

output "chef_automate_chef_server_admin_name" {
  value       = "${var.chef_server_admin_name}"
  description = "An A2 Chef Server admin user."
}

output "chef_automate_chef_server_admin_key" {
  value       = "${element(concat(data.http.chef_automate_chef_server_admin_key.*.body, list("")), 0)}"
  description = "An A2 Chef Server admin key."
}

output "chef_automate_chef_server_org" {
  value       = "${var.chef_server_org}"
  description = "An A2 Chef Server organization."
}



# ======================================================
# Archivo original: variables.tf
# Carpeta: C:\Users\asus\cloned_repos\chef\automate\terraform\test-environments\modules\chef_automate_install
# ======================================================

variable "instance_count" {
  default     = 1
  description = "The number of instances to provision."
}

variable "instance_id" {
  type        = "list"
  description = "The AWS instance ID for the instance. Used to determine when re-provisioning is required."
}

variable "instance_fqdn" {
  type        = "list"
  description = "The FQDN for the instance. Typically an output of the cd_instance module."
}

variable "ssh_username" {
  type        = "string"
  description = "The SSH username for the instance. Typically an output of the cd_instance module."
}

variable "airgapped" {
  default     = "false"
  description = "Instance is airgapped."
}

variable "hardened_security" {
  default     = "false"
  description = "Instance has hardened security."
}

variable "enable_chef_server" {
  default     = "false"
  description = "Enables A2 Chef Server feature."
}

variable "chef_server_org" {
  default     = "test"
  description = "A2 Chef Server organization to create."
}

variable "chef_server_admin_name" {
  default     = "test-admin"
  description = "A2 Chef Server admin user to create."
}

variable "enable_cloudwatch_metrics" {
  default     = "false"
  description = "Collect CloudWatch metrics and create CloudWatch dashboard."
}

variable "cloudwatch_namespace" {
  default     = "A2_Performance_Test_dev"
  description = "CloudWatch namespace."
}

variable "create_admin_token" {
  default     = "false"
  description = "Create an API admin token."
}

variable "journald_system_max_use" {
  default     = "6G"
  description = "Controls how much disk space the journal may use up at most."
}

#
# Chef Baseline
#

variable "enable_email" {
  default     = "true"
  description = "Enable email on this instance."
}

variable "enable_monitoring" {
  default     = "true"
  description = "Enable Sensu monitoring on this instance."
}

variable "chef_environment" {
  default     = "_default"
  description = "The Chef Environment on chef-server.chef.co in which to put the instance."
}

#
# Deploy YAML Config
#

variable "upgrade" {
  default = "false"
}

variable "channel" {
  default = "dev"
}

variable "deployment_type" {
  default = "local"
}

variable "admin_password" {
  default = "chefautomate"
}

variable "alb_fqdn" {
  default = ""
}

variable "saml" {
  default     = "false"
  description = "Enable SAML login"
}

variable "enable_workflow" {
  default     = "false"
  description = "Enable A2 Workflow feature."
}

variable "enable_desktop" {
  default     = "false"
  description = "Enable Desktop view on A2."
}

variable "workflow_enterprise" {
  default     = "demo"
  description = "A2 Workflow enterprise name."
}

variable "enable_builder" {
  default     = "false"
  description = "Enables A2 Builder feature."
}




# ======================================================
# Archivo fusionado: terraform\test-environments\scenarios\cloudscenarios.tf
# Piezas Terraform en carpeta: 74
# Tiene arquitectura (EC2/Docker/Serverless): True
# ======================================================



# ======================================================
# Archivo original: airgapped_common.tf
# Carpeta: C:\Users\asus\cloned_repos\chef\automate\terraform\test-environments\scenarios
# ======================================================

resource "null_resource" "create_airgap_bundle" {
  triggers = {
    always_do = "${uuid()}"
  }

  provisioner "local-exec" {
    command = "curl -o /tmp/chef-automate.zip https://packages.chef.io/files/${var.channel}/latest/chef-automate-cli/chef-automate_linux_amd64.zip"
  }

  provisioner "local-exec" {
    command = "unzip -o /tmp/chef-automate.zip -d /tmp"
  }

  provisioner "local-exec" {
    command = "chmod +x /tmp/chef-automate"
  }

  provisioner "local-exec" {
    command = "/tmp/chef-automate airgap bundle create /tmp/automate.aib --channel ${var.channel}"
  }
}



# ======================================================
# Archivo original: airgapped_single_local_fresh_install.tf
# Carpeta: C:\Users\asus\cloned_repos\chef\automate\terraform\test-environments\scenarios
# ======================================================

#
# A simple local install of A2 using the chef-automate CLI. It is rebuilt everytime we run `terraform apply`.
#

module "airgapped_single_local_fresh_install" {
  source = "github.com/chef/es-terraform//modules/cd_instance_v2"

  # DNS components ( a2-airgapped-local-fresh-install-{{channel}}.cd.chef.co )
  subdomain        = "a2-airgapped-local-fresh-install"
  subdomain_suffix = "-${var.dns_suffix}"

  # Metadata
  meta_title       = "Airgapped Single Local (Fresh Install)"
  meta_description = "A2 stack deployed locally from an airgap bundle on a single host using the chef-automate CLI."
  meta_type        = "habitat"

  # AWS Instance Configuration
  vpc            = "${var.environment}"
  platform       = "ubuntu-16.04"
  key_name       = "cd-infrastructure"
  instance_type  = "m5.large"
  root_volume_gb = "50"
  always_rebuild = "true"

  # Required AWS Tags
  tag_dept        = "CoreEng"
  tag_contact     = "${var.aws_tag_contact}"
  tag_application = "a2"

  additional_tags = {
    X-Package-Type     = "habitat"
    X-Install-Utility  = "chef-automate-cli"
    X-Install-Strategy = "fresh-install"
    X-Topology         = "single"
    X-Deployment-Type  = "local"
    X-Channel          = "${var.channel}"
    X-LongRunning      = "true"
    X-Sleep            = "off=(M-S,23);on=(M-S,7);tz=Asia/Kolkata"
  }
}

resource "null_resource" "airgapped_single_local_fresh_install_upload_airgap_bundle" {
  triggers = {
    always_do = "${uuid()}"
  }

  depends_on = ["null_resource.create_airgap_bundle"]

  connection {
    type = "ssh"
    host = "${element(module.airgapped_single_local_fresh_install.fqdn, count.index)}"
    user = "${module.airgapped_single_local_fresh_install.ssh_username}"

    private_key = "${data.aws_s3_bucket_object.aws_private_key.body}"
  }

  provisioner "file" {
    source      = "/tmp/chef-automate"
    destination = "/tmp/chef-automate"
  }

  provisioner "remote-exec" {
    inline = [
      "chmod a+x /tmp/chef-automate",
      "sudo mv /tmp/chef-automate /usr/local/bin/chef-automate",
    ]
  }

  provisioner "file" {
    source      = "/tmp/automate.aib"
    destination = "/tmp/automate.aib"
  }
}

module "airgapped_single_local_fresh_install_deploy" {
  source = "../modules/chef_automate_install"

  instance_id   = "${module.airgapped_single_local_fresh_install.instance_id}"
  instance_fqdn = "${module.airgapped_single_local_fresh_install.fqdn}"
  ssh_username  = "${module.airgapped_single_local_fresh_install.ssh_username}"

  airgapped               = "${null_resource.airgapped_single_local_fresh_install_upload_airgap_bundle.id != "" ? true : false}"
  journald_system_max_use = "${var.channel == "acceptance" ? "20G" : "6G"}"

  # Chef Baseline
  enable_monitoring = "false"
  chef_environment  = "${var.chef_environment}"

  # Automate Install
  channel         = "${var.channel}"
  deployment_type = "local"
}



# ======================================================
# Archivo original: airgapped_single_local_inplace_upgrade.tf
# Carpeta: C:\Users\asus\cloned_repos\chef\automate\terraform\test-environments\scenarios
# ======================================================

#
# A simple local install of A2 using the chef-automate CLI. It currently uses a pseudo-inplace upgrade.
#

module "airgapped_single_local_inplace_upgrade" {
  source = "github.com/chef/es-terraform//modules/cd_instance_v2"

  # DNS components ( a2-airgapped-local-inplace-upgrade-{{channel}}.cd.chef.co )
  subdomain        = "a2-airgapped-local-inplace-upgrade"
  subdomain_suffix = "-${var.dns_suffix}"

  # Metadata
  meta_title       = "Airgapped Single Local (Inplace Upgrade)"
  meta_description = "A2 stack (using SAML) deployed locally from an airgap bundle on a single host using the chef-automate CLI."
  meta_type        = "habitat"

  # AWS Instance Configuration
  vpc            = "${var.environment}"
  platform       = "ubuntu-16.04"
  key_name       = "cd-infrastructure"
  instance_type  = "m5.large"
  root_volume_gb = "200"

  # Required AWS Tags
  tag_dept        = "CoreEng"
  tag_contact     = "${var.aws_tag_contact}"
  tag_application = "a2"

  additional_tags = {
    X-Package-Type     = "habitat"
    X-Install-Utility  = "chef-automate-cli"
    X-Install-Strategy = "inplace-upgrade"
    X-Topology         = "single"
    X-Deployment-Type  = "local"
    X-Channel          = "${var.channel}"
    X-SAML             = "saml"
    X-LongRunning      = "true"
    X-Sleep            = "off=(M-S,23);on=(M-S,7);tz=Asia/Kolkata"
  }
}

resource "null_resource" "airgapped_single_local_inplace_upgrade_upload_airgap_bundle" {
  triggers = {
    always_do = "${uuid()}"
  }

  depends_on = ["null_resource.create_airgap_bundle"]

  connection {
    type = "ssh"
    host = "${element(module.airgapped_single_local_inplace_upgrade.fqdn, count.index)}"
    user = "${module.airgapped_single_local_inplace_upgrade.ssh_username}"

    private_key = "${data.aws_s3_bucket_object.aws_private_key.body}"
  }

  provisioner "file" {
    source      = "/tmp/chef-automate"
    destination = "/tmp/chef-automate"
  }

  provisioner "remote-exec" {
    inline = [
      "chmod a+x /tmp/chef-automate",
      "sudo mv /tmp/chef-automate /usr/local/bin/chef-automate",
    ]
  }

  provisioner "file" {
    source      = "/tmp/automate.aib"
    destination = "/tmp/automate.aib"
  }
}

module "airgapped_single_local_inplace_upgrade_deploy" {
  source = "../modules/chef_automate_install"

  instance_id   = "${module.airgapped_single_local_inplace_upgrade.instance_id}"
  instance_fqdn = "${module.airgapped_single_local_inplace_upgrade.fqdn}"
  ssh_username  = "${module.airgapped_single_local_inplace_upgrade.ssh_username}"

  airgapped               = "${null_resource.airgapped_single_local_inplace_upgrade_upload_airgap_bundle.id != "" ? true : false}"
  journald_system_max_use = "${var.channel == "acceptance" ? "20G" : "6G"}"

  # Chef Baseline
  enable_monitoring = "true"
  chef_environment  = "${var.chef_environment}"

  # Automate Install
  channel         = "${var.channel}"
  deployment_type = "local"
  upgrade         = "true"

  # SAML
  saml = "true"
}



# ======================================================
# Archivo original: backend.tf
# Carpeta: C:\Users\asus\cloned_repos\chef\automate\terraform\test-environments\scenarios
# ======================================================

terraform {
  backend "s3" {
    profile = "chef-cd"
    bucket  = "chef-cd-terraform-state"
    region  = "us-west-2"
  }
}



# ======================================================
# Archivo original: chef-server_performance_test_single_local_inplace_upgrade.tf
# Carpeta: C:\Users\asus\cloned_repos\chef\automate\terraform\test-environments\scenarios
# ======================================================

#
# Performance test a simple local install of A2 using the chef-automate CLI. It currently uses a pseudo-inplace upgrade.
#

module "chef_server_performance_test_single_local_inplace_upgrade" {
  source = "github.com/chef/es-terraform//modules/cd_instance_v2"

  # DNS components ( a2-cs-single-local-inplace-upgrade-{{channel}}.cd.chef.co )
  subdomain        = "a2-cs-single-local-inplace-upgrade"
  subdomain_suffix = "-${var.dns_suffix}"

  # Metadata
  meta_title       = "Performance Test A2 Chef Server Single Local (Inplace Upgrade)"
  meta_description = "Performance test A2 Chef Server (inplace upgrade, using SAML)."
  meta_type        = "habitat"

  # AWS Instance Configuration
  vpc            = "${var.environment}"
  platform       = "ubuntu-16.04"
  key_name       = "cd-infrastructure"
  instance_type  = "r5.2xlarge"
  root_volume_gb = "100"

  # Required AWS Tags
  tag_dept        = "CoreEng"
  tag_contact     = "${var.aws_tag_contact}"
  tag_application = "a2"

  additional_tags = {
    X-Package-Type     = "habitat"
    X-Install-Utility  = "chef-automate-cli"
    X-Install-Strategy = "inplace-upgrade"
    X-Topology         = "single"
    X-Deployment-Type  = "local"
    X-Channel          = "${var.channel}"
    X-SAML             = "saml"
    X-LongRunning      = "true"
    X-Sleep            = "off=(M-S,23);on=(M-S,7);tz=Asia/Kolkata"
  }
}

resource "aws_ebs_volume" "a2_chef_server_habitat_volume" {
  lifecycle {
    prevent_destroy = true

    ignore_changes = [
      "iops",
      "size",
      "type",
    ]
  }

  availability_zone = "${element(module.chef_server_performance_test_single_local_inplace_upgrade.availability_zone, count.index)}"
  size              = "${1.5 * 1024}"
  type              = "gp2"

  tags {
    Name          = "${element(module.chef_server_performance_test_single_local_inplace_upgrade.fqdn, count.index)}"
    X-Dept        = "CoreEng"
    X-Contact     = "${var.aws_tag_contact}"
    X-Application = "a2"
  }
}

module "chef_server_attach_habitat_volume" {
  source = "github.com/chef/es-terraform//modules/attach_ebs_volume"

  actual_device_name = "/dev/nvme1n1"
  ec2_device_name    = "/dev/xvdh"
  instance_id        = "${module.chef_server_performance_test_single_local_inplace_upgrade.instance_id}"
  instance_fqdn      = "${module.chef_server_performance_test_single_local_inplace_upgrade.fqdn}"
  ssh_private_key    = "${data.aws_s3_bucket_object.aws_private_key.body}"
  ssh_username       = "${module.chef_server_performance_test_single_local_inplace_upgrade.ssh_username}"
  volume_id          = "${aws_ebs_volume.a2_chef_server_habitat_volume.*.id}"
  volume_mount_point = "/hab"
}

module "chef_server_performance_test_single_local_inplace_upgrade_deploy" {
  source = "../modules/chef_automate_install"

  instance_id   = "${module.chef_server_attach_habitat_volume.instance_id}"
  instance_fqdn = "${module.chef_server_performance_test_single_local_inplace_upgrade.fqdn}"
  ssh_username  = "${module.chef_server_performance_test_single_local_inplace_upgrade.ssh_username}"

  journald_system_max_use = "${var.channel == "acceptance" ? "20G" : "6G"}"

  # Chef Baseline
  enable_monitoring = "false"
  chef_environment  = "${var.chef_environment}"

  # Automate Install
  channel         = "${var.channel}"
  deployment_type = "local"
  upgrade         = "true"

  # SAML
  saml = "true"

  # Enable A2 Chef Server feature
  enable_chef_server = "true"

  # Create admin-token
  create_admin_token = "true"

  # Setup CloudWatch
  enable_cloudwatch_metrics = "true"
  cloudwatch_namespace      = "A2_Chef_Server_Performance_Test_${var.dns_suffix}"
}

#
# Create and configure Chef Load instances.
#

locals {
  chef_server_performance_test_chef_load_count = 1
}

module "chef_server_performance_test_chef_load" {
  source = "github.com/chef/es-terraform//modules/cd_instance_v2"

  instance_count = "${local.chef_server_performance_test_chef_load_count}"

  # DNS components ( a2-cs-chef-load-{{channel}}.cd.chef.co )
  subdomain        = "a2-cs-chef-load"
  subdomain_suffix = "-${var.dns_suffix}"

  # Metadata
  meta_title       = "chef-load Instance"
  meta_description = "chef-load instance applying load to A2 Chef Server for performance testing."
  meta_type        = "habitat"

  # AWS Instance Configuration
  vpc           = "${var.environment}"
  platform      = "ubuntu-16.04"
  key_name      = "cd-infrastructure"
  instance_type = "c5.large"

  # Required AWS Tags
  tag_dept        = "CoreEng"
  tag_contact     = "${var.aws_tag_contact}"
  tag_application = "a2"
}

module "chef_server_performance_test_chef_load_deploy" {
  source = "../modules/chef_load_instance"

  instance_count = "${local.chef_server_performance_test_chef_load_count}"
  instance_id    = "${module.chef_server_performance_test_chef_load.instance_id}"
  instance_fqdn  = "${module.chef_server_performance_test_chef_load.fqdn}"
  ssh_username   = "${module.chef_server_performance_test_chef_load.ssh_username}"

  # Chef Baseline
  enable_monitoring = "false"
  chef_environment  = "${var.chef_environment}"

  # Chef Load Install
  automate_server_fqdn    = "${element(module.chef_server_performance_test_single_local_inplace_upgrade.fqdn, 0)}"
  automate_server_token   = "${module.chef_server_performance_test_single_local_inplace_upgrade_deploy.chef_automate_admin_token}"
  chef_load_nodes         = "2000"
  chef_load_actions       = "1000"
  chef_load_interval      = "30"
  enable_chef_server_load = "true"
  chef_server_client_name = "${module.chef_server_performance_test_single_local_inplace_upgrade_deploy.chef_automate_chef_server_admin_name}"
  chef_server_client_key  = "${module.chef_server_performance_test_single_local_inplace_upgrade_deploy.chef_automate_chef_server_admin_key}"
  chef_server_fqdn        = "${element(module.chef_server_performance_test_single_local_inplace_upgrade.fqdn, 0)}"
  chef_server_org         = "${module.chef_server_performance_test_single_local_inplace_upgrade_deploy.chef_automate_chef_server_org}"
  run_list                = ["audit"]
  api_get_requests        = ["search/node?q=*%253A*&sort=X_CHEF_id_CHEF_X%20asc&start=&rows=100"]
}

# The following configuration provisions CloudWatch alarms that notify an AWS SNS topic which
# triggers/resolves incidents in a non-paging PagerDuty service named A2_Chef_Server_Performance_${var.dns_suffix}.
# You must manually add a Slack channel integration to the PagerDuty service in order for
# triggered/resolved notifications to be forwarded to Slack.

resource "pagerduty_service" "a2_chef_server_performance" {
  name                    = "A2_Chef_Server_Performance_${var.dns_suffix}"
  auto_resolve_timeout    = "null"
  acknowledgement_timeout = 600

  escalation_policy = "${data.pagerduty_escalation_policy.nonpaging.id}"
  alert_creation    = "create_incidents"
}

resource "pagerduty_service_integration" "a2_chef_server_performance_cloudwatch" {
  name    = "A2_Chef_Server_Performance_${var.dns_suffix} Cloudwatch"
  service = "${pagerduty_service.a2_chef_server_performance.id}"
  vendor  = "${data.pagerduty_vendor.cloudwatch.id}"
}

resource "aws_sns_topic" "a2_chef_server_performance_notifier" {
  name = "A2_Chef_Server_Performance_${var.dns_suffix}_Notifier"
}

resource "aws_sns_topic_subscription" "a2_chef_server_performance_notifier_pagerduty_integration" {
  topic_arn              = "${aws_sns_topic.a2_chef_server_performance_notifier.arn}"
  protocol               = "https"
  endpoint               = "https://events.pagerduty.com/integration/${pagerduty_service_integration.a2_chef_server_performance_cloudwatch.integration_key}/enqueue"
  endpoint_auto_confirms = true
}

resource "aws_cloudwatch_metric_alarm" "a2_chef_server_performance_2xxStatuses" {
  alarm_name          = "a2-chef-server-performance-${var.dns_suffix}-2xxStatuses"
  comparison_operator = "LessThanThreshold"
  evaluation_periods  = "2"
  metric_name         = "2xxStatuses"
  namespace           = "A2_Chef_Server_Performance_Test_${var.dns_suffix}"
  period              = "300"
  statistic           = "Average"
  threshold           = "350"
  alarm_description   = "This metric monitors A2_Chef_Server_Performance_Test_${var.dns_suffix} 2xxStatuses"
  treat_missing_data  = "breaching"
  alarm_actions       = ["${aws_sns_topic.a2_chef_server_performance_notifier.arn}"]
  ok_actions          = ["${aws_sns_topic.a2_chef_server_performance_notifier.arn}"]
}

resource "aws_cloudwatch_metric_alarm" "a2_chef_server_performance_5xxStatuses" {
  alarm_name          = "a2-chef-server-performance-${var.dns_suffix}-5xxStatuses"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "2"
  metric_name         = "5xxStatuses"
  namespace           = "A2_Chef_Server_Performance_Test_${var.dns_suffix}"
  period              = "300"
  statistic           = "Average"
  threshold           = "10"
  alarm_description   = "This metric monitors A2_Chef_Server_Performance_Test_${var.dns_suffix} 5xxStatuses"
  treat_missing_data  = "breaching"
  alarm_actions       = ["${aws_sns_topic.a2_chef_server_performance_notifier.arn}"]
  ok_actions          = ["${aws_sns_topic.a2_chef_server_performance_notifier.arn}"]
}



# ======================================================
# Archivo original: common.tf
# Carpeta: C:\Users\asus\cloned_repos\chef\automate\terraform\test-environments\scenarios
# ======================================================

# 
# Common Data Source
# Data sources that should be shared across multiple scenario files should be placed here.
#

module "cd_infrastructure" {
  source      = "github.com/chef/es-terraform//modules/cd_common_infrastructure"
  environment = "${var.environment}"
}

provider "aws" {
  region  = "${module.cd_infrastructure.aws_region}"
  profile = "${module.cd_infrastructure.aws_profile}"
}

#
# Pull keys from citadel
#

data "aws_s3_bucket_object" "chef_user_key" {
  bucket = "chef-cd-citadel"
  key    = "cd-infrastructure-chef-user.pem"
}

data "aws_s3_bucket_object" "aws_private_key" {
  bucket = "chef-cd-citadel"
  key    = "cd-infrastructure-aws"
}

data "aws_s3_bucket_object" "pager_duty_token" {
  bucket = "chef-cd-citadel"
  key    = "pager_duty_token"
}

# Configure the PagerDuty provider
# Pinning the version to 1.11 since 2.0 requires a newer version of TF(.13+) versus the .11 
# we are currently using
provider "pagerduty" {
  token   = "${data.aws_s3_bucket_object.pager_duty_token.body}"
  version = "1.11.0"
}

data "pagerduty_team" "release_engineering" {
  name = "Release Engineering"
}

data "pagerduty_user" "chef_ci_service_account" {
  email = "chef-ci@chef.io"
}

data "pagerduty_escalation_policy" "nonpaging" {
  name = "Non-paging Escalation Policy"
}

data "pagerduty_vendor" "cloudwatch" {
  name = "Cloudwatch"
}



# ======================================================
# Archivo original: inspec_target_rhel7.tf
# Carpeta: C:\Users\asus\cloned_repos\chef\automate\terraform\test-environments\scenarios
# ======================================================

#
# This is a simple InSpec target that can be hooked up to a Compliance Scanner.
#

module "inspec_target_rhel7" {
  source = "github.com/chef/es-terraform//modules/cd_instance_v2"

  # DNS components ( inspec-target-rhel7-{{channel}}.cd.chef.co )
  subdomain        = "inspec-target-rhel7"
  subdomain_suffix = "-${var.dns_suffix}"

  # Metadata
  meta_title       = "RHEL7 InSpec Target"
  meta_description = "Long-running target for Compliance Scanning"
  meta_type        = "inspec"

  # AWS Instance Configuration
  vpc            = "${var.environment}"
  platform       = "rhel-7"
  key_name       = "cd-infrastructure"
  instance_type  = "t3.small"
  root_volume_gb = "20"

  # Required AWS Tags
  tag_dept        = "CoreEng"
  tag_contact     = "${var.aws_tag_contact}"
  tag_application = "a2"

  additional_tags = {
    X-LongRunning = "true"
    X-Sleep       = "off=(M-S,23);on=(M-S,7);tz=Asia/Kolkata"
  }
}

module "inspec_target_rhel7_cd_base" {
  source = "github.com/chef/es-terraform//modules/cd_base"

  instance_id   = "${module.inspec_target_rhel7.instance_id}"
  instance_fqdn = "${module.inspec_target_rhel7.fqdn}"
  ssh_username  = "${module.inspec_target_rhel7.ssh_username}"

  enable_monitoring = "${var.enable_monitoring}"
  chef_environment  = "${var.chef_environment}"
}

#
# This is a temporary workaround to get a user on the box that the Scanner can
# work as. In the future this user should be a service-user managed by the
# cd_base module.
#

data "aws_s3_bucket_object" "inspec_scanner_pub_key" {
  bucket = "chef-cd-citadel"
  key    = "inspec-scanner_id_rsa.pub"
}

resource "null_resource" "install_service_user" {
  depends_on = ["module.inspec_target_rhel7"]

  triggers = {
    instance_id = "${element(module.inspec_target_rhel7.instance_id, 0)}"
  }

  connection {
    type = "ssh"
    host = "${element(module.inspec_target_rhel7.fqdn, 0)}"
    user = "${module.inspec_target_rhel7.ssh_username}"

    private_key = "${data.aws_s3_bucket_object.aws_private_key.body}"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo /usr/sbin/useradd -m inspec-scanner",
      "echo 'inspec-scanner ALL=(ALL) NOPASSWD:ALL' | sudo tee /etc/sudoers.d/inspec-scanner",
      "sudo mkdir -p /home/inspec-scanner/.ssh",
    ]
  }

  provisioner "file" {
    destination = "/tmp/inspec_scanner_pub_key"
    content     = "${data.aws_s3_bucket_object.inspec_scanner_pub_key.body}"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo mv /tmp/inspec_scanner_pub_key /home/inspec-scanner/.ssh/authorized_keys",
      "sudo chown -R inspec-scanner:inspec-scanner /home/inspec-scanner/.ssh",
      "sudo chmod 0600 /home/inspec-scanner/.ssh/authorized_keys",
    ]
  }
}



# ======================================================
# Archivo original: outputs.tf
# Carpeta: C:\Users\asus\cloned_repos\chef\automate\terraform\test-environments\scenarios
# ======================================================

output "dashboard" {
  value = "${module.dashboard.fqdn}"
}

output "chef_server_performance_test_single_local_inplace_upgrade_fqdn" {
  value = "${module.chef_server_performance_test_single_local_inplace_upgrade.fqdn}"
}

output "chef_server_performance_test_single_local_inplace_upgrade_ssh_username" {
  value = "${module.chef_server_performance_test_single_local_inplace_upgrade.ssh_username}"
}



# ======================================================
# Archivo original: performance_test_single_local_inplace_upgrade.tf
# Carpeta: C:\Users\asus\cloned_repos\chef\automate\terraform\test-environments\scenarios
# ======================================================

#
# Performance test a simple local install of A2 using the chef-automate CLI. It currently uses a pseudo-inplace upgrade.
#

module "performance_test_single_local_inplace_upgrade" {
  source = "github.com/chef/es-terraform//modules/cd_instance_v2"

  # DNS components ( a2-perf-test-single-local-inplace-upgrade-{{channel}}.cd.chef.co )
  subdomain        = "a2-perf-test-single-local-inplace-upgrade"
  subdomain_suffix = "-${var.dns_suffix}"

  # Metadata
  meta_title       = "Performance Test Single Local (Inplace Upgrade)"
  meta_description = "Performance test A2 (inplace upgrade, using SAML). A2_Performance_Test_${var.dns_suffix} CloudWatch dashboard is available in the chef-cd AWS account. Contact #helpdesk for okta access."
  meta_type        = "habitat"

  # AWS Instance Configuration
  vpc            = "${var.environment}"
  platform       = "ubuntu-16.04"
  key_name       = "cd-infrastructure"
  instance_type  = "m5.2xlarge"
  root_volume_gb = "100"

  # Required AWS Tags
  tag_dept        = "CoreEng"
  tag_contact     = "${var.aws_tag_contact}"
  tag_application = "a2"

  additional_tags = {
    X-Package-Type     = "habitat"
    X-Install-Utility  = "chef-automate-cli"
    X-Install-Strategy = "inplace-upgrade"
    X-Topology         = "single"
    X-Deployment-Type  = "local"
    X-Channel          = "${var.channel}"
    X-SAML             = "saml"
    X-CI-Test          = "e2e"
    X-LongRunning      = "true"
    X-Sleep            = "off=(M-S,23);on=(M-S,7);tz=Asia/Kolkata"
  }
}

resource "aws_ebs_volume" "habitat_volume" {
  lifecycle {
    prevent_destroy = true

    ignore_changes = [
      "iops",
      "size",
      "type",
    ]
  }

  availability_zone = "${element(module.performance_test_single_local_inplace_upgrade.availability_zone, count.index)}"
  size              = "${4 * 1024}"
  type              = "gp2"

  tags {
    Name          = "${element(module.performance_test_single_local_inplace_upgrade.fqdn, count.index)}"
    X-Dept        = "CoreEng"
    X-Contact     = "${var.aws_tag_contact}"
    X-Application = "a2"
  }
}

module "attach_habitat_volume" {
  source = "github.com/chef/es-terraform//modules/attach_ebs_volume"

  actual_device_name = "/dev/nvme1n1"
  ec2_device_name    = "/dev/xvdh"
  instance_id        = "${module.performance_test_single_local_inplace_upgrade.instance_id}"
  instance_fqdn      = "${module.performance_test_single_local_inplace_upgrade.fqdn}"
  ssh_private_key    = "${data.aws_s3_bucket_object.aws_private_key.body}"
  ssh_username       = "${module.performance_test_single_local_inplace_upgrade.ssh_username}"
  volume_id          = "${aws_ebs_volume.habitat_volume.*.id}"
  volume_mount_point = "/hab"
}

module "performance_test_single_local_inplace_upgrade_deploy" {
  source = "../modules/chef_automate_install"

  instance_id   = "${module.attach_habitat_volume.instance_id}"
  instance_fqdn = "${module.performance_test_single_local_inplace_upgrade.fqdn}"
  ssh_username  = "${module.performance_test_single_local_inplace_upgrade.ssh_username}"

  journald_system_max_use = "${var.channel == "acceptance" ? "20G" : "6G"}"

  # Chef Baseline
  enable_monitoring = "false"
  chef_environment  = "${var.chef_environment}"

  # Automate Install
  channel         = "${var.channel}"
  deployment_type = "local"
  upgrade         = "true"

  # SAML
  saml = "true"

  # Create admin-token
  create_admin_token = "true"

  # Setup CloudWatch
  enable_cloudwatch_metrics = "true"
  cloudwatch_namespace      = "A2_Performance_Test_${var.dns_suffix}"
}

#
# Create and configure Chef Load instances.
#

locals {
  performance_test_chef_load_count = 1
}

module "performance_test_chef_load" {
  source = "github.com/chef/es-terraform//modules/cd_instance_v2"

  instance_count = "${local.performance_test_chef_load_count}"

  # DNS components ( a2-perf-test-chef-load-{{channel}}.cd.chef.co )
  subdomain        = "a2-perf-test-chef-load"
  subdomain_suffix = "-${var.dns_suffix}"

  # Metadata
  meta_title       = "chef-load Instance"
  meta_description = "chef-load instance applying load to A2 for performance testing."
  meta_type        = "habitat"

  # AWS Instance Configuration
  vpc           = "${var.environment}"
  platform      = "ubuntu-16.04"
  key_name      = "cd-infrastructure"
  instance_type = "c5.large"

  # Required AWS Tags
  tag_dept        = "CoreEng"
  tag_contact     = "${var.aws_tag_contact}"
  tag_application = "a2"
}

module "performance_test_chef_load_deploy" {
  source = "../modules/chef_load_instance"

  instance_count = "${local.performance_test_chef_load_count}"
  instance_id    = "${module.performance_test_chef_load.instance_id}"
  instance_fqdn  = "${module.performance_test_chef_load.fqdn}"
  ssh_username   = "${module.performance_test_chef_load.ssh_username}"

  # Chef Baseline
  enable_monitoring = "false"
  chef_environment  = "${var.chef_environment}"

  # Chef Load Install
  automate_server_fqdn  = "${element(module.performance_test_single_local_inplace_upgrade.fqdn, 0)}"
  automate_server_token = "${module.performance_test_single_local_inplace_upgrade_deploy.chef_automate_admin_token}"
  chef_load_nodes       = "10000"
  chef_load_actions     = "1000"
  chef_load_interval    = "30"
}

# The following configuration provisions CloudWatch alarms that notify an AWS SNS topic which
# triggers/resolves incidents in a non-paging PagerDuty service named A2_Performance_${var.dns_suffix}.
# You must manually add a Slack channel integration to the PagerDuty service in order for
# triggered/resolved notifications to be forwarded to Slack.

resource "pagerduty_service" "a2_performance" {
  name                    = "A2_Performance_${var.dns_suffix}"
  auto_resolve_timeout    = "null"
  acknowledgement_timeout = 600

  escalation_policy = "${data.pagerduty_escalation_policy.nonpaging.id}"
  alert_creation    = "create_incidents"
}

resource "pagerduty_service_integration" "a2_performance_cloudwatch" {
  name    = "A2_Performance_${var.dns_suffix} Cloudwatch"
  service = "${pagerduty_service.a2_performance.id}"
  vendor  = "${data.pagerduty_vendor.cloudwatch.id}"
}

resource "aws_sns_topic" "a2_performance_notifier" {
  name = "A2_Performance_${var.dns_suffix}_Notifier"
}

resource "aws_sns_topic_subscription" "a2_performance_notifier_pagerduty_integration" {
  topic_arn              = "${aws_sns_topic.a2_performance_notifier.arn}"
  protocol               = "https"
  endpoint               = "https://events.pagerduty.com/integration/${pagerduty_service_integration.a2_performance_cloudwatch.integration_key}/enqueue"
  endpoint_auto_confirms = true
}

resource "aws_cloudwatch_metric_alarm" "a2_performance_2xxStatuses" {
  alarm_name          = "a2-performance-${var.dns_suffix}-2xxStatuses"
  comparison_operator = "LessThanThreshold"
  evaluation_periods  = "2"
  metric_name         = "2xxStatuses"
  namespace           = "A2_Performance_Test_${var.dns_suffix}"
  period              = "300"
  statistic           = "Average"
  threshold           = "1500"
  alarm_description   = "This metric monitors A2_Performance_Test_${var.dns_suffix} 2xxStatuses"
  treat_missing_data  = "breaching"
  alarm_actions       = ["${aws_sns_topic.a2_performance_notifier.arn}"]
  ok_actions          = ["${aws_sns_topic.a2_performance_notifier.arn}"]
}

resource "aws_cloudwatch_metric_alarm" "a2_performance_5xxStatuses" {
  alarm_name          = "a2-performance-${var.dns_suffix}-5xxStatuses"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "2"
  metric_name         = "5xxStatuses"
  namespace           = "A2_Performance_Test_${var.dns_suffix}"
  period              = "300"
  statistic           = "Average"
  threshold           = "10"
  alarm_description   = "This metric monitors A2_Performance_Test_${var.dns_suffix} 5xxStatuses"
  treat_missing_data  = "breaching"
  alarm_actions       = ["${aws_sns_topic.a2_performance_notifier.arn}"]
  ok_actions          = ["${aws_sns_topic.a2_performance_notifier.arn}"]
}



# ======================================================
# Archivo original: s3_websites.tf
# Carpeta: C:\Users\asus\cloned_repos\chef\automate\terraform\test-environments\scenarios
# ======================================================

#########################################################################
# a2-{{channel}}.cd.chef.co
#########################################################################
# This S3-hosted website is a quick dashboard that can be used to quickly see the available instances.

module "dashboard" {
  source    = "github.com/chef/es-terraform//modules/cd_s3_website"
  subdomain = "a2-${var.dns_suffix}"

  # Metadata
  meta_title       = "Automate Release Dashboard"
  meta_description = "This is just a link to the channel-specific release dashboard site you are viewing right now...recursion FTW!"

  tag_contact = "${var.aws_tag_contact}"
}

resource "null_resource" "dashboard_deploy" {
  triggers = {
    always_deploy = "${uuid()}"
  }

  depends_on = ["module.dashboard"]

  provisioner "local-exec" {
    command = "cd ../ && NG_ENV=${var.channel} DNS_SUFFIX=${var.dns_suffix} bash scripts/deploy-dashboard.sh"
  }
}

#########################################################################
# ui-library.cd.chef.co
#########################################################################
# Use to host the chef-ui-library documentation

module "ui_library_website" {
  source    = "github.com/chef/es-terraform//modules/cd_s3_website"
  subdomain = "ui-library"

  # Metadata
  meta_title       = "Chef UI Library"
  meta_description = "Documentation site for Chef's shared UI and Pattern Library"

  tag_contact = "${var.aws_tag_contact}"
  create      = "${var.environment == "union" ? "true" : "false"}"
}

#########################################################################
# a2-code-coverage.cd.chef.co
#########################################################################
# Use to host code coverage reports for master

module "a2_code_coverage_website" {
  source    = "github.com/chef/es-terraform//modules/cd_s3_website"
  subdomain = "a2-code-coverage"

  # Metadata
  meta_title       = "A2 Code Coverage"
  meta_description = "Code Coverage reports for A2"

  tag_contact = "${var.aws_tag_contact}"
  create      = "${var.environment == "union" ? "true" : "false"}"
}



# ======================================================
# Archivo original: single_hardened_local_fresh_install.tf
# Carpeta: C:\Users\asus\cloned_repos\chef\automate\terraform\test-environments\scenarios
# ======================================================

#
# A simple local install of A2 using the chef-automate CLI. It is rebuilt everytime we run `terraform apply`.
# This uses a CIS level 1 v2.1.1 hardened RHEL 7 system.
#

module "single_hardened_local_fresh_install" {
  source = "github.com/chef/es-terraform//modules/cd_instance_v2"

  # DNS components ( a2-hardened-local-fresh-install-{{channel}}.cd.chef.co )
  subdomain        = "a2-hardened-local-fresh-install"
  subdomain_suffix = "-${var.dns_suffix}"

  # Metadata
  meta_title       = "Hardened Single Local (Fresh Install)"
  meta_description = "A2 stack deployed locally as Habitat packages on a single host with hardened security using the chef-automate CLI."
  meta_type        = "habitat"

  # AWS Instance Configuration
  vpc            = "${var.environment}"
  platform       = "rhel-7-cis"
  key_name       = "cd-infrastructure"
  instance_type  = "m5.large"
  root_volume_gb = "50"
  always_rebuild = "true"

  # Required AWS Tags
  tag_dept        = "CoreEng"
  tag_contact     = "${var.aws_tag_contact}"
  tag_application = "a2"

  additional_tags = {
    X-Package-Type     = "habitat"
    X-Install-Utility  = "chef-automate-cli"
    X-Install-Strategy = "fresh-install"
    X-Topology         = "single"
    X-Deployment-Type  = "local"
    X-Channel          = "${var.channel}"
    X-LongRunning      = "true"
    X-Sleep            = "off=(M-S,23);on=(M-S,7);tz=Asia/Kolkata"
  }
}

module "single_hardened_local_fresh_install_deploy" {
  source = "../modules/chef_automate_install"

  instance_id   = "${module.single_hardened_local_fresh_install.instance_id}"
  instance_fqdn = "${module.single_hardened_local_fresh_install.fqdn}"
  ssh_username  = "${module.single_hardened_local_fresh_install.ssh_username}"

  journald_system_max_use = "${var.channel == "acceptance" ? "20G" : "6G"}"

  # Chef Baseline
  enable_email      = "false"
  enable_monitoring = "false"
  chef_environment  = "${var.chef_environment}"

  # Run Hardened Security Inspec Scan
  hardened_security = "true"

  # Automate Install
  channel         = "${var.channel}"
  deployment_type = "local"
}



# ======================================================
# Archivo original: single_local_all_fresh_install.tf
# Carpeta: C:\Users\asus\cloned_repos\chef\automate\terraform\test-environments\scenarios
# ======================================================

#
# A simple local install of A2 with all supported products enabled using the chef-automate CLI. 
# It is rebuilt everytime we run `terraform apply`.
#

module "single_local_all_fresh_install" {
  source = "github.com/chef/es-terraform//modules/cd_instance_v2"

  # DNS components ( a2-all-local-fresh-install-{{channel}}.cd.chef.co )
  subdomain        = "a2-all-local-fresh-install"
  subdomain_suffix = "-${var.dns_suffix}"

  # Metadata
  meta_title       = "Single Local (Fresh Install) with all products"
  meta_description = "A2 stack with all supported products deployed locally as Habitat packages on a single host using the chef-automate CLI."
  meta_type        = "habitat"

  # AWS Instance Configuration
  vpc            = "${var.environment}"
  platform       = "ubuntu-16.04"
  key_name       = "cd-infrastructure"
  instance_type  = "m5.large"
  root_volume_gb = "50"
  always_rebuild = "true"

  # Required AWS Tags
  tag_dept        = "CoreEng"
  tag_contact     = "${var.aws_tag_contact}"
  tag_application = "a2"

  additional_tags = {
    X-Package-Type     = "habitat"
    X-Install-Utility  = "chef-automate-cli"
    X-Install-Strategy = "fresh-install"
    X-Topology         = "single"
    X-Deployment-Type  = "local"
    X-Channel          = "${var.channel}"
    X-LongRunning      = "true"
    X-Sleep            = "off=(M-S,23);on=(M-S,7);tz=Asia/Kolkata"
  }
}

module "single_local_all_fresh_install_deploy" {
  source = "../modules/chef_automate_install"

  instance_id   = "${module.single_local_all_fresh_install.instance_id}"
  instance_fqdn = "${module.single_local_all_fresh_install.fqdn}"
  ssh_username  = "${module.single_local_all_fresh_install.ssh_username}"

  journald_system_max_use = "${var.channel == "acceptance" ? "20G" : "6G"}"

  # Chef Baseline
  enable_monitoring = "false"
  chef_environment  = "${var.chef_environment}"

  # Automate Install
  channel             = "${var.channel}"
  deployment_type     = "local"
  enable_builder      = "true"
  enable_chef_server  = "true"
  enable_workflow     = "true"
  workflow_enterprise = "demo"
}



# ======================================================
# Archivo original: single_local_all_inplace_upgrade.tf
# Carpeta: C:\Users\asus\cloned_repos\chef\automate\terraform\test-environments\scenarios
# ======================================================

#
# A simple local install of A2 with all supported products using the chef-automate CLI.
# It currently uses a pseudo-inplace upgrade.
#

module "single_local_all_inplace_upgrade" {
  source = "github.com/chef/es-terraform//modules/cd_instance_v2"

  # DNS components ( a2-all-local-inplace-upgrade-{{channel}}.cd.chef.co )
  subdomain        = "a2-all-local-inplace-upgrade"
  subdomain_suffix = "-${var.dns_suffix}"

  # Metadata
  meta_title       = "Single Local (Inplace Upgrade) with all supported products"
  meta_description = "A2 stack with all supported products deployed locally as Habitat packages on a single host using the chef-automate CLI."
  meta_type        = "habitat"

  # AWS Instance Configuration
  vpc            = "${var.environment}"
  platform       = "ubuntu-16.04"
  key_name       = "cd-infrastructure"
  instance_type  = "m5.large"
  root_volume_gb = "200"

  # Required AWS Tags
  tag_dept        = "CoreEng"
  tag_contact     = "${var.aws_tag_contact}"
  tag_application = "a2"

  additional_tags = {
    X-Package-Type     = "habitat"
    X-Install-Utility  = "chef-automate-cli"
    X-Install-Strategy = "inplace-upgrade"
    X-Topology         = "single"
    X-Deployment-Type  = "local"
    X-Channel          = "${var.channel}"
    X-LongRunning      = "true"
    X-Sleep            = "off=(M-S,23);on=(M-S,7);tz=Asia/Kolkata"
  }
}

module "single_local_all_inplace_upgrade_deploy" {
  source = "../modules/chef_automate_install"

  instance_id   = "${module.single_local_all_inplace_upgrade.instance_id}"
  instance_fqdn = "${module.single_local_all_inplace_upgrade.fqdn}"
  ssh_username  = "${module.single_local_all_inplace_upgrade.ssh_username}"

  journald_system_max_use = "${var.channel == "acceptance" ? "20G" : "6G"}"

  # Chef Baseline
  enable_monitoring = "true"
  chef_environment  = "${var.chef_environment}"

  # Automate Install
  channel             = "${var.channel}"
  deployment_type     = "local"
  upgrade             = "true"
  enable_builder      = "true"
  enable_chef_server  = "true"
  enable_workflow     = "true"
  workflow_enterprise = "demo"
}



# ======================================================
# Archivo original: single_local_desktop_fresh_install.tf
# Carpeta: C:\Users\asus\cloned_repos\chef\automate\terraform\test-environments\scenarios
# ======================================================

#
# A simple local install of A2 with Desktop using the chef-automate CLI. 
# It is rebuilt everytime we run `terraform apply`.
#

module "single_local_desktop_fresh_install" {
  source = "github.com/chef/es-terraform//modules/cd_instance_v2"

  # DNS components ( a2-local-desktop-fresh-install-{{channel}}.cd.chef.co )
  subdomain        = "a2-local-desktop-fresh-install"
  subdomain_suffix = "-${var.dns_suffix}"

  # Metadata
  meta_title       = "Single Local (Fresh Install) Desktop"
  meta_description = "A2 stack deployed locally as Habitat packages on a single host using the chef-automate CLI."
  meta_type        = "habitat"

  # AWS Instance Configuration
  vpc            = "${var.environment}"
  platform       = "ubuntu-16.04"
  key_name       = "cd-infrastructure"
  instance_type  = "m5.large"
  root_volume_gb = "50"
  always_rebuild = "true"

  # Required AWS Tags
  tag_dept        = "CoreEng"
  tag_contact     = "${var.aws_tag_contact}"
  tag_application = "a2"

  additional_tags = {
    X-Package-Type     = "habitat"
    X-Install-Utility  = "chef-automate-cli"
    X-Install-Strategy = "fresh-install"
    X-Topology         = "single"
    X-Deployment-Type  = "local"
    X-Channel          = "${var.channel}"
    X-LongRunning      = "true"
    X-Sleep            = "off=(M-S,23);on=(M-S,7);tz=Asia/Kolkata"
  }
}

module "single_local_desktop_fresh_install_deploy" {
  source = "../modules/chef_automate_install"

  instance_id   = "${module.single_local_desktop_fresh_install.instance_id}"
  instance_fqdn = "${module.single_local_desktop_fresh_install.fqdn}"
  ssh_username  = "${module.single_local_desktop_fresh_install.ssh_username}"

  journald_system_max_use = "${var.channel == "acceptance" ? "20G" : "6G"}"

  # Chef Baseline
  enable_monitoring = "false"
  chef_environment  = "${var.chef_environment}"

  # Automate Install
  channel         = "${var.channel}"
  deployment_type = "local"
  enable_desktop  = "true"
}



# ======================================================
# Archivo original: single_local_fresh_install.tf
# Carpeta: C:\Users\asus\cloned_repos\chef\automate\terraform\test-environments\scenarios
# ======================================================

#
# A simple local install of A2 using the chef-automate CLI. It is rebuilt everytime we run `terraform apply`.
#

module "single_local_fresh_install" {
  source = "github.com/chef/es-terraform//modules/cd_instance_v2"

  # DNS components ( a2-local-fresh-install-{{channel}}.cd.chef.co )
  subdomain        = "a2-local-fresh-install"
  subdomain_suffix = "-${var.dns_suffix}"

  # Metadata
  meta_title       = "Single Local (Fresh Install)"
  meta_description = "A2 stack deployed locally as Habitat packages on a single host using the chef-automate CLI."
  meta_type        = "habitat"

  # AWS Instance Configuration
  vpc            = "${var.environment}"
  platform       = "ubuntu-16.04"
  key_name       = "cd-infrastructure"
  instance_type  = "m5.large"
  root_volume_gb = "50"
  always_rebuild = "true"

  # Required AWS Tags
  tag_dept        = "CoreEng"
  tag_contact     = "${var.aws_tag_contact}"
  tag_application = "a2"

  additional_tags = {
    X-Package-Type     = "habitat"
    X-Install-Utility  = "chef-automate-cli"
    X-Install-Strategy = "fresh-install"
    X-Topology         = "single"
    X-Deployment-Type  = "local"
    X-Channel          = "${var.channel}"
    X-CI-Test          = "e2e"
    X-LongRunning      = "true"
    X-Sleep            = "off=(M-S,23);on=(M-S,7);tz=Asia/Kolkata"
  }
}

module "single_local_fresh_install_deploy" {
  source = "../modules/chef_automate_install"

  instance_id   = "${module.single_local_fresh_install.instance_id}"
  instance_fqdn = "${module.single_local_fresh_install.fqdn}"
  ssh_username  = "${module.single_local_fresh_install.ssh_username}"

  journald_system_max_use = "${var.channel == "acceptance" ? "20G" : "6G"}"

  # Chef Baseline
  enable_monitoring = "false"
  chef_environment  = "${var.chef_environment}"

  # Automate Install
  channel         = "${var.channel}"
  deployment_type = "local"
}



# ======================================================
# Archivo original: single_local_inplace_upgrade.tf
# Carpeta: C:\Users\asus\cloned_repos\chef\automate\terraform\test-environments\scenarios
# ======================================================

#
# A simple local install of A2 using the chef-automate CLI. It currently uses a pseudo-inplace upgrade.
#

module "single_local_inplace_upgrade" {
  source = "github.com/chef/es-terraform//modules/cd_instance_v2"

  # DNS components ( a2-local-inplace-upgrade-{{channel}}.cd.chef.co )
  subdomain        = "a2-local-inplace-upgrade"
  subdomain_suffix = "-${var.dns_suffix}"

  # Metadata
  meta_title       = "Single Local (Inplace Upgrade)"
  meta_description = "A2 stack (using SAML) deployed locally as Habitat packages on a single host using the chef-automate CLI."
  meta_type        = "habitat"

  # AWS Instance Configuration
  vpc            = "${var.environment}"
  platform       = "ubuntu-16.04"
  key_name       = "cd-infrastructure"
  instance_type  = "m5.large"
  root_volume_gb = "200"

  # Required AWS Tags
  tag_dept        = "CoreEng"
  tag_contact     = "${var.aws_tag_contact}"
  tag_application = "a2"

  additional_tags = {
    X-Package-Type     = "habitat"
    X-Install-Utility  = "chef-automate-cli"
    X-Install-Strategy = "inplace-upgrade"
    X-Topology         = "single"
    X-Deployment-Type  = "local"
    X-Channel          = "${var.channel}"
    X-SAML             = "saml"
    X-Sleep            = "off=(M-S,23);on=(M-S,7);tz=Asia/Kolkata"
    X-LongRunning      = "true"
  }
}

module "single_local_inplace_upgrade_deploy" {
  source = "../modules/chef_automate_install"

  instance_id   = "${module.single_local_inplace_upgrade.instance_id}"
  instance_fqdn = "${module.single_local_inplace_upgrade.fqdn}"
  ssh_username  = "${module.single_local_inplace_upgrade.ssh_username}"

  journald_system_max_use = "${var.channel == "acceptance" ? "20G" : "6G"}"

  # Chef Baseline
  enable_monitoring = "true"
  chef_environment  = "${var.chef_environment}"

  # Automate Install
  channel         = "${var.channel}"
  deployment_type = "local"
  upgrade         = "true"

  # SAML
  saml = "true"
}



# ======================================================
# Archivo original: variables.tf
# Carpeta: C:\Users\asus\cloned_repos\chef\automate\terraform\test-environments\scenarios
# ======================================================

#########################################################################
# Default
#########################################################################
variable "environment" {
  type        = "string"
  description = "Environment and associated workflow environment (dev, acceptance, union, rehearsal, or delivered)"
}

variable "dns_suffix" {
  type        = "string"
  description = "The suffix to append to all DNS names in this environment"
}

variable "enable_monitoring" {
  type        = "string"
  description = "Enable Sensu monitoring on this instance."
  default     = "true"
}

variable "channel" {
  type        = "string"
  description = "The Habitat channel from which to install the packages"
  default     = "dev"
}

variable "www_site_hugo_options" {
  type        = "string"
  description = "The options to pass into hugo when building the landing page"
  default     = ""
}

#########################################################################
# AWS
#########################################################################
variable "aws_tag_contact" {
  type        = "string"
  description = "Name of the user who own the instance (<FOO>@chef.io)"
  default     = "releng"
}

#########################################################################
# Chef
#########################################################################
variable "chef_environment" {
  type        = "string"
  description = "Chef environment new nodes will join"
}




# ======================================================
# Archivo fusionado: terraform\a2ha-terraform\reference_architectures\aws\cloudaws.tf
# Piezas Terraform en carpeta: 81
# Tiene arquitectura (EC2/Docker/Serverless): True
# ======================================================



# ======================================================
# Archivo original: main.tf
# Carpeta: C:\Users\asus\cloned_repos\chef\automate\terraform\a2ha-terraform\reference_architectures\aws
# ======================================================

provider "aws" {
  region  = var.aws_region
  profile = var.aws_profile
}

module "aws_metadata" {
  source = "./modules/aws_metadata"
}

module "aws" {
  ami_filter_name                    = var.ami_filter_name
  ami_filter_owner                   = var.ami_filter_owner
  ami_filter_virt_type               = var.ami_filter_virt_type
  aws_region                         = var.aws_region
  aws_vpc_id                         = var.aws_vpc_id
  aws_cidr_block_addr                = var.aws_cidr_block_addr
  automate_ebs_volume_iops           = var.automate_ebs_volume_iops
  automate_ebs_volume_size           = var.automate_ebs_volume_size
  automate_ebs_volume_type           = var.automate_ebs_volume_type
  automate_fqdn                      = var.automate_fqdn
  automate_instance_count            = var.automate_instance_count
  automate_lb_certificate_arn        = var.automate_lb_certificate_arn
  delete_on_termination              = var.delete_on_termination
  automate_server_instance_type      = var.automate_server_instance_type
  aws_ami_id                         = var.aws_ami_id
  aws_ssh_key_file                   = var.ssh_key_file
  aws_ssh_key_pair_name              = var.aws_ssh_key_pair_name
  aws_ssh_user                       = var.ssh_user
  aws_ssh_port                       = var.ssh_port
  chef_ebs_volume_iops               = var.automate_ebs_volume_iops
  chef_ebs_volume_size               = var.automate_ebs_volume_size
  chef_ebs_volume_type               = var.automate_ebs_volume_type
  chef_server_instance_count         = var.chef_server_instance_count
  chef_server_instance_type          = var.chef_server_instance_type
  chef_server_lb_certificate_arn     = var.chef_server_lb_certificate_arn
  public_custom_subnets              = var.public_custom_subnets
  private_custom_subnets             = var.private_custom_subnets
  opensearch_ebs_volume_iops         = var.opensearch_ebs_volume_iops
  opensearch_ebs_volume_size         = var.opensearch_ebs_volume_size
  opensearch_ebs_volume_type         = var.opensearch_ebs_volume_type
  opensearch_instance_count          = var.opensearch_instance_count
  opensearch_listen_port             = var.opensearch_listen_port
  opensearch_server_instance_type    = var.opensearch_server_instance_type
  managed_opensearch_domain_name     = var.managed_opensearch_domain_name
  managed_opensearch_domain_url      = var.managed_opensearch_domain_url
  aws_os_snapshot_role_arn           = var.aws_os_snapshot_role_arn
  os_snapshot_user_access_key_id     = var.os_snapshot_user_access_key_id
  os_snapshot_user_access_key_secret = var.os_snapshot_user_access_key_secret
  pgleaderchk_listen_port            = var.pgleaderchk_listen_port
  postgresql_ebs_volume_iops         = var.postgresql_ebs_volume_iops
  postgresql_ebs_volume_size         = var.postgresql_ebs_volume_size
  postgresql_ebs_volume_type         = var.postgresql_ebs_volume_type
  postgresql_instance_count          = var.postgresql_instance_count
  postgresql_listen_port             = var.postgresql_listen_port
  postgresql_server_instance_type    = var.postgresql_server_instance_type
  proxy_listen_port                  = var.proxy_listen_port
  setup_managed_services             = var.setup_managed_services
  source                             = "./modules/aws"
  lb_access_logs                     = var.lb_access_logs
  tags                               = var.aws_tags
  aws_instance_profile_name          = var.backup_config_s3 == "true" ? module.s3[0].instance_profile_name : null
  json_data                          = module.aws_metadata.json_data

  depends_on = [module.aws_metadata]
}

module "efs" {
  source                  = "./modules/efs"
  count                   = var.backup_config_efs == "true" ? 1 : 0
  automate_private_ips    = module.aws.automate_private_ips
  chef_server_private_ips = module.aws.chef_server_private_ips
  postgresql_private_ips  = module.aws.postgresql_private_ips
  opensearch_private_ips  = module.aws.opensearch_private_ips
  random_id               = module.aws.random_id
  aws_region              = var.aws_region
  aws_ssh_key_file        = var.ssh_key_file
  aws_ssh_key_pair_name   = var.aws_ssh_key_pair_name
  aws_ssh_user            = var.ssh_user
  aws_ssh_port            = var.ssh_port
  tag_name                = var.tag_name
  subnet_id               = module.aws.subnet_id
  mount_id                = module.aws.mount_id
}

module "s3" {
  source            = "./modules/s3"
  count             = var.backup_config_s3 == "true" ? 1 : 0
  aws_s3_bucketName = var.aws_s3_bucketName
  aws_region        = var.aws_region
  random_id         = module.aws.random_id
  tags              = var.tag_name
  destroy_bucket    = var.destroy_bucket
}

module "aws-output" {
  source                             = "./modules/aws_output"
  automate_private_ips               = module.aws.automate_private_ips
  chef_server_private_ips            = module.aws.chef_server_private_ips
  postgresql_private_ips             = module.aws.postgresql_private_ips
  opensearch_private_ips             = module.aws.opensearch_private_ips
  automate_fqdn                      = module.aws.automate_fqdn
  automate_frontend_url              = module.aws.automate_frontend_url
  bucket_name                        = var.backup_config_s3 == "true" ? module.s3[0].bucket_name : ""
  aws_os_snapshot_role_arn           = module.aws.aws_os_snapshot_role_arn
  os_snapshot_user_access_key_id     = module.aws.os_snapshot_user_access_key_id
  os_snapshot_user_access_key_secret = module.aws.os_snapshot_user_access_key_secret
}



# ======================================================
# Archivo original: outputs.tf
# Carpeta: C:\Users\asus\cloned_repos\chef\automate\terraform\a2ha-terraform\reference_architectures\aws
# ======================================================

##############################################################################################
# NOTE: Do not remove any of these outputs as they are required by the test harness framework.
#

output "ssh_key_file" {
  value = var.ssh_key_file
}

output "ssh_user" {
  value = var.ssh_user
}

output "ssh_port" {
  value = var.ssh_port
}

output "automate_private_ips" {
  value = formatlist("%s", module.aws.automate_private_ips)
}

output "chef_server_private_ips" {
  value = formatlist("%s", module.aws.chef_server_private_ips)
}

output "opensearch_private_ips" {
  value = formatlist("%s", module.aws.opensearch_private_ips)
}

output "aws_os_snapshot_role_arn" {
  value = module.aws.aws_os_snapshot_role_arn
}

output "os_snapshot_user_access_key_id" {
  value = module.aws.os_snapshot_user_access_key_id
}

output "os_snapshot_user_access_key_secret" {
  sensitive = true
  value     = module.aws.os_snapshot_user_access_key_secret
}

output "postgresql_private_ips" {
  value = formatlist("%s", module.aws.postgresql_private_ips)
}

output "backup_config_efs" {
  value = var.backup_config_efs
}

output "backup_config_s3" {
  value = var.backup_config_s3
}

output "automate_loadbalancer_fqdn" {
  value = module.aws.automate_fqdn
}



# ======================================================
# Archivo original: variables.tf
# Carpeta: C:\Users\asus\cloned_repos\chef\automate\terraform\a2ha-terraform\reference_architectures\aws
# ======================================================

variable "ami_filter_name" {
  default = "chef-highperf-centos7-*"
}

variable "ami_filter_owner" {
  default = "446539779517"
}

variable "ami_filter_virt_type" {
  default = "hvm"
}

variable "automate_ebs_volume_iops" {
  default = 100
}

variable "automate_ebs_volume_size" {
  default = 50
}

variable "automate_ebs_volume_type" {
  default = "gp3"
}

variable "automate_lb_certificate_arn" {
  default = "arn:aws:acm:us-west-2:446539779517:certificate/e98235a7-ba3d-4900-9c55-4b35bb8b56c7"
}

variable "automate_private_ips" {
  default = []
}

variable "automate_server_instance_type" {
  default = "t3a.medium"
}

variable "aws_ami_id" {
  default     = ""
  description = "Setting this value overrides ami search features"
}

variable "aws_cidr_block_addr" {
}

variable "aws_instance_profile_name" {
  default = ""
}

variable "aws_os_snapshot_role_arn" {
  default = ""
}

variable "aws_profile" {
  default     = ""
  description = "The AWS profile to use from your ~/.aws/credentials file."
}

variable "aws_region" {
  default     = ""
  description = "The name of the selected AWS region / datacenter."
}

variable "aws_s3_bucketName" {
  default = "chef-automate-ha"
}

variable "aws_ssh_key_pair_name" {
}

variable "aws_tags" {
}

variable "aws_vpc_id" {
}

variable "backup_config_efs" {
  default = "false"
}

variable "backup_config_s3" {
  default = "false"
}

variable "bucket_name" {
  default = ""
}

variable "chef_ebs_volume_iops" {
  default = 100
}

variable "chef_ebs_volume_size" {
  default = 50
}

variable "chef_ebs_volume_type" {
  default = "gp3"
}

variable "chef_server_instance_type" {
  default = "t3a.medium"
}

variable "chef_server_lb_certificate_arn" {
  default = "arn:aws:acm:us-west-2:446539779517:certificate/e98235a7-ba3d-4900-9c55-4b35bb8b56c7"
}

variable "chef_server_private_ips" {
  default = []
}

variable "delete_on_termination" {
  default = true
}

variable "destroy_bucket" {
  default = false
}

variable "managed_opensearch_certificate" {
}

variable "managed_opensearch_domain_name" {
  default = ""
}

variable "managed_opensearch_domain_url" {
  default = ""
}

variable "managed_opensearch_user_password" {
  default = ""
}

variable "managed_opensearch_username" {
  default = ""
}

variable "managed_rds_certificate" {
}

variable "managed_rds_dbuser_password" {
  default = ""
}

variable "managed_rds_dbuser_username" {
  default = ""
}

variable "managed_rds_instance_url" {
  default = ""
}

variable "managed_rds_superuser_password" {
  default = ""
}

variable "managed_rds_superuser_username" {
  default = ""
}

variable "opensearch_ebs_volume_iops" {
  default = 300
}

variable "opensearch_ebs_volume_size" {
  default = 50
}

variable "opensearch_ebs_volume_type" {
  default = "gp3"
}

variable "opensearch_private_ips" {
  default = []
}

variable "opensearch_server_instance_type" {
  default = "m5a.large"
}

variable "os_snapshot_user_access_key_id" {
  default = ""
}

variable "os_snapshot_user_access_key_secret" {
  default = ""
}

variable "postgresql_ebs_volume_iops" {
  default = 150
}

variable "postgresql_ebs_volume_size" {
  default = 50
}

variable "postgresql_ebs_volume_type" {
  default = "gp3"
}

variable "postgresql_private_ips" {
  default = []
}

variable "postgresql_server_instance_type" {
  default = "t3a.medium"
}

variable "private_custom_subnets" {
  default = []
  type    = list(string)
}

variable "public_custom_subnets" {
  default = []
  type    = list(string)
}

variable "setup_managed_services" {
  default = false
}

variable "ssh_group_name" {
  default = "centos"
}

variable "ssh_key_file" {
}

variable "ssh_port" {
  default = 22
}

variable "ssh_user" {
  default = "centos"
}

variable "sudo_cmd" {
  default = "sudo"
}



# ======================================================
# Archivo original: versions.tf
# Carpeta: C:\Users\asus\cloned_repos\chef\automate\terraform\a2ha-terraform\reference_architectures\aws
# ======================================================


terraform {
  required_version = ">= 0.12"
}




# ======================================================
# Archivo fusionado: terraform\a2ha-terraform\modules\automate\cloudautomate.tf
# Piezas Terraform en carpeta: 82
# Tiene arquitectura (EC2/Docker/Serverless): False
# ======================================================



# ======================================================
# Archivo original: inputs.tf
# Carpeta: C:\Users\asus\cloned_repos\chef\automate\terraform\a2ha-terraform\modules\automate
# ======================================================

variable "access_key" {
  default = ""
}

variable "airgap_info" {
}

variable "automate_admin_email" {
}

variable "automate_admin_password" {
}

variable "automate_admin_username" {
}

variable "automate_base_path" {
  default = "automate"
}

variable "automate_certs_by_ip" {
  type    = map(map(string))
  default = {}
}

variable "automate_config" {
  default = ""
}

variable "automate_custom_certs_enabled" {
  default = false
}

variable "automate_dc_token" {
}

variable "automate_fqdn" {
}

variable "automate_instance_count" {
  default = 1
}

variable "automate_lb_fqdn" {
  default = ""
}

variable "automate_license" {
  default = "Contact Chef Sales at sales@chef.io to request a license."
}

variable "automate_private_key" {
}

variable "automate_public_key" {
}

variable "automate_role" {
  description = "Set the type of server role. can be one of: bootstrap_automate, automate or chef_api"
}

variable "automate_root_ca" {
}

variable "aws_os_snapshot_role_arn" {
  default = ""
}

variable "aws_region" {
  default     = ""
  description = "The name of the selected AWS region / datacenter."
}

variable "backend_aib_dest_file" {
}

variable "backend_aib_local_file" {
}

variable "backup_config_efs" {
  default = "false"
}

variable "backup_config_s3" {
  default = "false"
}

variable "bucket_name" {
  default = "chef-automate-ha"
}

variable "chef_server_certs_by_ip" {
  type    = map(map(string))
  default = {}
}

variable "chef_server_custom_certs_enabled" {
  default = false
}

variable "chef_server_private_key" {
}

variable "chef_server_public_key" {
}

variable "cluster_id" {
  default = ""
}

variable "frontend_aib_dest_file" {
}

variable "frontend_aib_local_file" {
}

variable "google_service_account_file" {
  default = ""
}

variable "hab_sup_http_gateway_auth_token" {
}

variable "habitat_info" {
}

variable "infra" {
  default = ""
}

variable "location" {
  default = ""
}

variable "managed_opensearch_certificate" {
}

variable "managed_opensearch_domain_name" {
  default = ""
}

variable "managed_opensearch_domain_url" {
  default = ""
}

variable "managed_opensearch_user_password" {
  default = ""
}

variable "managed_opensearch_username" {
  default = ""
}

variable "managed_rds_certificate" {
}

variable "managed_rds_dbuser_password" {
  default = ""
}

variable "managed_rds_dbuser_username" {
  default = ""
}

variable "managed_rds_instance_url" {
  default = ""
}

variable "managed_rds_superuser_password" {
  default = ""
}

variable "managed_rds_superuser_username" {
  default = ""
}

variable "nfs_mount_path" {
  default = "/mnt/automate_backups"
}

variable "opensearch_base_path" {
  default = "elasticsearch"
}

variable "opensearch_custom_certs_enabled" {
  default = false
}

variable "opensearch_listen_port" {
  default = 9200
}

variable "opensearch_private_ips" {
  default = []
}

variable "opensearch_root_ca" {
}

variable "opensearch_root_cert" {
}

variable "os_snapshot_user_access_key_id" {
  default = ""
}

variable "os_snapshot_user_access_key_secret" {
  default = ""
}

variable "postgresql_custom_certs_enabled" {
  default = false
}

variable "postgresql_private_ips" {
  default = []
}

variable "postgresql_root_ca" {
}

variable "postgresql_root_cert" {
}

variable "postgresql_ssl_enable" {
}

variable "private_ips" {
  default = []
}

variable "proxy_listen_port" {
}

variable "postgresql_listen_port" {
}

variable "public_ips" {
  default = []
}

variable "s3_endpoint" {
  default = "https://s3.amazonaws.com"
}

variable "secret_key" {
  default = ""
}

variable "setup_managed_services" {
  default = false
}

variable "setup_self_managed_services" {
  default = false
}

variable "ssh_key_file" {
}

variable "ssh_port" {
  default = 22
}

variable "ssh_user" {
  default = "centos"
}

variable "ssh_user_sudo_password" {
}

variable "sudo_cmd" {
  default = "sudo"
}

variable "teams_port" {
}

variable "tmp_path" {
  default = "/hab/var/automate-ha"
}



# ======================================================
# Archivo original: main.tf
# Carpeta: C:\Users\asus\cloned_repos\chef\automate\terraform\a2ha-terraform\modules\automate
# ======================================================

locals {
  automate_custom_config = "${var.tmp_path}/automate_custom_config.toml"

  automate_connector_toml = [
    for n in range(var.automate_instance_count) : templatefile("${path.module}/templates/connector.toml.tpl", {
      automate_fqdn                      = length(trimspace(var.automate_fqdn)) > 0 ? var.automate_fqdn : var.automate_lb_fqdn,
      automate_admin_email               = var.automate_admin_email,
      automate_admin_username            = var.automate_admin_username,
      automate_admin_password            = var.automate_admin_password,
      automate_custom_config             = local.automate_custom_config,
      automate_dc_token                  = var.automate_dc_token,
      automate_role                      = var.automate_role,
      aws_region                         = var.aws_region,
      opensearch_ips                     = jsonencode(formatlist("%s", var.opensearch_private_ips)),
      opensearch_listen_port             = var.opensearch_listen_port,
      managed_opensearch_domain_name     = var.managed_opensearch_domain_name,
      managed_opensearch_certificate     = trimspace(var.managed_opensearch_certificate),
      managed_opensearch_domain_url      = var.managed_opensearch_domain_url,
      managed_opensearch_user_password   = var.managed_opensearch_user_password,
      managed_opensearch_username        = var.managed_opensearch_username,
      aws_os_snapshot_role_arn           = var.aws_os_snapshot_role_arn,
      os_snapshot_user_access_key_id     = var.os_snapshot_user_access_key_id,
      os_snapshot_user_access_key_secret = var.os_snapshot_user_access_key_secret,
      managed_rds_certificate            = trimspace(var.managed_rds_certificate),
      managed_rds_dbuser_password        = var.managed_rds_dbuser_password,
      managed_rds_dbuser_username        = var.managed_rds_dbuser_username,
      managed_rds_instance_url           = var.managed_rds_instance_url,
      managed_rds_superuser_password     = var.managed_rds_superuser_password,
      managed_rds_superuser_username     = var.managed_rds_superuser_username,
      postgresql_ips                     = jsonencode(formatlist("%s", var.postgresql_private_ips)),
      postgresql_ssl_enable              = var.postgresql_ssl_enable ? "true" : "false",
      proxy_listen_port                  = var.proxy_listen_port,
      postgresql_listen_port             = var.postgresql_listen_port,
      setup_managed_services             = var.setup_managed_services,
      setup_self_managed_services        = var.setup_self_managed_services,
      opensearch_root_cert               = trimspace(var.opensearch_root_cert),
      postgresql_root_cert               = trimspace(var.postgresql_root_cert),
      teams_port                         = var.teams_port,
      tmp_path                           = var.tmp_path,
      backup_config_s3                   = var.backup_config_s3,
      backup_config_efs                  = var.backup_config_efs,
      nfs_mount_path                     = var.nfs_mount_path,
      s3_endpoint                        = var.s3_endpoint,
      bucket_name                        = var.bucket_name,
      access_key                         = var.access_key,
      google_service_account_file        = var.google_service_account_file,
      secret_key                         = var.secret_key,
      location                           = var.location,
      infra                              = var.infra,
      automate_root_ca                   = trimspace(var.automate_root_ca),
      automate_public_key                = trimspace(contains(keys(var.automate_certs_by_ip), var.private_ips[n]) ? var.automate_certs_by_ip[element(var.private_ips, n)].public_key : var.automate_public_key)
      automate_private_key               = trimspace(contains(keys(var.automate_certs_by_ip), var.private_ips[n]) ? var.automate_certs_by_ip[element(var.private_ips, n)].private_key : var.automate_private_key)
      chef_server_public_key             = trimspace(contains(keys(var.chef_server_certs_by_ip), var.private_ips[n]) ? var.chef_server_certs_by_ip[element(var.private_ips, n)].public_key : var.chef_server_public_key)
      chef_server_private_key            = trimspace(contains(keys(var.chef_server_certs_by_ip), var.private_ips[n]) ? var.chef_server_certs_by_ip[element(var.private_ips, n)].private_key : var.chef_server_private_key)
      opensearch_root_ca                 = trimspace(var.opensearch_root_ca)
      postgresql_root_ca                 = trimspace(var.postgresql_root_ca)
      automate_custom_certs_enabled      = var.automate_custom_certs_enabled
      chef_server_custom_certs_enabled   = var.chef_server_custom_certs_enabled
      postgresql_custom_certs_enabled    = var.postgresql_custom_certs_enabled
      opensearch_custom_certs_enabled    = var.opensearch_custom_certs_enabled
      automate_base_path                 = var.automate_base_path
      opensearch_base_path               = var.opensearch_base_path
      automate_nfs_path                  = var.nfs_mount_path == "" ? var.automate_base_path : format("%s/%s",var.nfs_mount_path,var.automate_base_path)
      opensearch_nfs_path                = var.nfs_mount_path == "" ? var.opensearch_base_path : format("%s/%s",var.nfs_mount_path,var.opensearch_base_path)
    })
  ]

  provision = templatefile("${path.module}/templates/provision.sh.tpl", {
    admin_password                  = var.automate_admin_password,
    automate_custom_config          = local.automate_custom_config,
    automate_role                   = var.automate_role,
    backend_aib_file                = var.backend_aib_dest_file,
    frontend_aib_file               = var.frontend_aib_dest_file,
    hab_sup_http_gateway_auth_token = var.hab_sup_http_gateway_auth_token,
    ssh_user                        = var.ssh_user,
    ssh_port                        = var.ssh_port,
    tmp_path                        = var.tmp_path
    nfs_mount_path                  = var.nfs_mount_path
  })
}

# special conditional resource if the server is a non-bootstrap
# the file resource is nice and will wait until the file appears
resource "null_resource" "automate_pre" {

  count = var.automate_role != "bootstrap_automate" ? var.automate_instance_count : 0

  connection {
    user        = var.ssh_user
    private_key = file(var.ssh_key_file)
    host        = element(var.private_ips, count.index)
    port        = var.ssh_port
    script_path = "${var.tmp_path}/tf_inline_script_system_automate.sh"
  }

  provisioner "local-exec" {
    # https://github.com/hashicorp/terraform/issues/17101
    # Until Terraform supports explicit module inter-dependencies, we create an implicit
    # dependency by using outputs from the Habitat and Airgap modules.
    command = "echo \"Airgap Info: ${var.airgap_info}\nHabitat Info: ${var.habitat_info}\""
  }

  provisioner "local-exec" {
    command = "while true; do sleep 5; test -f ${path.module}/../../bootstrap${var.cluster_id}.abb && break; done"
  }

  provisioner "file" {
    source      = "${path.module}/../../bootstrap${var.cluster_id}.abb"
    destination = "${var.tmp_path}/bootstrap.abb"
  }
}

resource "null_resource" "automate" {
  count = var.automate_instance_count

  connection {
    user        = var.ssh_user
    private_key = file(var.ssh_key_file)
    host        = element(var.private_ips, count.index)
    port        = var.ssh_port
    script_path = "${var.tmp_path}/tf_inline_script_system_automate.sh"
  }

  triggers = {
    connector_toml_sha         = sha1(local.automate_connector_toml[count.index])
    template                   = local.provision
    automate_custom_config_sha = sha1(var.automate_config)
  }

  provisioner "file" {
    content     = var.automate_config
    destination = local.automate_custom_config
  }

  provisioner "file" {
    content     = local.automate_connector_toml[count.index]
    destination = "${var.tmp_path}/connector.toml"
  }

  provisioner "file" {
    source      = "${path.module}/files/config.toml.erb"
    destination = "${var.tmp_path}/config.toml.erb"
  }

  provisioner "file" {
    content     = local.provision
    destination = "${var.tmp_path}/automate_provision.sh"
  }

  # Below code is for the gcp, it should only execute when it is object_storage and location = gcp

  provisioner "local-exec" {
    command = <<EOT
if [ -f "${var.google_service_account_file}" ]; then
  scp -P ${var.ssh_port} -o StrictHostKeyChecking=no -i ${var.ssh_key_file} ${var.google_service_account_file} ${var.ssh_user}@${var.private_ips[count.index]}:${var.tmp_path}/googleServiceAccount.json
  echo "GCP Service Account File copied"
else
  echo "GCP Service Account File does not exist"
fi
EOT
  }

  provisioner "remote-exec" {
    inline = [
      # https://github.com/hashicorp/terraform/issues/17101
      # Until Terraform supports explicit module inter-dependencies, we create an implicit
      # dependency by using outputs from the Habitat and Airgap modules.
      "echo \"Airgap Info: ${var.airgap_info}\nHabitat Info: ${var.habitat_info}\"",
      "chmod 0700 ${var.tmp_path}/automate_provision.sh",
      "echo '${var.ssh_user_sudo_password}' | ${var.sudo_cmd} -S ${var.tmp_path}/automate_provision.sh",
    ]
  }

  depends_on = [null_resource.automate_pre]
}

# special conditional resource if the server is a bootstrap, run after the rest
resource "null_resource" "automate_post" {
  count = var.automate_role == "bootstrap_automate" ? 1 : 0

  connection {
    user        = var.ssh_user
    private_key = file(var.ssh_key_file)
    host        = element(var.private_ips, count.index)
    port        = var.ssh_port
    script_path = "${var.tmp_path}/tf_inline_script_system_automate.sh"
  }

  provisioner "local-exec" {
    # https://github.com/hashicorp/terraform/issues/17101
    # Until Terraform supports explicit module inter-dependencies, we create an implicit
    # dependency by using outputs from the Habitat and Airgap modules.
    command = "echo \"Airgap Info: ${var.airgap_info}\nHabitat Info: ${var.habitat_info}\""
  }

  provisioner "local-exec" {
    command = "scp -P ${var.ssh_port} -o StrictHostKeyChecking=no -i ${var.ssh_key_file} ${var.ssh_user}@${var.private_ips[0]}:${var.tmp_path}/bootstrap.abb bootstrap${var.cluster_id}.abb"
  }

  depends_on = [null_resource.automate]
}



# ======================================================
# Archivo original: versions.tf
# Carpeta: C:\Users\asus\cloned_repos\chef\automate\terraform\a2ha-terraform\modules\automate
# ======================================================


terraform {
  required_version = ">= 0.12"
}




# ======================================================
# Archivo fusionado: terraform\a2ha-terraform\clouda2ha-terraform.tf
# Piezas Terraform en carpeta: 84
# Tiene arquitectura (EC2/Docker/Serverless): False
# ======================================================



# ======================================================
# Archivo original: dependencies.tf
# Carpeta: C:\Users\asus\cloned_repos\chef\automate\terraform\a2ha-terraform
# ======================================================

terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
    null = {
      source = "hashicorp/null"
    }
    random = {
      source = "hashicorp/random"
    }
    local = {
      source = "hashicorp/local"
    }
  }
}



# ======================================================
# Archivo original: variables_common.tf
# Carpeta: C:\Users\asus\cloned_repos\chef\automate\terraform\a2ha-terraform
# ======================================================

variable "automate_admin_email" {
  description = "Email address for the automate admin user account"
  default     = "admin@example.com"
}

variable "automate_admin_username" {
  description = "User name for the automate admin user account"
  default     = "admin"
}

variable "automate_admin_password" {
  description = "Password for the automate admin user account"
  default     = "c0d3c@n!"
}

variable "automate_config_file" {
  description = "Custom config file to use when setting up automate"
  default     = ""
}

variable "automate_dc_token" {
  description = "Token for the Automate Data Collector API"
  default     = "93a49a4f2482c64126f7b6015e6b0f30284287ee4054ff8807fb63d9cbd1c506"
}

variable "automate_archive_disk_fs_path" {
  default     = "/mnt/automate_backups/automate"
  description = "The filesystem path to the Automate frontend archive share."
}

variable "artifact_info" {
  default     = ""
  description = "This variable is auto populated."
}

variable "automate_fqdn" {
  default     = ""
  description = "Automate FQDN variable. Leave as an empty string for AWS"
}

variable "automate_frontend_url" {
  default     = ""
  description = "Automate FQDN variable. Leave as an empty string for AWS"
}

variable "automate_instance_count" {
  default = 1
}

variable "automate_lb_fqdn" {
  default = ""
}

variable "automate_license" {
  default = "Contact Chef Sales at sales@chef.io to request a license."
}

variable "backend_aib_dest_file" {
  default     = ""
  description = "The full path of the airgap bundle destination file."
}

variable "backend_aib_local_file" {
  default     = ""
  description = "The filename of the airgap bundle to use from the 'terraform/transfer_files' directory."
}

variable "chef_server_instance_count" {
  default = 1
}

variable "curator_pkg_ident" {
  default = "chef/automate-ha-curator"
}

variable "curator_svc_load_args" {
  default = "--topology standalone --strategy none"
}

variable "elasticsearch_archive_disk_fs_path" {
  default     = "/mnt/automate_backups/elasticsearch"
  description = "The filesystem path to the Elasticsearch archive share."
}

variable "elasticsearch_https_user" {
  default = "automate_elasticsearch"
}
variable "opensearch_instance_count" {
  default = 3
}

variable "opensearch_listen_port" {
  default = 9200
}

variable "opensearch_username" {
  default = "admin"
}

variable "opensearch_user_password" {
  default = "admin"
}

variable "elasticsearch_pkg_ident" {
  default = "chef/automate-ha-elasticsearch"
}

variable "elasticsearch_svc_load_args" {
  default = "--topology standalone --strategy none"
}

variable "elasticsidecar_pkg_ident" {
  default = "chef/automate-ha-elasticsidecar"
}

variable "elasticsidecar_svc_load_args" {
  default = "--topology standalone --strategy none"
}

variable "frontend_aib_dest_file" {
  default     = ""
  description = "The full path of the airgap bundle destination file."
}

variable "frontend_aib_local_file" {
  default     = ""
  description = "The filename of the airgap bundle to use from the 'terraform/transfer_files' directory."
}

variable "habitat_info" {
  default     = ""
  description = "This variable is auto populated."
}

variable "habitat_uid_gid" {
  default     = ""
  description = "Set UID/GID for hab user"
}

variable "hab_sup_http_gateway_auth_token" {
  description = "Simple HTTP authentication Bearer token. Run 'make sup-keys' from the top-level project directory."
}

variable "hab_sup_ring_key" {
  description = "A symmetric pre-shared key used for wire encryption. Run 'make sup-keys' from the top-level project directory."
}

variable "hab_sup_run_args" {
  default = "--no-color --strategy none --peer-watch-file /etc/hab_peer_watch --permanent-peer --key /hab/sup/default/HttpGateway.key --certs /hab/sup/default/HttpGatewayChained.pem"
}

variable "journalbeat_pkg_ident" {
  default = "chef/automate-ha-journalbeat"
}

variable "kibana_https_user" {
  default = "admin"
}

variable "kibana_pkg_ident" {
  default = "chef/automate-ha-kibana"
}

variable "lb_access_logs" {
  default = false
}

variable "metricbeat_pkg_ident" {
  default = "chef/automate-ha-metricbeat"
}

variable "nfs_mount_path" {
  default     = "/mnt/automate_backups"
  description = "The NFS mount base path for backups and archives."
}

variable "opensearch_pkg_ident" {
  default = "chef/automate-ha-opensearch"
}

variable "pgleaderchk_listen_port" {
  default = 6432
}

variable "pgleaderchk_pkg_ident" {
  default = "chef/automate-ha-pgleaderchk"
}

variable "pgleaderchk_svc_load_args" {
  default = "--topology standalone --strategy none"
}

variable "postgresql_archive_disk_fs_path" {
  default     = "/mnt/automate_backups/postgresql"
  description = "The filesystem path to the PostgreSQL archive share."
}

variable "postgresql_instance_count" {
  default = 3
}

variable "postgresql_listen_port" {
  default = 5432
}

variable "postgresql_pkg_ident" {
  default = "chef/automate-ha-postgresql"
}

variable "postgresql_pg_dump_enabled" {
  default     = true
  description = "Enable or disable PostgreSQL pg_dump for backups. possible values: [true, false]"
}

variable "postgresql_ssl_enable" {
  default     = true
  description = "Enable or disable SSL in PostgreSQL"
}

variable "postgresql_svc_load_args" {
  default = "--topology leader --strategy none"
}

variable "postgresql_wal_archive_enabled" {
  default     = false
  description = "(This is ALPHA and known to not work yet.) Enable or disable PostgreSQL WAL archive mode. possible values: [true, false]"
}

variable "proxy_listen_port" {
  default = 7432
}

variable "proxy_pkg_ident" {
  default = "chef/automate-ha-haproxy"
}

variable "proxy_svc_load_args" {
  default = "--topology standalone --strategy none"
}

variable "rsync_files" {
  default     = []
  description = "An ordered array of SRC1,DST1,SRC2,DST2 file pairs. SRC is relative to the terraform/transfer_files directory"
}

variable "teams_port" {
  default = 10128
}

variable "tmp_path" {
  default = "/hab/var/automate-ha"
}

variable "sudo_password" {
  default = ""
}

variable "fe_sudo_password" {
  default = null
}

variable "be_sudo_password" {
  default = null
}

locals {
  fe_sudo_password = var.fe_sudo_password != null ? var.fe_sudo_password : var.sudo_password
  be_sudo_password = var.be_sudo_password != null ? var.be_sudo_password : var.sudo_password
}


variable "automate_root_ca" {
  default = ""
}
variable "automate_private_key" {
  default = ""
}
variable "automate_public_key" {
  default = ""
}
variable "chef_server_private_key" {
  default = ""
}
variable "chef_server_public_key" {
  default = ""
}

variable "postgresql_root_ca" {
  default = ""
}
variable "postgresql_private_key" {
  default = ""
}
variable "postgresql_public_key" {
  default = ""
}

variable "opensearch_root_ca" {
  default = ""
}
variable "opensearch_private_key" {
  default = ""
}
variable "opensearch_public_key" {
  default = ""
}
variable "opensearch_admin_dn" {
  default = ""
}
variable "opensearch_nodes_dn" {
  default = ""
}
variable "opensearch_admin_cert" {
  default = ""
}
variable "opensearch_admin_key" {
  default = ""
}
variable "automate_custom_certs_enabled" {
  default = false
}
variable "chef_server_custom_certs_enabled" {
  default = false
}
variable "postgresql_custom_certs_enabled" {
  default = false
}
variable "opensearch_custom_certs_enabled" {
  default = false
}
variable "tag_name" {
  default = "A2"
}



# ======================================================
# Archivo original: versions.tf
# Carpeta: C:\Users\asus\cloned_repos\chef\automate\terraform\a2ha-terraform
# ======================================================


terraform {
  required_version = ">= 0.12"
}




# ======================================================
# Archivo fusionado: terraform\a2ha-terraform\reference_architectures\existing_nodes\cloudexisting_nodes.tf
# Piezas Terraform en carpeta: 84
# Tiene arquitectura (EC2/Docker/Serverless): False
# ======================================================



# ======================================================
# Archivo original: main.tf
# Carpeta: C:\Users\asus\cloned_repos\chef\automate\terraform\a2ha-terraform\reference_architectures\existing_nodes
# ======================================================

resource "random_id" "cluster_id" {
  byte_length = 4
}

locals {
  backend_private_ips  = tolist(setunion(var.existing_opensearch_private_ips, var.existing_postgresql_private_ips))
  backend_count        = length(local.backend_private_ips)
  frontend_private_ips = tolist(setunion(var.existing_automate_private_ips, var.existing_chef_server_private_ips))
  frontend_count       = length(local.frontend_private_ips)
}

module "system-tuning-frontend" {
  source                          = "./modules/system"
  automate_archive_disk_fs_path   = var.automate_archive_disk_fs_path
  opensearch_archive_disk_fs_path = var.setup_managed_services ? "" : var.elasticsearch_archive_disk_fs_path
  instance_count                  = local.frontend_count
  postgresql_archive_disk_fs_path = var.setup_managed_services ? "" : var.postgresql_archive_disk_fs_path
  private_ips                     = local.frontend_private_ips
  ssh_key_file                    = var.ssh_key_file
  ssh_user                        = var.ssh_user
  ssh_group_name                  = var.ssh_group_name
  ssh_port                        = var.ssh_port
  ssh_user_sudo_password          = local.fe_sudo_password
  sudo_cmd                        = var.sudo_cmd
}

module "system-tuning-backend" {
  source                          = "./modules/system"
  count                           = var.setup_managed_services ? 0 : 1
  automate_archive_disk_fs_path   = var.automate_archive_disk_fs_path
  opensearch_archive_disk_fs_path = var.setup_managed_services ? "" : var.elasticsearch_archive_disk_fs_path
  instance_count                  = local.backend_count
  postgresql_archive_disk_fs_path = var.setup_managed_services ? "" : var.postgresql_archive_disk_fs_path
  private_ips                     = local.backend_private_ips
  ssh_key_file                    = var.ssh_key_file
  ssh_user                        = var.ssh_user
  ssh_group_name                  = var.ssh_group_name
  ssh_port                        = var.ssh_port
  ssh_user_sudo_password          = local.be_sudo_password
  sudo_cmd                        = var.sudo_cmd
}

module "airgap_bundle-backend" {
  source            = "./modules/airgap_bundle"
  count             = var.setup_managed_services ? 0 : 1
  archive_disk_info = var.setup_managed_services ? "" : module.system-tuning-backend[0].archive_disk_info
  instance_count    = local.backend_count
  private_ips       = local.backend_private_ips
  bundle_files = [{
    source      = var.backend_aib_local_file
    destination = var.backend_aib_dest_file
  }]
  ssh_key_file = var.ssh_key_file
  ssh_user     = var.ssh_user
  ssh_port     = var.ssh_port
  tmp_path     = var.tmp_path
  depends_on   = [module.system-tuning-backend]
}

module "airgap_bundle-frontend" {
  source            = "./modules/airgap_bundle"
  archive_disk_info = module.system-tuning-frontend.archive_disk_info
  instance_count    = local.frontend_count
  private_ips       = local.frontend_private_ips
  bundle_files = [{
    source      = var.backend_aib_local_file
    destination = var.backend_aib_dest_file
    }, {
    source      = var.frontend_aib_local_file
    destination = var.frontend_aib_dest_file
  }]
  ssh_key_file = var.ssh_key_file
  ssh_user     = var.ssh_user
  ssh_port     = var.ssh_port
  tmp_path     = var.tmp_path
  depends_on = [
    module.system-tuning-frontend
  ]
}

module "habitat-backend" {
  source                          = "./modules/habitat"
  count                           = var.setup_managed_services ? 0 : 1
  airgap_info                     = var.setup_managed_services ? "" : module.airgap_bundle-backend[0].airgap_info
  hab_sup_http_gateway_auth_token = var.hab_sup_http_gateway_auth_token
  hab_sup_http_gateway_ca_cert    = var.hab_sup_http_gateway_ca_cert
  hab_sup_http_gateway_priv_key   = var.hab_sup_http_gateway_priv_key
  hab_sup_http_gateway_pub_cert   = var.hab_sup_http_gateway_pub_cert
  hab_sup_ring_key                = var.hab_sup_ring_key
  hab_sup_run_args                = var.hab_sup_run_args
  install_hab_sh_args             = ""
  instance_count                  = local.backend_count
  backend_aib_dest_file           = var.backend_aib_dest_file
  backend_aib_local_file          = var.backend_aib_local_file
  private_ips                     = local.backend_private_ips
  ssh_key_file                    = var.ssh_key_file
  ssh_user                        = var.ssh_user
  ssh_port                        = var.ssh_port
  ssh_user_sudo_password          = local.be_sudo_password
  sudo_cmd                        = var.sudo_cmd
  habitat_uid_gid                 = var.habitat_uid_gid
  peer_ips = setunion(
    var.existing_opensearch_private_ips,
    var.existing_postgresql_private_ips
  )
  depends_on = [module.airgap_bundle-backend]
}

module "habitat-frontend" {
  source                          = "./modules/habitat"
  airgap_info                     = module.airgap_bundle-frontend.airgap_info
  hab_sup_http_gateway_auth_token = var.hab_sup_http_gateway_auth_token
  hab_sup_http_gateway_ca_cert    = var.hab_sup_http_gateway_ca_cert
  hab_sup_http_gateway_priv_key   = var.hab_sup_http_gateway_priv_key
  hab_sup_http_gateway_pub_cert   = var.hab_sup_http_gateway_pub_cert
  hab_sup_ring_key                = var.hab_sup_ring_key
  hab_sup_run_args                = var.hab_sup_run_args
  install_hab_sh_args             = "--no-service"
  instance_count                  = local.frontend_count
  backend_aib_dest_file           = var.backend_aib_dest_file
  backend_aib_local_file          = var.backend_aib_local_file
  private_ips                     = local.frontend_private_ips
  peer_ips                        = local.frontend_private_ips
  ssh_key_file                    = var.ssh_key_file
  ssh_user                        = var.ssh_user
  ssh_port                        = var.ssh_port
  ssh_user_sudo_password          = local.fe_sudo_password
  sudo_cmd                        = var.sudo_cmd
  habitat_uid_gid                 = var.habitat_uid_gid
  depends_on                      = [module.airgap_bundle-frontend]
}

module "opensearch" {
  source                          = "./modules/opensearch"
  count                           = var.setup_managed_services ? 0 : 1
  airgap_info                     = var.setup_managed_services ? "" : module.airgap_bundle-backend[0].airgap_info
  backend_aib_dest_file           = var.backend_aib_dest_file
  backend_aib_local_file          = var.backend_aib_local_file
  curator_pkg_ident               = var.curator_pkg_ident
  opensearch_instance_count       = var.opensearch_instance_count
  opensearch_listen_port          = var.opensearch_listen_port
  opensearch_pkg_ident            = var.opensearch_pkg_ident
  opensearch_svc_load_args        = var.elasticsearch_svc_load_args
  opensearchsidecar_pkg_ident     = var.elasticsidecar_pkg_ident
  opensearchsidecar_svc_load_args = var.elasticsidecar_svc_load_args
  habitat_info                    = var.setup_managed_services ? "" : module.habitat-backend[0].habitat_info
  journalbeat_pkg_ident           = var.journalbeat_pkg_ident
  kibana_pkg_ident                = var.kibana_pkg_ident
  metricbeat_pkg_ident            = var.metricbeat_pkg_ident
  private_ips                     = var.existing_opensearch_private_ips
  ssh_key_file                    = var.ssh_key_file
  ssh_user                        = var.ssh_user
  ssh_port                        = var.ssh_port
  ssh_user_sudo_password          = local.be_sudo_password
  sudo_cmd                        = var.sudo_cmd
  backup_config_s3                = var.backup_config_s3
  backup_config_efs               = var.backup_config_efs
  s3_endpoint                     = var.s3_endpoint
  nfs_mount_path                  = var.nfs_mount_path
  access_key                      = var.access_key
  secret_key                      = var.secret_key
  opensearch_username             = var.opensearch_username
  opensearch_user_password        = var.opensearch_user_password
  depends_on                      = [module.airgap_bundle-backend, module.habitat-backend]
  opensearch_root_ca              = trimspace(var.opensearch_root_ca)
  opensearch_private_key          = trimspace(var.opensearch_private_key)
  opensearch_public_key           = trimspace(var.opensearch_public_key)
  opensearch_admin_key            = trimspace(var.opensearch_admin_key)
  opensearch_admin_cert           = trimspace(var.opensearch_admin_cert)
  opensearch_admin_dn             = var.opensearch_admin_dn
  opensearch_nodes_dn             = var.opensearch_nodes_dn
  opensearch_custom_certs_enabled = var.opensearch_custom_certs_enabled
  opensearch_certs_by_ip          = var.opensearch_certs_by_ip
  opensearch_base_path            = var.opensearch_base_path
}

module "postgresql" {
  count                           = var.setup_managed_services ? 0 : 1
  source                          = "./modules/postgresql"
  airgap_info                     = var.setup_managed_services ? "" : module.airgap_bundle-backend[0].airgap_info
  backend_aib_dest_file           = var.backend_aib_dest_file
  backend_aib_local_file          = var.backend_aib_local_file
  opensearch_listen_port          = var.opensearch_listen_port
  opensearch_private_ips          = var.existing_opensearch_private_ips
  habitat_info                    = var.setup_managed_services ? "" : module.habitat-backend[0].habitat_info
  journalbeat_pkg_ident           = var.journalbeat_pkg_ident
  metricbeat_pkg_ident            = var.metricbeat_pkg_ident
  pgleaderchk_listen_port         = var.pgleaderchk_listen_port
  pgleaderchk_pkg_ident           = var.pgleaderchk_pkg_ident
  pgleaderchk_svc_load_args       = var.pgleaderchk_svc_load_args
  postgresql_archive_disk_fs_path = var.setup_managed_services ? "" : var.postgresql_archive_disk_fs_path
  postgresql_instance_count       = var.postgresql_instance_count
  postgresql_listen_port          = var.postgresql_listen_port
  postgresql_pkg_ident            = var.postgresql_pkg_ident
  postgresql_pg_dump_enabled      = var.postgresql_pg_dump_enabled
  postgresql_ssl_enable           = var.postgresql_ssl_enable
  postgresql_svc_load_args        = var.postgresql_svc_load_args
  postgresql_wal_archive_enabled  = var.postgresql_wal_archive_enabled
  proxy_listen_port               = var.proxy_listen_port
  proxy_pkg_ident                 = var.proxy_pkg_ident
  proxy_svc_load_args             = var.proxy_svc_load_args
  private_ips                     = var.existing_postgresql_private_ips
  ssh_key_file                    = var.ssh_key_file
  ssh_user                        = var.ssh_user
  ssh_port                        = var.ssh_port
  ssh_user_sudo_password          = local.be_sudo_password
  sudo_cmd                        = var.sudo_cmd
  backup_config_efs               = var.backup_config_efs
  nfs_mount_path                  = var.nfs_mount_path
  depends_on                      = [module.airgap_bundle-backend, module.habitat-backend]
  postgresql_root_ca              = trimspace(var.postgresql_root_ca)
  postgresql_private_key          = trimspace(var.postgresql_private_key)
  postgresql_public_key           = trimspace(var.postgresql_public_key)
  postgresql_custom_certs_enabled = var.postgresql_custom_certs_enabled
  postgresql_certs_by_ip          = var.postgresql_certs_by_ip
}

module "postgresql_config_sync" {
  count                           = var.setup_managed_services ? 0 : 1
  source                          = "./modules/postgresqlconfigsync"
  postgresql_instance_count       = var.postgresql_instance_count
  private_ips                     = var.existing_postgresql_private_ips
  postgresql_pkg_ident            = var.postgresql_pkg_ident
  postgresql_svc_load_args        = var.postgresql_svc_load_args
  pgleaderchk_listen_port         = var.pgleaderchk_listen_port
  pgleaderchk_pkg_ident           = var.pgleaderchk_pkg_ident
  pgleaderchk_svc_load_args       = var.pgleaderchk_svc_load_args
  proxy_listen_port               = var.proxy_listen_port
  proxy_pkg_ident                 = var.proxy_pkg_ident
  proxy_svc_load_args             = var.proxy_svc_load_args
  ssh_key_file                    = var.ssh_key_file
  ssh_user                        = var.ssh_user
  ssh_port                        = var.ssh_port
  ssh_user_sudo_password          = local.be_sudo_password
  sudo_cmd                        = var.sudo_cmd
  tmp_path                        = var.tmp_path
  depends_on                      = [module.postgresql]
}

module "bootstrap_automate" {
  source                             = "./modules/automate"
  airgap_info                        = module.airgap_bundle-frontend.airgap_info
  automate_admin_email               = var.automate_admin_email
  automate_admin_username            = var.automate_admin_username
  automate_admin_password            = var.automate_admin_password
  automate_config                    = file(var.automate_config_file)
  automate_root_ca                   = trimspace(var.automate_root_ca)
  opensearch_root_ca                 = trimspace(var.opensearch_root_ca)
  postgresql_root_ca                 = trimspace(var.postgresql_root_ca)
  automate_private_key               = trimspace(var.automate_private_key)
  automate_public_key                = trimspace(var.automate_public_key)
  chef_server_private_key            = trimspace(var.chef_server_private_key)
  chef_server_public_key             = trimspace(var.chef_server_public_key)
  automate_custom_certs_enabled      = var.automate_custom_certs_enabled
  chef_server_custom_certs_enabled   = var.chef_server_custom_certs_enabled
  postgresql_custom_certs_enabled    = var.postgresql_custom_certs_enabled
  opensearch_custom_certs_enabled    = var.opensearch_custom_certs_enabled
  automate_certs_by_ip               = var.automate_certs_by_ip
  opensearch_root_cert               = var.opensearch_root_cert
  postgresql_root_cert               = var.postgresql_root_cert
  managed_opensearch_domain_name     = var.managed_opensearch_domain_name
  managed_opensearch_certificate     = var.managed_opensearch_certificate
  managed_opensearch_domain_url      = var.managed_opensearch_domain_url
  managed_opensearch_user_password   = var.managed_opensearch_user_password
  managed_opensearch_username        = var.managed_opensearch_username
  aws_os_snapshot_role_arn           = var.aws_os_snapshot_role_arn
  os_snapshot_user_access_key_id     = var.os_snapshot_user_access_key_id
  os_snapshot_user_access_key_secret = var.os_snapshot_user_access_key_secret
  managed_rds_instance_url           = var.managed_rds_instance_url
  managed_rds_superuser_username     = var.managed_rds_superuser_username
  managed_rds_superuser_password     = var.managed_rds_superuser_password
  managed_rds_dbuser_username        = var.managed_rds_dbuser_username
  managed_rds_dbuser_password        = var.managed_rds_dbuser_password
  managed_rds_certificate            = var.managed_rds_certificate
  setup_managed_services             = var.setup_managed_services
  setup_self_managed_services        = var.setup_self_managed_services
  automate_dc_token                  = var.automate_dc_token
  automate_fqdn                      = var.automate_fqdn
  automate_instance_count            = 1
  automate_role                      = "bootstrap_automate"
  cluster_id                         = random_id.cluster_id.hex
  backend_aib_dest_file              = var.backend_aib_dest_file
  backend_aib_local_file             = var.backend_aib_local_file
  frontend_aib_dest_file             = var.frontend_aib_dest_file
  frontend_aib_local_file            = var.frontend_aib_local_file
  habitat_info                       = module.habitat-frontend.habitat_info
  hab_sup_http_gateway_auth_token    = var.hab_sup_http_gateway_auth_token
  opensearch_listen_port             = var.opensearch_listen_port
  opensearch_private_ips             = var.existing_opensearch_private_ips
  proxy_listen_port                  = var.proxy_listen_port
  postgresql_listen_port             = var.postgresql_listen_port
  postgresql_private_ips             = var.existing_postgresql_private_ips
  postgresql_ssl_enable              = var.postgresql_ssl_enable
  private_ips                        = slice(var.existing_automate_private_ips, 0, 1)
  ssh_key_file                       = var.ssh_key_file
  ssh_user                           = var.ssh_user
  ssh_port                           = var.ssh_port
  ssh_user_sudo_password             = local.fe_sudo_password
  sudo_cmd                           = var.sudo_cmd
  teams_port                         = var.teams_port
  backup_config_s3                   = var.backup_config_s3
  backup_config_efs                  = var.backup_config_efs
  s3_endpoint                        = var.s3_endpoint
  bucket_name                        = var.bucket_name
  access_key                         = var.access_key
  secret_key                         = var.secret_key
  aws_region                         = var.region
  location                           = var.location
  google_service_account_file        = var.google_service_account_file
  infra                              = var.infra
  nfs_mount_path                     = var.nfs_mount_path
  automate_base_path                 = var.automate_base_path
  opensearch_base_path               = var.opensearch_base_path
  depends_on                         = [module.airgap_bundle-frontend, module.habitat-frontend, module.postgresql, module.opensearch]
}

module "automate" {
  source                             = "./modules/automate"
  airgap_info                        = module.airgap_bundle-frontend.airgap_info
  automate_admin_email               = var.automate_admin_email
  automate_admin_username            = var.automate_admin_username
  automate_admin_password            = var.automate_admin_password
  automate_config                    = file(var.automate_config_file)
  automate_root_ca                   = trimspace(var.automate_root_ca)
  opensearch_root_ca                 = trimspace(var.opensearch_root_ca)
  postgresql_root_ca                 = trimspace(var.postgresql_root_ca)
  automate_private_key               = trimspace(var.automate_private_key)
  automate_public_key                = trimspace(var.automate_public_key)
  chef_server_private_key            = trimspace(var.chef_server_private_key)
  chef_server_public_key             = trimspace(var.chef_server_public_key)
  automate_custom_certs_enabled      = var.automate_custom_certs_enabled
  chef_server_custom_certs_enabled   = var.chef_server_custom_certs_enabled
  postgresql_custom_certs_enabled    = var.postgresql_custom_certs_enabled
  opensearch_custom_certs_enabled    = var.opensearch_custom_certs_enabled
  automate_certs_by_ip               = var.automate_certs_by_ip
  managed_opensearch_domain_name     = var.managed_opensearch_domain_name
  managed_opensearch_certificate     = var.managed_opensearch_certificate
  managed_opensearch_domain_url      = var.managed_opensearch_domain_url
  managed_opensearch_user_password   = var.managed_opensearch_user_password
  managed_opensearch_username        = var.managed_opensearch_username
  aws_os_snapshot_role_arn           = var.aws_os_snapshot_role_arn
  os_snapshot_user_access_key_id     = var.os_snapshot_user_access_key_id
  os_snapshot_user_access_key_secret = var.os_snapshot_user_access_key_secret
  managed_rds_instance_url           = var.managed_rds_instance_url
  managed_rds_superuser_username     = var.managed_rds_superuser_username
  managed_rds_superuser_password     = var.managed_rds_superuser_password
  managed_rds_dbuser_username        = var.managed_rds_dbuser_username
  managed_rds_dbuser_password        = var.managed_rds_dbuser_password
  managed_rds_certificate            = var.managed_rds_certificate
  setup_managed_services             = var.setup_managed_services
  opensearch_root_cert               = var.opensearch_root_cert
  postgresql_root_cert               = var.postgresql_root_cert
  setup_self_managed_services        = var.setup_self_managed_services
  automate_dc_token                  = var.automate_dc_token
  automate_fqdn                      = var.automate_fqdn
  automate_instance_count            = var.automate_instance_count - 1
  automate_role                      = "automate"
  cluster_id                         = random_id.cluster_id.hex
  backend_aib_dest_file              = var.backend_aib_dest_file
  frontend_aib_dest_file             = var.frontend_aib_dest_file
  backend_aib_local_file             = var.backend_aib_local_file
  frontend_aib_local_file            = var.frontend_aib_local_file
  habitat_info                       = module.habitat-frontend.habitat_info
  hab_sup_http_gateway_auth_token    = var.hab_sup_http_gateway_auth_token
  opensearch_listen_port             = var.opensearch_listen_port
  opensearch_private_ips             = var.existing_opensearch_private_ips
  proxy_listen_port                  = var.proxy_listen_port
  postgresql_listen_port             = var.postgresql_listen_port
  postgresql_private_ips             = var.existing_postgresql_private_ips
  postgresql_ssl_enable              = var.postgresql_ssl_enable
  private_ips = slice(
    var.existing_automate_private_ips,
    1,
    length(var.existing_automate_private_ips),
  )
  ssh_key_file                = var.ssh_key_file
  ssh_user                    = var.ssh_user
  ssh_port                    = var.ssh_port
  ssh_user_sudo_password      = local.fe_sudo_password
  sudo_cmd                    = var.sudo_cmd
  teams_port                  = var.teams_port
  backup_config_s3            = var.backup_config_s3
  backup_config_efs           = var.backup_config_efs
  s3_endpoint                 = var.s3_endpoint
  bucket_name                 = var.bucket_name
  access_key                  = var.access_key
  secret_key                  = var.secret_key
  aws_region                  = var.region
  location                    = var.location
  google_service_account_file = var.google_service_account_file
  infra                       = var.infra
  nfs_mount_path              = var.nfs_mount_path
  automate_base_path          = var.automate_base_path
  opensearch_base_path        = var.opensearch_base_path
  depends_on                  = [module.bootstrap_automate]
}

module "chef_server" {
  source                             = "./modules/automate"
  airgap_info                        = module.airgap_bundle-frontend.airgap_info
  automate_admin_email               = var.automate_admin_email
  automate_admin_username            = var.automate_admin_username
  automate_admin_password            = var.automate_admin_password
  automate_config                    = file(var.automate_config_file)
  automate_root_ca                   = trimspace(var.automate_root_ca)
  opensearch_root_ca                 = trimspace(var.opensearch_root_ca)
  postgresql_root_ca                 = trimspace(var.postgresql_root_ca)
  automate_private_key               = trimspace(var.automate_private_key)
  automate_public_key                = trimspace(var.automate_public_key)
  chef_server_private_key            = trimspace(var.chef_server_private_key)
  chef_server_public_key             = trimspace(var.chef_server_public_key)
  automate_custom_certs_enabled      = var.automate_custom_certs_enabled
  chef_server_custom_certs_enabled   = var.chef_server_custom_certs_enabled
  postgresql_custom_certs_enabled    = var.postgresql_custom_certs_enabled
  opensearch_custom_certs_enabled    = var.opensearch_custom_certs_enabled
  chef_server_certs_by_ip            = var.chef_server_certs_by_ip
  managed_opensearch_domain_name     = var.managed_opensearch_domain_name
  managed_opensearch_certificate     = var.managed_opensearch_certificate
  managed_opensearch_domain_url      = var.managed_opensearch_domain_url
  managed_opensearch_user_password   = var.managed_opensearch_user_password
  managed_opensearch_username        = var.managed_opensearch_username
  aws_os_snapshot_role_arn           = var.aws_os_snapshot_role_arn
  os_snapshot_user_access_key_id     = var.os_snapshot_user_access_key_id
  os_snapshot_user_access_key_secret = var.os_snapshot_user_access_key_secret
  managed_rds_instance_url           = var.managed_rds_instance_url
  managed_rds_superuser_username     = var.managed_rds_superuser_username
  managed_rds_superuser_password     = var.managed_rds_superuser_password
  managed_rds_dbuser_username        = var.managed_rds_dbuser_username
  managed_rds_dbuser_password        = var.managed_rds_dbuser_password
  managed_rds_certificate            = var.managed_rds_certificate
  setup_managed_services             = var.setup_managed_services
  opensearch_root_cert               = var.opensearch_root_cert
  postgresql_root_cert               = var.postgresql_root_cert
  setup_self_managed_services        = var.setup_self_managed_services
  automate_dc_token                  = var.automate_dc_token
  automate_fqdn                      = var.automate_fqdn
  automate_instance_count            = length(setsubtract(var.existing_chef_server_private_ips, var.existing_automate_private_ips))
  automate_role                      = "chef_api"
  cluster_id                         = random_id.cluster_id.hex
  backend_aib_dest_file              = var.backend_aib_dest_file
  backend_aib_local_file             = var.backend_aib_local_file
  frontend_aib_dest_file             = var.frontend_aib_dest_file
  frontend_aib_local_file            = var.frontend_aib_local_file
  habitat_info                       = module.habitat-frontend.habitat_info
  hab_sup_http_gateway_auth_token    = var.hab_sup_http_gateway_auth_token
  opensearch_listen_port             = var.opensearch_listen_port
  opensearch_private_ips             = var.existing_opensearch_private_ips
  proxy_listen_port                  = var.proxy_listen_port
  postgresql_listen_port             = var.postgresql_listen_port
  postgresql_private_ips             = var.existing_postgresql_private_ips
  postgresql_ssl_enable              = var.postgresql_ssl_enable
  private_ips                        = var.existing_chef_server_private_ips
  ssh_key_file                       = var.ssh_key_file
  ssh_user                           = var.ssh_user
  ssh_port                           = var.ssh_port
  ssh_user_sudo_password             = local.fe_sudo_password
  sudo_cmd                           = var.sudo_cmd
  teams_port                         = var.teams_port
  backup_config_s3                   = var.backup_config_s3
  backup_config_efs                  = var.backup_config_efs
  s3_endpoint                        = var.s3_endpoint
  bucket_name                        = var.bucket_name
  access_key                         = var.access_key
  secret_key                         = var.secret_key
  aws_region                         = var.region
  location                           = var.location
  google_service_account_file        = var.google_service_account_file
  infra                              = var.infra
  nfs_mount_path                     = var.nfs_mount_path
  automate_base_path                 = var.automate_base_path
  opensearch_base_path               = var.opensearch_base_path
  depends_on                         = [module.bootstrap_automate]
}

module "keystore_opensearch" {
  source                      = "./modules/keystoreopensearch"
  count                       = var.setup_managed_services ? 0 : 1
  opensearch_instance_count   = var.opensearch_instance_count
  opensearch_listen_port      = var.opensearch_listen_port
  opensearch_pkg_ident        = var.opensearch_pkg_ident
  private_ips                 = var.existing_opensearch_private_ips
  ssh_key_file                = var.ssh_key_file
  ssh_user                    = var.ssh_user
  ssh_port                    = var.ssh_port
  ssh_user_sudo_password      = local.be_sudo_password
  sudo_cmd                    = var.sudo_cmd
  backup_config_s3            = var.backup_config_s3
  access_key                  = var.access_key
  secret_key                  = var.secret_key
  location                    = var.location
  google_service_account_file = var.google_service_account_file
  tmp_path                    = var.tmp_path
  depends_on                  = [module.bootstrap_automate, module.opensearch]
}



# ======================================================
# Archivo original: outputs.tf
# Carpeta: C:\Users\asus\cloned_repos\chef\automate\terraform\a2ha-terraform\reference_architectures\existing_nodes
# ======================================================

##############################################################################################
# NOTE: Do not remove any of these outputs as they are required by the test harness framework.
#

output "ssh_key_file" {
  value = var.ssh_key_file
}

output "ssh_user" {
  value = var.ssh_user
}

output "ssh_group_name" {
  value = var.ssh_group_name
}

output "ssh_port" {
  value = var.ssh_port
}

output "automate_frontend_url" {
  value = "https://${var.automate_fqdn}"
}

output "automate_private_ips" {
  value = formatlist("%s", var.existing_automate_private_ips)
}

output "chef_server_private_ips" {
  value = formatlist("%s", var.existing_chef_server_private_ips)
}

output "opensearch_private_ips" {
  value = formatlist("%s", var.existing_opensearch_private_ips)
}

output "postgresql_private_ips" {
  value = formatlist("%s", var.existing_postgresql_private_ips)
}

output "automate_ssh" {
  value = formatlist(
    "ssh -i %s -p %s %s@%s",
    var.ssh_key_file,
    var.ssh_port,
    var.ssh_user,
    var.existing_automate_private_ips,
  )
}

output "chef_server_ssh" {
  value = formatlist(
    "ssh -i %s -p %s %s@%s",
    var.ssh_key_file,
    var.ssh_port,
    var.ssh_user,
    var.existing_chef_server_private_ips,
  )
}

output "postgresql_ssh" {
  value = formatlist(
    "ssh -i %s -p %s %s@%s",
    var.ssh_key_file,
    var.ssh_port,
    var.ssh_user,
    var.existing_postgresql_private_ips,
  )
}

output "opensearch_ssh" {
  value = formatlist(
    "ssh -i %s -p %s %s@%s",
    var.ssh_key_file,
    var.ssh_port,
    var.ssh_user,
    var.existing_opensearch_private_ips,
  )
}



# ======================================================
# Archivo original: outputs_common.tf
# Carpeta: C:\Users\asus\cloned_repos\chef\automate\terraform\a2ha-terraform\reference_architectures\existing_nodes
# ======================================================

output "automate_url" {
  value = "https://${var.automate_fqdn}"
}

output "automate_admin_user" {
  value = var.automate_admin_username
}

output "automate_admin_password" {
  value = var.automate_admin_password
}

output "automate_data_collector_token" {
  value = var.automate_dc_token
}

output "to_check_consolidated_status" {
  value = "chef-automate status summary"
}

output "to_check_detail_status" {
  value = "chef-automate status"
}

output "to_post_deployment_verify" {
  value = "chef-automate verify"
}


# ======================================================
# Archivo original: variables.tf
# Carpeta: C:\Users\asus\cloned_repos\chef\automate\terraform\a2ha-terraform\reference_architectures\existing_nodes
# ======================================================

variable "access_key" {
  default = ""
}

variable "automate_base_path" {
  default = "automate"
}

variable "automate_certs_by_ip" {
  type    = map(map(string))
  default = {}
}

variable "aws_os_snapshot_role_arn" {
  default = ""
}

variable "backup_config_efs" {
  default = "false"
}

variable "backup_config_s3" {
  default = "false"
}

variable "bucket_name" {
  default = ""
}

variable "chef_server_certs_by_ip" {
  type    = map(map(string))
  default = {}
}

variable "existing_automate_ips" {
  default = []
}

variable "existing_automate_private_ips" {
  default = []
}

variable "existing_chef_server_ips" {
  default = []
}

variable "existing_chef_server_private_ips" {
  default = []
}

variable "existing_opensearch_ips" {
  default = []
}

variable "existing_opensearch_private_ips" {
  default = []
}

variable "existing_postgresql_ips" {
  default = []
}

variable "existing_postgresql_private_ips" {
  default = []
}

variable "google_service_account_file" {
  default = ""
}

variable "infra" {
  default = "existing_infra"
}

variable "location" {
  default = ""
}

variable "managed_opensearch_certificate" {
  default = ""
}

variable "managed_opensearch_domain_name" {
  default = ""
}

variable "managed_opensearch_domain_url" {
  default = ""
}

variable "managed_opensearch_user_password" {
  default = ""
}

variable "managed_opensearch_username" {
  default = ""
}

variable "managed_rds_certificate" {
  default = ""
}

variable "managed_rds_dbuser_password" {
  default = ""
}

variable "managed_rds_dbuser_username" {
  default = ""
}

variable "managed_rds_instance_url" {
  default = ""
}

variable "managed_rds_superuser_password" {
  default = ""
}

variable "managed_rds_superuser_username" {
  default = ""
}

variable "opensearch_base_path" {
  default = "elasticsearch"
}

variable "opensearch_certs_by_ip" {
  type    = map(map(string))
  default = {}
}

variable "opensearch_root_cert" {
}

variable "os_snapshot_user_access_key_id" {
  default = ""
}

variable "os_snapshot_user_access_key_secret" {
  default = ""
}

variable "postgresql_certs_by_ip" {
  type    = map(map(string))
  default = {}
}

variable "postgresql_root_cert" {
}

variable "region" {
  default = ""
}

variable "s3_endpoint" {
  default = "https://s3.amazonaws.com"
}

variable "secret_key" {
  default = ""
}

variable "setup_managed_services" {
  default = false
}

variable "setup_self_managed_services" {
  default = false
}

variable "ssh_key_file" {
}

variable "ssh_port" {
}

variable "ssh_user" {
}

variable "ssh_group_name" {
}

variable "sudo_cmd" {
  default = "sudo"
}



# ======================================================
# Archivo original: versions.tf
# Carpeta: C:\Users\asus\cloned_repos\chef\automate\terraform\a2ha-terraform\reference_architectures\existing_nodes
# ======================================================


terraform {
  required_version = ">= 0.12"
}




# ======================================================
# Archivo fusionado: terraform\a2ha-terraform\modules\vsphere\cloudvsphere.tf
# Piezas Terraform en carpeta: 88
# Tiene arquitectura (EC2/Docker/Serverless): False
# ======================================================



# ======================================================
# Archivo original: inputs.tf
# Carpeta: C:\Users\asus\cloned_repos\chef\automate\terraform\a2ha-terraform\modules\vsphere
# ======================================================

variable "automate_instance_count" {
  default = 1
}

variable "automate_instance_cpus" {
  default = 2
}

variable "automate_instance_datadisk_gb" {
  default = 100
}

variable "automate_instance_ram_mb" {
  default     = 8192
  description = "RAM value in MB"
}

variable "chef_server_instance_count" {
  default = 1
}

variable "chef_server_instance_cpus" {
  default = 2
}

variable "chef_server_instance_datadisk_gb" {
  default = 20
}

variable "chef_server_instance_ram_mb" {
  default     = 4096
  description = "RAM value in MB"
}

variable "elasticsearch_instance_cpus" {
  default = 2
}

variable "elasticsearch_instance_datadisk_gb" {
  default = 100
}

variable "elasticsearch_instance_ram_mb" {
  default     = 8192
  description = "RAM value in MB"
}

variable "nfs_mount_path" {
}

variable "opensearch_instance_count" {
  default = 3
}

variable "postgresql_instance_count" {
  default = 3
}

variable "postgresql_instance_cpus" {
  default = 2
}

variable "postgresql_instance_datadisk_gb" {
  default = 50
}

variable "postgresql_instance_ram_mb" {
  default     = 4096
  description = "RAM value in MB"
}

variable "ssh_user_sudo_password" {
}

variable "sudo_cmd" {
  default = "sudo"
}

variable "tag_contact" {
}

variable "tag_dept" {
}

variable "tag_name" {
  default = "A2"
}

variable "tag_project" {
}

variable "tmp_path" {
}

variable "vsphere_allow_unverified_ssl" {
  default = true
}

variable "vsphere_datacenter" {
  default = "Tierpoint"
}

variable "vsphere_datastore" {
  default = "FreeNAS03 iSCSI"
}

variable "vsphere_linux_datadisk_dev" {
  default     = "/dev/sdb"
  description = "Disk device which is meant to be formatted and mounted at /hab"
}

variable "vsphere_linux_lvm_allocate_pct" {
  default     = "80"
  description = "Percept of the LVM VG to allocate to the LV - 80% is recommended so theres room for snapshots"
}

variable "vsphere_linux_sshkeyfile" {
  default     = "~/.ssh/vagrant"
  description = "Path to the ssh private key file"
}

variable "vsphere_linux_sshport" {
  default = 22
}

variable "vsphere_linux_sshuser" {
  default = "vagrant"
}

variable "vsphere_linux_template" {
  description = "RHEL7 or CentOS7 template"
  default     = "centos76-template"
}

variable "vsphere_network" {
  default = "VM Network"
}

variable "vsphere_password" {
}

variable "vsphere_resource_pool" {
  default = "a2-ha-backend"
}

variable "vsphere_server" {
}

variable "vsphere_user" {
}



# ======================================================
# Archivo original: main.tf
# Carpeta: C:\Users\asus\cloned_repos\chef\automate\terraform\a2ha-terraform\modules\vsphere
# ======================================================

provider "vsphere" {
  user           = var.vsphere_user
  password       = var.vsphere_password
  vsphere_server = var.vsphere_server

  # If you have a self-signed cert
  allow_unverified_ssl = true
}

resource "random_id" "random" {
  byte_length = 4
}

data "vsphere_datacenter" "dc" {
  name = var.vsphere_datacenter
}

data "vsphere_datastore" "datastore" {
  name          = var.vsphere_datastore
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_resource_pool" "pool" {
  name          = var.vsphere_resource_pool
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_network" "network" {
  name          = var.vsphere_network
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_virtual_machine" "template" {
  name          = var.vsphere_linux_template
  datacenter_id = data.vsphere_datacenter.dc.id
}


locals {
  # This script is meant to be run once at VM provision time only
  mount_data_disk = templatefile("${path.module}/mount_data_disk.tpl", {
    disk_dev                = var.vsphere_linux_datadisk_dev,
    lvm_volume_allocate_pct = var.vsphere_linux_lvm_allocate_pct,
    tmp_path                = var.tmp_path
  })
  # This script is meant to be run once at VM provision time only
  mount_nfs_share = templatefile("${path.module}/mount_nfs_share.tpl", {
    mount_point = var.nfs_mount_path
  })
}

data "vsphere_custom_attribute" "contact" {
  name = "Contact"
}

data "vsphere_custom_attribute" "dept" {
  name = "Department"
}

data "vsphere_custom_attribute" "project" {
  name = "Project"
}

data "vsphere_custom_attribute" "clustername" {
  name = "ClusterName"
}

data "vsphere_custom_attribute" "clusterid" {
  name = "ClusterID"
}

resource "vsphere_virtual_machine" "chef_automate_postgresql" {
  count = var.postgresql_instance_count

  name = format(
    "${var.tag_name}_${random_id.random.hex}_backend_postgresql_%02d",
    count.index + 1,
  )
  resource_pool_id = data.vsphere_resource_pool.pool.id
  datastore_id     = data.vsphere_datastore.datastore.id
  custom_attributes = {
    data.vsphere_custom_attribute.contact.id     = var.tag_contact
    data.vsphere_custom_attribute.dept.id        = var.tag_dept
    data.vsphere_custom_attribute.project.id     = var.tag_project
    data.vsphere_custom_attribute.clustername.id = var.tag_name
    data.vsphere_custom_attribute.clusterid.id   = random_id.random.hex
  }

  num_cpus  = var.postgresql_instance_cpus
  memory    = var.postgresql_instance_ram_mb
  guest_id  = data.vsphere_virtual_machine.template.guest_id
  scsi_type = data.vsphere_virtual_machine.template.scsi_type

  connection {
    host        = self.default_ip_address
    type        = "ssh"
    user        = var.vsphere_linux_sshuser
    port        = var.vsphere_linux_sshport
    private_key = file(var.vsphere_linux_sshkeyfile)
    script_path = "${var.tmp_path}/tf_inline_script_vsphere.sh"
  }

  network_interface {
    network_id   = data.vsphere_network.network.id
    adapter_type = data.vsphere_virtual_machine.template.network_interface_types[0]
  }

  # OS disk (note, don't change the label: https://www.terraform.io/docs/providers/vsphere/r/virtual_machine.html#label)
  disk {
    label            = "disk0"
    size             = data.vsphere_virtual_machine.template.disks[0].size
    eagerly_scrub    = false
    thin_provisioned = true
    unit_number      = 0
  }

  # Data disk (note, don't change the label: https://www.terraform.io/docs/providers/vsphere/r/virtual_machine.html#label)
  disk {
    label            = "disk1"
    size             = var.postgresql_instance_datadisk_gb
    eagerly_scrub    = false
    thin_provisioned = true
    unit_number      = 1
  }

  clone {
    template_uuid = data.vsphere_virtual_machine.template.id
  }

  provisioner "file" {
    content     = local.mount_data_disk
    destination = "${var.tmp_path}/mount_data_disk"
  }

  provisioner "file" {
    content     = local.mount_nfs_share
    destination = "${var.tmp_path}/mount_nfs_share"
  }

  provisioner "remote-exec" {
    inline = [
      "echo '${var.ssh_user_sudo_password}' | ${var.sudo_cmd} -S bash -ex ${var.tmp_path}/mount_data_disk",
      "echo '${var.ssh_user_sudo_password}' | ${var.sudo_cmd} -S bash -ex ${var.tmp_path}/mount_nfs_share",
    ]
  }
}

resource "vsphere_virtual_machine" "chef_automate_opensearch" {
  count = var.opensearch_instance_count

  name = format(
    "${var.tag_name}_${random_id.random.hex}_backend_elasticsearch_%02d",
    count.index + 1,
  )
  resource_pool_id = data.vsphere_resource_pool.pool.id
  datastore_id     = data.vsphere_datastore.datastore.id
  custom_attributes = {
    data.vsphere_custom_attribute.contact.id     = var.tag_contact
    data.vsphere_custom_attribute.dept.id        = var.tag_dept
    data.vsphere_custom_attribute.project.id     = var.tag_project
    data.vsphere_custom_attribute.clustername.id = var.tag_name
    data.vsphere_custom_attribute.clusterid.id   = random_id.random.hex
  }

  num_cpus  = var.elasticsearch_instance_cpus
  memory    = var.elasticsearch_instance_ram_mb
  guest_id  = data.vsphere_virtual_machine.template.guest_id
  scsi_type = data.vsphere_virtual_machine.template.scsi_type

  connection {
    host        = self.default_ip_address
    type        = "ssh"
    user        = var.vsphere_linux_sshuser
    port        = var.vsphere_linux_sshport
    private_key = file(var.vsphere_linux_sshkeyfile)
    script_path = "${var.tmp_path}/tf_inline_script_vsphere.sh"
  }

  network_interface {
    network_id   = data.vsphere_network.network.id
    adapter_type = data.vsphere_virtual_machine.template.network_interface_types[0]
  }

  # OS disk (note, don't change the label: https://www.terraform.io/docs/providers/vsphere/r/virtual_machine.html#label)
  disk {
    label            = "disk0"
    size             = data.vsphere_virtual_machine.template.disks[0].size
    eagerly_scrub    = false
    thin_provisioned = true
    unit_number      = 0
  }

  # Data disk (note, don't change the label: https://www.terraform.io/docs/providers/vsphere/r/virtual_machine.html#label)
  disk {
    label            = "disk1"
    size             = var.elasticsearch_instance_datadisk_gb
    eagerly_scrub    = false
    thin_provisioned = true
    unit_number      = 1
  }

  clone {
    template_uuid = data.vsphere_virtual_machine.template.id
  }

  provisioner "file" {
    content     = local.mount_data_disk
    destination = "${var.tmp_path}/mount_data_disk"
  }

  provisioner "file" {
    content     = local.mount_nfs_share
    destination = "${var.tmp_path}/mount_nfs_share"
  }

  provisioner "remote-exec" {
    inline = [
      "echo '${var.ssh_user_sudo_password}' | ${var.sudo_cmd} -S bash -ex ${var.tmp_path}/mount_data_disk",
      "echo '${var.ssh_user_sudo_password}' | ${var.sudo_cmd} -S bash -ex ${var.tmp_path}/mount_nfs_share",
    ]
  }
}

resource "vsphere_virtual_machine" "chef_automate" {
  count = var.automate_instance_count

  name = format(
    "${var.tag_name}_${random_id.random.hex}_automate_%02d",
    count.index + 1,
  )
  resource_pool_id = data.vsphere_resource_pool.pool.id
  datastore_id     = data.vsphere_datastore.datastore.id
  custom_attributes = {
    data.vsphere_custom_attribute.contact.id     = var.tag_contact
    data.vsphere_custom_attribute.dept.id        = var.tag_dept
    data.vsphere_custom_attribute.project.id     = var.tag_project
    data.vsphere_custom_attribute.clustername.id = var.tag_name
    data.vsphere_custom_attribute.clusterid.id   = random_id.random.hex
  }

  num_cpus  = var.automate_instance_cpus
  memory    = var.automate_instance_ram_mb
  guest_id  = data.vsphere_virtual_machine.template.guest_id
  scsi_type = data.vsphere_virtual_machine.template.scsi_type

  connection {
    host        = self.default_ip_address
    type        = "ssh"
    user        = var.vsphere_linux_sshuser
    port        = var.vsphere_linux_sshport
    private_key = file(var.vsphere_linux_sshkeyfile)
    script_path = "${var.tmp_path}/tf_inline_script_vsphere.sh"
  }

  network_interface {
    network_id   = data.vsphere_network.network.id
    adapter_type = data.vsphere_virtual_machine.template.network_interface_types[0]
  }

  # OS disk (note, don't change the label: https://www.terraform.io/docs/providers/vsphere/r/virtual_machine.html#label)
  disk {
    label            = "disk0"
    size             = data.vsphere_virtual_machine.template.disks[0].size
    eagerly_scrub    = false
    thin_provisioned = true
    unit_number      = 0
  }

  # Data disk (note, don't change the label: https://www.terraform.io/docs/providers/vsphere/r/virtual_machine.html#label)
  disk {
    label            = "disk1"
    size             = var.automate_instance_datadisk_gb
    eagerly_scrub    = false
    thin_provisioned = true
    unit_number      = 1
  }

  clone {
    template_uuid = data.vsphere_virtual_machine.template.id
  }

  provisioner "file" {
    content     = local.mount_data_disk
    destination = "${var.tmp_path}/mount_data_disk"
  }

  provisioner "file" {
    content     = local.mount_nfs_share
    destination = "${var.tmp_path}/mount_nfs_share"
  }

  provisioner "remote-exec" {
    inline = [
      "echo '${var.ssh_user_sudo_password}' | ${var.sudo_cmd} -S bash -ex ${var.tmp_path}/mount_data_disk",
      "echo '${var.ssh_user_sudo_password}' | ${var.sudo_cmd} -S bash -ex ${var.tmp_path}/mount_nfs_share",
    ]
  }
}

resource "vsphere_virtual_machine" "chef_server" {
  count = var.chef_server_instance_count

  name = format(
    "${var.tag_name}_${random_id.random.hex}_chef_server_%02d",
    count.index + 1,
  )
  resource_pool_id = data.vsphere_resource_pool.pool.id
  datastore_id     = data.vsphere_datastore.datastore.id
  custom_attributes = {
    data.vsphere_custom_attribute.contact.id     = var.tag_contact
    data.vsphere_custom_attribute.dept.id        = var.tag_dept
    data.vsphere_custom_attribute.project.id     = var.tag_project
    data.vsphere_custom_attribute.clustername.id = var.tag_name
    data.vsphere_custom_attribute.clusterid.id   = random_id.random.hex
  }

  num_cpus  = var.chef_server_instance_cpus
  memory    = var.chef_server_instance_ram_mb
  guest_id  = data.vsphere_virtual_machine.template.guest_id
  scsi_type = data.vsphere_virtual_machine.template.scsi_type

  connection {
    host        = self.default_ip_address
    type        = "ssh"
    user        = var.vsphere_linux_sshuser
    port        = var.vsphere_linux_sshport
    private_key = file(var.vsphere_linux_sshkeyfile)
    script_path = "${var.tmp_path}/tf_inline_script_vsphere.sh"
  }

  network_interface {
    network_id   = data.vsphere_network.network.id
    adapter_type = data.vsphere_virtual_machine.template.network_interface_types[0]
  }

  # OS disk (note, don't change the label: https://www.terraform.io/docs/providers/vsphere/r/virtual_machine.html#label)
  disk {
    label            = "disk0"
    size             = data.vsphere_virtual_machine.template.disks[0].size
    eagerly_scrub    = false
    thin_provisioned = true
    unit_number      = 0
  }

  # Data disk (note, don't change the label: https://www.terraform.io/docs/providers/vsphere/r/virtual_machine.html#label)
  disk {
    label            = "disk1"
    size             = var.chef_server_instance_datadisk_gb
    eagerly_scrub    = false
    thin_provisioned = true
    unit_number      = 1
  }

  clone {
    template_uuid = data.vsphere_virtual_machine.template.id
  }

  provisioner "file" {
    content     = local.mount_data_disk
    destination = "${var.tmp_path}/mount_data_disk"
  }

  provisioner "file" {
    content     = local.mount_nfs_share
    destination = "${var.tmp_path}/mount_nfs_share"
  }

  provisioner "remote-exec" {
    inline = [
      "echo '${var.ssh_user_sudo_password}' | ${var.sudo_cmd} -S bash -ex ${var.tmp_path}/mount_data_disk",
      "echo '${var.ssh_user_sudo_password}' | ${var.sudo_cmd} -S bash -ex ${var.tmp_path}/mount_nfs_share",
    ]
  }
}




# ======================================================
# Archivo original: outputs.tf
# Carpeta: C:\Users\asus\cloned_repos\chef\automate\terraform\a2ha-terraform\modules\vsphere
# ======================================================

output "automate_frontend_url" {
  value = "https://${element(
    vsphere_virtual_machine.chef_automate.*.default_ip_address,
    0,
  )}"
}

output "automate_ssh" {
  value = formatlist(
    "ssh -i %s %s@%s",
    var.vsphere_linux_sshkeyfile,
    var.vsphere_linux_sshuser,
    vsphere_virtual_machine.chef_automate.*.default_ip_address,
  )
}

output "chef_server_ssh" {
  value = formatlist(
    "ssh -i %s %s@%s",
    var.vsphere_linux_sshkeyfile,
    var.vsphere_linux_sshuser,
    vsphere_virtual_machine.chef_server.*.default_ip_address,
  )
}

output "postgresql_ssh" {
  value = formatlist(
    "ssh -i %s %s@%s",
    var.vsphere_linux_sshkeyfile,
    var.vsphere_linux_sshuser,
    vsphere_virtual_machine.chef_automate_postgresql.*.default_ip_address,
  )
}

output "opensearch_ssh" {
  value = formatlist(
    "ssh -i %s %s@%s",
    var.vsphere_linux_sshkeyfile,
    var.vsphere_linux_sshuser,
    vsphere_virtual_machine.chef_automate_opensearch.*.default_ip_address,
  )
}

output "automate_private_ips" {
  value = [vsphere_virtual_machine.chef_automate.*.default_ip_address]
}

output "chef_server_private_ips" {
  value = [vsphere_virtual_machine.chef_server.*.default_ip_address]
}

output "postgresql_private_ips" {
  value = [vsphere_virtual_machine.chef_automate_postgresql.*.default_ip_address]
}

output "opensearch_private_ips" {
  value = [vsphere_virtual_machine.chef_automate_opensearch.*.default_ip_address]
}

output "opensearch_public_ips" {
  value = [vsphere_virtual_machine.chef_automate_opensearch.*.default_ip_address]
}

output "ssh_user" {
  value = var.aws_ssh_user
}
output "ssh_port" {
  value = var.aws_ssh_port
}



# ======================================================
# Archivo original: versions.tf
# Carpeta: C:\Users\asus\cloned_repos\chef\automate\terraform\a2ha-terraform\modules\vsphere
# ======================================================


terraform {
  required_version = ">= 0.12"
}




# ======================================================
# Archivo fusionado: terraform\a2ha-terraform\reference_architectures\deployment\clouddeployment.tf
# Piezas Terraform en carpeta: 141
# Tiene arquitectura (EC2/Docker/Serverless): False
# ======================================================



# ======================================================
# Archivo original: main.tf
# Carpeta: C:\Users\asus\cloned_repos\chef\automate\terraform\a2ha-terraform\reference_architectures\deployment
# ======================================================

resource "random_id" "cluster_id" {
  byte_length = 4
}

module "system-tuning-automate" {
  source                          = "./modules/system"
  automate_archive_disk_fs_path   = var.automate_archive_disk_fs_path
  opensearch_archive_disk_fs_path = var.setup_managed_services ? "" : var.elasticsearch_archive_disk_fs_path
  instance_count                  = var.automate_instance_count
  postgresql_archive_disk_fs_path = var.setup_managed_services ? "" : var.postgresql_archive_disk_fs_path
  private_ips                     = var.automate_private_ips
  ssh_key_file                    = var.ssh_key_file
  ssh_user                        = var.ssh_user
  ssh_group_name                  = var.ssh_group_name
  ssh_port                        = var.ssh_port
  ssh_user_sudo_password          = local.fe_sudo_password
  sudo_cmd                        = var.sudo_cmd
}

module "system-tuning-chef_server" {
  source                          = "./modules/system"
  automate_archive_disk_fs_path   = var.automate_archive_disk_fs_path
  opensearch_archive_disk_fs_path = var.setup_managed_services ? "" : var.elasticsearch_archive_disk_fs_path
  instance_count                  = var.chef_server_instance_count
  postgresql_archive_disk_fs_path = var.setup_managed_services ? "" : var.postgresql_archive_disk_fs_path
  private_ips                     = var.chef_server_private_ips
  ssh_key_file                    = var.ssh_key_file
  ssh_user                        = var.ssh_user
  ssh_group_name                  = var.ssh_group_name
  ssh_port                        = var.ssh_port
  ssh_user_sudo_password          = local.fe_sudo_password
  sudo_cmd                        = var.sudo_cmd
}

module "system-tuning-opensearch" {
  source                          = "./modules/system"
  count                           = var.setup_managed_services ? 0 : 1
  automate_archive_disk_fs_path   = var.automate_archive_disk_fs_path
  opensearch_archive_disk_fs_path = var.setup_managed_services ? "" : var.elasticsearch_archive_disk_fs_path
  instance_count                  = var.opensearch_instance_count
  postgresql_archive_disk_fs_path = var.setup_managed_services ? "" : var.postgresql_archive_disk_fs_path
  private_ips                     = var.opensearch_private_ips
  ssh_key_file                    = var.ssh_key_file
  ssh_user                        = var.ssh_user
  ssh_group_name                  = var.ssh_group_name
  ssh_port                        = var.ssh_port
  ssh_user_sudo_password          = local.be_sudo_password
  sudo_cmd                        = var.sudo_cmd
}

module "system-tuning-postgresql" {
  source                          = "./modules/system"
  count                           = var.setup_managed_services ? 0 : 1
  automate_archive_disk_fs_path   = var.automate_archive_disk_fs_path
  opensearch_archive_disk_fs_path = var.setup_managed_services ? "" : var.elasticsearch_archive_disk_fs_path
  instance_count                  = var.postgresql_instance_count
  postgresql_archive_disk_fs_path = var.setup_managed_services ? "" : var.postgresql_archive_disk_fs_path
  private_ips                     = var.postgresql_private_ips
  ssh_key_file                    = var.ssh_key_file
  ssh_user                        = var.ssh_user
  ssh_group_name                  = var.ssh_group_name
  ssh_port                        = var.ssh_port
  ssh_user_sudo_password          = local.be_sudo_password
  sudo_cmd                        = var.sudo_cmd
}

module "airgap_bundle-opensearch" {
  source            = "./modules/airgap_bundle"
  count             = var.setup_managed_services ? 0 : 1
  archive_disk_info = var.setup_managed_services ? "" : module.system-tuning-opensearch[0].archive_disk_info
  instance_count    = var.opensearch_instance_count
  private_ips       = var.opensearch_private_ips
  bundle_files = [{
    source      = var.backend_aib_local_file
    destination = var.backend_aib_dest_file
  }]
  ssh_key_file = var.ssh_key_file
  ssh_user     = var.ssh_user
  ssh_port     = var.ssh_port
  tmp_path     = var.tmp_path
  depends_on = [
    module.system-tuning-opensearch
  ]
}

module "airgap_bundle-postgresql" {
  count             = var.setup_managed_services ? 0 : 1
  source            = "./modules/airgap_bundle"
  archive_disk_info = var.setup_managed_services ? "" : module.system-tuning-postgresql[0].archive_disk_info
  instance_count    = var.postgresql_instance_count
  private_ips       = var.postgresql_private_ips
  bundle_files = [{
    source      = var.backend_aib_local_file
    destination = var.backend_aib_dest_file
  }]
  ssh_key_file = var.ssh_key_file
  ssh_user     = var.ssh_user
  ssh_port     = var.ssh_port
  tmp_path     = var.tmp_path
  depends_on = [
    module.system-tuning-postgresql
  ]
}

module "airgap_bundle-automate" {
  source            = "./modules/airgap_bundle"
  archive_disk_info = module.system-tuning-automate.archive_disk_info
  instance_count    = var.automate_instance_count
  private_ips       = var.automate_private_ips
  bundle_files = [{
    source      = var.backend_aib_local_file
    destination = var.backend_aib_dest_file
    }, {
    source      = var.frontend_aib_local_file
    destination = var.frontend_aib_dest_file
  }]
  ssh_key_file = var.ssh_key_file
  ssh_user     = var.ssh_user
  ssh_port     = var.ssh_port
  tmp_path     = var.tmp_path
  depends_on = [
    module.system-tuning-automate
  ]
}

module "airgap_bundle-chef_server" {
  source            = "./modules/airgap_bundle"
  archive_disk_info = module.system-tuning-chef_server.archive_disk_info
  instance_count    = var.chef_server_instance_count
  private_ips       = var.chef_server_private_ips
  bundle_files = [{
    source      = var.backend_aib_local_file
    destination = var.backend_aib_dest_file
    }, {
    source      = var.frontend_aib_local_file
    destination = var.frontend_aib_dest_file
  }]
  ssh_key_file = var.ssh_key_file
  ssh_user     = var.ssh_user
  ssh_port     = var.ssh_port
  tmp_path     = var.tmp_path
  depends_on = [
    module.system-tuning-chef_server
  ]
}

module "habitat-opensearch" {
  source                          = "./modules/habitat"
  count                           = var.setup_managed_services ? 0 : 1
  airgap_info                     = var.setup_managed_services ? "" : module.airgap_bundle-opensearch[0].airgap_info
  hab_sup_http_gateway_auth_token = var.hab_sup_http_gateway_auth_token
  hab_sup_http_gateway_ca_cert    = var.hab_sup_http_gateway_ca_cert
  hab_sup_http_gateway_priv_key   = var.hab_sup_http_gateway_priv_key
  hab_sup_http_gateway_pub_cert   = var.hab_sup_http_gateway_pub_cert
  hab_sup_ring_key                = var.hab_sup_ring_key
  hab_sup_run_args                = var.hab_sup_run_args
  install_hab_sh_args             = ""
  instance_count                  = var.opensearch_instance_count
  backend_aib_dest_file           = var.backend_aib_dest_file
  backend_aib_local_file          = var.backend_aib_local_file
  private_ips                     = var.opensearch_private_ips
  peer_ips = concat(
    var.opensearch_private_ips,
    var.postgresql_private_ips
  )
  ssh_key_file           = var.ssh_key_file
  ssh_user               = var.ssh_user
  ssh_port               = var.ssh_port
  ssh_user_sudo_password = local.be_sudo_password
  sudo_cmd               = var.sudo_cmd
  habitat_uid_gid        = var.habitat_uid_gid
  depends_on = [
    module.airgap_bundle-opensearch
  ]
}

module "habitat-postgresql" {
  count                           = var.setup_managed_services ? 0 : 1
  source                          = "./modules/habitat"
  airgap_info                     = var.setup_managed_services ? "" : module.airgap_bundle-postgresql[0].airgap_info
  hab_sup_http_gateway_auth_token = var.hab_sup_http_gateway_auth_token
  hab_sup_http_gateway_ca_cert    = var.hab_sup_http_gateway_ca_cert
  hab_sup_http_gateway_priv_key   = var.hab_sup_http_gateway_priv_key
  hab_sup_http_gateway_pub_cert   = var.hab_sup_http_gateway_pub_cert
  hab_sup_ring_key                = var.hab_sup_ring_key
  hab_sup_run_args                = var.hab_sup_run_args
  install_hab_sh_args             = ""
  instance_count                  = var.postgresql_instance_count
  backend_aib_dest_file           = var.backend_aib_dest_file
  backend_aib_local_file          = var.backend_aib_local_file
  private_ips                     = var.postgresql_private_ips
  peer_ips = concat(
    var.opensearch_private_ips,
    var.postgresql_private_ips
  )
  ssh_key_file           = var.ssh_key_file
  ssh_user               = var.ssh_user
  ssh_port               = var.ssh_port
  ssh_user_sudo_password = local.be_sudo_password
  sudo_cmd               = var.sudo_cmd
  habitat_uid_gid        = var.habitat_uid_gid
  depends_on = [
    module.airgap_bundle-postgresql
  ]
}

module "habitat-automate" {
  source                          = "./modules/habitat"
  airgap_info                     = module.airgap_bundle-automate.airgap_info
  hab_sup_http_gateway_auth_token = var.hab_sup_http_gateway_auth_token
  hab_sup_http_gateway_ca_cert    = var.hab_sup_http_gateway_ca_cert
  hab_sup_http_gateway_priv_key   = var.hab_sup_http_gateway_priv_key
  hab_sup_http_gateway_pub_cert   = var.hab_sup_http_gateway_pub_cert
  hab_sup_ring_key                = var.hab_sup_ring_key
  hab_sup_run_args                = var.hab_sup_run_args
  install_hab_sh_args             = "--no-service"
  instance_count                  = var.automate_instance_count
  backend_aib_dest_file           = var.backend_aib_dest_file
  backend_aib_local_file          = var.backend_aib_local_file
  private_ips                     = var.automate_private_ips
  peer_ips                        = var.automate_private_ips
  ssh_key_file                    = var.ssh_key_file
  ssh_user                        = var.ssh_user
  ssh_port                        = var.ssh_port
  ssh_user_sudo_password          = local.fe_sudo_password
  sudo_cmd                        = var.sudo_cmd
  habitat_uid_gid                 = var.habitat_uid_gid
  depends_on = [
    module.airgap_bundle-automate
  ]
}

module "habitat-chef_server" {
  source                          = "./modules/habitat"
  airgap_info                     = module.airgap_bundle-chef_server.airgap_info
  hab_sup_http_gateway_auth_token = var.hab_sup_http_gateway_auth_token
  hab_sup_http_gateway_ca_cert    = var.hab_sup_http_gateway_ca_cert
  hab_sup_http_gateway_priv_key   = var.hab_sup_http_gateway_priv_key
  hab_sup_http_gateway_pub_cert   = var.hab_sup_http_gateway_pub_cert
  hab_sup_ring_key                = var.hab_sup_ring_key
  hab_sup_run_args                = var.hab_sup_run_args
  install_hab_sh_args             = "--no-service"
  instance_count                  = var.chef_server_instance_count
  backend_aib_dest_file           = var.backend_aib_dest_file
  backend_aib_local_file          = var.backend_aib_local_file
  private_ips                     = var.chef_server_private_ips
  peer_ips                        = var.chef_server_private_ips
  ssh_key_file                    = var.ssh_key_file
  ssh_user                        = var.ssh_user
  ssh_port                        = var.ssh_port
  ssh_user_sudo_password          = local.fe_sudo_password
  sudo_cmd                        = var.sudo_cmd
  habitat_uid_gid                 = var.habitat_uid_gid
  depends_on = [
    module.airgap_bundle-chef_server
  ]
}

module "opensearch" {
  source                          = "./modules/opensearch"
  count                           = var.setup_managed_services ? 0 : 1
  airgap_info                     = var.setup_managed_services ? "" : module.airgap_bundle-opensearch[0].airgap_info
  backend_aib_dest_file           = var.backend_aib_dest_file
  backend_aib_local_file          = var.backend_aib_local_file
  curator_pkg_ident               = var.curator_pkg_ident
  opensearch_instance_count       = var.opensearch_instance_count
  opensearch_listen_port          = var.opensearch_listen_port
  opensearch_pkg_ident            = var.opensearch_pkg_ident
  opensearch_svc_load_args        = var.elasticsearch_svc_load_args
  opensearchsidecar_pkg_ident     = var.elasticsidecar_pkg_ident
  opensearchsidecar_svc_load_args = var.elasticsidecar_svc_load_args
  habitat_info                    = var.setup_managed_services ? "" : module.habitat-opensearch[0].habitat_info
  journalbeat_pkg_ident           = var.journalbeat_pkg_ident
  kibana_pkg_ident                = var.kibana_pkg_ident
  metricbeat_pkg_ident            = var.metricbeat_pkg_ident
  private_ips                     = var.opensearch_private_ips
  ssh_key_file                    = var.ssh_key_file
  ssh_user                        = var.ssh_user
  ssh_port                        = var.ssh_port
  ssh_user_sudo_password          = local.be_sudo_password
  sudo_cmd                        = var.sudo_cmd
  backup_config_efs               = var.backup_config_efs_deployment
  nfs_mount_path                  = var.nfs_mount_path
  opensearch_root_ca              = var.opensearch_root_ca
  opensearch_private_key          = var.opensearch_private_key
  opensearch_public_key           = var.opensearch_public_key
  opensearch_admin_key            = var.opensearch_admin_key
  opensearch_admin_cert           = var.opensearch_admin_cert
  opensearch_admin_dn             = var.opensearch_admin_dn
  opensearch_nodes_dn             = var.opensearch_nodes_dn
  opensearch_custom_certs_enabled = var.opensearch_custom_certs_enabled
  opensearch_certs_by_ip          = var.opensearch_certs_by_ip
  opensearch_base_path            = var.opensearch_base_path
  depends_on = [
    module.habitat-opensearch
  ]
}

module "postgresql" {
  count                           = var.setup_managed_services ? 0 : 1
  source                          = "./modules/postgresql"
  airgap_info                     = var.setup_managed_services ? "" : module.airgap_bundle-postgresql[0].airgap_info
  backend_aib_dest_file           = var.backend_aib_dest_file
  backend_aib_local_file          = var.backend_aib_local_file
  opensearch_listen_port          = var.opensearch_listen_port
  opensearch_private_ips          = var.opensearch_private_ips
  habitat_info                    = var.setup_managed_services ? "" : module.habitat-postgresql[0].habitat_info
  journalbeat_pkg_ident           = var.journalbeat_pkg_ident
  metricbeat_pkg_ident            = var.metricbeat_pkg_ident
  pgleaderchk_listen_port         = var.pgleaderchk_listen_port
  pgleaderchk_pkg_ident           = var.pgleaderchk_pkg_ident
  pgleaderchk_svc_load_args       = var.pgleaderchk_svc_load_args
  postgresql_archive_disk_fs_path = var.setup_managed_services ? "" : var.postgresql_archive_disk_fs_path
  postgresql_instance_count       = var.postgresql_instance_count
  postgresql_listen_port          = var.postgresql_listen_port
  postgresql_pkg_ident            = var.postgresql_pkg_ident
  postgresql_pg_dump_enabled      = var.postgresql_pg_dump_enabled
  postgresql_ssl_enable           = var.postgresql_ssl_enable
  postgresql_svc_load_args        = var.postgresql_svc_load_args
  postgresql_wal_archive_enabled  = var.postgresql_wal_archive_enabled
  proxy_listen_port               = var.proxy_listen_port
  proxy_pkg_ident                 = var.proxy_pkg_ident
  proxy_svc_load_args             = var.proxy_svc_load_args
  private_ips                     = var.postgresql_private_ips
  ssh_key_file                    = var.ssh_key_file
  ssh_user                        = var.ssh_user
  ssh_port                        = var.ssh_port
  ssh_user_sudo_password          = local.be_sudo_password
  sudo_cmd                        = var.sudo_cmd
  nfs_mount_path                  = var.nfs_mount_path
  postgresql_root_ca              = var.postgresql_root_ca
  postgresql_private_key          = var.postgresql_private_key
  postgresql_public_key           = var.postgresql_public_key
  postgresql_custom_certs_enabled = var.postgresql_custom_certs_enabled
  postgresql_certs_by_ip          = var.postgresql_certs_by_ip
  depends_on = [
    module.habitat-postgresql
  ]
}

module "postgresql_config_sync" {
  count                           = var.setup_managed_services ? 0 : 1
  source                          = "./modules/postgresqlconfigsync"
  postgresql_instance_count       = var.postgresql_instance_count
  private_ips                     = var.postgresql_private_ips
  postgresql_svc_load_args        = var.postgresql_svc_load_args
  postgresql_pkg_ident            = var.postgresql_pkg_ident
  pgleaderchk_listen_port         = var.pgleaderchk_listen_port
  pgleaderchk_pkg_ident           = var.pgleaderchk_pkg_ident
  pgleaderchk_svc_load_args       = var.pgleaderchk_svc_load_args
  proxy_listen_port               = var.proxy_listen_port
  proxy_pkg_ident                 = var.proxy_pkg_ident
  proxy_svc_load_args             = var.proxy_svc_load_args
  ssh_key_file                    = var.ssh_key_file
  ssh_user                        = var.ssh_user
  ssh_port                        = var.ssh_port
  ssh_user_sudo_password          = local.be_sudo_password
  sudo_cmd                        = var.sudo_cmd
  tmp_path                        = var.tmp_path
  depends_on                      = [module.postgresql]
}

module "bootstrap_automate" {
  source                             = "./modules/automate"
  airgap_info                        = module.airgap_bundle-automate.airgap_info
  aws_region                         = var.aws_region
  automate_admin_email               = var.automate_admin_email
  automate_admin_username            = var.automate_admin_username
  automate_admin_password            = var.automate_admin_password
  automate_config                    = file(var.automate_config_file)
  automate_root_ca                   = var.automate_root_ca
  opensearch_root_ca                 = var.opensearch_root_ca
  postgresql_root_ca                 = var.postgresql_root_ca
  automate_private_key               = var.automate_private_key
  automate_public_key                = var.automate_public_key
  chef_server_private_key            = var.chef_server_private_key
  chef_server_public_key             = var.chef_server_public_key
  automate_custom_certs_enabled      = var.automate_custom_certs_enabled
  chef_server_custom_certs_enabled   = var.chef_server_custom_certs_enabled
  postgresql_custom_certs_enabled    = var.postgresql_custom_certs_enabled
  opensearch_custom_certs_enabled    = var.opensearch_custom_certs_enabled
  automate_certs_by_ip               = var.automate_certs_by_ip
  automate_dc_token                  = var.automate_dc_token
  automate_fqdn                      = var.automate_fqdn
  automate_lb_fqdn                   = var.automate_lb_fqdn
  automate_instance_count            = 1
  automate_role                      = "bootstrap_automate"
  backend_aib_dest_file              = var.backend_aib_dest_file
  backend_aib_local_file             = var.backend_aib_local_file
  cluster_id                         = random_id.cluster_id.hex
  frontend_aib_dest_file             = var.frontend_aib_dest_file
  frontend_aib_local_file            = var.frontend_aib_local_file
  habitat_info                       = module.habitat-automate.habitat_info
  hab_sup_http_gateway_auth_token    = var.hab_sup_http_gateway_auth_token
  opensearch_listen_port             = var.opensearch_listen_port
  opensearch_private_ips             = var.opensearch_private_ips
  managed_opensearch_certificate     = var.managed_opensearch_certificate_deployment
  managed_opensearch_domain_url      = var.managed_opensearch_domain_url_deployment
  managed_opensearch_user_password   = var.managed_opensearch_user_password_deployment
  managed_opensearch_username        = var.managed_opensearch_username_deployment
  aws_os_snapshot_role_arn           = length(trimspace(var.aws_os_snapshot_role_arn_deployment)) > 0 ? var.aws_os_snapshot_role_arn_deployment : var.aws_os_snapshot_role_arn
  os_snapshot_user_access_key_id     = length(trimspace(var.os_snapshot_user_access_key_id_deployment)) > 0 ? var.os_snapshot_user_access_key_id_deployment : var.os_snapshot_user_access_key_id
  os_snapshot_user_access_key_secret = length(trimspace(var.os_snapshot_user_access_key_secret_deployment)) > 0 ? var.os_snapshot_user_access_key_secret_deployment : var.os_snapshot_user_access_key_secret
  managed_rds_instance_url           = var.managed_rds_instance_url_deployment
  managed_rds_superuser_username     = var.managed_rds_superuser_username_deployment
  managed_rds_superuser_password     = var.managed_rds_superuser_password_deployment
  managed_rds_dbuser_username        = var.managed_rds_dbuser_username_deployment
  managed_rds_dbuser_password        = var.managed_rds_dbuser_password_deployment
  managed_rds_certificate            = var.managed_rds_certificate_deployment
  opensearch_root_cert               = var.opensearch_root_cert
  postgresql_root_cert               = var.postgresql_root_cert
  postgresql_private_ips             = var.postgresql_private_ips
  postgresql_ssl_enable              = var.postgresql_ssl_enable
  private_ips                        = slice(var.automate_private_ips, 0, 1)
  proxy_listen_port                  = var.proxy_listen_port
  postgresql_listen_port             = var.postgresql_listen_port
  setup_managed_services             = var.setup_managed_services
  ssh_key_file                       = var.ssh_key_file
  ssh_user                           = var.ssh_user
  ssh_port                           = var.ssh_port
  ssh_user_sudo_password             = local.fe_sudo_password
  sudo_cmd                           = var.sudo_cmd
  teams_port                         = var.teams_port
  backup_config_s3                   = var.backup_config_s3_deployment
  backup_config_efs                  = var.backup_config_efs_deployment
  s3_endpoint                        = var.s3_endpoint
  bucket_name                        = var.bucket_name_deployment
  nfs_mount_path                     = var.nfs_mount_path
  infra                              = "deployment"
  automate_base_path                 = var.automate_base_path
  opensearch_base_path               = var.opensearch_base_path
  depends_on = [
    module.airgap_bundle-automate,
    module.postgresql,
    module.opensearch
  ]
}

module "automate" {
  source                             = "./modules/automate"
  airgap_info                        = module.airgap_bundle-automate.airgap_info
  aws_region                         = var.aws_region
  automate_admin_email               = var.automate_admin_email
  automate_admin_username            = var.automate_admin_username
  automate_admin_password            = var.automate_admin_password
  automate_config                    = file(var.automate_config_file)
  automate_root_ca                   = var.automate_root_ca
  opensearch_root_ca                 = var.opensearch_root_ca
  postgresql_root_ca                 = var.postgresql_root_ca
  automate_private_key               = var.automate_private_key
  automate_public_key                = var.automate_public_key
  chef_server_private_key            = var.chef_server_private_key
  chef_server_public_key             = var.chef_server_public_key
  automate_custom_certs_enabled      = var.automate_custom_certs_enabled
  chef_server_custom_certs_enabled   = var.chef_server_custom_certs_enabled
  postgresql_custom_certs_enabled    = var.postgresql_custom_certs_enabled
  opensearch_custom_certs_enabled    = var.opensearch_custom_certs_enabled
  automate_certs_by_ip               = var.automate_certs_by_ip
  automate_dc_token                  = var.automate_dc_token
  automate_fqdn                      = var.automate_fqdn
  automate_lb_fqdn                   = var.automate_lb_fqdn
  automate_instance_count            = var.automate_instance_count - 1
  automate_role                      = "automate"
  backend_aib_dest_file              = var.backend_aib_dest_file
  backend_aib_local_file             = var.backend_aib_local_file
  cluster_id                         = random_id.cluster_id.hex
  frontend_aib_dest_file             = var.frontend_aib_dest_file
  frontend_aib_local_file            = var.frontend_aib_local_file
  habitat_info                       = module.habitat-automate.habitat_info
  hab_sup_http_gateway_auth_token    = var.hab_sup_http_gateway_auth_token
  opensearch_listen_port             = var.opensearch_listen_port
  opensearch_private_ips             = var.opensearch_private_ips
  managed_opensearch_certificate     = var.managed_opensearch_certificate_deployment
  managed_opensearch_domain_url      = var.managed_opensearch_domain_url_deployment
  managed_opensearch_user_password   = var.managed_opensearch_user_password_deployment
  managed_opensearch_username        = var.managed_opensearch_username_deployment
  aws_os_snapshot_role_arn           = length(trimspace(var.aws_os_snapshot_role_arn_deployment)) > 0 ? var.aws_os_snapshot_role_arn_deployment : var.aws_os_snapshot_role_arn
  os_snapshot_user_access_key_id     = length(trimspace(var.os_snapshot_user_access_key_id_deployment)) > 0 ? var.os_snapshot_user_access_key_id_deployment : var.os_snapshot_user_access_key_id
  os_snapshot_user_access_key_secret = length(trimspace(var.os_snapshot_user_access_key_secret_deployment)) > 0 ? var.os_snapshot_user_access_key_secret_deployment : var.os_snapshot_user_access_key_secret
  managed_rds_instance_url           = var.managed_rds_instance_url_deployment
  managed_rds_superuser_username     = var.managed_rds_superuser_username_deployment
  managed_rds_superuser_password     = var.managed_rds_superuser_password_deployment
  managed_rds_dbuser_username        = var.managed_rds_dbuser_username_deployment
  managed_rds_dbuser_password        = var.managed_rds_dbuser_password_deployment
  managed_rds_certificate            = var.managed_rds_certificate_deployment
  opensearch_root_cert               = var.opensearch_root_cert
  postgresql_root_cert               = var.postgresql_root_cert
  postgresql_private_ips             = var.postgresql_private_ips
  postgresql_ssl_enable              = var.postgresql_ssl_enable
  private_ips = slice(
    var.automate_private_ips,
    1,
    length(var.automate_private_ips),
  )
  proxy_listen_port      = var.proxy_listen_port
  postgresql_listen_port = var.postgresql_listen_port
  setup_managed_services = var.setup_managed_services
  ssh_key_file           = var.ssh_key_file
  ssh_user               = var.ssh_user
  ssh_port               = var.ssh_port
  ssh_user_sudo_password = local.fe_sudo_password
  sudo_cmd               = var.sudo_cmd
  teams_port             = var.teams_port
  backup_config_s3       = var.backup_config_s3_deployment
  backup_config_efs      = var.backup_config_efs_deployment
  s3_endpoint            = var.s3_endpoint
  bucket_name            = var.bucket_name_deployment
  nfs_mount_path         = var.nfs_mount_path
  infra                  = "deployment"
  automate_base_path                 = var.automate_base_path
  opensearch_base_path               = var.opensearch_base_path
  depends_on = [
    module.bootstrap_automate
  ]
}

module "chef_server" {
  source                             = "./modules/automate"
  airgap_info                        = module.airgap_bundle-chef_server.airgap_info
  aws_region                         = var.aws_region
  automate_admin_email               = var.automate_admin_email
  automate_admin_username            = var.automate_admin_username
  automate_admin_password            = var.automate_admin_password
  automate_config                    = file(var.automate_config_file)
  automate_root_ca                   = var.automate_root_ca
  opensearch_root_ca                 = var.opensearch_root_ca
  postgresql_root_ca                 = var.postgresql_root_ca
  automate_private_key               = var.automate_private_key
  automate_public_key                = var.automate_public_key
  chef_server_private_key            = var.chef_server_private_key
  chef_server_public_key             = var.chef_server_public_key
  automate_custom_certs_enabled      = var.automate_custom_certs_enabled
  chef_server_custom_certs_enabled   = var.chef_server_custom_certs_enabled
  postgresql_custom_certs_enabled    = var.postgresql_custom_certs_enabled
  opensearch_custom_certs_enabled    = var.opensearch_custom_certs_enabled
  chef_server_certs_by_ip            = var.chef_server_certs_by_ip
  automate_dc_token                  = var.automate_dc_token
  automate_fqdn                      = var.automate_fqdn
  automate_lb_fqdn                   = var.automate_lb_fqdn
  automate_instance_count            = var.chef_server_instance_count
  automate_role                      = "chef_api"
  backend_aib_dest_file              = var.backend_aib_dest_file
  backend_aib_local_file             = var.backend_aib_local_file
  cluster_id                         = random_id.cluster_id.hex
  frontend_aib_dest_file             = var.frontend_aib_dest_file
  frontend_aib_local_file            = var.frontend_aib_local_file
  habitat_info                       = module.habitat-chef_server.habitat_info
  hab_sup_http_gateway_auth_token    = var.hab_sup_http_gateway_auth_token
  opensearch_listen_port             = var.opensearch_listen_port
  opensearch_private_ips             = var.opensearch_private_ips
  managed_opensearch_certificate     = var.managed_opensearch_certificate_deployment
  managed_opensearch_domain_url      = var.managed_opensearch_domain_url_deployment
  managed_opensearch_user_password   = var.managed_opensearch_user_password_deployment
  managed_opensearch_username        = var.managed_opensearch_username_deployment
  aws_os_snapshot_role_arn           = length(trimspace(var.aws_os_snapshot_role_arn_deployment)) > 0 ? var.aws_os_snapshot_role_arn_deployment : var.aws_os_snapshot_role_arn
  os_snapshot_user_access_key_id     = length(trimspace(var.os_snapshot_user_access_key_id_deployment)) > 0 ? var.os_snapshot_user_access_key_id_deployment : var.os_snapshot_user_access_key_id
  os_snapshot_user_access_key_secret = length(trimspace(var.os_snapshot_user_access_key_secret_deployment)) > 0 ? var.os_snapshot_user_access_key_secret_deployment : var.os_snapshot_user_access_key_secret
  managed_rds_instance_url           = var.managed_rds_instance_url_deployment
  managed_rds_superuser_username     = var.managed_rds_superuser_username_deployment
  managed_rds_superuser_password     = var.managed_rds_superuser_password_deployment
  managed_rds_dbuser_username        = var.managed_rds_dbuser_username_deployment
  managed_rds_dbuser_password        = var.managed_rds_dbuser_password_deployment
  managed_rds_certificate            = var.managed_rds_certificate_deployment
  opensearch_root_cert               = var.opensearch_root_cert
  postgresql_root_cert               = var.postgresql_root_cert
  postgresql_private_ips             = var.postgresql_private_ips
  postgresql_ssl_enable              = var.postgresql_ssl_enable
  private_ips                        = var.chef_server_private_ips
  proxy_listen_port                  = var.proxy_listen_port
  postgresql_listen_port             = var.postgresql_listen_port
  setup_managed_services             = var.setup_managed_services
  ssh_key_file                       = var.ssh_key_file
  ssh_user                           = var.ssh_user
  ssh_port                           = var.ssh_port
  ssh_user_sudo_password             = local.fe_sudo_password
  sudo_cmd                           = var.sudo_cmd
  teams_port                         = var.teams_port
  backup_config_s3                   = var.backup_config_s3_deployment
  backup_config_efs                  = var.backup_config_efs_deployment
  s3_endpoint                        = var.s3_endpoint
  bucket_name                        = var.bucket_name_deployment
  nfs_mount_path                     = var.nfs_mount_path
  infra                              = "deployment"
  automate_base_path                 = var.automate_base_path
  opensearch_base_path               = var.opensearch_base_path
  depends_on = [
    module.bootstrap_automate
  ]
}



# ======================================================
# Archivo original: outputs.tf
# Carpeta: C:\Users\asus\cloned_repos\chef\automate\terraform\a2ha-terraform\reference_architectures\deployment
# ======================================================

##############################################################################################
# NOTE: Do not remove any of these outputs as they are required by the test harness framework.
#

output "ssh_key_file" {
  value = var.ssh_key_file
}

output "ssh_user" {
  value = var.ssh_user
}

output "ssh_group_name" {
  value = var.ssh_group_name
}

output "ssh_port" {
  value = var.ssh_port
}

output "automate_private_ips" {
  value = formatlist("%s", var.automate_private_ips)
}

output "chef_server_private_ips" {
  value = formatlist("%s", var.chef_server_private_ips)
}

output "opensearch_private_ips" {
  value = formatlist("%s", var.opensearch_private_ips)
}


output "postgresql_private_ips" {
  value = formatlist("%s", var.postgresql_private_ips)
}

output "automate_ssh" {
  value = formatlist(
    "ssh -i %s -p %s %s@%s",
    var.ssh_key_file,
    var.ssh_port,
    var.ssh_user,
    var.automate_private_ips,
  )
}

output "chef_server_ssh" {
  value = formatlist(
    "ssh -i %s -p %s %s@%s",
    var.ssh_key_file,
    var.ssh_port,
    var.ssh_user,
    var.chef_server_private_ips,
  )
}

output "postgresql_ssh" {
  value = formatlist(
    "ssh -i %s -p %s %s@%s",
    var.ssh_key_file,
    var.ssh_port,
    var.ssh_user,
    var.postgresql_private_ips,
  )
}

output "opensearch_ssh" {
  value = formatlist(
    "ssh -i %s -p %s %s@%s",
    var.ssh_key_file,
    var.ssh_port,
    var.ssh_user,
    var.opensearch_private_ips,
  )
}

output "backup_config_efs" {
  value = var.backup_config_efs
}

output "backup_config_s3" {
  value = var.backup_config_s3
}



# ======================================================
# Archivo original: outputs_common.tf
# Carpeta: C:\Users\asus\cloned_repos\chef\automate\terraform\a2ha-terraform\reference_architectures\deployment
# ======================================================

output "automate_url" {
  value = "https://${length(var.automate_fqdn) > 0 ? var.automate_fqdn : var.automate_lb_fqdn}"
}

output "automate_admin_user" {
  value = var.automate_admin_username
}

output "automate_admin_password" {
  value = var.automate_admin_password
}

output "automate_data_collector_token" {
  value = var.automate_dc_token
}

output "to_check_consolidated_status" {
  value = "chef-automate status summary"
}

output "to_check_detail_status" {
  value = "chef-automate status"
}

output "to_post_deployment_verify" {
  value = "chef-automate verify"
}



# ======================================================
# Archivo original: variables.tf
# Carpeta: C:\Users\asus\cloned_repos\chef\automate\terraform\a2ha-terraform\reference_architectures\deployment
# ======================================================

variable "ami_filter_name" {
  default = "chef-highperf-centos7-*"
}

variable "ami_filter_owner" {
  default = "446539779517"
}

variable "ami_filter_virt_type" {
  default = "hvm"
}

variable "automate_base_path" {
  default = "automate"
}

variable "automate_certs_by_ip" {
  type    = map(map(string))
  default = {}
}

variable "automate_ebs_volume_iops" {
  default = 100
}

variable "automate_ebs_volume_size" {
  default = 50
}

variable "automate_ebs_volume_type" {
  default = "gp3"
}

variable "automate_lb_certificate_arn" {
  default = "arn:aws:acm:us-west-2:446539779517:certificate/e98235a7-ba3d-4900-9c55-4b35bb8b56c7"
}

variable "automate_private_ips" {
  default = []
}

variable "automate_server_instance_type" {
  default = "t3a.medium"
}

variable "aws_ami_id" {
  default     = ""
  description = "Setting this value overrides ami search features"
}

variable "aws_cidr_block_addr" {
}

variable "aws_s3_bucketName" {
  default = "chef-automate-ha"
}

variable "aws_os_snapshot_role_arn" {
  default = ""
}

variable "aws_os_snapshot_role_arn_deployment" {
  default = ""
}

variable "aws_profile" {
  default     = "default"
  description = "The AWS profile to use from your ~/.aws/credentials file."
}

variable "aws_region" {
  default     = ""
  description = "The name of the selected AWS region / datacenter."
}

variable "aws_ssh_key_pair_name" {
}

variable "aws_tags" {
}

variable "aws_vpc_id" {
}

variable "backup_config_efs" {
  default = "false"
}

variable "backup_config_efs_deployment" {
  default = "false"
}

variable "backup_config_s3" {
  default = "false"
}

variable "backup_config_s3_deployment" {
  default = "false"
}

variable "bucket_name" {
}

variable "chef_server_certs_by_ip" {
  type    = map(map(string))
  default = {}
}

variable "bucket_name_deployment" {
  default = "chef-automate-ha"
}

variable "chef_ebs_volume_iops" {
  default = 100
}

variable "chef_ebs_volume_size" {
  default = 50
}

variable "chef_ebs_volume_type" {
  default = "gp3"
}

variable "chef_server_instance_type" {
  default = "t3a.medium"
}

variable "chef_server_lb_certificate_arn" {
  default = "arn:aws:acm:us-west-2:446539779517:certificate/e98235a7-ba3d-4900-9c55-4b35bb8b56c7"
}

variable "chef_server_private_ips" {
  default = []
}

variable "delete_on_termination" {
  default = true
}

variable "managed_opensearch_certificate" {
}

variable "managed_opensearch_certificate_deployment" {
  default = ""
}

variable "managed_opensearch_domain_name" {
  default = ""
}

variable "managed_opensearch_domain_url" {
  default = ""
}

variable "managed_opensearch_domain_url_deployment" {
  default = ""
}

variable "managed_opensearch_user_password" {
  default = ""
}

variable "managed_opensearch_user_password_deployment" {
  default = ""
}

variable "managed_opensearch_username" {
  default = ""
}

variable "managed_opensearch_username_deployment" {
  default = ""
}

variable "managed_rds_certificate" {
}

variable "managed_rds_dbuser_password" {
  default = ""
}

variable "managed_rds_certificate_deployment" {
  default = ""
}

variable "managed_rds_dbuser_password_deployment" {
  default = ""
}

variable "managed_rds_dbuser_username" {
  default = ""
}

variable "managed_rds_dbuser_username_deployment" {
  default = ""
}

variable "managed_rds_instance_url" {
  default = ""
}

variable "managed_rds_instance_url_deployment" {
  default = ""
}

variable "managed_rds_superuser_password" {
  default = ""
}

variable "managed_rds_superuser_password_deployment" {
  default = ""
}

variable "managed_rds_superuser_username" {
  default = ""
}

variable "managed_rds_superuser_username_deployment" {
  default = ""
}

variable "opensearch_base_path" {
  default = "elasticsearch"
}

variable "opensearch_certs_by_ip" {
  type    = map(map(string))
  default = {}
}

variable "opensearch_ebs_volume_iops" {
  default = 300
}

variable "opensearch_ebs_volume_size" {
  default = 50
}

variable "opensearch_ebs_volume_type" {
  default = "gp3"
}

variable "opensearch_private_ips" {
  default = []
}

variable "opensearch_root_cert" {
  default = ""
}

variable "opensearch_server_instance_type" {
  default = "m5a.large"
}

variable "os_snapshot_user_access_key_id" {
  default = ""
}

variable "os_snapshot_user_access_key_id_deployment" {
  default = ""
}

variable "os_snapshot_user_access_key_secret" {
  default = ""
}

variable "os_snapshot_user_access_key_secret_deployment" {
  default = ""
}

variable "postgresql_certs_by_ip" {
  type    = map(map(string))
  default = {}
}

variable "postgresql_ebs_volume_iops" {
  default = 150
}

variable "postgresql_ebs_volume_size" {
  default = 50
}

variable "postgresql_ebs_volume_type" {
  default = "gp3"
}

variable "postgresql_private_ips" {
  default = []
}

variable "postgresql_root_cert" {
  default = ""
}

variable "postgresql_server_instance_type" {
  default = "t3a.medium"
}

variable "private_custom_subnets" {
  default = []
  type    = list(string)
}

variable "public_custom_subnets" {
  default = []
  type    = list(string)
}

variable "s3_endpoint" {
  default = "https://s3.amazonaws.com"
}

variable "setup_managed_services" {
  default = false
}

variable "setup_self_managed_services" {
  default = false
}

variable "ssh_group_name" {
}

variable "ssh_key_file" {
}

variable "ssh_port" {
  default = 22
}

variable "ssh_user" {
  default = "centos"
}

variable "sudo_cmd" {
  default = "sudo"
}



# ======================================================
# Archivo original: versions.tf
# Carpeta: C:\Users\asus\cloned_repos\chef\automate\terraform\a2ha-terraform\reference_architectures\deployment
# ======================================================


terraform {
  required_version = ">= 0.12"
}




# ======================================================
# Archivo fusionado: terraform\a2ha-terraform\modules\aws\cloudaws.tf
# Piezas Terraform en carpeta: 164
# Tiene arquitectura (EC2/Docker/Serverless): True
# ======================================================



# ======================================================
# Archivo original: data.tf
# Carpeta: C:\Users\asus\cloned_repos\chef\automate\terraform\a2ha-terraform\modules\aws
# ======================================================

data "aws_caller_identity" "current" {
}

locals {
  account_id = data.aws_caller_identity.current.account_id
}



# ======================================================
# Archivo original: inputs.tf
# Carpeta: C:\Users\asus\cloned_repos\chef\automate\terraform\a2ha-terraform\modules\aws
# ======================================================

variable "ami_filter_name" {
  default = "chef-highperf-centos7-*"
}

variable "ami_filter_owner" {
  default = "446539779517"
}

variable "ami_filter_virt_type" {
  default = "hvm"
}

variable "automate_ebs_volume_iops" {
  default = 100
}

variable "automate_ebs_volume_size" {
  default = 50
}

variable "automate_ebs_volume_type" {
  default = "gp3"
}

variable "automate_fqdn" {
}

variable "automate_instance_count" {
  default = 1
}

variable "automate_lb_certificate_arn" {
}

variable "automate_server_instance_type" {
  default = "t3a.medium"
}

variable "aws_ami_id" {
  default     = ""
  description = "Setting this value overrides ami search features"
}

variable "aws_cidr_block_addr" {
}

variable "aws_instance_profile_name" {
  default = ""
}

variable "aws_os_snapshot_role_arn" {
  default = ""
}

variable "aws_region" {
  default     = ""
  description = "The name of the selected AWS region / datacenter."
}

variable "aws_ssh_key_file" {
}

variable "aws_ssh_key_pair_name" {
}

variable "aws_ssh_port" {
  default = 22
}

variable "aws_ssh_user" {
  default = "centos"
}

variable "aws_vpc_id" {
}

variable "chef_ebs_volume_iops" {
  default = 100
}

variable "chef_ebs_volume_size" {
  default = 50
}

variable "chef_ebs_volume_type" {
  default = "gp3"
}

variable "chef_server_instance_count" {
  default = 1
}

variable "chef_server_instance_type" {
  default = "t3a.medium"
}

variable "chef_server_lb_certificate_arn" {
}

variable "delete_on_termination" {
  default = true
}

variable "json_data" {
}

variable "kibana_listen_port" {
  default = 5601
}

variable "lb_access_logs" {
  default = false
}

variable "managed_opensearch_domain_name" {
  default = ""
}

variable "managed_opensearch_domain_url" {
  default = ""
}

variable "nfs_mount_path" {
  default = "/mnt/automate_backups"
}

variable "opensearch_ebs_volume_iops" {
  default = 300
}

variable "opensearch_ebs_volume_size" {
  default = 50
}

variable "opensearch_ebs_volume_type" {
  default = "gp3"
}

variable "opensearch_instance_count" {
  default = 3
}

variable "opensearch_listen_port" {
  default = 9200
}

variable "opensearch_server_instance_type" {
  default = "m5a.large"
}

variable "os_snapshot_user_access_key_id" {
  default = ""
}

variable "os_snapshot_user_access_key_secret" {
  default = ""
}

variable "pgleaderchk_listen_port" {
  default = 6432
}

variable "postgresql_ebs_volume_iops" {
  default = 150
}

variable "postgresql_ebs_volume_size" {
  default = 50
}

variable "postgresql_ebs_volume_type" {
  default = "gp3"
}

variable "postgresql_instance_count" {
  default = 3
}

variable "postgresql_listen_port" {
  default = 5432
}

variable "postgresql_server_instance_type" {
  default = "t3a.medium"
}

variable "private_custom_subnets" {
  default = []
  type    = list(string)
}

variable "proxy_listen_port" {
  default = 7432
}

variable "public_custom_subnets" {
  default = []
  type    = list(string)
}

variable "setup_managed_services" {
  default = false
}

variable "ssh_user_sudo_password" {
  default = ""
}

variable "sudo_cmd" {
  default = "sudo"
}

variable "tag_name" {
  default = "A2"
}

variable "tags" {
}

variable "tmp_path" {
  default = "/hab/var/automate-ha"
}



# ======================================================
# Archivo original: loadbalancing.tf
# Carpeta: C:\Users\asus\cloned_repos\chef\automate\terraform\a2ha-terraform\modules\aws
# ======================================================

/////////////////////////
// Automate Load Balancing
resource "aws_alb" "automate_lb" {
  name               = "${var.tag_name}-${random_id.random.hex}-automate-lb"
  internal           = (length(var.public_custom_subnets) > 0 || var.aws_cidr_block_addr != "") ? false : true
  load_balancer_type = "application"
  security_groups    = [aws_security_group.load_balancer.id]
  subnets            = length(var.public_custom_subnets) > 0 ? data.aws_subnet.public.*.id : (var.aws_cidr_block_addr != "" ? aws_subnet.public.*.id : data.aws_subnet.default.*.id)
  tags               = var.tags
}

resource "aws_alb_target_group" "automate_tg" {
  name                          = "${var.tag_name}-${random_id.random.hex}-automate-tg"
  port                          = 443
  protocol                      = "HTTPS"
  vpc_id                        = data.aws_vpc.default.id
  load_balancing_algorithm_type = "least_outstanding_requests"
}

resource "aws_alb_target_group_attachment" "automate_tg_attachment" {
  count            = var.automate_instance_count
  target_group_arn = aws_alb_target_group.automate_tg.arn
  target_id        = element(aws_instance.chef_automate.*.id, count.index)
  port             = 443
}

resource "aws_alb_listener" "automate_lb_listener_443" {
  load_balancer_arn = aws_alb.automate_lb.arn
  port              = "443"
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-TLS-1-2-2017-01"
  certificate_arn   = var.automate_lb_certificate_arn

  default_action {
    type             = "forward"
    target_group_arn = aws_alb_target_group.automate_tg.arn
  }
}

resource "aws_alb_listener" "automate_lb_listener_80" {
  load_balancer_arn = aws_alb.automate_lb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type = "redirect"

    redirect {
      port        = "443"
      protocol    = "HTTPS"
      status_code = "HTTP_301"
    }
  }
}

/////////////////////////
// Chef Server
resource "aws_alb" "chef_server_lb" {
  name               = "${var.tag_name}-${random_id.random.hex}-chef-server-lb"
  internal           = (length(var.public_custom_subnets) > 0 || var.aws_cidr_block_addr != "") ? false : true
  load_balancer_type = "application"
  security_groups    = [aws_security_group.load_balancer.id]
  subnets            = length(var.public_custom_subnets) > 0 ? data.aws_subnet.public.*.id : (var.aws_cidr_block_addr != "" ? aws_subnet.public.*.id : data.aws_subnet.default.*.id)
  tags               = var.tags
}

resource "aws_alb_target_group" "chef_server_tg" {
  name     = "${var.tag_name}-${random_id.random.hex}-chef-server-tg"
  port     = 443
  protocol = "HTTPS"
  vpc_id   = data.aws_vpc.default.id

  health_check {
    path                = "/_status"
    protocol            = "HTTPS"
    healthy_threshold   = 5
    unhealthy_threshold = 2
  }
}

resource "aws_alb_target_group_attachment" "chef_server_tg_attachment" {
  count            = var.chef_server_instance_count
  target_group_arn = aws_alb_target_group.chef_server_tg.arn
  target_id        = element(aws_instance.chef_server.*.id, count.index)
}

resource "aws_alb_listener" "chef_server_lb_listener_443" {
  load_balancer_arn = aws_alb.chef_server_lb.arn
  port              = "443"
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-TLS-1-2-2017-01"
  certificate_arn   = var.chef_server_lb_certificate_arn

  default_action {
    type             = "forward"
    target_group_arn = aws_alb_target_group.chef_server_tg.arn
  }
}

resource "aws_alb_listener" "chef_server_lb_listener_80" {
  load_balancer_arn = aws_alb.chef_server_lb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type = "redirect"

    redirect {
      port        = "443"
      protocol    = "HTTPS"
      status_code = "HTTP_301"
    }
  }
}



# ======================================================
# Archivo original: main.tf
# Carpeta: C:\Users\asus\cloned_repos\chef\automate\terraform\a2ha-terraform\modules\aws
# ======================================================

resource "random_id" "random" {
  byte_length = 4
}

data "aws_availability_zones" "available" {
}

data "aws_vpc" "default" {
  id = var.aws_vpc_id
}

locals {
  private_subnet_ids_string = join(",", var.private_custom_subnets)
  private_subnet_ids_list   = split(",", local.private_subnet_ids_string)
}

data "aws_subnet" "default" {
  count = length(var.private_custom_subnets) > 0 ? 3 : 0
  id    = local.private_subnet_ids_list[count.index]
}

locals {
  public_subnet_ids_string = join(",", var.public_custom_subnets)
  public_subnet_ids_list   = split(",", local.public_subnet_ids_string)
}

data "aws_subnet" "public" {
  count = length(var.public_custom_subnets) > 0 ? 3 : 0
  id    = local.public_subnet_ids_list[count.index]
}

data "aws_internet_gateway" "default" {
  filter {
    name   = "attachment.vpc-id"
    values = [data.aws_vpc.default.id]
  }
}

resource "aws_subnet" "default" {
  count             = (length(var.private_custom_subnets) == 0 && var.aws_cidr_block_addr != "") ? 3 : 0
  vpc_id            = data.aws_vpc.default.id
  cidr_block        = cidrsubnet("${var.aws_cidr_block_addr}/18", 8, count.index + 1)
  availability_zone = data.aws_availability_zones.available.names[count.index]

  tags = merge(var.tags, tomap({ "Name" = "${var.tag_name}_${random_id.random.hex}_${data.aws_availability_zones.available.names[count.index]}_private" }))
}

resource "aws_subnet" "public" {
  count                   = (length(var.public_custom_subnets) == 0 && var.aws_cidr_block_addr != "") ? 3 : 0
  vpc_id                  = data.aws_vpc.default.id
  cidr_block              = cidrsubnet("${var.aws_cidr_block_addr}/18", 8, count.index + 4)
  availability_zone       = data.aws_availability_zones.available.names[count.index]
  map_public_ip_on_launch = true

  tags = merge(var.tags, tomap({ "Name" = "${var.tag_name}_${random_id.random.hex}_${data.aws_availability_zones.available.names[count.index]}_public" }))
}


resource "aws_eip" "eip1" {
  count            = (length(var.public_custom_subnets) == 0 && var.aws_cidr_block_addr != "") ? 1 : 0
  domain           = "vpc" # changed in new version
  public_ipv4_pool = "amazon"

  tags = merge(var.tags, tomap({ "Name" = "${var.tag_name}_${random_id.random.hex}_eip" }))
}

resource "aws_eip" "eip2" {
  count            = (length(var.public_custom_subnets) == 0 && var.aws_cidr_block_addr != "") ? 1 : 0
  domain           = "vpc"
  public_ipv4_pool = "amazon"

  tags = merge(var.tags, tomap({ "Name" = "${var.tag_name}_${random_id.random.hex}_eip" }))
}

resource "aws_eip" "eip3" {
  count            = (length(var.public_custom_subnets) == 0 && var.aws_cidr_block_addr != "") ? 1 : 0
  domain           = "vpc"
  public_ipv4_pool = "amazon"

  tags = merge(var.tags, tomap({ "Name" = "${var.tag_name}_${random_id.random.hex}_eip" }))
}

resource "aws_nat_gateway" "nat1" {
  count         = (length(var.public_custom_subnets) == 0 && var.aws_cidr_block_addr != "") ? 1 : 0
  allocation_id = aws_eip.eip1[0].id
  subnet_id     = aws_subnet.public[0].id

  tags = merge(var.tags, tomap({ "Name" = "${var.tag_name}_${random_id.random.hex}_nat_gw" }))

  depends_on = [data.aws_internet_gateway.default]
}

resource "aws_nat_gateway" "nat2" {
  count         = (length(var.public_custom_subnets) == 0 && var.aws_cidr_block_addr != "") ? 1 : 0
  allocation_id = aws_eip.eip2[0].id
  subnet_id     = aws_subnet.public[1].id

  tags = merge(var.tags, tomap({ "Name" = "${var.tag_name}_${random_id.random.hex}_nat_gw" }))

  depends_on = [data.aws_internet_gateway.default]
}

resource "aws_nat_gateway" "nat3" {
  count         = (length(var.public_custom_subnets) == 0 && var.aws_cidr_block_addr != "") ? 1 : 0
  allocation_id = aws_eip.eip3[0].id
  subnet_id     = aws_subnet.public[2].id

  tags = merge(var.tags, tomap({ "Name" = "${var.tag_name}_${random_id.random.hex}_nat_gw" }))

  depends_on = [data.aws_internet_gateway.default]
}

resource "aws_route_table" "route1" {
  count  = (length(var.public_custom_subnets) == 0 && var.aws_cidr_block_addr != "") ? 1 : 0
  vpc_id = data.aws_vpc.default.id
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat1[0].id
  }

  tags = merge(var.tags, tomap({ "Name" = "${var.tag_name}_${random_id.random.hex}_route_table" }))

}

resource "aws_route_table" "route2" {
  count  = (length(var.public_custom_subnets) == 0 && var.aws_cidr_block_addr != "") ? 1 : 0
  vpc_id = data.aws_vpc.default.id
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat2[0].id
  }

  tags = merge(var.tags, tomap({ "Name" = "${var.tag_name}_${random_id.random.hex}_route_table" }))

}

resource "aws_route_table" "route3" {
  count  = (length(var.public_custom_subnets) == 0 && var.aws_cidr_block_addr != "") ? 1 : 0
  vpc_id = data.aws_vpc.default.id
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat3[0].id
  }

  tags = merge(var.tags, tomap({ "Name" = "${var.tag_name}_${random_id.random.hex}_route_table" }))

}


resource "aws_route_table_association" "nat1" {
  count          = (length(var.public_custom_subnets) == 0 && var.aws_cidr_block_addr != "") ? 1 : 0
  subnet_id      = length(var.private_custom_subnets) > 0 ? data.aws_subnet.default[0].id : aws_subnet.default[0].id
  route_table_id = aws_route_table.route1[0].id
}

resource "aws_route_table_association" "nat2" {
  count          = (length(var.public_custom_subnets) == 0 && var.aws_cidr_block_addr != "") ? 1 : 0
  subnet_id      = length(var.private_custom_subnets) > 0 ? data.aws_subnet.default[1].id : aws_subnet.default[1].id
  route_table_id = aws_route_table.route2[0].id
}

resource "aws_route_table_association" "nat3" {
  count          = (length(var.public_custom_subnets) == 0 && var.aws_cidr_block_addr != "") ? 1 : 0
  subnet_id      = length(var.private_custom_subnets) > 0 ? data.aws_subnet.default[2].id : aws_subnet.default[2].id
  route_table_id = aws_route_table.route3[0].id
}

locals {
  ami = var.aws_ami_id
}

resource "aws_instance" "chef_automate_postgresql" {
  count = ((length(var.private_custom_subnets) == 0 && var.aws_cidr_block_addr == "") || var.setup_managed_services) ? 0 : var.postgresql_instance_count

  ami                         = local.ami
  instance_type               = var.postgresql_server_instance_type
  key_name                    = var.aws_ssh_key_pair_name
  subnet_id                   = length(var.private_custom_subnets) > 0 ? element(data.aws_subnet.default.*.id, count.index) : element(aws_subnet.default.*.id, count.index)
  vpc_security_group_ids      = [aws_security_group.base_linux.id, aws_security_group.habitat_supervisor.id, aws_security_group.chef_automate.id]
  associate_public_ip_address = false
  ebs_optimized               = true

  connection {
    host        = coalesce(self.private_ip)
    port        = var.aws_ssh_port
    type        = "ssh"
    user        = var.aws_ssh_user
    private_key = file(var.aws_ssh_key_file)
    script_path = "${var.tmp_path}/tf_inline_script_aws.sh"
  }

  root_block_device {
    delete_on_termination = var.delete_on_termination
    iops                  = var.postgresql_ebs_volume_type == "io1" ? var.postgresql_ebs_volume_iops : 0
    volume_size           = var.postgresql_ebs_volume_size
    volume_type           = var.postgresql_ebs_volume_type
    tags                  = merge(var.tags, tomap({ "Name" = format("${var.tag_name}_${random_id.random.hex}_chef_automate_postgresql_%02d", count.index + 1) }))
  }

  tags = merge(var.tags, tomap({ "Name" = format("${var.tag_name}_${random_id.random.hex}_chef_automate_postgresql_%02d", count.index + 1) }))
  lifecycle {
    ignore_changes = [
      tags,
      tags_all,
      root_block_device,
      subnet_id
    ]
  }
  metadata_options {
    http_endpoint          = "enabled"
    http_tokens            = "required"
    instance_metadata_tags = "enabled"
  }
  depends_on = [aws_route_table.route1, aws_route_table.route2, aws_route_table.route3]

}
resource "aws_instance" "chef_automate_opensearch" {
  count = ((length(var.private_custom_subnets) == 0 && var.aws_cidr_block_addr == "") || var.setup_managed_services) ? 0 : var.opensearch_instance_count

  ami                         = local.ami
  instance_type               = var.opensearch_server_instance_type
  key_name                    = var.aws_ssh_key_pair_name
  subnet_id                   = length(var.private_custom_subnets) > 0 ? element(data.aws_subnet.default.*.id, count.index) : element(aws_subnet.default.*.id, count.index)
  vpc_security_group_ids      = [aws_security_group.base_linux.id, aws_security_group.habitat_supervisor.id, aws_security_group.chef_automate.id]
  associate_public_ip_address = false //Changes to false as Dashboards are no longer enabled
  ebs_optimized               = true
  iam_instance_profile        = var.aws_instance_profile_name

  root_block_device {
    delete_on_termination = var.delete_on_termination
    iops                  = var.opensearch_ebs_volume_type == "io1" ? var.opensearch_ebs_volume_iops : 0
    volume_size           = var.opensearch_ebs_volume_size
    volume_type           = var.opensearch_ebs_volume_type
    tags                  = merge(var.tags, tomap({ "Name" = format("${var.tag_name}_${random_id.random.hex}_chef_automate_opensearch_%02d", count.index + 1) }))
  }

  tags = merge(var.tags, tomap({ "Name" = format("${var.tag_name}_${random_id.random.hex}_chef_automate_opensearch_%02d", count.index + 1) }))
  lifecycle {
    ignore_changes = [
      tags,
      tags_all,
      root_block_device,
      subnet_id
    ]
  }
  metadata_options {
    http_endpoint          = "enabled"
    http_tokens            = "required"
    instance_metadata_tags = "enabled"
  }
  depends_on = [aws_route_table.route1, aws_route_table.route2, aws_route_table.route3]

}

resource "aws_instance" "chef_automate" {
  count = (length(var.private_custom_subnets) > 0 || var.aws_cidr_block_addr != "") ? var.automate_instance_count : 0

  ami                         = local.ami
  instance_type               = var.automate_server_instance_type
  key_name                    = var.aws_ssh_key_pair_name
  subnet_id                   = length(var.private_custom_subnets) > 0 ? element(data.aws_subnet.default.*.id, count.index) : element(aws_subnet.default.*.id, count.index)
  vpc_security_group_ids      = [aws_security_group.base_linux.id, aws_security_group.habitat_supervisor.id, aws_security_group.chef_automate.id, aws_security_group.chef_automate_ui.id]
  associate_public_ip_address = false
  ebs_optimized               = true
  iam_instance_profile        = var.aws_instance_profile_name

  root_block_device {
    delete_on_termination = var.delete_on_termination
    iops                  = var.automate_ebs_volume_type == "io1" ? var.automate_ebs_volume_iops : 0
    volume_size           = var.automate_ebs_volume_size
    volume_type           = var.automate_ebs_volume_type
    tags                  = merge(var.tags, tomap({ "Name" = format("${var.tag_name}_${random_id.random.hex}_chef_automate_%02d", count.index + 1) }))
  }

  tags = merge(var.tags, tomap({ "Name" = format("${var.tag_name}_${random_id.random.hex}_chef_automate_%02d", count.index + 1) }))

  lifecycle {
    ignore_changes = [
      tags,
      tags_all,
      root_block_device,
      subnet_id
    ]
  }
  metadata_options {
    http_endpoint          = "enabled"
    http_tokens            = "required"
    instance_metadata_tags = "enabled"
  }
  depends_on = [aws_route_table.route1, aws_route_table.route2, aws_route_table.route3]

}

resource "aws_instance" "chef_server" {
  count = (length(var.private_custom_subnets) > 0 || var.aws_cidr_block_addr != "") ? var.chef_server_instance_count : 0


  ami                         = local.ami
  instance_type               = var.chef_server_instance_type
  key_name                    = var.aws_ssh_key_pair_name
  subnet_id                   = length(var.private_custom_subnets) > 0 ? element(data.aws_subnet.default.*.id, count.index) : element(aws_subnet.default.*.id, count.index)
  vpc_security_group_ids      = [aws_security_group.base_linux.id, aws_security_group.habitat_supervisor.id, aws_security_group.chef_automate.id, aws_security_group.chef_automate_ui.id]
  associate_public_ip_address = false
  ebs_optimized               = true
  iam_instance_profile        = var.aws_instance_profile_name

  root_block_device {
    delete_on_termination = var.delete_on_termination
    iops                  = var.chef_ebs_volume_type == "io1" ? var.chef_ebs_volume_iops : 0
    volume_size           = var.chef_ebs_volume_size
    volume_type           = var.chef_ebs_volume_type
    tags                  = merge(var.tags, tomap({ "Name" = format("${var.tag_name}_${random_id.random.hex}_chef_server_%02d", count.index + 1) }))
  }

  tags = merge(var.tags, tomap({ "Name" = format("${var.tag_name}_${random_id.random.hex}_chef_server_%02d", count.index + 1) }))

  lifecycle {
    ignore_changes = [
      tags,
      tags_all,
      root_block_device,
      subnet_id
    ]
  }
  metadata_options {
    http_endpoint          = "enabled"
    http_tokens            = "required"
    instance_metadata_tags = "enabled"
  }
  depends_on = [aws_route_table.route1, aws_route_table.route2, aws_route_table.route3]

}



# ======================================================
# Archivo original: opensearch_snapshot_registry.tf
# Carpeta: C:\Users\asus\cloned_repos\chef\automate\terraform\a2ha-terraform\modules\aws
# ======================================================

resource "aws_iam_policy" "s3_access_policy" {
  count       = var.aws_os_snapshot_role_arn != "" ? 0 : 1
  name        = "automate-os-snapshot-access-policy-${random_id.random.hex}"
  path        = "/"
  description = "Policy to provide s3 access for AWS OS snapshots"
  policy      = <<POLICY
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "s3:*",
                "s3-object-lambda:*"
            ],
            "Resource": "*"
        }
    ]
}
POLICY

  tags = merge(var.tags,
    tomap({ "X-Application" = "automate-opensearch" })
  )
}

resource "aws_iam_role" "pass_es_role" {
  count               = var.aws_os_snapshot_role_arn != "" ? 0 : 1
  name                = "automate-pass-es-role-${random_id.random.hex}"
  assume_role_policy  = <<TRUSTPOLICY
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Principal": {
              "Service": [
                "ec2.amazonaws.com",
                "opensearchservice.amazonaws.com"
              ]
            },
            "Action": "sts:AssumeRole"
        }
    ]
}
TRUSTPOLICY
  managed_policy_arns = [aws_iam_policy.s3_access_policy[0].arn]
  tags = merge(var.tags,
    tomap({ "X-Application" = "automate-opensearch" })
  )

}

resource "aws_iam_policy" "pass_es_role_policy" {
  count       = var.aws_os_snapshot_role_arn != "" ? 0 : 1
  name        = "pass-es-role-policy-${random_id.random.hex}"
  path        = "/"
  description = "Policy to pass ES access for Snapshot registry"
  policy      = <<POLICY
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": "iam:PassRole",
            "Resource": "arn:aws:iam::${local.account_id}:role/${aws_iam_role.pass_es_role[0].name}"
        },
        {
            "Effect": "Allow",
            "Action": "es:ESHttpPut",
            "Resource": "arn:aws:es:${var.aws_region}:${local.account_id}:domain/${var.managed_opensearch_domain_name}/*"
        }
    ]
}
POLICY
  tags = merge(var.tags,
    tomap({ "X-Application" = "automate-opensearch" })
  )

}

resource "aws_iam_role_policy_attachment" "s3_policy_attachment" {
  count      = var.aws_os_snapshot_role_arn != "" ? 0 : 1
  role       = aws_iam_role.pass_es_role[0].name
  policy_arn = aws_iam_policy.s3_access_policy[0].arn
}

resource "aws_iam_role_policy_attachment" "assume_role_policy_attachment" {
  count      = var.aws_os_snapshot_role_arn != "" ? 0 : 1
  role       = aws_iam_role.pass_es_role[0].name
  policy_arn = aws_iam_policy.pass_es_role_policy[0].arn
}

resource "aws_iam_user" "snap_reg_user" {
  count = var.os_snapshot_user_access_key_id != "" ? 0 : 1
  name  = "automate-os-snapshot-user-${random_id.random.hex}"
  tags = merge(var.tags,
    tomap({ "X-Application" = "automate-opensearch" })
  )
}

resource "aws_iam_user_policy_attachment" "snap_reg_user_policy_attachment" {
  count      = var.os_snapshot_user_access_key_id != "" ? 0 : 1
  user       = aws_iam_user.snap_reg_user[0].name
  policy_arn = aws_iam_policy.s3_access_policy[0].arn
}

resource "aws_iam_user_policy_attachment" "assume_role_policy_attachment" {
  count      = var.os_snapshot_user_access_key_id != "" ? 0 : 1
  user       = aws_iam_user.snap_reg_user[0].name
  policy_arn = aws_iam_policy.pass_es_role_policy[0].arn
}

resource "aws_iam_access_key" "snap_reg_user_key" {
  count = var.os_snapshot_user_access_key_id != "" ? 0 : 1
  user  = aws_iam_user.snap_reg_user[0].name
}



# ======================================================
# Archivo original: outputs.tf
# Carpeta: C:\Users\asus\cloned_repos\chef\automate\terraform\a2ha-terraform\modules\aws
# ======================================================

output "automate_frontend_url" {
  value = "https://${aws_alb.automate_lb.dns_name}"
}

output "automate_fqdn" {
  value = var.automate_fqdn != "" ? var.automate_fqdn : aws_alb.automate_lb.dns_name
}

output "automate_ssh" {
  value = formatlist(
    "ssh -i %s %s@%s",
    var.aws_ssh_key_file,
    var.aws_ssh_user,
    aws_instance.chef_automate.*.private_ip,
  )
}

output "postgresql_ssh" {
  value = formatlist(
    "ssh -i %s %s@%s",
    var.aws_ssh_key_file,
    var.aws_ssh_user,
    aws_instance.chef_automate_postgresql.*.private_ip,
  )
}

output "opensearch_ssh" {
  value = formatlist(
    "ssh -i %s %s@%s",
    var.aws_ssh_key_file,
    var.aws_ssh_user,
    aws_instance.chef_automate_opensearch.*.private_ip,
  )
}

output "automate_private_ips" {
  value = aws_instance.chef_automate.*.private_ip
}

output "chef_server_private_ips" {
  value = aws_instance.chef_server.*.private_ip
}

output "postgresql_private_ips" {
  value = aws_instance.chef_automate_postgresql.*.private_ip
}

output "opensearch_private_ips" {
  value = aws_instance.chef_automate_opensearch.*.private_ip
}

output "aws_os_snapshot_role_arn" {
  value = var.aws_os_snapshot_role_arn != "" ? var.aws_os_snapshot_role_arn : aws_iam_role.pass_es_role[0].arn
}

output "os_snapshot_user_access_key_id" {
  value = var.os_snapshot_user_access_key_id != "" ? var.os_snapshot_user_access_key_id : aws_iam_access_key.snap_reg_user_key[0].id
}

output "os_snapshot_user_access_key_secret" {
  sensitive = true
  value     = var.os_snapshot_user_access_key_id != "" ? var.os_snapshot_user_access_key_secret : aws_iam_access_key.snap_reg_user_key[0].secret
}

output "random_id" {
  value = random_id.random.hex
}

output "subnet_id" {
  value = length(var.private_custom_subnets) > 0 ? var.private_custom_subnets : aws_subnet.default.*.id
}

output "mount_id" {
  value = aws_security_group.efs_mount.id
}

output "tag_name" {
  value = var.tag_name
}

output "tags" {
  value = var.tags
}


output "private_subnets" {
  value = length(var.private_custom_subnets) > 0 ? var.private_custom_subnets : aws_subnet.default.*.id
}

output "base_linux_aws_security_group_id" {
  value = aws_security_group.base_linux.id
}

output "aws_cluster_id" {
  value = random_id.random.hex
}

output "ssh_user" {
  value = var.aws_ssh_user
}
output "ssh_port" {
  value = var.aws_ssh_port
}



# ======================================================
# Archivo original: security.tf
# Carpeta: C:\Users\asus\cloned_repos\chef\automate\terraform\a2ha-terraform\modules\aws
# ======================================================

resource "aws_security_group" "base_linux" {
  name        = "base_linux_${random_id.random.hex}"
  description = "base security rules for all linux nodes"
  vpc_id      = data.aws_vpc.default.id

  tags = merge(var.tags, tomap({ "Name" = "${var.tag_name}_${random_id.random.hex}_linux_security_group" }))
}

resource "aws_security_group" "habitat_supervisor" {
  name        = "habitat_supervisor_${random_id.random.hex}"
  description = "Security rules for the Habitat supervisor"
  vpc_id      = data.aws_vpc.default.id

  tags = merge(var.tags, tomap({ "Name" = "${var.tag_name}_${random_id.random.hex}_habsup_security_group" }))
}

resource "aws_security_group" "chef_automate" {
  name        = "chef_automate_${random_id.random.hex}"
  description = "Chef Automate Server"
  vpc_id      = data.aws_vpc.default.id

  tags = merge(var.tags, tomap({ "Name" = "${var.tag_name}_${random_id.random.hex}_automate_security_group" }))
}

resource "aws_security_group" "chef_automate_ui" {
  name        = "chef_automate_ui_${random_id.random.hex}"
  description = "Chef Automate Server protocol"
  vpc_id      = data.aws_vpc.default.id

  tags = merge(var.tags, tomap({ "Name" = "${var.tag_name}_${random_id.random.hex}_automate_security_group" }))
}

resource "aws_security_group" "efs_mount" {
  name        = "efs_${random_id.random.hex}"
  description = "NFS for EFS"
  vpc_id      = data.aws_vpc.default.id

  tags = merge(var.tags, tomap({ "Name" = "${var.tag_name}_${random_id.random.hex}_efs_security_group" }))
}

resource "aws_security_group" "load_balancer" {
  name        = "load_balancer_${random_id.random.hex}"
  description = "load_balancer rules for all linux nodes"
  vpc_id      = data.aws_vpc.default.id

  tags = merge(var.tags, tomap({ "Name" = "${var.tag_name}_${random_id.random.hex}_linux_security_group" }))
}

//////////////////////////
// Base Linux Rules
resource "aws_security_group_rule" "ingress_allow_22_tcp_all" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = [var.json_data]
  security_group_id = aws_security_group.base_linux.id
}

/////////////////////////
// Habitat Supervisor Rules
# Allow Habitat Supervisor http communication tcp
resource "aws_security_group_rule" "ingress_allow_9631_tcp" {
  type                     = "ingress"
  from_port                = 9631
  to_port                  = 9631
  protocol                 = "tcp"
  security_group_id        = aws_security_group.habitat_supervisor.id
  source_security_group_id = aws_security_group.habitat_supervisor.id
}

# Allow Habitat Supervisor http communication udp
resource "aws_security_group_rule" "ingress_allow_9631_udp" {
  type                     = "ingress"
  from_port                = 9631
  to_port                  = 9631
  protocol                 = "udp"
  security_group_id        = aws_security_group.habitat_supervisor.id
  source_security_group_id = aws_security_group.habitat_supervisor.id
}

# Allow Habitat Supervisor ZeroMQ communication tcp
resource "aws_security_group_rule" "ingress_9638_tcp" {
  type                     = "ingress"
  from_port                = 9638
  to_port                  = 9638
  protocol                 = "tcp"
  security_group_id        = aws_security_group.habitat_supervisor.id
  source_security_group_id = aws_security_group.habitat_supervisor.id
}

# Allow Habitat Supervisor ZeroMQ communication udp
resource "aws_security_group_rule" "ingress_allow_9638_udp" {
  type                     = "ingress"
  from_port                = 9638
  to_port                  = 9638
  protocol                 = "udp"
  security_group_id        = aws_security_group.habitat_supervisor.id
  source_security_group_id = aws_security_group.habitat_supervisor.id
}

////////////////////////////////
// Chef Automate Rules
# HTTP (nginx)
resource "aws_security_group_rule" "ingress_chef_automate_allow_80_tcp" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.chef_automate_ui.id
}

# HTTPS (nginx)
resource "aws_security_group_rule" "ingress_chef_automate_allow_443_tcp" {
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.chef_automate_ui.id
}

# Allow Verify service
resource "aws_security_group_rule" "ingress_chef_automate_allow_7799_tcp" {
  type              = "ingress"
  from_port         = 7799
  to_port           = 7799
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.chef_automate.id
}

# Allow elasticsearch clients
resource "aws_security_group_rule" "ingress_chef_automate_allow_elasticsearch_tcp" {
  type                     = "ingress"
  from_port                = var.opensearch_listen_port
  to_port                  = var.opensearch_listen_port + 200
  protocol                 = "tcp"
  security_group_id        = aws_security_group.chef_automate.id
  source_security_group_id = aws_security_group.chef_automate.id
}

# Allow postgresql connections
resource "aws_security_group_rule" "ingress_chef_automate_allow_postgres_tcp" {
  type                     = "ingress"
  from_port                = var.postgresql_listen_port
  to_port                  = var.postgresql_listen_port
  protocol                 = "tcp"
  security_group_id        = aws_security_group.chef_automate.id
  source_security_group_id = aws_security_group.chef_automate.id
}

# Allow pgleaderchk connections
resource "aws_security_group_rule" "ingress_chef_automate_allow_pgleaderchk_tcp" {
  type                     = "ingress"
  from_port                = var.pgleaderchk_listen_port
  to_port                  = var.pgleaderchk_listen_port
  protocol                 = "tcp"
  security_group_id        = aws_security_group.chef_automate.id
  source_security_group_id = aws_security_group.chef_automate.id
}

# Allow proxy connections
resource "aws_security_group_rule" "ingress_chef_automate_allow_proxy_tcp" {
  type                     = "ingress"
  from_port                = var.proxy_listen_port
  to_port                  = var.proxy_listen_port
  protocol                 = "tcp"
  security_group_id        = aws_security_group.chef_automate.id
  source_security_group_id = aws_security_group.chef_automate.id
}

# Allow custom SSH connections
resource "aws_security_group_rule" "ingress_chef_automate_allow_custom_ssh" {
  type              = "ingress"
  from_port         = var.aws_ssh_port
  to_port           = var.aws_ssh_port
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.chef_automate.id
}

//////////////////////////
//  Load balancer security group Rules
resource "aws_security_group_rule" "ingress_allow_80_tcp_all" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.load_balancer.id
}

resource "aws_security_group_rule" "ingress_allow_443_tcp_all" {
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.load_balancer.id
}

resource "aws_security_group_rule" "load_balancer_egress_allow_0-65535_all" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.load_balancer.id
}

# Egress : base_linux security group
resource "aws_security_group_rule" "linux_egress_allow_0-65535_all" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.base_linux.id
}

resource "aws_security_group_rule" "egress_allow_80_tcp_all" {
  type              = "egress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.chef_automate_ui.id
}

resource "aws_security_group_rule" "egress_allow_443_tcp_all" {
  type              = "egress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.chef_automate_ui.id
}

resource "aws_security_group_rule" "egress_allow_6432_tcp_all" {
  type              = "egress"
  from_port         = 6432
  to_port           = 6432
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.base_linux.id
}

resource "aws_security_group_rule" "egress_allow_9200_tcp_all" {
  type              = "egress"
  from_port         = 9200
  to_port           = 9200
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.base_linux.id
}

resource "aws_security_group_rule" "egress_allow_9631_tcp_all" {
  type              = "egress"
  from_port         = 9631
  to_port           = 9631
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.base_linux.id
}

resource "aws_security_group_rule" "egress_allow_9300_tcp_all" {
  type              = "egress"
  from_port         = 9300
  to_port           = 9300
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.base_linux.id
}

resource "aws_security_group_rule" "egress_allow_9638_tcp_all" {
  type              = "egress"
  from_port         = 9638
  to_port           = 9638
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.base_linux.id
}

resource "aws_security_group_rule" "egress_allow_9638_udp_all" {
  type              = "egress"
  from_port         = 9638
  to_port           = 9638
  protocol          = "udp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.base_linux.id
}

resource "aws_security_group_rule" "egress_allow_7432_tcp_all" {
  type              = "egress"
  from_port         = 7432
  to_port           = 7432
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.base_linux.id
}

resource "aws_security_group_rule" "egress_allow_5432_tcp_all" {
  type              = "egress"
  from_port         = 5432
  to_port           = 5432
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.base_linux.id
}

resource "aws_security_group_rule" "egress_efs_nfs_2049" {
  type              = "egress"
  from_port         = 2049
  to_port           = 2049
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.base_linux.id
}

resource "aws_security_group_rule" "egress_allow_22_tcp_all" {
  type              = "egress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = [var.json_data]
  security_group_id = aws_security_group.base_linux.id
}
//////////////////////////
// EFS rules
resource "aws_security_group_rule" "ingress_efs_nfs_2049" {
  type                     = "ingress"
  from_port                = 2049
  to_port                  = 2049
  protocol                 = "tcp"
  security_group_id        = aws_security_group.efs_mount.id
  source_security_group_id = aws_security_group.base_linux.id
}



# ======================================================
# Archivo original: versions.tf
# Carpeta: C:\Users\asus\cloned_repos\chef\automate\terraform\a2ha-terraform\modules\aws
# ======================================================


terraform {
  required_version = ">= 0.12"
}


