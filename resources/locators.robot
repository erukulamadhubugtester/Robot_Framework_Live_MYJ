*** Variables ***
# ${}                    xpath=
# 0.Home page 
${LOGIN_BUTTON}  xpath=//a[@href="/login" and contains(@class,"py-2")]

# ---------------------------------------------------------------------------------------------
# 1. Login and user login  page 

${LOGIN_LINK}        xpath=//a[@href="/login" and contains(@class,"py-2")]
${LOGIN_HEADER}      xpath=//h1[contains(@class,"title-outsidelogin") and text()="Login"]
${PHONE_INPUT}       xpath=//input[@type='tel']
${PHONE_NUMBER}      6303481147
${PASSWORD_INPUT}    id=password
${PASSWORD}          Qwerty@1
${CONTINUE_BUTTON}   xpath=//button[contains(@class,"submit-buttonlogin")]




# ------------------------------------------------------------------------------------------------------
# 2. Dashboard XPaths
${dashboard}                                    xpath=//a[text()='Dashboard']
${dashboard_url}                               https://makeyourjodi.com/home
${home_title_check}                            xpath=//h1[contains(text(), "Meet Your Matrimonial Soulmate")]
${AGE_DROPDOWN}                                xpath=//div[contains(@class,"cursor-pointer") and text()="18 - 27"]
${EDUCATION_INPUT}                             xpath=//div[@class='select__control css-axpaj6-control']
${PROFESSION_INPUT}                            xpath=//input[@placeholder='Enter Profession']
${FIND_BUTTON}                                 xpath=//button[contains(text(), "Find")]

${Profiles_which_match_your_preferences_headline}    xpath=//h2[normalize-space(.)="Profiles which match your preferences"]

${PREFERENCES_TITLE}    xpath=//h2[normalize-space()='Profiles which match your preferences']
${PREFERENCES_GRID}     xpath=//h2[normalize-space()='Profiles which match your preferences']/following::div[contains(@class,'grid')][1]
${PROFILE_CARDS}        xpath=//h2[normalize-space()='Profiles which match your preferences']/following::div[contains(@class,'grid')][1]//div[contains(@class,'transition-transform')]
${NEXT_BUTTON}          xpath=//h2[normalize-space()='Profiles which match your preferences']/following::button[contains(@class,'right-5')][1]


${Promoted_users_headline}  xpath=//h2[normalize-space(.)='Promoted users']
# xpath=//h2[contains(normalize-space(.),'Promoted') and contains(normalize-space(.),'users')]
# xpath=//h2[contains(@class,'font-brock-script') and contains(.,'Promoted')]
# xpath=//h2/span[contains(@class,'text-customPink') and normalize-space(.)='users']










# --------------------------------------------------------------------------------------------------

#  3. profile  xpaths 
${profile_link}      xpath=//a[text()='Profile']

${USER_ID_H2}    xpath=//h2[contains(text(), 'User ID')]

${USER_PROFILE_H3}    xpath=//h3[@class="user-profile-h3"]

${CONTACT_TITLE}    xpath=//span[contains(@class,'user-profile-info-second-box-header')]

${PHONE_NO}         xpath=//span[contains(@class,'Num')]

${EMAIL_ID}         xpath=//span[contains(@class,'mailtext')]


# --------------




#  4. VIP  xpaths 
${VIP_link}      xpath=//a[text()='VIP']
${VIP_URL}       https://makeyourjodi.com/vip

${CHOOSE_PLAN_XPATH}     xpath=//h2[normalize-space(text())="Choose a plan"]

${BASIC_PLAN_IMG}     xpath=//img[@alt="basic"]
${BASIC_POINTS}       xpath=//ul[@class="flex flex-col space-y-2 text-left "]//li/span

${FREE_BUTTON}     xpath=//button[normalize-space(text())="Free"]

${SILVER_PLAN_IMG}    xpath=//img[@alt="silver"]
${SILVER_LOGO_IMG}    xpath=//img[@alt="silver logo"]
${PLAN_POINTS}      xpath=//ul[@class="flex flex-col space-y-2 text-left"]//li/span

