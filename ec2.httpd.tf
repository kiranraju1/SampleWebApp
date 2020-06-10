resource "aws_instance" "TF-webapp-demo" {
  ami           = "ami-01d025118d8e760db"
  instance_type = "t2.micro"
  user_data     = <<-EOF
                  #!/bin/bash
                  sudo su
                  yum -y install httpd
                  echo "<p> TF-Demo! </p>" >> /var/www/html/index.html
                  sudo systemctl enable httpd
                  sudo systemctl start httpd
                  EOF
}

output "DNS" {
  value = aws_instance.TF-Demo.public_dns
}
