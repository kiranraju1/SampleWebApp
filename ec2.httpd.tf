provider "aws" {
  access_key = "AKIAVWLHRN6QKE3VOVNO"
  secret_key = "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"
  region     = "us-east-1"
}

resource "aws_instance" "TF-Demo" {
  ami           = "ami-09d95fab7fff3776c"
  instance_type = "t2.micro"
  user_data     = 
                  #!/bin/bash
                  sudo su
                  yum -y install httpd
                  echo "<p> TF-Demo! </p>" >> /var/www/html/index.html
                  sudo systemctl enable httpd
                  sudo systemctl start httpd
                  
}

output "DNS" {
  value = aws_instance.TF-Demo.public_dns
}
