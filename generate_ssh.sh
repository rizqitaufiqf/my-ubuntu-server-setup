#!/bin/bash

# generate ssh
ssh-keygen -t rsa -b 2048 -m PEM

#generate pem file
openssl rsa -in id_rsa -outform pem > id_rsa.pem

#copy id_rsa.pub to authorized_key
cat id_rsa.pub > authorized_key

#copy id_rsa.pem to your pc
