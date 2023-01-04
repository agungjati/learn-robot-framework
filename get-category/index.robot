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
    
    Click Element  data:testid:headerText
    Sleep  5 seconds
    
    Wait Until Element Is Visible  data:testid:allCategories  30 seconds
    ${elements} =    Get WebElements  css=div[data-testid="allCategories"] a

    Make Excel File   NewExcel.xlsx   
   
    ${index}  Set Variable  ${1}
    FOR    ${element}    IN    @{elements}
        Log  ${element.text}
        Add Value  NewExcel.xlsx  A${index}  ${element.text}
        ${index}  Set Variable  ${${index} + ${1}}
        Log  ${index}
    END