*** Settings ***
Library   Browser

*** Variables ***
${browser}=    firefox
${headless}=   ${False}
${URL}=        https://playwright.dev

*** Test Cases ***
Example Test  
    Set Browser Timeout     60 seconds
    Open Browser   browser=${browser}   headless=${headless}   url=${URL}
    Get Text    h1    ==    Playwright enables reliable end-to-end testing for modern web apps.
    Take screenshot     fullPage=True    fileType=jpeg    quality=50    timeout=10s