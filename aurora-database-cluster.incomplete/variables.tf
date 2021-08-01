
#Variables that are used inside the module aurora-database-cluster

variable "db_vpc_sec_group_id" {
  type = string
}
variable "db_cluster_param_group_id" {
  type = string
}
variable "db_param_group_id" {
  type = string
}
variable "region" {
  type = string
}
variable "db_username"{
  type = string
}
variable "db_password" {
  type= string
}
