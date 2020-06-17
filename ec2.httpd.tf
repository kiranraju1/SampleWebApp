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
