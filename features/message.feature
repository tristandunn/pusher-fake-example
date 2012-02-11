@javascript
Feature: Server triggers a message

  Scenario: Server triggers a message on the chat channel
    Given I am connected
    And Bob is connected
    When a "message" event is triggered on the "chat" channel with:
      | body          |
      | Hello, world! |
    Then I should see "Hello, world!"
    And Bob should see "Hello, world!"
