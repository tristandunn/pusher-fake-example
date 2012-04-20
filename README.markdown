# pusher-fake-example

An example of using [pusher-fake](https://github.com/tristandunn/pusher-fake) with Cucumber to test a Rails application.

## How-To

### 1. Set Pusher's WebSocket host and port to PusherFake in your JavaScript.

```erb
<script>
<% if defined?(PusherFake) %>
  Pusher.host    = <%== PusherFake.configuration.socket_host.to_json %>;
  Pusher.ws_port = <%== PusherFake.configuration.socket_port.to_json %>;
<% end %>
</script>
```

### 2. Configure Pusher and PusherFake in your Cucumber environment.

```ruby
# Use the same API key and secret as the live version.
PusherFake.configure do |configuration|
  configuration.app_id = Pusher.app_id
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
```

### 3. Enjoy testing your Pusher application!

## License

pusher-fake-example uses the MIT license. See LICENSE for more details.
