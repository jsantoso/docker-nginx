#!/bin/bash

docker login

docker pull nginx:stable

docker build -t jsantoso/nginx:latest .

docker push jsantoso/nginx:latest
