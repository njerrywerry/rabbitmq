require 'bunny'

# connect to RabbitMQ server
conn = Bunny.new
conn.start
# create a channel
ch = conn.create_channel
# declare queue to send to then publish message to queue
q = ch.queue("hello")
ch.default_exchange.publish("Hello World! I'm awesome.", :routing_key => q.name)
puts "[x] sent 'hello world!'"
# close connection
conn.close
