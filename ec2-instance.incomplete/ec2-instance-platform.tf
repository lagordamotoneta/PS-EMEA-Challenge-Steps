#--------------------------------------------------------------------------------
#---------------EC2 Instance-------------------------------------------
#--------------------------------------------------------------------------------

# #We need to filter the AMI that we are going to use for the EC2 instance that will host the platform!
# #This is convenint so we don't hardcore an image id
# data "aws_ami" "filteredAMI" {
#   most_recent = true
#   owners      = ["amazon"]
#   filter {
#     name   = "name"
#     values = ["amzn2-ami-*-x86_64-gp2"]
#   }
#   filter {
#     name   = "virtualization-type"
#     values = ["hvm"]
#   }

# }


# data "template_file" "installer" {
#   template = file("./initializeArtifacts.sh")
#   vars={
#     db_endpoint = "${??}"
#   }
# }

# resource "aws_instance" "appd-platform" {
  
#   ami                    = ??<the filtered AMI id>
#   instance_type          = ??
#   key_name               = ??
#   vpc_security_group_ids = [var.instance_sec_group_id]
#   count                  = 1
#   user_data              = ??
  
  
#   # Copy in the bash script we want to execute.
#   # The source is the location of the bash script
#   # on the local linux box you are executing terraform
#   # from.  The destination is on the new AWS instance.
#    provisioner "file" {
#     source      = "./installation.sh"
#     destination = "/home/ec2-user/installation.sh"
#   }

#   #Copy the licence file
#   provisioner "file" {
#     source      = "./license.lic"
#     destination = "/home/ec2-user/license.lic"
#   }
#   #We need to stablish a connection with the EC2 instance to provision the machine with the needed files
#     connection {
#     type        = "ssh"
#     user        = "ec2-user"
#     private_key = file(??)
#     host        = self.public_ip
#   }
  
#   root_block_device {
#     volume_size = "32"
#   }
# }

# #We need to make available the created resources' ids as outputs for them to be available in the root module

# output "appd_platform_ip" {
#   value = aws_instance.appd-platform.public_ip
# }
# output "appd_platform_public_dns" {
#   value = ??
# }

# output "appd_platform_private_dns" {
#   value = ??
# }


