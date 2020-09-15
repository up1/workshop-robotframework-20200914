*** Settings ***
Library   SeleniumLibrary
Test Teardown   Close Browser

*** Test Cases ***
Demo
    Open Browser  url=http://www.google.com   browser=gc
    ...   remote_url=http://localhost:4444/wd/hub

    Wait Until Page Contains  dfsdfsdfsdfsdfsdf
    