provider "aws" {
  region     = "us-west-2"
  access_key = "AKIATXJFMC6UHIYDLA6M"
  secret_key = "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"
}


resource "aws_instance" "foo" {
  ami           = "ami-098e42ae54c764c35" # us-west-2
  instance_type = "t2.micro"
}
Tags = {
name ="testindia"
}
