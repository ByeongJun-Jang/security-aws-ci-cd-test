#!/bin/bash

echo "Start server script started" > /home/ec2-user/start_server.log

# Change to home directory
cd /home/ec2-user

# Check if the zip file exists
if [ -f "/home/ec2-user/example.zip" ]; then
    echo "Unzipping example.zip" >> /home/ec2-user/start_server.log
    unzip -o /home/ec2-user/example.zip -d /home/ec2-user/ >> /home/ec2-user/start_server.log 2>&1
else
    echo "example.zip file does not exist before extraction" >> /home/ec2-user/start_server.log
    exit 1
fi

# Change to the build/libs directory
if [ -d "/home/ec2-user/build/libs" ]; then
    cd /home/ec2-user/build/libs
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

nohup java -jar $JAR_NAME > /home/ec2-user/application.log 2> /home/ec2-user/error.log &

NEW_PID=$(pgrep -f $JAR_NAME)
echo "New process id is $NEW_PID" >> /home/ec2-user/start_server.log

echo "Start server script finished" >> /home/ec2-user/start_server.log
