*** Settings ***
Library   Browser
Resource  ../helper.robot

*** Test Cases ***
Adding a new hotel in a location without a hotel
   Given I have logged in as an admin role
   When I view my bookings
   Then I see a My Bookings header
    
