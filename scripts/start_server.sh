#!/bin/bash

echo "Start server script started" > /home/ec2-user/start_server.log

# Change to home directory
cd /home/ec2-user

# Download the zip file from S3
echo "Downloading example.zip from S3" >> /home/ec2-user/start_server.log
aws s3 cp s3://groom-runner-bucket/example/example.zip . >> /home/ec2-user/start_server.log 2>&1

# Check if the zip file exists
if [ -f "example.zip" ]; then
    echo "example.zip file exists before extraction" >> /home/ec2-user/start_server.log
    unzip -o example.zip >> /home/ec2-user/start_server.log 2>&1
else
    echo "example.zip file does not exist before extraction" >> /home/ec2-user/start_server.log
    exit 1
fi

# Change to the build/libs directory
if [ -d "build/libs" ]; then
    cd build/libs
else
    echo "build/libs directory does not exist" >> /home/ec2-user/start_server.log
    exit 1
fi

echo "> 🟢 Run new spring services." >> /home/ec2-user/start_server.log
JAR_NAME=$(ls | grep .jar)
if [ -z "$JAR_NAME" ]; then
    echo "No JAR file found in build/libs directory" >> /home/ec2-user/start_server.log
    exit 1
fi

nohup java -jar $JAR_NAME > /home/ec2-user/nohup.out 2>&1 &

echo "Start server script finished" >> /home/ec2-user/start_server.log
