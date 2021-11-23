#!/bin/bash
docker exec -t $(docker ps -q -f name=kafka) kafka-topics \
  --create \
  --topic $1 \
  --bootstrap-server localhost:9092 \
  --replication-factor 1 \
  --partitions 1