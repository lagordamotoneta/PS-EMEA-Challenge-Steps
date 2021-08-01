
variable "myRegion"{
    type= string
    
}

#Variables for Aurora Database and the creation of the root user.
  
variable "aurora_db_username" {
  type= string
}

variable "aurorda_db_password" {
  type= string
}

#Variables related to EC2 instance
variable "instance_type" {
  type= string
}

variable "key_name" {
  type= string
}

variable "key_file" {
  type= string
}