Feature: Visitor views statistics

  @javascript
  Scenario: Visitors views statistics
    Given I am a visitor
    And a post exists for each of the last 35 days
    When I visit the statistics page
    Then I see statistics
