# Terraform Resource Block - To Build EC2 instance in Public Subnet

# Terraform Data Block - Lookup Ubuntu 20.04
data "aws_ami" "ubuntu" {
  most_recent = true
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
  owners = ["099720109477"]
}

# resource "aws_instance" "web_server" {                                 # BLOCK
#     ami           = data.aws_ami.ubuntu_20.id                          # Argument with data expression
#     instance_type = "t2.micro"                                         # Argument
#     subnet_id     = aws_subnet.public_subnets["public_subnet_1"].id    # Argument with value as expression
#     tags = {
#         Name = "Cams ubuntu 20.04 version"
#     }
# }

resource "aws_instance" "locals_web_server" {
  ami           = data.aws_ami.ubuntu_22.id
  instance_type = "t3.micro"
  subnet_id     = aws_subnet.public_subnets["public_subnet_2"].id
  tags = {
    Name = "Cams ubuntu 22.04 version"
  }
}

resource "aws_instance" "ubuntu_server" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.public_subnets["public_subnet_1"].id
  security_groups = [aws_security_group.vpc-ping.id,
  aws_security_group.ingress-ssh.id, aws_security_group.vpc-web.id]
  associate_public_ip_address = true
  key_name                    = aws_key_pair.generated.key_name
  connection {
    user        = "ubuntu"
    private_key = tls_private_key.generated.private_key_pem
    host        = self.public_ip
  }
  tags = {
    Name = "Ubuntu EC2 Server"
  }
  lifecycle {
    ignore_changes = [security_groups]
  }
}