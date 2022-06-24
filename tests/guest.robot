*** Settings ***
Library   Browser

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

*** Keywords ***

I have logged in as a non-admin role
    New Page    https://www.phptravels.net/login
    Fill text   //input[@placeholder="Email"]   user@phptravels.com
    Fill text   //input[@placeholder="Password"]    demouser
    Click       button:has-text("Login")

I view my bookings
    Click       text=My Bookings >> nth=1

I visit hotels
    Click       nav >> text=Hotels

I search for a hotel in 
    [Arguments]     ${place}
    Click           span[role="textbox"]:has-text("Search by City")
    Fill text       input[role="searchbox"]   ${place}
    Click           li.select2-results__option >> text=${place}
    Click           button:has-text("Search")

I see a My Bookings header
    Element should be present    h3:has-text("My Bookings")

I do not see a list of hotels
    Element should be present    //img[@alt="no results"]

I see a list of hotels in
    [Arguments]  ${place}
    Get element count   p.card-meta >> text=${place}  >  1 

# Surprisingly not an obvious way to assert an element is present on the page
# Refactor to add an assertion. There may be a way to us native keywords but this
# is also a nice example of how easy it is to write new keywords

Element should be present
    [Documentation]  Verify there is exactly one match of the element
    [Arguments]  ${element-id}
    Get element count  ${element-id}  ==  1
