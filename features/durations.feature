@api @public
Feature: Durations

  Scenario: Get current user without date
    Given that the user "testpublic" is using api key "88144fc51182cfa77a6ddae039dab97a"
    And I send and accept JSON
    When I GET "/users/current/durations"
    Then I should get a response of 200
    And I should receive a json error with "Missing date." as the body

  Scenario: Get current user
    Given that the user "testpublic" is using api key "88144fc51182cfa77a6ddae039dab97a"
    And I send and accept JSON
    When I GET "/users/current/durations?date=2016-04-07"
    Then I should get a response of 200
    And I should receive a valid duration object
    And the JSON at "data" should have 3 entries
    And the JSON should be:
    """
    {
      "project":"project",
      "time":"1459226847.0",
      "duration": 10
    }
    """


  Scenario: Get specific user
    Given that the user "testpublic" is using api key "88144fc51182cfa77a6ddae039dab97a"
    And I send and accept JSON
    When I GET "/users/@testprivate/durations?date=2016-04-07"
    Then I should get a response of 200
    And I should receive a json error with "Forbidden" as the body

  Scenario: Get non-existing user
    Given that the user "testpublic" is using api key "88144fc51182cfa77a6ddae039dab97a"
    And I send and accept JSON
    When I GET "/users/@nothere/durations?date=2016-04-07"
    Then I should get a response of 200
    And I should receive a json error with "Not found" as the body

  Scenario: Get user without having privileges
    Given that the user "testpublic" is using api key "88144fc51182cfa77a6ddae039dab97a"
    And I send and accept JSON
    When I GET "/users/@testprivate/durations?date=2016-04-07"
    Then I should get a response of 200
    And I should receive a json error with "Forbidden" as the body