${TOTAL_AMOUNT}      xpath=//span[contains(@class,"line-through")]
${DISCOUNT}          xpath=//span[contains(text(),"Off")]
${FINAL_AMOUNT}     xpath= //p[contains(text(),"/month")]

${UPGRADE_BTN}    //button[normalize-space(text())="UPGRADE"]
${ACTIVE_BTN}     //button[normalize-space(text())="ACTIVE"]

${CART_PAGE_TITLE}    //h1[normalize-space(.)="Your Cart"]


${CART_SILVER_LOGO}    //img[@alt="silver-logo"]
${CART_SILVER_TITLE}   //h2[normalize-space(text())="SILVER"]

${FEATURE_TEXT}        //ul[@class='text-black']//p
${FEATURE_LOGO}        //ul[@class='text-black']//div
${MAX_ITEMS}           7

${PAYMENT_FREQUENCY_TITLE}    //h2[text()='Payment Frequency']

${PAYMENT_OPTION_CONTAINER}    //div[contains(@class,'flex items-center space-x-3')]




# -----------------------------------------

#  5. Connections  xpaths 
${Connections_link}      xpath=//a[text()='Connections']









# -----------------
# footer links xpaths 
# 1
${Follow_us_on}  xpath=//h1[normalize-space(.)='Follow us on :']
# LinkedIn
${LinkedIn_link}  xpath=//h1[normalize-space(.)='Follow us on :']/following-sibling::div//a[img[@alt='LinkedIn']]

# Facebook
${Facebook_link}  xpath=//h1[normalize-space(.)='Follow us on :']/following-sibling::div//a[img[@alt='Facebook']]

# Instagram
${Instagram_link}   xpath=//h1[normalize-space(.)='Follow us on :']/following-sibling::div//a[img[@alt='Instagram']]

# Twitter (X)
${Twitte_X___link}   xpath=//h1[normalize-space(.)='Follow us on :']/following-sibling::div//a[img[@alt='X (Twitter)']]

# YouTube
${YouTube_link}  xpath=//h1[normalize-space(.)='Follow us on :']/following-sibling::div//a[img[contains(@alt,'Youtube')]]

# 2
${Quick_links}  xpath=//h1[normalize-space(.)='Quick links']

${QuickLinks_Home}         xpath=//h1[normalize-space(.)='Quick links']/following-sibling::ul//a[@href='/home']
${QuickLinks_Connect}      xpath=//h1[normalize-space(.)='Quick links']/following-sibling::ul//a[@href='/connect']
${QuickLinks_Chat}         xpath=//h1[normalize-space(.)='Quick links']/following-sibling::ul//a[@href='/chat']
${QuickLinks_FAQ}          xpath=(//h1[normalize-space(.)='Quick links']/following-sibling::ul//a[@href='/faq'])[1]
${QuickLinks_Support}      xpath=(//h1[normalize-space(.)='Quick links']/following-sibling::ul//a[@href='/faq'])[2]

${QuickLink_Account_Settings}        xpath=//a[@href='/setting']
${QuickLink_Preference_Settings}     xpath=//a[@href='/preference']
${QuickLink_Referral_Rewards}        xpath=//a[@href='/referral']
${QuickLink_Terms_Conditions}        xpath=//a[@href='/terms-and-conditions']
${QuickLink_Privacy_Policy}          xpath=//a[@href='/privacy-policy']
# 3
${Company}  xpath=//h1[normalize-space(.)='Company']
${Company_AboutUs}         xpath=//h1[normalize-space(.)='Company']/following-sibling::ul//a[@href='/about']
${Company_SupportEmail}    xpath=//h1[normalize-space(.)='Company']/following-sibling::ul//a[starts-with(@href,'mailto:')]
${Company_Matchmaking}     xpath=//h1[normalize-space(.)='Company']/following-sibling::ul//a[@href='/matchmaking']