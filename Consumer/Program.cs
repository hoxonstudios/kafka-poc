using Confluent.Kafka;

var configuration = new KeyValuePair<string, string>[] {
  new KeyValuePair<string, string>("bootstrap.servers", "localhost:9092"),
  new KeyValuePair<string, string>("group.id", "kafka-poc"),
  new KeyValuePair<string, string>("auto.offset.reset", "earliest")
};

CancellationTokenSource cts = new CancellationTokenSource();
Console.CancelKeyPress += (_, e) =>
{
  e.Cancel = true;
  cts.Cancel();
};

const String TOPIC = "testing-topic";

using (var consumer = new ConsumerBuilder<string, string>(configuration).Build())
{
  consumer.Subscribe(TOPIC);
  try
  {
    while (true)
    {
      var cr = consumer.Consume(cts.Token);
      Console.WriteLine($"Consumed event from topic {TOPIC} with key {cr.Message.Key,-10} and value {cr.Message.Value}");
    }
  }
  catch (OperationCanceledException)
  {
    Console.WriteLine("Closing...");
  }
  finally
  {
    consumer.Close();
  }
}