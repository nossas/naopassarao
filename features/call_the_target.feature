Feature: call the target

  @javascript
  Scenario: when I fill the phone field right
    Given I go to "the share page"
    And I fill in "the phone number field" with "(21) 9 9999-9999"
    When I press "the call form submit button"
    Then I should be in "the homepage"
    And I should see "the share reveal"
    And I should see "the call successful message"

  @javascript
  Scenario: when I fill the phone field wrong
    Given I go to "the share page"
    And I fill in "the phone number field" with "9999-9999"
    When I press "the call form submit button"
    Then I should see "the phone field error message"
