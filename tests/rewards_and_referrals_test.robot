*** Settings ***
Resource    ../resources/user_rewards_and_referrals_keyword.robot

Suite Teardown    Close Browser Session

*** Test Cases ***
Verify Login User rewards_and_referrals Page
    Open Landing Page
    Verify Login User rewards_and_referrals Page
    Verify User rewards_and_referrals URL
    Verify rewards_and_referrals Title
    Verify Rewards Points Section

    # Verify all referral flows
    Verify Referral Flow    ${FLOW_1_TITLE}    ${FLOW_1_DESC}
    Verify Referral Flow    ${FLOW_2_TITLE}    ${FLOW_2_DESC}
    Verify Referral Flow    ${FLOW_3_TITLE}    ${FLOW_3_DESC}
    Verify Reward Policy Section
    Verify Referral Code Section
    Verify WhatsApp Icon Visible
    Verify Facebook Icon Visible
    Verify Instagram Icon Visible 
    Verify LinkedIn Icon Visible
    Verify Rewards Redemption History Title
    Calculate Rewards Totals


















