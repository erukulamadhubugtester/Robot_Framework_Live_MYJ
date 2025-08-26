*** Settings ***
Library    libraries/HighlightLibrary.py
Library    ../libraries/HighlightLibrary.py

Resource   variables.robot

# Home Page 
*** Keywords  ***
Open Landing Page
    Open Browser    ${BASE_URL}    ${BROWSER}
    Maximize Browser Window
Verify Login Button Is Displayed
    Highlight Element    ${LOGIN_BUTTON}
    Page Should Contain Element    ${LOGIN_BUTTON}
    Element Text Should Be         ${LOGIN_BUTTON}    Login


# Login User Home Page 
*** Keywords ***
Verify Login User Home Page
    Highlight Element    ${LOGIN_LINK}
    Click Element        ${LOGIN_LINK}
    
    # Clear Element Text   ${PHONE_INPUT}
    # Wait Until Element Contains    ${PHONE_INPUT}  ${PHONE_NUMBER}
    Sleep    3
    Input Text           ${PHONE_INPUT}    ${PHONE_NUMBER}
    Highlight Element    ${PHONE_INPUT}
    
    Input Text           ${PASSWORD_INPUT}  ${PASSWORD}
    Highlight Element    ${PASSWORD_INPUT}

    Highlight Element    ${CONTINUE_BUTTON}
    Click Element        ${CONTINUE_BUTTON}
    Sleep     5
    Highlight Element    ${profile}

Close Browser Session
    Close Browser



