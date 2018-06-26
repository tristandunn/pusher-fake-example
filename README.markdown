# pusher-fake-example [![Build Status](https://travis-ci.org/tristandunn/pusher-fake-example.svg?branch=master)](https://travis-ci.org/tristandunn/pusher-fake-example)

An example of using [pusher-fake](https://github.com/tristandunn/pusher-fake) with RSpec to test a Rails application.

## How-To

#### 1. Use the PusherFake JS for the Pusher JS instance.

```erb
<script>
  <% if defined?(PusherFake) %>
    // Test environment.
    //
    // Note: Ensure output is not HTML escaped, such as with the raw helper in Rails.
    var instance = <%= PusherFake.javascript %>;
  <% else %>
    // Other environments, such as production.
    var instance = new Pusher(...);
  <% end %>
</script>
```

#### 2. Configure and start PusherFake in your RSpec environment.

```ruby
require "pusher-fake/support/rspec"
```

#### 3. Enjoy testing your Pusher application!

## License

pusher-fake-example uses the MIT license. See LICENSE for more details.
