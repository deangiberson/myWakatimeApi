@api @public
Feature: Stats

  Scenario: Get current user stats
    Given that the user "testpublic" is using api key "88144fc51182cfa77a6ddae039dab97a"
    And I send and accept JSON
    When I GET "/users/current/stats"
    Then I should get a response of 200
    And I should receive a valid stats object
    And the JSON should have the following:
    | data/days_including_holidays |     7 |
    | data/days_minus_holidays     |     4 |
    | data/editors/0/name          | Emacs |
    | data/timeout                 |    15 |

  Scenario: Get current user stats with timeout of 8
    Given that the user "testpublic" is using api key "88144fc51182cfa77a6ddae039dab97a"
    And I send and accept JSON
    When I GET "/users/current/stats?timeout=8"
    Then I should get a response of 200
    And I should receive a valid stats object
    And the JSON should have the following:
    | data/days_including_holidays |     7 |
    | data/days_minus_holidays     |     4 |
    | data/editors/0/name          | Emacs |
    | data/timeout                 |     8 |

  Scenario: Get current user stats
    Given that the user "testpublic" is using api key "88144fc51182cfa77a6ddae039dab97a"
    And I send and accept JSON
    When I GET "/users/current/stats?project=project1"
    Then I should get a response of 200
    And I should receive a valid stats object
    And the JSON should have the following:
    | data/days_including_holidays |     7 |
    | data/days_minus_holidays     |     4 |
    | data/editors/0/name          | Emacs |
    | data/timeout                 |    15 |

  Scenario: Get current user stats for last 7 days
    Given that the user "testpublic" is using api key "88144fc51182cfa77a6ddae039dab97a"
    And I send and accept JSON
    When I GET "/users/current/stats/last_7_days"
    Then I should get a response of 200
    And I should receive a valid stats object
    And the JSON should have the following:
    | data/days_including_holidays |     7 |
    | data/days_minus_holidays     |     4 |
    | data/editors/0/name          | Emacs |

  Scenario: Get current user stats for last 30 days
    Given that the user "testpublic" is using api key "88144fc51182cfa77a6ddae039dab97a"
    And I send and accept JSON
    When I GET "/users/current/stats/last_30_days"
    Then I should get a response of 200
    And I should receive a valid stats object
    And the JSON should have the following:
    | data/days_including_holidays |     7 |
    | data/days_minus_holidays     |     4 |
    | data/editors/0/name          | Emacs |

  Scenario: Get current user stats for last 6 months
    Given that the user "testpublic" is using api key "88144fc51182cfa77a6ddae039dab97a"
    And I send and accept JSON
    When I GET "/users/current/stats/last_6_months"
    Then I should get a response of 200
    And I should receive a valid stats object
    And the JSON should have the following:
    | data/days_including_holidays |     7 |
    | data/days_minus_holidays     |     4 |
    | data/editors/0/name          | Emacs |

  Scenario: Get current user stats for last year
    Given that the user "testpublic" is using api key "88144fc51182cfa77a6ddae039dab97a"
    And I send and accept JSON
    When I GET "/users/current/stats/last_year"
    Then I should get a response of 200
    And I should receive a valid stats object
    And the JSON should have the following:
    | data/days_including_holidays |     7 |
    | data/days_minus_holidays     |     4 |
    | data/editors/0/name          | Emacs |

  Scenario: Get current user stats for all time
    Given that the user "testpublic" is using api key "88144fc51182cfa77a6ddae039dab97a"
    And I send and accept JSON
    When I GET "/users/current/stats/all_time"
    Then I should get a response of 200
    And I should receive a valid stats object
    And the JSON should have the following:
    | data/days_including_holidays |     7 |
    | data/days_minus_holidays     |     4 |
    | data/editors/0/name          | Emacs |
