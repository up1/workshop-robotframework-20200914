*** Settings ***
Library   SeleniumLibrary
# Test Teardown   Close Browser

*** Test Cases ***
Upload 3 files
    Open upload page
    Choose first file and check
    Choose second file and check
    Choose third file and check
    Upload first file should be success
    Upload second file should be success
    Upload third file should be success

*** Keywords ***
Upload first file should be success
    Click Element    xpath://*[@id="ng-app"]/body/div/div[2]/div[2]/table/tbody/tr[1]/td[5]/button[1]
    Wait Until Page Contains Element   xpath://div[@style="width: 33%;"]

Upload second file should be success
    Click Element    xpath://*[@id="ng-app"]/body/div/div[2]/div[2]/table/tbody/tr[2]/td[5]/button[1]
    Wait Until Page Contains Element   xpath://div[@style="width: 67%;"]

Upload third file should be success
    Click Element    xpath://*[@id="ng-app"]/body/div/div[2]/div[2]/table/tbody/tr[3]/td[5]/button[1]
    Wait Until Page Contains Element   xpath://div[@style="width: 100%;"]


Choose first file and check
    Choose File	 //*[@id="ng-app"]/body/div/div[2]/div[1]/input[2]	
    ...  ${CURDIR}/datas/image-01.png

Choose second file and check
    Choose File	 //*[@id="ng-app"]/body/div/div[2]/div[1]/input[2]	
    ...  ${CURDIR}/datas/image-02.png

Choose third file and check
    Choose File	 //*[@id="ng-app"]/body/div/div[2]/div[1]/input[2]	
    ...  ${CURDIR}/datas/image-03.png

Open upload page
    Open Browser   http://nervgh.github.io/pages/angular-file-upload/examples/simple/
    ...   browser=chrome
    Maximize Browser Window
    Upload all button should be disabled

Upload all button should be disabled
    Wait Until Element Is Visible    xpath://*[@id="ng-app"]/body/div/div[2]/div[2]/div/button[1]
    Element Should Be Disabled   xpath://*[@id="ng-app"]/body/div/div[2]/div[2]/div/button[1]
    