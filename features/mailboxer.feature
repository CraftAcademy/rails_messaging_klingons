Feature: Test of mailboxers functionality
  As a user
  In order to communicate
  I should be send, recieve and manage my messages and conversations

  Background:
    Given The following users exist
      |name   |password   |email            |
      |Kalle  |passord123 |norge@test.no    |
      |Holger |passord123 |sverige@test.se  |
    And Kalle have sent an message to Holger
    And I am logged in as 'Holger'
    And I am on the inbox page
    Then I should see 'Heia Norge' on my screen
    When I click the 'View' link
    Then I should see 'Heia Northug' on my screen


  Scenario: Holger recieves a message from Kalle and replies
    Given I type in 'Heja Carlson' in field for 'message_body'
    When I click the 'Reply' button
    Then I should see 'Your reply message was successfully sent!' on my screen

  @javascript
  Scenario: Holger recieves a message from Kalle and deletes it
    Given I click the 'Move to trash' link
    And I accept the alert
    When I click the 'Trash' link
    Then I should see 'Heia Northug' on my screen

  @javascript
  Scenario: Holger recieves a message from Kalle and deletes it and then untrash it.
    Given I click the 'Move to trash' link
    And I accept the alert
    When I click the 'Trash' link
    Then I should see 'Heia Northug' on my screen
    When I click the 'View' link
    And I click the 'Untrash' link
    Then I should see 'Heia Northug' on my screen

  Scenario: Holger logs out successfully
    Given I click the 'Logout' link
    Then I should see 'Signed out successfully.' on my screen

  Scenario: Kalle sends a message to Holger
    Given I am logged in as 'Kalle'
    And I am on the inbox page
    When I click the 'Compose' link
    And I select 'Holger' as 'Recipients'
    And I type in 'Heia Norge' in field for 'Subject'
    And I type in 'Heia Northug' in field for 'Message'
    And I click the 'Send Message' button
    Then I should see 'Your message was successfully sent!' on my screen