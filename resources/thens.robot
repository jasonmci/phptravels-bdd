*** Keywords ***
I see a My Bookings header
    Element should be present    h3:has-text("My Bookings")

I do not see a list of hotels
    Element should be present    //img[@alt="no results"]

I see a list of hotels in
    [Arguments]  ${place}
    Get element count   p.card-meta >> text=${place}  >  1 

I see the new hotel
    Go to           ${hotelspage}
    Element should be present   text=${fake-hotel-name}