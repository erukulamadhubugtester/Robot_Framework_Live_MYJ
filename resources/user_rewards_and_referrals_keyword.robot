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



# 2. Login User rewards_and_referrals Page
Verify Login User rewards_and_referrals Page
    
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
Verify User rewards_and_referrals URL    

  Wait Until Element Is Visible    ${USER_PROFILE_BUTTON}    10s
    Highlight Element    ${USER_PROFILE_BUTTON}

    # Check avatar visibility
    ${avatar_visible}=    Run Keyword And Return Status    Element Should Be Visible    ${USER_AVATAR_IMG}
    Log To Console    📌 User Avatar Displayed: ${avatar_visible}

    # Click profile button
    Click Element    ${USER_PROFILE_BUTTON}
    Log To Console    ✅ User Profile Button Clicked
    Sleep    2s
    Wait Until Element Is Visible    ${rewards_and_referrals_link}    10s
    Highlight Element    ${rewards_and_referrals_link}
    Click Element    ${rewards_and_referrals_link}
    ${current_url}=    Get Location
    Log To Console    \nCurrent URL after clicking VIP: ${current_url}
    Should Be Equal As Strings    ${current_url}    ${rewards_and_referrals_URL}    msg=❌ URL Mismatch! Expected: ${rewards_and_referrals_URL}, Got: ${current_url}
    Log To Console    ✅ URL Matched Successfully!


Verify rewards_and_referrals Title
    Wait Until Element Is Visible    ${rewards_and_referrals_TITLE}    10s
    ${title_text}=    Get Text    ${rewards_and_referrals_TITLE}
    Log To Console    \n📌 rewards_and_referrals  Title: ${title_text}
    Should Be Equal As Strings    ${title_text}   Rewards and Referrals
    Highlight Element    ${rewards_and_referrals_TITLE}


Verify Rewards Points Section
    # 1. Verify gold coin image
    Wait Until Element Is Visible    ${GOLD_COIN_ICON}    10s
    Element Should Be Visible        ${GOLD_COIN_ICON}
    Highlight Element                ${GOLD_COIN_ICON}
    Log To Console    "🟡 Gold coin icon is displayed ✅"

    # 2. Verify Rewards Points title
    Wait Until Element Is Visible    ${REWARDS_TITLE}    10s
    ${title}=    Get Text            ${REWARDS_TITLE}
    Highlight Element                ${REWARDS_TITLE}
    Log To Console    "📌 Title: ${title}"
    Should Be Equal As Strings       ${title}    Rewards Points

    # 3. Verify Balance
    Wait Until Keyword Succeeds    5x    2s    Get Balance Text

    # Press Keys    xpath=//body    PAGE_DOWN


Get Balance Text
    ${balance}=    Get Text    ${BALANCE_TEXT}
    Highlight Element    ${BALANCE_TEXT}
    Log To Console    "💰 Current Balance: ${balance}"

Verify Referral Flow
    [Arguments]    ${title_locator}    ${desc_locator}
    Wait Until Element Is Visible    ${title_locator}    10s
    Highlight Element                ${title_locator}
    ${title}=    Get Text            ${title_locator}
    Log To Console                   "📌 Title: ${title}"

    Wait Until Element Is Visible    ${desc_locator}    10s
    Highlight Element                ${desc_locator}
    ${desc}=    Get Text             ${desc_locator}
    Log To Console                   "📝 Description: ${desc}"



*** Keywords ***
Verify Reward Policy Section
    Wait Until Element Is Visible    ${REWARD_POLICY_TITLE}    10s
    ${title}=    Get Text    ${REWARD_POLICY_TITLE}
    Log To Console    "📌 Reward Policy Title: ${title}"

    ${elements}=    Get WebElements    ${REWARD_POLICY_ITEMS}
    ${count}=    Get Length    ${elements}
    Log To Console    "🔹 Total rules listed: ${count}"

    FOR    ${el}    IN    @{elements}
        ${rule}=    Get Text    ${el}
        Highlight Element    ${el}
        Log To Console    "📌 Rule: ${rule}"
    END


Verify Referral Code Section
    Wait Until Element Is Visible    ${REFERRAL_LABEL}    10s
    ${label}=    Get Text    ${REFERRAL_LABEL}
    Log To Console    "📌 Label: ${label}"

    ${code}=    Get Text    ${REFERRAL_CODE}
    Highlight Element    ${REFERRAL_CODE}
    Log To Console    "🎟️ Referral Code: ${code}"

Verify WhatsApp Icon Visible
    Wait Until Element Is Visible    ${WHATSAPP_ICON}    10s
    Highlight Element    ${WHATSAPP_ICON}
    ${alt}=    Get Element Attribute    ${WHATSAPP_ICON}    alt
    Log To Console    "📌 Social Icon Found: ${alt}"

