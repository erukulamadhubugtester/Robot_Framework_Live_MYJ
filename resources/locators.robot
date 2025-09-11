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
# ${PHONE_NUMBER}    7289957376
${PASSWORD_INPUT}    id=password
${PASSWORD}          Qwerty@1
# ${PASSWORD}          Qwerty@8
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
${Connections_URL}       https://makeyourjodi.com/connect

${TAB_SENT}       //li[contains(text(),'Sent')]
${TAB_RECEIVED}   //li[contains(text(),'Received')]
${TAB_CONNECTED}  //li[contains(text(),'Connected')]

# ----------------------------------------------------

# Notifications
${NOTIFICATION_BUTTON}    //button[@type='button' and contains(@class,'text-gray-600')]
${NOTIFICATION_ICON}      //button[@type='button' and contains(@class,'text-gray-600')]//svg

*** Variables ***
${NOTIFICATION_BUTTON}    //button[.//span[text()='View notifications']]
${NOTIFICATION_ICON}      ${NOTIFICATION_BUTTON}//svg
${NOTIFICATION_TITLE}     //h2[contains(text(),'Notifications')]
${CLOSE_ICON}             //button[.//img[@alt='close']]


${NOTIFICATION_ITEM}    //div[contains(@class,'flex mb-4 p-3 rounded-lg')]

# --------------------------------------------------

# user profile 
${USER_PROFILE_BUTTON}    xpath=//button[contains(@class,'relative flex items-center max-w-xs')]
${USER_AVATAR_IMG}        xpath=//button[contains(@class,'relative flex items-center max-w-xs')]//img[@alt='User avatar']


# User Account Settings 
${account_settings_link}      xpath=//a[text()='Account settings']
${account_settings_URL}       https://makeyourjodi.com/setting

${ACCOUNT_SETTINGS_TITLE}    xpath=//div[contains(@class,'font-bold') and contains(text(),'Account settings')]
${PLANS_TITLE}    xpath=//h2[contains(@class,'font-bold') and contains(text(),'Plans')]
${USER_PLAN}      xpath=//h4[contains(text(),'Your Plan')]/following-sibling::p
${EXPIRY_DATE}    xpath=//h4[contains(text(),'Expiry Date')]/following-sibling::p

${UPGRADE_BTN}    xpath=//button[text()='Upgrade']
${CANCEL_BTN}     xpath=//button[text()='Cancel Plan']

${ACCOUNT_ACCESS_TITLE}    xpath=//h2[contains(@class,'text-customPink') and normalize-space(.)='Account access']
${USER_NAME}      xpath=//label[normalize-space(.)='Your Account :']/following-sibling::label
${MOBILE_NUMBER}  xpath=//label[normalize-space(.)='Mobile Number :']/following-sibling::span


