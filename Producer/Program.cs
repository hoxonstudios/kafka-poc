using Confluent.Kafka;

var configuration = new KeyValuePair<string, string>[] {
  new KeyValuePair<string, string>("bootstrap.servers", "localhost:9092")
};

const String TOPIC = "testing-topic";

using (var producer = new ProducerBuilder<string, string>(
    configuration).Build())
{
  await producer.ProduceAsync(TOPIC, new Message<string, string>
  {
    Key = "1",
    Value = "Hello Kafka!"
  });

  producer.Flush();
}