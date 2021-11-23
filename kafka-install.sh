#!/bin/bash
docker swarm init
# ZOOKEEPER
docker service create \
  --name zookeeper \
  --network host \
  --env ZOOKEEPER_CLIENT_PORT=2181 \
  --env ZOOKEEPER_TICK_TIME=2000 \
  confluentinc/cp-zookeeper:6.2.0
# KAFKA
docker service create \
  --name kafka \
  --network host \
  --env KAFKA_BROKER_ID=1 \
  --env KAFKA_ZOOKEEPER_CONNECT="localhost:2181" \
  --env KAFKA_LISTENER_SECURITY_PROTOCOL_MAP="PLAINTEXT:PLAINTEXT, PLAINTEXT_INTERNAL:PLAINTEXT" \
  --env KAFKA_ADVERTISED_LISTENERS="PLAINTEXT://localhost:9092,PLAINTEXT_INTERNAL://broker:29092" \
  --env KAFKA_OFFSETS_TOPIC_REPLICATION_FACTOR=1 \
  --env KAFKA_TRANSACTION_STATE_LOG_MIN_ISR=1 \
  --env KAFKA_TRANSACTION_STATE_LOG_REPLICATION_FACTOR=1 \
  confluentinc/cp-kafka:6.2.0