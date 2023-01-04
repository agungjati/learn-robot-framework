*** Settings ***
Library   SeleniumLibrary
Library  make_excel.py
Library  AutoRecorder

*** Variables ***
${browser}=     Chrome
${headless}=   ${False}
${URL}=        https://www.tokopedia.com/

*** Test Cases ***
Example Test      

    Open Browser   browser=${browser}   url=${URL}
    Maximize Browser Window
    Sleep  5s
    Make Excel File   NewExcel.xlsx   
    ${elements}=    Get WebElements  css=\#trending-popular-keywords a
    Sleep  5s

    ${index}  Set Variable  ${1}
    FOR    ${element}    IN    @{elements}
        Log  ${element.text}
        Add Value  NewExcel.xlsx  A${index}  ${element.text}
        ${index}  Set Variable  ${${index} + ${1}}
        Log  ${index}
    END

