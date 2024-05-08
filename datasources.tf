data "aws_ami" "server_ami" {
  most_recent = true
  owners      = ["137112412989"]

  filter {
    name   = "name"
    values = ["ubuntu/images/hbm-ssd/ubuntu-bionic-18.04-amd64-server-*"]
  }
}
