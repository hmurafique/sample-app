#!/bin/bash

cd /home/ubuntu/sample-app

git pull origin main

docker stop sample-app || true
docker rm sample-app || true
docker build -t sample-app:latest .
docker run -d -p 80:80 --name sample-app sample-app:latest
