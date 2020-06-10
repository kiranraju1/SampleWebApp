resource "aws_instance" "TF-webapp-demo" {
  ami           = "ami-01d025118d8e760db"
  instance_type = "t2.micro"
}

