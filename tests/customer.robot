*** Settings ***
Library   Browser
Resource  ../helper.robot

*** Test Cases ***
Logging in for the first time
   Given I have logged in as a non-admin role
   When I view my bookings
   Then I see a My Bookings header
    
Searching for hotels
    Given I have logged in as a non-admin role
    And I visit hotels
    And I search for a hotel in     Dubai
    Then I see a list of hotels in  Dubai

Searching for hotels where there are no hotels
    Given I have logged in as a non-admin role
    And I visit hotels
    And I search for a hotel in             Seattle
    Then I do not see a list of hotels
