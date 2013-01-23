# pusher-fake-example [![Build Status](https://secure.travis-ci.org/tristandunn/pusher-fake-example.png?branch=master)](http://travis-ci.org/tristandunn/pusher-fake-example) [![Dependency Status](https://gemnasium.com/tristandunn/pusher-fake-example.png)](https://gemnasium.com/tristandunn/pusher-fake-example)


An example of using [pusher-fake](https://github.com/tristandunn/pusher-fake) with Cucumber to test a Rails application.

## How-To

### 1. Configure the Pusher JS client to use the PusherFake server in your JavaScript.

```erb
<script>
  <%== PusherFake.javascript if defined?(PusherFake) %>
</script>
```

### 2. Configure and start PusherFake in your Cucumber environment.

```ruby
require "pusher-fake/cucumber"
```

### 3. Enjoy testing your Pusher application!

## License

pusher-fake-example uses the MIT license. See LICENSE for more details.
