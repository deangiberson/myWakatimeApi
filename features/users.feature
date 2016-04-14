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
    Given that the user "testpublic" is using api key "88144fc51182cfa77a6ddae039dab97a"
    And I send and accept JSON
    When I GET "/users/current"
    Then I should get a response of 200
    And I should receive a valid user object
    And the user "username" should equal "testpublic"

  Scenario: Get specific user
    Given that the user "testpublic" is using api key "88144fc51182cfa77a6ddae039dab97a"
    And I send and accept JSON
    When I GET "/users/@testprivate"
    Then I should get a response of 200
    And I should receive a json error with "Forbidden" as the body

  Scenario: Get non-existing user
    Given that the user "testpublic" is using api key "88144fc51182cfa77a6ddae039dab97a"
    And I send and accept JSON
    When I GET "/users/@nothere"
    Then I should get a response of 200
    And I should receive a json error with "Not found" as the body

  Scenario: Get user without having privileges
    Given that the user "testpublic" is using api key "88144fc51182cfa77a6ddae039dab97a"
    And I send and accept JSON
    When I GET "/users/@testprivate"
    Then I should get a response of 200
    And I should receive a json error with "Forbidden" as the body
