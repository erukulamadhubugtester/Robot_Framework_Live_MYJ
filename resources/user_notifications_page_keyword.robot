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
Verify Login User Notifications Page
    
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
Verify Notifications   
    # Wait & check if button is visible
    Sleep     3
    Wait Until Element Is Visible    ${NOTIFICATION_BUTTON}    10s
    Highlight Element    ${NOTIFICATION_BUTTON}

    # Check if SVG icon is visible
    ${is_icon}=    Run Keyword And Return Status    Element Should Be Visible    ${NOTIFICATION_ICON}
    Log To Console    ✅ Notification Icon Visible: ${is_icon}

    # Click the button
    Click Element    ${NOTIFICATION_BUTTON}
    Log To Console    🔔 Notification Button Clicked


    #  Wait Until Element Is Visible    ${NOTIFICATION_BUTTON}    20s
    # Click Element    ${NOTIFICATION_BUTTON}
    # Log To Console    🔔 Notification Button Clicked

    Sleep  3
    Wait Until Element Is Visible    ${NOTIFICATION_TITLE}    10s
    Highlight Element    locator=${NOTIFICATION_TITLE}
    ${title_text}=    Get Text    ${NOTIFICATION_TITLE}
    Log To Console    📌 Notification Title Found: ${title_text}
    Should Be Equal As Strings    ${title_text}    Notifications

    ${is_close}=    Run Keyword And Return Status    Element Should Be Visible    ${CLOSE_ICON}
    Log To Console    ❎ Close Icon Visible: ${is_close}
    Highlight Element    ${CLOSE_ICON}


Verify List Notifications

    ${items}=    Get WebElements    ${NOTIFICATION_ITEM}
    ${count}=    Get Length    ${items}
    Log To Console    \n🔔 Total Notifications Found: ${count}

    FOR    ${index}    IN RANGE    ${count}
        ${title}=    Get Text    xpath=(//div[contains(@class,'flex mb-4 p-3 rounded-lg')]//h1)[${index+1}]
        ${time}=     Get Text    xpath=(//div[contains(@class,'flex mb-4 p-3 rounded-lg')]//p)[${index+1}]
        ${logo}=     Run Keyword And Return Status    Element Should Be Visible    xpath=(//div[contains(@class,'flex mb-4 p-3 rounded-lg')]//img[@alt='avatar'])[${index+1}]

        Log To Console    -----------------------------
        Log To Console    🪙 Logo Displayed: ${logo}
        Log To Console    📌 Title: ${title}
        Log To Console    🕒 Time: ${time}

        Highlight Element    xpath=(//div[contains(@class,'flex mb-4 p-3 rounded-lg')])[${index+1}]
        Sleep    1s
    END