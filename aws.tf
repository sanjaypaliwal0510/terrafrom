provider "aws" {
  region     = "us-west-2"
  access_key = "AKIATXJFMC6UHIYDLA6M"
  secret_key = "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"
}


resource "aws_instance" "jatindost" {
  ami           = "ami-098e42ae54c764c35"   
  instance_type = "t2.micro"
  key_name      = "jatindost"
  vpc_security_group_ids = [aws_security_group.jatindost.id]
  tags = {
  Name = "jatindost"
}
}

resource "aws_key_pair" "jatindost" {
  key_name   = "jatindost"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC75ERoVAC56Q6Duk7pfHuQQt9LPheXSKo73y5X8NxIHW2q94FuFD99cMsyOc8Ex8NsyxOkAqUEZ72PzDCeWHbCscp2xJGxUJMdOwQo7+81qFpxgvIfmTGfR/I940kxKuwT0R9MskG8gn3ONfRJTNcMdOV6exmonhGrbcx2K3Pdnx4vsScY58DI93FsTRsVHTVjozF04IdL32YuePg07M8OVU5QpMAfL5flnrYqkn4avjFtZKqPj6WagMEltoZiayq5X3DSIaMnDueJzq8rLtmPQEqgu/vhIPp/RteCzEaPdu0RFPboM+l4xXufD1NoEqCTsDcwOIkDhB2Wj7D0VJjd root@ip-172-31-13-90.us-west-2.compute.internal"
}
resource "aws_eip" "jatindost" {
  instance = aws_instance.jatindost.id
  vpc      = true

}
resource "aws_default_vpc" "default" {
  tags = {
    Name = "Default VPC"
  }
}
resource "aws_security_group" "jatindostsg" {
  name        = "jatindostsg"
  description = "Allow TLS inbound traffic"
  vpc_id      = aws_default_vpc.default.id

  ingress {
    description      = "TLS from VPC"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    }

  tags = {
    Name = "allow_tls"
  }
}
