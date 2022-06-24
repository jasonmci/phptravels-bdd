*** Keywords ***

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