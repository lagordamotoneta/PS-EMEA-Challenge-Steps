#--------------------------------------------------------------------------------
#---------------Create DB root USER-------------------------------------------
#--------------------------------------------------------------------------------

# #Please note that we need to make the provider available in the root module as well as in the module itself (here)
# terraform {
#   required_providers {
#     mysql = {
#       source = "winebarrel/mysql"
#       version = "1.10.4"
#     }
#   }
# }

# # Create user - Read the Terraform docs of the mysql provider selected and review the resource mysql_user. What is needed?
# ---code to create the user must be here ---

# # Grant the user with the needed using the mysql_grant resource. We have facilitated the privileges and database arguments for you.
# resource "mysql_grant" "rootGrant" {
#   user       = "${??}"
#   host       = "${??}"
#   database   = "*"
#   privileges = ["SELECT, INSERT, UPDATE, DELETE, CREATE, DROP, RELOAD, PROCESS, REFERENCES, INDEX, ALTER, SHOW DATABASES, CREATE TEMPORARY TABLES, LOCK TABLES, EXECUTE, REPLICATION SLAVE, REPLICATION CLIENT, CREATE VIEW, SHOW VIEW, CREATE ROUTINE, ALTER ROUTINE, CREATE USER, EVENT, TRIGGER, LOAD FROM S3, SELECT INTO S3"]
#   grant      = true
# }
