# Use the same API key and secret as the live version.
PusherFake.configure do |configuration|
  configuration.key    = Pusher.key
  configuration.secret = Pusher.secret
end

# Set the host and port to the fake web server.
Pusher.host = PusherFake.configuration.web_host
Pusher.port = PusherFake.configuration.web_port

# Start the fake web server.
Thread.new { PusherFake::Server.start }.tap do |thread|
  at_exit { thread.exit }
end

# Reset channels between scenarios.
After do
  PusherFake::Channel.reset
end
