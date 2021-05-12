data "aws_ami" "latest-ubuntu" {
most_recent  = var.ami_most_recent
owners       = [var.ami_owners]

  filter {
      name   = "name"
      values = [var.ami_filter]
  }

  filter {
      name   = "virtualization-type"
      values = [var.ami_virt_type]
  }
}

data "template_file" "init" {
  template = file("${path.module}/init.tpl")
}

resource "aws_key_pair" "deployer" {
  key_name   = "deployer-key"
  public_key = file(var.pub_key_path)
}

resource "aws_instance" "helloworld" {
  ami           = data.aws_ami.latest-ubuntu.id
  key_name      = aws_key_pair.deployer.key_name
  user_data     = data.template_file.init.template
  instance_type = var.instance_type
  tags          = var.instance_tags
}

resource "null_resource" "helloworld" {
  triggers = {
    cluster_instance_id = aws_instance.helloworld.id
  }

  // connection {
  //   type = "ssh"
  //   host = aws_instance.helloworld.public_ip
  //   user = var.ec2_user
  //   private_key = file(var.priv_key_path)
  //   agent = false
  //   timeout = "10s"
  // }

  // provisioner "file" {
  //   source = "${path.module}/script.sh"
  //   destination = "/tmp/script.sh"
  // }

  // provisioner "remote-exec" {
  //     inline = [
  //     "chmod u+x /tmp/script.sh",
  //     "cat /tmp/script.sh",
  //   ]
  // }

  provisioner "local-exec" {
    command = "timeout 60 ${path.module}/curl_ws.sh || (echo 'Error: Something went wrong' && false)"
    environment = {
      WEBSERVER = aws_instance.helloworld.public_dns
    }
  }
}