#!/bin/bash
docker build -t loco25:v1 -f Dockerfile .
docker tag loco25:v1 rajksinghofficial/loco25:v1
docker push rajksinghofficial/loco25:v1
#docker run -d -p 8000:8000 rajksinghofficial/loco25:v1
