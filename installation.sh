#!/bin/bash
logfile=/home/ec2-user/resultInstallation.log
#Hostname=$(curl http://169.254.169.254/latest/meta-data/public-hostname 2>/dev/null)
#We set the hostname in the response.file that was created while the user_data script executed
Hostname=$(hostname)
sed -i "s/serverHostName=/serverHostName=${Hostname}/g" response.varfile

#install enterprise console
echo ".................................Enterprise Console installation started................................." >> ${logfile}

sudo -u ec2-user ./platform-setup-x64-linux-21.4.3.24599.sh -q -varfile /home/ec2-user/response.varfile >> ${logfile}

echo ".................................Enterprise Console installation ended................................." >> ${logfile}

#install platform
cd /home/ec2-user/appdynamics/platform/platform-admin/bin
echo ".................................Change directory to /home/ec2-user/appdynamics/platform/platform-admin/bin: OK" >> ${logfile}
echo ".................................Your directory is: " $(pwd) >> ${logfile}

echo ".................................Start to install platform.................." >> ${logfile}
sudo -u ec2-user ./platform-admin.sh create-platform --name TerraformPlarform --installation-dir /home/ec2-user/appdynamics/platform/product >> ${logfile}

#add new host
echo ".................................Add new host.................." >> ${logfile}
sudo -u ec2-user ./platform-admin.sh add-hosts --platform-name TerraformPlarform --hosts localhost >> ${logfile}
echo ".................................Finish adding host.................." >> ${logfile}

#We copy the license file
echo ".................................Moving the license................................." >> ${logfile}
mkdir /home/ec2-user/appdynamics/platform/product/controller/
#cd /home/ec2-user/appdynamics/platform/product/controller/
mv /home/ec2-user/license.lic /home/ec2-user/appdynamics/platform/product/controller/

echo ".................................Send controller job to EC using aurora DB ........................." >> ${logfile}
#install controller using aurora
./platform-admin.sh submit-job --platform-name TerraformPlarform --service controller --job install --args controllerProfile=demo controllerPrimaryHost=${Hostname} controllerTenancyMode=single controllerRootUserPassword="appd" mysqlRootPassword="appdappd" controllerAdminUsername="appd" controllerAdminPassword="appd" databaseType=Aurora controllerDBPort=3388 controllerDBHost=$1 >> ${logfile}

echo ".................................Finish controller job to EC using aurora DB ........................." >> ${logfile}
