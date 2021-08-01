#------------------------------------------------------------------------
#---------------DB Param Group-------------------------------------------
#------------------------------------------------------------------------

# # Start to fill the needed to create the different parameters needed by the database (read more in the docs)
# # Total of 12 for the DB parameter group
# # Uncomment the below and is strongly suggested that you do not change the names and refer them in the next steps

# resource "aws_db_parameter_group" "appd-db-parameter-group" {
    # name    = "Controller-Aurora-DB-Params"
    # family  = "aurora-mysql5.7"

    # parameter {
    #     name = "innodb_file_format"
    #     value = "Barracuda"
    #     apply_method = "pending-reboot"
    # }

    # parameter {
    #     name = "innodb_large_prefix"
    #     value = "1"
    #     apply_method = "pending-reboot"
    # }
#}


# #--------------------------------------------------------------------------------
# #---------------DB CLUSTER Param Group-------------------------------------------
# #--------------------------------------------------------------------------------


# resource "aws_rds_cluster_parameter_group" "appd-db-cluster-parameter-group" {
    # name    = "Controller-Aurora-DB-Cluster-Params" 
    # family  = "aurora-mysql5.7"

    # parameter {
    #     name = "character_set_client"
    #     value = "utf8"
    #     apply_method = "pending-reboot"
    # }
# }

# #--------------------------------------------------------------------------------
# #---------------OUTPUTS FROM THIS MODULE-------------------------------------------
# #--------------------------------------------------------------------------------
# #We need to make available the created resources' ids as outputs for them to be available in the root module. 
# #Read a bit about outputs or check again the warm up you did.

# output "db_param_group_id" {
#     value = ??
# }

# output "db_cluster_param_group_id" {
#     value = ??

# }
