#!/bin/bash

# Change to home directory
cd /home/ec2-user

# Extract the tar.gz file
tar -xvzf example.tar.gz

# Change to the build/libs directory
cd build/libs

echo "> 🟢 Run new spring services."
JAR_NAME=$(ls | grep .jar)
nohup java -jar $JAR_NAME > /dev/null 2>&1 &
