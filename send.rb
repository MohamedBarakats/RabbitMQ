#!/usr/bin/env ruby
require 'bunny'
connection = Bunny.new(automatically_recover: false)
connection.start
channel = connection.create_channel
queue = channel.queue('hello')
message = "Message Number"
for i in 1..500 do
  channel.default_exchange.publish("#{message} #{i}", routing_key: queue.name)
  puts " [Barakat] Sent 'Hello World!'"
end
connection.close