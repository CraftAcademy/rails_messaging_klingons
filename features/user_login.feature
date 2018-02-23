Feature: User can login
  As a user,
  in order to access my account,
  I would like to be able to login.

  Background:
    Given the following user exists
    | name  |  email    |  password    | password_confirmation |
    | Jade  | jf@ca.com |  password123 | password123           |
    And I am on the Login page

  Scenario: User logs in to account
    Given I fill in "Email" with "jf@ca.com"
    When I fill in "Password" with "password123"
    And I click "Log in"
    Then I should see the message "Signed in successfully."

  Scenario: User did not enter all fields
    Given I fill in "Password" with "password123"
    When I click "Log in"
    Then I should see the message "Invalid Email or password."

  Scenario: User's credentials do not exist in the database
    Given I fill in "Email" with "Holger@hacker.com"
    When I fill in "Password" with "password1"
    And I click "Log in"
    Then I should see the message "Invalid Email or password."
