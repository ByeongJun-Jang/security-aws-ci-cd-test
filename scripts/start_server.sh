#!/bin/bash

echo "Start server script started" > /home/ec2-user/start_server.log

# Change to home directory
cd /home/ec2-user

# Unzip the downloaded file
echo "Unzipping example.zip" >> /home/ec2-user/start_server.log
unzip -o example.zip >> /home/ec2-user/start_server.log 2>&1

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
