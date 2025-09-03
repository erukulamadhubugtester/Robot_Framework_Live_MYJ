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
Verify Login User VIP Page
    
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
Verify VIP URL 
    Wait Until Element Is Visible    ${VIP_LINK}    10s
    Highlight Element    ${VIP_LINK}
    Click Element    ${VIP_LINK}
    ${current_url}=    Get Location
    Log To Console    \nCurrent URL after clicking VIP: ${current_url}
    Should Be Equal As Strings    ${current_url}    ${VIP_URL}    msg=❌ URL Mismatch! Expected: ${VIP_URL}, Got: ${current_url}
    Log To Console    ✅ URL Matched Successfully!

    Wait Until Element Is Visible    ${CHOOSE_PLAN_XPATH}    10s
    ${is_visible}=    Run Keyword And Return Status    Element Should Be Visible    ${CHOOSE_PLAN_XPATH}
    Log To Console    \nIs 'Choose a plan' heading visible? ${is_visible}
    ${heading_text}=    Get Text    ${CHOOSE_PLAN_XPATH}
    Log To Console    Exact heading text on page: "${heading_text}"
    Should Be Equal As Strings    ${heading_text}    Choose a plan
Verify Basic Plan 
    Wait Until Element Is Visible    ${BASIC_PLAN_IMG}    10s
    Highlight Element    ${BASIC_PLAN_IMG}
    Log To Console    \n✅ Basic Plan Image is visible

    ${points}=    Get WebElements    ${BASIC_POINTS}
    ${count}=     Get Length    ${points}
    Log To Console    \nTotal Points in Basic Plan: ${count}
    Should Be Equal As Integers    ${count}    5    msg=❌ Expected 5 points, but found ${count}

    FOR    ${el}    IN    @{points}
        Highlight Element    ${el}
        ${text}=    Get Text    ${el}
        Log To Console    Point: "${text}"
    END


    Wait Until Element Is Visible    ${FREE_BUTTON}    10s
    Highlight Element    ${FREE_BUTTON}

    ${is_displayed}=    Run Keyword And Return Status    Element Should Be Visible    ${FREE_BUTTON}
    Log To Console    \nIs 'Free' button displayed? ${is_displayed}

    ${is_enabled}=    Run Keyword And Return Status    Element Should Be Enabled    ${FREE_BUTTON}
    Log To Console    Is 'Free' button enabled? ${is_enabled}

    Should Be Equal As Strings    ${is_enabled}    False    msg=❌ Free button should be disabled but is enabled
    Log To Console    ✅ 'Free' button is displayed and correctly disabled

Verify sliver plan 
     Wait Until Element Is Visible    ${SILVER_PLAN_IMG}    10s
    Highlight Element    ${SILVER_PLAN_IMG}
    ${silver_plan_visible}=    Run Keyword And Return Status    Element Should Be Visible    ${SILVER_PLAN_IMG}
    Log To Console    \nIs Silver Plan image displayed? ${silver_plan_visible}

    Wait Until Element Is Visible    ${SILVER_LOGO_IMG}    10s
    Highlight Element    ${SILVER_LOGO_IMG}
    ${silver_logo_visible}=    Run Keyword And Return Status    Element Should Be Visible    ${SILVER_LOGO_IMG}
    Log To Console    Is Silver Logo displayed? ${silver_logo_visible}

    Should Be Equal As Strings    ${silver_plan_visible}    True    msg=❌ Silver Plan image not visible
    Should Be Equal As Strings    ${silver_logo_visible}    True    msg=❌ Silver Logo not visible

    Log To Console    ✅ Both Silver Plan and Silver Logo are displayed successfully!

     ${points}=    Get WebElements    ${PLAN_POINTS}
    ${count}=     Get Length    ${points}
    Log To Console    \nTotal Silver Plan Points Found: ${count}
    Should Be Equal As Integers    ${count}    7    msg=❌ Expected 7 points, but found ${count}

    FOR    ${el}    IN    @{points}
        Highlight Element    ${el}
        ${text}=    Get Text    ${el}
        Log To Console    Point: "${text}"
    END

     Wait Until Element Is Visible    ${TOTAL_AMOUNT}    10s
    Highlight Element    ${TOTAL_AMOUNT}
    ${total}=    Get Text    ${TOTAL_AMOUNT}
    Log To Console    \nOriginal Price: ${total}
    Should Be Equal As Strings    ${total}    $4.99

    Highlight Element    ${DISCOUNT}
    ${discount}=    Get Text    ${DISCOUNT}
    Log To Console    Discount Shown: ${discount}
    Should Be Equal As Strings    ${discount}    60% Off

    Highlight Element    ${FINAL_AMOUNT}
    ${final}=    Get Text    ${FINAL_AMOUNT}
    Log To Console    Final Price: ${final}
    Should Be Equal As Strings    ${final}    $1.99/month

    Log To Console    ✅ Pricing validation successful!

    #  Wait Until Element Is Visible    ${UPGRADE_BTN}    10s
    # Highlight Element    ${UPGRADE_BTN}
    # ${btn_text}=    Get Text    ${UPGRADE_BTN}
    # Log To Console    \nButton Text: "${btn_text}"
    
    # Element Should Be Visible    ${UPGRADE_BTN}
    # Highlight Element    locator=${UPGRADE_BTN}
    # Should Be Equal As Strings    ${btn_text}    UPGRADE    msg=❌ Button text mismatch!
    # Log To Console    ✅ 'UPGRADE' button is displayed correctly


