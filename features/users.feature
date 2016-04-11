@api
Feature: Users
  Through the api:
    Logged in users access there own account information
    Logged in users access other peoples public account information
    Logged in users cannot access other peoples non-public account information
    Logged in users access other team members non-public team information
    Not logged in users can access other peoples public account information
    Not logged in users can not access other peoples non-public account information

  Scenario: Get current user
    Given that the user @testpublic is logged in
    When I visit "/user/current"
    Then I should receive a valid user object
    And the user.username should equal testpublic

  Scenario: Get specific user
    Given that the user @testpublic is logged in
    When I visit "/user/@testprivate"
    Then I should receive a valid user object
    And the user.username should equal testprivate

  Scenario: Get non-existing user
    Given that the user @testpublic is logged in
    When I visit "/user/@nothere"
    Then I should a json error with "Not found" as the body

  Scenario: Get user without having privileges
    Given that the user @testpublic is logged in
    When I visit "/user/@testprivate"
    Then I should a json error with "Forbidden" as the body
