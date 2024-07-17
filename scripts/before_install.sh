#!/bin/bash
echo "BeforeInstall script started" > /home/ec2-user/before_install.log

# Change to home directory
cd /home/ec2-user

# Remove the existing jar file if it exists
if [ -f "security-example-0.0.1-SNAPSHOT.jar" ]; then
    echo "Removing existing jar file" >> /home/ec2-user/before_install.log
    rm security-example-0.0.1-SNAPSHOT.jar
fi

# Remove the existing tar.gz file if it exists
if [ -f "example.tar.gz" ]; then
    echo "Removing existing tar.gz file" >> /home/ec2-user/before_install.log
    rm example.tar.gz
fi

# Remove the existing appspec.yml file if it exists
if [ -f "appspec.yml" ]; then
    echo "Removing existing appspec.yml file" >> /home/ec2-user/before_install.log
    rm appspec.yml
fi

echo "BeforeInstall script finished" >> /home/ec2-user/before_install.log
