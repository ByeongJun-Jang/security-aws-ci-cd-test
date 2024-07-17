#!/bin/bash

# Change to home directory
cd /home/ec2-user

# Extract the tar.gz file
if [ -f "example.tar.gz" ]; then
    tar -xvzf example.tar.gz
else
    echo "example.tar.gz file does not exist"
    exit 1
fi

# Change to the build/libs directory
if [ -d "build/libs" ]; then
    cd build/libs
else
    echo "build/libs directory does not exist"
    exit 1
fi

echo "> 🟢 Run new spring services."
JAR_NAME=$(ls | grep .jar)
if [ -z "$JAR_NAME" ]; then
    echo "No JAR file found in build/libs directory"
    exit 1
fi

nohup java -jar $JAR_NAME > /home/ec2-user/nohup.out 2>&1 &
