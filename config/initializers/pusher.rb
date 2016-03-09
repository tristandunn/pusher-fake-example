require 'pusher'
# Ensure it's only run in a development environment if it's a global file.
if Rails.env.development?
  # Ensure Pusher configuration is set if you're not doing so elsewhere.
  Pusher.app_id = "MY_TEST_ID"
  Pusher.key    = "MY_TEST_KEY"
  Pusher.secret = "MY_TEST_SECRET"

  # Require the base file, which immediately starts the socket and web servers.
  require "pusher-fake/support/base"

  PusherFake.configure do |configuration|
    # configuration.logger = Rails.logger
    # configuration.verbose = true
  end
end