# ---------- Plan Button Validation ----------
*** Keywords ***

Validate User Plan Button
    ${is_upgrade}=    Run Keyword And Return Status    Page Should Contain Element    ${UPGRADE_BTN}
    ${is_active}=     Run Keyword And Return Status    Page Should Contain Element    ${ACTIVE_BTN}

    IF    ${is_upgrade}
        Validate Upgrade Button
    ELSE IF    ${is_active}
        Validate Active Button
    ELSE
        Fail    ❌ Neither UPGRADE nor ACTIVE button found
    END

Validate Upgrade Button
    Wait Until Element Is Visible    ${UPGRADE_BTN}    10s
    Highlight Element    ${UPGRADE_BTN}
    ${btn_text}=    Get Text    ${UPGRADE_BTN}
    Should Be Equal As Strings    ${btn_text}    UPGRADE    msg=❌ Button text mismatch!
    Log To Console    ✅ 'UPGRADE' button is displayed correctly (User is FREE)

    Click Element    ${UPGRADE_BTN}
    Log To Console    🔄 Upgrade button clicked to continue flow!

    # --- Validate Cart Page Only For UPGRADE ---
    Validate Cart Page
    Validate Cart Features
    Verify Payment Frequency Title

Validate Active Button
    Wait Until Element Is Visible    ${ACTIVE_BTN}    10s
    Highlight Element    ${ACTIVE_BTN}
    ${btn_text}=    Get Text    ${ACTIVE_BTN}
    Should Be Equal As Strings    ${btn_text}    ACTIVE    msg=❌ Button text mismatch!
    Log To Console    ✅ 'ACTIVE' button is displayed correctly (User is VIP)

    ${enabled}=    Run Keyword And Return Status    Element Should Be Enabled    ${ACTIVE_BTN}
    Should Be Equal As Strings    ${enabled}    False    msg=❌ ACTIVE button should be disabled
    Log To Console    🟢 Active button is disabled as expected



Validate Cart Page
    Wait Until Location Contains    /cart/Silver    10s
    ${current_url}=    Get Location
    Log To Console    🌐 Current URL after clicking: ${current_url}
    Should Contain    ${current_url}    /cart/Silver    msg=❌ Cart page URL mismatch!

    Wait Until Element Is Visible    ${CART_SILVER_LOGO}    10s
    Highlight Element    ${CART_SILVER_LOGO}
    Log To Console    ✅ Silver logo image is displayed

    Wait Until Element Is Visible    ${CART_SILVER_TITLE}    10s
    ${cart_title}=    Get Text    ${CART_SILVER_TITLE}
    Should Be Equal As Strings    ${cart_title}    SILVER    msg=❌ Cart title mismatch!
    Highlight Element    ${CART_SILVER_TITLE}
    Log To Console    ✅ Cart title 'SILVER' is displayed correctly

    Log To Console    🛒 Cart page validated successfully with Silver logo & title!





