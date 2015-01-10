require "rails_helper"

feature "Server triggering a message" do
  before do
    connect
    connect_as "Bob"
  end

  scenario "triggers a message on the chat channel", js: true do
    trigger "chat", "message", body: "Hello, world!"

    expect(page).to have_content("Hello, world!")

    using_session("Bob") do
      expect(page).to have_content("Hello, world!")
    end
  end

  protected

  def trigger(channel, event, data)
    Pusher.trigger(channel, event, data)
  end
end
