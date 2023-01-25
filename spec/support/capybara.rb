require "capybara"

Capybara.server = :webrick
Capybara.javascript_driver = :selenium_chrome_headless

# Ignore deprecation warning.
Selenium::WebDriver.logger.ignore(:capabilities)
