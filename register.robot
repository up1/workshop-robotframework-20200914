*** Settings ***
Resource   pages/SignupPage.robot
Resource   pages/ThankyouPage.robot
Test Teardown    Close Browser

*** Test cases ***
Register success
    Open register page
    Fill in data
    Submit register page
    Should show thank you page

*** Keywords ***
Open register page
    Open Browser    browser=chrome
    Maximize Browser Window
    SignupPage.Open page

Fill in data
    SignupPage.Fill in name   somkiat   pui
    SignupPage.Fill in address   my address 
    SignupPage.Fill in zipcode   10400

Submit register page
    SignupPage.Submit

Should show thank you page
    ThankyouPage.Check success message