#!/bin/bash
docker exec -t $(docker ps -q -f name=kafka) kafka-topics --list --zookeeper localhost:2181