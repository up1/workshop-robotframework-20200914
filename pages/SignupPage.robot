*** Settings ***
Resource  ../common/library.robot

*** Keywords ***
Open page
    Go TO   https://www.kimschiller.com/page-object-pattern-tutorial/

Fill in name
    [Arguments]  ${fname}   ${lname}
    Input Text  id:firstname   ${fname}
    Input Text  id:lastname   ${lname}

Fill in address
    [Arguments]  ${address}
    Input Text  id:address   ${address}

Fill in zipcode
    [Arguments]  ${zipcode}
    Input Text  id:zipcode   ${zipcode}

Submit
    Click Element  id:signup