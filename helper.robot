*** Settings ***
Resource    resources/givens.robot
Resource    resources/whens.robot
Resource    resources/thens.robot
Variables    resources/data.yml

*** Keywords ***
# Surprisingly not an obvious way to assert an element is present on the page
# Refactor to add an assertion. There may be a way to us native keywords but this
# is also a nice example of how easy it is to write new keywords

Element should be present
    [Documentation]  Verify there is exactly one match of the element
    [Arguments]  ${element-id}
    Get element count  ${element-id}  ==  1