${PRIVACY_TITLE}    xpath=//h2[contains(@class,'text-customPink') and normalize-space(.)='Privacy']
# --- Mobile Number ---
${MOBILE_HEADING}      xpath=//label[normalize-space(text())="Mobile Number"]
${MOBILE_INPUT}        xpath=//input[@type="text" and contains(@value,"+91")]
${PRIVACY_DROPDOWN}    xpath=(//label[normalize-space(text())="Mobile Number"]/following::select)[1]

# --- Email ---
${EMAIL_HEADING}     xpath=//label[text()='Email ID']
${EMAIL_INPUT}       xpath=//input[@type="email"]
${EMAIL_DROPDOWN}    xpath=//label[normalize-space(text())="Email ID"]/following::select[1]

# --- DOB ---
${DOB_HEADING}    xpath=//label[text()='Date of Birth']
${DOB_INPUT}      xpath=//label[text()='Date of Birth']/following-sibling::input
${DOB_DROPDOWN}   xpath=//label[text()='Date of Birth']/following-sibling::select


# --- Photo ---
${PHOTO_HEADING}       xpath=//label[normalize-space(text())="Photo Visibility"]
${PHOTO_DROPDOWN}      xpath=(//label[normalize-space(text())="Photo Visibility"]/following::select)[1]

# --- Astro ---
${ASTRO_HEADING}       xpath=//label[normalize-space(text())="Astro Details"]
${ASTRO_DROPDOWN}      xpath=(//label[normalize-space(text())="Astro Details"]/following::select)[1]


${ALERTS_HEADING}    xpath=//h2[text()='Alerts']

# Verify Personalized Profile Section ALERTS_TOGGLE
${PERSONALIZED_HEADING}    xpath=//span[text()='Personalized Profile']
${PERSONALIZED_DESC}       xpath=//span[text()='Personalized Profile']/following-sibling::p
${ALERTS_TOGGLE}           xpath=//input[@type='checkbox' and contains(@class,'peer')]

#  Verify Recent Visitor Section ALERTS_TOGGLE
${RECENT_VISITOR_HEADING}    xpath=//span[text()='Recent Visitor']
${RECENT_VISITOR_DESC}       xpath=//span[text()='Recent Visitor']/following-sibling::p
${RECENT_VISITOR_TOGGLE}    xpath=//span[text()='Recent Visitor']/ancestor::div[@class='flex justify-between items-center mt-7']//input[@type='checkbox']

# Verify Chat Alerts Section ALERTS_TOGGLE
${CHAT_ALERTS_HEADING}    xpath=//span[text()='Chat Alerts']
${CHAT_ALERTS_DESC}       xpath=//span[text()='Chat Alerts']/following-sibling::p
${CHAT_ALERTS_TOGGLE}     xpath=//span[text()='Chat Alerts']/ancestor::div[@class='flex justify-between items-center mt-7']//input[@type='checkbox']


${MESSAGE_HEADING}    xpath=//h2[text()='Message']
${AUTO_MSG_HEADING}    xpath=//p[text()='Automated message on connection']
${AUTO_MSG_DESC}       xpath=//p[text()='A message will be delivered to the person who has accepted your connection request']

${AUTO_MSG_ACCEPT_HEADING}    xpath=//p[text()='Automated message on connection acceptance']
${AUTO_MSG_ACCEPT_DESC}       xpath=//p[text()='A message will be delivered to the person whose request you have accepted']


${AUTO_MSG_REMINDER_HEADING}    xpath=//p[text()='Automated message for reminders']
${AUTO_MSG_REMINDER_DESC}       xpath=//p[text()='A message will be delivered to the person who has not responded to your messages.']


${HIDE_DELETE_HEADING}    xpath=//h2[normalize-space(text())='Hide / Delete Profile']
# ${HIDE_PROFILE_TITLE}       xpath=//span[normalize-space(text())='Hide Profile']
${HIDE_PROFILE_DESC}        xpath=//p[contains(text(),'When you hide profile you will not be visible')]
${HIDE_PROFILE_BUTTON}      xpath=//button[normalize-space(text())='Hide']


${HIDE_DELETE_PROFILE_HEADING}    xpath=//h2[normalize-space(text())='Hide / Delete Profile']
${DELETE_PROFILE_DESC}       xpath=//p[contains(text(),'You will permanently loss all profile information')]
${DELETE_PROFILE_BUTTON}     xpath=//button[normalize-space(text())='Delete']



${LOGOUT_BUTTON}    xpath=//button[normalize-space(text())='Log out']
# -----------------


# User Preference  Settings 
${preference_settings_link}      xpath=//a[text()='Preferences settings']
${preference_settings_URL}       https://makeyourjodi.com/preference

${preference_SETTINGS_TITLE}    xpath=//h2[normalize-space(.)='Preference settings']

${CLEAR_BUTTON}    xpath=//button[normalize-space(text())='Clear']
${SAVE_BUTTON}     xpath=//button[normalize-space(text())='Save']


${HEIGHT_TITLE}      xpath=//label[normalize-space(text())='Height']
${HEIGHT_VALUE}      xpath=//label[normalize-space(text())='Height']/following::div[contains(@class,'border-pink-900')][1]

${AGE_TITLE}      xpath=//label[normalize-space(text())='Age']
${AGE_VALUE}      xpath=//label[normalize-space(text())='Age']/following::div[contains(@class,'border-pink-900')][1]

${MARITAL_TITLE}    xpath=//label[normalize-space(text())='Marital status']
${MARITAL_VALUE}    xpath=//div[@id='marital-status']//div[contains(@class,'singleValue')]

${RELIGION_TITLE}    xpath=//label[normalize-space(.)='Religion']
${RELIGION_INPUT}    xpath=//label[normalize-space(.)='Religion']/following::input[1]

${COMMUNITY_TITLE}    xpath=//label[normalize-space(.)='Community']
${COMMUNITY_INPUT}    xpath=//label[normalize-space(.)='Community']/following::input[1]


${MOTHER_TONGUE_TITLE}    xpath=//label[normalize-space(.)='Mother Tongue']
${MOTHER_TONGUE_INPUT}    xpath=//input[@name='mother-tongue']

${FAMILY_STATUS_LABEL}    xpath=//label[normalize-space(.)='Family Status']
${FAMILY_STATUS_VALUE}    xpath=//div[@id='family-status']//div[contains(@class,'singleValue')]
${FAMILY_STATUS_HIDDEN}   xpath=//input[@name='family-status']


${MANGLIK_LABEL}    xpath=//label[normalize-space(.)='Manglik']
${MANGLIK_INPUT}    xpath=//input[@id='react-select-4-input']
${MANGLIK_VALUE}    xpath=//div[@id='react-select-4-input']/ancestor::div[contains(@class,'control')]//div[contains(@class,'singleValue')]

${KUNDALI_LABEL}     xpath=//label[normalize-space(.)='KundaliDosham']
${KUNDALI_VALUE}     xpath=//div[@id='kundali-dosham']//div[contains(@class,'singleValue')]
${KUNDALI_HIDDEN}    xpath=//input[@name='kundali-dosham']


# ${ORIGIN_COUNTRY_LABEL}    xpath=//label[normalize-space(.)='Origin  Country']
# ${ORIGIN_COUNTRY_INPUT}    xpath=//label[normalize-space(.)='Origin  Country']/following::input[@placeholder='Search Country'][1]
*** Variables ***
${ORIGIN_COUNTRY_LABEL}     xpath=//label[contains(normalize-space(.), 'Origin')]
${ORIGIN_COUNTRY_INPUT}      xpath=//input[@aria-label="Country Input"]


${ORIGIN_STATE_LABEL}    xpath=//label[normalize-space(.)='Origin State']
${ORIGIN_STATE_INPUT}    xpath=//label[normalize-space(.)='Origin State']/following::input[@placeholder='Search State'][1]

${ORIGIN_CITY_LABEL}    xpath=//label[normalize-space(.)='Origin City']
${ORIGIN_CITY_INPUT}    xpath=//label[normalize-space(.)='Origin City']/following::input[@placeholder='Search City'][1]

${CURRENT_STATE_LABEL}    xpath=//label[normalize-space(.)='Current State']
${CURRENT_STATE_INPUT}    xpath=//label[normalize-space(.)='Current State']/following::input[@placeholder='Search State'][1]


${CURRENT_CITY_LABEL}    xpath=//label[normalize-space(.)='Current City']
${CURRENT_CITY_INPUT}    xpath=//label[normalize-space(.)='Current City']/following::input[@placeholder='Search City'][1]


${QUALIFICATION_LABEL}      xpath=//label[normalize-space(.)='Qualification']
${QUALIFICATION_VALUE}      xpath=//div[@id='qualification']//div[contains(@class,'singleValue')]
${QUALIFICATION_INPUT}      xpath=//input[@id='react-select-17-input']
${QUALIFICATION_HIDDEN}     xpath=//input[@name='qualification']


${EMPLOYMENT_TYPE_LABEL}      xpath=//label[normalize-space(.)='Employment Type']
${EMPLOYMENT_TYPE_VALUE}      xpath=//div[@id='employment-type']//div[contains(@class,'singleValue')]
${EMPLOYMENT_TYPE_HIDDEN}     xpath=//input[@name='employment-type']


${JOB_ROLE_LABEL}    xpath=//label[normalize-space(.)='Job Role']
${JOB_ROLE_INPUT}    xpath=//label[normalize-space(.)='Job Role']/following::input[@placeholder='Search for a job role'][1]

*** Variables ***
${ANNUAL_INCOME_LABEL}       xpath=//label[normalize-space(.)='Annual Income']
${ANNUAL_INCOME_PLACEHOLDER}  xpath=//div[@id='annual-income']//div[contains(@id,"placeholder")]
${ANNUAL_INCOME_INPUT}       xpath=//input[@id='react-select-19-input']
${ANNUAL_INCOME_HIDDEN}      xpath=//input[@name='annual-income']

*** Variables ***
${DIET_PREFERENCE_LABEL}     xpath=//label[normalize-space(.)='Diet preferences']
${DIET_PREFERENCE_VALUE}     xpath=//div[@id='diet-preference']//div[contains(@class,'singleValue')]
${DIET_PREFERENCE_HIDDEN}    xpath=//input[@name='diet-preference']


*** Variables ***
${SMOKING_HABIT_LABEL}     xpath=//label[normalize-space(.)='Smoking Habit']
${SMOKING_HABIT_VALUE}     xpath=//div[@id='smoking-habit']//div[contains(@class,'singleValue')]
${SMOKING_HABIT_HIDDEN}    xpath=//input[@name='smoking-habit']


*** Variables ***
${DRINKING_HABIT_LABEL}     xpath=//label[normalize-space(.)='Drinking Habit']
${DRINKING_HABIT_VALUE}     xpath=//div[@id='drinking-habit']//div[contains(@class,'singleValue')]
${DRINKING_HABIT_HIDDEN}    xpath=//input[@name='drinking-habit']

# -----------------


# User recent_profile_visitors
${recent_profile_visitors_link}      xpath=//a[text()='Recent profile visitors']
${recent_profile_visitors_URL}       https://makeyourjodi.com/recent-visitors

${recent_profile_visitors_TITLE}    xpath=//h2[normalize-space(.)='Recent Profile Visitors']


${RECENT_VISITOR_MESSAGE}    xpath=//p[contains(text(),'Upgrade your account to view')]
${UPGRADE_BUTTON}            xpath=//button[contains(.,'Upgrade')]
${VISITOR_PROFILE_CARD}      xpath=//div[contains(@class,'card-grid')]//div[contains(@class,'cart-main-body')]



# -----------------


# User rewards_and_referrals
${rewards_and_referrals_link}      xpath=//a[text()='Rewards and Referrals']
${rewards_and_referrals_URL}       https://makeyourjodi.com/referral

${rewards_and_referrals_TITLE}    xpath=//h1[normalize-space(.)='Rewards and Referrals']


${GOLD_COIN_ICON}      xpath=//img[@alt="gold_coin_icon_404"]
${REWARDS_TITLE}       xpath=//h1[normalize-space(.)='Rewards Points']
${BALANCE_TEXT}    xpath=//h1[contains(normalize-space(.),"Balance")]


${REWARDS_HISTORY_TITLE}    xpath=//h1[contains(text(),'Rewards Redemption History')]
${REWARDS_HISTORY_CARD}     //div[contains(@class,'border-b') and contains(@class,'flex')]
${BALANCE_LABEL}            xpath=//h1[contains(text(),'Balance')]



${FLOW_1_TITLE}        xpath=//h1[normalize-space(.)='Send invitation']
${FLOW_1_DESC}         xpath=//h3[contains(text(),'Send the referral link')]

${FLOW_2_TITLE}        xpath=//h1[normalize-space(.)='Registration']
${FLOW_2_DESC}         xpath=//h3[contains(text(),'Let them register')]

${FLOW_3_TITLE}        xpath=//h1[normalize-space(.)='Get Rewarded!']
${FLOW_3_DESC}         xpath=//h3[contains(text(),'Get rewards for referring')]


${REWARD_POLICY_TITLE}    xpath=//h1[normalize-space()='Reward Policy']
${REWARD_POLICY_LIST}     xpath=//h1[normalize-space()='Reward Policy']/ancestor::div[contains(@class,'conditions-box')]//ol/li

${REWARD_POLICY_ITEMS}    xpath=//h1[normalize-space()='Reward Policy']/following::ol[1]/li


${REFERRAL_LABEL}    xpath=//span[normalize-space()='Your Referral Code']
${REFERRAL_CODE}     xpath=//button//span[contains(@class,'font-semibold') and not(normalize-space()='Your Referral Code')]

${WHATSAPP_ICON}    xpath=//img[@alt='WhatsApp']

${FACEBOOK_ICON}    xpath=//img[@alt='Facebook']

${INSTAGRAM_ICON}    xpath=//img[@alt='Instagram']

${LINKEDIN_ICON}    xpath=//img[@alt='LinkedIn']

${REDEMPTION_HISTORY_TITLE}    xpath=//h1[normalize-space()='Rewards Redemption History']


${REWARDS_ROW}    xpath=//div[contains(@class,'border-b')]


# -----------------


# User help

${help_link}      xpath=//a[text()='Help']
${help_URL}       https://makeyourjodi.com/help

${HELP_CENTRE_TITLE}    xpath=//h1[normalize-space(.)='Help Centre']

${WRITE_ISSUE_BUTTON}    xpath=//button[.//h1[normalize-space(.)='Write an issue']]
${WRITE_ISSUE_TEXT}      xpath=//button//h1[normalize-space(.)='Write an issue']

${CALL_US_TITLE}         xpath=//h1[normalize-space(.)='Call us now']
${CALL_US_NUMBER}        xpath=//h3[contains(text(),'+91')]
${CALL_US_TIMING}        xpath=//h5[contains(text(),'Call us between')]


${LOGOUT_LINK}    xpath=//a[normalize-space(.)='Logout']







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