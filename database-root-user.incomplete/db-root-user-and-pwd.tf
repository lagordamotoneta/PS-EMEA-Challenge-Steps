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

# # Create user

# resource "mysql_user" "root" {
#   user               = ??
#   host               = ??
#   plaintext_password = "appdappd"
# }

# # Grant the user with the needed. We have facilitated the grants that are needed for the user.
# resource "mysql_grant" "rootGrant" {
#   user       = "${mysql_user.root.user}"
#   host       = "${mysql_user.root.host}"
#   database   = "*"
#   privileges = ["SELECT, INSERT, UPDATE, DELETE, CREATE, DROP, RELOAD, PROCESS, REFERENCES, INDEX, ALTER, SHOW DATABASES, CREATE TEMPORARY TABLES, LOCK TABLES, EXECUTE, REPLICATION SLAVE, REPLICATION CLIENT, CREATE VIEW, SHOW VIEW, CREATE ROUTINE, ALTER ROUTINE, CREATE USER, EVENT, TRIGGER, LOAD FROM S3, SELECT INTO S3"]
#   grant      = true
# }
