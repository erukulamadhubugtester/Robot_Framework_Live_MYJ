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



# 2. Login User recent-visitors Page
Verify Login User help Page
    
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
Verify User help URL    

  Wait Until Element Is Visible    ${USER_PROFILE_BUTTON}    10s
    Highlight Element    ${USER_PROFILE_BUTTON}

    # Check avatar visibility
    ${avatar_visible}=    Run Keyword And Return Status    Element Should Be Visible    ${USER_AVATAR_IMG}
    Log To Console    📌 User Avatar Displayed: ${avatar_visible}

    # Click profile button
    Click Element    ${USER_PROFILE_BUTTON}
    Log To Console    ✅ User Profile Button Clicked
    Sleep    2s
    Wait Until Element Is Visible    ${help_link}    10s
    Highlight Element    ${help_link}
    Click Element    ${help_link}
    ${current_url}=    Get Location
    Log To Console    \nCurrent URL after clicking VIP: ${current_url}
    Should Be Equal As Strings    ${current_url}    ${help_URL}    msg=❌ URL Mismatch! Expected: ${help_URL}, Got: ${current_url}
    Log To Console    ✅ URL Matched Successfully!


Verify Help Centre Title
    Wait Until Element Is Visible    ${HELP_CENTRE_TITLE}    10s
    Highlight Element    ${HELP_CENTRE_TITLE}
    ${title}=    Get Text    ${HELP_CENTRE_TITLE}
    Log To Console    📌 Title Found: ${title}
    Should Be Equal As Strings    ${title}    Help Centre



*** Keywords ***
Verify Help Page Contact Options
    # ✅ Verify "Write an issue" button
    Wait Until Element Is Visible    ${WRITE_ISSUE_BUTTON}    10s
    Highlight Element    ${WRITE_ISSUE_BUTTON}
    ${write_issue}=    Get Text    ${WRITE_ISSUE_TEXT}
    Log To Console    📝 Button Text: ${write_issue}
    Should Be Equal As Strings    ${write_issue}    Write an issue

    # ✅ Verify "Call us now" section
    Wait Until Element Is Visible    ${CALL_US_TITLE}    10s
    Highlight Element    ${CALL_US_TITLE}
    ${call_title}=    Get Text    ${CALL_US_TITLE}
    Log To Console    📞 Section Title: ${call_title}
    Should Be Equal As Strings    ${call_title}    Call us now

    ${phone}=    Get Text    ${CALL_US_NUMBER}
    Log To Console    ☎️ Phone Number: ${phone}

    ${timing}=    Get Text    ${CALL_US_TIMING}
    Log To Console    ⏰ Timing: ${timing}



    Wait Until Element Is Visible    ${USER_PROFILE_BUTTON}    10s
    Highlight Element    ${USER_PROFILE_BUTTON}

    # Check avatar visibility
    ${avatar_visible}=    Run Keyword And Return Status    Element Should Be Visible    ${USER_AVATAR_IMG}
    Log To Console    📌 User Avatar Displayed: ${avatar_visible}

    # Click profile button
    Click Element    ${USER_PROFILE_BUTTON}


    
Logout User
    Wait Until Element Is Visible    ${LOGOUT_LINK}    10s
    Highlight Element    ${LOGOUT_LINK}
    ${text}=    Get Text    ${LOGOUT_LINK}
    Log To Console    🔒 Logout Link Text: ${text}
    Should Be Equal As Strings    ${text}    Logout

    Click Element    ${LOGOUT_LINK}
    Wait Until Location Contains    /login    10s
    Log To Console    ✅ Successfully logged out and redirected to login page


