*** Settings ***
Library    SeleniumLibrary
Suite Setup      Open stackoverflow in browser
Suite Teardown   Close Browser
Test Teardown    Back to home page
# Test Template    Search "${keyword}" from stackoverflow.com should found ${expected_result} results
Test Template    Search from stackoverflow.com

*** Variables ***
${BROWSER}    chrome
${URL}        https://stackoverflow.com/

*** Test Cases ***
# Test name      Keyword          Expected result
Max result     robotframework     500
Not found      swpark             0

*** Keywords ***
Search from stackoverflow.com
    [Arguments]   ${keyword}   ${expected_result}
    Search    ${keyword}
    Search result should have ${expected_result} results

Search "${keyword}" from stackoverflow.com should found ${expected_result} results
    Search    ${keyword}
    Search result should have ${expected_result} results

Search "${keyword}"
    Input Text  locator=name:q  text=${keyword}
    Press Keys  name:q  RETURN

Search
    [Arguments]  ${keyword}
    Input Text  locator=name:q  text=${keyword}
    Press Keys  name:q  RETURN

Search result should have ${result_count} results
    SeleniumLibrary.Wait Until Element Contains    xpath://*[@id="mainbar"]/div[3]/div[1]
    ...  ${result_count}${SPACE}results
    ${s}=  SeleniumLibrary.Get Text  xpath://*[@id="mainbar"]/div[3]/div[1]
    BuiltIn.Log to console  ${s}

Open stackoverflow in browser
    Open Browser   url=${URL}  browser=${BROWSER}
    # Set Window Size   1800   800
    Maximize Browser Window

Back to home page
    Go To   ${URL}