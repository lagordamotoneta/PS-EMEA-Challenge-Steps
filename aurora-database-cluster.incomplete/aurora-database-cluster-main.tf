# # --------------------------------------------------------------------------------
# # ---------------Aurora DB-------------------------------------------
# # --------------------------------------------------------------------------------

# #We need a cluster first and then an instance (below)

# resource "aws_rds_cluster" "default" {
#   cluster_identifier = "appd-database"
#   engine             = "aurora-mysql"
#   engine_version                  = "5.7.12"
#   availability_zones              = ["${var.region}a", "${var.region}b", "${var.region}c"]
#   master_username    = ??
#   master_password    = ??
#   port               = ???<make sure you use the correct port read the AppD docs!>
#   vpc_security_group_ids          = [???]
#   skip_final_snapshot             = true
#   storage_encrypted               = true
#   db_cluster_parameter_group_name = var.db_cluster_param_group_id
# }


# #Instance

# resource "aws_rds_cluster_instance" "cluster_instances" {
#   count              = 1
#   identifier         = "appd-database-instance"
#   cluster_identifier = aws_rds_cluster.default.id
#   instance_class     = "db.t2.small"
#   engine             = "aurora-mysql"
#   engine_version          = "5.7.12"
#   db_parameter_group_name = ??
# # You need the below parameter for the next step to create the root user
#   publicly_accessible     = true
# }

# #We need to make available the created resources' ids as outputs for them to be available in the root module!

# output "database_endpoint" {
#     value = ??
# }

# output "database_port" {
#     value = ??
# }

