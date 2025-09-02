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
Verify Login User Connections Page
    
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
Verify Connections URL  
    Wait Until Element Is Visible    ${Connections_link}    10s
    Highlight Element    ${Connections_link}
    Click Element    ${Connections_link}
    ${current_url}=    Get Location
    Log To Console    \nCurrent URL after clicking CONNECTIONS: ${current_url}
    Should Be Equal As Strings    ${current_url}    ${Connections_URL}    msg=❌ URL Mismatch! Expected: ${Connections_URL}, Got: ${current_url}
    Log To Console    ✅ URL Matched Successfully!

  
Verify And Click Connection Tabs

    Sleep    3
  # 1. Highlight Sent tab
    Wait Until Element Is Visible    ${TAB_SENT}    10s
    Highlight Element    ${TAB_SENT}
    ${sent_text}=    Get Text    ${TAB_SENT}
    Log To Console    ✅ Sent Tab Text: ${sent_text}

 # 2. Click & Highlight Received tab
    Wait Until Element Is Visible    ${TAB_RECEIVED}    10s
    Click Element    ${TAB_RECEIVED}
    Highlight Element    ${TAB_RECEIVED}
    ${received_text}=    Get Text    ${TAB_RECEIVED}
    Log To Console    ✅ Received Tab Text: ${received_text}
   
   
    # 3. Click & Highlight Connected tab
    Wait Until Element Is Visible    ${TAB_CONNECTED}    10s
    Click Element    ${TAB_CONNECTED}
    Highlight Element    ${TAB_CONNECTED}
    ${connected_text}=    Get Text    ${TAB_CONNECTED}
    Log To Console    ✅ Connected Tab Text: ${connected_text}


   