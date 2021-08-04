
provider "aws"{
    region      = var.myRegion
}

# terraform {
#   required_providers {
#     mysql = {
#       source = "winebarrel/mysql"
#       version = "1.10.4"
#     }
#   }
# }

# provider "mysql" {

#   endpoint = "${endpoint??}:${DB port?}"
#   username = ??
#   password = ??
# }

#----------------------------------------------------------------------------------------------------------------------------
#-------------------------------MODULES---------------------------------------------------------------------------------------------
#----------------------------------------------------------------------------------------------------------------------------

# In here you will declare your module and will give it an internal Terraform name. You will tell it which code (module) you are going to use. In this case you will refer to
# the code in the ./security-groups module. Take a look at the code in the module and mind the outputs and outputs names!!
module "appd-platform-security-groups" {
  source = "./security-groups"
  
}

# #Database Parameter Groups
# module "appd-database-param-groups"{
#   source = "./database-param-groups"
# }

# #Aurora Database
# module "appd-aurora-database-cluster"{
#   source = "./aurora-database-cluster"
#   db_vpc_sec_group_id = ??
#   db_param_group_id = ???
#   db_cluster_param_group_id = ???
#   region= ??
#   db_username = ??
#   db_password = ??                        
# }

# #Database user: root for controller installation
# module "appd-aurora-db-root-user"{
#   source = "./database-root-user"
#   depends_on = [module.appd-aurora-database-cluster]
# }

# # EC2 instance where the EC, Platform and Controller are going to be installed.
# module "appd-platform-and-controller"{
#   source = "./ec2-instance"
#   depends_on = [module.appd-aurora-db-root-user]
#   instance_sec_group_id = ??
#   database_endpoint = ??
#   ec2_instance_type = ??
#   ec2_key_name = ??
#   ec2_key_file = ??
# }


# #These are the output variables from the creation of our resources so we have then handy (finish defining the previous section first, the appd-platform-and-controller module )

# output "final_aurora_db_endpoint" {
#   value = ???
# }
# output "ec2_instance_final_public_dns" {
#   value = ??
# }

# output "ec2_instance_final_private_dns" {
#   value = ??
# }

# output "ec2_instance_final_public_ip" {
#   value = ??
# }

