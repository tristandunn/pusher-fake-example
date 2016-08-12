require "zeus/rails"

class PusherPlan < Zeus::Rails
  def test_environment
    super

    # Use the same API key and secret as the live version.
    PusherFake.configure do |configuration|
      configuration.app_id = Pusher.app_id
      configuration.key    = Pusher.key
      configuration.secret = Pusher.secret
    end

    # Set the host and port to the fake web server.
    PusherFake.configuration.web_options.tap do |options|
      Pusher.host = options[:host]
      Pusher.port = options[:port]
    end

    # Start the fake socket and web servers, but don't kill the server at_exit.
    fork { PusherFake::Server.start }
  end
end

Zeus.plan = PusherPlan.new
