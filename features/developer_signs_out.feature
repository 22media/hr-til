Feature: Developer signs out

  Scenario: Developer signs out
    Given I am a signed in developer
    And I click sign out
    Then I should not see my username in the upper right
    And I see the signup link
    And I see the signin link
    And I do not see the signout link
