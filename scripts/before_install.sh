#!/bin/bash
echo "BeforeInstall script started" > /home/ec2-user/before_install.log

# Change to home directory
cd /home/ec2-user

# Check if the zip file exists and remove it if it does
if [ -f "example.zip" ]; then
    echo "example.zip file exists before deletion" >> /home/ec2-user/before_install.log
    rm example.zip
else
    echo "example.zip file does not exist before deletion" >> /home/ec2-user/before_install.log
fi

# Remove the existing jar file if it exists
if [ -f "build/libs/security-example-0.0.1-SNAPSHOT-plain.jar" ]; then
    echo "Removing existing jar file" >> /home/ec2-user/before_install.log
    rm build/libs/security-example-0.0.1-SNAPSHOT-plain.jar
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

# Remove the existing before_install.sh file if it exists
if [ -f "scripts/before_install.sh" ]; then
    echo "Removing existing before_install.sh file" >> /home/ec2-user/before_install.log
    rm scripts/before_install.sh
fi

echo "BeforeInstall script finished" >> /home/ec2-user/before_install.log
