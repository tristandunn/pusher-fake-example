Given "I am connected" do
  step %{I am on the homepage}
  step %{I should be connected}
end

Given %{$name is connected} do |name|
  using_session(name) do
    step %{I am connected}
  end
end

Then "I should be connected" do
  Timeout.timeout(5) do
    state = nil

    until state == "connected"
      state = page.evaluate_script("Pusher.instance.connection.state")
    end
  end
end
