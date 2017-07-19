Feature: Static pages
	The various pages meant for displaying logistic information are tested here 
  for their links and such.

  Scenario: Should get home
    Given Nothing
    When I navigate to the home page
    Then I am on the home page
    And the title says home

  Scenario: Should get help
    Given Nothing
    When I navigate to the help page
    Then I am on the help page
    And the title says home

  Scenario: Should get about
    Given Nothing
    When I navigate to the about page
    Then I am on the about page
    And the title says about
