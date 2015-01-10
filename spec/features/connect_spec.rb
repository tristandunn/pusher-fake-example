require "rails_helper"

feature "Users connecting to a channel" do
  before do
    connect
  end

  scenario "connecting as the only user", js: true do
    expect(page).to_not have_content("A user joined.")
  end

  scenario "connecting with other users", js: true do
    connect_as "Bob"

    expect(page).to have_content("A user joined.")

    using_session("Bob") do
      expect(page).to_not have_content("A user joined.")
    end
  end
end
