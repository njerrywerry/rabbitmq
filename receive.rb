require 'bunny'

# connect to RabbitMQ server
conn = Bunny.new
conn.start
# create a channel
ch = conn.create_channel
# declare queue to send to then publish message to queue
q = ch.queue("hello")
# tell the server to deliver messages from the queue
puts " [*] Waiting for messages in #{q.name}. To exit press CTRL+C"
q.subscribe(:block => true) do |delivery_info, properties, body|
  puts " [x] Received #{body}"

  # cancel the consumer to exit
  delivery_info.consumer.cancel
end
