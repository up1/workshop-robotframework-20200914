*** Settings ***
Resource  ../common/library.robot

*** Keywords ***
Check success message
    Wait Until Page Contains    Thank you!