Feature: Applicaiton pages
  The various pages that serve no particular resource are tested here

  Scenario: Should get front page
    Given Nothing
    When I navigate to the front page 
    Then I am on the front page
    And the title says We Are Pivoting 

  Scenario: Should get login
    Given Nothing
    When I navigate to login
    Then I am on the login page
    And the title says Login 

