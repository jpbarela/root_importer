Feature:
  As a developer
  In order to

  Scenario:
    When I import the file 'sample.txt'
    Then I see a listing of the drivers

  Scenario:
    When I import the file 'sample.txt'
    Then I see the trip statistics for each driver

  Scenario:
    When I import the file 'sample.txt'
    Then I see the drivers sorted by distance

  Scenario:
    When I import the file 'excluded.txt'
    Then I see invalid trips excluded