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

I visit the add hotels page
    Go to           ${hotelspage}

I add a new hotel in
    [Arguments]           ${place}
    Click                 text=add Add
    ${fake-hotel-name} =  Set test variable   FakerLibrary.Words                    nb=${4}
    Fill text             input[name="hotelname"]               ${place} ${fake-hotel-name}
    Click                 text=Enter Location
    Fill text             \#select2-drop input[type="text"]     ${place}
    Click                 text=${place}
    Click                 text=save Submit

