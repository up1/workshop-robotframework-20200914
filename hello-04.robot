*** Settings ***
Resource   stackoverflow/share.robot
Suite Setup      Open stackoverflow in browser
Suite Teardown   Close Browser
# Test Teardown    Back to home page
# Test Template    Search "${keyword}" from stackoverflow.com should found ${expected_result} results
# Test Template    Search from stackoverflow.com

*** Test Cases ***
Search 1
    [Template]   Search from stackoverflow.com
    robotframework     500
    swpark             0

Search 2
    [Template]   Search "${keyword}" from stackoverflow.com should found ${expected_result} results
    robotframework     500
    swpark             0

*** Keywords ***
Search from stackoverflow.com
    [Arguments]   ${keyword}   ${expected_result}
    Search    ${keyword}
    Search result should have ${expected_result} results
    Back to home page

Search "${keyword}" from stackoverflow.com should found ${expected_result} results
    Search    ${keyword}
    Search result should have ${expected_result} results