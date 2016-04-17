@api @public
Feature: Durations

  Scenario: Get current user without date
    Given that the user "testpublic" is using api key "88144fc51182cfa77a6ddae039dab97a"
    And I send and accept JSON
    When I GET "/users/current/durations"
    Then I should get a response of 200
    And I should receive a JSON error with "Missing date." as the body

  Scenario: Get current user
    Given that the user "testpublic" is using api key "88144fc51182cfa77a6ddae039dab97a"
    And I send and accept JSON
    When I GET "/users/current/durations?date=2016-03-28"
    Then I should get a response of 200
    And I should receive a valid duration object
    And the JSON at "data" should have 3 entries

  Scenario: Get current user
    Given that the user "testpublic" is using api key "88144fc51182cfa77a6ddae039dab97a"
    And I send and accept JSON
    When I GET "/users/current/durations?date=2016-03-29"
    Then I should get a response of 200
    And I should receive a valid duration object
    And the JSON at "data" should have 1 entries

  Scenario: Get specific user
    Given that the user "testpublic" is using api key "88144fc51182cfa77a6ddae039dab97a"
    And I send and accept JSON
    When I GET "/users/@testprivate/durations?date=2016-03-28"
    Then I should get a response of 200
    And I should receive a JSON error with "Forbidden" as the body

  Scenario: Get specific user
    Given that the user "testpublic" is using api key "88144fc51182cfa77a6ddae039dab97a"
    And I send and accept JSON
    When I GET "/users/@testpublic/durations?date=2016-03.28"
    Then I should get a response of 200
    And I should receive a JSON error with "Invalid date." as the body

  Scenario: Get non-existing user
    Given that the user "testpublic" is using api key "88144fc51182cfa77a6ddae039dab97a"
    And I send and accept JSON
    When I GET "/users/@nothere/durations?date=2016-03-28"
    Then I should get a response of 200
    And I should receive a JSON error with "Not found" as the body

  Scenario: Get user without having privileges
    Given that the user "testpublic" is using api key "88144fc51182cfa77a6ddae039dab97a"
    And I send and accept JSON
    When I GET "/users/@testprivate/durations?date=2016-03-28"
    Then I should get a response of 200
    And I should receive a JSON error with "Forbidden" as the body
