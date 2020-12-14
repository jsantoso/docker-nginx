#!/bin/bash

docker login

docker build -t jsantoso/nginx:latest .

docker push jsantoso/nginx:latest
