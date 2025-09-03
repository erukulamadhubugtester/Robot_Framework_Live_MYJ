*** Settings ***
Library    SeleniumLibrary
Library    ../libraries/HighlightLibrary.py
Library    DebugLibrary
Library    Collections
Library    String
Resource   ../resources/locators.robot
Resource   variables.robot


*** Keywords ***
Close Browser Session
    Close Browser
# 0. Home Page
Open Landing Page
    Open Browser    ${BASE_URL}    ${BROWSER}
    Maximize Browser Window



# 2. Login User VIP Page
Verify Login User Account Settings Page
    
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
Verify User Account Settings URL 

  Wait Until Element Is Visible    ${USER_PROFILE_BUTTON}    10s
    Highlight Element    ${USER_PROFILE_BUTTON}

    # Check avatar visibility
    ${avatar_visible}=    Run Keyword And Return Status    Element Should Be Visible    ${USER_AVATAR_IMG}
    Log To Console    📌 User Avatar Displayed: ${avatar_visible}

    # Click profile button
    Click Element    ${USER_PROFILE_BUTTON}
    Log To Console    ✅ User Profile Button Clicked
    Sleep    2s
    Wait Until Element Is Visible    ${account_settings_link}    10s
    Highlight Element    ${account_settings_link}
    Click Element    ${account_settings_link}
    ${current_url}=    Get Location
    Log To Console    \nCurrent URL after clicking VIP: ${current_url}
    Should Be Equal As Strings    ${current_url}    ${account_settings_URL}    msg=❌ URL Mismatch! Expected: ${account_settings_URL}, Got: ${current_url}
    Log To Console    ✅ URL Matched Successfully!
