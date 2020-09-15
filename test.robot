*** Settings ***
Library   hello.py

*** Test Cases ***
Use hello
    ${out}=  Say Hi
    Log To Console   ${out}