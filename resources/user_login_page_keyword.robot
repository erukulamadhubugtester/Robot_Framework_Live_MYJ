*** Settings ***
Library    SeleniumLibrary
Library    ../libraries/HighlightLibrary.py
Library    DebugLibrary
Library    Collections
Resource   ../resources/locators.robot
Resource   variables.robot


*** Keywords ***
# 0. Home Page
Open Landing Page
    Open Browser    ${BASE_URL}    ${BROWSER}
    Maximize Browser Window

Verify Login Button Is Displayed
    Highlight Element    ${LOGIN_LINK}
    Page Should Contain Element    ${LOGIN_LINK}
    Element Text Should Be         ${LOGIN_LINK}    Login

# 1. Login User Home Page
Verify Login User login Page
    
    Highlight Element    ${LOGIN_LINK}
    Click Element        ${LOGIN_LINK}

    Sleep    3
    
    Input Text           ${PHONE_INPUT}    ${PHONE_NUMBER}
    Highlight Element    ${PHONE_INPUT}
    Input Text           ${PASSWORD_INPUT}    ${PASSWORD}
    Highlight Element    ${PASSWORD_INPUT}

    Highlight Element    ${CONTINUE_BUTTON}
    Click Element        ${CONTINUE_BUTTON}
    Sleep    5
    Highlight Element    ${profile_link}
   
 




Close Browser Session
    Close Browser
