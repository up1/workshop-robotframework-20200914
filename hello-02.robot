*** Settings ***
Library    SeleniumLibrary
Suite Setup      Open stackoverflow in browser
Suite Teardown   Close Browser
Test Teardown    Back to home page

*** Variables ***
${BROWSER}    chrome
${URL}        https://stackoverflow.com/

*** Test Cases ***
Search robotframework in stackoverflow.com
    [Tags]  done  sprint01
    Search    robotframework
    Search result should have 500 results

Search swpark in stackoverflow.com
    [Tags]  testing  sprint02
    Search "swpark"
    Search result should have 0 results

*** Keywords ***
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