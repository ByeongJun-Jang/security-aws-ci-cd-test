#!/bin/bash

echo "BeforeInstall script started" > /home/ec2-user/before_install.log

# Change to home directory
cd /home/ec2-user

# Download the zip file from S3
echo "Downloading example.zip from S3" >> /home/ec2-user/before_install.log
aws s3 cp s3://groom-runner-bucket/example/example.zip . >> /home/ec2-user/before_install.log 2>&1

# Check if the zip file exists
if [ -f "example.zip" ]; then
    echo "example.zip file exists after download" >> /home/ec2-user/before_install.log
else
    echo "example.zip file does not exist after download" >> /home/ec2-user/before_install.log
    exit 1
fi

echo "BeforeInstall script finished" >> /home/ec2-user/before_install.log
