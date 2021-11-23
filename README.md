# Kafka POC

## Shell commands
```
sh SCRIPT [OPTIONS]
```

| Script | Description |
| ------ | ----------- |
| `kafka-install.sh` | Setup Docker Swarm with Kafka and Zookeeper |
| `kafka-uninstall.sh` | Leave Docker Swarm |
| [`topic-create.sh`](#topic-create) | Create Kafka topic |
| `topic-list.sh` | List Kafka topics |

---

## topic-create
Create Kafka topic
```
sh topic-create.sh TOPIC_NAME
```