#!/bin/bash
echo "BeforeInstall script started" > /home/ec2-user/before_install.log

# Change to home directory
cd /home/ec2-user

# Check if the tar.gz file exists
if [ -f "example.tar.gz" ]; then
    echo "example.tar.gz file exists before deletion" >> /home/ec2-user/before_install.log
    rm example.tar.gz
else
    echo "example.tar.gz file does not exist before deletion" >> /home/ec2-user/before_install.log
fi

# Remove the existing jar file if it exists
if [ -f "security-example-0.0.1-SNAPSHOT.jar" ]; then
    echo "Removing existing jar file" >> /home/ec2-user/before_install.log
    rm security-example-0.0.1-SNAPSHOT.jar
fi

# Remove the existing appspec.yml file if it exists
if [ -f "appspec.yml" ]; then
    echo "Removing existing appspec.yml file" >> /home/ec2-user/before_install.log
    rm appspec.yml
fi

# Remove the existing start_server.sh file if it exists
if [ -f "scripts/start_server.sh" ]; then
    echo "Removing existing start_server.sh file" >> /home/ec2-user/before_install.log
    rm scripts/start_server.sh
fi

echo "BeforeInstall script finished" >> /home/ec2-user/before_install.log
