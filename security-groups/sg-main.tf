# #------------EC-------------------
resource "aws_security_group" "appd-platform-security-group-tf"{
    
    #this is the name in AWS
    name        = "appd-platform-security-group"
    description =  "Allow all inbound (ingress) TCP traffic on ports 22, 9191, 8090-8097 and outbound (egress) to download installer"
    
    ingress{
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
    }

    ingress{
        from_port   = 9191
        to_port     = 9191
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"] 
        ipv6_cidr_blocks = ["::/0"]
    }
#Added as we have the whole platform running in one machine
    ingress{
        from_port   = 8090
        to_port     = 8097
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"] 
        ipv6_cidr_blocks = ["::/0"]
    }

    #for the installation scripts to run and to be able to download the installer. 
    egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
    }

}


#----------DB-------
resource "aws_security_group" "appd-db-security-group-tf" {
  name        = "appd-db-security-group"
  description = "Allow all inbound TCP traffic on ports 3388 from Controller and DB"

  #for the provideer to be able to run and access the DB
  ingress{
    from_port   = 3388
    to_port     = 3388
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

}

output "instance_security_group_id" {
  value = aws_security_group.appd-platform-security-group-tf.id
}

output "db_security_group_id" {
  value = aws_security_group.appd-db-security-group-tf.id
}