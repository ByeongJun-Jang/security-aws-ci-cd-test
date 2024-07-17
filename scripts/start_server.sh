#!/bin/bash
cd /home/ec2-user/build/libs

echo "> 🟢 Run new spring services."
nohup java -jar your-app-name.jar > /dev/null 2>&1 &
