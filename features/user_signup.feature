Feature: User can sign up
  As a user,
  in order to be able to use the service,
  I want to be able to sign up.

  Background:
    Given the following user exists
    | name  |  email    | password    | password_confirmation |
    | Jade  | jf@ca.com | password123 | password123           |

  Scenario: User creates an account
    Given I am on the Sign up page
    When I fill in "Name" with "Holger"
    And I fill in "Email" with "hacker@holger.com"
    And I fill in "Password" with "password12"
    And I fill in "Password confirmation" with "password12"
    And I click "Create"
    Then I should see the message "Welcome! You have signed up successfully."

  Scenario: User did not enter all fields
    Given I am on the landing page
    When I click "Sign up"
    And I fill in "Password" with "password1"
    And I fill in "Password confirmation" with "password1"
    And I click "Create"
    Then I should see the message "Name can't be blank"

  Scenario: User did not enter both password fields
    Given I am on the landing page
    When I click "Sign up"
    And I fill in "Name" with "Holger"
    And I fill in "Password confirmation" with "password1"
    And I click "Create"
    Then I should see the message "Password confirmation doesn't match"
