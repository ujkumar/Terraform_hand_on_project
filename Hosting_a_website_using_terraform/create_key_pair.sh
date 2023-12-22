!#/bin/bash

# creating a directory for file download and normal operation under /tmp/locafile
mkdir -p /tmp/localfile
cd /tmp/localfile

# creating an key-pair for ec2 instance.

aws ec2 create-key-pair --key-name MyKeyPair --query 'KeyMaterial' --output text > MyKeyPair.pem

# moving the key-pair file to work diretory.
# cp MyKeyPair.pem /