Verify Facebook Icon Visible
    Wait Until Element Is Visible    ${FACEBOOK_ICON}    10s
    Highlight Element    ${FACEBOOK_ICON}
    ${alt}=    Get Element Attribute    ${FACEBOOK_ICON}    alt
    Log To Console    "📌 Social Icon Found: ${alt}"    

Verify Instagram Icon Visible
    Wait Until Element Is Visible    ${INSTAGRAM_ICON}    10s
    Highlight Element    ${INSTAGRAM_ICON}
    ${alt}=    Get Element Attribute    ${INSTAGRAM_ICON}    alt
    Log To Console    "📌 Social Icon Found: ${alt}"

Verify LinkedIn Icon Visible
    Wait Until Element Is Visible    ${LINKEDIN_ICON}    10s
    Highlight Element    ${LINKEDIN_ICON}
    ${alt}=    Get Element Attribute    ${LINKEDIN_ICON}    alt
    Log To Console    "📌 Social Icon Found: ${alt}"
    Execute JavaScript    window.scrollBy(0,400)
    Sleep    1s
Verify Rewards Redemption History Title
    Wait Until Element Is Visible    ${REDEMPTION_HISTORY_TITLE}    10s
    # Execute Javascript    arguments[0].scrollIntoView(true);    ${REDEMPTION_HISTORY_TITLE}
    Highlight Element    ${REDEMPTION_HISTORY_TITLE}
    ${title}=    Get Text    ${REDEMPTION_HISTORY_TITLE}
    Log To Console    "📌 Page Title Found: ${title}"


     Execute JavaScript    window.scrollBy(0,400)
    Sleep    1s




*** Keywords ***
Calculate Rewards Totals
    [Documentation]    Calculate total rewards points by color classification

     Execute JavaScript    window.scrollBy(0,400)
    Sleep    1s
    ${rows}=    Get WebElements    xpath=//div[contains(@class,'border-b')]
    ${green_total}    Set Variable    0
    ${yellow_total}    Set Variable    0
    ${row_count}=    Get Length    ${rows}
    
    Log To Console    📌 Found ${row_count} reward entries to process
    
    FOR    ${i}    IN RANGE    ${row_count}
        ${i_plus_1}=    Evaluate    ${i} + 1
        ${row_xpath}=    Set Variable    (//div[contains(@class,'border-b')])[${i_plus_1}]
        
        # Get title information
        ${title}=    Get Text    xpath=${row_xpath}//h2
        Log To Console    📌 Title: ${title}
        
        # Get credit date information
        ${credit_elements}=    Get WebElements    xpath=${row_xpath}//h4/span
        ${credit_date}=    Run Keyword If    ${credit_elements}
        ...    Get Text    xpath=${row_xpath}//h4/span
        ...    ELSE    Set Variable    No Date Found
        Log To Console    📌 Credit Info: ${credit_date}
        
        # Get points elements
        ${points_elements}=    Get WebElements    xpath=${row_xpath}//span[contains(@class,'text-end')]//p[contains(text(),'+')]
        
        FOR    ${p}    IN    @{points_elements}
            # Get color class
            ${color}=    Get Element Attribute    ${p}    class
            
            # Get points text and clean it
            ${text}=    Get Text    ${p}
            ${clean_text}=    Replace String    ${text}    +    ${EMPTY}
            ${points}=    Convert To Integer    ${clean_text}
            Log To Console    📌 Points: ${points}, Class: ${color}
            
            # Check if yellow points
            ${is_yellow}=    Run Keyword And Return Status    Should Contain    ${color}    text-yellow-400
            
            # Add to totals using Evaluate
            ${yellow_total}=    Run Keyword If    ${is_yellow}
            ...    Evaluate    int(${yellow_total}) + int(${points})
            ...    ELSE    Set Variable    ${yellow_total}
            
            ${green_total}=    Run Keyword If    not ${is_yellow}
            ...    Evaluate    int(${green_total}) + int(${points})
            ...    ELSE    Set Variable    ${green_total}
            
        END
    END
    
    # Convert to integers to ensure proper math
    ${green_final}=    Convert To Integer    ${green_total}
    ${yellow_final}=    Convert To Integer    ${yellow_total}
    ${grand_total}=    Evaluate    ${green_final} + ${yellow_final}
    
    Log To Console    ✅ Total Green Points: ${green_final}
    Log To Console    ✅ Total Yellow Points: ${yellow_final}
    Log To Console    📊 Grand Total Points: ${grand_total}
    
    [Return]    ${green_final}    ${yellow_final}    ${grand_total}