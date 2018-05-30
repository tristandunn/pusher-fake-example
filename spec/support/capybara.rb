require "capybara/poltergeist"

Capybara.register_driver :poltergeist do |app|
  Capybara::Poltergeist::Driver.new(app, url_whitelist: [])
end

Capybara.server = :webrick
Capybara.javascript_driver = :poltergeist
