*** Settings ***
Library   Browser
Resource  ../helper.robot

*** Test Cases ***
Adding a new hotel in a location without a hotel
   Given I have logged in as an admin role
   When I visit the add hotels page
   And I add a new hotel in    Seattle
   Then I see the new hotel 
    
