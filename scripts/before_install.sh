#!/bin/bash

echo "BeforeInstall 스크립트 시작" > /home/ec2-user/before_install.log

# 환경 변수 설정
S3_BUCKET_NAME=${S3_BUCKET_NAME:-$(grep S3_BUCKET_NAME /etc/environment | cut -d '=' -f2)}
S3_FILE_KEY=${S3_FILE_KEY:-$(grep S3_FILE_KEY /etc/environment | cut -d '=' -f2)}

# 홈 디렉토리로 이동
cd /home/ec2-user

# 기존 zip 파일이 있는 경우 삭제
if [ -f "/home/ec2-user/example.zip" ]; then
    echo "기존 example.zip 파일 삭제" >> /home/ec2-user/before_install.log
    rm /home/ec2-user/example.zip
fi

# 환경 변수 확인
echo "S3_BUCKET_NAME: $S3_BUCKET_NAME" >> /home/ec2-user/before_install.log
echo "S3_FILE_KEY: $S3_FILE_KEY" >> /home/ec2-user/before_install.log

# S3에서 zip 파일 다운로드
echo "S3에서 example.zip 다운로드" >> /home/ec2-user/before_install.log
aws s3 cp s3://$S3_BUCKET_NAME/$S3_FILE_KEY /home/ec2-user/example.zip >> /home/ec2-user/before_install.log 2>&1

# zip 파일이 존재하는지 확인
if [ -f "/home/ec2-user/example.zip" ]; then
    echo "다운로드 후 example.zip 파일 존재" >> /home/ec2-user/before_install.log
else
    echo "다운로드 후 example.zip 파일이 존재하지 않음" >> /home/ec2-user/before_install.log
    exit 1
fi

echo "BeforeInstall 스크립트 완료" >> /home/ec2-user/before_install.log
