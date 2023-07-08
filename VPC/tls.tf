# https://stackoverflow.com/questions/49743220/how-do-i-create-an-ssh-key-in-terraform


/* . WORKING EXAMPLE 1
variable "key_name" {}
resource "tls_private_key" "example" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "generated_key" {
  key_name   = var.key_name
  public_key = tls_private_key.example.public_key_openssh
}
*/

/* . WORKING EXAMPLE 2
resource "tls_private_key" "pk" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "kp" {
  key_name   = "myKey"       # Create "myKey" to AWS!!
  public_key = tls_private_key.pk.public_key_openssh

  provisioner "local-exec" { # Create "myKey.pem" to your computer!!
    command = "echo '${tls_private_key.pk.private_key_pem}' > ./myKey.pem"
  }

 I extrapolated the following 2 provisioner statements 
  provisioner "local-exec" {
    command = "echo '${tls_private_key.pk.public_key_pem}' > ./myKey.pub"
  }

  provisioner "local-exec" {
    command = "chmod 400 myKey.pem"
  }
}
*/


resource "tls_private_key" "tls_keyName" {
  algorithm = "RSA"
  rsa_bits  = 4096
}
resource "local_file" "private_key_pem" {
  content  = tls_private_key.tls_keyName.private_key_pem
  filename = "MyAWSKey.pem"
}

resource "local_file" "public_key_pub" {
  content = tls_private_key.tls_keyName.public_key_pem
  # content  = tls_private_key.tls_keyName.public_key_openssh
  filename = "MyAWSKey.pub"
}


#   The following creates an AWS keypair
resource "aws_key_pair" "myKeyPair" {
  key_name   = "MyAWSKey"
  public_key = tls_private_key.tls_keyName.public_key_openssh
  lifecycle {
    ignore_changes = [key_name]
  }
}

