Feature: Developer creates post

  Scenario: Happy path
    Given I am a signed in developer
    And a tag exists
    When I click create TIL
    Then I see a form for TIL
    When I enter information into that form
    And I select a tag
    And I click submit
    Then I see the homepage
    And I see the post I created
    And I see the tag I selected
    When I click on my username in the upper right
    Then I see the post I created

  Scenario: Happy path with markdown inline code
    Given I am a signed in developer
    And a tag exists
    When I click create TIL
    Then I see a form for TIL
    When I enter information with markdown inline code into that form
    And I select a tag
    And I click submit
    Then I see the homepage
    And I see the markdown inline code I created

  Scenario: Happy path with markdown bullets
    Given I am a signed in developer
    And a tag exists
    When I click create TIL
    Then I see a form for TIL
    When I enter information with markdown bullets into that form
    And I select a tag
    And I click submit
    Then I see the homepage
    And I see the markdown bullets I created

  Scenario: Sad path (no post body)
    Given I am a signed in developer
    When I click create TIL
    Then I see a form for TIL
    When I click submit
    Then I see an error message "Body can't be blank"

  Scenario: Sad path (post body too long)
    Given I am a signed in developer
    When I click create TIL
    Then I see a form for TIL
    When I enter a long body into that form
    And I select no tag
    When I click submit
    Then I see an error message "Body is too long"

  Scenario: Sad path (no tag)
    Given I am a signed in developer
    When I click create TIL
    Then I see a form for TIL
    When I enter information into that form
    And I click submit
    Then I see an error message "Tag can't be blank"

  Scenario: Developer clicks cancel
    Given I am a signed in developer
    And a tag exists
    When I click create TIL
    Then I see a form for TIL
    When I click cancel
    Then I see the homepage
    And no post was created

  @javascript
  Scenario: Markdown preview
    Given I am a signed in developer
    And a tag exists
    When I click create TIL
    Then I see a form for TIL
    When I enter information with markdown inline code into that form
    Then I see a markdown preview with my rendered code

  @javascript
  Scenario: Developer sees updating word count
    Given I am a signed in developer
    And a tag exists
    When I click create TIL
    Then I see a form for TIL
    When I enter 10 words into that form
    Then I see a message saying I have 190 words left
    When I enter 50 words into that form
    Then I see a message saying I have 150 words left
    When I enter 199 words into that form
    Then I see a message saying I have 1 word left
    When I enter 300 words into that form
    Then I see a message saying I have -100 words left
