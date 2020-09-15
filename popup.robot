*** Settings ***
Library   SeleniumLibrary

*** Variables ***
${URL}   https://rdserver.rd.go.th/publish/index.php

*** Test Case ***
Quiz
    เข้าหน้ายื่นภาษี
    เลือกเมนูยื่นแบบ online
    ทำการ download pdf
    ปิด popup

*** Keywords ***
ปิด popup
    Unselect Frame	
    Click Element   xpath://*[@id="lightboxdialog"]/button

ทำการ download pdf
    Wait Until Element Is Visible   xpath://*[@id="lightboxdialog"]/p/iframe
    Select Frame   xpath://*[@id="lightboxdialog"]/p/iframe
    Click Element   xpath:/html/body/p/table[3]/tbody/tr/td/a

เลือกเมนูยื่นแบบ online
    Click Element   xpath://*[@id="menuList"]/li[3]/a

เข้าหน้ายื่นภาษี
    Open Browser   url=${URL}  browser=chrome
    Maximize Browser Window