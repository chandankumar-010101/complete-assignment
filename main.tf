resource "aws_instance" "my-infra" {
  ami           = "ami-02b92c281a4d3dc79"
  instance_type = "t2.micro"
  subnet_id = "${aws_default_subnet.default.id}"
  key_name = "assign-key"
  vpc_security_group_ids = ["${aws_security_group.sgweb.id}"]



  tags = {
    Name = "my-infra"
  }
}
resource "aws_default_vpc" "default" {
  tags = {
    Name = "Default VPC"
  }
}
resource "aws_default_subnet" "default" {
  availability_zone = "us-west-2a"

  tags = {
    Name = "Default subnet "
  }
}

resource "aws_key_pair" "assign-key" {
  key_name   = "assign-key"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDGvqbjJvhChPLwEmXewA78pGbkegwDtnKuW8RLIJDt37L96QQ709ARB2xfPHU6gzqdA2lWy760o+QDD3OwpoIhfXp//Am3BwTybTxjxfMdC5ZU4o5VXAGhnP8W8+dDGi7BuM90EiGTvaM6S79DvdZmigrNs1mLrsh5Mi1doFtyg8z3eAD1bbuVWfLuFS28k8MAhtJXNK7Q23x5DSK1lofMJ7D2j++aHiK96A4HITORD27LZdAwLmfkw594YDlCEc6c23iJwA6kToQ5WPl6NKBjf3A7qLT3SuT1MUs51Fv7jQ8FUdD1hrzi2yDEnUtfheuQmhX1q/+uNkzCtFd4uDNKnwhtSh1qRXG2P/EZOe/eb933w9YPLY1GgvUOjAfRnouJXhxbxnUcmar8lxyXexDOV79M85I5JRBA0+GXmy0N0H7qj4/PtU2U86hy1ssLHryQaPLbySm/1a5wYs82OAt0YkltgIEQXobd5FIrP6FPHUO3k58EJ+DugmVimUYGbms= chandan_kumar@DESKTOP-DDH8POP"

}
resource "aws_security_group" "sgweb" {
  name = "vpc_test_web"
  description = "Allow incoming HTTP connections & SSH access"

  ingress {
    from_port = 3306
    to_port = 3306
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 443
    to_port = 443
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }



  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks =  ["18.215.226.36/30","107.22.40.20/30"]
  }

  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  }

  

}


