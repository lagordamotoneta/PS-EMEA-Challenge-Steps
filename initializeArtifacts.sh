#!/bin/bash
initLogfile=/home/ec2-user/initLogfile.log
echo ".................................Installing needed packages in the EC/Controller machine................................." >> $${initLogfile}
yum install curl -y >> $${initLogfile}
yum install libaio -y >> $${initLogfile}
yum install numactl -y >> $${initLogfile}
yum install tzdata -y >> $${initLogfile}
sudo rpm -ivh --force http://mirror.centos.org/centos/7/os/x86_64/Packages/ncurses-base-5.9-14.20130511.el7_4.noarch.rpm >> $${initLogfile}
sudo rpm -ivh --force http://mirror.centos.org/centos/7/os/x86_64/Packages/ncurses-libs-5.9-14.20130511.el7_4.x86_64.rpm >> $${initLogfile}

#prepare the EC and controller machine
echo ".................................Create /etc/security/limits.d/appdynamics.conf and its values ................................." >> $${initLogfile}
echo "ec2-user hard nofile 65535
ec2-user soft nofile 65535
ec2-user hard nproc 8192
ec2-user soft nproc 8192" > /etc/security/limits.d/appdynamics.conf

#download platform installer
echo ".................................Download of installer started................................." >> $${initLogfile}
cd /home/ec2-user
sudo -u ec2-user curl -L -o "/home/ec2-user/platform-setup-x64-linux-21.4.3.24599.sh" -O https://download-files.appdynamics.com/download-file/enterprise-console/21.4.3.24599/platform-setup-x64-linux-21.4.3.24599.sh 
echo ".................................Download of installer ended................................." >> $${initLogfile}
echo ".................................Updating permission for installer started................................." >> $${initLogfile}
chmod 755  platform-setup-x64-linux-21.4.3.24599.sh
echo ".................................Updating permission for installer ended................................." >> $${initLogfile}

echo ".................................Creation of /home/ec2-user/response.varfile for the EC installation started................................." >> $${initLogfile}

echo "serverHostName=
sys.languageId=en
disableEULA=true

platformAdmin.port=9191
platformAdmin.databasePort=3377
platformAdmin.dataDir=/home/ec2-user/appdynamics/platform/mysql/data
platformAdmin.databasePassword=appd
platformAdmin.databaseRootPassword=appd
platformAdmin.adminPassword=appd
platformAdmin.useHttps\$Boolean=false
sys.installationDir=/home/ec2-user/appdynamics/platform" > /home/ec2-user/response.varfile

echo ".................................Creation of /home/ec2-user/response.varfile for the EC installation finished................................." >> $${initLogfile}

echo ".................................Updating of permission for the file installation.sh that was transfered by Terraform started................................." >> $${initLogfile}
chmod 755 /home/ec2-user/installation.sh
echo ".................................Updating of permission for the file installation.sh that was transfered by Terraform started................................." >> $${initLogfile}

cd /home/ec2-user/
echo ".................................Executing of file installation.sh (using the Aurora db_endpoint as paramter) started................................." >> $${initLogfile}

sudo -u ec2-user ./installation.sh ${db_endpoint}