data "vault_generic_secret" "aws_creds" {
  path = "secret/CloudSecurity"
}

resource "aws_security_group" "sg" {
  name        = "sg"
  description = "Remote SSH"
  vpc_id      = aws_vpc.vpc.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_iam_instance_profile" "my_profile" {
  name = "my_profile"
  role = aws_iam_role.first_role.name
}

resource "aws_instance" "instance_1" {
  ami           = "ami-064573ac645743ea8"
  instance_type = "t2.micro"
  subnet_id      = aws_subnet.subnet.id  
  vpc_security_group_ids = [aws_security_group.sg.id]
  iam_instance_profile = aws_iam_instance_profile.my_profile.name

  tags = {
    Name        = "ec2"
    Owner       = "Abha"
  }
}

