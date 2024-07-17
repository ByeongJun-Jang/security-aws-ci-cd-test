#!/bin/bash
cd /home/ec2-user/build/libs

echo "> 🟢 Run new spring services."
JAR_NAME=$(ls | grep .jar)
nohup java -jar $JAR_NAME > /dev/null 2>&1 &
