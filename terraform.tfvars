#Variables assigned for the root module main.tf . These will flow to the modules throught the modules' variables.

#Variables for Aurora Database and the creation of the root user.
aurora_db_username = "admin"

aurorda_db_password = "appdappd"

#Variables related to EC2 instance
myRegion = "eu-west-2"

instance_type = "t3.large"

key_name = "<the name of your key in AWS>"

key_file = "<yourKey.pem> file"