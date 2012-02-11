When %{a "$event" event is triggered on the "$channel" channel with:} do |event, channel, table|
  Pusher[channel].trigger(event, table.hashes.first)
end
