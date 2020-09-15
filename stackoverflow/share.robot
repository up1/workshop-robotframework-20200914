*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BROWSER}    chrome
${URL}        https://stackoverflow.com/

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