Validate Cart Features
    # Wait for page to fully load
    Log To Console    \n⏳ Waiting for page to load completely...
    Wait Until Page Contains Element    //ul[@class='text-black']    timeout=10s
    Wait Until Page Contains Element    ${FEATURE_TEXT}    timeout=10s
    Sleep    2s    # Additional wait for any dynamic content
    
    # Get count of items
    ${items}=    Get WebElements    //ul[@class='text-black']/li
    ${count}=    Get Length         ${items}
    Log To Console    \n🔍 Total features found: ${count}
    
    # Validate we don't exceed maximum expected items
    Should Be True    ${count} <= ${MAX_ITEMS}    Too many items found: ${count}, expected max: ${MAX_ITEMS}

    FOR    ${index}    IN RANGE    1    ${count + 1}
        # Use 1-based indexing for XPath with your defined locators
        ${li_locator}=    Set Variable    xpath=(//ul[@class='text-black']/li)[${index}]
        ${text_locator}=    Set Variable    xpath=(//ul[@class='text-black']/li)[${index}]/p
        ${logo_locator}=    Set Variable    xpath=(//ul[@class='text-black']/li)[${index}]/div

        # Wait for current item to be visible before processing
        Wait Until Element Is Visible    ${li_locator}    timeout=5s

        # Get text safely - handle case where p element might not exist
        ${text_exists}=    Run Keyword And Return Status    Element Should Be Visible    ${text_locator}
        ${text}=    Run Keyword If    ${text_exists}    Get Text    ${text_locator}
        ${text}=    Set Variable If    not ${text_exists}    [No text found]    ${text}
        
        # Check if logo element exists and is displayed
        ${logo_displayed}=    Run Keyword And Return Status    Element Should Be Visible    ${logo_locator}

        # Log results with better formatting
        Log To Console    ${\n}==============================
        Log To Console    🔍 Processing Item ${index} of ${count}
        Log To Console    📝 Text: "${text}"
        Log To Console    ${SPACE * 4}✅ Logo displayed: ${logo_displayed}

        # Highlight li element with blue border
        Execute JavaScript    
        ...    var element = document.evaluate("(//ul[@class='text-black']/li)[${index}]", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue;
        ...    if(element) { element.style.border='3px solid blue'; element.style.backgroundColor='rgba(0,0,255,0.1)'; }

        # Highlight logo if it exists with red border
        IF    ${logo_displayed}
            Execute JavaScript    
            ...    var logo = document.evaluate("(//ul[@class='text-black']/li)[${index}]/div", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue;
            ...    if(logo) { logo.style.border='3px solid red'; logo.style.backgroundColor='rgba(255,0,0,0.1)'; }
            Log To Console    ${SPACE * 4}🎨 Logo highlighted in red
        ELSE
            Log To Console    ${SPACE * 4}❌ No logo found for this item
        END

        # Wait to see highlighting
        Log To Console    ${SPACE * 4}⏸️ Pausing for 2 seconds...
        Sleep    2s
        
        # Remove highlighting
        Execute JavaScript    
        ...    var element = document.evaluate("(//ul[@class='text-black']/li)[${index}]", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue;
        ...    if(element) { element.style.border=''; element.style.backgroundColor=''; }

        IF    ${logo_displayed}
            Execute JavaScript    
            ...    var logo = document.evaluate("(//ul[@class='text-black']/li)[${index}]/div", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue;
            ...    if(logo) { logo.style.border=''; logo.style.backgroundColor=''; }
        END
        
        Log To Console    ${SPACE * 4}✨ Highlighting removed
    END
    
    Log To Console    ${\n}🎉 Cart validation completed successfully!



Verify Payment Frequency Title
    Wait Until Element Is Visible    ${PAYMENT_FREQUENCY_TITLE}    10s
    ${is_visible}=    Run Keyword And Return Status    Element Should Be Visible    ${PAYMENT_FREQUENCY_TITLE}
    Log To Console    \nIs 'Payment Frequency' heading visible? ${is_visible}

    ${title_text}=    Get Text    ${PAYMENT_FREQUENCY_TITLE}
    Log To Console    Exact heading text: "${title_text}"

    Should Be Equal As Strings    ${title_text}    Payment Frequency    msg=❌ Heading text mismatch!
    Highlight Element    ${PAYMENT_FREQUENCY_TITLE}



   